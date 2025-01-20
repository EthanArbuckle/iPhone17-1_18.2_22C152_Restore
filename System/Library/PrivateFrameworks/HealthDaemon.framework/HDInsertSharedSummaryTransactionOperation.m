@interface HDInsertSharedSummaryTransactionOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDCloudSyncZoneIdentifier)zoneIdentifier;
- (HDInsertSharedSummaryTransactionOperation)initWithCoder:(id)a3;
- (HDInsertSharedSummaryTransactionOperation)initWithZoneIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertSharedSummaryTransactionOperation

- (HDInsertSharedSummaryTransactionOperation)initWithZoneIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDInsertSharedSummaryTransactionOperation;
  v5 = [(HDInsertSharedSummaryTransactionOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    zoneIdentifier = v5->_zoneIdentifier;
    v5->_zoneIdentifier = (HDCloudSyncZoneIdentifier *)v6;
  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__184;
  v78 = __Block_byref_object_dispose__184;
  id v79 = 0;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v61 = __82__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_error___block_invoke;
  v62 = &unk_1E630B750;
  v63 = &v70;
  v64 = &v74;
  v65 = &v66;
  id v53 = v7;
  id v47 = v8;
  v48 = v60;
  v58 = self;
  if (self)
  {
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__184;
    v105 = __Block_byref_object_dispose__184;
    id v106 = 0;
    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__184;
    v99 = __Block_byref_object_dispose__184;
    id v100 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v10 = [v53 cloudSyncManager];
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke;
    v91[3] = &unk_1E62F8348;
    v93 = &v95;
    v94 = &v101;
    dispatch_semaphore_t dsema = v9;
    dispatch_semaphore_t v92 = dsema;
    [v10 cloudSyncRepositoriesForClient:0 completion:v91];

    dispatch_time_t v11 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(dsema, v11))
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v115 = 138543362;
        v116 = self;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Timed out waiting to complete journable operation", v115, 0xCu);
      }
    }
    if (v96[5])
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F65D90]);
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke_279;
      v89[3] = &unk_1E62F4EB8;
      v90 = v48;
      [v13 setDidFinish:v89];
      [v13 beginTask];
      v57 = v13;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id obj = (id)v96[5];
      uint64_t v14 = [obj countByEnumeratingWithState:&v85 objects:v115 count:16];
      if (v14)
      {
        uint64_t v52 = *(void *)v86;
        do
        {
          uint64_t v54 = v14;
          for (uint64_t i = 0; i != v54; ++i)
          {
            if (*(void *)v86 != v52) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            [v57 beginTask];
            id v17 = [[HDCloudSyncCachedZone alloc] initForZoneIdentifier:v58->_zoneIdentifier repository:v16 accessibilityAssertion:0];
            v80[0] = MEMORY[0x1E4F143A8];
            v80[1] = 3221225472;
            v81 = __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke_2;
            v82 = &unk_1E62F5D48;
            id v83 = v57;
            v84 = v58;
            id v56 = v53;
            id v18 = v16;
            id v19 = v17;
            v20 = v80;
            uint64_t v21 = objc_opt_class();
            id v114 = 0;
            v22 = [v19 recordsForClass:v21 error:&v114];
            id v23 = v114;
            v59 = v23;
            if (v22) {
              BOOL v24 = 1;
            }
            else {
              BOOL v24 = v23 == 0;
            }
            if (v24)
            {
              v55 = objc_msgSend(v22, "hk_map:", &__block_literal_global_219);
              uint64_t v25 = objc_opt_class();
              id v113 = 0;
              v26 = [v19 recordsForClass:v25 error:&v113];
              id v27 = v113;

              if (v26 || !v27)
              {
                v51 = objc_msgSend(v26, "hk_map:", &__block_literal_global_289);
                if (v51)
                {
                  v107[0] = MEMORY[0x1E4F143A8];
                  v107[1] = 3221225472;
                  v107[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_290;
                  v107[3] = &unk_1E630B7E8;
                  v112 = v20;
                  v107[4] = v58;
                  id v108 = 0;
                  id v31 = v18;
                  id v109 = v31;
                  id v110 = v55;
                  id v111 = v51;
                  v32 = v107;
                  id v33 = v31;
                  v34 = [v33 cloudSyncShimProvider];
                  v35 = [v34 sharedSummariesShim];
                  [v35 fetchAllSharedSummaryTransactionsWithRepository:v33 completion:v32];
                }
                else
                {
                  _HKInitializeLogging();
                  v36 = *MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v118 = v58;
                    _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: No Summary records found.", buf, 0xCu);
                  }
                  v81((uint64_t)v20, 1, 0);
                }
              }
              else
              {
                _HKInitializeLogging();
                v28 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  v39 = v28;
                  v40 = [v19 zoneIdentifier];
                  *(_DWORD *)buf = 138543874;
                  v118 = v58;
                  __int16 v119 = 2114;
                  v120 = v40;
                  __int16 v121 = 2114;
                  id v122 = v27;
                  _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to get summary records for %{public}@, %{public}@", buf, 0x20u);
                }
                v81((uint64_t)v20, 0, v27);
              }
            }
            else
            {
              _HKInitializeLogging();
              v29 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                v37 = v29;
                v38 = [v19 zoneIdentifier];
                *(_DWORD *)buf = 138543874;
                v118 = v58;
                __int16 v119 = 2114;
                v120 = v38;
                __int16 v121 = 2114;
                id v122 = v59;
                _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to get transaction records for %{public}@, %{public}@", buf, 0x20u);
              }
              v81((uint64_t)v20, 0, v59);
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v85 objects:v115 count:16];
        }
        while (v14);
      }

      [v57 finishTask];
    }
    else
    {
      v61(v48, 0, (id)v102[5]);
    }

    _Block_object_dispose(&v95, 8);
    _Block_object_dispose(&v101, 8);
  }
  if (!*((unsigned char *)v67 + 24))
  {
    _HKInitializeLogging();
    v41 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v115 = 138543362;
      v116 = v58;
      _os_log_fault_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@ Completion block expected to be called synchronously was called asynchronously.", v115, 0xCu);
    }
  }
  id v42 = (id)v75[5];
  v43 = v42;
  if (v42)
  {
    if (a5) {
      *a5 = v42;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v44 = *((unsigned char *)v71 + 24) != 0;
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  return v44;
}

void __82__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_error___block_invoke(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v5 = obj;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

void __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke_279(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = [v6 firstObject];
    if ((unint64_t)[v7 count] >= 2)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28750];
      v13[0] = v7;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      uint64_t v11 = objc_msgSend(v9, "hk_error:userInfo:", 100, v10);

      id v8 = (void *)v11;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishTask];
  }
  else
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to save shared summary transaction, %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 32) failTaskWithError:v5];
  }
}

