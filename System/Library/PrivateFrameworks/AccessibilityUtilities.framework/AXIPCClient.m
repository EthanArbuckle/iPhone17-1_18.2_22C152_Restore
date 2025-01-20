@interface AXIPCClient
+ (id)allClients;
+ (void)initialize;
- (AXAccessQueue)connectionQueue;
- (AXIPCClient)initWithPort:(unsigned int)a3;
- (AXIPCClient)initWithServiceName:(id)a3;
- (BOOL)_handleErrorWithMessage:(id)a3 machError:(int)a4 outError:(id *)a5;
- (BOOL)_handleErrorWithMessage:(id)a3 outError:(id *)a4;
- (BOOL)_prepareToSendMessage:(id)a3 withError:(id *)a4 prepSuccessHandler:(id)a5;
- (BOOL)_verifyConnectionWithError:(id *)a3;
- (BOOL)connectWithError:(id *)a3;
- (BOOL)disconnectWithError:(id *)a3;
- (BOOL)isConnected;
- (BOOL)sendAsyncMessage:(id)a3 replyOnQueue:(id)a4 replyHandler:(id)a5;
- (BOOL)sendAsyncMessage:(id)a3 withReplyHandler:(id)a4;
- (BOOL)sendSimpleMessage:(id)a3 synchronizationPort:(unsigned int)a4 error:(id *)a5;
- (BOOL)sendSimpleMessage:(id)a3 withError:(id *)a4;
- (BOOL)shouldRegisterCallbackSourceOnMainRunloop;
- (BOOL)usesPerPidLookup;
- (BOOL)verifyConnectionExists;
- (NSMutableArray)postConnectionTasks;
- (NSString)clientIdentifier;
- (NSString)serviceName;
- (__CFMachPort)serverPort;
- (__CFRunLoopSource)clientCallbackSource;
- (float)timeout;
- (id)_createRegistrationWithReplyMachPort:(unsigned int)a3 forAsyncReplyOnQueue:(id)a4 responseHandler:(id)a5;
- (id)_descriptionForMachError:(int)a3;
- (id)description;
- (id)portDeathHandler;
- (id)sendMessage:(id)a3 withError:(id *)a4;
- (int)pid;
- (unsigned)clientCallbackPort;
- (unsigned)serviceMachPort;
- (void)_attemptToEstablishConnection;
- (void)_commonInit;
- (void)_registerWithServer;
- (void)_sendRegistrationMessageWithRetries:(int)a3;
- (void)_serverDied;
- (void)dealloc;
- (void)establishConnectionWithTimeout:(double)a3 completion:(id)a4;
- (void)sendSimpleMessage:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setPid:(int)a3;
- (void)setPortDeathHandler:(id)a3;
- (void)setPostConnectionTasks:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setShouldRegisterCallbackSourceOnMainRunloop:(BOOL)a3;
- (void)setTimeout:(float)a3;
- (void)setUsesPerPidLookup:(BOOL)a3;
@end

@implementation AXIPCClient

- (BOOL)sendSimpleMessage:(id)a3 withError:(id *)a4
{
  return [(AXIPCClient *)self sendSimpleMessage:a3 synchronizationPort:0 error:a4];
}

- (BOOL)sendSimpleMessage:(id)a3 synchronizationPort:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__AXIPCClient_sendSimpleMessage_synchronizationPort_error___block_invoke;
  v11[3] = &unk_1E5587478;
  unsigned int v14 = a4;
  v11[4] = self;
  id v12 = v8;
  v13 = a5;
  id v9 = v8;
  LOBYTE(a5) = [(AXIPCClient *)self _prepareToSendMessage:v9 withError:a5 prepSuccessHandler:v11];

  return (char)a5;
}

