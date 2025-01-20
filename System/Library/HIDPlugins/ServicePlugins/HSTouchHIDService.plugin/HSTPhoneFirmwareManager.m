@interface HSTPhoneFirmwareManager
+ (BOOL)_haveToWake:(unsigned __int16)a3;
- (BOOL)_readAODLogging;
- (BOOL)inCallPowerOff;
- (HSTPhoneFirmwareManager)initWithDevice:(__MTDevice *)a3;
- (void)_handleGetPropertyEvent:(id)a3;
- (void)_handleSetPropertyEvent:(id)a3;
- (void)_restoreFirmwareState;
- (void)_setAODLogging;
- (void)_setEnabledInputsReport;
- (void)_writeAODLogging:(id)a3;
- (void)setInCallPowerOff:(BOOL)a3;
@end

@implementation HSTPhoneFirmwareManager

- (void)_handleSetPropertyEvent:(id)a3
{
  v4 = (char *)a3;
  v12.receiver = self;
  v12.super_class = (Class)HSTPhoneFirmwareManager;
  [(HSTFirmwareManager *)&v12 _handleSetPropertyEvent:v4];
  v5 = v4 + 16;
  int v6 = v4[39];
  if (v6 < 0)
  {
    if (*((void *)v4 + 3) != 10) {
      goto LABEL_15;
    }
    v5 = *(char **)v5;
  }
  else if (v6 != 10)
  {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)v5;
  int v8 = *((unsigned __int16 *)v5 + 4);
  if (v7 == 0x6967676F4C444F41 && v8 == 26478)
  {
    id v10 = *((id *)v4 + 5);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    [(HSTPhoneFirmwareManager *)self _writeAODLogging:v11];
    [(HSTPhoneFirmwareManager *)self _setAODLogging];
  }
LABEL_15:
}

- (HSTPhoneFirmwareManager)initWithDevice:(__MTDevice *)a3
{
  if (!a3)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HSTFirmwareManager.mm", 728, @"Invalid parameter not satisfying: %@", @"device" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)HSTPhoneFirmwareManager;
  v5 = [(HSTFirmwareManager *)&v10 initWithDevice:a3];
  if (v5)
  {
    *((unsigned char *)&v5->super.super._state + 14) = getIntProperty(a3, @"InCallPowerOff") != 0;
    int v6 = v5;
  }

  return v5;
}

+ (BOOL)_haveToWake:(unsigned __int16)a3
{
  return (a3 & 0x3F0) != 0;
}

- (void)_setEnabledInputsReport
{
  p_state = &self->super.super._state;
  uint64_t touchMode = self->super.super._state.touchMode;
  if ((touchMode & 0x1000) != 0) {
    uint64_t touchMode = touchMode | [(id)objc_opt_class() _haveToWake:touchMode];
  }
  if ((touchMode & 5) == 4)
  {
    if (*((unsigned char *)&self->super.super._state + 14))
    {
      id deviceObj = self->super.super._deviceObj;
      if ((touchMode & 5) == 4) {
        __int16 v6 = 687;
      }
      else {
        __int16 v6 = (((touchMode >> 2) & 1) << 8) | 0xAF;
      }
      __int16 v9 = v6;
      setReport<HSTPipeline::FirmwareInterface::FeatureReport::FaceDetectionMode>((uint64_t)deviceObj);
    }
  }
  else if ((touchMode & 1) != 0 || (p_state->prevTouchMode & 5) != 4)
  {
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::FaceDetectionMode>((uint64_t)self->super.super._deviceObj);
    [(HSTiOSFirmwareManager *)self setPowerState:touchMode];
    createEnabledInputsReport(touchMode, p_state->screenOrientation);
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::EnabledInputs::Awake>((uint64_t)self->super.super._deviceObj);
  }
  else
  {
    uint64_t v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_411C8, v7, OS_LOG_TYPE_DEFAULT, "Filtering screen off glitch after call", buf, 2u);
    }
  }
}

- (void)_restoreFirmwareState
{
  v3.receiver = self;
  v3.super_class = (Class)HSTPhoneFirmwareManager;
  [(HSTFirmwareManager *)&v3 _restoreFirmwareState];
  [(HSTPhoneFirmwareManager *)self _setAODLogging];
}

- (void)_writeAODLogging:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  CFStringRef v8 = @"AODLogging";
  id v9 = v3;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  __int16 v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v4 setObject:v5 forKey:v7];
}

- (BOOL)_readAODLogging
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 dictionaryForKey:v4];

  id v6 = [v5 objectForKeyedSubscript:@"AODLogging"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7) {
    unsigned __int8 v8 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (void)_handleGetPropertyEvent:(id)a3
{
  v4 = (char *)a3;
  v12.receiver = self;
  v12.super_class = (Class)HSTPhoneFirmwareManager;
  [(HSTFirmwareManager *)&v12 _handleGetPropertyEvent:v4];
  v5 = v4 + 16;
  int v6 = v4[39];
  if (v6 < 0)
  {
    if (*((void *)v4 + 3) != 10) {
      goto LABEL_12;
    }
    v5 = *(char **)v5;
  }
  else if (v6 != 10)
  {
    goto LABEL_12;
  }
  uint64_t v7 = *(void *)v5;
  int v8 = *((unsigned __int16 *)v5 + 4);
  if (v7 == 0x6967676F4C444F41 && v8 == 26478)
  {
    uint64_t v10 = +[NSNumber numberWithBool:[(HSTPhoneFirmwareManager *)self _readAODLogging]];
    id v11 = (void *)*((void *)v4 + 5);
    *((void *)v4 + 5) = v10;
  }
LABEL_12:
}

- (void)_setAODLogging
{
  if (MGGetBoolAnswer())
  {
    id IntProperty = getIntProperty((__MTDevice *)self->super.super._deviceObj, @"AODLoggingReportID");
    if (IntProperty)
    {
      unsigned __int8 v4 = IntProperty;
      unsigned int v5 = [(HSTPhoneFirmwareManager *)self _readAODLogging];
      int v6 = MTLoggingPlugin();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v14 = v4;
        __int16 v15 = 1024;
        unsigned int v16 = v5;
        _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "Setting AOD logging report 0x%x: %u", buf, 0xEu);
      }

      if (!self->super.super._deviceObj)
      {
        id v9 = +[NSAssertionHandler currentHandler];
        uint64_t v10 = +[NSString stringWithUTF8String:"void setReport(MTDeviceRef, const T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::OneByteReport]"];
        [v9 handleFailureInFunction:v10, @"HSTFirmwareManager.mm", 200, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];

        id v11 = +[NSAssertionHandler currentHandler];
        objc_super v12 = +[NSString stringWithUTF8String:"IOReturn HSTPipeline::FirmwareUtil::SetReport(MTDeviceRef _Nonnull, const T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::OneByteReport]"];
        [v11 handleFailureInFunction:v12, @"FirmwareUtil.h", 9, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
      }
      mach_error_t v7 = MTDeviceSetReport();
      if (v7)
      {
        int v8 = MTLoggingPlugin();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          mach_error_string(v7);
          setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostNotificationControl>();
        }
      }
    }
  }
}

- (BOOL)inCallPowerOff
{
  return *((unsigned char *)&self->super.super._state + 14);
}

- (void)setInCallPowerOff:(BOOL)a3
{
  *((unsigned char *)&self->super.super._state + 14) = a3;
}

@end