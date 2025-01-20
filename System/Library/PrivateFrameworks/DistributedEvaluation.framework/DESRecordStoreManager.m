@interface DESRecordStoreManager
- (DESRecordStoreManager)init;
- (id)fetchRecordSetSynchronouslyForBundleId:(id)a3 error:(id *)a4;
- (id)recordDirURLsForBundleId:(id)a3;
- (id)saveRecordToDirPath:(id)a3 data:(id)a4 recordInfo:(id)a5 error:(id *)a6;
- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4;
- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5;
- (void)fetchCoreDuetEventsForBundleId:(id)a3 completion:(id)a4;
- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)fetchRecordSetForBundleId:(id)a3 completion:(id)a4;
- (void)fetchSavedRecordInfoForBundleId:(id)a3 completion:(id)a4;
- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4;
- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4;
- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6;
@end

@implementation DESRecordStoreManager

- (DESRecordStoreManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)DESRecordStoreManager;
  v2 = [(DESRecordStoreManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[DESRecordStorePolicyManager sharedInstance];
    policyManager = v2->_policyManager;
    v2->_policyManager = (DESRecordStorePolicyManager *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("DESRecordStoreManager", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    identifierStore = v2->_identifierStore;
    v2->_identifierStore = (DESDeviceIdentifierStore *)v8;
  }
  return v2;
}

- (void)fetchCoreDuetEventsForBundleId:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DESRecordStorePolicyManager *)self->_policyManager coreDuetEventQueryForPluginID:v6];
  if (v8)
  {
    v9 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_1BECCB000, v9, OS_LOG_TYPE_INFO, "Running CoreDuet event query %@ for %@", buf, 0x16u);
    }

    v10 = [MEMORY[0x1E4F5B560] knowledgeStore];
    objc_super v11 = +[DESLogging coreChannel];
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    v13 = +[DESLogging coreChannel];
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BECCB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchCoreDuetEvents", "Fetching CoreDuet events.", buf, 2u);
    }

    v15 = objc_opt_new();
    v16 = [v15 identifierForBundleId:v6];

    queue = self->_queue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__DESRecordStoreManager_fetchCoreDuetEventsForBundleId_completion___block_invoke;
    v20[3] = &unk_1E63C1B70;
    os_signpost_id_t v24 = v12;
    id v21 = v10;
    id v22 = v16;
    id v23 = v7;
    id v18 = v16;
    id v19 = v10;
    [v19 executeQuery:v8 responseQueue:queue withCompletion:v20];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __67__DESRecordStoreManager_fetchCoreDuetEventsForBundleId_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v8;
    _os_log_impl(&dword_1BECCB000, v7, OS_LOG_TYPE_INFO, "Got response from %@", buf, 0xCu);
  }

  v9 = +[DESLogging coreChannel];
  v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BECCB000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchCoreDuetEvents", "Finished fetching CoreDuet events.", buf, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_signpost_id_t v12 = a1;
    id v24 = v6;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v25 = v5;
    id obj = v5;
    uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v19 = [v18 metadata];
          v20 = [v18 stream];
          id v21 = [v20 name];
          id v22 = DESAmendedRecordInfo(v19, v21, (void *)v12[5]);
          [v18 setMetadata:v22];

          [v13 addObject:v18];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }

    (*(void (**)(void))(v12[6] + 16))();
    id v6 = v24;
    id v5 = v25;
  }
  else
  {
    id v23 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __67__DESRecordStoreManager_fetchCoreDuetEventsForBundleId_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)fetchRecordSetForBundleId:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1BECCB000, v8, OS_LOG_TYPE_INFO, "Fetching records for %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__DESRecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke;
  v11[3] = &unk_1E63C1B98;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(DESRecordStoreManager *)self fetchSavedRecordInfoForBundleId:v10 completion:v11];
}

