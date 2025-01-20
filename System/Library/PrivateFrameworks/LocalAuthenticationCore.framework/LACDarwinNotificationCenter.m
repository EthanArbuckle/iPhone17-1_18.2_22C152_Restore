@interface LACDarwinNotificationCenter
+ (LACDarwinNotificationCenter)sharedInstance;
- (BOOL)_hasSubscriptionToNotification:(__CFString *)a3;
- (BOOL)hasObserver:(id)a3;
- (LACDarwinNotificationCenter)init;
- (int64_t)observerCount;
- (void)_addSubscriptionToNotification:(__CFString *)a3;
- (void)_notifyObserversAboutNotification:(__CFString *)a3;
- (void)_postNotification:(__CFString *)a3;
- (void)_startObservingNotification:(__CFString *)a3;
- (void)_stopObservingAllNotifications;
- (void)_synchronizedObservers:(id)a3;
- (void)_synchronizedSubscriptions:(id)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 notification:(__CFString *)a4;
- (void)listenToLaunchNotifications;
- (void)postNotification:(__CFString *)a3;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)stopListeningToAllNotifications;
@end

@implementation LACDarwinNotificationCenter

- (LACDarwinNotificationCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)LACDarwinNotificationCenter;
  v2 = [(LACDarwinNotificationCenter *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    subscriptions = v2->_subscriptions;
    v2->_subscriptions = v5;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    v2->_subscriptionsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (LACDarwinNotificationCenter)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance_sharedInstance_8;
  return (LACDarwinNotificationCenter *)v2;
}

uint64_t __45__LACDarwinNotificationCenter_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_8 = objc_alloc_init(LACDarwinNotificationCenter);
  return MEMORY[0x270F9A758]();
}

- (void)removeAllObservers
{
}

uint64_t __49__LACDarwinNotificationCenter_removeAllObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)stopListeningToAllNotifications
{
  [(LACDarwinNotificationCenter *)self _synchronizedSubscriptions:&__block_literal_global_8_0];
  [(LACDarwinNotificationCenter *)self _stopObservingAllNotifications];
}

uint64_t __62__LACDarwinNotificationCenter_stopListeningToAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (int64_t)observerCount
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__LACDarwinNotificationCenter_observerCount__block_invoke;
  v4[3] = &unk_2653B68E8;
  v4[4] = &v5;
  [(LACDarwinNotificationCenter *)self _synchronizedObservers:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__LACDarwinNotificationCenter_observerCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)listenToLaunchNotifications
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__LACDarwinNotificationCenter_listenToLaunchNotifications__block_invoke;
  v2[3] = &unk_2653B6910;
  objc_copyWeak(&v3, &location);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __58__LACDarwinNotificationCenter_listenToLaunchNotifications__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]));
    [WeakRetained _addSubscriptionToNotification:v4];
    [WeakRetained _notifyObserversAboutNotification:v4];
  }
}

- (void)postNotification:(__CFString *)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = LACLogNotifications();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = a3;
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "Will post %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(LACDarwinNotificationCenter *)self _postNotification:a3];
}

- (BOOL)hasObserver:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__LACDarwinNotificationCenter_hasObserver___block_invoke;
  v7[3] = &unk_2653B6938;
  v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(LACDarwinNotificationCenter *)self _synchronizedObservers:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __43__LACDarwinNotificationCenter_hasObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)addObserver:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__LACDarwinNotificationCenter_addObserver___block_invoke;
  v7[3] = &unk_2653B6960;
  id v5 = v4;
  id v8 = v5;
  [(LACDarwinNotificationCenter *)self _synchronizedObservers:v7];
  int v6 = LACLogNotifications();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Did register observer %@", buf, 0xCu);
  }
}

uint64_t __43__LACDarwinNotificationCenter_addObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3 notification:(__CFString *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__LACDarwinNotificationCenter_addObserver_notification___block_invoke;
  v9[3] = &unk_2653B6960;
  id v7 = v6;
  id v10 = v7;
  [(LACDarwinNotificationCenter *)self _synchronizedObservers:v9];
  [(LACDarwinNotificationCenter *)self _startObservingNotification:a4];
  id v8 = LACLogNotifications();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    v14 = a4;
    _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "Did register observer %@ of notification %@", buf, 0x16u);
  }
}

uint64_t __56__LACDarwinNotificationCenter_addObserver_notification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__LACDarwinNotificationCenter_removeObserver___block_invoke;
  v7[3] = &unk_2653B6960;
  id v5 = v4;
  id v8 = v5;
  [(LACDarwinNotificationCenter *)self _synchronizedObservers:v7];
  id v6 = LACLogNotifications();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Did remove observer %@", buf, 0xCu);
  }
}

uint64_t __46__LACDarwinNotificationCenter_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)_notifyObserversAboutNotification:(__CFString *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = LACLogNotifications();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "Did receive notification %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__LACDarwinNotificationCenter__notifyObserversAboutNotification___block_invoke;
  v14[3] = &unk_2653B68E8;
  v14[4] = &buf;
  [(LACDarwinNotificationCenter *)self _synchronizedObservers:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "notificationCenter:didReceiveNotification:", self, a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __65__LACDarwinNotificationCenter__notifyObserversAboutNotification___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];
  return MEMORY[0x270F9A758]();
}

- (void)_postNotification:(__CFString *)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0, 0, 1u);
}

- (void)_startObservingNotification:(__CFString *)a3
{
  if (!-[LACDarwinNotificationCenter _hasSubscriptionToNotification:](self, "_hasSubscriptionToNotification:"))
  {
    [(LACDarwinNotificationCenter *)self _addSubscriptionToNotification:a3];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, a3, 0);
    id v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)LACDarwinNotificationCenterCallBack, a3, 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)_stopObservingAllNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (BOOL)_hasSubscriptionToNotification:(__CFString *)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__LACDarwinNotificationCenter__hasSubscriptionToNotification___block_invoke;
  v5[3] = &unk_2653B6988;
  v5[4] = &v6;
  v5[5] = a3;
  [(LACDarwinNotificationCenter *)self _synchronizedSubscriptions:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__LACDarwinNotificationCenter__hasSubscriptionToNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_addSubscriptionToNotification:(__CFString *)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__LACDarwinNotificationCenter__addSubscriptionToNotification___block_invoke;
  v3[3] = &__block_descriptor_40_e22_v16__0__NSMutableSet_8l;
  v3[4] = a3;
  [(LACDarwinNotificationCenter *)self _synchronizedSubscriptions:v3];
}

uint64_t __62__LACDarwinNotificationCenter__addSubscriptionToNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)_synchronizedObservers:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = (void (**)(id, NSHashTable *))a3;
  os_unfair_lock_lock(p_observersLock);
  v5[2](v5, self->_observers);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_synchronizedSubscriptions:(id)a3
{
  p_subscriptionsLock = &self->_subscriptionsLock;
  id v5 = (void (**)(id, NSMutableSet *))a3;
  os_unfair_lock_lock(p_subscriptionsLock);
  v5[2](v5, self->_subscriptions);

  os_unfair_lock_unlock(p_subscriptionsLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end