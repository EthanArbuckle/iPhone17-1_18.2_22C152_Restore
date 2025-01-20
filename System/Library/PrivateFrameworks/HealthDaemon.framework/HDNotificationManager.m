@interface HDNotificationManager
+ (id)createNotificationContentWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5;
- (BOOL)_resourceQueue_setBadge:(uint64_t)a3 domain:(void *)a4 error:;
- (BOOL)areHealthCriticalAlertsAuthorized;
- (BOOL)areHealthNotificationsAuthorized;
- (BOOL)incrementBadgeForDomain:(int64_t)a3 count:(int64_t)a4 error:(id *)a5;
- (HDNotificationManager)initWithProfile:(id)a3 bundle:(int64_t)a4;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)_actionCompletionOnClientQueue:(void *)a1;
- (id)_aggregateBadge;
- (id)_badgeForDomain:(int64_t)a3 error:(id *)a4;
- (id)_resourceQueue_badgeForDomain:(dispatch_queue_t *)a1;
- (id)_resourceQueue_badgeForDomain:(int64_t)a3 error:(id *)a4;
- (id)_resourceQueue_coaleseDomainBadges;
- (id)diagnosticDescription;
- (id)identifierForBundle:(id)a1;
- (void)_postNotificationWithTitle:(void *)a3 body:(void *)a4 categoryIdentifier:(void *)a5 subtitle:(uint64_t)a6 domain:(void *)a7 url:(void *)a8 accessoryImageName:(void *)a9 header:(void *)a10 completion:;
- (void)_sendCompanionUserNotificationResponse:(void *)a3 error:;
- (void)addNotificationObserver:(id)a3;
- (void)badgeForDomain:(int64_t)a3 completion:(id)a4;
- (void)dealloc;
- (void)getDeliveredNotificationsWithCompletionHandler:(id)a3;
- (void)postCompanionUserNotificationOfType:(int64_t)a3 completion:(id)a4;
- (void)postNotificationWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 completion:(id)a6;
- (void)postNotificationWithRequest:(id)a3 completion:(id)a4;
- (void)postNotificationWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5 subtitle:(id)a6 domain:(int64_t)a7 accessoryImageName:(id)a8 header:(id)a9 completion:(id)a10;
- (void)postNotificationWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5 subtitle:(id)a6 domain:(int64_t)a7 url:(id)a8 accessoryImageName:(id)a9 header:(id)a10 completion:(id)a11;
- (void)receivedCompanionUserNotificationRequest:(id)a3 completion:(id)a4;
- (void)removeDeliveredNotificationsWithCategoryIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3;
- (void)removeNotificationObserver:(id)a3;
- (void)removePendingNotificationsWithIdentifiers:(id)a3;
- (void)setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5;
- (void)unitTest_deliveredNotificationsOverride:(id)a3;
@end

@implementation HDNotificationManager

- (HDNotificationManager)initWithProfile:(id)a3 bundle:(int64_t)a4
{
  id v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDNotificationManager;
  v8 = [(HDNotificationManager *)&v26 init];
  if (v8)
  {
    if (!v7)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v8, @"HDNotificationManager.m", 59, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];
    }
    objc_storeWeak((id *)&v8->_profile, v7);
    v8->_bundle = a4;
    id v9 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = [v9 initWithName:v11 loggingCategory:*MEMORY[0x1E4F29F80]];
    observers = v8->_observers;
    v8->_observers = (HKObserverSet *)v12;

    uint64_t v14 = HKCreateSerialDispatchQueue();
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = HKCreateSerialDispatchQueue();
    resourceQueue = v8->_resourceQueue;
    v8->_resourceQueue = (OS_dispatch_queue *)v16;

    id v18 = objc_alloc(MEMORY[0x1E4F44680]);
    v19 = -[HDNotificationManager identifierForBundle:](v8, a4);
    uint64_t v20 = [v18 initWithBundleIdentifier:v19];
    userNotificationCenter = v8->_userNotificationCenter;
    v8->_userNotificationCenter = (UNUserNotificationCenter *)v20;

    if (v8->_bundle == 1)
    {
      v22 = v8->_userNotificationCenter;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__HDNotificationManager__registerWithUserNotificationCenterIfRequired__block_invoke;
      v27[3] = &unk_1E62F2978;
      v27[4] = v8;
      [(UNUserNotificationCenter *)v22 requestAuthorizationWithOptions:39 completionHandler:v27];
    }
    v23 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v23 addObject:v8];
  }
  return v8;
}

