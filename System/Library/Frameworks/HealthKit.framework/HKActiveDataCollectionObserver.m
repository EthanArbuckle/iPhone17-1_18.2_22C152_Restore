@interface HKActiveDataCollectionObserver
+ (id)clientInterface;
+ (id)serverInterface;
- (BOOL)allowCollectionPause;
- (HKActiveDataCollectionObserver)initWithHealthStore:(id)a3;
- (HKActiveDataCollectionObserverDelegate)delegate;
- (NSArray)activelyCollectedTypes;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_restartTaskServerIfNeeded;
- (void)client_didChangeAllowCollectionPause:(BOOL)a3;
- (void)client_updatedCollectedTypes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)subscribeForQuantityTypes:(id)a3;
- (void)unsubscribeForQuantityTypes:(id)a3;
@end

@implementation HKActiveDataCollectionObserver

- (HKActiveDataCollectionObserver)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKActiveDataCollectionObserver;
  v5 = [(HKActiveDataCollectionObserver *)&v15 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v9 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v4 taskIdentifier:@"HKActiveDataCollectionObserverTaskServerIdentifier" exportedObject:v6 taskUUID:v6->_identifier];
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = v9;

    objc_initWeak(&location, v6);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__HKActiveDataCollectionObserver_initWithHealthStore___block_invoke;
    v12[3] = &unk_1E58BF950;
    objc_copyWeak(&v13, &location);
    [(HKProxyProvider *)v6->_proxyProvider setAutomaticProxyReconnectionHandler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __54__HKActiveDataCollectionObserver_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HKActiveDataCollectionObserver _restartTaskServerIfNeeded]((uint64_t)WeakRetained);
}

- (void)_restartTaskServerIfNeeded
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    id v3 = [*(id *)(a1 + 32) allObjects];
    os_unfair_lock_unlock(v2);
    if ([v3 count]) {
      [(id)a1 subscribeForQuantityTypes:v3];
    }
  }
}

- (NSArray)activelyCollectedTypes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSArray *)self->_activelyCollectedTypes copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)subscribeForQuantityTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Subscribing to active collection of types %@", buf, 0x16u);
  }
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke;
  v9[3] = &unk_1E58BF978;
  id v10 = v4;
  v11 = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2;
  v8[3] = &unk_1E58BBCC0;
  v8[4] = self;
  id v7 = v4;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v8];
}

void __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "remote_subscribeForQuantityTypes:", *(void *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  id v3 = *(void **)(*(void *)(a1 + 40) + 32);
  if (v3)
  {
    [v3 addObjectsFromArray:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;
  }
  id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 24);

  os_unfair_lock_unlock(v7);
}

void __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2_cold_1();
  }
}

- (void)unsubscribeForQuantityTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Unsubscribing to active collection of types %@", buf, 0x16u);
  }
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HKActiveDataCollectionObserver_unsubscribeForQuantityTypes___block_invoke;
  v9[3] = &unk_1E58BF978;
  id v10 = v4;
  v11 = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__HKActiveDataCollectionObserver_unsubscribeForQuantityTypes___block_invoke_2;
  v8[3] = &unk_1E58BBCC0;
  v8[4] = self;
  id v7 = v4;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v8];
}

void __62__HKActiveDataCollectionObserver_unsubscribeForQuantityTypes___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "remote_unsubscribeForQuantityTypes:", *(void *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  id v3 = *(void **)(*(void *)(a1 + 40) + 32);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  [v3 minusSet:v4];

  uint64_t v5 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 24);

  os_unfair_lock_unlock(v5);
}

void __62__HKActiveDataCollectionObserver_unsubscribeForQuantityTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2_cold_1();
  }
}

+ (id)clientInterface
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52310];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = [v3 setWithArray:v4];

  [v2 setClasses:v5 forSelector:sel_client_updatedCollectedTypes_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)serverInterface
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52370];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = [v3 setWithArray:v4];

  [v2 setClasses:v5 forSelector:sel_remote_subscribeForQuantityTypes_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v5 forSelector:sel_remote_unsubscribeForQuantityTypes_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)exportedInterface
{
  id v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  id v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (void)client_updatedCollectedTypes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated actively collected types: %@", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)[v4 copy];
  activelyCollectedTypes = self->_activelyCollectedTypes;
  self->_activelyCollectedTypes = v6;

  objc_copyWeak((id *)&v11, (id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&v11);
  BOOL v9 = WeakRetained == 0;

  if (!v9)
  {
    id v10 = objc_loadWeakRetained((id *)&v11);
    [v10 activeDataCollectionObserver:self updatedCollectedTypes:v4];
  }
  objc_destroyWeak((id *)&v11);
}

- (void)client_didChangeAllowCollectionPause:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"NO";
    if (v3) {
      v6 = @"YES";
    }
    int v11 = 138543618;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Did change allow collection pause %@", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  self->_allowCollectionPause = v3;
  objc_copyWeak((id *)&v11, (id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&v11);
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&v11);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&v11);
      [v10 activeDataCollectionObserver:self didChangeAllowCollectionPause:v3];
    }
  }
  objc_destroyWeak((id *)&v11);
}

- (HKActiveDataCollectionObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKActiveDataCollectionObserverDelegate *)WeakRetained;
}

- (BOOL)allowCollectionPause
{
  return self->_allowCollectionPause;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activelyCollectedTypes, 0);
  objc_storeStrong((id *)&self->_subscribedTypes, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

void __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "%{public}@: Unable to fetch active data collection observer proxy %{public}@ with error: %{public}@");
}

@end