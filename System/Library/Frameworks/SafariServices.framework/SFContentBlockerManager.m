@interface SFContentBlockerManager
+ (WKContentRuleListStore)contentBlockerStore;
+ (id)_contentBlockerLoaderConnection;
+ (void)_createContentExtensionsDirectoryWithURL:(id)a3;
+ (void)_loadContentBlockerWithIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)getStateOfContentBlockerWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler;
+ (void)reloadContentBlockerWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler;
- (BOOL)_hasRecompilationBeenAttemptedForExtension:(id)a3;
- (BOOL)_isManagingDefaultProfile;
- (BOOL)extensionIsEnabled:(id)a3;
- (BOOL)hasExtensionWithComposedIdentifier:(id)a3;
- (BOOL)hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce;
- (BOOL)isContentBlockerAllowedInPrivateBrowsing:(id)a3;
- (NSSet)enabledExtensions;
- (NSSet)extensions;
- (NSString)debugDescription;
- (NSString)profileServerID;
- (SFContentBlockerManager)init;
- (SFContentBlockerManager)initWithUserContentController:(id)a3 webExtensionsController:(id)a4;
- (SFContentBlockerManagerDelegate)delegate;
- (WBSWebExtensionsController)webExtensionsController;
- (id)_contentBlockerManagerForDefaultProfile;
- (id)_contentBlockerStateURL;
- (id)_contentBlockerWithComposedIdentifier:(id)a3;
- (id)_contentBlockersWithAdamID:(id)a3;
- (id)_findNewExtensionsAdded:(id)a3 toExistingExtensions:(id)a4;
- (id)_installationDateForExtension:(id)a3;
- (id)cloudExtensionStateForStateManager:(id)a3;
- (id)displayNameForExtension:(id)a3;
- (id)extensionStateKeysToCopy;
- (id)extensionsDataForExport;
- (id)profileServerIDForStateManager:(id)a3;
- (unint64_t)recentlyInstalledExtensionCount;
- (void)_applyContentBlockerInPrivateBrowsing:(id)a3;
- (void)_beginContentBlockerDiscovery;
- (void)_commonInit;
- (void)_contentBlockerDiscoveryHasNewResults:(id)a3 error:(id)a4;
- (void)_contentBlockerEnabledStateDidChange:(id)a3;
- (void)_contentBlockerStateInPrivateBrowsingDidChange:(id)a3;
- (void)_didDiscoverExtensions:(id)a3;
- (void)_loadBuiltInContentBlockers;
- (void)_loadContentBlockerRecompilationInformationIfNeeded;
- (void)_loadContentBlockerStateFromDisk;
- (void)_noteRecompilationWasAttemptedForExtension:(id)a3;
- (void)_populateExtensionsIfNecessaryUsingManagerForDefaultProfile;
- (void)_recompileEnabledContentBlockersIfNeeded:(id)a3;
- (void)_removeAllContentRuleLists;
- (void)_removeContentBlockerInPrivateBrowsing:(id)a3;
- (void)_saveContentBlockerRecompilationInformation;
- (void)_updateContentBlockerStateFromDiscoveredContentBlockers:(id)a3;
- (void)addContentRuleList:(id)a3 forExtension:(id)a4;
- (void)addObserver:(id)a3;
- (void)copyEnabledExtensionStateFromContentBlockerManager:(id)a3;
- (void)informObserversThatContentBlockerManagerExtensionListDidChange;
- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4;
- (void)reloadUserContentControllerReadingStateFromDisk:(BOOL)a3;
- (void)removeObserver:(id)a3;
- (void)savePendingChangesBeforeTermination;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 byUserGesture:(BOOL)a5;
- (void)setExtension:(id)a3 isEnabledInPrivateBrowsing:(BOOL)a4 updateUserContentController:(BOOL)a5;
- (void)setExtensionWithComposedIdentifier:(id)a3 isEnabledInCloud:(BOOL)a4;
- (void)setWebExtensionsController:(id)a3;
@end

@implementation SFContentBlockerManager

- (SFContentBlockerManager)initWithUserContentController:(id)a3 webExtensionsController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFContentBlockerManager;
  v9 = [(SFContentBlockerManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userContentController, a3);
    uint64_t v11 = [v8 profileServerID];
    profileServerID = v10->_profileServerID;
    v10->_profileServerID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_webExtensionsController, a4);
    [(SFContentBlockerManager *)v10 _commonInit];
    v13 = v10;
  }

  return v10;
}

- (void)_commonInit
{
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SafariServices.SFContentBlockerManager.internal", 0);
  recompilationInformationAccessQueue = self->_recompilationInformationAccessQueue;
  self->_recompilationInformationAccessQueue = v3;

  [(SFContentBlockerManager *)self _loadContentBlockerStateFromDisk];
  v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 addObserver:self selector:sel__contentBlockerEnabledStateDidChange_ name:@"com.apple.SafariServices.ContentBlockerEnabledStateDidChange" object:0];

  v6 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v6 addObserver:self selector:sel__contentBlockerStateInPrivateBrowsingDidChange_ name:*MEMORY[0x1E4F990D0] object:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__SFContentBlockerManager_SFPrivate___commonInit__block_invoke;
  v9[3] = &unk_1E5C72FA0;
  v9[4] = self;
  id v7 = [MEMORY[0x1E4F98AB0] registeredStateCollectorWithLogLabel:@"Safari Extensions State (Content Blockers)" payloadProvider:v9];
  diagnosticStateCollector = self->_diagnosticStateCollector;
  self->_diagnosticStateCollector = v7;

  [(SFContentBlockerManager *)self _beginContentBlockerDiscovery];
}

- (void)_loadContentBlockerStateFromDisk
{
  contentBlockerStateStore = self->_contentBlockerStateStore;
  if (contentBlockerStateStore)
  {
    [(WBSPersistentPropertyListStore *)contentBlockerStateStore saveAndCloseStoreSynchronously];
    v4 = self->_contentBlockerStateStore;
    self->_contentBlockerStateStore = 0;
  }
  v5 = [(SFContentBlockerManager *)self webExtensionsController];
  v6 = [(SFContentBlockerManager *)self _contentBlockerStateURL];
  id v7 = (WBSPersistentPropertyListStore *)[objc_alloc(MEMORY[0x1E4F98CE8]) initWithBackingStoreURL:v6];
  id v8 = self->_contentBlockerStateStore;
  self->_contentBlockerStateStore = v7;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SFContentBlockerManager_SFPrivate___loadContentBlockerStateFromDisk__block_invoke;
  v10[3] = &unk_1E5C72FA0;
  id v9 = v5;
  id v11 = v9;
  [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore setCreateEmptyStoreHandler:v10];
}