- (id)identifierForBundle:(id)a1
{
  if (a1)
  {
    if (a2)
    {
      if (a2 != 1) {
        goto LABEL_7;
      }
      v3 = (id *)MEMORY[0x1E4F2BF90];
    }
    else
    {
      v3 = (id *)MEMORY[0x1E4F2BDC0];
    }
    a1 = *v3;
  }
LABEL_7:
  return a1;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)HDNotificationManager;
  [(HDNotificationManager *)&v4 dealloc];
}

void __70__HDNotificationManager__registerWithUserNotificationCenterIfRequired__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = v7[2];
    id v9 = v6;
    v10 = -[HDNotificationManager identifierForBundle:](v7, v8);
    v11 = @"not granted";
    int v12 = 138412802;
    v13 = v10;
    __int16 v14 = 2112;
    if (a2) {
      v11 = @"granted";
    }
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[%@] UNUserNotificationCenter request %@ error: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (BOOL)areHealthNotificationsAuthorized
{
  uint64_t v2 = [(UNUserNotificationCenter *)self->_userNotificationCenter notificationSettings];
  uint64_t v3 = [v2 authorizationStatus];

  return v3 == 4 || (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)areHealthCriticalAlertsAuthorized
{
  uint64_t v2 = [(UNUserNotificationCenter *)self->_userNotificationCenter notificationSettings];
  uint64_t v3 = [v2 criticalAlertSetting];

  return v3 == 2;
}

- (void)badgeForDomain:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HDNotificationManager_badgeForDomain_completion___block_invoke;
  block[3] = &unk_1E62FFD00;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(resourceQueue, block);
}

