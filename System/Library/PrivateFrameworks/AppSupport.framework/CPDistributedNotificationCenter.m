@interface CPDistributedNotificationCenter
+ (__CFDictionary)_serverPortToNotificationCenterMap;
+ (id)_serverPortToNotificationCenterMapDispatchQueue;
+ (id)centerForServerPort:(unsigned int)a3;
+ (id)centerNamed:(id)a3;
+ (void)setCenter:(id)a3 forServerPort:(unsigned int)a4;
- (BOOL)postNotificationName:(id)a3 userInfo:(id)a4 toBundleIdentifier:(id)a5;
- (id)_initWithServerName:(id)a3;
- (id)name;
- (void)_checkIn;
- (void)_checkOutAndRemoveSource;
- (void)_createReceiveSourceForRunLoop:(__CFRunLoop *)a3;
- (void)_notificationServerWasRestarted;
- (void)_receivedCheckIn:(unsigned int)a3 auditToken:(id *)a4;
- (void)dealloc;
- (void)deliverNotification:(id)a3 userInfo:(id)a4;
- (void)postNotificationName:(id)a3;
- (void)postNotificationName:(id)a3 userInfo:(id)a4;
- (void)runServer;
- (void)startDeliveringNotificationsToMainThread;
- (void)startDeliveringNotificationsToRunLoop:(__CFRunLoop *)a3;
- (void)stopDeliveringNotifications;
@end

@implementation CPDistributedNotificationCenter

+ (id)centerNamed:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ center name cannont be nil", a1 format];
  }
  pthread_mutex_lock(&centerNamed__instanceLock);
  id v5 = (id)centerNamed__centers;
  if (!centerNamed__centers)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    centerNamed__centers = (uint64_t)v5;
  }
  v6 = (void *)[v5 objectForKey:a3];
  if (!v6)
  {
    if ((unint64_t)[a3 lengthOfBytesUsingEncoding:4] >= 0x81)
    {
      pthread_mutex_unlock(&centerNamed__instanceLock);
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ center name cannont be longer than %i UTF8 bytes", a1, 128 format];
    }
    v6 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithServerName:a3];
    [(id)centerNamed__centers setObject:v6 forKey:a3];
  }
  pthread_mutex_unlock(&centerNamed__instanceLock);
  return v6;
}

+ (id)_serverPortToNotificationCenterMapDispatchQueue
{
  if (_serverPortToNotificationCenterMapDispatchQueue_onceToken != -1) {
    dispatch_once(&_serverPortToNotificationCenterMapDispatchQueue_onceToken, &__block_literal_global_3);
  }
  return (id)_serverPortToNotificationCenterMapDispatchQueue_queue;
}

dispatch_queue_t __82__CPDistributedNotificationCenter__serverPortToNotificationCenterMapDispatchQueue__block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("CPDistributedNotificationCenter server port to notification center queue", 0);
  _serverPortToNotificationCenterMapDispatchQueue_queue = (uint64_t)result;
  return result;
}

+ (__CFDictionary)_serverPortToNotificationCenterMap
{
  if (_serverPortToNotificationCenterMap_onceToken != -1) {
    dispatch_once(&_serverPortToNotificationCenterMap_onceToken, &__block_literal_global_17);
  }
  return (__CFDictionary *)_serverPortToNotificationCenterMap_map;
}

CFMutableDictionaryRef __69__CPDistributedNotificationCenter__serverPortToNotificationCenterMap__block_invoke()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, &sNoRetainDictionaryKeyCallbacks, &sNoRetainDictionaryValueCallbacks);
  _serverPortToNotificationCenterMap_map = (uint64_t)result;
  return result;
}

+ (void)setCenter:(id)a3 forServerPort:(unsigned int)a4
{
  v7 = [a1 _serverPortToNotificationCenterMapDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CPDistributedNotificationCenter_setCenter_forServerPort___block_invoke;
  block[3] = &unk_1E5668F80;
  unsigned int v9 = a4;
  block[4] = a1;
  block[5] = a3;
  dispatch_async(v7, block);
}

void __59__CPDistributedNotificationCenter_setCenter_forServerPort___block_invoke(uint64_t a1)
{
  v2 = (__CFDictionary *)[*(id *)(a1 + 32) _serverPortToNotificationCenterMap];
  if (v2)
  {
    v3 = (const void *)*(unsigned int *)(a1 + 48);
    v4 = *(const void **)(a1 + 40);
    CFDictionarySetValue(v2, v3, v4);
  }
}

+ (id)centerForServerPort:(unsigned int)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  id v5 = [a1 _serverPortToNotificationCenterMapDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CPDistributedNotificationCenter_centerForServerPort___block_invoke;
  block[3] = &unk_1E5668FA8;
  block[4] = a1;
  block[5] = &v10;
  unsigned int v9 = a3;
  dispatch_sync(v5, block);
  v6 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

CFDictionaryRef __55__CPDistributedNotificationCenter_centerForServerPort___block_invoke(uint64_t a1)
{
  CFDictionaryRef result = (const __CFDictionary *)[*(id *)(a1 + 32) _serverPortToNotificationCenterMap];
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, (const void *)*(unsigned int *)(a1 + 48));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)_initWithServerName:(id)a3
{
  v4 = [(CPDistributedNotificationCenter *)self init];
  if (v4)
  {
    v4->_centerName = (NSString *)[a3 copy];
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v4->_sendPorts = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }
  return v4;
}

- (void)dealloc
{
  [(CPDistributedNotificationCenter *)self _checkOutAndRemoveSource];

  CFRelease(self->_sendPorts);
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)CPDistributedNotificationCenter;
  [(CPDistributedNotificationCenter *)&v4 dealloc];
}

