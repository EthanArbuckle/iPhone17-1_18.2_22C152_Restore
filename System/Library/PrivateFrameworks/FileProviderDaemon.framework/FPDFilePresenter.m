@interface FPDFilePresenter
+ (id)presenter:(id)a3 withItemID:(id)a4 auditToken:(id *)a5 urlHint:(id)a6 domain:(id)a7;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEnumeratorActive;
- (BOOL)isEqual:(id)a3;
- (FPDDomain)domain;
- (FPDFilePresenter)initWithIdentifier:(id)a3 itemID:(id)a4 auditToken:(id *)a5 urlHint:(id)a6 domain:(id)a7;
- (FPItemID)itemID;
- (FPItemID)observedItemID;
- (NSString)description;
- (NSString)prettyDescription;
- (NSURL)presentedItemURL;
- (id)_newCoordinator;
- (id)_presentedItemDescription:(BOOL)a3;
- (id)enumerator;
- (id)filePresenterID;
- (int)requestEffectivePID;
- (unint64_t)hash;
- (void)_destroyEnumerator;
- (void)_enumeratorRequestDidFailWithXPCError:(id)a3;
- (void)_fetchChangeToken;
- (void)_fetchUpdates;
- (void)didUpdateItem:(id)a3;
- (void)dumpStateTo:(id)a3;
- (void)enumerationResultsDidChange;
- (void)receiveUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4;
- (void)setAuditToken:(id *)a3;
- (void)setDomain:(id)a3;
- (void)setFilePresenterID:(id)a3;
- (void)setIsEnumeratorActive:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation FPDFilePresenter

- (unint64_t)hash
{
  uint64_t v3 = [(FPItemID *)self->_observedItemID hash];
  return [self->_filePresenterID hash] ^ v3;
}

- (FPDFilePresenter)initWithIdentifier:(id)a3 itemID:(id)a4 auditToken:(id *)a5 urlHint:(id)a6 domain:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)FPDFilePresenter;
  v17 = [(FPDFilePresenter *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_observedItemID, a4);
    objc_storeStrong((id *)&v18->_domain, a7);
    objc_storeStrong((id *)&v18->_presentedItemURL, a6);
    objc_storeStrong(&v18->_filePresenterID, a3);
    long long v19 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)v18->_auditToken.val = *(_OWORD *)a5->var0;
    *(_OWORD *)&v18->_auditToken.val[4] = v19;
    v20 = [MEMORY[0x1E4F28CA0] _observedUbiquityAttributesForPresenterWithID:v13];
    v21 = v20;
    if (v20)
    {
      uint64_t v22 = [(__CFString *)v20 count];
      v18->_presenterWantsUbiqitousAttributes = v22 != 0;
      if (!v22)
      {
        long long v23 = *(_OWORD *)&v18->_auditToken.val[4];
        *(_OWORD *)buf = *(_OWORD *)v18->_auditToken.val;
        *(_OWORD *)&buf[16] = v23;
        v24 = FPEntitlementValueForAuditToken();
        if (v24)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v18->_passivePresenterRequested = [v24 BOOLValue];
          }
        }
      }
    }
    else
    {
      v18->_presenterWantsUbiqitousAttributes = 1;
    }
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v27 = @"all";
      *(_DWORD *)buf = 138412802;
      if (v21) {
        v27 = v21;
      }
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v27;
      _os_log_debug_impl(&dword_1D744C000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] new presenter %@ for %@, watching attributes: %@", buf, 0x20u);
    }
  }
  return v18;
}

