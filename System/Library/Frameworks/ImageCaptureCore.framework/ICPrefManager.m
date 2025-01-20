@interface ICPrefManager
+ (id)defaultAuthManager;
+ (void)defaultAuthManager;
- (BOOL)getGoodNewsStatus;
- (BOOL)openRemoteAuthenticationManager;
- (ICPrefManager)init;
- (NSXPCConnection)authConnection;
- (id)authManagerConnection;
- (id)getContentsAuthorizationStatus;
- (id)getControlAuthorizationStatus;
- (id)remoteAuthManager;
- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5;
- (void)dealloc;
- (void)endQuery:(id)a3;
- (void)invalidateQueries;
- (void)requestContentsAuthorizationShouldPrompt:(BOOL)a3 completion:(id)a4;
- (void)requestControlAuthorizationShouldPrompt:(BOOL)a3 completion:(id)a4;
- (void)resetContentsAuthorizationWithCompletion:(id)a3;
- (void)resetControlAuthorizationWithCompletion:(id)a3;
- (void)setAuthConnection:(id)a3;
- (void)startQuery:(id)a3;
@end

@implementation ICPrefManager

+ (id)defaultAuthManager
{
  if (defaultAuthManager__sOnceToken != -1) {
    dispatch_once(&defaultAuthManager__sOnceToken, &__block_literal_global);
  }
  v2 = (void *)defaultAuthManager__sAuthManager;
  if (!defaultAuthManager__sAuthManager)
  {
    __ICOSLogCreate();
    v3 = [NSString stringWithFormat:@"Failed to create an instance of ICPrefManager"];
    v4 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      +[ICPrefManager defaultAuthManager];
    }

    v2 = (void *)defaultAuthManager__sAuthManager;
  }

  return v2;
}

uint64_t __35__ICPrefManager_defaultAuthManager__block_invoke()
{
  defaultAuthManager__sAuthManager = objc_alloc_init(ICPrefManager);

  return MEMORY[0x1F41817F8]();
}

- (id)remoteAuthManager
{
  v3 = [(ICPrefManager *)self authConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__ICPrefManager_remoteAuthManager__block_invoke;
  v6[3] = &unk_1E63D7280;
  v6[4] = self;
  v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

void __34__ICPrefManager_remoteAuthManager__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = a2;
    __ICOSLogCreate();
    v4 = @"xpc error";
    if ((unint64_t)[@"xpc error" length] >= 0x15)
    {
      v5 = objc_msgSend(@"xpc error", "substringWithRange:", 0, 18);
      v4 = [v5 stringByAppendingString:@".."];
    }
    v6 = NSString;
    v7 = [*(id *)(a1 + 32) authConnection];
    v8 = [v6 stringWithFormat:@"%@:%@?", v7, v3];

    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v4;
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      uint64_t v13 = [(__CFString *)v10 UTF8String];
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = addSelectorToInterface_selectorString_origin__onceToken;
  v8 = (NSString *)a4;
  id v11 = a3;
  if (v7 != -1) {
    dispatch_once(&addSelectorToInterface_selectorString_origin__onceToken, &__block_literal_global_14);
  }
  uint64_t v9 = addSelectorToInterface_selectorString_origin__incomingClasses;
  SEL v10 = NSSelectorFromString(v8);

  [v11 setClasses:v9 forSelector:v10 argumentIndex:0 ofReply:v5];
}

uint64_t __62__ICPrefManager_addSelectorToInterface_selectorString_origin___block_invoke()
{
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  addSelectorToInterface_selectorString_origin__incomingClasses = objc_msgSend(v11, "initWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

- (ICPrefManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)ICPrefManager;
  uint64_t v2 = [(ICPrefManager *)&v11 init];
  uint64_t v3 = v2;
  if (v2)
  {
    authConnection = v2->_authConnection;
    v2->_authConnection = 0;

    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    authConnectionSemaphores = v3->_authConnectionSemaphores;
    v3->_authConnectionSemaphores = v5;

    v3->_authConnectionLock._os_unfair_lock_opaque = 0;
    [(ICPrefManager *)v3 openRemoteAuthenticationManager];
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __21__ICPrefManager_init__block_invoke;
    block[3] = &unk_1E63D72A8;
    SEL v10 = v3;
    dispatch_async(v7, block);
  }
  return v3;
}

uint64_t __21__ICPrefManager_init__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  uint64_t v2 = @"Auth Query";
  if ((unint64_t)[@"Auth Query" length] >= 0x15)
  {
    uint64_t v3 = objc_msgSend(@"Auth Query", "substringWithRange:", 0, 18);
    uint64_t v2 = [v3 stringByAppendingString:@".."];
  }
  uint64_t v4 = [NSString stringWithFormat:@"Fetching Authorization Status"];
  uint64_t v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    int v11 = 136446466;
    uint64_t v12 = [(__CFString *)v6 UTF8String];
    __int16 v13 = 2114;
    __int16 v14 = v4;
    _os_log_impl(&dword_1BEEFF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v11, 0x16u);
  }
  id v8 = (id)[*(id *)(a1 + 32) getContentsAuthorizationStatus];
  id v9 = (id)[*(id *)(a1 + 32) getControlAuthorizationStatus];
  return [*(id *)(a1 + 32) getGoodNewsStatus];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_authConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ICPrefManager;
  [(ICPrefManager *)&v3 dealloc];
}

