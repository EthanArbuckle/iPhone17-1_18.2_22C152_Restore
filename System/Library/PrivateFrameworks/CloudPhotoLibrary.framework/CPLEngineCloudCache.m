@interface CPLEngineCloudCache
- (BOOL)ackownledgeRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)addRecord:(id)a3 isFinal:(BOOL)a4 error:(id *)a5;
- (BOOL)applyBatch:(id)a3 isFinal:(BOOL)a4 direction:(unint64_t)a5 withError:(id *)a6;
- (BOOL)commitStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)confirmAllRecordsWithError:(id *)a3;
- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)discardStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)discardStagedChangesWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)hasAnyRecordWithRelatedScopedIdentifier:(id)a3;
- (BOOL)hasRecordAcknowledgedByClientWithScopedIdentifier:(id)a3;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)remapAllRecordsWithPreviousScopedIdentifier:(id)a3 newScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)updateFinalRecord:(id)a3 confirmed:(BOOL)a4 error:(id *)a5;
- (BOOL)updateStagedRecord:(id)a3 error:(id *)a4;
- (id)_invalidCloudCacheErrorWithInvalidRecord:(id)a3 method:(id)a4;
- (id)_otherScopedIdentifierForCloudScopedIdentifier:(id)a3 sharedScoped:(id)a4;
- (id)_targetWithRecord:(id)a3 cloudScopedIdentifier:(id)a4 trustRecordChangeData:(BOOL)a5;
- (id)_targetWithShareableRecord:(id)a3 cloudScopedIdentifier:(id)a4 otherScopedIdentifier:(id)a5 sharedScope:(id)a6 trustRecordChangeData:(BOOL)a7;
- (id)allRecordsIsFinal:(BOOL)a3;
- (id)cloudChangeBatchFromBatch:(id)a3 usingMapping:(id)a4 isFinal:(BOOL)a5 withError:(id *)a6;
- (id)recordAcknowledgedByClientWithScopedIdentifier:(id)a3;
- (id)recordWithScopedIdentifier:(id)a3 isConfirmed:(BOOL *)a4 isStaged:(BOOL *)a5;
- (id)recordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4;
- (id)recordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)recordsOfClass:(Class)a3 isFinal:(BOOL)a4;
- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5;
- (id)recordsWithRelatedScopedIdentifier:(id)a3 isFinal:(BOOL)a4;
- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4;
- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 record:(id *)a5 target:(id *)a6 error:(id *)a7;
- (id)targetForRecordWithCloudScopedIdentifier:(id)a3;
- (id)targetForRecordWithCloudScopedIdentifier:(id)a3 trustRecordChangeData:(BOOL)a4;
- (id)targetForRecordWithSharedCloudScopedIdentifier:(id)a3;
- (id)targetForRecordWithSharedCloudScopedIdentifier:(id)a3 trustRecordChangeData:(BOOL)a4;
- (unint64_t)countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (unint64_t)scopeType;
- (void)getCommittedRecord:(id *)a3 stagedRecord:(id *)a4 forScopedIdentifier:(id)a5;
- (void)updateStoredTargetsFromTargetMapping:(id)a3;
@end

@implementation CPLEngineCloudCache

- (id)allRecordsIsFinal:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CPLEngineStorage *)self platformObject];
  v5 = [v4 allRecordsIsFinal:v3];

  return v5;
}

- (id)recordsOfClass:(Class)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(CPLEngineStorage *)self platformObject];
  v7 = [v6 recordsOfClass:a3 isFinal:v4];

  return v7;
}

- (void)getCommittedRecord:(id *)a3 stagedRecord:(id *)a4 forScopedIdentifier:(id)a5
{
  id v8 = a5;
  v9 = [(CPLEngineStorage *)self platformObject];
  *a3 = [v9 recordWithScopedIdentifier:v8 isFinal:1 isConfirmed:0];

  v10 = [(CPLEngineStorage *)self platformObject];
  v11 = [v10 recordWithScopedIdentifier:v8 isFinal:0 isConfirmed:0];

  *a4 = v11;
  unint64_t v12 = (unint64_t)*a3;
  v13 = (void *)v12;
  unint64_t v14 = (unint64_t)*a4;
  if (!v12 || !v14)
  {
    unint64_t v16 = v12 | v14;

    if (v16) {
      return;
    }
    goto LABEL_6;
  }
  char v15 = objc_msgSend((id)v12, "isEqual:");

  if (v15) {
LABEL_6:
  }
    *a4 = 0;
}

- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 record:(id *)a5 target:(id *)a6 error:(id *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  v13 = [(CPLEngineCloudCache *)self recordWithScopedIdentifier:v12 isFinal:0];
  *a6 = [(CPLEngineCloudCache *)self _targetWithRecord:v13 cloudScopedIdentifier:v12 trustRecordChangeData:1];
  if (!v13)
  {
    if (a7)
    {
      v21 = @"Record does not exist";
      uint64_t v22 = 25;
LABEL_23:
      v23 = +[CPLErrors cplErrorWithCode:v22 description:v21];
      goto LABEL_24;
    }
LABEL_18:
    id v20 = 0;
    goto LABEL_25;
  }
  if (a5) {
    *a5 = [[CPLPlaceholderRecord alloc] initWithRecord:v13];
  }
  if (([v13 supportsResources] & 1) == 0)
  {
    if (a7)
    {
      v23 = +[CPLErrors incorrectParametersErrorForParameter:@"itemScopedIdentifier"];
LABEL_24:
      id v20 = 0;
      *a7 = v23;
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v14 = objc_msgSend(v13, "resources", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v19 resourceType] == a3)
        {
          id v20 = v19;
          goto LABEL_20;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  id v20 = 0;
LABEL_20:

  if (a7 && !v20)
  {
    v21 = @"Record does not have this type of resource";
    uint64_t v22 = 26;
    goto LABEL_23;
  }
LABEL_25:

  return v20;
}

- (void)updateStoredTargetsFromTargetMapping:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasUpdatedTargets])
  {
    if (!_CPLSilentLogging)
    {
      BOOL v4 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = [v3 updatedTargetsDescription];
        int v6 = 138543362;
        v7 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Updating targets:\n%{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    [v3 startTrackingUpdates];
  }
}

- (id)targetForRecordWithSharedCloudScopedIdentifier:(id)a3 trustRecordChangeData:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(CPLEngineStorage *)self engineStore];
  uint64_t v9 = [v8 sharingScopeIdentifier];
  if (!v9
    || (v10 = (void *)v9,
        [v7 scopeIdentifier],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqualToString:v10],
        v11,
        (v12 & 1) == 0))
  {
    if (!_CPLSilentLogging)
    {
      v41 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v7;
        _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_ERROR, "Trying to find target for %@ but sharing is not enabled", buf, 0xCu);
      }
    }
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineCloudCache.m"];
    [v42 handleFailureInMethod:a2, self, v43, 921, @"Trying to find target for %@ but sharing is not enabled", v7 object file lineNumber description];
LABEL_38:

    abort();
  }
  v13 = [v8 scopes];
  uint64_t v14 = [v13 scopeWithIdentifier:v10];
  if (!v14)
  {
    if (!_CPLSilentLogging)
    {
      v44 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v44, OS_LOG_TYPE_ERROR, "We should have a shared scope here", buf, 2u);
      }
    }
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineCloudCache.m"];
    v45 = @"We should have a shared scope here";
    v46 = v42;
    SEL v47 = a2;
    v48 = self;
    v49 = v43;
    uint64_t v50 = 924;
    goto LABEL_37;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = [v13 scopeForSharingScope:v14];
  if (!v16)
  {
    if (!_CPLSilentLogging)
    {
      v51 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v51, OS_LOG_TYPE_ERROR, "We should have a main scope here", buf, 2u);
      }
    }
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineCloudCache.m"];
    v45 = @"We should have a main scope here";
    v46 = v42;
    SEL v47 = a2;
    v48 = self;
    v49 = v43;
    uint64_t v50 = 926;
