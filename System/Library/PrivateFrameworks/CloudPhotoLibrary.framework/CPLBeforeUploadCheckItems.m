@interface CPLBeforeUploadCheckItems
- (BOOL)checkBatchWithFoundRecords:(id)a3 error:(id *)a4;
- (BOOL)hasDroppedSomeResources;
- (BOOL)prepareBatchBeforeUploadWithError:(id *)a3;
- (BOOL)requestFetchOfRecordWithScopedIdentifier:(id)a3 forItem:(id)a4 rule:(id)a5 error:(id *)a6;
- (BOOL)shouldCheckOverQuotaChangesWithServer;
- (BOOL)shouldResetExceedingQuotaOnSuccessfulUpload;
- (BOOL)transportHasRecordWithScopedIdentifier:(id)a3;
- (BOOL)willUploadSomeResources;
- (CPLBeforeUploadCheckItems)initWithBatch:(id)a3 targetMapping:(id)a4 ruleGroups:(int64_t)a5 pushRepositoryPriority:(unint64_t)a6 provider:(id)a7;
- (CPLBeforeUploadCheckItemsProvider)provider;
- (CPLChangeBatch)batchToUpload;
- (CPLChangeBatch)originalBatch;
- (CPLRecordTargetMapping)targetMapping;
- (NSArray)fetchRules;
- (NSArray)recordsNeedingGeneratedDerivatives;
- (NSArray)recordsToFetch;
- (NSDictionary)itemsToReinject;
- (NSString)sharingScopeIdentifier;
- (id)itemWithScopedIdentifier:(id)a3;
- (id)recordFromTransportWithScopedIdentifier:(id)a3;
- (id)willUploadCloudResource:(id)a3 localResource:(id)a4 forItem:(id)a5 error:(id *)a6;
- (int64_t)ruleGroups;
- (unint64_t)countOfAssetsWithResourcesToUpload;
- (unint64_t)estimatedUploadResourceSize;
- (unint64_t)pushRepositoryPriority;
- (void)addAdditionalRecordWithScopedIdentifierToUploadBatch:(id)a3;
- (void)itemShouldBeReinjectedInPushRepository:(id)a3;
- (void)itemWillDropResourceChange:(id)a3;
- (void)setSharingScopeIdentifier:(id)a3;
- (void)setShouldCheckOverQuotaChangesWithServer:(BOOL)a3;
@end

@implementation CPLBeforeUploadCheckItems

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_originalBatch, 0);
  objc_storeStrong((id *)&self->_itemsToReinject, 0);
  objc_storeStrong((id *)&self->_fetchRules, 0);
  objc_storeStrong((id *)&self->_additionalRecords, 0);
  objc_storeStrong((id *)&self->_assetsWithResourcesToUpload, 0);
  objc_storeStrong((id *)&self->_nonAssetsWithResourcesToUpload, 0);
  objc_storeStrong((id *)&self->_recordsToFetch, 0);
  objc_storeStrong((id *)&self->_foundRecords, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (BOOL)hasDroppedSomeResources
{
  return self->_hasDroppedSomeResources;
}

- (void)setShouldCheckOverQuotaChangesWithServer:(BOOL)a3
{
  self->_shouldCheckOverQuotaChangesWithServer = a3;
}

- (BOOL)shouldCheckOverQuotaChangesWithServer
{
  return self->_shouldCheckOverQuotaChangesWithServer;
}

- (void)setSharingScopeIdentifier:(id)a3
{
}

- (NSString)sharingScopeIdentifier
{
  return self->_sharingScopeIdentifier;
}

- (unint64_t)pushRepositoryPriority
{
  return self->_pushRepositoryPriority;
}

- (int64_t)ruleGroups
{
  return self->_ruleGroups;
}

- (CPLBeforeUploadCheckItemsProvider)provider
{
  return self->_provider;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (CPLChangeBatch)originalBatch
{
  return self->_originalBatch;
}

- (id)itemWithScopedIdentifier:(id)a3
{
  return [(NSDictionary *)self->_items objectForKeyedSubscript:a3];
}

- (void)addAdditionalRecordWithScopedIdentifierToUploadBatch:(id)a3
{
  id v9 = a3;
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_additionalRecords, "objectForKeyedSubscript:");
  if (!v4)
  {
    if (!self->_additionalRecords)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      additionalRecords = self->_additionalRecords;
      self->_additionalRecords = v5;
    }
    uint64_t v7 = [(CPLBeforeUploadCheckItemsProvider *)self->_provider knownCloudRecordWithScopedIdentifier:v9];
    if (v7)
    {
      v4 = (void *)v7;
      [(NSMutableDictionary *)self->_additionalRecords setObject:v7 forKeyedSubscript:v9];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableDictionary *)self->_additionalRecords setObject:v8 forKeyedSubscript:v9];

      v4 = 0;
    }
  }
}

- (id)recordFromTransportWithScopedIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  foundRecords = self->_foundRecords;
  if (!foundRecords)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "%@ should only be called within -checkBatchWithFoundRecords:error:", buf, 0xCu);
      }
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m"];
    v13 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, v12, 309, @"%@ should only be called within -checkBatchWithFoundRecords:error:", v13 object file lineNumber description];

    abort();
  }
  uint64_t v7 = [(NSDictionary *)foundRecords objectForKeyedSubscript:v5];

  return v7;
}

- (BOOL)transportHasRecordWithScopedIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  foundRecords = self->_foundRecords;
  if (!foundRecords)
  {
    if (!_CPLSilentLogging)
    {
      v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "%@ should only be called within -checkBatchWithFoundRecords:error:", buf, 0xCu);
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m"];
    v14 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, v13, 304, @"%@ should only be called within -checkBatchWithFoundRecords:error:", v14 object file lineNumber description];

    abort();
  }
  uint64_t v7 = [(NSDictionary *)foundRecords objectForKeyedSubscript:v5];
  BOOL v8 = v7 != 0;

  return v8;
}

- (void)itemShouldBeReinjectedInPushRepository:(id)a3
{
  id v4 = a3;
  itemsToReinject = self->_itemsToReinject;
  id v9 = v4;
  if (!itemsToReinject)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = self->_itemsToReinject;
    self->_itemsToReinject = v6;

    id v4 = v9;
    itemsToReinject = self->_itemsToReinject;
  }
  BOOL v8 = [v4 scopedIdentifier];
  [(NSMutableDictionary *)itemsToReinject setObject:v9 forKeyedSubscript:v8];
}

- (void)itemWillDropResourceChange:(id)a3
{
  id v4 = a3;
  if ([v4 isAsset])
  {
    unint64_t v5 = [(NSMutableDictionary *)self->_assetsWithResourcesToUpload count];
    assetsWithResourcesToUpload = self->_assetsWithResourcesToUpload;
    uint64_t v7 = [v4 scopedIdentifier];

    [(NSMutableDictionary *)assetsWithResourcesToUpload removeObjectForKey:v7];
    BOOL v8 = self->_assetsWithResourcesToUpload;
  }
  else
  {
    unint64_t v5 = [(NSMutableDictionary *)self->_nonAssetsWithResourcesToUpload count];
    nonAssetsWithResourcesToUpload = self->_nonAssetsWithResourcesToUpload;
    v10 = [v4 scopedIdentifier];

    [(NSMutableDictionary *)nonAssetsWithResourcesToUpload removeObjectForKey:v10];
    BOOL v8 = self->_nonAssetsWithResourcesToUpload;
  }
  if ([(NSMutableDictionary *)v8 count] < v5) {
    self->_hasDroppedSomeResources = 1;
  }
}

- (id)willUploadCloudResource:(id)a3 localResource:(id)a4 forItem:(id)a5 error:(id *)a6
{
  id v10 = a5;
  v11 = [(CPLBeforeUploadCheckItemsProvider *)self->_provider willUploadCloudResource:a3 localResource:a4 error:a6];
  if (v11)
  {
    if ([v10 isAsset]) {
      assetsWithResourcesToUpload = self->_assetsWithResourcesToUpload;
    }
    else {
      assetsWithResourcesToUpload = self->_nonAssetsWithResourcesToUpload;
    }
    v13 = [v10 scopedIdentifier];
    [(NSMutableDictionary *)assetsWithResourcesToUpload setObject:v10 forKeyedSubscript:v13];
  }
  return v11;
}

