@interface EDSearchableIndexVerifier
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
- (EDSearchableIndexVerifier)initWithDataSource:(id)a3;
- (EDSearchableIndexVerifierDataSource)dataSource;
- (OS_os_activity)indexVerificationActivity;
- (id)_missingTransactionIDsFromTransactionIDs:(id)a3;
- (id)_verifyDataSamples:(id)a3;
- (id)_verifyDataSamples:(id)a3 usingTester:(id)a4;
- (id)_verifySamples:(id)a3;
- (unint64_t)_findMissingTransactionIDs:(id)a3 dataSource:(id)a4;
- (unint64_t)signpostID;
- (void)_addFailingSamples:(id)a3 toResultDictionary:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setIndexVerificationActivity:(id)a3;
- (void)verifyDataSamplesWithCompletionHandler:(id)a3 scheduler:(id)a4;
@end

@implementation EDSearchableIndexVerifier

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__EDSearchableIndexVerifier_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_86 != -1) {
    dispatch_once(&log_onceToken_86, block);
  }
  v2 = (void *)log_log_86;

  return (OS_os_log *)v2;
}

void __32__EDSearchableIndexVerifier_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_86;
  log_log_86 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EDSearchableIndexVerifier_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_9 != -1) {
    dispatch_once(&signpostLog_onceToken_9, block);
  }
  v2 = (void *)signpostLog_log_9;

  return (OS_os_log *)v2;
}

void __40__EDSearchableIndexVerifier_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_9;
  signpostLog_log_9 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDSearchableIndexVerifier)initWithDataSource:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDSearchableIndexVerifier;
  v5 = [(EDSearchableIndexVerifier *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    os_activity_t v7 = _os_activity_create(&dword_1DB39C000, "verifying searchable index", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DEFAULT);
    indexVerificationActivity = v6->_indexVerificationActivity;
    v6->_indexVerificationActivity = (OS_os_activity *)v7;
  }
  return v6;
}

- (id)_verifyDataSamples:(id)a3 usingTester:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  os_activity_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke;
  v39[3] = &unk_1E6C05E00;
  id v8 = v27;
  id v40 = v8;
  id v9 = v7;
  id v41 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v39];
  objc_super v10 = [MEMORY[0x1E4F60E18] promise];
  v11 = [v8 expressionFromDataSamples:v9];
  if ([v11 isValid])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v43) = 0;
    v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    v13 = objc_msgSend(v9, "allKeys", v12);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_2;
    v36[3] = &unk_1E6C05E28;
    id v14 = v12;
    id v37 = v14;
    id v15 = v11;
    id v38 = v15;
    [v13 enumerateObjectsUsingBlock:v36];

    v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    LOBYTE(v13) = [v16 BOOLForKey:@"EDSearchableIndexPostFakeCorruptSearchableIndexErrors"];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_3;
    aBlock[3] = &unk_1E6C05E78;
    aBlock[4] = self;
    id v29 = v8;
    v34 = buf;
    id v30 = v10;
    id v17 = v14;
    id v31 = v17;
    id v32 = v9;
    char v35 = (char)v13;
    id v18 = v15;
    id v33 = v18;
    v19 = _Block_copy(aBlock);
    v20 = [MEMORY[0x1E4F60468] queryWithExpression:v18 builder:v19];
    [v20 start];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v21 = +[EDSearchableIndexVerifier log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (id)objc_opt_class();
      uint64_t v23 = [v6 count];
      uint64_t v24 = [v9 count];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v43 = v23;
      __int16 v44 = 2048;
      uint64_t v45 = v24;
      _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> did not return a spotlight query. dataSamples.count=%lu transformedDataSamples.count=%lu", buf, 0x2Au);
    }
    [v10 finishWithResult:MEMORY[0x1E4F1CC08]];
  }
  v25 = [v10 future];

  return v25;
}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v5 = [*(id *)(a1 + 32) transformDataForVerification:a3];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 40) queryString];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSource];
  v5 = [v4 bundleIDForSearchableIndexVerifier:*(void *)(a1 + 32)];
  [v3 setBundleID:v5];

  id v6 = [*(id *)(a1 + 40) fetchAttributes];
  [v3 setFetchAttributes:v6];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_4;
  v15[3] = &unk_1E6C00A40;
  uint64_t v18 = *(void *)(a1 + 80);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  [v3 setCompletionBlock:v15];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_5;
  v8[3] = &unk_1E6C05E50;
  uint64_t v13 = *(void *)(a1 + 80);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 40);
  char v14 = *(unsigned char *)(a1 + 88);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 72);
  [v3 setResultsBlock:v8];
  os_activity_t v7 = [*(id *)(a1 + 48) errorOnlyCompletionHandlerAdapter];
  [v3 setFailureBlock:v7];
}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 finishWithResult:v3];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kEDSearchableIndexVerifierErrorDomain" code:1 userInfo:0];
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", 0);
  }
}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        os_activity_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        id v8 = [v7 uniqueIdentifier];
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = [v8 integerValue];
          id v11 = [NSNumber numberWithInteger:v10];
          id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
          if ([*(id *)(a1 + 40) verifySearchableItem:v7 matchesDataSample:v12])
          {
            if (*(unsigned char *)(a1 + 72))
            {
              uint64_t v13 = [NSString stringWithFormat:@"FAKED: %@", *(void *)(a1 + 56)];
              [*(id *)(a1 + 48) setObject:v13 forKeyedSubscript:v11];
            }
            else
            {
              [*(id *)(a1 + 48) removeObjectForKey:v11];
            }
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (void)_addFailingSamples:(id)a3 toResultDictionary:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__EDSearchableIndexVerifier__addFailingSamples_toResultDictionary___block_invoke;
  v7[3] = &unk_1E6C05EA0;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __67__EDSearchableIndexVerifier__addFailingSamples_toResultDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  [v6 addObject:v5];
}