void __51__HDNotificationManager_badgeForDomain_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void (***)(void, void, void))(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_super v4 = v3;
  if (v2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__HDNotificationManager__objectCompletionOnClientQueue___block_invoke;
    v10[3] = &unk_1E63032A0;
    v10[4] = v2;
    id v11 = v3;
    uint64_t v2 = (void (**)(void, void, void))[v10 copy];
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = 0;
  id v7 = objc_msgSend(v5, "_resourceQueue_badgeForDomain:error:", v6, &v9);
  id v8 = v9;
  ((void (**)(void, void *, id))v2)[2](v2, v7, v8);
}

- (BOOL)incrementBadgeForDomain:(int64_t)a3 count:(int64_t)a4 error:(id *)a5
{
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__115;
  v9[4] = __Block_byref_object_dispose__115;
  id v10 = 0;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HDNotificationManager_incrementBadgeForDomain_count_error___block_invoke;
  block[3] = &unk_1E6303188;
  block[4] = self;
  void block[5] = v9;
  block[7] = a3;
  block[8] = a4;
  block[6] = &v11;
  dispatch_sync(resourceQueue, block);
  char v6 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __61__HDNotificationManager_incrementBadgeForDomain_count_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[7];
  id v3 = (void *)a1[4];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = objc_msgSend(v3, "_resourceQueue_badgeForDomain:error:", v2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    char v6 = [v5 badgeByIncrementingByCount:a1[8]];

    uint64_t v7 = *(void *)(a1[5] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    uint64_t v9 = a1[7];
    uint64_t v10 = a1[4];
    uint64_t v11 = *(void *)(a1[5] + 8);
    id v13 = *(id *)(v11 + 40);
    BOOL v12 = -[HDNotificationManager _resourceQueue_setBadge:domain:error:](v10, v6, v9, &v13);
    objc_storeStrong((id *)(v11 + 40), v13);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v12;
  }
}

- (BOOL)_resourceQueue_setBadge:(uint64_t)a3 domain:(void *)a4 error:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    id v8 = (os_log_t *)MEMORY[0x1E4F29F80];
    uint64_t v9 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v9;
      uint64_t v11 = [v7 description];
      BOOL v12 = NSStringFromHKNotificationDomain();
      *(_DWORD *)buf = 138412546;
      id v39 = v11;
      __int16 v40 = 2112;
      v41 = v12;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "Setting badge to %@ for domain %@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v37 = 0;
    BOOL v14 = +[HDUnprotectedKeyValueEntity setBadge:v7 forDomain:a3 profile:WeakRetained error:&v37];
    id v15 = v37;

    _HKInitializeLogging();
    os_log_t v16 = *v8;
    id v17 = *v8;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = v16;
        v19 = [v7 description];
        uint64_t v20 = NSStringFromHKNotificationDomain();
        *(_DWORD *)buf = 138543618;
        id v39 = v19;
        __int16 v40 = 2114;
        v41 = v20;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "Setting badge to %{public}@ for domain %{public}@", buf, 0x16u);
      }
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
      v21 = -[HDNotificationManager _resourceQueue_coaleseDomainBadges]((dispatch_queue_t *)a1);
      _HKInitializeLogging();
      os_log_t v22 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v24 = [v21 description];
        *(_DWORD *)buf = 138543362;
        id v39 = v24;
        _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "Setting application badge to %{public}@", buf, 0xCu);
      }
      id v25 = objc_alloc(MEMORY[0x1E4FB3398]);
      objc_super v26 = (void *)[v25 initWithBundleIdentifier:*MEMORY[0x1E4F2BDC0]];
      v27 = [v21 value];
      [v26 setBadgeValue:v27];

      v28 = *(void **)(a1 + 24);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __62__HDNotificationManager__resourceQueue_setBadge_domain_error___block_invoke;
      v34[3] = &unk_1E6303278;
      v34[4] = a1;
      id v35 = v7;
      uint64_t v36 = a3;
      [v28 notifyObservers:v34];
      if (notify_post((const char *)*MEMORY[0x1E4F2BDB8]))
      {
        _HKInitializeLogging();
        v29 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "Failed to post BadgesDidUpdateNotification", buf, 2u);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v32 = v16;
        v33 = NSStringFromHKNotificationDomain();
        *(_DWORD *)buf = 138543874;
        id v39 = v7;
        __int16 v40 = 2114;
        v41 = v33;
        __int16 v42 = 2114;
        id v43 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "Error setting badge to %{public}@ for domain %{public}@: %{public}@", buf, 0x20u);
      }
      id v30 = v15;
      if (v30)
      {
        if (a4) {
          *a4 = v30;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  resourceQueue = self->_resourceQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__HDNotificationManager_setBadge_forDomain_completion___block_invoke;
  v13[3] = &unk_1E63031B0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(resourceQueue, v13);
}

void __55__HDNotificationManager_setBadge_forDomain_completion___block_invoke(uint64_t a1)
{
  -[HDNotificationManager _actionCompletionOnClientQueue:](*(void **)(a1 + 32), *(void **)(a1 + 48));
  uint64_t v2 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = 0;
  BOOL v6 = -[HDNotificationManager _resourceQueue_setBadge:domain:error:](v3, v4, v5, &v8);
  id v7 = v8;
  ((void (**)(void, BOOL, id))v2)[2](v2, v6, v7);
}

- (id)_actionCompletionOnClientQueue:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__HDNotificationManager__actionCompletionOnClientQueue___block_invoke;
    v6[3] = &unk_1E62F70B0;
    v6[4] = a1;
    id v7 = v3;
    a1 = (void *)[v6 copy];
  }

  return a1;
}

- (void)unitTest_deliveredNotificationsOverride:(id)a3
{
}

+ (id)createNotificationContentWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  id v11 = v10;
  if (v7) {
    [v10 setTitle:v7];
  }
  if (v8) {
    [v11 setBody:v8];
  }
  if (v9) {
    [v11 setCategoryIdentifier:v9];
  }
  id v12 = [MEMORY[0x1E4F44640] soundWithAlertType:25];
  [v11 setSound:v12];

  return v11;
}

- (void)getDeliveredNotificationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (_HDIsUnitTesting)
  {
    resourceQueue = self->_resourceQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__HDNotificationManager_getDeliveredNotificationsWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E62F3CA8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(resourceQueue, v7);
  }
  else
  {
    [(UNUserNotificationCenter *)self->_userNotificationCenter getDeliveredNotificationsWithCompletionHandler:v4];
  }
}

uint64_t __72__HDNotificationManager_getDeliveredNotificationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 56));
}

- (void)postNotificationWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 completion:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F44628];
  id v11 = a6;
  id v12 = [v10 requestWithIdentifier:a3 content:a4 trigger:a5];
  [(HDNotificationManager *)self postNotificationWithRequest:v12 completion:v11];
}

- (void)postNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(resourceQueue, block);
}

