@interface WDClinicalSampleAccountsLoader
+ (id)knownAccountFiles;
- (BOOL)_triggerIngestOfDataBatch:(id)a3 accountIdentifier:(id)a4 error:(id *)a5;
- (HRProfile)profile;
- (NSArray)accountDataBatches;
- (NSArray)cachedAccounts;
- (WDClinicalSampleAccountsLoader)initWithProfile:(id)a3;
- (id)_createTemporaryFileForDataBatch:(id)a3 error:(id *)a4;
- (id)_parseAccounts;
- (id)_sampleAccountForGatewayWithExternalID:(id)a3 error:(id *)a4;
- (id)providerForSampleDataSearchResultWithExternalID:(id)a3 error:(id *)a4;
- (id)sampleAccountsAsSearchResults;
- (void)_createAccountAndTriggerIngestForDataBatch:(id)a3 account:(id)a4 completion:(id)a5;
- (void)loadFirstSampleAccountDataBatchForGatewayWithExternalID:(id)a3 completion:(id)a4;
- (void)setAccountDataBatches:(id)a3;
- (void)setCachedAccounts:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation WDClinicalSampleAccountsLoader

- (WDClinicalSampleAccountsLoader)initWithProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalSampleAccountsLoader;
  v6 = [(WDClinicalSampleAccountsLoader *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profile, a3);
  }

  return v7;
}

- (void)loadFirstSampleAccountDataBatchForGatewayWithExternalID:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void, uint64_t))a4;
  id v12 = 0;
  v7 = [(WDClinicalSampleAccountsLoader *)self _sampleAccountForGatewayWithExternalID:a3 error:&v12];
  id v8 = v12;
  if (v7)
  {
    objc_super v9 = [v7 batches];
    v10 = [v9 firstObject];

    if (v10)
    {
      [(WDClinicalSampleAccountsLoader *)self _createAccountAndTriggerIngestForDataBatch:v10 account:v7 completion:v6];
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"There are no sample data batches for this account");

      v6[2](v6, 0, v11);
      id v8 = (id)v11;
    }
  }
  else
  {
    v6[2](v6, 0, (uint64_t)v8);
  }
}

- (id)_sampleAccountForGatewayWithExternalID:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(WDClinicalSampleAccountsLoader *)self cachedAccounts];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 provider];
        v13 = [v12 gateway];
        v14 = [v13 identifier];
        char v15 = [v5 isEqualToString:v14];

        if (v15)
        {
          id v16 = v11;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 3, @"No matching cached sample account found, please start over");
  id v16 = 0;
LABEL_11:

  return v16;
}

- (void)_createAccountAndTriggerIngestForDataBatch:(id)a3 account:(id)a4 completion:(id)a5
{
  id v31 = a3;
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F67710];
  id v10 = a4;
  id v11 = [v9 alloc];
  id v12 = [(HRProfile *)self->_profile healthStore];
  v38 = (void *)[v11 initWithHealthStore:v12];

  v37 = [v10 provider];
  v36 = [v37 gateway];
  v13 = [v36 title];
  v35 = [v10 provider];
  v34 = [v35 gateway];
  v33 = [v34 properties];
  v23 = [v33 objectForKeyedSubscript:@"subtitle"];
  v30 = [v10 provider];
  v29 = [v30 gateway];
  v26 = [v29 properties];
  long long v21 = [v26 objectForKeyedSubscript:@"description"];
  v25 = [v10 provider];
  uint64_t v24 = [v25 gateway];
  long long v22 = [v24 properties];
  v14 = [v22 objectForKeyedSubscript:@"country"];
  char v15 = [v10 provider];
  id v16 = [v15 gateway];
  v17 = [v16 FHIRVersion];
  v18 = [v10 provider];

  long long v19 = [v18 gateway];
  long long v20 = [v19 identifier];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __96__WDClinicalSampleAccountsLoader__createAccountAndTriggerIngestForDataBatch_account_completion___block_invoke;
  v39[3] = &unk_1E644AA08;
  v39[4] = self;
  id v40 = v31;
  id v41 = v8;
  id v32 = v31;
  id v28 = v8;
  [v38 createStaticAccountWithTitle:v13 subtitle:v23 description:v21 countryCode:v14 fhirVersion:v17 onlyIfNeededForSimulatedGatewayID:v20 completion:v39];
}

void __96__WDClinicalSampleAccountsLoader__createAccountAndTriggerIngestForDataBatch_account_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v11 = *(id *)(a1 + 48);
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

void __96__WDClinicalSampleAccountsLoader__createAccountAndTriggerIngestForDataBatch_account_completion___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = (void *)a1[6];
    uint64_t v4 = a1[7];
    id v5 = [v2 identifier];
    id v8 = 0;
    [v3 _triggerIngestOfDataBatch:v4 accountIdentifier:v5 error:&v8];
    id v6 = v8;

    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    id v7 = *(void (**)(void))(a1[8] + 16);
    v7();
  }
}