- (BOOL)_prepareToSendMessage:(id)a3 withError:(id *)a4 prepSuccessHandler:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (**)(id, uint64_t, void, void *))a5;
  if ([(AXIPCClient *)self _verifyConnectionWithError:a4])
  {
    if (v8)
    {
      uint64_t v26 = 0;
      v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v26];
    }
    else
    {
      v10 = 0;
    }
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    int v25 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    AX_PERFORM_WITH_LOCK();
    uint64_t v12 = *((unsigned int *)v19 + 6);
    if (v12)
    {
      char v11 = v9[2](v9, v12, *((unsigned int *)v23 + 6), v10);
    }
    else
    {
      v13 = NSString;
      unsigned int v14 = [(AXIPCClient *)self serviceName];
      v15 = [v13 stringWithFormat:@"Could not send simple message (%@). server port is NULL [%@]", v14, v8, v17, 3221225472, __66__AXIPCClient__prepareToSendMessage_withError_prepSuccessHandler___block_invoke, &unk_1E5587450, self, &v18, &v22];
      [(AXIPCClient *)self _handleErrorWithMessage:v15 outError:a4];

      char v11 = 0;
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

BOOL __59__AXIPCClient_sendSimpleMessage_synchronizationPort_error___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7 = a4;
  int v8 = *(_DWORD *)(a1 + 56);
  id v9 = v7;
  uint64_t v10 = [v9 bytes];
  int v11 = [v9 length];
  if (v8) {
    uint64_t v12 = _AXIPCSimpleSendDataWithFencePort(a2, a3, v8, 0, v10, v11);
  }
  else {
    uint64_t v12 = _AXIPCSimpleSendData(a2, a3, 0, v10, v11);
  }
  uint64_t v13 = v12;
  if (v12)
  {
    unsigned int v14 = *(void **)(a1 + 32);
    v15 = NSString;
    v16 = [v14 serviceName];
    uint64_t v17 = [v15 stringWithFormat:@"Could not send simple message (%@). Port:%d. Error:%d (0x%x). \n%@", v16, a2, v13, v13, *(void *)(a1 + 40)];
    [v14 _handleErrorWithMessage:v17 machError:v13 outError:*(void *)(a1 + 48)];
  }
  return v13 == 0;
}

- (BOOL)_verifyConnectionWithError:(id *)a3
{
  if (self->_serverPort)
  {
    if ([(AXIPCClient *)self isConnected]) {
      v5 = 0;
    }
    else {
      v5 = @"Could not verify connection. client is not connected";
    }
  }
  else
  {
    v5 = @"Could not verify connection. server port was nil";
  }
  return ![(AXIPCClient *)self _handleErrorWithMessage:v5 outError:a3];
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (BOOL)_handleErrorWithMessage:(id)a3 outError:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = AXLogIPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_INFO, "AX IPC Client: %{public}@", buf, 0xCu);
    }

    if (a4)
    {
      id v7 = [MEMORY[0x1E4F48360] errorWithDescription:@"%@", v5];
LABEL_8:
      id v8 = v7;
      *a4 = v8;
    }
  }
  else if (a4)
  {
    id v7 = 0;
    goto LABEL_8;
  }

  return v5 != 0;
}

uint64_t __66__AXIPCClient__prepareToSendMessage_withError_prepSuccessHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = *(__CFMachPort **)(v2 + 8);
  if (v3)
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = CFMachPortGetPort(v3);
    uint64_t v2 = a1[4];
  }
  uint64_t result = *(void *)(v2 + 48);
  if (result) {
    uint64_t result = MSHGetMachPortFromSource();
  }
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___AXIPCClient;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize__AXIPCClientInitializeOnceToken != -1) {
    dispatch_once(&initialize__AXIPCClientInitializeOnceToken, &__block_literal_global_92);
  }
}

uint64_t __25__AXIPCClient_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)AllClientLock;
  AllClientLock = (uint64_t)v0;

  AllClients = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];

  return MEMORY[0x1F41817F8]();
}

+ (id)allClients
{
  [(id)AllClientLock lock];
  objc_super v2 = [(id)AllClients allObjects];
  [(id)AllClientLock unlock];

  return v2;
}

- (void)_commonInit
{
  self->_timeout = 0.25;
  [(id)AllClientLock lock];
  [(id)AllClients addPointer:self];
  [(id)AllClientLock unlock];
  v3 = [MEMORY[0x1E4F1CA48] array];
  [(AXIPCClient *)self setPostConnectionTasks:v3];

  id v4 = (id)[objc_alloc(MEMORY[0x1E4F482E0]) initWithParentClass:objc_opt_class() description:@"connection" appendUUIDToLabel:1];
  [(AXIPCClient *)self setConnectionQueue:v4];
  self->_connectionAttempts = 0;
  self->_clientIdentifierLock._os_unfair_lock_opaque = 0;
  self->_connectionServiceLock._os_unfair_lock_opaque = 0;
}

- (AXIPCClient)initWithServiceName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXIPCClient;
  id v5 = [(AXIPCClient *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_assignedServerMachPort = 0;
    [(AXIPCClient *)v5 setServiceName:v4];
    [(AXIPCClient *)v6 _commonInit];
  }

  return v6;
}