- (id)_verifySamples:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v21 = objc_alloc_init(EDSearchableIndexSubjectTester);
  v34[0] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v22;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [(EDSearchableIndexVerifier *)self _verifyDataSamples:v4 usingTester:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        [v6 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  [MEMORY[0x1E4F60D70] join:v6];
  v20 = id v27 = 0;
  id v12 = [v20 result:&v27];
  id v13 = v27;
  if (v13)
  {
    id v14 = v5;
    id v5 = 0;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v15)
    {
      uint64_t v19 = v12;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          -[EDSearchableIndexVerifier _addFailingSamples:toResultDictionary:](self, "_addFailingSamples:toResultDictionary:", *(void *)(*((void *)&v23 + 1) + 8 * j), v5, v19);
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v15);
      id v12 = v19;
    }
  }

  return v5;
}

- (void)verifyDataSamplesWithCompletionHandler:(id)a3 scheduler:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (EFProtectedDataAvailable())
  {
    state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter((os_activity_t)self->_indexVerificationActivity, &state);
    uint64_t v8 = [(EDSearchableIndexVerifier *)self dataSource];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unint64_t v10 = [(EDSearchableIndexVerifier *)self _findMissingTransactionIDs:v9 dataSource:v8];
    if (v10 - 1 <= 1)
    {
      os_activity_scope_leave(&state);
      if (!v6)
      {
LABEL_35:

        goto LABEL_36;
      }
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_2;
      v43[3] = &unk_1E6C05EC8;
      id v45 = v6;
      unint64_t v46 = v10;
      id v9 = v9;
      id v44 = v9;
      [v7 performSyncBlock:v43];

      id v11 = v45;
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v31 = [v8 searchableIndexForSearchableIndexVerifier:self];
    [MEMORY[0x1E4F1CB18] standardUserDefaults];
    *(void *)buf = 0;
    id v40 = buf;
    uint64_t v41 = 0x2020000000;
    long long v30 = v42 = 0xAAAAAAAAAAAAAAAALL;
    id v13 = [v30 valueForKey:@"kDefaultsKeyLastVerifiedMessageID"];
    uint64_t v14 = [v13 longLongValue];

    unint64_t v42 = v14;
    uint64_t v15 = [v8 dataSamplesForSearchableIndexVerifier:self searchableIndex:v31 count:64 lastVerifiedMessageID:*((void *)v40 + 3)];
    uint64_t v29 = [v15 count];
    if (![v15 count])
    {
      long long v26 = +[EDSearchableIndexVerifier log];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "No data samples fetched from database. Resetting kDefaultsKeyLastVerifiedMessageID to 0", v50, 2u);
      }

      [v30 setInteger:0 forKey:@"kDefaultsKeyLastVerifiedMessageID"];
      os_activity_scope_leave(&state);
      if (!v6) {
        goto LABEL_33;
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_31;
      v37[3] = &unk_1E6C05EF0;
      v38[0] = v6;
      v38[1] = v10;
      [v7 performSyncBlock:v37];
      id v27 = (id *)v38;
      goto LABEL_31;
    }
    uint64_t v16 = [(EDSearchableIndexVerifier *)self _verifyDataSamples:v15];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_2_32;
    v36[3] = &unk_1E6C05F18;
    void v36[4] = buf;
    [v15 enumerateKeysAndObjectsUsingBlock:v36];
    unint64_t v17 = [v16 count];
    double v18 = (double)v17 / (double)(unint64_t)[v15 count];
    if ([v16 count] && v18 < 0.5)
    {
      uint64_t v19 = +[EDSearchableIndexVerifier log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[EDSearchableIndexVerifier verifyDataSamplesWithCompletionHandler:scheduler:](v19, v18);
      }

      v20 = [v8 dataSamplesForSearchableIndexVerifier:self searchableIndex:v31 count:512 lastVerifiedMessageID:*((void *)v40 + 3)];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_33;
      v35[3] = &unk_1E6C05F18;
      v35[4] = buf;
      [v20 enumerateKeysAndObjectsUsingBlock:v35];
      uint64_t v21 = [v20 count];
      id v22 = [(EDSearchableIndexVerifier *)self _verifyDataSamples:v20];
      [v16 unionSet:v22];
      unint64_t v23 = [v16 count];

      double v18 = (double)v23 / (double)(unint64_t)(v21 + v29);
    }
    if (v16)
    {
      if (![v16 count])
      {
        uint64_t v25 = 2;
        goto LABEL_29;
      }
      long long v24 = +[EDSearchableIndexVerifier log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v50 = 134218240;
        double v51 = v18;
        __int16 v52 = 2048;
        uint64_t v53 = 0x3FE0000000000000;
        _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "Verification failed at ratio: %f. threshold: %f", v50, 0x16u);
      }
      uint64_t v25 = 1;
    }
    else
    {
      long long v24 = +[EDSearchableIndexVerifier log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "Verification query results empty", v50, 2u);
      }
      uint64_t v25 = 0;
    }