- (void)_beginContentBlockerDiscovery
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_extensionMatchingContext)
  {
    if ([(SFContentBlockerManager *)self _supportsExtensionDiscovery])
    {
      v3 = (void *)[objc_alloc(MEMORY[0x1E4F25880]) initWithExtensionPointIdentifier:@"com.apple.Safari.content-blocker"];
      [v3 setExcludeLockedApps:1];
      id v4 = objc_alloc(MEMORY[0x1E4F25888]);
      v10[0] = v3;
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      v6 = (_EXQueryController *)[v4 initWithQueries:v5 delegate:self];
      extensionKitQueryController = self->_extensionKitQueryController;
      self->_extensionKitQueryController = v6;

      id v8 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__SFContentBlockerManager_SFPrivate___beginContentBlockerDiscovery__block_invoke;
      block[3] = &unk_1E5C73108;
      block[4] = self;
      dispatch_async(v8, block);
    }
    else
    {
      [(SFContentBlockerManager *)self _populateExtensionsIfNecessaryUsingManagerForDefaultProfile];
    }
  }
}

- (void)_removeAllContentRuleLists
{
  [(WKUserContentController *)self->_userContentController removeAllContentRuleLists];
  if ([(SFContentBlockerManager *)self _isManagingDefaultProfile])
  {
    objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 removeAllContentRuleLists];
  }
  objc_msgSend(MEMORY[0x1E4F466A0], "safari_readerUserContentController");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeAllContentRuleLists];

  objc_msgSend(MEMORY[0x1E4F466A0], "safari_readingListFetcherUserContentController");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 removeAllContentRuleLists];
}

- (BOOL)_isManagingDefaultProfile
{
  v2 = (void *)MEMORY[0x1E4F98FC0];
  id v3 = [(WBSWebExtensionsController *)self->_webExtensionsController profileServerID];
  LOBYTE(v2) = [v2 isProfileServerIDForDefaultProfile:v3];

  return (char)v2;
}

uint64_t __82__SFContentBlockerManager_SFPrivate___contentBlockerDiscoveryHasNewResults_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _didDiscoverExtensions:*(void *)(a1 + 32)];
}

uint64_t __67__SFContentBlockerManager_SFPrivate___beginContentBlockerDiscovery__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) resume];
}

- (void)setWebExtensionsController:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

uint64_t __80__SFContentBlockerManager_SFPrivate__queryControllerDidUpdate_resultDifference___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _contentBlockerDiscoveryHasNewResults:*(void *)(a1 + 40) error:0];
}

uint64_t __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_162(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __65__SFContentBlockerManager_SFPrivate___loadBuiltInContentBlockers__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
    [v3 addContentRuleList:v4];

    [*(id *)(*(void *)(a1 + 32) + 80) addContentRuleList:v4];
  }
}

id __80__SFContentBlockerManager_SFPrivate__queryControllerDidUpdate_resultDifference___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F28C70] extensionWithIdentity:a2 error:0];

  return v2;
}

void __81__SFContentBlockerManager_SFPrivate___hasRecompilationBeenAttemptedForExtension___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [*(id *)(a1 + 40) identifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "safari_BOOLForKey:");
}

- (void)_didDiscoverExtensions:(id)a3
{
  id v6 = a3;
  id v4 = -[SFContentBlockerManager _findNewExtensionsAdded:toExistingExtensions:](self, "_findNewExtensionsAdded:toExistingExtensions:");
  [(SFContentBlockerManager *)self _recompileEnabledContentBlockersIfNeeded:v4];

  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  [(SFContentBlockerManager *)self _updateContentBlockerStateFromDiscoveredContentBlockers:v5];
  objc_storeStrong((id *)&self->_extensions, v5);
  self->_hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce = 1;
  [(SFContentBlockerManager *)self informObserversThatContentBlockerManagerExtensionListDidChange];
}

- (void)informObserversThatContentBlockerManagerExtensionListDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableSet *)self->_observers copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "contentBlockerManagerExtensionListDidChange:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_recompileEnabledContentBlockersIfNeeded:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  [(SFContentBlockerManager *)self _loadContentBlockerRecompilationInformationIfNeeded];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v15;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v9 = [v8 identifier];
        if ([(SFContentBlockerManager *)self _hasRecompilationBeenAttemptedForExtension:v8])
        {
          long long v10 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 138543362;
          v25 = v9;
          long long v11 = v10;
          v12 = "Already attempted to re-compile Content Blocker '%{public}@' once, no need to re-compile";
          goto LABEL_13;
        }
        if ([(SFContentBlockerManager *)self extensionIsEnabled:v8])
        {
          uint64_t v13 = [(id)objc_opt_class() contentBlockerStore];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke;
          v16[3] = &unk_1E5C72FF0;
          id v17 = v9;
          v18 = self;
          v19 = v8;
          [v13 lookUpContentRuleListForIdentifier:v17 completionHandler:v16];

          goto LABEL_14;
        }
        v14 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v25 = v9;
          long long v11 = v14;
          v12 = "Content Blocker '%{public}@' was disabled, no need to re-compile";
LABEL_13:
          _os_log_impl(&dword_1A690B000, v11, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
        }
LABEL_14:
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v5);
  }
}

- (void)_loadContentBlockerRecompilationInformationIfNeeded
{
  recompilationInformationAccessQueue = self->_recompilationInformationAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SFContentBlockerManager_SFPrivate___loadContentBlockerRecompilationInformationIfNeeded__block_invoke;
  block[3] = &unk_1E5C73108;
  block[4] = self;
  dispatch_async(recompilationInformationAccessQueue, block);
}

- (BOOL)_hasRecompilationBeenAttemptedForExtension:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  recompilationInformationAccessQueue = self->_recompilationInformationAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SFContentBlockerManager_SFPrivate___hasRecompilationBeenAttemptedForExtension___block_invoke;
  block[3] = &unk_1E5C731E8;
  id v9 = v4;
  long long v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(recompilationInformationAccessQueue, block);
  LOBYTE(recompilationInformationAccessQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)recompilationInformationAccessQueue;
}

- (id)_findNewExtensionsAdded:(id)a3 toExistingExtensions:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v12, (void)v14) & 1) == 0) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)_contentBlockerDiscoveryHasNewResults:(id)a3 error:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v13 = v6;
    _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_INFO, "Discovered content blockers: %{private}@", buf, 0xCu);
  }
  self->_lastExtensionDiscoveryHadError = v7 != 0;
  uint64_t v9 = [(SFContentBlockerManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __82__SFContentBlockerManager_SFPrivate___contentBlockerDiscoveryHasNewResults_error___block_invoke;
    v10[3] = &unk_1E5C73150;
    id v11 = v6;
    [v9 enumerateContentBlockerManagersUsingBlock:v10];
  }
  else
  {
    [(SFContentBlockerManager *)self _didDiscoverExtensions:v6];
  }
}

- (SFContentBlockerManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFContentBlockerManagerDelegate *)WeakRetained;
}

