@interface ComponentDisplay
- (BOOL)deviceSupportsTopModuleAuth;
- (BOOL)isPresent;
- (BOOL)isTrusted;
- (BOOL)isTrustedForUI;
- (BOOL)topModuleAuthPassed;
- (BOOL)zoomed;
- (NSDictionary)topModuleAuthDict;
- (id)authError;
- (id)factoryDataSizeForRegion:(int)a3;
- (id)getAppleTopModuleAuthClass;
- (id)getTopModuleAuthDict;
- (id)parseBIMData:(id)a3;
- (id)readFactoryDataForRegion:(int)a3;
- (id)refreshRate;
- (id)retrieveBIMData;
- (id)serialNumber;
- (id)topModuleAccessoryCertificate;
- (id)topModuleFdrValidationStatus;
- (id)topModuleIDSN;
- (int)getDeviceCoverGlassCoating;
- (void)populateAttributes:(id)a3;
- (void)setTopModuleAuthDict:(id)a3;
@end

@implementation ComponentDisplay

- (BOOL)isPresent
{
  v2 = [(ComponentDisplay *)self serialNumber];
  v3 = v2;
  if (!v2)
  {
    v5 = IOServiceNameMatching("IODPDevice");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
    if (MatchingService)
    {
      IOObjectRelease(MatchingService);
    }
    else
    {
      int v12 = 0;
      if (FindDevicesWithProp("IOService:name", "lcd", (uint64_t)v13, 40, &v12) || !v12)
      {
        int v11 = 0;
        if (FindDevicesWithProp("IOService:name", "edp", (uint64_t)v13, 40, &v11)) {
          BOOL v8 = 1;
        }
        else {
          BOOL v8 = v11 == 0;
        }
        BOOL v4 = !v8;
        if (v8)
        {
          v9 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v10 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "LCD NOT found.", v10, 2u);
          }
        }
        goto LABEL_8;
      }
    }
    BOOL v4 = 1;
LABEL_8:

    goto LABEL_9;
  }
  BOOL v4 = [v2 length] != 0;
LABEL_9:

  return v4;
}

- (BOOL)zoomed
{
  v2 = (void *)MGCopyAnswer();
  v3 = [v2 objectForKeyedSubscript:@"default"];
  BOOL v4 = [v2 objectForKeyedSubscript:@"zoomed"];
  if ([v3 count] != (id)4) {
    goto LABEL_5;
  }
  if ([v4 count] != (id)4) {
    goto LABEL_5;
  }
  v5 = [v4 objectAtIndexedSubscript:0];
  [v5 floatValue];
  double v7 = v6;

  BOOL v8 = 1;
  v9 = [v4 objectAtIndexedSubscript:1];
  [v9 floatValue];
  double v11 = v10;

  int v12 = [v4 objectAtIndexedSubscript:2];
  [v12 floatValue];
  float v14 = v13;

  v15 = [v4 objectAtIndexedSubscript:3];
  [v15 floatValue];
  float v17 = v16;

  v18 = +[UIScreen mainScreen];
  v19 = [v18 displayConfiguration];

  v20 = [v19 deviceName];
  IOMobileFramebufferOpenByName();

  IOMobileFramebufferGetCanvasSizes();
  if (MEMORY[0xFFFFFFFF0] != v7 * v11 || MEMORY[0xFFFFFFFF8] != v14 * v17) {
LABEL_5:
  }
    BOOL v8 = 0;

  return v8;
}