void __62__DESRecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = [[DESRecordSet alloc] initWithNativeRecords:v9 nativeRecordInfo:v10 coreDuetEvents:v11];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v14 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_impl(&dword_1BECCB000, v14, OS_LOG_TYPE_INFO, "Fail to fetch records for %@", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)fetchRecordSetSynchronouslyForBundleId:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __70__DESRecordStoreManager_fetchRecordSetSynchronouslyForBundleId_error___block_invoke;
  id v22 = &unk_1E63C1BC0;
  id v25 = &v27;
  id v8 = v6;
  id v23 = v8;
  v26 = &v33;
  id v9 = v7;
  id v24 = v9;
  [(DESRecordStoreManager *)self fetchRecordSetForBundleId:v8 completion:&v19];
  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    id v12 = [NSString stringWithFormat:@"Timeout while fetching DES records for %@", v8, v19, v20, v21, v22, v23];
    v40[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v14 = [v11 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1531 userInfo:v13];
    uint64_t v15 = (void *)v28[5];
    v28[5] = v14;
  }
  if (a4)
  {
    int v16 = (void *)v28[5];
    if (v16) {
      *a4 = v16;
    }
  }
  id v17 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __70__DESRecordStoreManager_fetchRecordSetSynchronouslyForBundleId_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1C189B250]();
  if (v6)
  {
    id v9 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __70__DESRecordStoreManager_fetchRecordSetSynchronouslyForBundleId_error___block_invoke_cold_1(v6, a1, v9);
    }

    dispatch_time_t v10 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v11 = a2;
  }
  else
  {
    dispatch_time_t v10 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v11 = a3;
  }
  objc_storeStrong(v10, v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)fetchSavedRecordInfoForBundleId:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v25 = self;
  id v8 = [(DESRecordStorePolicyManager *)self->_policyManager supportedRecordTypesForPluginID:v6];
  id v9 = objc_opt_new();
  v26 = v6;
  dispatch_time_t v10 = [v9 identifierForBundleId:v6];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v34;
    do
    {
      uint64_t v16 = 0;
      id v17 = v14;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
        id v32 = v17;
        uint64_t v19 = AddRecordsForType(v18, v7, v10, &v32);
        id v14 = v32;

        if (v19)
        {
          [v27 setObject:v19 forKey:v18];
        }
        else
        {
          uint64_t v20 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v38 = v18;
            __int16 v39 = 2112;
            id v40 = v14;
            _os_log_error_impl(&dword_1BECCB000, v20, OS_LOG_TYPE_ERROR, "Could not read records for %@: %@", buf, 0x16u);
          }
        }
        ++v16;
        id v17 = v14;
      }
      while (v13 != v16);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __68__DESRecordStoreManager_fetchSavedRecordInfoForBundleId_completion___block_invoke;
  v28[3] = &unk_1E63C1BE8;
  id v30 = v7;
  id v31 = v24;
  id v29 = v27;
  id v21 = v7;
  id v22 = v27;
  id v23 = v24;
  [(DESRecordStoreManager *)v25 fetchCoreDuetEventsForBundleId:v26 completion:v28];
}

uint64_t __68__DESRecordStoreManager_fetchSavedRecordInfoForBundleId_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2, a3);
}

- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4
{
  identifierStore = self->_identifierStore;
  id v6 = (void (**)(id, void, id))a4;
  id v7 = a3;
  id v8 = [(DESDeviceIdentifierStore *)identifierStore identifierForBundleId:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = 0;
  dispatch_time_t v10 = AddRecordsForType(v7, v9, v8, &v13);

  id v11 = v13;
  if (v10) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }
  ((void (**)(id, id, id))v6)[2](v6, v12, v11);
}

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void *, void))a5;
  id v11 = 0;
  id v8 = RecordDataForUUID(a4, a3, (uint64_t)&v11);
  id v9 = v11;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else
  {
    dispatch_time_t v10 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_1BECCB000, v10, OS_LOG_TYPE_INFO, "Unable to read record: %@", buf, 0xCu);
    }

    ((void (**)(id, void *, id))v7)[2](v7, 0, v9);
  }
}

