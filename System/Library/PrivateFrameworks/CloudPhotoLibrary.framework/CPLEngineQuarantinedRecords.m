@interface CPLEngineQuarantinedRecords
+ (unint64_t)quarantineRetryCount;
- (BOOL)_quarantineRejectedRecords:(id)a3 error:(id *)a4;
- (BOOL)addQuarantinedRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 reason:(id)a5 error:(id *)a6;
- (BOOL)bumpRejectedRecords:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)isRecordWithScopedIdentifierQuarantined:(id)a3;
- (BOOL)removeQuarantinedRecordWithScopedIdentifier:(id)a3 notify:(BOOL)a4 error:(id *)a5;
- (BOOL)resetRejectedRecordsWithError:(id *)a3;
- (Class)classForQuarantinedRecordWithScopedIdentifier:(id)a3;
- (unint64_t)countOfQuarantinedRecords;
- (unint64_t)countOfQuarantinedRecordsInScopeWithIdentifier:(id)a3;
- (unint64_t)scopeType;
- (void)_sendQuarantineFeedbackWithRecordClass:(Class)a3 reason:(id)a4;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineQuarantinedRecords

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quarantineMessages, 0);
  objc_storeStrong((id *)&self->_newRejectedRecords, 0);
  objc_storeStrong((id *)&self->_rejectedRecords, 0);
}

- (void)writeTransactionDidSucceed
{
  v8.receiver = self;
  v8.super_class = (Class)CPLEngineQuarantinedRecords;
  [(CPLEngineStorage *)&v8 writeTransactionDidSucceed];
  if (self->_rejectedRecordsHasChanges)
  {
    self->_rejectedRecordsHasChanges = 0;
    objc_storeStrong((id *)&self->_rejectedRecords, self->_newRejectedRecords);
    self->_rejectedCount = self->_newRejectedCount;
    newRejectedRecords = self->_newRejectedRecords;
    self->_newRejectedRecords = 0;

    self->_newRejectedCount = 0;
  }
  if ([(NSMutableArray *)self->_quarantineMessages count])
  {
    v4 = [(CPLEngineStorage *)self engineStore];
    v5 = [v4 engineLibrary];
    v6 = [v5 feedback];
    [v6 reportMessages:self->_quarantineMessages];
  }
  quarantineMessages = self->_quarantineMessages;
  self->_quarantineMessages = 0;
}

- (void)writeTransactionDidFail
{
  v5.receiver = self;
  v5.super_class = (Class)CPLEngineQuarantinedRecords;
  [(CPLEngineStorage *)&v5 writeTransactionDidFail];
  if (self->_rejectedRecordsHasChanges)
  {
    self->_rejectedRecordsHasChanges = 0;
    newRejectedRecords = self->_newRejectedRecords;
    self->_newRejectedRecords = 0;

    self->_newRejectedCount = 0;
  }
  quarantineMessages = self->_quarantineMessages;
  self->_quarantineMessages = 0;
}

- (BOOL)resetRejectedRecordsWithError:(id *)a3
{
  if (self->_rejectedRecords)
  {
    self->_rejectedRecordsHasChanges = 1;
    self->_newRejectedCount = 0;
    newRejectedRecords = self->_newRejectedRecords;
    self->_newRejectedRecords = 0;
  }
  return 1;
}