LABEL_37:
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v47, v48, v49, v50, v45, v52);
    goto LABEL_38;
  }
  uint64_t v17 = (void *)v16;
  v58 = v15;
  v59 = v13;
  v18 = [CPLScopedIdentifier alloc];
  v19 = [v17 scopeIdentifier];
  id v20 = [v7 identifier];
  v21 = [(CPLScopedIdentifier *)v18 initWithScopeIdentifier:v19 identifier:v20];

  uint64_t v22 = [(CPLEngineCloudCache *)self recordWithScopedIdentifier:v21 isFinal:0];
  if (v22)
  {
    v23 = (void *)v22;
  }
  else
  {
    v57 = v10;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v24 = [(CPLEngineStorage *)self engineStore];
    long long v25 = [v24 remappedRecords];
    long long v26 = [v25 scopedIdentifiersRemappedToScopedIdentifier:v7];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      v53 = v21;
      unsigned int v54 = v4;
      v55 = v8;
      id v56 = v7;
      uint64_t v29 = *(void *)v61;
      unint64_t v30 = 0x1E60A5000uLL;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          v32 = self;
          if (*(void *)v61 != v29) {
            objc_enumerationMutation(v26);
          }
          v33 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          id v34 = objc_alloc(*(Class *)(v30 + 2184));
          v35 = [v17 scopeIdentifier];
          v36 = [v33 identifier];
          v37 = (void *)[v34 initWithScopeIdentifier:v35 identifier:v36];

          self = v32;
          v38 = [(CPLEngineCloudCache *)v32 recordWithScopedIdentifier:v37 isFinal:0];
          if (v38)
          {
            v23 = v38;
            v21 = [v38 scopedIdentifier];

            uint64_t v8 = v55;
            id v7 = v56;
            uint64_t v4 = v54;
            goto LABEL_18;
          }

          unint64_t v30 = 0x1E60A5000;
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v60 objects:v64 count:16];
        if (v28) {
          continue;
        }
        break;
      }
      v23 = 0;
      uint64_t v8 = v55;
      id v7 = v56;
      uint64_t v4 = v54;
      v21 = v53;
    }
    else
    {
      v23 = 0;
    }
LABEL_18:

    v10 = v57;
  }
  v39 = [(CPLEngineCloudCache *)self _targetWithShareableRecord:v23 cloudScopedIdentifier:v21 otherScopedIdentifier:v7 sharedScope:v58 trustRecordChangeData:v4];

  return v39;
}

- (id)targetForRecordWithSharedCloudScopedIdentifier:(id)a3
{
  return [(CPLEngineCloudCache *)self targetForRecordWithSharedCloudScopedIdentifier:a3 trustRecordChangeData:0];
}

- (id)targetForRecordWithCloudScopedIdentifier:(id)a3 trustRecordChangeData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 scopeIdentifier];
  uint64_t v8 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [(CPLEngineStorage *)self engineStore];
    v11 = [v10 scopes];

    char v12 = [v6 scopeIdentifier];
    v13 = [v11 scopeWithIdentifier:v12];

    if (v13)
    {
      uint64_t v14 = [v11 sharingScopeForScope:v13];
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        uint64_t v16 = [(CPLEngineCloudCache *)self recordWithScopedIdentifier:v6 isFinal:0];
        uint64_t v17 = [(CPLEngineCloudCache *)self _otherScopedIdentifierForCloudScopedIdentifier:v6 sharedScoped:v15];
        v18 = [(CPLEngineCloudCache *)self _targetWithShareableRecord:v16 cloudScopedIdentifier:v6 otherScopedIdentifier:v17 sharedScope:v15 trustRecordChangeData:v4];

        goto LABEL_7;
      }
    }
  }
  v18 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v6];
LABEL_7:

  return v18;
}

- (id)targetForRecordWithCloudScopedIdentifier:(id)a3
{
  return [(CPLEngineCloudCache *)self targetForRecordWithCloudScopedIdentifier:a3 trustRecordChangeData:0];
}

- (id)_targetWithRecord:(id)a3 cloudScopedIdentifier:(id)a4 trustRecordChangeData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 scopeIdentifier];
  v11 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    v13 = [(CPLEngineStorage *)self engineStore];
    uint64_t v14 = [v13 scopes];

    uint64_t v15 = [v9 scopeIdentifier];
    uint64_t v16 = [v14 scopeWithIdentifier:v15];

    if (v16)
    {
      uint64_t v17 = [v14 sharingScopeForScope:v16];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [(CPLEngineCloudCache *)self _otherScopedIdentifierForCloudScopedIdentifier:v9 sharedScoped:v17];
        id v20 = [(CPLEngineCloudCache *)self _targetWithShareableRecord:v8 cloudScopedIdentifier:v9 otherScopedIdentifier:v19 sharedScope:v18 trustRecordChangeData:v5];

        goto LABEL_7;
      }
    }
  }
  id v20 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v9];
LABEL_7:

  return v20;
}

- (id)_targetWithShareableRecord:(id)a3 cloudScopedIdentifier:(id)a4 otherScopedIdentifier:(id)a5 sharedScope:(id)a6 trustRecordChangeData:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v15 scopeIdentifier];
  if (v12)
  {
    if ([v12 isMasterChange])
    {
      uint64_t v17 = [v12 recordChangeData];
      v18 = [v12 sharingRecordChangeData];
      v43 = (void *)v17;
      if (v17 && v18)
      {
        uint64_t v19 = 3;
      }
      else
      {
        id v42 = v18;
        v21 = [v12 scopedIdentifier];
        uint64_t v22 = [(CPLEngineCloudCache *)self recordsWithRelatedScopedIdentifier:v21 class:objc_opt_class() isFinal:0];

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v23 = v22;
        uint64_t v19 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v19)
        {
          BOOL v40 = v7;
          id v38 = v15;
          id v39 = v13;
          id v41 = v14;
          char v24 = 0;
          char v25 = 0;
          uint64_t v26 = *(void *)v45;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v45 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              uint64_t v29 = (void *)MEMORY[0x1BA993DF0]();
              char v30 = [v28 isSharedInScopeWithIdentifier:v16];
              v25 |= v30;
              v24 |= v30 ^ 1;
              if (v25 & 1) != 0 && (v24)
              {

                uint64_t v19 = 3;
                goto LABEL_27;
              }
            }
            uint64_t v19 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
            if (v19) {
              continue;
            }
            break;
          }

          if (v24) {
            uint64_t v19 = 3;
          }
          else {
            uint64_t v19 = 2;
          }
          if ((v25 & 1) == 0) {
            uint64_t v19 = v24 & 1;
          }
LABEL_27:
          id v15 = v38;
          id v13 = v39;
          id v14 = v41;
          BOOL v7 = v40;
        }
        else
        {
        }
        v18 = v42;
      }

      goto LABEL_32;
    }
    if (![v12 supportsSharingScopedIdentifier])
    {
      v31 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v13];
      goto LABEL_40;
    }
    if (![v12 isSharedInScopeWithIdentifier:v16])
    {
      uint64_t v19 = 1;
LABEL_32:
      if (v19 == 1 && v7)
      {
        v32 = [v12 sharingRecordChangeData];

        v33 = [v12 recordChangeData];

        uint64_t v34 = 2;
        if (v33) {
          uint64_t v34 = 3;
        }
        if (v32) {
          uint64_t v19 = v34;
        }
        else {
          uint64_t v19 = v33 != 0;
        }
      }
      goto LABEL_39;
    }
    id v20 = [v12 recordChangeData];

    if (v20)
    {
      uint64_t v19 = 3;
    }
    else
    {
      v37 = [v12 sharingRecordChangeData];

      if (v37) {
        uint64_t v19 = 2;
      }
      else {
        uint64_t v19 = 3;
      }
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_39:
  v31 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v13 otherScopedIdentifier:v14 targetState:v19];
