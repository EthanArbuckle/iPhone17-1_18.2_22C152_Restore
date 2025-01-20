@interface EXConcreteExtensionContextVendor
+ (Class)_extensionContextClass;
+ (Class)_extensionPrincipalClass;
+ (id)_completionConcurrentQueue;
+ (id)_expirationConcurrentQueue;
+ (id)_extensionDictionary;
+ (id)_extensionMainStoryboard;
+ (void)_startListening;
+ (void)_startListening:(BOOL)a3;
- (BOOL)_shouldCreatePrincipalObject;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (EXConcreteExtensionContextVendor)init;
- (NSMutableDictionary)_extensionContexts;
- (NSMutableDictionary)_extensionPrincipalObjects;
- (NSMutableDictionary)_extensionServiceConnections;
- (id)_extensionContextForUUID:(id)a3;
- (void)_addExtensionContext:(id)a3;
- (void)_beginRequestWithExtensionItems:(id)a3 listenerEndpoint:(id)a4 withContextUUID:(id)a5 completion:(id)a6;
- (void)_hostDidBecomeActiveForContextUUID:(id)a3 completion:(id)a4;
- (void)_hostDidEnterBackgroundForContextUUID:(id)a3 completion:(id)a4;
- (void)_hostWillEnterForegroundForContextUUID:(id)a3 completion:(id)a4;
- (void)_hostWillResignActiveForContextUUID:(id)a3 completion:(id)a4;
- (void)_onGlobalStateQueueOnly_setPrincipalObject:(id)a3 forUUID:(id)a4;
- (void)_removeExtensionContext:(id)a3;
- (void)_setExtensionContexts:(id)a3;
- (void)_setExtensionPrincipalObjects:(id)a3;
- (void)_setExtensionServiceConnections:(id)a3;
- (void)_setPrincipalObject:(id)a3 forUUID:(id)a4;
- (void)_tearDownContextWithUUID:(id)a3;
@end

@implementation EXConcreteExtensionContextVendor

+ (void)_startListening:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EXConcreteExtensionContextVendor__startListening___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  if (_startListening__onceToken != -1) {
    dispatch_once(&_startListening__onceToken, block);
  }
}

void __52__EXConcreteExtensionContextVendor__startListening___block_invoke(uint64_t a1)
{
  v2 = NSString;
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v4 = [v3 bundleIdentifier];
  v5 = [v2 stringWithFormat:@"%@.%@", v4, *MEMORY[0x1E4F28258]];

  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v5];
  v7 = (void *)_startListening__listener;
  _startListening__listener = v6;

  v8 = (void *)_startListening__listener;
  v9 = +[_NSExtensionContextVendor _sharedExtensionContextVendor];
  [v8 setDelegate:v9];

  [(id)_startListening__listener resume];
  LODWORD(v8) = *(unsigned __int8 *)(a1 + 32);
  v10 = _EXLegacyLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191F29000, v10, OS_LOG_TYPE_DEFAULT, "Cecking in with launchd immediately", buf, 2u);
    }

    +[EXXPCUtil checkInWithLaunchd];
  }
  else
  {
    if (v11)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_191F29000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling launchd after initial event", v12, 2u);
    }

    _EXExtensionInstallRunloopObserverToPingLaunchdAfterEvent();
  }
}

+ (void)_startListening
{
}

