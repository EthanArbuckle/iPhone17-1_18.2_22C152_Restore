@interface FPXExtensionContext
+ (Class)principalClass;
+ (void)principalClass;
- (BOOL)_inlineSymlinkTarget:(id)a3 url:(id *)a4 error:(id *)a5;
- (BOOL)usesFPFS;
- (FPXExtensionContext)init;
- (NSString)description;
- (NSString)providerIdentifier;
- (id)_createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 bounce:(BOOL)a8 bounceNumber:(id)a9 completionHandler:(id)a10;
- (id)_proxyWithCancellationHandler:(id)a3 forClientOperation:(id)a4;
- (id)additionalServiceSourcesForItemID:(id)a3 domain:(id)a4 extension:(id)a5;
- (id)alternateContentsURLWrapperForItemID:(id)a3;
- (id)createFPTempDirectoryAppropriateForURL:(id)a3 error:(id *)a4;
- (id)createFPTempDirectoryWithError:(id *)a3;
- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 bounce:(BOOL)a8 completionHandler:(id)a9;
- (id)createTempThumbnailURLForVersion:(id)a3 appropriateForURL:(id)a4 itemIdentifier:(id)a5 isFromData:(BOOL)a6 error:(id *)a7;
- (id)createUserInteractionSuppressingWithDomainIdentifier:(id)a3 withPurpose:(id)a4;
- (id)deleteItemWithID:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (id)disconnectDomainID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (id)domainContext;
- (id)domainContextForIdentifier:(id)a3;
- (id)domainContextForItemID:(id)a3;
- (id)domainContextForItemIDs:(id)a3;
- (id)fetchContentsForItemWithID:(id)a3 version:(id)a4 request:(id)a5 estimatedItemSize:(int64_t)a6 isSymlink:(BOOL)a7 extent:(id)a8 alignment:(unint64_t)a9 options:(unint64_t)a10 completionHandler:(id)a11;
- (id)fetchContentsForItemWithID:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 request:(id)a7 estimatedItemSize:(int64_t)a8 isSymlink:(BOOL)a9 completionHandler:(id)a10;
- (id)fetchPublishingURLForItemID:(id)a3 completionHandler:(id)a4;
- (id)instanceForItemID:(id)a3;
- (id)instanceWithPrivateSelector:(SEL)a3;
- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9;
- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 domainIdentifier:(id)a5 completionHandler:(id)a6;
- (id)v2Instance;
- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6;
- (void)_deleteIndexInDomainContexts:(id)a3 completionHandler:(id)a4;
- (void)_fetchHierarchyForItemID:(id)a3 into:(id)a4 maxDepth:(unint64_t)a5 completionHandler:(id)a6;
- (void)_freeSlotHeldByItem:(id)a3 request:(id)a4 bounceIndex:(unint64_t)a5 completionHandler:(id)a6;
- (void)_indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6;
- (void)_persistedDocumentURLForURL:(id)a3 itemID:(id)a4 extension:(id)a5 creatingPlaceholderIfMissing:(BOOL)a6 completionHandler:(id)a7;
- (void)_setupItemForTrashing:(id)a3 usesFPFS:(BOOL)a4 completionHandler:(id)a5;
- (void)_singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 bounceIndex:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8;
- (void)_test_callFileProviderManagerAPIs:(id)a3;
- (void)_waitForExtensionStabilizationWithCompletionHandler:(id)a3;
- (void)addListenerDelegate:(id)a3;
- (void)applyFieldChangesToItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 lastKnownVendorItem:(id)a7 extensionInstance:(id)a8 completionHandler:(id)a9;
- (void)applyItemChange:(id)a3 baseVersion:(id)a4 contents:(id)a5 completionHandler:(id)a6;
- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 completionHandler:(id)a5;
- (void)beginRequestWithDomain:(id)a3 alternateContentsDictionary:(id)a4 domainServicer:(id)a5 providerDomain:(id)a6 domainVersion:(id)a7 completionHandler:(id)a8;
- (void)bulkEvictItemsWithItemIDs:(id)a3 completionHandler:(id)a4;
- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)deleteItemsWithIDs:(id)a3 baseVersions:(id)a4 options:(unint64_t)a5 reply:(id)a6;
- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 domainIdentifier:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6;
- (void)didChangeItemID:(id)a3 completionHandler:(id)a4;
- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 completionHandler:(id)a4;
- (void)domainContext;
- (void)dropDomainWithCompletionHandler:(id)a3;
- (void)dropIndexForDomain:(id)a3 dropReason:(unint64_t)a4 completionHandler:(id)a5;
- (void)dumpIndexStateForDomain:(id)a3 toFileHandler:(id)a4 completionHandler:(id)a5;
- (void)dumpInternalStateToTermDumper:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)enumeratorWasInvalidated:(id)a3;
- (void)evictItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)fetchAlternateContentsURLWrapperForURL:(id)a3 completionHandler:(id)a4;
- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fetchCustomPushTopicsWithCompletionHandler:(id)a3;
- (void)fetchDefaultContainerForBundleIdentifier:(id)a3 defaultName:(id)a4 inDomainIdentifier:(id)a5 lookupOnly:(BOOL)a6 reply:(id)a7;
- (void)fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 ignoreAlternateContentURL:(BOOL)a5 reply:(id)a6;
- (void)fetchItemID:(id)a3 reply:(id)a4;
- (void)fetchOperationServiceEndpoint:(id)a3;
- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3;
- (void)fetchVendorEndpoint:(id)a3;
- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4;
- (void)getKnownFolderLocations:(unint64_t)a3 completionHandler:(id)a4;
- (void)identifierForItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)importDidFinishWithCompletionHandler:(id)a3;
- (void)importDocumentAtURL:(id)a3 intoFolderWithIdentifier:(id)a4 originalName:(id)a5 extensionInstance:(id)a6 reply:(id)a7;
- (void)indexOneBatchInDomain:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)itemChangedAtURL:(id)a3 completionHandler:(id)a4;
- (void)itemForItemID:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)itemForURL:(id)a3 completionHandler:(id)a4;
- (void)listRemoteVersionsWithSettings:(id)a3 observer:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationURL:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preflightReparentItemIDs:(id)a3 underParentID:(id)a4 reply:(id)a5;
- (void)preflightTrashItemIDs:(id)a3 completionHandler:(id)a4;
- (void)providePlaceholderAtURL:(id)a3 completionHandler:(id)a4;
- (void)removeListenerDelegate:(id)a3;
- (void)removeTrashedItemsOlderThanDate:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendBlockedProcessNamesUpdateWithCompletionHandler:(id)a3;
- (void)setAlternateContentsURL:(id)a3 forDocumentWithURL:(id)a4 completionHandler:(id)a5;
- (void)shouldConnectExternalDomainWithCompletionHandler:(id)a3;
- (void)signalEnumeratorForMaterializedItemsWithCompletionHandler:(id)a3;
- (void)signalEnumeratorForPendingItemsWithCompletionHandler:(id)a3;
- (void)signalNeedsReindexItemsWithIdentifiers:(id)a3 domainIdentifier:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6;
- (void)singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 completionHandler:(id)a6;
- (void)spotlightIndexerDidReindexAllSearchableItems:(id)a3;
- (void)startOperation:(id)a3 toFetchThumbnailsForItemIdentifiers:(id)a4 size:(CGSize)a5 completionHandler:(id)a6;
- (void)startOperation:(id)a3 toFetchThumbnailsWithDictionary:(id)a4 size:(CGSize)a5 completionHandler:(id)a6;
- (void)startProvidingItemAtURL:(id)a3 readingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)trashItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)updateIgnoreStateOfItemWithIdentifiers:(id)a3 ignoreState:(BOOL)a4 completionHandler:(id)a5;
- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)userInteractionErrorsForPerformingAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 fpProviderDomainId:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)a9;
- (void)valuesForAttributes:(id)a3 forItemID:(id)a4 completionHandler:(id)a5;
- (void)waitForStabilizationWithCompletionHandler:(id)a3;
- (void)wakeForPushWithCompletionHandler:(id)a3;
- (void)wakeForSessionIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation FPXExtensionContext

void __63__FPXExtensionContext_itemForItemID_request_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) domainContextForItemID:*(void *)(a1 + 40)];
  v3 = [v2 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [v2 domain];
    v7 = [v6 personaIdentifier];
    v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    v9 = [v8 currentPersona];
    v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      v12 = NSString;
      v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      v14 = [v13 currentPersona];
      v15 = [v14 userPersonaUniqueString];
      v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      v19 = [v2 domain];
      v20 = [v19 personaIdentifier];
      v21 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v20];

      v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext itemForItemID:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1553, (const char *)[v21 UTF8String]);
    }
  }
  else
  {
  }
  v23 = [v2 vendorInstance];
  v24 = [*(id *)(a1 + 40) identifier];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __63__FPXExtensionContext_itemForItemID_request_completionHandler___block_invoke_2;
  v30[3] = &unk_1E5AF0E18;
  id v31 = v2;
  v25 = *(void **)(a1 + 48);
  id v32 = v25;
  id v26 = *(id *)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 32);
  id v33 = v26;
  uint64_t v34 = v27;
  id v35 = *(id *)(a1 + 56);
  id v28 = v2;
  id v29 = (id)[v23 itemForIdentifier:v24 request:v25 completionHandler:v30];
}

- (void)fetchItemID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13 = fpfs_adopt_log(self->_log);
  v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext fetchItemID:reply:]();
  }

  v9 = +[NSFileProviderRequest requestFromTheSystem];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__FPXExtensionContext_fetchItemID_reply___block_invoke;
  v11[3] = &unk_1E5AF0E40;
  v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  [(FPXExtensionContext *)self itemForItemID:v6 request:v9 completionHandler:v11];

  __fp_pop_log(&v13);
}

- (void)itemForItemID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20 = fpfs_adopt_log(self->_log);
  char v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v22 = self;
    __int16 v23 = 2080;
    v24 = "-[FPXExtensionContext itemForItemID:request:completionHandler:]";
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }

  instanceQueue = self->_instanceQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__FPXExtensionContext_itemForItemID_request_completionHandler___block_invoke;
  v16[3] = &unk_1E5AF0968;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  fp_dispatch_async_with_logs(instanceQueue, v16);

  __fp_pop_log(&v20);
}

- (id)domainContextForItemID:(id)a3
{
  id v5 = a3;
  id v6 = [v5 domainIdentifier];
  id v7 = [(FPXExtensionContext *)self domainContext];
  id v8 = [v7 domain];
  id v9 = [v8 identifier];
  char v10 = [v6 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [v7 domain];
    id v14 = [v13 identifier];
    [v12 handleFailureInMethod:a2, self, @"FPXExtensionContext.m", 424, @"Sent to wrong instance, itemID=%@, domainContext.domain=%@", v5, v14 object file lineNumber description];
  }

  return v7;
}

- (id)domainContext
{
  v2 = self;
  objc_sync_enter(v2);
  domainContext = v2->_domainContext;
  if (!domainContext)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FPXExtensionContext domainContext]();
    }

    exit(1);
  }
  uint64_t v4 = domainContext;
  objc_sync_exit(v2);

  return v4;
}

- (void)beginRequestWithDomain:(id)a3 alternateContentsDictionary:(id)a4 domainServicer:(id)a5 providerDomain:(id)a6 domainVersion:(id)a7 completionHandler:(id)a8
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v80 = a4;
  id v81 = a5;
  id v15 = (char *)a6;
  id v82 = a7;
  id v83 = a8;
  v16 = self;
  objc_sync_enter(v16);
  id v17 = NSString;
  providerIdentifier = v16->_providerIdentifier;
  id v19 = [v14 identifier];
  v20 = objc_msgSend(v17, "fp_providerDomainIDFromProviderID:domainIdentifier:", providerIdentifier, v19);
  objc_msgSend(v20, "fp_obfuscatedProviderDomainID");
  id v21 = objc_claimAutoreleasedReturnValue();
  uint64_t v22 = fpfs_create_log_for_provider((char *)[v21 UTF8String]);
  log = v16->_log;
  v16->_log = (OS_os_log *)v22;

  v86 = 0;
  v86 = fpfs_adopt_log(v16->_log);
  v24 = fp_current_or_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v89 = v16;
    __int16 v90 = 2080;
    v91 = "-[FPXExtensionContext beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainV"
          "ersion:completionHandler:]";
    __int16 v92 = 2112;
    v93 = v15;
    __int16 v94 = 2048;
    uint64_t v95 = (uint64_t)v82;
    _os_log_debug_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %ld", buf, 0x2Au);
  }

  __int16 v25 = [MEMORY[0x1E4F29268] currentConnection];
  objc_storeWeak((id *)&v16->_xpcConnection, v25);

  id v26 = v16->_log;
  id WeakRetained = objc_loadWeakRetained((id *)&v16->_xpcConnection);
  +[FPXPCLogDelegate setupWithLog:v26 forConnection:WeakRetained];

  id v28 = fp_current_or_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = [MEMORY[0x1E4F29268] currentConnection];
    *(_DWORD *)buf = 138412290;
    v89 = v29;
    _os_log_impl(&dword_1A33AE000, v28, OS_LOG_TYPE_INFO, "[INFO] [helena] call to beginRequest from connection %@", buf, 0xCu);
  }
  v30 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v31 = [v30 currentPersona];
  v84 = [v31 userPersonaUniqueString];

  id v32 = [v14 personaIdentifier];
  if ([v32 isEqualToString:v84])
  {
  }
  else
  {
    id v33 = [v14 personaIdentifier];
    BOOL v34 = v84 == v33;

    if (!v34)
    {
      v67 = fp_current_or_default_log();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v68 = [v14 personaIdentifier];
        *(_DWORD *)buf = 138412802;
        v89 = v16;
        __int16 v90 = 2112;
        v91 = v84;
        __int16 v92 = 2112;
        v93 = v68;
        _os_log_error_impl(&dword_1A33AE000, v67, OS_LOG_TYPE_ERROR, "[ERROR] Non matching personas for the extension %@ (%@, expect %@)", buf, 0x20u);
      }
      uint64_t v69 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderInternalErrorDomain" code:18 userInfo:MEMORY[0x1E4F1CC08]];
      v87[0] = fpfs_adopt_log(v16->_log);
      v70 = fp_current_or_default_log();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      {
        v71 = (FPXExtensionContext *)FPPopLogSectionForBlock(v83);
        *(_DWORD *)buf = 134218754;
        v89 = v71;
        __int16 v90 = 2112;
        v91 = (const char *)v16;
        __int16 v92 = 2080;
        v93 = "-[FPXExtensionContext beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:dom"
              "ainVersion:completionHandler:]";
        __int16 v94 = 2112;
        uint64_t v95 = v69;
        _os_log_debug_impl(&dword_1A33AE000, v70, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }

      (*((void (**)(id, uint64_t))v83 + 2))(v83, v69);
      __fp_pop_log(v87);

      exit(1);
    }
  }
  id v35 = [FPXPCAutomaticErrorProxy alloc];
  v36 = NSString;
  v37 = [v14 identifier];
  v38 = [v36 stringWithFormat:@"domain servicer for %@ (handshake)", v37];
  uint64_t v39 = [(FPXPCAutomaticErrorProxy *)v35 initWithConnection:v81 protocol:&unk_1EF6EDE80 orError:0 name:v38 requestPid:0];
  domainServicer = v16->_domainServicer;
  v16->_domainServicer = (FPDDomainServicing *)v39;

  +[NSFileProviderManager registerDomainServicer:v16->_domainServicer forDomain:v14];
  v41 = [v15 storageURLs];
  v42 = [v41 firstObject];

  if (v42)
  {
    v43 = [v15 storageURLs];
    v44 = [v43 firstObject];
    +[NSFileProviderManager registerRootURL:v44 forDomain:v14];
  }
  v45 = +[FPXExtensionContext principalClass];
  if ([v15 isUsingFPFS])
  {
    v46 = [v15 providerID];
    if ([v46 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
    {
    }
    else
    {
      v47 = [v15 providerID];
      char v48 = [v47 isEqualToString:@"com.apple.FileProvider.TestingHarness.TestFileProvider"];

      if ((v48 & 1) == 0)
      {
        if (([(objc_class *)v45 conformsToProtocol:&unk_1EF6D2D88] & 1) == 0)
        {
          v77 = [v14 identifier];
          v78 = [v15 providerDisplayName];
          __FILEPROVIDER_BAD_EXTENSION__(v77, v78, (uint64_t)v45);
        }
        goto LABEL_29;
      }
    }
  }
  if (([v15 isUsingFPFS] & 1) == 0)
  {
    v49 = [v15 identifier];
    v50 = objc_msgSend(v49, "fp_toDomainIdentifier");
    if (![v50 isEqual:@"NSFileProviderDomainDefaultIdentifier"]
      || ![(objc_class *)v45 conformsToProtocol:&unk_1EF6D2D88])
    {
LABEL_25:

      goto LABEL_26;
    }
    if (v45)
    {
      Superclass = v45;
      while ((objc_class *)objc_opt_class() != Superclass)
      {
        if ((objc_class *)objc_opt_class() != Superclass)
        {
          Superclass = class_getSuperclass(Superclass);
          if (Superclass) {
            continue;
          }
        }
        goto LABEL_22;
      }
      goto LABEL_25;
    }
LABEL_22:

    v52 = fp_current_or_default_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A33AE000, v52, OS_LOG_TYPE_INFO, "[INFO] Trying to build a non-FPFS default domain for an FPFS provider", buf, 2u);
    }

    v45 = (objc_class *)FPXFakeDefaultDomainExtension;
LABEL_29:
    v55 = (FPXV2ExtensionWrapper *)[[v45 alloc] initWithDomain:v14];
    v56 = 0;
    goto LABEL_30;
  }
LABEL_26:
  if (([(objc_class *)v45 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v75 = [v14 identifier];
    v76 = [v15 domainDisplayName];
    __FILEPROVIDER_V2_EXTENSION_WITHOUT_IMPL(v75, v76, (uint64_t)v45);
  }
  v53 = [FPXV2ExtensionWrapper alloc];
  [(FPXV2ExtensionWrapper *)v53 setExtensionClass:v45];
  v54 = v53;
  v55 = [(FPXV2ExtensionWrapper *)v54 initWithDomain:v14];
  v56 = [(FPXV2ExtensionWrapper *)v54 extension];

LABEL_30:
  if (![(FPXV2ExtensionWrapper *)v55 conformsToProtocol:&unk_1EF6D2D88]
    && ![(FPXV2ExtensionWrapper *)v55 conformsToProtocol:&unk_1EF6D2D88])
  {
    v72 = [MEMORY[0x1E4F28B00] currentHandler];
    v73 = (objc_class *)objc_opt_class();
    v74 = NSStringFromClass(v73);
    [v72 handleFailureInMethod:a2, v16, @"FPXExtensionContext.m", 240, @"The principal class of the extension is not of type NSFileProviderReplicatedExtension: %@", v74 object file lineNumber description];
  }
  v16->_usesFPFS = [v15 isUsingFPFS];
  v57 = [[FPDocumentAlternateContents alloc] initWithAlternateContentsDictionary:v80];
  alternateContents = v16->_alternateContents;
  v16->_alternateContents = v57;

  v59 = [[FPXDomainContext alloc] initWithVendorInstance:v55 domain:v14 extensionContext:v16 providerDomain:v15 domainVersion:v82];
  domainContext = v16->_domainContext;
  v16->_domainContext = v59;

  objc_storeStrong((id *)&v16->_providerDomain, a6);
  [v56 beginRequestWithExtensionContext:v16];
  v61 = fp_current_or_default_log();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    v62 = [(NSString *)v16->_providerIdentifier fp_fpIdentifier];
    -[FPXExtensionContext beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:](v62, (uint64_t)v87, v61);
  }

  if (v16->_usesFPFS && !v16->_userDefaults)
  {
    v63 = v16;
    objc_sync_enter(v63);
    uint64_t v64 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    userDefaults = v16->_userDefaults;
    v16->_userDefaults = (NSUserDefaults *)v64;

    [(NSUserDefaults *)v16->_userDefaults addObserver:v63 forKeyPath:@"NSFileProviderExtensionNonMaterializingProcessNames" options:4 context:0];
    objc_sync_exit(v63);
  }
  v85 = fpfs_adopt_log(v16->_log);
  v66 = fp_current_or_default_log();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(v83);
    -[FPXExtensionContext beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:]();
  }

  (*((void (**)(id, void))v83 + 2))(v83, 0);
  __fp_pop_log(&v85);

  __fp_pop_log(&v86);
  objc_sync_exit(v16);
}

- (void)removeListenerDelegate:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_listenerDelegates removeObject:v5];
  objc_sync_exit(v4);
}

- (void)fetchOperationServiceEndpoint:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = FPXOperationServiceXPCInterface();
  [v5 setInterface:v6];

  [v5 setExportedObject:self];
  [v5 setContext:self];
  id v7 = [MEMORY[0x1E4F29290] anonymousListener];
  id v8 = [v7 endpoint];
  [(FPXExtensionContext *)self addListenerDelegate:v5];
  [v7 setDelegate:v5];
  [v7 resume];
  char v10 = fpfs_adopt_log(self->_log);
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    id v12 = FPPopLogSectionForBlock(v4);
    __int16 v13 = 2112;
    id v14 = self;
    __int16 v15 = 2080;
    v16 = "-[FPXExtensionContext fetchOperationServiceEndpoint:]";
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = 0;
    _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*((void (**)(id, void *, void))v4 + 2))(v4, v8, 0);
  __fp_pop_log(&v10);
}

- (void)addListenerDelegate:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  listenerDelegates = v4->_listenerDelegates;
  if (!listenerDelegates)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = v4->_listenerDelegates;
    v4->_listenerDelegates = (NSMutableSet *)v6;

    listenerDelegates = v4->_listenerDelegates;
  }
  [(NSMutableSet *)listenerDelegates addObject:v8];
  objc_sync_exit(v4);
}

- (FPXExtensionContext)init
{
  v17.receiver = self;
  v17.super_class = (Class)FPXExtensionContext;
  v2 = [(FPXExtensionContext *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("fpx-notif-fetching", v3);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v4;

    dispatch_workloop_t v6 = dispatch_workloop_create("fpx-instance");
    instanceQueue = v2->_instanceQueue;
    v2->_instanceQueue = (OS_dispatch_queue *)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("fpx-queue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    char v11 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v12 = [v11 bundleIdentifier];
    providerIdentifier = v2->_providerIdentifier;
    v2->_providerIdentifier = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    runningEnumerators = v2->_runningEnumerators;
    v2->_runningEnumerators = (NSHashTable *)v14;
  }
  return v2;
}

void __63__FPXExtensionContext_indexOneBatchInDomain_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_workloop_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] index one batch: done (responding to fileproviderd)", buf, 2u);
  }

  char v10 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    v16 = "-[FPXExtensionContext indexOneBatchInDomain:completionHandler:]_block_invoke";
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v10);
}

- (void)indexOneBatchInDomain:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v37 = a4;
  dispatch_workloop_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v5;
    _os_log_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] fileproviderd ask us to index one batch for %@", buf, 0xCu);
  }

  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext indexOneBatchInDomain:completionHandler:].cold.7();
  }

  id v8 = [(FPXExtensionContext *)self domainContextForIdentifier:v5];
  uint64_t v9 = [v8 domain];
  char v10 = [v9 personaIdentifier];
  if (v10)
  {
    char v11 = [v8 domain];
    uint64_t v12 = [v11 personaIdentifier];
    __int16 v13 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v14 = [v13 currentPersona];
    __int16 v15 = [v14 userPersonaUniqueString];
    char v16 = [v12 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      __int16 v17 = NSString;
      int v18 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v19 = [v18 currentPersona];
      id v20 = [v19 userPersonaUniqueString];
      uint64_t v21 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v22 = [v21 currentPersona];
      uint64_t v23 = [v22 uid];
      v24 = [v8 domain];
      __int16 v25 = [v24 personaIdentifier];
      id v26 = [v17 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v20, v23, v25];

      __int16 v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext indexOneBatchInDomain:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1250, (const char *)[v26 UTF8String]);
    }
  }
  else
  {
  }
  if (v8)
  {
    id v28 = [v8 log];
    id v29 = fpfs_adopt_log(v28);

    if ([v8 usesFPFS])
    {
      id v35 = objc_msgSend(NSString, "stringWithFormat:", @"trying to use %s on a domain that is backed by FPFS", "-[FPXExtensionContext indexOneBatchInDomain:completionHandler:]");
      v36 = fp_current_or_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext indexOneBatchInDomain:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1260, (const char *)[v35 UTF8String]);
    }
    v30 = [v8 spotlightIndexer];
    if (v30)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __63__FPXExtensionContext_indexOneBatchInDomain_completionHandler___block_invoke;
      v39[3] = &unk_1E5AF09B8;
      v39[4] = self;
      id v40 = v37;
      [v30 indexOneBatchWithCompletionHandler:v39];
    }
    else
    {
      id v33 = fp_current_or_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[FPXExtensionContext indexOneBatchInDomain:completionHandler:].cold.5();
      }

      v41 = fpfs_adopt_log(self->_log);
      BOOL v34 = fp_current_or_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock(v37);
        -[FPXExtensionContext indexOneBatchInDomain:completionHandler:]();
      }

      (*((void (**)(id, void, void))v37 + 2))(v37, 0, 0);
      __fp_pop_log(&v41);
    }
  }
  else
  {
    id v31 = fp_current_or_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[FPXExtensionContext indexOneBatchInDomain:completionHandler:]();
    }

    v41 = fpfs_adopt_log(self->_log);
    id v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(v37);
      -[FPXExtensionContext indexOneBatchInDomain:completionHandler:]();
    }

    (*((void (**)(id, void, void))v37 + 2))(v37, 0, 0);
    __fp_pop_log(&v41);
  }
}

- (id)domainContextForIdentifier:(id)a3
{
  id v5 = a3;
  dispatch_workloop_t v6 = [(FPXExtensionContext *)self domainContext];
  id v7 = [v6 domain];
  id v8 = [v7 identifier];
  char v9 = [v5 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"FPXExtensionContext.m" lineNumber:391 description:@"Sent to wrong instance"];
  }

  return v6;
}

void __63__FPXExtensionContext_itemForItemID_request_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  id v7 = [*(id *)(a1 + 32) currentResponseWithRequest:*(void *)(a1 + 40)];
  if (!(v5 | v6))
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
  }
  id v8 = [*(id *)(a1 + 48) identifier];
  int v9 = [v8 isEqualToString:@"NSFileProviderTrashContainerItemIdentifier"];

  if (v9) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    __int16 v17 = [*(id *)(a1 + 32) itemFromVendorItem:v5];
    uint64_t v11 = [*(id *)(a1 + 32) internalErrorFromVendorError:v6 callerDescription:@"itemForItemID"];

    v24 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 56) + 72));
    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v20 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      uint64_t v21 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134219266;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      __int16 v29 = 2080;
      v30 = "-[FPXExtensionContext itemForItemID:request:completionHandler:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = v17;
      __int16 v33 = 2112;
      BOOL v34 = v7;
      __int16 v35 = 2112;
      uint64_t v36 = v11;
      _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log(&v24);

    uint64_t v6 = v11;
  }
  else
  {
    __int16 v13 = [FPItem alloc];
    uint64_t v14 = [*(id *)(a1 + 48) providerDomainID];
    __int16 v15 = [*(id *)(a1 + 48) identifier];
    char v16 = [*(id *)(a1 + 48) identifier];
    __int16 v17 = [(FPItem *)v13 initWithProviderDomainID:v14 itemIdentifier:v15 parentItemIdentifier:v16 filename:@".Trash" isDirectory:1];

    v24 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 56) + 72));
    int v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      uint64_t v23 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134219266;
      id v26 = v22;
      __int16 v27 = 2112;
      uint64_t v28 = v23;
      __int16 v29 = 2080;
      v30 = "-[FPXExtensionContext itemForItemID:request:completionHandler:]_block_invoke_2";
      __int16 v31 = 2112;
      id v32 = v17;
      __int16 v33 = 2112;
      BOOL v34 = v7;
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      _os_log_debug_impl(&dword_1A33AE000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log(&v24);
  }
}

void __41__FPXExtensionContext_fetchItemID_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v13 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  BOOL v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2080;
    __int16 v19 = "-[FPXExtensionContext fetchItemID:reply:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v13);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (BOOL)usesFPFS
{
  return self->_usesFPFS;
}

+ (Class)principalClass
{
  v2 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  if (!v2)
  {
    uint64_t v11 = [NSString stringWithFormat:@"FPXExtensionContext could not get the bundle record for the current process."];
    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[FPXExtensionContext principalClass]();
    }

    __assert_rtn("+[FPXExtensionContext principalClass]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 156, (const char *)[v11 UTF8String]);
  }
  v3 = v2;
  dispatch_queue_t v4 = [v2 infoDictionary];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 objectForKey:@"NSExtension" ofClass:v5 valuesOfClass:objc_opt_class()];

  id v7 = [v6 objectForKey:@"NSExtensionPrincipalClass"];
  Class v8 = NSClassFromString(v7);
  if (!v8)
  {
    __int16 v13 = [NSString stringWithFormat:@"Extension Info.plist does not define a principal class, or class was not found (expected class name: %@)", v7];
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[FPXExtensionContext principalClass]();
    }

    __assert_rtn("+[FPXExtensionContext principalClass]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 162, (const char *)[v13 UTF8String]);
  }
  id v9 = v8;

  return v9;
}

- (void)dealloc
{
  self->_isBeingDeallocated = 1;
  [(FPXExtensionContext *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FPXExtensionContext;
  [(FPXExtensionContext *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2->_domainContext;
  domainContext = v2->_domainContext;
  v2->_domainContext = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&v2->_xpcConnection);
  [WeakRetained invalidate];

  objc_sync_exit(v2);
  if (v3)
  {
    uint64_t v6 = [(FPXDomainContext *)v3 domain];
    id v7 = [v6 personaIdentifier];
    if (v7)
    {
      Class v8 = [(FPXDomainContext *)v3 domain];
      id v9 = [v8 personaIdentifier];
      BOOL v10 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v11 = [v10 currentPersona];
      uint64_t v12 = [v11 userPersonaUniqueString];
      char v13 = [v9 isEqualToString:v12];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = NSString;
        __int16 v15 = [MEMORY[0x1E4FB36F8] sharedManager];
        __int16 v16 = [v15 currentPersona];
        uint64_t v17 = [v16 userPersonaUniqueString];
        __int16 v18 = [MEMORY[0x1E4FB36F8] sharedManager];
        __int16 v19 = [v18 currentPersona];
        uint64_t v20 = [v19 uid];
        id v21 = [(FPXDomainContext *)v3 domain];
        __int16 v22 = [v21 personaIdentifier];
        id v23 = [v14 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v17, v20, v22];

        uint64_t v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          +[FPXExtensionContext principalClass]();
        }

        __assert_rtn("-[FPXExtensionContext invalidate]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 294, (const char *)[v23 UTF8String]);
      }
    }
    else
    {
    }
  }
  __int16 v25 = [(FPXDomainContext *)v3 spotlightIndexer];
  [v25 invalidateAsync];

  domainServicer = v2->_domainServicer;
  v2->_domainServicer = 0;

  __int16 v27 = v2;
  objc_sync_enter(v27);
  [(NSUserDefaults *)v27->_userDefaults removeObserver:v27 forKeyPath:@"NSFileProviderExtensionNonMaterializingProcessNames"];
  userDefaults = v27->_userDefaults;
  v27->_userDefaults = 0;

  objc_sync_exit(v27);
  if (v27->_isBeingDeallocated)
  {
    runningEnumerators = v27->_runningEnumerators;
    p_runningEnumerators = (void **)&v27->_runningEnumerators;
    __int16 v31 = [(NSHashTable *)runningEnumerators allObjects];
    id v32 = *p_runningEnumerators;
    *p_runningEnumerators = 0;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v33 = v31;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v41 != v35) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * i) _invalidate];
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v34);
    }

    [(FPXDomainContext *)v3 invalidate];
  }
  else
  {
    notificationQueue = v27->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__FPXExtensionContext_invalidate__block_invoke;
    block[3] = &unk_1E5AF0748;
    block[4] = v27;
    uint64_t v39 = v3;
    dispatch_async(notificationQueue, block);
  }
}

void __33__FPXExtensionContext_invalidate__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__FPXExtensionContext_invalidate__block_invoke_2;
  v7[3] = &unk_1E5AF0748;
  id v8 = v2;
  id v9 = *(id *)(a1 + 40);
  id v6 = v2;
  dispatch_async_and_wait(v5, v7);
}

uint64_t __33__FPXExtensionContext_invalidate__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "_invalidate", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) invalidate];
}

- (void)sendBlockedProcessNamesUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) arrayForKey:@"NSFileProviderExtensionNonMaterializingProcessNames"];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v2, "fp_filter:", &__block_literal_global_1);
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E5AF0790;
  id v10 = *(id *)(a1 + 40);
  uint64_t v5 = +[FPDaemonConnection remoteObjectProxyWithErrorHandler:v9];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 120);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E5AF0790;
  id v8 = *(id *)(a1 + 40);
  [v5 updateBlockedProcessNamesForProvider:v6 processNames:v4 completionHandler:v7];
}

uint64_t __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"NSFileProviderExtensionNonMaterializingProcessNames", a4, a5, a6))
  {
    [(FPXExtensionContext *)self sendBlockedProcessNamesUpdateWithCompletionHandler:&__block_literal_global_183];
  }
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__FPXExtensionContext_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke;
  v7[3] = &unk_1E5AF0800;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(FPXExtensionContext *)self sendBlockedProcessNamesUpdateWithCompletionHandler:v7];
}

void __82__FPXExtensionContext_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    long long v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPXExtensionContext forceUpdateBlockedProcessNamesFromDomain:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (id)v2Instance
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPXDomainContext *)v2->_domainContext v2Instance];
  objc_sync_exit(v2);

  return v3;
}

- (id)instanceWithPrivateSelector:(SEL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(FPXDomainContext *)v4->_domainContext instanceWithPrivateSelector:a3];
  objc_sync_exit(v4);

  return v5;
}

- (id)instanceForItemID:(id)a3
{
  id v3 = [(FPXExtensionContext *)self domainContextForItemID:a3];
  id v4 = [v3 vendorInstance];

  return v4;
}

- (id)domainContextForItemIDs:(id)a3
{
  id v4 = [a3 firstObject];
  id v5 = [(FPXExtensionContext *)self domainContextForItemID:v4];

  return v5;
}

- (void)_deleteIndexInDomainContexts:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v14 = a4;
  id v7 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  id v27 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        dispatch_group_enter(v7);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke;
        v19[3] = &unk_1E5AF0850;
        v19[4] = self;
        id v21 = v26;
        uint64_t v20 = v7;
        [v11 prepareForDomainRemovalWithCompletionHandler:v19];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke_3;
  block[3] = &unk_1E5AF0878;
  id v17 = v14;
  __int16 v18 = v26;
  id v13 = v14;
  dispatch_group_notify(v7, queue, block);

  _Block_object_dispose(v26, 8);
}

void __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke_2;
  block[3] = &unk_1E5AF0828;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v2);
  }
  id v3 = a1[5];

  dispatch_group_leave(v3);
}

uint64_t __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)dropDomainWithCompletionHandler:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9[0] = self->_domainContext;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FPXExtensionContext_dropDomainWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF0800;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FPXExtensionContext *)self _deleteIndexInDomainContexts:v5 completionHandler:v7];
}

