@interface CPLBeforeUploadCheckItem
+ (BOOL)allowsAssetsWithResourcesButNoAdjustments;
+ (void)setAllowsAssetsWithResourcesButNoAdjustments:(BOOL)a3;
- (BOOL)_addRelatedRecordWithScopedIdentifierToAdditionalRecords:(id)a3 provider:(id)a4 error:(id *)a5;
- (BOOL)_forAdditionalRecordRule:(id)a3 check:(void *)a4 error:(id *)a5;
- (BOOL)_forRule:(id)a3 check:(void *)a4 error:(id *)a5;
- (BOOL)_serverResourcesMatches:(id)a3;
- (BOOL)checkBeforeUploadWithError:(id *)a3;
- (BOOL)dropGeneratingDerivativesIfPossibleWithRecordOnServer:(id)a3 error:(id *)a4;
- (BOOL)hasRequestedRecordFetch;
- (BOOL)isAsset;
- (BOOL)isTrashedOrDeletedAsset;
- (BOOL)needsToGenerateDerivatives;
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)rejectChangeWithReason:(id)a3 error:(id *)a4;
- (BOOL)requestFetchForRule:(id)a3 error:(id *)a4;
- (BOOL)requestFetchOfRecordWithScopedIdentifier:(id)a3 forRule:(id)a4 error:(id *)a5;
- (CPLBeforeUploadCheckItem)initWithChange:(id)a3 checkItems:(id)a4;
- (CPLBeforeUploadCheckItems)items;
- (CPLRecordChange)change;
- (CPLRecordTarget)target;
- (CPLScopedIdentifier)scopedIdentifier;
- (Class)changeClass;
- (id)description;
- (int64_t)ruleGroups;
- (unint64_t)estimatedResourceUploadSize;
- (unint64_t)pushRepositoryPriority;
- (void)_bumpPushRepositoryPriority:(unint64_t)a3 reason:(id)a4;
- (void)_dropChangeWithReason:(id)a3;
- (void)dropChangeWithReason:(id)a3;
- (void)dropResourceChangeWithReason:(id)a3;
- (void)dropSharingChangeWithReason:(id)a3;
- (void)reinjectChangeWithReason:(id)a3;
- (void)updatePushRepositoryPriorityWithRecordOnServer:(id)a3;
@end

@implementation CPLBeforeUploadCheckItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_items);
  objc_storeStrong((id *)&self->_changeClass, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
  objc_storeStrong((id *)&self->_resourcesToGenerateVideoComplementDerivatives, 0);
  objc_storeStrong((id *)&self->_resourcesToGenerateImageDerivatives, 0);
  objc_storeStrong((id *)&self->_dropReason, 0);
  objc_storeStrong((id *)&self->_recordOnServer, 0);
  objc_storeStrong((id *)&self->_rulesForOtherRecordFetches, 0);
  objc_storeStrong((id *)&self->_rulesForRecordFetch, 0);
}

- (unint64_t)pushRepositoryPriority
{
  return self->_pushRepositoryPriority;
}

- (CPLBeforeUploadCheckItems)items
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
  return (CPLBeforeUploadCheckItems *)WeakRetained;
}

- (BOOL)isAsset
{
  return self->_isAsset;
}

- (Class)changeClass
{
  return self->_changeClass;
}

- (CPLRecordChange)change
{
  return self->_change;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (int64_t)ruleGroups
{
  return self->_ruleGroups;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"[<%@ %@", self->_changeClass, self->_scopedIdentifier];
  change = self->_change;
  dropReason = self->_dropReason;
  if (change)
  {
    uint64_t v6 = +[CPLRecordChange descriptionForChangeType:[(CPLRecordChange *)change changeType]];
    v7 = (void *)v6;
    if (dropReason) {
      [v3 appendFormat:@" [%@-R (%@)]", v6, self->_dropReason];
    }
    else {
      [v3 appendFormat:@" [%@]", v6, v13];
    }
  }
  else
  {
    [v3 appendFormat:@" [dropped (%@)]", self->_dropReason];
  }
  if ([(NSMutableSet *)self->_rulesForRecordFetch count])
  {
    v8 = [(NSMutableSet *)self->_rulesForRecordFetch allObjects];
    v9 = [v8 componentsJoinedByString:@","];
    [v3 appendFormat:@" [fetch: %@]", v9];
  }
  if ([(NSMutableDictionary *)self->_rulesForOtherRecordFetches count])
  {
    v10 = [(NSMutableDictionary *)self->_rulesForOtherRecordFetches allKeys];
    v11 = [v10 componentsJoinedByString:@","];
    [v3 appendFormat:@" [other: %@]", v11];
  }
  [v3 appendString:@">"];
  return v3;
}

- (unint64_t)estimatedResourceUploadSize
{
  change = self->_change;
  if (!change
    || ![(CPLRecordChange *)change supportsResources]
    || ![(CPLRecordChange *)self->_change hasChangeType:8])
  {
    return 0;
  }
  v4 = self->_change;
  return [(CPLRecordChange *)v4 realUploadResourceSize];
}