LABEL_40:
  v35 = v31;

  return v35;
}

- (id)_otherScopedIdentifierForCloudScopedIdentifier:(id)a3 sharedScoped:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [CPLScopedIdentifier alloc];
  id v9 = [v6 scopeIdentifier];
  v10 = [v7 identifier];

  uint64_t v11 = [v6 cloudIndex];
  id v12 = [(CPLScopedIdentifier *)v8 initWithScopeIdentifier:v9 identifier:v10 scopeIndex:v11];

  id v13 = [(CPLEngineStorage *)self engineStore];
  id v14 = [v13 remappedRecords];
  id v15 = [v14 realScopedIdentifierForRemappedScopedIdentifier:v12];
  uint64_t v16 = v15;
  if (!v15) {
    id v15 = v12;
  }
  id v17 = v15;

  return v17;
}

- (BOOL)discardStagedChangesWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 discardStagedChangesWithScopeFilter:v6 error:a4];

  if (v8)
  {
    id v9 = [(CPLEngineStorage *)self engineStore];
    v10 = [v9 scopes];

    char v11 = [v10 discardStagedSyncAnchorWithScopeFilter:v6 error:a4];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)discardStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Discarding staged changes", v14, 2u);
    }
  }
  int v8 = [(CPLEngineStorage *)self platformObject];
  int v9 = [v8 discardStagedChangesForScopeWithIdentifier:v6 error:a4];

  if (v9)
  {
    v10 = [(CPLEngineStorage *)self engineStore];
    char v11 = [v10 scopes];

    id v12 = [v11 scopeWithIdentifier:v6];
    if (v12)
    {
      LOBYTE(v9) = [v11 discardStagedSyncAnchorForScope:v12 error:a4];
    }
    else if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
      LOBYTE(v9) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)commitStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Committing staged changes", v14, 2u);
    }
  }
  int v8 = [(CPLEngineStorage *)self platformObject];
  int v9 = [v8 commitStagedChangesForScopeWithIdentifier:v6 error:a4];

  if (v9)
  {
    v10 = [(CPLEngineStorage *)self engineStore];
    char v11 = [v10 scopes];

    id v12 = [v11 scopeWithIdentifier:v6];
    if (v12)
    {
      LOBYTE(v9) = [v11 commitSyncAnchorForScope:v12 error:a4];
      if ([v11 hasFinishedAFullSyncForScope:v12]) {
        LOBYTE(v9) = [v11 clearTransportGroupsForScope:v12 error:a4];
      }
    }
    else if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
      LOBYTE(v9) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)remapAllRecordsWithPreviousScopedIdentifier:(id)a3 newScopedIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!_CPLSilentLogging)
  {
    v10 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Remapping %@ -> %@", buf, 0x16u);
    }
  }
  char v11 = [(CPLEngineStorage *)self platformObject];
  id v16 = 0;
  char v12 = [v11 remapAllRecordsWithPreviousScopedIdentifier:v8 newScopedIdentifier:v9 error:&v16];
  id v13 = v16;

  if ((v12 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v14 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Can't remap: %@", buf, 0xCu);
      }
    }
    if (a5) {
      *a5 = v13;
    }
  }

  return v12;
}

- (BOOL)ackownledgeRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 ackownledgeRecordWithScopedIdentifier:v6 error:a4];

  return (char)a4;
}

- (unint64_t)countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  unint64_t v8 = [v7 countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:v6 class:a4];

  return v8;
}

- (id)recordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  unint64_t v8 = [v7 recordsAcknowledgedByClientWithRelatedScopedIdentifier:v6 class:a4];

  return v8;
}

- (BOOL)hasRecordAcknowledgedByClientWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasRecordAcknowledgedByClientWithScopedIdentifier:v4];

  return v6;
}

- (id)recordAcknowledgedByClientWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 recordAcknowledgedByClientWithScopedIdentifier:v4];

  return v6;
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  unint64_t v8 = [v7 relatedScopedIdentifierForRecordWithScopedIdentifier:v6 isFinal:v4];

  return v8;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(CPLEngineStorage *)self platformObject];
  v10 = [v9 recordsWithRelatedScopedIdentifier:v8 class:a4 isFinal:v5];

  return v10;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  id v8 = [v7 recordsWithRelatedScopedIdentifier:v6 isFinal:v4];

  return v8;
}

- (BOOL)hasAnyRecordWithRelatedScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasAnyRecordWithRelatedScopedIdentifier:v4];

  return v6;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasRecordWithScopedIdentifier:v4];

  return v6;
}

- (id)recordWithScopedIdentifier:(id)a3 isConfirmed:(BOOL *)a4 isStaged:(BOOL *)a5
{
  id v8 = a3;
  id v9 = [(CPLEngineStorage *)self platformObject];
  v10 = [v9 recordWithScopedIdentifier:v8 isConfirmed:a4 isStaged:a5];

  return v10;
}

- (id)recordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  id v8 = [v7 recordWithScopedIdentifier:v6 isFinal:v4 isConfirmed:0];

  return v8;
}

- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!_CPLSilentLogging)
  {
    id v9 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Deleting record %@", (uint8_t *)&v13, 0xCu);
    }
  }
  v10 = [(CPLEngineStorage *)self platformObject];
  char v11 = [v10 deleteRecordWithScopedIdentifier:v8 isFinal:v6 error:a5];

  return v11;
}

- (BOOL)confirmAllRecordsWithError:(id *)a3
{
  BOOL v4 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a3) = [v4 confirmAllRecordsWithError:a3];

  return (char)a3;
}

