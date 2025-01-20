@interface EMRemoteConnection
+ (OS_os_log)log;
- (BOOL)_respondsToRemoteSelector:(SEL)a3;
- (BOOL)prefersImmediateActivity;
- (EMRemoteConnection)initWithProtocol:(id)a3 proxyGenerator:(id)a4;
- (EMRemoteProxyGenerator)generator;
- (NSString)debugDescription;
- (NSString)description;
- (Protocol)protocol;
- (id)_methodSignatureForRemoteSelector:(SEL)a3;
- (id)proxy;
- (id)proxyCreator:(id *)a3;
- (id)reattemptingRemoteObjectProxy;
- (id)reattemptingRemoteObjectProxyWithReattemptHandler:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)requestRecoveryAssertion;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_reattemptInvocation:(id)a3 withProxy:(id)a4 originalError:(id)a5;
- (void)_sendInvocation:(id)a3 withProxy:(id)a4;
- (void)addRecoveryHandler:(id)a3;
- (void)addResetHandler:(id)a3;
- (void)dealloc;
- (void)recover;
- (void)reset;
- (void)setGenerator:(id)a3;
- (void)voucherInitialized;
- (void)voucherInvalidated;
@end

@implementation EMRemoteConnection

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_76(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    v2 = CopyInvocation(*(void **)(a1 + 32));
    [v2 setTarget:0];
    [v2 retainArguments];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_2_77;
    v15[3] = &unk_1E63E5E38;
    id v18 = *(id *)(a1 + 64);
    v3 = *(void **)(a1 + 48);
    v15[4] = *(void *)(a1 + 40);
    id v16 = v2;
    id v17 = v3;
    id v4 = v2;
    v5 = (void (**)(void, void))MEMORY[0x1C18A2160](v15);
  }
  else
  {
    v5 = 0;
  }
  v6 = *(void **)(a1 + 40);
  id v14 = 0;
  v7 = [v6 proxyCreator:&v14];
  id v8 = v14;
  v9 = v8;
  if (v7)
  {
    if (v5)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_3;
      v12[3] = &unk_1E63E55F0;
      v12[4] = *(void *)(a1 + 40);
      v13 = v5;
      v10 = [v7 remoteObjectProxyWithErrorHandler:v12];
    }
    else
    {
      v10 = [v7 remoteObjectProxy];
    }
    [*(id *)(a1 + 32) invokeWithTarget:v10];
    if (*(void *)(a1 + 56))
    {
      uint64_t v11 = 0;
      [*(id *)(a1 + 32) getReturnValue:&v11];
      if (v11) {
        [*(id *)(a1 + 56) addChild:v11 withPendingUnitCount:1];
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v5)
  {
    v10 = v8;
    if (!v8)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Creating an proxy creator failed but we didn't got an error");
    }
    ((void (**)(void, void *))v5)[2](v5, v10);
    if (!v9) {
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)_sendInvocation:(id)a3 withProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 reattemptHandler];
  if ([v8 isSynchronous])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke;
    block[3] = &unk_1E63E5E10;
    block[4] = self;
    id v28 = v9;
    SEL v29 = a2;
    id v27 = v7;
    id v11 = v9;
    dispatch_sync(queue, block);
  }
  else
  {
    v12 = CopyInvocation(v7);
    [v12 retainArguments];
    id v11 = [v7 methodSignature];
    uint64_t v13 = [v11 _classForObjectAtArgumentIndex:-1];
    if (v13 == objc_opt_class())
    {
      id v14 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
      id v25 = v14;
      [v7 setReturnValue:&v25];
    }
    else
    {
      id v14 = 0;
    }
    v15 = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_76;
    v19[3] = &unk_1E63E5E60;
    id v24 = v9;
    id v20 = v12;
    v21 = self;
    id v22 = v8;
    id v23 = v14;
    id v16 = v14;
    id v17 = v12;
    id v18 = v9;
    dispatch_async(v15, v19);
  }
}

- (id)proxyCreator:(id *)a3
{
  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  v6 = self->_currentProxy;
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      protocol = self->_protocol;
      id v14 = 0;
      v10 = [WeakRetained generateProxyForProtocol:protocol error:&v14];
      id v11 = v14;
      currentProxy = self->_currentProxy;
      self->_currentProxy = v10;

      v6 = v10;
    }
    else if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"EMErrorDomain" code:2 userInfo:0];
      id v11 = 0;
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
      v6 = 0;
    }
  }
  os_unfair_lock_unlock(p_proxyLock);
  return v6;
}

