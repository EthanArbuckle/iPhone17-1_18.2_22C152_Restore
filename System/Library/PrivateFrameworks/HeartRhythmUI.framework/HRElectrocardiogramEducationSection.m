@interface HRElectrocardiogramEducationSection
- (BOOL)_hasOnboardedBefore;
- (BOOL)firstTimeOnboarding;
- (BOOL)forSinglePlayer;
- (HKHealthStore)store;
- (HRElectrocardiogramEducationSection)initWithHealthStore:(id)a3 forSinglePlayer:(BOOL)a4 activeAlgorithmVersion:(id)a5;
- (NSMutableDictionary)userInfo;
- (NSNumber)activeAlgorithmVersion;
- (id)_cellTitleForEducationRow:(unint64_t)a3;
- (id)_viewControllerForEducationRow:(unint64_t)a3;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)dateCache;
- (id)fetchActiveECGAlgorithmVersion;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)_hasOnboardedBefore;
- (void)fetchActiveECGAlgorithmVersion;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)setActiveAlgorithmVersion:(id)a3;
- (void)setStore:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HRElectrocardiogramEducationSection

- (HRElectrocardiogramEducationSection)initWithHealthStore:(id)a3 forSinglePlayer:(BOOL)a4 activeAlgorithmVersion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HRElectrocardiogramEducationSection;
  v11 = [(HRElectrocardiogramEducationSection *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_store, a3);
    v12->_forSinglePlayer = a4;
    objc_storeStrong((id *)&v12->_activeAlgorithmVersion, a5);
  }

  return v12;
}

- (id)fetchActiveECGAlgorithmVersion
{
  activeAlgorithmVersion = self->_activeAlgorithmVersion;
  if (activeAlgorithmVersion)
  {
    v3 = activeAlgorithmVersion;
  }
  else
  {
    v5 = [(HRElectrocardiogramEducationSection *)self store];
    v6 = [v5 profileIdentifier];
    uint64_t v7 = [v6 type];

    if (v7 == 1)
    {
      v8 = (void *)MEMORY[0x263F0A348];
      id v9 = [(HRElectrocardiogramEducationSection *)self store];
      id v13 = 0;
      v3 = [v8 versionWithHealthStore:v9 error:&v13];
      id v10 = v13;

      if (v10)
      {
        _HKInitializeLogging();
        v11 = *MEMORY[0x263F09920];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
          [(HRElectrocardiogramEducationSection *)(uint64_t)v10 fetchActiveECGAlgorithmVersion];
        }
      }
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)sectionTitle
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  if (self->_forSinglePlayer) {
    return 4;
  }
  else {
    return 3;
  }
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v6 = [a4 dequeueReusableCellWithIdentifier:@"UITableViewCell"];
  if (!v6)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"UITableViewCell"];
    uint64_t v7 = [v6 textLabel];
    [v7 setAdjustsFontForContentSizeCategory:1];

    v8 = [v6 textLabel];
    [v8 setNumberOfLines:0];

    [v6 setAccessoryType:1];
  }
  id v9 = [(HRElectrocardiogramEducationSection *)self _cellTitleForEducationRow:a3];
  id v10 = [v6 textLabel];
  [v10 setText:v9];

  v11 = [v6 detailTextLabel];
  [v11 setText:0];

  v12 = [@"Education" stringByAppendingFormat:@".Cell.%@", v9];
  id v13 = [NSString healthAccessibilityIdentifier:1 suffix:v12];
  [v6 setAccessibilityIdentifier:v13];

  return v6;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v9 = a4;
  uint64_t v7 = [(HRElectrocardiogramEducationSection *)self _viewControllerForEducationRow:a3];
  if (v7)
  {
    v8 = [v9 topViewController];
    [v8 showAdaptively:v7 sender:0 animated:1];
  }
}

- (id)_cellTitleForEducationRow:(unint64_t)a3
{
  v6 = @"ECG_ONBOARDING_2_TITLE";
  switch(a3)
  {
    case 0uLL:
      goto LABEL_10;
    case 1uLL:
      v6 = @"ECG_EDUCATION_3_TITLE";
      goto LABEL_10;
    case 2uLL:
      if ([(HRElectrocardiogramEducationSection *)self _hasOnboardedBefore]) {
        v6 = @"ECG_V2_ONBOARDING_4_TITLE";
      }
      else {
        v6 = @"ECG_ONBOARDING_4_TITLE";
      }
      goto LABEL_10;
    case 3uLL:
      v6 = @"ECG_EDUCATION_5_TITLE";
LABEL_10:
      HRUIECGLocalizedString(v6);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return v6;
}

- (id)_viewControllerForEducationRow:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = HROnboardingElectrocardiogramExplanationViewController;
      goto LABEL_8;
    case 1uLL:
      v6 = [(HRElectrocardiogramEducationSection *)self fetchActiveECGAlgorithmVersion];
      uint64_t v7 = v6;
      if (v6)
      {
        v5 = +[HRElectrocardiogramOnboardingManager electrocardiogramPossibleResultsViewControllerForAlgorithmVersion:forOnboarding:](HRElectrocardiogramOnboardingManager, "electrocardiogramPossibleResultsViewControllerForAlgorithmVersion:forOnboarding:", [v6 integerValue], 0);
      }
      else
      {
        v5 = 0;
      }

      break;
    case 2uLL:
      uint64_t v4 = HROnboardingElectrocardiogramFeatureLimitationsViewController;
      goto LABEL_8;
    case 3uLL:
      uint64_t v4 = HROnboardingElectrocardiogramTakeRecordingViewController;
LABEL_8:
      v5 = (void *)[[v4 alloc] initForOnboarding:0];
      break;
    default:
      v5 = 0;
      break;
  }
  [v5 setDelegate:self];
  return v5;
}

- (BOOL)_hasOnboardedBefore
{
  id v3 = objc_alloc(MEMORY[0x263F0A3D0]);
  uint64_t v4 = *MEMORY[0x263F09740];
  v5 = [(HRElectrocardiogramEducationSection *)self store];
  v6 = (void *)[v3 initWithFeatureIdentifier:v4 healthStore:v5];

  id v12 = 0;
  uint64_t v7 = [v6 featureStatusWithError:&v12];
  id v8 = v12;
  if (!v7)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      [(HRElectrocardiogramEducationSection *)(uint64_t)self _hasOnboardedBefore];
    }
  }
  char v10 = [v7 isOnboardingRecordPresent];

  return v10;
}

- (id)dateCache
{
  return 0;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)firstTimeOnboarding
{
  return self->_firstTimeOnboarding;
}

- (HKHealthStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (BOOL)forSinglePlayer
{
  return self->_forSinglePlayer;
}

- (NSNumber)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (void)setActiveAlgorithmVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAlgorithmVersion, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)fetchActiveECGAlgorithmVersion
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  id v3 = "-[HRElectrocardiogramEducationSection fetchActiveECGAlgorithmVersion]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_220CA3000, a2, OS_LOG_TYPE_ERROR, "[%{public}s] Failed to fetch algorithm version: %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)_hasOnboardedBefore
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_220CA3000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get feature status with error: %@", (uint8_t *)&v3, 0x16u);
}

@end