- (BOOL)bumpRejectedRecords:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!+[CPLEngineQuarantinedRecords quarantineRetryCount])
  {
    BOOL v14 = [(CPLEngineQuarantinedRecords *)self _quarantineRejectedRecords:v7 error:a4];
LABEL_15:
    BOOL v15 = v14;
    goto LABEL_16;
  }
  if (!v7)
  {
    BOOL v14 = [(CPLEngineQuarantinedRecords *)self resetRejectedRecordsWithError:a4];
    goto LABEL_15;
  }
  if (self->_rejectedRecords && (objc_msgSend(v7, "rejectsTheSameRecordsAs:") & 1) != 0)
  {
    self->_rejectedRecordsHasChanges = 1;
    unint64_t v8 = self->_rejectedCount + 1;
    self->_unint64_t newRejectedCount = v8;
    if (!_CPLSilentLogging)
    {
      v9 = __CPLStorageOSLogDomain_21324();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v7 count];
        unint64_t newRejectedCount = self->_newRejectedCount;
        v11 = [v7 rejectedDescriptions];
        v12 = [v11 componentsJoinedByString:@"\n\t"];
        *(_DWORD *)buf = 134218498;
        uint64_t v19 = v10;
        __int16 v20 = 2048;
        unint64_t v21 = newRejectedCount;
        __int16 v22 = 2114;
        v23 = v12;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "%lu records have been rejected (%lu):\n\t%{public}@", buf, 0x20u);
      }
      unint64_t v8 = self->_newRejectedCount;
    }
    if (v8 <= +[CPLEngineQuarantinedRecords quarantineRetryCount])
    {
      objc_storeStrong((id *)&self->_newRejectedRecords, self->_rejectedRecords);
    }
    else
    {
      if (![(CPLEngineQuarantinedRecords *)self _quarantineRejectedRecords:v7 error:a4])
      {
        BOOL v15 = 0;
        goto LABEL_16;
      }
      self->_unint64_t newRejectedCount = 0;
      newRejectedRecords = self->_newRejectedRecords;
      self->_newRejectedRecords = 0;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 1;
    self->_rejectedRecordsHasChanges = 1;
    objc_storeStrong((id *)&self->_newRejectedRecords, a3);
    self->_unint64_t newRejectedCount = 1;
  }
LABEL_16:

  return v15;
}

- (BOOL)_quarantineRejectedRecords:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 1;
  id v7 = [(CPLEngineStorage *)self engineStore];
  unint64_t v8 = [v7 pushRepository];

  if (!_CPLSilentLogging)
  {
    v9 = __CPLStorageOSLogDomain_21324();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v6 count];
      v11 = [v6 rejectedDescriptions];
      v12 = [v11 componentsJoinedByString:@"\n\t"];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "%lu records have been rejected too many times. Quarantining them:\n\t%{public}@", buf, 0x16u);
    }
  }
  CFIndex v13 = [v6 count];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, v13, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke;
  v43[3] = &unk_1E60AAD60;
  v16 = Mutable;
  v44 = v16;
  v17 = v15;
  v45 = v17;
  v18 = (void *)MEMORY[0x1BA994060](v43);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_2;
  v39[3] = &unk_1E60AAD88;
  id v19 = v8;
  id v40 = v19;
  __int16 v20 = v16;
  v41 = v20;
  id v21 = v18;
  id v42 = v21;
  __int16 v22 = (void *)MEMORY[0x1BA994060](v39);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_41;
  v35[3] = &unk_1E60AADB0;
  v35[4] = self;
  id v23 = v21;
  id v37 = v23;
  id v24 = v19;
  id v36 = v24;
  id v25 = v22;
  id v38 = v25;
  [v6 enumerateRecordsAndReasonsUsingBlock:v35];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v51 = __Block_byref_object_copy__21337;
  v52 = __Block_byref_object_dispose__21338;
  id v53 = 0;
  int v26 = *((unsigned __int8 *)v47 + 24);
  if (*((unsigned char *)v47 + 24))
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_46;
    v29[3] = &unk_1E60AADD8;
    id v30 = v6;
    v31 = self;
    v33 = &v46;
    v34 = buf;
    v32 = v17;
    [(__CFDictionary *)v20 enumerateKeysAndObjectsUsingBlock:v29];

    int v26 = *((unsigned __int8 *)v47 + 24);
  }
  if (a4 && !v26)
  {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
    int v26 = *((unsigned __int8 *)v47 + 24);
  }
  BOOL v27 = v26 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v46, 8);
  return v27;
}

void __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = a3;
  unint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];

  if (!v8)
  {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v9];
    [*(id *)(a1 + 40) setObject:a4 forKeyedSubscript:v9];
  }
}