- (void)populateAttributes:(id)a3
{
  id v19 = a3;
  BOOL v4 = +[NSNumber numberWithBool:[(ComponentDisplay *)self zoomed]];
  [v19 setObject:v4 forKeyedSubscript:@"isZoomed"];

  v5 = [(ComponentDisplay *)self serialNumber];
  float v6 = v5;
  if (v5 && [v5 length]) {
    [v19 setObject:v6 forKeyedSubscript:@"serialNumber"];
  }
  double v7 = [(ComponentDisplay *)self refreshRate];
  [v19 setObject:v7 forKeyedSubscript:@"refreshRate"];

  BOOL v8 = [(ComponentDisplay *)self retrieveBIMData];
  if (v8) {
    [v19 setObject:v8 forKeyedSubscript:@"BIM"];
  }
  v9 = [(ComponentDisplay *)self getTopModuleAuthDict];
  [(ComponentDisplay *)self setTopModuleAuthDict:v9];

  float v10 = +[NSNumber numberWithBool:[(ComponentDisplay *)self deviceSupportsTopModuleAuth]];
  [v19 setObject:v10 forKeyedSubscript:@"deviceSupportsTopModuleAuth"];

  double v11 = +[NSNumber numberWithBool:[(ComponentDisplay *)self topModuleAuthPassed]];
  [v19 setObject:v11 forKeyedSubscript:@"authPassed"];

  int v12 = [(ComponentDisplay *)self authError];
  [v19 setObject:v12 forKeyedSubscript:@"authErrorCode"];

  float v13 = +[NSNumber numberWithBool:[(ComponentDisplay *)self isTrusted]];
  [v19 setObject:v13 forKeyedSubscript:@"isTrusted"];

  float v14 = +[NSNumber numberWithBool:[(ComponentDisplay *)self isTrustedForUI]];
  [v19 setObject:v14 forKeyedSubscript:@"isTrustedForUI"];

  v15 = [(ComponentDisplay *)self topModuleFdrValidationStatus];
  [v19 setObject:v15 forKeyedSubscript:@"fdrValidationStatus"];

  float v16 = [(ComponentDisplay *)self topModuleAccessoryCertificate];
  [v19 setObject:v16 forKeyedSubscript:@"accessoryCertificate"];

  float v17 = [(ComponentDisplay *)self topModuleIDSN];
  [v19 setObject:v17 forKeyedSubscript:@"chipId"];

  v18 = +[NSNumber numberWithInt:[(ComponentDisplay *)self getDeviceCoverGlassCoating]];
  [v19 setObject:v18 forKeyedSubscript:@"deviceCoverGlassCoating"];
}

