@interface HFUserNotificationCenter
+ (id)sharedInstance;
- (HFUserNotificationCenter)init;
- (HFUserNotificationPresentationHandling)presentationHandler;
- (NAFuture)notificationSettingsFuture;
- (NSHashTable)observers;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)notificationSettings;
- (void)_applicationDidEnterBackground;
- (void)_applicationWillEnterForeground;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setNotificationSettingsFuture:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPresentationHandler:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation HFUserNotificationCenter

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFUserNotificationCenter *)self observers];
  [v5 removeObject:v4];
}

+ (id)sharedInstance
{
  if (_MergedGlobals_261 != -1) {
    dispatch_once(&_MergedGlobals_261, &__block_literal_global_4_6);
  }
  v2 = (void *)qword_26AB2F188;
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFUserNotificationCenter *)self observers];
  [v5 addObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setPresentationHandler:(id)a3
{
}

uint64_t __42__HFUserNotificationCenter_sharedInstance__block_invoke_2()
{
  v0 = objc_alloc_init(HFUserNotificationCenter);
  uint64_t v1 = qword_26AB2F188;
  qword_26AB2F188 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFUserNotificationCenter)init
{
  v13.receiver = self;
  v13.super_class = (Class)HFUserNotificationCenter;
  v2 = [(HFUserNotificationCenter *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(HFUserNotificationCenter *)v2 setObservers:v3];

    id v4 = +[HFExecutionEnvironment sharedInstance];
    uint64_t v5 = [v4 hostProcess];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x263F1DFB0]);
      v7 = HFHomeAppBundleID();
      v8 = (void *)[v6 initWithBundleIdentifier:v7];
      [(HFUserNotificationCenter *)v2 setUserNotificationCenter:v8];
    }
    else
    {
      v7 = [MEMORY[0x263F1DFB0] currentNotificationCenter];
      [(HFUserNotificationCenter *)v2 setUserNotificationCenter:v7];
    }

    v9 = [(HFUserNotificationCenter *)v2 userNotificationCenter];
    [v9 setDelegate:v2];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel__applicationDidEnterBackground name:*MEMORY[0x263F1D050] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel__applicationWillEnterForeground name:*MEMORY[0x263F1D0D0] object:0];
  }
  return v2;
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)_applicationDidEnterBackground
{
}

- (void)_applicationWillEnterForeground
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(HFUserNotificationCenter *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 settingsInvalidatedForNotificationCenter:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (id)notificationSettings
{
  v3 = [(HFUserNotificationCenter *)self notificationSettingsFuture];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F58190]);
    [(HFUserNotificationCenter *)self setNotificationSettingsFuture:v4];

    uint64_t v5 = [(HFUserNotificationCenter *)self userNotificationCenter];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__HFUserNotificationCenter_notificationSettings__block_invoke;
    v8[3] = &unk_2640955C0;
    v8[4] = self;
    [v5 getNotificationSettingsWithCompletionHandler:v8];
  }
  uint64_t v6 = [(HFUserNotificationCenter *)self notificationSettingsFuture];
  return v6;
}

void __48__HFUserNotificationCenter_notificationSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) notificationSettingsFuture];
    [v4 finishWithResult:v3];
  }
  else
  {
    uint64_t v5 = HFLogForCategory(0x31uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch user notification settings. Perhaps this process is missing the necessary entitlement (in which case it probably shouldn't be using this API).", v7, 2u);
    }

    id v4 = [*(id *)(a1 + 32) notificationSettingsFuture];
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
    [v4 finishWithError:v6];
  }
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HFUserNotificationCenter_userNotificationCenter_openSettingsForNotification___block_invoke;
  v8[3] = &unk_26408D450;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  [v6 performBlock:v8];
}

void __79__HFUserNotificationCenter_userNotificationCenter_openSettingsForNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) request];
  id v3 = [v2 content];
  id v4 = [v3 defaultActionURL];

  id v5 = HFLogForCategory(0x31uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    long long v11 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Received request to open settings for notification: %@ (object URL: %@)", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [*(id *)(a1 + 40) presentationHandler];
  [v7 notificationCenter:*(void *)(a1 + 40) presentCustomSettingsForNotificationWithObjectURL:v4];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__HFUserNotificationCenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v13[3] = &unk_264095610;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  SEL v17 = a2;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

void __104__HFUserNotificationCenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  v40[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) notification];
  id v3 = [v2 request];
  id v4 = [v3 content];
  id v5 = [v4 userInfo];

  uint64_t v6 = HFLogForCategory(0x31uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) notification];
    *(_DWORD *)buf = 138412546;
    v35 = v7;
    __int16 v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse for notification: %@, userInfo:%@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) notification];
  id v9 = [v8 request];
  __int16 v10 = [v9 content];
  id v11 = [v10 categoryIdentifier];

  if ([v11 isEqualToString:@"HomeAppBulletinAudioNotificationCategory"])
  {
    id v12 = +[HFURLComponents dropInURLComponents];
    id v13 = objc_alloc(MEMORY[0x263F08BD0]);
    id v14 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0BAC8]];
    v15 = (void *)[v13 initWithName:@"homeId" value:v14];

    id v16 = objc_alloc(MEMORY[0x263F08BD0]);
    SEL v17 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0BAB8]];
    v18 = (void *)[v16 initWithName:@"accessoryId" value:v17];

    v40[0] = v15;
    v40[1] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    [v12 setQueryItems:v19];

    uint64_t v20 = [v12 URL];
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0DCC0]];
  uint64_t v22 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0BA98]];
  v23 = (void *)v22;
  if (v21 | v20)
  {
    if (v22)
    {
      v24 = [NSString stringWithFormat:@"&%@=%@", @"cameraClip", v22];
      uint64_t v25 = [(id)v21 stringByAppendingString:v24];

      uint64_t v21 = v25;
    }
    if (!v20)
    {
      uint64_t v20 = [NSURL URLWithString:v21];
    }
    v26 = HFLogForCategory(0x31uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(void **)(a1 + 40);
      v28 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      v35 = v27;
      __int16 v36 = 2112;
      v37 = v28;
      __int16 v38 = 2112;
      uint64_t v39 = v20;
      _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ Notification URL %@", buf, 0x20u);
    }
    v29 = [*(id *)(a1 + 40) presentationHandler];
    v30 = [v29 notificationCenter:*(void *)(a1 + 40) presentNotificationWithObjectURL:v20];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __104__HFUserNotificationCenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_30;
    v32[3] = &unk_2640955E8;
    id v33 = *(id *)(a1 + 48);
    id v31 = (id)[v30 addCompletionBlock:v32];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __104__HFUserNotificationCenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HFUserNotificationPresentationHandling)presentationHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationHandler);
  return (HFUserNotificationPresentationHandling *)WeakRetained;
}

- (NAFuture)notificationSettingsFuture
{
  return self->_notificationSettingsFuture;
}

- (void)setNotificationSettingsFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationSettingsFuture, 0);
  objc_destroyWeak((id *)&self->_presentationHandler);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end