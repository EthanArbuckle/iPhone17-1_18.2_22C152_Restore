@interface CPLRecordStorageView
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (id)compactedBatchFromExpandedBatch:(id)a3;
- (id)description;
- (id)localChangeBatchFromCloudBatch:(id)a3 usingMapping:(id)a4 withError:(id *)a5;
- (id)recordViewWithScopedIdentifier:(id)a3;
- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)redactedDescription;
- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3;
- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 record:(id *)a5 error:(id *)a6;
- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 recordClass:(Class *)a5 error:(id *)a6;
- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
@end

@implementation CPLRecordStorageView

- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 recordClass:(Class *)a5 error:(id *)a6
{
  id v11 = 0;
  v7 = [(CPLRecordStorageView *)self resourceOfType:a3 forRecordWithScopedIdentifier:a4 record:&v11 error:a6];
  id v8 = v11;
  v9 = v8;
  if (a5 && v7) {
    *a5 = (Class)[v8 recordClass];
  }

  return v7;
}

- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 record:(id *)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = [(CPLRecordStorageView *)self recordViewWithScopedIdentifier:v10];
  v12 = v11;
  if (!v11)
  {
    if (a6)
    {
      v20 = +[CPLErrors cplErrorWithCode:25, @"Record %@ does not exist", v10 description];
LABEL_16:
      id v21 = 0;
      *a6 = v20;
      goto LABEL_23;
    }
LABEL_22:
    id v21 = 0;
    goto LABEL_23;
  }
  if (([v11 supportsResources] & 1) == 0)
  {
    if (a6)
    {
      v20 = +[CPLErrors incorrectParametersErrorForParameter:@"itemScopedIdentifier"];
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v13 = [v12 changeForType:8];
  v14 = [v13 resources];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v15)
  {
LABEL_11:

LABEL_20:
    if (a6)
    {
      v22 = +[CPLResource shortDescriptionForResourceType:a3];
      *a6 = +[CPLErrors cplErrorWithCode:26, @"Record %@ has no resource of type %@", v10, v22 description];
    }
    goto LABEL_22;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v25;
LABEL_5:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v25 != v17) {
      objc_enumerationMutation(v14);
    }
    v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
    if ([v19 resourceType] == a3) {
      break;
    }
    if (v16 == ++v18)
    {
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  id v21 = v19;

  if (!v21) {
    goto LABEL_20;
  }
  if (a5)
  {
    *a5 = [v12 placeholderRecord];
  }
LABEL_23:

  return v21;
}

- (id)localChangeBatchFromCloudBatch:(id)a3 usingMapping:(id)a4 withError:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(CPLChangeBatch);
  v9 = [v7 engineStore];
  v45 = [v9 quarantinedRecords];
  v44 = [v9 cloudCache];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    v42 = v9;
    uint64_t v13 = *(void *)v51;
    *(void *)&long long v11 = 138412546;
    long long v41 = v11;
    v43 = v8;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
        if (objc_msgSend(v15, "changeType", v41) != 1024)
        {
          if (v7)
          {
            id v20 = [v15 translateToClientChangeUsingIDMapping:v7 error:a5];
          }
          else
          {
LABEL_14:
            id v20 = v15;
          }
          v19 = v20;
          if (!v20)
          {
LABEL_65:

            id v8 = 0;
            goto LABEL_66;
          }
          goto LABEL_16;
        }
        if (!v7) {
          goto LABEL_14;
        }
        char v49 = 0;
        uint64_t v16 = [v15 scopedIdentifier];
        uint64_t v17 = [v7 localScopedIdentifierForCloudScopedIdentifier:v16 isFinal:&v49];
        if (v17)
        {
          uint64_t v18 = (void *)v17;
        }
        else
        {
          uint64_t v18 = (void *)[v16 copy];
          int v32 = [v44 hasRecordWithScopedIdentifier:v16];
          if ((v32 & 1) == 0 && ![v45 isRecordWithScopedIdentifierQuarantined:v18])
          {
            if (!_CPLSilentLogging)
            {
              v34 = __CPLStorageOSLogDomain_10525();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v15;
                _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "Ignoring no-op delete for %@", buf, 0xCu);
              }
LABEL_61:
            }
            id v24 = 0;
            v28 = 0;
            goto LABEL_41;
          }
          uint64_t v33 = [v7 cloudScopedIdentifierForLocalScopedIdentifier:v18 isFinal:&v49];
          if (v33)
          {
            v34 = v33;
            if (!_CPLSilentLogging)
            {
              v35 = __CPLStorageOSLogDomain_10525();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v36 = @"quarantine";
                if (v32) {
                  v36 = @"cloud cache";
                }
                v55 = v15;
                __int16 v56 = 2112;
                v57 = v36;
                __int16 v58 = 2112;
                v59 = v34;
                _os_log_impl(&dword_1B4CAC000, v35, OS_LOG_TYPE_ERROR, "%@ has no ID mapping but exists in %@ but also as %@ for the client - ignoring this change", buf, 0x20u);
              }

              id v8 = v43;
            }
            goto LABEL_61;
          }
          if (!_CPLSilentLogging)
          {
            v37 = __CPLStorageOSLogDomain_10525();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v41;
              v38 = @"quarantine";
              if (v32) {
                v38 = @"cloud cache";
              }
              v55 = v15;
              __int16 v56 = 2112;
              v57 = v38;
              _os_log_impl(&dword_1B4CAC000, v37, OS_LOG_TYPE_DEFAULT, "%@ has no ID mapping but exists in %@ - client will have to delete it if necessary", buf, 0x16u);
            }

            id v8 = v43;
          }
        }
        v19 = (void *)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:v18];

        if (!v19) {
          goto LABEL_65;
        }
