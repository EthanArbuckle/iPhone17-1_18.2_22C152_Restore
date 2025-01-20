@interface AXIPCServer
- (AXIPCServer)initWithPort:(unsigned int)a3 serviceRunLoopSource:(__CFRunLoopSource *)a4;
- (AXIPCServer)initWithServiceName:(id)a3 perPidService:(BOOL)a4;
- (BOOL)__slowpath__clientWithAuditToken:(id *)a3 hasRequiredEntitlementFromSet:(id)a4;
- (BOOL)_clientHasEntitlementWithPort:(unsigned int)a3 auditToken:(id *)a4 message:(id)a5 completion:(id)a6;
- (BOOL)_handleErrorWithMessage:(id)a3 outError:(id *)a4;
- (BOOL)_hasEntitlement:(id)a3 entitlements:(id)a4 clientPort:(unsigned int)a5 auditToken:(id *)a6 message:(id)a7 completion:(id)a8;
- (BOOL)isRunning;
- (BOOL)perPidService;
- (BOOL)startServerWithError:(id *)a3;
- (BOOL)stopServerWithError:(id *)a3;
- (NSMutableArray)delayedMessages;
- (NSMutableDictionary)handlers;
- (NSString)description;
- (NSString)serviceName;
- (id)_clientIdentificationForAuditToken:(id *)a3;
- (id)clientInvalidationCallback;
- (id)defaultHandler;
- (unsigned)machPort;
- (void)_addPossibleRequiredEntitlementsToMessageWithKey:(int)a3 first:(id)a4 vothers:(char *)a5;
- (void)_applyCustomQueueSize;
- (void)_handleClientInvalidation:(unsigned int)a3;
- (void)_handleClientRegistration:(id)a3;
- (void)_handleIncomingMessage:(id)a3 securityToken:(id)a4 auditToken:(id *)a5 clientPort:(unsigned int)a6 completion:(id)a7;
- (void)_processValidatedMessage:(id)a3 completion:(id)a4;
- (void)_registerContext:(id)a3 forKey:(int)a4;
- (void)_startServerThread;
- (void)addPossibleRequiredEntitlement:(id)a3 forMessageWithKey:(int)a4;
- (void)dealloc;
- (void)removeAllHandlersForTarget:(id)a3;
- (void)removeHandlerForKey:(int)a3;
- (void)removePossibleRequiredEntitlement:(id)a3 forMessageWithKey:(int)a4;
- (void)serverClientRegistrationInvalidated:(id)a3;
- (void)setClientInvalidationCallback:(id)a3;
- (void)setDefaultHandler:(id)a3;
- (void)setDelayedMessages:(id)a3;
- (void)setHandler:(id)a3 forKey:(int)a4;
- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5 forKey:(int)a6;
- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5 forKey:(int)a6 possibleRequiredEntitlements:(id)a7;
- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 forKey:(int)a5;
- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 forKey:(int)a5 possibleRequiredEntitlements:(id)a6;
- (void)setHandlers:(id)a3;
- (void)setPerPidService:(BOOL)a3;
- (void)setQueueSize:(unsigned int)a3;
- (void)setRunning:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceRunLoopSource:(__CFRunLoopSource *)a3;
@end

@implementation AXIPCServer

- (void)_handleIncomingMessage:(id)a3 securityToken:(id)a4 auditToken:(id *)a5 clientPort:(unsigned int)a6 completion:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  v11 = (void (**)(void *, void))a7;
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = (void (**)(void *, void))&__block_literal_global_150;
  }
  v13 = +[AXIPCMessage archivedMessageFromData:a3];
  v14 = v13;
  if (v13)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__AXIPCServer__handleIncomingMessage_securityToken_auditToken_clientPort_completion___block_invoke_152;
    aBlock[3] = &unk_1E5587350;
    aBlock[4] = self;
    id v15 = v13;
    id v25 = v15;
    v16 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    long long v17 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a5->var0;
    long long v23 = v17;
    if ([(AXIPCServer *)self _clientHasEntitlementWithPort:v7 auditToken:buf message:v15 completion:v12])
    {
      if ([v15 processedMessage])
      {
        v16[2](v16, 1);
      }
      else
      {
        long long v20 = *(_OWORD *)&a5->var0[4];
        v21[0] = *(_OWORD *)a5->var0;
        v21[1] = v20;
        [v15 setAuditToken:v21];
        [v15 setClientPort:v7];
        if ((((uint64_t (*)(void *, void))v16[2])(v16, 0) & 1) == 0) {
          [(AXIPCServer *)self _processValidatedMessage:v15 completion:v12];
        }
      }
    }
    else
    {
      v16[2](v16, 1);
      v19 = AXLogIPC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D308000, v19, OS_LOG_TYPE_DEFAULT, "Not privileged to communicate", buf, 2u);
      }

      v12[2](v12, 0);
    }
  }
  else
  {
    v18 = AXLogIPC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v18, OS_LOG_TYPE_DEFAULT, "Server could not handle received message.  inData could not be unarchived to a message object", buf, 2u);
    }

    v12[2](v12, 0);
  }
}