void __55__FPXExtensionContext_dropDomainWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPXExtensionContext dropDomainWithCompletionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (void)didChangeItemID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = fpfs_adopt_log(self->_log);
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext didChangeItemID:completionHandler:]();
  }

  notificationQueue = self->_notificationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__FPXExtensionContext_didChangeItemID_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF08A0;
  id v10 = v6;
  id v13 = v10;
  __int16 v14 = self;
  id v11 = v7;
  id v15 = v11;
  fp_dispatch_async_with_logs(notificationQueue, v12);

  __fp_pop_log(&v16);
}

void __57__FPXExtensionContext_didChangeItemID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) identifier];
  int v3 = [v2 isEqualToString:@"NSFileProviderWorkingSetContainerItemIdentifier"];

  if (v3)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%@ shouldn't be here'", @"NSFileProviderWorkingSetContainerItemIdentifier"];
    id v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      +[FPXExtensionContext principalClass]();
    }

    __assert_rtn("-[FPXExtensionContext didChangeItemID:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 466, (const char *)[v16 UTF8String]);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 16));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)[*(id *)(*(void *)(a1 + 40) + 40) copy];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v9 = [*(id *)(a1 + 32) identifier];
        if ([v9 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
        {
        }
        else
        {
          id v10 = [v8 observedItemID];
          int v11 = [v10 isEqualToItemID:*(void *)(a1 + 32)];

          if (!v11) {
            continue;
          }
        }
        __int16 v12 = [v8 observer];
        [v12 enumerationResultsDidChange];

        char v5 = 1;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (!v4)
      {

        if (v5) {
          goto LABEL_19;
        }
        goto LABEL_16;
      }
    }
  }

LABEL_16:
  id v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v14;
    _os_log_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_INFO, "[PERF] Received observation update for item identifier %@, which isn't being observed. Ignoring.", buf, 0xCu);
  }

LABEL_19:
  __int16 v19 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
  id v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 48));
    __57__FPXExtensionContext_didChangeItemID_completionHandler___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v19);
}

- (void)startProvidingItemAtURL:(id)a3 readingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v21 = fpfs_adopt_log(self->_log);
  int v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v15 = objc_msgSend(v9, "fp_shortDescription");
    *(_DWORD *)buf = 138413058;
    long long v23 = self;
    __int16 v24 = 2080;
    uint64_t v25 = "-[FPXExtensionContext startProvidingItemAtURL:readingOptions:completionHandler:]";
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    __int16 v28 = 2048;
    unint64_t v29 = a4;
    _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, 0x%lx", buf, 0x2Au);
  }
  instanceQueue = self->_instanceQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke;
  v16[3] = &unk_1E5AF08F0;
  v16[4] = self;
  id v13 = v10;
  id v18 = v13;
  id v14 = v9;
  id v17 = v14;
  SEL v19 = a2;
  unint64_t v20 = a4;
  fp_dispatch_async_with_logs(instanceQueue, v16);

  __fp_pop_log(&v21);
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) v2Instance];
  if (v2)
  {
    int v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_cold_1(a1, (uint64_t)v2, v3);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v26) = 0;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_194;
    id v18 = &unk_1E5AF08C8;
    uint64_t v4 = *(void *)(a1 + 56);
    long long v22 = buf;
    uint64_t v23 = v4;
    char v5 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = v5;
    id v21 = *(id *)(a1 + 48);
    uint64_t v6 = (void *)MEMORY[0x1A6248B00](&v15);
    char v7 = objc_opt_respondsToSelector();
    uint64_t v8 = *(void *)(a1 + 40);
    if (v7) {
      objc_msgSend(v2, "startProvidingItemAtURL:readingOptions:completionHandler:", v8, *(void *)(a1 + 64), v6, v15, v16, v17, v18, v19, v20);
    }
    else {
      objc_msgSend(v2, "startProvidingItemAtURL:completionHandler:", v8, v6, v15, v16, v17, v18, v19, v20);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v24 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2080;
      __int16 v26 = "-[FPXExtensionContext startProvidingItemAtURL:readingOptions:completionHandler:]_block_invoke";
      __int16 v27 = 2112;
      __int16 v28 = v14;
      _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    __fp_pop_log(&v24);
  }
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_194(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    char v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = NSStringFromSelector(sel_startProvidingItemAtURL_completionHandler_);
    [v5 handleFailureInMethod:v6, v7, @"FPXExtensionContext.m", 509, @"completion for %@ has been called twice!", v8 object file lineNumber description];

    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v4 + 24) = 1;
  id v9 = fp_current_or_default_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v10) {
      __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_194_cold_2((uint64_t)v3, a1, v9);
    }

    int v11 = [v3 fp_strippedError];
  }
  else
  {
    if (v10) {
      __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_194_cold_1(a1, v9);
    }
    int v11 = 0;
    int v3 = v9;
  }

  id v18 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  __int16 v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = objc_msgSend(v11, "fp_annotatedErrorWithURL:variant:", *(void *)(a1 + 40), @"Open");
    *(_DWORD *)buf = 134218754;
    id v20 = v15;
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    __int16 v23 = 2080;
    __int16 v24 = "-[FPXExtensionContext startProvidingItemAtURL:readingOptions:completionHandler:]_block_invoke";
    __int16 v25 = 2112;
    __int16 v26 = v17;
    _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = objc_msgSend(v11, "fp_annotatedErrorWithURL:variant:", *(void *)(a1 + 40), @"Open");
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  __fp_pop_log(&v18);
}

- (void)evictItemAtURL:(id)a3 completionHandler:(id)a4
{
  v15[6] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15[0] = fpfs_adopt_log(self->_log);
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext evictItemAtURL:completionHandler:]();
  }

  instanceQueue = self->_instanceQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__FPXExtensionContext_evictItemAtURL_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF08A0;
  void v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v12);

  __fp_pop_log(v15);
}

void __56__FPXExtensionContext_evictItemAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)(a1 + 40);
  int v3 = [*(id *)(a1 + 32) domainContextForURL:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 instanceWithPrivateSelector:sel_evictItemWithIdentifier_completionHandler_];
  char v5 = [v4 persistentIdentifierForItemAtURL:*v2];
  uint64_t v6 = +[NSFileProviderExtension instanceMethodForSelector:sel_evictItemWithIdentifier_completionHandler_];
  if ([v4 methodForSelector:sel_evictItemWithIdentifier_completionHandler_] == v6)
  {
    [v4 stopProvidingItemAtURL:*(void *)(a1 + 40)];
    id v13 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v11 = *(void *)(a1 + 32);
      __int16 v12 = objc_msgSend(v3, "itemIDFromVendorItemID:", v5, v13);
      *(_DWORD *)buf = 134219010;
      id v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      uint64_t v22 = "-[FPXExtensionContext evictItemAtURL:completionHandler:]_block_invoke";
      __int16 v23 = 2112;
      __int16 v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = 0;
      _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [v3 itemIDFromVendorItemID:v5];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);

    __fp_pop_log(&v13);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__FPXExtensionContext_evictItemAtURL_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5AF0918;
    v14[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 48);
    id v15 = v3;
    [v4 evictItemWithIdentifier:v5 completionHandler:v14];
  }
}

void __56__FPXExtensionContext_evictItemAtURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v19 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v13 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v15 = *(void *)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    id v16 = [v5 itemIdentifier];
    id v17 = [v14 itemIDFromVendorItemID:v16];
    id v18 = [*(id *)(a1 + 40) internalErrorFromVendorError:v6 callerDescription:@"evictItemWithIdentifier"];
    *(_DWORD *)buf = 134219010;
    __int16 v21 = v13;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 2080;
    __int16 v25 = "-[FPXExtensionContext evictItemAtURL:completionHandler:]_block_invoke_2";
    __int16 v26 = 2112;
    id v27 = v17;
    __int16 v28 = 2112;
    uint64_t v29 = v18;
    _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  id v9 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = [v5 itemIdentifier];
  uint64_t v11 = [v9 itemIDFromVendorItemID:v10];
  __int16 v12 = [*(id *)(a1 + 40) internalErrorFromVendorError:v6 callerDescription:@"evictItemWithIdentifier"];
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v11, v12);

  __fp_pop_log(&v19);
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  v15[8] = *(void **)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:]();
  }

  __int16 v12 = objc_msgSend(v9, "fp_toDomainIdentifier");
  id v13 = [(FPXExtensionContext *)self createUserInteractionSuppressingWithDomainIdentifier:v12 withPurpose:@"UserCheckedSuppressionCheckbox"];
  [v13 setInteractionSuppressed:1 forIdentifier:v8];
  v15[0] = fpfs_adopt_log(self->_log);
  id v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(v10);
    -[FPXExtensionContext userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:]();
  }

  (*((void (**)(id, void))v10 + 2))(v10, 0);
  __fp_pop_log(v15);
}

- (id)createUserInteractionSuppressingWithDomainIdentifier:(id)a3 withPurpose:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(FPXExtensionContext *)self domainContextForIdentifier:v6];
    id v9 = [v8 vendorInstance];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 target];

        id v9 = v10;
      }
      if ([v9 conformsToProtocol:&unk_1EF6D31A8])
      {
        id v9 = v9;
        uint64_t v11 = v9;
        goto LABEL_18;
      }
      int v12 = [v7 isEqualToString:@"UserCheckedSuppressionCheckbox"];
      id v13 = fp_current_or_default_log();
      id v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:]();
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:].cold.4();
      }
    }
    else
    {
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:]();
      }
    }
  }
  else
  {
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:]();
    }
  }
  uint64_t v11 = 0;
LABEL_18:

  return v11;
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 domainIdentifier:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v36 = a4;
  id v34 = a6;
  long long v42 = fpfs_adopt_log(self->_log);
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:indexReason:completionHandler:]((uint64_t)self, [v37 count], (uint64_t)v43);
  }

  uint64_t v10 = [(FPXExtensionContext *)self domainContextForIdentifier:v36];
  uint64_t v11 = [v10 domain];
  int v12 = [v11 personaIdentifier];
  if (v12)
  {
    id v13 = [v10 domain];
    id v14 = [v13 personaIdentifier];
    uint64_t v15 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v16 = [v15 currentPersona];
    id v17 = [v16 userPersonaUniqueString];
    char v18 = [v14 isEqualToString:v17];

    if ((v18 & 1) == 0)
    {
      __int16 v19 = NSString;
      uint64_t v20 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v21 = [v20 currentPersona];
      __int16 v22 = [v21 userPersonaUniqueString];
      uint64_t v23 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v24 = [v23 currentPersona];
      uint64_t v25 = [v24 uid];
      __int16 v26 = [v10 domain];
      id v27 = [v26 personaIdentifier];
      __int16 v28 = [v19 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v22, v25, v27];

      uint64_t v29 = fp_current_or_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:indexReason:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 629, (const char *)[v28 UTF8String]);
    }
  }
  else
  {
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __122__FPXExtensionContext_deleteSearchableItemsWithSpotlightDomainIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke;
  v40[3] = &unk_1E5AF0940;
  id v30 = v36;
  id v41 = v30;
  __int16 v31 = objc_msgSend(v37, "fp_map:", v40);

  id v32 = [v10 spotlightIndexer];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __122__FPXExtensionContext_deleteSearchableItemsWithSpotlightDomainIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2;
  v38[3] = &unk_1E5AF0800;
  v38[4] = self;
  id v33 = v34;
  id v39 = v33;
  [v32 deleteSearchableItemsWithSpotlightDomainIdentifiers:v31 indexReason:a5 completionHandler:v38];

  __fp_pop_log(&v42);
}

uint64_t __122__FPXExtensionContext_deleteSearchableItemsWithSpotlightDomainIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stringByAppendingPathExtension:a2];
}

void __122__FPXExtensionContext_deleteSearchableItemsWithSpotlightDomainIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPXExtensionContext deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:indexReason:complet"
          "ionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (void)removeTrashedItemsOlderThanDate:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = fpfs_adopt_log(self->_log);
  uint64_t v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext removeTrashedItemsOlderThanDate:domainIdentifier:completionHandler:]();
  }

  instanceQueue = self->_instanceQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E5AF0968;
  v16[4] = self;
  id v13 = v9;
  id v17 = v13;
  id v14 = v8;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  fp_dispatch_async_with_logs(instanceQueue, v16);

  __fp_pop_log(&v20);
}

void __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  uint64_t v25 = [*(id *)(a1 + 32) domainContextForIdentifier:*(void *)(a1 + 40)];
  id v3 = [v25 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = [v25 domain];
    uint64_t v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = NSString;
      __int16 v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      id v18 = [v25 domain];
      id v19 = [v18 personaIdentifier];
      uint64_t v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      __int16 v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext removeTrashedItemsOlderThanDate:domainIdentifier:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 651, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  __int16 v22 = [*v2 instanceWithPrivateSelector:sel__removeTrashedItemsOlderThanDate_completionHandler_];
  if (v22)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_2;
    v27[3] = &unk_1E5AF07B8;
    v27[4] = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    [v22 _removeTrashedItemsOlderThanDate:v23 completionHandler:v27];
  }
  else
  {
    __int16 v26 = fpfs_adopt_log(*((void **)*v2 + 9));
    __int16 v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 56));
      __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log(&v26);
  }
}

void __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  v3[8] = *(void **)MEMORY[0x1E4F143B8];
  v3[0] = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(v3);
}

- (void)dumpInternalStateToTermDumper:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5AF0748;
  void block[4] = self;
  id v10 = v7;
  id v18 = v10;
  dispatch_sync(notificationQueue, block);
  [(FPDocumentAlternateContents *)self->_alternateContents dumpToDumper:v10];
  instanceQueue = self->_instanceQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5AF08A0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v8;
  id v12 = v8;
  id v13 = v10;
  fp_dispatch_async_with_logs(instanceQueue, v14);
}

void __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
  if ([v2 count])
  {
    objc_msgSend(*(id *)(a1 + 40), "write:", @"  + running enumerator (%ld):\n", objc_msgSend(v2, "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(a1 + 40) write:@"%15s- %@\n", "", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  else
  {
    [*(id *)(a1 + 40) put:@"  + running enumerator: none\n"];
  }
}

void __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_2(id *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 4;
  id v3 = [a1[4] instanceWithPrivateSelector:sel__dumpInternalStateToTermDumper_completionHandler_];
  if (v3)
  {
    [a1[5] put:@"\n"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_3;
    v7[3] = &unk_1E5AF0800;
    id v4 = a1[5];
    void v7[4] = a1[4];
    id v8 = a1[6];
    [v3 _dumpInternalStateToTermDumper:v4 completionHandler:v7];
  }
  else
  {
    uint64_t v6 = fpfs_adopt_log(*((void **)*v2 + 9));
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(a1[6]);
      __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_2_cold_1();
    }

    (*((void (**)(void))a1[6] + 2))();
    __fp_pop_log(&v6);
  }
}

void __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPXExtensionContext dumpInternalStateToTermDumper:domainIdentifier:completionHandler:]_block_invoke_3";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (void)itemChangedAtURL:(id)a3 completionHandler:(id)a4
{
  v15[6] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15[0] = fpfs_adopt_log(self->_log);
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext itemChangedAtURL:completionHandler:]();
  }

  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__FPXExtensionContext_itemChangedAtURL_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF0990;
  void v12[4] = self;
  id v10 = v7;
  id v14 = v10;
  id v11 = v6;
  id v13 = v11;
  fp_dispatch_async_with_logs(queue, v12);

  __fp_pop_log(v15);
}

void __58__FPXExtensionContext_itemChangedAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = (uint64_t *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) v2Instance];
  id v4 = v3;
  if (v3)
  {
    [v3 itemChangedAtURL:*(void *)(a1 + 40)];
    __int16 v12 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 48));
      __58__FPXExtensionContext_itemChangedAtURL_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __fp_pop_log(&v12);
  }
  else
  {
    __int16 v12 = fpfs_adopt_log(*(void **)(*v2 + 72));
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v10 = *v2;
      id v11 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      id v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      id v18 = "-[FPXExtensionContext itemChangedAtURL:completionHandler:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    __fp_pop_log(&v12);
  }
}

- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v22 = fpfs_adopt_log(self->_log);
  id v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = objc_msgSend(v8, "fp_shortDescription");
    __int16 v17 = objc_msgSend(v9, "fp_shortDescription");
    *(_DWORD *)buf = 138413058;
    __int16 v24 = self;
    __int16 v25 = 2080;
    __int16 v26 = "-[FPXExtensionContext movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:]";
    __int16 v27 = 2112;
    id v28 = v16;
    __int16 v29 = 2112;
    id v30 = v17;
    _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }
  instanceQueue = self->_instanceQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__FPXExtensionContext_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler___block_invoke;
  v18[3] = &unk_1E5AF0968;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  fp_dispatch_async_with_logs(instanceQueue, v18);

  __fp_pop_log(&v22);
}

void __93__FPXExtensionContext_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) instanceWithPrivateSelector:sel_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler_];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93__FPXExtensionContext_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AF09B8;
    void v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    [v2 movingItemAtURL:v3 requiresProvidingWithDestinationURL:v4 completionHandler:v12];
  }
  else
  {
    id v11 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v8 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = FPNotSupportedError();
      *(_DWORD *)buf = 134219010;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      id v19 = "-[FPXExtensionContext movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 0;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_debug_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);
    }
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);

    __fp_pop_log(&v11);
  }
}

void __93__FPXExtensionContext_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    id v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2080;
    id v15 = "-[FPXExtensionContext movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:]_block_invoke_2";
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v9);
}

- (id)fetchContentsForItemWithID:(id)a3 version:(id)a4 request:(id)a5 estimatedItemSize:(int64_t)a6 isSymlink:(BOOL)a7 extent:(id)a8 alignment:(unint64_t)a9 options:(unint64_t)a10 completionHandler:(id)a11
{
  BOOL v12 = a7;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v36 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a11;
  if (v20)
  {
    objc_msgSend(v20, "rangeValue", v36);
    a6 = v22;
  }
  if (a6 <= 1) {
    a6 = 1;
  }
  v49 = fpfs_adopt_log(self->_log);
  uint64_t v23 = fp_current_or_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413570;
    v51 = self;
    __int16 v52 = 2080;
    v53 = "-[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:"
          "options:completionHandler:]";
    __int16 v54 = 2112;
    id v55 = v18;
    __int16 v56 = 2048;
    int64_t v57 = a6;
    __int16 v58 = 1024;
    BOOL v59 = v12;
    __int16 v60 = 2112;
    id v61 = v19;
    _os_log_debug_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, estimated size=%lld, symlink=%{BOOL}d, %@", buf, 0x3Au);
  }

  uint64_t v24 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:a6];
  instanceQueue = self->_instanceQueue;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke;
  v37[3] = &unk_1E5AF0A80;
  v37[4] = self;
  id v26 = v18;
  id v38 = v26;
  id v27 = v19;
  id v39 = v27;
  id v28 = v21;
  id v43 = v28;
  SEL v44 = a2;
  BOOL v48 = v12;
  id v29 = v24;
  id v40 = v29;
  int64_t v45 = a6;
  id v30 = v20;
  id v41 = v30;
  id v31 = v36;
  id v42 = v31;
  unint64_t v46 = a9;
  unint64_t v47 = a10;
  fp_dispatch_async_with_logs(instanceQueue, v37);
  id v32 = fp_current_or_default_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:]((uint64_t)buf, [v29 totalUnitCount], v32);
  }

  id v33 = v42;
  id v34 = v29;

  __fp_pop_log(&v49);

  return v34;
}

void __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) domainContextForItemID:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = [v2 domain];
    uint64_t v6 = [v5 personaIdentifier];
    uint64_t v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v8 = [v7 currentPersona];
    uint64_t v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = NSString;
      BOOL v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v13 = [v12 currentPersona];
      __int16 v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      id v18 = [v2 domain];
      id v19 = [v18 personaIdentifier];
      id v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      id v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 806, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  [v2 vendorInstance];
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy_;
  v69[4] = __Block_byref_object_dispose_;
  id v70 = 0;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if ([v22 conformsToProtocol:&unk_1EF6EDEE0]) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_2;
  v62[3] = &unk_1E5AF09E0;
  id v24 = v2;
  id v63 = v24;
  id v25 = *(id *)(a1 + 48);
  uint64_t v26 = *(void *)(a1 + 32);
  id v64 = v25;
  uint64_t v65 = v26;
  id v27 = *(id *)(a1 + 80);
  uint64_t v28 = *(void *)(a1 + 88);
  id v66 = v27;
  v67 = v69;
  uint64_t v68 = v28;
  __int16 v54 = (void *)MEMORY[0x1A6248B00](v62);
  if (*(unsigned char *)(a1 + 120))
  {
    id v29 = [*(id *)(a1 + 40) identifier];
    uint64_t v30 = *(void *)(a1 + 48);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_256;
    v60[3] = &unk_1E5AF0A08;
    id v31 = v54;
    v60[4] = *(void *)(a1 + 32);
    id v61 = v31;
    id v32 = [v22 itemForIdentifier:v29 request:v30 completionHandler:v60];

    if (v32)
    {
      [*(id *)(a1 + 56) addChild:v32 withPendingUnitCount:*(void *)(a1 + 96)];
      objc_msgSend(*(id *)(a1 + 56), "setCancellable:", objc_msgSend(v32, "isCancellable"));
    }

    id v33 = &v61;
  }
  else
  {
    id v34 = *(void **)(a1 + 64);
    if (v34 && v23)
    {
      uint64_t v35 = [v34 rangeValue];
      uint64_t v37 = v36;
      uint64_t v38 = v35;
      uint64_t v39 = [*(id *)(a1 + 40) identifier];
      id v40 = [*(id *)(a1 + 72) versionRewritingBeforeFirstSync];
      uint64_t v52 = *(void *)(a1 + 48);
      uint64_t v53 = *(void *)(a1 + 104);
      id v41 = v24;
      uint64_t v42 = *(void *)(a1 + 112);
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_2_264;
      v57[3] = &unk_1E5AF0A30;
      v59[0] = v54;
      v59[2] = v38;
      v59[3] = v37;
      v59[4] = *(void *)(a1 + 104);
      id v58 = *(id *)(a1 + 40);
      v59[1] = v69;
      uint64_t v51 = v42;
      id v43 = (void *)v39;
      id v24 = v41;
      SEL v44 = objc_msgSend(v23, "fetchPartialContentsForItemWithIdentifier:version:request:minimalRange:aligningTo:options:completionHandler:", v39, v40, v52, v38, v37, v53, v51, v57);

      if (v44)
      {
        [*(id *)(a1 + 56) addChild:v44 withPendingUnitCount:*(void *)(a1 + 96)];
        objc_msgSend(*(id *)(a1 + 56), "setCancellable:", objc_msgSend(v44, "isCancellable"));
      }

      id v33 = (id *)v59;
    }
    else
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_3;
      v55[3] = &unk_1E5AF0A58;
      id v56 = v54;
      int64_t v45 = (void *)MEMORY[0x1A6248B00](v55);
      uint64_t v46 = *(void *)(a1 + 112);
      unint64_t v47 = [*(id *)(a1 + 40) identifier];
      if (v46) {
        uint64_t v48 = *(void *)(a1 + 72);
      }
      else {
        uint64_t v48 = 0;
      }
      v49 = [v22 fetchContentsForItemWithIdentifier:v47 version:v48 request:*(void *)(a1 + 48) completionHandler:v45];

      if (v49)
      {
        [*(id *)(a1 + 56) addChild:v49 withPendingUnitCount:*(void *)(a1 + 96)];
        objc_msgSend(*(id *)(a1 + 56), "setCancellable:", objc_msgSend(v49, "isCancellable"));
      }
      v50 = fp_current_or_default_log();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        -[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:]((uint64_t)v71, [*(id *)(a1 + 56) totalUnitCount], v50);
      }

      id v33 = &v56;
    }
  }

  _Block_object_dispose(v69, 8);
}

void __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = a5;
  __int16 v14 = [v11 currentResponseWithRequest:v12];
  id v15 = [*(id *)(a1 + 32) internalErrorFromVendorError:v13 callerDescription:@"fetchContentsForItemWithID"];

  if (v15)
  {
    uint64_t v35 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 48) + 72));
    __int16 v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v29 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      uint64_t v30 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134220034;
      uint64_t v37 = v29;
      __int16 v38 = 2112;
      uint64_t v39 = v30;
      __int16 v40 = 2080;
      id v41 = "-[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignmen"
            "t:options:completionHandler:]_block_invoke_2";
      __int16 v42 = 2112;
      id v43 = 0;
      __int16 v44 = 2112;
      int64_t v45 = 0;
      __int16 v46 = 2112;
      unint64_t v47 = v14;
      __int16 v48 = 2112;
      uint64_t v49 = 0;
      __int16 v50 = 2048;
      uint64_t v51 = a4;
      __int16 v52 = 2112;
      id v53 = v15;
      _os_log_debug_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %lu, %@", buf, 0x5Cu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log(&v35);

    goto LABEL_13;
  }
  if (v10)
  {
    if (!v9) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = *(void *)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 48);
    id v20 = NSStringFromSelector(sel_fetchContentsForItemWithIdentifier_version_completionHandler_);
    [v17 handleFailureInMethod:v18, v19, @"FPXExtensionContext.m", 823, @"Call to %@ returned no item but no error", v20 object file lineNumber description];

    if (!v9)
    {
LABEL_9:
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = *(void *)(a1 + 72);
      uint64_t v23 = *(void *)(a1 + 48);
      id v24 = NSStringFromSelector(sel_fetchContentsForItemWithIdentifier_version_completionHandler_);
      [v21 handleFailureInMethod:v22, v23, @"FPXExtensionContext.m", 824, @"Call to %@ returned no contents but no error", v24 object file lineNumber description];
    }
  }
  id v34 = 0;
  id v25 = +[FPSandboxingURLWrapper wrapperWithURL:v9 readonly:0 error:&v34];
  id v26 = v34;
  id v27 = [*(id *)(a1 + 32) itemFromVendorItem:v10];
  uint64_t v35 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 48) + 72));
  uint64_t v28 = fp_current_or_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    id v31 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    uint64_t v32 = *(void *)(a1 + 48);
    uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 134220034;
    uint64_t v37 = v31;
    __int16 v38 = 2112;
    uint64_t v39 = v32;
    __int16 v40 = 2080;
    id v41 = "-[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:"
          "options:completionHandler:]_block_invoke";
    __int16 v42 = 2112;
    id v43 = v25;
    __int16 v44 = 2112;
    int64_t v45 = v27;
    __int16 v46 = 2112;
    unint64_t v47 = v14;
    __int16 v48 = 2112;
    uint64_t v49 = v33;
    __int16 v50 = 2048;
    uint64_t v51 = a4;
    __int16 v52 = 2112;
    id v53 = v26;
    _os_log_debug_impl(&dword_1A33AE000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %lu, %@", buf, 0x5Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  __fp_pop_log(&v35);

LABEL_13:
}

void __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_256(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v5 contentType];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F442D8];
      id v10 = [v5 typeIdentifier];
      uint64_t v8 = objc_msgSend(v9, "fp_cachedTypeWithIdentifier:", v10);
    }
    if ([v8 conformsToType:*MEMORY[0x1E4F444D8]]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v11 = *(void **)(a1 + 32);
      id v23 = 0;
      uint64_t v12 = [v11 createFPTempDirectoryWithError:&v23];
      id v13 = v23;
      if (v12)
      {
        __int16 v14 = [MEMORY[0x1E4F29128] UUID];
        id v15 = [v14 UUIDString];
        __int16 v16 = [v12 URLByAppendingPathComponent:v15];

        uint64_t v17 = [v5 symlinkTargetPath];
        if ([v17 length]) {
          uint64_t v18 = (const char *)[v17 fileSystemRepresentation];
        }
        else {
          uint64_t v18 = "";
        }
        id v21 = v16;
        if (symlink(v18, (const char *)[v21 fileSystemRepresentation]))
        {
          uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
          uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v22 removeItemAtURL:v21 error:0];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          uint64_t v7 = 0;
        }
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v19 = *(void *)(a1 + 40);
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void *))(v19 + 16))(v19, 0, 0, 0, v20);

      uint64_t v7 = 0;
    }
  }
}

void __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_2_264(uint64_t a1, void *a2, void *a3, unint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  id v26 = a2;
  id v12 = a3;
  id v13 = v12;
  if (a7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    __int16 v14 = [v12 documentSize];
    uint64_t v15 = [v14 longLongValue];
    unint64_t v16 = *(void *)(a1 + 56);
    if (a4 > v16) {
      goto LABEL_8;
    }
    int64_t v17 = a4 + a5;
    uint64_t v18 = *(void *)(a1 + 64) + v16;
    if (v18 >= v15) {
      uint64_t v18 = v15;
    }
    if (v17 < v18 || (unint64_t v19 = *(void *)(a1 + 72), a4 % v19) || v17 != v15 && a5 % v19)
    {
LABEL_8:
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
      char v21 = 0;
    }
    else
    {
      id v20 = 0;
      char v21 = 1;
    }
    id v22 = v20;

    if (v21)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a4, a5);
      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
      id v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      __FILEPROVIDER_BAD_EXTENT__(*(void **)(a1 + 32), a4, a5);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchContentsForItemWithID:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 request:(id)a7 estimatedItemSize:(int64_t)a8 isSymlink:(BOOL)a9 completionHandler:(id)a10
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v49 = a4;
  id v47 = a5;
  id v48 = a6;
  id v52 = a7;
  id v50 = a10;
  uint64_t v51 = v16;
  id v53 = [(FPXExtensionContext *)self domainContextForItemID:v16];
  int64_t v17 = [v53 domain];
  uint64_t v18 = [v17 personaIdentifier];
  if (v18)
  {
    unint64_t v19 = [v53 domain];
    id v20 = [v19 personaIdentifier];
    char v21 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v22 = [v21 currentPersona];
    uint64_t v23 = [v22 userPersonaUniqueString];
    char v24 = [v20 isEqualToString:v23];

    if ((v24 & 1) == 0)
    {
      id v25 = NSString;
      id v26 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v27 = [v26 currentPersona];
      uint64_t v28 = [v27 userPersonaUniqueString];
      id v29 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v30 = [v29 currentPersona];
      uint64_t v31 = [v30 uid];
      uint64_t v32 = [v53 domain];
      uint64_t v33 = [v32 personaIdentifier];
      id v34 = [v25 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v28, v31, v33];

      uint64_t v35 = fp_current_or_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:request:estimatedItemSize:isSymlink:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 952, (const char *)[v34 UTF8String]);
    }
  }
  else
  {
  }
  id v36 = [v53 vendorInstance];
  if ([v36 conformsToProtocol:&unk_1EF6D2EE8]) {
    id v37 = v36;
  }
  else {
    id v37 = 0;
  }

  if (v37)
  {
    if (a8 <= 1) {
      int64_t v38 = 1;
    }
    else {
      int64_t v38 = a8;
    }
    v67 = fpfs_adopt_log(self->_log);
    uint64_t v39 = fp_current_or_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      v71 = self;
      __int16 v72 = 2080;
      v73 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:request:"
            "estimatedItemSize:isSymlink:completionHandler:]";
      __int16 v74 = 2112;
      v75 = v51;
      __int16 v76 = 2048;
      int64_t v77 = v38;
      __int16 v78 = 2112;
      id v79 = v52;
      _os_log_debug_impl(&dword_1A33AE000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, estimated size=%lld, %@", buf, 0x34u);
    }

    __int16 v40 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v38];
    instanceQueue = self->_instanceQueue;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke_273;
    v54[3] = &unk_1E5AF0AF8;
    id v55 = v47;
    id v56 = v53;
    id v57 = v52;
    id v58 = self;
    id v64 = v50;
    SEL v65 = a2;
    id v59 = v37;
    id v60 = v51;
    id v61 = v49;
    id v62 = v48;
    id v42 = v40;
    id v63 = v42;
    int64_t v66 = v38;
    fp_dispatch_async_with_logs(instanceQueue, v54);
    id v43 = v63;
    id v44 = v42;

    __fp_pop_log(&v67);
  }
  else
  {
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke;
    v68[3] = &unk_1E5AF0AA8;
    id v69 = v50;
    id v44 = [(FPXExtensionContext *)self fetchContentsForItemWithID:v51 version:v49 request:v52 estimatedItemSize:a8 isSymlink:a9 extent:0 alignment:0 options:0 completionHandler:v68];
  }

  return v44;
}

uint64_t __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke_273(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) url];
  char v3 = [v2 startAccessingSecurityScopedResource];
  id v36 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C5A0];
  id v35 = 0;
  char v5 = [v2 getResourceValue:&v36 forKey:v4 error:&v35];
  id v6 = v36;
  id v7 = v35;
  if (v5)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke_274;
    char v24 = &unk_1E5AF0AD0;
    id v25 = *(id *)(a1 + 40);
    id v26 = *(id *)(a1 + 48);
    char v33 = v3;
    id v8 = v2;
    uint64_t v9 = *(void *)(a1 + 56);
    id v27 = v8;
    uint64_t v28 = v9;
    id v10 = *(id *)(a1 + 104);
    uint64_t v11 = *(void *)(a1 + 112);
    id v31 = v10;
    uint64_t v32 = v11;
    id v29 = v6;
    id v30 = *(id *)(a1 + 32);
    id v12 = (void *)MEMORY[0x1A6248B00](&v21);
    id v13 = *(void **)(a1 + 64);
    __int16 v14 = objc_msgSend(*(id *)(a1 + 72), "identifier", v21, v22, v23, v24);
    uint64_t v15 = [*(id *)(a1 + 80) versionRewritingBeforeFirstSync];
    id v16 = [v13 fetchContentsForItemWithIdentifier:v14 version:v15 usingExistingContentsAtURL:v8 existingVersion:*(void *)(a1 + 88) request:*(void *)(a1 + 48) completionHandler:v12];

    if (v16) {
      [*(id *)(a1 + 96) addChild:v16 withPendingUnitCount:*(void *)(a1 + 120)];
    }

    int64_t v17 = v25;
  }
  else
  {
    int64_t v17 = [*(id *)(a1 + 40) currentResponseWithRequest:*(void *)(a1 + 48)];
    id v34 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 56) + 72));
    uint64_t v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v19 = FPPopLogSectionForBlock(*(void **)(a1 + 104));
      uint64_t v20 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134219778;
      int64_t v38 = v19;
      __int16 v39 = 2112;
      uint64_t v40 = v20;
      __int16 v41 = 2080;
      id v42 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:request:"
            "estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      uint64_t v46 = 0;
      __int16 v47 = 2112;
      id v48 = v17;
      __int16 v49 = 2048;
      uint64_t v50 = 0;
      __int16 v51 = 2112;
      id v52 = v7;
      _os_log_debug_impl(&dword_1A33AE000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
    }

    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    __fp_pop_log(&v34);
  }
}