- (id)cloudChangeBatchFromBatch:(id)a3 usingMapping:(id)a4 isFinal:(BOOL)a5 withError:(id *)a6
{
  BOOL v152 = a5;
  uint64_t v217 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v167 = a4;
  v156 = self;
  v151 = [(CPLEngineStorage *)self engineStore];
  uint64_t v9 = 1;
  if (!v167) {
    uint64_t v9 = 2;
  }
  uint64_t v141 = v9;
  v10 = [v151 scopes];
  v153 = [v151 statusCenter];
  uint64_t v200 = 0;
  v201 = &v200;
  uint64_t v202 = 0x3032000000;
  v203 = __Block_byref_object_copy__17026;
  v204 = __Block_byref_object_dispose__17027;
  v205 = objc_alloc_init(CPLChangeBatch);
  if (v167)
  {
    v142 = [v151 transientPullRepository];
    id v148 = 0;
    v149 = 0;
    v145 = 0;
    v143 = 0;
    v160 = 0;
    v147 = 0;
  }
  else
  {
    char v11 = [v151 idMapping];
    v147 = [v151 remappedRecords];
    id v12 = v11;
    v149 = [v151 transactionClientCacheView];
    v143 = [v151 pullQueue];
    v145 = [v151 quarantinedRecords];
    id v13 = v12;
    id v148 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v160 = v13;

    v142 = 0;
  }
  uint64_t v194 = 0;
  v195 = (id *)&v194;
  uint64_t v196 = 0x3032000000;
  v197 = __Block_byref_object_copy__17026;
  v198 = __Block_byref_object_dispose__17027;
  id v199 = 0;
  v192[0] = 0;
  v192[1] = v192;
  v192[2] = 0x2020000000;
  char v193 = 0;
  v190[0] = 0;
  v190[1] = v190;
  v190[2] = 0x2020000000;
  char v191 = 0;
  v185[0] = MEMORY[0x1E4F143A8];
  v185[1] = 3221225472;
  v185[2] = __80__CPLEngineCloudCache_cloudChangeBatchFromBatch_usingMapping_isFinal_withError___block_invoke;
  v185[3] = &unk_1E60AA300;
  v187 = &v194;
  v188 = v192;
  v189 = v190;
  id v155 = v10;
  id v186 = v155;
  v162 = (void *)MEMORY[0x1BA994060](v185);
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v181 objects:v216 count:16];
  if (!v14)
  {
    v168 = 0;
    goto LABEL_283;
  }
  v168 = 0;
  uint64_t v159 = *(void *)v182;
  uint64_t v15 = "cloud";
  if (v167) {
    uint64_t v15 = "local";
  }
  v146 = v15;
  do
  {
    uint64_t v158 = v14;
    for (uint64_t i = 0; i != v158; ++i)
    {
      if (*(void *)v182 != v159) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v181 + 1) + 8 * i);
      v164 = [v17 scopedIdentifier];
      id v18 = [v164 scopeIdentifier];
      unint64_t v19 = v168;
      unint64_t v20 = v18;
      id v21 = (id)v20;
      v168 = (void *)v19;
      v166 = v20;
      if (v19 && v20)
      {
        char v22 = [(id)v19 isEqual:v20];
        id v23 = v21;
        char v24 = v22;

        if (v24) {
          goto LABEL_21;
        }
      }
      else
      {
        BOOL v25 = (v19 | v20) != 0;

        if (!v25)
        {
          v168 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v26 = [v155 scopeWithIdentifier:v166];
      if (!v26)
      {
        if (a6)
        {
          *a6 = +[CPLErrors invalidScopeErrorWithScopedIdentifier:v164];
        }
        v128 = v201[5];
        v201[5] = 0;
        goto LABEL_282;
      }
      uint64_t v27 = v166;

      objc_storeStrong(v195 + 5, v26);
      v168 = v27;
LABEL_21:
      uint64_t v28 = (uint64_t (*)(void *))v162[2];
      if (v167)
      {
        int v29 = 0;
        int v161 = v28(v162) ^ 1;
      }
      else
      {
        int v161 = 0;
        int v29 = v28(v162) ^ 1;
      }
      id v180 = 0;
      char v30 = [v17 validateChangeWithError:&v180];
      v165 = v180;
      if ((v30 & 1) == 0)
      {
        if (v167)
        {
          if (!_CPLSilentLogging)
          {
            v129 = __CPLStorageOSLogDomain_16994();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v17;
              __int16 v208 = 2112;
              v209 = v165;
              _os_log_impl(&dword_1B4CAC000, v129, OS_LOG_TYPE_ERROR, "Incorrect change %@ in push repository: %@", buf, 0x16u);
            }
          }
          v130 = +[CPLErrors cplErrorWithCode:20, v165, @"Incorrect change %@ in push repository", v17 underlyingError description];
          v131 = (void *)v201[5];
          v201[5] = 0;

          if (a6) {
            *a6 = v130;
          }

          v128 = v165;
          goto LABEL_282;
        }
        v31 = [v17 realIdentifier];
        BOOL v32 = v31 == 0;

        if (v32)
        {
          if (!_CPLSilentLogging)
          {
            v36 = __CPLStorageOSLogDomain_16994();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v17;
              __int16 v208 = 2112;
              v209 = v165;
              _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_ERROR, "Incorrect change coming from the cloud %@: %@", buf, 0x16u);
            }
LABEL_88:
          }
LABEL_89:

          continue;
        }
      }
      v33 = [v17 realIdentifier];
      if (v33)
      {
        uint64_t v34 = [v17 _ignoredRecord];
        BOOL v35 = v34 == 0;

        if (!v35)
        {
          if (!_CPLSilentLogging)
          {
            v36 = __CPLStorageOSLogDomain_16994();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = [v17 _ignoredRecord];
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v17;
              __int16 v208 = 2112;
              v209 = v37;
              _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_DEFAULT, "Ignoring already known remapped record %@ (shadowing %@)", buf, 0x16u);
            }
            goto LABEL_88;
          }
          goto LABEL_89;
        }
      }
      if (!_CPLSilentLogging)
      {
        id v38 = __CPLStorageOSLogDomain_16994();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          id v39 = (id)objc_opt_class();
          BOOL v40 = [v17 scopedIdentifier];
          id v41 = [v17 cplFullDescription];
          *(_DWORD *)buf = 136315906;
          v207 = v146;
          __int16 v208 = 2112;
          v209 = v39;
          __int16 v210 = 2112;
          v211 = v40;
          __int16 v212 = 2112;
          id v213 = v41;
          _os_log_impl(&dword_1B4CAC000, v38, OS_LOG_TYPE_DEBUG, "Filtering %s <%@ %@> against cloud cache:\n%@", buf, 0x2Au);
        }
      }
      id v42 = [v17 realIdentifier];
      BOOL v43 = v42 == 0;

      if (!v43)
      {
        if (!_CPLSilentLogging)
        {
          v137 = __CPLStorageOSLogDomain_16994();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v207 = (const char *)v17;
            _os_log_impl(&dword_1B4CAC000, v137, OS_LOG_TYPE_ERROR, "Trying to mingle a remapped record %@", buf, 0xCu);
          }
        }
        v138 = [MEMORY[0x1E4F28B00] currentHandler];
        v139 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineCloudCache.m"];
        [v138 handleFailureInMethod:a2, v156, v139, 328, @"Trying to mingle a remapped record %@", v17 object file lineNumber description];

        abort();
      }
      if (v167)
      {
        id v44 = [v17 translateToCloudChangeUsingIDMapping:v167 error:a6];
      }
      else
      {
        id v44 = v17;
      }
      v163 = [v44 scopedIdentifier];
      char v179 = 1;
      if (!v44) {
        goto LABEL_279;
      }
      long long v45 = [(CPLEngineStorage *)v156 platformObject];
      long long v46 = [v45 recordWithScopedIdentifier:v163 isFinal:v152 isConfirmed:&v179];

      if ([v44 isDelete])
      {
        if (v46)
        {
          if (!v167) {
            goto LABEL_191;
          }
          [v44 restoreRelationshipsFromFullRecord:v46];
          goto LABEL_181;
        }
        if (v29)
        {
          char v178 = 0;
          v64 = [v160 localScopedIdentifierForCloudScopedIdentifier:v163 isFinal:&v178];
          if (v64 && [v149 hasRecordWithScopedIdentifier:v64])
          {
            if (!_CPLSilentLogging)
            {
              v65 = __CPLStorageOSLogDomain_16994();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v207 = (const char *)v17;
                _os_log_impl(&dword_1B4CAC000, v65, OS_LOG_TYPE_DEBUG, "%@ is already known to the cloud cache but not from the client cache - keeping", buf, 0xCu);
              }
            }
            BOOL v66 = 0;
          }
          else
          {
            BOOL v66 = 1;
          }

LABEL_160:
          if (v66 && v167 == 0)
          {
            char v178 = 0;
            v92 = [v160 localScopedIdentifierForCloudScopedIdentifier:v163 isFinal:&v178];
            if (v92 && [v145 isRecordWithScopedIdentifierQuarantined:v92])
            {
              if (!_CPLSilentLogging)
              {
                v93 = __CPLStorageOSLogDomain_16994();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v207 = (const char *)v17;
                  _os_log_impl(&dword_1B4CAC000, v93, OS_LOG_TYPE_DEFAULT, "%@ is already known to the cloud cache but the record is quarantined - keeping", buf, 0xCu);
                }
              }
              BOOL v66 = 0;
            }
            else
            {
              BOOL v66 = 1;
            }
          }
        }
        else
        {
          if (!v167)
          {
            BOOL v66 = 1;
            goto LABEL_160;
          }
          BOOL v66 = ([v17 _shouldNotTrustCloudCache] & 1) == 0
             && ![v142 hasRecordWithScopedIdentifier:v163];
        }
        if (!v147)
        {
          id v95 = 0;
          if (v66) {
            goto LABEL_173;
          }
          goto LABEL_180;
        }
        id v177 = 0;
        int v94 = [v147 removeRemappedRecordWithScopedIdentifier:v163 error:&v177];
        id v95 = v177;
        if (v94)
        {
          if (v66)
          {
LABEL_173:
            if (!_CPLSilentLogging)
            {
              v96 = __CPLStorageOSLogDomain_16994();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v207 = (const char *)v17;
                _os_log_impl(&dword_1B4CAC000, v96, OS_LOG_TYPE_DEBUG, "%@ is already known to the cache. Ignoring", buf, 0xCu);
              }
            }
            id v44 = 0;
            if (!v167) {
              goto LABEL_189;
            }
LABEL_181:
            v97 = [v17 scopedIdentifier];
            id v176 = 0;
            char v98 = [v167 addDeleteEventForRecordWithLocalScopedIdentifier:v97 direction:1 error:&v176];
            id v95 = v176;

            if (v98)
            {

              if (v44) {
                goto LABEL_183;
              }
              goto LABEL_217;
            }
            v132 = (void *)v201[5];
            v201[5] = 0;

            if (a6)
            {
              id v95 = v95;
              goto LABEL_288;
            }
            goto LABEL_281;
          }