- (CPLRecordTarget)target
{
  p_items = &self->_items;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
  v5 = [WeakRetained targetMapping];
  uint64_t v6 = [v5 targetForRecordWithScopedIdentifier:self->_scopedIdentifier];

  if (!v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_items);
    uint64_t v8 = [v7 sharingScopeIdentifier];
    if (v8)
    {
      v9 = (void *)v8;
      int v10 = [(objc_class *)self->_changeClass supportsSharing];

      if (v10)
      {
        v11 = [CPLScopedIdentifier alloc];
        id v12 = objc_loadWeakRetained((id *)p_items);
        uint64_t v13 = [v12 sharingScopeIdentifier];
        v14 = [(CPLScopedIdentifier *)self->_scopedIdentifier identifier];
        v15 = [(CPLScopedIdentifier *)v11 initWithScopeIdentifier:v13 identifier:v14];

        uint64_t v6 = [[CPLRecordTarget alloc] initWithScopedIdentifier:self->_scopedIdentifier otherScopedIdentifier:v15 targetState:0];
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v6 = [[CPLRecordTarget alloc] initWithScopedIdentifier:self->_scopedIdentifier];
  }
LABEL_7:
  return v6;
}

- (void)updatePushRepositoryPriorityWithRecordOnServer:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  change = self->_change;
  if (change)
  {
    if (![(CPLRecordChange *)change isAssetChange])
    {
      if (!_CPLSilentLogging)
      {
        v24 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = self->_change;
          v26 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v26;
          _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_ERROR, "%@ should not participate in %@", buf, 0x16u);
        }
      }
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m"];
      v29 = self->_change;
      v30 = NSStringFromSelector(a2);
      [v27 handleFailureInMethod:a2, self, v28, 1079, @"%@ should not participate in %@", v29, v30 object file lineNumber description];

      abort();
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v37 = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __75__CPLBeforeUploadCheckItem_updatePushRepositoryPriorityWithRecordOnServer___block_invoke;
    v31[3] = &unk_1E60AA638;
    v31[5] = &v32;
    v31[6] = buf;
    v31[4] = self;
    id v7 = (void (**)(void, void))MEMORY[0x1BA994060](v31);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    v9 = [WeakRetained sharingScopeIdentifier];

    if (!v9)
    {
LABEL_20:
      if (!*((unsigned char *)v33 + 24))
      {
        if ([(CPLRecordChange *)self->_change isFullRecord])
        {
          int v18 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
          v19 = @"uploading asset to sharing scope";
          v20 = @"uploading asset to scope";
LABEL_30:
          if (v18) {
            v23 = v19;
          }
          else {
            v23 = v20;
          }
          ((void (**)(void, __CFString *))v7)[2](v7, v23);
          goto LABEL_34;
        }
        if ([(CPLRecordChange *)self->_change hasChangeType:8])
        {
          v21 = [(CPLRecordChange *)self->_change resources];
          BOOL v22 = [v21 count] == 0;

          if (!v22)
          {
            int v18 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
            v19 = @"uploading new resources for asset to sharing scope";
            v20 = @"uploading new resources for asset to scope";
            goto LABEL_30;
          }
        }
        if ([(CPLRecordChange *)self->_change hasChangeType:2]
          && ![(CPLRecordChange *)self->_change inTrash]
          && [v5 inTrash])
        {
          int v18 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
          v19 = @"removing asset from recently deleted in sharing scope";
          v20 = @"removing asset from recently deleted in scope";
          goto LABEL_30;
        }
      }
LABEL_34:

      _Block_object_dispose(&v32, 8);
      _Block_object_dispose(buf, 8);
      goto LABEL_35;
    }
    int v10 = [(CPLBeforeUploadCheckItem *)self target];
    if (![(objc_class *)self->_changeClass supportsSharingScopedIdentifier]|| ![(CPLRecordChange *)self->_change hasChangeType:64])
    {
      unint64_t v17 = [v10 targetState];
      if (v17 <= 3) {
        *(unsigned char *)(*(void *)&buf[8] + 24) = 0x1010000u >> (8 * v17);
      }
      goto LABEL_19;
    }
    v11 = self->_change;
    id v12 = objc_loadWeakRetained((id *)&self->_items);
    uint64_t v13 = [v12 sharingScopeIdentifier];
    BOOL v14 = [(CPLRecordChange *)v11 isSharedInScopeWithIdentifier:v13];
    *(unsigned char *)(*(void *)&buf[8] + 24) = v14;

    uint64_t v15 = [v10 targetState];
    if ((unint64_t)(v15 - 2) < 2)
    {
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
LABEL_19:

        goto LABEL_20;
      }
      v16 = @"moving record back from sharing scope";
    }
    else if (v15)
    {
      if (v15 != 1 || !*(unsigned char *)(*(void *)&buf[8] + 24)) {
        goto LABEL_19;
      }
      v16 = @"moving record to sharing scope";
    }
    else if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v16 = @"uploading new record to sharing scope";
    }
    else
    {
      v16 = @"uploading new record to scope";
    }
    ((void (**)(void, __CFString *))v7)[2](v7, v16);
    goto LABEL_19;
  }
LABEL_35:
}

uint64_t __75__CPLBeforeUploadCheckItem_updatePushRepositoryPriorityWithRecordOnServer___block_invoke(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  int v2 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  v3 = (void *)a1[4];
  if (v2) {
    uint64_t v4 = 3000;
  }
  else {
    uint64_t v4 = 2000;
  }
  return [v3 _bumpPushRepositoryPriority:v4 reason:a2];
}

- (void)_bumpPushRepositoryPriority:(unint64_t)a3 reason:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_change && self->_pushRepositoryPriority < a3)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLCheckOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t pushRepositoryPriority = self->_pushRepositoryPriority;
        change = self->_change;
        int v11 = 134218754;
        unint64_t v12 = pushRepositoryPriority;
        __int16 v13 = 2048;
        unint64_t v14 = a3;
        __int16 v15 = 2112;
        v16 = change;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Moving priority from %lu to %lu for %@ - reason: %@", (uint8_t *)&v11, 0x2Au);
      }
    }
    self->_unint64_t pushRepositoryPriority = a3;
    [(CPLBeforeUploadCheckItem *)self _dropChangeWithReason:@"bumping push priority of change"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    [WeakRetained itemShouldBeReinjectedInPushRepository:self];
  }
}

- (BOOL)dropGeneratingDerivativesIfPossibleWithRecordOnServer:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(CPLRecordChange *)self->_change isAssetChange])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v18 = [v5 resources];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      int v21 = 0;
      int v22 = 0;
      uint64_t v23 = *(void *)v46;
LABEL_26:
      uint64_t v24 = 0;
      while (2)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v18);
        }
        v25 = *(void **)(*((void *)&v45 + 1) + 8 * v24);
        uint64_t v26 = [v25 resourceType];
        switch(v26)
        {
          case 1:
          case 2:
          case 16:
          case 17:
            if (!self->_needsToGenerateImageDerivatives) {
              goto LABEL_41;
            }
            uint64_t v27 = v26;
            if (![(CPLResourceTypeSet *)self->_resourcesToGenerateImageDerivatives containsResourceType:v26])goto LABEL_41; {
            if ([(CPLBeforeUploadCheckItem *)self _serverResourcesMatches:v25])
            }
            {
              resourcesToGenerateImageDerivatives = self->_resourcesToGenerateImageDerivatives;
              uint64_t v29 = v27;
              goto LABEL_40;
            }
            goto LABEL_49;
          case 3:
          case 4:
          case 5:
            int v21 = 1;
            goto LABEL_41;
          case 6:
          case 7:
          case 21:
          case 28:
            int v22 = 1;
            goto LABEL_41;
          case 18:
            if (!self->_needsToGenerateVideoComplementDerivatives
              || ![(CPLResourceTypeSet *)self->_resourcesToGenerateVideoComplementDerivatives containsResourceType:18])
            {
              goto LABEL_41;
            }
            if (![(CPLBeforeUploadCheckItem *)self _serverResourcesMatches:v25]) {
              goto LABEL_49;
            }
            resourcesToGenerateImageDerivatives = self->_resourcesToGenerateVideoComplementDerivatives;
            uint64_t v29 = 18;
LABEL_40:
            [(CPLResourceTypeSet *)resourcesToGenerateImageDerivatives removeResourceType:v29];
LABEL_41:
            if (v20 != ++v24) {
              continue;
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (!v20) {
              goto LABEL_49;
            }
            goto LABEL_26;
          default:
            goto LABEL_41;
        }
      }
    }
    int v21 = 0;
    int v22 = 0;
