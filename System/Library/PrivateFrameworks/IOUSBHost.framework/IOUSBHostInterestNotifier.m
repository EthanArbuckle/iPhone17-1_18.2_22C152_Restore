@interface IOUSBHostInterestNotifier
- (BOOL)destroyed;
- (IONotificationPort)notificationPortRef;
- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 callback:(void *)a4;
- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 matchingDictionary:(id)a4 callback:(void *)a5;
- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 service:(unsigned int)a4 callback:(void *)a5;
- (NSObject)owner;
- (NSRecursiveLock)lock;
- (OS_dispatch_queue)queue;
- (unsigned)matchingIterator;
- (unsigned)notifier;
- (unsigned)service;
- (void)callback;
- (void)dealloc;
- (void)destroy;
- (void)setCallback:(void *)a3;
- (void)setDestroyed:(BOOL)a3;
- (void)setLock:(id)a3;
- (void)setMatchingIterator:(unsigned int)a3;
- (void)setNotificationPortRef:(IONotificationPort *)a3;
- (void)setNotifier:(unsigned int)a3;
- (void)setOwner:(id)a3;
- (void)setQueue:(id)a3;
- (void)setService:(unsigned int)a3;
@end

@implementation IOUSBHostInterestNotifier

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 callback:(void *)a4
{
  v43.receiver = self;
  v43.super_class = (Class)IOUSBHostInterestNotifier;
  id v5 = a3;
  v6 = [(IOUSBHostInterestNotifier *)&v43 init];
  [(IOUSBHostInterestNotifier *)v6 setDestroyed:0];
  [(IOUSBHostInterestNotifier *)v6 setOwner:v5];

  [(IOUSBHostInterestNotifier *)v6 setCallback:a4];
  id v7 = objc_alloc_init(MEMORY[0x263F08AE0]);
  [(IOUSBHostInterestNotifier *)v6 setLock:v7];

  v8 = [(IOUSBHostInterestNotifier *)v6 lock];

  if (!v8)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      -[IOUSBHostInterestNotifier initWithOwner:callback:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_11;
  }
  v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  id v12 = [v9 stringWithFormat:@"%@.%@", @"com.apple.iokit.usb.framework.IOUSBHost", v11, v43.receiver, v43.super_class];
  dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
  [(IOUSBHostInterestNotifier *)v6 setQueue:v13];

  v14 = [(IOUSBHostInterestNotifier *)v6 queue];

  if (!v14)
  {
    BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v26) {
      -[IOUSBHostInterestNotifier initWithOwner:callback:](v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_11;
  }
  [(IOUSBHostInterestNotifier *)v6 setNotificationPortRef:IONotificationPortCreate(*MEMORY[0x263F0EC88])];
  if (![(IOUSBHostInterestNotifier *)v6 notificationPortRef])
  {
    BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v34) {
      -[IOUSBHostInterestNotifier initWithOwner:callback:](v34, v35, v36, v37, v38, v39, v40, v41);
    }
LABEL_11:
    [(IOUSBHostInterestNotifier *)v6 destroy];
    v17 = 0;
    goto LABEL_12;
  }
  v15 = [(IOUSBHostInterestNotifier *)v6 notificationPortRef];
  v16 = [(IOUSBHostInterestNotifier *)v6 queue];
  IONotificationPortSetDispatchQueue(v15, v16);

  v17 = v6;
LABEL_12:

  return v17;
}

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 service:(unsigned int)a4 callback:(void *)a5
{
  uint64_t v5 = *(void *)&a4;
  v6 = [(IOUSBHostInterestNotifier *)self initWithOwner:a3 callback:a5];
  id v7 = v6;
  if (!v5)
  {
LABEL_6:
    [(IOUSBHostInterestNotifier *)v7 destroy];
    v8 = 0;
    goto LABEL_7;
  }
  [(IOUSBHostInterestNotifier *)v6 setService:v5];
  if (![(IOUSBHostInterestNotifier *)v7 notifier])
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9) {
      -[IOUSBHostInterestNotifier initWithOwner:service:callback:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_6;
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 matchingDictionary:(id)a4 callback:(void *)a5
{
  id v8 = a4;
  BOOL v9 = [(IOUSBHostInterestNotifier *)self initWithOwner:a3 callback:a5];
  uint64_t v10 = [(IOUSBHostInterestNotifier *)v9 notificationPortRef];
  CFDictionaryRef v11 = (const __CFDictionary *)v8;
  IOServiceAddMatchingNotification(v10, "IOServiceFirstMatch", v11, (IOServiceMatchingCallback)_internalMatchingCallback, v9, &v9->_matchingIterator);
  if ([(IOUSBHostInterestNotifier *)v9 matchingIterator])
  {
    uint64_t v12 = IOIteratorNext([(IOUSBHostInterestNotifier *)v9 matchingIterator]);
    if (v12)
    {
      [(IOUSBHostInterestNotifier *)v9 setService:v12];
      IOObjectRelease([(IOUSBHostInterestNotifier *)v9 matchingIterator]);
      [(IOUSBHostInterestNotifier *)v9 setMatchingIterator:0];
    }
    uint64_t v13 = v9;
  }
  else
  {
    BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v14) {
      -[IOUSBHostInterestNotifier initWithOwner:matchingDictionary:callback:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    [(IOUSBHostInterestNotifier *)v9 destroy];
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  [(IOUSBHostInterestNotifier *)self destroy];
  v3.receiver = self;
  v3.super_class = (Class)IOUSBHostInterestNotifier;
  [(IOUSBHostInterestNotifier *)&v3 dealloc];
}

- (void)destroy
{
  objc_super v3 = [(IOUSBHostInterestNotifier *)self lock];

  if (v3)
  {
    v4 = [(IOUSBHostInterestNotifier *)self lock];
    [v4 lock];

    if (![(IOUSBHostInterestNotifier *)self destroyed])
    {
      [(IOUSBHostInterestNotifier *)self setDestroyed:1];
      if ([(IOUSBHostInterestNotifier *)self service]) {
        [(IOUSBHostInterestNotifier *)self setService:0];
      }
      if ([(IOUSBHostInterestNotifier *)self notificationPortRef])
      {
        IONotificationPortDestroy([(IOUSBHostInterestNotifier *)self notificationPortRef]);
        [(IOUSBHostInterestNotifier *)self setNotificationPortRef:0];
      }
      uint64_t v5 = [(IOUSBHostInterestNotifier *)self queue];

      if (v5)
      {
        uint64_t v10 = 0;
        CFDictionaryRef v11 = &v10;
        uint64_t v12 = 0x3032000000;
        uint64_t v13 = __Block_byref_object_copy__0;
        BOOL v14 = __Block_byref_object_dispose__0;
        uint64_t v15 = (IOUSBHostInterestNotifier *)0xAAAAAAAAAAAAAAAALL;
        v6 = self;
        uint64_t v15 = v6;
        id v7 = [(id)v11[5] queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __36__IOUSBHostInterestNotifier_destroy__block_invoke;
        block[3] = &unk_264822400;
        block[4] = &v10;
        dispatch_async(v7, block);

        [(IOUSBHostInterestNotifier *)v6 setQueue:0];
        _Block_object_dispose(&v10, 8);
      }
    }
    id v8 = [(IOUSBHostInterestNotifier *)self lock];
    [v8 unlock];
  }
  else
  {
    [(IOUSBHostInterestNotifier *)self setDestroyed:1];
  }
}

void __36__IOUSBHostInterestNotifier_destroy__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) matchingIterator]) {
    IOObjectRelease([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) matchingIterator]);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setMatchingIterator:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setService:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)setService:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(IOUSBHostInterestNotifier *)self lock];
  [v5 lock];

  if ([(IOUSBHostInterestNotifier *)self notifier])
  {
    IOObjectRelease([(IOUSBHostInterestNotifier *)self notifier]);
    [(IOUSBHostInterestNotifier *)self setNotifier:0];
  }
  if ([(IOUSBHostInterestNotifier *)self service]) {
    IOObjectRelease([(IOUSBHostInterestNotifier *)self service]);
  }
  self->_service = a3;
  if ([(IOUSBHostInterestNotifier *)self service]
    && ![(IOUSBHostInterestNotifier *)self destroyed])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      v15[0] = 67109120;
      v15[1] = a3;
      _os_log_impl(&dword_227999000, &_os_log_internal, OS_LOG_TYPE_INFO, "IOUSBHostInterfaceNotifier: adding interest for %d\n", (uint8_t *)v15, 8u);
    }
    IOObjectRetain([(IOUSBHostInterestNotifier *)self service]);
    IOServiceAddInterestNotification([(IOUSBHostInterestNotifier *)self notificationPortRef], [(IOUSBHostInterestNotifier *)self service], "IOGeneralInterest", (IOServiceInterestCallback)_internalInterestCallback_0, self, &self->_notifier);
    if (![(IOUSBHostInterestNotifier *)self notifier])
    {
      BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v6) {
        -[IOUSBHostInterestNotifier setService:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  BOOL v14 = [(IOUSBHostInterestNotifier *)self lock];
  [v14 unlock];
}

- (NSObject)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (void)setDestroyed:(BOOL)a3
{
  self->_destroyed = a3;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IONotificationPort)notificationPortRef
{
  return self->_notificationPortRef;
}

- (void)setNotificationPortRef:(IONotificationPort *)a3
{
  self->_notificationPortRef = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (unsigned)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(unsigned int)a3
{
  self->_notifier = a3;
}

- (unsigned)matchingIterator
{
  return self->_matchingIterator;
}

- (void)setMatchingIterator:(unsigned int)a3
{
  self->_matchingIterator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_owner);
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithOwner:(uint64_t)a3 service:(uint64_t)a4 callback:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithOwner:(uint64_t)a3 matchingDictionary:(uint64_t)a4 callback:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setService:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end