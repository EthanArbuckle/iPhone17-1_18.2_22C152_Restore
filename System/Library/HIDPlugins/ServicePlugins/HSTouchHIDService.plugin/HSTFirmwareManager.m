@interface HSTFirmwareManager
- (BOOL)_isSleeping;
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (HSTFirmwareManager)initWithDevice:(__MTDevice *)a3;
- (id).cxx_construct;
- (id)preferenceValueForKey:(id)a3;
- (id)preferences;
- (void)_handleDriverEvent:(id)a3;
- (void)_handleExternalMessageEvent:(id)a3;
- (void)_handleGetDebugEvent:(id)a3;
- (void)_handleHSTFrame:(id)a3;
- (void)_handleProxClearedAfterOccludedWakeEvent:(id)a3;
- (void)_handleResetEvent:(id)a3;
- (void)_handleScreenOrientationEvent:(id)a3;
- (void)_handleSetReportEvent:(id)a3;
- (void)_handleStockholmStateEvent:(id)a3;
- (void)_handleStuckTouchDetectorStateEvent:(id)a3;
- (void)_handleTouchModeEvent:(id)a3;
- (void)_handleUSBChargingStateEvent:(id)a3;
- (void)_handleWirelessChargingStateEvent:(id)a3;
- (void)_restoreFirmwareState;
- (void)_setEnabledInputsReport;
- (void)encodeToMap:(void *)a3;
- (void)handleConsume:(id)a3;
- (void)setPreferenceValue:(id)a3 forKey:(id)a4;
@end

