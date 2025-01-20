@interface CPDistributedMessagingCenter
+ (id)_centerNamed:(id)a3 requireLookupByPID:(BOOL)a4;
+ (id)centerNamed:(id)a3;
+ (id)pidRestrictedCenterNamed:(id)a3;
- (BOOL)_isTaskEntitled:(id *)a3;
- (BOOL)_sendMessage:(id)a3 userInfo:(id)a4 receiveReply:(id *)a5 error:(id *)a6 toTarget:(id)a7 selector:(SEL)a8 context:(void *)a9;
- (BOOL)_sendMessage:(id)a3 userInfo:(id)a4 receiveReply:(id *)a5 error:(id *)a6 toTarget:(id)a7 selector:(SEL)a8 context:(void *)a9 nonBlocking:(BOOL)a10;
- (BOOL)_sendMessage:(id)a3 userInfoData:(id)a4 oolKey:(id)a5 oolData:(id)a6 makeServer:(BOOL)a7 receiveReply:(id *)a8 nonBlocking:(BOOL)a9 error:(id *)a10;
- (BOOL)doesServerExist;
- (BOOL)sendMessageName:(id)a3 userInfo:(id)a4;
- (BOOL)sendNonBlockingMessageName:(id)a3 userInfo:(id)a4;
- (id)_initAnonymousServer;
- (id)_initClientWithPort:(unsigned int)a3;
- (id)_initWithServerName:(id)a3;
- (id)_initWithServerName:(id)a3 requireLookupByPID:(BOOL)a4;
- (id)_requiredEntitlement;
- (id)delayReply;
- (id)name;
- (id)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4;
- (id)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (unsigned)_sendPort;
- (unsigned)_serverPort;
- (void)_dispatchMessageNamed:(id)a3 userInfo:(id)a4 reply:(id *)a5 auditToken:(id *)a6;
- (void)_sendReplyMessage:(id)a3 portPassing:(BOOL)a4 onMachPort:(unsigned int)a5;
- (void)_setSendPort:(unsigned int)a3;
- (void)_setupInvalidationSource;
- (void)dealloc;
- (void)registerForMessageName:(id)a3 target:(id)a4 selector:(SEL)a5;
- (void)runServerOnCurrentThread;
- (void)runServerOnCurrentThreadProtectedByEntitlement:(id)a3;
- (void)sendDelayedReply:(id)a3 dictionary:(id)a4;
- (void)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4 toTarget:(id)a5 selector:(SEL)a6 context:(void *)a7;
- (void)setTargetPID:(int)a3;
- (void)stopServer;
- (void)unregisterForMessageName:(id)a3;
@end

@implementation CPDistributedMessagingCenter

+ (id)centerNamed:(id)a3
{
  return (id)[a1 _centerNamed:a3 requireLookupByPID:0];
}

+ (id)pidRestrictedCenterNamed:(id)a3
{
  return (id)[a1 _centerNamed:a3 requireLookupByPID:1];
}

+ (id)_centerNamed:(id)a3 requireLookupByPID:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ center name cannont be nil", a1 format];
  }
  pthread_mutex_lock(&_centerNamed_requireLookupByPID__instanceLock);
  id v7 = (id)_centerNamed_requireLookupByPID__centers;
  if (!_centerNamed_requireLookupByPID__centers)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    _centerNamed_requireLookupByPID__centers = (uint64_t)v7;
  }
  v8 = (void *)[v7 objectForKey:a3];
  if (!v8)
  {
    if ((unint64_t)[a3 lengthOfBytesUsingEncoding:4] >= 0x81)
    {
      pthread_mutex_unlock(&_centerNamed_requireLookupByPID__instanceLock);
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ center name cannot be longer than %i UTF8 bytes", a1, 128 format];
    }
    v8 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithServerName:a3 requireLookupByPID:v4];
    [(id)_centerNamed_requireLookupByPID__centers setObject:v8 forKey:a3];
  }
  pthread_mutex_unlock(&_centerNamed_requireLookupByPID__instanceLock);
  return v8;
}

- (id)_initWithServerName:(id)a3 requireLookupByPID:(BOOL)a4
{
  v6 = [(CPDistributedMessagingCenter *)self init];
  if (v6)
  {
    v6->_centerName = (NSString *)[a3 copy];
    v6->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v6->_requireLookupByPID = a4;
  }
  return v6;
}

