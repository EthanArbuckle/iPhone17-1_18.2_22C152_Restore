@interface FBSDisplayLayoutPublisher
+ (id)publisherWithConfiguration:(id)a3;
- (BOOL)isTransitioning;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayLayout)currentLayout;
- (FBSDisplayLayoutPublisher)init;
- (id)_addElement:(id)a3 forKey:(id)a4;
- (id)_initWithConfiguration:(id)a3;
- (id)addElement:(id)a3;
- (id)suppressLayoutForReason:(id)a3;
- (id)transitionAssertionWithReason:(id)a3;
- (int64_t)backlightLevel;
- (int64_t)interfaceOrientation;
- (void)_endSuppression;
- (void)_endTransition;
- (void)_removeElement:(id)a3 forKey:(id)a4;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setBacklightLevel:(int64_t)a3;
- (void)setBacklightState:(int64_t)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
@end

@implementation FBSDisplayLayoutPublisher

uint64_t __59__FBSDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endTransition];
}

void __34__FBSDisplayLayoutPublisher_flush__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8 * *(void *)(a1 + 56) + 48), *(id *)(a1 + 40));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8 * *(void *)(a1 + 56) + 72);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v19;
    *(void *)&long long v4 = 138412290;
    long long v17 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E4F963E8];
        v10 = NSNumber;
        v11 = [v8 remoteProcess:v17 withTransitionContext:v18];
        v12 = [v10 numberWithInt:[v11 pid]];
        v13 = [v9 handleForIdentifier:v12 error:0];

        if (([v13 isDaemon] & 1) != 0
          || ([v13 currentState],
              v14 = objc_claimAutoreleasedReturnValue(),
              int v15 = [v14 taskState],
              v14,
              v15 != 3))
        {
          v16 = [v8 remoteTarget];
          [v16 updateLayout:*(void *)(a1 + 40) withTransition:*(void *)(a1 + 48)];
        }
        else
        {
          v16 = FBLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            v23 = v13;
            _os_log_impl(&dword_19C680000, v16, OS_LOG_TYPE_INFO, "not sending layout update to suspended process %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }
}

uint64_t __48__FBSDisplayLayoutPublisher__addElement_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeElement:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (id)addElement:(id)a3
{
  return [(FBSDisplayLayoutPublisher *)self _addElement:a3 forKey:0];
}

- (void)_endTransition
{
}

- (void)flush
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
}

- (FBSDisplayLayout)currentLayout
{
}

- (void)_removeElement:(id)a3 forKey:(id)a4
{
  a3;
  id v5 = a4;
  BSDispatchQueueAssertMain();
}

- (id)_addElement:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BSDispatchQueueAssertMain();
}

- (id)transitionAssertionWithReason:(id)a3
{
  id v3 = a3;
  BSDispatchQueueAssertMain();
}

void __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 8) hasBeenSignalled];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 invalidate];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_2;
    v10[3] = &unk_1E58F7418;
    char v11 = *(unsigned char *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v4;
    [v3 configureConnection:v10];
    id v5 = *(void **)(*(void *)(a1 + 32) + 8 * *(char *)(a1 + 56) + 72);
    if (v5)
    {
      [v5 addObject:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithObject:*(void *)(a1 + 40)];
      uint64_t v7 = *(void *)(a1 + 32) + 8 * *(char *)(a1 + 56);
      v8 = *(void **)(v7 + 72);
      *(void *)(v7 + 72) = v6;
    }
    [*(id *)(a1 + 40) activate];
    v9 = [*(id *)(a1 + 40) remoteTarget];
    [v9 updateLayout:*(void *)(*(void *)(a1 + 32) + 8 * *(char *)(a1 + 56) + 48) withTransition:0];
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 remoteProcess];
  int v11 = [v10 hasEntitlement:@"com.apple.frontboardservices.display-layout-monitor"];

  if (v11 && (unsigned __int8 v12 = [v9 decodeInt64ForKey:@"qos"], v12 <= 2u))
  {
    v13 = self->_queuesByQOS[(char)v12];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke;
    v14[3] = &unk_1E58F7440;
    v14[4] = self;
    unsigned __int8 v17 = v12;
    id v15 = v8;
    SEL v16 = a2;
    dispatch_sync(v13, v14);
  }
  else
  {
    [v8 invalidate];
  }
}

void __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v3 = *(char *)(a1 + 48);
  id v4 = a2;
  id v5 = [off_1E58F4580 serviceWithClass:_QOSClassForFBSDisplayLayoutQOS(v3)];
  [v4 setServiceQuality:v5];

  [v4 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8 * *(char *)(a1 + 48) + 24)];
  uint64_t v6 = +[FBSDisplayLayoutMonitor interface];
  [v4 setInterface:v6];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_3;
  v7[3] = &unk_1E58F73F0;
  char v9 = *(unsigned char *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 32);
  [v4 setInvalidationHandler:v7];
}

void __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 8 * *(char *)(a1 + 48) + 72);
  id v12 = v3;
  if (v4)
  {
    int v5 = [v4 containsObject:v3];
    uint64_t v6 = *(char *)(a1 + 48);
    if (!v5)
    {
      char v9 = NSString;
      v10 = _NSStringFromFBSDisplayLayoutQOS(v6);
      int v11 = [v9 stringWithFormat:@"could not find connection=%@ in tracked(%@)=%@", v12, v10, *(void *)(*(void *)(a1 + 32) + 8 * *(char *)(a1 + 48) + 72)];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_3_cold_1();
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
    }
    id v4 = *(void **)(*(void *)(a1 + 32) + 8 * v6 + 72);
    id v3 = v12;
  }
  [v4 removeObject:v3];
  if (![*(id *)(*(void *)(a1 + 32) + 8 * *(char *)(a1 + 48) + 72) count])
  {
    uint64_t v7 = *(void *)(a1 + 32) + 8 * *(char *)(a1 + 48);
    long long v8 = *(void **)(v7 + 72);
    *(void *)(v7 + 72) = 0;
  }
}

