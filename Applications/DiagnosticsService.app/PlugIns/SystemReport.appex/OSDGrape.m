@interface OSDGrape
- (BOOL)_enableProx:(BOOL)a3;
- (BOOL)_getMTReport:(unsigned __int8)a3 payloadBuffer:(char *)a4 bufferSize:(unsigned int *)a5;
- (BOOL)_grapeCriticalErrorDetected:(id)a3;
- (BOOL)_isProxEnabled;
- (BOOL)_refreshGrapeProperties;
- (BOOL)_registerForProx:(void *)a3;
- (BOOL)_setMTReport:(unsigned __int8)a3 payloadBuffer:(char *)a4 bufferSize:(unsigned int)a5;
- (BOOL)_setOrbImageFrameType:(int)a3;
- (BOOL)_unregisterForProx:(void *)a3;
- (BOOL)didDopplerErrorOccur;
- (BOOL)isDoppler;
- (BOOL)isGrapePowered;
- (BOOL)proxErrorDetected;
- (BOOL)scheduleSystemWake:(unsigned int)a3;
- (BOOL)setOrbImageCapacitanceMode;
- (BOOL)setOrbImageGapMode;
- (OSDGrape)init;
- (__MTDevice)_createMTDevice:(unsigned int)a3;
- (id)_getMTReportErrorFromCommandBuffer:(char *)a3 length:(int)a4;
- (id)bcdVersion;
- (id)constructedFirmwareVersion;
- (id)criticalErrorSet:(unint64_t *)a3;
- (id)getDopplerDataRegister;
- (id)getDopplerError;
- (id)getDopplerSiliconVersion;
- (id)orbChipID;
- (id)orbErrorDetected;
- (int64_t)resetCount;
- (unsigned)getDopplerReferenceSignalEvents;
- (unsigned)multitouchFirmwareVersion;
- (void)cleanupStreaming:(void *)a3;
- (void)dealloc;
- (void)resetGrape;
- (void)startStreaming:(void *)a3;
@end

@implementation OSDGrape

- (__MTDevice)_createMTDevice:(unsigned int)a3
{
  uint64_t Default = MTDeviceCreateDefault();
  if (!Default)
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12[0]) = 0;
      v8 = "Could not create default MTDevice.";
      v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_9;
    }
LABEL_6:

    return 0;
  }
  v4 = (__MTDevice *)Default;
  int v5 = MTDeviceStart();
  if (v5)
  {
    int v6 = v5;
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v6;
      v8 = "Unable to start MTDevice with code: %d";
      v9 = v7;
      uint32_t v10 = 8;
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v12, v10);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  return v4;
}

- (OSDGrape)init
{
  v7.receiver = self;
  v7.super_class = (Class)OSDGrape;
  v2 = [(OSDGrape *)&v7 init];
  v3 = v2;
  if (v2 && (v4 = [(OSDGrape *)v2 _createMTDevice:268435457], (v3->_grapeDevice = v4) == 0)) {
    int v5 = 0;
  }
  else {
    int v5 = v3;
  }

  return v5;
}

- (void)dealloc
{
  if (self->_grapeDevice) {
    MTDeviceRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)OSDGrape;
  [(OSDGrape *)&v3 dealloc];
}

- (BOOL)_refreshGrapeProperties
{
  kern_return_t v4;
  NSObject *v5;
  NSString *v6;
  NSString *constructedFirmwareVersion;
  NSString *v8;
  NSString *bcdVersion;
  void *v10;
  uint8_t v12[8];
  CFMutableDictionaryRef properties;

  properties = 0;
  io_registry_entry_t Service = MTDeviceGetService();
  v4 = IORegistryEntryCreateCFProperties(Service, &properties, 0, 0);
  if (v4)
  {
    int v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateCFProperties failure for AppleMultitouchSPI.", v12, 2u);
    }
  }
  else
  {
    int v5 = properties;
    int v6 = [(__CFDictionary *)properties objectForKeyedSubscript:@"Constructed Firmware Version"];
    constructedFirmwareVersion = self->_constructedFirmwareVersion;
    self->_constructedFirmwareVersion = v6;

    v8 = [v5 objectForKeyedSubscript:@"bcdVersion"];
    bcdVersion = self->_bcdVersion;
    self->_bcdVersion = v8;

    uint32_t v10 = [v5 objectForKeyedSubscript:@"ResetCount"];
    self->_resetCount = (int64_t)[v10 integerValue];
  }
  return v4 == 0;
}

