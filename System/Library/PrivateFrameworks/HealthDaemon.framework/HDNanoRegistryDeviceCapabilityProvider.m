@interface HDNanoRegistryDeviceCapabilityProvider
- (BOOL)isCapabilitySupported:(id)a3 onDevice:(id)a4;
- (HDNanoRegistryDeviceCapabilityProvider)init;
- (HDNanoRegistryDeviceCapabilityProvider)initWithActivePairedDeviceProvider:(id)a3;
- (id)activePairedDevice;
- (id)isCapabilitySupportedOnActivePairedDevice:(id)a3 error:(id *)a4;
- (void)_pairedOrActiveDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)resetCachedLastActivePairedDevice;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDNanoRegistryDeviceCapabilityProvider

- (HDNanoRegistryDeviceCapabilityProvider)init
{
  return [(HDNanoRegistryDeviceCapabilityProvider *)self initWithActivePairedDeviceProvider:&__block_literal_global_2];
}

id __46__HDNanoRegistryDeviceCapabilityProvider_init__block_invoke()
{
  v0 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v1 = [MEMORY[0x1E4F79EF0] activeDeviceSelectorBlock];
  v2 = [v0 getDevicesMatching:v1];
  v3 = [v2 firstObject];

  return v3;
}

- (HDNanoRegistryDeviceCapabilityProvider)initWithActivePairedDeviceProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDNanoRegistryDeviceCapabilityProvider;
  v5 = [(HDNanoRegistryDeviceCapabilityProvider *)&v16 init];
  v6 = v5;
  if (v5)
  {
    v5->_pairedDeviceDidChangeCapabilitiesNotificationToken = -1;
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = HKLogInfrastructure();
    uint64_t v11 = [v7 initWithName:v9 loggingCategory:v10];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v11;

    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_lock_isListeningForUpdates = 0;
    v13 = _Block_copy(v4);
    id activePairedDeviceProvider = v6->_activePairedDeviceProvider;
    v6->_id activePairedDeviceProvider = v13;
  }
  return v6;
}

void __67__HDNanoRegistryDeviceCapabilityProvider__startListeningForUpdates__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v1 = HKLogInfrastructure();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = objc_opt_class();
      id v2 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_1BCB7D000, v1, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying delegate for a device capabilities change", (uint8_t *)&buf, 0xCu);
    }
    -[HDNanoRegistryDeviceCapabilityProvider resetCachedLastActivePairedDevice]((uint64_t)WeakRetained);
    v3 = (void *)WeakRetained[2];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v6 = __76__HDNanoRegistryDeviceCapabilityProvider__pairedDeviceDidChangeCapabilities__block_invoke;
    id v7 = &unk_1E62F34B8;
    v8 = WeakRetained;
    [v3 notifyObservers:&buf];
  }
}

- (void)dealloc
{
  int pairedDeviceDidChangeCapabilitiesNotificationToken = self->_pairedDeviceDidChangeCapabilitiesNotificationToken;
  if (pairedDeviceDidChangeCapabilitiesNotificationToken != -1) {
    notify_cancel(pairedDeviceDidChangeCapabilitiesNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HDNanoRegistryDeviceCapabilityProvider;
  [(HDNanoRegistryDeviceCapabilityProvider *)&v4 dealloc];
}

- (void)_pairedOrActiveDevicesDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 name];
    *(_DWORD *)long long buf = 138543618;
    v12 = v6;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying delegate for an active device change: %{public}@", buf, 0x16u);
  }
  -[HDNanoRegistryDeviceCapabilityProvider resetCachedLastActivePairedDevice]((uint64_t)self);
  observers = self->_observers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HDNanoRegistryDeviceCapabilityProvider__pairedOrActiveDevicesDidChange___block_invoke;
  v10[3] = &unk_1E62F34B8;
  v10[4] = self;
  [(HKObserverSet *)observers notifyObservers:v10];
}

- (void)resetCachedLastActivePairedDevice
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v3 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    os_unfair_lock_unlock(v2);
  }
}

uint64_t __74__HDNanoRegistryDeviceCapabilityProvider__pairedOrActiveDevicesDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pairedDeviceCapabilitiesDidUpdate:*(void *)(a1 + 32)];
}

uint64_t __76__HDNanoRegistryDeviceCapabilityProvider__pairedDeviceDidChangeCapabilities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pairedDeviceCapabilitiesDidUpdate:*(void *)(a1 + 32)];
}

- (id)isCapabilitySupportedOnActivePairedDevice:(id)a3 error:(id *)a4
{
  v5 = NSNumber;
  id v6 = a3;
  id v7 = [(HDNanoRegistryDeviceCapabilityProvider *)self activePairedDevice];
  uint64_t v8 = [v7 supportsCapability:v6];

  uint64_t v9 = [v5 numberWithInt:v8];

  return v9;
}

- (id)activePairedDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_lastActivePairedDevice;
  if (!v4)
  {
    v5 = (*((void (**)(void))self->_activePairedDeviceProvider + 2))();
    id v4 = v5;
    os_unfair_lock_assert_owner(p_lock);
    if (self->_lock_isListeningForUpdates && !self->_lock_lastActivePairedDevice) {
      objc_storeStrong((id *)&self->_lock_lastActivePairedDevice, v5);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isCapabilitySupported:(id)a3 onDevice:(id)a4
{
  return [a4 supportsCapability:a3];
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__HDNanoRegistryDeviceCapabilityProvider_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E62F3208;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

void __65__HDNanoRegistryDeviceCapabilityProvider_registerObserver_queue___block_invoke(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = *MEMORY[0x1E4F79EB8];
    v18[0] = *MEMORY[0x1E4F79EC0];
    v18[1] = v3;
    v18[2] = *MEMORY[0x1E4F79E88];
    [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v4);
          }
          [v2 addObserver:v1 selector:sel__pairedOrActiveDevicesDidChange_ name:*(void *)(*((void *)&v13 + 1) + 8 * i) object:0];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }

    objc_initWeak(&location, (id)v1);
    *(_DWORD *)(v1 + 8) = -1;
    uint64_t v8 = (const char *)[(id)*MEMORY[0x1E4F79ED0] UTF8String];
    id v9 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__HDNanoRegistryDeviceCapabilityProvider__startListeningForUpdates__block_invoke;
    v10[3] = &unk_1E62F3490;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v8, (int *)(v1 + 8), MEMORY[0x1E4F14428], v10);

    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
    *(unsigned char *)(v1 + 28) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)unregisterObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activePairedDeviceProvider, 0);
  objc_storeStrong((id *)&self->_lock_lastActivePairedDevice, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end