@implementation HSTFirmwareManager

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
    [(HSTFirmwareManager *)self _handleTouchModeEvent:v4];
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
      [(HSTFirmwareManager *)self _handleScreenOrientationEvent:v6];
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
        [(HSTFirmwareManager *)self _handleStockholmStateEvent:v8];
      }
      else
      {
        id v10 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }

        if (v11)
        {
          [(HSTFirmwareManager *)self _handleWirelessChargingStateEvent:v10];
        }
        else
        {
          v12 = HSUtil::DynamicCast<HSTProxClearedAfterOccludedWakeEvent>(v10);

          if (v12)
          {
            [(HSTFirmwareManager *)self _handleProxClearedAfterOccludedWakeEvent:v10];
          }
          else
          {
            v13 = HSUtil::DynamicCast<HSTUSBChargingStateEvent>(v10);

            if (v13)
            {
              [(HSTFirmwareManager *)self _handleUSBChargingStateEvent:v10];
            }
            else
            {
              v14 = HSUtil::DynamicCast<HSTStuckTouchDetectorStateEvent>(v10);

              if (v14)
              {
                [(HSTFirmwareManager *)self _handleStuckTouchDetectorStateEvent:v10];
              }
              else
              {
                v15 = HSUtil::DynamicCast<HSTResetEvent>(v10);

                if (v15)
                {
                  [(HSTFirmwareManager *)self _handleResetEvent:v10];
                }
                else
                {
                  v16 = HSUtil::DynamicCast<HSTNotificationEvent>(v10);

                  if (v16)
                  {
                    [(HSTFirmwareManager *)self _handleDriverEvent:v10];
                  }
                  else
                  {
                    v17 = HSUtil::DynamicCast<HSTSetReportEvent>(v10);

                    if (v17)
                    {
                      [(HSTFirmwareManager *)self _handleSetReportEvent:v10];
                    }
                    else
                    {
                      v18 = HSUtil::DynamicCast<HSTGetDebugStateEvent>(v10);

                      if (v18)
                      {
                        [(HSTFirmwareManager *)self _handleGetDebugEvent:v10];
                      }
                      else
                      {
                        v19 = HSUtil::DynamicCast<HSTSetPropertyEvent>(v10);

                        if (v19)
                        {
                          [(HSTFirmwareManager *)self _handleSetPropertyEvent:v10];
                        }
                        else
                        {
                          v20 = HSUtil::DynamicCast<HSTGetPropertyEvent>(v10);

                          if (v20)
                          {
                            [(HSTFirmwareManager *)self _handleGetPropertyEvent:v10];
                          }
                          else
                          {
                            v21 = HSUtil::DynamicCast<HSTExternalMessageEvent>(v10);

                            if (v21)
                            {
                              [(HSTFirmwareManager *)self _handleExternalMessageEvent:v10];
                            }
                            else
                            {
                              v24.receiver = self;
                              v24.super_class = (Class)HSTFirmwareManager;
                              [(HSStage *)&v24 handleConsume:v10];
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (self->_state.filteredClients)
  {
    id v22 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    [(HSTFirmwareManager *)self _handleHSTFrame:v23];
  }
}

- (void)_handleStockholmStateEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 stockholmState];
  if (self->_state.stockholmState != v5)
  {
    self->_state.int stockholmState = v5;
    id v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = "Inactive";
      if (self->_state.stockholmState == 1) {
        id v7 = "Active";
      }
      if (self->_state.stockholmState) {
        id v8 = v7;
      }
      else {
        id v8 = "Unknown";
      }
      *(_DWORD *)buf = 136446210;
      v15 = v8;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "Setting stockholm state: %{public}s", buf, 0xCu);
    }

    id deviceObj = self->_deviceObj;
    int stockholmState = self->_state.stockholmState;
    if (stockholmState == 1) {
      __int16 v11 = 5;
    }
    else {
      __int16 v11 = 7;
    }
    if (stockholmState == 2) {
      __int16 v12 = 6;
    }
    else {
      __int16 v12 = v11;
    }
    *(_WORD *)buf = (v12 << 8) | 0x70;
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostEvent>((uint64_t)deviceObj);
  }
  v13.receiver = self;
  v13.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v13 handleConsume:v4];
}

- (HSTFirmwareManager)initWithDevice:(__MTDevice *)a3
{
  if (!a3)
  {
    objc_super v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HSTFirmwareManager.mm", 260, @"Invalid parameter not satisfying: %@", @"device" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)HSTFirmwareManager;
  unsigned int v5 = [(HSStage *)&v15 init];
  if (v5)
  {
    id v6 = (void *)CFRetain(a3);
    id deviceObj = v5->_deviceObj;
    v5->_id deviceObj = v6;

    v14[0] = (id)0xAAAAAAAAAAAAAAAALL;
    v14[1] = (id)0xAAAAAAAAAAAAAAAALL;
    HSUtil::ObjectLock::ObjectLock((uint64_t)v14, v5);
    io_registry_entry_t Service = MTDeviceGetService();
    CFProperty = (void *)IORegistryEntryCreateCFProperty(Service, @"MaintainPowerInUILock", 0, 0);
    v5->_state.poweredWhenScreenOff = CFProperty != 0;

    id v10 = v5;
    HSUtil::ObjectLock::~ObjectLock(v14);
  }

  return v5;
}

- (void)_handleTouchModeEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 touchMode];
  int touchMode = self->_state.touchMode;
  if (touchMode != v5)
  {
    self->_state.prevTouchMode = touchMode;
    self->_state.int touchMode = v5;
    id v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = self->_state.touchMode;
      *(_DWORD *)buf = 67109120;
      int v11 = v8;
      _os_log_impl(&def_411C8, v7, OS_LOG_TYPE_DEFAULT, "Setting touch mode: 0x%x", buf, 8u);
    }

    [(HSTFirmwareManager *)self _setEnabledInputsReport];
  }
  v9.receiver = self;
  v9.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v9 handleConsume:v4];
}

- (void)_handleScreenOrientationEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 screenOrientation];
  if (self->_state.screenOrientation != v5)
  {
    self->_state.screenOrientation = v5;
    id deviceObj = self->_deviceObj;
    char v8 = -99;
    char v9 = v5;
    memset(v10, 0, sizeof(v10));
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostNotificationControl>((uint64_t)deviceObj);
    [(HSTFirmwareManager *)self _setEnabledInputsReport];
  }
  v7.receiver = self;
  v7.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v7 handleConsume:v4];
}