LABEL_180:

          if (!v167)
          {
            long long v46 = 0;
            goto LABEL_191;
          }
          goto LABEL_181;
        }
        v136 = (void *)v201[5];
        v201[5] = 0;

        if (a6)
        {
          id v95 = v95;
          long long v46 = 0;
LABEL_288:
          *a6 = v95;
        }
        else
        {
          long long v46 = 0;
        }
LABEL_281:

        v128 = v166;
        v166 = v164;
        v164 = v46;
LABEL_282:

        goto LABEL_283;
      }
      if (v46) {
        int v47 = v29;
      }
      else {
        int v47 = 0;
      }
      if (v47 == 1)
      {
        char v178 = 0;
        v48 = [v160 localScopedIdentifierForCloudScopedIdentifier:v163 isFinal:&v178];
        if (v48
          && ([v149 hasRecordWithScopedIdentifier:v48] & 1) == 0
          && ([v143 hasSomeChangeWithScopedIdentifier:v163] & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v49 = __CPLStorageOSLogDomain_16994();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v207 = (const char *)v17;
              _os_log_impl(&dword_1B4CAC000, v49, OS_LOG_TYPE_DEFAULT, "%@ is already known to the cloud cache but not from the client cache. Forcing change to client cache", buf, 0xCu);
            }
          }
          long long v46 = 0;
        }
      }
      if (!v46)
      {
        if (v167)
        {
          if ([v44 isFullRecord])
          {
            if ([v44 supportsResources])
            {
              uint64_t v67 = (void *)v201[5];
              v68 = [v17 resources];
              [v67 appendLocalResources:v68 forItemWithCloudScopedIdentifier:v163];
            }
            long long v46 = 0;
LABEL_183:
            long long v62 = v44;
LABEL_184:
            v99 = [v46 recordChangeData];
            [v62 setRecordChangeData:v99];

            v100 = [v46 sharingRecordChangeData];
            [v62 setSharingRecordChangeData:v100];

            objc_msgSend(v62, "setServerRecordIsCorrupted:", -[NSObject serverRecordIsCorrupted](v46, "serverRecordIsCorrupted"));
            [v62 restoreRelationshipsFromFullRecord:v46];
            goto LABEL_193;
          }
          if (!_CPLSilentLogging)
          {
            v133 = __CPLStorageOSLogDomain_16994();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v207 = (const char *)v17;
              _os_log_impl(&dword_1B4CAC000, v133, OS_LOG_TYPE_ERROR, "Got a partial record %@ from the client which is new to the cache", buf, 0xCu);
            }
          }
          if (a6)
          {
            *a6 = +[CPLErrors invalidClientCacheErrorWithReason:0];
          }
LABEL_279:
          long long v46 = 0;
          goto LABEL_280;
        }
        if ([v44 isFullRecord])
        {
          v72 = [v44 relatedScopedIdentifier];
          if (!v72) {
            goto LABEL_120;
          }
          if ([v148 containsObject:v72]) {
            goto LABEL_120;
          }
          v73 = [(CPLEngineStorage *)v156 platformObject];
          char v74 = [v73 hasRecordWithScopedIdentifier:v72];

          if (v74) {
            goto LABEL_120;
          }
          if ([v17 relatedRelationshipIsWeak])
          {
            if (!_CPLSilentLogging)
            {
              v75 = __CPLStorageOSLogDomain_16994();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v207 = (const char *)v17;
                __int16 v208 = 2112;
                v209 = v72;
                _os_log_impl(&dword_1B4CAC000, v75, OS_LOG_TYPE_DEFAULT, "%@ is referencing a related record %@ which is unknown to the cache", buf, 0x16u);
              }
            }
LABEL_120:
            v76 = [v44 secondaryScopedIdentifier];
            if (!v76) {
              goto LABEL_128;
            }
            if ([v148 containsObject:v76]) {
              goto LABEL_128;
            }
            v77 = [(CPLEngineStorage *)v156 platformObject];
            char v78 = [v77 hasRecordWithScopedIdentifier:v76];

            if (v78) {
              goto LABEL_128;
            }
            if ([v44 secondaryRelationshipIsWeak])
            {
              if (!_CPLSilentLogging)
              {
                v79 = __CPLStorageOSLogDomain_16994();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v207 = (const char *)v44;
                  __int16 v208 = 2112;
                  v209 = v76;
                  _os_log_impl(&dword_1B4CAC000, v79, OS_LOG_TYPE_DEFAULT, "%@ is referencing a secondary record %@ which is unknown to the cache", buf, 0x16u);
                }
              }
LABEL_128:

              [v148 addObject:v163];
              long long v46 = 0;
LABEL_191:
              long long v62 = v44;
LABEL_192:
              v101 = [v17 recordChangeData];
              [v62 setRecordChangeData:v101];

              v102 = [v17 sharingRecordChangeData];
              [v62 setSharingRecordChangeData:v102];

              objc_msgSend(v62, "setServerRecordIsCorrupted:", objc_msgSend(v17, "serverRecordIsCorrupted"));
LABEL_193:
              int v103 = 0;
              goto LABEL_218;
            }
            if (!_CPLSilentLogging)
            {
              v127 = __CPLStorageOSLogDomain_16994();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v207 = (const char *)v44;
                __int16 v208 = 2112;
                v209 = v76;
                _os_log_impl(&dword_1B4CAC000, v127, OS_LOG_TYPE_ERROR, "%@ is referencing a secondary record %@ which is unknown to the cache", buf, 0x16u);
              }
            }
LABEL_250:
          }
          else if (!_CPLSilentLogging)
          {
            v76 = __CPLStorageOSLogDomain_16994();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v17;
              __int16 v208 = 2112;
              v209 = v72;
              _os_log_impl(&dword_1B4CAC000, v76, OS_LOG_TYPE_ERROR, "%@ is referencing a related record %@ which is unknown to the cache", buf, 0x16u);
            }
            goto LABEL_250;
          }
LABEL_188:
        }
        else if (!_CPLSilentLogging)
        {
          v72 = __CPLStorageOSLogDomain_16994();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v207 = (const char *)v17;
            _os_log_impl(&dword_1B4CAC000, v72, OS_LOG_TYPE_ERROR, "Got a partial record %@ from the cloud which is new to the cache", buf, 0xCu);
          }
          goto LABEL_188;
        }