- (AXIPCClient)initWithPort:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXIPCClient;
  id v4 = [(AXIPCClient *)&v6 init];
  if (v4)
  {
    AXIncrefSendRight(a3);
    v4->_assignedServerMachPort = a3;
    [(AXIPCClient *)v4 _commonInit];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(id)AllClientLock lock];
  [(id)AllClients compact];
  [(id)AllClientLock unlock];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __22__AXIPCClient_dealloc__block_invoke;
  uint64_t v24 = &unk_1E5586AB0;
  int v25 = self;
  uint64_t v26 = &v27;
  AX_PERFORM_WITH_LOCK();
  if (!v28[3]) {
    goto LABEL_17;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = +[AXIPCClient allClients];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    char v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(AXIPCClient **)(*((void *)&v17 + 1) + 8 * i);
        if (v8 != self)
        {
          uint64_t v9 = [(AXIPCClient *)v8 serverPort];
          v6 &= v9 != v28[3];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v31 count:16];
    }
    while (v4);

    if ((v6 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  CFMachPortInvalidate((CFMachPortRef)v28[3]);
LABEL_15:
  uint64_t v10 = (const void *)v28[3];
  if (v10)
  {
    CFRelease(v10);
    v28[3] = 0;
  }
LABEL_17:
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  unsigned int v14 = __22__AXIPCClient_dealloc__block_invoke_2;
  v15 = &unk_1E5585F48;
  v16 = self;
  AX_PERFORM_WITH_LOCK();
  _Block_object_dispose(&v27, 8);
  v11.receiver = self;
  v11.super_class = (Class)AXIPCClient;
  [(AXIPCClient *)&v11 dealloc];
}

void __22__AXIPCClient_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(__CFRunLoopSource **)(v2 + 48);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v4 = *(const void **)(v2 + 48);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(*(void *)(a1 + 32) + 48) = 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(v2 + 8);
  uint64_t v5 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v5) {
    CFRetain(v5);
  }
  char v6 = *(const void **)(*(void *)(a1 + 32) + 8);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

uint64_t __22__AXIPCClient_dealloc__block_invoke_2(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(*(void *)(result + 32) + 16);
  if (v1)
  {
    uint64_t result = mach_port_deallocate(*MEMORY[0x1E4F14960], v1);
    if (result) {
      return _AXAssert();
    }
  }
  return result;
}

- (id)description
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  unsigned int v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  AX_PERFORM_WITH_LOCK();
  v3 = NSString;
  serviceName = self->_serviceName;
  uint64_t v5 = v12[5];
  char v6 = [NSNumber numberWithBool:self->_connected];
  id v7 = [v3 stringWithFormat:@"AXIPCClient:<%p> Service:%@ ID:%@ connected:%@", self, serviceName, v5, v6, v9, 3221225472, __26__AXIPCClient_description__block_invoke, &unk_1E5586520, self, &v11];

  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __26__AXIPCClient_description__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (unsigned)serviceMachPort
{
  serverPort = self->_serverPort;
  if (serverPort) {
    LODWORD(serverPort) = CFMachPortGetPort(serverPort);
  }
  return serverPort;
}

- (NSString)clientIdentifier
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__7;
  objc_super v8 = __Block_byref_object_dispose__7;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

uint64_t __31__AXIPCClient_clientIdentifier__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setClientIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AXLogIPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "Setting client identifier %{public}@", buf, 0xCu);
  }

  uint64_t v7 = MEMORY[0x1E4F143A8];
  objc_super v8 = v4;
  id v6 = v4;
  AX_PERFORM_WITH_LOCK();
  [(AXIPCClient *)self _registerWithServer];
}

void __35__AXIPCClient_setClientIdentifier___block_invoke(uint64_t a1)
{
  id v2 = (void **)(a1 + 32);
  mach_port_name_t v1 = *(void **)(a1 + 32);
  v3 = v2 + 1;
  id v4 = (void *)*((void *)v2[1] + 5);
  if (v1 != v4)
  {
    if (v4)
    {
      uint64_t v5 = AXLogIPC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __35__AXIPCClient_setClientIdentifier___block_invoke_cold_1((uint64_t)(v2 + 1), v2, v5);
      }

      mach_port_name_t v1 = *v2;
    }
    uint64_t v6 = [v1 copy];
    uint64_t v7 = *(void **)(*v3 + 40);
    *(void *)(*v3 + 40) = v6;
  }
}

- (__CFRunLoopSource)clientCallbackSource
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (const void *)v6[3];
  if (v2)
  {
    CFAutorelease(v2);
    v3 = (__CFRunLoopSource *)v6[3];
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v3;
}

CFTypeRef __35__AXIPCClient_clientCallbackSource__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 48);
  if (result)
  {
    CFTypeRef result = CFRetain(result);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 48);
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (unsigned)clientCallbackPort
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  AX_PERFORM_WITH_LOCK();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __33__AXIPCClient_clientCallbackPort__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MSHGetMachPortFromSource();
  }
  else
  {
    mach_port_name_t v1 = AXLogIPC();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v2 = 0;
      _os_log_impl(&dword_18D308000, v1, OS_LOG_TYPE_INFO, "AX Asked for client callback port but we had not yet registered", v2, 2u);
    }
  }
}

