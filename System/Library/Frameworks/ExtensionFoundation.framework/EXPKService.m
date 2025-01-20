@interface EXPKService
+ (id)defaultService;
+ (int)_defaultRun:(int)a3 arguments:(const char *)a4;
+ (void)main;
- (BOOL)_processDefaultSubsystemName:(id)a3;
- (BOOL)isSystemService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shared;
- (BOOL)supportsAutoreleasePoolDuringPlugInLaunch;
- (BOOL)unregisterPersonality:(id)a3;
- (EXPKService)init;
- (EXPKService)initWithProxyFactory:(id)a3;
- (EXPKServiceDelegate)delegate;
- (NSArray)subsystems;
- (NSMutableDictionary)personalities;
- (NSXPCListener)serviceListener;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_source)firstHostRequestTimer;
- (OS_dispatch_source)terminationTimer;
- (PKProxyFactory)proxyFactory;
- (PKServicePersonality)solePersonality;
- (id)_serviceType;
- (id)_subDictionaryOfSDKWithKey:(id)a3;
- (id)_subServices;
- (id)_subsystems;
- (id)_xpcServiceDict;
- (id)configuredSubsystemList;
- (id)connectionForPlugInNamed:(id)a3;
- (id)defaultsForPlugInNamed:(id)a3;
- (id)discoverSubsystemNamed:(id)a3 options:(id)a4 required:(BOOL)a5;
- (id)embeddedPrincipalForPlugInNamed:(id)a3;
- (id)hostPrincipalForPlugInNamed:(id)a3;
- (id)personalityNamed:(id)a3;
- (id)personalityNamed:(id)a3 forHostPid:(int)a4;
- (id)plugInPrincipalForPlugInNamed:(id)a3;
- (os_unfair_lock_s)personalityLock;
- (unsigned)extensionPointPlatform;
- (void)_prepareToRun;
- (void)beganUsingServicePersonality:(id)a3;
- (void)cancelTermination;
- (void)checkEnvironment:(id)a3;
- (void)discoverSubsystems;
- (void)launchContainingApplicationForPlugInNamed:(id)a3;
- (void)mergeSubsystemList:(id)a3 from:(id)a4;
- (void)mergeSubsystems:(id)a3 from:(id)a4;
- (void)registerPersonality:(id)a3;
- (void)run;
- (void)scheduleTermination:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionPointPlatform:(unsigned int)a3;
- (void)setFirstHostRequestTimer:(id)a3;
- (void)setIsSystemService:(BOOL)a3;
- (void)setPersonalities:(id)a3;
- (void)setServiceListener:(id)a3;
- (void)setShared:(BOOL)a3;
- (void)setSolePersonality:(id)a3;
- (void)setSubsystems:(id)a3;
- (void)setTerminationTimer:(id)a3;
- (void)solePersonality;
@end

@implementation EXPKService

- (void)beganUsingServicePersonality:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__EXPKService_beganUsingServicePersonality___block_invoke;
  block[3] = &unk_1E573CBB8;
  block[4] = self;
  if (beganUsingServicePersonality__onceToken != -1) {
    dispatch_once(&beganUsingServicePersonality__onceToken, block);
  }
}

void __44__EXPKService_beganUsingServicePersonality___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__EXPKService_beganUsingServicePersonality___block_invoke_2;
  block[3] = &unk_1E573CBB8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);

  v3 = pklog_handle_for_category();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartup", "", v4, 2u);
  }
}

void __44__EXPKService_beganUsingServicePersonality___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) firstHostRequestTimer];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) firstHostRequestTimer];
    dispatch_source_cancel(v3);

    v4 = *(void **)(a1 + 32);
    [v4 setFirstHostRequestTimer:0];
  }
}

+ (void)main
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = pklog_handle_for_category();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartup", "", buf, 2u);
  }

  v3 = pklog_handle_for_category();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartupXPCReady", "", buf, 2u);
  }

  int current_persona = voucher_get_current_persona();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v39 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  *(_DWORD *)buf = 1;
  pklog_get_persona_type_and_name();
  v5 = pklog_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v7 = 67110146;
    uid_t v8 = geteuid();
    __int16 v9 = 1024;
    uid_t v10 = getuid();
    __int16 v11 = 1024;
    int v12 = current_persona;
    __int16 v13 = 2080;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    uint64_t v16 = 0;
    _os_log_impl(&dword_191F29000, v5, OS_LOG_TYPE_DEFAULT, "Hello, I'm launching as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v7, 0x28u);
  }

  v6 = [(id)objc_opt_class() defaultService];
  [v6 run];
}