- (id)_initWithServerName:(id)a3
{
  return [(CPDistributedMessagingCenter *)self _initWithServerName:a3 requireLookupByPID:0];
}

- (id)_initAnonymousServer
{
  v2 = [(CPDistributedMessagingCenter *)self _initWithServerName:0];
  if (v2)
  {
    uint64_t v3 = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, v2 + 16);
    if (v3) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ unable to create anonymous server port. Error code: %d", objc_opt_class(), v3 format];
    }
  }
  return v2;
}

- (id)_initClientWithPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CPDistributedMessagingCenter *)self _initWithServerName:0];
  v5 = v4;
  if (v4) {
    [v4 _setSendPort:v3];
  }
  return v5;
}

- (void)dealloc
{
  serverSource = self->_serverSource;
  if (serverSource)
  {
    mach_port_name_t v4 = CPGetMachPortForMIGServerSource(serverSource);
    CFRunLoopSourceInvalidate(self->_serverSource);
    CFRelease(self->_serverSource);
    if (v4 - 1 <= 0xFFFFFFFD) {
      mach_port_mod_refs(*MEMORY[0x1E4F14960], v4, 1u, -1);
    }
  }
  mach_port_name_t sendPort = self->_sendPort;
  if (sendPort + 1 >= 2) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], sendPort);
  }
  mach_port_name_t parkedServerPort = self->_parkedServerPort;
  if (parkedServerPort + 1 >= 2) {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], parkedServerPort, 1u, -1);
  }

  v7.receiver = self;
  v7.super_class = (Class)CPDistributedMessagingCenter;
  [(CPDistributedMessagingCenter *)&v7 dealloc];
}

- (id)name
{
  return self->_centerName;
}

- (void)setTargetPID:(int)a3
{
  self->_targetPID = a3;
}

- (void)_setupInvalidationSource
{
  uintptr_t sendPort = self->_sendPort;
  if ((sendPort + 1) >= 2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = dispatch_source_create(MEMORY[0x1E4F14460], sendPort, 1uLL, global_queue);
    if (!v6) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CPDistributedMessagingCenter.m", 316, @"unable to monitor server port for invalidation");
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke;
    handler[3] = &unk_1E5668FD0;
    handler[4] = v6;
    dispatch_source_set_event_handler(v6, handler);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke_2;
    v7[3] = &unk_1E5669058;
    v7[4] = v6;
    v7[5] = self;
    v7[6] = a2;
    dispatch_source_set_cancel_handler(v6, v7);
    dispatch_resume(v6);
  }
}

void __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke(uint64_t a1)
{
}

void __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke_2(uint64_t a1)
{
  uintptr_t handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 16) lock];
  uint64_t v3 = *(void *)(a1 + 40);
  if (handle == *(_DWORD *)(v3 + 24))
  {
    *(_DWORD *)(v3 + 24) = 0;
    uint64_t v3 = *(void *)(a1 + 40);
  }
  [*(id *)(v3 + 16) unlock];
  if (mach_port_deallocate(*MEMORY[0x1E4F14960], handle)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 40), @"CPDistributedMessagingCenter.m", 339, @"failed to deallocate dead name");
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke_3;
  block[3] = &unk_1E5668FD0;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"CPDistributedMessagingCenterServerDidTerminateNotification", *(void *)(a1 + 32));
}

- (unsigned)_sendPort
{
  [(NSLock *)self->_lock lock];
  mach_port_type_t ptype = 0;
  if (self->_centerName)
  {
    mach_port_name_t sendPort = self->_sendPort;
    if (sendPort + 1 < 2 || mach_port_type(*MEMORY[0x1E4F14960], sendPort, &ptype) || (ptype & 0x100000) != 0)
    {
      self->_mach_port_name_t sendPort = 0;
      BOOL requireLookupByPID = self->_requireLookupByPID;
      mach_port_t v5 = *MEMORY[0x1E4F14638];
      v6 = [(NSString *)self->_centerName UTF8String];
      if (requireLookupByPID)
      {
        uint64_t v7 = bootstrap_look_up2();
        if (v7)
        {
          NSLog((NSString *)@"Failed looking up per pid service %d for name %@", v7, self->_centerName);
          self->_mach_port_name_t sendPort = 0;
        }
      }
      else
      {
        bootstrap_look_up(v5, v6, &self->_sendPort);
      }
      [(CPDistributedMessagingCenter *)self _setupInvalidationSource];
    }
  }
  unsigned int v8 = self->_sendPort;
  [(NSLock *)self->_lock unlock];
  return v8;
}

