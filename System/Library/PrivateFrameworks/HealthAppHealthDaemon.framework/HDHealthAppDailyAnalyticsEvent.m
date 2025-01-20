@interface HDHealthAppDailyAnalyticsEvent
- (BOOL)_areHealthAppNotificationsAuthorized;
- (BOOL)_areTrendNotificationsEnabled;
- (BOOL)_isTimeInDaylightEnabledForDataSource:(id)a3;
- (BOOL)isEventSubmissionIHAGated;
- (HDCloudSyncManager)unitTest_cloudSyncManager;
- (HDDeviceContextStoreManager)unitTest_deviceContextStoreManager;
- (HDHealthAppDailyAnalyticsEvent)initWithProfile:(id)a3;
- (HDHealthAppDailyAnalyticsEvent)initWithProfile:(id)a3 userDefaults:(id)a4;
- (NSString)eventName;
- (NSUserDefaults)userDefaults;
- (UNUserNotificationCenter)unitTest_userNotificationCenter;
- (id)_cloudSyncManager;
- (id)_deviceContextStoreManager;
- (id)_isHealthAppOnboardedString;
- (id)_supportsSecureContainer;
- (id)_userNotificationCenter;
- (id)_welcomeFlowCompletedDate;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (int64_t)_approximateDaysSinceLastAppOpen;
- (int64_t)_floorInteger:(int)a3 toSignificantFigures:(int)a4;
- (void)_supportsSecureContainer;
- (void)setUnitTest_cloudSyncManager:(id)a3;
- (void)setUnitTest_deviceContextStoreManager:(id)a3;
- (void)setUnitTest_userNotificationCenter:(id)a3;
@end

@implementation HDHealthAppDailyAnalyticsEvent

- (HDHealthAppDailyAnalyticsEvent)initWithProfile:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFFA40];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x263F0ACE8]];
  v8 = [(HDHealthAppDailyAnalyticsEvent *)self initWithProfile:v5 userDefaults:v7];

  return v8;
}