- (void)_registerWithServer
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AXLogIPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v5 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v6 = [v5 name];
    int v7 = NSNumber;
    uint64_t v8 = [MEMORY[0x1E4F29060] currentThread];
    id v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isMainThread"));
    id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[AXIPCClient shouldRegisterCallbackSourceOnMainRunloop](self, "shouldRegisterCallbackSourceOnMainRunloop"));
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v27 = v6;
    __int16 v28 = 2114;
    uint64_t v29 = v9;
    __int16 v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_INFO, "Client (%{public}@) registering with server on thread (%{public}@:name:%{public}@:main:%{public}@). UsesMainThreadRunloop:%{public}@", buf, 0x34u);
  }
  uint64_t v11 = [(AXIPCClient *)self clientIdentifier];
  BOOL v12 = v11 == 0;

  if (!v12)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v27) = 0;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __34__AXIPCClient__registerWithServer__block_invoke;
    v23 = &unk_1E5586520;
    uint64_t v24 = self;
    int v25 = buf;
    AX_PERFORM_WITH_LOCK();
    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      int v19 = 1024;
      uint64_t v13 = (__CFRunLoopSource *)MSHCreateMIGServerSource();
      if (v13)
      {
        uint64_t v14 = MSHGetMachPortFromSource();
        MEMORY[0x192F9F0A0](*MEMORY[0x1E4F14960], v14, 1, &v19, 4);
        if ([(AXIPCClient *)self shouldRegisterCallbackSourceOnMainRunloop]) {
          Main = CFRunLoopGetMain();
        }
        else {
          Main = CFRunLoopGetCurrent();
        }
        CFRunLoopAddSource(Main, v13, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        uint64_t v17 = MEMORY[0x1E4F143A8];
        AX_PERFORM_WITH_LOCK();
        -[AXIPCClient _sendRegistrationMessageWithRetries:](self, "_sendRegistrationMessageWithRetries:", 10, v17, 3221225472, __34__AXIPCClient__registerWithServer__block_invoke_110, &unk_1E55872B8, self, v13);
      }
      else
      {
        id v16 = AXLogIPC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v18 = 0;
          _os_log_impl(&dword_18D308000, v16, OS_LOG_TYPE_DEFAULT, "Could not create a server source for the client to register with the server", v18, 2u);
        }
      }
    }
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __34__AXIPCClient__registerWithServer__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48) != 0;
  return result;
}

uint64_t __34__AXIPCClient__registerWithServer__block_invoke_110(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

- (void)_sendRegistrationMessageWithRetries:(int)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AXIPCClient *)self clientIdentifier];
  if (!v5)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = @"client identifer was NULL";
    goto LABEL_13;
  }
  if (![(AXIPCClient *)self verifyConnectionExists])
  {
    v15 = AXLogIPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v5;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_DEFAULT, "Could not register with server with client identifier: %{public}@", buf, 0xCu);
    }

    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = @"Couldn't register as connection did not exist";
LABEL_13:
    objc_msgSend(v13, "ax_errorWithDomain:description:", @"AXIPCErrorDomain", v14);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_14;
  }
  uint64_t v6 = [AXIPCMessage alloc];
  uint64_t v7 = AXIPCRegisterClientWithServer;
  int v25 = @"identifier";
  v26[0] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  id v9 = [(AXIPCMessage *)v6 initWithKey:v7 payload:v8];

  id v18 = 0;
  [(AXIPCClient *)self sendSimpleMessage:v9 withError:&v18];
  id v10 = v18;
  if (v10)
  {
    uint64_t v11 = AXLogIPC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = objc_msgSend(v10, "ax_nonRedundantDescription");
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v12;
      _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_DEFAULT, "Could not register with server: %{public}@", buf, 0xCu);
    }
  }

  if (v10)
  {
LABEL_14:
    id v16 = AXLogIPC();
    uint64_t v17 = v16;
    if (a3 < 1)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(AXIPCClient *)(uint64_t)v5 _sendRegistrationMessageWithRetries:v17];
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v20 = v5;
        __int16 v21 = 1024;
        int v22 = a3;
        __int16 v23 = 2114;
        id v24 = v10;
        _os_log_impl(&dword_18D308000, v17, OS_LOG_TYPE_DEFAULT, "Could not register with server for %{public}@. %d tries remaining: %{public}@", buf, 0x1Cu);
      }

      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
LABEL_21:
}

void __51__AXIPCClient__sendRegistrationMessageWithRetries___block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)MEMORY[0x192F9F1F0]();
  [*(id *)(a1 + 32) _sendRegistrationMessageWithRetries:(*(_DWORD *)(a1 + 40) - 1)];
}