- (int)requestEffectivePID
{
  long long v2 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

+ (id)presenter:(id)a3 withItemID:(id)a4 auditToken:(id *)a5 urlHint:(id)a6 domain:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc((Class)a1);
  long long v17 = *(_OWORD *)&a5->var0[4];
  v20[0] = *(_OWORD *)a5->var0;
  v20[1] = v17;
  v18 = (void *)[v16 initWithIdentifier:v15 itemID:v14 auditToken:v20 urlHint:v13 domain:v12];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 itemID];
    if ([v5 isEqual:self->_observedItemID])
    {
      v6 = [v4 filePresenterID];
      char v7 = [v6 isEqual:self->_filePresenterID];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_presentedItemDescription:(BOOL)a3
{
  id v4 = NSString;
  presentedItemURL = self->_presentedItemURL;
  if (a3)
  {
    v6 = [(NSURL *)presentedItemURL fp_shortDescription];
    char v7 = [v4 stringWithFormat:@"%@ (%@)", v6, self->_observedItemID];
  }
  else
  {
    v6 = [(NSURL *)presentedItemURL lastPathComponent];
    v8 = objc_msgSend(v6, "fp_obfuscatedFilename");
    v9 = [(FPItemID *)self->_observedItemID identifier];
    char v7 = [v4 stringWithFormat:@"%@ (%@)", v8, v9];
  }
  return v7;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(FPDFilePresenter *)self _presentedItemDescription:0];
  long long v6 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v6;
  char v7 = FPExecutableNameForAuditToken();
  long long v8 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v8;
  uint64_t v9 = audit_token_to_pid(&atoken);
  if (self->_isEnumeratorActive) {
    v10 = "";
  }
  else {
    v10 = " (passive)";
  }
  v11 = [v3 stringWithFormat:@"<%@ %p %@ presented by %@[%i]%s>", v4, self, v5, v7, v9, v10];

  return (NSString *)v11;
}

- (id)enumerator
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__13;
  v24 = __Block_byref_object_dispose__13;
  id v25 = 0;
  if (!self->_isRunning)
  {
    id v12 = [NSString stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: enumerator requested on non-running presenter %@", self];
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDFilePresenter enumerator]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDFilePresenter.m", 129, (const char *)[v12 UTF8String]);
  }
  if (self->_isEnumeratorActive)
  {
    enumerator = self->_enumerator;
    if (!enumerator)
    {
      id v14 = [NSString stringWithFormat:@"[ASSERT] ‼️ we should have an enumerator if it's active"];
      id v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDFilePresenter enumerator]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDFilePresenter.m", 140, (const char *)[v14 UTF8String]);
    }
    uint64_t v4 = enumerator;
  }
  else
  {
    v5 = objc_opt_new();
    [v5 setEnumeratedItemID:self->_observedItemID];
    [v5 setPresenterEnumeration:1];
    long long v6 = [NSString stringWithFormat:@"enumerator for %@", self->_observedItemID];
    char v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    long long v8 = [(FPDDomain *)self->_domain defaultBackend];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __30__FPDFilePresenter_enumerator__block_invoke;
    v16[3] = &unk_1E6A76100;
    v16[4] = self;
    long long v19 = &v20;
    id v9 = v6;
    id v17 = v9;
    v10 = v7;
    v18 = v10;
    [v8 enumerateWithSettings:v5 lifetimeExtender:self observer:self completionHandler:v16];

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v4 = (FPXEnumerator *)(id)v21[5];
  }
  _Block_object_dispose(&v20, 8);

  return v4;
}

void __30__FPDFilePresenter_enumerator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  if (!v10 || v6)
  {
    if (!v6)
    {
      FPProviderNotFoundErrorForURL();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F25DA8]), "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1F2EF7328, v6, *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "requestEffectivePID"));
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    [*(id *)(a1 + 32) setIsEnumeratorActive:1];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