BOOL __85__AXIPCServer__handleIncomingMessage_securityToken_auditToken_clientPort_completion___block_invoke_152(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) delayedMessages];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__AXIPCServer__handleIncomingMessage_securityToken_auditToken_clientPort_completion___block_invoke_2;
  v22[3] = &unk_1E5587328;
  id v23 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 indexOfObjectPassingTest:v22];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a2)
    {
      v6 = [*(id *)(a1 + 32) delayedMessages];
      [v6 removeObjectAtIndex:v5];
    }
    if (!v5)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "delayedMessages", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            v13 = *(void **)(a1 + 32);
            v14 = [v12 message];
            id v15 = [v12 completion];
            [v13 _processValidatedMessage:v14 completion:v15];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v9);
      }

      v16 = [*(id *)(a1 + 32) delayedMessages];
      [v16 removeAllObjects];
    }
  }

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSMutableArray)delayedMessages
{
  return self->_delayedMessages;
}

- (BOOL)_clientHasEntitlementWithPort:(unsigned int)a3 auditToken:(id *)a4 message:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 key];
  entitlements = self->_entitlements;
  v14 = [NSNumber numberWithInt:v12];
  id v15 = [(NSMutableDictionary *)entitlements objectForKey:v14];
  v16 = (void *)[v15 copy];

  if ([v16 count])
  {
    connectedClients = self->_connectedClients;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __75__AXIPCServer__clientHasEntitlementWithPort_auditToken_message_completion___block_invoke;
    v28[3] = &__block_descriptor_36_e12_B24__0_8_B16l;
    int v29 = v8;
    long long v18 = [(NSMutableSet *)connectedClients objectsPassingTest:v28];
    long long v19 = [v18 anyObject];

    long long v20 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    *(_OWORD *)&uint8_t buf[16] = v20;
    BOOL v21 = [(AXIPCServer *)self _hasEntitlement:v19 entitlements:v16 clientPort:v8 auditToken:buf message:v10 completion:v11];
    if (!v21)
    {
      v22 = AXLogIPC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v24 = *(_OWORD *)&a4->var0[4];
        *(_OWORD *)buf = *(_OWORD *)a4->var0;
        *(_OWORD *)&uint8_t buf[16] = v24;
        uint64_t v25 = [(AXIPCServer *)self _clientIdentificationForAuditToken:buf];
        v26 = [v16 description];
        v27 = [v26 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v27;
        _os_log_error_impl(&dword_18D308000, v22, OS_LOG_TYPE_ERROR, "Client (%{public}@) does not have required entitlement for message: %{public}@. \nNeeds one of:%{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

- (void)_processValidatedMessage:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  [v6 setProcessedMessage:1];
  int v8 = [v6 key];
  if (v8 == AXIPCRegisterClientWithServer)
  {
    [(AXIPCServer *)self _handleClientRegistration:v6];
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v9 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v6, "key"));
    id v10 = [(AXIPCServer *)self handlers];
    id v11 = [v10 objectForKey:v9];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__AXIPCServer__processValidatedMessage_completion___block_invoke;
    aBlock[3] = &unk_1E5587378;
    long long v24 = v7;
    uint64_t v12 = _Block_copy(aBlock);
    v13 = [v11 target];
    uint64_t v14 = [v11 selector];
    if (v13 && (id v15 = (const char *)v14) != 0)
    {
      if (objc_opt_respondsToSelector())
      {
        int v16 = [v11 async];
        long long v17 = (uint64_t (*)(void *, const char *, id, NSObject *))[v13 methodForSelector:v15];
        if (v16)
        {
          long long v18 = _Block_copy(v12);
          id v19 = (id)v17(v13, v15, v6, v18);
        }
        else
        {
          long long v18 = ((void (*)(void *, const char *, id))v17)(v13, v15, v6);
          (*((void (**)(void *, NSObject *))v12 + 2))(v12, v18);
        }
      }
      else
      {
        long long v18 = AXLogIPC();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[AXIPCServer _processValidatedMessage:completion:](v15);
        }
      }
    }
    else
    {
      long long v20 = [v11 handler];
      if (!v20)
      {
        BOOL v21 = AXLogIPC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = [v6 key];
          *(_DWORD *)buf = 67109120;
          int v26 = v22;
          _os_log_impl(&dword_18D308000, v21, OS_LOG_TYPE_DEFAULT, "Warning: no handler was for message key: (%d). Falling back to default handler", buf, 8u);
        }

        long long v20 = [(AXIPCServer *)self defaultHandler];
      }
      long long v18 = ((void (**)(void, id))v20)[2](v20, v6);
      (*((void (**)(void *, NSObject *))v12 + 2))(v12, v18);
    }
  }
}

