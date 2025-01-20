@interface DIPAmbientLightMonitor
- (DIPAmbientLightMonitor)init;
- (int)luxLevel;
- (void)dealloc;
- (void)handleEvent:(__IOHIDEvent *)a3;
- (void)init;
@end

@implementation DIPAmbientLightMonitor

- (DIPAmbientLightMonitor)init
{
  v15[2] = *MEMORY[0x1E4F143B8];
  self->_luxLevel = -1;
  v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  self->_client = v3;
  if (v3)
  {
    v14[0] = @"PrimaryUsagePage";
    v14[1] = @"PrimaryUsage";
    v15[0] = &unk_1F2F30228;
    v15[1] = &unk_1F2F30240;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    IOHIDEventSystemClientSetMatching();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreIDVShared.almQueue", 0);
    almQueue = self->_almQueue;
    self->_almQueue = v5;

    IOHIDEventSystemClientSetDispatchQueue();
    IOHIDEventSystemClientRegisterEventCallback();
    IOHIDEventSystemClientActivate();
    CFArrayRef v7 = IOHIDEventSystemClientCopyServices(self->_client);
    if (v7)
    {
      CFArrayRef v8 = v7;
      ValueAtIndex = CFArrayGetValueAtIndex(v7, 0);
      self->_service = (__IOHIDServiceClient *)CFRetain(ValueAtIndex);
      CFRelease(v8);
      uint64_t v10 = IOHIDServiceClientCopyEvent();
      if (v10)
      {
        v11 = (const void *)v10;
        [(DIPAmbientLightMonitor *)self handleEvent:v10];
        CFRelease(v11);
      }
    }
    v12 = self;
  }
  else
  {
    v4 = os_log_create("com.apple.CoreIDV", "DIPAmbientLightMonitor");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[DIPAmbientLightMonitor init](v4);
    }
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  if (self->_client)
  {
    IOHIDEventSystemClientCancel();
    CFRelease(self->_client);
  }
  service = self->_service;
  if (service) {
    CFRelease(service);
  }
  v4.receiver = self;
  v4.super_class = (Class)DIPAmbientLightMonitor;
  [(DIPAmbientLightMonitor *)&v4 dealloc];
}

- (void)handleEvent:(__IOHIDEvent *)a3
{
  if (a3)
  {
    if (IOHIDEventGetType() == 12) {
      self->_luxLevel = IOHIDEventGetIntegerValue();
    }
  }
}

- (int)luxLevel
{
  uint64_t v6 = 0;
  CFArrayRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  almQueue = self->_almQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__DIPAmbientLightMonitor_luxLevel__block_invoke;
  v5[3] = &unk_1E6A85C20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(almQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__DIPAmbientLightMonitor_luxLevel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 32);
  return result;
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7853000, log, OS_LOG_TYPE_ERROR, "Failed to create HID Client Monitor, returning nil", v1, 2u);
}

@end