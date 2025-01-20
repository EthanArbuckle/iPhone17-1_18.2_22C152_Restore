@interface CRXFLiteHealthDataProvider
- (BOOL)isCloudSyncDisabledError:(id)a3;
- (CRXFLiteHealthDataProvider)initWithDeviceModel:(id)a3;
- (void)fetchHealthRecordsWithCompletion:(id)a3;
- (void)getSyncTimesWithCompletionQueue:(id)a3 completion:(id)a4;
@end

@implementation CRXFLiteHealthDataProvider

- (CRXFLiteHealthDataProvider)initWithDeviceModel:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRXFLiteHealthDataProvider;
  v5 = [(CRXFLiteHealthDataProvider *)&v20 init];
  if (v5)
  {
    os_log_t v6 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    uint64_t v8 = [v4 copy];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v8;

    v10 = (HKHealthStore *)objc_alloc_init(MEMORY[0x263F0A410]);
    healthStore = v5->_healthStore;
    v5->_healthStore = v10;

    uint64_t v12 = [MEMORY[0x263F0A6E8] visionPrescriptionType];
    sampleType = v5->_sampleType;
    v5->_sampleType = (HKSampleType *)v12;

    uint64_t v14 = [MEMORY[0x263F0A668] predicateForObjectsWithMetadataKey:*MEMORY[0x263F0AB88]];
    samplePredicate = v5->_samplePredicate;
    v5->_samplePredicate = (NSPredicate *)v14;

    v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:1];
    v21[0] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v17;
  }
  return v5;
}

- (void)fetchHealthRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F0A410] isHealthDataAvailable])
  {
    id v5 = objc_alloc(MEMORY[0x263F0A6E0]);
    sampleType = self->_sampleType;
    samplePredicate = self->_samplePredicate;
    sortDescriptors = self->_sortDescriptors;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __63__CRXFLiteHealthDataProvider_fetchHealthRecordsWithCompletion___block_invoke;
    v13 = &unk_2652E1F78;
    uint64_t v14 = self;
    id v15 = v4;
    v9 = (void *)[v5 initWithSampleType:sampleType predicate:samplePredicate limit:0 sortDescriptors:sortDescriptors resultsHandler:&v10];
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v9, v10, v11, v12, v13, v14);
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, MEMORY[0x263EFFA68], 0);
  }
}

void __63__CRXFLiteHealthDataProvider_fetchHealthRecordsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    id v21 = v9;
    id v22 = v7;
    v23 = [MEMORY[0x263EFF980] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      uint64_t v15 = *MEMORY[0x263F0ABA0];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            v19 = [v18 metadata];
            objc_super v20 = [v19 objectForKeyedSubscript:v15];

            if ([v20 isEqual:*(void *)(*(void *)(a1 + 32) + 16)]) {
              [v23 addObject:v18];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    id v7 = v22;
    uint64_t v10 = v21;
  }
  else if (!v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 1, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionLite/CRXFLiteHealthDataProvider.m", 86, MEMORY[0x263EFFA78]);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSyncTimesWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CRXUDispatchQueue main];
  if (v6)
  {
    uint64_t v9 = +[CRXUDispatchQueue dispatchQueueWithQueue:v6];

    id v8 = (void *)v9;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F0A1B0]) initWithHealthStore:self->_healthStore];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__CRXFLiteHealthDataProvider_getSyncTimesWithCompletionQueue_completion___block_invoke;
  v13[3] = &unk_2652E1FC8;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v8;
  [v10 fetchCloudSyncStatusWithCompletion:v13];
}

void __73__CRXFLiteHealthDataProvider_getSyncTimesWithCompletionQueue_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4, char a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (v10)
  {
    [v10 timeIntervalSinceReferenceDate];
    uint64_t v14 = v15;
  }
  if (v11)
  {
    [v11 timeIntervalSinceReferenceDate];
    uint64_t v13 = v16;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = __73__CRXFLiteHealthDataProvider_getSyncTimesWithCompletionQueue_completion___block_invoke_2;
  v21[3] = &unk_2652E1FA0;
  id v18 = (void *)a1[4];
  uint64_t v17 = a1[5];
  v19 = (void *)a1[6];
  id v22 = v12;
  uint64_t v23 = v17;
  id v24 = v19;
  uint64_t v25 = v14;
  uint64_t v26 = v13;
  char v27 = a5;
  id v20 = v12;
  [v18 dispatchAsync:v21];
}

void __73__CRXFLiteHealthDataProvider_getSyncTimesWithCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    id v5 = v2;
    if ([*(id *)(a1 + 40) isCloudSyncDisabledError:v2])
    {
      uint64_t v3 = objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 14, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionLite/CRXFLiteHealthDataProvider.m", 118, MEMORY[0x263EFFA78]);

      id v4 = (id)v3;
    }
    else
    {
      id v4 = v5;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v6 = v4;
  (*(void (**)(double, double))(*(void *)(a1 + 48) + 16))(*(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)isCloudSyncDisabledError:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "hk_isHealthKitErrorWithCode:", 701))
  {
    char v4 = 1;
  }
  else if (objc_msgSend(v3, "hk_isHealthKitErrorWithCode:", 100))
  {
    id v5 = [v3 description];
    char v4 = [v5 containsString:@"Code=701"];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_samplePredicate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end