- (EXPKService)init
{
  Class v3 = NSClassFromString(&cfstr_Pkproxyfactory.isa);
  if (!v3)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA00]);
    objc_exception_throw((id)[v7 initWithName:*MEMORY[0x1E4F1C3B8] reason:@"\"EXPKService\" init failed due to missing required class \"PKProxyFactory\"!" userInfo:0]);
  }
  v4 = [(objc_class *)v3 defaultFactory];
  v5 = [(EXPKService *)self initWithProxyFactory:v4];

  return v5;
}

- (EXPKService)initWithProxyFactory:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EXPKService;
  v6 = [(EXPKService *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxyFactory, a3);
    uid_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [(EXPKService *)v7 setPersonalities:v8];

    dispatch_queue_t v9 = dispatch_queue_create("timer queue", 0);
    timerQueue = v7->_timerQueue;
    v7->_timerQueue = (OS_dispatch_queue *)v9;

    v7->_personalityLock._os_unfair_lock_opaque = 0;
    uint64_t active_platform = dyld_get_active_platform();
    int v12 = pklog_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = active_platform;
      _os_log_impl(&dword_191F29000, v12, OS_LOG_TYPE_INFO, "setting extensionPointPlatform: %u", buf, 8u);
    }

    [(EXPKService *)v7 setExtensionPointPlatform:active_platform];
  }

  return v7;
}

+ (id)defaultService
{
  if (defaultService_once != -1) {
    dispatch_once(&defaultService_once, &__block_literal_global_15);
  }
  v2 = (void *)defaultService__service;

  return v2;
}

uint64_t __29__EXPKService_defaultService__block_invoke()
{
  defaultService__service = objc_alloc_init(EXPKService);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)supportsAutoreleasePoolDuringPlugInLaunch
{
  return dyld_program_sdk_at_least();
}

- (void)run
{
  if ([(EXPKService *)self supportsAutoreleasePoolDuringPlugInLaunch])
  {
    Class v3 = (void *)MEMORY[0x192FEB110]();
    [(EXPKService *)self _prepareToRun];
  }
  else
  {
    [(EXPKService *)self _prepareToRun];
  }
  v4 = [(EXPKService *)self timerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__EXPKService_run__block_invoke;
  block[3] = &unk_1E573CBB8;
  block[4] = self;
  dispatch_async(v4, block);

  id v5 = pklog_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uid_t v8 = 0;
    _os_log_impl(&dword_191F29000, v5, OS_LOG_TYPE_DEFAULT, "Bootstrapping; Bootstrap complete. Ready for handshake from host.",
      v8,
      2u);
  }

  v6 = pklog_handle_for_category();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)uid_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartupXPCReady", "", v8, 2u);
  }

  id v7 = [(EXPKService *)self serviceListener];
  MEMORY[0x192FEAC00]();

  exit(1);
}

void __18__EXPKService_run__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timerQueue];
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v2);
  [*(id *)(a1 + 32) setFirstHostRequestTimer:v3];

  v4 = [*(id *)(a1 + 32) firstHostRequestTimer];
  dispatch_source_set_event_handler(v4, &__block_literal_global_9);

  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  v6 = [*(id *)(a1 + 32) firstHostRequestTimer];
  dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  id v7 = [*(id *)(a1 + 32) firstHostRequestTimer];
  dispatch_resume(v7);
}

void __18__EXPKService_run__block_invoke_2()
{
  v0 = pklog_handle_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __18__EXPKService_run__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)_prepareToRun
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Bootstrapping; service delegate class %{public}@ does not conform to PKServiceDelegate",
    v2,
    v3,
    v4,
    v5,
    v6);
}

+ (int)_defaultRun:(int)a3 arguments:(const char *)a4
{
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EXPKService *)self serviceListener];

  if (v8 == v6)
  {
    id v10 = objc_alloc(NSClassFromString(&cfstr_Pkserviceperso.isa));
    dispatch_queue_t v9 = [(EXPKService *)self proxyFactory];
  }
  else
  {
    dispatch_queue_t v9 = pklog_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[EXPKService listener:shouldAcceptNewConnection:]();
    }
  }

  return v8 == v6;
}

- (id)_subDictionaryOfSDKWithKey:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F22448];
  id v4 = a3;
  uint64_t v5 = [v3 extensionPointRecordForCurrentProcess];
  id v6 = [v5 SDKDictionary];
  id v7 = [v6 objectForKey:v4 ofClass:objc_opt_class()];

  return v7;
}

- (id)_xpcServiceDict
{
  return [(EXPKService *)self _subDictionaryOfSDKWithKey:@"XPCService"];
}