LABEL_49:

    if (self->_needsToGenerateImageDerivatives
      && ([(CPLResourceTypeSet *)self->_resourcesToGenerateImageDerivatives isEmpty] & v21) == 1)
    {
      self->_needsToGenerateImageDerivatives = 0;
    }
    if (self->_needsToGenerateVideoComplementDerivatives
      && ([(CPLResourceTypeSet *)self->_resourcesToGenerateVideoComplementDerivatives isEmpty] & v22) == 1)
    {
      self->_needsToGenerateVideoComplementDerivatives = 0;
    }
    goto LABEL_64;
  }
  id v6 = [(CPLRecordChange *)self->_change adjustments];
  id v7 = v5;
  uint64_t v8 = [v7 adjustments];
  v9 = (void *)v8;
  if (!v6)
  {
    if (v8)
    {
      if (!_CPLSilentLogging)
      {
        v30 = __CPLCheckOSLogDomain();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          change = self->_change;
          *(_DWORD *)buf = 138412546;
          v55 = change;
          __int16 v56 = 2112;
          id v57 = v7;
          uint64_t v32 = "%@ has no adjustments while server record %@ has. Keeping server version";
          v33 = v30;
          uint32_t v34 = 22;
LABEL_58:
          _os_log_impl(&dword_1B4CAC000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
          goto LABEL_59;
        }
        goto LABEL_59;
      }
    }
    else if (!_CPLSilentLogging)
    {
      v30 = __CPLCheckOSLogDomain();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        char v35 = self->_change;
        *(_DWORD *)buf = 138412290;
        v55 = v35;
        uint64_t v32 = "%@ has no adjustments. Keeping server version";
        v33 = v30;
        uint32_t v34 = 12;
        goto LABEL_58;
      }
LABEL_59:
    }
    [(CPLBeforeUploadCheckItem *)self dropResourceChangeWithReason:@"unadjusted asset with adjusted resources"];

    goto LABEL_67;
  }
  if (v8 && [v6 isEqual:v8])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    int v10 = [v7 resources];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v40 = v6;
      v41 = v9;
      id v42 = v7;
      id v43 = v5;
      char v13 = 0;
      char v44 = 0;
      uint64_t v14 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          unint64_t v17 = [v16 resourceType];
          if (v17 <= 0x1C)
          {
            if (((1 << v17) & 0x210E000) != 0)
            {
              if ([(CPLBeforeUploadCheckItem *)self _serverResourcesMatches:v16])
              {

                v36 = v7;
                id v5 = v43;
                uint64_t v38 = v40;
                char v37 = v41;
                goto LABEL_61;
              }
            }
            else if (((1 << v17) & 0x102000C0) != 0)
            {
              char v13 = 1;
            }
            else if (((1 << v17) & 0x38) != 0)
            {
              char v44 = 1;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v12);

      uint64_t v38 = v6;
      if ((self->_needsToGenerateImageDerivatives & v44) == 1) {
        self->_needsToGenerateImageDerivatives = 0;
      }
      v36 = v42;
      id v5 = v43;
      char v37 = v41;
      if ((self->_needsToGenerateVideoComplementDerivatives & v13) == 1) {
        self->_needsToGenerateVideoComplementDerivatives = 0;
      }
LABEL_61:

      goto LABEL_64;
    }
  }
LABEL_64:
  if (!self->_needsToGenerateImageDerivatives && !self->_needsToGenerateVideoComplementDerivatives) {
    [(CPLBeforeUploadCheckItem *)self dropResourceChangeWithReason:@"record already exists on server with the proper derivatives"];
  }
LABEL_67:

  return 1;
}

- (BOOL)_serverResourcesMatches:(id)a3
{
  id v4 = a3;
  id v5 = -[CPLRecordChange resourceForType:](self->_change, "resourceForType:", [v4 resourceType]);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 identity];
    uint64_t v8 = [v7 fingerPrint];

    v9 = [v4 identity];
    uint64_t v10 = [v9 fingerPrint];

    BOOL v11 = v8 && v10 && ([(id)v8 isEqual:v10] & 1) != 0 || (v8 | v10) == 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)rejectChangeWithReason:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  change = self->_change;
  if (!change)
  {
    if (!_CPLSilentLogging)
    {
      char v13 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = self->_change;
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v14;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Trying to reject already rejected or dropped %@", buf, 0xCu);
      }
    }
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m"];
    [v15 handleFailureInMethod:a2, self, v16, 869, @"Trying to reject already rejected or dropped %@", self->_change object file lineNumber description];

    abort();
  }
  v9 = v7;
  self->_change = 0;

  unint64_t v17 = @"CPLErrorRejectedReasonKey";
  id v18 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  BOOL v11 = +[CPLErrors cplErrorWithCode:18, 0, v10, @"%@", v9 underlyingError userInfo description];

  if (a4) {
    *a4 = v11;
  }

  return 0;
}

- (void)reinjectChangeWithReason:(id)a3
{
  if (self->_change)
  {
    p_items = &self->_items;
    id v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_items);
    [WeakRetained itemShouldBeReinjectedInPushRepository:self];

    [(CPLBeforeUploadCheckItem *)self dropChangeWithReason:v6];
  }
}

- (void)dropSharingChangeWithReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  change = self->_change;
  if (change && [(CPLRecordChange *)change hasChangeType:64])
  {
    if (![(CPLRecordChange *)self->_change supportsSharing])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v10 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          BOOL v11 = self->_change;
          *(_DWORD *)buf = 138412290;
          __int16 v15 = v11;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Trying to drop sharing change for unsupported %@", buf, 0xCu);
        }
      }
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      char v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m"];
      [v12 handleFailureInMethod:a2, self, v13, 845, @"Trying to drop sharing change for unsupported %@", self->_change object file lineNumber description];

      abort();
    }
    unint64_t v7 = [(CPLRecordChange *)self->_change changeType];
    if (!v7) {
      unint64_t v7 = [(CPLRecordChange *)self->_change fullChangeTypeForFullRecord];
    }
    if (v7 == 64)
    {
      [(CPLBeforeUploadCheckItem *)self dropChangeWithReason:v5];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v8 = __CPLCheckOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_change;
          *(_DWORD *)buf = 138412546;
          __int16 v15 = v9;
          __int16 v16 = 2112;
          id v17 = v5;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Dropping sharing change for %@ - reason: %@", buf, 0x16u);
        }
      }
      [(CPLRecordChange *)self->_change setChangeType:v7 & 0xFFFFFFFFFFFFFFBFLL];
    }
  }
}