LABEL_29:
    long long v28 = [NSNumber numberWithLongLong:*((void *)v40 + 3)];
    [v30 setValue:v28 forKey:@"kDefaultsKeyLastVerifiedMessageID"];

    os_activity_scope_leave(&state);
    if (!v6)
    {
      id v9 = v16;
      goto LABEL_33;
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_34;
    v32[3] = &unk_1E6C05EC8;
    v34[0] = v6;
    v34[1] = v25;
    id v9 = v16;
    id v33 = v9;
    [v7 performSyncBlock:v32];

    id v27 = (id *)v34;
LABEL_31:

LABEL_33:
    _Block_object_dispose(buf, 8);

    id v11 = (void *)v31;
    goto LABEL_34;
  }
  id v12 = +[EDSearchableIndexVerifier log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Skipping verifyDataSamplesWithCompletionHandler. Protected data unavailable.", buf, 2u);
  }

  if (v6)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke;
    v48[3] = &unk_1E6C009C8;
    id v49 = v6;
    [v7 performSyncBlock:v48];
  }
LABEL_36:
}

void __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 2, 0);
}

void __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 48);
  id v3 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v1, 0);
}

uint64_t __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0, 0);
}

void __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_2_32(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 longLongValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v3 > v5)
  {
    uint64_t v5 = [v6 longLongValue];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v4 + 24) = v5;
}