void __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke_274(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) currentResponseWithRequest:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 96)) {
    [*(id *)(a1 + 48) stopAccessingSecurityScopedResource];
  }
  if (v9)
  {
    id v11 = [*(id *)(a1 + 32) internalErrorFromVendorError:v9 callerDescription:@"fetchContentsForItemWithIDIncremental"];

    id v42 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 56) + 72));
    id v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v30 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
      uint64_t v31 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134219778;
      uint64_t v44 = v30;
      __int16 v45 = 2112;
      uint64_t v46 = v31;
      __int16 v47 = 2080;
      id v48 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:request:"
            "estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
      __int16 v49 = 2112;
      uint64_t v50 = 0;
      __int16 v51 = 2112;
      id v52 = 0;
      __int16 v53 = 2112;
      uint64_t v54 = v10;
      __int16 v55 = 2048;
      uint64_t v56 = 0;
      __int16 v57 = 2112;
      id v58 = v11;
      _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    __fp_pop_log(&v42);
  }
  else
  {
    id v41 = 0;
    uint64_t v13 = *MEMORY[0x1E4F1C5A0];
    id v40 = 0;
    char v14 = [v7 getResourceValue:&v41 forKey:v13 error:&v40];
    id v15 = v41;
    id v11 = v40;
    if (v14)
    {
      if (!v8)
      {
        id v16 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v17 = *(void *)(a1 + 88);
        uint64_t v18 = *(void *)(a1 + 56);
        unint64_t v19 = NSStringFromSelector(sel_fetchContentsForItemWithIdentifier_version_usingExistingContentsAtURL_existingVersion_completionHandler_);
        [v16 handleFailureInMethod:v17, v18, @"FPXExtensionContext.m", 1017, @"Call to %@ returned no item but no error", v19 object file lineNumber description];
      }
      if (!v7)
      {
        uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v21 = *(void *)(a1 + 88);
        uint64_t v22 = *(void *)(a1 + 56);
        uint64_t v23 = NSStringFromSelector(sel_fetchContentsForItemWithIdentifier_version_usingExistingContentsAtURL_existingVersion_completionHandler_);
        [v20 handleFailureInMethod:v21, v22, @"FPXExtensionContext.m", 1018, @"Call to %@ returned no contents but no error", v23 object file lineNumber description];
      }
      char v24 = [*(id *)(a1 + 32) itemFromVendorItem:v8];
      if ([v15 isEqual:*(void *)(a1 + 64)])
      {
        id v42 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 56) + 72));
        id v25 = fp_current_or_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          id v34 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
          uint64_t v35 = *(void *)(a1 + 56);
          id v36 = *(void **)(a1 + 72);
          *(_DWORD *)buf = 134219778;
          uint64_t v44 = v34;
          __int16 v45 = 2112;
          uint64_t v46 = v35;
          __int16 v47 = 2080;
          id v48 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:requ"
                "est:estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
          __int16 v49 = 2112;
          uint64_t v50 = v36;
          __int16 v51 = 2112;
          id v52 = v24;
          __int16 v53 = 2112;
          uint64_t v54 = v10;
          __int16 v55 = 2048;
          uint64_t v56 = 0;
          __int16 v57 = 2112;
          id v58 = 0;
          _os_log_debug_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
        }

        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
        __fp_pop_log(&v42);
      }
      else
      {
        id v39 = v11;
        id v27 = +[FPSandboxingURLWrapper wrapperWithURL:v7 readonly:0 error:&v39];
        id v28 = v39;

        id v42 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 56) + 72));
        id v29 = fp_current_or_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          id v37 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
          uint64_t v38 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 134219778;
          uint64_t v44 = v37;
          __int16 v45 = 2112;
          uint64_t v46 = v38;
          __int16 v47 = 2080;
          id v48 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:requ"
                "est:estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
          __int16 v49 = 2112;
          uint64_t v50 = v27;
          __int16 v51 = 2112;
          id v52 = v24;
          __int16 v53 = 2112;
          uint64_t v54 = v10;
          __int16 v55 = 2048;
          uint64_t v56 = 0;
          __int16 v57 = 2112;
          id v58 = v28;
          _os_log_debug_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
        }

        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
        __fp_pop_log(&v42);

        id v11 = v28;
      }
    }
    else
    {
      id v42 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 56) + 72));
      id v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
        uint64_t v33 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134219778;
        uint64_t v44 = v32;
        __int16 v45 = 2112;
        uint64_t v46 = v33;
        __int16 v47 = 2080;
        id v48 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:reques"
              "t:estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
        __int16 v49 = 2112;
        uint64_t v50 = 0;
        __int16 v51 = 2112;
        id v52 = 0;
        __int16 v53 = 2112;
        uint64_t v54 = v10;
        __int16 v55 = 2048;
        uint64_t v56 = 0;
        __int16 v57 = 2112;
        id v58 = v11;
        _os_log_debug_impl(&dword_1A33AE000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
      }

      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      __fp_pop_log(&v42);
    }
  }
}

- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  uint64_t v46 = fpfs_adopt_log(self->_log);
  unint64_t v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    id v48 = self;
    __int16 v49 = 2080;
    uint64_t v50 = "-[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]";
    __int16 v51 = 2112;
    id v52 = v14;
    __int16 v53 = 1024;
    int v54 = a5;
    __int16 v55 = 1024;
    int v56 = a7;
    __int16 v57 = 2112;
    id v58 = v16;
    __int16 v59 = 2112;
    id v60 = v17;
    _os_log_debug_impl(&dword_1A33AE000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@ fields=%x options=%x contentURL=%@ %@", buf, 0x40u);
  }

  if (v16)
  {
    uint64_t v20 = [v14 documentSize];
    uint64_t v21 = [v20 longLongValue];

    if (v21 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v21;
    }
  }
  else
  {
    uint64_t v22 = 100;
  }
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", v22, a7);
  instanceQueue = self->_instanceQueue;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __103__FPXExtensionContext_modifyItem_baseVersion_changedFields_contents_options_request_completionHandler___block_invoke;
  v36[3] = &unk_1E5AF0B48;
  v36[4] = self;
  id v25 = v14;
  id v37 = v25;
  id v26 = v16;
  id v38 = v26;
  id v27 = v17;
  id v39 = v27;
  id v28 = v18;
  id v42 = v28;
  id v29 = v15;
  id v40 = v29;
  unint64_t v43 = a5;
  uint64_t v44 = v35;
  id v30 = v23;
  id v41 = v30;
  uint64_t v45 = v22;
  fp_dispatch_async_with_logs(instanceQueue, v36);
  uint64_t v31 = v41;
  id v32 = v30;

  __fp_pop_log(&v46);

  return v32;
}

void __103__FPXExtensionContext_modifyItem_baseVersion_changedFields_contents_options_request_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) itemID];
  uint64_t v45 = [v2 domainContextForItemID:v3];

  uint64_t v4 = [v45 domain];
  char v5 = [v4 personaIdentifier];
  if (v5)
  {
    id v6 = [v45 domain];
    id v7 = [v6 personaIdentifier];
    id v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v9 = [v8 currentPersona];
    id v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = NSString;
      uint64_t v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v14 = [v13 currentPersona];
      id v15 = [v14 userPersonaUniqueString];
      id v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      unint64_t v19 = [v45 domain];
      uint64_t v20 = [v19 personaIdentifier];
      uint64_t v21 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v20];

      uint64_t v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1071, (const char *)[v21 UTF8String]);
    }
  }
  else
  {
  }
  uint64_t v23 = [v45 vendorInstance];
  char v24 = [*(id *)(a1 + 48) url];
  [v24 startAccessingSecurityScopedResource];
  id v25 = *(void **)(a1 + 32);
  uint64_t v26 = *(void *)(a1 + 40);
  id v53 = 0;
  id v54 = v24;
  char v27 = [v25 _inlineSymlinkTarget:v26 url:&v54 error:&v53];
  id v28 = v54;

  id v29 = v53;
  if (v27)
  {
    uint64_t v44 = *(void *)(a1 + 40);
    id v30 = [*(id *)(a1 + 64) versionRewritingBeforeFirstSync];
    uint64_t v31 = *(void *)(a1 + 88);
    uint64_t v32 = *(void *)(a1 + 96);
    uint64_t v33 = *(void *)(a1 + 56);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __103__FPXExtensionContext_modifyItem_baseVersion_changedFields_contents_options_request_completionHandler___block_invoke_280;
    v46[3] = &unk_1E5AF0B20;
    id v34 = v29;
    id v35 = v28;
    id v36 = v28;
    uint64_t v37 = *(void *)(a1 + 32);
    id v47 = v36;
    uint64_t v48 = v37;
    id v49 = v45;
    id v50 = *(id *)(a1 + 56);
    id v51 = *(id *)(a1 + 80);
    id v38 = v36;
    id v28 = v35;
    id v29 = v34;
    id v39 = [v23 modifyItem:v44 baseVersion:v30 changedFields:v31 contents:v38 options:v32 request:v33 completionHandler:v46];

    if (v39) {
      [*(id *)(a1 + 72) addChild:v39 withPendingUnitCount:*(void *)(a1 + 104)];
    }

    id v40 = v47;
  }
  else
  {
    id v40 = [v45 currentResponseWithRequest:*(void *)(a1 + 56)];
    id v52 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v41 = fp_current_or_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      id v42 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
      uint64_t v43 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219778;
      int v56 = v42;
      __int16 v57 = 2112;
      uint64_t v58 = v43;
      __int16 v59 = 2080;
      id v60 = "-[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]_block_invoke";
      __int16 v61 = 2112;
      uint64_t v62 = 0;
      __int16 v63 = 1024;
      int v64 = 0;
      __int16 v65 = 1024;
      int v66 = 0;
      __int16 v67 = 2112;
      uint64_t v68 = v40;
      __int16 v69 = 2112;
      id v70 = v29;
      _os_log_debug_impl(&dword_1A33AE000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, 0x%x, %{BOOL}d, %@, %@", buf, 0x4Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    __fp_pop_log(&v52);
  }
}

void __103__FPXExtensionContext_modifyItem_baseVersion_changedFields_contents_options_request_completionHandler___block_invoke_280(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = *(void **)(a1 + 32);
  id v11 = a5;
  [v10 stopAccessingSecurityScopedResource];
  id v12 = [*(id *)(a1 + 48) itemFromVendorItem:v9];
  uint64_t v13 = [*(id *)(a1 + 48) currentResponseWithRequest:*(void *)(a1 + 56)];
  id v14 = [*(id *)(a1 + 48) internalErrorFromVendorError:v11 callerDescription:@"modifyItem"];

  uint64_t v18 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
  id v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134219778;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v17;
    __int16 v23 = 2080;
    char v24 = "-[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    __int16 v27 = 2048;
    uint64_t v28 = a3;
    __int16 v29 = 1024;
    int v30 = a4;
    __int16 v31 = 2112;
    uint64_t v32 = v13;
    __int16 v33 = 2112;
    id v34 = v14;
    _os_log_debug_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, 0x%lx, %{BOOL}d, %@, %@", buf, 0x4Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  __fp_pop_log(&v18);
}

- (void)singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = +[NSFileProviderRequest requestFromTheSystem];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__FPXExtensionContext_singleItemChange_changedFields_bounce_completionHandler___block_invoke;
  v14[3] = &unk_1E5AF0B98;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [(FPXExtensionContext *)self _singleItemChange:v11 changedFields:a4 bounce:v6 bounceIndex:1 request:v12 completionHandler:v14];
}

void __79__FPXExtensionContext_singleItemChange_changedFields_bounce_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v27[0] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__FPXExtensionContext_singleItemChange_changedFields_bounce_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5AF0B70;
    v13[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    id v14 = v5;
    id v15 = v6;
    [v7 _indexOutOfBandUpdatedItems:v8 deletedItems:MEMORY[0x1E4F1CBF0] indexReason:1 completionHandler:v13];
  }
  else
  {
    id v12 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      uint64_t v22 = "-[FPXExtensionContext singleItemChange:changedFields:bounce:completionHandler:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v12);
  }
}

void __79__FPXExtensionContext_singleItemChange_changedFields_bounce_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    char v3 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134219010;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2080;
    id v13 = "-[FPXExtensionContext singleItemChange:changedFields:bounce:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_debug_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  __fp_pop_log(&v7);
}

- (void)_singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 bounceIndex:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  instanceQueue = self->_instanceQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke;
  v21[3] = &unk_1E5AF0C10;
  v21[4] = self;
  id v22 = v14;
  unint64_t v25 = a4;
  unint64_t v26 = a6;
  BOOL v27 = a5;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  fp_dispatch_async_with_logs(instanceQueue, v21);
}

void __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) itemID];
  uint64_t v4 = [v2 domainContextForItemID:v3];

  uint64_t v5 = [v4 domain];
  uint64_t v6 = [v5 personaIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v4 domain];
    id v9 = [v8 personaIdentifier];
    __int16 v10 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v11 = [v10 currentPersona];
    __int16 v12 = [v11 userPersonaUniqueString];
    char v13 = [v9 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      id v14 = NSString;
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v16 = [v15 currentPersona];
      uint64_t v17 = [v16 userPersonaUniqueString];
      id v18 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v19 = [v18 currentPersona];
      uint64_t v20 = [v19 uid];
      __int16 v21 = [v4 domain];
      id v22 = [v21 personaIdentifier];
      id v23 = [v14 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v17, v20, v22];

      id v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext _singleItemChange:changedFields:bounce:bounceIndex:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1147, (const char *)[v23 UTF8String]);
    }
  }
  else
  {
  }
  unint64_t v25 = [v4 vendorInstance];
  id v26 = *(id *)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) >= 2uLL)
  {
    uint64_t v28 = (void *)[*(id *)(a1 + 40) copy];

    __int16 v29 = [*(id *)(a1 + 40) filename];
    int v30 = objc_msgSend(v29, "fp_bouncedNameWithIndex:isDir:", *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "isFolder"));
    [v28 setFilename:v30];

    v27 |= 2uLL;
    id v26 = v28;
  }
  __int16 v31 = [*(id *)(a1 + 40) itemVersion];
  uint64_t v32 = *(void **)(a1 + 40);
  uint64_t v33 = *(void *)(a1 + 48);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_2;
  v36[3] = &unk_1E5AF0BE8;
  v36[4] = *(void *)(a1 + 32);
  id v37 = v4;
  char v42 = *(unsigned char *)(a1 + 80);
  id v38 = v32;
  long long v41 = *(_OWORD *)(a1 + 64);
  id v39 = *(id *)(a1 + 48);
  id v40 = *(id *)(a1 + 56);
  id v34 = v4;
  id v35 = (id)[v25 modifyItem:v26 baseVersion:v31 changedFields:v27 contents:0 options:0x10000 request:v33 completionHandler:v36];
}

void __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_3;
  v13[3] = &unk_1E5AF0BC0;
  id v14 = *(id *)(a1 + 40);
  id v15 = v8;
  char v22 = *(unsigned char *)(a1 + 88);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(id *)(a1 + 48);
  long long v21 = *(_OWORD *)(a1 + 72);
  id v18 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v19 = v7;
  id v20 = v10;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalErrorFromVendorError:*(void *)(a1 + 40) callerDescription:@"singleItemChange"];
  char v3 = v2;
  if (*(unsigned char *)(a1 + 104)
    && (objc_msgSend(v2, "fp_userInfoItem"), uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_3_cold_1();
    }

    [*(id *)(a1 + 48) _singleItemChange:*(void *)(a1 + 56) changedFields:*(void *)(a1 + 88) bounce:*(unsigned __int8 *)(a1 + 104) bounceIndex:*(void *)(a1 + 96) + 1 request:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 80)];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 80);
    id v7 = [*(id *)(a1 + 32) itemFromVendorItem:*(void *)(a1 + 72)];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v3);
  }
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 completionHandler:(id)a5
{
  v19[8] = *(void **)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 firstObject];
  id v11 = v10;
  if (v10)
  {
    instanceQueue = self->_instanceQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke;
    v14[3] = &unk_1E5AF0CB0;
    v14[4] = self;
    id v15 = v10;
    id v16 = v8;
    unint64_t v18 = a4;
    id v17 = v9;
    fp_dispatch_async_with_logs(instanceQueue, v14);
  }
  else
  {
    v19[0] = fpfs_adopt_log(self->_log);
    char v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(v9);
      -[FPXExtensionContext bulkItemChanges:changedFields:completionHandler:]();
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    __fp_pop_log(v19);
  }
}

void __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) itemID];
  id v39 = [v1 domainContextForItemID:v2];

  char v3 = [v39 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    uint64_t v5 = [v39 domain];
    uint64_t v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = NSString;
      id v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      char v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      unint64_t v18 = [v39 domain];
      id v19 = [v18 personaIdentifier];
      id v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      long long v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext bulkItemChanges:changedFields:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1202, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  id v37 = [v39 vendorInstance];
  char v22 = dispatch_group_create();
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy_;
  void v57[4] = __Block_byref_object_dispose_;
  id v58 = 0;
  id v58 = (id)objc_opt_new();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy_;
  void v55[4] = __Block_byref_object_dispose_;
  id v56 = 0;
  id v56 = (id)objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v40)
  {
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        unint64_t v25 = (void *)MEMORY[0x1A6248870]();
        dispatch_group_enter(v22);
        id v26 = [v24 itemIdentifier];
        uint64_t v27 = [v24 itemVersion];
        uint64_t v28 = [v27 versionRewritingBeforeFirstSync];
        uint64_t v29 = *(void *)(a1 + 64);
        int v30 = +[NSFileProviderRequest requestFromTheSystem];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_2;
        v45[3] = &unk_1E5AF0C38;
        id v46 = v39;
        id v47 = v22;
        id v49 = v57;
        id v31 = v26;
        id v48 = v31;
        id v50 = v55;
        id v32 = (id)[v37 modifyItem:v24 baseVersion:v28 changedFields:v29 contents:0 options:0x10000 request:v30 completionHandler:v45];
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v40);
  }

  uint64_t v33 = *(void *)(a1 + 32);
  id v34 = *(NSObject **)(v33 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_3;
  block[3] = &unk_1E5AF0C88;
  void block[4] = v33;
  uint64_t v43 = v57;
  id v42 = *(id *)(a1 + 56);
  uint64_t v44 = v55;
  dispatch_group_notify(v22, v34, block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
}

void __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v11 = a2;
  id v7 = a5;
  id v8 = [*(id *)(a1 + 32) itemFromVendorItem:v11];
  id v9 = [*(id *)(a1 + 32) internalErrorFromVendorError:v7 callerDescription:@"bulkItemChanges"];
  id v10 = *(id *)(a1 + 40);
  objc_sync_enter(v10);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v8 forKeyedSubscript:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v9 forKeyedSubscript:*(void *)(a1 + 48)];
  objc_sync_exit(v10);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_3(int8x16_t *a1)
{
  id v2 = (void *)a1[2].i64[0];
  char v3 = [*(id *)(*(void *)(a1[3].i64[0] + 8) + 40) allValues];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_4;
  v5[3] = &unk_1E5AF0C60;
  uint64_t v4 = (void *)a1[2].i64[1];
  v5[4] = a1[2].i64[0];
  id v6 = v4;
  int8x16_t v7 = vextq_s8(a1[3], a1[3], 8uLL);
  [v2 _indexOutOfBandUpdatedItems:v3 deletedItems:MEMORY[0x1E4F1CBF0] indexReason:1 completionHandler:v5];
}

void __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v6 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v7 = *(void *)(a1 + 32);
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    else {
      uint64_t v9 = 0;
    }
    *(_DWORD *)buf = 134219010;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2080;
    id v16 = "-[FPXExtensionContext bulkItemChanges:changedFields:completionHandler:]_block_invoke_4";
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_debug_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  else {
    uint64_t v5 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v3 + 16))(v3, v4, v5, 0);
  __fp_pop_log(&v10);
}

- (void)dropIndexForDomain:(id)a3 dropReason:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v6 = a5;
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v37;
    _os_log_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] fileproviderd ask us to drop index for %@", buf, 0xCu);
  }

  uint64_t v8 = [(FPXExtensionContext *)self domainContextForIdentifier:v37];
  uint64_t v9 = [v8 domain];
  id v10 = [v9 personaIdentifier];
  if (v10)
  {
    id v11 = [v8 domain];
    id v12 = [v11 personaIdentifier];
    __int16 v13 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v14 = [v13 currentPersona];
    __int16 v15 = [v14 userPersonaUniqueString];
    char v16 = [v12 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      __int16 v17 = NSString;
      uint64_t v18 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v19 = [v18 currentPersona];
      uint64_t v20 = [v19 userPersonaUniqueString];
      uint64_t v21 = [MEMORY[0x1E4FB36F8] sharedManager];
      char v22 = [v21 currentPersona];
      uint64_t v23 = [v22 uid];
      id v24 = [v8 domain];
      unint64_t v25 = [v24 personaIdentifier];
      id v26 = [v17 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v20, v23, v25];

      uint64_t v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1287, (const char *)[v26 UTF8String]);
    }
  }
  else
  {
  }
  if (v8)
  {
    uint64_t v28 = [v8 log];
    id v29 = fpfs_adopt_log(v28);

    int v30 = [v8 spotlightIndexer];
    if (!v30)
    {
      id v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:].cold.4();
      }

      uint64_t v40 = fpfs_adopt_log(self->_log);
      id v32 = fp_current_or_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock(v6);
        -[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:]();
      }

      (*((void (**)(id, void))v6 + 2))(v6, 0);
      __fp_pop_log(&v40);
    }
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __71__FPXExtensionContext_dropIndexForDomain_dropReason_completionHandler___block_invoke;
    v38[3] = &unk_1E5AF0800;
    v38[4] = self;
    id v39 = v6;
    [v30 dropIndexWithDropReason:a4 completionHandler:v38];
  }
  else
  {
    uint64_t v33 = fp_current_or_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:]();
    }

    uint64_t v40 = fpfs_adopt_log(self->_log);
    id v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(v6);
      -[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:]();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
    __fp_pop_log(&v40);
  }
}

void __71__FPXExtensionContext_dropIndexForDomain_dropReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (void)signalNeedsReindexItemsWithIdentifiers:(id)a3 domainIdentifier:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  instanceQueue = self->_instanceQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke;
  v17[3] = &unk_1E5AF0D00;
  v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  int64_t v21 = a5;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  fp_dispatch_async_with_logs(instanceQueue, v17);
}

void __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) v2Instance];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) domainContextForIdentifier:*(void *)(a1 + 40)];
    uint64_t v4 = [v3 domain];
    uint64_t v5 = [v4 personaIdentifier];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [v3 domain];
      [v7 personaIdentifier];
      v8 = uint64_t v33 = v2;
      uint64_t v9 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v10 = [v9 currentPersona];
      id v11 = [v10 userPersonaUniqueString];
      char v12 = [v8 isEqualToString:v11];

      id v2 = v33;
      if ((v12 & 1) == 0)
      {
        __int16 v13 = NSString;
        id v14 = [MEMORY[0x1E4FB36F8] sharedManager];
        id v15 = [v14 currentPersona];
        id v16 = [v15 userPersonaUniqueString];
        __int16 v17 = [MEMORY[0x1E4FB36F8] sharedManager];
        id v18 = [v17 currentPersona];
        uint64_t v19 = [v18 uid];
        id v20 = [v3 domain];
        int64_t v21 = [v20 personaIdentifier];
        char v22 = [v13 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v16, v19, v21];

        uint64_t v23 = fp_current_or_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          +[FPXExtensionContext principalClass]();
        }

        __assert_rtn("-[FPXExtensionContext signalNeedsReindexItemsWithIdentifiers:domainIdentifier:indexReason:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1321, (const char *)[v22 UTF8String]);
      }
    }
    else
    {
    }
    uint64_t v27 = objc_opt_new();
    uint64_t v28 = *(void **)(a1 + 48);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2;
    v36[3] = &unk_1E5AF0CD8;
    id v37 = v2;
    id v26 = v3;
    id v38 = v26;
    id v29 = v27;
    id v39 = v29;
    int v30 = objc_msgSend(v28, "fp_map:", v36);
    if ([v30 count] || objc_msgSend(v29, "count"))
    {
      id v31 = [v26 spotlightIndexer];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_299;
      v34[3] = &unk_1E5AF0790;
      uint64_t v32 = *(void *)(a1 + 64);
      id v35 = *(id *)(a1 + 56);
      [v31 indexOutOfBandUpdatedItems:v30 deletedItems:v29 indexReason:v32 completionHandler:v34];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_cold_1();
    }

    uint64_t v25 = *(void *)(a1 + 56);
    FPNotSupportedError();
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v25 + 16))(v25, v26);
  }
}

id __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v17 = 0;
  uint64_t v5 = [v4 itemForIdentifier:v3 error:&v17];
  id v6 = v17;
  uint64_t v7 = [v6 domain];
  if ([v7 isEqualToString:@"NSFileProviderErrorDomain"]) {
    BOOL v8 = [v6 code] == -1005;
  }
  else {
    BOOL v8 = 0;
  }

  if (v6 && !v8)
  {
    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2_cold_1(v6);
    }

    goto LABEL_14;
  }
  if (v5) {
    int v10 = v8;
  }
  else {
    int v10 = 1;
  }
  if (v10 == 1)
  {
    id v11 = [FPItemID alloc];
    char v12 = [*(id *)(a1 + 40) providerDomain];
    __int16 v13 = [v12 identifier];
    id v14 = [(FPItemID *)v11 initWithProviderDomainID:v13 itemIdentifier:v3];

    [*(id *)(a1 + 48) addObject:v14];
LABEL_14:
    id v15 = 0;
    goto LABEL_16;
  }
  id v15 = [*(id *)(a1 + 40) itemFromVendorItem:v5];
LABEL_16:

  return v15;
}

uint64_t __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_299(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpIndexStateForDomain:(id)a3 toFileHandler:(id)a4 completionHandler:(id)a5
{
  v35[8] = *(void **)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v33 = a4;
  id v9 = a5;
  uint64_t v32 = v8;
  id v34 = [(FPXExtensionContext *)self domainContextForIdentifier:v8];
  int v10 = [v34 domain];
  id v11 = [v10 personaIdentifier];
  if (v11)
  {
    char v12 = [v34 domain];
    __int16 v13 = [v12 personaIdentifier];
    id v14 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v15 = [v14 currentPersona];
    id v16 = [v15 userPersonaUniqueString];
    char v17 = [v13 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
      id v18 = NSString;
      uint64_t v19 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v20 = [v19 currentPersona];
      int64_t v21 = [v20 userPersonaUniqueString];
      char v22 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v23 = [v22 currentPersona];
      uint64_t v24 = [v23 uid];
      uint64_t v25 = [v34 domain];
      id v26 = [v25 personaIdentifier];
      uint64_t v27 = [v18 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v21, v24, v26];

      uint64_t v28 = fp_current_or_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext dumpIndexStateForDomain:toFileHandler:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1356, (const char *)[v27 UTF8String]);
    }
  }
  else
  {
  }
  id v29 = [v34 spotlightIndexer];
  int v30 = -[FPCTLTermDumper initWithFd:forceColor:]([FPCTLTermDumper alloc], "initWithFd:forceColor:", [v33 fileDescriptor], 1);
  [v29 dumpStateTo:v30];

  v35[0] = fpfs_adopt_log(self->_log);
  id v31 = fp_current_or_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(v9);
    -[FPXExtensionContext dumpIndexStateForDomain:toFileHandler:completionHandler:]();
  }

  (*((void (**)(id, void))v9 + 2))(v9, 0);
  __fp_pop_log(v35);
}

- (void)preflightTrashItemIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  instanceQueue = self->_instanceQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF08A0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  fp_dispatch_async_with_logs(instanceQueue, v11);
}

void __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v38 = objc_opt_new();
  uint64_t v35 = a1;
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = a1 + 32;
  uint64_t v36 = [v2 domainContextForItemIDs:v3];
  uint64_t v5 = [v36 domain];
  id v6 = [v5 personaIdentifier];
  if (v6)
  {
    id v7 = [v36 domain];
    id v8 = [v7 personaIdentifier];
    id v9 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v10 = [v9 currentPersona];
    id v11 = [v10 userPersonaUniqueString];
    char v12 = [v8 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      id v13 = NSString;
      id v14 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v15 = [v14 currentPersona];
      id v16 = [v15 userPersonaUniqueString];
      char v17 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v18 = [v17 currentPersona];
      uint64_t v19 = [v18 uid];
      id v20 = [v36 domain];
      int64_t v21 = [v20 personaIdentifier];
      char v22 = [v13 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v16, v19, v21];

      uint64_t v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext preflightTrashItemIDs:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1371, (const char *)[v22 UTF8String]);
    }
  }
  else
  {
  }
  id v39 = [v36 instanceWithPrivateSelector:sel_preflightTrashItemWithIdentifier_completionHandler_];
  if (v39)
  {
    uint64_t v24 = dispatch_group_create();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = *(id *)(v35 + 40);
    uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v29 = (void *)MEMORY[0x1A6248870]();
          dispatch_group_enter(v24);
          int v30 = [v28 identifier];
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_303;
          v45[3] = &unk_1E5AF0D28;
          id v46 = v24;
          id v47 = v38;
          [v39 preflightTrashItemWithIdentifier:v30 completionHandler:v45];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v25);
    }

    id v31 = *(NSObject **)(*(void *)(v35 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_2;
    block[3] = &unk_1E5AF0968;
    id v41 = v38;
    id v32 = v36;
    uint64_t v33 = *(void *)(v35 + 32);
    id v42 = v32;
    uint64_t v43 = v33;
    id v44 = *(id *)(v35 + 48);
    dispatch_group_notify(v24, v31, block);
  }
  else
  {
    long long v52 = fpfs_adopt_log(*(void **)(*(void *)v4 + 72));
    id v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(v35 + 48));
      __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(v35 + 48) + 16))();
    __fp_pop_log(&v52);
  }
}

void __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_303(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if (v4) {
    [*(id *)(a1 + 40) addObjectsFromArray:v4];
  }
  objc_sync_exit(v3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5AF0D50;
  id v2 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "fp_map:", v8);
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 48) + 72));
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2080;
    id v15 = "-[FPXExtensionContext preflightTrashItemIDs:completionHandler:]_block_invoke_2";
    __int16 v16 = 2112;
    char v17 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  __fp_pop_log(&v7);
}

uint64_t __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) internalErrorFromVendorError:a2 callerDescription:@"preflightTrashItemIDs"];
}

- (void)providePlaceholderAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  instanceQueue = self->_instanceQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__FPXExtensionContext_providePlaceholderAtURL_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF0990;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  fp_dispatch_async_with_logs(instanceQueue, v11);
}

void __65__FPXExtensionContext_providePlaceholderAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) v2Instance];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() placeholderURLForURL:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__FPXExtensionContext_providePlaceholderAtURL_completionHandler___block_invoke_309;
    v13[3] = &unk_1E5AF0D78;
    void v13[4] = *(void *)(a1 + 32);
    id v5 = *(id *)(a1 + 48);
    id v14 = v3;
    id v15 = v5;
    id v6 = v3;
    [v2 providePlaceholderAtURL:v4 completionHandler:v13];
  }
  else
  {
    __int16 v16 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = FPNotSupportedError();
      *(_DWORD *)buf = 134219010;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      char v22 = "-[FPXExtensionContext providePlaceholderAtURL:completionHandler:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

    __fp_pop_log(&v16);
  }
}

void __65__FPXExtensionContext_providePlaceholderAtURL_completionHandler___block_invoke_309(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v12 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v11 = objc_msgSend(v3, "fp_strippedError");
    *(_DWORD *)buf = 134219010;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2080;
    uint64_t v18 = "-[FPXExtensionContext providePlaceholderAtURL:completionHandler:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    char v22 = v11;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = objc_msgSend(v3, "fp_strippedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  __fp_pop_log(&v12);
}

- (id)alternateContentsURLWrapperForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPDocumentAlternateContents *)self->_alternateContents getAlternateContentsURLWrapperForItemID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 url];
    int v8 = [v7 startAccessingSecurityScopedResource];
    int v9 = [v7 checkResourceIsReachableAndReturnError:0];
    if (v8) {
      [v7 stopAccessingSecurityScopedResource];
    }
    if (v9)
    {
      [v7 removeCachedResourceValueForKey:*MEMORY[0x1E4F1C530]];
      [v7 removeCachedResourceValueForKey:*MEMORY[0x1E4F1C5F8]];
      id v10 = v6;

      goto LABEL_10;
    }
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FPXExtensionContext alternateContentsURLWrapperForItemID:](v7);
    }

    [(FPDocumentAlternateContents *)self->_alternateContents removeAlternateContentsURLForDocumentWithItemID:v4];
  }
  id v10 = 0;
LABEL_10:

  return v10;
}

- (void)fetchAlternateContentsURLWrapperForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__FPXExtensionContext_fetchAlternateContentsURLWrapperForURL_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF0DA0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(FPXExtensionContext *)self identifierForItemAtURL:v9 completionHandler:v10];
}

void __80__FPXExtensionContext_fetchAlternateContentsURLWrapperForURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id v14 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __80__FPXExtensionContext_fetchAlternateContentsURLWrapperForURL_completionHandler___block_invoke_cold_1();
  }

  if (v5)
  {
    id v9 = [*v7 alternateContentsURLWrapperForItemID:v5];
  }
  else
  {
    id v9 = 0;
  }
  id v13 = fpfs_adopt_log(*((void **)*v7 + 9));
  id v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    id v12 = *v7;
    *(_DWORD *)buf = 134219010;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2080;
    uint64_t v20 = "-[FPXExtensionContext fetchAlternateContentsURLWrapperForURL:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    char v22 = v9;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_debug_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v13);

  __fp_pop_log(&v14);
}

- (void)setAlternateContentsURL:(id)a3 forDocumentWithURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__FPXExtensionContext_setAlternateContentsURL_forDocumentWithURL_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF0DA0;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(FPXExtensionContext *)self identifierForItemAtURL:a4 completionHandler:v12];
}