- (void)_setSendPort:(unsigned int)a3
{
  [(NSLock *)self->_lock lock];
  if (self->_sendPort - 1 <= 0xFFFFFFFD) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CPDistributedMessagingCenter.m", 385, @"%@ already has a send port allocated.", objc_opt_class());
  }
  self->_mach_port_name_t sendPort = a3;
  [(CPDistributedMessagingCenter *)self _setupInvalidationSource];
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (BOOL)sendMessageName:(id)a3 userInfo:(id)a4
{
  return [(CPDistributedMessagingCenter *)self _sendMessage:a3 userInfo:a4 receiveReply:0 error:0 toTarget:0 selector:0 context:0];
}

- (BOOL)sendNonBlockingMessageName:(id)a3 userInfo:(id)a4
{
  LOBYTE(v5) = 1;
  return [(CPDistributedMessagingCenter *)self _sendMessage:a3 userInfo:a4 receiveReply:0 error:0 toTarget:0 selector:0 context:0 nonBlocking:v5];
}

- (id)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4
{
  uint64_t v5 = 0;
  [(CPDistributedMessagingCenter *)self _sendMessage:a3 userInfo:a4 receiveReply:&v5 error:0 toTarget:0 selector:0 context:0];
  return v5;
}

- (id)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  v6 = 0;
  [(CPDistributedMessagingCenter *)self _sendMessage:a3 userInfo:a4 receiveReply:&v6 error:a5 toTarget:0 selector:0 context:0];
  return v6;
}

- (void)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4 toTarget:(id)a5 selector:(SEL)a6 context:(void *)a7
{
  if (!a5)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ target cannont be nil", objc_opt_class() format];
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ selector cannont be nil", objc_opt_class() format];
    goto LABEL_3;
  }
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  [(CPDistributedMessagingCenter *)self _sendMessage:a3 userInfo:a4 receiveReply:0 error:0 toTarget:a5 selector:a6 context:a7];
}

- (BOOL)_sendMessage:(id)a3 userInfo:(id)a4 receiveReply:(id *)a5 error:(id *)a6 toTarget:(id)a7 selector:(SEL)a8 context:(void *)a9
{
  LOBYTE(v10) = 0;
  return [(CPDistributedMessagingCenter *)self _sendMessage:a3 userInfo:a4 receiveReply:a5 error:a6 toTarget:a7 selector:a8 context:a9 nonBlocking:v10];
}

