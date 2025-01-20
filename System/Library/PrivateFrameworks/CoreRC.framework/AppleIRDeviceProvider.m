@interface AppleIRDeviceProvider
+ (BOOL)supportsSecureCoding;
+ (void)load;
- (AppleIRDeviceProvider)init;
- (AppleIRDeviceProvider)initWithBus:(id)a3 deviceUID:(unsigned __int8)a4;
- (BOOL)_dispatchAppleVendorEventPage:(unsigned int)a3 usage:(unsigned int)a4 timestamp:(unint64_t)a5 toDevice:(id)a6;
- (BOOL)_dispatchEventWithCommand:(unint64_t)a3 timestamp:(unint64_t)a4 toDevice:(id)a5;
- (BOOL)dispatchEventsForCommand:(id)a3 toDevice:(id)a4;
- (BOOL)isAppleRemote;
- (BOOL)pairAppleRemote:(id *)a3;
- (BOOL)unpairAppleRemote:(id *)a3;
- (Class)classForCoder;
- (unint64_t)vendorID;
- (unsigned)deviceUID;
- (void)_cancelPressAndHoldTimer;
- (void)_schedulePressAndHoldTimer;
- (void)_synthesizeButtonReleaseWithTimestamp:(unint64_t)a3;
- (void)dealloc;
- (void)setVendorID:(unint64_t)a3;
@end

@implementation AppleIRDeviceProvider

+ (void)load
{
  _maxRepeatIntervalTicks = MillisecondsToUpTicks();
}

- (AppleIRDeviceProvider)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use -initWithBus:deviceUID:"];
  return 0;
}