void __84__FPXExtensionContext_setAlternateContentsURL_forDocumentWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v15 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) url];
    objc_msgSend(v10, "fp_shortDescription");
    id v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    __int16 v17 = v9;
    __int16 v18 = 2080;
    __int16 v19 = "-[FPXExtensionContext setAlternateContentsURL:forDocumentWithURL:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }
  if (v5) {
    [*(id *)(*(void *)(a1 + 32) + 48) setAlternateContentsURLWrapper:*(void *)(a1 + 40) forDocumentWithItemID:v5];
  }
  id v14 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    id v13 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v13;
    __int16 v20 = 2080;
    __int16 v21 = "-[FPXExtensionContext setAlternateContentsURL:forDocumentWithURL:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v5;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_debug_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v14);

  __fp_pop_log(&v15);
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke;
  v8[3] = &unk_1E5AF0B98;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(FPXExtensionContext *)self itemForURL:a3 completionHandler:v8];
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v40 = a3;
  id v41 = v5;
  if (v5)
  {
    id v39 = [v5 itemID];
    id v6 = [*(id *)(a1 + 32) domainContextForItemID:v39];
    id v7 = [v6 domain];
    id v8 = [v7 personaIdentifier];
    if (v8)
    {
      id v9 = [v6 domain];
      id v10 = [v9 personaIdentifier];
      id v11 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v12 = [v11 currentPersona];
      id v13 = [v12 userPersonaUniqueString];
      char v14 = [v10 isEqualToString:v13];

      if ((v14 & 1) == 0)
      {
        __int16 v15 = NSString;
        uint64_t v16 = [MEMORY[0x1E4FB36F8] sharedManager];
        __int16 v17 = [v16 currentPersona];
        __int16 v18 = [v17 userPersonaUniqueString];
        __int16 v19 = [MEMORY[0x1E4FB36F8] sharedManager];
        __int16 v20 = [v19 currentPersona];
        uint64_t v21 = [v20 uid];
        __int16 v22 = [v6 domain];
        id v23 = [v22 personaIdentifier];
        __int16 v24 = [v15 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v18, v21, v23];

        id v25 = fp_current_or_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          +[FPXExtensionContext principalClass]();
        }

        __assert_rtn("-[FPXExtensionContext didUpdateAlternateContentsDocumentForDocumentWithURL:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1490, (const char *)[v24 UTF8String]);
      }
    }
    else
    {
    }
    uint64_t v27 = [v6 vendorInstance];
    uint64_t v28 = [v41 providerItemID];
    id v29 = [v28 identifier];

    int v30 = +[NSFileProviderRequest requestFromTheSystem];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2;
    v42[3] = &unk_1E5AF0DF0;
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(void **)(a1 + 40);
    id v43 = v29;
    uint64_t v44 = v31;
    id v46 = v6;
    id v47 = v32;
    id v45 = v39;
    id v33 = v6;
    id v34 = v39;
    id v35 = v29;
    id v36 = (id)[v27 itemForIdentifier:v35 request:v30 completionHandler:v42];
  }
  else
  {
    long long v48 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    uint64_t v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      id v37 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v38 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      long long v50 = v37;
      __int16 v51 = 2112;
      uint64_t v52 = v38;
      __int16 v53 = 2080;
      uint64_t v54 = "-[FPXExtensionContext didUpdateAlternateContentsDocumentForDocumentWithURL:completionHandler:]_block_invoke";
      __int16 v55 = 2112;
      id v56 = v40;
      _os_log_debug_impl(&dword_1A33AE000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v48);
  }
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 40) alternateContentsURLWrapperForItemID:*(void *)(a1 + 48)];
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(NSObject **)(v8 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_311;
      block[3] = &unk_1E5AF0DC8;
      void block[4] = v8;
      id v21 = *(id *)(a1 + 56);
      id v22 = v5;
      id v23 = v7;
      dispatch_async(v9, block);
      __int16 v24 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
      id v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock(*(void **)(a1 + 64));
        __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_4();
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      __fp_pop_log(&v24);
    }
    else
    {
      __int16 v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_3();
      }

      __int16 v24 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
      uint64_t v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock(*(void **)(a1 + 64));
        __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_2();
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      __fp_pop_log(&v24);
    }
  }
  else
  {
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_1(a1, v6);
    }

    __int16 v24 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
    id v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      uint64_t v18 = *(void *)(a1 + 40);
      __int16 v19 = FPItemNotFoundError(*(void *)(a1 + 32));
      *(_DWORD *)buf = 134218754;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      __int16 v29 = 2080;
      int v30 = "-[FPXExtensionContext didUpdateAlternateContentsDocumentForDocumentWithURL:completionHandler:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v13 = *(void *)(a1 + 64);
    char v14 = FPItemNotFoundError(*(void *)(a1 + 32));
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

    __fp_pop_log(&v24);
  }
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_311(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "itemFromVendorItem:", *(void *)(a1 + 48), (void)v10);
        id v9 = [*(id *)(a1 + 56) url];
        [v7 alternateContentsWereUpdatedAtURL:v9 forItem:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)identifierForItemAtURL:(id)a3 completionHandler:(id)a4
{
  v15[6] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15[0] = fpfs_adopt_log(self->_log);
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext identifierForItemAtURL:completionHandler:]();
  }

  instanceQueue = self->_instanceQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__FPXExtensionContext_identifierForItemAtURL_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF08A0;
  void v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v12);

  __fp_pop_log(v15);
}

void __64__FPXExtensionContext_identifierForItemAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) domainContextForURL:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    uint64_t v5 = [v2 domain];
    id v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = NSString;
      long long v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      uint64_t v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      uint64_t v18 = [v2 domain];
      __int16 v19 = [v18 personaIdentifier];
      __int16 v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      id v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext identifierForItemAtURL:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1533, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  id v22 = [*(id *)(a1 + 32) v2Instance];
  id v23 = v22;
  if (v22)
  {
    __int16 v24 = [v22 persistentIdentifierForItemAtURL:*(void *)(a1 + 40)];
    id v37 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      __int16 v31 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v32 = *(void *)(a1 + 32);
      uint64_t v33 = [v2 itemIDFromVendorItemID:v24];
      *(_DWORD *)buf = 134219010;
      id v39 = v31;
      __int16 v40 = 2112;
      uint64_t v41 = v32;
      __int16 v42 = 2080;
      id v43 = "-[FPXExtensionContext identifierForItemAtURL:completionHandler:]_block_invoke";
      __int16 v44 = 2112;
      id v45 = v33;
      __int16 v46 = 2112;
      id v47 = 0;
      _os_log_debug_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v26 = *(void *)(a1 + 48);
    __int16 v27 = [v2 itemIDFromVendorItemID:v24];
    (*(void (**)(uint64_t, void *, void))(v26 + 16))(v26, v27, 0);

    __fp_pop_log(&v37);
  }
  else
  {
    id v37 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    uint64_t v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v34 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v35 = *(void *)(a1 + 32);
      id v36 = FPNotSupportedError();
      *(_DWORD *)buf = 134219010;
      id v39 = v34;
      __int16 v40 = 2112;
      uint64_t v41 = v35;
      __int16 v42 = 2080;
      id v43 = "-[FPXExtensionContext identifierForItemAtURL:completionHandler:]_block_invoke";
      __int16 v44 = 2112;
      id v45 = 0;
      __int16 v46 = 2112;
      id v47 = v36;
      _os_log_debug_impl(&dword_1A33AE000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v29 = *(void *)(a1 + 48);
    int v30 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v30);

    __fp_pop_log(&v37);
  }
}

- (void)itemForURL:(id)a3 completionHandler:(id)a4
{
  v34[6] = *(void **)MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v29 = a4;
  v34[0] = fpfs_adopt_log(self->_log);
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v30, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext itemForURL:completionHandler:]();
  }

  id v7 = [(FPXExtensionContext *)self domainContextForURL:v30];
  uint64_t v8 = [v7 domain];
  id v9 = [v8 personaIdentifier];
  if (v9)
  {
    char v10 = [v7 domain];
    id v11 = [v10 personaIdentifier];
    long long v12 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v13 = [v12 currentPersona];
    id v14 = [v13 userPersonaUniqueString];
    char v15 = [v11 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = NSString;
      uint64_t v17 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v18 = [v17 currentPersona];
      __int16 v19 = [v18 userPersonaUniqueString];
      __int16 v20 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v21 = [v20 currentPersona];
      uint64_t v22 = [v21 uid];
      id v23 = [v7 domain];
      __int16 v24 = [v23 personaIdentifier];
      id v25 = [v16 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v19, v22, v24];

      uint64_t v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext itemForURL:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1586, (const char *)[v25 UTF8String]);
    }
  }
  else
  {
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__FPXExtensionContext_itemForURL_completionHandler___block_invoke;
  v31[3] = &unk_1E5AF0E68;
  v31[4] = self;
  id v27 = v29;
  id v33 = v27;
  id v28 = v7;
  id v32 = v28;
  [(FPXExtensionContext *)self identifierForItemAtURL:v30 completionHandler:v31];

  __fp_pop_log(v34);
}

void __52__FPXExtensionContext_itemForURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v25 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = [*(id *)(a1 + 40) internalErrorFromVendorError:v6 callerDescription:@"itemForURL"];
      *(_DWORD *)buf = 134219010;
      id v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 2080;
      __int16 v31 = "-[FPXExtensionContext itemForURL:completionHandler:]_block_invoke";
      __int16 v32 = 2112;
      uint64_t v33 = 0;
      __int16 v34 = 2112;
      uint64_t v35 = v19;
      _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 40) internalErrorFromVendorError:v6 callerDescription:@"itemForURL"];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

    __fp_pop_log(&v25);
  }
  else
  {
    char v10 = [v5 identifier];

    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      long long v12 = +[NSFileProviderRequest requestFromTheSystem];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __52__FPXExtensionContext_itemForURL_completionHandler___block_invoke_322;
      v23[3] = &unk_1E5AF0E40;
      v23[4] = *(void *)(a1 + 32);
      id v24 = *(id *)(a1 + 48);
      [v11 itemForItemID:v5 request:v12 completionHandler:v23];
    }
    else
    {
      id v25 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
      id v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __int16 v20 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v14 = *MEMORY[0x1E4F281F8];
        uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
        *(_DWORD *)buf = 134219010;
        id v27 = v20;
        __int16 v28 = 2112;
        uint64_t v29 = v21;
        __int16 v30 = 2080;
        __int16 v31 = "-[FPXExtensionContext itemForURL:completionHandler:]_block_invoke";
        __int16 v32 = 2112;
        uint64_t v33 = 0;
        __int16 v34 = 2112;
        uint64_t v35 = v22;
        _os_log_debug_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      else
      {
        uint64_t v14 = *MEMORY[0x1E4F281F8];
      }

      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:v14 code:256 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

      __fp_pop_log(&v25);
    }
  }
}

void __52__FPXExtensionContext_itemForURL_completionHandler___block_invoke_322(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v13 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  char v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2080;
    __int16 v19 = "-[FPXExtensionContext itemForURL:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v13);
}

- (void)_persistedDocumentURLForURL:(id)a3 itemID:(id)a4 extension:(id)a5 creatingPlaceholderIfMissing:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  __int16 v16 = (void (**)(id, id, void))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_instanceQueue);
  if (!v13)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"FPXExtensionContext.m" lineNumber:1614 description:@"url should not be nil"];
  }
  if ([v13 checkResourceIsReachableAndReturnError:0])
  {
    _CFURLPromiseSetPhysicalURL();
    v16[2](v16, v13, 0);
  }
  else
  {
    __int16 v18 = +[NSFileProviderManager placeholderURLForURL:v13];
    _CFURLPromiseSetPhysicalURL();
    if (v18 && [v18 checkResourceIsReachableAndReturnError:0])
    {
      v16[2](v16, v13, 0);
    }
    else if (v8)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __115__FPXExtensionContext__persistedDocumentURLForURL_itemID_extension_creatingPlaceholderIfMissing_completionHandler___block_invoke;
      v21[3] = &unk_1E5AF0E90;
      id v23 = v16;
      id v22 = v13;
      [v15 providePlaceholderAtURL:v22 completionHandler:v21];
    }
    else
    {
      __int16 v19 = [v14 identifier];
      __int16 v20 = FPItemNotFoundError((uint64_t)v19);
      ((void (**)(id, id, void *))v16)[2](v16, 0, v20);
    }
  }
}

void __115__FPXExtensionContext__persistedDocumentURLForURL_itemID_extension_creatingPlaceholderIfMissing_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  objc_msgSend(a2, "fp_strippedError");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v21 = fpfs_adopt_log(self->_log);
  uint64_t v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v23 = self;
    __int16 v24 = 2080;
    id v25 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 1024;
    BOOL v29 = v8;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %{BOOL}d, %{BOOL}d", buf, 0x2Cu);
  }

  instanceQueue = self->_instanceQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke;
  v16[3] = &unk_1E5AF0EE0;
  v16[4] = self;
  id v14 = v10;
  id v17 = v14;
  id v15 = v11;
  id v18 = v15;
  BOOL v19 = v7;
  BOOL v20 = v8;
  fp_dispatch_async_with_logs(instanceQueue, v16);

  __fp_pop_log(&v21);
}

void __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  __int16 v46 = [*(id *)(a1 + 32) v2Instance];
  uint64_t v2 = [*v1 domainContextForItemID:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 domain];
  id v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) domainContextForItemID:*(void *)(a1 + 40)];
    id v6 = [v5 domain];
    BOOL v7 = [v6 personaIdentifier];
    BOOL v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v9 = [v8 currentPersona];
    id v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = NSString;
      id v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v14 = [v13 currentPersona];
      id v15 = [v14 userPersonaUniqueString];
      __int16 v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      BOOL v19 = [*(id *)(a1 + 32) domainContextForItemID:*(void *)(a1 + 40)];
      BOOL v20 = [v19 domain];
      id v21 = [v20 personaIdentifier];
      id v22 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v21];

      id v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1655, (const char *)[v22 UTF8String]);
    }
  }
  else
  {
  }
  if (v46)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      __int16 v24 = 0;
    }
    else
    {
      __int16 v24 = [*(id *)(a1 + 32) alternateContentsURLWrapperForItemID:*(void *)(a1 + 40)];
    }
    __int16 v28 = [*(id *)(a1 + 40) identifier];
    BOOL v29 = [v46 URLForItemWithPersistentIdentifier:v28];

    if (v29)
    {
      __int16 v30 = *(void **)(a1 + 32);
      uint64_t v31 = *(void *)(a1 + 40);
      uint64_t v32 = *(unsigned __int8 *)(a1 + 57);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_327;
      v48[3] = &unk_1E5AF0EB8;
      v48[4] = v30;
      id v51 = *(id *)(a1 + 48);
      id v49 = v29;
      id v50 = v24;
      [v30 _persistedDocumentURLForURL:v49 itemID:v31 extension:v46 creatingPlaceholderIfMissing:v32 completionHandler:v48];
    }
    else
    {
      if (v24)
      {
        uint64_t v33 = fp_current_or_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v34 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = v34;
          _os_log_impl(&dword_1A33AE000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] alternate contents URL found for item ID: %@, but original item URL was not found", buf, 0xCu);
        }
      }
      uint64_t v52 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
      uint64_t v35 = fp_current_or_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        __int16 v42 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
        uint64_t v43 = *(void *)(a1 + 32);
        __int16 v44 = [*(id *)(a1 + 40) identifier];
        id v45 = FPItemNotFoundError((uint64_t)v44);
        *(_DWORD *)buf = 134219266;
        uint64_t v54 = v42;
        __int16 v55 = 2112;
        uint64_t v56 = v43;
        __int16 v57 = 2080;
        id v58 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandl"
              "er:]_block_invoke";
        __int16 v59 = 2112;
        uint64_t v60 = 0;
        __int16 v61 = 2112;
        uint64_t v62 = 0;
        __int16 v63 = 2112;
        int v64 = v45;
        _os_log_debug_impl(&dword_1A33AE000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
      }
      uint64_t v36 = *(void *)(a1 + 48);
      id v37 = [*(id *)(a1 + 40) identifier];
      uint64_t v38 = FPItemNotFoundError((uint64_t)v37);
      (*(void (**)(uint64_t, void, void, void *))(v36 + 16))(v36, 0, 0, v38);

      __fp_pop_log(&v52);
    }
  }
  else
  {
    uint64_t v52 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v39 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v40 = *(void *)(a1 + 32);
      uint64_t v41 = FPNotSupportedError();
      *(_DWORD *)buf = 134219266;
      uint64_t v54 = v39;
      __int16 v55 = 2112;
      uint64_t v56 = v40;
      __int16 v57 = 2080;
      id v58 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]_block_invoke";
      __int16 v59 = 2112;
      uint64_t v60 = 0;
      __int16 v61 = 2112;
      uint64_t v62 = 0;
      __int16 v63 = 2112;
      int v64 = v41;
      _os_log_debug_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
    uint64_t v26 = *(void *)(a1 + 48);
    id v27 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void, void *))(v26 + 16))(v26, 0, 0, v27);

    __fp_pop_log(&v52);
  }
}

void __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_327(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v26 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    BOOL v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v17 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      __int16 v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      __int16 v31 = 2080;
      uint64_t v32 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]_block_invoke";
      __int16 v33 = 2112;
      __int16 v34 = 0;
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log(&v26);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v25 = 0;
    id v9 = +[FPSandboxingURLWrapper wrapperWithURL:v8 readonly:0 error:&v25];
    id v10 = v25;
    if (v9)
    {
      uint64_t v26 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
      char v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        BOOL v19 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
        uint64_t v20 = *(void *)(a1 + 32);
        id v21 = *(void **)(a1 + 48);
        if (v21)
        {
          id v22 = v9;
        }
        else
        {
          id v21 = v9;
          id v22 = 0;
        }
        *(_DWORD *)buf = 134219266;
        __int16 v28 = v19;
        __int16 v29 = 2112;
        uint64_t v30 = v20;
        __int16 v31 = 2080;
        uint64_t v32 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandl"
              "er:]_block_invoke";
        __int16 v33 = 2112;
        __int16 v34 = v21;
        __int16 v35 = 2112;
        uint64_t v36 = v22;
        __int16 v37 = 2112;
        id v38 = v10;
        _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
      }

      uint64_t v12 = *(void *)(a1 + 48);
      if (v12) {
        id v13 = *(void **)(a1 + 48);
      }
      else {
        id v13 = v9;
      }
      if (v12) {
        id v14 = v9;
      }
      else {
        id v14 = 0;
      }
      (*(void (**)(void, void *, void *, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v13, v14, v10);
      __fp_pop_log(&v26);
    }
    else
    {
      id v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_327_cold_1();
      }

      uint64_t v26 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
      __int16 v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v23 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134219266;
        __int16 v28 = v23;
        __int16 v29 = 2112;
        uint64_t v30 = v24;
        __int16 v31 = 2080;
        uint64_t v32 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandl"
              "er:]_block_invoke";
        __int16 v33 = 2112;
        __int16 v34 = 0;
        __int16 v35 = 2112;
        uint64_t v36 = 0;
        __int16 v37 = 2112;
        id v38 = v10;
        _os_log_debug_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      __fp_pop_log(&v26);
    }
  }
}

- (void)_setupItemForTrashing:(id)a3 usesFPFS:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v9 = (void (**)(id, void *, uint64_t))a5;
  BOOL v7 = [a3 strippedCopy];
  [v7 setTrashed:1];
  if (v5)
  {
    [v7 setParentItemIdentifier:@"NSFileProviderTrashContainerItemIdentifier"];
    uint64_t v8 = 1073741828;
  }
  else
  {
    uint64_t v8 = 0x40000000;
  }
  v9[2](v9, v7, v8);
}

- (void)trashItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  instanceQueue = self->_instanceQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF08A0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  fp_dispatch_async_with_logs(instanceQueue, v11);
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  id v21 = 0;
  id v21 = [*(id *)(a1 + 32) domainContextForURL:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) v2Instance];
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_331;
      v16[3] = &unk_1E5AF0F08;
      uint64_t v4 = *(void *)(a1 + 40);
      v16[4] = *(void *)(a1 + 32);
      id v17 = *(id *)(a1 + 48);
      uint64_t v18 = v20;
      [v3 _trashItemAtURLWithoutCoordination:v4 completionHandler:v16];
    }
    else
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_335;
      v13[3] = &unk_1E5AF0FA8;
      void v13[4] = v8;
      id v14 = *(id *)(a1 + 48);
      id v15 = v20;
      [v8 identifierForItemAtURL:v9 completionHandler:v13];
    }
  }
  else
  {
    BOOL v19 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    BOOL v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = FPNotSupportedError();
      *(_DWORD *)buf = 134219010;
      id v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      __int16 v26 = 2080;
      id v27 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      __int16 v30 = 2112;
      __int16 v31 = v12;
      _os_log_debug_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);

    __fp_pop_log(&v19);
  }

  _Block_object_dispose(v20, 8);
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_331(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v13 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) internalErrorFromVendorError:v6 callerDescription:@"trashItemAtURL"];
    *(_DWORD *)buf = 134219010;
    id v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2080;
    BOOL v19 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) internalErrorFromVendorError:v6 callerDescription:@"trashItemAtURL"];
  (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);

  __fp_pop_log(&v13);
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_335(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = +[NSFileProviderRequest requestFromTheSystem];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_336;
    v14[3] = &unk_1E5AF0F80;
    v14[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v15 = v9;
    uint64_t v16 = v10;
    [v7 itemForItemID:v5 request:v8 completionHandler:v14];
  }
  else
  {
    uint64_t v17 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      BOOL v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2080;
      id v23 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v17);
  }
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_336(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v38 = a3;
  id v39 = a4;
  if (v7)
  {
    __int16 v37 = [v7 itemID];
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v43 = v37;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    uint64_t v10 = [v8 domainContextForItemIDs:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) domain];
    id v14 = [v13 personaIdentifier];
    if (v14)
    {
      id v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) domain];
      uint64_t v16 = [v15 personaIdentifier];
      uint64_t v17 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v18 = [v17 currentPersona];
      BOOL v19 = [v18 userPersonaUniqueString];
      char v20 = [v16 isEqualToString:v19];

      if ((v20 & 1) == 0)
      {
        uint64_t v21 = NSString;
        __int16 v22 = [MEMORY[0x1E4FB36F8] sharedManager];
        id v23 = [v22 currentPersona];
        __int16 v24 = [v23 userPersonaUniqueString];
        uint64_t v25 = [MEMORY[0x1E4FB36F8] sharedManager];
        __int16 v26 = [v25 currentPersona];
        uint64_t v27 = [v26 uid];
        uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) domain];
        uint64_t v29 = [v28 personaIdentifier];
        __int16 v30 = [v21 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v24, v27, v29];

        __int16 v31 = fp_current_or_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
          +[FPXExtensionContext principalClass]();
        }

        __assert_rtn("-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1744, (const char *)[v30 UTF8String]);
      }
    }
    else
    {
    }
    __int16 v33 = *(void **)(a1 + 32);
    uint64_t v34 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) usesFPFS];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_2;
    v40[3] = &unk_1E5AF0F58;
    void v40[4] = *(void *)(a1 + 32);
    id v41 = *(id *)(a1 + 40);
    [v33 _setupItemForTrashing:v7 usesFPFS:v34 completionHandler:v40];
  }
  else
  {
    __int16 v42 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    uint64_t v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      __int16 v35 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v36 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      id v45 = v35;
      __int16 v46 = 2112;
      uint64_t v47 = v36;
      __int16 v48 = 2080;
      id v49 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
      __int16 v50 = 2112;
      uint64_t v51 = 0;
      __int16 v52 = 2112;
      id v53 = v39;
      _os_log_debug_impl(&dword_1A33AE000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v42);
  }
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5AF0B98;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  [v5 singleItemChange:a2 changedFields:a3 bounce:0 completionHandler:v6];
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v19 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2080;
      uint64_t v25 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke_3";
      __int16 v26 = 2112;
      uint64_t v27 = 0;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v19);
  }
  else
  {
    uint64_t v8 = [v5 fileURL];
    if (v8)
    {
      BOOL v19 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v15 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        uint64_t v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        __int16 v24 = 2080;
        uint64_t v25 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
        __int16 v26 = 2112;
        uint64_t v27 = v8;
        __int16 v28 = 2112;
        id v29 = 0;
        _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      __fp_pop_log(&v19);
    }
    else
    {
      uint64_t v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_3_cold_1();
      }

      uint64_t v11 = *(void **)(a1 + 32);
      id v12 = [v5 itemID];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_337;
      v17[3] = &unk_1E5AF0F30;
      v17[4] = *(void *)(a1 + 32);
      id v18 = *(id *)(a1 + 40);
      [v11 URLForItemID:v12 creatingPlaceholderIfMissing:0 ignoreAlternateContentsURL:0 completionHandler:v17];
    }
  }
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_337(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = [v7 url];
    *(_DWORD *)buf = 134219010;
    id v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2080;
    __int16 v22 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
    __int16 v23 = 2112;
    __int16 v24 = v15;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_debug_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [v7 url];
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v9);

  __fp_pop_log(&v16);
}

- (void)startOperation:(id)a3 toFetchThumbnailsForItemIdentifiers:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  instanceQueue = self->_instanceQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke;
  v19[3] = &unk_1E5AF1090;
  id v20 = v13;
  __int16 v21 = self;
  id v22 = v12;
  id v23 = v14;
  SEL v24 = a2;
  CGFloat v25 = width;
  CGFloat v26 = height;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  fp_dispatch_async_with_logs(instanceQueue, v19);
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v1 = fp_current_or_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_cold_2();
  }

  uint64_t v2 = [*(id *)(a1 + 40) domainContextForItemIDs:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = [v2 domain];
    id v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = NSString;
      id v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      id v18 = [v2 domain];
      __int16 v19 = [v18 personaIdentifier];
      id v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      __int16 v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext startOperation:toFetchThumbnailsForItemIdentifiers:size:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1776, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  id v22 = [v2 vendorInstance];
  if ([v22 conformsToProtocol:&unk_1EF6D2FB0]) {
    unint64_t v23 = (unint64_t)v22;
  }
  else {
    unint64_t v23 = 0;
  }

  uint64_t v24 = [*(id *)(a1 + 40) instanceWithPrivateSelector:sel_fetchThumbnailsForItemIdentifiers_requestedSize_perThumbnailCompletionHandlerWithType_completionHandler_];
  if (v23 | v24)
  {
    CGFloat v25 = [*(id *)(a1 + 40) _proxyWithCancellationHandler:0 forClientOperation:*(void *)(a1 + 48)];
    __int16 v59 = objc_msgSend(*(id *)(a1 + 32), "fp_map:", &__block_literal_global_352);
    dispatch_group_t v26 = dispatch_group_create();
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2;
    v68[3] = &unk_1E5AF1018;
    uint64_t v27 = v26;
    __int16 v69 = v27;
    id v70 = *(id *)(a1 + 48);
    id v28 = v2;
    uint64_t v74 = *(void *)(a1 + 64);
    uint64_t v29 = *(void *)(a1 + 40);
    id v71 = v28;
    uint64_t v72 = v29;
    id v58 = v25;
    id v73 = v58;
    uint64_t v30 = (void *)MEMORY[0x1A6248B00](v68);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_370;
    v66[3] = &unk_1E5AF1040;
    id v31 = v30;
    id v67 = v31;
    uint64_t v32 = (void *)MEMORY[0x1A6248B00](v66);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_372;
    v61[3] = &unk_1E5AF1068;
    __int16 v33 = v27;
    uint64_t v34 = *(void *)(a1 + 40);
    uint64_t v62 = v33;
    uint64_t v63 = v34;
    id v65 = *(id *)(a1 + 56);
    id v64 = v28;
    __int16 v35 = (void *)MEMORY[0x1A6248B00](v61);
    double v36 = *(double *)(a1 + 72);
    double v37 = *(double *)(a1 + 80);
    if (v24) {
      objc_msgSend((id)v24, "fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandlerWithType:completionHandler:", v59, v31, v35, v36, v37);
    }
    else {
    uint64_t v47 = objc_msgSend((id)v23, "fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandler:completionHandler:", v59, v32, v35, v36, v37);
    }
    id v48 = (id)[*(id *)(a1 + 40) _proxyWithCancellationHandler:v47 forClientOperation:*(void *)(a1 + 48)];
  }
  else
  {
    v75 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
    id v38 = fp_current_or_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      id v49 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      uint64_t v50 = *(void *)(a1 + 40);
      __int16 v57 = FPInvalidParameterError(@"item identifiers", 0, v51, v52, v53, v54, v55, v56);
      *(_DWORD *)buf = 134218754;
      int64_t v77 = v49;
      __int16 v78 = 2112;
      uint64_t v79 = v50;
      __int16 v80 = 2080;
      id v81 = "-[FPXExtensionContext startOperation:toFetchThumbnailsForItemIdentifiers:size:completionHandler:]_block_invoke";
      __int16 v82 = 2112;
      id v83 = v57;
      _os_log_debug_impl(&dword_1A33AE000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v39 = *(void *)(a1 + 56);
    __int16 v46 = FPInvalidParameterError(@"item identifiers", 0, v40, v41, v42, v43, v44, v45);
    (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v46);

    __fp_pop_log(&v75);
  }
}

uint64_t __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_349(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_cold_1();
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v14 = [*(id *)(a1 + 48) internalErrorFromVendorError:v12 callerDescription:@"startFetchThumbnailOperation"];

  if (v9)
  {
    id v15 = objc_opt_new();
    [v15 setObject:v9 forKeyedSubscript:@"identifier"];
    [v15 setObject:v10 forKeyedSubscript:@"thumbnailData"];
    [v15 setObject:v11 forKeyedSubscript:@"contentType"];
    id v16 = *(void **)(a1 + 64);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_368;
    v18[3] = &unk_1E5AF0FF0;
    id v19 = *(id *)(a1 + 32);
    [v16 operationDidProgressWithInfo:v15 error:v14 completionHandler:v18];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 56) file:@"FPXExtensionContext.m" lineNumber:1804 description:@"UNREACHABLE: thumbnail completion callback was called with a nil identifier"];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_368(uint64_t a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_368_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_370(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_372(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_372_cold_1();
  }

  id v6 = *(NSObject **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(NSObject **)(v5 + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_373;
  v9[3] = &unk_1E5AF0B70;
  void v9[4] = v5;
  id v12 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v8 = v3;
  dispatch_group_notify(v6, v7, v9);
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_373(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) internalErrorFromVendorError:*(void *)(a1 + 48) callerDescription:@"startFetchThumbnailOperationOverall"];
    *(_DWORD *)buf = 134218754;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    id v14 = "-[FPXExtensionContext startOperation:toFetchThumbnailsForItemIdentifiers:size:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_debug_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = [*(id *)(a1 + 40) internalErrorFromVendorError:*(void *)(a1 + 48) callerDescription:@"startFetchThumbnailOperationOverall"];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  __fp_pop_log(&v8);
}

- (id)createFPTempDirectoryWithError:(id *)a3
{
  uint64_t v4 = [(FPXDomainContext *)self->_domainContext domain];
  uint64_t v5 = +[NSFileProviderManager managerForDomain:v4];

  id v11 = 0;
  uint64_t v6 = [v5 temporaryDirectoryURLWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FPXExtensionContext createFPTempDirectoryWithError:](v7);
    }

    if (a3) {
      *a3 = v7;
    }
  }

  return v6;
}

- (id)createFPTempDirectoryAppropriateForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  id v7 = [v6 URLForDirectory:99 inDomain:1 appropriateForURL:v5 create:1 error:&v12];
  id v8 = v12;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FPXExtensionContext createFPTempDirectoryAppropriateForURL:error:]((uint64_t)v5, v8);
    }

    if (a4) {
      *a4 = v8;
    }
  }

  return v7;
}

