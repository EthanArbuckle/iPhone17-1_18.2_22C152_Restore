@interface BKSAccelerometer
- (BKSAccelerometer)init;
- (BKSAccelerometerDelegate)delegate;
- (BOOL)accelerometerEventsEnabled;
- (BOOL)orientationEventsEnabled;
- (BOOL)passiveOrientationEvents;
- (double)updateInterval;
- (float)xThreshold;
- (float)yThreshold;
- (float)zThreshold;
- (id)_orientationEventsThread;
- (int64_t)currentDeviceOrientation;
- (void)_checkIn;
- (void)_checkOut;
- (void)_orientationDidChange;
- (void)_serverWasRestarted;
- (void)_updateOrientationServer;
- (void)dealloc;
- (void)setAccelerometerEventsEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setOrientationEventsEnabled:(BOOL)a3;
- (void)setPassiveOrientationEvents:(BOOL)a3;
- (void)setUpdateInterval:(double)a3;
- (void)setXThreshold:(float)a3;
- (void)setYThreshold:(float)a3;
- (void)setZThreshold:(float)a3;
@end

@implementation BKSAccelerometer

- (void)setOrientationEventsEnabled:(BOOL)a3
{
  if (self->_orientationEventsEnabled != a3)
  {
    BOOL v3 = a3;
    self->_orientationEventsEnabled = a3;
    [(BKSAccelerometer *)self _updateOrientationServer];
    if (v3)
    {
      v5 = [MEMORY[0x1E4F29060] currentThread];
      orientationEventsThread = self->_orientationEventsThread;
      self->_orientationEventsThread = v5;

      v7 = dispatch_get_global_queue(0, 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __48__BKSAccelerometer_setOrientationEventsEnabled___block_invoke;
      handler[3] = &unk_1E54410A0;
      handler[4] = self;
      notify_register_dispatch("com.apple.backboardd.rawOrientation", &self->_orientationNotificationsToken, v7, handler);
    }
    else
    {
      notify_cancel(self->_orientationNotificationsToken);
      v8 = self->_orientationEventsThread;
      self->_orientationEventsThread = 0;
    }
  }
}

- (void)_updateOrientationServer
{
  int v3 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  unsigned int orientationPort = self->_orientationPort;
  char orientationEventsEnabled = self->_orientationEventsEnabled;
  char passiveOrientationEvents = self->_passiveOrientationEvents;
  _BKSHIDSetOrientationClientEventsEnabled(v3, orientationPort, orientationEventsEnabled, passiveOrientationEvents);
}

- (void)setYThreshold:(float)a3
{
  if (self->_yThreshold != a3)
  {
    self->_yThreshold = a3;
    [(NSLock *)self->_lock lock];
    if (self->_accelerometerEventsSource) {
      [(BKSAccelerometer *)self _checkIn];
    }
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)setXThreshold:(float)a3
{
  if (self->_xThreshold != a3)
  {
    self->_xThreshold = a3;
    [(NSLock *)self->_lock lock];
    if (self->_accelerometerEventsSource) {
      [(BKSAccelerometer *)self _checkIn];
    }
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)setZThreshold:(float)a3
{
  if (self->_zThreshold != a3)
  {
    self->_zThreshold = a3;
    [(NSLock *)self->_lock lock];
    if (self->_accelerometerEventsSource) {
      [(BKSAccelerometer *)self _checkIn];
    }
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)setAccelerometerEventsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_lock lock];
  if ([(BKSAccelerometer *)self accelerometerEventsEnabled] != v3)
  {
    if (v3) {
      [(BKSAccelerometer *)self _checkIn];
    }
    else {
      [(BKSAccelerometer *)self _checkOut];
    }
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (BOOL)accelerometerEventsEnabled
{
  return self->_accelerometerEventsSource != 0;
}

- (void)_checkIn
{
  kern_return_t v6;
  __CFRunLoopSource *v7;
  __CFRunLoop *Current;
  int v9;
  __CFRunLoopSource *accelerometerEventsSource;
  mach_error_t v11;
  mach_error_t v12;
  NSObject *v13;
  char *v14;
  mach_error_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  CFRunLoopSourceContext name;

  name.perform = (void (__cdecl *)(void *))*MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__checkIn object:0];
  if (!self->_accelerometerEventsSource)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_serverWasRestarted, @"kBKSHIDServerDiedNotification", 0, (CFNotificationSuspensionBehavior)0);
    LODWORD(name.version) = 0;
    v5 = (unsigned int *)MEMORY[0x1E4F14960];
    v6 = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, (mach_port_name_t *)&name);
    if (v6)
    {
      v15 = v6;
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = objc_opt_class();
      [v16 handleFailureInMethod:a2, self, @"BKSAccelerometer.m", 139, @"%@ unable to allocate notification receive port: %s", v17, mach_error_string(v15) object file lineNumber description];
    }
    v19 = 2;
    MEMORY[0x18C123AF0](*v5, LODWORD(name.version), 1, &v19, 1);
    v7 = BKCreateMIGServerSourceWithContext((uint64_t)&_BKXXBKAccelerometer_subsystem, name.version, 0, (uint64_t)self);
    self->_accelerometerEventsSource = v7;
    if (!v7)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"BKSAccelerometer.m", 146, @"%@ unable to create run loop source", objc_opt_class() object file lineNumber description];
    }
    Current = CFRunLoopGetCurrent();
    self->_accelerometerEventsRunLoop = Current;
    CFRetain(Current);
    CFRunLoopAddSource(self->_accelerometerEventsRunLoop, self->_accelerometerEventsSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  }
  v9 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  accelerometerEventsSource = self->_accelerometerEventsSource;
  memset(&name.info, 0, 64);
  name.version = 1;
  CFRunLoopSourceGetContext(accelerometerEventsSource, &name);
  v11 = _BKSHIDSetAccelerometerClientEventsEnabled(v9, *(_DWORD *)name.info, 0, self->_updateInterval, self->_xThreshold, self->_yThreshold, self->_zThreshold);
  if (v11)
  {
    v12 = v11;
    if (v11 == 268435460)
    {
      v13 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
      [(BKSAccelerometer *)self performSelector:sel__checkIn withObject:0 afterDelay:v13 inModes:1.0];
    }
    else
    {
      v13 = BKLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = mach_error_string(v12);
        LODWORD(name.version) = 136446210;
        *(CFIndex *)((char *)&name.version + 4) = (CFIndex)v14;
        _os_log_error_impl(&dword_18AA0B000, v13, OS_LOG_TYPE_ERROR, "BKSetAccelerometerClientEventsEnabled failed: %{public}s", (uint8_t *)&name, 0xCu);
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setUpdateInterval:(double)a3
{
  if (self->_updateInterval != a3)
  {
    self->_updateInterval = a3;
    [(NSLock *)self->_lock lock];
    if (self->_accelerometerEventsSource) {
      [(BKSAccelerometer *)self _checkIn];
    }
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (int64_t)currentDeviceOrientation
{
  uint64_t state64 = 0;
  notify_get_state(self->_orientationCheckToken, &state64);
  return state64;
}

- (BKSAccelerometer)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)BKSAccelerometer;
  v2 = [(BKSAccelerometer *)&v9 init];
  if (v2)
  {
    BOOL v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v2->_lock;
    v2->_lock = v3;

    if (notify_register_check("com.apple.backboardd.rawOrientation", &v2->_orientationCheckToken))
    {
      v5 = BKLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        id v8 = v7;
        _os_log_error_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ unable to create notifyd token for device orientation", buf, 0xCu);
      }
    }
    v2->_char passiveOrientationEvents = 1;
    mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &v2->_orientationPort);
  }
  return v2;
}