- (id)remoteObjectProxy
{
  v3 = [_EMRemoteInterfaceDistantObject alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  v5 = defaultNonReattemptingHandlerForConnection(self);
  v6 = [(_EMRemoteInterfaceDistantObject *)v3 initWithRemoteInterface:self proxyGenerator:WeakRetained synchronous:0 reattemptHandler:v5];

  return v6;
}

- (id)_methodSignatureForRemoteSelector:(SEL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = CFDictionaryGetValue(self->_knownSelectors, a3);
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    if ((unint64_t)protocol_getMethodDescription(self->_protocol, a3, 1, 1).name
      || (unint64_t)protocol_getMethodDescription(self->_protocol, a3, 0, 1).name)
    {
      v6 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:_protocol_getMethodTypeEncoding()];
      os_unfair_lock_lock(p_lock);
      CFDictionarySetValue(self->_knownSelectors, a3, v6);
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [_EMRemoteInterfaceDistantObject alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  id v7 = nonReattemptingHandlerForErrorHandler(v4);
  id v8 = [(_EMRemoteInterfaceDistantObject *)v5 initWithRemoteInterface:self proxyGenerator:WeakRetained synchronous:1 reattemptHandler:v7];

  return v8;
}

- (id)reattemptingRemoteObjectProxy
{
  v3 = [_EMRemoteInterfaceDistantObject alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  v5 = defaultReattemptingHandlerForConnection(self);
  v6 = [(_EMRemoteInterfaceDistantObject *)v3 initWithRemoteInterface:self proxyGenerator:WeakRetained synchronous:0 reattemptHandler:v5];

  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [_EMRemoteInterfaceDistantObject alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  id v7 = nonReattemptingHandlerForErrorHandler(v4);
  id v8 = [(_EMRemoteInterfaceDistantObject *)v5 initWithRemoteInterface:self proxyGenerator:WeakRetained synchronous:0 reattemptHandler:v7];

  return v8;
}

- (EMRemoteConnection)initWithProtocol:(id)a3 proxyGenerator:(id)a4
{
  id v7 = (Protocol *)a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)EMRemoteConnection;
  v9 = [(EMRemoteConnection *)&v26 init];
  if (v9)
  {
    v10 = NSString;
    id v11 = NSStringFromProtocol(v7);
    v12 = [v10 stringWithFormat:@"com.apple.email.EMRemoteConnection.%@", v11];

    id v13 = v12;
    id v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v16 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2(v14, v15, v16);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v17;

    objc_storeWeak((id *)&v9->_generator, v8);
    objc_storeStrong((id *)&v9->_protocol, a3);
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resetHandlers = v9->_resetHandlers;
    v9->_resetHandlers = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recoveryHandlers = v9->_recoveryHandlers;
    v9->_recoveryHandlers = v21;

    id v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingReattempts = v9->_pendingReattempts;
    v9->_pendingReattempts = v23;

    v9->_knownSelectors = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    atomic_store(0, &v9->_activeVouchers);
  }
  return v9;
}

- (void)dealloc
{
  CFRelease(self->_knownSelectors);
  v3.receiver = self;
  v3.super_class = (Class)EMRemoteConnection;
  [(EMRemoteConnection *)&v3 dealloc];
}

- (void)addRecoveryHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  recoveryHandlers = self->_recoveryHandlers;
  id v7 = (void *)[v5 copy];

  id v8 = (void *)MEMORY[0x1C18A2160](v7);
  [(NSMutableArray *)recoveryHandlers addObject:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)addResetHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  resetHandlers = self->_resetHandlers;
  id v7 = (void *)[v5 copy];

  id v8 = (void *)MEMORY[0x1C18A2160](v7);
  [(NSMutableArray *)resetHandlers addObject:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_currentProxy, 0);
  objc_storeStrong((id *)&self->_pendingReattempts, 0);
  objc_storeStrong((id *)&self->_recoveryHandlers, 0);
  objc_storeStrong((id *)&self->_resetHandlers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v23 = 0;
  objc_super v3 = [v2 proxyCreator:&v23];
  id v4 = v23;
  id v5 = v4;
  if (v3)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_2;
    v19 = &unk_1E63E5DE8;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v21 = v6;
    uint64_t v22 = v7;
    uint64_t v20 = *(void *)(a1 + 32);
    id v8 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&v16];
    objc_msgSend(*(id *)(a1 + 40), "invokeWithTarget:", v8, v16, v17, v18, v19);

    v9 = v21;
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    id v14 = v4;
    if (!v4)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Creating an proxy creator failed but we didn't got an error");
    }
    int v15 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14);
    if (!v5) {

    }
    if (v15)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"EMRemoteConnection.m" lineNumber:393 description:@"reattempt handler returned YES for a synchronous message which is not allowed."];
      goto LABEL_3;
    }
  }