- (BOOL)requestFetchOfRecordWithScopedIdentifier:(id)a3 forItem:(id)a4 rule:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (([(NSMutableSet *)self->_recordsToFetch containsObject:v9] & 1) == 0)
  {
    if (![(CPLBeforeUploadCheckItemsProvider *)self->_provider willNeedToAccessRecordWithScopedIdentifier:v9 error:a6])
    {
      BOOL v17 = 0;
      goto LABEL_10;
    }
    recordsToFetch = self->_recordsToFetch;
    if (!recordsToFetch)
    {
      v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v13 = self->_recordsToFetch;
      self->_recordsToFetch = v12;

      recordsToFetch = self->_recordsToFetch;
    }
    [(NSMutableSet *)recordsToFetch addObject:v9];
  }
  fetchRules = self->_fetchRules;
  if (!fetchRules)
  {
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v16 = self->_fetchRules;
    self->_fetchRules = v15;

    fetchRules = self->_fetchRules;
  }
  [(NSMutableSet *)fetchRules addObject:v10];
  BOOL v17 = 1;
LABEL_10:

  return v17;
}

- (BOOL)checkBatchWithFoundRecords:(id)a3 error:(id *)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  p_foundRecords = &self->_foundRecords;
  objc_storeStrong((id *)&self->_foundRecords, a3);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v50 = self;
  id v10 = self->_originalBatch;
  uint64_t v11 = [(CPLChangeBatch *)v10 countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v51 = 0;
    obj = v10;
    SEL v45 = a2;
    v46 = a4;
    v47 = &self->_foundRecords;
    id v48 = v8;
    v13 = 0;
    v53 = 0;
    uint64_t v54 = *(void *)v57;
    char v49 = 1;
    v14 = self;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v57 != v54) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void **)(*((void *)&v56 + 1) + 8 * v15);
      BOOL v17 = (void *)MEMORY[0x1BA993DF0]();
      v18 = [v16 scopedIdentifier];
      v19 = [(NSDictionary *)v14->_items objectForKeyedSubscript:v18];
      if (!v19)
      {
        if (!_CPLSilentLogging)
        {
          v42 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v18;
            _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_ERROR, "Failed to find %@ in items to check", buf, 0xCu);
          }
        }
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m"];
        [v43 handleFailureInMethod:v45, v14, v44, 207, @"Failed to find %@ in items to check", v18 object file lineNumber description];

        abort();
      }
      v20 = v19;
      id v55 = 0;
      char v21 = [(CPLBeforeUploadCheckItems *)v19 checkBeforeUploadWithError:&v55];
      id v22 = v55;
      if (v21)
      {
        int v23 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v24 = __CPLCheckOSLogDomain();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v65 = v20;
            __int16 v66 = 2112;
            id v67 = v22;
            _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_ERROR, "Failed to check %@: %@", buf, 0x16u);
          }
        }
        if ([v22 isCPLErrorWithCode:18])
        {
          v25 = [v22 userInfo];
          uint64_t v26 = [v25 objectForKeyedSubscript:@"CPLErrorRejectedReasonKey"];
          v27 = (void *)v26;
          v28 = @"change was rejected before being sent to transport";
          if (v26) {
            v28 = (__CFString *)v26;
          }
          v29 = v28;

          id v30 = v53;
          if (!v53)
          {
            id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);

            v13 = v31;
          }
          [v13 addObject:v29];
          v53 = v30;
          [v30 setObject:v29 forKeyedSubscript:v18];
          int v23 = 1;
          v14 = v50;
        }
        else
        {
          char v49 = 0;
          int v23 = 0;
          v29 = v51;
          v51 = (__CFString *)v22;
        }
      }
      if (!v23) {
        break;
      }
      if (v12 == ++v15)
      {
        uint64_t v12 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }

    if ((v49 & (v53 != 0)) == 1)
    {
      if ([v53 count] == 1)
      {
        v62 = @"CPLErrorRejectedRecordIdentifiersAndReasons";
        v63 = v53;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        v33 = [v53 allValues];
        v34 = [(__CFString *)v33 firstObject];
        id v35 = +[CPLErrors cplErrorWithCode:18, 0, v32, @"%@", v34 underlyingError userInfo description];

        v36 = v33;
        p_foundRecords = v47;
        id v8 = v48;
      }
      else
      {
        v60 = @"CPLErrorRejectedRecordIdentifiersAndReasons";
        v61 = v53;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 18, 0, v32, @"%lu changes were rejected before sending them to the transport", [v53 count]);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        p_foundRecords = v47;
        id v8 = v48;
        v36 = v51;
      }
      v37 = v46;

      goto LABEL_36;
    }
    p_foundRecords = v47;
    id v8 = v48;
    id v35 = v51;
    v37 = v46;
    if ((v49 & 1) == 0)
    {
LABEL_36:
      if (v37)
      {
        id v35 = v35;
        BOOL v39 = 0;
        id *v37 = v35;
      }
      else
      {
        BOOL v39 = 0;
      }
      goto LABEL_39;
    }
  }
  else
  {

    id v35 = 0;
    v13 = 0;
    v53 = 0;
  }
  if (!_CPLSilentLogging)
  {
    v38 = __CPLCheckOSLogDomain();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v50;
      _os_log_impl(&dword_1B4CAC000, v38, OS_LOG_TYPE_DEBUG, "Checked %@", buf, 0xCu);
    }
  }
  BOOL v39 = 1;