- (BOOL)verifyConnectionExists
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(AXIPCClient *)self isConnected]) {
    return 1;
  }
  id v8 = 0;
  BOOL v3 = [(AXIPCClient *)self connectWithError:&v8];
  id v4 = v8;
  if (!v3)
  {
    uint64_t v5 = AXLogIPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_msgSend(v4, "ax_nonRedundantDescription");
      *(_DWORD *)buf = 138543618;
      id v10 = self;
      __int16 v11 = 2114;
      BOOL v12 = v6;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "client could not connect to new service: %{public}@ %{public}@", buf, 0x16u);
    }
  }

  return v3;
}

- (BOOL)connectWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AXIPCClient *)self serviceName];
  if (![v5 length] && !self->_assignedServerMachPort)
  {
    uint64_t v6 = 0;
    uint64_t v7 = @"Client could not connect. Was initialized with an empty service name.";
    goto LABEL_19;
  }
  if ([(AXIPCClient *)self isConnected])
  {
    uint64_t v6 = 0;
    uint64_t v7 = @"Client could not connect. It is already connected";
    goto LABEL_19;
  }
  mach_port_t assignedServerMachPort = self->_assignedServerMachPort;
  mach_port_t sp = assignedServerMachPort;
  if (assignedServerMachPort)
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v9 = [(AXIPCClient *)self usesPerPidLookup];
    mach_port_t v10 = *MEMORY[0x1E4F14638];
    id v11 = v5;
    BOOL v12 = (const char *)[v11 UTF8String];
    if (v9)
    {
      [(AXIPCClient *)self pid];
      uint64_t v13 = bootstrap_look_up2();
    }
    else
    {
      uint64_t v13 = bootstrap_look_up(v10, v12, &sp);
    }
    uint64_t v6 = v13;
    mach_port_t assignedServerMachPort = sp;
    if (!sp || v13)
    {
      uint64_t v7 = [NSString stringWithFormat:@"Could not find server for service: %@. bootstrap error: %s", v11, bootstrap_strerror(v13)];
      mach_port_t assignedServerMachPort = sp;
      if (!sp) {
        goto LABEL_19;
      }
      goto LABEL_14;
    }
  }
  uint64_t v7 = 0;
LABEL_14:
  uint64_t v14 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x1E4F1CF80], assignedServerMachPort, 0, 0, 0);
  self->_serverPort = v14;
  if (v14)
  {
    CFMachPortSetInvalidationCallBack(v14, (CFMachPortInvalidationCallBack)AXIPCClient_handlePortInvalidCallback);
    v15 = AXLogIPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      serverPort = self->_serverPort;
      *(_DWORD *)buf = 138543618;
      __int16 v21 = serverPort;
      __int16 v22 = 1024;
      mach_port_t v23 = sp;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_INFO, "Connected to server: %{public}@ %d", buf, 0x12u);
    }

    [(AXIPCClient *)self setConnected:1];
    [(AXIPCClient *)self _registerWithServer];
  }
  else
  {

    uint64_t v7 = @"Could not make mach port";
  }
LABEL_19:
  BOOL v17 = [(AXIPCClient *)self _handleErrorWithMessage:v7 machError:v6 outError:a3];

  return !v17;
}

- (BOOL)disconnectWithError:(id *)a3
{
  if ([(AXIPCClient *)self isConnected])
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    AX_PERFORM_WITH_LOCK();
    uint64_t v5 = (__CFMachPort *)v11[3];
    if (v5)
    {
      CFMachPortInvalidate(v5);
      uint64_t v6 = (const void *)v11[3];
      if (v6)
      {
        CFRelease(v6);
        v11[3] = 0;
      }
    }
    -[AXIPCClient setConnected:](self, "setConnected:", 0, v9, 3221225472, __35__AXIPCClient_disconnectWithError___block_invoke, &unk_1E5586520, self, &v10);
    _Block_object_dispose(&v10, 8);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = @"Client could not disconnect. It is already disconnected";
  }
  return ![(AXIPCClient *)self _handleErrorWithMessage:v7 outError:a3];
}

uint64_t __35__AXIPCClient_disconnectWithError___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)sendSimpleMessage:(id)a3
{
}