id __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_287(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

void __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_290(uint64_t a1, void *a2, uint64_t a3)
{
  v113[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v7 = objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_293_3);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (!v6)
    {
      _HKInitializeLogging();
      uint64_t v9 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v65 = *(void *)(a1 + 32);
        uint64_t v66 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v65;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v66;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error fetching committed transactions %{public}@.", buf, 0x16u);
      }
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F65D90]);
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_295;
    v92[3] = &unk_1E630B7C0;
    v67 = v6;
    id v93 = v6;
    id v78 = v8;
    id v94 = v78;
    id v97 = *(id *)(a1 + 72);
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v95 = v11;
    uint64_t v96 = v12;
    [v10 setDidFinish:v92];
    uint64_t v70 = v10;
    [v10 beginTask];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = *(id *)(a1 + 56);
    uint64_t v82 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
    if (v82)
    {
      uint64_t v81 = *(void *)v89;
      uint64_t v68 = v7;
      uint64_t v69 = a1;
      do
      {
        for (uint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v89 != v81) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          v15 = [v14 record];
          v16 = [v15 recordID];
          id v17 = [v16 zoneID];
          id v86 = 0;
          id v87 = 0;
          char v18 = objc_msgSend(v17, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v87, &v86);
          id v19 = v87;
          id v20 = v86;

          if (v18)
          {
            uint64_t v21 = [v14 UUID];
            [v78 addObject:v21];

            v22 = *(void **)(a1 + 64);
            v85[0] = MEMORY[0x1E4F143A8];
            v85[1] = 3221225472;
            v85[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_298;
            v85[3] = &unk_1E62F5100;
            v85[4] = v14;
            id v23 = objc_msgSend(v22, "hk_filter:", v85);
            uint64_t v24 = [v23 count];
            uint64_t v25 = [v14 summaryIdentifiers];
            uint64_t v26 = [v25 count];

            if (v24 == v26)
            {
              if (v7
                && ([v14 UUID],
                    id v27 = objc_claimAutoreleasedReturnValue(),
                    int v28 = [v7 containsObject:v27],
                    v27,
                    v28))
              {
                _HKInitializeLogging();
                v29 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v30 = *(void *)(a1 + 32);
                  id v31 = v29;
                  v32 = [v14 UUID];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v30;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v32;
                  _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Transaction with UUID is already committed %{public}@. Skipping...", buf, 0x16u);
                }
              }
              else
              {
                uint64_t v37 = a1;
                v38 = v7;
                [v70 beginTask];
                uint64_t v39 = *(void *)(v37 + 32);
                v40 = *(void **)(v37 + 48);
                v83[0] = MEMORY[0x1E4F143A8];
                v83[1] = 3221225472;
                v83[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_300;
                v83[3] = &unk_1E62F2EF8;
                v83[4] = v39;
                v83[5] = v14;
                id v84 = v70;
                id v41 = v40;
                id v42 = v14;
                v77 = v23;
                id v79 = v23;
                v43 = v83;
                BOOL v44 = v43;
                if (v39)
                {
                  uint64_t v45 = v39;
                  uint64_t v76 = v43;
                  uint64_t v74 = v41;
                  v46 = [v42 metadata];

                  if (v46)
                  {
                    id v47 = (void *)MEMORY[0x1E4F1CAD0];
                    v113[0] = objc_opt_class();
                    v113[1] = objc_opt_class();
                    v113[2] = objc_opt_class();
                    v113[3] = objc_opt_class();
                    v113[4] = objc_opt_class();
                    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:5];
                    v49 = [v47 setWithArray:v48];

                    v50 = (void *)MEMORY[0x1E4F28DC0];
                    v51 = [v42 metadata];
                    id v99 = 0;
                    uint64_t v52 = [v50 unarchivedObjectOfClasses:v49 fromData:v51 error:&v99];
                    id v53 = v99;

                    char v73 = (void *)v52;
                    if (!v52)
                    {
                      _HKInitializeLogging();
                      uint64_t v54 = *MEMORY[0x1E4F29FA8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v107 = 138543618;
                        uint64_t v108 = v45;
                        __int16 v109 = 2114;
                        id v110 = v53;
                        _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error unarchiving metadata %{public}@", v107, 0x16u);
                      }
                    }
                  }
                  else
                  {
                    char v73 = 0;
                    id v53 = 0;
                  }
                  uint64_t v72 = v53;
                  id v75 = v19;
                  v98[0] = MEMORY[0x1E4F143A8];
                  v98[1] = 3221225472;
                  v98[2] = __119__HDInsertSharedSummaryTransactionOperation__persistRecordsWithRepository_transactionRecord_summaryRecords_completion___block_invoke;
                  v98[3] = &unk_1E62F5128;
                  v98[4] = v45;
                  v71 = objc_msgSend(v79, "hk_map:", v98);
                  _HKInitializeLogging();
                  v55 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                  {
                    id v56 = v55;
                    v57 = [v42 UUID];
                    v58 = [v57 UUIDString];
                    v59 = [v42 sourceDeviceIdentifier];
                    *(_DWORD *)v107 = 138543874;
                    uint64_t v108 = v45;
                    __int16 v109 = 2114;
                    id v110 = v58;
                    __int16 v111 = 2114;
                    v112 = v59;
                    _os_log_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Saving transaction with UUID %{public}@ and source device identifier %{public}@.", v107, 0x20u);
                  }
                  id v41 = v74;
                  v60 = [v74 cloudSyncShimProvider];
                  v61 = [v60 sharedSummariesShim];
                  v62 = [v42 UUID];
                  v63 = [v42 sourceDeviceIdentifier];
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __119__HDInsertSharedSummaryTransactionOperation__persistRecordsWithRepository_transactionRecord_summaryRecords_completion___block_invoke_309;
                  v102 = &unk_1E62F9580;
                  BOOL v44 = v76;
                  id v106 = v76;
                  uint64_t v103 = v45;
                  id v64 = v74;
                  id v104 = v64;
                  id v105 = v42;
                  [v61 prepareAndCommitRepository:v64 transactionWithUUID:v62 sourceDeviceIdentifier:v63 metadata:v73 sharedSummaries:v71 completion:buf];

                  v38 = v68;
                  id v19 = v75;
                }

                id v23 = v77;
                uint64_t v7 = v38;
                a1 = v69;
              }
            }
            else
            {
              _HKInitializeLogging();
              v35 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                uint64_t v36 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v36;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v14;
                _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Not all summary records were found for transaction %{public}@. Skipping...", buf, 0x16u);
              }
            }
          }
          else
          {
            _HKInitializeLogging();
            id v33 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              uint64_t v34 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v34;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v14;
              _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error: Zone is not a shared summary zone for transaction %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v82 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
      }
      while (v82);
    }

    [v70 finishTask];
    id v6 = v67;
  }
}