LABEL_4:
  if (v5)
  {
    v10 = +[EMRemoteConnection log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = objc_msgSend(v5, "ef_publicDescription");
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to retrive a valid proxyCreator due to error: %{public}@", buf, 0x16u);
    }
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__EMRemoteConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_35 != -1) {
    dispatch_once(&log_onceToken_35, block);
  }
  v2 = (void *)log_log_35;
  return (OS_os_log *)v2;
}

void __25__EMRemoteConnection_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_35;
  log_log_35 = (uint64_t)v1;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = NSStringFromProtocol(self->_protocol);
  id v6 = [(EMRemoteConnection *)self proxy];
  uint64_t v7 = @"active";
  if (!v6) {
    uint64_t v7 = @"inactive";
  }
  id v8 = [v3 stringWithFormat:@"<%@: %p> %@ (%@)", v4, self, v5, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableArray *)self->_resetHandlers count];
  uint64_t v5 = [(NSMutableArray *)self->_recoveryHandlers count];
  id v6 = (void *)[(NSMutableArray *)self->_pendingReattempts copy];
  os_unfair_lock_unlock(p_lock);
  uint64_t v7 = NSString;
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromProtocol(self->_protocol);
  v10 = [(EMRemoteConnection *)self proxy];
  uint64_t v11 = [v7 stringWithFormat:@"<%@: %p> %@: %ld reset, %ld recovery, currentProxy=%p, pendingReattempts=%@", v8, self, v9, v4, v5, v10, v6];

  return (NSString *)v11;
}

- (void)reset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_waitingForRecovery = 1;
  uint64_t v4 = (void *)[(NSMutableArray *)self->_resetHandlers copy];
  os_unfair_lock_unlock(p_lock);
  os_unfair_lock_lock(&self->_proxyLock);
  currentProxy = self->_currentProxy;
  self->_currentProxy = 0;

  os_unfair_lock_unlock(&self->_proxyLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)recover
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_waitingForRecovery = 0;
  uint64_t v4 = (void *)[(NSMutableArray *)self->_pendingReattempts copy];
  uint64_t v5 = (void *)[(NSMutableArray *)self->_recoveryHandlers copy];
  [(NSMutableArray *)self->_pendingReattempts removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v7);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "perform", (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)proxy
{
  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  uint64_t v4 = self->_currentProxy;
  os_unfair_lock_unlock(p_proxyLock);
  return v4;
}

- (id)requestRecoveryAssertion
{
  v2 = [[EMRemoteConnectionRecoveryAssertion alloc] initWithConnection:self];
  return v2;
}

- (BOOL)prefersImmediateActivity
{
  unsigned int v2 = atomic_load(&self->_activeVouchers);
  return v2 != 0;
}

- (BOOL)_respondsToRemoteSelector:(SEL)a3
{
  SEL name = protocol_getMethodDescription(self->_protocol, a3, 1, 1).name;
  if (!name) {
    SEL name = protocol_getMethodDescription(self->_protocol, a3, 0, 1).name;
  }
  return name != 0;
}

- (void)_reattemptInvocation:(id)a3 withProxy:(id)a4 originalError:(id)a5
{
  id v6 = +[_EMRemoteInterfaceDistantObjectReattempt recordedAttemptWithOriginalInvocation:a3 target:a4 error:a5];
  os_unfair_lock_lock(&self->_lock);
  if (self->_waitingForRecovery)
  {
    [(NSMutableArray *)self->_pendingReattempts addObject:v6];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    [v6 perform];
  }
}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[5];
  if (v4)
  {
    id v7 = v3;
    int v5 = (*(uint64_t (**)(void))(v4 + 16))();
    id v3 = v7;
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a1[6] object:a1[4] file:@"EMRemoteConnection.m" lineNumber:386 description:@"reattempt handler returned YES for a synchronous message which is not allowed."];

      id v3 = v7;
    }
  }
}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_2_77(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))()) {
    [*(id *)(a1 + 32) _reattemptInvocation:*(void *)(a1 + 40) withProxy:*(void *)(a1 + 48) originalError:v3];
  }
}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_4;
  v7[3] = &unk_1E63E36B0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)reattemptingRemoteObjectProxyWithReattemptHandler:(id)a3
{
  id v4 = a3;
  id v5 = [_EMRemoteInterfaceDistantObject alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  id v7 = [(_EMRemoteInterfaceDistantObject *)v5 initWithRemoteInterface:self proxyGenerator:WeakRetained synchronous:0 reattemptHandler:v4];

  return v7;
}

- (void)voucherInitialized
{
}

- (void)voucherInvalidated
{
}

- (Protocol)protocol
{
  return (Protocol *)objc_getProperty(self, a2, 16, 1);
}

- (EMRemoteProxyGenerator)generator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  return (EMRemoteProxyGenerator *)WeakRetained;
}

- (void)setGenerator:(id)a3
{
}

@end