- (void)_updateContentBlockerStateFromDiscoveredContentBlockers:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  if (!v34) {
    goto LABEL_42;
  }
  v40 = [(SFContentBlockerManager *)self webExtensionsController];
  v42 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v34;
  uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v4)
  {
    char v41 = 0;
    uint64_t v38 = *(void *)v48;
    uint64_t v5 = *MEMORY[0x1E4F991A8];
    uint64_t v6 = *MEMORY[0x1E4F991B0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v48 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v9 = [v40 composedIdentifierForExtensionStateForExtension:v8];
        [v42 setObject:v8 forKeyedSubscript:v9];
        uint64_t v10 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v9];
        if (!v10)
        {
          id v11 = [MEMORY[0x1E4F98A18] sharedManager];
          int v12 = [v11 isExtensionEnabledInCloudWithComposedIdentifier:v9 forProfileServerID:self->_profileServerID];

          if (v12)
          {
            id v13 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v55 = v9;
              _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_INFO, "Automatically enabling content blocker %{private}@ due to cloud state", buf, 0xCu);
            }
            [(SFContentBlockerManager *)self setExtension:v8 isEnabled:1 byUserGesture:0];
          }
        }
        uint64_t v14 = objc_msgSend(v10, "safari_dateForKey:", v5);
        if (!v14)
        {
          long long v15 = (void *)[v10 mutableCopy];
          if (!v15)
          {
            long long v15 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          long long v16 = [MEMORY[0x1E4F1C9C8] now];
          [v15 setObject:v16 forKeyedSubscript:v5];

          [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore setObject:v15 forKey:v9];
          char v41 = 1;
        }
        long long v17 = objc_msgSend(v10, "safari_dateForKey:", v6);
        BOOL v18 = v17 == 0;

        if (!v18)
        {
          uint64_t v19 = (void *)[v10 mutableCopy];
          [v19 setObject:0 forKeyedSubscript:v6];
          [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore setObject:v19 forKey:v9];

          char v41 = 1;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v4);
  }
  else
  {
    char v41 = 0;
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v20 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore allKeys];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (!v21)
  {

    goto LABEL_39;
  }
  char v35 = 0;
  uint64_t v39 = *(void *)v44;
  id obja = (id)*MEMORY[0x1E4F991B0];
  do
  {
    for (uint64_t j = 0; j != v21; ++j)
    {
      if (*(void *)v44 != v39) {
        objc_enumerationMutation(v20);
      }
      uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * j);
      v24 = [v42 objectForKeyedSubscript:v23];
      BOOL v25 = v24 == 0;

      if (v25)
      {
        v26 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v23];
        uint64_t v27 = objc_msgSend(v26, "safari_dateForKey:", obja);
        v28 = v27;
        if (v27)
        {
          v29 = [v27 dateByAddingTimeInterval:3600.0];
          [v29 timeIntervalSinceNow];
          if (v30 < 0.0)
          {
            [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore setObject:0 forKey:v23];
            char v35 = 1;
            goto LABEL_32;
          }
        }
        else
        {
          contentBlockerStateStore = self->_contentBlockerStateStore;
          id v51 = obja;
          v28 = [MEMORY[0x1E4F1C9C8] now];
          v52 = v28;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          v32 = objc_msgSend(v29, "safari_dictionaryByMergingWithDictionary:", v26);
          [(WBSPersistentPropertyListStore *)contentBlockerStateStore setObject:v32 forKey:v23];

LABEL_32:
          char v41 = 1;
        }

        continue;
      }
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
  }
  while (v21);

  if (v35)
  {
    v33 = [MEMORY[0x1E4F98A18] sharedManager];
    [v33 localExtensionStateDidChange];
  }
LABEL_39:
  if (v41) {
    [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore saveStoreSynchronously];
  }

LABEL_42:
}

- (BOOL)extensionIsEnabled:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_contentBlockerStateStoreRequiresReload)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Loading content blocker state from disk since it was changed from another process", (uint8_t *)&v17, 2u);
    }
    [(SFContentBlockerManager *)self _loadContentBlockerStateFromDisk];
    self->_contentBlockerStateStoreRequiresReload = 0;
  }
  uint64_t v6 = [(SFContentBlockerManager *)self webExtensionsController];
  id v7 = [v6 composedIdentifierForExtensionStateForExtension:v4];

  uint64_t v8 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v7];
  int v9 = objc_msgSend(v8, "safari_BOOLForKey:", *MEMORY[0x1E4F99488]);

  uint64_t v10 = [MEMORY[0x1E4F98C20] sharedController];
  uint64_t v11 = [v10 managedExtensionStateForComposedIdentifier:v7];

  if (v11 == 1) {
    char v12 = v9;
  }
  else {
    char v12 = 1;
  }
  if (v12)
  {
    if (v11 == 2) {
      int v13 = v9;
    }
    else {
      int v13 = 0;
    }
    if (v13 == 1)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v17 = 138477827;
        BOOL v18 = v7;
        _os_log_impl(&dword_1A690B000, v14, OS_LOG_TYPE_INFO, "Disabling content blocker %{private}@ due to managed extension configuration", (uint8_t *)&v17, 0xCu);
      }
      [(SFContentBlockerManager *)self setExtension:v4 isEnabled:0 byUserGesture:0];
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    long long v15 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = 138477827;
      BOOL v18 = v7;
      _os_log_impl(&dword_1A690B000, v15, OS_LOG_TYPE_INFO, "Enabling content blocker %{private}@ due to managed extension configuration", (uint8_t *)&v17, 0xCu);
    }
    LOBYTE(v9) = 1;
    [(SFContentBlockerManager *)self setExtension:v4 isEnabled:1 byUserGesture:0];
  }

  return v9;
}

- (WBSWebExtensionsController)webExtensionsController
{
  return self->_webExtensionsController;
}

void __89__SFContentBlockerManager_SFPrivate___loadContentBlockerRecompilationInformationIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    v2 = pathToRecompilationInformation();

    if (v2)
    {
      id v3 = (void *)MEMORY[0x1E4F1C9B8];
      id v4 = pathToRecompilationInformation();
      uint64_t v5 = [v3 dataWithContentsOfURL:v4];

      if (v5)
      {
        id v17 = 0;
        uint64_t v18 = 200;
        uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:&v18 error:&v17];
        id v7 = v17;
        if (v7)
        {
          uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            __89__SFContentBlockerManager_SFPrivate___loadContentBlockerRecompilationInformationIfNeeded__block_invoke_cold_1();
          }

          uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        else
        {
          uint64_t v14 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            long long v20 = v6;
            _os_log_impl(&dword_1A690B000, v14, OS_LOG_TYPE_INFO, "Found recompilation information: %{public}@", buf, 0xCu);
          }
          uint64_t v9 = [v6 mutableCopy];
        }
        uint64_t v15 = *(void *)(a1 + 32);
        long long v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v9;
      }
      else
      {
        uint64_t v11 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A690B000, v11, OS_LOG_TYPE_INFO, "Did not find any information on previously recompiled Content Blockers", buf, 2u);
        }
        uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v13 = *(void *)(a1 + 32);
        id v7 = *(id *)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
    }
    else
    {
      uint64_t v10 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A690B000, v10, OS_LOG_TYPE_INFO, "Did not find path to recompilation information", buf, 2u);
      }
    }
  }
}