- (id)sendMessage:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  int v19 = __Block_byref_object_copy__7;
  uint64_t v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__AXIPCClient_sendMessage_withError___block_invoke;
  v12[3] = &unk_1E55874A0;
  v12[4] = self;
  uint64_t v14 = &v16;
  id v7 = v6;
  id v13 = v7;
  v15 = a4;
  BOOL v8 = [(AXIPCClient *)self _prepareToSendMessage:v7 withError:a4 prepSuccessHandler:v12];
  uint64_t v9 = v17;
  if (!v8 && v17[5])
  {
    _AXAssert();
    uint64_t v9 = v17;
  }
  id v10 = (id)v9[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __37__AXIPCClient_sendMessage_withError___block_invoke(uint64_t a1, uint64_t a2, int a3, id a4)
{
  uint64_t v21 = 0;
  unsigned int v20 = 0;
  uint64_t v7 = (int)(float)(*(float *)(*(void *)(a1 + 32) + 32) * 1000.0);
  id v8 = a4;
  uint64_t v9 = [v8 bytes];
  int v10 = [v8 length];

  uint64_t v11 = _AXIPCSendData(a2, a3, v7, v9, v10, &v21, &v20);
  if (v11)
  {
    uint64_t v12 = NSString;
    id v13 = [*(id *)(a1 + 32) serviceName];
    uint64_t v14 = [v12 stringWithFormat:@"Could not send message (%@). Port:%d. Error:%d (0x%x). Timeout:%f(%d). \n%@\n", v13, a2, v11, v11, *(float *)(*(void *)(a1 + 32) + 32), v7, *(void *)(a1 + 40)];
  }
  else
  {
    if (!v20)
    {
      uint64_t v14 = 0;
      goto LABEL_8;
    }
    id v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v21);
    MEMORY[0x192F9F990](*MEMORY[0x1E4F14960], v21, v20);
    uint64_t v15 = +[AXIPCMessage archivedMessageFromData:v13];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = @"Reply data could not be converted into a message";
    }
  }

LABEL_8:
  uint64_t v18 = [*(id *)(a1 + 32) _handleErrorWithMessage:v14 machError:v11 outError:*(void *)(a1 + 56)] ^ 1;

  return v18;
}

- (BOOL)sendAsyncMessage:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  LOBYTE(a4) = [(AXIPCClient *)self sendAsyncMessage:a3 replyOnQueue:v7 replyHandler:a4];

  return (char)a4;
}

- (BOOL)sendAsyncMessage:(id)a3 replyOnQueue:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__AXIPCClient_sendAsyncMessage_replyOnQueue_replyHandler___block_invoke;
  v22[3] = &unk_1E55874C8;
  v22[4] = self;
  uint64_t v11 = v9;
  mach_port_t v23 = v11;
  id v12 = v10;
  id v25 = v12;
  id v13 = v8;
  id v24 = v13;
  uint64_t v26 = &v27;
  BOOL v14 = [(AXIPCClient *)self _prepareToSendMessage:v13 withError:&v27 prepSuccessHandler:v22];
  uint64_t v15 = v27;
  if (!v14 && !v27)
  {
    _AXAssert();
    uint64_t v15 = v27;
  }
  if (v15)
  {
    id v16 = v15;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__AXIPCClient_sendAsyncMessage_replyOnQueue_replyHandler___block_invoke_2;
    v19[3] = &unk_1E55866D8;
    id v20 = v16;
    id v21 = v12;
    id v17 = v16;
    dispatch_async(v11, v19);
  }
  return v14;
}

BOOL __58__AXIPCClient_sendAsyncMessage_replyOnQueue_replyHandler___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7 = a4;
  mach_port_name_t name = 0;
  uint64_t v8 = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Could not allocate reply port: %d", v8);
    if (v10) {
LABEL_3:
    }
      [*(id *)(a1 + 32) _handleErrorWithMessage:v10 machError:v9 outError:*(void *)(a1 + 64)];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) _createRegistrationWithReplyMachPort:name forAsyncReplyOnQueue:*(void *)(a1 + 40) responseHandler:*(void *)(a1 + 56)];
    mach_port_name_t v13 = name;
    id v14 = v7;
    uint64_t v9 = _AXIPCSendDataWithAsyncReply(a2, a3, v13, 0, [v14 bytes], objc_msgSend(v14, "length"));
    if (v9)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v9);
      id v16 = NSString;
      id v17 = [*(id *)(a1 + 32) serviceName];
      uint64_t v18 = [*(id *)(a1 + 48) description];
      int v19 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      id v10 = [v16 stringWithFormat:@"Could not send message (%@). Port:%d. Error:%@.  %@\n", v17, a2, v15, v19];

      [v12 initialSendAborted];
    }
    else
    {
      id v10 = 0;
    }

    if (v10) {
      goto LABEL_3;
    }
  }

  return v10 == 0;
}

uint64_t __58__AXIPCClient_sendAsyncMessage_replyOnQueue_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)_createRegistrationWithReplyMachPort:(unsigned int)a3 forAsyncReplyOnQueue:(id)a4 responseHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [[AXIPCOutstandingAsyncRequest alloc] initWithReplyPort:v6 handlerQueue:v8 handler:v7];

  [(AXIPCOutstandingAsyncRequest *)v9 registerAndListenForResponse];

  return v9;
}