LABEL_39:
  v40 = *p_foundRecords;
  *p_foundRecords = 0;

  return v39;
}

- (BOOL)prepareBatchBeforeUploadWithError:(id *)a3
{
  id v4 = self;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[CPLChangeBatch count](self->_originalBatch, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v6 = v4->_originalBatch;
  uint64_t v48 = [(CPLChangeBatch *)v6 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v48)
  {
    SEL v45 = 0;
    obj = v6;
    v41 = a3;
    id v7 = 0;
    v44 = 0;
    uint64_t v47 = *(void *)v51;
    char v43 = 1;
    v42 = v4;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v51 != v47) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v50 + 1) + 8 * v8);
      id v10 = (void *)MEMORY[0x1BA993DF0]();
      uint64_t v11 = [v9 scopedIdentifier];
      uint64_t v12 = [[CPLBeforeUploadCheckItem alloc] initWithChange:v9 checkItems:v4];
      id v49 = 0;
      LOBYTE(v9) = [(CPLBeforeUploadCheckItem *)v12 prepareWithError:&v49];
      id v13 = v49;
      if (v9)
      {
        [v5 setObject:v12 forKeyedSubscript:v11];
        int v14 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v15 = __CPLCheckOSLogDomain();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            long long v59 = v12;
            __int16 v60 = 2112;
            id v61 = v13;
            _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Failed to prepare %@: %@", buf, 0x16u);
          }
        }
        if ([v13 isCPLErrorWithCode:18])
        {
          id v16 = v7;
          BOOL v17 = v5;
          v18 = [v13 userInfo];
          uint64_t v19 = [v18 objectForKeyedSubscript:@"CPLErrorRejectedReasonKey"];
          v20 = (void *)v19;
          char v21 = @"change was rejected before being sent to transport";
          if (v19) {
            char v21 = (__CFString *)v19;
          }
          id v22 = v21;

          int v23 = v45;
          if (v45)
          {
            unint64_t v5 = v17;
            v24 = v44;
          }
          else
          {
            id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);

            v24 = v27;
            int v23 = v26;
            unint64_t v5 = v17;
          }
          v44 = v24;
          [v24 addObject:v22];
          SEL v45 = v23;
          [v23 setObject:v22 forKeyedSubscript:v11];

          int v14 = 1;
          id v7 = v16;
          id v4 = v42;
        }
        else
        {
          id v25 = v13;

          char v43 = 0;
          int v14 = 0;
          id v7 = v25;
        }
      }

      if (!v14) {
        break;
      }
      if (v48 == ++v8)
      {
        uint64_t v48 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v48) {
          goto LABEL_3;
        }
        break;
      }
    }

    v28 = v45;
    if ((v43 & (v45 != 0)) == 1)
    {
      if ([v45 count] == 1)
      {
        long long v56 = @"CPLErrorRejectedRecordIdentifiersAndReasons";
        long long v57 = v45;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        id v30 = [v45 allValues];
        [v30 firstObject];
        v32 = id v31 = v5;
        uint64_t v33 = +[CPLErrors cplErrorWithCode:18, 0, v29, @"%@", v32 underlyingError userInfo description];

        unint64_t v5 = v31;
        id v7 = v30;
        v28 = v45;
      }
      else
      {
        uint64_t v54 = @"CPLErrorRejectedRecordIdentifiersAndReasons";
        id v55 = v45;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        uint64_t v33 = +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 18, 0, v29, @"%lu changes were rejected before sending them to the transport", [v45 count]);
      }
      id v35 = v41;

      id v7 = (id)v33;
      v34 = v44;
      goto LABEL_35;
    }
    v34 = v44;
    id v35 = v41;
    if ((v43 & 1) == 0)
    {
LABEL_35:
      if (v35)
      {
        id v7 = v7;
        BOOL v39 = 0;
        *id v35 = v7;
      }
      else
      {
        BOOL v39 = 0;
      }
      goto LABEL_38;
    }
  }
  else
  {

    id v7 = 0;
    v34 = 0;
    v28 = 0;
  }
  if (!_CPLSilentLogging)
  {
    v36 = __CPLCheckOSLogDomain();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v59 = v4;
      _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_DEBUG, "Prepared %@", buf, 0xCu);
    }
  }
  uint64_t v37 = [v5 copy];
  items = v4->_items;
  v4->_items = (NSDictionary *)v37;

  BOOL v39 = 1;