void __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = *(void **)(a1 + 32);
  unint64_t v5 = 0x1E60A5000uLL;
  uint64_t v6 = objc_opt_class();
  v29 = v3;
  id v7 = [v3 scopedIdentifier];
  unint64_t v8 = [v4 allChangesWithClass:v6 relatedScopedIdentifier:v7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v32;
    CFIndex v13 = &unk_1E9D43000;
    *(void *)&long long v10 = 138412546;
    long long v28 = v10;
    BOOL v14 = @"Master has been quarantined";
    do
    {
      uint64_t v15 = 0;
      uint64_t v30 = v11;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v15), "scopedIdentifier", v28);
        v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:v16];

        if (!v17)
        {
          if (!v13[2752])
          {
            v18 = __CPLStorageOSLogDomain_21324();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              [v29 scopedIdentifier];
              uint64_t v19 = a1;
              uint64_t v20 = v12;
              id v21 = v8;
              __int16 v22 = v14;
              id v23 = v13;
              v25 = unint64_t v24 = v5;
              *(_DWORD *)buf = v28;
              id v36 = v16;
              __int16 v37 = 2112;
              id v38 = v25;
              _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "Automatically adding %@ to quarantine because %@ has been quarantined", buf, 0x16u);

              unint64_t v5 = v24;
              CFIndex v13 = v23;
              BOOL v14 = v22;
              unint64_t v8 = v21;
              uint64_t v12 = v20;
              a1 = v19;
              uint64_t v11 = v30;
            }
          }
          uint64_t v26 = *(void *)(a1 + 48);
          uint64_t v27 = objc_opt_class();
          (*(void (**)(uint64_t, void *, __CFString *, uint64_t))(v26 + 16))(v26, v16, v14, v27);
        }

        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v11);
  }
}

void __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_41(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (void *)a1[4];
  id v7 = a3;
  [v6 _sendQuarantineFeedbackWithRecordClass:objc_opt_class() reason:v7];
  unint64_t v8 = [v5 scopedIdentifier];
  uint64_t v9 = a1[6];
  uint64_t v10 = objc_opt_class();
  (*(void (**)(uint64_t, void *, id, uint64_t))(v9 + 16))(v9, v8, v7, v10);

  if ([v5 isAssetChange] && objc_msgSend(v5, "isFullRecord"))
  {
    uint64_t v11 = (void *)a1[5];
    uint64_t v12 = [v5 relatedScopedIdentifier];
    CFIndex v13 = [v11 changeWithScopedIdentifier:v12];

    if (v13 && [v13 isFullRecord])
    {
      BOOL v14 = [v13 scopedIdentifier];
      if (!_CPLSilentLogging)
      {
        uint64_t v15 = __CPLStorageOSLogDomain_21324();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = [v5 scopedIdentifier];
          int v19 = 138412546;
          uint64_t v20 = v14;
          __int16 v21 = 2112;
          __int16 v22 = v16;
          _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Automatically adding %@ to quarantine because %@ has been quarantined", (uint8_t *)&v19, 0x16u);
        }
      }
      uint64_t v17 = a1[6];
      uint64_t v18 = objc_opt_class();
      (*(void (**)(uint64_t, void *, __CFString *, uint64_t))(v17 + 16))(v17, v14, @"Asset has been quarantined", v18);
      (*(void (**)(void))(a1[7] + 16))();
    }
  }
  else if ([v5 isMasterChange] && objc_msgSend(v5, "isFullRecord"))
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_46(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) recordWithScopedIdentifier:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    if ([v9 isDelete])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v11 = __CPLStorageOSLogDomain_21324();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v10;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Removing %@ from push repository", buf, 0xCu);
        }
      }
      uint64_t v12 = [*(id *)(a1 + 40) engineStore];
      CFIndex v13 = [v12 pushRepository];
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v14 + 40);
      char v15 = [v13 discardChangeWithScopedIdentifier:v7 error:&obj];
      objc_storeStrong((id *)(v14 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
    }
    else
    {
      uint64_t v20 = *(void **)(a1 + 40);
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      id v25 = *(id *)(v22 + 40);
      LOBYTE(v20) = [v20 addQuarantinedRecordWithScopedIdentifier:v7 recordClass:v21 reason:v8 error:&v25];
      objc_storeStrong((id *)(v22 + 40), v25);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v20;
    }
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
    uint64_t v17 = *(void **)(a1 + 40);
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v24 = *(id *)(v18 + 40);
    char v19 = [v17 addQuarantinedRecordWithScopedIdentifier:v7 recordClass:v16 reason:v8 error:&v24];
    objc_storeStrong((id *)(v18 + 40), v24);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v19;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
}