- (AppleIRDeviceProvider)initWithBus:(id)a3 deviceUID:(unsigned __int8)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AppleIRDeviceProvider;
  result = [(CoreIRDeviceProvider *)&v6 initWithBus:a3 local:0 deviceType:1];
  if (result)
  {
    result->_deviceUID = a4;
    result->_lastAppleIRCommand = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AppleIRDeviceProvider;
  [(CoreIRDeviceProvider *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Appleirdevicec.isa);
}

- (BOOL)isAppleRemote
{
  return 1;
}

- (unint64_t)vendorID
{
  return (unsigned __int16)kAppleIRVendorIDApple;
}

- (void)setVendorID:(unint64_t)a3
{
}

- (BOOL)pairAppleRemote:(id *)a3
{
  id v5 = [(AppleIRDeviceProvider *)self busProvider];
  return [v5 setPairedAppleRemote:self error:a3];
}

- (BOOL)unpairAppleRemote:(id *)a3
{
  id v5 = 0;
  BOOL result = objc_msgSend(-[AppleIRDeviceProvider busProvider](self, "busProvider"), "setPairedAppleRemote:error:", 0, &v5);
  if (a3) {
    *a3 = v5;
  }
  return result;
}

- (BOOL)dispatchEventsForCommand:(id)a3 toDevice:(id)a4
{
  v32 = 0;
  v7 = (AppleIRDeviceProvider *)objc_msgSend(-[AppleIRDeviceProvider busProvider](self, "busProvider"), "pairedAppleRemote");
  unint64_t v8 = [a3 timestamp];
  unint64_t lastCommandTimestamp = self->_lastCommandTimestamp;
  uint64_t v31 = 0;
  char v30 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (gLogCategory_CoreRCDevice > 90 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      goto LABEL_57;
    }
    goto LABEL_18;
  }
  unint64_t v10 = v8 - lastCommandTimestamp;
  if (gLogCategory_CoreRCDevice <= 40)
  {
    if (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v29 = v8;
      uint64_t v11 = [a3 payload];
      unsigned int v12 = [a3 vendorID];
      id v13 = a4;
      unsigned int v14 = [a3 deviceUID];
      unsigned int v15 = [a3 commandPage];
      uint64_t v27 = [a3 commandID];
      uint64_t v28 = UpTicksToMilliseconds();
      uint64_t v16 = v14;
      a4 = v13;
      uint64_t v25 = v16;
      uint64_t v26 = v15;
      uint64_t v22 = v11;
      uint64_t v24 = v12;
      unint64_t v8 = v29;
      LogPrintF();
    }
  }
  if (objc_msgSend(a3, "isRepeat", v22, v24, v25, v26, v27, v28))
  {
    if (self->_lastCoreRCCommand) {
      BOOL v17 = v10 > _maxRepeatIntervalTicks;
    }
    else {
      BOOL v17 = 1;
    }
    if (!v17)
    {
      if (gLogCategory_CoreRCDevice <= 50
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[AppleIRDeviceProvider _dispatchEventWithCommand:timestamp:toDevice:](self, "_dispatchEventWithCommand:timestamp:toDevice:", self->_lastCoreRCCommand, v8, objc_msgSend(-[AppleIRDeviceProvider busProvider](self, "busProvider"), "localDevice"));
      self->_unint64_t lastCommandTimestamp = v8;
      goto LABEL_76;
    }
    if (gLogCategory_CoreRCDevice > 50 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize())
    {
LABEL_57:
      BOOL v18 = 0;
LABEL_77:
      v20 = v32;
      goto LABEL_78;
    }
LABEL_18:
    LogPrintF();
    goto LABEL_57;
  }
  if ([a3 vendorID] != (unsigned __int16)kAppleIRVendorIDApple)
  {
    if (gLogCategory_CoreRCDevice > 60 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      goto LABEL_102;
    }
    v23 = a3;
    goto LABEL_100;
  }
  if (v7
    && v7 != self
    && ([a3 isUnpairingRequest] & 1) == 0
    && ([a3 isBTLEDiscoveryModeRequest] & 1) == 0)
  {
    if (gLogCategory_CoreRCDevice > 50 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      goto LABEL_102;
    }
    v23 = self;
LABEL_100:
    LogPrintF();
LABEL_102:
    v20 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410], -6707, 0, v23);
    BOOL v18 = 0;
    v32 = v20;
    goto LABEL_78;
  }
  if (!self->_isB39 && [a3 isB39Command]) {
    self->_isB39 = 1;
  }
  if ([a3 isA39PlayPauseSelect])
  {
    if (self->_isB39)
    {
      if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
        goto LABEL_73;
      }
      v23 = a3;
LABEL_40:
      LogPrintF();
LABEL_73:
      [(AppleIRDeviceProvider *)self _cancelPressAndHoldTimer];
      [(AppleIRDeviceProvider *)self _schedulePressAndHoldTimer];
      v20 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6757 userInfo:0];
      v32 = v20;
      BOOL v18 = 1;
      goto LABEL_78;
    }
    if ([self->_lastAppleIRCommand isB39PlayPauseOrSelect]
      && v10 <= _maxRepeatIntervalTicks)
    {
      if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
        goto LABEL_73;
      }
      v23 = a3;
      goto LABEL_40;
    }
  }
  if ([a3 isPairingRequest])
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(AppleIRDeviceProvider *)self pairAppleRemote:&v32];
    goto LABEL_76;
  }
  if ([a3 isUnpairingRequest])
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(AppleIRDeviceProvider *)self unpairAppleRemote:&v32];
    goto LABEL_76;
  }
  if ([a3 getVendorSpecificHIDUsagePage:(char *)&v31 + 4 usageID:&v31 ignoreRepeats:&v30])
  {
    if (v30 && [a3 isEqual:self->_lastAppleIRCommand] && v10 <= _maxRepeatIntervalTicks)
    {
      if (gLogCategory_CoreRCDevice <= 40
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if ([a3 isStackshotRequest]
        && gLogCategory_CoreRCDevice <= 90
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(AppleIRDeviceProvider *)self _dispatchAppleVendorEventPage:HIDWORD(v31) usage:v31 timestamp:v8 toDevice:a4];
    }
    goto LABEL_76;
  }
  uint64_t v19 = [a3 command];
  if (v19)
  {
    -[AppleIRDeviceProvider _dispatchEventWithCommand:timestamp:toDevice:](self, "_dispatchEventWithCommand:timestamp:toDevice:", v19, v8, objc_msgSend(-[AppleIRDeviceProvider busProvider](self, "busProvider"), "localDevice"));
LABEL_76:
    BOOL v18 = 1;
    goto LABEL_77;
  }
  if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    v23 = a3;
    LogPrintF();
  }
  v20 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410], -6735, 0, v23);
  v32 = v20;
  BOOL v18 = 1;