- (id)_subServices
{
  uint64_t v2 = [(EXPKService *)self _xpcServiceDict];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"_AdditionalSubServices"];

  return v3;
}

- (id)_serviceType
{
  uint64_t v2 = [(EXPKService *)self _xpcServiceDict];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ServiceType"];

  return v3;
}

- (id)_subsystems
{
  uint64_t v2 = [(EXPKService *)self _subDictionaryOfSDKWithKey:*MEMORY[0x1E4F914D8]];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F914F8]];

  return v3;
}

- (BOOL)_processDefaultSubsystemName:(id)a3
{
  return 1;
}

- (void)discoverSubsystems
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_191F29000, log, OS_LOG_TYPE_FAULT, "Bootstrapping; Error: Unexpected class for bootstrap for key 'SUBSYSTEM_OPTIONS'. This value must be an NSDictionary.",
    v1,
    2u);
}

- (id)configuredSubsystemList
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 infoDictionary];

  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F914D8]];
  if (!v5)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F914E0]];
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  [(EXPKService *)self mergeSubsystems:v6 from:v5];

  return v6;
}

- (void)mergeSubsystems:(id)a3 from:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F914F8]];
  [(EXPKService *)self mergeSubsystemList:v11 from:v7];

  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F914E8]];
  if (v8
    || ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F914F0]],
        (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    dispatch_queue_t v9 = [(EXPKService *)self _subsystems];
    [(EXPKService *)self mergeSubsystemList:v11 from:v9];

    id v10 = [(EXPKService *)self _serviceType];
    if ([v10 isEqualToString:@"System"]) {
      [(EXPKService *)self setIsSystemService:1];
    }
  }
}

- (void)mergeSubsystemList:(id)a3 from:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (([v5 containsObject:v12] & 1) == 0) {
            [v5 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (id)discoverSubsystemNamed:(id)a3 options:(id)a4 required:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  Class v10 = objc_lookUpClass((const char *)[v9 UTF8String]);
  id v11 = pklog_handle_for_category();
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_signpost_enabled(v11))
    {
      int v17 = 138543362;
      id v18 = v9;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionSubsystemInit", " name=%{public, signpost.description:attribute}@ ", (uint8_t *)&v17, 0xCu);
    }

    long long v13 = pklog_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      id v18 = v9;
      _os_log_impl(&dword_191F29000, v13, OS_LOG_TYPE_INFO, "Bootstrapping; external subsystem [%{public}@] initializing",
        (uint8_t *)&v17,
        0xCu);
    }

    long long v14 = __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_INIT__();
    long long v15 = pklog_handle_for_category();
    if (os_signpost_enabled(v15))
    {
      int v17 = 138543618;
      id v18 = v9;
      __int16 v19 = 1026;
      BOOL v20 = v14 != 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionSubsystemInit", " name=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d ", (uint8_t *)&v17, 0x12u);
    }

    if (v14)
    {
      if ([v14 conformsToProtocol:&unk_1EE2E4D98]) {
        goto LABEL_20;
      }

      uint64_t v12 = pklog_handle_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[EXPKService discoverSubsystemNamed:options:required:]();
      }
    }
    else
    {
      uint64_t v12 = pklog_handle_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[EXPKService discoverSubsystemNamed:options:required:]();
      }
    }
  }
  else if (v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[EXPKService discoverSubsystemNamed:options:required:]();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v17 = 138543362;
    id v18 = v9;
    _os_log_impl(&dword_191F29000, v12, OS_LOG_TYPE_INFO, "Bootstrapping; external subsystem [%{public}@] not present, skipping",
      (uint8_t *)&v17,
      0xCu);
  }

  long long v14 = 0;
LABEL_20:

  return v14;
}