+ (id)_extensionDictionary
{
  if (_extensionDictionary_onceToken != -1) {
    dispatch_once(&_extensionDictionary_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_extensionDictionary___extensionDictionary;

  return v2;
}

void __56__EXConcreteExtensionContextVendor__extensionDictionary__block_invoke()
{
  id v5 = [MEMORY[0x1E4F914A8] defaultService];
  v0 = [v5 valueForKey:@"solePersonality"];
  v1 = [v0 valueForKey:@"bundleInfoDictionary"];
  v2 = [v1 objectForKey:@"NSExtension"];
  uint64_t v3 = [v2 copy];
  BOOL v4 = (void *)_extensionDictionary___extensionDictionary;
  _extensionDictionary___extensionDictionary = v3;
}

+ (Class)_extensionPrincipalClass
{
  if (_extensionPrincipalClass_onceToken != -1) {
    dispatch_once(&_extensionPrincipalClass_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)_extensionPrincipalClass___extensionPrincipalClass;

  return (Class)v2;
}

void __60__EXConcreteExtensionContextVendor__extensionPrincipalClass__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = +[EXConcreteExtensionContextVendor _extensionDictionary];
  v1 = objc_msgSend(v0, "_EX_stringForKey:", @"NSExtensionPrincipalClass");
  if (!v1)
  {
    v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v2 infoDictionary];

    BOOL v4 = objc_msgSend(v3, "_EX_dictionaryForKey:", @"NSExtension");
    v1 = objc_msgSend(v4, "_EX_stringForKey:", @"NSExtensionPrincipalClass");

    if (v1)
    {
    }
    else
    {
      v1 = objc_msgSend(v3, "_EX_stringForKey:", @"NSExtensionPrincipalClass");

      if (!v1)
      {
        id v5 = 0;
        goto LABEL_13;
      }
    }
  }
  id v5 = v1;
  Class Class = objc_getClass((const char *)[v5 UTF8String]);
  _extensionPrincipalClass___extensionPrincipalClass Class = (uint64_t)Class;
  if (!Class)
  {
    v7 = _EXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __60__EXConcreteExtensionContextVendor__extensionPrincipalClass__block_invoke_cold_1();
    }

    Class Class = (Class)_extensionPrincipalClass___extensionPrincipalClass;
  }
  if (([(objc_class *)Class conformsToProtocol:&unk_1EE2EFA90] & 1) == 0)
  {
    v8 = _EXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v5;
    }
  }
LABEL_13:
}

+ (id)_extensionMainStoryboard
{
  v2 = +[EXConcreteExtensionContextVendor _extensionDictionary];
  uint64_t v3 = [v2 objectForKey:@"NSExtensionMainStoryboard"];

  return v3;
}

+ (Class)_extensionContextClass
{
  if (_extensionContextClass_onceToken != -1) {
    dispatch_once(&_extensionContextClass_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)_extensionContextClass___extensionContextClass;

  return (Class)v2;
}

uint64_t __58__EXConcreteExtensionContextVendor__extensionContextClass__block_invoke()
{
  v0 = +[EXConcreteExtensionContextVendor _extensionDictionary];
  uint64_t v1 = [v0 objectForKey:@"NSExtensionContextClass"];
  if (v1)
  {
    v2 = (void *)v1;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
    BOOL v4 = [v3 infoDictionary];
    v2 = [v4 objectForKey:@"NSExtensionContextClass"];

    if (!v2)
    {
      _extensionContextClass___extensionContextClass Class = objc_opt_class();
      goto LABEL_5;
    }
  }
  id v6 = v2;
  _extensionContextClass___extensionContextClass Class = (uint64_t)objc_getClass((const char *)[v6 UTF8String]);
  if (!_extensionContextClass___extensionContextClass)
  {
    NSLog(&cfstr_SSDUnableToFin.isa, "__extensionContextClass != nil", "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSupport/EXConcreteExtensionContextVendor.m", 129, v6);
    __break(1u);
    return MEMORY[0x1F41817F8]();
  }
LABEL_5:

  return MEMORY[0x1F41817F8]();
}

+ (id)_completionConcurrentQueue
{
  if (_completionConcurrentQueue_onceToken != -1) {
    dispatch_once(&_completionConcurrentQueue_onceToken, &__block_literal_global_81);
  }
  v2 = (void *)_completionConcurrentQueue_queue;

  return v2;
}

void __62__EXConcreteExtensionContextVendor__completionConcurrentQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.NSExtensionContest-completion-concurrent", v2);
  uint64_t v1 = (void *)_completionConcurrentQueue_queue;
  _completionConcurrentQueue_queue = (uint64_t)v0;
}

+ (id)_expirationConcurrentQueue
{
  if (_expirationConcurrentQueue_onceToken != -1) {
    dispatch_once(&_expirationConcurrentQueue_onceToken, &__block_literal_global_84);
  }
  v2 = (void *)_expirationConcurrentQueue_queue;

  return v2;
}

void __62__EXConcreteExtensionContextVendor__expirationConcurrentQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.NSExtensionContest-completion-concurrent", v2);
  uint64_t v1 = (void *)_expirationConcurrentQueue_queue;
  _expirationConcurrentQueue_queue = (uint64_t)v0;
}