LABEL_78:
  if (v20)
  {
    if ([v20 code] != -6757
      && gLogCategory_CoreRCDevice <= 90
      && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {

    self->_lastAppleIRCommand = (AppleIRCommand *)a3;
    self->_unint64_t lastCommandTimestamp = v8;
  }
  return v18;
}

- (BOOL)_dispatchEventWithCommand:(unint64_t)a3 timestamp:(unint64_t)a4 toDevice:(id)a5
{
  [(AppleIRDeviceProvider *)self _cancelPressAndHoldTimer];
  if (!a3)
  {
    if (gLogCategory_CoreRCDevice > 90 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return 0;
    }
    goto LABEL_23;
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t v12 = a3;
    LogPrintF();
  }
  unint64_t lastCoreRCCommand = self->_lastCoreRCCommand;
  if (!lastCoreRCCommand)
  {
LABEL_10:
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v12 = a3;
      id v13 = CoreRCCommandString(a3);
      LogPrintF();
    }
    if (-[CoreIRDeviceProvider dispatchButtonEventWithCommand:pressed:timestamp:toDevice:](self, "dispatchButtonEventWithCommand:pressed:timestamp:toDevice:", a3, 1, a4, a5, v12, v13))
    {
      self->_unint64_t lastCoreRCCommand = a3;
      BOOL v10 = 1;
      goto LABEL_16;
    }
    if (gLogCategory_CoreRCDevice > 90 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return 0;
    }
LABEL_23:
    LogPrintF();
    return 0;
  }
  if (lastCoreRCCommand != a3)
  {
    [(AppleIRDeviceProvider *)self _synthesizeButtonReleaseWithTimestamp:a4];
    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_16:
  [(AppleIRDeviceProvider *)self _schedulePressAndHoldTimer];
  return v10;
}

- (BOOL)_dispatchAppleVendorEventPage:(unsigned int)a3 usage:(unsigned int)a4 timestamp:(unint64_t)a5 toDevice:(id)a6
{
  uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
  if (VendorDefinedEvent)
  {
    v9 = (const void *)VendorDefinedEvent;
    BOOL v10 = [[CoreRCHIDEvent alloc] initWithIOHIDEvent:VendorDefinedEvent];
    BOOL v11 = v10 != 0;
    if (v10)
    {
      [a6 receivedHIDEvent:v10 fromDevice:self];
    }
    else if (gLogCategory_CoreRCDevice <= 90 {
           && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    CFRelease(v9);
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v10 = 0;
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_synthesizeButtonReleaseWithTimestamp:(unint64_t)a3
{
  unint64_t lastCoreRCCommand = self->_lastCoreRCCommand;
  if (lastCoreRCCommand)
  {
    if (gLogCategory_CoreRCDevice <= 40)
    {
      if (gLogCategory_CoreRCDevice != -1
        || (int v6 = _LogCategory_Initialize(), lastCoreRCCommand = self->_lastCoreRCCommand, v6))
      {
        unint64_t v7 = lastCoreRCCommand;
        unint64_t v8 = CoreRCCommandString(lastCoreRCCommand);
        LogPrintF();
        unint64_t lastCoreRCCommand = self->_lastCoreRCCommand;
      }
    }
    -[CoreIRDeviceProvider dispatchButtonEventWithCommand:pressed:timestamp:toDevice:](self, "dispatchButtonEventWithCommand:pressed:timestamp:toDevice:", lastCoreRCCommand, 0, a3, objc_msgSend(-[AppleIRDeviceProvider busProvider](self, "busProvider", v7, v8), "localDevice"));
    self->_unint64_t lastCoreRCCommand = 0;
  }
  else if (gLogCategory_CoreRCDevice <= 90 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_schedulePressAndHoldTimer
{
  unint64_t pressAndHoldTimeoutGenerationCount = self->_pressAndHoldTimeoutGenerationCount;
  dispatch_time_t v4 = dispatch_time(0, 140000000);
  id v5 = objc_msgSend(-[CoreRCDevice bus](self, "bus"), "serialQueue");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__AppleIRDeviceProvider__schedulePressAndHoldTimer__block_invoke;
  v6[3] = &unk_2652E3610;
  v6[4] = self;
  v6[5] = pressAndHoldTimeoutGenerationCount;
  dispatch_after(v4, v5, v6);
}

uint64_t __51__AppleIRDeviceProvider__schedulePressAndHoldTimer__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_CoreRCDevice <= 10)
  {
    if (gLogCategory_CoreRCDevice != -1 || (BOOL result = _LogCategory_Initialize(), result)) {
      BOOL result = LogPrintF();
    }
  }
  uint64_t v3 = v1 + 32;
  v2 = *(void **)(v1 + 32);
  if (*(void *)(v3 + 8) == v2[127])
  {
    uint64_t v4 = mach_absolute_time();
    return [v2 _synthesizeButtonReleaseWithTimestamp:v4];
  }
  return result;
}

- (void)_cancelPressAndHoldTimer
{
}

- (unsigned)deviceUID
{
  return self->_deviceUID;
}

@end