- (id)authManagerConnection
{
  objc_super v3 = [(ICPrefManager *)self authConnection];

  if (!v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.icprefd-xpc"];
    [(ICPrefManager *)self setAuthConnection:v4];
  }

  return [(ICPrefManager *)self authConnection];
}

- (void)startQuery:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_authConnectionLock);
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v5 = @"Add(ONE)";
    if ((unint64_t)[@"Add(ONE)" length] >= 0x15)
    {
      uint64_t v6 = objc_msgSend(@"Add(ONE)", "substringWithRange:", 0, 18);
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    uint64_t v7 = NSString;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    SEL v10 = [v7 stringWithFormat:@"%@", v9];

    int v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v5;
      __int16 v13 = v11;
      *(_DWORD *)buf = 136446466;
      uint64_t v15 = [(__CFString *)v12 UTF8String];
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  [(NSMutableArray *)self->_authConnectionSemaphores addObject:v4];
  os_unfair_lock_unlock(&self->_authConnectionLock);
}

- (void)endQuery:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_authConnectionLock);
  if (v4)
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      uint64_t v5 = @"Rem(ONE)";
      if ((unint64_t)[@"Rem(ONE)" length] >= 0x15)
      {
        uint64_t v6 = objc_msgSend(@"Rem(ONE)", "substringWithRange:", 0, 18);
        uint64_t v5 = [v6 stringByAppendingString:@".."];
      }
      uint64_t v7 = NSString;
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      SEL v10 = [v7 stringWithFormat:@"%@", v9];

      int v11 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v5;
        __int16 v13 = v11;
        *(_DWORD *)buf = 136446466;
        uint64_t v15 = [(__CFString *)v12 UTF8String];
        __int16 v16 = 2114;
        v17 = v10;
        _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    [(NSMutableArray *)self->_authConnectionSemaphores removeObject:v4];
  }
  os_unfair_lock_unlock(&self->_authConnectionLock);
}

- (void)invalidateQueries
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_authConnectionLock = &self->_authConnectionLock;
  os_unfair_lock_lock(&self->_authConnectionLock);
  if ([(NSMutableArray *)self->_authConnectionSemaphores count])
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      id v4 = @"Sig(ALL)";
      if ((unint64_t)[@"Sig(ALL)" length] >= 0x15)
      {
        uint64_t v5 = objc_msgSend(@"Sig(ALL)", "substringWithRange:", 0, 18);
        id v4 = [v5 stringByAppendingString:@".."];
      }
      uint64_t v6 = NSString;
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = [v6 stringWithFormat:@"%@", v8];

      SEL v10 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = v4;
        uint64_t v12 = v10;
        *(_DWORD *)buf = 136446466;
        uint64_t v24 = [(__CFString *)v11 UTF8String];
        __int16 v25 = 2114;
        v26 = v9;
        _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  __int16 v13 = self->_authConnectionSemaphores;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v18 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_authConnectionLock);
}

