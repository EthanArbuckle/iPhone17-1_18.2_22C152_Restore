@interface HKWristDetectionSettingManager
+ (BOOL)isWristDetectEnabled;
- (BOOL)isWristDetectEnabled;
- (HKWristDetectionSettingManager)init;
- (HKWristDetectionSettingManager)initWithPairedDeviceRegistry:(id)a3;
- (id)_activeWatchNotifications;
- (id)pairedDeviceRegistry;
- (void)_activeWatchNotifications;
- (void)_pairedOrActiveDevicesDidChange:(id)a3;
- (void)_queue_notifyObservers;
- (void)_queue_settingDidChange;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKWristDetectionSettingManager

- (HKWristDetectionSettingManager)init
{
  return [(HKWristDetectionSettingManager *)self initWithPairedDeviceRegistry:0];
}

- (HKWristDetectionSettingManager)initWithPairedDeviceRegistry:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKWristDetectionSettingManager;
  v6 = [(HKWristDetectionSettingManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = HKCreateSerialDispatchQueue(v6, @"HKWristDetectManager private queue");
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v7->_loggingCategory, (id)HKLogDefault);
    v10 = [HKObserverSet alloc];
    v11 = [(HKWristDetectionSettingManager *)v7 description];
    uint64_t v12 = [(HKObserverSet *)v10 initWithName:v11 loggingCategory:v7->_loggingCategory];
    observers = v7->_observers;
    v7->_observers = (HKObserverSet *)v12;

    objc_storeStrong(&v7->_pairedDeviceRegistry, a3);
    v7->_disableWristDetectionSettingChangeNotificationToken = -1;
  }

  return v7;
}

- (void)dealloc
{
  int disableWristDetectionSettingChangeNotificationToken = self->_disableWristDetectionSettingChangeNotificationToken;
  if (disableWristDetectionSettingChangeNotificationToken != -1) {
    notify_cancel(disableWristDetectionSettingChangeNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HKWristDetectionSettingManager;
  [(HKWristDetectionSettingManager *)&v4 dealloc];
}

- (id)pairedDeviceRegistry
{
  id pairedDeviceRegistry = self->_pairedDeviceRegistry;
  if (pairedDeviceRegistry)
  {
    id v3 = pairedDeviceRegistry;
  }
  else
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    objc_super v4 = (void *)getNRPairedDeviceRegistryClass_softClass_4;
    uint64_t v11 = getNRPairedDeviceRegistryClass_softClass_4;
    if (!getNRPairedDeviceRegistryClass_softClass_4)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getNRPairedDeviceRegistryClass_block_invoke_4;
      v7[3] = &unk_1E58BD760;
      v7[4] = &v8;
      __getNRPairedDeviceRegistryClass_block_invoke_4((uint64_t)v7);
      objc_super v4 = (void *)v9[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v8, 8);
    id v3 = [v5 sharedInstance];
  }

  return v3;
}

+ (BOOL)isWristDetectEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = HKObjectForNanoPreferencesUserDefaultsKey(@"com.apple.Carousel", @"DisableWristDetection");
  objc_super v4 = v3;
  if (v3)
  {
    int v5 = [v3 BOOLValue] ^ 1;
  }
  else
  {
    _HKInitializeLogging();
    v6 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = a1;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to retrieve wrist detect setting, defaulting to YES.", (uint8_t *)&v8, 0xCu);
    }
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)isWristDetectEnabled
{
  v2 = objc_opt_class();

  return [v2 isWristDetectEnabled];
}

- (void)registerObserver:(id)a3
{
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__HKWristDetectionSettingManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E58BBA00;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

uint64_t __57__HKWristDetectionSettingManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObserving];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__HKWristDetectionSettingManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E58BBA00;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __53__HKWristDetectionSettingManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopObserving];
}