void __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 identifier];
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "Posting notification: %{public}@", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v6;

  id v9 = -[HDNotificationManager _actionCompletionOnClientQueue:](*(void **)(a1 + 40), *(void **)(a1 + 48));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke_309;
  aBlock[3] = &unk_1E6303200;
  id v10 = v9;
  id v17 = v10;
  int8x16_t v14 = *(int8x16_t *)(a1 + 32);
  id v11 = (id)v14.i64[0];
  int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
  id v12 = _Block_copy(aBlock);
  id v13 = v12;
  if (_HDIsUnitTesting) {
    (*((void (**)(void *, void))v12 + 2))(v12, 0);
  }
  else {
    [*(id *)(*(void *)(a1 + 40) + 64) addNotificationRequest:*(void *)(a1 + 32) withCompletionHandler:v12];
  }
}

void __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke_309(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2 == 0, a2);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke_2;
  v5[3] = &unk_1E63031D8;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  [v4 notifyObservers:v5];
}

uint64_t __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notificationManager:*(void *)(a1 + 32) didPostNotification:*(void *)(a1 + 40)];
}

- (void)postNotificationWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5 subtitle:(id)a6 domain:(int64_t)a7 accessoryImageName:(id)a8 header:(id)a9 completion:(id)a10
{
}

- (void)_postNotificationWithTitle:(void *)a3 body:(void *)a4 categoryIdentifier:(void *)a5 subtitle:(uint64_t)a6 domain:(void *)a7 url:(void *)a8 accessoryImageName:(void *)a9 header:(void *)a10 completion:
{
  id v30 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (a1)
  {
    id v20 = a10;
    id v21 = a4;
    id v22 = a3;
    id v23 = a2;
    v24 = [(id)objc_opt_class() createNotificationContentWithTitle:v23 body:v22 categoryIdentifier:v21];

    if (v30) {
      [v24 setSubtitle:v30];
    }
    [v24 setAccessoryImageName:v18];
    if (v19) {
      [v24 setHeader:v19];
    }
    id v25 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_super v26 = [NSNumber numberWithInteger:a6];
    [v25 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F2BEF0]];

    if (v17)
    {
      v27 = [v17 absoluteString];
      [v25 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F2BF00]];
    }
    [v24 setUserInfo:v25];
    v28 = [MEMORY[0x1E4F29128] UUID];
    v29 = [v28 UUIDString];
    [a1 postNotificationWithIdentifier:v29 content:v24 trigger:0 completion:v20];
  }
}

- (void)postNotificationWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5 subtitle:(id)a6 domain:(int64_t)a7 url:(id)a8 accessoryImageName:(id)a9 header:(id)a10 completion:(id)a11
{
}

- (void)postCompanionUserNotificationOfType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke;
  block[3] = &unk_1E62FFD00;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(resourceQueue, block);
}

void __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(HDCodableCompanionUserNotificationConfiguration);
  [(HDCodableCompanionUserNotificationConfiguration *)v2 setNotificationType:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = objc_alloc_init(HDCodableCompanionUserNotificationRequest);
  id v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  [(HDCodableCompanionUserNotificationRequest *)v3 setRequestIdentifier:v5];

  [(HDCodableCompanionUserNotificationRequest *)v3 setNotificationConfiguration:v2];
  id v6 = *(id *)(*(void *)(a1 + 32) + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v8 = [WeakRetained nanoSyncManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke_2;
  v10[3] = &unk_1E62F70B0;
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v9 = v6;
  [v8 sendCompanionUserNotificationRequest:v3 completion:v10];
}

void __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke_3;
  block[3] = &unk_1E62F61F8;
  char v11 = a2;
  id v9 = v5;
  id v6 = *(NSObject **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Error posting notification: %@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)receivedCompanionUserNotificationRequest:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 notificationConfiguration];
  int v8 = [v7 notificationType];

  if (v8 == 1)
  {
    id v9 = HKHealthKitFrameworkBundle();
    id v10 = [v9 localizedStringForKey:@"NEW_ELECTROCARDIOGRAM_NOTIFICATION_TITLE" value:&stru_1F1728D60 table:@"Localizable-Cinnamon"];
    char v11 = HKConditionallyRedactedHeartRhythmString();
    id v12 = HKHealthKitFrameworkBundle();
    id v13 = [v12 localizedStringForKey:@"NEW_ELECTROCARDIOGRAM_NOTIFICATION_BODY" value:&stru_1F1728D60 table:@"Localizable-Cinnamon"];
    int8x16_t v14 = HKConditionallyRedactedHeartRhythmString();
    id v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "_hk_urlForElectrocardiogramType");
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__HDNotificationManager_receivedCompanionUserNotificationRequest_completion___block_invoke;
    v18[3] = &unk_1E62F70B0;
    v18[4] = self;
    id v19 = v6;
    -[HDNotificationManager _postNotificationWithTitle:body:categoryIdentifier:subtitle:domain:url:accessoryImageName:header:completion:](self, v11, v14, @"com.apple.private.health.heartrhythm.phoneonly", 0, 4, v15, 0, 0, v18);
  }
  else
  {
    _HKInitializeLogging();
    int8x16_t v16 = *MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Received unsupported user notification message of type %ld.", buf, 0xCu);
    }
    id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unsupported companion notification type.");
    -[HDNotificationManager _sendCompanionUserNotificationResponse:error:]((uint64_t)self, v6, v17);
  }
}