- (FBSDisplayLayoutPublisher)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on FBSDisplayLayoutPublisher"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    char v9 = v5;
    __int16 v10 = 2114;
    int v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    id v15 = @"FBSDisplayLayoutPublisher.m";
    __int16 v16 = 1024;
    int v17 = 46;
    __int16 v18 = 2114;
    long long v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_initWithConfiguration:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FBSDisplayLayoutPublisher;
  int v5 = [(FBSDisplayLayoutPublisher *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    invalidatedSignal = v5->_invalidatedSignal;
    v5->_invalidatedSignal = (BSAtomicSignal *)v6;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__FBSDisplayLayoutPublisher__initWithConfiguration___block_invoke;
    v16[3] = &unk_1E58F7330;
    v16[4] = v4;
    int v8 = v5;
    v16[5] = v8;
    uint64_t v9 = [off_1E58F4578 listenerWithConfigurator:v16];
    listener = v8->_listener;
    v8->_listener = (BSServiceConnectionListener *)v9;

    uint64_t v11 = objc_opt_new();
    mutableLayout = v8->_mutableLayout;
    v8->_mutableLayout = (FBSDisplayLayout *)v11;

    [(FBSDisplayLayout *)v8->_mutableLayout finalizeLayout];
    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    mutableElementKeys = v8->_mutableElementKeys;
    v8->_mutableElementKeys = (NSMutableSet *)v13;

    BSCreateSerializedBSXPCEncodableObject();
  }

  return 0;
}

void __52__FBSDisplayLayoutPublisher__initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v7 = a2;
  id v4 = [v3 domainIdentifier];
  [v7 setDomain:v4];

  int v5 = +[FBSDisplayLayoutMonitor serviceIdentifier];
  [v7 setService:v5];

  uint64_t v6 = [*(id *)(a1 + 32) instanceIdentifier];
  [v7 setInstance:v6];

  [v7 setDelegate:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (id)publisherWithConfiguration:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Fbsdisplaylayo_7.isa);
  if (!v3)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint8_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSDisplayLayoutPublisherConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }

  uint64_t v4 = [v3 domainIdentifier];
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    __int16 v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }

  uint64_t v5 = [v3 instanceIdentifier];
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    __int16 v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }

  id v6 = [[FBSDisplayLayoutPublisher alloc] _initWithConfiguration:v3];

  return v6;
}

- (void)activate
{
}

- (void)invalidate
{
  if ([(BSAtomicSignal *)self->_invalidatedSignal signal])
  {
    [(BSServiceConnectionListener *)self->_listener invalidate];
    uint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v5 = self->_queuesByQOS[v3];
      v6[0] = v4;
      v6[1] = 3221225472;
      v6[2] = __39__FBSDisplayLayoutPublisher_invalidate__block_invoke;
      v6[3] = &unk_1E58F6E70;
      v6[4] = self;
      char v7 = v3;
      dispatch_async(v5, v6);
      ++v3;
    }
    while (v3 != 3);
  }
}

void __39__FBSDisplayLayoutPublisher_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8 * *(char *)(a1 + 40) + 72) enumerateObjectsUsingBlock:&__block_literal_global_28];
  uint64_t v2 = *(void *)(a1 + 32) + 8 * *(char *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;
}

uint64_t __39__FBSDisplayLayoutPublisher_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (id)suppressLayoutForReason:(id)a3
{
  id v3 = a3;
  BSDispatchQueueAssertMain();
}

uint64_t __53__FBSDisplayLayoutPublisher_suppressLayoutForReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSuppression];
}

- (FBSDisplayConfiguration)displayConfiguration
{
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (int64_t)interfaceOrientation
{
}

- (void)setInterfaceOrientation:(int64_t)a3
{
}

- (int64_t)backlightLevel
{
}

- (void)setBacklightLevel:(int64_t)a3
{
}

- (BOOL)isTransitioning
{
}

- (void)addObserver:(id)a3
{
  if (a3) {
    BSDispatchQueueAssertMain();
  }
  id v3 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSDisplayLayoutPublisher addObserver:]();
  }
  [v3 UTF8String];
  _bs_set_crash_log_message();
}

- (void)removeObserver:(id)a3
{
}

- (void)setBacklightState:(int64_t)a3
{
}

- (void)_endSuppression
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionReasons, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_xLayout, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mutableElementKeys, 0);
  objc_storeStrong((id *)&self->_mutableLayout, 0);
  for (uint64_t i = 0; i != -3; --i)
    objc_storeStrong((id *)&self->_queues_connectionsByQOS[i + 2], 0);
  for (uint64_t j = 0; j != -3; --j)
    objc_storeStrong((id *)&self->_queues_xLayoutByQOS[j + 2], 0);
  for (uint64_t k = 40; k != 16; k -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_invalidatedSignal, 0);
}

+ (void)publisherWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)publisherWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)publisherWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)transitionAssertionWithReason:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addObserver:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_addElement:forKey:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_addElement:forKey:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_addElement:forKey:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_addElement:forKey:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_removeElement:forKey:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_19();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 40));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

@end