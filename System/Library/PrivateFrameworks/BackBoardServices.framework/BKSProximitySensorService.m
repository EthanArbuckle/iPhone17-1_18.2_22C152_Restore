@interface BKSProximitySensorService
+ (id)sharedInstance;
- (id)_init;
- (id)addObserver:(id)a3 forReason:(id)a4;
- (void)_connectToRemoteServiceIfNeeded;
- (void)proximityDetectionMaskDidChange:(id)a3;
@end

@implementation BKSProximitySensorService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)addObserver:(id)a3 forReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(BKSProximitySensorService *)self _connectToRemoteServiceIfNeeded];
  v8 = [(BSCompoundAssertion *)self->_observers acquireForReason:v6 withContext:v7];

  return v8;
}

- (void)proximityDetectionMaskDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_calloutQueue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(BSCompoundAssertion *)self->_observers orderedContext];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) proximitySensorDetectionMaskDidChange:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_connectToRemoteServiceIfNeeded
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_connection = &self->_connection;
  if (!self->_connection)
  {
    v5 = +[BKSHIDServiceConnection clientConnectionForServiceWithName:@"BKProximitySensor"];
    if (v5)
    {
      objc_storeStrong((id *)p_connection, v5);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__BKSProximitySensorService__connectToRemoteServiceIfNeeded__block_invoke;
      v15[3] = &unk_1E5441878;
      v15[4] = self;
      [v5 configureConnection:v15];
      uint64_t v6 = BKLogUISensor();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEBUG, "activating connection to server", buf, 2u);
      }

      [v5 activate];
      uint64_t v7 = BKLogUISensor();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v14 = [v5 remoteTarget];
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_debug_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", buf, 0xCu);
      }
      uint64_t v8 = [v5 remoteTarget];

      if (!v8)
      {
        uint64_t v9 = [NSString stringWithFormat:@"we must have a remote target"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          long long v10 = NSStringFromSelector(a2);
          long long v11 = (objc_class *)objc_opt_class();
          long long v12 = NSStringFromClass(v11);
          *(_DWORD *)buf = 138544642;
          v17 = v10;
          __int16 v18 = 2114;
          v19 = v12;
          __int16 v20 = 2048;
          v21 = self;
          __int16 v22 = 2114;
          v23 = @"BKSProximitySensorService.m";
          __int16 v24 = 1024;
          int v25 = 95;
          __int16 v26 = 2114;
          v27 = v9;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v9 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA3A830);
      }
    }
    else
    {
      long long v13 = BKLogUISensor();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AA0B000, v13, OS_LOG_TYPE_ERROR, "cannot get connection for service", buf, 2u);
      }
    }
  }
}

void __60__BKSProximitySensorService__connectToRemoteServiceIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BKLogUISensor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_debug_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEBUG, "configured client service", v9, 2u);
  }

  v5 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED7714F0];
  uint64_t v6 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED7792B0];
  uint64_t v7 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"BKProximitySensor"];
  [v7 setServer:v6];
  [v7 setClient:v5];
  [v3 setInterface:v7];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v8 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v8];

  [v3 setInterruptionHandler:&__block_literal_global_2701];
  [v3 setInvalidationHandler:&__block_literal_global_62_2702];
}

void __60__BKSProximitySensorService__connectToRemoteServiceIfNeeded__block_invoke_60()
{
  v0 = BKLogUISensor();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18AA0B000, v0, OS_LOG_TYPE_ERROR, "backboardd must be going down, sounds like fun", v1, 2u);
  }
}

void __60__BKSProximitySensorService__connectToRemoteServiceIfNeeded__block_invoke_58(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BKLogUISensor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "service interruption -- attempting to reactivate", v4, 2u);
  }

  [v2 activate];
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)BKSProximitySensorService;
  id v2 = [(BKSProximitySensorService *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.backboardd.BKSProximitySensorService", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    v5 = (void *)MEMORY[0x1E4F4F6E8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__BKSProximitySensorService__init__block_invoke;
    v10[3] = &unk_1E5440EC8;
    uint64_t v6 = v2;
    long long v11 = v6;
    uint64_t v7 = [v5 assertionWithIdentifier:@"BKSProximitySensorService observers" stateDidChangeHandler:v10];
    observers = v6->_observers;
    v6->_observers = (BSCompoundAssertion *)v7;
  }
  return v2;
}

void __34__BKSProximitySensorService__init__block_invoke(uint64_t a1, void *a2)
{
  dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  v5 = [v3 remoteTarget];
  uint64_t v6 = NSNumber;
  uint64_t v7 = [v4 isActive];

  uint64_t v8 = [v6 numberWithBool:v7];
  uint64_t v9 = [v5 setObservesProximitySensorDetectionMaskChanges:v8];

  if (v9)
  {
    long long v10 = *(void **)(a1 + 32);
    long long v11 = v10[2];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__BKSProximitySensorService__init__block_invoke_2;
    v12[3] = &unk_1E5441BB0;
    long long v13 = v10;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t __34__BKSProximitySensorService__init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) proximityDetectionMaskDidChange:*(void *)(a1 + 40)];
}

+ (id)sharedInstance
{
  id v2 = [[BKSProximitySensorService alloc] _init];
  return v2;
}

@end