void __77__HDNotificationManager_receivedCompanionUserNotificationRequest_completion___block_invoke(uint64_t a1)
{
}

- (void)_sendCompanionUserNotificationResponse:(void *)a3 error:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    int v8 = *(NSObject **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__HDNotificationManager__sendCompanionUserNotificationResponse_error___block_invoke;
    v9[3] = &unk_1E62F4928;
    id v10 = v6;
    id v11 = v5;
    dispatch_async(v8, v9);
  }
}

void __70__HDNotificationManager__sendCompanionUserNotificationResponse_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(HDCodableCompanionUserNotificationResponse);
  id v4 = v2;
  if (*(void *)(a1 + 32))
  {
    [(HDCodableCompanionUserNotificationResponse *)v2 setSuccess:0];
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "hk_codableError");
    [(HDCodableCompanionUserNotificationResponse *)v4 setError:v3];
  }
  else
  {
    [(HDCodableCompanionUserNotificationResponse *)v2 setSuccess:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removePendingNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  [(UNUserNotificationCenter *)self->_userNotificationCenter removePendingNotificationRequestsWithIdentifiers:v4];
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HDNotificationManager_removePendingNotificationsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E63031D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

void __67__HDNotificationManager_removePendingNotificationsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 notificationManager:*(void *)(a1 + 32) didRemovePendingNotificationsWithIdentifiers:*(void *)(a1 + 40)];
  }
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  [(UNUserNotificationCenter *)self->_userNotificationCenter removeDeliveredNotificationsWithIdentifiers:v4];
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HDNotificationManager_removeDeliveredNotificationsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E63031D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

void __69__HDNotificationManager_removeDeliveredNotificationsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 notificationManager:*(void *)(a1 + 32) didRemoveDeliveredNotificationsWithIdentifiers:*(void *)(a1 + 40)];
  }
}

- (void)removeDeliveredNotificationsWithCategoryIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  userNotificationCenter = self->_userNotificationCenter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__HDNotificationManager_removeDeliveredNotificationsWithCategoryIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E6303228;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(UNUserNotificationCenter *)userNotificationCenter getDeliveredNotificationsWithCompletionHandler:v11];
}

void __94__HDNotificationManager_removeDeliveredNotificationsWithCategoryIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = [v9 request];
        id v11 = [v10 content];
        id v12 = [v11 categoryIdentifier];
        int v13 = [v12 isEqualToString:*(void *)(a1 + 32)];

        if (v13)
        {
          id v14 = [v9 request];
          id v15 = [v14 identifier];
          [v18 addObject:v15];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 40) removeDeliveredNotificationsWithIdentifiers:v18];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = *(void **)(v16 + 24);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__HDNotificationManager_removeDeliveredNotificationsWithCategoryIdentifier_completionHandler___block_invoke_2;
  v19[3] = &unk_1E63031D8;
  v19[4] = v16;
  id v20 = *(id *)(a1 + 32);
  [v17 notifyObservers:v19];
}

void __94__HDNotificationManager_removeDeliveredNotificationsWithCategoryIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 notificationManager:*(void *)(a1 + 32) didRemoveDeliveredNotificationsWithCategoryIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)addNotificationObserver:(id)a3
{
  if (self) {
    [(HKObserverSet *)self->_observers registerObserver:a3 queue:0];
  }
}

- (void)removeNotificationObserver:(id)a3
{
}