- (id)serialNumber
{
  v2 = (void *)MGCopyAnswer();
  if (v2) {
    id v3 = [objc_alloc((Class)NSString) initWithData:v2 encoding:1];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (int)getDeviceCoverGlassCoating
{
  return _MGGetSInt32Answer(@"DeviceCoverGlassCoating", 0);
}

- (id)retrieveBIMData
{
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  io_object_t eepromService;
  void *v16;
  void *v17;
  void v19[2];
  void v20[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t vars8;

  CFDictionaryRef v3 = IOServiceMatching("AppleEmbeddedTouchEEPROMDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  self->_eepromService = MatchingService;
  if (MatchingService)
  {
    p_driverConnect = &self->_driverConnect;
    float v6 = IOServiceOpen(MatchingService, mach_task_self_, 0, &self->_driverConnect);
    if (v6)
    {
      double v7 = v6;
      BOOL v8 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to create the driver connect with error %X", buf, 8u);
      }

      IOObjectRelease(self->_eepromService);
      v9 = 0;
      self->_eepromService = 0;
    }
    else
    {
      double v11 = [(ComponentDisplay *)self readFactoryDataForRegion:0];
      if (v11)
      {
        int v12 = [(ComponentDisplay *)self parseBIMData:v11];
      }
      else
      {
        int v12 = 0;
      }
      float v13 = [(ComponentDisplay *)self readFactoryDataForRegion:1];
      if (v13)
      {
        float v14 = [(ComponentDisplay *)self parseBIMData:v13];
      }
      else
      {
        float v14 = 0;
      }
      if (*p_driverConnect)
      {
        IOServiceClose(*p_driverConnect);
        unsigned int *p_driverConnect = 0;
      }
      eepromService = self->_eepromService;
      if (eepromService)
      {
        IOObjectRelease(eepromService);
        self->_eepromService = 0;
      }
      if (v12 | v14)
      {
        v19[0] = @"BIM1";
        float v16 = dictionaryOrNull((void *)v12);
        v19[1] = @"BIM2";
        v20[0] = v16;
        float v17 = dictionaryOrNull((void *)v14);
        v20[1] = v17;
        v9 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      }
      else
      {
        v9 = 0;
      }
    }
  }
  else
  {
    float v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "AppleEmbeddedTouchEEPROMDriver";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to create the %s service", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)readFactoryDataForRegion:(int)a3
{
  kern_return_t v10;
  kern_return_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t input;
  uint64_t vars8;

  v5 = -[ComponentDisplay factoryDataSizeForRegion:](self, "factoryDataSizeForRegion:");
  float v6 = v5;
  if (!v5)
  {
LABEL_9:
    float v13 = 0;
    goto LABEL_12;
  }
  input = a3;
  id v7 = [v5 unsignedLongValue];
  id v19 = v7;
  outputStruct = malloc_type_malloc((size_t)v7, 0xA4E9776FuLL);
  if (!outputStruct)
  {
    float v14 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to malloc %zu bytes", buf, 0xCu);
    }

    goto LABEL_9;
  }
  v9 = outputStruct;
  float v10 = IOConnectCallMethod(self->_driverConnect, 1u, &input, 1u, 0, 0, 0, 0, outputStruct, (size_t *)&v19);
  if (v10)
  {
    double v11 = v10;
    int v12 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v11;
    float v16 = "IOConnectCallMethod() to read data failed with 0x%08x";
    float v17 = v12;
    v18 = 8;
LABEL_18:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_5;
  }
  float v13 = +[NSData dataWithBytes:v9 length:v19];
  if (v13) {
    goto LABEL_11;
  }
  int v12 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    float v16 = "Unable to create NSData from EEPROM read outBuffer";
    float v17 = v12;
    v18 = 2;
    goto LABEL_18;
  }
LABEL_5:

  float v13 = 0;
LABEL_11:
  free(v9);
LABEL_12:

  return v13;
}

- (id)factoryDataSizeForRegion:(int)a3
{
  kern_return_t v3;
  kern_return_t v4;
  NSObject *v5;
  void *v6;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint32_t outputCnt;
  uint8_t buf[4];
  kern_return_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t output;
  uint64_t input;
  uint64_t vars8;

  output = 0;
  input = a3;
  outputCnt = 1;
  CFDictionaryRef v3 = IOConnectCallMethod(self->_driverConnect, 2u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (v3)
  {
    BOOL v4 = v3;
    v5 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      float v6 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 67109376;
    float v13 = v4;
    float v14 = 2048;
    v15 = output;
    BOOL v8 = "IOConnectCallMethod() failed for get size with 0x%08x. size returned is %llu \n";
    v9 = v5;
    float v10 = 18;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_3;
  }
  if (!output)
  {
    v5 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_WORD *)buf = 0;
    BOOL v8 = "The returned regions size was 0. This device likely has TouchEEPROM FACTORY_DATA misconfigured.";
    v9 = v5;
    float v10 = 2;
    goto LABEL_12;
  }
  float v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
LABEL_6:

  return v6;
}

- (id)parseBIMData:(id)a3
{
  if (a3)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    [a3 getBytes:&v23 length:32];
    if (v23 == 255 || *(void *)((char *)&v23 + 2) == -1)
    {
      BOOL v4 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Invalid BIM data retrieved. This unit likely has not run long enough to have dumped BIM data to the EEPROM.", buf, 2u);
      }
      float v13 = 0;
    }
    else
    {
      v28[0] = @"version";
      BOOL v4 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:");
      v29[0] = v4;
      v28[1] = @"header";
      v21 = +[NSNumber numberWithUnsignedChar:BYTE1(v23)];
      v29[1] = v21;
      v28[2] = @"timestamp";
      v20 = +[NSNumber numberWithUnsignedLongLong:*(void *)((char *)&v23 + 2)];
      v29[2] = v20;
      v28[3] = @"scoreMin";
      id v19 = +[NSNumber numberWithUnsignedShort:WORD5(v23)];
      v27[0] = v19;
      v18 = +[NSNumber numberWithUnsignedShort:WORD6(v23)];
      v27[1] = v18;
      float v17 = +[NSNumber numberWithUnsignedShort:HIWORD(v23)];
      v27[2] = v17;
      float v16 = +[NSArray arrayWithObjects:v27 count:3];
      v29[3] = v16;
      v28[4] = @"scoreMed";
      v15 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)v24];
      v26[0] = v15;
      v5 = +[NSNumber numberWithUnsignedShort:WORD1(v24)];
      v26[1] = v5;
      float v6 = +[NSNumber numberWithUnsignedShort:WORD2(v24)];
      v26[2] = v6;
      id v7 = +[NSArray arrayWithObjects:v26 count:3];
      v29[4] = v7;
      v28[5] = @"scoreMax";
      BOOL v8 = +[NSNumber numberWithUnsignedShort:WORD3(v24)];
      v25[0] = v8;
      v9 = +[NSNumber numberWithUnsignedShort:WORD4(v24)];
      v25[1] = v9;
      float v10 = +[NSNumber numberWithUnsignedShort:WORD5(v24)];
      v25[2] = v10;
      double v11 = +[NSArray arrayWithObjects:v25 count:3];
      v29[5] = v11;
      v28[6] = @"crc";
      int v12 = +[NSNumber numberWithUnsignedInt:HIDWORD(v24)];
      v29[6] = v12;
      float v13 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:7];
    }
  }
  else
  {
    float v13 = 0;
  }

  return v13;
}