- (void)_handleWirelessChargingStateEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 wirelessChargingState];
  if (self->_state.wirelessChargingState != v5)
  {
    self->_state.wirelessChargingState = v5;
    id v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_state.wirelessChargingState == 1) {
        objc_super v7 = "Detected";
      }
      else {
        objc_super v7 = "NotDetected";
      }
      *(_DWORD *)buf = 136446210;
      __int16 v12 = v7;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "Setting wireless charging state: %{public}s", buf, 0xCu);
    }

    id deviceObj = self->_deviceObj;
    if (self->_state.wirelessChargingState == 1) {
      __int16 v9 = 5232;
    }
    else {
      __int16 v9 = 5488;
    }
    *(_WORD *)buf = v9;
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostEvent>((uint64_t)deviceObj);
  }
  v10.receiver = self;
  v10.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v10 handleConsume:v4];
}

- (BOOL)_isSleeping
{
  return (self->_state.touchMode & 0x3F0) != 0;
}

- (void)_handleProxClearedAfterOccludedWakeEvent:(id)a3
{
  id v4 = a3;
  if ([(HSTFirmwareManager *)self _isSleeping])
  {
    unsigned int v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "Ignoring prox clear while sleeping", buf, 2u);
    }
  }
  else
  {
    id v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "Prox cleared after occluded wake", buf, 2u);
    }

    id deviceObj = self->_deviceObj;
    *(_WORD *)buf = 6768;
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostEvent>((uint64_t)deviceObj);
  }
  v8.receiver = self;
  v8.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v8 handleConsume:v4];
}

- (void)_handleUSBChargingStateEvent:(id)a3
{
  id v4 = a3;
  [(HSTFirmwareManager *)self _setUSBChargingState:v4];
  v5.receiver = self;
  v5.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v5 handleConsume:v4];
}

- (void)_handleStuckTouchDetectorStateEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 stuckTouchDetectorState];
  if (self->_state.stuckTouchDetectorState != v5)
  {
    self->_state.stuckTouchDetectorState = v5;
    id v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_state.stuckTouchDetectorState == 1) {
        objc_super v7 = "Disabled";
      }
      else {
        objc_super v7 = "Enabled";
      }
      *(_DWORD *)buf = 136446210;
      __int16 v12 = v7;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "Setting stuck touch detector state: %{public}s", buf, 0xCu);
    }

    id deviceObj = self->_deviceObj;
    if (self->_state.stuckTouchDetectorState) {
      __int16 v9 = -24208;
    }
    else {
      __int16 v9 = -24464;
    }
    *(_WORD *)buf = v9;
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostEvent>((uint64_t)deviceObj);
  }
  v10.receiver = self;
  v10.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v10 handleConsume:v4];
}

- (void)_setEnabledInputsReport
{
  p_state = &self->_state;
  uint64_t EnabledInputsReport = createEnabledInputsReport(self->_state.touchMode, self->_state.screenOrientation);
  unsigned int v5 = HIDWORD(EnabledInputsReport);
  LOBYTE(v18) = HIBYTE(EnabledInputsReport);
  HIBYTE(v18) = v6;
  LOBYTE(v17) = BYTE3(EnabledInputsReport);
  HIBYTE(v17) = BYTE4(EnabledInputsReport);
  objc_super v7 = +[NSString stringWithFormat:@"Setting enabled input report: Awake 0x%04X 0x%04X", (unsigned __int16)(EnabledInputsReport >> 8), v17];
  objc_super v8 = v7;
  if (p_state->poweredWhenScreenOff)
  {
    uint64_t v9 = [v7 stringByAppendingFormat:@", Alseep 0x%04X 0x%04X", (unsigned __int16)(v5 >> 8), v18];

    if (!self->_deviceObj)
    {
      objc_super v13 = +[NSAssertionHandler currentHandler];
      v14 = +[NSString stringWithUTF8String:"void setReport(MTDeviceRef, const T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::EnabledInputs::AwakeAsleep]"];
      [v13 handleFailureInFunction:v14, @"HSTFirmwareManager.mm", 200, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];

      objc_super v15 = +[NSAssertionHandler currentHandler];
      v16 = +[NSString stringWithUTF8String:"IOReturn HSTPipeline::FirmwareUtil::SetReport(MTDeviceRef _Nonnull, const T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::EnabledInputs::AwakeAsleep]"];
      [v15 handleFailureInFunction:v16, @"FirmwareUtil.h", 9, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
    }
    mach_error_t v10 = MTDeviceSetReport();
    if (v10)
    {
      int v11 = MTLoggingPlugin();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        mach_error_string(v10);
        setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostNotificationControl>();
      }
    }
    objc_super v8 = (void *)v9;
  }
  else
  {
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::EnabledInputs::Awake>((uint64_t)self->_deviceObj);
  }
  __int16 v12 = MTLoggingPlugin();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&def_411C8, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

- (void)_restoreFirmwareState
{
  if (self->_state.imagesEnabled) {
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::DataMode>((uint64_t)self->_deviceObj);
  }
  if (self->_state.reportAlwaysEnabled) {
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostInterruptMode>((uint64_t)self->_deviceObj);
  }
}

- (void)_handleResetEvent:(id)a3
{
  id v4 = a3;
  [(HSTFirmwareManager *)self _restoreFirmwareState];
  v5.receiver = self;
  v5.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v5 handleConsume:v4];
}