- (id)name
{
  return self->_centerName;
}

- (void)_createReceiveSourceForRunLoop:(__CFRunLoop *)a3
{
  kern_return_t v7;
  mach_error_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  mach_error_t v12;
  mach_error_t v13;
  uint64_t v14;
  char *v15;
  __CFRunLoopSource *v16;
  int v17;
  mach_port_name_t name;

  if (!self->_receiveNotificationSource)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_notificationServerWasRestarted, (CFStringRef)[@"CPDistributedNotificationCenterDidRestartNotification-" stringByAppendingString:self->_centerName], 0, (CFNotificationSuspensionBehavior)0);
    name = 0;
    v6 = (unsigned int *)MEMORY[0x1E4F14960];
    v7 = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name);
    if (v7)
    {
      v8 = v7;
      [(NSLock *)self->_lock unlock];
      unsigned int v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      v11 = objc_opt_class();
      [v9 raise:v10, @"%@ unable to allocate notification receive port: %s", v11, mach_error_string(v8) format];
    }
    v17 = 128;
    uint64_t v12 = MEMORY[0x192FBF4F0](*v6, name, 1, &v17, 1);
    if (v12)
    {
      v13 = v12;
      v14 = objc_opt_class();
      uint64_t v15 = mach_error_string(v13);
      NSLog((NSString *)@"Unable to increaase %@ notification receive queue depth: %s", v14, v15);
    }
    v16 = CPCreateMIGServerSourceWithContext((uint64_t)&_CPDNCPDistributedNotification_subsystem, name, 0, (uint64_t)self);
    self->_receiveNotificationSource = v16;
    CFRunLoopAddSource(a3, v16, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    if (CFRunLoopGetCurrent() != a3) {
      CFRunLoopWakeUp(a3);
    }
  }
}

- (void)_checkIn
{
  if (self->_receiveNotificationSource)
  {
    mach_port_t sp = 0;
    bootstrap_look_up(*MEMORY[0x1E4F14638], [(NSString *)self->_centerName UTF8String], &sp);
    mach_port_t v3 = sp;
    if (sp - 1 <= 0xFFFFFFFD)
    {
      int v4 = CPGetMachPortForMIGServerSource(self->_receiveNotificationSource);
      mach_error_t v5 = CPDNCheckIn(v3, v4);
      if (v5)
      {
        mach_error_t v6 = v5;
        uint64_t v7 = objc_opt_class();
        centerName = self->_centerName;
        unsigned int v9 = mach_error_string(v6);
        NSLog((NSString *)@"Unable to check into %@ notfication center '%@': %s", v7, centerName, v9);
      }
      mach_port_deallocate(*MEMORY[0x1E4F14960], sp);
    }
  }
}

- (void)_checkOutAndRemoveSource
{
  if (self->_receiveNotificationSource)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)[@"CPDistributedNotificationCenterDidRestartNotification-" stringByAppendingString:self->_centerName], 0);
    mach_port_name_t v4 = CPGetMachPortForMIGServerSource(self->_receiveNotificationSource);
    CFRunLoopSourceInvalidate(self->_receiveNotificationSource);
    CFRelease(self->_receiveNotificationSource);
    mach_error_t v5 = (ipc_space_t *)MEMORY[0x1E4F14960];
    self->_receiveNotificationSource = 0;
    ipc_space_t v6 = *v5;
    mach_port_mod_refs(v6, v4, 1u, -1);
  }
}

- (void)_notificationServerWasRestarted
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [(NSLock *)self->_lock lock];
  [(CPDistributedNotificationCenter *)self _checkIn];
  [(NSLock *)self->_lock unlock];
}

- (void)startDeliveringNotificationsToMainThread
{
  CFRunLoopRef Main = CFRunLoopGetMain();
  [(CPDistributedNotificationCenter *)self startDeliveringNotificationsToRunLoop:Main];
}