void __51__AXIPCServer__processValidatedMessage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v12 = 0;
    v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&v12];
    id v4 = v12;
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F48398] sharedInstance];
      char v6 = [v5 ignoreLogging];

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = [MEMORY[0x1E4F48398] identifier];
        int v8 = AXLoggerForFacility();

        os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v8, v9))
        {
          id v10 = AXColorizeFormatLog();
          id v11 = _AXStringForArgs();
          if (os_log_type_enabled(v8, v9))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v14 = v11;
            _os_log_impl(&dword_18D308000, v8, v9, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (AXIPCServer)initWithServiceName:(id)a3 perPidService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXIPCServer;
  uint64_t v7 = [(AXIPCServer *)&v12 init];
  int v8 = v7;
  if (v7)
  {
    [(AXIPCServer *)v7 setServiceName:v6];
    os_log_type_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXIPCServer *)v8 setHandlers:v9];

    [(AXIPCServer *)v8 setPerPidService:v4];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    [(AXIPCServer *)v8 setDelayedMessages:v10];
  }
  return v8;
}

- (AXIPCServer)initWithPort:(unsigned int)a3 serviceRunLoopSource:(__CFRunLoopSource *)a4
{
  id v6 = [(AXIPCServer *)self initWithServiceName:0 perPidService:0];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_assignedServerPort = a3;
    if (a4) {
      v6->_serverRunLoopSource = (__CFRunLoopSource *)CFRetain(a4);
    }
  }
  return v7;
}

- (void)dealloc
{
  if ([(AXIPCServer *)self isRunning]) {
    [(AXIPCServer *)self stopServerWithError:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)AXIPCServer;
  [(AXIPCServer *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)AXIPCServer;
  BOOL v4 = [(AXIPCServer *)&v10 description];
  uint64_t v5 = [(AXIPCServer *)self serviceName];
  BOOL v6 = [(AXIPCServer *)self isRunning];
  uint64_t v7 = @"NO";
  if (v6) {
    uint64_t v7 = @"YES";
  }
  int v8 = [v3 stringWithFormat:@"%@. Serivce Name:%@. Running:%@ Server Port:%d. Clients:%@. Entitlements:%@. RunLoopSource:%p", v4, v5, v7, self->_serverPort, self->_connectedClients, self->_entitlements, self->_serverRunLoopSource];

  return (NSString *)v8;
}

- (void)setServiceRunLoopSource:(__CFRunLoopSource *)a3
{
  if (self->_serverRunLoopSource) {
    _AXAssert();
  }
  if (a3) {
    CFRetain(a3);
  }
  self->_serverRunLoopSource = a3;
}

- (id)defaultHandler
{
  id defaultHandler = self->_defaultHandler;
  if (!defaultHandler)
  {
    BOOL v4 = (void *)[&__block_literal_global_15 copy];
    id v5 = self->_defaultHandler;
    self->_id defaultHandler = v4;

    id defaultHandler = self->_defaultHandler;
  }
  BOOL v6 = _Block_copy(defaultHandler);

  return v6;
}

uint64_t __29__AXIPCServer_defaultHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"A message was received that could not be understood: %@", a2];
  objc_super v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"AXIPCMessageHandlerException" reason:v2 userInfo:0];
  if (v3)
  {
    BOOL v4 = AXLogIPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = v3;
      _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "AX: %{public}@", buf, 0xCu);
    }
  }
  return 0;
}

- (void)setDefaultHandler:(id)a3
{
  id v4 = a3;
  id defaultHandler = self->_defaultHandler;
  if (defaultHandler != v4)
  {
    id v8 = v4;
    if (defaultHandler)
    {
      self->_id defaultHandler = 0;

      id v4 = v8;
    }
    if (v4)
    {
      BOOL v6 = (void *)[v8 copy];
      id v7 = self->_defaultHandler;
      self->_id defaultHandler = v6;

      id v4 = v8;
    }
  }
}