- (void)_handleGetDebugEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  char v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  [v5 setObject:v7 forKeyedSubscript:@"Stage"];

  int v16 = -1431655766;
  char v15 = 127;
  if (!self->_deviceObj)
  {
    mach_error_t v10 = +[NSAssertionHandler currentHandler];
    int v11 = +[NSString stringWithUTF8String:"IOReturn getReport(MTDeviceRef, T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::CriticalError]"];
    [v10 handleFailureInFunction:v11, @"HSTFirmwareManager.mm", 212, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];

    __int16 v12 = +[NSAssertionHandler currentHandler];
    objc_super v13 = +[NSString stringWithUTF8String:"IOReturn HSTPipeline::FirmwareUtil::GetReport(MTDeviceRef _Nonnull, T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::CriticalError]"];
    [v12 handleFailureInFunction:v13, @"FirmwareUtil.h", 17, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  int v17 = 0;
  mach_error_t Report = MTDeviceGetReport();
  if (!Report) {
    mach_error_t Report = -536870169;
  }
  uint64_t v9 = MTLoggingPlugin();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    mach_error_string(Report);
    -[HSTFirmwareManager _handleGetDebugEvent:]();
  }

  *((unsigned char *)v4 + 16) = 1;
  [*((id *)v4 + 3) addObject:v5];
  v14.receiver = self;
  v14.super_class = (Class)HSTFirmwareManager;
  [(HSStage *)&v14 handleConsume:v4];
}

- (void)_handleSetReportEvent:(id)a3
{
  id deviceObj = (HSTPipeline::FirmwareUtil *)self->_deviceObj;
  objc_super v5 = [a3 report];
  HSTPipeline::FirmwareUtil::SetReportWithData(deviceObj, v5, v4);
}

- (void)_handleDriverEvent:(id)a3
{
  id v4 = a3;
  if ([v4 notification] == 5)
  {
    objc_super v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "Client connected, re-injecting output frames", buf, 2u);
    }
    BOOL v6 = 1;
LABEL_9:

    self->_state.filteredClients = v6;
    goto LABEL_10;
  }
  if ([v4 notification] == 6)
  {
    objc_super v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "Client disconnected, stop re-injection", v7, 2u);
    }
    BOOL v6 = 0;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_handleHSTFrame:(id)a3
{
  v3 = (id *)a3;
  if (v3)
  {
    id v4 = MTLoggingPlugin();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[HSTFirmwareManager _handleHSTFrame:]((unsigned __int8 *)[v3[1] bytes], v5, v4);
    }

    [v3[1] bytes];
    [v3[1] length];
    MTDeviceInjectFrame();
  }
}

- (void)_handleExternalMessageEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 message];
  [v4 bytes];

  objc_super v5 = [v3 message];
  id v6 = [v5 length];

  if ((unint64_t)v6 <= 1)
  {
    objc_super v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager _handleExternalMessageEvent:]((uint64_t)v6, v7);
    }