void __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_33(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 longLongValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v3 > v5)
  {
    uint64_t v5 = [v6 longLongValue];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v4 + 24) = v5;
}

uint64_t __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_34(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], 0, a1[4]);
}

- (id)_verifyDataSamples:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EDSearchableIndexVerifier signpostLog];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = +[EDSearchableIndexVerifier signpostLog];
  uint64_t v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v9 = v6 - 1;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "EDSearchableIndexVerifier", "", buf, 2u);
  }

  unint64_t v10 = [(EDSearchableIndexVerifier *)self _verifySamples:v4];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if ([v10 count])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__EDSearchableIndexVerifier__verifyDataSamples___block_invoke;
      aBlock[3] = &unk_1E6BFF738;
      id v30 = v4;
      id v27 = v12;
      id v31 = v27;
      id v13 = v11;
      id v32 = v13;
      uint64_t v14 = _Block_copy(aBlock);
      [v10 enumerateKeysAndObjectsUsingBlock:v14];
      uint64_t v15 = [v13 length];
      uint64_t v16 = NSString;
      if (v15)
      {
        unint64_t v17 = [NSString stringWithFormat:@"Searchable Index Verification failed\n%@", v13, v27];
      }
      else
      {
        uint64_t v19 = [v10 allKeys];
        unint64_t v17 = [v16 stringWithFormat:@"Searchable Index verification found missing rowids: %@", v19, v27];

        v20 = +[EDSearchableIndexVerifier log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          -[EDSearchableIndexVerifier _verifyDataSamples:]((uint64_t)v17, v20);
        }
      }
    }
    uint64_t v18 = [v10 count];
  }
  else
  {
    id v12 = 0;
    uint64_t v18 = -1;
  }
  unint64_t v21 = [v10 count];
  unint64_t v22 = [v4 count];
  unint64_t v23 = +[EDSearchableIndexVerifier signpostLog];
  long long v24 = v23;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    uint64_t v25 = [v4 count];
    *(_DWORD *)buf = 134349568;
    uint64_t v34 = v25;
    __int16 v35 = 2050;
    uint64_t v36 = v18;
    __int16 v37 = 2050;
    double v38 = (double)v21 / (double)v22;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v24, OS_SIGNPOST_INTERVAL_END, spid, "EDSearchableIndexVerifier", "SpotlightVerificationSamples=%{public,signpost.telemetry:number1}lu SpotlightVerificationResultFailures=%{public,signpost.telemetry:number2}ld SpotlightVerificationFailingRatio=%{public,signpost.description:attribute}f enableTelemetry=YES ", buf, 0x20u);
  }

  return v12;
}

void __48__EDSearchableIndexVerifier__verifyDataSamples___block_invoke(id *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 transactionID];
  [a1[5] addObject:v5];
  os_signpost_id_t v6 = [NSString stringWithFormat:@"row:%@ cid:%@\n", v3, v5];
  [a1[6] appendString:v6];
  id v7 = +[EDSearchableIndexVerifier log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __48__EDSearchableIndexVerifier__verifyDataSamples___block_invoke_cold_1((uint64_t)v3, buf, [v5 longLongValue], v7);
  }
}

- (unint64_t)_findMissingTransactionIDs:(id)a3 dataSource:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 knownTransactionIDsForSearchableIndexVerifier:self];
  if ([v8 count])
  {
    uint64_t v9 = [(EDSearchableIndexVerifier *)self _missingTransactionIDsFromTransactionIDs:v8];
    id v17 = 0;
    unint64_t v10 = [v9 result:&v17];
    id v11 = v17;
    if ([v10 count])
    {
      id v12 = +[EDSearchableIndexVerifier log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v10 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v19 = v13;
        _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Found %lu missing transaction(s)", buf, 0xCu);
      }

      [v6 unionSet:v10];
      unint64_t v14 = 1;
    }
    else
    {
      if (v11)
      {
        uint64_t v15 = +[EDSearchableIndexVerifier log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[EDSearchableIndexVerifier _findMissingTransactionIDs:dataSource:](v15);
        }
      }
      else
      {
        uint64_t v15 = +[EDSearchableIndexVerifier log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Found all expected transaction identifiers", buf, 2u);
        }
      }

      unint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v9 = +[EDSearchableIndexVerifier log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v14 = 2;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "No transactionIDs were fetched from the database, which implies nothing has been indexed yet. Skipping further verification.", buf, 2u);
    }
    else
    {
      unint64_t v14 = 2;
    }
  }

  return v14;
}

