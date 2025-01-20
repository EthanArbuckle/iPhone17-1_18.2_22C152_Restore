@interface DBIconBadgeController
+ (id)_alwaysAllowedBadgeSources;
- (BOOL)notificationsEnabledForIdentifier:(id)a3;
- (CARObserverHashTable)observers;
- (DBIconBadgeController)init;
- (NSDictionary)lock_badgesAllowedByIdentifier;
- (OS_dispatch_queue)badgeSettingsUpdateQueue;
- (void)_badge_queue_removeBadgeSettingsForIdentifiers:(id)a3;
- (void)_badge_queue_updateNotificationSourcesWithIdentifiers:(id)a3;
- (void)addObserver:(id)a3;
- (void)applicationController:(id)a3 addedApplications:(id)a4 updatedApplications:(id)a5 removedApplications:(id)a6;
- (void)removeObserver:(id)a3;
- (void)setBadgeSettingsUpdateQueue:(id)a3;
- (void)setLock_badgesAllowedByIdentifier:(id)a3;
- (void)setObservers:(id)a3;
- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4;
@end

@implementation DBIconBadgeController

- (DBIconBadgeController)init
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)DBIconBadgeController;
  v2 = [(DBIconBadgeController *)&v36 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1DEEC8];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v6 = +[DBIconBadgeController _alwaysAllowedBadgeSources];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      uint64_t v10 = MEMORY[0x263EFFA88];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 setObject:v10 forKey:*(void *)(*((void *)&v32 + 1) + 8 * v11++)];
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [v5 copy];
    lock_badgesAllowedByIdentifier = v2->_lock_badgesAllowedByIdentifier;
    v2->_lock_badgesAllowedByIdentifier = (NSDictionary *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.carplayapp.badgeSettingsUpdateQueue", v14);
    badgeSettingsUpdateQueue = v2->_badgeSettingsUpdateQueue;
    v2->_badgeSettingsUpdateQueue = (OS_dispatch_queue *)v15;

    v17 = +[DBNotificationSettingsCenter defaultCenter];
    [v17 addObserver:v2];

    v18 = +[DBApplicationController sharedInstance];
    v19 = [v18 allApplications];

    v20 = objc_msgSend(v19, "bs_map:", &__block_literal_global_32);
    v21 = v2->_badgeSettingsUpdateQueue;
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __29__DBIconBadgeController_init__block_invoke_2;
    v29 = &unk_2649B3D30;
    v22 = v2;
    v30 = v22;
    id v31 = v20;
    id v23 = v20;
    dispatch_async(v21, &v26);
    v24 = +[DBApplicationController sharedInstance];
    [v24 addObserver:v22];
  }
  return v2;
}

uint64_t __29__DBIconBadgeController_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

void __29__DBIconBadgeController_init__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  objc_msgSend(v1, "_badge_queue_updateNotificationSourcesWithIdentifiers:", v2);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBIconBadgeController *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBIconBadgeController *)self observers];
  [v5 removeObserver:v4];
}

- (BOOL)notificationsEnabledForIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  id v5 = [(DBIconBadgeController *)self lock_badgesAllowedByIdentifier];
  id v17 = (id)[v5 copy];

  os_unfair_lock_unlock(&self->_lock);
  v6 = (void *)v13[5];
  if (!v6)
  {
    uint64_t v7 = [(DBIconBadgeController *)self badgeSettingsUpdateQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__DBIconBadgeController_notificationsEnabledForIdentifier___block_invoke;
    v11[3] = &unk_2649B3FD0;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    v6 = (void *)v13[5];
  }
  uint64_t v8 = [v6 objectForKey:v4];
  char v9 = [v8 BOOLValue];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __59__DBIconBadgeController_notificationsEnabledForIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = objc_msgSend(*(id *)(a1 + 32), "lock_badgesAllowedByIdentifier");
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v6);
}

+ (id)_alwaysAllowedBadgeSources
{
  if (_alwaysAllowedBadgeSources_onceToken != -1) {
    dispatch_once(&_alwaysAllowedBadgeSources_onceToken, &__block_literal_global_72);
  }
  id v2 = (void *)_alwaysAllowedBadgeSources___alwaysBadgeIdentifiers;
  return v2;
}

void __51__DBIconBadgeController__alwaysAllowedBadgeSources__block_invoke()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.AutoSettings";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  v1 = (void *)_alwaysAllowedBadgeSources___alwaysBadgeIdentifiers;
  _alwaysAllowedBadgeSources___alwaysBadgeIdentifiers = v0;
}

