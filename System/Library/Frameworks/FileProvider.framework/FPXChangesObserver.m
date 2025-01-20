@interface FPXChangesObserver
- (FPXChangesObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5;
- (FPXChangesObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 previousChangeToken:(id)a5 nsFileProviderRequest:(id)a6;
- (id)finishedBlock;
- (int64_t)suggestedBatchSize;
- (void)didDeleteItemsWithIdentifiers:(id)a3;
- (void)didUpdateItems:(id)a3;
- (void)finishEnumeratingChangesUpToSyncAnchor:(id)a3 moreComing:(BOOL)a4;
- (void)finishEnumeratingWithError:(id)a3;
- (void)setFinishedBlock:(id)a3;
- (void)setSuggestedBatchSize:(int64_t)a3;
@end

@implementation FPXChangesObserver

- (void)didDeleteItemsWithIdentifiers:(id)a3
{
  id v29 = a3;
  v4 = [(FPXDomainContext *)self->super._domainContext log];
  id v5 = fpfs_adopt_log(v4);

  v6 = [(FPXDomainContext *)self->super._domainContext domain];
  uint64_t v7 = [v6 personaIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(FPXDomainContext *)self->super._domainContext domain];
    v10 = [v9 personaIdentifier];
    v11 = [MEMORY[0x1E4FB36F8] sharedManager];
    v12 = [v11 currentPersona];
    v13 = [v12 userPersonaUniqueString];
    char v14 = [v10 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      v15 = NSString;
      v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      v17 = [v16 currentPersona];
      v18 = [v17 userPersonaUniqueString];
      v19 = [MEMORY[0x1E4FB36F8] sharedManager];
      v20 = [v19 currentPersona];
      uint64_t v21 = [v20 uid];
      v22 = [(FPXDomainContext *)self->super._domainContext domain];
      v23 = [v22 personaIdentifier];
      v24 = [v15 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v18, v21, v23];

      v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXChangesObserver didDeleteItemsWithIdentifiers:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 209, (const char *)[v24 UTF8String]);
    }
  }
  else
  {
  }
  uint64_t v26 = [(NSMutableArray *)self->_deletedItemIDs count];
  if ((unint64_t)([v29 count] + v26) >= 0x4E21) {
    __FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__(self->super._observedItemID);
  }
  deletedItemIDs = self->_deletedItemIDs;
  v28 = [(FPXDomainContext *)self->super._domainContext itemIDsFromVendorItemIDs:v29];
  [(NSMutableArray *)deletedItemIDs addObjectsFromArray:v28];
}

- (void)finishEnumeratingChangesUpToSyncAnchor:(id)a3 moreComing:(BOOL)a4
{
  BOOL v41 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(FPXDomainContext *)self->super._domainContext log];
  id v8 = fpfs_adopt_log(v7);

  v9 = [(FPXDomainContext *)self->super._domainContext domain];
  uint64_t v10 = [v9 personaIdentifier];
  if (v10)
  {
    v11 = (void *)v10;
    [(FPXDomainContext *)self->super._domainContext domain];
    id v40 = v6;
    v13 = v12 = a2;
    char v14 = [v13 personaIdentifier];
    v15 = [MEMORY[0x1E4FB36F8] sharedManager];
    v16 = [v15 currentPersona];
    v17 = [v16 userPersonaUniqueString];
    char v18 = [v14 isEqualToString:v17];

    a2 = v12;
    id v6 = v40;

    if ((v18 & 1) == 0)
    {
      v19 = NSString;
      v20 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v21 = [v20 currentPersona];
      v22 = [v21 userPersonaUniqueString];
      v23 = [MEMORY[0x1E4FB36F8] sharedManager];
      v24 = [v23 currentPersona];
      uint64_t v25 = [v24 uid];
      uint64_t v26 = [(FPXDomainContext *)self->super._domainContext domain];
      v27 = [v26 personaIdentifier];
      v28 = [v19 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v22, v25, v27];

      id v29 = fp_current_or_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXChangesObserver finishEnumeratingChangesUpToSyncAnchor:moreComing:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 239, (const char *)[v28 UTF8String]);
    }
  }
  else
  {
  }
  BOOL v30 = [(FPXDomainContext *)self->super._domainContext usesFPFS];
  if (!v6 && v30)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = NSStringFromSelector(a2);
    [v31 handleFailureInMethod:a2, self, @"FPXEnumerator.m", 242, @"%@ returned a nil anchor", v32 object file lineNumber description];
  }
  [(FPXObserver *)self verifyVendorToken:v6];
  v33 = [(FPXChangesObserver *)self finishedBlock];

  if (!v33) {
    __FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__(self->super._observedItemID);
  }
  v34 = fp_current_or_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = objc_msgSend(NSString, "fp_hashForToken:", v6);
    *(_DWORD *)buf = 138543362;
    v43 = v35;
    _os_log_impl(&dword_1A33AE000, v34, OS_LOG_TYPE_INFO, "[INFO] change enumeration returned change token %{public}@", buf, 0xCu);
  }
  v36 = [(FPXChangesObserver *)self finishedBlock];
  if (v36)
  {
    v37 = (void *)[(NSMutableArray *)self->_changedItems copy];
    v38 = (void *)[(NSMutableArray *)self->_deletedItemIDs copy];
    v39 = [(FPXDomainContext *)self->super._domainContext currentResponseWithRequest:self->super._nsFileProviderRequest];
    ((void (**)(void, void *, void *, BOOL, id, void *, void))v36)[2](v36, v37, v38, v41, v6, v39, 0);

    [(FPXChangesObserver *)self setFinishedBlock:0];
  }
}