- (BOOL)_sendMessage:(id)a3 userInfo:(id)a4 receiveReply:(id *)a5 error:(id *)a6 toTarget:(id)a7 selector:(SEL)a8 context:(void *)a9 nonBlocking:(BOOL)a10
{
  id v13 = a4;
  if (a3)
  {
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ message name cannot be nil", objc_opt_class() format];
    if (!v13) {
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v18 = objc_opt_class();
    [v16 raise:v17, @"%@ userInfo is not an NSDictionary: %@ %@", v18, objc_opt_class(), v13 format];
  }
LABEL_7:
  v19 = (__CFString *)[v13 objectForKey:@"_kCPDistributedMessagingMagicCenterCreationKeyValue"];
  if (v19 == @"_kCPDistributedMessagingMagicCenterCreationKeyValue")
  {
    id v13 = (id)[v13 mutableCopy];
    [v13 removeObjectForKey:@"_kCPDistributedMessagingMagicCenterCreationKeyValue"];
  }
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  v20 = dictionaryWithoutLargestNSData(v13, &v38, &v37);
  if (v20)
  {
    v21 = v20;
    uint64_t v36 = 0;
    uint64_t v22 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v20 format:200 options:0 error:&v36];
    if (!v22)
    {
      id v34 = a7;
      v23 = a6;
      v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      uint64_t v32 = objc_opt_class();
      v26 = v24;
      a6 = v23;
      a7 = v34;
      [v26 raise:v25, @"%@ Unable to serialize userInfo: %@ error: %@", v32, v21, v36 format];
    }
    if (a7) {
      goto LABEL_13;
    }
LABEL_17:
    LOBYTE(v31) = a10;
    return [(CPDistributedMessagingCenter *)self _sendMessage:a3 userInfoData:v22 oolKey:v38 oolData:v37 makeServer:v19 == @"_kCPDistributedMessagingMagicCenterCreationKeyValue" receiveReply:a5 nonBlocking:v31 error:a6];
  }
  uint64_t v22 = 0;
  if (!a7) {
    goto LABEL_17;
  }
LABEL_13:
  [(NSLock *)self->_lock lock];
  if (!self->_asyncQueue)
  {
    v27 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    self->_asyncQueue = v27;
    [(NSOperationQueue *)v27 setMaxConcurrentOperationCount:1];
  }
  [(NSLock *)self->_lock unlock];
  v28 = [CPDistributedMessagingAsyncOperation alloc];
  LOBYTE(v33) = v19 == @"_kCPDistributedMessagingMagicCenterCreationKeyValue";
  v29 = [(CPDistributedMessagingAsyncOperation *)v28 initWithCenter:self messageName:a3 userInfoData:v22 oolKey:v38 oolData:v37 target:a7 selector:a8 context:a9 makeServer:v33];
  [(NSOperationQueue *)self->_asyncQueue addOperation:v29];

  return 0;
}

- (BOOL)_sendMessage:(id)a3 userInfoData:(id)a4 oolKey:(id)a5 oolData:(id)a6 makeServer:(BOOL)a7 receiveReply:(id *)a8 nonBlocking:(BOOL)a9 error:(id *)a10
{
  BOOL v11 = a7;
  unsigned int v44 = [(CPDistributedMessagingCenter *)self _sendPort];
  id v43 = a3;
  v16 = (const char *)[a3 UTF8String];
  int v17 = strlen(v16);
  if (a4)
  {
    uint64_t v18 = [a4 bytes];
    int v19 = [a4 length];
    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    v20 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v18 = 0;
  int v19 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  v20 = (const char *)[a5 UTF8String];
  LODWORD(a5) = strlen(v20);
  if (a6)
  {
LABEL_4:
    uint64_t v21 = [a6 bytes];
    LODWORD(a6) = [a6 length];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v21 = 0;
LABEL_8:
  if (a8)
  {
    v50[0] = 0;
    unsigned int v49 = 0;
    uint64_t v48 = 0;
    unsigned int v47 = 0;
    v46 = 0;
    unsigned int v45 = 0;
    if (v11)
    {
      id v22 = [[CPDistributedMessagingCenter alloc] _initAnonymousServer];
      mach_error_t v23 = CPDMTwoWayMessageWithPortPassing(v44, [v22 _serverPort], (uint64_t)v16, v17, v18, v19, v50, &v49, (uint64_t)v20, (int)a5, v21, (int)a6, &v48, &v47, &v46, &v45);
    }
    else
    {
      mach_error_t v23 = CPDMTwoWayMessage(v44, (uint64_t)v16, v17, v18, v19, v50, &v49, (uint64_t)v20, (int)a5, v21, (int)a6, &v48, &v47, &v46, &v45);
      id v22 = 0;
    }
    *a8 = 0;
    if (!v23 && v49)
    {
      if (v46)
      {
        id v25 = [NSString alloc];
        v26 = (void *)[v25 initWithBytes:v48 length:v47 encoding:4];
        CFDataRef DataFromVMDeallocateBytes = createDataFromVMDeallocateBytes(v46, (void *)v45);
        v46 = 0;
        unsigned int v45 = 0;
      }
      else
      {
        CFDataRef DataFromVMDeallocateBytes = 0;
        v26 = 0;
      }
      id v29 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v30 = (void *)[v29 initWithBytesNoCopy:v50[0] length:v49 freeWhenDone:0];
      if (v26) {
        BOOL v31 = DataFromVMDeallocateBytes == 0;
      }
      else {
        BOOL v31 = 1;
      }
      int v32 = !v31;
      BOOL v33 = !v31 || v22 != 0;
      *a8 = (id)[MEMORY[0x1E4F28F98] propertyListWithData:v30 options:v33 format:0 error:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v34 = objc_opt_class();
        NSLog((NSString *)@"%@ ignoring non-dictionary return type in message named %@", v34, v43);
        *a8 = 0;
      }
      if (v32) {
        [*a8 setObject:DataFromVMDeallocateBytes forKey:v26];
      }
    }
    if (v22)
    {
      id v35 = *a8;
      if (!*a8)
      {
        id v35 = (id)[MEMORY[0x1E4F1CA60] dictionary];
        *a8 = v35;
      }
      [v35 setObject:v22 forKey:@"_kCPDistributedMessagingMagicCenterCreationKeyValue"];
    }
    uint64_t v36 = (unsigned int *)MEMORY[0x1E4F14960];
    if (v50[0]) {
      MEMORY[0x192FC0090](*MEMORY[0x1E4F14960], v50[0], v49);
    }
    v28 = a10;
    if (v48) {
      MEMORY[0x192FC0090](*v36, v48, v47);
    }
    if (v46) {
      MEMORY[0x192FC0090](*v36, v46, v45);
    }
  }
  else
  {
    if (a9) {
      mach_error_t v24 = CPDMNonBlockingMessage(v44, (vm_address_t)v16, v17, v18, v19, (uint64_t)v20, (int)a5, v21, (int)a6, 0);
    }
    else {
      mach_error_t v24 = CPDMMessage(v44, (uint64_t)v16, v17, v18, v19, (uint64_t)v20, (int)a5, v21, (int)a6);
    }
    mach_error_t v23 = v24;
    v28 = a10;
  }
  if (v23)
  {
    if (v23 != -308 && v23 != 268435459 && (v23 != 268435460 || !a9))
    {
      uint64_t v37 = objc_opt_class();
      centerName = self->_centerName;
      v39 = mach_error_string(v23);
      NSLog((NSString *)@"Unable to send %@ message named %@ to %@: %s", v37, v43, centerName, v39);
    }
    if (v28)
    {
      uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F285A8] code:v23 userInfo:0];
LABEL_55:
      id *v28 = (id)v40;
    }
  }
  else if (v28)
  {
    uint64_t v40 = 0;
    goto LABEL_55;
  }
  return v23 == 0;
}