- (id)createTempThumbnailURLForVersion:(id)a3 appropriateForURL:(id)a4 itemIdentifier:(id)a5 isFromData:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12) {
    [v12 etagHash];
  }
  else {
  __int16 v15 = [NSString stringWithFormat:@"%@_current", v14];
  }
  id v16 = NSString;
  uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v18 = [v17 UUIDString];
  id v19 = (void *)v18;
  id v20 = &stru_1EF68D1F8;
  if (v8) {
    id v20 = @"_from_data";
  }
  __int16 v21 = [v16 stringWithFormat:@"%@_%@%@", v18, v15, v20];

  if (v13) {
    [(FPXExtensionContext *)self createFPTempDirectoryAppropriateForURL:v13 error:a7];
  }
  else {
  id v22 = [(FPXExtensionContext *)self createFPTempDirectoryWithError:a7];
  }
  unint64_t v23 = v22;
  if (v22)
  {
    uint64_t v24 = [v22 URLByAppendingPathComponent:v21 isDirectory:0];
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (void)startOperation:(id)a3 toFetchThumbnailsWithDictionary:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  instanceQueue = self->_instanceQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke;
  v19[3] = &unk_1E5AF1090;
  id v20 = v13;
  __int16 v21 = self;
  id v22 = v12;
  id v23 = v14;
  CGFloat v24 = width;
  CGFloat v25 = height;
  SEL v26 = a2;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  fp_dispatch_async_with_logs(instanceQueue, v19);
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_cold_3(a1, v2);
  }

  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) allKeys];
  v75 = [v3 domainContextForItemIDs:v4];

  id v5 = [v75 domain];
  uint64_t v6 = [v5 personaIdentifier];
  if (v6)
  {
    id v7 = [v75 domain];
    BOOL v8 = [v7 personaIdentifier];
    id v9 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v10 = [v9 currentPersona];
    id v11 = [v10 userPersonaUniqueString];
    char v12 = [v8 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      id v13 = NSString;
      id v14 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v15 = [v14 currentPersona];
      id v16 = [v15 userPersonaUniqueString];
      id v17 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v18 = [v17 currentPersona];
      uint64_t v19 = [v18 uid];
      id v20 = [v75 domain];
      __int16 v21 = [v20 personaIdentifier];
      id v22 = [v13 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v16, v19, v21];

      id v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext startOperation:toFetchThumbnailsWithDictionary:size:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1918, (const char *)[v22 UTF8String]);
    }
  }
  else
  {
  }
  id v71 = [v75 vendorInstance];
  if ([v71 conformsToProtocol:&unk_1EF6EDF40])
  {
    id v24 = v71;
    CGFloat v25 = v71;
    id v74 = v24;
  }
  else
  {
    id v74 = 0;
    CGFloat v25 = v71;
  }

  uint64_t v72 = [*(id *)(a1 + 40) instanceWithPrivateSelector:sel_fetchThumbnailsForDictionary_requestedSize_perThumbnailCompletionHandlerWithMetadata_completionHandler_];
  id v73 = [*(id *)(a1 + 40) instanceWithPrivateSelector:sel_fetchThumbnailsForDictionary_requestedSize_perThumbnailCompletionHandlerDataURLWithMetadata_completionHandler_];
  if (v74 || v72 || v73)
  {
    double v36 = [*(id *)(a1 + 40) _proxyWithCancellationHandler:0 forClientOperation:*(void *)(a1 + 48)];
    dispatch_group_t v37 = dispatch_group_create();
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_399;
    v90[3] = &unk_1E5AF10B8;
    id v38 = v37;
    v91 = v38;
    id v92 = *(id *)(a1 + 48);
    id v39 = v75;
    uint64_t v96 = *(void *)(a1 + 80);
    uint64_t v40 = *(void *)(a1 + 40);
    id v93 = v39;
    uint64_t v94 = v40;
    id obj = v36;
    id v95 = obj;
    uint64_t v41 = (void *)MEMORY[0x1A6248B00](v90);
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_414;
    v88[3] = &unk_1E5AF10E0;
    id v42 = v41;
    v88[4] = *(void *)(a1 + 40);
    id v89 = v42;
    uint64_t v43 = (void *)MEMORY[0x1A6248B00](v88);
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_2;
    v86[3] = &unk_1E5AF1108;
    id v70 = v43;
    id v87 = v70;
    __int16 v69 = (void *)MEMORY[0x1A6248B00](v86);
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_3;
    v81[3] = &unk_1E5AF1068;
    uint64_t v44 = v38;
    uint64_t v45 = *(void *)(a1 + 40);
    uint64_t v68 = v44;
    __int16 v82 = v44;
    uint64_t v83 = v45;
    id v85 = *(id *)(a1 + 56);
    id v84 = v39;
    __int16 v46 = (void *)MEMORY[0x1A6248B00](v81);
    uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v48 = [*(id *)(a1 + 32) allKeys];
    uint64_t v49 = [v48 countByEnumeratingWithState:&v77 objects:v102 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v78 != v50) {
            objc_enumerationMutation(v48);
          }
          uint64_t v52 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          uint64_t v53 = [*(id *)(a1 + 32) objectForKeyedSubscript:v52];
          uint64_t v54 = [v52 identifier];
          [v47 setObject:v53 forKeyedSubscript:v54];
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v77 objects:v102 count:16];
      }
      while (v49);
    }

    double v55 = *(double *)(a1 + 64);
    double v56 = *(double *)(a1 + 72);
    if (v73)
    {
      uint64_t v57 = objc_msgSend(v74, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerDataURLWithMetadata:completionHandler:", v47, v42, v46, v55, v56);
    }
    else
    {
      if (v72) {
        objc_msgSend(v74, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerWithMetadata:completionHandler:", v47, v70, v46, v55, v56);
      }
      else {
      uint64_t v57 = objc_msgSend(v74, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandler:completionHandler:", v47, v69, v46, v55, v56);
      }
    }
    uint64_t v63 = (void *)v57;
    id v64 = (id)[*(id *)(a1 + 40) _proxyWithCancellationHandler:v57 forClientOperation:*(void *)(a1 + 48)];
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id obj = [*(id *)(a1 + 32) allValues];
    uint64_t v26 = [obj countByEnumeratingWithState:&v98 objects:v112 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v99;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v99 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void **)(*((void *)&v98 + 1) + 8 * j);
          if (v29)
          {
            uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
            v111 = v30;
            id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
            if (([v29 isEqual:v31] & 1) != 0 || !objc_msgSend(v29, "count"))
            {
            }
            else
            {
              uint64_t v32 = [v29 objectAtIndexedSubscript:0];
              BOOL v33 = v32 == 0;

              if (!v33)
              {
                id v58 = fp_current_or_default_log();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
                  __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_cold_1();
                }

                v97 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
                uint64_t v60 = fp_current_or_default_log();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  id v65 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
                  uint64_t v66 = *(void *)(a1 + 40);
                  id v67 = FPNotSupportedError();
                  *(_DWORD *)buf = 134218754;
                  v104 = v65;
                  __int16 v105 = 2112;
                  uint64_t v106 = v66;
                  __int16 v107 = 2080;
                  v108 = "-[FPXExtensionContext startOperation:toFetchThumbnailsWithDictionary:size:completionHandler:]_block_invoke";
                  __int16 v109 = 2112;
                  v110 = v67;
                  _os_log_debug_impl(&dword_1A33AE000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
                }
                uint64_t v61 = *(void *)(a1 + 56);
                uint64_t v62 = FPNotSupportedError();
                (*(void (**)(uint64_t, void *))(v61 + 16))(v61, v62);

                __fp_pop_log(&v97);
                goto LABEL_48;
              }
            }
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v98 objects:v112 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    __int16 v35 = *(void **)(a1 + 40);
    uint64_t v34 = *(void *)(a1 + 48);
    id obj = [*(id *)(a1 + 32) allKeys];
    objc_msgSend(v35, "startOperation:toFetchThumbnailsForItemIdentifiers:size:completionHandler:", v34, obj, *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
LABEL_48:
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_399(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_cold_1();
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v17 = [*(id *)(a1 + 48) internalErrorFromVendorError:v15 callerDescription:@"startFetchThumbnailOperation"];

  if (v11)
  {
    if (v13)
    {
      id v18 = [*(id *)(a1 + 56) createTempThumbnailURLForVersion:v12 appropriateForURL:v13 itemIdentifier:v11 isFromData:0 error:0];
      if (v18)
      {
        id v19 = v13;
        id v20 = (const char *)[v19 fileSystemRepresentation];
        id v21 = v18;
        if ((clonefile(v20, (const char *)[v21 fileSystemRepresentation], 0) & 0x80000000) == 0)
        {
          id v32 = v17;
          id v18 = +[FPSandboxingURLWrapper wrapperWithURL:v21 readonly:0 error:&v32];
          id v22 = v32;

          id v17 = v22;
LABEL_10:
          id v24 = objc_opt_new();
          [v24 setObject:v11 forKeyedSubscript:@"identifier"];
          if (v18) {
            [v24 setObject:v18 forKeyedSubscript:@"thumbnailDataURLWrapper"];
          }
          if (v14) {
            [v24 setObject:v14 forKeyedSubscript:@"thumbnailMetaData"];
          }
          if (v12) {
            [v24 setObject:v12 forKeyedSubscript:@"version"];
          }
          CGFloat v25 = *(void **)(a1 + 64);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_412;
          v30[3] = &unk_1E5AF0FF0;
          id v31 = *(id *)(a1 + 32);
          [v25 operationDidProgressWithInfo:v24 error:v17 completionHandler:v30];

          goto LABEL_19;
        }
        uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v28 = *(void *)(a1 + 56);
        uint64_t v29 = *(void *)(a1 + 72);
        uint64_t v27 = __error();
        [v26 handleFailureInMethod:v29, v28, @"FPXExtensionContext.m", 1963, @"UNREACHABLE: failed to clone thumbnail file %@ to %@: %s", v19, v21, strerror(*v27) object file lineNumber description];
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_19:

      goto LABEL_20;
    }
    id v18 = 0;
    goto LABEL_10;
  }
  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 56) file:@"FPXExtensionContext.m" lineNumber:1945 description:@"UNREACHABLE: thumbnail completion callback was called with a nil identifier"];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_20:
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_412(uint64_t a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_368_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_414(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v15 = *(void **)(a1 + 32);
    id v22 = 0;
    id v16 = [v15 createTempThumbnailURLForVersion:v12 appropriateForURL:0 itemIdentifier:v11 isFromData:1 error:&v22];
    id v17 = v22;
    if (v16)
    {
      id v18 = [v16 path];
      id v21 = 0;
      int v19 = [v13 writeToFile:v18 options:1 error:&v21];
      id v20 = v21;

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      if (v19)
      {

        id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v20 removeItemAtURL:v16 error:0];
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_372_cold_1();
  }

  uint64_t v6 = *(NSObject **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(NSObject **)(v5 + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_417;
  v9[3] = &unk_1E5AF0B70;
  void v9[4] = v5;
  id v12 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v8 = v3;
  dispatch_group_notify(v6, v7, v9);
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_417(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) internalErrorFromVendorError:*(void *)(a1 + 48) callerDescription:@"startFetchThumbnailOperationOverall"];
    *(_DWORD *)buf = 134218754;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    id v14 = "-[FPXExtensionContext startOperation:toFetchThumbnailsWithDictionary:size:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_debug_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = [*(id *)(a1 + 40) internalErrorFromVendorError:*(void *)(a1 + 48) callerDescription:@"startFetchThumbnailOperationOverall"];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  __fp_pop_log(&v8);
}

- (void)valuesForAttributes:(id)a3 forItemID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  instanceQueue = self->_instanceQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__FPXExtensionContext_valuesForAttributes_forItemID_completionHandler___block_invoke;
  v15[3] = &unk_1E5AF1158;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  fp_dispatch_async_with_logs(instanceQueue, v15);
}

void __71__FPXExtensionContext_valuesForAttributes_forItemID_completionHandler___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] domainContextForItemID:a1[5]];
  uint64_t v3 = [v2 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [v2 domain];
    id v7 = [v6 personaIdentifier];
    id v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v9 = [v8 currentPersona];
    id v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = NSString;
      id v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v14 = [v13 currentPersona];
      __int16 v15 = [v14 userPersonaUniqueString];
      id v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      int v19 = [v2 domain];
      id v20 = [v19 personaIdentifier];
      id v21 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v20];

      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext valuesForAttributes:forItemID:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2057, (const char *)[v21 UTF8String]);
    }
  }
  else
  {
  }
  id v23 = [v2 vendorInstance];
  id v24 = [a1[5] identifier];
  CGFloat v25 = +[NSFileProviderRequest requestFromTheSystem];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__FPXExtensionContext_valuesForAttributes_forItemID_completionHandler___block_invoke_2;
  v28[3] = &unk_1E5AF1130;
  v28[4] = a1[4];
  id v32 = a1[7];
  id v29 = v2;
  id v30 = a1[5];
  id v31 = a1[6];
  id v26 = v2;
  id v27 = (id)[v23 itemForIdentifier:v24 request:v25 completionHandler:v28];
}

void __71__FPXExtensionContext_valuesForAttributes_forItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  uint64_t v36 = *MEMORY[0x1E4F1C690];
  v37[0] = MEMORY[0x1E4F1CC28];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) alternateContentsURLWrapperForItemID:*(void *)(a1 + 48)];
    id v9 = [v8 url];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) itemFromVendorItem:v5];
      char v11 = [[FPXEnumeratorAlternateContentsItem alloc] initWithOriginalDocumentItem:v10 alternateContentsURL:v9];

      uint64_t v5 = v11;
    }
    id v12 = FPDictFromVendorItem((uint64_t)v5, *(void *)(a1 + 56));
    CGFloat v25 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      id v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      __int16 v30 = 2080;
      id v31 = "-[FPXExtensionContext valuesForAttributes:forItemID:completionHandler:]_block_invoke";
      __int16 v32 = 2112;
      BOOL v33 = v12;
      __int16 v34 = 2112;
      __int16 v35 = 0;
      _os_log_debug_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log(&v25);
  }
  else if (v6)
  {
    CGFloat v25 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v20 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = [*(id *)(a1 + 40) internalErrorFromVendorError:v6 callerDescription:@"valueForAttributesForItemID"];
      *(_DWORD *)buf = 134219010;
      id v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      __int16 v30 = 2080;
      id v31 = "-[FPXExtensionContext valuesForAttributes:forItemID:completionHandler:]_block_invoke_2";
      __int16 v32 = 2112;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v22;
      _os_log_debug_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v15 = *(void *)(a1 + 64);
    id v16 = [*(id *)(a1 + 40) internalErrorFromVendorError:v6 callerDescription:@"valueForAttributesForItemID"];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

    __fp_pop_log(&v25);
  }
  else
  {
    CGFloat v25 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v23 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      id v27 = v23;
      __int16 v28 = 2112;
      uint64_t v29 = v24;
      __int16 v30 = 2080;
      id v31 = "-[FPXExtensionContext valuesForAttributes:forItemID:completionHandler:]_block_invoke";
      __int16 v32 = 2112;
      BOOL v33 = v7;
      __int16 v34 = 2112;
      __int16 v35 = 0;
      _os_log_debug_impl(&dword_1A33AE000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log(&v25);
  }
}

- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v28 = fpfs_adopt_log(self->_log);
  uint64_t v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    __int16 v30 = self;
    __int16 v31 = 2080;
    __int16 v32 = "-[FPXExtensionContext fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:]";
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 2112;
    id v36 = v13;
    _os_log_debug_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }

  instanceQueue = self->_instanceQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke;
  v21[3] = &unk_1E5AF11A8;
  id v17 = v11;
  SEL v27 = a2;
  id v22 = v17;
  id v23 = self;
  id v18 = v13;
  id v24 = v18;
  id v19 = v14;
  id v26 = v19;
  id v20 = v12;
  id v25 = v20;
  fp_dispatch_async_with_logs(instanceQueue, v21);

  __fp_pop_log(&v28);
}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v67 = [*(id *)(a1 + 32) enumeratedItemID];
  if (!v67)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 40) file:@"FPXExtensionContext.m" lineNumber:2110 description:@"Enumerated item ID missing"];
  }
  uint64_t v68 = [*(id *)(a1 + 40) domainContextForItemID:v67];
  uint64_t v3 = [v68 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    uint64_t v5 = [v68 domain];
    id v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = NSString;
      id v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      uint64_t v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      id v18 = [v68 domain];
      id v19 = [v18 personaIdentifier];
      id v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      uint64_t v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2112, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  id v22 = [*(id *)(a1 + 32) searchQuery];

  if (v22)
  {
    id v23 = [v68 vendorInstance];
    if ([v23 conformsToProtocol:&unk_1EF6D2E10]) {
      uint64_t v24 = (uint64_t)v23;
    }
    else {
      uint64_t v24 = 0;
    }
    uint64_t v66 = v23;

    if (v24)
    {
      __int16 v31 = [*(id *)(a1 + 32) searchQuery];
      __int16 v32 = [v31 toSpotlightServerQueryString];
      __int16 v33 = [NSFileProviderSearch alloc];
      id v34 = [v31 scopedToItemIdentifier];
      __int16 v35 = [v31 searchContainerItemIdentifier];
      id v36 = [*(id *)(a1 + 32) searchQuery];
      uint64_t v37 = [(NSFileProviderSearch *)v33 initWithSpotlightQueryString:v32 scopedToItemIdentifier:v34 searchContainerItemIdentifier:v35 legacySearchQuery:v36];

      uint64_t v38 = *(void *)(a1 + 48);
      id v77 = 0;
      __int16 v28 = [(id)v24 enumeratorForSearch:v37 request:v38 error:&v77];
      uint64_t v29 = v77;
    }
    else
    {
      uint64_t v29 = FPNotSupportedError();
      __int16 v28 = 0;
    }

    uint64_t v30 = 0;
    LOBYTE(v24) = 1;
  }
  else
  {
    id v25 = [v67 identifier];
    uint64_t v24 = [v25 isEqualToString:@"NSFileProviderWorkingSetContainerItemIdentifier"];

    uint64_t v66 = [v68 vendorInstance];
    id v26 = [v67 identifier];
    uint64_t v27 = *(void *)(a1 + 48);
    id v76 = 0;
    __int16 v28 = [v66 enumeratorForContainerItemIdentifier:v26 request:v27 error:&v76];
    uint64_t v29 = v76;

    if (v24)
    {
      CheckAndWarn(v28, sel_currentSyncAnchorWithCompletionHandler_);
      CheckAndWarn(v28, sel_enumerateChangesForObserver_fromSyncAnchor_);
    }
    if (!v28)
    {
      if (([v29 fp_isFeatureUnsupportedError] & 1) == 0
        || ([v67 identifier],
            uint64_t v47 = objc_claimAutoreleasedReturnValue(),
            char v48 = [v47 isEqualToString:@"NSFileProviderTrashContainerItemIdentifier"],
            v47,
            (v48 & 1) == 0))
      {
        __int16 v28 = 0;
        BOOL v39 = v29 != 0;
        goto LABEL_33;
      }
      uint64_t v49 = fp_current_or_default_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_cold_2();
      }

      __int16 v28 = objc_opt_new();
    }
    uint64_t v30 = v24;
  }
  BOOL v39 = v29 != 0;
  if (v28 && !v29)
  {
    uint64_t v40 = [[FPXEnumerator alloc] initWithObservedItemID:v67 domainContext:v68 vendorEnumerator:v28 nsFileProviderRequest:*(void *)(a1 + 48) observer:*(void *)(a1 + 56) isWorkingSetEnum:v30 queue:*(void *)(*(void *)(a1 + 40) + 24)];
    uint64_t v29 = dispatch_group_create();
    if ((v24 & 1) == 0 && ([v68 usesFPFS] & 1) == 0)
    {
      dispatch_group_enter(v29);
      uint64_t v41 = [v67 identifier];
      id v42 = +[NSFileProviderRequest requestFromTheSystem];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_443;
      v72[3] = &unk_1E5AF1180;
      id v73 = v40;
      id v74 = v29;
      id v43 = (id)[v66 itemForIdentifier:v41 request:v42 completionHandler:v72];
    }
    uint64_t v44 = *(void *)(a1 + 40);
    uint64_t v45 = *(NSObject **)(v44 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_2;
    block[3] = &unk_1E5AF08A0;
    void block[4] = v44;
    id v70 = v40;
    id v71 = *(id *)(a1 + 64);
    __int16 v46 = v40;
    dispatch_group_notify(v29, v45, block);

    goto LABEL_45;
  }
LABEL_33:
  uint64_t v50 = fp_current_or_default_log();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v61 = [*(id *)(a1 + 40) providerIdentifier];
    uint64_t v62 = objc_msgSend(v61, "fp_fpIdentifier");
    *(_DWORD *)buf = 138412802;
    long long v79 = v67;
    __int16 v80 = 2112;
    id v81 = v62;
    __int16 v82 = 2112;
    uint64_t v83 = (const char *)v29;
    _os_log_debug_impl(&dword_1A33AE000, v50, OS_LOG_TYPE_DEBUG, "[DEBUG] can't create vendor enumerator for %@ owned by %@; %@",
      buf,
      0x20u);
  }
  if (v28) {
    char v51 = 1;
  }
  else {
    char v51 = v39;
  }
  if ((v51 & 1) == 0)
  {
    id v65 = NSStringFromSelector(sel_enumeratorForContainerItemIdentifier_error_);
    fp_simulate_crash(@"-[%@ %@] must return an enumerator or an error.", v52, v53, v54, v55, v56, v57, v58, (uint64_t)v66);

    __int16 v59 = fp_current_or_default_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
      __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_cold_1((int)v66, sel_enumeratorForContainerItemIdentifier_error_);
    }
  }
  __int16 v46 = [v68 internalErrorFromVendorError:v29 callerDescription:@"fetchAndStartEnumeratingWithSettings"];
  v75 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
  uint64_t v60 = fp_current_or_default_log();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v63 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
    id v64 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    long long v79 = v63;
    __int16 v80 = 2112;
    id v81 = v64;
    __int16 v82 = 2080;
    uint64_t v83 = "-[FPXExtensionContext fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:]_block_invoke";
    __int16 v84 = 2112;
    uint64_t v85 = 0;
    __int16 v86 = 2112;
    id v87 = v29;
    _os_log_debug_impl(&dword_1A33AE000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  __fp_pop_log(&v75);

LABEL_45:
}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_443(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) forceItemUpdate:a2];
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  id v6 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2080;
    id v12 = "-[FPXExtensionContext fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:]_block_invoke_2";
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    _os_log_debug_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v6);
}

- (void)enumeratorWasInvalidated:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__FPXExtensionContext_enumeratorWasInvalidated___block_invoke;
  v7[3] = &unk_1E5AF0748;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

uint64_t __48__FPXExtensionContext_enumeratorWasInvalidated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (id)additionalServiceSourcesForItemID:(id)a3 domain:(id)a4 extension:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (additionalServiceSourcesForItemID_domain_extension__onceToken != -1) {
    dispatch_once(&additionalServiceSourcesForItemID_domain_extension__onceToken, &__block_literal_global_446);
  }
  uint64_t v10 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = (id)additionalServiceSourcesForItemID_domain_extension__sourceClasses;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_alloc(*(Class *)(*((void *)&v20 + 1) + 8 * i));
        uint64_t v17 = objc_msgSend(v7, "identifier", (void)v20);
        id v18 = (void *)[v16 initWithItemIdentifier:v17 domain:v8 extension:v9];

        if (v18) {
          [v10 addObject:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v10;
}

void __74__FPXExtensionContext_additionalServiceSourcesForItemID_domain_extension___block_invoke()
{
  id v8 = (id)objc_opt_new();
  Class v0 = NSClassFromString(&cfstr_Swycollaborati.isa);
  if (v0)
  {
    Class v1 = v0;
    if (-[objc_class instancesRespondToSelector:](v0, "instancesRespondToSelector:", sel_initWithItemIdentifier_domain_extension_))[v8 addObject:v1]; {
  }
    }
  Class v2 = NSClassFromString(&cfstr_Swcollaboratio.isa);
  if (v2)
  {
    Class v3 = v2;
    if (-[objc_class instancesRespondToSelector:](v2, "instancesRespondToSelector:", sel_initWithItemIdentifier_domain_extension_))[v8 addObject:v3]; {
  }
    }
  Class v4 = NSClassFromString(&cfstr_Swcollaboratio_0.isa);
  if (v4)
  {
    Class v5 = v4;
    if (-[objc_class instancesRespondToSelector:](v4, "instancesRespondToSelector:", sel_initWithItemIdentifier_domain_extension_))[v8 addObject:v5]; {
  }
    }
  uint64_t v6 = [v8 copy];
  id v7 = (void *)additionalServiceSourcesForItemID_domain_extension__sourceClasses;
  additionalServiceSourcesForItemID_domain_extension__sourceClasses = v6;
}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v18 = fpfs_adopt_log(self->_log);
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext fetchServicesForItemID:allowRestrictedSources:completionHandler:]();
  }

  instanceQueue = self->_instanceQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke;
  v14[3] = &unk_1E5AF1218;
  v14[4] = self;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  BOOL v17 = a4;
  fp_dispatch_async_with_logs(instanceQueue, v14);

  __fp_pop_log(&v18);
}

void __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke(uint64_t a1)
{
  Class v2 = [*(id *)(a1 + 32) domainContextForItemID:*(void *)(a1 + 40)];
  Class v3 = [v2 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    Class v5 = (void *)v4;
    uint64_t v6 = [v2 domain];
    id v7 = [v6 personaIdentifier];
    id v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v9 = [v8 currentPersona];
    uint64_t v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = NSString;
      id v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v14 = [v13 currentPersona];
      id v15 = [v14 userPersonaUniqueString];
      id v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      BOOL v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      id v19 = [v2 domain];
      long long v20 = [v19 personaIdentifier];
      long long v21 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v20];

      long long v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext fetchServicesForItemID:allowRestrictedSources:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2268, (const char *)[v21 UTF8String]);
    }
  }
  else
  {
  }
  long long v23 = [v2 vendorInstance];
  uint64_t v24 = [*(id *)(a1 + 40) identifier];
  id v25 = v23;
  if ([v25 conformsToProtocol:&unk_1EF6D30F8]) {
    id v26 = v25;
  }
  else {
    id v26 = 0;
  }

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke_2;
  v32[3] = &unk_1E5AF11F0;
  v32[4] = *(void *)(a1 + 32);
  id v36 = *(id *)(a1 + 48);
  id v33 = v2;
  id v34 = *(id *)(a1 + 40);
  id v27 = v26;
  id v35 = v27;
  char v37 = *(unsigned char *)(a1 + 56);
  id v28 = v2;
  uint64_t v29 = MEMORY[0x1A6248B00](v32);
  uint64_t v30 = (void *)v29;
  if (v27) {
    id v31 = (id)[v27 supportedServiceSourcesForItemIdentifier:v24 completionHandler:v29];
  }
  else {
    (*(void (**)(uint64_t, void, void))(v29 + 16))(v29, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v34 = a3;
  id v35 = v5;
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) domain];
    id v33 = [v8 additionalServiceSourcesForItemID:v7 domain:v9 extension:*(void *)(a1 + 56)];

    [v35 arrayByAddingObjectsFromArray:v33];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (!v11) {
      goto LABEL_20;
    }
    uint64_t v12 = *(void *)v37;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v15 = [v14 serviceName];
        if (v15)
        {
          if (*(unsigned char *)(a1 + 72)
            || (objc_opt_respondsToSelector() & 1) == 0
            || ![v14 isRestricted])
          {
            [v6 setObject:v14 forKeyedSubscript:v15];
            goto LABEL_18;
          }
          id v16 = fp_current_or_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v15;
            _os_log_debug_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring restricted source %@", buf, 0xCu);
          }
        }
        else
        {
          id v16 = fp_current_or_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v14;
            _os_log_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] source %@ returned nil service name", buf, 0xCu);
          }
        }

LABEL_18:
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (!v11)
      {
LABEL_20:

        BOOL v17 = [v6 allValues];
        uint64_t v18 = objc_msgSend(v17, "fp_map:", &__block_literal_global_470);

        id v19 = objc_opt_new();
        long long v20 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6CAC98];
        [v19 setInterface:v20];

        long long v21 = [[FPXServiceEndpointFactory alloc] initWithServiceSources:v6 domainContext:*(void *)(a1 + 40)];
        [v19 setExportedObject:v21];

        [v19 setContext:*(void *)(a1 + 32)];
        long long v22 = [MEMORY[0x1E4F29290] anonymousListener];
        long long v23 = [v22 endpoint];
        [*(id *)(a1 + 32) addListenerDelegate:v19];
        [v22 setDelegate:v19];
        [v22 resume];
        uint64_t v40 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
        uint64_t v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          id v28 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
          uint64_t v29 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134219266;
          id v43 = v28;
          __int16 v44 = 2112;
          uint64_t v45 = v29;
          __int16 v46 = 2080;
          uint64_t v47 = "-[FPXExtensionContext fetchServicesForItemID:allowRestrictedSources:completionHandler:]_block_invoke_2";
          __int16 v48 = 2112;
          uint64_t v49 = v23;
          __int16 v50 = 2112;
          char v51 = v18;
          __int16 v52 = 2112;
          uint64_t v53 = 0;
          _os_log_debug_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        __fp_pop_log(&v40);

        goto LABEL_26;
      }
    }
  }
  uint64_t v40 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v25 = fp_current_or_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
    uint64_t v31 = *(void *)(a1 + 32);
    __int16 v32 = [*(id *)(a1 + 40) internalErrorFromVendorError:v34 callerDescription:@"fetchServicesForItemID"];
    *(_DWORD *)buf = 134219266;
    id v43 = v30;
    __int16 v44 = 2112;
    uint64_t v45 = v31;
    __int16 v46 = 2080;
    uint64_t v47 = "-[FPXExtensionContext fetchServicesForItemID:allowRestrictedSources:completionHandler:]_block_invoke_2";
    __int16 v48 = 2112;
    uint64_t v49 = 0;
    __int16 v50 = 2112;
    char v51 = 0;
    __int16 v52 = 2112;
    uint64_t v53 = v32;
    _os_log_debug_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }
  uint64_t v26 = *(void *)(a1 + 64);
  id v27 = [*(id *)(a1 + 40) internalErrorFromVendorError:v34 callerDescription:@"fetchServicesForItemID"];
  (*(void (**)(uint64_t, void, void, void *))(v26 + 16))(v26, 0, 0, v27);

  __fp_pop_log(&v40);
LABEL_26:
}

id __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke_467(uint64_t a1, void *a2)
{
  id v2 = a2;
  Class v3 = objc_opt_new();
  uint64_t v4 = [v2 serviceName];
  [v3 setServiceName:v4];

  if (objc_opt_respondsToSelector())
  {
    id v5 = [v2 requiredEntitlement];
    [v3 setRequiredEntitlement:v5];
  }

  return v3;
}

- (void)fetchVendorEndpoint:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = FPXVendorXPCInterface();
  [v5 setInterface:v6];

  [v5 setExportedObject:self];
  [v5 setContext:self];
  uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
  id v8 = [v7 endpoint];
  [(FPXExtensionContext *)self addListenerDelegate:v5];
  [v7 setDelegate:v5];
  [v7 resume];
  id v10 = fpfs_adopt_log(self->_log);
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = FPPopLogSectionForBlock(v4);
    __int16 v13 = 2112;
    uint64_t v14 = self;
    __int16 v15 = 2080;
    id v16 = "-[FPXExtensionContext fetchVendorEndpoint:]";
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = 0;
    _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*((void (**)(id, void *, void))v4 + 2))(v4, v8, 0);
  __fp_pop_log(&v10);
}

- (id)_proxyWithCancellationHandler:(id)a3 forClientOperation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__FPXExtensionContext__proxyWithCancellationHandler_forClientOperation___block_invoke;
  v10[3] = &unk_1E5AF1240;
  id v11 = v5;
  id v7 = v5;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v10];
  [v8 setCancellationHandler:v7];

  return v6;
}

void __72__FPXExtensionContext__proxyWithCancellationHandler_forClientOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__FPXExtensionContext__proxyWithCancellationHandler_forClientOperation___block_invoke_cold_1(v3);
  }

  [*(id *)(a1 + 32) cancel];
}

- (void)preflightReparentItemIDs:(id)a3 underParentID:(id)a4 reply:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = fpfs_adopt_log(self->_log);
  id v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = logStringForObjects(v8);
    *(_DWORD *)buf = 138413058;
    long long v22 = self;
    __int16 v23 = 2080;
    uint64_t v24 = "-[FPXExtensionContext preflightReparentItemIDs:underParentID:reply:]";
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }
  if ([v8 count])
  {
    instanceQueue = self->_instanceQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke;
    v15[3] = &unk_1E5AF1158;
    v15[4] = self;
    id v16 = v8;
    id v18 = v10;
    id v17 = v9;
    fp_dispatch_async_with_logs(instanceQueue, v15);
  }
  else
  {
    __int16 v19 = fpfs_adopt_log(self->_log);
    __int16 v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(v10);
      -[FPXExtensionContext preflightReparentItemIDs:underParentID:reply:]();
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
    __fp_pop_log(&v19);
  }
  __fp_pop_log(&v20);
}

void __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  Class v1 = *(void **)(a1 + 32);
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  long long v37 = [v1 domainContextForItemID:v3];

  id v4 = [v37 domain];
  id v5 = [v4 personaIdentifier];
  if (v5)
  {
    id v6 = [v37 domain];
    id v7 = [v6 personaIdentifier];
    id v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v9 = [v8 currentPersona];
    id v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = NSString;
      __int16 v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v14 = [v13 currentPersona];
      __int16 v15 = [v14 userPersonaUniqueString];
      id v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      __int16 v19 = [v37 domain];
      uint64_t v20 = [v19 personaIdentifier];
      uint64_t v21 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v20];

      long long v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext preflightReparentItemIDs:underParentID:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2398, (const char *)[v21 UTF8String]);
    }
  }
  else
  {
  }
  long long v36 = [v37 instanceWithPrivateSelector:sel_preflightReparentItemWithIdentifier_toParentItemWithIdentifier_completionHandler_];
  if (v36)
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy_;
    v51[4] = __Block_byref_object_dispose_;
    id v52 = 0;
    __int16 v23 = dispatch_group_create();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(obj);
          }
          __int16 v27 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v28 = (void *)MEMORY[0x1A6248870]();
          dispatch_group_enter(v23);
          uint64_t v29 = [v27 identifier];
          uint64_t v30 = [*(id *)(a1 + 48) identifier];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_484;
          v41[3] = &unk_1E5AF1268;
          id v42 = v37;
          id v43 = v23;
          __int16 v44 = v51;
          [v36 preflightReparentItemWithIdentifier:v29 toParentItemWithIdentifier:v30 completionHandler:v41];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v24);
    }

    uint64_t v31 = *(void *)(a1 + 32);
    __int16 v32 = *(NSObject **)(v31 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_3;
    block[3] = &unk_1E5AF1290;
    void block[4] = v31;
    id v39 = *(id *)(a1 + 56);
    uint64_t v40 = v51;
    dispatch_group_notify(v23, v32, block);

    _Block_object_dispose(v51, 8);
  }
  else
  {
    uint64_t v49 = fpfs_adopt_log(*(void **)(*(void *)v2 + 72));
    id v33 = fp_current_or_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 56));
      __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log(&v49);
  }
}

void __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_484(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_2;
  v8[3] = &unk_1E5AF0D50;
  id v9 = *(id *)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v4, "fp_map:", v8);
  id v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = v4;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) internalErrorFromVendorError:a2 callerDescription:@"preflightReparentItemIDs"];
}

void __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 134218754;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2080;
    uint64_t v12 = "-[FPXExtensionContext preflightReparentItemIDs:underParentID:reply:]_block_invoke_3";
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_debug_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v6);
}

- (void)_indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  id v37 = a3;
  id v36 = a4;
  id v35 = (void (**)(void))a6;
  __int16 v9 = self->_domainContext;
  uint64_t v10 = [(FPXDomainContext *)v9 domain];
  uint64_t v11 = [v10 personaIdentifier];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    __int16 v13 = [(FPXDomainContext *)v9 domain];
    uint64_t v14 = [v13 personaIdentifier];
    uint64_t v15 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v16 = [v15 currentPersona];
    id v17 = [v16 userPersonaUniqueString];
    char v18 = [v14 isEqualToString:v17];

    if ((v18 & 1) == 0)
    {
      __int16 v19 = NSString;
      uint64_t v20 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v21 = [v20 currentPersona];
      long long v22 = [v21 userPersonaUniqueString];
      __int16 v23 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v24 = [v23 currentPersona];
      uint64_t v25 = [v24 uid];
      uint64_t v26 = [(FPXDomainContext *)v9 domain];
      __int16 v27 = [v26 personaIdentifier];
      id v28 = [v19 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v22, v25, v27];

      uint64_t v29 = fp_current_or_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext _indexOutOfBandUpdatedItems:deletedItems:indexReason:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2441, (const char *)[v28 UTF8String]);
    }
  }
  else
  {
  }
  uint64_t v30 = [(FPXDomainContext *)v9 spotlightIndexer];
  uint64_t v31 = [(FPXExtensionContext *)self providerIdentifier];
  if ([v31 isEqual:@"com.apple.filesystems.UserFS.FileProvider"])
  {
    int v32 = 0;
  }
  else
  {
    id v33 = [(FPXExtensionContext *)self providerIdentifier];
    int v32 = [v33 isEqual:@"com.apple.SMBClientProvider.FileProvider"] ^ 1;
  }
  if (!self->_usesFPFS && v32 && v30 && ([v37 count] || objc_msgSend(v36, "count")))
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __94__FPXExtensionContext__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke;
    v38[3] = &unk_1E5AF12B8;
    id v39 = v37;
    id v40 = v36;
    uint64_t v41 = self;
    id v42 = v35;
    [v30 indexOutOfBandUpdatedItems:v39 deletedItems:v40 indexReason:a5 completionHandler:v38];
  }
  else
  {
    v35[2](v35);
  }
}

void __94__FPXExtensionContext__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [*(id *)(a1 + 32) count];
      int v6 = [*(id *)(a1 + 40) count];
      id v7 = objc_msgSend(v3, "fp_prettyDescription");
      v8[0] = 67109634;
      v8[1] = v5;
      __int16 v9 = 1024;
      int v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] out-of-band indexing of %u updates, %u deletions failed with error %@", (uint8_t *)v8, 0x18u);
    }
  }
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 48) + 32), *(dispatch_block_t *)(a1 + 56));
}