LABEL_189:

        long long v46 = 0;
        goto LABEL_217;
      }
      if (!v167)
      {
        uint64_t v50 = [v44 relatedScopedIdentifier];
        if (!v50) {
          goto LABEL_68;
        }
        if ([v148 containsObject:v50]) {
          goto LABEL_68;
        }
        v51 = [(CPLEngineStorage *)v156 platformObject];
        char v52 = [v51 hasRecordWithScopedIdentifier:v50];

        if (v52) {
          goto LABEL_68;
        }
        if ([v44 relatedRelationshipIsWeak])
        {
          if (!_CPLSilentLogging)
          {
            v53 = __CPLStorageOSLogDomain_16994();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v44;
              __int16 v208 = 2112;
              v209 = v50;
              _os_log_impl(&dword_1B4CAC000, v53, OS_LOG_TYPE_DEFAULT, "%@ is referencing a related record %@ which is unknown to the cache", buf, 0x16u);
            }
          }
LABEL_68:
          unsigned int v54 = [v44 secondaryScopedIdentifier];
          if (!v54
            || ([v148 containsObject:v54] & 1) != 0
            || ([(CPLEngineStorage *)v156 platformObject],
                v55 = objc_claimAutoreleasedReturnValue(),
                char v56 = [v55 hasRecordWithScopedIdentifier:v54],
                v55,
                (v56 & 1) != 0))
          {
LABEL_76:

            goto LABEL_77;
          }
          if ([v44 secondaryRelationshipIsWeak])
          {
            if (!_CPLSilentLogging)
            {
              v57 = __CPLStorageOSLogDomain_16994();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v207 = (const char *)v44;
                __int16 v208 = 2112;
                v209 = v54;
                _os_log_impl(&dword_1B4CAC000, v57, OS_LOG_TYPE_DEFAULT, "%@ is referencing a secondary record %@ which is unknown to the cache", buf, 0x16u);
              }
            }
            goto LABEL_76;
          }
          if (!_CPLSilentLogging)
          {
            v104 = __CPLStorageOSLogDomain_16994();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v207 = (const char *)v44;
              __int16 v208 = 2112;
              v209 = v54;
              _os_log_impl(&dword_1B4CAC000, v104, OS_LOG_TYPE_ERROR, "%@ is referencing a secondary record %@ which is unknown to the cache", buf, 0x16u);
            }
          }
LABEL_202:
        }
        else if (!_CPLSilentLogging)
        {
          unsigned int v54 = __CPLStorageOSLogDomain_16994();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v207 = (const char *)v44;
            __int16 v208 = 2112;
            v209 = v50;
            _os_log_impl(&dword_1B4CAC000, v54, OS_LOG_TYPE_ERROR, "%@ is referencing a related record %@ which is unknown to the cache", buf, 0x16u);
          }
          goto LABEL_202;
        }

LABEL_204:
        uint64_t v105 = [v46 recordChangeData];
        uint64_t v106 = [v17 recordChangeData];
        v107 = (void *)v106;
        if (v105 && v106)
        {
          char v108 = [(id)v105 isEqual:v106];

          if (v108) {
            goto LABEL_210;
          }
LABEL_209:
          v110 = [v17 recordChangeData];
          [v46 setRecordChangeData:v110];

          -[NSObject setServerRecordIsCorrupted:](v46, "setServerRecordIsCorrupted:", [v17 serverRecordIsCorrupted]);
        }
        else
        {
          BOOL v109 = (v105 | v106) != 0;

          if (v109) {
            goto LABEL_209;
          }
        }
LABEL_210:
        uint64_t v111 = [v46 sharingRecordChangeData];
        uint64_t v112 = [v17 sharingRecordChangeData];
        v113 = (void *)v112;
        if (v111 && v112)
        {
          char v114 = [(id)v111 isEqual:v112];

          if (v114)
          {
LABEL_216:
            if ([(CPLEngineCloudCache *)v156 updateStagedRecord:v46 error:a6]) {
              goto LABEL_217;
            }
            id v44 = 0;
LABEL_280:
            id v95 = (id)v201[5];
            v201[5] = 0;
            goto LABEL_281;
          }
        }
        else
        {
          BOOL v115 = (v111 | v112) != 0;

          if (!v115) {
            goto LABEL_216;
          }
        }
        v116 = [v17 sharingRecordChangeData];
        [v46 setSharingRecordChangeData:v116];

        -[NSObject setServerRecordIsCorrupted:](v46, "setServerRecordIsCorrupted:", [v17 serverRecordIsCorrupted]);
        goto LABEL_216;
      }
LABEL_77:
      char v58 = [v17 _shouldNotTrustCloudCache];
      char v59 = v58;
      if (v167) {
        char v60 = 1;
      }
      else {
        char v60 = v58;
      }
      if (v60)
      {
        id v61 = v44;
        long long v62 = v61;
        if (v59) {
          goto LABEL_106;
        }
        if (v167 && [v61 hasChangeType:2])
        {
          v150 = [[CPLRecordChangeDiffTracker alloc] initWithTrackingChangeTypeMask:2];
          int v63 = 1;
          goto LABEL_133;
        }
      }
      else
      {
        buf[0] = 0;
        v69 = [v160 localScopedIdentifierForCloudScopedIdentifier:v163 isFinal:buf];
        if (v69)
        {
          char v70 = [v145 isRecordWithScopedIdentifierQuarantined:v69];

          id v71 = v44;
          if (v70)
          {
            long long v62 = v71;
LABEL_106:
            v150 = 0;
            id v144 = 0;
            goto LABEL_136;
          }
        }
        else
        {
          id v80 = v44;
        }
      }
      v150 = objc_alloc_init(CPLRecordChangeDiffTracker);
      int v63 = 0;
LABEL_133:
      id v175 = 0;
      long long v62 = [v46 realRecordChangeFromRecordChange:v44 direction:v141 newRecord:&v175 diffTracker:v150];
      id v144 = v175;

      if (v63) {
        [v62 attachDiffTracker:v150];
      }
      if (!v62)
      {
        if (_CPLSilentLogging)
        {
          int v89 = 0;
          long long v62 = 0;
          goto LABEL_149;
        }
        v84 = __CPLStorageOSLogDomain_16994();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v207 = (const char *)v17;
          _os_log_impl(&dword_1B4CAC000, v84, OS_LOG_TYPE_DEBUG, "%@ is already known to the cache. Ignoring", buf, 0xCu);
        }
        int v89 = 0;
        long long v62 = 0;
        goto LABEL_148;
      }
LABEL_136:
      v81 = [v62 recordModificationDate];
      if (v81) {
        goto LABEL_139;
      }
      v82 = [v44 recordModificationDate];
      BOOL v83 = v82 == 0;

      if (!v83)
      {
        v81 = [v44 recordModificationDate];
        [v62 setRecordModificationDate:v81];
LABEL_139:
      }
      if (_CPLSilentLogging)
      {
        int v89 = 1;
        goto LABEL_149;
      }
      v84 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
      {
        v85 = (char *)(id)objc_opt_class();
        v86 = [v44 scopedIdentifier];
        id v87 = [v44 cplFullDescription];
        id v88 = [v46 cplFullDescription];
        *(_DWORD *)buf = 138413314;
        v207 = v85;
        __int16 v208 = 2112;
        v209 = v86;
        __int16 v210 = 2112;
        v211 = v150;
        __int16 v212 = 2112;
        id v213 = v87;
        __int16 v214 = 2112;
        id v215 = v88;
        _os_log_impl(&dword_1B4CAC000, v84, OS_LOG_TYPE_DEBUG, "<%@ %@> is a real diff for cloud cache (%@): %@\nvs.:\n%@", buf, 0x34u);
      }
      int v89 = 1;
LABEL_148:

LABEL_149:
      if (v167
        && [v44 supportsResources]
        && (v89 & [v44 hasChangeType:8]) == 1
        && [v62 hasChangeType:8])
      {
        v90 = (void *)v201[5];
        v91 = [v17 resources];
        [v90 appendLocalResources:v91 forItemWithCloudScopedIdentifier:v163];
      }
      if (v62)
      {
        if (!v167) {
          goto LABEL_192;
        }
        goto LABEL_184;
      }
      if (!v167) {
        goto LABEL_204;
      }