- (id)saveRecordToDirPath:(id)a3 data:(id)a4 recordInfo:(id)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v13 = 0;
  if ([v12 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:a6])
  {
    if ([MEMORY[0x1E4F28D90] isValidJSONObject:v11])
    {
      uint64_t v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v11 options:0 error:a6];
      if (v14)
      {
        uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v16 = [v15 UUIDString];
        id v17 = [v9 stringByAppendingPathComponent:v16];
        uint64_t v18 = [v17 stringByAppendingPathExtension:@"desdata"];

        if ([v10 writeToFile:v18 options:0x40000000 error:a6])
        {
          long long v28 = v18;
          uint64_t v19 = [v15 UUIDString];
          uint64_t v20 = [v9 stringByAppendingPathComponent:v19];
          uint64_t v21 = [v20 stringByAppendingPathExtension:@"json"];

          id v29 = (void *)v21;
          if ([v14 writeToFile:v21 options:0x40000000 error:a6])
          {
            id v13 = v15;
            uint64_t v18 = v28;
          }
          else
          {
            id v30 = 0;
            uint64_t v18 = v28;
            char v24 = objc_msgSend(v12, "_fides_removeItemAtPath:error:", v28, &v30);
            id v25 = v30;
            if ((v24 & 1) == 0)
            {
              v26 = +[DESLogging coreChannel];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                -[DESRecordStoreManager saveRecordToDirPath:data:recordInfo:error:]();
              }
            }
            id v13 = 0;
          }
        }
        else
        {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v22 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[DESRecordStoreManager saveRecordToDirPath:data:recordInfo:error:]();
      }

      if (!a6)
      {
        id v13 = 0;
        goto LABEL_22;
      }
      id v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32[0] = @"Record info cannot be converted to JSON";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      [v23 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1506 userInfo:v14];
      id v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_22:

  return v13;
}

- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, id))a6;
  if (v10 && v11 && v12)
  {
    uint64_t v14 = RecordDirPathForRecordType(v10);
    uint64_t v15 = +[DESLogging coreChannel];
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    id v17 = +[DESLogging coreChannel];
    uint64_t v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BECCB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "RecordSaving", "Saving Record.", buf, 2u);
    }

    id v26 = 0;
    uint64_t v19 = [(DESRecordStoreManager *)self saveRecordToDirPath:v14 data:v11 recordInfo:v12 error:&v26];
    id v20 = v26;
    uint64_t v21 = +[DESLogging coreChannel];
    id v22 = v21;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BECCB000, v22, OS_SIGNPOST_INTERVAL_END, v16, "RecordSaving", "Finished saving record.", buf, 2u);
    }

    if (v19)
    {
      +[DESCoreAnalyticsEventManager sendEventWriteRecordForBundleID:v10];
      v13[2](v13, v19, v20);
      GarbageCollectOldRecords(v10);
    }
    else
    {
      id v25 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[DESRecordStoreManager saveRecordForBundleId:data:recordInfo:completion:]();
      }

      v13[2](v13, 0, v20);
    }
  }
  else
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F281F8];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"invalid arguments passed to service; programmer error!";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v20 = [v23 errorWithDomain:v24 code:3328 userInfo:v14];
    v13[2](v13, 0, v20);
  }
}

- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = (void (**)(id, void *))a4;
  id v6 = +[DESLogging coreChannel];
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = +[DESLogging coreChannel];
  id v9 = v8;
  unint64_t v28 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BECCB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeleteAllRecords", "Deleting all records.", buf, 2u);
  }
  os_signpost_id_t spid = v7;

  id v30 = v5;
  uint64_t v10 = RecordDirPathForRecordType(v5);
  id v31 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v32 = (void *)v10;
  id v11 = [v31 enumeratorAtPath:v10];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v11, "skipDescendants", spid);
        uint64_t v18 = [v17 pathExtension];
        if (([v18 isEqualToString:@"json"] & 1) != 0
          || [v18 isEqualToString:@"desdata"])
        {
          uint64_t v19 = [v32 stringByAppendingPathComponent:v17];
          id v33 = 0;
          char v20 = objc_msgSend(v31, "_fides_removeItemAtPath:error:", v19, &v33);
          id v21 = v33;

          if ((v20 & 1) == 0)
          {
            id v22 = v21;

            id v23 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v39 = v17;
              __int16 v40 = 2112;
              id v41 = v22;
              _os_log_error_impl(&dword_1BECCB000, v23, OS_LOG_TYPE_ERROR, "Could not delete %@: %@", buf, 0x16u);
            }

            uint64_t v14 = v22;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v24 = +[DESLogging coreChannel];
  id v25 = v24;
  if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BECCB000, v25, OS_SIGNPOST_INTERVAL_END, spida, "DeleteAllRecords", "Finished deleting all records.", buf, 2u);
  }

  v29[2](v29, v14);
}

- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5
{
  os_signpost_id_t v7 = (void (**)(id, void))a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[DESLogging coreChannel];
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = +[DESLogging coreChannel];
  uint64_t v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BECCB000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "DeleteRecord", "Deleting record.", buf, 2u);
  }
  os_signpost_id_t spid = v11;

  uint64_t v15 = RecordDirPathForRecordType(v9);

  id v16 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v17 = [v8 UUIDString];

  uint64_t v18 = [v15 stringByAppendingPathComponent:v17];

  uint64_t v19 = [v18 stringByAppendingPathExtension:@"json"];
  id v31 = 0;
  int v20 = objc_msgSend(v16, "_fides_removeItemAtPath:error:", v19, &v31);
  id v21 = v31;

  id v22 = [v18 stringByAppendingPathExtension:@"desdata"];
  id v30 = 0;
  int v23 = objc_msgSend(v16, "_fides_removeItemAtPath:error:", v22, &v30);
  id v24 = v30;

  id v25 = +[DESLogging coreChannel];
  id v26 = v25;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BECCB000, v26, OS_SIGNPOST_INTERVAL_END, spid, "DeleteRecord", "Finished deleting record.", buf, 2u);
  }

  if (v23) {
    id v27 = 0;
  }
  else {
    id v27 = v24;
  }
  if (v20) {
    id v28 = v27;
  }
  else {
    id v28 = v21;
  }
  ((void (**)(id, id))v7)[2](v7, v28);
}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[DESLogging coreChannel];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = +[DESLogging coreChannel];
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BECCB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SaveCoreDuetEvent", "Saving core duet event.", buf, 2u);
  }

  uint64_t v12 = [MEMORY[0x1E4F5B560] knowledgeStore];
  v20[0] = v6;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__DESRecordStoreManager_saveCoreDuetEvent_completion___block_invoke;
  v16[3] = &unk_1E63C1C10;
  id v17 = v7;
  os_signpost_id_t v18 = v9;
  id v15 = v7;
  [v12 saveObjects:v13 responseQueue:queue withCompletion:v16];
}

void __54__DESRecordStoreManager_saveCoreDuetEvent_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[DESLogging coreChannel];
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BECCB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SaveCoreDuetEvent", "Finished saving core duet event.", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)recordDirURLsForBundleId:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(DESRecordStorePolicyManager *)self->_policyManager supportedRecordTypesForPluginID:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        os_signpost_id_t v11 = RecordDirURLForRecordType(*(void **)(*((void *)&v13 + 1) + 8 * i));
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_policyManager, 0);
}

void __67__DESRecordStoreManager_fetchCoreDuetEventsForBundleId_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "Failed to fetch CoreDuet events %@", v2, v3, v4, v5, v6);
}

void __70__DESRecordStoreManager_fetchRecordSetSynchronouslyForBundleId_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_1BECCB000, a3, OS_LOG_TYPE_DEBUG, "Fetch %lu DES records for %@", v5, 0x16u);
}

- (void)saveRecordToDirPath:data:recordInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "Unable to delete failed record data: %@", v2, v3, v4, v5, v6);
}

- (void)saveRecordToDirPath:data:recordInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "Record info cannot be converted to JSON: %@", v2, v3, v4, v5, v6);
}

- (void)saveRecordForBundleId:data:recordInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Fail to saveRecordForBundleId with bundleId=%@, error=%@");
}

@end