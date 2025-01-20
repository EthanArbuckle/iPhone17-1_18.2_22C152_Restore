@interface HIDManager
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (HIDManager)init;
- (HIDManager)initWithOptions:(int64_t)a3;
- (NSArray)devices;
- (id)description;
- (id)propertyForKey:(id)a3;
- (void)activate;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)openWithOptions:(int64_t)a3;
- (void)setCancelHandler:(id)a3;
- (void)setDeviceMatching:(id)a3;
- (void)setDeviceNotificationHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInputElementHandler:(id)a3;
- (void)setInputElementMatching:(id)a3;
- (void)setInputReportHandler:(id)a3;
@end

@implementation HIDManager

- (HIDManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HIDManager;
  v2 = [(HIDManager *)&v6 init];
  if (v2
    && (IOHIDManagerRef v3 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0),
        v2->_manager = v3,
        v2->_handlerLock.ourl_lock._os_unfair_lock_opaque = 0,
        v2->_handlerLock.ourl_count = 0,
        v3))
  {
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (HIDManager)initWithOptions:(int64_t)a3
{
  IOOptionBits v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HIDManager;
  v4 = [(HIDManager *)&v8 init];
  if (v4
    && (IOHIDManagerRef v5 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3),
        v4->_manager = v5,
        v4->_handlerLock.ourl_lock._os_unfair_lock_opaque = 0,
        v4->_handlerLock.ourl_count = 0,
        v5))
  {
    objc_super v6 = v4;
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  manager = self->_manager;
  if (manager) {
    CFRelease(manager);
  }
  v4.receiver = self;
  v4.super_class = (Class)HIDManager;
  [(HIDManager *)&v4 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_manager];
}

- (NSArray)devices
{
  CFSetRef v2 = IOHIDManagerCopyDevices(self->_manager);
  IOOptionBits v3 = [(__CFSet *)v2 allObjects];

  return (NSArray *)v3;
}

- (id)propertyForKey:(id)a3
{
  return (id)IOHIDManagerGetProperty(self->_manager, (CFStringRef)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return IOHIDManagerSetProperty(self->_manager, (CFStringRef)a4, a3) != 0;
}

- (void)setInputElementMatching:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[HIDManager setInputElementMatching:](&v7, v8);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(__CFDictionary *)v6 count]) {
      CFDictionaryRef v4 = v6;
    }
    else {
      CFDictionaryRef v4 = 0;
    }
    IOHIDManagerSetInputValueMatching(self->_manager, v4);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(__CFDictionary *)v6 count]) {
        CFArrayRef v5 = v6;
      }
      else {
        CFArrayRef v5 = 0;
      }
      IOHIDManagerSetInputValueMatchingMultiple(self->_manager, v5);
    }
  }
}

- (void)setInputElementHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_elementHandler) {
    -[HIDManager setInputElementHandler:]();
  }
  CFDictionaryRef v4 = _Block_copy(aBlock);
  id elementHandler = self->_elementHandler;
  self->_id elementHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDManagerRegisterInputValueCallback(self->_manager, (IOHIDValueCallback)inputValueCallback, self);
}

- (void)setDeviceMatching:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[HIDManager setInputElementMatching:](&v7, v8);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(__CFDictionary *)v6 count]) {
      CFDictionaryRef v4 = v6;
    }
    else {
      CFDictionaryRef v4 = 0;
    }
    IOHIDManagerSetDeviceMatching(self->_manager, v4);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(__CFDictionary *)v6 count]) {
        CFArrayRef v5 = v6;
      }
      else {
        CFArrayRef v5 = 0;
      }
      IOHIDManagerSetDeviceMatchingMultiple(self->_manager, v5);
    }
  }
}

- (void)setDeviceNotificationHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_deviceNotificationHandler) {
    -[HIDManager setDeviceNotificationHandler:]();
  }
  CFDictionaryRef v4 = _Block_copy(aBlock);
  id deviceNotificationHandler = self->_deviceNotificationHandler;
  self->_id deviceNotificationHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDManagerRegisterDeviceMatchingCallback(self->_manager, (IOHIDDeviceCallback)deviceAddedCallback, self);
  IOHIDManagerRegisterDeviceRemovalCallback(self->_manager, (IOHIDDeviceCallback)deviceRemovedCallback, self);
}

- (void)setInputReportHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_inputReportHandler) {
    -[HIDManager setInputReportHandler:]();
  }
  CFDictionaryRef v4 = _Block_copy(aBlock);
  id inputReportHandler = self->_inputReportHandler;
  self->_id inputReportHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDManagerRegisterInputReportWithTimeStampCallback(self->_manager, (IOHIDReportWithTimeStampCallback)inputReportCallback, self);
}

- (void)setCancelHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_activated) {
    -[HIDManager setCancelHandler:]();
  }
  CFDictionaryRef v4 = _Block_copy(aBlock);
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)open
{
}

- (void)openWithOptions:(int64_t)a3
{
}

- (void)close
{
}

- (void)activate
{
  os_unfair_recursive_lock_lock_with_options();
  self->_activated = 1;
  os_unfair_recursive_lock_unlock();
  manager = self->_manager;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __22__HIDManager_activate__block_invoke;
  handler[3] = &unk_1E6C15630;
  handler[4] = self;
  IOHIDManagerSetCancelHandler(manager, handler);
  IOHIDManagerActivate(self->_manager);
}

void __22__HIDManager_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    CFDictionaryRef v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (void)cancel
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_inputReportHandler, 0);
  objc_storeStrong(&self->_deviceNotificationHandler, 0);
  objc_storeStrong(&self->_elementHandler, 0);
}

- (void)setInputElementMatching:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)setInputElementHandler:.cold.1()
{
}

- (void)setDeviceNotificationHandler:.cold.1()
{
}

- (void)setInputReportHandler:.cold.1()
{
}

- (void)setCancelHandler:.cold.1()
{
}

@end