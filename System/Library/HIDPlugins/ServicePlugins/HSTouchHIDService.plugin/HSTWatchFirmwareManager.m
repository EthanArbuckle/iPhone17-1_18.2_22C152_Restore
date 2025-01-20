@interface HSTWatchFirmwareManager
- (BOOL)decodeFromMap:(void *)a3;
- (id).cxx_construct;
- (void)_handleGetWaterStateEvent:(id)a3;
- (void)_handleSetPropertyEvent:(id)a3;
- (void)_handleWristStateEvent:(id)a3;
- (void)_restoreFirmwareState;
- (void)encodeToMap:(void *)a3;
- (void)handleConsume:(id)a3;
@end

@implementation HSTWatchFirmwareManager

- (void)_handleWristStateEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 wristState];
  unsigned int v6 = v5;
  if (*((unsigned __int8 *)&self->super._state + 14) != v5)
  {
    *((unsigned char *)&self->super._state + 14) = v5;
    v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "Unknown";
      if (v6 == 1) {
        v8 = "Off";
      }
      if (v6 == 2) {
        v8 = "On";
      }
      *(_DWORD *)buf = 136446210;
      v15 = v8;
      _os_log_impl(&def_411C8, v7, OS_LOG_TYPE_DEFAULT, "Setting wrist state: %{public}s", buf, 0xCu);
    }

    id deviceObj = self->super._deviceObj;
    int v10 = *((unsigned __int8 *)&self->super._state + 14);
    if (v10 == 1) {
      __int16 v11 = 11;
    }
    else {
      __int16 v11 = 10;
    }
    if (v10 == 2) {
      __int16 v12 = 12;
    }
    else {
      __int16 v12 = v11;
    }
    *(_WORD *)buf = (v12 << 8) | 0x70;
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostEvent>((uint64_t)deviceObj);
  }
  v13.receiver = self;
  v13.super_class = (Class)HSTWatchFirmwareManager;
  [(HSTFirmwareManager *)&v13 handleConsume:v4];
}

- (void)_handleGetWaterStateEvent:(id)a3
{
  id v4 = a3;
  if (!self->super._deviceObj)
  {
    v7 = +[NSAssertionHandler currentHandler];
    v8 = +[NSString stringWithUTF8String:"IOReturn getReport(MTDeviceRef, T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::WaterState]"];
    [v7 handleFailureInFunction:v8, @"HSTFirmwareManager.mm", 212, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];

    v9 = +[NSAssertionHandler currentHandler];
    int v10 = +[NSString stringWithUTF8String:"IOReturn HSTPipeline::FirmwareUtil::GetReport(MTDeviceRef _Nonnull, T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::WaterState]"];
    [v9 handleFailureInFunction:v10, @"FirmwareUtil.h", 17, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  mach_error_t Report = MTDeviceGetReport();
  if (!Report) {
    mach_error_t Report = -536870169;
  }
  unsigned int v6 = MTLoggingPlugin();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    mach_error_string(Report);
    -[HSTFirmwareManager _handleGetDebugEvent:]();
  }
}

- (void)_restoreFirmwareState
{
  v3.receiver = self;
  v3.super_class = (Class)HSTWatchFirmwareManager;
  [(HSTFirmwareManager *)&v3 _restoreFirmwareState];
  setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostEvent>((uint64_t)self->super._deviceObj);
}

- (void)_handleSetPropertyEvent:(id)a3
{
  id v4 = (id *)a3;
  unsigned int v5 = v4;
  unsigned int v6 = (char *)(v4 + 2);
  int v7 = *((char *)v4 + 39);
  if (v7 < 0)
  {
    if (v4[3] != &dword_1C) {
      goto LABEL_16;
    }
    unsigned int v6 = *(char **)v6;
  }
  else if (v7 != 28)
  {
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)v6;
  uint64_t v9 = *((void *)v6 + 1);
  uint64_t v10 = *((void *)v6 + 2);
  int v11 = *((_DWORD *)v6 + 6);
  if (v8 == 0x69746E6F43444948 && v9 == 0x63655273756F756ELL && v10 == 0x6E45676E6964726FLL && v11 == 1701601889)
  {
    id v15 = v4[5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v15) {
        goto LABEL_17;
      }
      id deviceObj = self->super._deviceObj;
      unsigned int v17 = [v15 BOOLValue];
      uint64_t v18 = 0x170001025362;
      if (v17) {
        uint64_t v18 = 0x100170001025362;
      }
      uint64_t v26 = v18;
      if (!deviceObj)
      {
        v21 = +[NSAssertionHandler currentHandler];
        v22 = +[NSString stringWithUTF8String:"void setReport(MTDeviceRef, const T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::ContinuousRecordingEnableWatch]"];
        [v21 handleFailureInFunction:v22, @"HSTFirmwareManager.mm", 200, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];

        v23 = +[NSAssertionHandler currentHandler];
        v24 = +[NSString stringWithUTF8String:"IOReturn HSTPipeline::FirmwareUtil::SetReport(MTDeviceRef _Nonnull, const T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::ContinuousRecordingEnableWatch]"];
        [v23 handleFailureInFunction:v24, @"FirmwareUtil.h", 9, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
      }
      mach_error_t v19 = MTDeviceSetReport();
      if (v19)
      {
        v20 = MTLoggingPlugin();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          mach_error_string(v19);
          setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostNotificationControl>();
        }
      }
    }

    goto LABEL_17;
  }
LABEL_16:
  v25.receiver = self;
  v25.super_class = (Class)HSTWatchFirmwareManager;
  [(HSTFirmwareManager *)&v25 _handleSetPropertyEvent:v4];
LABEL_17:
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    [(HSTWatchFirmwareManager *)self _handleWristStateEvent:v4];
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      [(HSTWatchFirmwareManager *)self _handleGetWaterStateEvent:v6];
    }
    else
    {
      id v8 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        [(HSTWatchFirmwareManager *)self _handleSetPropertyEvent:v8];
      }
      else
      {
        v10.receiver = self;
        v10.super_class = (Class)HSTWatchFirmwareManager;
        [(HSTFirmwareManager *)&v10 handleConsume:v8];
      }
    }
  }
}

- (void)encodeToMap:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSTWatchFirmwareManager;
  -[HSTFirmwareManager encodeToMap:](&v5, "encodeToMap:");
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)114,(char)105,(char)115,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, *((unsigned __int8 *)&self->super._state + 14));
}

- (BOOL)decodeFromMap:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HSTWatchFirmwareManager;
  if (!-[HSTFirmwareManager decodeFromMap:](&v6, "decodeFromMap:"))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTWatchFirmwareManager decodeFromMap:]();
    }
    return 0;
  }
  *((unsigned char *)&self->super._state + 14) = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)114,(char)105,(char)115,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTWatchFirmwareManager decodeFromMap:]();
    }
    return 0;
  }
  return 1;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 142) = 0;
  return self;
}

- (void)decodeFromMap:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end