- (void)startDeliveringNotificationsToRunLoop:(__CFRunLoop *)a3
{
  [(NSLock *)self->_lock lock];
  ++self->_startCount;
  if (!self->_receiveNotificationSource)
  {
    [(CPDistributedNotificationCenter *)self _createReceiveSourceForRunLoop:a3];
    [(CPDistributedNotificationCenter *)self _checkIn];
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)stopDeliveringNotifications
{
  [(NSLock *)self->_lock lock];
  unint64_t startCount = self->_startCount;
  if (!startCount || (unint64_t v4 = startCount - 1, (self->_startCount = v4) == 0)) {
    [(CPDistributedNotificationCenter *)self _checkOutAndRemoveSource];
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)deliverNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:a3 object:self userInfo:a4];
}

- (void)runServer
{
  kern_return_t v5;
  ipc_space_t *v6;
  mach_error_t v7;
  mach_error_t v8;
  uint64_t v9;
  char *v10;
  NSObject *queue;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void handler[5];
  int v15;
  mach_port_t sp;

  [(NSLock *)self->_lock lock];
  id v3 = (void *)MEMORY[0x1E4F1C3C8];
  if (self->_isServer)
  {
    [(NSLock *)self->_lock unlock];
    [MEMORY[0x1E4F1CA00] raise:*v3, @"Already a %@ server for '%@'", objc_opt_class(), self->_centerName format];
  }
  unint64_t v4 = [(NSString *)self->_centerName UTF8String];
  mach_port_t sp = 0;
  mach_error_t v5 = bootstrap_check_in(*MEMORY[0x1E4F14638], v4, &sp);
  ipc_space_t v6 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (v5 && !mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &sp) && !mach_port_insert_right(*v6, sp, sp, 0x14u))
  {
    bootstrap_register2();
    mach_port_deallocate(*v6, sp);
  }
  if (sp - 1 > 0xFFFFFFFD)
  {
    [(NSLock *)self->_lock unlock];
    [MEMORY[0x1E4F1CA00] raise:*v3, @"%@ unable to register for '%@'", objc_opt_class(), self->_centerName format];
  }
  else
  {
    uint64_t v15 = 128;
    uint64_t v7 = MEMORY[0x192FBF4F0](*v6);
    if (v7)
    {
      v8 = v7;
      unsigned int v9 = objc_opt_class();
      uint64_t v10 = mach_error_string(v8);
      NSLog((NSString *)@"Unable to increaase %@ notification server queue depth: %s", v9, v10);
    }
    queue = self->_queue;
    if (queue) {
      dispatch_release(queue);
    }
    self->_queue = (OS_dispatch_queue *)dispatch_queue_create("CPDistributedNotificationCenter", 0);
    +[CPDistributedNotificationCenter setCenter:self forServerPort:sp];
    uint64_t v12 = dispatch_source_create(MEMORY[0x1E4F14458], sp, 0, (dispatch_queue_t)self->_queue);
    if (!v12)
    {
      dispatch_release((dispatch_object_t)self->_queue);
      self->_queue = 0;
      [(NSLock *)self->_lock unlock];
      [MEMORY[0x1E4F1CA00] raise:*v3, @"%@ unable to create server queue for '%@'", objc_opt_class(), self->_centerName format];
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__CPDistributedNotificationCenter_runServer__block_invoke;
    handler[3] = &unk_1E5668FD0;
    handler[4] = v12;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(v12);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)[@"CPDistributedNotificationCenterDidRestartNotification-" stringByAppendingString:self->_centerName], 0, 0, 0);
    self->_isServer = 1;
  }
  [(NSLock *)self->_lock unlock];
}

uint64_t __44__CPDistributedNotificationCenter_runServer__block_invoke(uint64_t a1)
{
  return MEMORY[0x1F40CBB78](*(void *)(a1 + 32), 40, CPDistributedNotificationCheckIn_server);
}

- (void)postNotificationName:(id)a3
{
}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
}