LABEL_38:

  return v39;
}

- (BOOL)willUploadSomeResources
{
  return [(NSMutableDictionary *)self->_assetsWithResourcesToUpload count]
      || [(NSMutableDictionary *)self->_nonAssetsWithResourcesToUpload count] != 0;
}

- (unint64_t)estimatedUploadResourceSize
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  assetsWithResourcesToUpload = self->_assetsWithResourcesToUpload;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CPLBeforeUploadCheckItems_estimatedUploadResourceSize__block_invoke;
  v8[3] = &unk_1E60AA610;
  v8[4] = &v9;
  [(NSMutableDictionary *)assetsWithResourcesToUpload enumerateKeysAndObjectsUsingBlock:v8];
  nonAssetsWithResourcesToUpload = self->_nonAssetsWithResourcesToUpload;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CPLBeforeUploadCheckItems_estimatedUploadResourceSize__block_invoke_2;
  v7[3] = &unk_1E60AA610;
  v7[4] = &v9;
  [(NSMutableDictionary *)nonAssetsWithResourcesToUpload enumerateKeysAndObjectsUsingBlock:v7];
  unint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __56__CPLBeforeUploadCheckItems_estimatedUploadResourceSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 estimatedResourceUploadSize];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __56__CPLBeforeUploadCheckItems_estimatedUploadResourceSize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 estimatedResourceUploadSize];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)countOfAssetsWithResourcesToUpload
{
  return [(NSMutableDictionary *)self->_assetsWithResourcesToUpload count];
}