LABEL_7:

    goto LABEL_8;
  }
  int v8 = MTDeviceSendExternalMessage();
  if (v8)
  {
    objc_super v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager _handleExternalMessageEvent:](v8, v7);
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)encodeToMap:(void *)a3
{
  p_state = &self->_state;
  HSUtil::Encoder::encodeBool((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)111,(char)119,(char)101,(char)114,(char)101,(char)100,(char)87,(char)104,(char)101,(char)110,(char)83,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)102,(char)102>::Key, self->_state.poweredWhenScreenOff);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key, p_state->touchMode);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)84,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key, p_state->prevTouchMode);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110>::Key, p_state->screenOrientation);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)111,(char)99,(char)107,(char)104,(char)111,(char)108,(char)109,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->stockholmState);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)105,(char)114,(char)101,(char)108,(char)101,(char)115,(char)115,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->wirelessChargingState);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)117,(char)115,(char)98,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->usbChargingState);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)117,(char)99,(char)107,(char)84,(char)111,(char)117,(char)99,(char)104,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)111,(char)114,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->stuckTouchDetectorState);
  HSUtil::Encoder::encodeBool((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)109,(char)97,(char)103,(char)101,(char)115,(char)69,(char)110,(char)97,(char)98,(char)108,(char)101,(char)100>::Key, p_state->imagesEnabled);
  objc_super v5 = (const CoderKey *)HSUtil::CoderKey::Literal<(char)114,(char)101,(char)112,(char)111,(char)114,(char)116,(char)65,(char)108,(char)119,(char)97,(char)121,(char)115,(char)69,(char)110,(char)97,(char)98,(char)108,(char)101,(char)100>::Key;
  int reportAlwaysEnabled = p_state->reportAlwaysEnabled;

  HSUtil::Encoder::encodeBool((HSUtil::Encoder *)a3, v5, reportAlwaysEnabled);
}

- (BOOL)decodeFromMap:(void *)a3
{
  p_state = &self->_state;
  self->_state.poweredWhenScreenOff = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)111,(char)119,(char)101,(char)114,(char)101,(char)100,(char)87,(char)104,(char)101,(char)110,(char)83,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)102,(char)102>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:]0();
    }
    return 0;
  }
  p_state->int touchMode = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:].cold.9();
    }
    return 0;
  }
  p_state->prevTouchMode = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)101,(char)118,(char)84,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:].cold.8();
    }
    return 0;
  }
  p_state->screenOrientation = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:].cold.7();
    }
    return 0;
  }
  p_state->int stockholmState = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)111,(char)99,(char)107,(char)104,(char)111,(char)108,(char)109,(char)83,(char)116,(char)97,(char)116,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:].cold.6();
    }
    return 0;
  }
  p_state->wirelessChargingState = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)105,(char)114,(char)101,(char)108,(char)101,(char)115,(char)115,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:].cold.5();
    }
    return 0;
  }
  p_state->usbChargingState = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)117,(char)115,(char)98,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:].cold.4();
    }
    return 0;
  }
  p_state->stuckTouchDetectorState = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)117,(char)99,(char)107,(char)84,(char)111,(char)117,(char)99,(char)104,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)111,(char)114,(char)83,(char)116,(char)97,(char)116,(char)101>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:]();
    }
    return 0;
  }
  p_state->imagesEnabled = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)109,(char)97,(char)103,(char)101,(char)115,(char)69,(char)110,(char)97,(char)98,(char)108,(char)101,(char)100>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:]();
    }
    return 0;
  }
  p_state->int reportAlwaysEnabled = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)114,(char)101,(char)112,(char)111,(char)114,(char)116,(char)65,(char)108,(char)119,(char)97,(char)121,(char)115,(char)69,(char)110,(char)97,(char)98,(char)108,(char)101,(char)100>::Key);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager decodeFromMap:]();
    }
    return 0;
  }
  return 1;
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  [(HSTFirmwareManager *)self encodeToMap:a3];
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v12 = v5;
  long long v13 = v5;
  long long v10 = v5;
  long long v11 = v5;
  long long v9 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v9);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTouchHIDService/HSTFirmwareManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFirmwareManager handleHSDecode:]();
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(HSTFirmwareManager *)self decodeFromMap:&v9];
  }
  if ((void)v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v11);
  }
  objc_super v7 = (void *)v10;
  *(void *)&long long v10 = 0;
  if (v7)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v7);
    operator delete();
  }
  return v6;
}