LABEL_16:
        id v21 = [v19 scopedIdentifier];
        v22 = [(CPLRecordStorageView *)self recordViewWithScopedIdentifier:v21];

        if ([v19 changeType] != 1024)
        {
          int v29 = [v19 isFullRecord];
          if (v22)
          {
            if (v29)
            {
              id v24 = v19;
            }
            else
            {
              v31 = objc_msgSend(v22, "changeForType:", ~objc_msgSend(v19, "changeType") & 0x7A);
              id v24 = (id)[v31 copy];

              [v24 applyChange:v19];
              [v24 setChangeType:0];
            }
            goto LABEL_33;
          }
          if ((v29 & 1) == 0)
          {
            if (!_CPLSilentLogging)
            {
              v30 = __CPLStorageOSLogDomain_10525();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v15;
                _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_ERROR, "Got a partial record %@ which is new to the cache", buf, 0xCu);
              }
            }
            [v19 setChangeType:0];
          }
LABEL_31:
          id v24 = 0;
          goto LABEL_33;
        }
        uint64_t v23 = objc_opt_class();
        if (v23 != objc_opt_class()) {
          goto LABEL_31;
        }
        id v24 = (id)[v22 recordClass];
        if (v24
          || ([v19 scopedIdentifier],
              long long v25 = objc_claimAutoreleasedReturnValue(),
              id v24 = (id)[v45 classForQuarantinedRecordWithScopedIdentifier:v25],
              v25,
              v24))
        {
          long long v26 = [v19 scopedIdentifier];
          uint64_t v27 = [v24 newDeleteChangeWithScopedIdentifier:v26];

          id v24 = 0;
          v28 = 0;
          v19 = (void *)v27;
          if (!v27) {
            goto LABEL_41;
          }
          goto LABEL_34;
        }
LABEL_33:

LABEL_34:
        [v19 setRecordChangeData:0];
        [v19 setSharingRecordChangeData:0];
        [(CPLChangeBatch *)v8 addRecord:v19];
        if (v24
          && ([v19 isFullRecord] & 1) == 0
          && ([v19 isDelete] & 1) == 0
          && (([v19 isMasterChange] & 1) != 0 || objc_msgSend(v19, "isAssetChange")))
        {
          [(CPLChangeBatch *)v8 _addAdditionalRecord:v24];
        }
        v28 = v19;
LABEL_41:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v39 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
      uint64_t v12 = v39;
      if (!v39)
      {
LABEL_66:
        v9 = v42;
        break;
      }
    }
  }

  return v8;
}

- (id)compactedBatchFromExpandedBatch:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v43 = objc_alloc_init(CPLChangeBatch);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v62;
    id v45 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v62 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ([v10 hasChangeType:2])
        {
          long long v11 = [v10 relatedScopedIdentifier];
          if (!v11) {
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v12 = [v10 scopedIdentifier];
          long long v11 = [(CPLRecordStorageView *)self relatedScopedIdentifierForRecordWithScopedIdentifier:v12];

          if (!v11) {
            goto LABEL_21;
          }
        }
        uint64_t v13 = [v4 objectForKey:v11];
        if (v13)
        {
          id v14 = (id)v13;
          uint64_t v15 = [v10 scopedIdentifier];
          uint64_t v16 = [v14 objectForKey:v15];

          if (v16) {
            BOOL v17 = _CPLSilentLogging == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            uint64_t v18 = __CPLStorageOSLogDomain_10525();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              [v14 objectForKey:v15];
              id v20 = v19 = v5;
              *(_DWORD *)buf = 138412546;
              v67 = v20;
              __int16 v68 = 2112;
              v69 = v10;
              _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "Expanded batch contains changes for the same record twice: %@ vs. %@", buf, 0x16u);

              id v5 = v19;
              id v4 = v45;
            }
          }
        }
        else
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v4 setObject:v14 forKey:v11];
          uint64_t v15 = [v10 scopedIdentifier];
        }
        [v14 setObject:v10 forKey:v15];