- (BOOL)shouldResetExceedingQuotaOnSuccessfulUpload
{
  if (self->_pushRepositoryPriority < 0x7D0) {
    return 0;
  }
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  items = self->_items;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__CPLBeforeUploadCheckItems_shouldResetExceedingQuotaOnSuccessfulUpload__block_invoke;
  v5[3] = &unk_1E60AA610;
  v5[4] = &v6;
  [(NSDictionary *)items enumerateKeysAndObjectsUsingBlock:v5];
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__CPLBeforeUploadCheckItems_shouldResetExceedingQuotaOnSuccessfulUpload__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 isTrashedOrDeletedAsset];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (NSArray)recordsNeedingGeneratedDerivatives
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__19265;
  uint64_t v11 = __Block_byref_object_dispose__19266;
  id v12 = 0;
  items = self->_items;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__CPLBeforeUploadCheckItems_recordsNeedingGeneratedDerivatives__block_invoke;
  v6[3] = &unk_1E60AA5E8;
  v6[5] = &v7;
  v6[6] = a2;
  v6[4] = self;
  [(NSDictionary *)items enumerateKeysAndObjectsUsingBlock:v6];
  BOOL v3 = (void *)v8[5];
  if (!v3) {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __63__CPLBeforeUploadCheckItems_recordsNeedingGeneratedDerivatives__block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  id v5 = a3;
  if ([v5 needsToGenerateDerivatives])
  {
    uint64_t v6 = [v5 change];
    if (!v6)
    {
      if (!_CPLSilentLogging)
      {
        id v12 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = [v5 changeClass];
          int v14 = [v5 scopedIdentifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v13;
          __int16 v24 = 2112;
          id v25 = v14;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "<%@ %@> needs to generate derivatives yet has no change to upload", buf, 0x16u);
        }
      }
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = a1[6];
      uint64_t v17 = a1[4];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m"];
      uint64_t v19 = [v5 changeClass];
      v20 = [v5 scopedIdentifier];
      [v15 handleFailureInMethod:v16, v17, v18, 103, @"<%@ %@> needs to generate derivatives yet has no change to upload", v19, v20 object file lineNumber description];

      abort();
    }
    uint64_t v7 = (void *)v6;
    uint64_t v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
    if (!v8)
    {
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1[4] + 8), "count"));
      uint64_t v10 = *(void *)(a1[5] + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
    }
    [v8 addObject:v7];
  }
}

- (NSDictionary)itemsToReinject
{
  if (self->_itemsToReinject) {
    return (NSDictionary *)self->_itemsToReinject;
  }
  else {
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (CPLChangeBatch)batchToUpload
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(CPLChangeBatch);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_originalBatch;
  uint64_t v5 = [(CPLChangeBatch *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        items = self->_items;
        uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) scopedIdentifier];
        uint64_t v11 = [(NSDictionary *)items objectForKeyedSubscript:v10];

        id v12 = [v11 change];
        if (v12) {
          [(CPLChangeBatch *)v3 addRecord:v12];
        }
      }
      uint64_t v6 = [(CPLChangeBatch *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  if ([(NSMutableDictionary *)self->_additionalRecords count])
  {
    additionalRecords = self->_additionalRecords;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__CPLBeforeUploadCheckItems_batchToUpload__block_invoke;
    v15[3] = &unk_1E60AB2F0;
    uint64_t v16 = v3;
    [(NSMutableDictionary *)additionalRecords enumerateKeysAndObjectsUsingBlock:v15];
  }
  return v3;
}

void __42__CPLBeforeUploadCheckItems_batchToUpload__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  uint64_t v5 = v6;
  if (v4 != v6)
  {
    [*(id *)(a1 + 32) _addAdditionalRecord:v6];
    uint64_t v5 = v6;
  }
}

- (NSArray)fetchRules
{
  return (NSArray *)[(NSMutableSet *)self->_fetchRules allObjects];
}

- (NSArray)recordsToFetch
{
  return (NSArray *)[(NSMutableSet *)self->_recordsToFetch allObjects];
}

- (CPLBeforeUploadCheckItems)initWithBatch:(id)a3 targetMapping:(id)a4 ruleGroups:(int64_t)a5 pushRepositoryPriority:(unint64_t)a6 provider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CPLBeforeUploadCheckItems;
  uint64_t v16 = [(CPLBeforeUploadCheckItems *)&v23 init];
  long long v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_originalBatch, a3);
    objc_storeStrong((id *)&v17->_targetMapping, a4);
    objc_storeStrong((id *)&v17->_provider, a7);
    long long v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nonAssetsWithResourcesToUpload = v17->_nonAssetsWithResourcesToUpload;
    v17->_nonAssetsWithResourcesToUpload = v18;

    long long v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetsWithResourcesToUpload = v17->_assetsWithResourcesToUpload;
    v17->_assetsWithResourcesToUpload = v20;

    v17->_ruleGroups = a5;
    v17->_pushRepositoryPriority = a6;
  }

  return v17;
}

@end