- (id)preferences
{
  {
    id v4 = [[HSPreference alloc] initWithKey:@"imagesEnabled" name:@"Images" description:@"Include images with paths (0xAC=3)"];
    v6[0] = v4;
    long long v5 = [[HSPreference alloc] initWithKey:@"reportAlwaysEnabled" name:@"Report Always" description:@"Stream data constantly"];
    v6[1] = v5;
    -[HSTFirmwareManager preferences]::prefs = +[NSArray arrayWithObjects:v6 count:2];
  }
  v2 = (void *)-[HSTFirmwareManager preferences]::prefs;

  return v2;
}

- (id)preferenceValueForKey:(id)a3
{
  id v4 = a3;
  v8[0] = (id)0xAAAAAAAAAAAAAAAALL;
  v8[1] = (id)0xAAAAAAAAAAAAAAAALL;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v8, self);
  if ([v4 isEqualToString:@"imagesEnabled"])
  {
    p_imagesEnabled = &self->_state.imagesEnabled;
LABEL_5:
    BOOL v6 = +[NSNumber numberWithBool:*p_imagesEnabled];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"reportAlwaysEnabled"])
  {
    p_imagesEnabled = &self->_state.reportAlwaysEnabled;
    goto LABEL_5;
  }
  BOOL v6 = 0;
LABEL_7:
  HSUtil::ObjectLock::~ObjectLock(v8);

  return v6;
}

- (void)setPreferenceValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  id v11 = (id)0xAAAAAAAAAAAAAAAALL;
  HSUtil::ObjectLock::ObjectLock((uint64_t)&v10, self);
  if (![v7 isEqualToString:@"imagesEnabled"])
  {
    if (![v7 isEqualToString:@"reportAlwaysEnabled"]) {
      goto LABEL_10;
    }
    id v8 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v8)
      {
        self->_state.int reportAlwaysEnabled = [v8 BOOLValue];
        setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostInterruptMode>((uint64_t)self->_deviceObj);
        goto LABEL_9;
      }
LABEL_10:
      int v9 = 0;
      goto LABEL_13;
    }
LABEL_11:
    int v9 = 0;
    goto LABEL_12;
  }
  id v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  if (!v8) {
    goto LABEL_10;
  }
  self->_state.imagesEnabled = [v8 BOOLValue];
  setReport<HSTPipeline::FirmwareInterface::FeatureReport::DataMode>((uint64_t)self->_deviceObj);
LABEL_9:
  int v9 = 1;
LABEL_12:

LABEL_13:
  [v11 unlock];
  LOBYTE(v10) = 0;
  if (v9) {
    [(HSStage *)self postNotification:HSPreferenceChangedNotification];
  }
  HSUtil::ObjectLock::~ObjectLock((id *)&v10);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 128) = 0;
  *(void *)((char *)self + 130) = 65537;
  *(_DWORD *)((char *)self + 138) = 1;
  return self;
}

- (void)_handleGetDebugEvent:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(v0, v1, v2, 1.5047e-36);
  OUTLINED_FUNCTION_3(&def_411C8, "FirmwareUtil::GetReport (0x%02X) failed: %{public}s", v3, v4);
}

- (void)_handleHSTFrame:(os_log_t)log .cold.1(unsigned __int8 *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_debug_impl(&def_411C8, log, OS_LOG_TYPE_DEBUG, "frame re-injected 0x%x", buf, 8u);
}

- (void)_handleExternalMessageEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 2;
  _os_log_error_impl(&def_411C8, a2, OS_LOG_TYPE_ERROR, "Message length (%ld) is smaller than message type size (%lu)", (uint8_t *)&v2, 0x16u);
}

- (void)_handleExternalMessageEvent:(int)a1 .cold.2(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&def_411C8, a2, OS_LOG_TYPE_ERROR, "Error 0x%08X sending external message", (uint8_t *)v2, 8u);
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

- (void)decodeFromMap:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)decodeFromMap:.cold.10()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end