- (unsigned)multitouchFirmwareVersion
{
  return 0;
}

- (id)constructedFirmwareVersion
{
  [(OSDGrape *)self _refreshGrapeProperties];
  constructedFirmwareVersion = self->_constructedFirmwareVersion;

  return constructedFirmwareVersion;
}

- (id)bcdVersion
{
  [(OSDGrape *)self _refreshGrapeProperties];
  bcdVersion = self->_bcdVersion;

  return bcdVersion;
}

- (int64_t)resetCount
{
  return self->_resetCount;
}

- (id)orbChipID
{
  int v5 = 128;
  uint64_t v6 = 176480;
  [(OSDGrape *)self _setMTReport:44 payloadBuffer:&v6 bufferSize:8];
  if ([(OSDGrape *)self _getMTReport:45 payloadBuffer:v7 bufferSize:&v5])
  {
    objc_super v3 = +[NSData dataWithBytes:v7 length:2];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (BOOL)_grapeCriticalErrorDetected:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v14 = 0;
  int v5 = [(OSDGrape *)self criticalErrorSet:&v14];
  uint64_t v6 = v5;
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100020480;
    v10[3] = &unk_100084998;
    id v11 = v5;
    v12 = &v15;
    [v4 enumerateObjectsUsingBlock:v10];

    BOOL v7 = *((unsigned char *)v16 + 24) != 0;
  }
  else
  {
    v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to read critical errors. Please check grape is powered on", buf, 2u);
    }

    BOOL v7 = 1;
    *((unsigned char *)v16 + 24) = 1;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)orbErrorDetected
{
  uint64_t v4 = 0;
  v2 = [(OSDGrape *)self criticalErrorSet:&v4];

  return v2;
}

- (BOOL)proxErrorDetected
{
  id v3 = objc_alloc((Class)NSSet);
  CFStringRef v7 = @"Prox critical error.";
  uint64_t v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v5 = [v3 initWithArray:v4];

  LOBYTE(self) = [(OSDGrape *)self _grapeCriticalErrorDetected:v5];
  return (char)self;
}

- (BOOL)_getMTReport:(unsigned __int8)a3 payloadBuffer:(char *)a4 bufferSize:(unsigned int *)a5
{
  if (!a5) {
    return 0;
  }
  int Report = MTDeviceGetReport();
  if (Report)
  {
    int v6 = Report;
    CFStringRef v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109376;
      v9[1] = v6;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to get MT report with code: %d (0x%x)", (uint8_t *)v9, 0xEu);
    }

    return 0;
  }
  return 1;
}

- (BOOL)_setMTReport:(unsigned __int8)a3 payloadBuffer:(char *)a4 bufferSize:(unsigned int)a5
{
  int v5 = MTDeviceSetReport();
  if (v5)
  {
    int v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109376;
      v8[1] = v5;
      __int16 v9 = 1024;
      int v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to set MT report with code: %d (0x%x)", (uint8_t *)v8, 0xEu);
    }
  }
  return v5 == 0;
}

