@interface HRElectrocardiogramOnboardingManager
+ (BOOL)hasOverriddenOnboardingSettings;
+ (id)electrocardiogramPossibleResultsViewControllerForAlgorithmVersion:(int64_t)a3 forOnboarding:(BOOL)a4;
+ (id)electrocardiogramPossibleResultsViewControllerForSample:(id)a3;
+ (id)electrocardiogramPossibleResultsViewControllerForSample:(id)a3 forAlgorithmVersion:(int64_t)a4;
+ (int64_t)algorithmVersionForSample:(id)a3;
- (BOOL)isFirstTimeOnboarding;
- (BOOL)isSampleInteractive;
- (HKFeatureAvailabilityStore)availabilityStore;
- (HKOnboardingManager)onboardingManager;
- (HRElectrocardiogramOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 provenance:(int64_t)a7 delegate:(id)a8 isSampleInteractive:(BOOL)a9;
- (HRElectrocardiogramOnboardingManagerDelegate)delegate;
- (id)availableOnboardingStepsForOnboardingManager:(id)a3;
- (id)onboardingManager:(id)a3 customViewControllerForPage:(id)a4;
- (id)onboardingManager:(id)a3 sequenceForStep:(int64_t)a4 onboardingType:(int64_t)a5;
- (id)onboardingNavigationController;
- (int64_t)availableAlgorithmVersion;
- (int64_t)provenance;
- (int64_t)upgradingFromAlgorithmVersion;
- (void)availableAlgorithmVersion;
- (void)didBeginOnboardingForOnboardingManager:(id)a3;
- (void)didCancelOnboardingForOnboardingManager:(id)a3;
- (void)didCompleteOnboardingForOnboardingManager:(id)a3;
- (void)didTapOnElectrocardiogram:(id)a3;
- (void)didTapOnShowDevicesInWatchApp;
- (void)dismissOnboarding;
- (void)onboardingManager:(id)a3 willMoveToPage:(id)a4;
- (void)recordOnboardingAsCompleted;
- (void)setDelegate:(id)a3;
@end

@implementation HRElectrocardiogramOnboardingManager

+ (id)electrocardiogramPossibleResultsViewControllerForSample:(id)a3 forAlgorithmVersion:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    v6 = off_264580A20;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v6 = off_264580A00;
LABEL_5:
    v7 = (void *)[objc_alloc(*v6) initWithSample:v5];
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

+ (id)electrocardiogramPossibleResultsViewControllerForSample:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "electrocardiogramPossibleResultsViewControllerForSample:forAlgorithmVersion:", v4, +[HRElectrocardiogramOnboardingManager algorithmVersionForSample:](HRElectrocardiogramOnboardingManager, "algorithmVersionForSample:", v4));

  return v5;
}

+ (id)electrocardiogramPossibleResultsViewControllerForAlgorithmVersion:(int64_t)a3 forOnboarding:(BOOL)a4
{
  if (a3 == 1)
  {
    id v4 = off_264580A20;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    id v4 = off_264580A00;
LABEL_5:
    id v5 = (void *)[objc_alloc(*v4) initForOnboarding:a4];
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return v5;
}

+ (int64_t)algorithmVersionForSample:(id)a3
{
  v3 = [a3 _algorithmVersion];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

+ (BOOL)hasOverriddenOnboardingSettings
{
  int v2 = [MEMORY[0x263F0A980] isAppleInternalInstall];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
    id v4 = [v3 objectForKey:*MEMORY[0x263F09528]];
    uint64_t v5 = [v4 unsignedIntegerValue];

    LOBYTE(v2) = [MEMORY[0x263F0A548] isOverridePresent];
    if (v5) {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (HRElectrocardiogramOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 provenance:(int64_t)a7 delegate:(id)a8 isSampleInteractive:(BOOL)a9
{
  BOOL v12 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HRElectrocardiogramOnboardingManager;
  v18 = [(HRElectrocardiogramOnboardingManager *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v17);
    v19->_isFirstTimeOnboarding = v12;
    v19->_isSampleInteractive = a9;
    v19->_provenance = a7;
    id v20 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v21 = [v20 initWithFeatureIdentifier:*MEMORY[0x263F09740] healthStore:v15];
    availabilityStore = v19->_availabilityStore;
    v19->_availabilityStore = (HKFeatureAvailabilityStore *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263F46888]) initWithOnboardingType:a3 isFirstTimeOnboarding:v12 healthStore:v15 dateCache:v16];
    onboardingManager = v19->_onboardingManager;
    v19->_onboardingManager = (HKOnboardingManager *)v23;

    [(HKOnboardingManager *)v19->_onboardingManager setDataSource:v19];
    [(HKOnboardingManager *)v19->_onboardingManager setDelegate:v19];
  }

  return v19;
}

- (id)onboardingNavigationController
{
  int v2 = [(HRElectrocardiogramOnboardingManager *)self onboardingManager];
  v3 = [v2 onboardingNavigationController];

  return v3;
}

- (void)dismissOnboarding
{
  id v2 = [(HRElectrocardiogramOnboardingManager *)self onboardingManager];
  [v2 dismissOnboarding];
}

- (int64_t)availableAlgorithmVersion
{
  id v4 = [(HRElectrocardiogramOnboardingManager *)self onboardingManager];
  uint64_t v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"HROnboardingElectrocardiogramAlgorithmVersionKey"];

  if (!v6 || (uint64_t v7 = [v6 integerValue], v7 == *MEMORY[0x263F0AA58]))
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      [(HRElectrocardiogramOnboardingManager *)(uint64_t)self availableAlgorithmVersion];
    }
  }
  int64_t v9 = [v6 integerValue];

  return v9;
}

