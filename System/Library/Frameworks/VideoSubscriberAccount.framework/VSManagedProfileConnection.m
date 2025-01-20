@interface VSManagedProfileConnection
+ (id)sharedConnection;
- (MCProfileConnection)profileConnection;
- (NSMutableSet)observers;
- (OS_dispatch_queue)notificationQueue;
- (VSManagedProfileConnection)init;
- (id)providerUniqueID;
- (id)userToken;
- (int64_t)BOOLForManagedConfigurationBool:(int)a3;
- (int64_t)TVProviderModificationAllowed;
- (int64_t)UIAppInstallationAllowed;
- (int64_t)accountModificationAllowed;
- (int64_t)analyticsAllowed;
- (int64_t)appInstallationAllowed;
- (int64_t)maximumAppsRating;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)refreshProfileWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProfileConnection:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation VSManagedProfileConnection

+ (id)sharedConnection
{
  if (sharedConnection___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedConnection___vs_lazy_init_predicate, &__block_literal_global_25);
  }
  v2 = (void *)sharedConnection___vs_lazy_init_variable;

  return v2;
}

uint64_t __46__VSManagedProfileConnection_sharedConnection__block_invoke()
{
  sharedConnection___vs_lazy_init_variable = objc_alloc_init(VSManagedProfileConnection);

  return MEMORY[0x1F41817F8]();
}

- (VSManagedProfileConnection)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSManagedProfileConnection;
  v2 = [(VSManagedProfileConnection *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v3;

    dispatch_queue_t v5 = dispatch_queue_create(0, 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observers = v2->_observers;
    v2->_observers = v7;
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(VSManagedProfileConnection *)self notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__VSManagedProfileConnection_registerObserver___block_invoke;
  v7[3] = &unk_1E6BD2C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __47__VSManagedProfileConnection_registerObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) profileConnection];
  [v2 registerObserver:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) observers];
  [v3 addObject:*(void *)(a1 + 40)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(VSManagedProfileConnection *)self notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__VSManagedProfileConnection_unregisterObserver___block_invoke;
  v7[3] = &unk_1E6BD2C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __49__VSManagedProfileConnection_unregisterObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (id)providerUniqueID
{
  id v2 = [(VSManagedProfileConnection *)self profileConnection];
  id v3 = [v2 deviceOrganizationVendorID];

  return v3;
}

- (id)userToken
{
  id v2 = [(VSManagedProfileConnection *)self profileConnection];
  id v3 = [v2 tvProviderUserToken];

  return v3;
}

- (void)refreshProfileWithCompletion:(id)a3
{
}

- (int64_t)analyticsAllowed
{
  id v3 = [(VSManagedProfileConnection *)self profileConnection];
  int64_t v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FB8]]);

  return v4;
}

- (int64_t)appInstallationAllowed
{
  id v3 = [(VSManagedProfileConnection *)self profileConnection];
  int64_t v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F00]]);

  return v4;
}

- (int64_t)UIAppInstallationAllowed
{
  id v3 = [(VSManagedProfileConnection *)self profileConnection];
  int64_t v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F74188]]);

  return v4;
}

- (int64_t)accountModificationAllowed
{
  id v3 = [(VSManagedProfileConnection *)self profileConnection];
  int64_t v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]]);

  return v4;
}

- (int64_t)TVProviderModificationAllowed
{
  id v3 = [(VSManagedProfileConnection *)self profileConnection];
  int64_t v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F74160]]);

  return v4;
}

- (int64_t)maximumAppsRating
{
  id v2 = [(VSManagedProfileConnection *)self profileConnection];
  id v3 = [v2 effectiveValueForSetting:*MEMORY[0x1E4F740B0]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)BOOLForManagedConfigurationBool:(int)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  dispatch_queue_t v5 = [(VSManagedProfileConnection *)self notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__VSManagedProfileConnection_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke;
  block[3] = &unk_1E6BD29A8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __103__VSManagedProfileConnection_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 profileConnectionSettingsChanged:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end