@interface IAPPortManager
- (BOOL)accessoryPowerModeOnDuringSleep;
- (BOOL)internalBatteryChargingState;
- (BOOL)isDeviceInLowPowerMode;
- (BOOL)isLowPowerModeSupported;
- (BOOL)sendReserveCurrentNotification;
- (BOOL)supportsPowerModeOnAcrossSleep;
- (BOOL)supportsUltraHighPowerMode;
- (IAPPortManager)initWithService:(unsigned int)a3 andNotificationPort:(IONotificationPort *)a4;
- (NSNumber)portNumber;
- (int)accessoryPowerState;
- (unsigned)availableCurrentFromAccInMa;
- (unsigned)maxInputCurrentFromAccInMa;
- (unsigned)reserveCurrentForAccInMa;
- (unsigned)service;
- (unsigned)ultraHighPowerModeCurrentLimit;
- (void)dealloc;
- (void)restoreAvailableCurrentFromAcc;
- (void)setAccessoryPowerModeOnDuringSleep:(BOOL)a3;
- (void)setAccessoryPowerState:(int)a3;
- (void)setAvailableCurrentFromAccInMa:(unsigned __int16)a3;
- (void)setInternalBatteryChargingState:(BOOL)a3;
- (void)setMaxInputCurrentFromAccInMa:(unsigned __int16)a3;
- (void)setReserveCurrentForAccInMa:(unsigned __int16)a3;
- (void)setSendReserveCurrentNotification:(BOOL)a3;
@end

@implementation IAPPortManager

- (IAPPortManager)initWithService:(unsigned int)a3 andNotificationPort:(IONotificationPort *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)IAPPortManager;
  result = [(IAPPortManager *)&v14 init];
  v7 = result;
  if (!result) {
    return v7;
  }
  io_connect_t connect = 0;
  *(_WORD *)&result->_supportsUltraHighPowerMode = -1;
  if ((((_BYTE)result + 16) & 7) == 0)
  {
    result->_notificationPortRef = a4;
    if ((((_BYTE)result + 40) & 3) == 0)
    {
      result->_accessoryPowerState = 1;
      result->_sendReserveCurrentNotification = 0;
      p_service = &result->_service;
      if (((unint64_t)&result->_service & 3) == 0)
      {
        unsigned int *p_service = a3;
        uint64_t v9 = IOObjectRetain(a3);
        if (v9) {
          NSLog(@"ERROR - %s:%s - %d IOObjectRetain failed %#x", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager initWithService:andNotificationPort:]", 128, v9);
        }
        uint64_t v10 = IOServiceOpen(*p_service, mach_task_self_, 0, &connect);
        if (v10 || connect == 0)
        {
          NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager initWithService:andNotificationPort:]", 134, v10);
        }
        else
        {
          uint64_t v12 = IOServiceAddInterestNotification(v7->_notificationPortRef, v7->_service, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000EE7E4, v7, &v7->_notification);
          if (v12) {
            NSLog(@"ERROR - %s:%s - %d couldn't add interest notification %#x", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager initWithService:andNotificationPort:]", 140, v12);
          }
          IOServiceClose(connect);
        }
        result = (IAPPortManager *)[objc_alloc((Class)NSNumber) initWithInt:IOAccessoryManagerGetPrimaryPort()];
        if (((unint64_t)&v7->_portNumber & 7) == 0)
        {
          v7->_portNumber = (NSNumber *)result;
          return v7;
        }
      }
    }
  }
  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  p_service = &self->_service;
  if (((unint64_t)&self->_service & 3) != 0) {
    goto LABEL_9;
  }
  if (*p_service)
  {
    IOObjectRelease(*p_service);
    unsigned int *p_service = 0;
  }
  p_notification = &self->_notification;
  if (((unint64_t)&self->_notification & 3) != 0) {
    goto LABEL_9;
  }
  if (*p_notification)
  {
    IOObjectRelease(*p_notification);
    unsigned int *p_notification = 0;
  }
  if ((((_BYTE)self + 32) & 7) != 0)
  {
LABEL_9:
    __break(0x5516u);
  }
  else
  {

    v5.receiver = self;
    v5.super_class = (Class)IAPPortManager;
    [(IAPPortManager *)&v5 dealloc];
  }
}

- (BOOL)isLowPowerModeSupported
{
  return MGGetBoolAnswer();
}