- (void)launchContainingApplicationForPlugInNamed:(id)a3
{
  uint64_t v3 = pklog_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[EXPKService launchContainingApplicationForPlugInNamed:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (id)defaultsForPlugInNamed:(id)a3
{
  uint64_t v3 = [(EXPKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 preferences];

  return v4;
}

- (id)plugInPrincipalForPlugInNamed:(id)a3
{
  uint64_t v3 = [(EXPKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 plugInPrincipal];

  return v4;
}

- (id)hostPrincipalForPlugInNamed:(id)a3
{
  uint64_t v3 = [(EXPKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 hostPrincipal];

  return v4;
}

- (id)embeddedPrincipalForPlugInNamed:(id)a3
{
  uint64_t v3 = [(EXPKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 embeddedPrincipal];

  return v4;
}

- (id)connectionForPlugInNamed:(id)a3
{
  uint64_t v3 = [(EXPKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 connection];

  return v4;
}

- (void)setSolePersonality:(id)a3
{
  uint64_t v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  solePersonality = self->_solePersonality;
  self->_solePersonality = v4;

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (PKServicePersonality)solePersonality
{
  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  uint64_t v4 = self->_solePersonality;
  os_unfair_lock_unlock(p_personalityLock);
  if (!v4)
  {
    uint64_t v5 = pklog_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(EXPKService *)self solePersonality];
    }
  }

  return v4;
}

- (id)personalityNamed:(id)a3
{
  id v4 = a3;
  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  if (v4)
  {
    uint64_t v6 = [(EXPKService *)self personalities];
    uint64_t v7 = [v6 objectForKeyedSubscript:v4];

    if ([v7 count] == 1)
    {
      uint64_t v8 = [v7 allValues];
      uint64_t v9 = [v8 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = self->_solePersonality;
  }
  os_unfair_lock_unlock(p_personalityLock);

  return v9;
}

- (id)personalityNamed:(id)a3 forHostPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_personalityLock = &self->_personalityLock;
  id v7 = a3;
  os_unfair_lock_lock(p_personalityLock);
  uint64_t v8 = [(EXPKService *)self personalities];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [NSNumber numberWithInt:v4];
  id v11 = [v9 objectForKeyedSubscript:v10];

  os_unfair_lock_unlock(p_personalityLock);

  return v11;
}

- (void)registerPersonality:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_personalityLock);
  uint64_t v5 = [(EXPKService *)self personalities];
  uint64_t v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = [(EXPKService *)self personalities];
    uint64_t v9 = [v4 identifier];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  uint64_t v10 = NSNumber;
  id v11 = [v4 connection];
  uint64_t v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "processIdentifier"));
  [v7 setObject:v4 forKeyedSubscript:v12];

  long long v13 = [(EXPKService *)self personalities];
  if ([v13 count] == 1)
  {
    uint64_t v14 = [v7 count];

    if (v14 == 1)
    {
      long long v15 = pklog_handle_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = [v4 uuid];
        int v17 = [v4 identifier];
        id v18 = [v4 version];
        int v22 = 138543874;
        long long v23 = v16;
        __int16 v24 = 2112;
        long long v25 = v17;
        __int16 v26 = 2112;
        long long v27 = v18;
        _os_log_impl(&dword_191F29000, v15, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Set sole personality.", (uint8_t *)&v22, 0x20u);
      }
      __int16 v19 = (PKServicePersonality *)v4;
      solePersonality = self->_solePersonality;
      self->_solePersonality = v19;
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v21 = pklog_handle_for_category();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    [(EXPKService *)v4 registerPersonality:v21];
  }

  solePersonality = self->_solePersonality;
  self->_solePersonality = 0;
LABEL_12:

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (BOOL)unregisterPersonality:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  uint64_t v5 = [(EXPKService *)self personalities];
  uint64_t v6 = (void *)[v5 count];

  if (v6)
  {
    id v7 = [(EXPKService *)self personalities];
    uint64_t v8 = [(PKServicePersonality *)v4 identifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    uint64_t v6 = NSNumber;
    uint64_t v10 = [(PKServicePersonality *)v4 connection];
    id v11 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v10, "processIdentifier"));

    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    LOBYTE(v6) = v12 != 0;

    if (v12)
    {
      [v9 removeObjectForKey:v11];
      if (self->_solePersonality == v4)
      {
        long long v13 = pklog_handle_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [(PKServicePersonality *)v4 uuid];
          long long v15 = [(PKServicePersonality *)v4 identifier];
          long long v16 = [(PKServicePersonality *)v4 version];
          int v19 = 138543874;
          BOOL v20 = v14;
          __int16 v21 = 2112;
          int v22 = v15;
          __int16 v23 = 2112;
          __int16 v24 = v16;
          _os_log_impl(&dword_191F29000, v13, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Removed sole personality.", (uint8_t *)&v19, 0x20u);
        }
        solePersonality = self->_solePersonality;
        self->_solePersonality = 0;
      }
    }
  }
  os_unfair_lock_unlock(&self->_personalityLock);

  return (char)v6;
}

- (void)checkEnvironment:(id)a3
{
  *(void *)&v7[1023] = *MEMORY[0x1E4F143B8];
  bzero(v7, 0x3FFuLL);
  char __s = 63;
  getpid();
  if (sandbox_container_path_for_pid())
  {
    uint64_t v3 = pklog_handle_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[EXPKService checkEnvironment:](v3);
    }
  }
  else if (strlen(&__s) > 1)
  {
    return;
  }
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"plugin has invalid sandbox or container: error %d path %s", *__error(), &__s);
  uint64_t v5 = pklog_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[EXPKService checkEnvironment:]();
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v4 format];
}