- (id)_badgeForDomain:(int64_t)a3 error:(id *)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resourceQueue);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__115;
  long long v23 = __Block_byref_object_dispose__115;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__115;
  id v17 = __Block_byref_object_dispose__115;
  id v18 = 0;
  resourceQueue = self->_resourceQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__HDNotificationManager__badgeForDomain_error___block_invoke;
  v12[3] = &unk_1E6303250;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  dispatch_sync(resourceQueue, v12);
  id v8 = (id)v20[5];
  id v9 = v8;
  if (v8)
  {
    if (a4) {
      *a4 = v8;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __47__HDNotificationManager__badgeForDomain_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[7];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = objc_msgSend(v2, "_resourceQueue_badgeForDomain:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_aggregateBadge
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resourceQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__115;
  id v11 = __Block_byref_object_dispose__115;
  id v12 = 0;
  resourceQueue = self->_resourceQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__HDNotificationManager__aggregateBadge__block_invoke;
  v6[3] = &unk_1E62F3230;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(resourceQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__HDNotificationManager__aggregateBadge__block_invoke(uint64_t a1)
{
  uint64_t v2 = -[HDNotificationManager _resourceQueue_coaleseDomainBadges](*(dispatch_queue_t **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_resourceQueue_coaleseDomainBadges
{
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    uint64_t v2 = [MEMORY[0x1E4F2AC70] zeroBadge];
    for (uint64_t i = 0; i != 17; ++i)
    {
      if ((HKNotificationDomainIsDeprecated() & 1) == 0)
      {
        id v4 = -[HDNotificationManager _resourceQueue_badgeForDomain:](a1, i);
        if (v4)
        {
          uint64_t v5 = [v2 badgeByAggregatingWithBadge:v4];

          uint64_t v2 = (void *)v5;
        }
      }
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)_resourceQueue_badgeForDomain:(dispatch_queue_t *)a1
{
  id v2 = a1;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    id v9 = 0;
    objc_msgSend(v2, "_resourceQueue_badgeForDomain:error:", a2, &v9);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = v9;
    if (v4)
    {
      _HKInitializeLogging();
      uint64_t v5 = (void *)*MEMORY[0x1E4F29F80];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = v5;
        id v8 = NSStringFromHKNotificationDomain();
        *(_DWORD *)buf = 138543618;
        id v11 = v8;
        __int16 v12 = 2114;
        id v13 = v4;
        _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Error getting badge for domain %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }

  return v2;
}

- (id)_resourceQueue_badgeForDomain:(int64_t)a3 error:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = +[HDUnprotectedKeyValueEntity badgeForDomain:a3 profile:WeakRetained error:a4];

  return v8;
}

uint64_t __62__HDNotificationManager__resourceQueue_setBadge_domain_error___block_invoke(void *a1, void *a2)
{
  return [a2 notificationManager:a1[4] didUpdateBadge:a1[5] domain:a1[6]];
}

void __56__HDNotificationManager__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HDNotificationManager__actionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E62F61A8;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __56__HDNotificationManager__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void __56__HDNotificationManager__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HDNotificationManager__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E62F61D0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __56__HDNotificationManager__objectCompletionOnClientQueue___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (id)diagnosticDescription
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resourceQueue);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__115;
  id v17 = __Block_byref_object_dispose__115;
  id v18 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HDNotificationManager_diagnosticDescription__block_invoke;
  block[3] = &unk_1E62FEE30;
  id v12 = &v13;
  void block[4] = self;
  id v5 = v3;
  id v11 = v5;
  dispatch_sync(resourceQueue, block);
  id v6 = [v5 componentsJoinedByString:@"\n"];
  if ([v6 length])
  {
    id v7 = [NSString stringWithFormat:@"\n%@", v6];
  }
  else
  {
    id v7 = @"none";
  }

  id v8 = [NSString stringWithFormat:@"\n\tLast notification since boot: %@\n\tBadge counts: %@", v14[5], v7];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__HDNotificationManager_diagnosticDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = HKDiagnosticStringFromDate();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  for (uint64_t i = 0; i != 17; ++i)
  {
    id v6 = NSStringFromHKNotificationDomain();
    id v7 = @"deprecated";
    if ((HKNotificationDomainIsDeprecated() & 1) == 0)
    {
      id v8 = -[HDNotificationManager _resourceQueue_badgeForDomain:](*(dispatch_queue_t **)(a1 + 32), i);
      uint64_t v9 = [v8 description];
      id v10 = (void *)v9;
      if (v9) {
        id v11 = (__CFString *)v9;
      }
      else {
        id v11 = @"none";
      }
      id v7 = v11;
    }
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = [NSString stringWithFormat:@"\t\t%@: %@", v6, v7];
    [v12 addObject:v13];
  }
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_unitTest_deliveredNotifications, 0);
  objc_storeStrong((id *)&self->_lastNotificationDate, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end