- (id)criticalErrorSet:(unint64_t *)a3
{
  int v5 = +[NSMutableSet set];
  int v15 = 4;
  unsigned int v16 = 0;
  if (![(OSDGrape *)self _getMTReport:127 payloadBuffer:&v16 bufferSize:&v15])
  {
    CFStringRef v7 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      id v9 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    int v10 = "getMTReport failed";
LABEL_16:
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    goto LABEL_11;
  }
  if (v15 != 4)
  {
    CFStringRef v7 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    int v10 = "Unexpected number of bytes returned from MTReport";
    goto LABEL_16;
  }
  if (a3) {
    *a3 = v16;
  }
  int v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processing \"0x%x\" for grape critical errors.", buf, 8u);
  }

  v17[0] = @"EEPROM baseline invalid.";
  v17[1] = @"EEPROM calibration checksum error.";
  v18[0] = &off_1000B7078;
  v18[1] = &off_1000B7090;
  v17[2] = @"EEPROM calibration invalid.";
  v17[3] = @"EEPROM header invalid.";
  v18[2] = &off_1000B70A8;
  v18[3] = &off_1000B70C0;
  v17[4] = @"Host refclk not detected.";
  v17[5] = @"Unknown Error";
  v18[4] = &off_1000B70D8;
  v18[5] = &off_1000B70F0;
  v17[6] = @"EEPROM version unsupported.";
  v17[7] = @"ZEPHYR revert defaults.";
  v18[6] = &off_1000B7108;
  v18[7] = &off_1000B7120;
  v17[8] = @"Orb offset calibration missing.";
  v17[9] = @"Orb offset calibration checksum error.";
  v18[8] = &off_1000B7138;
  v18[9] = &off_1000B7150;
  v17[10] = @"Orb force calibration missing.";
  v17[11] = @"Orb force calibration checksum error.";
  v18[10] = &off_1000B7168;
  v18[11] = &off_1000B7180;
  v17[12] = @"Orb critical error.";
  v17[13] = @"Prox critical error.";
  v18[12] = &off_1000B7198;
  v18[13] = &off_1000B71B0;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _DWORD v12[2] = sub_100020AC8;
  v12[3] = &unk_1000849C0;
  unsigned int v14 = v16;
  id v8 = v5;
  id v13 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
  id v9 = v8;

LABEL_12:

  return v9;
}

- (BOOL)scheduleSystemWake:(unsigned int)a3
{
  char v4 = 64;
  __int16 v5 = 1000 * a3;
  return [(OSDGrape *)self _setMTReport:244 payloadBuffer:&v4 bufferSize:3];
}

- (BOOL)isGrapePowered
{
  return 0;
}

- (void)resetGrape
{
  int v2 = MTDevicePowerSetEnabled();
  if (v2)
  {
    int v3 = v2;
    char v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      int v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Power off : %u", (uint8_t *)&v8, 8u);
    }
  }
  int v5 = MTDevicePowerSetEnabled();
  if (v5)
  {
    int v6 = v5;
    CFStringRef v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      int v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Power on : %u", (uint8_t *)&v8, 8u);
    }
  }
}

- (void)startStreaming:(void *)a3
{
  int v5 = [(OSDGrape *)self _createMTDevice:0];
  self->_grapeDevice = v5;
  if (v5)
  {
    if (![(OSDGrape *)self _enableProx:1])
    {
      int v6 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Enabling prox failed", buf, 2u);
      }
    }
    if (![(OSDGrape *)self _registerForProx:a3])
    {
      CFStringRef v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v8 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Registering for prox failed", v8, 2u);
      }
    }
    MTDeviceSetInputDetectionMode();
    sleep(1u);
    MTDeviceSetZephyrParameter();
  }
}

- (void)cleanupStreaming:(void *)a3
{
  MTDeviceSetZephyrParameter();
  [(OSDGrape *)self _unregisterForProx:a3];
  [(OSDGrape *)self _enableProx:0];
  int v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    int v9 = MTDevicePowerSetEnabled();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Power off status: %u", (uint8_t *)&v8, 8u);
  }

  int v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = MTDevicePowerSetEnabled();
    int v8 = 67109120;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Power on status: %u", (uint8_t *)&v8, 8u);
  }
}

- (BOOL)_isProxEnabled
{
  MTDeviceGetReport();
  int v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v6 = 0;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Reading Prox enabled status %u bytes value is %d", buf, 0xEu);
  }

  return v4 != 0;
}

- (BOOL)_enableProx:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && [(OSDGrape *)self _isProxEnabled]) {
    return 1;
  }
  int v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling prox: %d", buf, 8u);
  }

  if (MTDeviceSetReport()) {
    return 0;
  }
  BOOL v4 = 1;
  sleep(1u);
  return v4;
}

- (BOOL)_registerForProx:(void *)a3
{
  return _MTRegisterImageCallback(self->_grapeDevice, a3, 2147483646, 2);
}

- (BOOL)_unregisterForProx:(void *)a3
{
  return _MTUnregisterImageCallback(self->_grapeDevice, a3);
}

- (BOOL)isDoppler
{
  MTDeviceGetVersion();
  int v2 = +[NSString stringWithFormat:@"%x", 0];
  BOOL v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, " FW version %@", buf, 0xCu);
  }

  unsigned __int8 v4 = [v2 containsString:@"d"];
  return v4;
}