- (HDHealthAppDailyAnalyticsEvent)initWithProfile:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDHealthAppDailyAnalyticsEvent;
  v8 = [(HDHealthAppDailyAnalyticsEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
  }

  return v9;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.HealthApp.daily";
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDHealthAppDailyAnalyticsEvent _approximateDaysSinceLastAppOpen](self, "_approximateDaysSinceLastAppOpen"));
  [v8 setObject:v9 forKeyedSubscript:@"daysSinceLastAppOpen"];

  v10 = [(HDHealthAppDailyAnalyticsEvent *)self _isHealthAppOnboardedString];
  [v8 setObject:v10 forKeyedSubscript:@"isOnboarded"];

  objc_super v11 = [(HDHealthAppDailyAnalyticsEvent *)self _welcomeFlowCompletedDate];
  v43 = v11;
  if (v11)
  {
    [v11 timeIntervalSinceNow];
    LODWORD(v13) = vcvtmd_s64_f64(v12 / -604800.0);
    v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDHealthAppDailyAnalyticsEvent _floorInteger:toSignificantFigures:](self, "_floorInteger:toSignificantFigures:", v13, 2));
    [v8 setObject:v14 forKeyedSubscript:@"weeksSinceOnboarded"];
  }
  else
  {
    [v8 setObject:&unk_2701E2448 forKeyedSubscript:@"weeksSinceOnboarded"];
  }
  uint64_t v15 = [(HDHealthAppDailyAnalyticsEvent *)self _supportsSecureContainer];
  if (v15) {
    [v8 setObject:v15 forKeyedSubscript:@"supportsSecureContainer"];
  }
  v16 = [v7 environmentDataSource];
  v17 = [v16 activePairedDeviceProductType];
  [v8 setObject:v17 forKeyedSubscript:*MEMORY[0x263F091C0]];

  v18 = [v7 environmentDataSource];
  v19 = [v18 activePairedDeviceOSBuildNumber];
  [v8 setObject:v19 forKeyedSubscript:*MEMORY[0x263F091B8]];

  v20 = [(HDHealthAppDailyAnalyticsEvent *)self _deviceContextStoreManager];
  v21 = [v20 numberOfDeviceContextsPerDeviceType:a4];

  v42 = [NSNumber numberWithInt:0];
  v22 = [v21 objectForKeyedSubscript:v42];
  [v8 setObject:v22 forKeyedSubscript:*MEMORY[0x263F091E0]];

  v23 = [NSNumber numberWithInt:1];
  v24 = [v21 objectForKeyedSubscript:v23];
  [v8 setObject:v24 forKeyedSubscript:*MEMORY[0x263F091F0]];

  v25 = [NSNumber numberWithInt:2];
  v26 = [v21 objectForKeyedSubscript:v25];
  [v8 setObject:v26 forKeyedSubscript:*MEMORY[0x263F091F8]];

  v27 = [NSNumber numberWithInt:3];
  [v21 objectForKeyedSubscript:v27];
  v28 = v41 = (void *)v15;
  [v8 setObject:v28 forKeyedSubscript:*MEMORY[0x263F091E8]];

  v29 = NSNumber;
  v30 = [v7 environmentDataSource];
  v31 = objc_msgSend(v29, "numberWithBool:", objc_msgSend(v30, "isImproveHealthAndActivityEnabled"));
  [v8 setObject:v31 forKeyedSubscript:*MEMORY[0x263F09200]];

  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[HDHealthAppDailyAnalyticsEvent _areHealthAppNotificationsAuthorized](self, "_areHealthAppNotificationsAuthorized"));
  [v8 setObject:v32 forKeyedSubscript:*MEMORY[0x263F091D0]];

  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[HDHealthAppDailyAnalyticsEvent _areTrendNotificationsEnabled](self, "_areTrendNotificationsEnabled"));
  [v8 setObject:v33 forKeyedSubscript:@"hasTrendsNotification"];

  v34 = NSNumber;
  v35 = [(HDHealthAppDailyAnalyticsEvent *)self _cloudSyncManager];
  v36 = objc_msgSend(v34, "numberWithBool:", objc_msgSend(v35, "canPerformCloudSyncWithError:", 0));
  [v8 setObject:v36 forKeyedSubscript:@"cloudSyncEnabled"];

  v37 = NSNumber;
  BOOL v38 = [(HDHealthAppDailyAnalyticsEvent *)self _isTimeInDaylightEnabledForDataSource:v7];

  v39 = [v37 numberWithBool:v38];
  [v8 setObject:v39 forKeyedSubscript:@"timeInDaylightEnabled"];

  return v8;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v8 = [v6 healthDataSource];
  v9 = [v8 biologicalSexWithError:a4];

  v10 = HKAnalyticsPropertyValueForBiologicalSex();
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x263F091D8]];

  objc_super v11 = [v6 environmentDataSource];
  double v12 = [v11 currentDate];

  uint64_t v13 = [v6 healthDataSource];

  v14 = [v13 ageWithCurrentDate:v12 error:a4];
  [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x263F091C8]];

  return v7;
}

- (int64_t)_approximateDaysSinceLastAppOpen
{
  v2 = [(NSUserDefaults *)self->_userDefaults hk_dateForKey:*MEMORY[0x263F0ACF0]];
  v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    int64_t v5 = vcvtmd_s64_f64(v4 / -86400.0);
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

- (id)_supportsSecureContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  if (WeakRetained)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__0;
    v19 = __Block_byref_object_dispose__0;
    id v20 = 0;
    int64_t v5 = [(HDHealthAppDailyAnalyticsEvent *)self _cloudSyncManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__HDHealthAppDailyAnalyticsEvent__supportsSecureContainer__block_invoke;
    v12[3] = &unk_265358D40;
    v12[4] = self;
    id v6 = v4;
    uint64_t v13 = v6;
    v14 = &v15;
    [v5 accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:v12];

    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x263F09968];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
        [(HDHealthAppDailyAnalyticsEvent *)(uint64_t)self _supportsSecureContainer];
      }
      id v9 = 0;
    }
    else
    {
      id v9 = (id)v16[5];
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      [(HDHealthAppDailyAnalyticsEvent *)(uint64_t)self _supportsSecureContainer];
    }
    id v9 = 0;
  }
  return v9;
}

void __58__HDHealthAppDailyAnalyticsEvent__supportsSecureContainer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __58__HDHealthAppDailyAnalyticsEvent__supportsSecureContainer__block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithBool:a2];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_isHealthAppOnboardedString
{
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isiPad];
  id v5 = (id *)MEMORY[0x263F0ACD0];
  if (!v4) {
    id v5 = (id *)MEMORY[0x263F0ACD8];
  }
  id v6 = *v5;

  uint64_t v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v7 integerValue];
    id v9 = @"false";
    if (v8 > 0) {
      id v9 = @"true";
    }
    v10 = v9;
  }
  else
  {
    v10 = @"nil";
  }

  return v10;
}

