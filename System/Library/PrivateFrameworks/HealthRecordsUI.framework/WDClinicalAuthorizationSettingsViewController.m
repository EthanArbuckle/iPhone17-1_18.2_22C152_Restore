@interface WDClinicalAuthorizationSettingsViewController
+ (id)contextUsingProfile:(id)a3 source:(id)a4;
- (HRProfile)profile;
- (WDClinicalAuthorizationSettingsViewController)initWithContext:(id)a3 style:(int64_t)a4;
- (WDClinicalAuthorizationSettingsViewController)initWithProfile:(id)a3 source:(id)a4;
@end

@implementation WDClinicalAuthorizationSettingsViewController

- (WDClinicalAuthorizationSettingsViewController)initWithContext:(id)a3 style:(int64_t)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (WDClinicalAuthorizationSettingsViewController)initWithProfile:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() contextUsingProfile:v6 source:v7];

  v12.receiver = self;
  v12.super_class = (Class)WDClinicalAuthorizationSettingsViewController;
  v9 = [(HKClinicalAuthorizationSettingsViewController *)&v12 initWithContext:v8 style:0];
  v10 = v9;
  if (v9) {
    objc_storeWeak((id *)&v9->_profile, v6);
  }

  return v10;
}

+ (id)contextUsingProfile:(id)a3 source:(id)a4
{
  id v5 = a4;
  id v19 = 0;
  id v6 = a3;
  id v7 = [v5 _fetchBundleWithError:&v19];
  id v8 = v19;
  if (!v7)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      +[WDClinicalAuthorizationSettingsViewController contextUsingProfile:source:]((uint64_t)v5, (uint64_t)v8, v9);
    }
  }
  v10 = [v6 healthStore];
  v11 = [v6 healthRecordsStore];

  objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4F679E8]) initWithHealthStore:v10 healthRecordsStore:v11 source:v5 typesRequestedForReading:0];
  id v13 = objc_alloc(MEMORY[0x1E4F679E0]);
  uint64_t v14 = [v7 objectForInfoDictionaryKey:*MEMORY[0x1E4F67928]];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = &stru_1F1D9FF30;
  }
  v17 = (void *)[v13 initWithHealthStore:v10 healthRecordsStore:v11 authorizationController:v12 readUsageDescription:v16 source:v5];

  return v17;
}

- (HRProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HRProfile *)WeakRetained;
}

- (void).cxx_destruct
{
}

+ (void)contextUsingProfile:(os_log_t)log source:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "Failed to fetch app bundle for source %@. Using fallback values for authorization settings controller. Fetch error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end