- (EXConcreteExtensionContextVendor)init
{
  v6.receiver = self;
  v6.super_class = (Class)EXConcreteExtensionContextVendor;
  v2 = [(_NSExtensionContextVendor *)&v6 _init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    extensionContexts = v2->__extensionContexts;
    v2->__extensionContexts = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  +[EXXPCUtil assertIsExtensionProcess];
  objc_super v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_extensionContextClass"), "_allowedErrorClasses");
  v7 = _EXLegacyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[EXConcreteExtensionContextVendor listener:shouldAcceptNewConnection:]();
  }

  v8 = +[EXExtensionContextImplementation _extensionContextHostProtocolWithAllowedErrorClasses:v6];
  [v5 setRemoteObjectInterface:v8];

  int v9 = +[EXExtensionContextImplementation _extensionContextVendorProtocolWithAllowedErrorClasses:v6];
  [v5 setExportedInterface:v9];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (BOOL)_shouldCreatePrincipalObject
{
  v2 = +[EXConcreteExtensionContextVendor _extensionDictionary];
  int v3 = objc_msgSend(v2, "_EX_BOOLForKey:defaultValue:", @"NSExtensionShouldCreatePrincipalObject", 1);

  if (v3
    && (+[EXConcreteExtensionContextVendor _extensionMainStoryboard](EXConcreteExtensionContextVendor, "_extensionMainStoryboard"), BOOL v4 = objc_claimAutoreleasedReturnValue(), v4, !v4)&& +[EXConcreteExtensionContextVendor _extensionPrincipalClass])
  {
    char v5 = objc_opt_respondsToSelector() ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)_beginRequestWithExtensionItems:(id)a3 listenerEndpoint:(id)a4 withContextUUID:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _EXLegacyLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    id v33 = v12;
    __int16 v34 = 2114;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_debug_impl(&dword_191F29000, v14, OS_LOG_TYPE_DEBUG, "beginning request with UUID: %{public}@ with endpoint: %{public}@ for items: %@", buf, 0x20u);
  }

  v15 = [MEMORY[0x1E4F29268] currentConnection];
  os_activity_t v16 = _os_activity_create(&dword_191F29000, "beginning extension request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v17 = _EXExtensionGetGlobalStateQueue(0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke;
  block[3] = &unk_1E573D668;
  os_activity_t v25 = v16;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  id v29 = v15;
  v30 = self;
  id v31 = v13;
  id v18 = v13;
  id v19 = v15;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  v23 = v16;
  dispatch_async(v17, block);
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v2 = +[EXConcreteExtensionContextVendor _extensionContextClass];
  int v3 = (void *)[[v2 alloc] initWithInputItems:*(void *)(a1 + 40) listenerEndpoint:*(void *)(a1 + 48) contextUUID:*(void *)(a1 + 56)];
  BOOL v4 = [v3 internalImplementation];
  char v5 = *(void **)(a1 + 64);
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
  }
  v34[0] = v35;
  v34[1] = v36;
  [v4 _setExtensionHostAuditToken:v34];
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 72);
    if (!*(void *)(v6 + 8))
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = *(void *)(a1 + 72);
      int v9 = *(void **)(v8 + 8);
      *(void *)(v8 + 8) = v7;

      uint64_t v6 = *(void *)(a1 + 72);
    }
    [*(id *)(v6 + 16) setObject:v3 forKey:*(void *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 72) + 8) setObject:*(void *)(a1 + 64) forKey:*(void *)(a1 + 56)];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__3;
    v32[4] = __Block_byref_object_dispose__3;
    id v33 = *(id *)(a1 + 72);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_98;
    v29[3] = &unk_1E573D618;
    id v31 = v32;
    id v30 = *(id *)(a1 + 56);
    [*(id *)(a1 + 64) setInterruptionHandler:v29];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_99;
    v26[3] = &unk_1E573D618;
    id v28 = v32;
    id v27 = *(id *)(a1 + 56);
    [*(id *)(a1 + 64) setInvalidationHandler:v26];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__3;
    v24[4] = __Block_byref_object_dispose__3;
    id v25 = 0;
    id v10 = *(void **)(a1 + 64);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_100;
    v23[3] = &unk_1E573D578;
    v23[4] = v24;
    id v11 = [v10 remoteObjectProxyWithErrorHandler:v23];
    [v4 _setExtensionHostProxy:v11];

    if ([*(id *)(a1 + 72) _shouldCreatePrincipalObject])
    {
      id v12 = objc_alloc_init(+[EXConcreteExtensionContextVendor _extensionPrincipalClass]);
      id v13 = _EXLegacyLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_cold_1();
      }

      objc_msgSend(*(id *)(a1 + 72), "_onGlobalStateQueueOnly_setPrincipalObject:forUUID:", v12, *(void *)(a1 + 56));
    }
    else
    {
      v14 = _EXLegacyLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_cold_2();
      }

      id v12 = 0;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_102;
    v17[3] = &unk_1E573D640;
    id v18 = *(id *)(a1 + 56);
    id v22 = v24;
    id v21 = *(id *)(a1 + 80);
    id v15 = v12;
    id v19 = v15;
    id v16 = v3;
    id v20 = v16;
    [v4 _willPerformHostCallback:v17];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v32, 8);

    os_activity_scope_leave(&state);
  }
  else
  {
    NSLog(&cfstr_SSDExtensionco.isa, "extensionContext != nil", "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSupport/EXConcreteExtensionContextVendor.m", 223, v2);
    __break(1u);
  }
}