LABEL_217:
      long long v62 = 0;
      int v103 = 1;
LABEL_218:
      v169[0] = MEMORY[0x1E4F143A8];
      v169[1] = 3221225472;
      v169[2] = __80__CPLEngineCloudCache_cloudChangeBatchFromBatch_usingMapping_isFinal_withError___block_invoke_28;
      v169[3] = &unk_1E60AA328;
      id v117 = v160;
      char v174 = v179;
      id v170 = v117;
      v171 = v17;
      id v172 = v153;
      v173 = &v200;
      v118 = (uint64_t (**)(void, void))MEMORY[0x1BA994060](v169);
      if (v103)
      {
        if (![v17 supportsResources]
          || ![v17 hasChangeType:8]
          || ([v17 resources],
              v119 = objc_claimAutoreleasedReturnValue(),
              BOOL v120 = [v119 count] == 0,
              v119,
              v120))
        {
          if (!v167) {
            goto LABEL_240;
          }
LABEL_239:
          if ([(CPLEngineCloudCache *)v156 ackownledgeRecordWithScopedIdentifier:v163 error:a6])
          {
LABEL_240:
            int v122 = 1;
            goto LABEL_243;
          }
          v126 = (void *)v201[5];
          v201[5] = 0;
LABEL_242:

          int v122 = v103 ^ 1;
          goto LABEL_243;
        }
        int v121 = ((uint64_t (**)(void, id *))v118)[2](v118, a6);
        int v122 = v121;
        if (v167) {
          char v123 = v121;
        }
        else {
          char v123 = 0;
        }
        if (v123) {
          goto LABEL_239;
        }
      }
      else
      {
        if (![v17 supportsResources]
          || ![v17 hasChangeType:8]
          || ([v62 hasChangeType:8] & 1) != 0
          || ([v17 resources],
              v124 = objc_claimAutoreleasedReturnValue(),
              BOOL v125 = [v124 count] == 0,
              v124,
              v125)
          || (((uint64_t (**)(void, id *))v118)[2](v118, a6) & 1) != 0)
        {
          if (v161 && [v62 hasChangeType:2]) {
            [v62 setShouldFilterDefaultValuesForNewProperties:1];
          }
          v126 = [v17 _pushContext];
          [v62 _setPushContext:v126];
          objc_msgSend(v62, "_setShouldNotTrustCloudCache:", objc_msgSend(v17, "_shouldNotTrustCloudCache"));
          if (v167) {
            [v62 _setRecordKnownByCloudCache:v46];
          }
          [(id)v201[5] addRecord:v62];
          goto LABEL_242;
        }
        int v122 = 0;
      }
LABEL_243:

      if (!v122) {
        goto LABEL_283;
      }
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v181 objects:v216 count:16];
  }
  while (v14);
LABEL_283:

  id v134 = (id)v201[5];
  _Block_object_dispose(v190, 8);
  _Block_object_dispose(v192, 8);

  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(&v200, 8);

  return v134;
}

BOOL __80__CPLEngineCloudCache_cloudChangeBatchFromBatch_usingMapping_isFinal_withError___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    return 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = a1 + 56;
  }
  else
  {
    char v4 = objc_msgSend(*(id *)(a1 + 32), "hasFinishedAFullSyncForScope:");
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v2 = a1 + 56;
    *(unsigned char *)(*(void *)(v5 + 8) + 24) = v4;
    *(unsigned char *)(*(void *)(*(void *)(v2 - 8) + 8) + 24) = 1;
  }
  return *(unsigned char *)(*(void *)(*(void *)v2 + 8) + 24) != 0;
}

uint64_t __80__CPLEngineCloudCache_cloudChangeBatchFromBatch_usingMapping_isFinal_withError___block_invoke_28(uint64_t a1, uint64_t a2)
{
  char v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v5 = 0;
LABEL_11:
      uint64_t v6 = 1;
      goto LABEL_12;
    }
    char v12 = 0;
    uint64_t v9 = [*(id *)(a1 + 40) scopedIdentifier];
    v10 = [v4 localScopedIdentifierForCloudScopedIdentifier:v9 isFinal:&v12];

    if (v10) {
      id v5 = (id)[(id)objc_opt_class() newRecordWithScopedIdentifier:v10];
    }
    else {
      id v5 = 0;
    }

    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    id v5 = *(id *)(a1 + 40);
    if (!v5) {
      goto LABEL_11;
    }
  }
  uint64_t v6 = 1;
  if (([*(id *)(a1 + 48) notifyStatusForRecordHasChanged:v5 persist:1 error:a2] & 1) == 0)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    uint64_t v6 = 0;
  }
LABEL_12:

  return v6;
}

- (BOOL)applyBatch:(id)a3 isFinal:(BOOL)a4 direction:(unint64_t)a5 withError:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v9 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v78 = v8;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Applying %@", buf, 0xCu);
    }
  }
  v10 = [(CPLEngineStorage *)self engineStore];
  v57 = [v10 quarantinedRecords];
  char v11 = [v10 idMapping];
  char v12 = [v10 pushRepository];
  char v52 = v10;
  v53 = [v10 scopes];
  unsigned int v54 = v12;
  char v13 = [v12 isEmpty];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v14 = v8;
  uint64_t v61 = [v14 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v61)
  {
    v51 = a6;
    uint64_t v15 = 0;
    uint64_t v60 = *(void *)v73;
    char v16 = !v7;
    if (a5 != 2) {
      char v16 = 1;
    }
    char v58 = v16 | v13;
    v55 = v11;
    id obj = v14;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v73 != v60) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v72 + 1) + 8 * v17);
        unint64_t v19 = [v18 scopedIdentifier];
        uint64_t v20 = [v18 changeType];
        id v21 = [(CPLEngineCloudCache *)self recordWithScopedIdentifier:v19 isFinal:v7];
        char v22 = v21;
        if (v20 != 1024)
        {
          if (!v21)
          {
            if (v20)
            {
              v48 = v51;
              int v47 = v52;
              id v14 = obj;
              if (!_CPLSilentLogging)
              {
                uint64_t v50 = __CPLStorageOSLogDomain_16994();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v78 = v18;
                  _os_log_impl(&dword_1B4CAC000, v50, OS_LOG_TYPE_ERROR, "%@ is a new record but is not a full record", buf, 0xCu);
                }
              }
              +[CPLErrors invalidCloudCacheErrorWithReason:@"new record but not full record"];
              uint64_t v15 = v22 = v15;
              goto LABEL_67;
            }
            v69 = v15;
            int v23 = [(CPLEngineCloudCache *)self addRecord:v18 isFinal:v7 error:&v69];
            v36 = v69;

            uint64_t v15 = v36;
LABEL_39:
            if (!v23) {
              goto LABEL_52;
            }
            goto LABEL_48;
          }
          id v68 = 0;
          BOOL v25 = [v21 realRecordChangeFromRecordChange:v18 direction:a5 newRecord:&v68];
          id v26 = v68;
          if (v25)
          {
            uint64_t v27 = [v18 recordChangeData];
            [v26 setRecordChangeData:v27];

            uint64_t v28 = [v18 sharingRecordChangeData];
            [v26 setSharingRecordChangeData:v28];

            objc_msgSend(v26, "setServerRecordIsCorrupted:", objc_msgSend(v18, "serverRecordIsCorrupted"));
            int v29 = [v18 recordModificationDate];

            if (v29)
            {
              char v30 = [v18 recordModificationDate];
              [v26 setRecordModificationDate:v30];
            }
            if (v7)
            {
              if ([v18 supportsResources]
                && [v18 hasChangeType:8])
              {
                v31 = [v18 resources];
                BOOL v32 = [v31 count] == 0;
              }
              else
              {
                BOOL v32 = 1;
              }
              uint64_t v67 = v15;
              v37 = (id *)&v67;
              BOOL v38 = [(CPLEngineCloudCache *)self updateFinalRecord:v26 confirmed:v32 error:&v67];
            }
            else
            {
              BOOL v66 = v15;
              v37 = (id *)&v66;
              BOOL v38 = [(CPLEngineCloudCache *)self updateStagedRecord:v26 error:&v66];
            }
LABEL_46:
            int v23 = v38;
            id v39 = *v37;

            uint64_t v15 = v39;
            char v11 = v55;
          }
          else
          {
            if (v7)
            {
              v65 = v15;
              v37 = (id *)&v65;
              BOOL v38 = [(CPLEngineCloudCache *)self ackownledgeRecordWithScopedIdentifier:v19 error:&v65];
              goto LABEL_46;
            }
            int v23 = 1;
          }

          if (!v23) {
            goto LABEL_52;
          }
          goto LABEL_48;
        }
        if (v21)
        {
          id v71 = v15;
          int v23 = [(CPLEngineCloudCache *)self deleteRecordWithScopedIdentifier:v19 isFinal:v7 error:&v71];
          char v24 = v15;
          uint64_t v15 = v71;
        }
        else
        {
          if (_CPLSilentLogging)
          {
            int v23 = 1;
            goto LABEL_28;
          }
          char v24 = __CPLStorageOSLogDomain_16994();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v78 = v18;
            _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEBUG, "Ignoring %@ as it is already known", buf, 0xCu);
          }
          int v23 = 1;
        }

