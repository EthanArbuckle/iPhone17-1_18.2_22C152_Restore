@interface HSHIDManager
- (BOOL)close:(id *)a3;
- (BOOL)open:(id *)a3;
- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4;
- (HSHIDManager)init;
- (HSHIDManager)initWithManagerRef:(__IOHIDManager *)a3;
- (id)deviceEnumeratedCallback;
- (id)deviceRemovedCallback;
- (id)devices;
- (id)valueForProperty:(__CFString *)a3;
- (void)dealloc;
- (void)enumerateDevicesMatching:(id)a3;
- (void)scheduleWithRunLoop:(__CFRunLoop *)a3 mode:(__CFString *)a4;
- (void)setDeviceEnumeratedCallback:(id)a3;
- (void)setDeviceRemovedCallback:(id)a3;
- (void)unscheduleFromRunLoop:(__CFRunLoop *)a3 mode:(__CFString *)a4;
@end

@implementation HSHIDManager

- (HSHIDManager)initWithManagerRef:(__IOHIDManager *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSHIDManager;
  result = [(HSHIDManager *)&v5 init];
  result->_managerRef = a3;
  *(_WORD *)&result->_active = 0;
  return result;
}

- (HSHIDManager)init
{
  IOHIDManagerRef v3 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);

  return [(HSHIDManager *)self initWithManagerRef:v3];
}

- (void)dealloc
{
  managerRef = self->_managerRef;
  if (managerRef) {
    CFRelease(managerRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)HSHIDManager;
  [(HSHIDManager *)&v4 dealloc];
}

- (void)enumerateDevicesMatching:(id)a3
{
  CFArrayRef v4 = (const __CFArray *)a3;
  CFArrayRef multiple = v4;
  if (!v4)
  {
    managerRef = self->_managerRef;
    CFDictionaryRef v7 = 0;
    goto LABEL_5;
  }
  uint64_t v5 = [(__CFArray *)v4 count];
  v6 = self->_managerRef;
  if (v5 == 1)
  {
    CFDictionaryRef v7 = (const __CFDictionary *)[(__CFArray *)multiple firstObject];
    managerRef = v6;
LABEL_5:
    IOHIDManagerSetDeviceMatching(managerRef, v7);
    goto LABEL_7;
  }
  IOHIDManagerSetDeviceMatchingMultiple(v6, multiple);
LABEL_7:
}

- (BOOL)open:(id *)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  IOReturn v4 = IOHIDManagerOpen(self->_managerRef, 0);
  IOReturn v5 = v4;
  if (a3 && v4)
  {
    v6 = [NSString stringWithFormat:@"Failed to open the IOHIDManager!"];
    CFDictionaryRef v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08350];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v6;
    v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = [v7 errorWithDomain:v8 code:v5 userInfo:v9];

    id v11 = v10;
    *a3 = v11;
  }
  return v5 == 0;
}

- (BOOL)close:(id *)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  IOReturn v4 = IOHIDManagerClose(self->_managerRef, 0);
  IOReturn v5 = v4;
  if (a3 && v4)
  {
    v6 = [NSString stringWithFormat:@"Failed to close the IOHIDManager!"];
    CFDictionaryRef v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08350];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v6;
    v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = [v7 errorWithDomain:v8 code:v5 userInfo:v9];

    id v11 = v10;
    *a3 = v11;
  }
  return v5 == 0;
}

- (id)devices
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFSetRef v2 = IOHIDManagerCopyDevices(self->_managerRef);
  IOHIDManagerRef v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[__CFSet count](v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CFSetRef v4 = v2;
  uint64_t v5 = [(__CFSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(const void **)(*((void *)&v14 + 1) + 8 * i);
        CFRetain(v9);
        v10 = [HSHIDDevice alloc];
        id v11 = -[HSHIDDevice initWithDeviceRef:](v10, "initWithDeviceRef:", v9, (void)v14);
        [v3 addObject:v11];
      }
      uint64_t v6 = [(__CFSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if (v4) {
    CFRelease(v4);
  }
  v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithSet:", v3, (void)v14);

  return v12;
}

- (id)valueForProperty:(__CFString *)a3
{
  return (id)IOHIDManagerGetProperty(self->_managerRef, a3);
}

- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4
{
  return IOHIDManagerSetProperty(self->_managerRef, a4, a3) != 0;
}

- (void)scheduleWithRunLoop:(__CFRunLoop *)a3 mode:(__CFString *)a4
{
  if (!self->_cancelled)
  {
    IOHIDManagerRegisterDeviceMatchingCallback(self->_managerRef, (IOHIDDeviceCallback)__managerDeviceMatchingCallback, self);
    IOHIDManagerRegisterDeviceRemovalCallback(self->_managerRef, (IOHIDDeviceCallback)__managerDeviceRemovalCallback, self);
  }
  managerRef = self->_managerRef;

  IOHIDManagerScheduleWithRunLoop(managerRef, a3, a4);
}

- (void)unscheduleFromRunLoop:(__CFRunLoop *)a3 mode:(__CFString *)a4
{
  self->_cancelled = 1;
}

- (id)deviceEnumeratedCallback
{
  return self->_deviceEnumeratedCallback;
}

- (void)setDeviceEnumeratedCallback:(id)a3
{
}

- (id)deviceRemovedCallback
{
  return self->_deviceRemovedCallback;
}

- (void)setDeviceRemovedCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceRemovedCallback, 0);

  objc_storeStrong(&self->_deviceEnumeratedCallback, 0);
}

@end