- (void)dropChangeWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_change)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLCheckOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        change = self->_change;
        int v7 = 138412546;
        uint64_t v8 = change;
        __int16 v9 = 2112;
        id v10 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Dropping %@ - reason: %@", (uint8_t *)&v7, 0x16u);
      }
    }
    [(CPLBeforeUploadCheckItem *)self _dropChangeWithReason:v4];
  }
}

- (void)_dropChangeWithReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_change)
  {
    if (!_CPLSilentLogging)
    {
      __int16 v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        Class changeClass = self->_changeClass;
        *(_DWORD *)buf = 138412290;
        Class v15 = changeClass;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Trying to drop an already dropped %@", buf, 0xCu);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m"];
    [v11 handleFailureInMethod:a2, self, v12, 826, @"Trying to drop an already dropped %@", self->_changeClass object file lineNumber description];

    abort();
  }
  id v13 = v6;
  objc_storeStrong((id *)&self->_dropReason, a3);
  change = self->_change;
  self->_change = 0;

  *(_WORD *)&self->_needsToGenerateImageDerivatives = 0;
  if ([(CPLRecordChange *)self->_change supportsResources]
    && [(CPLRecordChange *)self->_change hasChangeType:8])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    [WeakRetained itemWillDropResourceChange:self];
  }
}

- (void)dropResourceChangeWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  change = self->_change;
  if (change
    && [(CPLRecordChange *)change supportsResources]
    && [(CPLRecordChange *)self->_change hasChangeType:8])
  {
    unint64_t v7 = [(CPLRecordChange *)self->_change changeType];
    if (!v7) {
      unint64_t v7 = [(CPLRecordChange *)self->_change fullChangeTypeForFullRecord];
    }
    if (v7 == 8)
    {
      [(CPLBeforeUploadCheckItem *)self dropChangeWithReason:v5];
    }
    else
    {
      objc_storeStrong((id *)&self->_dropReason, a3);
      if (!_CPLSilentLogging)
      {
        uint64_t v8 = __CPLCheckOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v9 = self->_change;
          int v11 = 138412546;
          uint64_t v12 = v9;
          __int16 v13 = 2112;
          id v14 = v5;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Dropping resource change for %@ - reason: %@", (uint8_t *)&v11, 0x16u);
        }
      }
      [(CPLRecordChange *)self->_change setChangeType:v7 & 0xFFFFFFFFFFFFFFF7];
      *(_WORD *)&self->_needsToGenerateImageDerivatives = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
      [WeakRetained itemWillDropResourceChange:self];
    }
  }
}

- (BOOL)requestFetchOfRecordWithScopedIdentifier:(id)a3 forRule:(id)a4 error:(id *)a5
{
  id v8 = a3;
  __int16 v9 = (__CFString *)a4;
  if (v9 != @"CheckRuleDisabled")
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    int v11 = [WeakRetained requestFetchOfRecordWithScopedIdentifier:v8 forItem:self rule:v9 error:a5];

    if (!v11)
    {
      BOOL v15 = 0;
      goto LABEL_8;
    }
    rulesForOtherRecordFetches = self->_rulesForOtherRecordFetches;
    if (!rulesForOtherRecordFetches)
    {
      __int16 v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v14 = self->_rulesForOtherRecordFetches;
      self->_rulesForOtherRecordFetches = v13;

      rulesForOtherRecordFetches = self->_rulesForOtherRecordFetches;
    }
    [(NSMutableDictionary *)rulesForOtherRecordFetches setObject:v8 forKeyedSubscript:v9];
  }
  BOOL v15 = 1;
LABEL_8:

  return v15;
}

- (BOOL)requestFetchForRule:(id)a3 error:(id *)a4
{
  id v6 = (__CFString *)a3;
  if (v6 == @"CheckRuleDisabled")
  {
    char v8 = 1;
  }
  else
  {
    rulesForRecordFetch = self->_rulesForRecordFetch;
    if (rulesForRecordFetch)
    {
      char v8 = 1;
    }
    else
    {
      __int16 v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v10 = self->_rulesForRecordFetch;
      self->_rulesForRecordFetch = v9;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
      uint64_t v12 = [(CPLRecordChange *)self->_change scopedIdentifier];
      char v8 = [WeakRetained requestFetchOfRecordWithScopedIdentifier:v12 forItem:self rule:v6 error:a4];

      rulesForRecordFetch = self->_rulesForRecordFetch;
    }
    [(NSMutableSet *)rulesForRecordFetch addObject:v6];
  }

  return v8;
}

- (BOOL)hasRequestedRecordFetch
{
  return self->_rulesForRecordFetch != 0;
}

- (BOOL)checkBeforeUploadWithError:(id *)a3
{
  if (![(CPLBeforeUploadCheckItem *)self hasRequestedRecordFetch]) {
    goto LABEL_22;
  }
  if ([(CPLRecordChange *)self->_change isDelete])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    char v6 = [WeakRetained transportHasRecordWithScopedIdentifier:self->_scopedIdentifier];

    change = self->_change;
    if (v6)
    {
      [(CPLRecordChange *)change setRecordChangeData:0];
      [(CPLRecordChange *)self->_change setSharingRecordChangeData:0];
    }
    else
    {
      self->_change = 0;
    }
LABEL_22:
    id v10 = 0;
    goto LABEL_23;
  }
  id v37 = 0;
  BOOL v8 = [(CPLBeforeUploadCheckItem *)self _forRule:@"FullRecordAlreadyOnServer" check:CPLUploadCheckRuleFullRecordAlreadyOnServerFunction error:&v37];
  id v9 = v37;
  id v10 = v9;
  if (!v8) {
    goto LABEL_31;
  }
  id v36 = v9;
  BOOL v11 = [(CPLBeforeUploadCheckItem *)self _forRule:@"DropSparseResources" check:CPLUploadCheckRuleDropSparseResourcesFunction error:&v36];
  id v12 = v36;

  if (!v11) {
    goto LABEL_28;
  }
  id v35 = v12;
  BOOL v13 = [(CPLBeforeUploadCheckItem *)self _forRule:@"OnlyUploadAddedResources" check:CPLUploadCheckRuleOnlyUploadAddedResourcesFunction error:&v35];
  id v10 = v35;

  if (!v13) {
    goto LABEL_31;
  }
  id v34 = v10;
  BOOL v14 = [(CPLBeforeUploadCheckItem *)self _forAdditionalRecordRule:@"CopyDerivativesFromSource" check:CPLUploadCheckRuleCopyDerivativesFromSourceFunction error:&v34];
  id v12 = v34;

  if (!v14) {
    goto LABEL_28;
  }
  id v33 = v12;
  BOOL v15 = [(CPLBeforeUploadCheckItem *)self _forRule:@"DontTrustCloudCache" check:CPLUploadCheckRuleDontTrustCloudCacheFunction error:&v33];
  id v10 = v33;

  if (!v15) {
    goto LABEL_31;
  }
  if ((self->_ruleGroups & 2) != 0)
  {
    id v32 = v10;
    BOOL v16 = [(CPLBeforeUploadCheckItem *)self _forRule:@"ForwardCompatibility" check:CPLUploadCheckRuleForwardCompatibilityFunction error:&v32];
    id v12 = v32;

    if (!v16) {
      goto LABEL_28;
    }
    if ((self->_ruleGroups & 2) != 0)
    {
      id v31 = v12;
      BOOL v24 = [(CPLBeforeUploadCheckItem *)self _forRule:@"AvoidGeneratingDerivatives" check:CPLUploadCheckRuleAvoidGeneratingDerivativesFunction error:&v31];
      id v10 = v31;

      if (!v24) {
        goto LABEL_31;
      }
      if ((self->_ruleGroups & 2) == 0) {
        goto LABEL_14;
      }
      id v30 = v10;
      BOOL v25 = [(CPLBeforeUploadCheckItem *)self _forRule:@"AvoidAccidentalUnshare" check:CPLUploadCheckRuleAvoidAccidentalUnshareFunction error:&v30];
      id v12 = v30;

      if (!v25) {
        goto LABEL_28;
      }
    }
    id v10 = v12;
  }
