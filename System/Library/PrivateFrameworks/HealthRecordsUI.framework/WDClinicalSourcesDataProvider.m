@interface WDClinicalSourcesDataProvider
+ (id)_logoCompletionOnMainQueue:(id)a3 cancellationToken:(id)a4;
+ (id)_objectCompletionOnMainQueue:(id)a3 cancellationToken:(id)a4;
- (HKClinicalAccountStore)clinicalAccountStore;
- (HKHealthRecordsStore)healthRecordsStore;
- (HKHealthStore)healthStore;
- (WDClinicalSourcesDataProvider)init;
- (WDClinicalSourcesDataProvider)initWithHealthRecordsStore:(id)a3;
- (id)_fetchLogoForBrand:(id)a3 fallback:(id)a4 size:(double)a5 options:(unint64_t)a6 completion:(id)a7;
- (id)_logoForFallback:(id)a3 size:(double)a4;
- (id)_orderAccountsForDisplay:(id)a3;
- (id)appSourceRequestingAuthorizationForClinicalTypeWithBundleIdentifier:(id)a3;
- (id)fetchAccessedAccountsForDisplayWithCompletion:(id)a3;
- (id)fetchAccountsForDisplayWithCompletion:(id)a3;
- (id)fetchLogoForBrand:(id)a3 fallback:(id)a4 size:(double)a5 completion:(id)a6;
- (id)formattedFullName:(id)a3 birthDate:(id)a4 useMultipleLines:(BOOL)a5;
- (id)nameAndFormattedBirthDateForAccountOwner:(id)a3;
- (id)nameAndFormattedBirthDateForAccountOwner:(id)a3 useMultipleLines:(BOOL)a4;
- (id)nameAndFormattedBirthDateForSignedClinicalDataSubject:(id)a3;
- (id)nameAndFormattedBirthDateForSignedClinicalDataSubject:(id)a3 useMultipleLines:(BOOL)a4;
- (id)sourcesRequestingAuthorizationForClinicalTypes;
- (void)_fetchAccountsForDisplayWithCompletion:(id)a3;
- (void)beginInitialLoginSessionForGateway:(id)a3 fromViewController:(id)a4 loginCancelledHandler:(id)a5 errorHandler:(id)a6;
- (void)beginReloginSessionForAccount:(id)a3 fromViewController:(id)a4 profile:(id)a5 loginCancelledHandler:(id)a6 errorHandler:(id)a7;
- (void)fetchAccountOwnerForSource:(id)a3 completion:(id)a4;
- (void)fetchSignedClinicalDataRecordWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation WDClinicalSourcesDataProvider

- (WDClinicalSourcesDataProvider)initWithHealthRecordsStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDClinicalSourcesDataProvider;
  v6 = [(WDClinicalSourcesDataProvider *)&v12 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F67710]);
    v8 = [v5 healthStore];
    uint64_t v9 = [v7 initWithHealthStore:v8];
    clinicalAccountStore = v6->_clinicalAccountStore;
    v6->_clinicalAccountStore = (HKClinicalAccountStore *)v9;

    objc_storeStrong((id *)&v6->_healthRecordsStore, a3);
  }

  return v6;
}

- (WDClinicalSourcesDataProvider)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)_fetchAccountsForDisplayWithCompletion:(id)a3
{
  id v4 = a3;
  clinicalAccountStore = self->_clinicalAccountStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke;
  v7[3] = &unk_1E644AC20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKClinicalAccountStore *)clinicalAccountStore fetchAllAccountsWithCompletion:v7];
}

void __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  v15 = [*(id *)(a1 + 32) _orderAccountsForDisplay:v5];
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

- (id)fetchAccountsForDisplayWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(WDCancellationToken);
  id v6 = [(id)objc_opt_class() _objectCompletionOnMainQueue:v4 cancellationToken:v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__WDClinicalSourcesDataProvider_fetchAccountsForDisplayWithCompletion___block_invoke;
  v9[3] = &unk_1E644AC48;
  id v10 = v6;
  id v7 = v6;
  [(WDClinicalSourcesDataProvider *)self _fetchAccountsForDisplayWithCompletion:v9];

  return v5;
}

