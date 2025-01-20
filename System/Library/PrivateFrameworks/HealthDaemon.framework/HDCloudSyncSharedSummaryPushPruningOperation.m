@interface HDCloudSyncSharedSummaryPushPruningOperation
- (HDCloudSyncSharedSummaryPushPruningOperation)initWithConfiguration:(id)a3 allRecordsToSave:(id)a4 participantZoneIDsToPush:(id)a5 existingTransactionRecordsByZoneID:(id)a6;
- (id)_filterRecordsThatExistInTheCloud:(id)a3;
- (id)_recordIDsForTransactions:(id)a3;
- (void)_findTransactionsToDelete:(id)a3 existingTransactionRecordsByZoneID:(id)a4 completion:(id)a5;
- (void)_modifyRecordsAndFinish:(id)a3 recordIDsToDelete:(id)a4;
- (void)main;
@end

@implementation HDCloudSyncSharedSummaryPushPruningOperation

- (HDCloudSyncSharedSummaryPushPruningOperation)initWithConfiguration:(id)a3 allRecordsToSave:(id)a4 participantZoneIDsToPush:(id)a5 existingTransactionRecordsByZoneID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncSharedSummaryPushPruningOperation;
  v13 = [(HDCloudSyncOperation *)&v21 initWithConfiguration:a3 cloudState:0];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    allRecordsToSave = v13->_allRecordsToSave;
    v13->_allRecordsToSave = (NSSet *)v14;

    uint64_t v16 = [v11 copy];
    participantZoneIDsWithNewTransactionsToPush = v13->_participantZoneIDsWithNewTransactionsToPush;
    v13->_participantZoneIDsWithNewTransactionsToPush = (NSSet *)v16;

    uint64_t v18 = [v12 copy];
    existingTransactionRecordsByZoneID = v13->_existingTransactionRecordsByZoneID;
    v13->_existingTransactionRecordsByZoneID = (NSDictionary *)v18;
  }
  return v13;
}

- (void)main
{
  v3 = [(NSSet *)self->_allRecordsToSave hk_map:&__block_literal_global_201];
  participantZoneIDsWithNewTransactionsToPush = self->_participantZoneIDsWithNewTransactionsToPush;
  existingTransactionRecordsByZoneID = self->_existingTransactionRecordsByZoneID;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDCloudSyncSharedSummaryPushPruningOperation_main__block_invoke_2;
  v7[3] = &unk_1E63093A0;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [(HDCloudSyncSharedSummaryPushPruningOperation *)self _findTransactionsToDelete:participantZoneIDsWithNewTransactionsToPush existingTransactionRecordsByZoneID:existingTransactionRecordsByZoneID completion:v7];
}

uint64_t __52__HDCloudSyncSharedSummaryPushPruningOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

void __52__HDCloudSyncSharedSummaryPushPruningOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) _recordIDsForTransactions:a2];
  v4 = objc_msgSend(v3, "hk_minus:", *(void *)(a1 + 40));

  v5 = [*(id *)(a1 + 32) _filterRecordsThatExistInTheCloud:*(void *)(*(void *)(a1 + 32) + 120)];
  if ([v5 count] || objc_msgSend(v4, "count"))
  {
    id v6 = *(void **)(a1 + 32);
    v7 = [v5 allObjects];
    id v8 = [v4 allObjects];
    [v6 _modifyRecordsAndFinish:v7 recordIDsToDelete:v8];
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] No records found to push or prune.", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
  }
}

- (void)_findTransactionsToDelete:(id)a3 existingTransactionRecordsByZoneID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke;
  v26[3] = &unk_1E6309410;
  id v12 = v11;
  id v27 = v12;
  [v9 enumerateKeysAndObjectsUsingBlock:v26];
  uint64_t v13 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v14 = [v13 repository];
  v15 = [v14 cloudSyncShimProvider];
  uint64_t v16 = [v15 sharedSummariesShim];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_5;
  v21[3] = &unk_1E6309438;
  id v24 = v9;
  id v25 = v10;
  v21[4] = self;
  id v22 = v12;
  id v23 = v8;
  id v17 = v9;
  id v18 = v8;
  id v19 = v12;
  id v20 = v10;
  [v16 deviceIdentifierWithCompletion:v21];
}