- (id)_missingTransactionIDsFromTransactionIDs:(id)a3
{
  id v4 = a3;
  if (EFProtectedDataAvailable())
  {
    uint64_t v5 = (void *)[v4 mutableCopy];
    id v6 = [MEMORY[0x1E4F60E18] promise];
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke;
    uint64_t v20 = &unk_1E6C05F68;
    unint64_t v21 = self;
    id v7 = v6;
    id v22 = v7;
    id v8 = v5;
    id v23 = v8;
    uint64_t v9 = _Block_copy(&aBlock);
    unint64_t v10 = [NSString stringWithFormat:@"%@=*", @"com_apple_mail_transaction", aBlock, v18, v19, v20, v21];
    id v11 = [MEMORY[0x1E4F60470] expressionWithQueryString:v10];
    id v12 = [MEMORY[0x1E4F60468] queryWithExpression:v11 builder:v9];
    [v12 start];
    uint64_t v13 = [v7 future];
  }
  else
  {
    unint64_t v14 = +[EDSearchableIndexVerifier log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Skipping transaction ID verification. Protected data unavailable", buf, 2u);
    }

    uint64_t v15 = (void *)MEMORY[0x1E4F60D70];
    objc_msgSend(MEMORY[0x1E4F28C58], "ef_temporarilyUnavailableError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v15 futureWithError:v8];
  }

  return v13;
}

void __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke(id *a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] dataSource];
  uint64_t v5 = [v4 bundleIDForSearchableIndexVerifier:a1[4]];
  [v3 setBundleID:v5];

  v14[0] = @"com_apple_mail_transaction";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v3 setFetchAttributes:v6];

  [v3 setAttribute:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke_2;
  v11[3] = &unk_1E6BFFAF0;
  id v12 = a1[5];
  id v13 = a1[6];
  [v3 setCompletionBlock:v11];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke_3;
  aBlock[3] = &unk_1E6C05F40;
  id v10 = a1[6];
  id v7 = _Block_copy(aBlock);
  [v3 setFoundAttributeResultsBlock:v7];
  [v3 setChangedAttributeResultsBlock:v7];
  id v8 = [a1[5] errorOnlyCompletionHandlerAdapter];
  [v3 setFailureBlock:v8];
}

void __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  objc_msgSend(v1, "finishWithResult:");
}

void __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 isEqualToString:@"com_apple_mail_transaction"])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(*(id *)(a1 + 32), "removeObject:", v10, (void)v11);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (EDSearchableIndexVerifierDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (EDSearchableIndexVerifierDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (OS_os_activity)indexVerificationActivity
{
  return self->_indexVerificationActivity;
}

- (void)setIndexVerificationActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexVerificationActivity, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)verifyDataSamplesWithCompletionHandler:(os_log_t)log scheduler:(double)a2 .cold.1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  double v3 = a2;
  __int16 v4 = 2048;
  uint64_t v5 = 512;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Verification failed at ratio %f. Performing verification with a larger sample of size %lu", (uint8_t *)&v2, 0x16u);
}

- (void)_verifyDataSamples:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void __48__EDSearchableIndexVerifier__verifyDataSamples___block_invoke_cold_1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed verification for row:%@ citd:%lld", buf, 0x16u);
}

- (void)_findMissingTransactionIDs:(os_log_t)log dataSource:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to query for transaction identifiers", v1, 2u);
}

@end