- (id)clientInvalidationCallback
{
  v2 = _Block_copy(self->_clientInvalidationHandler);

  return v2;
}

- (void)setClientInvalidationCallback:(id)a3
{
  id v4 = a3;
  id clientInvalidationHandler = self->_clientInvalidationHandler;
  if (clientInvalidationHandler != v4)
  {
    id v8 = v4;
    if (clientInvalidationHandler)
    {
      self->_id clientInvalidationHandler = 0;

      id v4 = v8;
    }
    if (v4)
    {
      BOOL v6 = (void *)[v8 copy];
      id v7 = self->_clientInvalidationHandler;
      self->_id clientInvalidationHandler = v6;

      id v4 = v8;
    }
  }
}

- (BOOL)startServerWithError:(id *)a3
{
  id v5 = [(AXIPCServer *)self serviceName];
  if ([v5 length])
  {
  }
  else
  {
    unsigned int assignedServerPort = self->_assignedServerPort;

    if (!assignedServerPort)
    {
      id v7 = @"Cannot start server. Service name was empty";
      return ![(AXIPCServer *)self _handleErrorWithMessage:v7 outError:a3];
    }
  }
  if ([(AXIPCServer *)self isRunning])
  {
    id v7 = @"Cannot start server. It is already running.";
  }
  else
  {
    [(AXIPCServer *)self _startServerThread];
    id v7 = 0;
  }
  return ![(AXIPCServer *)self _handleErrorWithMessage:v7 outError:a3];
}

- (BOOL)stopServerWithError:(id *)a3
{
  if ([(AXIPCServer *)self isRunning])
  {
    serverRunLoopSource = self->_serverRunLoopSource;
    if (serverRunLoopSource)
    {
      CFRunLoopSourceInvalidate(serverRunLoopSource);
      CFRelease(self->_serverRunLoopSource);
      self->_serverRunLoopSource = 0;
    }
    [(AXIPCServer *)self setRunning:0];
    AXIPCServerSetServerPort(self->_serverPort, 0);
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = @"Cannot stop server. It is not running.";
  }
  return ![(AXIPCServer *)self _handleErrorWithMessage:v6 outError:a3];
}

- (void)setHandler:(id)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  if (v9)
  {
    BOOL v6 = (void *)[objc_alloc(NSNumber) initWithInt:v4];
    id v7 = [[AXIPCServerMessageHandlerContext alloc] initWithHandler:v9];
    id v8 = [(AXIPCServer *)self handlers];
    [v8 setObject:v7 forKey:v6];
  }
  else
  {
    [(AXIPCServer *)self removeHandlerForKey:v4];
  }
}

- (void)removeHandlerForKey:(int)a3
{
  id v5 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  uint64_t v4 = [(AXIPCServer *)self handlers];
  [v4 removeObjectForKey:v5];
}

- (void)_registerContext:(id)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v6 = (objc_class *)NSNumber;
  id v7 = a3;
  id v9 = (id)[[v6 alloc] initWithInt:v4];
  id v8 = [(AXIPCServer *)self handlers];
  [v8 setObject:v7 forKey:v9];
}

- (void)_addPossibleRequiredEntitlementsToMessageWithKey:(int)a3 first:(id)a4 vothers:(char *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  [(AXIPCServer *)self addPossibleRequiredEntitlement:v8 forMessageWithKey:v6];
  objc_super v12 = a5 + 8;
  id v9 = *(id *)a5;
  if (v9)
  {
    id v10 = v9;
    do
    {
      [(AXIPCServer *)self addPossibleRequiredEntitlement:v10 forMessageWithKey:v6];

      id v11 = (id *)v12;
      v12 += 8;
      id v10 = *v11;
    }
    while (v10);
  }
}

- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 forKey:(int)a5
{
}

- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5 forKey:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  id v11 = a3;
  if (v11 && a4)
  {
    id v10 = [[AXIPCServerMessageHandlerContext alloc] initWithTarget:v11 selector:a4 async:v7];
    [(AXIPCServer *)self _registerContext:v10 forKey:v6];
  }
  else
  {
    [(AXIPCServer *)self removeHandlerForKey:v6];
  }
}

- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 forKey:(int)a5 possibleRequiredEntitlements:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  [(AXIPCServer *)self setHandlerWithTarget:a3 selector:a4 forKey:v6];
  if (v10) {
    [(AXIPCServer *)self _addPossibleRequiredEntitlementsToMessageWithKey:v6 first:v10 vothers:&v11];
  }
}

- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5 forKey:(int)a6 possibleRequiredEntitlements:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  BOOL v8 = a5;
  id v12 = a7;
  [(AXIPCServer *)self setHandlerWithTarget:a3 selector:a4 async:v8 forKey:v7];
  if (v12) {
    [(AXIPCServer *)self _addPossibleRequiredEntitlementsToMessageWithKey:v7 first:v12 vothers:&v13];
  }
}

- (void)removeAllHandlersForTarget:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = __Block_byref_object_copy__6;
  int v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  id v5 = [(AXIPCServer *)self handlers];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__AXIPCServer_removeAllHandlersForTarget___block_invoke;
  v15[3] = &unk_1E5587248;
  id v6 = v4;
  id v16 = v6;
  long long v17 = &v18;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)v19[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v5, "removeObjectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v24 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v18, 8);
}

void __42__AXIPCServer_removeAllHandlersForTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = [a3 target];
  id v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v7 addObject:v11];
  }
}

- (void)addPossibleRequiredEntitlement:(id)a3 forMessageWithKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  if (!self->_entitlements)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    entitlements = self->_entitlements;
    self->_entitlements = v6;
  }
  uint64_t v8 = [NSNumber numberWithInt:v4];
  uint64_t v9 = [(NSMutableDictionary *)self->_entitlements objectForKey:v8];
  if (!v9)
  {
    uint64_t v9 = objc_opt_new();
    [(NSMutableDictionary *)self->_entitlements setObject:v9 forKey:v8];
  }
  [v9 addObject:v10];
}

- (void)removePossibleRequiredEntitlement:(id)a3 forMessageWithKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  id v6 = [NSNumber numberWithInt:v4];
  id v7 = [(NSMutableDictionary *)self->_entitlements objectForKey:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 removeObject:v10];
    if (![v8 count])
    {
      [(NSMutableDictionary *)self->_entitlements removeObjectForKey:v6];
      if (![(NSMutableDictionary *)self->_entitlements count])
      {
        entitlements = self->_entitlements;
        self->_entitlements = 0;
      }
    }
  }
}

BOOL __75__AXIPCServer__clientHasEntitlementWithPort_auditToken_message_completion___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 port];
  int v6 = *(_DWORD *)(a1 + 32);
  if (v5 == v6) {
    *a3 = 1;
  }
  return v5 == v6;
}

- (BOOL)_hasEntitlement:(id)a3 entitlements:(id)a4 clientPort:(unsigned int)a5 auditToken:(id *)a6 message:(id)a7 completion:(id)a8
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v43 = a7;
  id v44 = a8;
  v45 = v14;
  v42 = v13;
  if (v13)
  {
    if (!self->_validSecurityTokens)
    {
      uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      validSecurityTokens = self->_validSecurityTokens;
      self->_validSecurityTokens = v15;
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v68;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v68 != v19) {
            objc_enumerationMutation(v17);
          }
          BOOL v21 = [(NSMutableDictionary *)self->_validSecurityTokens objectForKey:*(void *)(*((void *)&v67 + 1) + 8 * i)];
          int v22 = [NSNumber numberWithUnsignedInt:a5];
          char v23 = [v21 containsObject:v22];

          if (v23)
          {

            BOOL v33 = 1;
            goto LABEL_36;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v76 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke;
    aBlock[3] = &unk_1E5587290;
    long long v24 = *(_OWORD *)&a6->var0[4];
    long long v65 = *(_OWORD *)a6->var0;
    long long v66 = v24;
    void aBlock[4] = self;
    v48 = _Block_copy(aBlock);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    *(void *)&long long v75 = 0x2020000000;
    BYTE8(v75) = 0;
    uint64_t v25 = [(AXIPCServer *)self delayedMessages];
    int v26 = [[AXIPCDelayedMessage alloc] initWithMessage:v43 completion:v44];
    [v25 addObject:v26];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v17;
    uint64_t v27 = [obj countByEnumeratingWithState:&v60 objects:v73 count:16];
    if (v27)
    {
      uint64_t v47 = *(void *)v61;
      while (2)
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v61 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v60 + 1) + 8 * v28);
          CFRunLoopRef Current = CFRunLoopGetCurrent();
          uint64_t v56 = 0;
          v57 = &v56;
          uint64_t v58 = 0x2020000000;
          char v59 = 0;
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke_142;
          v55[3] = &unk_1E55872B8;
          v55[4] = self;
          v55[5] = Current;
          if (_hasEntitlement_entitlements_clientPort_auditToken_message_completion__onceToken != -1) {
            dispatch_once(&_hasEntitlement_entitlements_clientPort_auditToken_message_completion__onceToken, v55);
          }
          uint64_t v31 = _hasEntitlement_entitlements_clientPort_auditToken_message_completion__SecurityCheckQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke_2;
          block[3] = &unk_1E55872E0;
          p_long long buf = &buf;
          id v32 = v48;
          block[4] = v29;
          id v51 = v32;
          v53 = &v56;
          CFRunLoopRef v54 = Current;
          dispatch_async(v31, block);
          while (!*((unsigned char *)v57 + 24))
            CFRunLoopRunSpecific();
          if (*(unsigned char *)(*((void *)&buf + 1) + 24))
          {
            id v38 = [(NSMutableDictionary *)self->_validSecurityTokens objectForKey:v29];
            if (!v38)
            {
              id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [(NSMutableDictionary *)self->_validSecurityTokens setObject:v38 forKey:v29];
            }
            v39 = [NSNumber numberWithUnsignedInt:a5];
            [v38 addObject:v39];

            v40 = AXLogIPC();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v71 = 138412290;
              uint64_t v72 = v29;
              _os_log_debug_impl(&dword_18D308000, v40, OS_LOG_TYPE_DEBUG, "Client does have entitlement: %@", v71, 0xCu);
            }

            _Block_object_dispose(&v56, 8);
            goto LABEL_35;
          }

          _Block_object_dispose(&v56, 8);
          ++v28;
        }
        while (v28 != v27);
        uint64_t v27 = [obj countByEnumeratingWithState:&v60 objects:v73 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }
LABEL_35:

    BOOL v33 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v34 = AXLogIPC();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      long long v35 = *(_OWORD *)&a6->var0[4];
      long long buf = *(_OWORD *)a6->var0;
      long long v75 = v35;
      v36 = [(AXIPCServer *)self _clientIdentificationForAuditToken:&buf];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v36;
      _os_log_impl(&dword_18D308000, v34, OS_LOG_TYPE_INFO, "taking entitlement slowpath for %{public}@", (uint8_t *)&buf, 0xCu);
    }
    long long v37 = *(_OWORD *)&a6->var0[4];
    long long buf = *(_OWORD *)a6->var0;
    long long v75 = v37;
    BOOL v33 = [(AXIPCServer *)self __slowpath__clientWithAuditToken:&buf hasRequiredEntitlementFromSet:v14];
  }
LABEL_36:

  return v33;
}

BOOL __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)token.val = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&token.val[4] = v5;
  int v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    id v7 = v6;
    CFErrorRef error = 0;
    CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, v3, &error);
    if (error)
    {
      uint64_t v9 = AXLogIPC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v13 = *(void **)(a1 + 32);
        long long v14 = *(_OWORD *)(a1 + 56);
        *(_OWORD *)token.val = *(_OWORD *)(a1 + 40);
        *(_OWORD *)&token.val[4] = v14;
        uint64_t v15 = [v13 _clientIdentificationForAuditToken:&token];
        token.val[0] = 138543618;
        *(void *)&token.val[1] = v15;
        LOWORD(token.val[3]) = 2112;
        *(void *)((char *)&token.val[3] + 2) = error;
        _os_log_error_impl(&dword_18D308000, v9, OS_LOG_TYPE_ERROR, "(fast path) error getting entitlements for task %{public}@: %@", (uint8_t *)&token, 0x16u);
      }
    }
    if (v8)
    {
      CFTypeID v10 = CFGetTypeID(v8);
      BOOL v11 = v10 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v8) != 0;
      CFRelease(v8);
    }
    else
    {
      BOOL v11 = 0;
    }
    if (error)
    {
      CFRelease(error);
      CFErrorRef error = 0;
    }
    CFRelease(v7);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke_142(uint64_t a1)
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v3 = dispatch_queue_create("AccessibilitySecurityCheckQueue", v2);
  CFAllocatorRef v4 = (void *)_hasEntitlement_entitlements_clientPort_auditToken_message_completion__SecurityCheckQueue;
  _hasEntitlement_entitlements_clientPort_auditToken_message_completion__SecurityCheckQueue = (uint64_t)v3;

  memset(&v5, 0, 72);
  v5.info = *(void **)(a1 + 32);
  v5.perform = (void (__cdecl *)(void *))_passiveEventHandler;
  _hasEntitlement_entitlements_clientPort_auditToken_message_completion__SourceRef = (uint64_t)CFRunLoopSourceCreate(0, 0, &v5);
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 40), (CFRunLoopSourceRef)_hasEntitlement_entitlements_clientPort_auditToken_message_completion__SourceRef, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
}