uint64_t __71__WDClinicalSourcesDataProvider_fetchAccountsForDisplayWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchAccessedAccountsForDisplayWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(WDCancellationToken);
  id v6 = [(id)objc_opt_class() _objectCompletionOnMainQueue:v4 cancellationToken:v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__WDClinicalSourcesDataProvider_fetchAccessedAccountsForDisplayWithCompletion___block_invoke;
  v9[3] = &unk_1E644AC48;
  id v10 = v6;
  id v7 = v6;
  [(WDClinicalSourcesDataProvider *)self _fetchAccountsForDisplayWithCompletion:v9];

  return v5;
}

void __79__WDClinicalSourcesDataProvider_fetchAccessedAccountsForDisplayWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "hk_filter:", &__block_literal_global_1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __79__WDClinicalSourcesDataProvider_fetchAccessedAccountsForDisplayWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 lastFetchDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)fetchLogoForBrand:(id)a3 fallback:(id)a4 size:(double)a5 completion:(id)a6
{
  return [(WDClinicalSourcesDataProvider *)self _fetchLogoForBrand:a3 fallback:a4 size:0 options:a6 completion:a5];
}

- (id)_fetchLogoForBrand:(id)a3 fallback:(id)a4 size:(double)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = objc_alloc_init(WDCancellationToken);
  v16 = [(id)objc_opt_class() _logoCompletionOnMainQueue:v14 cancellationToken:v15];

  if (v12)
  {
    v17 = [(WDClinicalSourcesDataProvider *)self healthRecordsStore];
    v18 = objc_msgSend(v17, "hk_brandImageManager");
    v29 = v15;
    unint64_t v19 = a6;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke_2;
    v30[3] = &unk_1E644AC98;
    v20 = (id *)v31;
    id v21 = v12;
    v31[0] = v21;
    v31[1] = self;
    v22 = &v32;
    double v34 = a5;
    id v32 = v13;
    id v33 = v16;
    id v23 = v16;
    id v24 = v13;
    unint64_t v25 = v19;
    v15 = v29;
    [v18 retrieveLogoForBrand:v21 size:v25 options:v30 completion:a5];
  }
  else
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke;
    v38 = &unk_1E644AC70;
    v20 = (id *)v41;
    id v40 = v13;
    v41[0] = v16;
    v22 = &v40;
    v39 = self;
    *(double *)&v41[1] = a5;
    id v26 = v16;
    id v27 = v13;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }

  return v15;
}

void __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _logoForFallback:*(void *)(a1 + 40) size:*(double *)(a1 + 56)];
  (*(void (**)(uint64_t, id, uint64_t))(v1 + 16))(v1, v2, 1);
}

void __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = v5;
  if (!v5)
  {
    if ([v6 code] != 608)
    {
      _HKInitializeLogging();
      uint64_t v9 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke_2_cold_1(a1, v9);
      }
    }
    uint64_t v8 = [*(id *)(a1 + 40) _logoForFallback:*(void *)(a1 + 48) size:*(double *)(a1 + 64)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_logoForFallback:(id)a3 size:(double)a4
{
  id v5 = a3;
  id v6 = [[HRMonogrammer alloc] initWithDiameter:a4];
  id v7 = [(HRMonogrammer *)v6 monogramForFirstWordFromText:v5];

  return v7;
}

- (void)fetchAccountOwnerForSource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F2B3C0] predicateForObjectsFromSource:a3];
  id v8 = objc_alloc(MEMORY[0x1E4F2B440]);
  uint64_t v9 = [MEMORY[0x1E4F2AB88] accountOwnerType];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__WDClinicalSourcesDataProvider_fetchAccountOwnerForSource_completion___block_invoke;
  v14[3] = &unk_1E644ACC0;
  id v15 = v6;
  id v10 = v6;
  uint64_t v11 = (void *)[v8 initWithSampleType:v9 predicate:v7 limit:0 sortDescriptors:0 resultsHandler:v14];

  id v12 = [(WDClinicalSourcesDataProvider *)self healthRecordsStore];
  id v13 = [v12 healthStore];
  [v13 executeQuery:v11];
}

void __71__WDClinicalSourcesDataProvider_fetchAccountOwnerForSource_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)nameAndFormattedBirthDateForAccountOwner:(id)a3
{
  return [(WDClinicalSourcesDataProvider *)self nameAndFormattedBirthDateForAccountOwner:a3 useMultipleLines:0];
}

