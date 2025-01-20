@interface CHTrendsNotificationManager
- (CHTrendsNotificationManager)initWithProfile:(id)a3;
- (HDKeyValueDomain)keyValueDomain;
- (HDProfile)profile;
- (UNUserNotificationCenter)userNotificationCenter;
- (int64_t)notificationDelayNumberOfMinutes;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)notificationDidSendSuccessfully;
- (void)profileDidBecomeReady:(id)a3;
- (void)protectedDataBecameAvailable;
- (void)sendNotificationIfAllowed;
- (void)sendNotificationWithCompletion:(id)a3;
- (void)setKeyValueDomain:(id)a3;
- (void)setProfile:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
@end

@implementation CHTrendsNotificationManager

- (CHTrendsNotificationManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CHTrendsNotificationManager;
  v5 = [(CHTrendsNotificationManager *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x263F43218]);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v9 = [v7 initWithCategory:1 domainName:@"TrendsNotificationManager" profile:WeakRetained];
    keyValueDomain = v6->_keyValueDomain;
    v6->_keyValueDomain = (HDKeyValueDomain *)v9;

    id v11 = objc_loadWeakRetained((id *)&v6->_profile);
    v12 = [v11 database];
    [v12 addProtectedDataObserver:v6];

    id v13 = objc_loadWeakRetained((id *)&v6->_profile);
    [v13 registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4) {
    [(CHTrendsNotificationManager *)self protectedDataBecameAvailable];
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = [(CHTrendsNotificationManager *)self profile];
  v5 = [v4 database];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CHTrendsNotificationManager_profileDidBecomeReady___block_invoke;
  v6[3] = &unk_26471FE40;
  v6[4] = self;
  [v5 performWhenDataProtectedByFirstUnlockIsAvailable:v6];
}

void __53__CHTrendsNotificationManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained database];
  int v4 = [v3 isProtectedDataAvailable];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    [v5 protectedDataBecameAvailable];
  }
}

- (void)protectedDataBecameAvailable
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (CHIsFitnessInstalled())
  {
    keyValueDomain = self->_keyValueDomain;
    id v9 = 0;
    int v4 = [(HDKeyValueDomain *)keyValueDomain numberForKey:@"TrendsNotificationManagerDidSendNotification" error:&v9];
    id v5 = v9;
    if (v5)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x263F098C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v11 = v5;
        _os_log_impl(&dword_225615000, v6, OS_LOG_TYPE_DEFAULT, "Failed to retrieve key-value BOOLean for trends notification key: %{public}@", buf, 0xCu);
      }
    }
    if (v4 && ([v4 BOOLValue] & 1) != 0)
    {
      id v7 = [(CHTrendsNotificationManager *)self profile];
      v8 = [v7 database];
      [v8 removeProtectedDataObserver:self];
    }
    else
    {
      [(CHTrendsNotificationManager *)self sendNotificationIfAllowed];
    }
  }
}

- (void)sendNotificationIfAllowed
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225615000, a2, OS_LOG_TYPE_ERROR, "Error fetching user birth date: %@", (uint8_t *)&v2, 0xCu);
}

void __56__CHTrendsNotificationManager_sendNotificationIfAllowed__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(a1[4] + 8) + 24) = [v3 activityMoveMode];
  if ([v3 _activitySummaryIndex] >= a1[7]) {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }
  uint64_t v4 = [v3 _activitySummaryIndex];

  if (v4 >= a1[8]) {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
}

void __56__CHTrendsNotificationManager_sendNotificationIfAllowed__block_invoke_299(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    _HKInitializeLogging();
    uint64_t v4 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_225615000, v4, OS_LOG_TYPE_DEFAULT, "Failed to send notification: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained notificationDidSendSuccessfully];
  }
}

- (void)notificationDidSendSuccessfully
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(CHTrendsNotificationManager *)self keyValueDomain];
  id v10 = 0;
  char v4 = [v3 setNumber:MEMORY[0x263EFFA88] forKey:@"TrendsNotificationManagerDidSendNotification" error:&v10];
  id v5 = v10;

  _HKInitializeLogging();
  int v6 = *MEMORY[0x263F098C8];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225615000, v6, OS_LOG_TYPE_DEFAULT, "Successfully sent trends notification.", buf, 2u);
    }
    uint64_t v8 = [(CHTrendsNotificationManager *)self profile];
    id v9 = [v8 database];
    [v9 removeProtectedDataObserver:self];
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_225615000, v6, OS_LOG_TYPE_DEFAULT, "Failed to set key-value BOOLean for trends notification key: %{public}@", buf, 0xCu);
  }
}

- (int64_t)notificationDelayNumberOfMinutes
{
  int v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"OverrideTrendsNumberOfMinutesToWaitForNotification"];

  if (v3 <= 0) {
    return 15;
  }
  else {
    return v3;
  }
}

- (void)sendNotificationWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v4 = (objc_class *)MEMORY[0x263F1DEF0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"TRENDS_NOTIFICATION_TITLE" value:&stru_26D88D460 table:@"Localizable"];
  [v6 setTitle:v8];

  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"TRENDS_NOTIFICATION_SUBTITLE" value:&stru_26D88D460 table:@"Localizable"];
  [v6 setSubtitle:v10];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"TRENDS_NOTIFICATION_BODY" value:&stru_26D88D460 table:@"Localizable"];
  [v6 setBody:v12];

  uint64_t v13 = [MEMORY[0x263EFF8F0] currentCalendar];
  int64_t v14 = [(CHTrendsNotificationManager *)self notificationDelayNumberOfMinutes];
  objc_super v15 = [MEMORY[0x263EFF910] date];
  v16 = [v13 dateByAddingUnit:64 value:v14 toDate:v15 options:0];

  v17 = [MEMORY[0x263EFF8F0] currentCalendar];
  v18 = [v17 components:96 fromDate:v16];

  v19 = [MEMORY[0x263F1DEB8] triggerWithDateMatchingComponents:v18 repeats:0];
  _HKInitializeLogging();
  v20 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    v24 = v19;
    _os_log_impl(&dword_225615000, v20, OS_LOG_TYPE_DEFAULT, "Posting notification with trigger %{public}@", (uint8_t *)&v23, 0xCu);
  }
  v21 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"ACTIVITY_TRENDS_READY" content:v6 trigger:v19];
  v22 = [(CHTrendsNotificationManager *)self userNotificationCenter];
  [v22 addNotificationRequest:v21 withCompletionHandler:v5];
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end