- (void)deleteItemsWithIDs:(id)a3 baseVersions:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  v26[6] = *(void **)MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v26[0] = fpfs_adopt_log(self->_log);
  uint64_t v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    logStringForObjects(v11);
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext deleteItemsWithIDs:baseVersions:options:reply:]();
  }

  instanceQueue = self->_instanceQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke;
  v19[3] = &unk_1E5AF1358;
  id v16 = v11;
  id v20 = v16;
  id v17 = v12;
  SEL v24 = a2;
  id v21 = v17;
  long long v22 = self;
  id v18 = v13;
  id v23 = v18;
  unint64_t v25 = a5;
  fp_dispatch_async_with_logs(instanceQueue, v19);

  __fp_pop_log(v26);
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke(uint64_t a1)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if (v2 != [*(id *)(a1 + 40) count])
  {
    long long v46 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 48), @"FPXExtensionContext.m", 2477, @"Number of itemIDs %lu doesn't match number of versions %lu", v2, objc_msgSend(*(id *)(a1 + 40), "count"));
  }
  uint64_t v49 = v2;
  if (v2)
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 32) firstObject];
    char v51 = [v3 domainContextForItemID:v4];

    int v5 = [v51 domain];
    int v6 = [v5 personaIdentifier];
    if (v6)
    {
      id v7 = [v51 domain];
      id v8 = [v7 personaIdentifier];
      __int16 v9 = [MEMORY[0x1E4FB36F8] sharedManager];
      int v10 = [v9 currentPersona];
      id v11 = [v10 userPersonaUniqueString];
      char v12 = [v8 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = NSString;
        uint64_t v14 = [MEMORY[0x1E4FB36F8] sharedManager];
        uint64_t v15 = [v14 currentPersona];
        id v16 = [v15 userPersonaUniqueString];
        id v17 = [MEMORY[0x1E4FB36F8] sharedManager];
        id v18 = [v17 currentPersona];
        uint64_t v19 = [v18 uid];
        id v20 = [v51 domain];
        id v21 = [v20 personaIdentifier];
        long long v22 = [v13 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v16, v19, v21];

        id v23 = fp_current_or_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          +[FPXExtensionContext principalClass]();
        }

        __assert_rtn("-[FPXExtensionContext deleteItemsWithIDs:baseVersions:options:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2483, (const char *)[v22 UTF8String]);
      }
    }
    else
    {
    }
    __int16 v50 = [v51 vendorInstance];
    uint64_t v25 = *(void *)(a1 + 72);
    BOOL v47 = (v25 & 0xFFFFFFFF80000000) == 0xFFFFFFFF80000000;
    if (*(unsigned char *)(*(void *)(a1 + 48) + 112)) {
      unint64_t v26 = 0;
    }
    else {
      unint64_t v26 = 0xFFFFFFFF80000000;
    }
    __int16 v27 = fp_current_or_default_log();
    unint64_t v48 = v26 | v25 & 0x7FFFFFFF;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = [*(id *)(a1 + 32) count];
      uint64_t v29 = @"recursively ";
      if (!(v26 & 1 | v25 & 1)) {
        uint64_t v29 = &stru_1EF68D1F8;
      }
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v29;
      if ((v25 & 0xFFFFFFFF80000000) == 0xFFFFFFFF80000000) {
        uint64_t v30 = @"ignoring versions";
      }
      else {
        uint64_t v30 = &stru_1EF68D1F8;
      }
      *(_WORD *)&buf[22] = 2112;
      v75 = (uint64_t (*)(uint64_t, uint64_t))v30;
      _os_log_impl(&dword_1A33AE000, v27, OS_LOG_TYPE_INFO, "[INFO] Received request to delete %lu itemIDs %@%@", buf, 0x20u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v75 = __Block_byref_object_copy_;
    id v76 = __Block_byref_object_dispose_;
    id v77 = 0;
    v72[0] = 0;
    v72[1] = v72;
    v72[2] = (void *)0x3032000000;
    v72[3] = __Block_byref_object_copy_;
    void v72[4] = __Block_byref_object_dispose_;
    id v73 = 0;
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x3032000000;
    v70[3] = __Block_byref_object_copy_;
    v70[4] = __Block_byref_object_dispose_;
    id v71 = 0;
    id v71 = (id)objc_opt_new();
    uint64_t v31 = dispatch_group_create();
    uint64_t v32 = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x3032000000;
    v68[3] = __Block_byref_object_copy_;
    void v68[4] = __Block_byref_object_dispose_;
    id v69 = 0;
    do
    {
      id v33 = (void *)MEMORY[0x1A6248870]();
      id v34 = [*(id *)(a1 + 32) objectAtIndex:v32];
      id v35 = [*(id *)(a1 + 40) objectAtIndex:v32];
      id v36 = [v35 versionRewritingBeforeFirstSync];

      dispatch_group_enter(v31);
      id v37 = [v34 identifier];
      long long v38 = +[NSFileProviderRequest requestFromTheSystem];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_503;
      v59[3] = &unk_1E5AF12E0;
      id v39 = v31;
      uint64_t v60 = v39;
      uint64_t v63 = v70;
      id v40 = v34;
      BOOL v67 = v47;
      id v61 = v40;
      id v64 = buf;
      id v65 = v72;
      id v41 = v51;
      id v62 = v41;
      uint64_t v66 = v68;
      id v42 = (id)[v50 deleteItemWithIdentifier:v37 baseVersion:v36 options:v48 request:v38 completionHandler:v59];

      ++v32;
    }
    while (v49 != v32);
    uint64_t v43 = *(void *)(a1 + 48);
    __int16 v44 = *(NSObject **)(v43 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_509;
    block[3] = &unk_1E5AF1330;
    void block[4] = v43;
    uint64_t v54 = v70;
    uint64_t v55 = buf;
    uint64_t v56 = v68;
    uint64_t v45 = *(void *)(a1 + 72);
    uint64_t v57 = v72;
    uint64_t v58 = v45;
    id v53 = *(id *)(a1 + 56);
    dispatch_group_notify(v39, v44, block);

    _Block_object_dispose(v68, 8);
    _Block_object_dispose(v70, 8);

    _Block_object_dispose(v72, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v72[0] = fpfs_adopt_log(*(void **)(*(void *)(a1 + 48) + 72));
    SEL v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 56));
      __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log(v72);
  }
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_503(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = objc_msgSend(v3, "fp_isFileProviderError:", -1005);
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  if (v4)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 40)];
    objc_sync_exit(v5);

    goto LABEL_22;
  }
  if (!objc_msgSend(v3, "fp_isFileProviderError:", -1006)) {
    goto LABEL_16;
  }
  if (!*(unsigned char *)(a1 + 88))
  {
    id v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1A33AE000, v18, OS_LOG_TYPE_INFO, "[INFO] Received out-of-date error, but no retry requested", (uint8_t *)&v22, 2u);
    }
    goto LABEL_15;
  }
  int v6 = objc_msgSend(v3, "fp_userInfoItem");
  if (!v6)
  {
    id v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_deleteItemWithIdentifier_baseVersion_options_completionHandler_);
      objc_claimAutoreleasedReturnValue();
      __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_503_cold_1();
    }
LABEL_15:

LABEL_16:
    int v6 = [*(id *)(a1 + 48) internalErrorFromVendorError:v3 callerDescription:@"deleteItemsWithID"];
    uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
    id v20 = v6;
    if (!v6) {
      id v20 = *(void **)(v19 + 40);
    }
    objc_storeStrong((id *)(v19 + 40), v20);
    goto LABEL_19;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    __int16 v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    char v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  id v13 = [*(id *)(a1 + 48) itemFromVendorItem:v6];
  uint64_t v14 = [v13 itemID];
  uint64_t v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v22 = 138412290;
    id v23 = v14;
    _os_log_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_INFO, "[INFO] Adding item %@ to retry list because of version conflict", (uint8_t *)&v22, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v14];
  id v16 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v17 = [v13 itemVersion];
  [v16 addObject:v17];

LABEL_19:
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    id v21 = *(id *)(a1 + 32);
    objc_sync_enter(v21);
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 40)];
    objc_sync_exit(v21);
  }
  objc_sync_exit(v5);

LABEL_22:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_509(uint64_t a1)
{
  Class v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_2;
  v4[3] = &unk_1E5AF1308;
  long long v6 = *(_OWORD *)(a1 + 56);
  v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = v3;
  id v5 = *(id *)(a1 + 40);
  [v1 _indexOutOfBandUpdatedItems:MEMORY[0x1E4F1CBF0] deletedItems:v2 indexReason:0 completionHandler:v4];
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 48;
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]
    && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    int v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_2_cold_1(v2, v4);
    }

    [*(id *)(a1 + 32) deleteItemsWithIDs:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) baseVersions:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) options:*(void *)(a1 + 72) & 0x7FFFFFFFLL reply:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "-[FPXExtensionContext deleteItemsWithIDs:baseVersions:options:reply:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_debug_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v8);
  }
}

- (id)deleteItemWithID:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v34 = fpfs_adopt_log(self->_log);
  uint64_t v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v36 = self;
    __int16 v37 = 2080;
    long long v38 = "-[FPXExtensionContext deleteItemWithID:baseVersion:options:request:completionHandler:]";
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2112;
    id v42 = v14;
    _os_log_debug_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }

  uint64_t v17 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  instanceQueue = self->_instanceQueue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __86__FPXExtensionContext_deleteItemWithID_baseVersion_options_request_completionHandler___block_invoke;
  v27[3] = &unk_1E5AF1380;
  v27[4] = self;
  id v19 = v12;
  id v28 = v19;
  unint64_t v33 = a5;
  id v20 = v13;
  id v29 = v20;
  id v21 = v14;
  id v30 = v21;
  id v22 = v15;
  id v32 = v22;
  id v23 = v17;
  id v31 = v23;
  fp_dispatch_async_with_logs(instanceQueue, v27);
  uint64_t v24 = v31;
  id v25 = v23;

  __fp_pop_log(&v34);

  return v25;
}

void __86__FPXExtensionContext_deleteItemWithID_baseVersion_options_request_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) domainContextForItemID:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [v2 domain];
    uint64_t v7 = [v6 personaIdentifier];
    uint64_t v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    __int16 v9 = [v8 currentPersona];
    uint64_t v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = NSString;
      id v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v14 = [v13 currentPersona];
      id v15 = [v14 userPersonaUniqueString];
      uint64_t v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      id v19 = [v2 domain];
      id v20 = [v19 personaIdentifier];
      id v21 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v20];

      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext deleteItemWithID:baseVersion:options:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2596, (const char *)[v21 UTF8String]);
    }
  }
  else
  {
  }
  id v23 = [v2 vendorInstance];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 112)) {
    unint64_t v24 = 0;
  }
  else {
    unint64_t v24 = 0xFFFFFFFF80000000;
  }
  unint64_t v25 = v24 | *(void *)(a1 + 80);
  unint64_t v26 = [*(id *)(a1 + 40) identifier];
  __int16 v27 = [*(id *)(a1 + 48) versionRewritingBeforeFirstSync];
  uint64_t v28 = *(void *)(a1 + 56);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __86__FPXExtensionContext_deleteItemWithID_baseVersion_options_request_completionHandler___block_invoke_2;
  v31[3] = &unk_1E5AF12B8;
  v31[4] = *(void *)(a1 + 32);
  id v29 = v2;
  id v32 = v29;
  id v33 = *(id *)(a1 + 56);
  id v34 = *(id *)(a1 + 72);
  id v30 = [v23 deleteItemWithIdentifier:v26 baseVersion:v27 options:v25 request:v28 completionHandler:v31];

  if (v30) {
    [*(id *)(a1 + 64) addChild:v30 withPendingUnitCount:100];
  }
}

void __86__FPXExtensionContext_deleteItemWithID_baseVersion_options_request_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  uint64_t v7 = [v3 currentResponseWithRequest:v4];
  uint64_t v8 = [*v5 internalErrorFromVendorError:v6 callerDescription:@"deleteItemWithID"];

  id v12 = fpfs_adopt_log(*((void **)*(v5 - 1) + 9));
  __int16 v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    id v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2080;
    uint64_t v18 = "-[FPXExtensionContext deleteItemWithID:baseVersion:options:request:completionHandler:]_block_invoke_2";
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  __fp_pop_log(&v12);
}

- (BOOL)_inlineSymlinkTarget:(id)a3 url:(id *)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = *a4;
  if (!v8) {
    goto LABEL_9;
  }
  __int16 v9 = [v7 contentType];
  if (([v9 conformsToType:*MEMORY[0x1E4F444D8]] & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v10 = [v7 symlinkTargetPath];

  if (v10)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_10;
  }
  memset(&v19, 0, sizeof(v19));
  id v11 = v8;
  if (lstat((const char *)objc_msgSend(v11, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v19))
  {
    goto LABEL_5;
  }
  if ((~v19.st_mode & 0xA000) == 0)
  {
    bzero(v20, 0x401uLL);
    ssize_t v14 = readlink((const char *)[v11 fileSystemRepresentation], v20, 0x400uLL);
    if (v14 < 0)
    {
LABEL_5:
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_7;
    }
    v20[v14] = 0;
    __int16 v15 = objc_msgSend(NSString, "fp_pathWithFileSystemRepresentation:", v20);
    [v7 setSymlinkTargetPath:v15];

    goto LABEL_15;
  }
  uint64_t v16 = [NSString stringWithContentsOfURL:v11 encoding:4 error:a5];
  [v7 setSymlinkTargetPath:v16];

  __int16 v17 = [v7 symlinkTargetPath];

  if (v17)
  {
LABEL_15:
    [v11 stopAccessingSecurityScopedResource];
    *a4 = 0;
    uint64_t v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[FPXExtensionContext _inlineSymlinkTarget:url:error:]();
    }

    goto LABEL_9;
  }
LABEL_7:
  BOOL v12 = 0;
LABEL_10:

  return v12;
}

- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 bounce:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v42 = a8;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  unint64_t v48 = (char *)a3;
  id v47 = a5;
  id v45 = a7;
  id v46 = a9;
  uint64_t v57 = fpfs_adopt_log(self->_log);
  BOOL v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413570;
    __int16 v59 = self;
    __int16 v60 = 2080;
    id v61 = "-[FPXExtensionContext createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:]";
    __int16 v62 = 2112;
    uint64_t v63 = v48;
    __int16 v64 = 1024;
    *(_DWORD *)id v65 = a4;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = a6;
    *(_WORD *)uint64_t v66 = 2112;
    *(void *)&v66[2] = v47;
    _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@ fields=%x options=%x contentURL=%@", buf, 0x36u);
  }

  id v13 = self;
  objc_sync_enter(v13);
  uint64_t v49 = v13->_domainContext;
  objc_sync_exit(v13);

  ssize_t v14 = [(FPXDomainContext *)v49 domain];
  __int16 v15 = [v14 personaIdentifier];
  if (v15)
  {
    uint64_t v16 = [(FPXDomainContext *)v49 domain];
    __int16 v17 = [v16 personaIdentifier];
    uint64_t v18 = [MEMORY[0x1E4FB36F8] sharedManager];
    stat v19 = [v18 currentPersona];
    id v20 = [v19 userPersonaUniqueString];
    char v21 = [v17 isEqualToString:v20];

    if ((v21 & 1) == 0)
    {
      id v22 = NSString;
      uint64_t v23 = [MEMORY[0x1E4FB36F8] sharedManager];
      unint64_t v24 = [v23 currentPersona];
      unint64_t v25 = [v24 userPersonaUniqueString];
      unint64_t v26 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v27 = [v26 currentPersona];
      uint64_t v28 = [v27 uid];
      id v29 = [(FPXDomainContext *)v49 domain];
      id v30 = [v29 personaIdentifier];
      id v31 = [v22 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v25, v28, v30];

      id v32 = fp_current_or_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2684, (const char *)[v31 UTF8String]);
    }
  }
  else
  {
  }
  id v33 = [v47 url];
  [v33 startAccessingSecurityScopedResource];
  id v55 = 0;
  id v56 = v33;
  BOOL v34 = [(FPXExtensionContext *)v13 _inlineSymlinkTarget:v48 url:&v56 error:&v55];
  id v35 = v56;

  id v36 = v55;
  if (v34)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __106__FPXExtensionContext_createItemBasedOnTemplate_fields_contents_options_request_bounce_completionHandler___block_invoke;
    v50[3] = &unk_1E5AF13A8;
    id v51 = v35;
    id v52 = v13;
    id v53 = v46;
    __int16 v37 = [(FPXExtensionContext *)v13 _createItemBasedOnTemplate:v48 fields:a4 contents:v51 options:a6 request:v45 bounce:v42 bounceNumber:0 completionHandler:v50];

    long long v38 = v51;
  }
  else
  {
    long long v38 = [(FPXDomainContext *)v49 currentResponseWithRequest:v45];
    uint64_t v54 = fpfs_adopt_log(self->_log);
    __int16 v39 = fp_current_or_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      __int16 v41 = (FPXExtensionContext *)FPPopLogSectionForBlock(v46);
      *(_DWORD *)buf = 134219778;
      __int16 v59 = v41;
      __int16 v60 = 2112;
      id v61 = (const char *)v13;
      __int16 v62 = 2080;
      uint64_t v63 = "-[FPXExtensionContext createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:]";
      __int16 v64 = 2112;
      *(void *)id v65 = 0;
      *(_WORD *)&v65[8] = 1024;
      *(_DWORD *)uint64_t v66 = 0;
      *(_WORD *)&void v66[4] = 1024;
      *(_DWORD *)&v66[6] = 0;
      __int16 v67 = 2112;
      uint64_t v68 = v38;
      __int16 v69 = 2112;
      id v70 = v36;
      _os_log_debug_impl(&dword_1A33AE000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, 0x%x, %{BOOL}d, %@, %@", buf, 0x4Au);
    }

    (*((void (**)(id, void, void, void, void *, id))v46 + 2))(v46, 0, 0, 0, v38, v36);
    __fp_pop_log(&v54);

    __int16 v37 = 0;
  }

  __fp_pop_log(&v57);

  return v37;
}

void __106__FPXExtensionContext_createItemBasedOnTemplate_fields_contents_options_request_bounce_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  stat v19 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
  ssize_t v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v17 = *(void *)(a1 + 40);
    if (v13) {
      id v18 = 0;
    }
    else {
      id v18 = v11;
    }
    *(_DWORD *)buf = 134219778;
    char v21 = v16;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    __int16 v24 = 2080;
    unint64_t v25 = "-[FPXExtensionContext createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v18;
    __int16 v28 = 2048;
    uint64_t v29 = a3;
    __int16 v30 = 1024;
    int v31 = a4;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_debug_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, 0x%lx, %{BOOL}d, %@, %@", buf, 0x4Eu);
  }

  if (v13) {
    id v15 = 0;
  }
  else {
    id v15 = v11;
  }
  (*(void (**)(void, id, uint64_t, uint64_t, id, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v15, a3, a4, v12, v13);
  __fp_pop_log(&v19);
}

- (void)_freeSlotHeldByItem:(id)a3 request:(id)a4 bounceIndex:(unint64_t)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v9 filename];
  id v32 = 0;
  id v31 = 0;
  id v13 = objc_msgSend(v12, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v32, &v31, objc_msgSend(v9, "isFolder"));
  id v14 = v32;
  id v15 = v31;

  if ([v14 unsignedIntegerValue] == a5)
  {
    uint64_t v16 = [v14 unsignedIntegerValue];
    if ((unint64_t)(v16 + 1) > 2) {
      a5 = v16 + 1;
    }
    else {
      a5 = 2;
    }
  }
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:a5];
  id v18 = objc_msgSend(v13, "fp_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v17, v15, 0);

  stat v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext _freeSlotHeldByItem:request:bounceIndex:completionHandler:]((uint64_t)v9);
  }

  [v9 setFilename:v18];
  id v20 = [v9 itemVersion];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__FPXExtensionContext__freeSlotHeldByItem_request_bounceIndex_completionHandler___block_invoke;
  v26[3] = &unk_1E5AF13D0;
  v26[4] = self;
  id v27 = v9;
  id v29 = v11;
  unint64_t v30 = a5;
  id v28 = v10;
  id v21 = v11;
  id v22 = v10;
  id v23 = v9;
  id v24 = [(FPXExtensionContext *)self modifyItem:v23 baseVersion:v20 changedFields:2 contents:0 options:0 request:v22 completionHandler:v26];
}

void __81__FPXExtensionContext__freeSlotHeldByItem_request_bounceIndex_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a6;
  id v7 = objc_msgSend(v8, "fp_userInfoItem");

  if (v7) {
    [*(id *)(a1 + 32) _freeSlotHeldByItem:*(void *)(a1 + 40) request:*(void *)(a1 + 48) bounceIndex:*(void *)(a1 + 64) + 1 completionHandler:*(void *)(a1 + 56)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)_createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 bounce:(BOOL)a8 bounceNumber:(id)a9 completionHandler:(id)a10
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  id v18 = a10;
  if (v15)
  {
    stat v19 = [v14 documentSize];
    uint64_t v20 = [v19 longLongValue];

    if (v20 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v20;
    }
  }
  else
  {
    uint64_t v21 = 100;
  }
  id v22 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v21];
  instanceQueue = self->_instanceQueue;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke;
  v35[3] = &unk_1E5AF1448;
  v35[4] = self;
  id v36 = v14;
  unint64_t v42 = a6;
  unint64_t v43 = a4;
  id v37 = v17;
  id v38 = v16;
  BOOL v45 = a8;
  id v39 = v15;
  id v41 = v18;
  id v24 = v22;
  id v40 = v24;
  uint64_t v44 = v21;
  id v25 = v18;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  id v29 = v14;
  fp_dispatch_async_with_logs(instanceQueue, v35);
  unint64_t v30 = v40;
  id v31 = v24;

  return v31;
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) itemID];
  uint64_t v4 = [v2 domainContextForItemID:v3];

  id v5 = [v4 domain];
  uint64_t v6 = [v5 personaIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v4 domain];
    id v9 = [v8 personaIdentifier];
    id v10 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v11 = [v10 currentPersona];
    id v12 = [v11 userPersonaUniqueString];
    char v13 = [v9 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      id v14 = NSString;
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v16 = [v15 currentPersona];
      id v17 = [v16 userPersonaUniqueString];
      id v18 = [MEMORY[0x1E4FB36F8] sharedManager];
      stat v19 = [v18 currentPersona];
      uint64_t v20 = [v19 uid];
      uint64_t v21 = [v4 domain];
      id v22 = [v21 personaIdentifier];
      id v23 = [v14 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v17, v20, v22];

      id v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext _createItemBasedOnTemplate:fields:contents:options:request:bounce:bounceNumber:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2772, (const char *)[v23 UTF8String]);
    }
  }
  else
  {
  }
  id v25 = [v4 vendorInstance];
  uint64_t v26 = *(void *)(a1 + 88);
  BOOL v27 = (v26 & 0x10000) == 0;
  id v28 = *(id *)(a1 + 40);
  uint64_t v29 = *(void *)(a1 + 96);
  if ((v26 & 0x10000) != 0 && *(void *)(a1 + 48))
  {
    unint64_t v30 = (void *)[*(id *)(a1 + 40) copy];

    id v31 = [*(id *)(a1 + 40) filename];
    id v32 = objc_msgSend(v31, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(*(id *)(a1 + 48), "longValue"), objc_msgSend(*(id *)(a1 + 40), "isFolder"));
    [v30 setFilename:v32];

    v29 |= 2uLL;
    id v28 = v30;
  }
  unsigned int v33 = (v26 >> 17) & 1;
  __int16 v34 = fp_current_or_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_cold_1(v28, a1, v34);
  }

  uint64_t v35 = *(unsigned __int16 *)(a1 + 88);
  uint64_t v37 = *(void *)(a1 + 56);
  uint64_t v36 = *(void *)(a1 + 64);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515;
  v47[3] = &unk_1E5AF1420;
  id v38 = v4;
  id v48 = v38;
  char v58 = *(unsigned char *)(a1 + 112);
  BOOL v59 = v27;
  id v49 = *(id *)(a1 + 40);
  id v39 = *(id *)(a1 + 48);
  char v60 = v33;
  uint64_t v40 = *(void *)(a1 + 32);
  id v50 = v39;
  uint64_t v51 = v40;
  id v41 = v28;
  id v52 = v41;
  id v53 = *(id *)(a1 + 56);
  id v42 = *(id *)(a1 + 80);
  uint64_t v43 = *(void *)(a1 + 96);
  id v55 = v42;
  uint64_t v56 = v43;
  id v44 = *(id *)(a1 + 64);
  uint64_t v45 = *(void *)(a1 + 88);
  id v54 = v44;
  uint64_t v57 = v45;
  id v46 = [v25 createItemBasedOnTemplate:v41 fields:v29 contents:v36 options:v35 request:v37 completionHandler:v47];
  if (v46) {
    [*(id *)(a1 + 72) addChild:v46 withPendingUnitCount:*(void *)(a1 + 104)];
  }
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = [*(id *)(a1 + 32) internalErrorFromVendorError:a5 callerDescription:@"createItemBasedOnTemplate"];
  id v11 = v10;
  if ((*(unsigned char *)(a1 + 112) || *(unsigned char *)(a1 + 113))
    && (objc_msgSend(v10, "fp_userInfoItem"), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (char v13 = (void *)v12, v14 = objc_msgSend(v11, "fp_isFileProviderError:", -1001), v13, v14))
  {
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    if (!*(unsigned char *)(a1 + 114) && !*(unsigned char *)(a1 + 113))
    {
      id v17 = (void *)[v15 copy];

      id v18 = [v17 filename];
      v103[0] = v16;
      stat v19 = objc_msgSend(v18, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", v103, 0, objc_msgSend(v17, "isFolder"));
      id v20 = v103[0];
      uint64_t v21 = v16;
      id v16 = v20;

      [v17 setFilename:v19];
      id v15 = v17;
    }
    id v22 = NSNumber;
    uint64_t v23 = [v16 longValue];
    if (v23 <= 1) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = v23;
    }
    __int16 v86 = [v22 numberWithLong:v24 + 1];
    if ([*(id *)(*(void *)(a1 + 56) + 104) supportsPickingFolders]
      && ([*(id *)(*(void *)(a1 + 56) + 104) isUsingFPFS] & 1) == 0)
    {
      id v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_6(a1);
      }

      uint64_t v26 = [*(id *)(a1 + 32) v2Instance];
      BOOL v27 = [*(id *)(a1 + 64) parentItemIdentifier];
      __int16 v82 = v26;
      id v28 = [v26 URLForItemWithPersistentIdentifier:v27];

      uint64_t v29 = [*(id *)(a1 + 64) filename];
      uint64_t v30 = [*(id *)(a1 + 64) isFolder];
      id v102 = 0;
      id v81 = v28;
      uint64_t v31 = objc_msgSend(v28, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v29, v30, 0, &v102, 0);
      id v32 = v102;

      uint64_t v83 = (void *)v31;
      if (v31 && v32)
      {
        id v84 = v16;
        unsigned int v33 = NSNumber;
        uint64_t v34 = [v32 longValue];
        uint64_t v35 = [v86 longValue];
        if (v34 + 1 > v35) {
          uint64_t v36 = v34 + 1;
        }
        else {
          uint64_t v36 = v35;
        }
        uint64_t v37 = [v33 numberWithLong:v36];

        id v38 = [*(id *)(a1 + 64) filename];
        id v101 = 0;
        id v39 = objc_msgSend(v38, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v101, 0, objc_msgSend(*(id *)(a1 + 64), "isFolder"));
        id v77 = v101;

        uint64_t v40 = [v83 lastPathComponent];
        id v41 = v37;
        uint64_t v42 = objc_msgSend(v40, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", 0, 0, objc_msgSend(v83, "fp_isFolder"));

        uint64_t v78 = (void *)v42;
        long long v79 = v39;
        uint64_t v43 = v42;
        id v44 = v77;
        __int16 v80 = v41;
        if ([v39 isEqualToString:v43]
          && v41 > v77
          && (unint64_t v45 = [v41 unsignedIntegerValue],
              v45 < objc_msgSend(NSString, "fp_maximumBounceLevel")))
        {
          id v46 = v41;

          id v47 = fp_current_or_default_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_3((uint64_t)v77);
          }
        }
        else
        {
          id v47 = fp_current_or_default_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_4((uint64_t)v41);
          }
          id v46 = v86;
        }
        id v16 = v84;

        __int16 v86 = v46;
        id v32 = v80;
      }
      else
      {
        id v44 = fp_current_or_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
          __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_5();
        }
      }
    }
    int v51 = *(unsigned __int8 *)(a1 + 113);
    id v52 = fp_current_or_default_log();
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
    if (v51)
    {
      id v85 = v16;
      if (v53) {
        __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_2(a1);
      }

      id v54 = *(void **)(a1 + 32);
      id v55 = objc_msgSend(v11, "fp_userInfoItem");
      uint64_t v56 = [v54 itemFromVendorItem:v55];

      uint64_t v57 = *(void **)(a1 + 56);
      uint64_t v58 = *(void *)(a1 + 72);
      uint64_t v59 = [v86 unsignedIntegerValue];
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_519;
      v87[3] = &unk_1E5AF13F8;
      id v95 = *(id *)(a1 + 88);
      id v88 = *(id *)(a1 + 32);
      id v89 = v9;
      uint64_t v96 = a3;
      char v99 = a4;
      id v60 = *(id *)(a1 + 72);
      uint64_t v61 = *(void *)(a1 + 56);
      __int16 v62 = *(void **)(a1 + 64);
      id v90 = v60;
      uint64_t v91 = v61;
      id v63 = v62;
      uint64_t v64 = *(void *)(a1 + 96);
      id v92 = v63;
      uint64_t v97 = v64;
      id v65 = *(id *)(a1 + 80);
      uint64_t v66 = *(void *)(a1 + 104);
      id v93 = v65;
      uint64_t v98 = v66;
      char v100 = *(unsigned char *)(a1 + 112);
      __int16 v67 = *(void **)(a1 + 48);
      uint64_t v68 = v86;
      id v94 = v67;
      [v57 _freeSlotHeldByItem:v56 request:v58 bounceIndex:v59 completionHandler:v87];

      id v16 = v85;
    }
    else
    {
      if (v53) {
        __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_1(a1);
      }

      __int16 v69 = *(void **)(a1 + 56);
      uint64_t v70 = *(void *)(a1 + 96);
      uint64_t v71 = *(void *)(a1 + 104) | 0x20000;
      uint64_t v73 = *(void *)(a1 + 72);
      uint64_t v72 = *(void *)(a1 + 80);
      uint64_t v74 = *(unsigned __int8 *)(a1 + 112);
      uint64_t v75 = *(void *)(a1 + 88);
      uint64_t v68 = v86;
      id v76 = (id)[v69 _createItemBasedOnTemplate:v15 fields:v70 contents:v72 options:v71 request:v73 bounce:v74 bounceNumber:v86 completionHandler:v75];
    }
  }
  else
  {
    uint64_t v48 = *(void *)(a1 + 88);
    id v49 = [*(id *)(a1 + 32) itemFromVendorItem:v9];
    id v50 = [*(id *)(a1 + 32) currentResponseWithRequest:*(void *)(a1 + 72)];
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t, void *, void *))(v48 + 16))(v48, v49, a3, a4, v50, v11);
  }
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_519(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    uint64_t v3 = *(void *)(a1 + 88);
    uint64_t v4 = [*(id *)(a1 + 32) itemFromVendorItem:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 96);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 120);
    id v7 = [*(id *)(a1 + 32) currentResponseWithRequest:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t, void *, id))(v3 + 16))(v3, v4, v5, v6, v7, v9);
  }
  else
  {
    id v8 = (id)[*(id *)(a1 + 56) _createItemBasedOnTemplate:*(void *)(a1 + 64) fields:*(void *)(a1 + 104) contents:*(void *)(a1 + 72) options:*(void *)(a1 + 112) | 0x20000 request:*(void *)(a1 + 48) bounce:*(unsigned __int8 *)(a1 + 121) bounceNumber:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 88)];
  }
}

- (void)_fetchHierarchyForItemID:(id)a3 into:(id)a4 maxDepth:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  char v13 = +[NSFileProviderRequest requestFromTheSystem];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__FPXExtensionContext__fetchHierarchyForItemID_into_maxDepth_completionHandler___block_invoke;
  v17[3] = &unk_1E5AF1470;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  unint64_t v21 = a5;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  [(FPXExtensionContext *)self itemForItemID:v16 request:v13 completionHandler:v17];
}

void __80__FPXExtensionContext__fetchHierarchyForItemID_into_maxDepth_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v51 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) domainContextForItemID:*(void *)(a1 + 40)];
  id v10 = [v9 domain];
  uint64_t v11 = [v10 personaIdentifier];
  id v52 = v9;
  if (!v11)
  {

    if (v7) {
      goto LABEL_4;
    }
LABEL_11:
    id v32 = fp_current_or_default_log();
    id v20 = v52;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      __80__FPXExtensionContext__fetchHierarchyForItemID_into_maxDepth_completionHandler___block_invoke_cold_1();
    }

    uint64_t v33 = *(void *)(a1 + 56);
    uint64_t v34 = [v52 internalErrorFromVendorError:v8 callerDescription:@"fetchHierarchyForItemID"];
    (*(void (**)(uint64_t, void, void *))(v33 + 16))(v33, 0, v34);
    goto LABEL_14;
  }
  id v12 = (void *)v11;
  [v9 domain];
  char v13 = v49 = v7;
  id v14 = [v13 personaIdentifier];
  [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v15 = a1;
  id v17 = v16 = v8;
  id v18 = [v17 currentPersona];
  id v19 = [v18 userPersonaUniqueString];
  char v47 = [v14 isEqualToString:v19];

  id v8 = v16;
  a1 = v15;

  id v7 = v49;
  if ((v47 & 1) == 0)
  {
    uint64_t v36 = NSString;
    uint64_t v37 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v38 = [v37 currentPersona];
    id v39 = [v38 userPersonaUniqueString];
    uint64_t v40 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v41 = [v40 currentPersona];
    uint64_t v42 = [v41 uid];
    uint64_t v43 = [v52 domain];
    id v44 = [v43 personaIdentifier];
    unint64_t v45 = [v36 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v39, v42, v44];

    id v46 = fp_current_or_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
      +[FPXExtensionContext principalClass]();
    }

    __assert_rtn("-[FPXExtensionContext _fetchHierarchyForItemID:into:maxDepth:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2913, (const char *)[v45 UTF8String]);
  }
  if (!v49) {
    goto LABEL_11;
  }
LABEL_4:
  [*(id *)(a1 + 48) addObject:v7];
  id v20 = v52;
  if ((unint64_t)[*(id *)(a1 + 48) count] >= *(void *)(a1 + 64)) {
    goto LABEL_16;
  }
  unint64_t v21 = [v7 itemIdentifier];
  id v22 = [v7 parentItemIdentifier];
  if (([v21 isEqualToString:v22] & 1) != 0
    || ([v7 parentItemIdentifier], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_16;
  }
  uint64_t v24 = (void *)v23;
  uint64_t v25 = objc_msgSend(v7, "fp_parentDomainIdentifier");
  uint64_t v26 = v7;
  if (v25)
  {
    BOOL v27 = (void *)v25;
    objc_msgSend(v26, "fp_parentDomainIdentifier");
    id v28 = v50 = v26;
    uint64_t v29 = [v52 domain];
    [v29 identifier];
    uint64_t v31 = v30 = v8;
    char v48 = [v28 isEqualToString:v31];

    id v8 = v30;
    id v7 = v50;
    if (v48) {
      goto LABEL_19;
    }
LABEL_16:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_17;
  }

LABEL_19:
  uint64_t v35 = *(void **)(a1 + 32);
  uint64_t v34 = [v7 parentItemID];
  [v35 _fetchHierarchyForItemID:v34 into:*(void *)(a1 + 48) maxDepth:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
LABEL_14:

LABEL_17:
}

- (void)fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 ignoreAlternateContentURL:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v17 = fpfs_adopt_log(self->_log);
  uint64_t v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v19 = self;
    __int16 v20 = 2080;
    unint64_t v21 = "-[FPXExtensionContext fetchHierarchyForItemID:recursively:ignoreAlternateContentURL:reply:]";
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 1024;
    BOOL v25 = v7;
    _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %{BOOL}d", buf, 0x26u);
  }

  id v12 = [MEMORY[0x1E4F1CA48] array];
  if (v7) {
    uint64_t v13 = 200;
  }
  else {
    uint64_t v13 = 2;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__FPXExtensionContext_fetchHierarchyForItemID_recursively_ignoreAlternateContentURL_reply___block_invoke;
  v15[3] = &unk_1E5AF1498;
  v15[4] = self;
  id v14 = v10;
  id v16 = v14;
  [(FPXExtensionContext *)self _fetchHierarchyForItemID:v9 into:v12 maxDepth:v13 completionHandler:v15];

  __fp_pop_log(&v17);
}

void __91__FPXExtensionContext_fetchHierarchyForItemID_recursively_ignoreAlternateContentURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v10 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  BOOL v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    id v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    id v16 = "-[FPXExtensionContext fetchHierarchyForItemID:recursively:ignoreAlternateContentURL:reply:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v10);
}