- (id)nameAndFormattedBirthDateForAccountOwner:(id)a3 useMultipleLines:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 name];
  id v8 = [v6 birthDate];

  uint64_t v9 = [(WDClinicalSourcesDataProvider *)self formattedFullName:v7 birthDate:v8 useMultipleLines:v4];

  return v9;
}

- (id)formattedFullName:(id)a3 birthDate:(id)a4 useMultipleLines:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = v7;
  uint64_t v9 = v7;
  if (v7)
  {
    uint64_t v9 = v7;
    if (a4)
    {
      id v10 = a4;
      uint64_t v11 = [v10 displayString];
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
      uint64_t v13 = [v10 dateForUTC];

      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      id v15 = [v12 components:4 fromDate:v13 toDate:v14 options:0];

      v16 = HKIntegerFormatter();
      v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "year"));
      v18 = [v16 stringFromNumber:v17];

      unint64_t v19 = NSString;
      v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v21 = [v20 localizedStringForKey:@"date_and_age_%@_%@" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable"];
      v22 = objc_msgSend(v19, "stringWithFormat:", v21, v11, v18);

      if (v5) {
        id v23 = @"\n%@";
      }
      else {
        id v23 = @", %@";
      }
      uint64_t v9 = objc_msgSend(v8, "stringByAppendingFormat:", v23, v22);
    }
  }

  return v9;
}

- (id)nameAndFormattedBirthDateForSignedClinicalDataSubject:(id)a3
{
  return [(WDClinicalSourcesDataProvider *)self nameAndFormattedBirthDateForSignedClinicalDataSubject:a3 useMultipleLines:0];
}

- (id)nameAndFormattedBirthDateForSignedClinicalDataSubject:(id)a3 useMultipleLines:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 fullName];
  id v8 = [v6 birthDate];

  uint64_t v9 = [(WDClinicalSourcesDataProvider *)self formattedFullName:v7 birthDate:v8 useMultipleLines:v4];

  return v9;
}

- (void)beginInitialLoginSessionForGateway:(id)a3 fromViewController:(id)a4 loginCancelledHandler:(id)a5 errorHandler:(id)a6
{
  id v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [HRUIClinicalAccountLoginSession alloc];
  clinicalAccountStore = self->_clinicalAccountStore;
  v16 = objc_msgSend(v12, "hk_window");

  v17 = [(HRUIClinicalAccountLoginSession *)v14 initWithAccountStore:clinicalAccountStore presentationAnchor:v16 funnelContext:0];
  id v19 = 0;
  LOBYTE(clinicalAccountStore) = [(HRUIClinicalAccountLoginSession *)v17 startLoginWithGateway:v13 loginCancelledHandler:v11 callbackErrorHandler:v10 error:&v19];

  id v18 = v19;
  if ((clinicalAccountStore & 1) == 0) {
    v10[2](v10, v18);
  }
}

- (void)beginReloginSessionForAccount:(id)a3 fromViewController:(id)a4 profile:(id)a5 loginCancelledHandler:(id)a6 errorHandler:(id)a7
{
  id v12 = (void (**)(id, id))a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [HRUIClinicalAccountLoginSession alloc];
  clinicalAccountStore = self->_clinicalAccountStore;
  id v19 = objc_msgSend(v15, "hk_window");
  v20 = [(HRUIClinicalAccountLoginSession *)v17 initWithAccountStore:clinicalAccountStore presentationAnchor:v19 funnelContext:0];

  id v22 = 0;
  LOBYTE(clinicalAccountStore) = [(HRUIClinicalAccountLoginSession *)v20 startReloginToAccount:v16 viewController:v15 profile:v14 loginCancelledHandler:v13 callbackErrorHandler:v12 error:&v22];

  id v21 = v22;
  if ((clinicalAccountStore & 1) == 0) {
    v12[2](v12, v21);
  }
}