LABEL_28:
        if (v58) {
          goto LABEL_39;
        }
        buf[0] = 0;
        v33 = [v11 localScopedIdentifierForCloudScopedIdentifier:v19 isFinal:buf];
        if (!v33) {
          v33 = (void *)[v19 copy];
        }
        if (![v33 scopeIndex])
        {
          uint64_t v34 = [v33 scopeIdentifier];
          objc_msgSend(v33, "setScopeIndex:", objc_msgSend(v53, "indexForLocalScopeIdentifier:", v34));
        }
        if ([v33 scopeIndex] != 0x7FFFFFFFFFFFFFFFLL)
        {
          char v70 = v15;
          int v23 = [v54 discardChangeWithScopedIdentifier:v33 error:&v70];
          BOOL v35 = v70;

          uint64_t v15 = v35;
        }

        if (!v23)
        {
LABEL_52:
          if (!v23) {
            goto LABEL_66;
          }
          goto LABEL_58;
        }
LABEL_48:
        if (!v7) {
          goto LABEL_52;
        }
        char v64 = 0;
        uint64_t v40 = [v11 localScopedIdentifierForCloudScopedIdentifier:v19 isFinal:&v64];
        if (v40)
        {
          id v41 = (void *)v40;
          int v63 = v15;
          char v42 = [v57 removeQuarantinedRecordWithScopedIdentifier:v40 notify:1 error:&v63];
          BOOL v43 = v63;

          uint64_t v15 = v43;
          if ((v42 & 1) == 0)
          {
            uint64_t v15 = v43;
LABEL_66:
            v48 = v51;
            int v47 = v52;
            id v14 = obj;
LABEL_67:

            if (v48)
            {
              uint64_t v15 = v15;
              BOOL v46 = 0;
              id *v48 = v15;
            }
            else
            {
              BOOL v46 = 0;
            }
            goto LABEL_70;
          }
        }
        else if (!_CPLSilentLogging)
        {
          id v44 = __CPLStorageOSLogDomain_16994();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v78 = v18;
            _os_log_impl(&dword_1B4CAC000, v44, OS_LOG_TYPE_ERROR, "Failed to find local scoped identifier for %@ in ID mapping to unquarantine", buf, 0xCu);
          }
        }
LABEL_58:

        ++v17;
      }
      while (v61 != v17);
      id v14 = obj;
      uint64_t v45 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
      uint64_t v61 = v45;
      if (!v45) {
        goto LABEL_65;
      }
    }
  }
  uint64_t v15 = 0;
LABEL_65:

  BOOL v46 = 1;
  int v47 = v52;
LABEL_70:

  return v46;
}

- (BOOL)updateStagedRecord:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!_CPLSilentLogging)
  {
    id v8 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Updating %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (([v7 isFullRecord] & 1) == 0 && !_CPLSilentLogging)
  {
    uint64_t v9 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Updating a non full record: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if ([v7 validateFullRecord])
  {
    v10 = [(CPLEngineStorage *)self platformObject];
    char v11 = [v10 updateStagedRecord:v7 error:a4];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      char v12 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        char v13 = NSStringFromSelector(a2);
        int v15 = 138412546;
        id v16 = v13;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "%@: invalid record %@", (uint8_t *)&v15, 0x16u);
      }
    }
    if (a4)
    {
      [(CPLEngineCloudCache *)self _invalidCloudCacheErrorWithInvalidRecord:v7 method:@"update staged"];
      char v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (BOOL)updateFinalRecord:(id)a3 confirmed:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!_CPLSilentLogging)
  {
    v10 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Updating %@", (uint8_t *)&v17, 0xCu);
    }
  }
  if (([v9 isFullRecord] & 1) == 0 && !_CPLSilentLogging)
  {
    char v11 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Updating a non full record: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  if ([v9 validateFullRecord])
  {
    char v12 = [(CPLEngineStorage *)self platformObject];
    char v13 = [v12 updateFinalRecord:v9 confirmed:v6 error:a5];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = NSStringFromSelector(a2);
        int v17 = 138412546;
        id v18 = v15;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "%@: invalid record %@", (uint8_t *)&v17, 0x16u);
      }
    }
    if (a5)
    {
      [(CPLEngineCloudCache *)self _invalidCloudCacheErrorWithInvalidRecord:v9 method:@"update final"];
      char v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (BOOL)addRecord:(id)a3 isFinal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!_CPLSilentLogging)
  {
    v10 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Adding %@", (uint8_t *)&v17, 0xCu);
    }
  }
  if (([v9 isFullRecord] & 1) == 0 && !_CPLSilentLogging)
  {
    char v11 = __CPLStorageOSLogDomain_16994();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Storing a non full record: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  if ([v9 validateFullRecord])
  {
    char v12 = [(CPLEngineStorage *)self platformObject];
    char v13 = [v12 addRecord:v9 isFinal:v6 error:a5];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = __CPLStorageOSLogDomain_16994();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = NSStringFromSelector(a2);
        int v17 = 138412546;
        id v18 = v15;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "%@: invalid record %@", (uint8_t *)&v17, 0x16u);
      }
    }
    if (a5)
    {
      [(CPLEngineCloudCache *)self _invalidCloudCacheErrorWithInvalidRecord:v9 method:@"add"];
      char v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)_invalidCloudCacheErrorWithInvalidRecord:(id)a3 method:(id)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = objc_opt_class();

  v10 = (void *)[v8 initWithFormat:@"Trying to %@ an invalid %@", v6, v9];
  char v11 = +[CPLErrors invalidCloudCacheErrorWithReason:v10];

  return v11;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  char v11 = [(CPLEngineStorage *)self platformObject];
  int v12 = [v11 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  if (!v12) {
    return 0;
  }
  if (*a5) {
    return 1;
  }
  id v14 = [(CPLEngineStorage *)self platformObject];
  id v20 = 0;
  int v15 = [v14 popCloudScopedIdentifiersToCheck:&v20 otherScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];
  id v16 = v20;

  if (v15)
  {
    if ([v16 count])
    {
      int v17 = [(CPLEngineStorage *)self engineStore];
      id v18 = [v17 pendingRecordChecks];

      char v13 = [v18 enqueueCloudScopedIdentifiersToCheck:v16 error:a6];
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)scopeType
{
  return 2;
}

@end