- (int64_t)upgradingFromAlgorithmVersion
{
  return 1;
}

- (id)availableOnboardingStepsForOnboardingManager:(id)a3
{
  return &unk_26D2BF360;
}

- (id)onboardingManager:(id)a3 sequenceForStep:(int64_t)a4 onboardingType:(int64_t)a5
{
  id v9 = a3;
  if (a4 == 2) {
    goto LABEL_6;
  }
  if (a4 != 1) {
    goto LABEL_12;
  }
  if (a5 == 1)
  {
    uint64_t v10 = [MEMORY[0x263F46898] upgradingElectrocardiogramAvailabilitySequence];
    goto LABEL_11;
  }
  if (a5)
  {
LABEL_6:
    int64_t v11 = [(HRElectrocardiogramOnboardingManager *)self availableAlgorithmVersion];
    if (a5 == 1)
    {
      int64_t v12 = [(HRElectrocardiogramOnboardingManager *)self upgradingFromAlgorithmVersion];
      uint64_t v10 = [MEMORY[0x263F46898] upgradingElectrocardiogramSequenceFromAlgorithmVersion:v12 toAlgorithmVersion:v11];
    }
    else
    {
      if (a5) {
        goto LABEL_12;
      }
      uint64_t v10 = [MEMORY[0x263F46898] firstTimeElectrocardiogramOnboardingSequenceWithAlgorithmVersion:v11];
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F46898] firstTimeElectrocardiogramAvailabilitySequence];
  }
LABEL_11:
  uint64_t v5 = (void *)v10;
LABEL_12:

  return v5;
}

- (id)onboardingManager:(id)a3 customViewControllerForPage:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "sequencePage", a3);
  if (v5 == 8)
  {
    id v6 = [[HROnboardingElectrocardiogramUpdateCompleteViewController alloc] initForOnboarding:1 upgradingFromAlgorithmVersion:[(HRElectrocardiogramOnboardingManager *)self upgradingFromAlgorithmVersion] electrocardiogramDelegate:self];
  }
  else if (v5 == 7)
  {
    id v6 = [[HROnboardingElectrocardiogramSetupCompleteViewController alloc] initForOnboarding:1 isSampleInteractive:[(HRElectrocardiogramOnboardingManager *)self isSampleInteractive] electrocardiogramDelegate:self];
  }
  else if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [[HROnboardingElectrocardiogramAvailabilityViewController alloc] initForOnboarding:1 provenance:[(HRElectrocardiogramOnboardingManager *)self provenance]];
  }
  return v6;
}

- (void)didBeginOnboardingForOnboardingManager:(id)a3
{
  if (![a3 onboardingType])
  {
    id v4 = [MEMORY[0x263EFF910] date];
    uint64_t v5 = [(HRElectrocardiogramOnboardingManager *)self onboardingManager];
    id v6 = [v5 userInfo];
    [v6 setObject:v4 forKeyedSubscript:@"HROnboardingElectrocardiogramStartDateKey"];

    objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_setElectrocardiogramFirstRecordingCompleted:", 0);
  }
}