- (void)setPortDeathHandler:(id)a3
{
  id v4 = a3;
  id portDeathHandler = self->_portDeathHandler;
  if (portDeathHandler != v4)
  {
    id v8 = v4;
    if (portDeathHandler)
    {
      self->_id portDeathHandler = 0;

      id v4 = v8;
    }
    if (v4)
    {
      uint64_t v6 = (void *)[v8 copy];
      id v7 = self->_portDeathHandler;
      self->_id portDeathHandler = v6;

      id v4 = v8;
    }
  }
}

- (void)_serverDied
{
  [(AXIPCClient *)self setConnected:0];
  BOOL v3 = [(AXIPCClient *)self portDeathHandler];

  if (v3)
  {
    id v4 = [(AXIPCClient *)self portDeathHandler];
    v4[2]();
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  AX_PERFORM_WITH_LOCK();
  uint64_t v5 = (__CFMachPort *)v8[3];
  if (v5)
  {
    CFMachPortInvalidate(v5);
    uint64_t v6 = (const void *)v8[3];
    if (v6)
    {
      CFRelease(v6);
      v8[3] = 0;
    }
  }
  _Block_object_dispose(&v7, 8);
}

void __26__AXIPCClient__serverDied__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(__CFRunLoopSource **)(v2 + 48);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    uint64_t v2 = *(void *)(a1 + 32);
    id v4 = *(const void **)(v2 + 48);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(*(void *)(a1 + 32) + 48) = 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(v2 + 8);
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
}

- (void)_attemptToEstablishConnection
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = &unk_1EDC63588;
  _os_log_error_impl(&dword_18D308000, log, OS_LOG_TYPE_ERROR, "A connection to the server could not be made after %{public}@s. Calling timeout blocks", (uint8_t *)&v1, 0xCu);
}

uint64_t __44__AXIPCClient__attemptToEstablishConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attemptToEstablishConnection];
}

- (void)establishConnectionWithTimeout:(double)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ([(AXIPCClient *)self isConnected])
    {
      v6[2](v6, 0);
    }
    else
    {
      uint64_t v7 = [(AXIPCClient *)self connectionQueue];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __57__AXIPCClient_establishConnectionWithTimeout_completion___block_invoke;
      v8[3] = &unk_1E55874F0;
      double v10 = a3;
      v8[4] = self;
      uint64_t v9 = v6;
      [v7 performSynchronousWritingBlock:v8];
    }
  }
}

void __57__AXIPCClient_establishConnectionWithTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [AXPostConnectionTask alloc];
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) connectionQueue];
  id v8 = [(AXPostConnectionTask *)v2 initWithConnectBlock:v4 timeout:v5 accessQueue:v3];

  uint64_t v6 = [*(id *)(a1 + 32) postConnectionTasks];
  [v6 addObject:v8];

  uint64_t v7 = *(void **)(a1 + 32);
  if (!v7[7]) {
    [v7 _attemptToEstablishConnection];
  }
}