- (id)_createTemporaryFileForDataBatch:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28D90];
  long long v19 = @"resources";
  id v6 = [a3 resourceObjectsByResourceType];
  v20[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v8 = [v5 dataWithJSONObject:v7 options:0 error:a4];

  if (v8)
  {
    uint64_t v9 = NSString;
    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v10 UUIDString];
    id v12 = [v9 stringWithFormat:@"%@_SimulatorSampleData", v11];
    v13 = [v12 stringByAppendingPathExtension:@"json"];

    v14 = NSTemporaryDirectory();
    char v15 = [v14 stringByAppendingPathComponent:v13];

    id v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];
    if ([v8 writeToURL:v16 options:1 error:a4]) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)_triggerIngestOfDataBatch:(id)a3 accountIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(WDClinicalSampleAccountsLoader *)self _createTemporaryFileForDataBatch:a3 error:a5];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v9 error:a5];
    BOOL v11 = v10 != 0;
    if (v10)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F67730]);
      v13 = [(HRProfile *)self->_profile healthStore];
      v14 = (void *)[v12 initWithHealthStore:v13];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke;
      v16[3] = &unk_1E644AA30;
      v16[4] = self;
      id v17 = v9;
      [v14 ingestHealthRecordsWithFHIRDocumentHandle:v10 accountIdentifier:v8 options:0 completion:v16];
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (([v5 taskSuccess] & 1) == 0)
    {
      _HKInitializeLogging();
      id v7 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_3(a1, v7, v5);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_2(a1, (uint64_t)v6, v8);
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = 0;
  char v11 = [v9 removeItemAtURL:v10 error:&v14];
  id v12 = v14;

  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_1((uint64_t)v12, v13);
    }
  }
}

- (id)providerForSampleDataSearchResultWithExternalID:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(WDClinicalSampleAccountsLoader *)self cachedAccounts];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "provider", (void)v19);
        id v14 = [v13 identifier];
        char v15 = [v6 isEqualToString:v14];

        if (v15)
        {
          id v17 = [MEMORY[0x1E4F2ACE0] localDevelopmentSampleBrand];
          id v16 = [v12 asClinicalProviderWithBrand:v17];

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 3, @"No matching cached sample account found, please start over");
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)sampleAccountsAsSearchResults
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = [(WDClinicalSampleAccountsLoader *)self cachedAccounts];
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v2;
  uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v5 = objc_alloc(MEMORY[0x1E4F67750]);
        v27 = [v4 provider];
        id v28 = [v27 identifier];
        v26 = [MEMORY[0x1E4F29128] UUID];
        id v6 = [v26 UUIDString];
        v25 = [v4 provider];
        long long v20 = [v25 title];
        uint64_t v24 = [v4 provider];
        v23 = [v24 properties];
        v18 = [v23 objectForKeyedSubscript:@"subtitle"];
        long long v22 = [v4 provider];
        long long v21 = [v22 properties];
        id v7 = [v21 objectForKeyedSubscript:@"location"];
        uint64_t v8 = [v4 provider];
        uint64_t v9 = [v8 properties];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"country"];
        char v11 = [MEMORY[0x1E4F2ACE0] localDevelopmentSampleBrand];
        id v12 = [v4 provider];
        long long v19 = objc_msgSend(v5, "initWithExternalID:batchID:title:subtitle:location:supported:countryCode:brand:minCompatibleAPIVersion:", v28, v6, v20, v18, v7, 1, v10, v11, objc_msgSend(v12, "minCompatibleAPIVersion"));

        [v16 addObject:v19];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }

  return v16;
}

- (NSArray)cachedAccounts
{
  cachedAccounts = self->_cachedAccounts;
  if (!cachedAccounts)
  {
    uint64_t v4 = [(WDClinicalSampleAccountsLoader *)self _parseAccounts];
    [(WDClinicalSampleAccountsLoader *)self setCachedAccounts:v4];

    cachedAccounts = self->_cachedAccounts;
  }
  return cachedAccounts;
}

- (id)_parseAccounts
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(id)objc_opt_class() knownAccountFiles];
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v20;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v19 + 1) + 8 * v5);
        id v7 = objc_alloc_init(MEMORY[0x1E4F67768]);
        uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v9 = [v8 URLForResource:v6 withExtension:@"json"];
        id v18 = 0;
        uint64_t v10 = [v7 parseAccountsFromFile:v9 error:&v18];
        id v11 = v18;
        if (v10)
        {
          [v17 addObjectsFromArray:v10];
        }
        else
        {
          _HKInitializeLogging();
          id v12 = *MEMORY[0x1E4F29FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v24 = v11;
            _os_log_error_impl(&dword_1C21A1000, v12, OS_LOG_TYPE_ERROR, "Error parsing Simulator sample accounts: %{public}@", buf, 0xCu);
          }
        }

        if (!v10)
        {

          id v14 = (id)MEMORY[0x1E4F1CBF0];
          v13 = v17;
          goto LABEL_15;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  v13 = v17;
  id v14 = v17;
LABEL_15:

  return v14;
}

+ (id)knownAccountFiles
{
  return &unk_1F1DC21E0;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSArray)accountDataBatches
{
  return self->_accountDataBatches;
}

- (void)setAccountDataBatches:(id)a3
{
}

- (void)setCachedAccounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
  objc_storeStrong((id *)&self->_accountDataBatches, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

void __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_ERROR, "Failed to delete Simulator sample data: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "%{public}@ XPC error triggering ingestion for Simulator sample account: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  __int16 v6 = [a3 taskError];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1C21A1000, v5, OS_LOG_TYPE_ERROR, "%{public}@ error triggering ingestion for Simulator sample account: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end