- (unsigned)_serverPort
{
  [(NSLock *)self->_lock lock];
  serverSource = self->_serverSource;
  if (serverSource) {
    unsigned int parkedServerPort = CPGetMachPortForMIGServerSource(serverSource);
  }
  else {
    unsigned int parkedServerPort = self->_parkedServerPort;
  }
  [(NSLock *)self->_lock unlock];
  return parkedServerPort;
}

- (void)runServerOnCurrentThread
{
}

- (void)runServerOnCurrentThreadProtectedByEntitlement:(id)a3
{
  [(NSLock *)self->_lock lock];
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (self->_serverSource)
  {
    [(NSLock *)self->_lock unlock];
    [MEMORY[0x1E4F1CA00] raise:*v5, @"Already a %@ server for %@", objc_opt_class(), self->_centerName format];
  }
  mach_port_t sp = 0;
  if (self->_parkedServerPort + 1 >= 2)
  {
    mach_port_t sp = self->_parkedServerPort;
    self->_unsigned int parkedServerPort = 0;
    goto LABEL_12;
  }
  v6 = [(NSString *)self->_centerName UTF8String];
  if (self->_requireLookupByPID)
  {
    if (!bootstrap_check_in2()) {
      goto LABEL_12;
    }
  }
  else if (!bootstrap_check_in(*MEMORY[0x1E4F14638], v6, &sp))
  {
    goto LABEL_12;
  }
  uint64_t v7 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (!mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &sp) && !mach_port_insert_right(*v7, sp, sp, 0x14u))
  {
    bootstrap_register2();
    mach_port_deallocate(*v7, sp);
  }