LABEL_14:
  id v17 = v10;
  id v29 = v10;
  BOOL v18 = [(CPLBeforeUploadCheckItem *)self _forRule:@"UpdateRecordTargetForSharingChange" check:CPLUploadCheckRuleUpdateRecordTargetForSharingChangeFunction error:&v29];
  id v10 = v29;

  if (!v18) {
    goto LABEL_31;
  }
  if ((self->_ruleGroups & 2) == 0) {
    goto LABEL_18;
  }
  id v28 = v10;
  BOOL v19 = [(CPLBeforeUploadCheckItem *)self _forRule:@"UpdateRecordTargetDuringResetSync" check:CPLUploadCheckRuleUpdateRecordTargetDuringResetSyncFunction error:&v28];
  id v12 = v28;

  if (v19)
  {
    id v10 = v12;
LABEL_18:
    uint64_t v20 = v10;
    id v27 = v10;
    BOOL v21 = [(CPLBeforeUploadCheckItem *)self _forRule:@"EnsureRelatedRecordIsShared" check:CPLUploadCheckRuleEnsureRelatedRecordIsSharedFunction error:&v27];
    id v10 = v27;

    if (v21)
    {
      if ((self->_ruleGroups & 8) == 0)
      {
LABEL_23:
        BOOL v22 = 1;
        goto LABEL_24;
      }
      id v26 = v10;
      BOOL v22 = [(CPLBeforeUploadCheckItem *)self _forRule:@"UpdatePushRepositoryPriorityWhenOverQuota" check:CPLUploadCheckRuleUpdatePushRepositoryPriorityWhenOverQuotaFunction error:&v26];
      id v12 = v26;

      goto LABEL_29;
    }
LABEL_31:
    BOOL v22 = 0;
    if (!a3) {
      goto LABEL_24;
    }
    goto LABEL_32;
  }
LABEL_28:
  BOOL v22 = 0;
LABEL_29:
  id v10 = v12;
  if (!a3) {
    goto LABEL_24;
  }
LABEL_32:
  if (!v22)
  {
    id v10 = v10;
    BOOL v22 = 0;
    *a3 = v10;
  }
LABEL_24:

  return v22;
}

- (BOOL)_forAdditionalRecordRule:(id)a3 check:(void *)a4 error:(id *)a5
{
  if (!self->_change) {
    return 1;
  }
  BOOL v8 = [(NSMutableDictionary *)self->_rulesForOtherRecordFetches objectForKey:a3];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    id v10 = [WeakRetained recordFromTransportWithScopedIdentifier:v8];

    char v11 = ((uint64_t (*)(CPLBeforeUploadCheckItem *, void *, id *))a4)(self, v10, a5);
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)_forRule:(id)a3 check:(void *)a4 error:(id *)a5
{
  if (![(NSMutableSet *)self->_rulesForRecordFetch containsObject:a3]) {
    return 1;
  }
  if (!self->_hasCachedResultOfServerCheck)
  {
    self->_hasCachedResultOfServerCheck = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    BOOL v8 = [WeakRetained recordFromTransportWithScopedIdentifier:self->_scopedIdentifier];
    recordOnServer = self->_recordOnServer;
    self->_recordOnServer = v8;

    self->_recordExistsOnServer = self->_recordOnServer != 0;
  }
  return ((uint64_t (*)(CPLBeforeUploadCheckItem *))a4)(self);
}