- (id)finishedBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setFinishedBlock:(id)a3
{
}

- (void)didUpdateItems:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FPXDomainContext *)self->super._domainContext log];
  id v6 = fpfs_adopt_log(v5);

  uint64_t v7 = [(FPXDomainContext *)self->super._domainContext domain];
  uint64_t v8 = [v7 personaIdentifier];
  if (v8)
  {
    v9 = (void *)v8;
    uint64_t v10 = [(FPXDomainContext *)self->super._domainContext domain];
    v11 = [v10 personaIdentifier];
    v12 = [MEMORY[0x1E4FB36F8] sharedManager];
    v13 = [v12 currentPersona];
    char v14 = [v13 userPersonaUniqueString];
    char v15 = [v11 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      v16 = NSString;
      v17 = [MEMORY[0x1E4FB36F8] sharedManager];
      char v18 = [v17 currentPersona];
      v19 = [v18 userPersonaUniqueString];
      v20 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v21 = [v20 currentPersona];
      uint64_t v22 = [v21 uid];
      v23 = [(FPXDomainContext *)self->super._domainContext domain];
      v24 = [v23 personaIdentifier];
      uint64_t v25 = [v16 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v19, v22, v24];

      uint64_t v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXChangesObserver didUpdateItems:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 219, (const char *)[v25 UTF8String]);
    }
  }
  else
  {
  }
  uint64_t v27 = [(NSMutableArray *)self->_changedItems count];
  if ((unint64_t)([v4 count] + v27) >= 0x4E21) {
    __FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__(self->super._observedItemID);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v28 = v4;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v34 = [(FPXObserver *)self updateForProviderItem:v33];
        if (v34)
        {
          [(NSMutableArray *)self->_changedItems addObject:v34];
        }
        else
        {
          v35 = [v33 itemIdentifier];
          if (v35)
          {
            deletedItemIDs = self->_deletedItemIDs;
            v37 = [(FPXDomainContext *)self->super._domainContext itemIDFromVendorItemID:v35];
            [(NSMutableArray *)deletedItemIDs addObject:v37];
          }
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v30);
  }
}

- (int64_t)suggestedBatchSize
{
  return self->_suggestedBatchSize;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedBlock, 0);
  objc_storeStrong((id *)&self->_originalSyncAnchor, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);

  objc_storeStrong((id *)&self->_changedItems, 0);
}

- (FPXChangesObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 previousChangeToken:(id)a5 nsFileProviderRequest:(id)a6
{
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FPXChangesObserver;
  v12 = [(FPXObserver *)&v18 initWithObservedItemID:a3 domainContext:a4 nsFileProviderRequest:a6];
  if (v12)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    changedItems = v12->_changedItems;
    v12->_changedItems = v13;

    char v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedItemIDs = v12->_deletedItemIDs;
    v12->_deletedItemIDs = v15;

    objc_storeStrong((id *)&v12->_originalSyncAnchor, a5);
    v12->_suggestedBatchSize = 200;
  }

  return v12;
}

- (FPXChangesObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5
{
  return [(FPXChangesObserver *)self initWithObservedItemID:a3 domainContext:a4 previousChangeToken:0 nsFileProviderRequest:a5];
}

- (void)finishEnumeratingWithError:(id)a3
{
  id v28 = a3;
  id v4 = [(FPXDomainContext *)self->super._domainContext log];
  id v5 = fpfs_adopt_log(v4);

  id v6 = [(FPXDomainContext *)self->super._domainContext domain];
  uint64_t v7 = [v6 personaIdentifier];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(FPXDomainContext *)self->super._domainContext domain];
    uint64_t v10 = [v9 personaIdentifier];
    id v11 = [MEMORY[0x1E4FB36F8] sharedManager];
    v12 = [v11 currentPersona];
    v13 = [v12 userPersonaUniqueString];
    char v14 = [v10 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      char v15 = NSString;
      v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      v17 = [v16 currentPersona];
      objc_super v18 = [v17 userPersonaUniqueString];
      v19 = [MEMORY[0x1E4FB36F8] sharedManager];
      v20 = [v19 currentPersona];
      uint64_t v21 = [v20 uid];
      uint64_t v22 = [(FPXDomainContext *)self->super._domainContext domain];
      v23 = [v22 personaIdentifier];
      v24 = [v15 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v18, v21, v23];

      uint64_t v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXChangesObserver finishEnumeratingWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 265, (const char *)[v24 UTF8String]);
    }
  }
  else
  {
  }
  uint64_t v26 = [(FPXChangesObserver *)self finishedBlock];
  if (v26)
  {
    uint64_t v27 = [(FPXDomainContext *)self->super._domainContext currentResponseWithRequest:self->super._nsFileProviderRequest];
    ((void (**)(void, void, void, void, void, void *, id))v26)[2](v26, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, 0, v27, v28);

    [(FPXChangesObserver *)self setFinishedBlock:0];
  }
}

- (void)setSuggestedBatchSize:(int64_t)a3
{
  self->_suggestedBatchSize = a3;
}

@end