- (BOOL)didDopplerErrorOccur
{
  int Report = MTDeviceGetReport();
  BOOL v3 = Report == 0;
  if (Report)
  {
    unsigned __int8 v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = 127;
      int v5 = "Unable to get MTReport 0x%x";
      int v6 = v4;
      uint32_t v7 = 8;
LABEL_8:
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ((v11 & 8) != 0)
  {
    unsigned __int8 v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v5 = "Doppler error detected";
      int v6 = v4;
      uint32_t v7 = 2;
      goto LABEL_8;
    }
LABEL_9:

    return v3;
  }
  return 0;
}

- (id)getDopplerError
{
  uint64_t v11 = 0x94000001C1582CLL;
  char v12 = 0;
  uint64_t v9 = 0x80020001C1582CLL;
  char v10 = 0;
  BOOL v3 = [(OSDGrape *)self getDopplerSiliconVersion];
  if ([v3 isEqualToString:@"A0"])
  {
    unsigned __int8 v4 = &v11;
LABEL_5:
    int v5 = [(OSDGrape *)self _getMTReportErrorFromCommandBuffer:v4 length:8];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"TC"])
  {
    unsigned __int8 v4 = &v9;
    goto LABEL_5;
  }
  int v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Invalid doppler silicon rev", v8, 2u);
  }

  int v5 = 0;
LABEL_9:

  return v5;
}

- (id)getDopplerDataRegister
{
  if (MTDeviceGetReport())
  {
    int v2 = 0;
  }
  else
  {
    int v2 = +[NSData dataWithBytes:v4 length:0];
  }

  return v2;
}

- (id)_getMTReportErrorFromCommandBuffer:(char *)a3 length:(int)a4
{
  if (MTDeviceSetReport())
  {
    int v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = *a3;
      v14[0] = 67109120;
      v14[1] = v6;
      uint32_t v7 = "Unable to set MTReport 0x%x";
      BOOL v8 = (uint8_t *)v14;
LABEL_14:
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v7, v8, 8u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  if (MTDeviceGetReport())
  {
    int v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = *a3;
      *(_DWORD *)buf = 67109120;
      int v13 = v11;
      uint32_t v7 = "Unable to get MTReport 0x%x";
      BOOL v8 = buf;
      goto LABEL_14;
    }
LABEL_6:

    goto LABEL_7;
  }
  char v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MTReportGet read 0 bytes", buf, 2u);
  }

LABEL_7:

  return 0;
}

- (id)getDopplerSiliconVersion
{
  uint64_t v10 = 0x1000001C1582CLL;
  char v11 = 0;
  if (MTDeviceSetReport())
  {
    int v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v10;
      BOOL v3 = "Unable to set MTReport 0x%x";
      unsigned __int8 v4 = (uint8_t *)v12;
LABEL_7:
      int v5 = v2;
      uint32_t v6 = 8;
LABEL_8:
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v3, v4, v6);
    }
  }
  else
  {
    if (!MTDeviceGetReport())
    {
      int v2 = DiagnosticLogHandleForCategory();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      BOOL v3 = "MTReportGet read 0 bytes";
      unsigned __int8 v4 = buf;
      int v5 = v2;
      uint32_t v6 = 2;
      goto LABEL_8;
    }
    int v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = 45;
      BOOL v3 = "Unable to get MTReport 0x%x";
      unsigned __int8 v4 = buf;
      goto LABEL_7;
    }
  }
LABEL_11:

  return 0;
}

- (unsigned)getDopplerReferenceSignalEvents
{
  int v2 = [(OSDGrape *)self getDopplerDataRegister];
  if ((unint64_t)[v2 length] > 0x20)
  {
    unsigned int v4 = *((_DWORD *)[v2 bytes] + 7);
  }
  else
  {
    BOOL v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint32_t v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Doppler Data Dump Register invalid length", v6, 2u);
    }

    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)_setOrbImageFrameType:(int)a3
{
  return MTDeviceSetReport() == 0;
}

- (BOOL)setOrbImageGapMode
{
  return [(OSDGrape *)self _setOrbImageFrameType:165];
}

- (BOOL)setOrbImageCapacitanceMode
{
  return [(OSDGrape *)self _setOrbImageFrameType:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bcdVersion, 0);

  objc_storeStrong((id *)&self->_constructedFirmwareVersion, 0);
}

@end