- (BOOL)prepareWithError:(id *)a3
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  p_items = &self->_items;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_items);
  unint64_t v7 = [WeakRetained provider];

  BOOL v8 = [(CPLRecordChange *)self->_change scopedIdentifier];
  id v126 = 0;
  char v9 = [v7 willNeedToAccessRecordWithScopedIdentifier:v8 error:&v126];
  id v10 = (CPLScopedIdentifier *)v126;

  if (v9)
  {
    char v11 = [(CPLRecordChange *)self->_change relatedScopedIdentifier];
    v125 = v10;
    BOOL v12 = [(CPLBeforeUploadCheckItem *)self _addRelatedRecordWithScopedIdentifierToAdditionalRecords:v11 provider:v7 error:&v125];
    BOOL v13 = v125;

    if (!v12)
    {
LABEL_22:
      BOOL v26 = 0;
      goto LABEL_92;
    }
    BOOL v14 = [(CPLRecordChange *)self->_change secondaryScopedIdentifier];
    v124 = v13;
    BOOL v15 = [(CPLBeforeUploadCheckItem *)self _addRelatedRecordWithScopedIdentifierToAdditionalRecords:v14 provider:v7 error:&v124];
    id v10 = v124;

    if (!v15)
    {
      BOOL v26 = 0;
      BOOL v13 = v10;
      goto LABEL_92;
    }
    if ((self->_ruleGroups & 8) != 0
      && ![(CPLRecordChange *)self->_change canLowerQuota]
      && [(CPLRecordChange *)self->_change isAssetChange]
      && !self->_pushRepositoryPriority)
    {
      id v76 = objc_loadWeakRetained((id *)p_items);
      int v77 = [v76 shouldCheckOverQuotaChangesWithServer];

      if (v77)
      {
        if ((self->_ruleGroups & 8) != 0)
        {
          v123 = v10;
          BOOL v78 = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:@"UpdatePushRepositoryPriorityWhenOverQuota" error:&v123];
          BOOL v13 = v123;

          if (!v78) {
            goto LABEL_22;
          }
          id v10 = v13;
        }
      }
      else
      {
        v85 = [(CPLRecordChange *)self->_change _recordKnownByCloudCache];
        [(CPLBeforeUploadCheckItem *)self updatePushRepositoryPriorityWithRecordOnServer:v85];

        if (!self->_change) {
          goto LABEL_145;
        }
      }
    }
    BOOL v16 = (CPLScopedIdentifier *)objc_loadWeakRetained((id *)p_items);
    uint64_t v17 = [(CPLScopedIdentifier *)v16 sharingScopeIdentifier];
    if (!v17) {
      goto LABEL_18;
    }
    BOOL v18 = (void *)v17;
    BOOL v19 = [(CPLRecordChange *)self->_change supportsSharingScopedIdentifier];

    if (v19 && [(CPLRecordChange *)self->_change hasChangeType:64])
    {
      change = self->_change;
      id v21 = objc_loadWeakRetained((id *)p_items);
      BOOL v22 = [v21 sharingScopeIdentifier];
      LOBYTE(change) = [(CPLRecordChange *)change isSharedInScopeWithIdentifier:v22];

      if (change)
      {
        BOOL v16 = [(CPLRecordChange *)self->_change relatedScopedIdentifier];
        if (v16)
        {
          if (([v7 isCloudRecordWithScopedIdentifierShared:v16] & 1) == 0)
          {
            [(CPLRecordChange *)self->_change _noteRelatedRecordShouldBeShared];
            if (!_CPLSilentLogging)
            {
              uint64_t v23 = __CPLCheckOSLogDomain();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v24 = [(CPLRecordChange *)self->_change scopedIdentifier];
                *(_DWORD *)buf = 138412546;
                uint64_t v129 = (uint64_t)v24;
                __int16 v130 = 2112;
                v131 = v16;
                _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEFAULT, "In order to share %@, we will need to ensure %@ is also shared", buf, 0x16u);
              }
            }
          }
        }
LABEL_18:

        goto LABEL_19;
      }
      if ((self->_ruleGroups & 2) != 0)
      {
        v122 = v10;
        LOBYTE(v34) = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:@"AvoidAccidentalUnshare" error:&v122];
        id v35 = v122;
      }
      else
      {
        if ([(CPLRecordChange *)self->_change isFullRecord]) {
          goto LABEL_19;
        }
        id v33 = [(CPLRecordChange *)self->_change sharingRecordChangeData];

        if (v33) {
          goto LABEL_19;
        }
        v121 = v10;
        uint64_t v34 = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:@"UpdateRecordTargetForSharingChange" error:&v121];
        id v35 = v121;
      }
      BOOL v13 = v35;

      if ((v34 & 1) == 0) {
        goto LABEL_22;
      }
      id v10 = v13;
    }