- (void)onboardingManager:(id)a3 willMoveToPage:(id)a4
{
  id v20 = a3;
  uint64_t v6 = [a4 sequencePage];
  uint64_t v7 = 1;
  switch(v6)
  {
    case 0:
      goto LABEL_10;
    case 1:
      uint64_t v7 = 2;
      goto LABEL_10;
    case 4:
      uint64_t v7 = 5;
      goto LABEL_10;
    case 5:
      uint64_t v7 = 6;
      goto LABEL_10;
    case 6:
      [(HRElectrocardiogramOnboardingManager *)self recordOnboardingAsCompleted];
      uint64_t v7 = 7;
      goto LABEL_10;
    case 7:
      v8 = [(HRElectrocardiogramOnboardingManager *)self onboardingManager];
      id v9 = [v8 userInfo];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"HROnboardingElectrocardiogramDidCompleteRecordingKey"];
      int v11 = [v10 BOOLValue];

      if (v11) {
        uint64_t v7 = 9;
      }
      else {
        uint64_t v7 = 10;
      }
      goto LABEL_10;
    case 8:
      [(HRElectrocardiogramOnboardingManager *)self recordOnboardingAsCompleted];
      uint64_t v7 = 8;
LABEL_10:
      if (([(id)objc_opt_class() hasOverriddenOnboardingSettings] & 1) == 0)
      {
        int64_t v12 = [(HRElectrocardiogramOnboardingManager *)self onboardingManager];
        v13 = [v12 userInfo];
        v14 = [v13 objectForKeyedSubscript:@"HROnboardingElectrocardiogramAlgorithmVersionKey"];

        if (v14)
        {
          id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F0A348], "onboardingVersionForKnownAlgorithmVersion:", objc_msgSend(v14, "integerValue")));
        }
        else
        {
          id v15 = 0;
        }
        id v16 = +[HRUIAnalyticsManager sharedManager];
        uint64_t v17 = [v20 onboardingType];
        v18 = [v20 userInfo];
        v19 = [v18 objectForKeyedSubscript:@"HROnboardingElectrocardiogramCountryCodeKey"];
        objc_msgSend(v16, "trackElectrocardiogramOnboardingStep:forOnboardingType:onboardingVersion:countryCode:provenance:", v7, v17, v15, v19, -[HRElectrocardiogramOnboardingManager provenance](self, "provenance"));
      }
      break;
    default:
      break;
  }
}

- (void)recordOnboardingAsCompleted
{
  v3 = [(HRElectrocardiogramOnboardingManager *)self onboardingManager];
  id v4 = [v3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:@"HROnboardingElectrocardiogramCountryCodeKey"];

  uint64_t v5 = [(HRElectrocardiogramOnboardingManager *)self availabilityStore];
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  [v5 setCurrentOnboardingVersionCompletedForCountryCode:v7 countryCodeProvenance:0 date:v6 settings:0 completion:&__block_literal_global_2];
}

void __67__HRElectrocardiogramOnboardingManager_recordOnboardingAsCompleted__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  [v0 removeObjectForKey:*MEMORY[0x263F09528]];

  id v1 = [MEMORY[0x263F08A00] defaultCenter];
  [v1 postNotificationName:@"HRElectrocardiogramOnboardingCompletedNotificationName" object:0];
}

- (void)didCancelOnboardingForOnboardingManager:(id)a3
{
  id v4 = [(HRElectrocardiogramOnboardingManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HRElectrocardiogramOnboardingManager *)self delegate];
    [v6 didDismissOnboarding];
  }
}

- (void)didCompleteOnboardingForOnboardingManager:(id)a3
{
  id v4 = [(HRElectrocardiogramOnboardingManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HRElectrocardiogramOnboardingManager *)self delegate];
    [v6 didCompleteOnboarding];
  }
}

- (void)didTapOnElectrocardiogram:(id)a3
{
  id v7 = a3;
  id v4 = [(HRElectrocardiogramOnboardingManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HRElectrocardiogramOnboardingManager *)self delegate];
    [v6 didTapOnElectrocardiogram:v7];
  }
}

- (void)didTapOnShowDevicesInWatchApp
{
  id v3 = (id)[objc_alloc(NSURL) initWithString:@"bridge:root=ActiveWatch"];
  id v2 = [MEMORY[0x263F01880] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (HKOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (BOOL)isFirstTimeOnboarding
{
  return self->_isFirstTimeOnboarding;
}

- (BOOL)isSampleInteractive
{
  return self->_isSampleInteractive;
}

- (HRElectrocardiogramOnboardingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HRElectrocardiogramOnboardingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKFeatureAvailabilityStore)availabilityStore
{
  return self->_availabilityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
}

- (void)availableAlgorithmVersion
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v5 = a2;
  id v6 = NSStringFromSelector(a3);
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_220CA3000, v5, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Available algorithm version accessed without being set first.", (uint8_t *)&v7, 0x16u);
}

@end