- (void)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FPDDomain *)self->_domain provider];
  uint64_t v4 = [v3 presentersQueue];
  queue = self->_queue;
  self->_queue = v4;

  if (self->_queue)
  {
    if (self->_passivePresenterRequested)
    {
      id v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        observedItemID = self->_observedItemID;
        *(_DWORD *)buf = 138412290;
        id v17 = observedItemID;
        uint64_t v8 = "[INFO] ignoring presenter for item %@ because process requested passive presenters";
LABEL_7:
        _os_log_impl(&dword_1D744C000, v6, OS_LOG_TYPE_INFO, v8, buf, 0xCu);
      }
    }
    else
    {
      id v10 = [(FPDDomain *)self->_domain provider];
      v11 = [v10 identifier];
      int v12 = objc_msgSend(v11, "fp_isiCloudDriveOrCloudDocsIdentifier");

      if (!v12 || self->_presenterWantsUbiqitousAttributes)
      {
        id v13 = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __25__FPDFilePresenter_start__block_invoke;
        block[3] = &unk_1E6A73FE8;
        block[4] = self;
        dispatch_async(v13, block);
        return;
      }
      id v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v14 = self->_observedItemID;
        *(_DWORD *)buf = 138412290;
        id v17 = v14;
        uint64_t v8 = "[INFO] ignoring presenter for item %@ for ubiquity attributes";
        goto LABEL_7;
      }
    }
  }
  else
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = self->_observedItemID;
      *(_DWORD *)buf = 138412290;
      id v17 = v9;
      uint64_t v8 = "[INFO] cannot start presenter for %@, provider has been discarded";
      goto LABEL_7;
    }
  }
}

void __25__FPDFilePresenter_start__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 64))
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] presenter %@ started while already running", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v2 + 64) = 1;
    v5 = [*(id *)(*(void *)(a1 + 32) + 32) session];
    [v5 registerLifetimeExtensionForObject:*(void *)(a1 + 32)];

    id v6 = [*(id *)(*(void *)(a1 + 32) + 32) provider];
    int v7 = [v6 supportsEnumeration];

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      [v8 _fetchChangeToken];
    }
  }
}

- (void)stop
{
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__FPDFilePresenter_stop__block_invoke;
    block[3] = &unk_1E6A73FE8;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __24__FPDFilePresenter_stop__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 64))
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_INFO, "[INFO] stopping presenter %@", (uint8_t *)&v6, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
    [*(id *)(a1 + 32) _destroyEnumerator];
    v5 = [*(id *)(*(void *)(a1 + 32) + 32) session];
    [v5 unregisterLifetimeExtensionForObject:*(void *)(a1 + 32)];
  }
  else if (*(void *)(v1 + 16))
  {
    __24__FPDFilePresenter_stop__block_invoke_cold_1();
  }
}

- (void)_enumeratorRequestDidFailWithXPCError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(FPDFilePresenter *)(uint64_t)self _enumeratorRequestDidFailWithXPCError:v5];
  }

  [(FPDFilePresenter *)self _destroyEnumerator];
}

- (void)_destroyEnumerator
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_isFetchingChanges = 0;
  enumerator = self->_enumerator;
  if (enumerator)
  {
    [(FPXEnumerator *)enumerator invalidate];
    id v4 = self->_enumerator;
    self->_enumerator = 0;
  }
  if (self->_isEnumeratorActive) {
    self->_isEnumeratorActive = 0;
  }
}