LABEL_19:
    if ((self->_ruleGroups & 2) != 0 && [(CPLRecordChange *)self->_change supportsSharing])
    {
      v120 = v10;
      BOOL v25 = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:@"UpdateRecordTargetDuringResetSync" error:&v120];
      BOOL v13 = v120;

      if (!v25) {
        goto LABEL_22;
      }
    }
    else
    {
      BOOL v13 = v10;
    }
    if (![(CPLRecordChange *)self->_change supportsResources]
      || ![(CPLRecordChange *)self->_change hasChangeType:8])
    {
      BOOL v26 = 1;
      goto LABEL_92;
    }
    v101 = [v7 availableResourceTypesToUploadForChange:self->_change];
    uint64_t v28 = [(CPLRecordChange *)self->_change resourceCopyFromScopedIdentifier];
    v94 = [(CPLRecordChange *)self->_change resources];
    if ([(CPLRecordChange *)self->_change isAssetChange])
    {
      id v29 = [(CPLRecordChange *)self->_change adjustments];
      BOOL v93 = v29 != 0;
    }
    else
    {
      BOOL v93 = 0;
    }
    v92 = (CPLScopedIdentifier *)v28;
    if (v28)
    {
      id v119 = 0;
      char v30 = [v7 willNeedToAccessRecordWithScopedIdentifier:v28 error:&v119];
      id v31 = v119;
      if (v30)
      {
        BOOL v32 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v36 = __CPLCheckOSLogDomain();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            scopedIdentifier = self->_scopedIdentifier;
            *(_DWORD *)buf = 138412802;
            uint64_t v129 = v28;
            __int16 v130 = 2112;
            v131 = scopedIdentifier;
            __int16 v132 = 2112;
            id v133 = v31;
            _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_ERROR, "Can't copy resources from %@ to %@ as the source scope can't be accessed: %@", buf, 0x20u);
          }
        }
        v118 = v13;
        BOOL v32 = [(CPLBeforeUploadCheckItem *)self rejectChangeWithReason:@"invalid source scope for copy" error:&v118];
        uint64_t v38 = v118;

        BOOL v13 = v38;
      }
      if ([v94 count]) {
        int v39 = 1;
      }
      else {
        int v39 = v93;
      }
      if (v39 == 1) {
        int v96 = [v101 isEmpty];
      }
      else {
        int v96 = 0;
      }

      if (!v32)
      {
        BOOL v26 = 0;
        goto LABEL_91;
      }
    }
    else
    {
      int v96 = 0;
    }
    v91 = a3;
    v40 = objc_alloc_init(CPLResourceTypeSet);
    resourcesToGenerateImageDerivatives = self->_resourcesToGenerateImageDerivatives;
    self->_resourcesToGenerateImageDerivatives = v40;

    id v42 = objc_alloc_init(CPLResourceTypeSet);
    resourcesToGenerateVideoComplementDerivatives = self->_resourcesToGenerateVideoComplementDerivatives;
    self->_resourcesToGenerateVideoComplementDerivatives = v42;

    *(_WORD *)&self->_needsToGenerateImageDerivatives = 257;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id obj = v94;
    uint64_t v100 = [obj countByEnumeratingWithState:&v114 objects:v127 count:16];
    if (v100)
    {
      int v44 = 0;
      BOOL v102 = 0;
      uint64_t v99 = *(void *)v115;
      char v95 = v96;
      v98 = v7;
      do
      {
        uint64_t v45 = 0;
        do
        {
          int v103 = v44;
          if (*(void *)v115 != v99) {
            objc_enumerationMutation(obj);
          }
          v104 = v13;
          long long v46 = *(void **)(*((void *)&v114 + 1) + 8 * v45);
          uint64_t v47 = objc_msgSend(v46, "resourceType", v91);
          int v48 = [v7 isResourceDynamic:v46];
          if (v93 && !v102) {
            BOOL v102 = +[CPLResource isAdjustedResourceType:v47];
          }
          long long v49 = (id *)p_items;
          id v50 = objc_loadWeakRetained((id *)p_items);
          long long v51 = [v50 originalBatch];
          long long v52 = [(CPLRecordChange *)self->_change scopedIdentifier];
          v53 = [v51 localResourceOfType:v47 forItemWithCloudScopedIdentifier:v52];

          if (!v53)
          {
            unint64_t v7 = v98;
            v65 = v104;
            if (!_CPLSilentLogging)
            {
              v66 = __CPLCheckOSLogDomain();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v129 = (uint64_t)v46;
                _os_log_impl(&dword_1B4CAC000, v66, OS_LOG_TYPE_ERROR, "Cloud resource %@ does not match any local resource for upload", buf, 0xCu);
              }
            }
            v60 = +[CPLErrors invalidCloudCacheErrorWithReason:0];
            v53 = 0;
            goto LABEL_87;
          }
          if (([v101 containsResourceType:v47] ^ 1 | v48))
          {
            v54 = [v46 identity];
            v55 = v54;
            if (v96)
            {
              [v54 setAvailable:1];

              v95 &= v47 != 5;
              unint64_t v7 = v98;
            }
            else
            {
              unint64_t v7 = v98;
              [v54 setAvailable:v48 != 0];
            }
            BOOL v13 = v104;
          }
          else
          {
            unint64_t v7 = v98;
            switch(v47)
            {
              case 1:
              case 2:
              case 16:
              case 17:
                __int16 v56 = self->_resourcesToGenerateImageDerivatives;
                uint64_t v57 = v47;
                goto LABEL_66;
              case 3:
              case 4:
              case 5:
                self->_needsToGenerateImageDerivatives = 0;
                goto LABEL_71;
              case 6:
              case 7:
              case 21:
              case 28:
                self->_needsToGenerateVideoComplementDerivatives = 0;
                goto LABEL_71;
              case 8:
              case 9:
              case 10:
              case 11:
              case 12:
              case 13:
              case 14:
              case 15:
              case 19:
              case 20:
              case 22:
              case 23:
              case 24:
              case 25:
              case 26:
              case 27:
                goto LABEL_71;
              case 18:
                __int16 v56 = self->_resourcesToGenerateVideoComplementDerivatives;
                uint64_t v57 = 18;
                goto LABEL_66;
              default:
                unint64_t v7 = v98;
                if (v47 != 1000 || !v93) {
                  goto LABEL_71;
                }
                __int16 v56 = self->_resourcesToGenerateImageDerivatives;
                uint64_t v57 = 1000;
LABEL_66:
                [(CPLResourceTypeSet *)v56 addResourceType:v57];
LABEL_71:
                id v58 = objc_loadWeakRetained(v49);
                v113 = v104;
                uint64_t v59 = [v58 willUploadCloudResource:v46 localResource:v53 forItem:self error:&v113];
                v60 = v113;

                if (!v59)
                {
                  if (!_CPLSilentLogging)
                  {
                    v79 = __CPLCheckOSLogDomain();
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v129 = (uint64_t)v46;
                      __int16 v130 = 2112;
                      v131 = v60;
                      _os_log_impl(&dword_1B4CAC000, v79, OS_LOG_TYPE_ERROR, "Can't create URL to upload cloud %@: %@", buf, 0x16u);
                    }
                  }
                  v65 = [(CPLScopedIdentifier *)v60 domain];
                  if ([v65 isEqualToString:*MEMORY[0x1E4F281F8]])
                  {
                    uint64_t v80 = [(CPLScopedIdentifier *)v60 code];

                    a3 = v91;
                    if (v80 == 4)
                    {
                      +[CPLErrors invalidClientCacheErrorWithReason:@"Resource storage is invalid during push to transport"];
                      v65 = v60;
                      v60 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue();
LABEL_88:
                    }
                    BOOL v26 = 0;

LABEL_90:
                    BOOL v13 = v60;
                    goto LABEL_91;
                  }
LABEL_87:
                  a3 = v91;
                  goto LABEL_88;
                }
                v61 = [v46 identity];
                [v61 setFileURL:v59];
                [v61 setAvailable:1];

                BOOL v13 = v60;
                break;
            }
          }
          v62 = [v46 identity];
          int v63 = [v62 isAvailable];

          int v44 = v63 ^ 1 | v103;
          ++v45;
          p_items = (CPLBeforeUploadCheckItems **)v49;
        }
        while (v100 != v45);
        uint64_t v64 = [obj countByEnumeratingWithState:&v114 objects:v127 count:16];
        uint64_t v100 = v64;
      }
      while (v64);
    }
    else
    {
      LOBYTE(v102) = 0;
      LOBYTE(v44) = 0;
      char v95 = v96;
    }

    if (self->_needsToGenerateImageDerivatives
      && [(CPLResourceTypeSet *)self->_resourcesToGenerateImageDerivatives isEmpty])
    {
      self->_needsToGenerateImageDerivatives = 0;
    }
    a3 = v91;
    if (self->_needsToGenerateVideoComplementDerivatives
      && [(CPLResourceTypeSet *)self->_resourcesToGenerateVideoComplementDerivatives isEmpty])
    {
      self->_needsToGenerateVideoComplementDerivatives = 0;
    }
    if (v44 & 1 | !v93 | v102)
    {
      if ((v44 & 1) == 0)
      {
        if ((v95 & 1) == 0)
        {
          BOOL v26 = 1;
          goto LABEL_155;
        }
        goto LABEL_143;
      }
    }
    else
    {
      if (v96)
      {
        if (!_CPLSilentLogging)
        {
          v81 = __CPLCheckOSLogDomain();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            v82 = self->_change;
            *(_DWORD *)buf = 138412546;
            uint64_t v129 = (uint64_t)v82;
            __int16 v130 = 2112;
            v131 = v92;
            _os_log_impl(&dword_1B4CAC000, v81, OS_LOG_TYPE_DEFAULT, "%@ is adjusted but has no adjusted resources - we will copy them from %@", buf, 0x16u);
          }
        }
LABEL_143:
        v110 = v13;
        v83 = (id *)&v110;
        BOOL v84 = [(CPLBeforeUploadCheckItem *)self requestFetchOfRecordWithScopedIdentifier:v92, @"CopyDerivativesFromSource", &v110, v91 forRule error];
LABEL_154:
        BOOL v26 = v84;
        v90 = (CPLScopedIdentifier *)*v83;

        BOOL v13 = v90;
LABEL_155:
        if ([(CPLBeforeUploadCheckItem *)self needsToGenerateDerivatives] && v26)
        {
          if ((self->_ruleGroups & 2) != 0)
          {
            v109 = v13;
            BOOL v26 = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:@"AvoidGeneratingDerivatives" error:&v109];
            v60 = v109;

            goto LABEL_90;
          }
          BOOL v26 = 1;
        }