- (id)appSourceRequestingAuthorizationForClinicalTypeWithBundleIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(WDClinicalSourcesDataProvider *)self sourcesRequestingAuthorizationForClinicalTypes];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v5, "allSources", 0);
  id v7 = (void *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 source];
        id v12 = [v11 bundleIdentifier];
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v7 = [v10 source];
          goto LABEL_11;
        }
      }
      id v7 = (void *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)sourcesRequestingAuthorizationForClinicalTypes
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [MEMORY[0x1E4F2AD10] allTypes];
  BOOL v5 = (void *)[v3 initWithArray:v4];

  id v6 = [(WDClinicalSourcesDataProvider *)self healthStore];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F2AC68]) initWithHealthStore:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__WDClinicalSourcesDataProvider_sourcesRequestingAuthorizationForClinicalTypes__block_invoke;
  v12[3] = &unk_1E644ACE8;
  id v14 = &v15;
  uint64_t v9 = v7;
  char v13 = v9;
  [v8 fetchSourcesRequestingAuthorizationForTypes:v5 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __79__WDClinicalSourcesDataProvider_sourcesRequestingAuthorizationForClinicalTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F67C48]);
    uint64_t v8 = [v5 allObjects];
    uint64_t v9 = [v7 initWithSources:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __79__WDClinicalSourcesDataProvider_sourcesRequestingAuthorizationForClinicalTypes__block_invoke_cold_1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchSignedClinicalDataRecordWithIdentifier:(id)a3 completion:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F2B518] signedClinicalDataRecordType];
  uint64_t v9 = [MEMORY[0x1E4F2B3C0] predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:v6];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F2B3D0]) initWithSampleType:v8 predicate:v9];
  id v11 = objc_alloc(MEMORY[0x1E4F2B440]);
  v20[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__WDClinicalSourcesDataProvider_fetchSignedClinicalDataRecordWithIdentifier_completion___block_invoke;
  v17[3] = &unk_1E644AD10;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  uint64_t v15 = (void *)[v11 initWithQueryDescriptors:v12 limit:1 resultsHandler:v17];

  uint64_t v16 = [(WDClinicalSourcesDataProvider *)self healthStore];
  [v16 executeQuery:v15];
}

void __88__WDClinicalSourcesDataProvider_fetchSignedClinicalDataRecordWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      __88__WDClinicalSourcesDataProvider_fetchSignedClinicalDataRecordWithIdentifier_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = [a3 firstObject];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (id)_logoCompletionOnMainQueue:(id)a3 cancellationToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__WDClinicalSourcesDataProvider__logoCompletionOnMainQueue_cancellationToken___block_invoke;
  v11[3] = &unk_1E644AD60;
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = _Block_copy(v11);

  return v9;
}

void __78__WDClinicalSourcesDataProvider__logoCompletionOnMainQueue_cancellationToken___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__WDClinicalSourcesDataProvider__logoCompletionOnMainQueue_cancellationToken___block_invoke_2;
  v8[3] = &unk_1E644AD38;
  id v9 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  char v12 = a3;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __78__WDClinicalSourcesDataProvider__logoCompletionOnMainQueue_cancellationToken___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

+ (id)_objectCompletionOnMainQueue:(id)a3 cancellationToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__WDClinicalSourcesDataProvider__objectCompletionOnMainQueue_cancellationToken___block_invoke;
  v11[3] = &unk_1E644ADB0;
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = _Block_copy(v11);

  return v9;
}

void __80__WDClinicalSourcesDataProvider__objectCompletionOnMainQueue_cancellationToken___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__WDClinicalSourcesDataProvider__objectCompletionOnMainQueue_cancellationToken___block_invoke_2;
  block[3] = &unk_1E644AD88;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__WDClinicalSourcesDataProvider__objectCompletionOnMainQueue_cancellationToken___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

- (id)_orderAccountsForDisplay:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F29008];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithKey:@"title" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"subtitle" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v10[0] = v5;
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v4 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (HKHealthStore)healthStore
{
  id v2 = [(WDClinicalSourcesDataProvider *)self healthRecordsStore];
  id v3 = [v2 healthStore];

  return (HKHealthStore *)v3;
}

- (HKClinicalAccountStore)clinicalAccountStore
{
  return self->_clinicalAccountStore;
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_clinicalAccountStore, 0);
}

void __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 externalID];
  id v5 = HKSensitiveLogItem();
  id v6 = HKSensitiveLogItem();
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1C21A1000, v3, OS_LOG_TYPE_ERROR, "Unable to fetch image for brand %@: %{public}@", (uint8_t *)&v7, 0x16u);
}

void __79__WDClinicalSourcesDataProvider_sourcesRequestingAuthorizationForClinicalTypes__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __88__WDClinicalSourcesDataProvider_fetchSignedClinicalDataRecordWithIdentifier_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find HKSignedClinicalDataRecord with identifier %@, error: %@", (uint8_t *)&v5, 0x20u);
}

@end