@interface HeartRateStore
+ (id)sharedStore;
- (HKQuery)heartRateQuery;
- (HeartRateStore)init;
- (double)recentHeartRateTime;
- (unint64_t)recentHeartRate;
- (void)_updateHeartRateEnabled;
- (void)_updateHeartRateWithCompletion:(id)a3;
- (void)recentHeartRateWithCompletion:(id)a3;
- (void)setHeartRateQuery:(id)a3;
- (void)setRecentHeartRate:(unint64_t)a3;
- (void)setRecentHeartRateTime:(double)a3;
@end

@implementation HeartRateStore

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedStore_store;

  return v2;
}

uint64_t __29__HeartRateStore_sharedStore__block_invoke()
{
  sharedStore_store = objc_alloc_init(HeartRateStore);

  return MEMORY[0x270F9A758]();
}

- (HeartRateStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)HeartRateStore;
  v2 = [(HeartRateStore *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(HeartRateStore *)v2 _updateHeartRateEnabled];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_heartRateEnabledPreferenceChangeNotification, @"NanoLifestylePrivacyEnableHeartRateNotification", 0, CFNotificationSuspensionBehaviorDrop);
    v5 = v3;
  }

  return v3;
}

- (void)recentHeartRateWithCompletion:(id)a3
{
  v4 = (void (**)(id, unint64_t))a3;
  if (v4)
  {
    v8 = v4;
    double v5 = CFAbsoluteTimeGetCurrent() - self->_recentHeartRateTime;
    unint64_t recentHeartRate = 85;
    if (self->_heartRateEnabled)
    {
      objc_super v7 = v8;
      if (v5 <= 660.0) {
        unint64_t recentHeartRate = self->_recentHeartRate;
      }
    }
    else
    {
      objc_super v7 = v8;
    }
    v7[2](v7, recentHeartRate);
    v4 = v8;
    if (self->_heartRateEnabled && v5 > 660.0 && !self->_heartRateQuery)
    {
      [(HeartRateStore *)self _updateHeartRateWithCompletion:v8];
      v4 = v8;
    }
  }
}

- (void)_updateHeartRateWithCompletion:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_heartRateEnabled && [MEMORY[0x263F0A410] isHealthDataAvailable])
  {
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke;
    v24[3] = &unk_264DEC9A0;
    objc_copyWeak(&v26, &location);
    id v25 = v4;
    double v5 = (void *)MEMORY[0x23ECC8210](v24);
    v6 = [MEMORY[0x263EFF910] date];
    objc_super v7 = [v6 dateByAddingTimeInterval:-660.0];

    v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K >= %@", *MEMORY[0x263F09B90], v7];
    uint64_t v9 = *MEMORY[0x263F09E38];
    v10 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09E38]];
    v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F80] ascending:0];
    id v12 = objc_alloc(MEMORY[0x263F0A6E0]);
    v28[0] = v11;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    v14 = (HKQuery *)[v12 initWithSampleType:v10 predicate:v8 limit:1 sortDescriptors:v13 resultsHandler:v5];
    heartRateQuery = self->_heartRateQuery;
    self->_heartRateQuery = v14;

    healthStore = self->_healthStore;
    if (healthStore)
    {
      [(HKHealthStore *)healthStore executeQuery:self->_heartRateQuery];
    }
    else
    {
      v17 = (HKHealthStore *)objc_alloc_init(MEMORY[0x263F0A410]);
      v18 = self->_healthStore;
      self->_healthStore = v17;

      v19 = self->_healthStore;
      v20 = (void *)MEMORY[0x263EFFA08];
      v21 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:v9];
      v22 = [v20 setWithObject:v21];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke_3;
      v23[3] = &unk_264DEC9C8;
      v23[4] = self;
      [(HKHealthStore *)v19 requestAuthorizationToShareTypes:0 readTypes:v22 completion:v23];
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 count])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke_2;
    block[3] = &unk_264DEC978;
    id v7 = v4;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    id v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v9);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setHeartRateQuery:0];
  }
}

void __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke_2(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) firstObject];
  v2 = [v11 quantity];
  v3 = [MEMORY[0x263F0A830] unitFromString:@"count/min"];
  [v2 doubleValueForUnit:v3];
  uint64_t v5 = (uint64_t)v4;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setRecentHeartRate:v5];

  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [v11 endDate];
  [v8 timeIntervalSinceReferenceDate];
  objc_msgSend(v7, "setRecentHeartRateTime:");

  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  [v9 setHeartRateQuery:0];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v5);
  }
}

uint64_t __49__HeartRateStore__updateHeartRateWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) executeQuery:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (void)_updateHeartRateEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableHeartRate", @"com.apple.nanolifestyle.privacy", &keyExistsAndHasValidFormat);
  char v4 = [MEMORY[0x263F1C408] isRunningInStoreDemoMode];
  BOOL v5 = 0;
  if ((v4 & 1) == 0)
  {
    if (keyExistsAndHasValidFormat) {
      BOOL v6 = AppBooleanValue == 0;
    }
    else {
      BOOL v6 = 0;
    }
    BOOL v5 = !v6;
  }
  self->_heartRateEnabled = v5;
}

- (HKQuery)heartRateQuery
{
  return self->_heartRateQuery;
}

- (void)setHeartRateQuery:(id)a3
{
}

- (unint64_t)recentHeartRate
{
  return self->_recentHeartRate;
}

- (void)setRecentHeartRate:(unint64_t)a3
{
  self->_unint64_t recentHeartRate = a3;
}

- (double)recentHeartRateTime
{
  return self->_recentHeartRateTime;
}

- (void)setRecentHeartRateTime:(double)a3
{
  self->_recentHeartRateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateQuery, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end