void __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v41 + 1) + 8 * v9) sourceDeviceIdentifier];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v7);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v4;
  uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    uint64_t v14 = v36;
    v28 = v33;
    v15 = &unk_1E62FAD58;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * v16);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v36[0] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_2;
        v36[1] = v15;
        v36[2] = v17;
        id v18 = objc_msgSend(v5, "hk_filter:", v35, v28);
        if ((unint64_t)[v18 count] >= 2)
        {
          id v19 = objc_msgSend(v18, "hk_firstSortedObjectWithComparison:", &__block_literal_global_282);
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v33[0] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_4;
          v33[1] = &unk_1E63093E8;
          id v34 = v19;
          id v31 = v19;
          [v18 objectsPassingTest:v32];
          uint64_t v20 = v12;
          objc_super v21 = v14;
          uint64_t v22 = v13;
          id v23 = v5;
          v25 = id v24 = v15;
          v26 = *(void **)(a1 + 32);
          id v27 = [v25 allObjects];
          [v26 addObjectsFromArray:v27];

          v15 = v24;
          id v5 = v23;
          uint64_t v13 = v22;
          uint64_t v14 = v21;
          uint64_t v12 = v20;
        }
        ++v16;
      }
      while (v12 != v16);
      uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v12);
  }
}

uint64_t __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sourceDeviceIdentifier];
  id v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    uint64_t v7 = 1;
  }
  else if (v5)
  {
    uint64_t v6 = [v3 sourceDeviceIdentifier];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 record];
  uint64_t v6 = [v5 creationDate];
  uint64_t v7 = [v4 record];

  uint64_t v8 = [v7 creationDate];
  int v9 = objc_msgSend(v6, "hk_isAfterDate:", v8);

  if (v9) {
    return -1;
  }
  else {
    return 1;
  }
}

uint64_t __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 UUID];
  id v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = [v3 isEqual:v4] ^ 1;

  return v5;
}

void __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v20 = v6;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = (void *)MEMORY[0x1E4F1CA80];
          uint64_t v13 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(void *)(*((void *)&v24 + 1) + 8 * i), v20);
          uint64_t v14 = [v12 setWithSet:v13];

          if (v14)
          {
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_285;
            v22[3] = &unk_1E62FAD58;
            id v23 = v5;
            v15 = objc_msgSend(v14, "hk_filter:", v22);
            uint64_t v16 = *(void **)(a1 + 40);
            uint64_t v17 = [v15 allObjects];
            [v16 addObjectsFromArray:v17];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v7 = v20;
  }
  else
  {
    _HKInitializeLogging();
    id v18 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v19;
      __int16 v31 = 2114;
      v32 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Error fetching device identifier. Unable to attempt to prune previously existing transactions for this device. %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_285(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sourceDeviceIdentifier];
  id v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    uint64_t v7 = 1;
  }
  else if (v5)
  {
    id v6 = [v3 sourceDeviceIdentifier];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_recordIDsForTransactions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 summaryIdentifiers];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __74__HDCloudSyncSharedSummaryPushPruningOperation__recordIDsForTransactions___block_invoke;
        v15[3] = &unk_1E6309460;
        v15[4] = v9;
        uint64_t v11 = objc_msgSend(v10, "hk_map:", v15);

        uint64_t v12 = [v9 recordID];
        [v4 addObject:v12];

        [v4 addObjectsFromArray:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

id __74__HDCloudSyncSharedSummaryPushPruningOperation__recordIDsForTransactions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 recordID];
  uint64_t v5 = [v4 zoneID];
  uint64_t v6 = +[HDCloudSyncSharedSummaryRecord recordIDWithZoneID:v5 UUID:v3];

  return v6;
}