uint64_t __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_98(uint64_t a1)
{
  v2 = _EXLegacyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEFAULT, "tearing down context in extension due to interruption", v4, 2u);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _tearDownContextWithUUID:*(void *)(a1 + 32)];
}

uint64_t __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_99(uint64_t a1)
{
  v2 = _EXLegacyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEFAULT, "tearing down context in extension due to invalidation", v4, 2u);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _tearDownContextWithUUID:*(void *)(a1 + 32)];
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _EXLegacyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_100_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_102(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _EXLegacyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEFAULT, "in _willPerformHostCallback: block(UUID: %{public}@ error: %{public}@)", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if ([*(id *)(a1 + 40) conformsToProtocol:&unk_1EE2EFA90]) {
    [*(id *)(a1 + 40) beginRequestWithExtensionContext:*(void *)(a1 + 48)];
  }
  uint64_t v5 = (void *)os_transaction_create();
  uint64_t v6 = [*(id *)(a1 + 48) internalImplementation];
  [v6 _setTransaction:v5];
}

- (void)_hostDidEnterBackgroundForContextUUID:(id)a3 completion:(id)a4
{
}

- (void)_hostWillEnterForegroundForContextUUID:(id)a3 completion:(id)a4
{
}

- (void)_hostWillResignActiveForContextUUID:(id)a3 completion:(id)a4
{
}

- (void)_hostDidBecomeActiveForContextUUID:(id)a3 completion:(id)a4
{
}

- (void)_tearDownContextWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _EXExtensionGetGlobalStateQueue(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__EXConcreteExtensionContextVendor__tearDownContextWithUUID___block_invoke;
  v7[3] = &unk_1E573CDD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__EXConcreteExtensionContextVendor__tearDownContextWithUUID___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__EXConcreteExtensionContextVendor__tearDownContextWithUUID___block_invoke_2;
  v2[3] = &unk_1E573CDD8;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  _os_activity_initiate(&dword_191F29000, "tearing down extension context", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

void __61__EXConcreteExtensionContextVendor__tearDownContextWithUUID___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  v2 = [v4 internalImplementation];
  [v2 invalidate];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  [v3 setInterruptionHandler:0];
  [v3 setInvalidationHandler:0];
  [v3 invalidate];
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)_extensionContextForUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->__extensionContexts objectForKey:a3];
}

- (void)_addExtensionContext:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    extensionContexts = self->__extensionContexts;
    uint64_t v5 = [v7 _UUID];
    [(NSMutableDictionary *)extensionContexts setObject:v7 forKey:v5];
  }
  else
  {
    id v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[EXConcreteExtensionContextVendor _addExtensionContext:]();
    }

    __break(1u);
  }
}

- (void)_removeExtensionContext:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    extensionContexts = self->__extensionContexts;
    uint64_t v5 = [v7 _UUID];
    [(NSMutableDictionary *)extensionContexts removeObjectForKey:v5];
  }
  else
  {
    id v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[EXConcreteExtensionContextVendor _removeExtensionContext:]();
    }

    __break(1u);
  }
}