- (id)getAppleTopModuleAuthClass
{
  if (+[DAComponentUtil IORegistryNameExists:@"AppleAuthCPAID" optionalKey:0 passingValidator:&stru_100084D20])
  {
    return @"AppleAuthCPAID";
  }
  else
  {
    return @"AppleAuthCPRelay";
  }
}

- (id)getTopModuleAuthDict
{
  id v19 = 0;
  int v2 = sub_1000024E4((__CFArray **)&v19);
  if (v2)
  {
    int v3 = v2;
    BOOL v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to fetch Internal Component Auth Status:%d", buf, 8u);
    }
    id v5 = 0;
  }
  else
  {
    BOOL v4 = v19;
    id v5 = [v19 copy];
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = [v11 objectForKey:@"ComponentName"];
        if ([v12 isEqualToString:@"TouchController"])
        {
          id v13 = v11;

          goto LABEL_16;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)deviceSupportsTopModuleAuth
{
  int v2 = [(ComponentDisplay *)self topModuleAuthDict];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)topModuleAuthPassed
{
  int v2 = [(ComponentDisplay *)self topModuleAuthDict];
  BOOL v3 = [v2 objectForKey:@"AuthPassed"];

  if (v3) {
    unsigned __int8 v4 = [v3 isEqualToNumber:&__kCFBooleanTrue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)authError
{
  int v2 = [(ComponentDisplay *)self getAppleTopModuleAuthClass];
  BOOL v3 = +[DAComponentUtil getIORegistryClass:v2 property:@"authError" optionalKey:0 classValidator:&stru_100084D20];

  if (v3) {
    uint64_t v4 = *(unsigned int *)[v3 bytes];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = +[NSNumber numberWithInt:v4];

  return v5;
}

- (id)topModuleFdrValidationStatus
{
  int v2 = [(ComponentDisplay *)self getAppleTopModuleAuthClass];
  BOOL v3 = +[DAComponentUtil getIORegistryClass:v2 property:@"FdrValidationStatus" optionalKey:0 classValidator:&stru_100084D20];

  if (v3) {
    id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  }
  else {
    id v4 = 0;
  }
  id v5 = stringOrNull(v4);

  return v5;
}

- (BOOL)isTrusted
{
  int v2 = [(ComponentDisplay *)self topModuleAuthDict];
  BOOL v3 = [v2 objectForKey:@"isTrusted"];

  if (v3) {
    unsigned __int8 v4 = [v3 isEqualToNumber:&__kCFBooleanTrue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isTrustedForUI
{
  int v2 = [(ComponentDisplay *)self topModuleAuthDict];
  BOOL v3 = [v2 objectForKey:@"isTrustedForUI"];

  if (v3) {
    unsigned __int8 v4 = [v3 isEqualToNumber:&__kCFBooleanTrue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)topModuleAccessoryCertificate
{
  int v2 = [(ComponentDisplay *)self getAppleTopModuleAuthClass];
  BOOL v3 = +[DAComponentUtil getIORegistryName:v2 property:@"AccessoryCertificate" optionalKey:0 classValidator:&stru_100084D20];

  if (v3)
  {
    unsigned __int8 v4 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  id v5 = stringOrNull(v4);

  return v5;
}

- (id)topModuleIDSN
{
  int v2 = [(ComponentDisplay *)self getAppleTopModuleAuthClass];
  BOOL v3 = +[DAComponentUtil getIORegistryClass:v2 property:@"IDSN" optionalKey:0 classValidator:&stru_100084D20];

  if (v3)
  {
    unsigned __int8 v4 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  id v5 = stringOrNull(v4);

  return v5;
}

- (id)refreshRate
{
  int v2 = +[CADisplay mainDisplay];
  [v2 refreshRate];
  double v4 = v3;

  if (v4 == 0.0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSNumber numberWithDouble:1.0 / v4];
  }
  id v6 = numberOrNull(v5);

  return v6;
}

- (NSDictionary)topModuleAuthDict
{
  return self->_topModuleAuthDict;
}

- (void)setTopModuleAuthDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end