@interface HRProfile
+ (id)userProfileWithProfileIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKClinicalAccountStore)clinicalAccountStore;
- (HKClinicalIngestionStore)ingestionStore;
- (HKConceptStore)conceptStore;
- (HKDateCache)dateCache;
- (HKHealthRecordsStore)healthRecordsStore;
- (HKHealthStore)healthStore;
- (HKSampleTypeUpdateController)updateController;
- (HKUCUMUnitDisplayConverter)ucumDisplayConverter;
- (HRProfile)initWithHealthStore:(id)a3 profileIdentifier:(id)a4;
- (HRWDUserActivityManager)userActivityManager;
- (UTCDateFormatter)utcDateFormatter;
- (WDClinicalOnboardingManager)onboardingManager;
- (WDClinicalSampleAccountsLoader)clinicalSampleAccountsLoader;
- (WDClinicalSourcesDataProvider)clinicalSourcesDataProvider;
- (id)_initWithHealthStore:(id)a3;
- (unint64_t)hash;
- (void)setClinicalSampleAccountsLoader:(id)a3;
@end

@implementation HRProfile

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (HRProfile)initWithHealthStore:(id)a3 profileIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)HRProfile;
  v9 = [(HRProfile *)&v39 init];
  v10 = v9;
  if (v9)
  {
    p_healthStore = (id *)&v9->_healthStore;
    objc_storeStrong((id *)&v9->_healthStore, a3);
    if (v8)
    {
      v12 = [*p_healthStore profileIdentifier];
      char v13 = [v12 isEqual:v8];

      if ((v13 & 1) == 0)
      {
        [*p_healthStore setProfileIdentifier:v8];
        [*p_healthStore resume];
      }
    }
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F2B0A0]) initWithHealthStore:v10->_healthStore];
    healthRecordsStore = v10->_healthRecordsStore;
    v10->_healthRecordsStore = (HKHealthRecordsStore *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F67710]) initWithHealthStore:v10->_healthStore];
    clinicalAccountStore = v10->_clinicalAccountStore;
    v10->_clinicalAccountStore = (HKClinicalAccountStore *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F67730]) initWithHealthStore:v10->_healthStore];
    ingestionStore = v10->_ingestionStore;
    v10->_ingestionStore = (HKClinicalIngestionStore *)v18;

    v20 = [[WDClinicalSourcesDataProvider alloc] initWithHealthRecordsStore:v10->_healthRecordsStore];
    clinicalSourcesDataProvider = v10->_clinicalSourcesDataProvider;
    v10->_clinicalSourcesDataProvider = v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F67BF8]) initWithHealthStore:v10->_healthStore];
    updateController = v10->_updateController;
    v10->_updateController = (HKSampleTypeUpdateController *)v22;

    id v24 = objc_alloc(MEMORY[0x1E4F67A98]);
    v25 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v26 = [v24 initWithCalendar:v25];
    dateCache = v10->_dateCache;
    v10->_dateCache = (HKDateCache *)v26;

    v28 = [[UTCDateFormatter alloc] initWithDateCache:v10->_dateCache];
    utcDateFormatter = v10->_utcDateFormatter;
    v10->_utcDateFormatter = v28;

    v30 = (HKUCUMUnitDisplayConverter *)objc_alloc_init(MEMORY[0x1E4F2B610]);
    ucumDisplayConverter = v10->_ucumDisplayConverter;
    v10->_ucumDisplayConverter = v30;

    v32 = [[WDClinicalOnboardingManager alloc] initWithProfile:v10];
    onboardingManager = v10->_onboardingManager;
    v10->_onboardingManager = v32;

    v34 = [[HRHealthRecordsMigrator alloc] initWithHealthStore:v10->_healthStore];
    migrator = v10->_migrator;
    v10->_migrator = v34;

    _HKInitializeLogging();
    v36 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_1C21A1000, v36, OS_LOG_TYPE_INFO, "Health Records migration started.", v38, 2u);
    }
    [(HRHealthRecordsMigrator *)v10->_migrator migrateIfNeededWithCompletion:&__block_literal_global_6];
  }

  return v10;
}

void __51__HRProfile_initWithHealthStore_profileIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29F38];
  v4 = *MEMORY[0x1E4F29F38];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__HRProfile_initWithHealthStore_profileIdentifier___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C21A1000, v3, OS_LOG_TYPE_INFO, "Health Records migration completed successfully.", v5, 2u);
  }
}

- (unint64_t)hash
{
  id v2 = [(HRProfile *)self healthStore];
  v3 = [v2 profileIdentifier];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HRProfile *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HRProfile *)v4 healthStore];
      v6 = [v5 profileIdentifier];
      id v7 = [(HRProfile *)self healthStore];
      id v8 = [v7 profileIdentifier];
      char v9 = [v6 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)_initWithHealthStore:(id)a3
{
  return [(HRProfile *)self initWithHealthStore:a3 profileIdentifier:0];
}

+ (id)userProfileWithProfileIdentifier:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [HRProfile alloc];
  id v5 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
  v6 = [(HRProfile *)v4 initWithHealthStore:v5 profileIdentifier:v3];

  return v6;
}

- (HRWDUserActivityManager)userActivityManager
{
  return 0;
}

- (HKConceptStore)conceptStore
{
  id v2 = self;
  objc_sync_enter(v2);
  conceptStore = v2->_conceptStore;
  if (!conceptStore)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F2AE08]);
    id v5 = [(HRProfile *)v2 healthStore];
    uint64_t v6 = [v4 initWithHealthStore:v5];
    id v7 = v2->_conceptStore;
    v2->_conceptStore = (HKConceptStore *)v6;

    conceptStore = v2->_conceptStore;
  }
  id v8 = conceptStore;
  objc_sync_exit(v2);

  return v8;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKClinicalAccountStore)clinicalAccountStore
{
  return self->_clinicalAccountStore;
}

- (HKClinicalIngestionStore)ingestionStore
{
  return self->_ingestionStore;
}

- (HKUCUMUnitDisplayConverter)ucumDisplayConverter
{
  return self->_ucumDisplayConverter;
}

- (WDClinicalSourcesDataProvider)clinicalSourcesDataProvider
{
  return self->_clinicalSourcesDataProvider;
}

- (HKSampleTypeUpdateController)updateController
{
  return self->_updateController;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (UTCDateFormatter)utcDateFormatter
{
  return self->_utcDateFormatter;
}

- (WDClinicalSampleAccountsLoader)clinicalSampleAccountsLoader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clinicalSampleAccountsLoader);
  return (WDClinicalSampleAccountsLoader *)WeakRetained;
}

- (void)setClinicalSampleAccountsLoader:(id)a3
{
}

- (WDClinicalOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_destroyWeak((id *)&self->_clinicalSampleAccountsLoader);
  objc_storeStrong((id *)&self->_utcDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_clinicalSourcesDataProvider, 0);
  objc_storeStrong((id *)&self->_ucumDisplayConverter, 0);
  objc_storeStrong((id *)&self->_ingestionStore, 0);
  objc_storeStrong((id *)&self->_clinicalAccountStore, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_conceptStore, 0);
}

void __51__HRProfile_initWithHealthStore_profileIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_ERROR, "Health Records migration failed: %@.", (uint8_t *)&v2, 0xCu);
}

@end