LABEL_91:

LABEL_92:
        v67 = [(CPLRecordChange *)self->_change recordChangeData];

        if (v67)
        {
          if (v26)
          {
LABEL_94:
            id v10 = v13;
            goto LABEL_95;
          }
LABEL_108:
          BOOL v27 = 0;
          id v10 = v13;
          goto LABEL_109;
        }
        if (!v26) {
          goto LABEL_108;
        }
        if ([(CPLRecordChange *)self->_change isFullRecord])
        {
          v108 = v13;
          BOOL v71 = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:@"FullRecordAlreadyOnServer" error:&v108];
          id v10 = v108;

          if (!v71) {
            goto LABEL_107;
          }
          BOOL v13 = v10;
        }
        if ((self->_ruleGroups & 2) == 0) {
          goto LABEL_94;
        }
        if (![(CPLRecordChange *)self->_change hasChangeType:32]) {
          goto LABEL_94;
        }
        uint64_t v72 = [(id)objc_opt_class() copyPropertyBlockForDirection:1];
        if (!v72) {
          goto LABEL_94;
        }
        v73 = (void *)v72;
        v107 = v13;
        BOOL v74 = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:@"ForwardCompatibility" error:&v107];
        id v10 = v107;

        if (v74)
        {
LABEL_95:
          if ([(CPLRecordChange *)self->_change _shouldNotTrustCloudCache])
          {
            v106 = v10;
            BOOL v27 = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:@"DontTrustCloudCache" error:&v106];
            v68 = v106;

            v69 = [(CPLRecordChange *)self->_change relatedScopedIdentifier];
            if (v69)
            {
              v105 = v68;
              BOOL v27 = [(CPLBeforeUploadCheckItem *)self requestFetchOfRecordWithScopedIdentifier:v69 forRule:@"DontTrustCloudCache" error:&v105];
              v70 = v105;

              v68 = v70;
            }

            id v10 = v68;
LABEL_109:
            if (a3 && !v27) {
              goto LABEL_111;
            }
            goto LABEL_112;
          }
LABEL_145:
          BOOL v27 = 1;
          goto LABEL_112;
        }
LABEL_107:
        BOOL v27 = 0;
        goto LABEL_109;
      }
      if (!_CPLSilentLogging)
      {
        v86 = __CPLCheckOSLogDomain();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          v87 = self->_change;
          *(_DWORD *)buf = 138412290;
          uint64_t v129 = (uint64_t)v87;
          _os_log_impl(&dword_1B4CAC000, v86, OS_LOG_TYPE_DEFAULT, "%@ is adjusted but has no adjusted resources - considering the record as sparse", buf, 0xCu);
        }
      }
    }
    if ([(CPLRecordChange *)self->_change allowsToOnlyUploadNewResources])
    {
      v112 = v13;
      v88 = @"OnlyUploadAddedResources";
      v83 = (id *)&v112;
      v89 = (id *)&v112;
    }
    else
    {
      v111 = v13;
      v88 = @"DropSparseResources";
      v83 = (id *)&v111;
      v89 = (id *)&v111;
    }
    BOOL v84 = [(CPLBeforeUploadCheckItem *)self requestFetchForRule:v88 error:v89];
    goto LABEL_154;
  }
  if (a3)
  {
LABEL_111:
    id v10 = v10;
    BOOL v27 = 0;
    *a3 = v10;
    goto LABEL_112;
  }
  BOOL v27 = 0;
LABEL_112:

  return v27;
}

- (BOOL)_addRelatedRecordWithScopedIdentifierToAdditionalRecords:(id)a3 provider:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v8;
  BOOL v10 = !v7 || [v8 willNeedToAccessRecordWithScopedIdentifier:v7 error:a5];

  return v10;
}

- (BOOL)needsToGenerateDerivatives
{
  if (!self->_change) {
    return 0;
  }
  if (self->_needsToGenerateImageDerivatives) {
    return 1;
  }
  return self->_needsToGenerateVideoComplementDerivatives;
}

- (BOOL)isTrashedOrDeletedAsset
{
  return self->_change && self->_isTrashedOrDeletedAsset;
}

- (CPLBeforeUploadCheckItem)initWithChange:(id)a3 checkItems:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CPLBeforeUploadCheckItem;
  char v9 = [(CPLBeforeUploadCheckItem *)&v22 init];
  BOOL v10 = v9;
  if (v9)
  {
    p_change = (id *)&v9->_change;
    objc_storeStrong((id *)&v9->_change, a3);
    if (![(CPLRecordChange *)v10->_change isDelete])
    {
      BOOL v12 = [*p_change recordModificationDate];

      if (!v12 && _CPLSilentLogging == 0)
      {
        BOOL v14 = __CPLCheckOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = *p_change;
          *(_DWORD *)buf = 138412290;
          id v24 = v15;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "No record modification date for %@", buf, 0xCu);
        }
      }
    }
    uint64_t v16 = [(CPLRecordChange *)v10->_change scopedIdentifier];
    scopedIdentifier = v10->_scopedIdentifier;
    v10->_scopedIdentifier = (CPLScopedIdentifier *)v16;

    objc_storeWeak((id *)&v10->_items, v8);
    uint64_t v18 = objc_opt_class();
    Class changeClass = v10->_changeClass;
    v10->_Class changeClass = (Class)v18;

    int v20 = [(CPLRecordChange *)v10->_change isAssetChange];
    v10->_isAsset = v20;
    if (v20)
    {
      if ([*p_change isDelete]) {
        LOBYTE(v20) = 1;
      }
      else {
        LOBYTE(v20) = [*p_change inTrash];
      }
    }
    v10->_isTrashedOrDeletedAsset = v20;
    v10->_ruleGroups = [v8 ruleGroups];
    v10->_unint64_t pushRepositoryPriority = [v8 pushRepositoryPriority];
  }

  return v10;
}

+ (BOOL)allowsAssetsWithResourcesButNoAdjustments
{
  return _allowsAssetsWithResourcesButNoAdjustments;
}

+ (void)setAllowsAssetsWithResourcesButNoAdjustments:(BOOL)a3
{
  _allowsAssetsWithResourcesButNoAdjustments = a3;
}

@end