void __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  CFRunLoopSourceSignal((CFRunLoopSourceRef)_hasEntitlement_entitlements_clientPort_auditToken_message_completion__SourceRef);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 64));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (BOOL)__slowpath__clientWithAuditToken:(id *)a3 hasRequiredEntitlementFromSet:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  CFTypeRef v8 = SecTaskCreateWithAuditToken(v6, &token);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        CFStringRef v14 = *(const __CFString **)(*((void *)&v26 + 1) + 8 * v13);
        CFErrorRef error = 0;
        CFBooleanRef v15 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v8, v14, &error);
        if (v15)
        {
          CFBooleanRef v16 = v15;
          CFTypeID v17 = CFGetTypeID(v15);
          BOOL v18 = v17 == CFBooleanGetTypeID() && CFBooleanGetValue(v16) != 0;
          CFRelease(v16);
        }
        else
        {
          BOOL v18 = 0;
        }
        if (error)
        {
          uint64_t v19 = AXLogIPC();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            long long v20 = *(_OWORD *)&a3->var0[4];
            *(_OWORD *)token.val = *(_OWORD *)a3->var0;
            *(_OWORD *)&token.val[4] = v20;
            BOOL v21 = [(AXIPCServer *)self _clientIdentificationForAuditToken:&token];
            token.val[0] = 138543618;
            *(void *)&token.val[1] = v21;
            LOWORD(token.val[3]) = 2112;
            *(void *)((char *)&token.val[3] + 2) = error;
            _os_log_error_impl(&dword_18D308000, v19, OS_LOG_TYPE_ERROR, "(slow path) error getting entitlements for task %{public}@: %@", (uint8_t *)&token, 0x16u);
          }
          if (error) {
            CFRelease(error);
          }
        }
        if (v18)
        {
          BOOL v22 = 1;
          goto LABEL_22;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 0;
LABEL_22:

  if (v8) {
    CFRelease(v8);
  }

  return v22;
}

- (void)setQueueSize:(unsigned int)a3
{
  self->_customQueueSize = a3;
  [(AXIPCServer *)self _applyCustomQueueSize];
}

- (void)_handleClientInvalidation:(unsigned int)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  connectedClients = self->_connectedClients;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __41__AXIPCServer__handleClientInvalidation___block_invoke;
  v31[3] = &__block_descriptor_36_e12_B24__0_8_B16l;
  unsigned int v32 = a3;
  id v5 = [(NSMutableSet *)connectedClients objectsPassingTest:v31];
  CFAllocatorRef v6 = [v5 anyObject];

  if (v6)
  {
    id clientInvalidationHandler = (void (**)(id, uint64_t, void *))self->_clientInvalidationHandler;
    if (clientInvalidationHandler)
    {
      uint64_t v8 = [v6 port];
      id v9 = [v6 identifier];
      clientInvalidationHandler[2](clientInvalidationHandler, v8, v9);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = self->_validSecurityTokens;
    uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v28;
      *(void *)&long long v11 = 138543618;
      long long v25 = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          CFBooleanRef v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          CFBooleanRef v16 = -[NSMutableDictionary objectForKey:](self->_validSecurityTokens, "objectForKey:", v15, v25);
          CFTypeID v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "port"));
          int v18 = [v16 containsObject:v17];

          if (v18)
          {
            uint64_t v19 = AXLogIPC();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              long long v20 = [v6 identifier];
              *(_DWORD *)long long buf = v25;
              v34 = v15;
              __int16 v35 = 2114;
              v36 = v20;
              _os_log_impl(&dword_18D308000, v19, OS_LOG_TYPE_INFO, "Cleaned up cached validation entitlement for %{public}@ = %{public}@", buf, 0x16u);
            }
            BOOL v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "port"));
            [v16 removeObject:v21];
          }
        }
        uint64_t v12 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v12);
    }

    BOOL v22 = AXLogIPC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      char v23 = [v6 identifier];
      *(_DWORD *)long long buf = 138543362;
      v34 = v23;
      _os_log_impl(&dword_18D308000, v22, OS_LOG_TYPE_INFO, "Client disconnected %{public}@", buf, 0xCu);
    }
    [(NSMutableSet *)self->_connectedClients removeObject:v6];
  }
  else
  {
    long long v24 = AXLogIPC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18D308000, v24, OS_LOG_TYPE_INFO, "We don't have a record of this client being registered. Strange that we got an invalidation.", buf, 2u);
    }
  }
}