- (BOOL)openRemoteAuthenticationManager
{
  objc_super v3 = [(ICPrefManager *)self authManagerConnection];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A36F10];
    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A36F10];
    [(ICPrefManager *)self addSelectorToInterface:v5 selectorString:@"requestContentsAuthorizationStatusShouldPrompt:withReply:" origin:1];
    [(ICPrefManager *)self addSelectorToInterface:v5 selectorString:@"requestControlAuthorizationStatusShouldPrompt:withReply:" origin:1];
    [(ICPrefManager *)self addSelectorToInterface:v5 selectorString:@"requestGoodNewsStatusWithReply:" origin:1];
    [(ICPrefManager *)self addSelectorToInterface:v5 selectorString:@"resetContentsAuthorizationStatusWithReply:" origin:1];
    [(ICPrefManager *)self addSelectorToInterface:v5 selectorString:@"resetControlAuthorizationStatusWithReply:" origin:1];
    [v3 setExportedInterface:v4];
    [v3 setRemoteObjectInterface:v5];
    [v3 setExportedObject:self];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    int v11 = __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke;
    uint64_t v12 = &unk_1E63D72D0;
    __int16 v13 = self;
    uint64_t v14 = self;
    uint64_t v6 = self;
    [v3 setInvalidationHandler:&v9];
    uint64_t v7 = objc_msgSend(v3, "invalidationHandler", v9, v10, v11, v12, v13, v14);
    [v3 setInterruptionHandler:v7];

    [v3 resume];
  }

  return v3 != 0;
}

void __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke_2;
  block[3] = &unk_1E63D72A8;
  uint64_t v2 = *(void **)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  uint64_t v3 = _block_invoke_onceToken;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&_block_invoke_onceToken, block);
  }
  [v4 setAuthConnection:0];
  [*(id *)(a1 + 40) invalidateQueries];
  double v5 = drand48();
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 + 1000000000.0));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke_78;
  v7[3] = &unk_1E63D72A8;
  v7[4] = *(void *)(a1 + 40);
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
}

void __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke_2()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  uint64_t v0 = @"Auth ▼";
  if ((unint64_t)[@"Auth ▼" length] >= 0x15)
  {
    uint64_t v1 = objc_msgSend(@"Auth ▼", "substringWithRange:", 0, 18);
    uint64_t v0 = [v1 stringByAppendingString:@".."];
  }
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  double v5 = [v2 stringWithFormat:@"%@", v4];

  dispatch_time_t v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v0;
    id v8 = v6;
    *(_DWORD *)buf = 136446466;
    uint64_t v10 = [(__CFString *)v7 UTF8String];
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1BEEFF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

uint64_t __48__ICPrefManager_openRemoteAuthenticationManager__block_invoke_78(uint64_t a1)
{
  return [*(id *)(a1 + 32) openRemoteAuthenticationManager];
}