LABEL_12:
  if (sp - 1 > 0xFFFFFFFD)
  {
    [(NSLock *)self->_lock unlock];
    centerName = self->_centerName;
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *v5;
    uint64_t v12 = objc_opt_class();
    if (centerName) {
      [v10 raise:v11, @"%@ unable to register for '%@'", v12, self->_centerName format];
    }
    else {
      [v10 raise:v11, @"%@ unable to create server for invalid right: %i", v12, sp format];
    }
  }
  else
  {
    self->_serverSource = CPCreateMIGServerSourceWithContext((uint64_t)_CPDMCPDistributedMessaging_subsystem, sp, 0, (uint64_t)self);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, self->_serverSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    self->_requiredEntitlement = (NSString *)[a3 copy];
  }
  [(NSLock *)self->_lock unlock];
}

- (void)stopServer
{
  serverSource = self->_serverSource;
  if (serverSource)
  {
    v6 = self;
    mach_port_name_t v4 = CPGetMachPortForMIGServerSource(serverSource);
    CFRunLoopSourceInvalidate(v6->_serverSource);
    CFRelease(v6->_serverSource);
    uint64_t v5 = v6;
    v6->_serverSource = 0;
    if (v4 - 1 <= 0xFFFFFFFD)
    {
      mach_port_mod_refs(*MEMORY[0x1E4F14960], v4, 1u, -1);
      uint64_t v5 = v6;
    }
  }
}

- (void)registerForMessageName:(id)a3 target:(id)a4 selector:(SEL)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_10:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ target cannont be nil", objc_opt_class() format];
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ message name cannont be nil", objc_opt_class() format];
  if (!a4) {
    goto LABEL_10;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_11:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ selector cannont be nil", objc_opt_class() format];
LABEL_4:
  uint64_t v10 = [[CPDistributedMessagingCallout alloc] initWithTarget:a4 selector:a5];
  [(NSLock *)self->_lock lock];
  callouts = self->_callouts;
  if (!callouts)
  {
    callouts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_callouts = callouts;
  }
  [(NSMutableDictionary *)callouts setObject:v10 forKey:a3];
  [(NSLock *)self->_lock unlock];
}

- (id)delayReply
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C3A8];
  if (!self->_currentCallout) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"%@ delayReply cannot be called outside of a callout", objc_opt_class() format];
  }
  if (self->_delayedReply) {
    [MEMORY[0x1E4F1CA00] raise:*v3, @"%@ delayReply cannot be called more than once in a single callout: %@", objc_opt_class(), self->_currentCallout format];
  }
  unsigned int replyPort = self->_replyPort;
  if (!replyPort)
  {
    [MEMORY[0x1E4F1CA00] raise:*v3, @"%@ delayReply cannot be called when servicing a one-way message during callout: %@", objc_opt_class(), self->_currentCallout format];
    unsigned int replyPort = self->_replyPort;
  }
  if (replyPort == -1)
  {
    uint64_t v7 = objc_opt_class();
    NSLog((NSString *)@"%@ delayReply is about to return nil because the peer seems to have died.", v7);
    return 0;
  }
  else
  {
    self->_delayedReply = 1;
    uint64_t v5 = [[CPDistributedMessagingDelayedReplyContext alloc] initWithReplyPort:self->_replyPort portPassing:self->_portPassing];
    return v5;
  }
}

- (void)sendDelayedReply:(id)a3 dictionary:(id)a4
{
  -[CPDistributedMessagingCenter _sendReplyMessage:portPassing:onMachPort:](self, "_sendReplyMessage:portPassing:onMachPort:", a4, [a3 portPassing], objc_msgSend(a3, "replyPort"));
  [a3 setReplyPort:0];
}