uint64_t __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_295(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_2_296;
  v10[3] = &unk_1E630B798;
  id v2 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "hk_filter:", v10);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 48) cloudSyncShimProvider];
    id v5 = [v4 sharedSummariesShim];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_3;
    v6[3] = &unk_1E62F95D0;
    v6[4] = *(void *)(a1 + 56);
    id v7 = v3;
    id v8 = 0;
    id v9 = *(id *)(a1 + 64);
    [v5 deleteTransactions:v7 completion:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_2_296(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

void __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_3(void *a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      id v7 = (void *)a1[5];
      id v9 = v6;
      uint64_t v10 = [v7 count];
      uint64_t v11 = a1[6];
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to prune %ld non-present transactions after insertion from cloud: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_298(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 summaryIdentifiers];
  id v5 = [v3 UUID];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

void __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_300(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error saving transaction %{public}@, %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  [*(id *)(a1 + 48) finishTask];
}

id __119__HDInsertSharedSummaryTransactionOperation__persistRecordsWithRepository_transactionRecord_summaryRecords_completion___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (objc_class *)MEMORY[0x1E4F2B4A0];
    id v3 = a2;
    id v17 = [v2 alloc];
    __int16 v16 = [v3 UUID];
    uint64_t v4 = [v3 package];
    id v5 = [v3 name];
    uint64_t v6 = [v3 version];
    uint64_t v7 = [v3 compatibilityVersion];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    int v9 = [v3 authorizationIdentifiers];
    uint64_t v10 = [v8 setWithArray:v9];
    __int16 v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = [v3 objectTypes];
    __int16 v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v3 summaryData];

    id v18 = (id)[v17 _initWithUUID:v16 package:v4 name:v5 version:v6 compatibilityVersion:v7 authorizationIdentifiers:v10 objectTypes:v13 summaryData:v14];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __119__HDInsertSharedSummaryTransactionOperation__persistRecordsWithRepository_transactionRecord_summaryRecords_completion___block_invoke_309(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 48);
    id v7 = *(id *)(a1 + 40);
    id v8 = v6;
    if (v5 && [v7 profileType] == 2)
    {
      int v9 = [v7 profile];
      uint64_t v10 = [v9 legacyRepositoryProfile];

      __int16 v11 = HDCloudSyncLastPulledUpdateDate(v10);
      id v12 = [v8 record];
      __int16 v13 = [v12 modificationDate];

      if (!v11 || objc_msgSend(v13, "hk_isAfterDate:", v11))
      {
        HDCloudSyncDidPullUpdateWithDate(v13, v10);
        uint64_t v14 = [v10 cloudSyncManager];
        [v14 didCompleteSuccessfulPullOfUpdateWithDate:v13];
      }
    }

    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }

  return v4();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertSharedSummaryTransactionOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSummaryTransactionOperationZoneIdentifierKey"];

  uint64_t v6 = [(HDInsertSharedSummaryTransactionOperation *)self initWithZoneIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HDCloudSyncZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void).cxx_destruct
{
}

@end