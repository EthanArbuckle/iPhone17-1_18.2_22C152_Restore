@interface FPXItemsObserver
- (FPXItemsObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5;
- (NSData)syncAnchor;
- (id)finishedBlock;
- (int64_t)suggestedPageSize;
- (void)didEnumerateItems:(id)a3;
- (void)finishEnumeratingUpToPage:(id)a3;
- (void)finishEnumeratingWithError:(id)a3;
- (void)setFinishedBlock:(id)a3;
- (void)setSuggestedPageSize:(int64_t)a3;
- (void)setSyncAnchor:(id)a3;
@end

@implementation FPXItemsObserver

- (FPXItemsObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FPXItemsObserver;
  v5 = [(FPXObserver *)&v9 initWithObservedItemID:a3 domainContext:a4 nsFileProviderRequest:a5];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v5->_items;
    v5->_items = v6;

    v5->_suggestedPageSize = 200;
  }
  return v5;
}

- (void)didEnumerateItems:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(FPXDomainContext *)self->super._domainContext log];
  id v6 = fpfs_adopt_log(v5);

  v7 = [(FPXDomainContext *)self->super._domainContext domain];
  uint64_t v8 = [v7 personaIdentifier];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(FPXDomainContext *)self->super._domainContext domain];
    v11 = [v10 personaIdentifier];
    v12 = [MEMORY[0x1E4FB36F8] sharedManager];
    v13 = [v12 currentPersona];
    v14 = [v13 userPersonaUniqueString];
    char v15 = [v11 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      v16 = NSString;
      v17 = [MEMORY[0x1E4FB36F8] sharedManager];
      v18 = [v17 currentPersona];
      v19 = [v18 userPersonaUniqueString];
      v20 = [MEMORY[0x1E4FB36F8] sharedManager];
      v21 = [v20 currentPersona];
      uint64_t v22 = [v21 uid];
      v23 = [(FPXDomainContext *)self->super._domainContext domain];
      v24 = [v23 personaIdentifier];
      v25 = [v16 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v19, v22, v24];

      v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXItemsObserver didEnumerateItems:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 291, (const char *)[v25 UTF8String]);
    }
  }
  else
  {
  }
  v27 = fp_current_or_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    [(FPXItemsObserver *)(uint64_t)self didEnumerateItems:v27];
  }

  uint64_t v28 = [(NSMutableArray *)self->_items count];
  if ((unint64_t)([v4 count] + v28) >= 0x4E21) {
    __FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__(self->super._observedItemID);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v29 = v4;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v36;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [(FPXObserver *)self updateForProviderItem:*(void *)(*((void *)&v35 + 1) + 8 * v33)];
        if (v34) {
          [(NSMutableArray *)self->_items addObject:v34];
        }

        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v31);
  }
}

- (void)finishEnumeratingUpToPage:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(FPXDomainContext *)self->super._domainContext log];
  id v6 = fpfs_adopt_log(v5);

  v7 = [(FPXDomainContext *)self->super._domainContext domain];
  uint64_t v8 = [v7 personaIdentifier];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(FPXDomainContext *)self->super._domainContext domain];
    v11 = [v10 personaIdentifier];
    v12 = [MEMORY[0x1E4FB36F8] sharedManager];
    v13 = [v12 currentPersona];
    v14 = [v13 userPersonaUniqueString];
    char v15 = [v11 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      v16 = NSString;
      v17 = [MEMORY[0x1E4FB36F8] sharedManager];
      v18 = [v17 currentPersona];
      v19 = [v18 userPersonaUniqueString];
      v20 = [MEMORY[0x1E4FB36F8] sharedManager];
      v21 = [v20 currentPersona];
      uint64_t v22 = [v21 uid];
      v23 = [(FPXDomainContext *)self->super._domainContext domain];
      v24 = [v23 personaIdentifier];
      v25 = [v16 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v19, v22, v24];

      v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXItemsObserver finishEnumeratingUpToPage:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 310, (const char *)[v25 UTF8String]);
    }
  }
  else
  {
  }
  [(FPXObserver *)self verifyVendorToken:v4];
  v27 = [(FPXItemsObserver *)self finishedBlock];

  if (!v27) {
    __FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__(self->super._observedItemID);
  }
  uint64_t v28 = fp_current_or_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v29 = objc_msgSend(NSString, "fp_hashForToken:", v4);
    *(_DWORD *)buf = 138543362;
    long long v35 = v29;
    _os_log_impl(&dword_1A33AE000, v28, OS_LOG_TYPE_INFO, "[INFO] page enumeration returned page token %{public}@", buf, 0xCu);
  }
  uint64_t v30 = [(FPXItemsObserver *)self finishedBlock];
  if (v30)
  {
    items = self->_items;
    uint64_t v32 = [(FPXItemsObserver *)self syncAnchor];
    uint64_t v33 = [(FPXDomainContext *)self->super._domainContext currentResponseWithRequest:self->super._nsFileProviderRequest];
    ((void (**)(void, NSMutableArray *, id, void *, void *, void))v30)[2](v30, items, v4, v32, v33, 0);

    [(FPXItemsObserver *)self setFinishedBlock:0];
  }
}

- (void)finishEnumeratingWithError:(id)a3
{
  id v29 = a3;
  id v4 = [(FPXDomainContext *)self->super._domainContext log];
  id v5 = fpfs_adopt_log(v4);

  id v6 = [(FPXDomainContext *)self->super._domainContext domain];
  uint64_t v7 = [v6 personaIdentifier];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    objc_super v9 = [(FPXDomainContext *)self->super._domainContext domain];
    v10 = [v9 personaIdentifier];
    v11 = [MEMORY[0x1E4FB36F8] sharedManager];
    v12 = [v11 currentPersona];
    v13 = [v12 userPersonaUniqueString];
    char v14 = [v10 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      char v15 = NSString;
      v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      v17 = [v16 currentPersona];
      v18 = [v17 userPersonaUniqueString];
      v19 = [MEMORY[0x1E4FB36F8] sharedManager];
      v20 = [v19 currentPersona];
      uint64_t v21 = [v20 uid];
      uint64_t v22 = [(FPXDomainContext *)self->super._domainContext domain];
      v23 = [v22 personaIdentifier];
      v24 = [v15 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v18, v21, v23];

      v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXItemsObserver finishEnumeratingWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 325, (const char *)[v24 UTF8String]);
    }
  }
  else
  {
  }
  v26 = [(FPXItemsObserver *)self finishedBlock];

  if (!v26) {
    __FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__(self->super._observedItemID);
  }
  v27 = [(FPXItemsObserver *)self finishedBlock];
  if (v27)
  {
    uint64_t v28 = [(FPXDomainContext *)self->super._domainContext currentResponseWithRequest:self->super._nsFileProviderRequest];
    ((void (**)(void, void, void, void, void *, id))v27)[2](v27, MEMORY[0x1E4F1CBF0], 0, 0, v28, v29);

    [(FPXItemsObserver *)self setFinishedBlock:0];
  }
}

- (id)finishedBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setFinishedBlock:(id)a3
{
}

- (NSData)syncAnchor
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSyncAnchor:(id)a3
{
}

- (int64_t)suggestedPageSize
{
  return self->_suggestedPageSize;
}

- (void)setSuggestedPageSize:(int64_t)a3
{
  self->_suggestedPageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong(&self->_finishedBlock, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)didEnumerateItems:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = [a2 count];
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: received %d items", (uint8_t *)&v4, 0x12u);
}

@end