- (void)setPassiveOrientationEvents:(BOOL)a3
{
  if (self->_passiveOrientationEvents != a3)
  {
    self->_char passiveOrientationEvents = a3;
    [(BKSAccelerometer *)self _updateOrientationServer];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationEventsThread, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)orientationEventsEnabled
{
  return self->_orientationEventsEnabled;
}

- (BOOL)passiveOrientationEvents
{
  return self->_passiveOrientationEvents;
}

- (float)zThreshold
{
  return self->_zThreshold;
}

- (float)yThreshold
{
  return self->_yThreshold;
}

- (float)xThreshold
{
  return self->_xThreshold;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (BKSAccelerometerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BKSAccelerometerDelegate *)WeakRetained;
}

- (void)_orientationDidChange
{
  id v3 = [(BKSAccelerometer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "accelerometer:didChangeDeviceOrientation:", self, -[BKSAccelerometer currentDeviceOrientation](self, "currentDeviceOrientation"));
  }
}

- (id)_orientationEventsThread
{
  return self->_orientationEventsThread;
}

uint64_t __48__BKSAccelerometer_setOrientationEventsEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:sel__orientationDidChange onThread:*(void *)(*(void *)(a1 + 32) + 56) withObject:0 waitUntilDone:0];
}

- (void)_serverWasRestarted
{
  [(NSLock *)self->_lock lock];
  if (self->_accelerometerEventsSource) {
    [(BKSAccelerometer *)self _checkIn];
  }
  if (self->_orientationEventsEnabled) {
    [(BKSAccelerometer *)self _updateOrientationServer];
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)_checkOut
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__checkIn object:0];
  if (self->_accelerometerEventsSource)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, @"kBKSHIDServerDiedNotification", 0);
    accelerometerEventsSource = self->_accelerometerEventsSource;
    memset(&context.info, 0, 64);
    context.version = 1;
    CFRunLoopSourceGetContext(accelerometerEventsSource, &context);
    mach_port_name_t v5 = *(_DWORD *)context.info;
    CFRunLoopSourceInvalidate(self->_accelerometerEventsSource);
    CFRelease(self->_accelerometerEventsSource);
    self->_accelerometerEventsSource = 0;
    CFRelease(self->_accelerometerEventsRunLoop);
    v6 = (ipc_space_t *)MEMORY[0x1E4F14960];
    self->_accelerometerEventsRunLoop = 0;
    ipc_space_t v7 = *v6;
    mach_port_mod_refs(v7, v5, 1u, -1);
  }
}

- (void)dealloc
{
  [(BKSAccelerometer *)self setAccelerometerEventsEnabled:0];
  [(BKSAccelerometer *)self setOrientationEventsEnabled:0];
  notify_cancel(self->_orientationCheckToken);
  mach_port_name_t orientationPort = self->_orientationPort;
  if (orientationPort + 1 >= 2) {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], orientationPort, 1u, -1);
  }
  v4.receiver = self;
  v4.super_class = (Class)BKSAccelerometer;
  [(BKSAccelerometer *)&v4 dealloc];
}

@end