- (void)receiveUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v47 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v57 = self;
  if (self->_enumerator)
  {
    uint64_t section = __fp_create_section();
    int v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FPDFilePresenter receiveUpdatedItems:deletedItemsIdentifiers:]();
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v48;
    uint64_t v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16, v47);
    if (v7)
    {
      uint64_t v53 = *(void *)v61;
      uint64_t v52 = *MEMORY[0x1E4F1C520];
      location = (id *)&self->_currentItem;
      uint64_t v50 = *MEMORY[0x1E4F1C788];
      uint64_t v49 = *MEMORY[0x1E4F1C7C0];
      do
      {
        uint64_t v54 = v7;
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v61 != v53) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if (v57->_observedItemID)
          {
            uint64_t v10 = [*(id *)(*((void *)&v60 + 1) + 8 * i) itemID];
            if ([v10 isEqual:v57->_observedItemID])
            {
              char v11 = 1;
            }
            else
            {
              int v12 = [v9 formerItemID];
              char v11 = [v12 isEqual:v57->_observedItemID];
            }
          }
          else
          {
            char v11 = 0;
          }
          id v13 = v57->_presentedItemURL;
          id v14 = [v9 fileURL];
          if (!v14)
          {
            id v56 = 0;
            id v19 = 0;
            goto LABEL_24;
          }
          id v15 = [v9 fileURL];
          id v59 = 0;
          int v16 = [v15 getResourceValue:&v59 forKey:v52 error:0];
          id v56 = v59;
          if (v16)
          {
            presentedItemURL = v57->_presentedItemURL;
            id v58 = 0;
            BOOL v18 = [(NSURL *)presentedItemURL getResourceValue:&v58 forKey:v52 error:0];
            id v19 = v58;
            if (v18)
            {
              char v20 = [v56 isEqualToString:v19];

              if (v20) {
                goto LABEL_24;
              }
              [v9 fileURL];
              id v14 = v13;
              id v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
          }
          else
          {
            id v19 = 0;
          }

LABEL_23:
LABEL_24:
          if (v11)
          {
            if (*location) {
              [*location ubiquitousResourceKeysDiffAgainstItem:v9];
            }
            else {
            id v25 = [MEMORY[0x1E4F25D20] allUbiquitousResourceKeys];
            }
            uint64_t v27 = [*location capabilities];
            if (v27 == [v9 capabilities])
            {
              objc_super v28 = (void *)MEMORY[0x1E4F1CAD0];
              v65[0] = v50;
              v65[1] = v49;
              v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
              uint64_t v30 = [v28 setWithArray:v29];
              char v31 = [v25 intersectsSet:v30];
            }
            else
            {
              char v31 = 1;
            }
            objc_storeStrong(location, v9);
            v32 = [MEMORY[0x1E4F28CA0] _observedUbiquityAttributesForPresenterWithID:v57->_filePresenterID];
            v33 = (void *)[v32 mutableCopy];
            v34 = v33;
            if (v33)
            {
              v26 = v33;
            }
            else
            {
              v35 = [MEMORY[0x1E4F25D20] allUbiquitousResourceKeys];
              v26 = (FPDFilePresenter *)[v35 mutableCopy];
            }
            [(FPDFilePresenter *)v26 intersectSet:v25];
            if ([(FPDFilePresenter *)v26 count])
            {
              id v36 = [(FPDFilePresenter *)v57 _newCoordinator];
              v37 = fp_current_or_default_log();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                v38 = [v9 fileURL];
                v39 = objc_msgSend(v38, "fp_shortDescription");
                *(_DWORD *)buf = 138412546;
                v67 = v26;
                __int16 v68 = 2112;
                v69 = v39;
                _os_log_impl(&dword_1D744C000, v37, OS_LOG_TYPE_INFO, "[INFO] 🎖 posting did change ubiquity attributes (%@) for updated file %@", buf, 0x16u);
              }
              [v36 itemAtURL:v13 didChangeUbiquityAttributes:v26];
              if (v31)
              {
                if (!v36) {
                  goto LABEL_46;
                }
LABEL_47:
                v45 = fp_current_or_default_log();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  v46 = [(NSURL *)v13 fp_shortDescription];
                  *(_DWORD *)buf = 138412290;
                  v67 = v46;
                  _os_log_impl(&dword_1D744C000, v45, OS_LOG_TYPE_INFO, "[INFO] 🎖 posting sharing did change for updated file %@", buf, 0xCu);
                }
                [v36 sharingDidChangeForItemAtURL:v13];
              }
            }
            else
            {
              v40 = fp_current_or_default_log();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                v41 = [(NSURL *)v13 fp_shortDescription];
                *(_DWORD *)buf = 138412290;
                v67 = v41;
                _os_log_impl(&dword_1D744C000, v40, OS_LOG_TYPE_INFO, "[INFO] 🎖 posting did change ubiquity for updated file %@", buf, 0xCu);
              }
              v42 = (void *)MEMORY[0x1E4F28CA0];
              v43 = [(FPDDomain *)v57->_domain provider];
              v44 = [v43 purposeIdentifier];
              objc_msgSend(v42, "__itemAtURL:didChangeUbiquityWithPurposeID:", v13, v44);

              if (v31)
              {
LABEL_46:
                id v36 = [(FPDFilePresenter *)v57 _newCoordinator];
                goto LABEL_47;
              }
              id v36 = 0;
            }

            goto LABEL_52;
          }
          v21 = fp_current_or_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = [v9 fileURL];
            long long v23 = objc_msgSend(v22, "fp_shortDescription");
            *(_DWORD *)buf = 138412546;
            v67 = v57;
            __int16 v68 = 2112;
            v69 = v23;
            _os_log_impl(&dword_1D744C000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: 🎖 posting did change ubiquity for updated file %@", buf, 0x16u);
          }
          v24 = (void *)MEMORY[0x1E4F28CA0];
          id v25 = [(FPDDomain *)v57->_domain provider];
          v26 = [v25 purposeIdentifier];
          objc_msgSend(v24, "__itemAtURL:didChangeUbiquityWithPurposeID:", v13, v26);