- (BOOL)isDeviceInLowPowerMode
{
  if ([(IAPPortManager *)self isLowPowerModeSupported]
    && (v2 = SCPreferencesCreate(kCFAllocatorDefault, @"com.apple.iapd", @"com.apple.radios.plist")) != 0)
  {
    v3 = v2;
    SCPreferencesSynchronize(v2);
    CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(v3, @"LowPowerMode");
    CFBooleanRef v5 = Value;
    if (Value)
    {
      CFTypeID v6 = CFGetTypeID(Value);
      LOBYTE(v5) = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) == 1;
    }
    CFRelease(v3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (void)setAccessoryPowerState:(int)a3
{
  p_accessoryPowerState = &self->_accessoryPowerState;
  if (((unint64_t)&self->_accessoryPowerState & 3) != 0) {
    goto LABEL_19;
  }
  if ((*p_accessoryPowerState | a3) >= 4)
  {
LABEL_20:
    __break(0x550Au);
    return;
  }
  if (*p_accessoryPowerState == a3) {
    return;
  }
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
LABEL_19:
    __break(0x5516u);
    goto LABEL_20;
  }
  uint64_t v6 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = connect == 0;
  }
  if (v7)
  {
    NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setAccessoryPowerState:]", 217, v6);
  }
  else
  {
    if (a3 != 2 && a3 != 3 || ![(IAPPortManager *)self isDeviceInLowPowerMode])
    {
      uint64_t v8 = IOAccessoryManagerConfigurePower();
      if (v8) {
        NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerConfigurePower failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setAccessoryPowerState:]", 238, v8);
      }
    }
    IOServiceClose(connect);
  }
  int *p_accessoryPowerState = a3;
}

- (BOOL)supportsUltraHighPowerMode
{
  int supportsUltraHighPowerMode = self->_supportsUltraHighPowerMode;
  if (supportsUltraHighPowerMode == 255)
  {
    v3 = self;
    if ((((_BYTE)self + 8) & 3) != 0)
    {
      __break(0x5516u);
      return (char)self;
    }
    int supportsUltraHighPowerMode = IOAccessoryManagerPowerModeIsSupported() != 0;
    v3->_int supportsUltraHighPowerMode = supportsUltraHighPowerMode;
  }
  LOBYTE(self) = supportsUltraHighPowerMode != 0;
  return (char)self;
}

- (BOOL)supportsPowerModeOnAcrossSleep
{
  int supportsPowerModeOnAcrossSleep = self->_supportsPowerModeOnAcrossSleep;
  if (supportsPowerModeOnAcrossSleep == 255)
  {
    v3 = self;
    if ((((_BYTE)self + 8) & 3) != 0)
    {
      __break(0x5516u);
      return (char)self;
    }
    int supportsPowerModeOnAcrossSleep = IOAccessoryManagerPowerDuringSleepIsSupported() != 0;
    v3->_int supportsPowerModeOnAcrossSleep = supportsPowerModeOnAcrossSleep;
  }
  LOBYTE(self) = supportsPowerModeOnAcrossSleep != 0;
  return (char)self;
}

- (BOOL)accessoryPowerModeOnDuringSleep
{
  if (((unint64_t)&self->_service & 3) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = IOAccessoryManagerGetPowerDuringSleep() != 0;
  }
  return (char)self;
}

- (void)setAccessoryPowerModeOnDuringSleep:(BOOL)a3
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v3 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    if (v3) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = connect == 0;
    }
    if (v4)
    {
      NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setAccessoryPowerModeOnDuringSleep:]", 283, v3);
    }
    else
    {
      uint64_t v5 = IOAccessoryManagerSetPowerDuringSleep();
      if (v5)
      {
        if (v5 == -536870183) {
          NSLog(@"INFO - %s:%s - %d IOAccessoryManagerSetPowerDuringSleep not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setAccessoryPowerModeOnDuringSleep:]", 291, 3758097113);
        }
        else {
          NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerSetPowerDuringSleep failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setAccessoryPowerModeOnDuringSleep:]", 295, v5);
        }
      }
      IOServiceClose(connect);
    }
  }
}