- (id)getContentsAuthorizationStatus
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  long long v20 = __Block_byref_object_dispose_;
  long long v21 = @"ICAuthorizationStatusNotDetermined";
  uint64_t v3 = [(ICPrefManager *)self authConnection];
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    [(ICPrefManager *)self startQuery:v4];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__ICPrefManager_getContentsAuthorizationStatus__block_invoke;
    v13[3] = &unk_1E63D72F8;
    uint64_t v15 = &v16;
    double v5 = v4;
    uint64_t v14 = v5;
    [(ICPrefManager *)self requestContentsAuthorizationShouldPrompt:0 completion:v13];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    [(ICPrefManager *)self endQuery:v5];
  }
  __ICOSLogCreate();
  if ((unint64_t)[@"🔐 ICAuth" length] < 0x15)
  {
    uint64_t v7 = @"🔐 ICAuth";
  }
  else
  {
    dispatch_time_t v6 = objc_msgSend(@"🔐 ICAuth", "substringWithRange:", 0, 18);
    uint64_t v7 = [v6 stringByAppendingString:@".."];
  }
  id v8 = [NSString stringWithFormat:@"Contents Access: %@", v17[5]];
  uint64_t v9 = (id)_gICOSLog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(__CFString *)v7 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v23 = v10;
    __int16 v24 = 2114;
    __int16 v25 = v8;
    _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

intptr_t __47__ICPrefManager_getContentsAuthorizationStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v7);
}

- (void)requestContentsAuthorizationShouldPrompt:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(ICPrefManager *)self authConnection];
  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v9 = [(ICPrefManager *)self remoteAuthManager];
    [(ICPrefManager *)self startQuery:v8];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __69__ICPrefManager_requestContentsAuthorizationShouldPrompt_completion___block_invoke;
    uint64_t v14 = &unk_1E63D7320;
    dispatch_semaphore_t v15 = v8;
    id v16 = v6;
    uint64_t v10 = v8;
    [v9 requestContentsAuthorizationStatusShouldPrompt:v4 withReply:&v11];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v10, v11, v12, v13, v14);
  }
  else
  {
    (*((void (**)(id, void *))v6 + 2))(v6, &unk_1F1A29C88);
  }
}

intptr_t __69__ICPrefManager_requestContentsAuthorizationShouldPrompt_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (id)getControlAuthorizationStatus
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  long long v20 = __Block_byref_object_dispose_;
  long long v21 = @"ICAuthorizationStatusNotDetermined";
  uint64_t v3 = [(ICPrefManager *)self authConnection];
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    [(ICPrefManager *)self startQuery:v4];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__ICPrefManager_getControlAuthorizationStatus__block_invoke;
    v13[3] = &unk_1E63D72F8;
    dispatch_semaphore_t v15 = &v16;
    uint64_t v5 = v4;
    uint64_t v14 = v5;
    [(ICPrefManager *)self requestControlAuthorizationShouldPrompt:0 completion:v13];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    [(ICPrefManager *)self endQuery:v5];
  }
  __ICOSLogCreate();
  if ((unint64_t)[@"🔐 ICAuth" length] < 0x15)
  {
    uint64_t v7 = @"🔐 ICAuth";
  }
  else
  {
    id v6 = objc_msgSend(@"🔐 ICAuth", "substringWithRange:", 0, 18);
    uint64_t v7 = [v6 stringByAppendingString:@".."];
  }
  dispatch_semaphore_t v8 = [NSString stringWithFormat:@"Control Access:  %@", v17[5]];
  uint64_t v9 = (id)_gICOSLog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(__CFString *)v7 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v23 = v10;
    __int16 v24 = 2114;
    __int16 v25 = v8;
    _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

intptr_t __46__ICPrefManager_getControlAuthorizationStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v7);
}

- (void)requestControlAuthorizationShouldPrompt:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(ICPrefManager *)self authConnection];
  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    [(ICPrefManager *)self startQuery:v8];
    uint64_t v9 = [(ICPrefManager *)self remoteAuthManager];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __68__ICPrefManager_requestControlAuthorizationShouldPrompt_completion___block_invoke;
    uint64_t v14 = &unk_1E63D7320;
    dispatch_semaphore_t v15 = v8;
    id v16 = v6;
    uint64_t v10 = v8;
    [v9 requestControlAuthorizationStatusShouldPrompt:v4 withReply:&v11];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    -[ICPrefManager endQuery:](self, "endQuery:", v10, v11, v12, v13, v14);
  }
  else
  {
    (*((void (**)(id, void *))v6 + 2))(v6, &unk_1F1A29CB0);
  }
}

