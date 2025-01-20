@interface AKPeripheralAvailabilityManager_iOS
+ (BOOL)onlyDrawWithApplePencil;
- (AKPeripheralAvailabilityManager_iOS)init;
- (unint64_t)currentAvailability;
- (void)dealloc;
- (void)postConnectionStatusNotification;
- (void)setCurrentAvailability:(unint64_t)a3;
- (void)startMonitoringForPeripheralConnection;
- (void)stopMonitoringForPeripheralConnection;
- (void)teardown;
@end

@implementation AKPeripheralAvailabilityManager_iOS

+ (BOOL)onlyDrawWithApplePencil
{
  return 0;
}

- (AKPeripheralAvailabilityManager_iOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKPeripheralAvailabilityManager_iOS;
  result = [(AKPeripheralAvailabilityManager_iOS *)&v3 init];
  if (result) {
    result->_currentAvailability = 0;
  }
  return result;
}

- (void)dealloc
{
  [(AKPeripheralAvailabilityManager_iOS *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)AKPeripheralAvailabilityManager_iOS;
  [(AKPeripheralAvailabilityManager_iOS *)&v3 dealloc];
}

- (void)teardown
{
}

- (void)postConnectionStatusNotification
{
  objc_super v3 = [MEMORY[0x263F08B88] mainThread];

  if (v3)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"AKPeripheralAvailabilityManagerAvailabilityNotification" object:self userInfo:0];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23764EA54;
    block[3] = &unk_264CDAE40;
    block[4] = self;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

- (void)startMonitoringForPeripheralConnection
{
  if (!self->stylusHidManager)
  {
    objc_super v3 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    self->stylusHidManager = v3;
    if (v3)
    {
      CFDictionaryRef matching = [MEMORY[0x263EFF9A0] dictionary];
      id v4 = [NSNumber numberWithUnsignedShort:76];
      v5 = [NSString stringWithUTF8String:"VendorID"];
      [(__CFDictionary *)matching setObject:v4 forKey:v5];

      v6 = [NSString stringWithUTF8String:"ProductIDArray"];
      [(__CFDictionary *)matching setObject:&unk_26EA75C68 forKey:v6];

      IOHIDManagerSetDeviceMatching(self->stylusHidManager, matching);
      IOHIDManagerOpen(self->stylusHidManager, 0);
      IOHIDManagerRegisterDeviceMatchingCallback(self->stylusHidManager, (IOHIDDeviceCallback)sub_23764EC4C, self);
      IOHIDManagerRegisterDeviceRemovalCallback(self->stylusHidManager, (IOHIDDeviceCallback)sub_23764ECC0, self);
      stylusHidManager = self->stylusHidManager;
      v8 = [MEMORY[0x263EFF9F0] mainRunLoop];
      v9 = (__CFRunLoop *)[v8 getCFRunLoop];
      IOHIDManagerScheduleWithRunLoop(stylusHidManager, v9, (CFStringRef)*MEMORY[0x263EFFE78]);
    }
  }
}

- (void)stopMonitoringForPeripheralConnection
{
  stylusHidManager = self->stylusHidManager;
  if (stylusHidManager)
  {
    CFRelease(stylusHidManager);
    self->stylusHidManager = 0;
  }
}

- (unint64_t)currentAvailability
{
  return self->_currentAvailability;
}

- (void)setCurrentAvailability:(unint64_t)a3
{
  self->_currentAvailability = a3;
}

@end