LABEL_52:
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v7);
    }

    __fp_leave_section_Debug();
  }
}

- (id)_newCoordinator
{
  uint64_t v3 = [(FPDDomain *)self->_domain provider];
  id v4 = [v3 purposeIdentifier];

  if (v4)
  {
    v5 = objc_opt_new();
    int v6 = [(FPDDomain *)self->_domain provider];
    uint64_t v7 = [v6 purposeIdentifier];
    [v5 setPurposeIdentifier:v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)enumerationResultsDidChange
{
  uint64_t v3 = [(FPDDomain *)self->_domain provider];
  id v4 = [v3 identifier];
  char v5 = objc_msgSend(v4, "fp_isiCloudDriveOrCloudDocsIdentifier");

  if (self->_presenterWantsUbiqitousAttributes || (v5 & 1) == 0)
  {
    queue = self->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__FPDFilePresenter_enumerationResultsDidChange__block_invoke;
      block[3] = &unk_1E6A73FE8;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

uint64_t __47__FPDFilePresenter_enumerationResultsDidChange__block_invoke(uint64_t a1)
{
  __fp_create_section();
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47__FPDFilePresenter_enumerationResultsDidChange__block_invoke_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 65))
  {
    *(unsigned char *)(v3 + 66) = 1;
  }
  else if (*(void *)(v3 + 40))
  {
    [(id)v3 _fetchUpdates];
  }
  else
  {
    [(id)v3 _fetchChangeToken];
  }
  return __fp_leave_section_Debug();
}

- (void)didUpdateItem:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__FPDFilePresenter_didUpdateItem___block_invoke;
    v7[3] = &unk_1E6A736C0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __34__FPDFilePresenter_didUpdateItem___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 receiveUpdatedItems:v2 deletedItemsIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (void)_fetchChangeToken
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] ┣%llx %@: fetching current change token");
}

void __37__FPDFilePresenter__fetchChangeToken__block_invoke(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = a1[4];
  id v13 = *(NSObject **)(v12 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__FPDFilePresenter__fetchChangeToken__block_invoke_2;
  block[3] = &unk_1E6A73B68;
  id v14 = (void *)a1[5];
  uint64_t v23 = a1[6];
  block[4] = v12;
  id v19 = v14;
  id v20 = v11;
  uint64_t v24 = a1[7];
  id v21 = v9;
  id v22 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v11;
  dispatch_async(v13, block);
}

uint64_t __37__FPDFilePresenter__fetchChangeToken__block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_3();
  }

  uint64_t v3 = (void *)(a1 + 32);
  if (*(void *)(*(void *)(a1 + 32) + 16) != *(void *)(a1 + 40))
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_2();
    }