- (id)_contentBlockerStateURL
{
  id v3 = _SFSafariGroupContainerURL();
  if ([MEMORY[0x1E4F98FC0] isProfileServerIDForDefaultProfile:self->_profileServerID])
  {
    id v4 = [v3 URLByAppendingPathComponent:@"Library/Safari" isDirectory:1];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = objc_msgSend(v5, "safari_profileDirectoryURLWithID:createIfNeeded:", self->_profileServerID, 0);

    if (!v6) {
      goto LABEL_6;
    }
    id v4 = [v6 URLByAppendingPathComponent:@"ContentBlockers" isDirectory:1];
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = (id)objc_msgSend(v7, "safari_ensureDirectoryExists:", v4);
  }
  uint64_t v6 = [v4 URLByAppendingPathComponent:@"ContentBlockers.plist" isDirectory:0];

LABEL_6:

  return v6;
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 extensionIdentities];
  id v7 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_177);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__SFContentBlockerManager_SFPrivate__queryControllerDidUpdate_resultDifference___block_invoke_2;
  v9[3] = &unk_1E5C72628;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

- (NSSet)extensions
{
  if (self->_lastExtensionDiscoveryHadError)
  {
    id extensionMatchingContext = self->_extensionMatchingContext;
    self->_id extensionMatchingContext = 0;

    [(SFContentBlockerManager *)self _beginContentBlockerDiscovery];
  }
  extensions = self->_extensions;

  return extensions;
}

- (void)reloadUserContentControllerReadingStateFromDisk:(BOOL)a3
{
  BOOL v3 = a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Reloading content blockers in SFContentBlockerManager reloadUserContentControllerReadingStateFromDisk", buf, 2u);
  }
  [(SFContentBlockerManager *)self _removeAllContentRuleLists];
  if (v3)
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v6, OS_LOG_TYPE_INFO, "Reload requested from notification, reloading content blocker state from disk", buf, 2u);
    }
    [(SFContentBlockerManager *)self _loadContentBlockerStateFromDisk];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke;
  v16[3] = &unk_1E5C73018;
  void v16[4] = self;
  id v7 = (void *)MEMORY[0x1AD0C36A0](v16);
  id v8 = (void *)MEMORY[0x1E4F28C70];
  uint64_t v18 = *MEMORY[0x1E4F282B0];
  v19[0] = @"com.apple.Safari.content-blocker";
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_161;
  uint64_t v14 = &unk_1E5C73068;
  id v10 = v7;
  id v15 = v10;
  [v8 extensionsWithMatchingAttributes:v9 completion:&v11];

  [(SFContentBlockerManager *)self _loadBuiltInContentBlockers];
}

- (void)_loadBuiltInContentBlockers
{
  v2 = [(id)objc_opt_class() contentBlockerStore];
  WBSLoadBuiltInContentBlockersWithStore();
}

+ (WKContentRuleListStore)contentBlockerStore
{
  {
    +[SFContentBlockerManager(SFPrivate) contentBlockerStore]::contentBlockerStore = __57__SFContentBlockerManager_SFPrivate__contentBlockerStore__block_invoke();
  }
  v2 = (void *)+[SFContentBlockerManager(SFPrivate) contentBlockerStore]::contentBlockerStore;

  return (WKContentRuleListStore *)v2;
}

id __57__SFContentBlockerManager_SFPrivate__contentBlockerStore__block_invoke()
{
  v0 = _SFContentBlockerStoreURL();
  +[SFContentBlockerManager _createContentExtensionsDirectoryWithURL:v0];
  v1 = [MEMORY[0x1E4F46670] storeWithURL:v0];

  return v1;
}

+ (void)_createContentExtensionsDirectoryWithURL:(id)a3
{
  v9[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v5 = *MEMORY[0x1E4F1C630];
  v9[0] = 0;
  char v6 = [v3 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v5 error:v9];
  id v7 = v9[0];
  if ((v6 & 1) == 0)
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      +[SFContentBlockerManager(SFPrivate) _createContentExtensionsDirectoryWithURL:]();
    }
  }
}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_161(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_162;
  v6[3] = &unk_1E5C73040;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) extensionIsEnabled:v7])
        {
          id v8 = [v7 identifier];
          uint64_t v9 = [(id)objc_opt_class() contentBlockerStore];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2;
          v12[3] = &unk_1E5C72FF0;
          id v10 = v8;
          uint64_t v11 = *(void *)(a1 + 32);
          id v13 = v10;
          uint64_t v14 = v11;
          id v15 = v7;
          [v9 lookUpContentRuleListForIdentifier:v10 completionHandler:v12];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

+ (id)_contentBlockerLoaderConnection
{
  if (+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection)
  {
    id v2 = (id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection;
  }
  else
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.SafariServices.ContentBlockerLoader"];
    uint64_t v4 = (void *)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection;
    +[SFContentBlockerManager _contentBlockerLoaderConnection]::connection = v3;

    [(id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection setInvalidationHandler:&__block_literal_global_4];
    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFCBA218];
    [(id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection setRemoteObjectInterface:v5];
    [(id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection resume];
    id v2 = (id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection;
  }

  return v2;
}

void __58__SFContentBlockerManager__contentBlockerLoaderConnection__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1A690B000, v0, OS_LOG_TYPE_DEFAULT, "XPC connection for 'com.apple.SafariServices.ContentBlockerLoader' was invalidated", v2, 2u);
  }
  v1 = (void *)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection;
  +[SFContentBlockerManager _contentBlockerLoaderConnection]::connection = 0;
}

+ (void)_loadContentBlockerWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() _contentBlockerLoaderConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__SFContentBlockerManager__loadContentBlockerWithIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_1E5C72F50;
  id v8 = v6;
  id v14 = v8;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__SFContentBlockerManager__loadContentBlockerWithIdentifier_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5C72F50;
  id v10 = v8;
  id v12 = v10;
  [v9 loadContentBlockerWithIdentifier:v5 reply:v11];
}

void __79__SFContentBlockerManager__loadContentBlockerWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __79__SFContentBlockerManager__loadContentBlockerWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.SafariServices.ContentBlockerDidChange", 0, 0, 0);
}

+ (void)reloadContentBlockerWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  id v6 = identifier;
  id v7 = completionHandler;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__SFContentBlockerManager_reloadContentBlockerWithIdentifier_completionHandler___block_invoke;
    v18[3] = &unk_1E5C72F50;
    id v19 = v7;
    [a1 _loadContentBlockerWithIdentifier:v6 completionHandler:v18];
    uint64_t v9 = v19;
LABEL_6:

    goto LABEL_7;
  }
  id v10 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    +[SFContentBlockerManager reloadContentBlockerWithIdentifier:completionHandler:](v10, v11, v12, v13, v14, v15, v16, v17);
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v8)
  {
LABEL_5:
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFErrorDomain" code:1 userInfo:0];
    ((void (**)(void, void *))v8)[2](v8, v9);
    goto LABEL_6;
  }