- (void)fetchDefaultContainerForBundleIdentifier:(id)a3 defaultName:(id)a4 inDomainIdentifier:(id)a5 lookupOnly:(BOOL)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  instanceQueue = self->_instanceQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke;
  v21[3] = &unk_1E5AF1560;
  void v21[4] = self;
  id v22 = v14;
  id v24 = v12;
  id v25 = v15;
  BOOL v26 = a6;
  id v23 = v13;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v14;
  fp_dispatch_async_with_logs(instanceQueue, v21);
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) domainContextForIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 domain];
  uint64_t v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v2 domain];
    BOOL v7 = [v6 personaIdentifier];
    id v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v9 = [v8 currentPersona];
    id v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = NSString;
      id v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v14 = [v13 currentPersona];
      id v15 = [v14 userPersonaUniqueString];
      id v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      id v19 = [v2 domain];
      id v20 = [v19 personaIdentifier];
      uint64_t v21 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v20];

      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext fetchDefaultContainerForBundleIdentifier:defaultName:inDomainIdentifier:lookupOnly:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2969, (const char *)[v21 UTF8String]);
    }
  }
  else
  {
  }
  id v23 = [*(id *)(a1 + 32) instanceWithPrivateSelector:sel__defaultApplicationContainerForBundleIdentifier_completionHandler_];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_2;
  v49[3] = &unk_1E5AF14C0;
  id v24 = v2;
  uint64_t v25 = *(void *)(a1 + 32);
  id v50 = v24;
  uint64_t v51 = v25;
  id v52 = *(id *)(a1 + 64);
  BOOL v26 = (void *)MEMORY[0x1A6248B00](v49);
  BOOL v27 = v26;
  if (*(unsigned char *)(a1 + 72))
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_528;
    v47[3] = &unk_1E5AF14E8;
    id v48 = v26;
    id v28 = (void (**)(void))MEMORY[0x1A6248B00](v47);
    uint64_t v29 = v48;
  }
  else
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_2_529;
    v43[3] = &unk_1E5AF0968;
    id v30 = *(void **)(a1 + 40);
    v43[4] = *(void *)(a1 + 32);
    id v44 = v30;
    id v45 = *(id *)(a1 + 48);
    id v46 = v27;
    id v28 = (void (**)(void))MEMORY[0x1A6248B00](v43);

    uint64_t v29 = v44;
  }

  if (v23)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4;
    v35[3] = &unk_1E5AF1538;
    uint64_t v31 = *(void *)(a1 + 56);
    id v39 = *(id *)(a1 + 64);
    id v36 = v24;
    char v42 = *(unsigned char *)(a1 + 72);
    id v32 = *(id *)(a1 + 48);
    uint64_t v33 = *(void *)(a1 + 32);
    id v37 = v32;
    uint64_t v38 = v33;
    uint64_t v40 = v28;
    id v41 = v27;
    id v34 = (id)[v23 _defaultApplicationContainerForBundleIdentifier:v31 completionHandler:v35];
  }
  else
  {
    v28[2](v28);
  }
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) internalErrorFromVendorError:a3 callerDescription:@"fetchDefaultContainerForBundleIdentifier"];
  BOOL v7 = objc_msgSend(v6, "fp_userInfoFPItem");

  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "fp_userInfoFPItem");

    id v6 = 0;
    id v5 = (id)v8;
  }
  id v12 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
  uint64_t v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    id v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2080;
    uint64_t v18 = "-[FPXExtensionContext fetchDefaultContainerForBundleIdentifier:defaultName:inDomainIdentifier:lookupOnly:reply"
          ":]_block_invoke_2";
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v12);
}

uint64_t __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_528(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_2_529(uint64_t a1)
{
  uint64_t v2 = @"NSFileProviderRootContainerItemIdentifier";
  uint64_t v3 = [*(id *)(a1 + 32) providerIdentifier];
  int v4 = objc_msgSend(v3, "fp_isiCloudDriveIdentifier");

  if (v4)
  {
    id v5 = @"a1";

    uint64_t v2 = v5;
  }
  id v6 = [FPItem alloc];
  BOOL v7 = [*(id *)(a1 + 32) providerIdentifier];
  uint64_t v8 = [(FPItem *)v6 initWithProviderID:v7 domainIdentifier:*(void *)(a1 + 40) itemIdentifier:@"__" parentItemIdentifier:v2 filename:*(void *)(a1 + 48) isDirectory:1];

  [(FPItem *)v8 setFileSystemFlags:7];
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = +[NSFileProviderRequest requestFromTheSystem];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_3;
  v12[3] = &unk_1E5AF1510;
  id v13 = *(id *)(a1 + 56);
  id v11 = (id)[v9 createItemBasedOnTemplate:v8 fields:262 contents:0 options:65537 request:v10 bounce:0 completionHandler:v12];
}

uint64_t __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = objc_msgSend(v6, "fp_userInfoItem");

  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "fp_userInfoItem");

    id v6 = 0;
    id v5 = (id)v8;
  }
  uint64_t v9 = [v6 domain];
  if ([v9 isEqualToString:@"NSFileProviderInternalErrorDomain"])
  {
    uint64_t v10 = [v6 code];

    if (v10 == 3)
    {
      id v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4_cold_1(v6, v11);
      }

      uint64_t v12 = *(void *)(a1 + 56);
      id v13 = FPNotSupportedError();
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
      goto LABEL_14;
    }
  }
  else
  {
  }
  if (v5)
  {
    id v13 = [*(id *)(a1 + 32) itemFromVendorItem:v5];
  }
  else
  {
    id v13 = 0;
  }
  if (*(unsigned char *)(a1 + 80))
  {
LABEL_13:
    (*(void (**)(void, void *, id))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v13, v6);
    goto LABEL_14;
  }
  if (v6)
  {
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = objc_msgSend(v6, "fp_prettyDescription");
      int v25 = 138412546;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      id v28 = v16;
      _os_log_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] can't get default location, fallback on default name '%@'; %@",
        (uint8_t *)&v25,
        0x16u);
    }
    goto LABEL_28;
  }
  if (!v13)
  {
    id v14 = fp_current_or_default_log();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    uint64_t v19 = *(void *)(a1 + 40);
    int v25 = 138412546;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    id v28 = v5;
    uint64_t v18 = "[WARNING] can't create item, fallback on default name '%@'; %@";
    goto LABEL_27;
  }
  if (([v13 isFolder] & 1) == 0)
  {
    id v14 = fp_current_or_default_log();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    int v25 = 138412546;
    uint64_t v26 = v20;
    __int16 v27 = 2112;
    id v28 = v13;
    uint64_t v18 = "[WARNING] default location must be a folder, fallback on default name '%@'; %@";
    goto LABEL_27;
  }
  if ([v13 isWritable])
  {
LABEL_32:
    id v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4_cold_2((uint64_t)v13, v6, v24);
    }

    goto LABEL_13;
  }
  id v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    int v25 = 138412546;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    id v28 = v13;
    uint64_t v18 = "[WARNING] default location must be writable, fallback on default name '%@'; %@";
LABEL_27:
    _os_log_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v25, 0x16u);
  }
LABEL_28:

  if (!*(void *)(a1 + 40)) {
    goto LABEL_32;
  }
  __int16 v21 = fp_current_or_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v23 = objc_msgSend(v6, "fp_prettyDescription");
    int v25 = 138412546;
    uint64_t v26 = v22;
    __int16 v27 = 2112;
    id v28 = v23;
    _os_log_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to get default location, fallback on default name '%@'; %@",
      (uint8_t *)&v25,
      0x16u);
  }
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 48) + 32), *(dispatch_block_t *)(a1 + 64));
LABEL_14:
}

- (id)fetchPublishingURLForItemID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v21 = fpfs_adopt_log(self->_log);
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext fetchPublishingURLForItemID:completionHandler:]();
  }

  uint64_t v9 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  instanceQueue = self->_instanceQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__FPXExtensionContext_fetchPublishingURLForItemID_completionHandler___block_invoke;
  v17[3] = &unk_1E5AF1158;
  v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  id v12 = v7;
  id v20 = v12;
  id v13 = v9;
  id v19 = v13;
  fp_dispatch_async_with_logs(instanceQueue, v17);
  id v14 = v19;
  id v15 = v13;

  __fp_pop_log(&v21);

  return v15;
}

void __69__FPXExtensionContext_fetchPublishingURLForItemID_completionHandler___block_invoke(id *a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] domainContextForItemID:a1[5]];
  uint64_t v3 = [v2 domain];
  int v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = [v2 domain];
    id v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v8 = [v7 currentPersona];
    uint64_t v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = NSString;
      id v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      id v18 = [v2 domain];
      id v19 = [v18 personaIdentifier];
      id v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      __int16 v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext fetchPublishingURLForItemID:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3079, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  uint64_t v22 = [v2 instanceWithPrivateSelector:sel_fetchPublishingURLForItemIdentifier_completionHandler_];
  if (v22)
  {
    uint64_t v23 = [a1[5] identifier];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __69__FPXExtensionContext_fetchPublishingURLForItemID_completionHandler___block_invoke_2;
    v34[3] = &unk_1E5AF1588;
    id v24 = v2;
    id v25 = a1[4];
    id v35 = v24;
    id v36 = v25;
    id v37 = a1[7];
    uint64_t v26 = [v22 fetchPublishingURLForItemIdentifier:v23 completionHandler:v34];

    if (v26) {
      [a1[6] addChild:v26 withPendingUnitCount:100];
    }
  }
  else
  {
    uint64_t v33 = fpfs_adopt_log(*((void **)a1[4] + 9));
    __int16 v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      id v30 = FPPopLogSectionForBlock(a1[7]);
      id v31 = a1[4];
      id v32 = FPNotSupportedError();
      *(_DWORD *)buf = 134219010;
      id v39 = v30;
      __int16 v40 = 2112;
      id v41 = v31;
      __int16 v42 = 2080;
      uint64_t v43 = "-[FPXExtensionContext fetchPublishingURLForItemID:completionHandler:]_block_invoke";
      __int16 v44 = 2112;
      uint64_t v45 = 0;
      __int16 v46 = 2112;
      char v47 = v32;
      _os_log_debug_impl(&dword_1A33AE000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    id v28 = (void (**)(id, void, void *))a1[7];
    uint64_t v29 = FPNotSupportedError();
    v28[2](v28, 0, v29);

    __fp_pop_log(&v33);
  }
}

void __69__FPXExtensionContext_fetchPublishingURLForItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) internalErrorFromVendorError:a3 callerDescription:@"fetchPublishingURLForItemID"];
  char v10 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    id v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = "-[FPXExtensionContext fetchPublishingURLForItemID:completionHandler:]_block_invoke_2";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v10);
}

- (id)disconnectDomainID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v24 = fpfs_adopt_log(self->_log);
  char v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext disconnectDomainID:options:completionHandler:]();
  }

  id v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  instanceQueue = self->_instanceQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke;
  v19[3] = &unk_1E5AF15B0;
  void v19[4] = self;
  id v13 = v8;
  id v20 = v13;
  unint64_t v23 = a4;
  id v14 = v9;
  id v22 = v14;
  id v15 = v11;
  id v21 = v15;
  fp_dispatch_async_with_logs(instanceQueue, v19);
  uint64_t v16 = v21;
  id v17 = v15;

  __fp_pop_log(&v24);

  return v17;
}

void __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) domainContextForIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 domain];
  int v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = [v2 domain];
    id v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = NSString;
      id v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      id v18 = [v2 domain];
      __int16 v19 = [v18 personaIdentifier];
      id v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      id v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext disconnectDomainID:options:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3110, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  id v22 = [v2 instanceWithPrivateSelector:sel_disconnectWithOptions_completionHandler_];
  if (v22)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke_2;
    v32[3] = &unk_1E5AF0800;
    v32[4] = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 64);
    id v33 = *(id *)(a1 + 56);
    id v24 = [v22 disconnectWithOptions:v23 completionHandler:v32];
    if (v24) {
      [*(id *)(a1 + 48) addChild:v24 withPendingUnitCount:100];
    }
  }
  else
  {
    id v31 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v28 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      uint64_t v29 = *(void *)(a1 + 32);
      id v30 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      id v35 = v28;
      __int16 v36 = 2112;
      uint64_t v37 = v29;
      __int16 v38 = 2080;
      id v39 = "-[FPXExtensionContext disconnectDomainID:options:completionHandler:]_block_invoke";
      __int16 v40 = 2112;
      id v41 = v30;
      _os_log_debug_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v26 = *(void *)(a1 + 56);
    __int16 v27 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

    __fp_pop_log(&v31);
  }
}

void __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v9 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    int v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v7 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2080;
      uint64_t v17 = "-[FPXExtensionContext disconnectDomainID:options:completionHandler:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v9);
  }
  else
  {
    id v5 = +[NSFileProviderManager legacyDefaultManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke_3;
    v10[3] = &unk_1E5AF0800;
    id v6 = *(void **)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    [v5 setConnected:0 completionHandler:v10];
  }
}

void __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  int v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPXExtensionContext disconnectDomainID:options:completionHandler:]_block_invoke_3";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 domainIdentifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v32 = fpfs_adopt_log(self->_log);
  __int16 v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v34 = self;
    __int16 v35 = 2080;
    __int16 v36 = "-[FPXExtensionContext performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:]";
    __int16 v37 = 2112;
    id v38 = v10;
    __int16 v39 = 2112;
    id v40 = v11;
    _os_log_debug_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }

  id v15 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  instanceQueue = self->_instanceQueue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E5AF1600;
  id v17 = v10;
  id v26 = v17;
  __int16 v27 = self;
  id v18 = v12;
  id v28 = v18;
  id v19 = v11;
  id v29 = v19;
  id v20 = v13;
  id v31 = v20;
  id v21 = v15;
  id v30 = v21;
  fp_dispatch_async_with_logs(instanceQueue, v25);
  id v22 = v30;
  id v23 = v21;

  __fp_pop_log(&v32);

  return v23;
}

void __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke_cold_2();
  }

  id v3 = [*(id *)(a1 + 40) domainContextForIdentifier:*(void *)(a1 + 48)];
  int v4 = [v3 domain];
  id v5 = [v4 personaIdentifier];
  if (v5)
  {
    uint64_t v6 = [v3 domain];
    id v7 = [v6 personaIdentifier];
    uint64_t v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v9 = [v8 currentPersona];
    id v10 = [v9 userPersonaUniqueString];
    char v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = NSString;
      id v13 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v14 = [v13 currentPersona];
      id v15 = [v14 userPersonaUniqueString];
      uint64_t v16 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v17 = [v16 currentPersona];
      uint64_t v18 = [v17 uid];
      id v19 = [v3 domain];
      id v20 = [v19 personaIdentifier];
      id v21 = [v12 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v15, v18, v20];

      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3148, (const char *)[v21 UTF8String]);
    }
  }
  else
  {
  }
  id v23 = [v3 vendorInstance];
  if ([v23 conformsToProtocol:&unk_1EF6D3058]) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }

  if (v24)
  {
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 56);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke_2;
    v37[3] = &unk_1E5AF15D8;
    id v27 = v3;
    uint64_t v28 = *(void *)(a1 + 40);
    id v38 = v27;
    uint64_t v39 = v28;
    id v40 = *(id *)(a1 + 72);
    id v29 = [v24 performActionWithIdentifier:v25 onItemsWithIdentifiers:v26 completionHandler:v37];
    if (v29) {
      [*(id *)(a1 + 64) addChild:v29 withPendingUnitCount:100];
    }
  }
  else
  {
    __int16 v36 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
    id v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      id v33 = FPPopLogSectionForBlock(*(void **)(a1 + 72));
      uint64_t v34 = *(void *)(a1 + 40);
      __int16 v35 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v42 = v33;
      __int16 v43 = 2112;
      uint64_t v44 = v34;
      __int16 v45 = 2080;
      __int16 v46 = "-[FPXExtensionContext performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:]_block_invoke";
      __int16 v47 = 2112;
      uint64_t v48 = v35;
      _os_log_debug_impl(&dword_1A33AE000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v31 = *(void *)(a1 + 72);
    id v32 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v32);

    __fp_pop_log(&v36);
  }
}

void __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) internalErrorFromVendorError:a2 callerDescription:@"performActionWithIdentifier"];
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
  int v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPXExtensionContext performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v7);
}

- (void)wakeForSessionIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = fpfs_adopt_log(self->_log);
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext wakeForSessionIdentifier:completionHandler:]();
  }

  instanceQueue = self->_instanceQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF0990;
  void v12[4] = self;
  id v10 = v7;
  id v14 = v10;
  id v11 = v6;
  id v13 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v12);

  __fp_pop_log(&v15);
}

void __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) instanceWithPrivateSelector:sel_handleEventsForBackgroundURLSession_completionHandler_];
  uint64_t v3 = +[NSFileProviderExtension instanceMethodForSelector:sel_handleEventsForBackgroundURLSession_completionHandler_];
  if (v3 == [v2 methodForSelector:sel_handleEventsForBackgroundURLSession_completionHandler_])
  {
    id v13 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      id v19 = "-[FPXExtensionContext wakeForSessionIdentifier:completionHandler:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_debug_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    __fp_pop_log(&v13);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke_548;
    v11[3] = &unk_1E5AF07B8;
    uint64_t v4 = *(void *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 48);
    [v2 handleEventsForBackgroundURLSession:v4 completionHandler:v11];
  }
}

void __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke_548(uint64_t a1)
{
  v3[8] = *(void **)MEMORY[0x1E4F143B8];
  v3[0] = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke_548_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(v3);
}

- (void)bulkEvictItemsWithItemIDs:(id)a3 completionHandler:(id)a4
{
  v15[6] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15[0] = fpfs_adopt_log(self->_log);
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    logStringForObjects(v6);
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext bulkEvictItemsWithItemIDs:completionHandler:]();
  }

  instanceQueue = self->_instanceQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF0990;
  void v12[4] = self;
  id v10 = v7;
  id v14 = v10;
  id v11 = v6;
  id v13 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v12);

  __fp_pop_log(v15);
}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) instanceWithPrivateSelector:sel_evictItemWithIdentifier_completionHandler_];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_549;
    v20[3] = &unk_1E5AF1628;
    id v21 = v3;
    id v6 = v2;
    id v22 = v6;
    [v5 enumerateObjectsUsingBlock:v20];
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_551;
    v16[3] = &unk_1E5AF08A0;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 32);
    id v17 = v8;
    uint64_t v18 = v9;
    id v19 = *(id *)(a1 + 48);
    dispatch_async(v7, v16);
  }
  else
  {
    id v23 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v13 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      uint64_t v27 = v14;
      __int16 v28 = 2080;
      id v29 = "-[FPXExtensionContext bulkEvictItemsWithItemIDs:completionHandler:]_block_invoke";
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      _os_log_debug_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    __fp_pop_log(&v23);
  }
}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_549(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 identifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5AF1180;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  [v4 evictItemWithIdentifier:v5 completionHandler:v7];
}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_2_cold_1(a1, v4);
    }

    id v6 = objc_msgSend(v4, "fp_strippedError");
    id v7 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) identifier];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_551(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = FPPartialErrorsByItemIdentifiers(*(void **)(a1 + 32));
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v6 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    id v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2080;
    id v12 = "-[FPXExtensionContext bulkEvictItemsWithItemIDs:completionHandler:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v2;
    _os_log_debug_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v6);
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v18 = fpfs_adopt_log(self->_log);
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    __int16 v20 = self;
    __int16 v21 = 2080;
    id v22 = "-[FPXExtensionContext attemptRecoveryFromError:optionIndex:completionHandler:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    _os_log_debug_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %lu", buf, 0x2Au);
  }

  instanceQueue = self->_instanceQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__FPXExtensionContext_attemptRecoveryFromError_optionIndex_completionHandler___block_invoke;
  v14[3] = &unk_1E5AF1650;
  v14[4] = self;
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  unint64_t v17 = a4;
  fp_dispatch_async_with_logs(instanceQueue, v14);

  __fp_pop_log(&v18);
}

void __78__FPXExtensionContext_attemptRecoveryFromError_optionIndex_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) instanceWithPrivateSelector:sel_attemptRecoveryFromError_optionIndex_completionHandler_];
  if (v2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__FPXExtensionContext_attemptRecoveryFromError_optionIndex_completionHandler___block_invoke_554;
    v11[3] = &unk_1E5AF0800;
    uint64_t v3 = *(void *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    id v12 = *(id *)(a1 + 48);
    [v2 attemptRecoveryFromError:v3 optionIndex:v4 completionHandler:v11];
  }
  else
  {
    id v13 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v8 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      id v19 = "-[FPXExtensionContext attemptRecoveryFromError:optionIndex:completionHandler:]_block_invoke";
      __int16 v20 = 2112;
      __int16 v21 = v10;
      _os_log_debug_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    __fp_pop_log(&v13);
  }
}

void __78__FPXExtensionContext_attemptRecoveryFromError_optionIndex_completionHandler___block_invoke_554(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPXExtensionContext attemptRecoveryFromError:optionIndex:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (void)userInteractionErrorsForPerformingAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 fpProviderDomainId:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)a9
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = (char *)a3;
  id v36 = a4;
  id v35 = a5;
  id v32 = a6;
  id v30 = a7;
  id v31 = a8;
  id v33 = a9;
  id v38 = fpfs_adopt_log(self->_log);
  id v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    __int16 v28 = logStringForObjects(v36);
    *(_DWORD *)buf = 138413314;
    id v40 = self;
    __int16 v41 = 2080;
    uint64_t v42 = (FPXExtensionContext *)"-[FPXExtensionContext userInteractionErrorsForPerformingAction:sourceItems:destinationI"
                                 "tem:fpProviderDomainId:sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:]";
    __int16 v43 = 2112;
    uint64_t v44 = v34;
    __int16 v45 = 2112;
    __int16 v46 = v28;
    __int16 v47 = 2112;
    id v48 = v35;
    _os_log_debug_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@, %@", buf, 0x34u);
  }
  uint64_t v16 = objc_msgSend(v32, "fp_toDomainIdentifier");
  uint64_t v17 = [(FPXExtensionContext *)self createUserInteractionSuppressingWithDomainIdentifier:v16 withPurpose:@"userInteractionErrorsForPerformingAction"];
  __int16 v18 = [MEMORY[0x1E4F28B50] mainBundle];
  id v19 = [(FPXDomainContext *)self->_domainContext providerDomain];
  __int16 v20 = [v19 providerID];
  __int16 v21 = [(FPXDomainContext *)self->_domainContext providerDomain];
  uint64_t v22 = [v21 identifier];
  __int16 v23 = +[FPPreflightUserInteraction interactionsForBundle:v18 providerIdentifier:v20 domainIdentifier:v22];

  id v24 = [(FPXDomainContext *)self->_domainContext userInfo];
  __int16 v25 = +[FPPreflightUserInteraction evaluationObjectsForAction:v34 sourceItems:v36 destinationItem:v35 domainUserInfo:v24 sourceItemKeysAllowList:v30 destinationItemKeysAllowList:v31];

  unint64_t v26 = +[FPPreflightUserInteraction gatherErrorsForInteractions:v23 evaluationObjects:v25 suppressionDelegate:v17];
  __int16 v37 = fpfs_adopt_log(self->_log);
  uint64_t v27 = fp_current_or_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    id v29 = (FPXExtensionContext *)FPPopLogSectionForBlock(v33);
    *(_DWORD *)buf = 134218754;
    id v40 = v29;
    __int16 v41 = 2112;
    uint64_t v42 = self;
    __int16 v43 = 2080;
    uint64_t v44 = "-[FPXExtensionContext userInteractionErrorsForPerformingAction:sourceItems:destinationItem:fpProviderDomainId:"
          "sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:]";
    __int16 v45 = 2112;
    __int16 v46 = v26;
    _os_log_debug_impl(&dword_1A33AE000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*((void (**)(id, void *))v33 + 2))(v33, v26);
  __fp_pop_log(&v37);

  __fp_pop_log(&v38);
}

- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);
}

void __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) instanceWithPrivateSelector:sel_fetchTrashIdentifiersWithCompletionHandler_];
  if ([v2 conformsToProtocol:&unk_1EF6EDFA0])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke_588;
    v10[3] = &unk_1E5AF1498;
    id v3 = *(void **)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    id v11 = v3;
    [v2 fetchTrashIdentifiersWithCompletionHandler:v10];
  }
  else
  {
    __int16 v12 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v7 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = FPNotSupportedError();
      *(_DWORD *)buf = 134219010;
      __int16 v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      __int16 v18 = "-[FPXExtensionContext fetchTrashIdentifiersWithCompletionHandler:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);

    __fp_pop_log(&v12);
  }
}

void __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke_588(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5AF0940;
  void v12[4] = *(void *)(a1 + 32);
  id v7 = objc_msgSend(v5, "fp_map:", v12);
  id v11 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    __int16 v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2080;
    __int16 v18 = "-[FPXExtensionContext fetchTrashIdentifiersWithCompletionHandler:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v11);
}

uint64_t __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) itemIDFromVendorItemID:a2];
}

- (void)updateIgnoreStateOfItemWithIdentifiers:(id)a3 ignoreState:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v13 = fpfs_adopt_log(self->_log);
  uint64_t v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v11 = FPPopLogSectionForBlock(v8);
    __int16 v12 = FPNotSupportedError();
    *(_DWORD *)buf = 134219266;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    __int16 v17 = self;
    __int16 v18 = 2080;
    __int16 v19 = "-[FPXExtensionContext updateIgnoreStateOfItemWithIdentifiers:ignoreState:completionHandler:]";
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    __int16 v22 = 2112;
    uint64_t v23 = 0;
    __int16 v24 = 2112;
    __int16 v25 = v12;
    _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }
  uint64_t v10 = FPNotSupportedError();
  (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v10);

  __fp_pop_log(&v13);
}

- (void)fetchCustomPushTopicsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__FPXExtensionContext_fetchCustomPushTopicsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);
}

void __66__FPXExtensionContext_fetchCustomPushTopicsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) instanceWithPrivateSelector:sel_customPushTopics];
  if ([v2 conformsToProtocol:&unk_1EF6EDFA0])
  {
    id v3 = [v2 customPushTopics];
    id v13 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v11 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      __int16 v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2080;
      __int16 v19 = "-[FPXExtensionContext fetchCustomPushTopicsWithCompletionHandler:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v3;
      __int16 v22 = 2112;
      uint64_t v23 = 0;
      _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v13);
  }
  else
  {
    id v13 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v8 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = FPNotSupportedError();
      *(_DWORD *)buf = 134219010;
      __int16 v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      __int16 v19 = "-[FPXExtensionContext fetchCustomPushTopicsWithCompletionHandler:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_debug_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);

    __fp_pop_log(&v13);
  }
}

- (void)wakeForPushWithCompletionHandler:(id)a3
{
  v6[8] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = fpfs_adopt_log(self->_log);
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(v4);
    -[FPXExtensionContext wakeForPushWithCompletionHandler:]();
  }

  (*((void (**)(id, void))v4 + 2))(v4, 0);
  __fp_pop_log(v6);
}

- (void)signalEnumeratorForMaterializedItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);
}

void __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = [*(id *)(*(void *)v2 + 80) vendorInstance];
  objc_sync_exit(v3);

  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5AF07B8;
    id v5 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    [v4 materializedItemsDidChangeWithCompletionHandler:v8];
  }
  else
  {
    id v7 = fpfs_adopt_log(*(void **)(*(void *)v2 + 72));
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 40));
      __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v7);
  }
}

void __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v3[8] = *(void **)MEMORY[0x1E4F143B8];
  v3[0] = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(v3);
}

- (void)signalEnumeratorForPendingItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);
}

void __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = [*(id *)(*(void *)v2 + 80) vendorInstance];
  objc_sync_exit(v3);

  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5AF07B8;
    id v5 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    [v4 pendingItemsDidChangeWithCompletionHandler:v8];
  }
  else
  {
    id v7 = fpfs_adopt_log(*(void **)(*(void *)v2 + 72));
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 40));
      __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v7);
  }
}

void __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v3[8] = *(void **)MEMORY[0x1E4F143B8];
  v3[0] = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(v3);
}

- (void)importDidFinishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);
}

void __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = [*(id *)(*(void *)v2 + 80) vendorInstance];
  objc_sync_exit(v3);

  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5AF07B8;
    id v5 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    [v4 importDidFinishWithCompletionHandler:v8];
  }
  else
  {
    id v7 = fpfs_adopt_log(*(void **)(*(void *)v2 + 72));
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 40));
      __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v7);
  }
}

void __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v3[8] = *(void **)MEMORY[0x1E4F143B8];
  v3[0] = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(v3);
}

- (void)listRemoteVersionsWithSettings:(id)a3 observer:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = fpfs_adopt_log(self->_log);
  __int16 v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v20 = [v10 enumeratedItemID];
    *(_DWORD *)buf = 138413058;
    __int16 v28 = self;
    __int16 v29 = 2080;
    id v30 = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]";
    __int16 v31 = 2112;
    id v32 = v20;
    __int16 v33 = 2112;
    id v34 = v12;
    _os_log_debug_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }
  instanceQueue = self->_instanceQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke;
  v21[3] = &unk_1E5AF1678;
  void v21[4] = self;
  id v16 = v10;
  id v22 = v16;
  id v17 = v12;
  id v23 = v17;
  id v18 = v13;
  id v25 = v18;
  id v19 = v11;
  id v24 = v19;
  fp_dispatch_async_with_logs(instanceQueue, v21);

  __fp_pop_log(&v26);
}

void __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  Class v1 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id v4 = [*(id *)(a1 + 40) enumeratedItemID];
  id v63 = [v1 domainContextForItemID:v4];

  id v5 = [v63 domain];
  id v6 = [v5 personaIdentifier];
  if (v6)
  {
    id v7 = [v63 domain];
    id v8 = [v7 personaIdentifier];
    id v9 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v10 = [v9 currentPersona];
    id v11 = [v10 userPersonaUniqueString];
    char v12 = [v8 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      id v13 = NSString;
      __int16 v14 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v15 = [v14 currentPersona];
      id v16 = [v15 userPersonaUniqueString];
      id v17 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v18 = [v17 currentPersona];
      uint64_t v19 = [v18 uid];
      __int16 v20 = [v63 domain];
      uint64_t v21 = [v20 personaIdentifier];
      id v22 = [v13 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v16, v19, v21];

      id v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3396, (const char *)[v22 UTF8String]);
    }
  }
  else
  {
  }
  id v24 = [v63 vendorInstance];
  if ([v24 conformsToProtocol:&unk_1EF6EE000]) {
    id v25 = v24;
  }
  else {
    id v25 = 0;
  }

  if (v25)
  {
    uint64_t v26 = [*(id *)(a1 + 40) enumeratedItemID];
    uint64_t v27 = [v26 identifier];
    uint64_t v28 = *(void *)(a1 + 48);
    id v65 = 0;
    __int16 v29 = [v25 enumeratorForVersionsOfItemWithIdentifier:v27 request:v28 error:&v65];
    id v30 = (char *)v65;

    if (!v29 || v30)
    {
      id v38 = fp_current_or_default_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        id v54 = [*v3 enumeratedItemID];
        id v55 = [*v2 providerIdentifier];
        uint64_t v56 = objc_msgSend(v55, "fp_fpIdentifier");
        *(_DWORD *)buf = 138412802;
        __int16 v67 = v54;
        __int16 v68 = 2112;
        id v69 = v56;
        __int16 v70 = 2112;
        uint64_t v71 = v30;
        _os_log_debug_impl(&dword_1A33AE000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] can't create vendor enumerator for %@ owned by %@; %@",
          buf,
          0x20u);
      }
      if (v29) {
        BOOL v39 = 1;
      }
      else {
        BOOL v39 = v30 != 0;
      }
      if (!v39)
      {
        uint64_t v61 = NSStringFromSelector(sel_listRemoteVersionsWithSettings_observer_request_completionHandler_);
        fp_simulate_crash(@"-[%@ %@] must return an enumerator or an error.", v40, v41, v42, v43, v44, v45, v46, (uint64_t)v24);

        __int16 v47 = fp_current_or_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
          __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_1((int)v24, sel_listRemoteVersionsWithSettings_observer_request_completionHandler_);
        }
      }
      __int16 v33 = [v63 internalErrorFromVendorError:v30 callerDescription:@"fetchAndStartEnumeratingWithSettings"];
      uint64_t v64 = fpfs_adopt_log(*((void **)*v2 + 9));
      id v34 = fp_current_or_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v57 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
        id v58 = *v2;
        *(_DWORD *)buf = 134219010;
        __int16 v67 = v57;
        __int16 v68 = 2112;
        id v69 = v58;
        __int16 v70 = 2080;
        uint64_t v71 = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke";
        __int16 v72 = 2112;
        uint64_t v73 = 0;
        __int16 v74 = 2112;
        uint64_t v75 = v30;
        _os_log_debug_impl(&dword_1A33AE000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
    }
    else
    {
      __int16 v31 = [FPXEnumerator alloc];
      id v32 = [*(id *)(a1 + 40) enumeratedItemID];
      __int16 v33 = [(FPXEnumerator *)v31 initWithObservedItemID:v32 domainContext:v63 vendorEnumerator:v29 nsFileProviderRequest:*(void *)(a1 + 48) observer:*(void *)(a1 + 56) isWorkingSetEnum:0 queue:*(void *)(*(void *)(a1 + 32) + 24)];

      if (!v33)
      {
        id v48 = fp_current_or_default_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_3(v3, v2, v48);
        }

        uint64_t v49 = [v63 internalErrorFromVendorError:0 callerDescription:@"fetchAndStartEnumeratingWithSettings"];
        uint64_t v64 = fpfs_adopt_log(*((void **)*v2 + 9));
        id v50 = fp_current_or_default_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          FPPopLogSectionForBlock(*(void **)(a1 + 64));
          __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_2();
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        __fp_pop_log(&v64);

        goto LABEL_37;
      }
      [*((id *)*v2 + 5) addObject:v33];
      uint64_t v64 = fpfs_adopt_log(*((void **)*v2 + 9));
      id v34 = fp_current_or_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v59 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
        id v60 = *v2;
        *(_DWORD *)buf = 134219010;
        __int16 v67 = v59;
        __int16 v68 = 2112;
        id v69 = v60;
        __int16 v70 = 2080;
        uint64_t v71 = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke";
        __int16 v72 = 2112;
        uint64_t v73 = v33;
        __int16 v74 = 2112;
        uint64_t v75 = 0;
        _os_log_debug_impl(&dword_1A33AE000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log(&v64);

LABEL_37:
    goto LABEL_38;
  }
  uint64_t v64 = fpfs_adopt_log(*((void **)*v2 + 9));
  uint64_t v35 = fp_current_or_default_log();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
    id v52 = *v2;
    FPNotSupportedError();
    BOOL v53 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    __int16 v67 = v51;
    __int16 v68 = 2112;
    id v69 = v52;
    __int16 v70 = 2080;
    uint64_t v71 = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke";
    __int16 v72 = 2112;
    uint64_t v73 = 0;
    __int16 v74 = 2112;
    uint64_t v75 = v53;
    _os_log_debug_impl(&dword_1A33AE000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  uint64_t v36 = *(void *)(a1 + 64);
  __int16 v37 = FPNotSupportedError();
  (*(void (**)(uint64_t, void, void *))(v36 + 16))(v36, 0, v37);

  __fp_pop_log(&v64);
LABEL_38:
}

- (void)spotlightIndexerDidReindexAllSearchableItems:(id)a3
{
  id v3 = [(FPXDomainContext *)self->_domainContext domain];
  id v4 = +[NSFileProviderManager managerForDomain:v3];

  [v4 signalEnumeratorForContainerItemIdentifier:@"NSFileProviderWorkingSetContainerItemIdentifier" completionHandler:&__block_literal_global_599];
}

void __68__FPXExtensionContext_spotlightIndexerDidReindexAllSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __68__FPXExtensionContext_spotlightIndexerDidReindexAllSearchableItems___block_invoke_cold_1(v2);
    }
  }
}