- (unsigned)availableCurrentFromAccInMa
{
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t USBCurrentLimitBase = IOAccessoryManagerGetUSBCurrentLimitBase();
    if (USBCurrentLimitBase == -536870183)
    {
      NSLog(@"INFO - %s:%s - %d IOAccessoryManagerGetUSBCurrentLimitBase not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager availableCurrentFromAccInMa]", 310, 3758097113);
    }
    else if (USBCurrentLimitBase)
    {
      NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerGetUSBCurrentLimitBase failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager availableCurrentFromAccInMa]", 314, USBCurrentLimitBase);
    }
    LOWORD(self) = 0;
  }
  return (unsigned __int16)self;
}

- (void)setAvailableCurrentFromAccInMa:(unsigned __int16)a3
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0) {
    goto LABEL_17;
  }
  uint64_t v3 = a3;
  uint64_t v5 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = connect == 0;
  }
  if (v6)
  {
    NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setAvailableCurrentFromAccInMa:]", 328, v5);
    return;
  }
  self->_sendReserveCurrentNotification = 0;
  uint64_t v7 = IOAccessoryManagerSetUSBCurrentLimitBase();
  if (v7)
  {
    if (v7 == -536870183) {
      NSLog(@"INFO - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitBase not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setAvailableCurrentFromAccInMa:]", 337, 3758097113);
    }
    else {
      NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitBase failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setAvailableCurrentFromAccInMa:]", 341, v7);
    }
    goto LABEL_15;
  }
  uint64_t v8 = sub_10002C320([(NSNumber *)[(IAPPortManager *)self portNumber] intValue]);
  if (v8)
  {
    if ((v8 & 7) == 0)
    {
      (*(void (**)(uint64_t *, uint64_t))(*v8 + 328))(v8, v3);
      goto LABEL_15;
    }
LABEL_17:
    __break(0x5516u);
    return;
  }
LABEL_15:
  IOServiceClose(connect);
}

- (void)restoreAvailableCurrentFromAcc
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v3 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    if (v3) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = connect == 0;
    }
    if (v4)
    {
      NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager restoreAvailableCurrentFromAcc]", 379, v3);
    }
    else
    {
      self->_sendReserveCurrentNotification = 0;
      uint64_t v5 = IOAccessoryManagerRestoreUSBCurrentLimitBase();
      if (v5)
      {
        if (v5 == -536870183) {
          NSLog(@"INFO - %s:%s - %d IOAccessoryManagerRestoreUSBcurrentLimitBase not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager restoreAvailableCurrentFromAcc]", 367, 3758097113);
        }
        else {
          NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerRestoreUSBcurrentLimitBase failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager restoreAvailableCurrentFromAcc]", 371, v5);
        }
      }
      IOServiceClose(connect);
    }
  }
}

- (unsigned)reserveCurrentForAccInMa
{
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
    __break(0x550Cu);
  }
  else
  {
    uint64_t USBCurrentLimitOffset = IOAccessoryManagerGetUSBCurrentLimitOffset();
    if (USBCurrentLimitOffset)
    {
      if (USBCurrentLimitOffset == -536870183) {
        NSLog(@"INFO - %s:%s - %d IOAccessoryManagerGetUSBCurrentLimitOffset not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager reserveCurrentForAccInMa]", 394, 3758097113);
      }
      else {
        NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerGetUSBCurrentLimitOffset failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager reserveCurrentForAccInMa]", 398, USBCurrentLimitOffset);
      }
    }
    LOWORD(self) = 0;
  }
  return (unsigned __int16)self;
}

- (void)setReserveCurrentForAccInMa:(unsigned __int16)a3
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v4 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = connect == 0;
    }
    if (v5)
    {
      NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setReserveCurrentForAccInMa:]", 416, v4);
    }
    else
    {
      uint64_t v6 = IOAccessoryManagerSetUSBCurrentOffset();
      if (v6)
      {
        if (v6 == -536870183) {
          NSLog(@"INFO - %s:%s - %d IOAccessoryManagerSetUSBCurrentOffset not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setReserveCurrentForAccInMa:]", 424, 3758097113);
        }
        else {
          NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerSetUSBCurrentOffset failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setReserveCurrentForAccInMa:]", 428, v6);
        }
      }
      else
      {
        self->_sendReserveCurrentNotification = 1;
      }
      IOServiceClose(connect);
    }
  }
}