intptr_t __68__ICPrefManager_requestControlAuthorizationShouldPrompt_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (BOOL)getGoodNewsStatus
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICPrefManager *)self authConnection];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    [(ICPrefManager *)self startQuery:v4];
    uint64_t v5 = [(ICPrefManager *)self remoteAuthManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __34__ICPrefManager_getGoodNewsStatus__block_invoke;
    v15[3] = &unk_1E63D7348;
    uint64_t v17 = &v18;
    id v6 = v4;
    id v16 = v6;
    [v5 requestGoodNewsStatusWithReply:v15];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    [(ICPrefManager *)self endQuery:v6];
  }
  __ICOSLogCreate();
  if ((unint64_t)[@"🔐 ICAuth" length] < 0x15)
  {
    dispatch_semaphore_t v8 = @"🔐 ICAuth";
  }
  else
  {
    uint64_t v7 = objc_msgSend(@"🔐 ICAuth", "substringWithRange:", 0, 18);
    dispatch_semaphore_t v8 = [v7 stringByAppendingString:@".."];
  }
  if (*((unsigned char *)v19 + 24)) {
    uint64_t v9 = "Yes";
  }
  else {
    uint64_t v9 = "No";
  }
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Shown Good News: %s", v9);
  uint64_t v11 = (id)_gICOSLog;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(__CFString *)v8 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    __int16 v25 = v10;
    _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  BOOL v13 = *((unsigned char *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  return v13;
}

intptr_t __34__ICPrefManager_getGoodNewsStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == @"ICAuthorizationStatusAuthorized";

  dispatch_semaphore_t v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

- (void)resetContentsAuthorizationWithCompletion:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICPrefManager *)self authConnection];
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    [(ICPrefManager *)self startQuery:v6];
    uint64_t v7 = [(ICPrefManager *)self remoteAuthManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__ICPrefManager_resetContentsAuthorizationWithCompletion___block_invoke;
    v9[3] = &unk_1E63D7320;
    dispatch_semaphore_t v10 = v6;
    id v11 = v4;
    dispatch_semaphore_t v8 = v6;
    [v7 resetContentsAuthorizationStatusWithReply:v9];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    [(ICPrefManager *)self endQuery:v8];
  }
  else
  {
    uint64_t v7 = [(ICPrefManager *)self getContentsAuthorizationStatus];
    uint64_t v12 = @"ICAuthorizationStatus";
    v13[0] = v7;
    dispatch_semaphore_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    (*((void (**)(id, NSObject *))v4 + 2))(v4, v8);
  }
}

intptr_t __58__ICPrefManager_resetContentsAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (void)resetControlAuthorizationWithCompletion:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICPrefManager *)self authConnection];
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    [(ICPrefManager *)self startQuery:v6];
    uint64_t v7 = [(ICPrefManager *)self remoteAuthManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__ICPrefManager_resetControlAuthorizationWithCompletion___block_invoke;
    v9[3] = &unk_1E63D7320;
    dispatch_semaphore_t v10 = v6;
    id v11 = v4;
    dispatch_semaphore_t v8 = v6;
    [v7 resetControlAuthorizationStatusWithReply:v9];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    [(ICPrefManager *)self endQuery:v8];
  }
  else
  {
    uint64_t v7 = [(ICPrefManager *)self getControlAuthorizationStatus];
    uint64_t v12 = @"ICAuthorizationStatus";
    v13[0] = v7;
    dispatch_semaphore_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    (*((void (**)(id, NSObject *))v4 + 2))(v4, v8);
  }
}

intptr_t __57__ICPrefManager_resetControlAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (NSXPCConnection)authConnection
{
  return self->_authConnection;
}

- (void)setAuthConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authConnectionSemaphores, 0);

  objc_storeStrong((id *)&self->_authConnection, 0);
}

+ (void)defaultAuthManager
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEEFF000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end