- (void)scheduleTermination:(double)a3
{
  uint64_t v5 = [(EXPKService *)self timerQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__EXPKService_scheduleTermination___block_invoke;
  v6[3] = &unk_1E573D9E0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

void __35__EXPKService_scheduleTermination___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) terminationTimer];

  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    uint64_t v9 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_source_set_timer(v9, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) timerQueue];
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    [*(id *)(a1 + 32) setTerminationTimer:v5];

    uint64_t v6 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_source_set_event_handler(v6, &__block_literal_global_95);

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    uint64_t v8 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_source_set_timer(v8, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

    uint64_t v9 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_resume(v9);
  }
}

uint64_t __35__EXPKService_scheduleTermination___block_invoke_2()
{
  v0 = pklog_handle_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_191F29000, v0, OS_LOG_TYPE_DEFAULT, "Exiting when clean", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

- (void)cancelTermination
{
  dispatch_time_t v3 = [(EXPKService *)self timerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__EXPKService_cancelTermination__block_invoke;
  block[3] = &unk_1E573CBB8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __32__EXPKService_cancelTermination__block_invoke(uint64_t a1)
{
  xpc_transaction_interrupt_clean_exit();
  uint64_t v2 = [*(id *)(a1 + 32) terminationTimer];

  if (v2)
  {
    dispatch_time_t v3 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_source_cancel(v3);

    id v4 = *(void **)(a1 + 32);
    [v4 setTerminationTimer:0];
  }
}

- (unsigned)extensionPointPlatform
{
  return self->_extensionPointPlatform;
}

- (void)setExtensionPointPlatform:(unsigned int)a3
{
  self->_extensionPointPlatform = a3;
}

- (os_unfair_lock_s)personalityLock
{
  return self->_personalityLock;
}

- (OS_dispatch_queue)timerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (EXPKServiceDelegate)delegate
{
  return (EXPKServiceDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)serviceListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceListener:(id)a3
{
}

- (NSMutableDictionary)personalities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersonalities:(id)a3
{
}

- (NSArray)subsystems
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSubsystems:(id)a3
{
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (OS_dispatch_source)terminationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTerminationTimer:(id)a3
{
}

- (OS_dispatch_source)firstHostRequestTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirstHostRequestTimer:(id)a3
{
}

- (PKProxyFactory)proxyFactory
{
  return self->_proxyFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyFactory, 0);
  objc_storeStrong((id *)&self->_firstHostRequestTimer, 0);
  objc_storeStrong((id *)&self->_terminationTimer, 0);
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_personalities, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);

  objc_storeStrong((id *)&self->_solePersonality, 0);
}

void __18__EXPKService_run__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Bootstrapping; PlugInKit listener %{public}@ unexpected (rejecting)",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)discoverSubsystemNamed:options:required:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "Bootstrapping; misconfigured plugin; external subsystem [%{public}@] not present; possible missing linkage",
    v1,
    0xCu);
}

- (void)discoverSubsystemNamed:options:required:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Bootstrapping; external subsystem %{public}@ refused setup",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)discoverSubsystemNamed:options:required:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Bootstrapping; external subsystem initializer %{public}@ does not conform to PKModularService",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)launchContainingApplicationForPlugInNamed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)solePersonality
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 personalities];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_191F29000, a2, OS_LOG_TYPE_ERROR, "WARNING! Sole personality requested when nil; THIS MAY BE A SPURIOUS LAUNCH OF THE PLUGIN due to a message to an XPC"
    " endpoint other than the main service endpoint; personalities: %@",
    v4,
    0xCu);
}

- (void)registerPersonality:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a1 uuid];
  dispatch_time_t v7 = [a1 identifier];
  uint64_t v8 = [a1 version];
  uint64_t v9 = [a2 personalities];
  int v10 = 138544130;
  id v11 = v6;
  __int16 v12 = 2112;
  long long v13 = v7;
  __int16 v14 = 2112;
  long long v15 = v8;
  __int16 v16 = 2112;
  int v17 = v9;
  _os_log_error_impl(&dword_191F29000, a3, OS_LOG_TYPE_ERROR, "[u %{public}@] [%@(%@)] WARNING! Sole personality is ambiguous; this may lead to erratic behavior; personalities: %@",
    (uint8_t *)&v10,
    0x2Au);
}

- (void)checkEnvironment:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)checkEnvironment:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_191F29000, log, OS_LOG_TYPE_ERROR, "Bootstrapping; failed to get my own sandbox container",
    v1,
    2u);
}

@end