- (unsigned)maxInputCurrentFromAccInMa
{
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t USBCurrentLimitMaximum = IOAccessoryManagerGetUSBCurrentLimitMaximum();
    if (USBCurrentLimitMaximum == -536870160)
    {
      NSLog(@"INFO - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitMaximum not found %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager maxInputCurrentFromAccInMa]", 445, 3758097136);
    }
    else if (USBCurrentLimitMaximum)
    {
      NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitMaximum failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager maxInputCurrentFromAccInMa]", 449, USBCurrentLimitMaximum);
    }
    LOWORD(self) = 0;
  }
  return (unsigned __int16)self;
}

- (void)setMaxInputCurrentFromAccInMa:(unsigned __int16)a3
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0) {
    goto LABEL_20;
  }
  uint64_t v4 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = connect == 0;
  }
  if (v5)
  {
    NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setMaxInputCurrentFromAccInMa:]", 463, v4);
    return;
  }
  uint64_t v6 = IOAccessoryManagerSetUSBCurrentLimitMaximum();
  if (v6)
  {
    if (v6 == -536870183) {
      NSLog(@"INFO - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitMaximum not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setMaxInputCurrentFromAccInMa:]", 471, 3758097113);
    }
    else {
      NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerSetUSBCurrentLimitMaximum failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setMaxInputCurrentFromAccInMa:]", 475, v6);
    }
    goto LABEL_17;
  }
  uint64_t v7 = sub_10002C320([(NSNumber *)[(IAPPortManager *)self portNumber] intValue]);
  if (!v7)
  {
    uint64_t v7 = sub_10002C3D0([(NSNumber *)[(IAPPortManager *)self portNumber] intValue]);
    if (!v7)
    {
      NSLog(@"ERROR - setMaxInputCurrentFromAccInMa Still no podTransport for manager %d", [(NSNumber *)[(IAPPortManager *)self portNumber] intValue]);
      goto LABEL_17;
    }
  }
  uint64_t v8 = (uint64_t)v7;
  uint64_t v9 = sub_10004E9C8();
  if (!v9 || (v9 & 7) != 0)
  {
LABEL_20:
    __break(0x5516u);
    return;
  }
  sub_1000509A8(v9, v8, 0);
LABEL_17:
  IOServiceClose(connect);
}

- (void)setInternalBatteryChargingState:(BOOL)a3
{
  io_connect_t connect = 0;
  if (((unint64_t)&self->_service & 3) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v3 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    if (v3) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = connect == 0;
    }
    if (v4)
    {
      NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setInternalBatteryChargingState:]", 502, v3);
    }
    else
    {
      uint64_t v5 = IOAccessoryManagerSetBatteryPackMode();
      if (v5)
      {
        if (v5 == -536870183) {
          NSLog(@"INFO - %s:%s - %d IOAccessoryManagerSetBatteryPackMode not attached %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setInternalBatteryChargingState:]", 510, 3758097113);
        }
        else {
          NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerSetBatteryPackMode failed %#x\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPPortManager.mm", "-[IAPPortManager setInternalBatteryChargingState:]", 514, v5);
        }
      }
      IOServiceClose(connect);
    }
  }
}

- (BOOL)internalBatteryChargingState
{
  if (((unint64_t)&self->_service & 3) != 0) {
    __break(0x5516u);
  }
  else {
    LOBYTE(self) = IOAccessoryManagerGetBatteryPackMode() == 0;
  }
  return (char)self;
}

- (unsigned)ultraHighPowerModeCurrentLimit
{
  if (((unint64_t)&self->_service & 3) == 0) {
    return _IOAccessoryManagerPowerModeCurrentLimit(self->_service, 4);
  }
  __break(0x5516u);
  return _IOAccessoryManagerPowerModeCurrentLimit(self, a2);
}

- (unsigned)service
{
  return self->_service;
}

- (NSNumber)portNumber
{
  return self->_portNumber;
}

- (int)accessoryPowerState
{
  int result = self->_accessoryPowerState;
  if (result >= 4) {
    __break(0x550Au);
  }
  return result;
}

- (BOOL)sendReserveCurrentNotification
{
  unsigned int sendReserveCurrentNotification = self->_sendReserveCurrentNotification;
  if (sendReserveCurrentNotification >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = sendReserveCurrentNotification != 0;
  }
  return (char)self;
}

- (void)setSendReserveCurrentNotification:(BOOL)a3
{
  self->_unsigned int sendReserveCurrentNotification = a3;
}

@end