- (BOOL)_areHealthAppNotificationsAuthorized
{
  v2 = [(HDHealthAppDailyAnalyticsEvent *)self _userNotificationCenter];
  v3 = [v2 notificationSettings];

  LOBYTE(v2) = [v3 authorizationStatus] == 2;
  return (char)v2;
}

- (BOOL)_areTrendNotificationsEnabled
{
  v3 = [MEMORY[0x263F0A618] primaryProfile];
  int v4 = [v3 identifier];
  id v5 = [v4 UUIDString];

  id v6 = [NSString stringWithFormat:@"HealthSharingPreferences_%@_Notifications_%@", v5, @"significantChanges"];
  LOBYTE(self) = [(NSUserDefaults *)self->_userDefaults BOOLForKey:v6];

  return (char)self;
}

- (id)_welcomeFlowCompletedDate
{
  return (id)[(NSUserDefaults *)self->_userDefaults hk_dateForKey:@"HealthPluginHost.HealthWelcomeFlow.CompletionDate"];
}

- (int64_t)_floorInteger:(int)a3 toSignificantFigures:(int)a4
{
  if (!a3) {
    return 0;
  }
  if (a3 >= 0) {
    int v6 = a3;
  }
  else {
    int v6 = -a3;
  }
  double v7 = log10((double)v6);
  double v8 = __exp10((double)(int)(a4 - vcvtpd_s64_f64(v7)));
  return (uint64_t)((double)(uint64_t)floor(v8 * (double)a3) / v8);
}

- (BOOL)_isTimeInDaylightEnabledForDataSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFFA40]);
  id v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x263F0ADC0]];
  int v6 = [v5 objectForKey:*MEMORY[0x263F0ADC8]];
  double v7 = v6;
  if (v6)
  {
    char v8 = [v6 BOOLValue];
  }
  else
  {
    id v9 = [v3 environmentDataSource];
    v10 = [v9 activePairedDeviceProductType];
    char v8 = v10 != 0;
  }
  return v8;
}

- (id)_cloudSyncManager
{
  p_unitTest_cloudSyncManager = &self->_unitTest_cloudSyncManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_cloudSyncManager);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_unitTest_cloudSyncManager);
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_profile);
    id v5 = [v6 cloudSyncManager];
  }
  return v5;
}

- (id)_deviceContextStoreManager
{
  p_unitTest_deviceContextStoreManager = &self->_unitTest_deviceContextStoreManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_deviceContextStoreManager);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_unitTest_deviceContextStoreManager);
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_profile);
    id v5 = [v6 deviceContextManager];
  }
  return v5;
}

- (id)_userNotificationCenter
{
  p_unitTest_userNotificationCenter = &self->_unitTest_userNotificationCenter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_userNotificationCenter);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_unitTest_userNotificationCenter);
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x263F1DFB0]);
    id v4 = (id)[v5 initWithBundleIdentifier:*MEMORY[0x263F0AD08]];
  }
  return v4;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HDCloudSyncManager)unitTest_cloudSyncManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_cloudSyncManager);
  return (HDCloudSyncManager *)WeakRetained;
}

- (void)setUnitTest_cloudSyncManager:(id)a3
{
}

- (HDDeviceContextStoreManager)unitTest_deviceContextStoreManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_deviceContextStoreManager);
  return (HDDeviceContextStoreManager *)WeakRetained;
}

- (void)setUnitTest_deviceContextStoreManager:(id)a3
{
}

- (UNUserNotificationCenter)unitTest_userNotificationCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTest_userNotificationCenter);
  return (UNUserNotificationCenter *)WeakRetained;
}

- (void)setUnitTest_userNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTest_userNotificationCenter);
  objc_destroyWeak((id *)&self->_unitTest_deviceContextStoreManager);
  objc_destroyWeak((id *)&self->_unitTest_cloudSyncManager);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_supportsSecureContainer
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_250D3F000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Timed out attempting to get secure container status.", (uint8_t *)&v2, 0xCu);
}

void __58__HDHealthAppDailyAnalyticsEvent__supportsSecureContainer__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_250D3F000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get secure container status with error %{public}@", (uint8_t *)&v4, 0x16u);
}

@end