LABEL_7:
}

void __80__SFContentBlockerManager_reloadContentBlockerWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

+ (void)getStateOfContentBlockerWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  id v6 = identifier;
  id v7 = completionHandler;
  if (v7)
  {
    if ([(NSString *)v6 length])
    {
      id v8 = [a1 _contentBlockerLoaderConnection];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __84__SFContentBlockerManager_getStateOfContentBlockerWithIdentifier_completionHandler___block_invoke;
      v20[3] = &unk_1E5C72F50;
      id v9 = v7;
      id v21 = v9;
      id v10 = [v8 remoteObjectProxyWithErrorHandler:v20];

      [v10 getStateOfContentBlockerWithIdentifier:v6 reply:v9];
      uint64_t v11 = v21;
    }
    else
    {
      uint64_t v12 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[SFContentBlockerManager getStateOfContentBlockerWithIdentifier:completionHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFErrorDomain" code:1 userInfo:0];
      (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

uint64_t __84__SFContentBlockerManager_getStateOfContentBlockerWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)profileServerID
{
  return self->_profileServerID;
}

- (BOOL)hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce
{
  return self->_hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileServerID, 0);
  objc_storeStrong((id *)&self->_extensionKitQueryController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
  objc_storeStrong((id *)&self->_userContentController, 0);
  objc_storeStrong((id *)&self->_contentBlockerStateStore, 0);
  objc_storeStrong((id *)&self->_diagnosticStateCollector, 0);
  objc_storeStrong((id *)&self->_recompilationInformationAccessQueue, 0);
  objc_storeStrong((id *)&self->_extensionsRecompiledAfterBackup, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extensions, 0);

  objc_storeStrong(&self->_extensionMatchingContext, 0);
}

- (SFContentBlockerManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFContentBlockerManager;
  id v2 = [(SFContentBlockerManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_userContentController");
    userContentController = v2->_userContentController;
    v2->_userContentController = (WKUserContentController *)v3;

    [(SFContentBlockerManager *)v2 _commonInit];
    id v5 = v2;
  }

  return v2;
}

id __49__SFContentBlockerManager_SFPrivate___commonInit__block_invoke(uint64_t a1)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 72))
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "Loading content blocker state from disk since it was changed by another process", buf, 2u);
    }
    [*(id *)(a1 + 32) _loadContentBlockerStateFromDisk];
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v4 = [*(id *)(v2 + 64) allKeys];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __49__SFContentBlockerManager_SFPrivate___commonInit__block_invoke_132;
  v19[3] = &unk_1E5C72F78;
  v19[4] = *(void *)(a1 + 32);
  id v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v19);

  id v6 = (__CFString *)*(id *)(*(void *)(a1 + 32) + 120);
  if (!v6)
  {
    objc_super v7 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__SFContentBlockerManager_SFPrivate___commonInit__block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    id v6 = @"Unknown";
  }
  uint64_t v15 = *MEMORY[0x1E4F991B8];
  v21[0] = *MEMORY[0x1E4F991C0];
  v21[1] = v15;
  uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    uint64_t v16 = v5;
  }
  v22[0] = v6;
  v22[1] = v16;
  v21[2] = *MEMORY[0x1E4F991C8];
  v22[2] = @"Content Blockers";
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  return v17;
}

id __49__SFContentBlockerManager_SFPrivate___commonInit__block_invoke_132(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:v3];
  int v5 = objc_msgSend(v4, "safari_BOOLForKey:", *MEMORY[0x1E4F99488]);
  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = v3;
  }
  if (!v5) {
    id v3 = 0;
  }

  return v3;
}

id __70__SFContentBlockerManager_SFPrivate___loadContentBlockerStateFromDisk__block_invoke(uint64_t a1)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C70];
  uint64_t v33 = *MEMORY[0x1E4F282B0];
  v34[0] = @"com.apple.Safari.content-blocker";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
  id v29 = 0;
  long long v20 = [v1 extensionsWithMatchingAttributes:v2 error:&v29];
  id v21 = v29;

  if (v21)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __70__SFContentBlockerManager_SFPrivate___loadContentBlockerStateFromDisk__block_invoke_cold_1();
    }
  }
  id v24 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v20;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    uint64_t v6 = *MEMORY[0x1E4F99488];
    uint64_t v7 = *MEMORY[0x1E4F99490];
    uint64_t v8 = *MEMORY[0x1E4F99480];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [*(id *)(a1 + 32) composedIdentifierForExtensionStateForExtension:v10];
        uint64_t v12 = [v10 _plugIn];
        unint64_t v13 = [v12 userElection] & 0xFFFFFFFFFFFF00FFLL;

        v30[0] = v6;
        uint64_t v14 = [NSNumber numberWithBool:v13 == 1];
        v31[0] = v14;
        v30[1] = v7;
        uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v16 = (void *)v15;
        v30[2] = v8;
        uint64_t v17 = MEMORY[0x1E4F1CC28];
        if (v13 == 1) {
          uint64_t v17 = MEMORY[0x1E4F1CC38];
        }
        v31[1] = v15;
        v31[2] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
        [v24 setObject:v18 forKeyedSubscript:v11];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v4);
  }

  return v24;
}

- (void)addContentRuleList:(id)a3 forExtension:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v7 identifier];
    int v15 = 138477827;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_INFO, "Adding content blocker rules from %{private}@", (uint8_t *)&v15, 0xCu);
  }
  [(WKUserContentController *)self->_userContentController addContentRuleList:v6];
  if ([(SFContentBlockerManager *)self isContentBlockerAllowedInPrivateBrowsing:v7]&& [(SFContentBlockerManager *)self _isManagingDefaultProfile])
  {
    uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v7 identifier];
      int v15 = 138477827;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1A690B000, v10, OS_LOG_TYPE_INFO, "Adding content blocker rules from %{private}@ in private browsing", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
    [v12 addContentRuleList:v6];
  }
  unint64_t v13 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_readerUserContentController");
  [v13 addContentRuleList:v6];

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_readingListFetcherUserContentController");
  [v14 addContentRuleList:v6];
}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 40) addContentRuleList:v5 forExtension:*(void *)(a1 + 48)];
  }
  else if (objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F467E0], 9))
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_DEFAULT, "Content Blocker '%{private}@' is compiled with old version of bytecode; recompiling blocker",
        buf,
        0xCu);
    }
    uint64_t v10 = [(id)objc_opt_class() contentBlockerStore];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_158;
    v13[3] = &unk_1E5C72FC8;
    int8x16_t v12 = *(int8x16_t *)(a1 + 32);
    int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
    [v10 removeContentRuleListForIdentifier:(id)v12.i64[0] completionHandler:v13];
  }
  else
  {
    uint64_t v11 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_cold_1();
    }
  }
}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_158(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    [(id)objc_opt_class() _loadContentBlockerWithIdentifier:*(void *)(a1 + 40) completionHandler:0];
    id v3 = 0;
  }
}

