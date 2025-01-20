@interface HDAppAnalyticsUpdateManager
- (BOOL)setAccepted:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 modificationDate:(id)a6 transaction:(id)a7 error:(id *)a8;
- (HDAppAnalyticsUpdateManager)init;
- (HDAppAnalyticsUpdateManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (int64_t)currentVersionForAgreement:(id)a3;
- (int64_t)currentVersionImproveHealthAgreement;
- (int64_t)currentVersionImproveHealthRecords;
- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4;
- (void)updateExternalStorageForAgreement:(id)a3 version:(int64_t)a4 accepted:(BOOL)a5;
@end

@implementation HDAppAnalyticsUpdateManager

- (HDAppAnalyticsUpdateManager)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDAppAnalyticsUpdateManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDAppAnalyticsUpdateManager;
  v5 = [(HDAppAnalyticsUpdateManager *)&v11 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_profile, v4);
    v8 = [v4 daemon];
    v9 = [v8 postInstallUpdateManager];
    [v9 registerUpdateTaskHandler:v6 queue:0];
  }
  return v6;
}

- (BOOL)setAccepted:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 modificationDate:(id)a6 transaction:(id)a7 error:(id *)a8
{
  BOOL v12 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v33 = 0;
  v17 = +[HDAppAnalyticsAcceptanceEntity acceptanceForAgreement:v14 version:a5 transaction:v16 error:&v33];
  id v18 = v33;
  v19 = v18;
  if (v17) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = v18 == 0;
  }
  if (!v20)
  {
    if (a8)
    {
      BOOL v26 = 0;
      *a8 = v18;
      goto LABEL_14;
    }
    _HKLogDroppedError();
LABEL_13:
    BOOL v26 = 0;
    goto LABEL_14;
  }
  v28 = self;
  v21 = [v17 modificationDate];
  [v21 timeIntervalSinceReferenceDate];
  double v23 = v22;
  [v15 timeIntervalSinceReferenceDate];
  double v25 = v24;

  if (v23 < v25)
  {
    if (!+[HDAppAnalyticsAcceptanceEntity setAcceptance:v12 agreement:v14 version:a5 modificationDate:v15 transaction:v16 error:a8])goto LABEL_13; {
    v29[0] = MEMORY[0x263EF8330];
    }
    v29[1] = 3221225472;
    v29[2] = __96__HDAppAnalyticsUpdateManager_setAccepted_agreement_version_modificationDate_transaction_error___block_invoke;
    v29[3] = &unk_265358B20;
    v29[4] = v28;
    id v30 = v14;
    int64_t v31 = a5;
    BOOL v32 = v12;
    [v16 onCommit:v29 orRollback:0];
  }
  BOOL v26 = 1;
LABEL_14:

  return v26;
}

uint64_t __96__HDAppAnalyticsUpdateManager_setAccepted_agreement_version_modificationDate_transaction_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateExternalStorageForAgreement:*(void *)(a1 + 40) version:*(void *)(a1 + 48) accepted:*(unsigned __int8 *)(a1 + 56)];
}

- (void)updateExternalStorageForAgreement:(id)a3 version:(int64_t)a4 accepted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([v8 isEqualToString:*MEMORY[0x263F429F8]])
  {
    if ([(HDAppAnalyticsUpdateManager *)self currentVersionImproveHealthAgreement] == a4)
    {
      v9 = [MEMORY[0x263F53C50] sharedConnection];
      [v9 setBoolValue:v5 forSetting:*MEMORY[0x263F53900]];
LABEL_10:
    }
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F42A00]])
  {
    if ([(HDAppAnalyticsUpdateManager *)self currentVersionImproveHealthRecords] == a4)
    {
      if (v5) {
        int64_t v10 = a4;
      }
      else {
        int64_t v10 = *MEMORY[0x263F09898];
      }
      v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v9 setInteger:v10 forKey:*MEMORY[0x263F0ADE0]];
      goto LABEL_10;
    }
  }
  else
  {
    _HKInitializeLogging();
    objc_super v11 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      -[HDAppAnalyticsUpdateManager updateExternalStorageForAgreement:version:accepted:]((uint64_t)v8, v11);
    }
  }
}

- (int64_t)currentVersionForAgreement:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F429F8]])
  {
    int64_t v5 = [(HDAppAnalyticsUpdateManager *)self currentVersionImproveHealthAgreement];
LABEL_5:
    int64_t v6 = v5;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F42A00]])
  {
    int64_t v5 = [(HDAppAnalyticsUpdateManager *)self currentVersionImproveHealthRecords];
    goto LABEL_5;
  }
  _HKInitializeLogging();
  id v7 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
    -[HDAppAnalyticsUpdateManager currentVersionForAgreement:]((uint64_t)v4, v7);
  }
  int64_t v6 = 0;
LABEL_9:

  return v6;
}

- (int64_t)currentVersionImproveHealthAgreement
{
  return MEMORY[0x270EF3680](@"com.apple.onboarding.improvehealth", @"ImproveHealth");
}

- (int64_t)currentVersionImproveHealthRecords
{
  return MEMORY[0x270EF3680](@"com.apple.onboarding.improvehealthrecords", @"ImproveHealthRecords");
}

- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4
{
  int64_t v5 = (void (**)(id, uint64_t, id))a4;
  int64_t v6 = [(HDAppAnalyticsUpdateManager *)self profile];
  id v7 = [v6 database];
  id v8 = [MEMORY[0x263F431E0] contextForReading];
  v11[4] = self;
  id v12 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__HDAppAnalyticsUpdateManager_performPostInstallUpdateTaskForManager_completion___block_invoke;
  v11[3] = &unk_265358B48;
  uint64_t v9 = [v7 performTransactionWithContext:v8 error:&v12 block:v11 inaccessibilityHandler:0];
  id v10 = v12;

  v5[2](v5, v9, v10);
}

uint64_t __81__HDAppAnalyticsUpdateManager_performPostInstallUpdateTaskForManager_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  AllHealthAppAnalyticsAgreements();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v20;
    *(void *)&long long v5 = 138543362;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "currentVersionForAgreement:", v9, v16);
        id v18 = 0;
        objc_super v11 = +[HDAppAnalyticsAcceptanceEntity acceptanceForAgreement:v9 version:v10 transaction:v3 error:&v18];
        id v12 = v18;
        v13 = v12;
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "updateExternalStorageForAgreement:version:accepted:", v9, v10, objc_msgSend(v11, "accepted"));
        }
        else if (v12)
        {
          _HKInitializeLogging();
          id v14 = *MEMORY[0x263F09968];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v24 = v9;
            _os_log_fault_impl(&dword_250D3F000, v14, OS_LOG_TYPE_FAULT, "Failed to retrieve stored version for %{public}@; not updating local state.",
              buf,
              0xCu);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  return 1;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)updateExternalStorageForAgreement:(uint64_t)a1 version:(NSObject *)a2 accepted:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_250D3F000, a2, OS_LOG_TYPE_ERROR, "No external storage known for analytics agreement %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)currentVersionForAgreement:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_250D3F000, a2, OS_LOG_TYPE_ERROR, "Unknown analytics agreement %{public}@", (uint8_t *)&v2, 0xCu);
}

@end