- (void)getKnownFolderLocations:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  __int16 v14 = fpfs_adopt_log(self->_log);
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FPXExtensionContext getKnownFolderLocations:completionHandler:]();
  }

  id v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  instanceQueue = self->_instanceQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF16C8;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  unint64_t v13 = a3;
  fp_dispatch_async_with_logs(instanceQueue, v11);

  __fp_pop_log(&v14);
}

void __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) domainContext];
  id v3 = [v2 vendorInstance];
  if ([v3 conformsToProtocol:&unk_1EF6EE060]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke_604;
    v15[3] = &unk_1E5AF16A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    id v16 = v6;
    uint64_t v17 = v7;
    id v18 = v8;
    [v4 getKnownFolderLocations:v5 completionHandler:v15];
  }
  else
  {
    uint64_t v19 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v12 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v13 = *(void *)(a1 + 32);
      __int16 v14 = FPNotSupportedError();
      *(_DWORD *)buf = 134219010;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2080;
      id v25 = "-[FPXExtensionContext getKnownFolderLocations:completionHandler:]_block_invoke";
      __int16 v26 = 2112;
      uint64_t v27 = 0;
      __int16 v28 = 2112;
      __int16 v29 = v14;
      _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = FPNotSupportedError();
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

    __fp_pop_log(&v19);
  }
}

void __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke_604(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) internalErrorFromVendorError:v6 callerDescription:@"getKnownFolderLocations"];
  if (!(v5 | v7))
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke_604_cold_1();
    }

    uint64_t v7 = FPNotSupportedError();
  }
  if (v7)
  {
    __int16 v14 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      id v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      __int16 v20 = "-[FPXExtensionContext getKnownFolderLocations:completionHandler:]_block_invoke";
      __int16 v21 = 2112;
      unint64_t v22 = 0;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }
  else
  {
    __int16 v14 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 40) + 72));
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v12 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      id v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      __int16 v20 = "-[FPXExtensionContext getKnownFolderLocations:completionHandler:]_block_invoke";
      __int16 v21 = 2112;
      unint64_t v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log(&v14);
}

- (void)_waitForExtensionStabilizationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__FPXExtensionContext__waitForExtensionStabilizationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);
}

void __75__FPXExtensionContext__waitForExtensionStabilizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) instanceWithPrivateSelector:sel_waitForStabilizationWithCompletionHandler_];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = v2;
  if (v2) {
    [v2 waitForStabilizationWithCompletionHandler:v3];
  }
  else {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)waitForStabilizationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__FPXExtensionContext_waitForStabilizationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5AF0800;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FPXExtensionContext *)self _waitForExtensionStabilizationWithCompletionHandler:v6];
}

void __65__FPXExtensionContext_waitForStabilizationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v11 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v7 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2080;
      __int16 v17 = "-[FPXExtensionContext waitForStabilizationWithCompletionHandler:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(&v11);
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 80) domain];
    id v6 = +[NSFileProviderManager managerForDomain:v5];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __65__FPXExtensionContext_waitForStabilizationWithCompletionHandler___block_invoke_610;
    v9[3] = &unk_1E5AF0800;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v6 waitForSignalDeliveryWithCompletionHandler:v9];
  }
}

void __65__FPXExtensionContext_waitForStabilizationWithCompletionHandler___block_invoke_610(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPXExtensionContext waitForStabilizationWithCompletionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (void)_test_callFileProviderManagerAPIs:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileProviderManager legacyDefaultManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__FPXExtensionContext__test_callFileProviderManagerAPIs___block_invoke;
  v7[3] = &unk_1E5AF0800;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 signalEnumeratorForContainerItemIdentifier:@"NSFileProviderRootContainerItemIdentifier" completionHandler:v7];
}

void __57__FPXExtensionContext__test_callFileProviderManagerAPIs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPXExtensionContext _test_callFileProviderManagerAPIs:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(FPProviderDomain *)self->_providerDomain identifier];
  id v7 = objc_msgSend(v6, "fp_obfuscatedProviderDomainID");
  id v8 = [v3 stringWithFormat:@"<%@:%p domain:%@>", v5, self, v7];

  return (NSString *)v8;
}

- (void)shouldConnectExternalDomainWithCompletionHandler:(id)a3
{
  id v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);
}

void __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke(uint64_t a1)
{
  v30[7] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  __int16 v26 = [*(id *)(a1 + 32) domainContext];
  id v3 = [v26 domain];
  id v4 = [v3 personaIdentifier];
  if (v4)
  {
    id v5 = [v26 domain];
    id v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = NSString;
      __int16 v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v13 = [v12 currentPersona];
      __int16 v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      __int16 v18 = [v26 domain];
      id v19 = [v18 personaIdentifier];
      uint64_t v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      __int16 v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXExtensionContext shouldConnectExternalDomainWithCompletionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3541, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  id v22 = [v26 vendorInstance];
  if ([v22 conformsToProtocol:&unk_1EF6EE0C0]) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }

  if (v23)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke_616;
    v27[3] = &unk_1E5AF0D78;
    uint64_t v24 = *(void **)(a1 + 40);
    v27[4] = *(void *)(a1 + 32);
    id v29 = v24;
    id v28 = v26;
    [v23 shouldConnectExternalDomainWithCompletionHandler:v27];
  }
  else
  {
    v30[0] = fpfs_adopt_log(*(void **)(*(void *)v2 + 72));
    uint64_t v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 40));
      __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log(v30);
  }
}

void __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke_616(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v10 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 72));
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v7 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) internalErrorFromVendorError:v3 callerDescription:@"shouldConnectExternalDomain"];
    *(_DWORD *)buf = 134218754;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    uint64_t v16 = "-[FPXExtensionContext shouldConnectExternalDomainWithCompletionHandler:]_block_invoke";
    __int16 v17 = 2112;
    __int16 v18 = v9;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) internalErrorFromVendorError:v3 callerDescription:@"shouldConnectExternalDomain"];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  __fp_pop_log(&v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_domainContext, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_domainServicer, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_alternateContents, 0);
  objc_storeStrong((id *)&self->_runningEnumerators, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_instanceQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_listenerDelegates, 0);
}

- (void)applyFieldChangesToItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 lastKnownVendorItem:(id)a7 extensionInstance:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  unint64_t v18 = a5;
  id v19 = v17;
  id v51 = a7;
  id v20 = a8;
  id v52 = a9;
  location[0] = 0;
  objc_initWeak(location, self);
  id from = 0;
  objc_initWeak(&from, v20);
  id v49 = v19;
  id v50 = v16;
  id v48 = v20;
  if ((v18 & 0x40000004) == 4)
  {
    __int16 v21 = [v15 itemIdentifier];
    id v22 = [v15 parentItemIdentifier];
    id v23 = [v15 filename];
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke;
    v98[3] = &unk_1E5AF2DD8;
    id v102 = v52;
    __int16 v47 = &v103;
    objc_copyWeak(&v103, location);
    uint64_t v24 = v15;
    id v99 = v15;
    id v100 = v16;
    v104[1] = (id)v18;
    id v101 = v19;
    objc_copyWeak(v104, &from);
    [v20 reparentItemWithIdentifier:v21 toParentItemWithIdentifier:v22 newName:v23 completionHandler:v98];
    uint64_t v25 = &v102;
    __int16 v26 = &v99;
    uint64_t v27 = &v100;
    id v28 = &v101;

    id v29 = v104;
LABEL_3:
    objc_destroyWeak(v29);
LABEL_17:
    id v32 = v47;
    goto LABEL_18;
  }
  if ((v18 & 2) != 0)
  {
    uint64_t v30 = [v15 itemIdentifier];
    __int16 v31 = [v15 filename];
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_2;
    v91[3] = &unk_1E5AF2DD8;
    id v95 = v52;
    id v32 = &v96;
    objc_copyWeak(&v96, location);
    uint64_t v24 = v15;
    id v92 = v15;
    id v93 = v16;
    v97[1] = (id)v18;
    id v94 = v19;
    __int16 v33 = v97;
    objc_copyWeak(v97, &from);
    [v20 renameItemWithIdentifier:v30 toName:v31 completionHandler:v91];
    uint64_t v25 = &v95;
    __int16 v26 = &v92;
    uint64_t v27 = &v93;
    id v28 = &v94;

    goto LABEL_12;
  }
  if ((v18 & 8) != 0)
  {
    id v34 = [v15 lastUsedDate];
    uint64_t v35 = [v15 itemIdentifier];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_3;
    v83[3] = &unk_1E5AF2E00;
    id v88 = v52;
    __int16 v47 = &v89;
    objc_copyWeak(&v89, location);
    uint64_t v24 = v15;
    id v84 = v15;
    id v85 = v16;
    v90[1] = (id)v18;
    id v86 = v19;
    id v87 = v51;
    objc_copyWeak(v90, &from);
    [v20 setLastUsedDate:v34 forItemIdentifier:v35 completionHandler:v83];
    uint64_t v25 = &v88;
    __int16 v26 = &v84;
    uint64_t v27 = &v85;
    id v28 = &v86;

    objc_destroyWeak(v90);
    uint64_t v36 = v87;
LABEL_16:

    goto LABEL_17;
  }
  if ((v18 & 0x10) != 0)
  {
    __int16 v37 = [v15 tagData];
    id v38 = [v15 itemIdentifier];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_4;
    v75[3] = &unk_1E5AF2E00;
    id v80 = v52;
    __int16 v47 = &v81;
    objc_copyWeak(&v81, location);
    uint64_t v24 = v15;
    id v76 = v15;
    id v77 = v16;
    v82[1] = (id)v18;
    id v78 = v19;
    id v79 = v51;
    objc_copyWeak(v82, &from);
    [v20 setTagData:v37 forItemIdentifier:v38 completionHandler:v75];
    uint64_t v25 = &v80;
    __int16 v26 = &v76;
    uint64_t v27 = &v77;
    id v28 = &v78;

    objc_destroyWeak(v82);
    uint64_t v36 = v79;
    goto LABEL_16;
  }
  if ((v18 & 0x20) != 0)
  {
    BOOL v39 = [v15 favoriteRank];
    uint64_t v40 = [v15 itemIdentifier];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_5;
    v67[3] = &unk_1E5AF2E00;
    id v72 = v52;
    __int16 v47 = &v73;
    objc_copyWeak(&v73, location);
    uint64_t v24 = v15;
    id v68 = v15;
    id v69 = v16;
    v74[1] = (id)v18;
    id v70 = v19;
    id v71 = v51;
    objc_copyWeak(v74, &from);
    [v20 setFavoriteRank:v39 forItemIdentifier:v40 completionHandler:v67];
    uint64_t v25 = &v72;
    __int16 v26 = &v68;
    uint64_t v27 = &v69;
    id v28 = &v70;

    objc_destroyWeak(v74);
    uint64_t v36 = v71;
    goto LABEL_16;
  }
  if ((v18 & 0x40000000) != 0)
  {
    uint64_t v41 = v16;
    if (![v15 isTrashed])
    {
      uint64_t v43 = [v15 itemIdentifier];
      if ((v18 & 4) != 0)
      {
        uint64_t v45 = [v15 parentItemIdentifier];
        uint64_t v44 = v20;
        uint64_t v24 = v15;
      }
      else
      {
        uint64_t v44 = v20;
        uint64_t v24 = v15;
        uint64_t v45 = 0;
      }
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_7;
      v53[3] = &unk_1E5AF2DD8;
      id v57 = v52;
      __int16 v47 = &v58;
      objc_copyWeak(&v58, location);
      id v54 = v24;
      id v55 = v41;
      char v46 = v18;
      v59[1] = (id)v18;
      id v56 = v19;
      objc_copyWeak(v59, &from);
      [v44 untrashItemWithIdentifier:v43 toParentItemIdentifier:v45 completionHandler:v53];
      uint64_t v25 = &v57;
      __int16 v26 = &v54;
      uint64_t v27 = &v55;
      id v28 = &v56;
      if ((v46 & 4) != 0) {

      }
      id v29 = v59;
      goto LABEL_3;
    }
    uint64_t v42 = [v15 itemIdentifier];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_6;
    v60[3] = &unk_1E5AF2DD8;
    id v64 = v52;
    id v32 = &v65;
    objc_copyWeak(&v65, location);
    uint64_t v24 = v15;
    id v61 = v15;
    id v62 = v16;
    v66[1] = (id)v18;
    id v63 = v19;
    __int16 v33 = v66;
    objc_copyWeak(v66, &from);
    [v20 trashItemWithIdentifier:v42 completionHandler:v60];
    uint64_t v25 = &v64;
    __int16 v26 = &v61;
    uint64_t v27 = &v62;
    id v28 = &v63;

LABEL_12:
    objc_destroyWeak(v33);
LABEL_18:

    objc_destroyWeak(v32);
    id v19 = v49;
    id v16 = v50;
    id v20 = v48;
    id v15 = v24;
    goto LABEL_19;
  }
  if (v18)
  {
    if (!v19) {
      __assert_rtn("-[FPXExtensionContext(LegacySupport) applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:]", "FPXExtensionContext_Legacy.m", 166, "newContent");
    }
    [(FPXExtensionContext *)self applyItemChange:v15 baseVersion:v16 contents:v19 completionHandler:v52];
  }
  else
  {
    (*((void (**)(id, id, void))v52 + 2))(v52, v51, 0);
  }
LABEL_19:
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    unint64_t v8 = *(void *)(a1 + 80) & 0xFFFFFFFFFFFFFFF9;
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained applyFieldChangesToItem:v6 baseVersion:v7 changedFields:v8 contents:v9 lastKnownVendorItem:v11 extensionInstance:v10 completionHandler:*(void *)(a1 + 56)];
  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    unint64_t v8 = *(void *)(a1 + 80) & 0xFFFFFFFFFFFFFFFDLL;
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained applyFieldChangesToItem:v6 baseVersion:v7 changedFields:v8 contents:v9 lastKnownVendorItem:v11 extensionInstance:v10 completionHandler:*(void *)(a1 + 56)];
  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && (objc_msgSend(v5, "fp_isFeatureUnsupportedError") & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    unint64_t v10 = *(void *)(a1 + 88) & 0xFFFFFFFFFFFFFFF7;
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = v14;
    if (!v14) {
      id v12 = *(id *)(a1 + 56);
    }
    id v13 = objc_loadWeakRetained((id *)(a1 + 80));
    [WeakRetained applyFieldChangesToItem:v8 baseVersion:v9 changedFields:v10 contents:v11 lastKnownVendorItem:v12 extensionInstance:v13 completionHandler:*(void *)(a1 + 64)];
  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && (objc_msgSend(v5, "fp_isFeatureUnsupportedError") & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    unint64_t v10 = *(void *)(a1 + 88) & 0xFFFFFFFFFFFFFFEFLL;
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = v14;
    if (!v14) {
      id v12 = *(id *)(a1 + 56);
    }
    id v13 = objc_loadWeakRetained((id *)(a1 + 80));
    [WeakRetained applyFieldChangesToItem:v8 baseVersion:v9 changedFields:v10 contents:v11 lastKnownVendorItem:v12 extensionInstance:v13 completionHandler:*(void *)(a1 + 64)];
  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && (objc_msgSend(v5, "fp_isFeatureUnsupportedError") & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    unint64_t v10 = *(void *)(a1 + 88) & 0xFFFFFFFFFFFFFFDFLL;
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = v14;
    if (!v14) {
      id v12 = *(id *)(a1 + 56);
    }
    id v13 = objc_loadWeakRetained((id *)(a1 + 80));
    [WeakRetained applyFieldChangesToItem:v8 baseVersion:v9 changedFields:v10 contents:v11 lastKnownVendorItem:v12 extensionInstance:v13 completionHandler:*(void *)(a1 + 64)];
  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    unint64_t v8 = *(void *)(a1 + 80) & 0xFFFFFFFFBFFFFFFBLL;
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained applyFieldChangesToItem:v6 baseVersion:v7 changedFields:v8 contents:v9 lastKnownVendorItem:v11 extensionInstance:v10 completionHandler:*(void *)(a1 + 56)];
  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    unint64_t v8 = *(void *)(a1 + 80) & 0xFFFFFFFFBFFFFFFBLL;
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained applyFieldChangesToItem:v6 baseVersion:v7 changedFields:v8 contents:v9 lastKnownVendorItem:v11 extensionInstance:v10 completionHandler:*(void *)(a1 + 56)];
  }
}

- (void)applyItemChange:(id)a3 baseVersion:(id)a4 contents:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, id))a6;
  id v14 = [v10 itemID];
  id v15 = [(FPXExtensionContext *)self instanceForItemID:v14];

  id v16 = [v10 itemID];
  id v17 = [v16 identifier];

  unint64_t v18 = [v15 URLForItemWithPersistentIdentifier:v17];
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__7;
  BOOL v39 = __Block_byref_object_dispose__7;
  id v40 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  if (v18)
  {
    id v19 = objc_opt_new();
    id v20 = objc_opt_new();
    id v30 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__FPXExtensionContext_LegacySupport__applyItemChange_baseVersion_contents_completionHandler___block_invoke;
    v26[3] = &unk_1E5AF2E28;
    id v28 = &v31;
    id v21 = v20;
    id v27 = v21;
    id v29 = &v35;
    [v19 coordinateReadingItemAtURL:v12 options:0 writingItemAtURL:v18 options:0 error:&v30 byAccessor:v26];
    id v22 = v30;
    if (v22)
    {
      id v23 = v22;
      v13[2](v13, 0, v22);
    }
    else if (*((unsigned char *)v32 + 24))
    {
      v13[2](v13, 0, (id)v36[5]);
      id v23 = 0;
    }
    else
    {
      [v15 itemChangedAtURL:v18];
      id v25 = 0;
      uint64_t v24 = [v15 itemForIdentifier:v17 error:&v25];
      id v23 = v25;
      ((void (**)(id, void *, id))v13)[2](v13, v24, v23);
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28C58] fileProviderErrorForNonExistentItemWithIdentifier:v17];
    v13[2](v13, 0, v19);
    id v23 = 0;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

void __93__FPXExtensionContext_LegacySupport__applyItemChange_baseVersion_contents_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v20 = *(id *)(v8 + 40);
  char v9 = [v7 copyItemAtURL:v5 toURL:v6 error:&v20];
  objc_storeStrong((id *)(v8 + 40), v20);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9 ^ 1;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) domain];
    if (![v10 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v11 = [*(id *)(*(void *)(a1[6] + 8) + 40) code];

    if (v11 == 516)
    {
      memset(&v19, 0, sizeof(v19));
      id v18 = 0;
      [v6 getResourceValue:&v18 forKey:*MEMORY[0x1E4F1C550] error:0];
      id v10 = v18;
      id v12 = [v6 path];
      stat((const char *)[v12 fileSystemRepresentation], &v19);

      id v13 = (void *)a1[4];
      uint64_t v14 = *(void *)(a1[6] + 8);
      id obj = *(id *)(v14 + 40);
      char v15 = [v13 replaceItemAtURL:v6 withItemAtURL:v5 backupItemName:0 options:1 resultingItemURL:0 error:&obj];
      objc_storeStrong((id *)(v14 + 40), obj);
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v15 ^ 1;
      if (v10 && [v10 intValue] && v19.st_ino)
      {
        while (v19.st_dev)
        {
          [v10 unsignedIntValue];
          uint64_t v16 = GSLibraryResolveDocumentId2();
          if (v16)
          {
            if (v16 != v19.st_ino) {
              goto LABEL_15;
            }
          }
          else if (*__error() != 16 && *__error() != 70 && *__error() != 2)
          {
            goto LABEL_15;
          }
          usleep(0x64u);
        }
      }
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)importDocumentAtURL:(id)a3 intoFolderWithIdentifier:(id)a4 originalName:(id)a5 extensionInstance:(id)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v11;
  id v17 = [v16 lastPathComponent];
  char v18 = [v17 isEqualToString:v13];

  id v19 = v16;
  if (v18)
  {
LABEL_7:
    char v23 = v18 ^ 1;
    uint64_t v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[FPXExtensionContext(LegacySupport) importDocumentAtURL:intoFolderWithIdentifier:originalName:extensionInstance:reply:]((uint64_t)v19, (uint64_t)v12, v24);
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __120__FPXExtensionContext_LegacySupport__importDocumentAtURL_intoFolderWithIdentifier_originalName_extensionInstance_reply___block_invoke;
    v25[3] = &unk_1E5AF2E50;
    char v29 = v23;
    id v19 = v19;
    id v26 = v19;
    id v27 = v16;
    id v28 = v15;
    [v14 importDocumentAtURL:v19 toParentItemIdentifier:v12 completionHandler:v25];

    id v20 = v26;
    goto LABEL_13;
  }
  id v30 = 0;
  objc_msgSend(v16, "fp_moveToTempFolderWithFilename:error:", v13, &v30);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v30;

  id v21 = fp_current_or_default_log();
  id v22 = v21;
  if (v19 && !v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[FPXExtensionContext(LegacySupport) importDocumentAtURL:intoFolderWithIdentifier:originalName:extensionInstance:reply:](v19, v22);
    }

    goto LABEL_7;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[FPXExtensionContext(LegacySupport) importDocumentAtURL:intoFolderWithIdentifier:originalName:extensionInstance:reply:]((uint64_t)v13, v20, v22);
  }

  (*((void (**)(id, void, void, id))v15 + 2))(v15, 0, 0, v20);
LABEL_13:
}

void __120__FPXExtensionContext_LegacySupport__importDocumentAtURL_intoFolderWithIdentifier_originalName_extensionInstance_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 56))
  {
    id v6 = objc_opt_new();
    uint64_t v7 = v6;
    if (v5) {
      [v6 moveItemAtURL:*(void *)(a1 + 32) toURL:*(void *)(a1 + 40) error:0];
    }
    uint64_t v8 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
    [v7 removeItemAtURL:v8 error:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)principalClass
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A33AE000, v0, v1, "[CRIT] %{public}@", v2, v3, v4, v5, v6);
}

- (void)beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v3 = OUTLINED_FUNCTION_4(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_20(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)beginRequestWithDomain:(NSObject *)a3 alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_13(&dword_1A33AE000, a3, (uint64_t)a3, "[DEBUG] started extension: %@", (uint8_t *)a2);
}

- (void)domainContext
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] Context does not exist for %@ - is the extension deallocating?", v2);
}

- (void)didChangeItemID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_1A33AE000, v0, v1, "[DEBUG] ipc: %@ %s %@");
}

void __57__FPXExtensionContext_didChangeItemID_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a3, v6, "[DEBUG] ⭕️  daemon requested providing for URL %@, using instance %@", (uint8_t *)&v7);
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_194_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13(&dword_1A33AE000, a2, v4, "[DEBUG] ✅  succeeded providing URL %@", v5);
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_194_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(*(id *)(a2 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a3, v5, "[DEBUG] ❌  extension reporting error %@ providing url %@", v6);
}

- (void)evictItemAtURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_21();
  uint64_t v4 = OUTLINED_FUNCTION_10(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_15(v4, v5, v6);
  OUTLINED_FUNCTION_19(&dword_1A33AE000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v3 = OUTLINED_FUNCTION_4(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_20(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] User checked the checkbox, recording it in the extension process", v2, v3, v4, v5, v6);
}

- (void)createUserInteractionSuppressingWithDomainIdentifier:withPurpose:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] Passed nil domainIdentifier for purpose %{public}@", v2);
}

- (void)createUserInteractionSuppressingWithDomainIdentifier:withPurpose:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_29(&dword_1A33AE000, v0, (uint64_t)v0, "[ERROR] Couldn't retrieve extension for domainIdentifier %{public}@ for purpose %{public}@", v1);
}

- (void)createUserInteractionSuppressingWithDomainIdentifier:withPurpose:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_29(&dword_1A33AE000, v0, (uint64_t)v0, "[ERROR] Extension didn't conform to protocol NSFileProviderUserInteractionSuppressing for domainIdentifier %@ for purpose %{public}@", v1);
}

- (void)createUserInteractionSuppressingWithDomainIdentifier:withPurpose:.cold.4()
{
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] Extension didn't conform to protocol NSFileProviderUserInteractionSuppressing for domainIdentifier %@ for purpose %{public}@. If the extension is trying to use the NSFileProviderUserInteractionSuppressing / SuppressionIdentifier feature, and this line is logged, be sure that the NSExtensionPrincipalClass in the FileProvider app extension conforms to NSFileProviderUserInteractionSuppressing. If the extension is not trying to use those features, ignore this log.");
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(uint64_t)a3 domainIdentifier:indexReason:completionHandler:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_10(a1, 5.7781e-34, a2, a3);
  *(void *)(v3 + 14) = "-[FPXExtensionContext deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:inde"
                         "xReason:completionHandler:]";
  *(_WORD *)(v3 + 22) = 1024;
  *(_DWORD *)(v3 + 24) = v4;
  _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %d", v5, 0x1Cu);
}

- (void)removeTrashedItemsOlderThanDate:domainIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_1A33AE000, v0, v1, "[DEBUG] ipc: %@ %s %@");
}

void __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)itemChangedAtURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_21();
  uint64_t v4 = OUTLINED_FUNCTION_10(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_15(v4, v5, v6);
  OUTLINED_FUNCTION_19(&dword_1A33AE000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);
}

void __58__FPXExtensionContext_itemChangedAtURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)fetchContentsForItemWithID:(NSObject *)a3 version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_13(&dword_1A33AE000, a3, (uint64_t)a3, "[DEBUG] total unit count %lld", (uint8_t *)a1);
}

void __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] item creation failed with collision error (%@), retrying with bounced filename", v2, v3, v4, v5, v6);
}

- (void)bulkItemChanges:changedFields:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_24();
  *(_DWORD *)uint64_t v0 = 134219010;
  *(void *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2112;
  *(void *)(v0 + 14) = v2;
  *(_WORD *)(v0 + 22) = 2080;
  *(void *)(v0 + 24) = "-[FPXExtensionContext bulkItemChanges:changedFields:completionHandler:]";
  *(_WORD *)(v0 + 32) = 2112;
  *(void *)(v0 + 34) = 0;
  *(_WORD *)(v0 + 42) = 2112;
  *(void *)(v0 + 44) = 0;
  _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v3, 0x34u);
}

- (void)indexOneBatchInDomain:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v3 = OUTLINED_FUNCTION_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_31(v3, v4);
  _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", v5, 0x30u);
}

- (void)indexOneBatchInDomain:completionHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] no context for domain %@", v2);
}

- (void)indexOneBatchInDomain:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] no indexer for %@, nothing to do", v2, v3, v4, v5, v6);
}

- (void)indexOneBatchInDomain:completionHandler:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] index one batch in domain %@", v2, v3, v4, v5, v6);
}

- (void)dropIndexForDomain:dropReason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v3 = OUTLINED_FUNCTION_4(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_20(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)dropIndexForDomain:dropReason:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] [spotlight] not dropping: domain doesn't have a context: %@", v2, v3, v4, v5, v6);
}

- (void)dropIndexForDomain:dropReason:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] no indexer, nothing to do", v2, v3, v4, v5, v6);
}

void __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] FPFS instance not supported, failed to signal reindex for provider.", v1, 2u);
}

void __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Error retrieving item for identifier during reindex: %@", v4, v5, v6, v7, v8);
}

- (void)dumpIndexStateForDomain:toFileHandler:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v3 = OUTLINED_FUNCTION_4(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_20(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)alternateContentsURLWrapperForItemID:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] url %@ is no longer reachable - this means iWork forgot to remove the alternate URL", v4, v5, v6, v7, v8);
}

void __80__FPXExtensionContext_fetchAlternateContentsURLWrapperForURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  __int16 v4 = 2080;
  uint64_t v5 = "-[FPXExtensionContext fetchAlternateContentsURLWrapperForURL:completionHandler:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v0;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_debug_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@: %@", v3, 0x2Au);
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  os_log_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] error getting vendor item for item identifier %@: %@", v5, v6, v7, v8, v9);
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] FPDidUpdateAlternateContentsDocumentForDocumentAtURL was called with no alternate contents association in place for document with ID: %@", v2);
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)identifierForItemAtURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_21();
  uint64_t v4 = OUTLINED_FUNCTION_10(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_15(v4, v5, v6);
  OUTLINED_FUNCTION_19(&dword_1A33AE000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);
}

- (void)itemForURL:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_21();
  uint64_t v4 = OUTLINED_FUNCTION_10(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_15(v4, v5, v6);
  OUTLINED_FUNCTION_19(&dword_1A33AE000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);
}

void __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_327_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  int v2 = 138412546;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_29(&dword_1A33AE000, v1, (uint64_t)v1, "[ERROR] couldn't create wrapper from original document URL %@: %@", (uint8_t *)&v2);
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] Need to retrieve new url for item since it was not populated", v2, v3, v4, v5, v6);
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_32(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] got request to start thumbnail fetch operation for %@", v2, v3, v4, v5, v6);
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, v0, v1, "[DEBUG] entering group: %@ with client proxy %@", v2);
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_368_cold_1()
{
  OUTLINED_FUNCTION_32(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] leaving group: %@", v2, v3, v4, v5, v6);
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_372_cold_1()
{
  OUTLINED_FUNCTION_32(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] calling completion handler group: %@", v2, v3, v4, v5, v6);
}

- (void)createFPTempDirectoryWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] failed to create tempFolder error: %@", v4, v5, v6, v7, v8);
}

- (void)createFPTempDirectoryAppropriateForURL:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] failed to create tempFolder AppropriateForURL %@: error: %@", v5, v6, v7, v8, 2u);
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] returning FPNotSupportedError as we have a request with versions %@", v2, v3, v4, v5, v6);
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) allKeys];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13(&dword_1A33AE000, a2, v4, "[DEBUG] got request to start thumbnail fetch operation for %@", v5);
}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_cold_1(int a1, SEL aSelector)
{
  uint64_t v2 = NSStringFromSelector(aSelector);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_35(&dword_1A33AE000, v3, v4, "[SIMCRASH] -[%@ %@] must return an enumerator or an error.", v5, v6, v7, v8, v9);
}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] provider returned trash unsupported", v2, v3, v4, v5, v6);
}

- (void)fetchServicesForItemID:allowRestrictedSources:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_1A33AE000, v0, v1, "[DEBUG] ipc: %@ %s %@");
}

void __72__FPXExtensionContext__proxyWithCancellationHandler_forClientOperation___block_invoke_cold_1(void *a1)
{
  os_log_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] cancelling operation because connection was closed: %@", v4, v5, v6, v7, v8);
}

- (void)preflightReparentItemIDs:underParentID:reply:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v3 = OUTLINED_FUNCTION_4(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_20(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)deleteItemsWithIDs:baseVersions:options:reply:.cold.1()
{
  OUTLINED_FUNCTION_21();
  uint64_t v4 = OUTLINED_FUNCTION_10(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_15(v4, v5, v6);
  OUTLINED_FUNCTION_19(&dword_1A33AE000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_503_cold_1()
{
  OUTLINED_FUNCTION_21();
  *(_DWORD *)uint64_t v1 = 138412546;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(void *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_29(&dword_1A33AE000, v5, v1, "[ERROR] Received malformed out-of-date error %@ from %@", v4);
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(sel_deleteItemWithIdentifier_baseVersion_options_completionHandler_);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a2, v4, "[DEBUG] Item versions were out-of-date during %@ for items %@. Retrying with current versions.", v5);
}

- (void)_inlineSymlinkTarget:url:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] inlined symlink target: %@", v2, v3, v4, v5, v6);
}

- (void)_freeSlotHeldByItem:(uint64_t)a1 request:bounceIndex:completionHandler:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] Moving away %@, new filename: %@", (void)v3, DWORD2(v3));
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 description];
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a3, v5, "[DEBUG] creating item %@ for %@", v6);
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 64);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] item creation of %@ failed with collision error (%@), retrying with bounced filename", (void)v3, DWORD2(v3));
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 64);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] item creation of %@ failed with collision error (%@), boucing colliding item", (void)v3, DWORD2(v3));
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] max bounce number was found, jumping from %@ to %@", (void)v3, DWORD2(v3));
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] max bounce number was found (%@) but keeping the old one (%@)", (void)v3, DWORD2(v3));
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_5()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] no max bounce number was found", v2, v3, v4, v5, v6);
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_515_cold_6(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 64);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] item creation of %@ failed with collision error (%@), looking for the max bounce number existing", (void)v3, DWORD2(v3));
}

void __80__FPXExtensionContext__fetchHierarchyForItemID_into_maxDepth_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] Failed to fetch item %@ during fetchHierarchyForItemID:", v2);
}

- (void)fetchItemID:reply:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_1A33AE000, v0, v1, "[DEBUG] ipc: %@ %s %@");
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  long long v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_FAULT, "[CRIT] can't get default location, bundle name unknown; %@",
    v4,
    0xCu);
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a3, v6, "[DEBUG] use %@ as default location; %@", (uint8_t *)&v7);
}

- (void)fetchPublishingURLForItemID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_1A33AE000, v0, v1, "[DEBUG] ipc: %@ %s %@");
}

- (void)disconnectDomainID:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_1A33AE000, v0, v1, "[DEBUG] ipc: %@ %s %@");
}

void __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_32(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] Requesting to perform action '%@'", v2, v3, v4, v5, v6);
}

- (void)wakeForSessionIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_1A33AE000, v0, v1, "[DEBUG] ipc: %@ %s %@");
}

void __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke_548_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)bulkEvictItemsWithItemIDs:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_21();
  uint64_t v4 = OUTLINED_FUNCTION_10(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_15(v4, v5, v6);
  OUTLINED_FUNCTION_19(&dword_1A33AE000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);
}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v5, v6, "[ERROR] Failed to evict item %@: %@", v7, v8, v9, v10, v11);
}

- (void)wakeForPushWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v3 = OUTLINED_FUNCTION_4(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_20(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_1(int a1, SEL aSelector)
{
  uint64_t v2 = NSStringFromSelector(aSelector);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_35(&dword_1A33AE000, v3, v4, "[SIMCRASH] -[%@ %@] must return an enumerator or an error.", v5, v6, v7, v8, v9);
}

void __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(_DWORD *)uint64_t v0 = 134219010;
  *(void *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2112;
  *(void *)(v0 + 14) = v2;
  *(_WORD *)(v0 + 22) = 2080;
  *(void *)(v0 + 24) = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke";
  *(_WORD *)(v0 + 32) = 2112;
  *(void *)(v0 + 34) = 0;
  *(_WORD *)(v0 + 42) = 2112;
  *(void *)(v0 + 44) = 0;
  _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v3, 0x34u);
}

void __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_3(id *a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 enumeratedItemID];
  uint64_t v6 = [*a2 providerIdentifier];
  uint64_t v7 = objc_msgSend(v6, "fp_fpIdentifier");
  int v9 = 138412546;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a3, v8, "[DEBUG] can't create enumerator for %@ owned by %@", (uint8_t *)&v9);
}

void __68__FPXExtensionContext_spotlightIndexerDidReindexAllSearchableItems___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] can't signal changes after reset: %@", v4, v5, v6, v7, v8);
}

- (void)getKnownFolderLocations:completionHandler:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  uint64_t v3 = "-[FPXExtensionContext getKnownFolderLocations:completionHandler:]";
  __int16 v4 = 1024;
  int v5 = v0;
  _os_log_debug_impl(&dword_1A33AE000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %x", v2, 0x1Cu);
}

void __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke_604_cold_1()
{
  OUTLINED_FUNCTION_30();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Provider answered getKnownFolderLocations without providing locations", v1, 2u);
}

void __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3(&dword_1A33AE000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

@end