- (void)_applyContentBlockerInPrivateBrowsing:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() contentBlockerStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__SFContentBlockerManager_SFPrivate___applyContentBlockerInPrivateBrowsing___block_invoke;
  v6[3] = &unk_1E5C730B8;
  id v5 = v3;
  id v7 = v5;
  [v4 lookUpContentRuleListForIdentifier:v5 completionHandler:v6];
}

void __76__SFContentBlockerManager_SFPrivate___applyContentBlockerInPrivateBrowsing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
    [v6 addContentRuleList:v4];
  }
  else
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_cold_1();
    }
  }
}

- (void)_removeContentBlockerInPrivateBrowsing:(id)a3
{
  id v4 = a3;
  id v3 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
  [v3 _removeUserContentFilter:v4];
}

- (NSSet)enabledExtensions
{
  extensions = self->_extensions;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SFContentBlockerManager_SFPrivate__enabledExtensions__block_invoke;
  v5[3] = &unk_1E5C730E0;
  v5[4] = self;
  id v3 = [(NSSet *)extensions safari_mapAndFilterObjectsUsingBlock:v5];

  return (NSSet *)v3;
}

id __55__SFContentBlockerManager_SFPrivate__enabledExtensions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) extensionIsEnabled:v3]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
    id v4 = v8;
  }
  [(NSMutableSet *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (id)_contentBlockerManagerForDefaultProfile
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__SFContentBlockerManager_SFPrivate___contentBlockerManagerForDefaultProfile__block_invoke;
  v5[3] = &unk_1E5C73178;
  v5[4] = &v6;
  [WeakRetained enumerateContentBlockerManagersUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __77__SFContentBlockerManager_SFPrivate___contentBlockerManagerForDefaultProfile__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = (void *)MEMORY[0x1E4F98FC0];
  id v9 = v6;
  uint64_t v8 = [v6 profileServerID];
  LODWORD(v7) = [v7 isProfileServerIDForDefaultProfile:v8];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_populateExtensionsIfNecessaryUsingManagerForDefaultProfile
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __97__SFContentBlockerManager_SFPrivate___populateExtensionsIfNecessaryUsingManagerForDefaultProfile__block_invoke;
  v2[3] = &unk_1E5C731C0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __97__SFContentBlockerManager_SFPrivate___populateExtensionsIfNecessaryUsingManagerForDefaultProfile__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[112])
  {
    id v5 = WeakRetained;
    uint64_t v2 = [WeakRetained _contentBlockerManagerForDefaultProfile];
    if ([v2 hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce])
    {
      id v3 = [v2 extensions];
      id v4 = objc_msgSend(v3, "safari_arrayByMappingObjectsUsingBlock:", &__block_literal_global_182);

      [v5 _didDiscoverExtensions:v4];
    }

    id WeakRetained = v5;
  }
}

id __97__SFContentBlockerManager_SFPrivate___populateExtensionsIfNecessaryUsingManagerForDefaultProfile__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (void)_contentBlockerEnabledStateDidChange:(id)a3
{
  id v4 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_INFO, "In _contentBlockerEnabledStateDidChange, indicating state reload was requested", v5, 2u);
  }
  self->_contentBlockerStateStoreRequiresReload = 1;
}

- (void)_contentBlockerStateInPrivateBrowsingDidChange:(id)a3
{
  id v8 = a3;
  id v4 = [v8 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F990D8]];

  id v6 = [v8 userInfo];
  int v7 = objc_msgSend(v6, "safari_BOOLForKey:", *MEMORY[0x1E4F99198]);

  if (v7) {
    [(SFContentBlockerManager *)self _applyContentBlockerInPrivateBrowsing:v5];
  }
  else {
    [(SFContentBlockerManager *)self _removeContentBlockerInPrivateBrowsing:v5];
  }
}

- (void)_saveContentBlockerRecompilationInformation
{
  v8[4] = *(id *)MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_extensionsRecompiledAfterBackup count])
  {
    extensionsRecompiledAfterBackup = self->_extensionsRecompiledAfterBackup;
    v8[0] = 0;
    id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:extensionsRecompiledAfterBackup format:200 options:0 error:v8];
    id v5 = v8[0];
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6)
    {
      int v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[SFContentBlockerManager(SFPrivate) _saveContentBlockerRecompilationInformation]();
      }
    }
    else
    {
      int v7 = pathToRecompilationInformation();
      [v4 writeToURL:v7 atomically:1];
    }
  }
}

- (void)_noteRecompilationWasAttemptedForExtension:(id)a3
{
  id v4 = a3;
  recompilationInformationAccessQueue = self->_recompilationInformationAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__SFContentBlockerManager_SFPrivate___noteRecompilationWasAttemptedForExtension___block_invoke;
  v7[3] = &unk_1E5C72628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(recompilationInformationAccessQueue, v7);
}

uint64_t __81__SFContentBlockerManager_SFPrivate___noteRecompilationWasAttemptedForExtension___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 _saveContentBlockerRecompilationInformation];
}

void __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v6, "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_INFO, "Re-compiling Content Blocker '%{public}@' because it was not found due to lookup error: %{public}@", buf, 0x16u);
    }
    uint64_t v10 = objc_opt_class();
    id v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke_187;
    v12[3] = &unk_1E5C73210;
    long long v13 = *(_OWORD *)(a1 + 40);
    id v14 = v11;
    [v10 _loadContentBlockerWithIdentifier:v14 completionHandler:v12];
  }
}

void __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke_187(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _noteRecompilationWasAttemptedForExtension:*(void *)(a1 + 40)];
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke_187_cold_1();
    }
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Successfully loaded enabled Content Blocker '%{public}@'", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 byUserGesture:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(SFContentBlockerManager *)self webExtensionsController];
  uint64_t v10 = [v9 composedIdentifierForExtensionStateForExtension:v8];

  id v11 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v10];
  int8x16_t v12 = (void *)[v11 mutableCopy];
  long long v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  int v15 = v14;

  uint64_t v16 = [NSNumber numberWithBool:v6];
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F99488]];

  __int16 v17 = [NSNumber numberWithBool:v5];
  [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F99480]];

  uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
  [v15 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F99490]];

  [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore setObject:v15 forKey:v10];
  [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore saveStoreSynchronously];
  uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 postNotificationName:*MEMORY[0x1E4F991A0] object:v8];

  long long v20 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v20 postNotificationName:@"com.apple.SafariServices.ContentBlockerEnabledStateDidChange" object:0 userInfo:0 deliverImmediately:1];

  id v21 = [MEMORY[0x1E4F98A18] sharedManager];
  [v21 localExtensionStateDidChange];

  long long v22 = [v8 identifier];
  uint64_t v23 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = v22;
    __int16 v33 = 1024;
    BOOL v34 = v6;
    _os_log_impl(&dword_1A690B000, v23, OS_LOG_TYPE_DEFAULT, "Setting content blocker (%{public}@) to state: %d", buf, 0x12u);
  }
  if (v6)
  {
    id v24 = [(id)objc_opt_class() contentBlockerStore];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke;
    v28[3] = &unk_1E5C73260;
    id v29 = v22;
    double v30 = self;
    [v24 lookUpContentRuleListForIdentifier:v29 completionHandler:v28];
  }
  else
  {
    long long v25 = [(id)objc_opt_class() _contentBlockerLoaderConnection];
    long long v26 = [v25 remoteObjectProxy];
    [v26 removeContentBlockerWithIdentifierIfNecessary:v22];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.SafariServices.ContentBlockerDidChange", 0, 0, 0);
  }
}