- (BOOL)_handleErrorWithMessage:(id)a3 machError:(int)a4 outError:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = [(AXIPCClient *)self _handleErrorWithMessage:a3 outError:a5];
  BOOL v8 = v7;
  if (a5 && v7 && *a5)
  {
    uint64_t v9 = [*a5 userInfo];
    double v10 = (void *)[v9 mutableCopy];

    uint64_t v11 = [NSNumber numberWithInt:v6];
    [v10 setObject:v11 forKeyedSubscript:@"AXIPCErrorKeyMachError"];

    id v12 = (void *)MEMORY[0x1E4F28C58];
    mach_port_name_t v13 = [*a5 domain];
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(*a5, "code"), v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_descriptionForMachError:(int)a3
{
  if (a3 > 15871)
  {
    switch(a3)
    {
      case 268435457:
        uint64_t v5 = @"MACH_SEND_IN_PROGRESS";
        break;
      case 268435458:
        uint64_t v5 = @"MACH_SEND_INVALID_DATA";
        break;
      case 268435459:
        uint64_t v5 = @"MACH_SEND_INVALID_DEST";
        break;
      case 268435460:
        uint64_t v5 = @"MACH_SEND_TIMED_OUT";
        break;
      case 268435461:
      case 268435462:
      case 268435474:
      case 268435475:
      case 268435476:
        goto LABEL_35;
      case 268435463:
        uint64_t v5 = @"MACH_SEND_INTERRUPTED";
        break;
      case 268435464:
        uint64_t v5 = @"MACH_SEND_MSG_TOO_SMALL";
        break;
      case 268435465:
        uint64_t v5 = @"MACH_SEND_INVALID_REPLY";
        break;
      case 268435466:
        uint64_t v5 = @"MACH_SEND_INVALID_RIGHT";
        break;
      case 268435467:
        uint64_t v5 = @"MACH_SEND_INVALID_NOTIFY";
        break;
      case 268435468:
        uint64_t v5 = @"MACH_SEND_INVALID_MEMORY";
        break;
      case 268435469:
        uint64_t v5 = @"MACH_SEND_NO_BUFFER";
        break;
      case 268435470:
        uint64_t v5 = @"MACH_SEND_TOO_LARGE";
        break;
      case 268435471:
        uint64_t v5 = @"MACH_SEND_INVALID_TYPE";
        break;
      case 268435472:
        uint64_t v5 = @"MACH_SEND_INVALID_HEADER";
        break;
      case 268435473:
        uint64_t v5 = @"MACH_SEND_INVALID_TRAILER";
        break;
      case 268435477:
        uint64_t v5 = @"MACH_SEND_INVALID_RT_OOL_SIZE";
        break;
      default:
        switch(a3)
        {
          case 268451841:
            uint64_t v5 = @"MACH_RCV_IN_PROGRESS";
            break;
          case 268451842:
          case 268451844:
          case 268451856:
            goto LABEL_35;
          case 268451843:
            uint64_t v5 = @"MACH_RCV_TIMED_OUT";
            break;
          case 268451845:
            uint64_t v5 = @"MACH_RCV_INTERRUPTED";
            break;
          case 268451846:
            uint64_t v5 = @"MACH_RCV_PORT_CHANGED";
            break;
          case 268451847:
            uint64_t v5 = @"MACH_RCV_INVALID_NOTIFY";
            break;
          case 268451848:
            uint64_t v5 = @"MACH_RCV_INVALID_DATA";
            break;
          case 268451849:
            uint64_t v5 = @"MACH_RCV_PORT_DIED";
            break;
          case 268451850:
            uint64_t v5 = @"MACH_RCV_IN_SET";
            break;
          case 268451851:
            uint64_t v5 = @"MACH_RCV_HEADER_ERROR";
            break;
          case 268451852:
            uint64_t v5 = @"MACH_RCV_BODY_ERROR";
            break;
          case 268451853:
            uint64_t v5 = @"MACH_RCV_INVALID_TYPE";
            break;
          case 268451854:
            uint64_t v5 = @"MACH_RCV_SCATTER_SMALL";
            break;
          case 268451855:
            uint64_t v5 = @"MACH_RCV_INVALID_TRAILER";
            break;
          case 268451857:
            uint64_t v5 = @"MACH_RCV_IN_PROGRESS_TIMED";
            break;
          default:
            if (a3 != 15872) {
              goto LABEL_35;
            }
            uint64_t v5 = @"MACH_MSG_MASK";
            break;
        }
        break;
    }
  }
  else if (a3 <= 2047)
  {
    if (a3)
    {
      if (a3 != 1024)
      {
LABEL_35:
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown mach error :%d (0x%x)", *(void *)&a3, *(void *)&a3, v3);
        uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
      uint64_t v5 = @"MACH_MSG_VM_KERNEL";
    }
    else
    {
      uint64_t v5 = @"MACH_MSG_SUCCESS";
    }
  }
  else
  {
    switch(a3)
    {
      case 0x800:
        uint64_t v5 = @"MACH_MSG_IPC_KERNEL";
        break;
      case 0x1000:
        uint64_t v5 = @"MACH_MSG_VM_SPACE";
        break;
      case 0x2000:
        uint64_t v5 = @"MACH_MSG_IPC_SPACE";
        return v5;
      default:
        goto LABEL_35;
    }
  }
  return v5;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (id)portDeathHandler
{
  return self->_portDeathHandler;
}

- (__CFMachPort)serverPort
{
  return self->_serverPort;
}

- (float)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(float)a3
{
  self->_timeout = a3;
}

- (NSMutableArray)postConnectionTasks
{
  return self->_postConnectionTasks;
}

- (void)setPostConnectionTasks:(id)a3
{
}

- (AXAccessQueue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (BOOL)shouldRegisterCallbackSourceOnMainRunloop
{
  return self->shouldRegisterCallbackSourceOnMainRunloop;
}

- (void)setShouldRegisterCallbackSourceOnMainRunloop:(BOOL)a3
{
  self->shouldRegisterCallbackSourceOnMainRunloop = a3;
}

- (BOOL)usesPerPidLookup
{
  return self->_usesPerPidLookup;
}

- (void)setUsesPerPidLookup:(BOOL)a3
{
  self->_usesPerPidLookup = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_postConnectionTasks, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_outstandingAsyncRequests, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong(&self->_portDeathHandler, 0);
}

void __35__AXIPCClient_setClientIdentifier___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_5(&dword_18D308000, (uint64_t)a2, a3, "Why are you setting the client identifier twice? Old: %{public}@, New: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_sendRegistrationMessageWithRetries:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_5(&dword_18D308000, a2, a3, "Exhausted registration attempts for %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end