- (void)_setPrincipalObject:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _EXExtensionGetGlobalStateQueue(0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__EXConcreteExtensionContextVendor__setPrincipalObject_forUUID___block_invoke;
  block[3] = &unk_1E573D690;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __64__EXConcreteExtensionContextVendor__setPrincipalObject_forUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onGlobalStateQueueOnly_setPrincipalObject:forUUID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_onGlobalStateQueueOnly_setPrincipalObject:(id)a3 forUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _EXExtensionGetGlobalStateQueue(0);
  dispatch_assert_queue_V2(v8);

  if (!v7)
  {
    id v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[EXConcreteExtensionContextVendor _onGlobalStateQueueOnly_setPrincipalObject:forUUID:]();
    }
  }
  p_extensionPrincipalObjects = &self->__extensionPrincipalObjects;
  uint64_t v11 = [(NSMutableDictionary *)self->__extensionPrincipalObjects objectForKey:v6];

  if (v11)
  {
    id v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[EXConcreteExtensionContextVendor _onGlobalStateQueueOnly_setPrincipalObject:forUUID:]((id *)&self->__extensionPrincipalObjects, (uint64_t)v6, v12);
    }
  }
  id v13 = *p_extensionPrincipalObjects;
  if (!*p_extensionPrincipalObjects)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = *p_extensionPrincipalObjects;
    *p_extensionPrincipalObjects = v14;

    id v13 = *p_extensionPrincipalObjects;
  }
  [(NSMutableDictionary *)v13 setObject:v7 forKey:v6];
  id v16 = [(NSMutableDictionary *)self->__extensionContexts objectForKey:v6];
  v17 = [v16 internalImplementation];
  [v17 _setPrincipalObject:v7];
}

- (NSMutableDictionary)_extensionServiceConnections
{
  return self->__extensionServiceConnections;
}

- (void)_setExtensionServiceConnections:(id)a3
{
}

- (NSMutableDictionary)_extensionContexts
{
  return self->__extensionContexts;
}

- (void)_setExtensionContexts:(id)a3
{
}

- (NSMutableDictionary)_extensionPrincipalObjects
{
  return self->__extensionPrincipalObjects;
}

- (void)_setExtensionPrincipalObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__extensionPrincipalObjects, 0);
  objc_storeStrong((id *)&self->__extensionContexts, 0);

  objc_storeStrong((id *)&self->__extensionServiceConnections, 0);
}

void __60__EXConcreteExtensionContextVendor__extensionPrincipalClass__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unable to find NSExtensionPrincipalClass (%@) in extension bundle! Please verify that the extension links the required frameworks and that the value for NSExtensionPrincipalClass is prefixed with '$(PRODUCT_MODULE_NAME).' if the class is implemented in Swift.", (uint8_t *)v1, 0x26u);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "%{public}@ Making host default XPC interface, allowed error classes: %{public}@");
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "creating principle object: %{public}@ - with extensionContext %{public}@");
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_191F29000, v0, OS_LOG_TYPE_DEBUG, "view services will create object for extensionContext: %{public}@", v1, 0xCu);
}

void __112__EXConcreteExtensionContextVendor__beginRequestWithExtensionItems_listenerEndpoint_withContextUUID_completion___block_invoke_100_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_191F29000, v0, OS_LOG_TYPE_ERROR, "error from host: %{public}@", v1, 0xCu);
}

- (void)_addExtensionContext:.cold.1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
}

- (void)_removeExtensionContext:.cold.1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
}

- (void)_onGlobalStateQueueOnly_setPrincipalObject:(NSObject *)a3 forUUID:.cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 objectForKey:a2];
  v7[0] = 136316162;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
  __int16 v8 = v6;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_191F29000, a3, OS_LOG_TYPE_FAULT, "%s - %s:%d: There is already a principal object (%@) for UUID (%@)", (uint8_t *)v7, 0x30u);
}

- (void)_onGlobalStateQueueOnly_setPrincipalObject:forUUID:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = "principalObject != nil";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_1();
  int v4 = 354;
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: principal object cannot be nil!", (uint8_t *)&v1, 0x1Cu);
}

@end