- (id)_filterRecordsThatExistInTheCloud:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__HDCloudSyncSharedSummaryPushPruningOperation__filterRecordsThatExistInTheCloud___block_invoke;
  v5[3] = &unk_1E62F6518;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "hk_filter:", v5);

  return v3;
}

uint64_t __82__HDCloudSyncSharedSummaryPushPruningOperation__filterRecordsThatExistInTheCloud___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 recordID];
  uint64_t v5 = [v4 zoneID];
  uint64_t v6 = [*(id *)(a1 + 32) configuration];
  uint64_t v7 = [v6 repository];
  uint64_t v8 = [v7 primaryCKContainer];
  uint64_t v9 = [v8 containerIdentifier];
  uint64_t v10 = +[HDCloudSyncZoneIdentifier identifierForZone:v5 container:v9 scope:2];

  uint64_t v11 = [HDCloudSyncCachedZone alloc];
  uint64_t v12 = [*(id *)(a1 + 32) configuration];
  uint64_t v13 = [v12 repository];
  uint64_t v14 = [*(id *)(a1 + 32) configuration];
  v15 = [v14 accessibilityAssertion];
  id v16 = [(HDCloudSyncCachedZone *)v11 initForZoneIdentifier:v10 repository:v13 accessibilityAssertion:v15];

  long long v17 = [v3 recordID];
  id v26 = 0;
  uint64_t v18 = [v16 containsRecordWithRecordID:v17 error:&v26];
  id v19 = v26;

  if (v18 != 1)
  {
    if (v18)
    {
      uint64_t v21 = 1;
      goto LABEL_7;
    }
    _HKInitializeLogging();
    id v20 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      long long v24 = v20;
      long long v25 = [v3 recordID];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v23;
      __int16 v29 = 2114;
      uint64_t v30 = v25;
      __int16 v31 = 2114;
      id v32 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@ [summary-sharing] Failed to fetch status of summary record %{public}@, %{public}@", buf, 0x20u);
    }
  }
  uint64_t v21 = 0;
LABEL_7:

  return v21;
}

- (void)_modifyRecordsAndFinish:(id)a3 recordIDsToDelete:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HDCloudSyncModifyRecordsOperation alloc];
  uint64_t v9 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v10 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v11 = [v10 repository];
  uint64_t v12 = [v11 primaryCKContainer];
  uint64_t v13 = [(HDCloudSyncModifyRecordsOperation *)v8 initWithConfiguration:v9 container:v12 recordsToSave:v7 recordIDsToDelete:v6];

  [(HDCloudSyncModifyRecordsOperation *)v13 setPermitNonAtomicZoneSaves:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HDCloudSyncSharedSummaryPushPruningOperation__modifyRecordsAndFinish_recordIDsToDelete___block_invoke;
  v15[3] = &unk_1E62F2950;
  v15[4] = self;
  [(HDCloudSyncOperation *)v13 setOnError:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__HDCloudSyncSharedSummaryPushPruningOperation__modifyRecordsAndFinish_recordIDsToDelete___block_invoke_294;
  v14[3] = &unk_1E62F2928;
  v14[4] = self;
  [(HDCloudSyncOperation *)v13 setOnSuccess:v14];
  [(HDCloudSyncOperation *)v13 start];
}

void __90__HDCloudSyncSharedSummaryPushPruningOperation__modifyRecordsAndFinish_recordIDsToDelete___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to modify records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __90__HDCloudSyncSharedSummaryPushPruningOperation__modifyRecordsAndFinish_recordIDsToDelete___block_invoke_294(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingTransactionRecordsByZoneID, 0);
  objc_storeStrong((id *)&self->_participantZoneIDsWithNewTransactionsToPush, 0);
  objc_storeStrong((id *)&self->_allRecordsToSave, 0);
  objc_storeStrong((id *)&self->_participant, 0);

  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
}

@end