BOOL __41__AXIPCServer__handleClientInvalidation___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 port];
  int v6 = *(_DWORD *)(a1 + 32);
  if (v5 == v6) {
    *a3 = 1;
  }
  return v5 == v6;
}

- (void)_applyCustomQueueSize
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_18D308000, log, OS_LOG_TYPE_ERROR, "could not set custom queue size to %u: 0x%08x", (uint8_t *)v4, 0xEu);
}

- (void)_startServerThread
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18D308000, v0, v1, "Could not start server thread. Could not allocate mach port. self:%{public}@", v2, v3, v4, v5, v6);
}

- (void)serverClientRegistrationInvalidated:(id)a3
{
  uint64_t v4 = [a3 port];

  [(AXIPCServer *)self _handleClientInvalidation:v4];
}

- (void)_handleClientRegistration:(id)a3
{
  id v4 = a3;
  if (!self->_connectedClients)
  {
    uint64_t v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connectedClients = self->_connectedClients;
    self->_connectedClients = v5;
  }
  uint64_t v7 = [v4 clientPort];
  uint64_t v8 = [v4 payload];
  id v9 = [v8 objectForKey:@"identifier"];

  if (![v4 clientPort] || objc_msgSend(v4, "clientPort") == -1)
  {
    AXLogIPC();
    uint64_t v10 = (AXIPCServerClientRegistration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      -[AXIPCServer _handleClientRegistration:](v4);
    }
  }
  else
  {
    uint64_t v10 = [[AXIPCServerClientRegistration alloc] initWithPort:v7 identifier:v9];
    if ([(NSMutableSet *)self->_connectedClients containsObject:v10])
    {
      long long v11 = AXLogIPC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_DEFAULT, "Clients only need to register once!", v12, 2u);
      }
    }
    else
    {
      [(AXIPCServerClientRegistration *)v10 setDelegate:self];
      [(NSMutableSet *)self->_connectedClients addObject:v10];
    }
  }
}

BOOL __85__AXIPCServer__handleIncomingMessage_securityToken_auditToken_clientPort_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 message];
  uint64_t v4 = [v3 uniqueID];
  BOOL v5 = v4 == [*(id *)(a1 + 32) uniqueID];

  return v5;
}

- (BOOL)_handleErrorWithMessage:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    uint8_t v6 = AXLogIPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXIPCServer _handleErrorWithMessage:outError:]();
    }

    if (a4)
    {
      uint64_t v7 = [MEMORY[0x1E4F48360] errorWithDescription:@"%@", v5];
LABEL_8:
      id v8 = v7;
      *a4 = v8;
    }
  }
  else if (a4)
  {
    uint64_t v7 = 0;
    goto LABEL_8;
  }

  return v5 != 0;
}

- (id)_clientIdentificationForAuditToken:(id *)a3
{
  uint64_t v3 = NSString;
  uint64_t v4 = [NSNumber numberWithInt:a3->var0[5]];
  id v5 = [v3 stringWithFormat:@"PID:%@", v4];

  return v5;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void)setHandlers:(id)a3
{
}

- (unsigned)machPort
{
  return self->_serverPort;
}

- (void)setDelayedMessages:(id)a3
{
}

- (BOOL)perPidService
{
  return self->_perPidService;
}

- (void)setPerPidService:(BOOL)a3
{
  self->_perPidService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedMessages, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_validSecurityTokens, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong(&self->_clientInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);

  objc_storeStrong(&self->_defaultHandler, 0);
}

- (void)_handleClientRegistration:(void *)a1 .cold.1(void *a1)
{
  [a1 clientPort];
  OUTLINED_FUNCTION_1_2(&dword_18D308000, v1, v2, "someone tried to register with a bogus client port (%llx)", v3, v4, v5, v6, 0);
}

- (void)_processValidatedMessage:(const char *)a1 completion:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_18D308000, v2, v3, "target does not respond to selector: %@", v4, v5, v6, v7, v8);
}

- (void)_handleErrorWithMessage:outError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18D308000, v0, v1, "ERROR: %{public}@", v2, v3, v4, v5, v6);
}

@end