- (void)_badge_queue_updateNotificationSourcesWithIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  badgeSettingsUpdateQueue = self->_badgeSettingsUpdateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(badgeSettingsUpdateQueue);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [MEMORY[0x263F84580] currentNotificationSettingsCenter];
  uint64_t v8 = [v7 notificationSourcesWithIdentifiers:v5];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__DBIconBadgeController__badge_queue_updateNotificationSourcesWithIdentifiers___block_invoke;
  v14[3] = &unk_2649B6298;
  id v9 = v6;
  id v15 = v9;
  [v8 enumerateObjectsUsingBlock:v14];
  uint64_t v10 = DBLogForCategory(0xEuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v9;
    _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Updated user notification settings %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = (void *)[(NSDictionary *)self->_lock_badgesAllowedByIdentifier mutableCopy];
  [v11 addEntriesFromDictionary:v9];
  uint64_t v12 = (NSDictionary *)[v11 copy];
  lock_badgesAllowedByIdentifier = self->_lock_badgesAllowedByIdentifier;
  self->_lock_badgesAllowedByIdentifier = v12;

  os_unfair_lock_unlock(&self->_lock);
}

void __79__DBIconBadgeController__badge_queue_updateNotificationSourcesWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 sourceSettings];
  id v9 = [v4 notificationSettings];

  BOOL v5 = [v9 badgeSetting] == 2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [NSNumber numberWithBool:v5];
  uint64_t v8 = [v3 sourceIdentifier];

  [v6 setObject:v7 forKey:v8];
}

- (void)_badge_queue_removeBadgeSettingsForIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = (void *)[(NSDictionary *)self->_lock_badgesAllowedByIdentifier mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "removeObjectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v10++), (void)v13);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  uint64_t v11 = (NSDictionary *)[v5 copy];
  lock_badgesAllowedByIdentifier = self->_lock_badgesAllowedByIdentifier;
  self->_lock_badgesAllowedByIdentifier = v11;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)applicationController:(id)a3 addedApplications:(id)a4 updatedApplications:(id)a5 removedApplications:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(DBIconBadgeController *)self badgeSettingsUpdateQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __105__DBIconBadgeController_applicationController_addedApplications_updatedApplications_removedApplications___block_invoke;
  v16[3] = &unk_2649B4848;
  id v17 = v11;
  uint64_t v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, v16);
}

void __105__DBIconBadgeController_applicationController_addedApplications_updatedApplications_removedApplications___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "bs_map:", &__block_literal_global_78);
  objc_msgSend(*(id *)(a1 + 40), "_badge_queue_removeBadgeSettingsForIdentifiers:", v2);
  id v3 = [*(id *)(a1 + 48) setByAddingObjectsFromSet:*(void *)(a1 + 56)];
  id v4 = objc_msgSend(v3, "bs_map:", &__block_literal_global_80);

  BOOL v5 = DBLogForCategory(0xEuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Updating user notification settings for %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_badge_queue_updateNotificationSourcesWithIdentifiers:", v4);
  id v6 = [*(id *)(a1 + 40) observers];
  [v6 iconBadgeController:*(void *)(a1 + 40) didUpdateForIdentifiers:v4];
}

uint64_t __105__DBIconBadgeController_applicationController_addedApplications_updatedApplications_removedApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

uint64_t __105__DBIconBadgeController_applicationController_addedApplications_updatedApplications_removedApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = [(DBIconBadgeController *)self badgeSettingsUpdateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__DBIconBadgeController_userNotificationSettingsCenter_didUpdateNotificationSourceIdentifiers___block_invoke;
  v8[3] = &unk_2649B3D30;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __95__DBIconBadgeController_userNotificationSettingsCenter_didUpdateNotificationSourceIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = +[DBApplicationController sharedInstance];
  id v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__DBIconBadgeController_userNotificationSettingsCenter_didUpdateNotificationSourceIdentifiers___block_invoke_2;
  v8[3] = &unk_2649B62C0;
  id v4 = v2;
  id v9 = v4;
  id v5 = objc_msgSend(v3, "bs_filter:", v8);
  if ([v5 count])
  {
    id v6 = DBLogForCategory(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "User Notification settings updated for: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_badge_queue_updateNotificationSourcesWithIdentifiers:", v5);
    id v7 = [*(id *)(a1 + 40) observers];
    [v7 iconBadgeController:*(void *)(a1 + 40) didUpdateForIdentifiers:v5];
  }
}

BOOL __95__DBIconBadgeController_userNotificationSettingsCenter_didUpdateNotificationSourceIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) applicationWithBundleIdentifier:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSDictionary)lock_badgesAllowedByIdentifier
{
  return self->_lock_badgesAllowedByIdentifier;
}

- (void)setLock_badgesAllowedByIdentifier:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)badgeSettingsUpdateQueue
{
  return self->_badgeSettingsUpdateQueue;
}

- (void)setBadgeSettingsUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeSettingsUpdateQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lock_badgesAllowedByIdentifier, 0);
}

@end