- (BOOL)postNotificationName:(id)a3 userInfo:(id)a4 toBundleIdentifier:(id)a5
{
  id v7 = a3;
  v33[1] = *MEMORY[0x1E4F143B8];
  v32 = self;
  if (self->_isServer)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Must be running %@ '%@' server to send post notifications", objc_opt_class(), v32->_centerName format];
    if (v7) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ message name cannont be nil", objc_opt_class() format];
LABEL_3:
  id v8 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v30 = v8;
  if (a4)
  {
    unsigned int v9 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      uint64_t v12 = objc_opt_class();
      [v10 raise:v11, @"Notification %@ userInfo is not an NSDictionary: %@ %@", v12, objc_opt_class(), a4 format];
    }
    v33[0] = 0;
    v13 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a4 format:200 options:0 error:v33];
    if (!v13)
    {

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ Unable to serialize userInfo: %@ error: %@", objc_opt_class(), a4, v33[0] format];
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = v32;
  [(NSLock *)v32->_lock lock];
  CFIndex Count = CFDictionaryGetCount(v32->_sendPorts);
  uint64_t v16 = Count;
  v17 = (const void **)((char *)&v29 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = (id *)v17;
  if ((unint64_t)(8 * Count) >= 0x200) {
    size_t v19 = 512;
  }
  else {
    size_t v19 = 8 * Count;
  }
  bzero((char *)&v29 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0), v19);
  CFDictionaryGetKeysAndValues(v14->_sendPorts, v17, v17);
  [(NSLock *)v14->_lock unlock];
  v20 = (const char *)[v7 UTF8String];
  int v21 = strlen(v20);
  if (v13)
  {
    uint64_t v22 = [v13 bytes];
    LODWORD(v13) = [v13 length];
  }
  else
  {
    uint64_t v22 = 0;
  }
  if (v16 < 1)
  {
    int v31 = 0;
  }
  else
  {
    int v31 = 0;
    do
    {
      if (!a5 || [*v18 isEqual:a5])
      {
        mach_error_t v23 = CPDNDeliverNotification(*(_DWORD *)v17, (vm_address_t)v20, v21, v22, (int)v13);
        if (v23 != -308)
        {
          if (v23)
          {
            if (v23 != 268435459)
            {
              id v24 = v7;
              centerName = v32->_centerName;
              v26 = mach_error_string(v23);
              v28 = centerName;
              id v7 = v24;
              NSLog((NSString *)@"Unable to deliver %@ notification to port %@: %s", v24, v28, v26);
            }
          }
          else
          {
            int v31 = 1;
          }
        }
      }
      ++v17;
      ++v18;
      --v16;
    }
    while (v16);
  }

  return v31 & 1;
}

- (void)_receivedCheckIn:(unsigned int)a3 auditToken:(id *)a4
{
  [(NSLock *)self->_lock lock];
  uintptr_t v8 = a3;
  if (CFDictionaryContainsKey(self->_sendPorts, (const void *)a3))
  {
    mach_port_deallocate(*MEMORY[0x1E4F14960], a3);
  }
  else
  {
    id v9 = CPCopyBundleIdentifierFromAuditToken((uint64_t)a4);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = (const void *)*MEMORY[0x1E4F1D260];
    }
    CFDictionarySetValue(self->_sendPorts, (const void *)v8, v10);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke;
    block[3] = &unk_1E5668FF8;
    block[4] = v9;
    block[5] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    global_queue = dispatch_get_global_queue(0, 0);
    uint64_t v12 = dispatch_source_create(MEMORY[0x1E4F14460], v8, 1uLL, global_queue);
    if (!v12) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CPDistributedNotificationCenter.m", 502, @"unable to monitor server port for invalidation");
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_2;
    handler[3] = &unk_1E5668FD0;
    handler[4] = v12;
    dispatch_source_set_event_handler(v12, handler);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_3;
    v13[3] = &unk_1E5669020;
    v13[4] = v12;
    v13[5] = self;
    v13[7] = a2;
    v13[8] = v8;
    v13[6] = v9;
    dispatch_source_set_cancel_handler(v12, v13);
    dispatch_resume(v12);
  }
  [(NSLock *)self->_lock unlock];
}

void __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke(uint64_t a1)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (*(void *)(a1 + 32)) {
    id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", *(void *)(a1 + 32), @"CPBundleIdentifier", 0);
  }
  else {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  id v3 = v2;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"CPDistributedNotificationCenterClientDidStartListeningNotification", *(void *)(a1 + 40), v2);
}

void __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_2(uint64_t a1)
{
}

void __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_3(uint64_t a1)
{
  mach_port_name_t handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  if (mach_port_deallocate(*MEMORY[0x1E4F14960], handle)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 40), @"CPDistributedNotificationCenter.m", 512, @"failed to deallocate dead name");
  }
  [*(id *)(*(void *)(a1 + 40) + 16) lock];
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 40) + 40), *(const void **)(a1 + 64));
  [*(id *)(*(void *)(a1 + 40) + 16) unlock];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_4;
  v3[3] = &unk_1E5668FF8;
  int8x16_t v4 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_4(uint64_t a1)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (*(void *)(a1 + 32)) {
    id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", *(void *)(a1 + 32), @"CPBundleIdentifier", 0);
  }
  else {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  id v3 = v2;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"CPDistributedNotificationCenterClientDidStopListeningNotification", *(void *)(a1 + 40), v2);
}

@end