- (void)_startObserving
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_19C023000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation", buf, 0xCu);
  }
  if (self->_disableWristDetectionSettingChangeNotificationToken == -1)
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__HKWristDetectionSettingManager__startObserving__block_invoke;
    handler[3] = &unk_1E58BED68;
    objc_copyWeak(&v19, (id *)buf);
    notify_register_dispatch("CSLDisableWristDetectionChangedNotification", &self->_disableWristDetectionSettingChangeNotificationToken, queue, handler);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  int v5 = +[_HKBehavior sharedBehavior];
  char v6 = [v5 isAppleWatch];

  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v8 = [(HKWristDetectionSettingManager *)self _activeWatchNotifications];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v13 = [(HKWristDetectionSettingManager *)self pairedDeviceRegistry];
          [v7 addObserver:self selector:sel__pairedOrActiveDevicesDidChange_ name:v12 object:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

void __49__HKWristDetectionSettingManager__startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_settingDidChange");
}

- (id)_activeWatchNotifications
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v2 = (id *)getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_0;
  uint64_t v17 = getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_0;
  if (!getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_0)
  {
    id v3 = (void *)NanoRegistryLibrary_4();
    v15[3] = (uint64_t)dlsym(v3, "NRPairedDeviceRegistryDeviceIsSetupNotification");
    getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_0 = v15[3];
    v2 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v2) {
    -[HKWristDetectionSettingManager _activeWatchNotifications]();
  }
  id v4 = *v2;
  v18[0] = v4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v5 = (id *)getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_0;
  uint64_t v17 = getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_0;
  if (!getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_0)
  {
    char v6 = (void *)NanoRegistryLibrary_4();
    v15[3] = (uint64_t)dlsym(v6, "NRPairedDeviceRegistryDeviceDidUnpairNotification");
    getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_0 = v15[3];
    int v5 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v5) {
    -[HKWristDetectionSettingManager _activeWatchNotifications]();
  }
  id v7 = *v5;
  v18[1] = v7;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v8 = (id *)getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_0;
  uint64_t v17 = getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_0;
  if (!getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_0)
  {
    uint64_t v9 = (void *)NanoRegistryLibrary_4();
    v15[3] = (uint64_t)dlsym(v9, "NRPairedDeviceRegistryDeviceDidBecomeActive");
    getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_0 = v15[3];
    int v8 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v8) {
    -[HKWristDetectionSettingManager _activeWatchNotifications]();
  }
  id v19 = *v8;
  uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = v19;
  uint64_t v12 = [v10 arrayWithObjects:v18 count:3];

  return v12;
}

- (void)_stopObserving
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_19C023000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation", buf, 0xCu);
  }
  int disableWristDetectionSettingChangeNotificationToken = self->_disableWristDetectionSettingChangeNotificationToken;
  if (disableWristDetectionSettingChangeNotificationToken != -1) {
    notify_cancel(disableWristDetectionSettingChangeNotificationToken);
  }
  int v5 = +[_HKBehavior sharedBehavior];
  char v6 = [v5 isAppleWatch];

  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v8 = [(HKWristDetectionSettingManager *)self _activeWatchNotifications];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v14 = [(HKWristDetectionSettingManager *)self pairedDeviceRegistry];
          [v7 removeObserver:self name:v13 object:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)_queue_settingDidChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = loggingCategory;
    *(_DWORD *)char v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification of setting change", v6, 0xCu);
  }
  [(HKWristDetectionSettingManager *)self _queue_notifyObservers];
}

- (void)_pairedOrActiveDevicesDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = loggingCategory;
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = [v4 name];
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    long long v15 = v9;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received pairing/active notification: %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKWristDetectionSettingManager__pairedOrActiveDevicesDidChange___block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __66__HKWristDetectionSettingManager__pairedOrActiveDevicesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

- (void)_queue_notifyObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__HKWristDetectionSettingManager__queue_notifyObservers__block_invoke;
  v4[3] = &unk_1E58C6020;
  v4[4] = self;
  [(HKObserverSet *)observers notifyObservers:v4];
}

uint64_t __56__HKWristDetectionSettingManager__queue_notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 wristDetectionSettingManagerDidObserveWristDetectChange:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_activeWatchNotifications
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRPairedDeviceRegistryDeviceDidBecomeActive(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKWristDetectionSettingManager.m", 28, @"%s", dlerror());

  __break(1u);
}

@end