void __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "Skipping compiling content blocker %{public}@ because it's already compiled", buf, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.SafariServices.ContentBlockerDidChange", 0, 0, 0);
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    id v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke_191;
    v12[3] = &unk_1E5C73238;
    id v13 = v11;
    [v10 _loadContentBlockerWithIdentifier:v13 completionHandler:v12];
  }
}

void __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke_191(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke_191_cold_1();
    }
  }
}

- (BOOL)isContentBlockerAllowedInPrivateBrowsing:(id)a3
{
  id v4 = a3;
  if ([(SFContentBlockerManager *)self _isManagingDefaultProfile])
  {
    if (self->_contentBlockerStateStoreRequiresReload)
    {
      id v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Loading content blocker state from disk since it was changed from another process", v16, 2u);
      }
      [(SFContentBlockerManager *)self _loadContentBlockerStateFromDisk];
      self->_contentBlockerStateStoreRequiresReload = 0;
    }
    id v6 = [(SFContentBlockerManager *)self webExtensionsController];
    int v7 = [v6 composedIdentifierForExtensionStateForExtension:v4];

    uint64_t v8 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v7];
    uint64_t v9 = objc_msgSend(v8, "safari_numberForKey:", @"AllowInPrivateBrowsing");

    if (v9) {
      int v10 = [v9 BOOLValue];
    }
    else {
      int v10 = 1;
    }
    id v11 = [MEMORY[0x1E4F98C20] sharedController];
    uint64_t v12 = [v11 managedExtensionPrivateBrowsingStateForComposedIdentifier:v7];

    if (v12 == 2) {
      int v13 = v10;
    }
    else {
      int v13 = 0;
    }
    if (v13 == 1)
    {
      [(SFContentBlockerManager *)self setExtension:v4 isEnabledInPrivateBrowsing:0 updateUserContentController:0];
      LOBYTE(v10) = 0;
    }
    else
    {
      if (v12 == 1) {
        char v14 = v10;
      }
      else {
        char v14 = 1;
      }
      if ((v14 & 1) == 0)
      {
        LOBYTE(v10) = 1;
        [(SFContentBlockerManager *)self setExtension:v4 isEnabledInPrivateBrowsing:1 updateUserContentController:0];
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setExtension:(id)a3 isEnabledInPrivateBrowsing:(BOOL)a4 updateUserContentController:(BOOL)a5
{
  BOOL v6 = a4;
  id v17 = a3;
  if ([(SFContentBlockerManager *)self _isManagingDefaultProfile])
  {
    uint64_t v8 = [(SFContentBlockerManager *)self webExtensionsController];
    uint64_t v9 = [v8 composedIdentifierForExtensionStateForExtension:v17];

    int v10 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v9];
    id v11 = (void *)[v10 mutableCopy];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    char v14 = v13;

    uint64_t v15 = [NSNumber numberWithBool:v6];
    [v14 setObject:v15 forKeyedSubscript:@"AllowInPrivateBrowsing"];

    [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore setObject:v14 forKey:v9];
    [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore saveStoreSynchronously];
    if (a5)
    {
      [v17 identifier];
      if (v6) {
        uint64_t v16 = {;
      }
        [(SFContentBlockerManager *)self _applyContentBlockerInPrivateBrowsing:v16];
      }
      else {
        uint64_t v16 = {;
      }
        [(SFContentBlockerManager *)self _removeContentBlockerInPrivateBrowsing:v16];
      }
    }
  }
}

- (void)savePendingChangesBeforeTermination
{
}

- (id)displayNameForExtension:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _plugIn];
  BOOL v6 = [v5 containingUrl];

  int v7 = [v4 _plugIn];
  uint64_t v8 = [v7 localizedContainingName];

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  extensions = self->_extensions;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __62__SFContentBlockerManager_SFPrivate__displayNameForExtension___block_invoke;
  long long v20 = &unk_1E5C73288;
  id v10 = v6;
  id v21 = v10;
  long long v22 = v23;
  id v11 = [(NSSet *)extensions objectsPassingTest:&v17];
  if ([v11 count] != 1)
  {
    uint64_t v12 = NSString;
    id v13 = _WBSLocalizedString();
    char v14 = [v4 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CC48]];
    uint64_t v15 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v8, v14, v17, v18, v19, v20);

    uint64_t v8 = (void *)v15;
  }

  _Block_object_dispose(v23, 8);

  return v8;
}

uint64_t __62__SFContentBlockerManager_SFPrivate__displayNameForExtension___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 _plugIn];
  BOOL v6 = [v5 containingUrl];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v8 + 24)) {
      *a3 = 1;
    }
    else {
      *(unsigned char *)(v8 + 24) = 1;
    }
  }
  return v7;
}

- (id)_contentBlockerWithComposedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SFContentBlockerManager *)self webExtensionsController];
  BOOL v6 = [(SFContentBlockerManager *)self extensions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SFContentBlockerManager_SFPrivate___contentBlockerWithComposedIdentifier___block_invoke;
  v11[3] = &unk_1E5C732B0;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  uint64_t v9 = objc_msgSend(v6, "safari_anyObjectPassingTest:", v11);

  return v9;
}

uint64_t __76__SFContentBlockerManager_SFPrivate___contentBlockerWithComposedIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) composedIdentifierForExtensionStateForExtension:a2];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  return v4;
}

- (id)_contentBlockersWithAdamID:(id)a3
{
  id v4 = a3;
  id v5 = [(SFContentBlockerManager *)self extensions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __65__SFContentBlockerManager_SFPrivate___contentBlockersWithAdamID___block_invoke;
  v10[3] = &unk_1E5C730E0;
  id v6 = v4;
  id v11 = v6;
  id v7 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v10);
  id v8 = [v7 allObjects];

  return v8;
}

id __65__SFContentBlockerManager_SFPrivate___contentBlockersWithAdamID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "safari_containingAppAdamID");
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }
  if (v5) {
    id v7 = 0;
  }
  else {
    id v7 = v3;
  }

  return v6;
}