LABEL_12:

    return __fp_leave_section_Debug();
  }
  int v5 = objc_msgSend(*(id *)(a1 + 48), "fp_isRemoteCrashError");
  int v6 = (unsigned char *)*v3;
  if (v5)
  {
    [v6 _enumeratorRequestDidFailWithXPCError:*(void *)(a1 + 48)];
  }
  else
  {
    if (!v6[64])
    {
      id v14 = [NSString stringWithFormat:@"[ASSERT] ‼️ received changes on active enumerator for stopped presenter %@", *v3, v16];
      id v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDFilePresenter _fetchChangeToken]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDFilePresenter.m", 411, (const char *)[v14 UTF8String]);
    }
    v6[65] = 0;
    if (*(void *)(a1 + 48))
    {
      id v4 = fp_current_or_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_msgSend(*(id *)(*v3 + 32), "fp_prettyDescription");
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138412802;
        BOOL v18 = v11;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        __int16 v21 = 2112;
        uint64_t v22 = v13;
        _os_log_error_impl(&dword_1D744C000, v4, OS_LOG_TYPE_ERROR, "[ERROR] no change token returned for %@: %@\n on url: %@", buf, 0x20u);
      }
      goto LABEL_12;
    }
    [*(id *)(a1 + 32) receiveUpdatedItems:*(void *)(a1 + 56) deletedItemsIdentifiers:MEMORY[0x1E4F1CBF0]];
    id v9 = *(void **)(a1 + 64);
    id v8 = (void *)(a1 + 64);
    objc_storeStrong((id *)(*(v8 - 4) + 40), v9);
    id v10 = (unsigned char *)*(v8 - 4);
    if (*v8)
    {
      [v10 _fetchUpdates];
    }
    else if (v10[66])
    {
      [v10 _fetchChangeToken];
    }
  }
  return __fp_leave_section_Debug();
}

- (void)_fetchUpdates
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] ┣%llx %@: fetching changes");
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke(void *a1, void *a2, void *a3, char a4, void *a5, uint64_t a6, void *a7)
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = a1[4];
  id v17 = *(NSObject **)(v16 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPDFilePresenter__fetchUpdates__block_invoke_2;
  block[3] = &unk_1E6A76150;
  BOOL v18 = (void *)a1[5];
  uint64_t v30 = a1[6];
  block[4] = v16;
  id v25 = v18;
  id v26 = v15;
  uint64_t v19 = a1[7];
  char v32 = a4;
  id v27 = v14;
  id v28 = v13;
  uint64_t v31 = v19;
  id v29 = v12;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v23 = v15;
  dispatch_async(v17, block);
}

uint64_t __33__FPDFilePresenter__fetchUpdates__block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = *(void *)(a1 + 80);
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_7();
  }

  uint64_t v3 = (id *)(a1 + 32);
  if (*(void *)(*(void *)(a1 + 32) + 16) != *(void *)(a1 + 40))
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_2();
    }

    return __fp_leave_section_Debug();
  }
  int v5 = objc_msgSend(*(id *)(a1 + 48), "fp_isRemoteCrashError");
  int v6 = *v3;
  if (v5)
  {
    [v6 _enumeratorRequestDidFailWithXPCError:*(void *)(a1 + 48)];
    return __fp_leave_section_Debug();
  }
  if (!v6[64])
  {
    uint64_t v19 = [NSString stringWithFormat:@"[ASSERT] ‼️ received changes on active enumerator for stopped presenter %@", *v3, v21];
    id v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDFilePresenter _fetchUpdates]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDFilePresenter.m", 480, (const char *)[v19 UTF8String]);
  }
  v6[65] = 0;
  uint64_t v7 = (id *)(a1 + 56);
  if ([*(id *)(a1 + 56) isEqualToData:*(void *)(*(void *)(a1 + 32) + 40)]
    && !*(void *)(a1 + 48))
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_5();
    }

    if (*(unsigned char *)(a1 + 96))
    {
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_4(v9);
      }
    }
    if ([*(id *)(a1 + 64) count] || objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      id v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_3(v10);
      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "fp_isFileProviderError:", -1002)) {
    int v11 = 1;
  }
  else {
    int v11 = objc_msgSend(*(id *)(a1 + 48), "fp_isFileProviderError:", -1002);
  }
  objc_storeStrong((id *)*v3 + 5, *v7);
  if (*v7) {
    int v12 = 0;
  }
  else {
    int v12 = v11;
  }
  if (v12 == 1)
  {
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_2(v13);
    }
    goto LABEL_37;
  }
  [*(id *)(a1 + 32) receiveUpdatedItems:*(void *)(a1 + 72) deletedItemsIdentifiers:*(void *)(a1 + 64)];
  if (*(void *)(a1 + 48))
  {
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_msgSend(*((id *)*v3 + 4), "fp_prettyDescription");
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412802;
      id v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_error_impl(&dword_1D744C000, v14, OS_LOG_TYPE_ERROR, "[ERROR] error when getting changes for %@: %@\n on url: %@", buf, 0x20u);
    }
    if (*((unsigned char *)*v3 + 66))
    {
      *((unsigned char *)*v3 + 66) = 0;
      id v13 = *((void *)*v3 + 5);
      *((void *)*v3 + 5) = 0;
LABEL_37:

      [*v3 _fetchChangeToken];
    }
  }
  else if (*((unsigned char *)*v3 + 66) || *(unsigned char *)(a1 + 96))
  {
    [*v3 _fetchUpdates];
  }
  return __fp_leave_section_Debug();
}