LABEL_21:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v7);
  }
  id v21 = v4;

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke;
  v57[3] = &unk_1E60A8378;
  id v22 = v41;
  id v58 = v22;
  v59 = self;
  uint64_t v23 = v43;
  v60 = v23;
  id v24 = (void *)MEMORY[0x1BA994060](v57);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke_8;
  v53[3] = &unk_1E60A83A0;
  v40 = v23;
  v54 = v40;
  id v44 = v22;
  id v55 = v44;
  id v42 = v24;
  id v56 = v42;
  long long v25 = (void (**)(void, void, void))MEMORY[0x1BA994060](v53);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v26 = v5;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v65 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v50 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        int v32 = objc_msgSend(v31, "scopedIdentifier", v40);
        uint64_t v33 = [v21 objectForKey:v32];
        v34 = [v26 additionalRecordWithScopedIdentifier:v32];
        v35 = [v31 compactedChangeWithRelatedChanges:v33 isOnlyChange:0 fullRecord:v34 usingStorageView:self];
        if (v35) {
          ((void (**)(void, void *, void *))v25)[2](v25, v35, v34);
        }
        if (v33) {
          [v21 removeObjectForKey:v32];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v65 count:16];
    }
    while (v28);
  }

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke_10;
  v47[3] = &unk_1E60A83C8;
  v47[4] = self;
  v48 = v25;
  v36 = v25;
  [v21 enumerateKeysAndObjectsUsingBlock:v47];
  v37 = v48;
  v38 = v40;

  return v38;
}

void __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  id v5 = [*(id *)(a1 + 40) recordViewWithScopedIdentifier:v4];

  uint64_t v6 = [v5 synthesizedRecord];

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLStorageOSLogDomain_10525();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Adding %@ as an additional record to the batch, just in case", (uint8_t *)&v8, 0xCu);
      }
    }
    [*(id *)(a1 + 48) _addAdditionalRecord:v6];
  }
}

void __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) addRecord:v5];
  if (([v5 isDelete] & 1) == 0)
  {
    if ([v5 isMasterChange])
    {
      if ([v5 isFullRecord])
      {
        uint64_t v7 = *(void **)(a1 + 40);
        int v8 = [v5 scopedIdentifier];
        [v7 addObject:v8];
LABEL_28:

        goto LABEL_29;
      }
      if (!v6)
      {
        uint64_t v13 = *(void *)(a1 + 48);
        int v8 = [v5 scopedIdentifier];
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v8);
        goto LABEL_28;
      }
      uint64_t v10 = *(void **)(a1 + 40);
      long long v11 = [v5 scopedIdentifier];
      [v10 addObject:v11];

      if (!_CPLSilentLogging)
      {
        uint64_t v12 = __CPLStorageOSLogDomain_10525();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          int v15 = 138412290;
          id v16 = v6;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Adding %@ as an additional record to the batch, just in case", (uint8_t *)&v15, 0xCu);
        }
      }
      [*(id *)(a1 + 32) _addAdditionalRecord:v6];
    }
    else if ([v5 isAssetChange])
    {
      if (([v5 isFullRecord] & 1) == 0)
      {
        if (v6)
        {
          if (!_CPLSilentLogging)
          {
            v9 = __CPLStorageOSLogDomain_10525();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              int v15 = 138412290;
              id v16 = v6;
              _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Adding %@ as an additional record to the batch, just in case", (uint8_t *)&v15, 0xCu);
            }
          }
          [*(id *)(a1 + 32) _addAdditionalRecord:v6];
        }
        else if (!_CPLSilentLogging)
        {
          id v14 = __CPLStorageOSLogDomain_10525();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v15 = 138412290;
            id v16 = v5;
            _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Expected to have a precomputed a full record for %@, but didn't", (uint8_t *)&v15, 0xCu);
          }
        }
      }
      int v8 = [v5 masterScopedIdentifier];
      if (v8 || ([v6 masterScopedIdentifier], (int v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (([*(id *)(a1 + 40) containsObject:v8] & 1) == 0) {
          (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v8);
        }
      }
      goto LABEL_28;
    }
  }
LABEL_29:
}

void __76__CPLRecordStorageView_CPLClientCacheView__compactedBatchFromExpandedBatch___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 recordViewWithScopedIdentifier:a2];
  id v9 = [v7 synthesizedRecord];

  int v8 = [v9 compactedChangeWithRelatedChanges:v6 isOnlyChange:1 fullRecord:v9 usingStorageView:*(void *)(a1 + 32)];

  if (v8) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(CPLRecordStorageView *)self recordViewsWithRelatedScopedIdentifier:a3 class:a4];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v5 = [v4 count];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v5 = 0;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = v8;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          --v10;
        }
        while (v10);
        v5 += v8;
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  return v5;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v3 = [(CPLRecordStorageView *)self recordViewWithScopedIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3
{
  id v3 = [(CPLRecordStorageView *)self recordViewWithScopedIdentifier:a3];
  BOOL v4 = [v3 relatedScopedIdentifier];

  return v4;
}

- (id)redactedDescription
{
  v2 = objc_opt_class();
  return (id)[v2 description];
}

- (id)description
{
  v2 = objc_opt_class();
  return (id)[v2 description];
}

- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLRecordStorageView.m"];
  uint64_t v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 86, @"%@ should be implemented by %@", v9, objc_opt_class() object file lineNumber description];

  abort();
}

- (id)recordViewWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLRecordStorageView.m"];
  uint64_t v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 81, @"%@ should be implemented by %@", v8, objc_opt_class() object file lineNumber description];

  abort();
}

@end