- (id)cloudExtensionStateForStateManager:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(SFContentBlockerManager *)self extensions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v24 = *(void *)v26;
    uint64_t v21 = *MEMORY[0x1E4F99470];
    uint64_t v20 = *MEMORY[0x1E4F99478];
    uint64_t v19 = *MEMORY[0x1E4F994A0];
    uint64_t v18 = *MEMORY[0x1E4F99498];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v7 = [(SFContentBlockerManager *)self webExtensionsController];
        id v8 = [v7 composedIdentifierForExtensionStateForExtension:v6];

        uint64_t v9 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v8];
        id v10 = objc_msgSend(v6, "safari_containingAppAdamID");
        if (v10 || (objc_msgSend(v6, "safari_containingAppIsTestFlightApp") & 1) != 0)
        {
          id v11 = [(SFContentBlockerManager *)self displayNameForExtension:v6];
          id v12 = [MEMORY[0x1E4F1CA60] dictionary];
          id v13 = v12;
          if (v10) {
            [v12 setObject:v10 forKeyedSubscript:v21];
          }
          if (v11) {
            [v13 setObject:v11 forKeyedSubscript:v20];
          }
          char v14 = objc_msgSend(v6, "safari_correspondingMacOSExtensionBundleIdentifier");
          if (v14) {
            [v13 setObject:v14 forKeyedSubscript:v19];
          }

          uint64_t v15 = objc_msgSend(v6, "safari_correspondingMacOSContainingAppBundleIdentifier");
          if (v15) {
            [v13 setObject:v15 forKeyedSubscript:v18];
          }

          uint64_t v16 = objc_msgSend(v13, "safari_dictionaryByMergingWithDictionary:", v9);
          [v23 setObject:v16 forKeyedSubscript:v8];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  return v23;
}

- (void)setExtensionWithComposedIdentifier:(id)a3 isEnabledInCloud:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SFContentBlockerManager *)self _contentBlockerWithComposedIdentifier:a3];
  if (-[SFContentBlockerManager extensionIsEnabled:](self, "extensionIsEnabled:") != v4) {
    [(SFContentBlockerManager *)self setExtension:v6 isEnabled:v4 byUserGesture:0];
  }
}

- (BOOL)hasExtensionWithComposedIdentifier:(id)a3
{
  id v3 = [(SFContentBlockerManager *)self _contentBlockerWithComposedIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)profileServerIDForStateManager:(id)a3
{
  return self->_profileServerID;
}

- (id)_installationDateForExtension:(id)a3
{
  id v4 = a3;
  int v5 = [(SFContentBlockerManager *)self webExtensionsController];
  id v6 = [v5 composedIdentifierForExtensionStateForExtension:v4];

  id v7 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v6];
  id v8 = objc_msgSend(v7, "safari_dateForKey:", *MEMORY[0x1E4F991A8]);

  return v8;
}

- (unint64_t)recentlyInstalledExtensionCount
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x1E4F99290]);

  int v5 = [(NSSet *)self->_extensions allObjects];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __69__SFContentBlockerManager_SFPrivate__recentlyInstalledExtensionCount__block_invoke;
  id v13 = &unk_1E5C732B0;
  char v14 = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &v10);
  unint64_t v8 = objc_msgSend(v7, "count", v10, v11, v12, v13, v14);

  return v8;
}

BOOL __69__SFContentBlockerManager_SFPrivate__recentlyInstalledExtensionCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) extensionIsEnabled:v3])
  {
    BOOL v4 = 0;
  }
  else if (*(void *)(a1 + 40))
  {
    int v5 = [*(id *)(a1 + 32) _installationDateForExtension:v3];
    BOOL v4 = [*(id *)(a1 + 40) compare:v5] == -1;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)extensionStateKeysToCopy
{
  id v8[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F991A8];
  v8[0] = *MEMORY[0x1E4F99488];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F99480];
  v8[2] = *MEMORY[0x1E4F991B0];
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E4F99490];
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  id v6 = [v2 setWithArray:v5];

  return v6;
}

- (void)copyEnabledExtensionStateFromContentBlockerManager:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = (id *)a3;
  uint64_t v3 = [(SFContentBlockerManager *)self extensionStateKeysToCopy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v18[8] allKeys];
  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v19 = v5;
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v20 = [v18[8] dictionaryForKey:v7];
        unint64_t v8 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v7];
        uint64_t v9 = (void *)[v8 mutableCopy];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v20;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * j);
              if ([v3 containsObject:v14])
              {
                id v15 = [v10 objectForKeyedSubscript:v14];
                [v9 setObject:v15 forKeyedSubscript:v14];
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }

        [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore setObject:v9 forKey:v7];
      }
      uint64_t v4 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore saveStoreSynchronously];
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p profile server ID = \"%@\"", v5, self, self->_profileServerID];;

  return (NSString *)v6;
}

- (id)extensionsDataForExport
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_contentBlockerStateStoreRequiresReload)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "Loading content blocker state from disk since it was changed from another process", buf, 2u);
    }
    [(SFContentBlockerManager *)self _loadContentBlockerStateFromDisk];
    self->_contentBlockerStateStoreRequiresReload = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v22 = *(void *)v25;
    uint64_t v21 = *MEMORY[0x1E4F99488];
    do
    {
      uint64_t v23 = v4;
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v7 = [(WBSPersistentPropertyListStore *)self->_contentBlockerStateStore dictionaryForKey:v6];
        char v8 = objc_msgSend(v7, "safari_BOOLForKey:", v21);

        if (v8)
        {
          uint64_t v9 = [(SFContentBlockerManager *)self _contentBlockerWithComposedIdentifier:v6];
          if (v9)
          {
            id v10 = (void *)MEMORY[0x1E4F98AD8];
            uint64_t v11 = [(SFContentBlockerManager *)self displayNameForExtension:v9];
            uint64_t v12 = objc_msgSend(v9, "safari_launchServicesDeveloperName");
            id v13 = objc_msgSend(v9, "safari_containingAppAdamID");
            uint64_t v14 = objc_msgSend(v9, "safari_correspondingMacOSExtensionBundleIdentifier");
            id v15 = objc_msgSend(v9, "safari_correspondingMacOSContainingAppBundleIdentifier");
            uint64_t v16 = [v10 extensionDataWithDisplayName:v11 developerName:v12 composedIdentifier:v6 adamIdentifier:v13 alternatePlatformExtensionBundleIdentifier:v14 alternatePlatformAppBundleIdentifier:v15];

            [v19 addObject:v16];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }

  uint64_t v17 = (void *)[v19 copy];

  return v17;
}

+ (void)reloadContentBlockerWithIdentifier:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getStateOfContentBlockerWithIdentifier:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__SFContentBlockerManager_SFPrivate___commonInit__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__SFContentBlockerManager_SFPrivate___loadContentBlockerStateFromDisk__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Error occurred when attempting to find content blocker extensions: %{public}@", v5);
}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A690B000, "Failed to look up content blocker '%{private}@' with error %{public}@", v4, v5);
}

void __89__SFContentBlockerManager_SFPrivate___loadContentBlockerRecompilationInformationIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Failed to read recompilation information: %{public}@", v5);
}

void __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke_187_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A690B000, "Previously enabled Content Blocker '%{public}@' failed to load: %{public}@", v4, v5);
}

void __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke_191_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A690B000, "Error loading content blocker (%{public}@): %{public}@", v4, v5);
}

@end