- (void)dumpStateTo:(id)a3
{
  id v4 = a3;
  long long v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v5;
  uint64_t v6 = audit_token_to_pid(&atoken);
  [v4 write:@"  presenter: "];
  if (v6 == -1)
  {
    [v4 startFgColor:1];
    [v4 write:@"unknown process"];
  }
  else
  {
    if ([(FPDFilePresenter *)self isEnumeratorActive]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 3;
    }
    [v4 startFgColor:v7];
    long long v8 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&atoken.val[4] = v8;
    id v9 = FPExecutableNameForAuditToken();
    [v4 write:@"%@[%d]", v9, v6];
  }
  if (!self->_presenterWantsUbiqitousAttributes)
  {
    id v10 = @" (ignored)";
    goto LABEL_11;
  }
  if (![(FPDFilePresenter *)self isEnumeratorActive])
  {
    id v10 = @" (passive)";
LABEL_11:
    [v4 write:v10];
  }
  [v4 reset];
  int v11 = [(FPDFilePresenter *)self _presentedItemDescription:1];
  [v4 write:@" presenting %@ (%@)\n", v11, self->_filePresenterID];
}

- (NSString)prettyDescription
{
  uint64_t v3 = NSString;
  id v4 = [(FPDFilePresenter *)self _presentedItemDescription:0];
  long long v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v5;
  uint64_t v6 = FPExecutableNameForAuditToken();
  long long v7 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v7;
  long long v8 = [v3 stringWithFormat:@"presenter for %@ by %@[%u]", v4, v6, audit_token_to_pid(&atoken)];

  return (NSString *)v8;
}

- (id)filePresenterID
{
  return self->_filePresenterID;
}

- (void)setFilePresenterID:(id)a3
{
}

- (BOOL)isEnumeratorActive
{
  return self->_isEnumeratorActive;
}

- (void)setIsEnumeratorActive:(BOOL)a3
{
  self->_isEnumeratorActive = a3;
}

- (FPItemID)observedItemID
{
  return self->_observedItemID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[3].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[3].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (FPItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSURL)presentedItemURL
{
  return self->_presentedItemURL;
}

- (FPDDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong(&self->_filePresenterID, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_observedItemID, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_destroyWeak((id *)&self->_manager);
}

void __24__FPDFilePresenter_stop__block_invoke_cold_1()
{
  __assert_rtn("-[FPDFilePresenter stop]_block_invoke", "FPDFilePresenter.m", 221, "self->_enumerator == nil");
}

- (void)_enumeratorRequestDidFailWithXPCError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: received error from the enumerator: %@", (uint8_t *)&v6, 0x16u);
}

- (void)receiveUpdatedItems:deletedItemsIdentifiers:.cold.1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  *(_DWORD *)long long v3 = 134218242;
  *(void *)&v3[4] = v0;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = v1;
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v1, v2, "[DEBUG] ┏%llx received update for items %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void __47__FPDFilePresenter_enumerationResultsDidChange__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx %@: received notification of changes");
}

void __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] changes is from an outdated enumerator %@, current is %@");
}

void __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_5();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@: received current change token from %@", v3, 0x20u);
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] change token was reset", v1, 2u);
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] Received state changes, but change token remains the same", v1, 2u);
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] There shouldn't be more changes if change token has not changed", v1, 2u);
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] Change token has not changed: was %@ now %@");
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_7()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┳%llx received changes", v2, v3, v4, v5, 0);
}

@end