- (void)_sendQuarantineFeedbackWithRecordClass:(Class)a3 reason:(id)a4
{
  id v13 = a4;
  if (!self->_quarantineMessages)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    quarantineMessages = self->_quarantineMessages;
    self->_quarantineMessages = v6;
  }
  id v8 = [CPLQuarantineFeedbackMessage alloc];
  uint64_t v9 = [(CPLEngineStorage *)self engineStore];
  uint64_t v10 = [v9 engineLibrary];
  uint64_t v11 = [v10 libraryIdentifier];
  uint64_t v12 = [(CPLQuarantineFeedbackMessage *)v8 initWithClass:a3 reason:v13 libraryIdentifier:v11];

  [(NSMutableArray *)self->_quarantineMessages addObject:v12];
}

- (unint64_t)countOfQuarantinedRecordsInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 countOfQuarantinedRecordsInScopeWithIdentifier:v4];

  return v6;
}

- (unint64_t)countOfQuarantinedRecords
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 countOfQuarantinedRecords];

  return v3;
}

- (Class)classForQuarantinedRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 classForQuarantinedRecordWithScopedIdentifier:v4];

  return (Class)v6;
}

- (BOOL)isRecordWithScopedIdentifierQuarantined:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 isRecordWithScopedIdentifierQuarantined:v4];

  return v6;
}

- (BOOL)removeQuarantinedRecordWithScopedIdentifier:(id)a3 notify:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v16 = 0;
  uint64_t v9 = [(CPLEngineStorage *)self platformObject];
  int v10 = [v9 removeQuarantinedRecordWithScopedIdentifier:v8 removed:&v16 error:a5];

  if (v10 && v16 && v6)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v11 = __CPLStorageOSLogDomain_21324();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v8;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ from quarantine", buf, 0xCu);
      }
    }
    uint64_t v12 = [(CPLEngineStorage *)self engineStore];
    id v13 = [v12 statusCenter];

    uint64_t v14 = [v13 recordViewForStatusWithScopedIdentifier:v8];
    LOBYTE(v10) = [v13 notifyStatusForRecordViewHasChanged:v14 persist:1 error:a5];
  }
  return v10;
}

- (BOOL)addQuarantinedRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 reason:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if ([(objc_class *)a4 shouldReallyQuarantineRecord])
  {
    uint64_t v12 = [(CPLEngineStorage *)self platformObject];
    int v13 = [v12 addQuarantinedRecordWithScopedIdentifier:v10 recordClass:a4 reason:v11 error:a6];

    if (!v13) {
      goto LABEL_10;
    }
  }
  else if (!_CPLSilentLogging)
  {
    uint64_t v14 = __CPLStorageOSLogDomain_21324();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412546;
      Class v23 = a4;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Dropping but not quarantining <%@ %{public}@>", (uint8_t *)&v22, 0x16u);
    }
  }
  char v15 = [(CPLEngineStorage *)self engineStore];
  char v16 = [v15 pushRepository];
  int v17 = [v16 discardChangeWithScopedIdentifier:v10 error:a6];

  if (!v17)
  {
LABEL_10:
    char v20 = 0;
    goto LABEL_11;
  }
  id v18 = [(CPLEngineStorage *)self engineStore];
  uint64_t v19 = [v18 statusCenter];

  char v20 = [v19 notifyStatusForRecordWithScopedIdentifierHasChanged:v10 recordClass:a4 persist:1 error:a6];
LABEL_11:

  return v20;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v10 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  return (char)a6;
}

- (unint64_t)scopeType
{
  return 1;
}

+ (unint64_t)quarantineRetryCount
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unint64_t v3 = [v2 integerForKey:@"CPLQuarantineRetryCount"];

  return v3;
}

@end