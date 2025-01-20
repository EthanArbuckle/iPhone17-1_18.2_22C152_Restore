@interface AXDeviceMonitor
+ (id)bluetoothKeyboardDevices;
- (AXDeviceMonitor)initWithMatchingDictionary:(id)a3 callbackRunLoop:(id)a4;
- (AXDeviceMonitor)initWithMatchingMultiple:(id)a3 callbackRunLoop:(id)a4;
- (AXDeviceMonitorDelegate)delegate;
- (id)_existingDevicesForDevice:(__IOHIDDevice *)a3;
- (id)copyDevices;
- (void)_commonInitWithRunLoop:(id)a3;
- (void)begin;
- (void)dealloc;
- (void)didAddDevice:(__IOHIDDevice *)a3;
- (void)didRemoveDevice:(__IOHIDDevice *)a3;
- (void)informDelegate;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation AXDeviceMonitor

- (AXDeviceMonitor)initWithMatchingDictionary:(id)a3 callbackRunLoop:(id)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXDeviceMonitor;
  v8 = [(AXDeviceMonitor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AXDeviceMonitor *)v8 _commonInitWithRunLoop:v7];
    IOHIDManagerSetDeviceMatching(v9->_hidManager, v6);
  }

  return v9;
}

- (AXDeviceMonitor)initWithMatchingMultiple:(id)a3 callbackRunLoop:(id)a4
{
  CFArrayRef v6 = (const __CFArray *)a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXDeviceMonitor;
  v8 = [(AXDeviceMonitor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AXDeviceMonitor *)v8 _commonInitWithRunLoop:v7];
    IOHIDManagerSetDeviceMatchingMultiple(v9->_hidManager, v6);
  }

  return v9;
}

- (void)_commonInitWithRunLoop:(id)a3
{
  objc_storeStrong((id *)&self->_targetRunLoop, a3);
  id v5 = a3;
  self->_hidManager = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFArrayRef v6 = [MEMORY[0x1E4F1CA80] set];
  devices = self->_devices;
  self->_devices = v6;

  self->_devicesLock._os_unfair_lock_opaque = 0;
  IOHIDManagerRegisterDeviceMatchingCallback(self->_hidManager, (IOHIDDeviceCallback)deviceMatchingCallback, self);
  IOHIDManagerRegisterDeviceRemovalCallback(self->_hidManager, (IOHIDDeviceCallback)deviceRemovalCallback, self);

  self->_state = 0;
}

- (void)dealloc
{
  if (self->_state == 1) {
    _AXAssert();
  }
  CFRelease(self->_hidManager);
  v3.receiver = self;
  v3.super_class = (Class)AXDeviceMonitor;
  [(AXDeviceMonitor *)&v3 dealloc];
}

- (id)copyDevices
{
  if (self->_state != 1) {
    _AXAssert();
  }
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  v4 = (void *)[(NSMutableSet *)self->_devices copy];
  os_unfair_lock_unlock(p_devicesLock);
  return v4;
}

- (void)begin
{
  if (self->_state)
  {
    unint64_t state = self->_state;
    _AXAssert();
  }
  self->_unint64_t state = 1;
  hidManager = self->_hidManager;
  v4 = [(NSRunLoop *)self->_targetRunLoop getCFRunLoop];
  IOHIDManagerScheduleWithRunLoop(hidManager, v4, (CFStringRef)*MEMORY[0x1E4F1D418]);
  id v5 = self->_hidManager;

  IOHIDManagerOpen(v5, 0);
}

- (void)invalidate
{
  if (self->_state != 1)
  {
    unint64_t state = self->_state;
    _AXAssert();
  }
  self->_unint64_t state = 2;
  hidManager = self->_hidManager;
  v4 = [(NSRunLoop *)self->_targetRunLoop getCFRunLoop];
  IOHIDManagerUnscheduleFromRunLoop(hidManager, v4, (CFStringRef)*MEMORY[0x1E4F1D418]);
  id v5 = self->_hidManager;

  IOHIDManagerClose(v5, 0);
}

- (void)didAddDevice:(__IOHIDDevice *)a3
{
  -[AXDeviceMonitor _existingDevicesForDevice:](self, "_existingDevicesForDevice:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (![v5 count])
  {
    os_unfair_lock_lock(&self->_devicesLock);
    [(NSMutableSet *)self->_devices addObject:a3];
    os_unfair_lock_unlock(&self->_devicesLock);
    [(AXDeviceMonitor *)self informDelegate];
  }
}

- (void)didRemoveDevice:(__IOHIDDevice *)a3
{
  id v4 = [(AXDeviceMonitor *)self _existingDevicesForDevice:a3];
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_devicesLock);
    [(NSMutableSet *)self->_devices minusSet:v4];
    os_unfair_lock_unlock(&self->_devicesLock);
    [(AXDeviceMonitor *)self informDelegate];
  }
}

- (id)_existingDevicesForDevice:(__IOHIDDevice *)a3
{
  id v5 = IOHIDDeviceGetProperty(a3, @"UniqueID");
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  devices = self->_devices;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__AXDeviceMonitor__existingDevicesForDevice___block_invoke;
  v11[3] = &unk_1E5587518;
  id v12 = v5;
  v13 = a3;
  id v8 = v5;
  v9 = [(NSMutableSet *)devices objectsPassingTest:v11];
  os_unfair_lock_unlock(p_devicesLock);

  return v9;
}

BOOL __45__AXDeviceMonitor__existingDevicesForDevice___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = a2;
  id v4 = IOHIDDeviceGetProperty(v3, @"UniqueID");
  BOOL v5 = ([*(id *)(a1 + 32) isEqual:v4] & 1) != 0 || *(void *)(a1 + 40) == (void)v3;

  return v5;
}

- (void)informDelegate
{
  id v3 = [(AXDeviceMonitor *)self delegate];
  [v3 deviceMonitorDidDetectDeviceEvent:self];
}

+ (id)bluetoothKeyboardDevices
{
  v2 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  IOHIDManagerSetDeviceMatching(v2, (CFDictionaryRef)&unk_1EDC633F8);
  IOHIDManagerOpen(v2, 0);
  CFSetRef v3 = IOHIDManagerCopyDevices(v2);
  IOHIDManagerClose(v2, 0);
  CFRelease(v2);

  return v3;
}

- (AXDeviceMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXDeviceMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_devices, 0);

  objc_storeStrong((id *)&self->_targetRunLoop, 0);
}

@end