- (void)unregisterForMessageName:(id)a3
{
  [(NSLock *)self->_lock lock];
  callouts = self->_callouts;
  if (a3)
  {
    id v6 = (id)[(NSMutableDictionary *)callouts objectForKey:a3];
    [(NSMutableDictionary *)self->_callouts removeObjectForKey:a3];
  }
  else
  {
    id v7 = (id)[(NSMutableDictionary *)callouts allValues];
    [(NSMutableDictionary *)self->_callouts removeAllObjects];
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (BOOL)doesServerExist
{
  unsigned int v3 = [(CPDistributedMessagingCenter *)self _sendPort];
  if (v3) {
    LOBYTE(v3) = [(CPDistributedMessagingCenter *)self _sendPort] != -1;
  }
  return v3;
}

- (void)_dispatchMessageNamed:(id)a3 userInfo:(id)a4 reply:(id *)a5 auditToken:(id *)a6
{
  [(NSLock *)self->_lock lock];
  v15 = (CPDistributedMessagingCallout *)(id)[(NSMutableDictionary *)self->_callouts objectForKey:a3];
  if (!self->_centerName) {
    uint64_t v11 = self;
  }
  [(NSLock *)self->_lock unlock];
  if (!v15)
  {
    uint64_t v13 = objc_opt_class();
    NSLog((NSString *)@"%@ ignoring message named %@ since no target and selector are registered", v13, a3);
    return;
  }
  self->_currentCallout = v15;
  *a5 = objc_msgSend(-[CPDistributedMessagingCallout target](v15, "target"), -[CPDistributedMessagingCallout selector](v15, "selector"), a3, a4, a6);
  self->_currentCallout = 0;
  if (self->_delayedReply && ![(CPDistributedMessagingCallout *)v15 returnsVoid])
  {
    if (*a5)
    {
      uint64_t v12 = @"%@ ignoring non-nil return from message named %@, which has requested a delayed reply";
      goto LABEL_13;
    }
  }
  else
  {
    if ([(CPDistributedMessagingCallout *)v15 returnsVoid])
    {
LABEL_14:
      *a5 = 0;
      goto LABEL_15;
    }
    if (*a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v12 = @"%@ ignoring non-dictionary return type in message named %@";
LABEL_13:
        uint64_t v14 = objc_opt_class();
        NSLog((NSString *)v12, v14, a3);
        goto LABEL_14;
      }
    }
  }
LABEL_15:
}

- (void)_sendReplyMessage:(id)a3 portPassing:(BOOL)a4 onMachPort:(unsigned int)a5
{
  BOOL v6 = a4;
  if (a3)
  {
    id v17 = 0;
    id v18 = 0;
    id v7 = dictionaryWithoutLargestNSData(a3, (uint64_t *)&v18, &v17);
    if (v18)
    {
      unsigned int v8 = (const char *)[v18 UTF8String];
      int v9 = strlen(v8);
      id v10 = v17;
      uint64_t v11 = [v17 bytes];
      int v12 = [v10 length];
    }
    else
    {
      unsigned int v8 = 0;
      int v9 = 0;
      uint64_t v11 = 0;
      int v12 = 0;
    }
    uint64_t v16 = 0;
    uint64_t v13 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v16];
    if (!v13) {
      NSLog((NSString *)@"Unable to serialize userInfo: %@. Ignoring.", v16);
    }
  }
  else
  {
    uint64_t v13 = 0;
    unsigned int v8 = 0;
    int v9 = 0;
    uint64_t v11 = 0;
    int v12 = 0;
  }
  int v14 = [v13 length];
  uint64_t v15 = [v13 bytes];
  if (v6) {
    CPDMTwoWayMessageReplyWithPortPassing(a5, 0, v15, v14, (uint64_t)v8, v9, v11, v12);
  }
  else {
    CPDMTwoWayMessageReply(a5, 0, v15, v14, (uint64_t)v8, v9, v11, v12);
  }
}

- (BOOL)_isTaskEntitled:(id *)a3
{
  if (!self->_requiredEntitlement) {
    return 1;
  }
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  uint64_t v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    BOOL v6 = v5;
    *(void *)token.val = 0;
    CFBooleanRef v7 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v5, (CFStringRef)self->_requiredEntitlement, (CFErrorRef *)&token);
    if (v7)
    {
      CFBooleanRef v8 = v7;
      CFTypeID v9 = CFGetTypeID(v7);
      BOOL v10 = v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8) != 0;
      CFRelease(v8);
    }
    else
    {
      BOOL v10 = 0;
    }
    if (*(void *)token.val)
    {
      uint64_t v12 = objc_opt_class();
      NSLog((NSString *)@"%@ unable to get entitlements for client task. Error: %@", v12, *(void *)token.val);
      CFRelease(*(CFTypeRef *)token.val);
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    NSLog((NSString *)@"%@ unable to create security task from audit token", v11);
    return 0;
  }
  return v10;
}

- (id)_requiredEntitlement
{
  return self->_requiredEntitlement;
}

@end