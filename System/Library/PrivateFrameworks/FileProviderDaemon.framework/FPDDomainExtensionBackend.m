@interface FPDDomainExtensionBackend
- (BOOL)isDeadEndBackend;
- (BOOL)isProviderForRealPathURL:(id)a3;
- (BOOL)needsRootsCreation;
- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5;
- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3;
- (FPDDomainExtensionBackend)initWithDomain:(id)a3;
- (NSArray)rootURLs;
- (NSData)backingStoreIdentity;
- (NSFileProviderDomainVersion)domainVersion;
- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5;
- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5;
- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6;
- (id)newFileProviderProxyWithRequest:(id)a3;
- (id)newFileProviderProxyWithTimeoutValue:(double)a3 request:(id)a4;
- (id)nsfpRequest:(id)a3;
- (id)rootURLsWithTransientState:(BOOL *)a3;
- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8;
- (void)_cancelProvidingItemAtURL:(id)a3 withKey:(id)a4 request:(id)a5;
- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4;
- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 request:(id)a8 completionHandler:(id)a9;
- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3;
- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3;
- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)dumpStateTo:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5;
- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5;
- (void)enumerateWithSettings:(id)a3 lifetimeExtender:(id)a4 observer:(id)a5 completionHandler:(id)a6;
- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fetchAlternateContentsURLWrapperForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)fetchFPCKTelemetryWithCompletionHandler:(id)a3;
- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7;
- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4;
- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4;
- (void)getKnownFolderLocations:(unint64_t)a3 request:(id)a4 completionHandler:(id)a5;
- (void)hasNonUploadedFilesWithCompletionHandler:(id)a3;
- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)invalidate;
- (void)itemChangedAtURL:(id)a3 request:(id)a4;
- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7;
- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6;
- (void)launchFeedbackForDomain:(id)a3 itemIdentifier:(id)a4 triggeringError:(id)a5 completionHandler:(id)a6;
- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5;
- (void)materializeItemWithID:(id)a3 requestedRange:(_NSRange)a4 request:(id)a5 completionHandler:(id)a6;
- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5;
- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5;
- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4;
- (void)saveFPCKTelemetryReport:(id)a3 completionHandler:(id)a4;
- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithURL:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)stateWithCompletionHandler:(id)a3;
- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)triggerFeedbackApprovalRequestForItemURL:(id)a3 domain:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)wakeForPushWithCompletionHandler:(id)a3;
- (void)workingSetDidChangeWithCompletionHandler:(id)a3;
@end

@implementation FPDDomainExtensionBackend

- (NSArray)rootURLs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  v3 = [WeakRetained extensionStorageURLs];

  return (NSArray *)v3;
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  *a3 = 0;
  return [(FPDDomainExtensionBackend *)self rootURLs];
}

- (NSData)backingStoreIdentity
{
  return 0;
}

uint64_t __90__FPDDomainExtensionBackend_fetchOperationServiceOrEndpointWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  fp_dispatch_async_with_logs();
}

void __90__FPDDomainExtensionBackend_fetchOperationServiceOrEndpointWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__FPDDomainExtensionBackend_fetchOperationServiceOrEndpointWithRequest_completionHandler___block_invoke_2;
  v3[3] = &unk_1E6A73E10;
  id v4 = *(id *)(a1 + 48);
  [v2 fetchOperationServiceEndpoint:v3];
}

- (id)newFileProviderProxyWithRequest:(id)a3
{
  return [(FPDDomainExtensionBackend *)self newFileProviderProxyWithTimeoutValue:a3 request:180.0];
}

- (id)newFileProviderProxyWithTimeoutValue:(double)a3 request:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v8 = [WeakRetained session];

  if (v8)
  {
    v9 = objc_msgSend(v8, "newFileProviderProxyWithTimeout:pid:", objc_msgSend(v6, "pid"), a3);
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F25DA8]);
    v11 = FPDomainUnavailableError();
    v9 = objc_msgSend(v10, "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1F2EF71F8, v11, @"invalidated extension", objc_msgSend(v6, "pid"));
  }
  return v9;
}

uint64_t __70__FPDDomainExtensionBackend_workingSetDidChangeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSFileProviderDomainVersion)domainVersion
{
  return 0;
}

- (void)workingSetDidChangeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v6 = [WeakRetained indexer];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__FPDDomainExtensionBackend_workingSetDidChangeWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E6A73EB0;
    id v8 = v4;
    [v6 signalChangesWithCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (FPDDomainExtensionBackend)initWithDomain:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FPDDomainExtensionBackend;
  id v5 = [(FPDDomainExtensionBackend *)&v19 init];
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_domain, v4);
    id v8 = NSString;
    id v9 = v7;
    id v10 = [v4 providerDomainID];
    v11 = objc_msgSend(v10, "fp_obfuscatedProviderDomainID");
    v12 = [v8 stringWithFormat:@"extension backend: %@", v11];

    id v13 = v12;
    dispatch_workloop_t v14 = dispatch_workloop_create((const char *)[v13 UTF8String]);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    provideFileCompletionsByURL = v6->_provideFileCompletionsByURL;
    v6->_provideFileCompletionsByURL = (NSMutableDictionary *)v16;
  }
  return v6;
}

- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (void)invalidate
{
}

void __39__FPDDomainExtensionBackend_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend(v4, "fp_shortDescription");
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1D744C000, v6, OS_LOG_TYPE_INFO, "[INFO] ❌  Cancelling request for %@ due to invalidation", buf, 0xCu);
  }
  id v8 = FPUserCancelledError();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = objc_msgSend(v5, "objectEnumerator", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v6 = [WeakRetained provider];
  id v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

  if (v8
    && (objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory"),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v9, "fp_realpathURL"),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        (id)v9,
        LOBYTE(v9) = objc_msgSend(v4, "fp_matchesApplicationContainerURL:", v10),
        v10,
        (v9 & 1) != 0))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v12 = [(FPDDomainExtensionBackend *)self coordinationRootURLs];
    uint64_t v13 = (void *)[v12 mutableCopy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v14 = v13;
    uint64_t v11 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v15 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v14);
          }
          if ((unint64_t)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "fp_realPathRelationshipToItemAtRealPathURL:", v4, (void)v18) < 2)
          {
            LOBYTE(v11) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v11;
}

- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5
{
  if (a5)
  {
    FPNotSupportedError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)needsRootsCreation
{
  return 0;
}

- (BOOL)isDeadEndBackend
{
  return 0;
}

- (id)nsfpRequest:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v6 = [WeakRetained session];

  if (v6) {
    [v4 nsfpRequestForSession:v6 isSpeculative:0];
  }
  else {
  id v7 = [MEMORY[0x1E4F25DF0] requestFromTheSystem];
  }

  return v7;
}

- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  uint64_t v12 = v7;
  id v13 = a5;
  id v8 = v13;
  id v9 = v7;
  id v10 = v11;
  fp_dispatch_async_with_logs();
}

void __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  id v11 = *(void **)(a1 + 48);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke_152;
  v14[3] = &unk_1E6A73A50;
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 32);
  id v15 = v12;
  uint64_t v16 = v13;
  id v17 = *(id *)(a1 + 56);
  [v10 itemForURL:v12 completionHandler:v14];
}

- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v12 = a5;
  uint64_t v13 = v8;
  id v14 = a6;
  id v9 = v14;
  id v10 = v8;
  id v11 = v12;
  fp_dispatch_async_with_logs();
}

void __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  id v11 = *(void **)(a1 + 48);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_155;
  v14[3] = &unk_1E6A73A78;
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 32);
  id v15 = v12;
  uint64_t v16 = v13;
  id v17 = *(id *)(a1 + 56);
  [v10 identifierForItemAtURL:v12 completionHandler:v14];
}

- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPNotSupportedError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)_cancelProvidingItemAtURL:(id)a3 withKey:(id)a4 request:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v12 = [WeakRetained serialQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[FPDDomainExtensionBackend _cancelProvidingItemAtURL:withKey:request:](v13, v14, v15, v16, v17, v18, v19, v20);
  }

  long long v21 = [(NSMutableDictionary *)self->_provideFileCompletionsByURL objectForKeyedSubscript:v8];
  v22 = [v21 objectForKeyedSubscript:v9];
  if (!v22)
  {
    v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FPDDomainExtensionBackend _cancelProvidingItemAtURL:withKey:request:](v8, v26);
    }
    goto LABEL_10;
  }
  uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  ((void (**)(void, void *))v22)[2](v22, v23);

  [v21 setObject:0 forKeyedSubscript:v9];
  if (![v21 count])
  {
    v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomainExtensionBackend _cancelProvidingItemAtURL:withKey:request:]();
    }

    [(NSMutableDictionary *)self->_provideFileCompletionsByURL setObject:0 forKeyedSubscript:v8];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke;
    v27[3] = &unk_1E6A73AA0;
    v28 = v8;
    id v25 = [(FPDDomainExtensionBackend *)self evictItemAtURL:v28 evictionReason:3 request:v10 completionHandler:v27];
    v26 = v28;
LABEL_10:
  }
}

void __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = fp_current_or_default_log();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke_cold_1(a1);
  }
}

- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v59 = a4;
  id v60 = a6;
  id v11 = (void (**)(id, NSObject *))a7;
  id v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  if (self->_invalidated)
  {
    queue = FPUserCancelledError();
    v11[2](v11, queue);
    uint64_t v20 = 0;
    goto LABEL_29;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  queue = [WeakRetained serialQueue];

  id v22 = objc_loadWeakRetained((id *)&self->_domain);
  v55 = [v22 log];

  uint64_t v23 = [MEMORY[0x1E4FB36F8] sharedManager];
  v56 = [v23 currentPersona];

  id v75 = 0;
  v57 = [v56 userPersonaUniqueString];
  v24 = objc_loadWeakRetained((id *)&self->_domain);
  id v25 = [v24 nsDomain];
  v26 = [v25 personaIdentifier];
  if (v57 == v26)
  {

    v54 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v27 = objc_loadWeakRetained((id *)&self->_domain);
  v28 = [v27 nsDomain];
  v29 = [v28 personaIdentifier];
  char v30 = [v57 isEqualToString:v29];

  if ((v30 & 1) == 0 && voucher_process_can_use_arbitrary_personas())
  {
    id v74 = 0;
    v31 = (void *)[v56 copyCurrentPersonaContextWithError:&v74];
    id v32 = v74;
    id v33 = v75;
    id v75 = v31;

    if (v32)
    {
      v34 = fp_current_or_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:]();
      }
    }
    id v35 = objc_loadWeakRetained((id *)&self->_domain);
    v36 = [v35 nsDomain];
    v37 = [v36 personaIdentifier];
    v54 = [v56 generateAndRestorePersonaContextWithPersonaUniqueString:v37];

    if (v54)
    {
      v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v38 = objc_loadWeakRetained((id *)&self->_domain);
        v39 = [v38 nsDomain];
        v40 = [v39 personaIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v40;
        __int16 v77 = 2112;
        v78 = v54;
        _os_log_error_impl(&dword_1D744C000, v24, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
  }
  v54 = 0;
LABEL_18:
  dispatch_assert_queue_V2(queue);
  if (a5 >> 29)
  {
    v11[2](v11, 0);
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    v41 = [MEMORY[0x1E4F29238] valueWithPointer:v20];
    v42 = [(NSMutableDictionary *)self->_provideFileCompletionsByURL objectForKeyedSubscript:v61];
    uint64_t v43 = [v42 count];
    if (!v42)
    {
      v42 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_provideFileCompletionsByURL setObject:v42 forKeyedSubscript:v61];
    }
    v44 = (void *)MEMORY[0x1D9471EC0](v11);
    [v42 setObject:v44 forKeyedSubscript:v41];

    [v20 setCancellable:1];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke;
    v67[3] = &unk_1E6A73AF0;
    objc_copyWeak(&v73, (id *)buf);
    v45 = queue;
    v68 = v45;
    id v46 = v55;
    id v69 = v46;
    id v47 = v61;
    id v70 = v47;
    id v48 = v41;
    id v71 = v48;
    id v49 = v60;
    id v72 = v49;
    [v20 setCancellationHandler:v67];
    if (v43)
    {
      v50 = fp_current_or_default_log();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:]();
      }

      id v51 = v20;
    }
    else
    {
      id v63 = v49;
      id v64 = v47;
      v65 = v45;
      id v66 = v46;
      fp_dispatch_async_with_logs();
      id v52 = v20;
    }
    objc_destroyWeak(&v73);
    objc_destroyWeak((id *)buf);
  }
  _FPRestorePersona();

LABEL_29:
  return v20;
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2;
  block[3] = &unk_1E6A73AC8;
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = WeakRetained;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v4 = WeakRetained;
  dispatch_async(v3, block);
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = fpfs_adopt_log();
  [*(id *)(a1 + 40) _cancelProvidingItemAtURL:*(void *)(a1 + 48) withKey:*(void *)(a1 + 56) request:*(void *)(a1 + 64)];
  __fp_pop_log();
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_161(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_161_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithTimeoutValue:*(void *)(a1 + 40) request:-1.0];
  uint64_t v11 = *(void *)(a1 + 72);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_162;
  v15[3] = &unk_1E6A73B40;
  uint64_t v12 = *(void *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  id v18 = v13;
  uint64_t v19 = v14;
  uint64_t v20 = *(void *)(a1 + 80);
  [v10 startProvidingItemAtURL:v12 readingOptions:v11 completionHandler:v15];
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_162(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163;
  block[3] = &unk_1E6A73B18;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v3;
  uint64_t v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  fpfs_adopt_log();
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t section = __fp_create_section();
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_5(v3, v27, section, v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  BOOL v5 = WeakRetained == 0;

  if (v5)
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_2();
    }

    if ([*(id *)(*(void *)(a1 + 48) + 32) count])
    {
      id v11 = [NSString stringWithFormat:@"[ASSERT] ‼️ Should not have any open requests"];
      uint64_t v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
      }

      __assert_rtn("-[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainExtensionBackend.m", 370, (const char *)[v11 UTF8String]);
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 48) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v6)
    {
      [*(id *)(*(void *)(a1 + 48) + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
      if (*(void *)(a1 + 56))
      {
        uint64_t v7 = fp_current_or_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v8 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
          uint64_t v9 = objc_msgSend(*(id *)(a1 + 56), "fp_prettyDescription");
          __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_4(v8, v9, buf, v7);
        }
      }
      else
      {
        uint64_t v7 = fp_current_or_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
          *(_DWORD *)buf = 138412290;
          v26 = v14;
          _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_INFO, "[INFO] ✅ item %@ provided", buf, 0xCu);
        }
      }

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v13 = objc_msgSend(v6, "objectEnumerator", 0);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * i) + 16))();
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v15);
      }
    }
    else
    {
      id v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_3();
      }
    }
  }
  __fp_leave_section_Debug();
  __fp_pop_log();
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 request:(id)a8 completionHandler:(id)a9
{
  id v11 = a3;
  id v12 = a5;
  id v17 = a8;
  long long v18 = v12;
  id v19 = a9;
  id v13 = v19;
  id v14 = v12;
  id v15 = v11;
  id v16 = v17;
  fp_dispatch_async_with_logs();
}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithTimeoutValue:*(void *)(a1 + 40) request:-1.0];
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 80);
  id v15 = [*(id *)(a1 + 32) nsfpRequest:*(void *)(a1 + 40)];
  uint64_t v16 = *(unsigned __int8 *)(a1 + 88);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_169;
  v18[3] = &unk_1E6A73B90;
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 64);
  id v17 = (id)[v10 createItemBasedOnTemplate:v11 fields:v13 contents:v12 options:v14 request:v15 bounce:v16 completionHandler:v18];
}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_169(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a2;
  id v9 = a6;
  id v10 = fp_current_or_default_log();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_169_cold_2();
    }

    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_169_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v13 = a5;
  uint64_t v14 = v8;
  id v15 = a6;
  id v9 = v15;
  id v10 = v8;
  id v11 = v13;
  fp_dispatch_async_with_logs();

  return 0;
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithTimeoutValue:*(void *)(a1 + 40) request:-1.0];
  id v11 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_171;
  v12[3] = &unk_1E6A73BE0;
  id v13 = v11;
  id v14 = *(id *)(a1 + 56);
  [v10 evictItemAtURL:v13 completionHandler:v12];
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = fp_current_or_default_log();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_171_cold_2();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_171_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v12 = a5;
  id v13 = a6;
  id v9 = v13;
  id v10 = v12;
  id v11 = v8;
  fp_dispatch_async_with_logs();
}

void __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_172;
  v15[3] = &unk_1E6A73C30;
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v13;
  void v15[4] = v14;
  int v18 = *(_DWORD *)(a1 + 64);
  id v16 = *(id *)(a1 + 48);
  [v10 URLForItemID:v11 creatingPlaceholderIfMissing:0 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v12 completionHandler:v15];
}

void __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_172(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 || !a3)
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v9();
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [a3 url];
    uint64_t v6 = *(unsigned int *)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6A73C08;
    uint64_t v7 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v8 = (id)[v4 evictItemAtURL:v5 evictionReason:v6 request:v7 completionHandler:v10];
  }
}

uint64_t __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)materializeItemWithID:(id)a3 requestedRange:(_NSRange)a4 request:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  FPNotSupportedError();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);
}

- (void)itemChangedAtURL:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  fp_dispatch_async_with_logs();
}

void __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  id v11 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_174;
  v12[3] = &unk_1E6A73C80;
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  [v10 itemChangedAtURL:v13 completionHandler:v12];
}

void __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_174(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_174_cold_1(a1, v3, v4);
    }
  }
}

- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8
{
  id v10 = a3;
  id v14 = a7;
  id v15 = a8;
  id v11 = v15;
  id v12 = v10;
  id v13 = v14;
  fp_dispatch_async_with_logs();
}

void __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  id v11 = *(void **)(a1 + 48);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 65);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_175;
  v16[3] = &unk_1E6A73CA8;
  id v14 = v11;
  uint64_t v15 = *(void *)(a1 + 32);
  id v17 = v14;
  uint64_t v18 = v15;
  id v19 = *(id *)(a1 + 56);
  [v10 URLForItemID:v14 creatingPlaceholderIfMissing:v12 ignoreAlternateContentsURL:v13 completionHandler:v16];
}

void __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_175(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = fp_current_or_default_log();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_175_cold_2(a1, v9, v11);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void *, void, void))(v12 + 16))(v12, v13, 0, 0);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_175_cold_1(v7, a1, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
  id v9 = a3;
  id v13 = a6;
  id v14 = v9;
  id v15 = a7;
  id v10 = v15;
  id v11 = v9;
  id v12 = v13;
  fp_dispatch_async_with_logs();
}

void __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [*(id *)(a1 + 32) nsfpRequest:*(void *)(a1 + 40)];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke_177;
  v15[3] = &unk_1E6A73CF8;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  id v16 = v13;
  uint64_t v17 = v14;
  id v18 = *(id *)(a1 + 56);
  [v10 itemForItemID:v11 request:v12 completionHandler:v15];
}

- (void)dumpStateTo:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  char v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  if (v8) {
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  uint64_t v14 = [WeakRetained provider];
  id v15 = [v14 identifier];
  char v16 = [v15 hasPrefix:@"com.apple."];

  if ((v16 & 1) == 0)
  {
LABEL_4:
    v12[2](v12, 0);
  }
  else
  {
    id v17 = objc_loadWeakRetained((id *)&self->_domain);
    id v18 = [v17 provider];
    id v19 = [v18 identifier];
    [v19 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

    id v20 = v11;
    id v21 = v10;
    id v22 = v12;
    fp_dispatch_async_with_logs();
  }
}

void __75__FPDDomainExtensionBackend_dumpStateTo_options_request_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 newFileProviderProxyWithTimeoutValue:*(void *)(a1 + 40) request:10.0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 1);
    uint64_t v6 = [WeakRetained session];
    id v11 = [v6 existingFileProviderProxyWithTimeout:0 onlyAlreadyLifetimeExtended:0 pid:10.0];

    uint64_t v4 = (uint64_t)v11;
  }
  id v12 = (id)v4;
  if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    char v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v9 = [v8 identifier];
    [v12 dumpInternalStateToTermDumper:v7 domainIdentifier:v9 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    char v8 = FPDomainUnavailableError();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);
  }
}

- (void)fetchFPCKTelemetryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  FPNotSupportedError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPNotSupportedError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)enumerateWithSettings:(id)a3 lifetimeExtender:(id)a4 observer:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v16 = v9;
  id v19 = a6;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v19;
  id v15 = v9;
  fp_dispatch_async_with_logs();
}

void __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [*(id *)(a1 + 32) enumeratedItemID];

  if (!v10)
  {
    id v19 = [NSString stringWithFormat:@"[ASSERT] ‼️ only enumerating items is supported"];
    id v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
    }

    __assert_rtn("-[FPDDomainExtensionBackend enumerateWithSettings:lifetimeExtender:observer:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainExtensionBackend.m", 604, (const char *)[v19 UTF8String]);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v12 = [WeakRetained session];

  if (v12)
  {
    id v13 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 48) requestEffectivePID]);
    id v14 = (void *)[*(id *)(a1 + 40) newFileProviderProxyWithRequest:v13];
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = [*(id *)(a1 + 40) nsfpRequest:v13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_2;
    v21[3] = &unk_1E6A73D48;
    id v22 = *(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 48);
    id v24 = v12;
    [v14 fetchAndStartEnumeratingWithSettings:v16 observer:v15 request:v17 completionHandler:v21];
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 64);
    id v13 = FPDomainUnavailableError();
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v13);
  }
}

void __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v10 = v6;
    if (!v6)
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
    }
    id v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_2_cold_1(a1, v10);
    }

    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F25DA8]);
    uint64_t v9 = [NSString stringWithFormat:@"enumerator %@", *(void *)(a1 + 32)];
    id v10 = (void *)[v8 initWithConnection:v5 protocol:&unk_1F2EF7328 orError:0 name:v9 requestPid:0];

    if (*(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(a1 + 48), "registerLifetimeExtensionForObject:");
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v11();
}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke;
  v18[3] = &unk_1E6A73DE8;
  id v22 = v10;
  id v23 = v13;
  id v19 = v11;
  id v20 = self;
  id v21 = v12;
  id v14 = v10;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  [(FPDDomainExtensionBackend *)self itemIDForURL:v17 requireProviderItemID:0 request:v15 completionHandler:v18];
}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v8 = a1[6];
    id v9 = a1[7];
    id v10 = v5;
    id v11 = a1[8];
    fp_dispatch_async_with_logs();
  }
  else
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_cold_1();
    }

    (*((void (**)(void))a1[8] + 2))();
  }
}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_247(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6A73D98;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 64);
  [v2 valuesForAttributes:v4 forItemID:v5 completionHandler:v7];
}

- (void)stateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  FPNotSupportedError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (void)wakeForPushWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  fp_dispatch_async_with_logs();
}

void __62__FPDDomainExtensionBackend_wakeForPushWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v4 = +[FPDRequest requestForSelf];
  id v3 = (void *)[v2 newFileProviderProxyWithRequest:v4];
  [v3 wakeForPushWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPNotSupportedError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v12 = a5;
  id v13 = a6;
  id v9 = v13;
  id v10 = v8;
  id v11 = v12;
  fp_dispatch_async_with_logs();
}

void __101__FPDDomainExtensionBackend_fetchServicesForItemID_allowRestrictedSources_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  [v2 fetchServicesForItemID:*(void *)(a1 + 48) allowRestrictedSources:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  fp_dispatch_async_with_logs();
}

void __78__FPDDomainExtensionBackend_fetchVendorEndpointWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  [v2 fetchVendorEndpoint:*(void *)(a1 + 48)];
}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3
{
}

- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3
{
}

- (void)saveFPCKTelemetryReport:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPNotSupportedError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3
{
  return 1;
}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  id v8 = [FPDExtensionIndexer alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v10 = [(FPDDomainIndexer *)v8 initWithExtension:v7 domain:WeakRetained enabled:v5];

  return v10;
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v12 = a5;
  id v13 = a6;
  id v9 = v13;
  id v10 = v8;
  id v11 = v12;
  fp_dispatch_async_with_logs();
}

void __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6A73E60;
  uint64_t v7 = v3;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 bulkItemChanges:v4 changedFields:v3 completionHandler:v5];
}

void __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  if ([v8 count])
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
LABEL_6:
    }
      __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke_2_cold_1();
LABEL_7:
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = v7;
  id v13 = a5;
  id v8 = v13;
  id v9 = v7;
  id v10 = v11;
  fp_dispatch_async_with_logs();
}

void __70__FPDDomainExtensionBackend_trashItemAtURL_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  [v2 trashItemAtURL:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  id v9 = v10;
  fp_dispatch_async_with_logs();
}

void __72__FPDDomainExtensionBackend_movingItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:0];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) destinationDirectoryURL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__FPDDomainExtensionBackend_movingItemAtURL_withInfo_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6A73E88;
  id v6 = *(id *)(a1 + 56);
  [v2 movingItemAtURL:v3 requiresProvidingWithDestinationURL:v4 completionHandler:v5];
}

void __72__FPDDomainExtensionBackend_movingItemAtURL_withInfo_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "fp_isFeatureUnsupportedError") && (a2 & 1) == 0) {
      goto LABEL_4;
    }
  }
  else if (!a2)
  {
LABEL_4:
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [MEMORY[0x1E4F28CC8] providingNotRequiredResponseWithSyncRootID:0];
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [MEMORY[0x1E4F28CC8] providingRequiredResponse];
LABEL_7:
  id v8 = (void *)v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
}

- (void)getKnownFolderLocations:(unint64_t)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  fp_dispatch_async_with_logs();
}

void __79__FPDDomainExtensionBackend_getKnownFolderLocations_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  [v2 getKnownFolderLocations:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPNotSupportedError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, id))a5 + 2))(v6, 0, MEMORY[0x1E4F1CBF0], v7);
}

- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7
{
  id v8 = a7;
  FPNotSupportedError();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a7 + 2))(v8, v9);
}

- (void)hasNonUploadedFilesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  FPNotSupportedError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a5 + 2))(v6, MEMORY[0x1E4F1CBF0], v7);
}

- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v15 = a5;
  id v16 = v9;
  id v17 = v10;
  id v18 = a6;
  id v11 = v18;
  id v12 = v10;
  id v13 = v9;
  id v14 = v15;
  fp_dispatch_async_with_logs();
}

void __105__FPDDomainExtensionBackend_setAlternateContentsURLWrapper_forDocumentWithURL_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __105__FPDDomainExtensionBackend_setAlternateContentsURLWrapper_forDocumentWithURL_request_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6A73C08;
  id v6 = *(id *)(a1 + 64);
  [v2 setAlternateContentsURL:v3 forDocumentWithURL:v4 completionHandler:v5];
}

uint64_t __105__FPDDomainExtensionBackend_setAlternateContentsURLWrapper_forDocumentWithURL_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAlternateContentsURLWrapperForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = v7;
  id v13 = a5;
  id v8 = v13;
  id v9 = v7;
  id v10 = v11;
  fp_dispatch_async_with_logs();
}

void __106__FPDDomainExtensionBackend_fetchAlternateContentsURLWrapperForDocumentWithURL_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__FPDDomainExtensionBackend_fetchAlternateContentsURLWrapperForDocumentWithURL_request_completionHandler___block_invoke_2;
  v4[3] = &unk_1E6A73F00;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v2 fetchAlternateContentsURLWrapperForURL:v3 completionHandler:v4];
}

uint64_t __106__FPDDomainExtensionBackend_fetchAlternateContentsURLWrapperForDocumentWithURL_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = v7;
  id v13 = a5;
  id v8 = v13;
  id v9 = v7;
  id v10 = v11;
  fp_dispatch_async_with_logs();
}

void __108__FPDDomainExtensionBackend_didUpdateAlternateContentsDocumentForDocumentWithURL_request_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) newFileProviderProxyWithRequest:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__FPDDomainExtensionBackend_didUpdateAlternateContentsDocumentForDocumentWithURL_request_completionHandler___block_invoke_2;
  v4[3] = &unk_1E6A735F8;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v2 didUpdateAlternateContentsDocumentForDocumentWithURL:v3 completionHandler:v4];
}

uint64_t __108__FPDDomainExtensionBackend_didUpdateAlternateContentsDocumentForDocumentWithURL_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  fp_dispatch_async_with_logs();
}

void __77__FPDDomainExtensionBackend_reindexAllItemsWithDropReason_completionHandler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v3 = [WeakRetained indexer];

  if (v3)
  {
    id v6 = objc_loadWeakRetained((id *)(a1[4] + 8));
    id v4 = [v6 indexer];
    [v4 signalNeedsReindexFromScratchWithDropReason:a1[6] completionHandler:a1[5]];
  }
  else
  {
    uint64_t v5 = a1[5];
    FPNotSupportedError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v6;
  id v8 = v9;
  fp_dispatch_async_with_logs();
}

void __87__FPDDomainExtensionBackend_reindexItemsWithIndexReason_identifiers_completionHandler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v3 = [WeakRetained indexer];

  if (v3)
  {
    id v6 = objc_loadWeakRetained((id *)(a1[4] + 8));
    id v4 = [v6 indexer];
    [v4 signalNeedsReindexItemsWithIdentifiers:a1[5] indexReason:a1[7] completionHandler:a1[6]];
  }
  else
  {
    uint64_t v5 = a1[6];
    FPNotSupportedError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

- (void)triggerFeedbackApprovalRequestForItemURL:(id)a3 domain:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6
{
  id v6 = (void (**)(id, void))a6;
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[FPDDomainExtensionBackend triggerFeedbackApprovalRequestForItemURL:domain:uiOnly:completionHandler:]();
  }

  v6[2](v6, 0);
}

- (void)launchFeedbackForDomain:(id)a3 itemIdentifier:(id)a4 triggeringError:(id)a5 completionHandler:(id)a6
{
  id v6 = (void (**)(id, void *))a6;
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[FPDDomainExtensionBackend launchFeedbackForDomain:itemIdentifier:triggeringError:completionHandler:]();
  }

  id v8 = FPNotSupportedError();
  v6[2](v6, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provideFileCompletionsByURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_domain);
}

void __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__FPDDomainExtensionBackend_itemForURL_request_completionHandler___block_invoke_152_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_8();
  a20 = v21;
  a21 = v22;
  id v24 = v23;
  v26 = v25;
  uint64_t v28 = v27;
  a13 = *MEMORY[0x1E4F143B8];
  v29 = objc_msgSend(*(id *)(v27 + 32), "fp_shortDescription");
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v28 + 40) + 8));
  v31 = [WeakRetained provider];
  id v32 = [v31 identifier];
  id v33 = objc_msgSend(v26, "fp_prettyDescription");
  LODWORD(a9) = 138412802;
  *(void *)((char *)&a9 + 4) = v29;
  WORD6(a9) = 2112;
  *(void *)((char *)&a9 + 14) = v32;
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D744C000, v24, OS_LOG_TYPE_ERROR, "[ERROR] can't get item for URL %@ for extension %@; %@",
    (uint8_t *)&a9,
    0x20u);

  OUTLINED_FUNCTION_11();
}

void __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_155_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_8();
  a20 = v21;
  a21 = v22;
  id v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  a13 = *MEMORY[0x1E4F143B8];
  v29 = objc_msgSend(*(id *)(v25 + 32), "fp_shortDescription");
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v26 + 40) + 8));
  v31 = [WeakRetained provider];
  id v32 = [v31 identifier];
  LODWORD(a9) = 138412802;
  *(void *)((char *)&a9 + 4) = v28;
  WORD6(a9) = 2112;
  *(void *)((char *)&a9 + 14) = v29;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D744C000, v24, v33, "[DEBUG] Successfully got item ID “%@” for %@ from extension %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_11();
}

void __90__FPDDomainExtensionBackend_itemIDForURL_requireProviderItemID_request_completionHandler___block_invoke_155_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_8();
  a20 = v21;
  a21 = v22;
  id v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  a13 = *MEMORY[0x1E4F143B8];
  v29 = objc_msgSend(*(id *)(v27 + 32), "fp_shortDescription");
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v28 + 40) + 8));
  v31 = [WeakRetained provider];
  id v32 = [v31 identifier];
  uint64_t v33 = objc_msgSend(v26, "fp_prettyDescription");
  LODWORD(a9) = 138412802;
  *(void *)((char *)&a9 + 4) = v29;
  WORD6(a9) = 2112;
  *(void *)((char *)&a9 + 14) = v32;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D744C000, v24, v34, "[DEBUG] Cannot get item ID for %@ for extension %@. Error: %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_11();
}

- (void)_cancelProvidingItemAtURL:(void *)a1 withKey:(NSObject *)a2 request:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] got cancellation request for non-pending provide for URL: %@", v4, 0xCu);
}

- (void)_cancelProvidingItemAtURL:withKey:request:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] no more reader interested by item, stop providing", v2, v3, v4, v5, v6);
}

- (void)_cancelProvidingItemAtURL:(uint64_t)a3 withKey:(uint64_t)a4 request:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1), "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] item at %@ is not provided anymore", v4, v5, v6, v7, v8);
}

void __71__FPDDomainExtensionBackend__cancelProvidingItemAtURL_withKey_request___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_7(v0), "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] can't stop providing item at %@; %@", v4, v5, v6, v7, v8);
}

- (void)startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] no need to call start providing because an identical request is alreay in-flight for a different reader", v2, v3, v4, v5, v6);
}

- (void)startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", v1, 0xCu);
}

- (void)startProvidingItemAtURL:(uint64_t)a3 readerID:(uint64_t)a4 readingOptions:(uint64_t)a5 request:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_161_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1D744C000, v0, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", v1, 0xCu);
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] request was cancelled already", v2, v3, v4, v5, v6);
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] ignoring completion request was cancelled", v2, v3, v4, v5, v6);
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_4(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] ❌ no item provided for %@; %@", buf, 0x16u);
}

void __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_5(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx completion for start providing %@", buf, 0x16u);
}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_169_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] 🆕✅ Extension successfully created item %@", v2, v3, v4, v5, v6);
}

void __125__FPDDomainExtensionBackend_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_request_completionHandler___block_invoke_169_cold_2()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7(v1) itemID];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = objc_msgSend(v0, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v5, v6, "[ERROR] 🆕❌ Extension failed to create item with ID %@. Error: %@", v7, v8, v9, v10, 2u);
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_171_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1), "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] Successfully stopped providing item at %@", v4, v5, v6, v7, v8);
}

void __85__FPDDomainExtensionBackend_evictItemAtURL_evictionReason_request_completionHandler___block_invoke_171_cold_2()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(v1), "fp_shortDescription");
  uint64_t v3 = objc_msgSend(v0, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v4, v5, "[ERROR] Cannot stop providing item at %@. Error: %@", v6, v7, v8, v9, 2u);
}

void __86__FPDDomainExtensionBackend_evictItemWithID_evictionReason_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__FPDDomainExtensionBackend_itemChangedAtURL_request___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __146__FPDDomainExtensionBackend_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_forBookmarkResolution_request_completionHandler___block_invoke_175_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 url];
  uint64_t v6 = objc_msgSend(v5, "fp_shortDescription");
  uint64_t v7 = *(void *)(a2 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a2 + 40) + 8));
  uint64_t v9 = [WeakRetained provider];
  uint64_t v10 = [v9 identifier];
  int v12 = 138412802;
  id v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D744C000, a3, v11, "[DEBUG] Successfully retrieved URL %@ for item ID “%@” from extension %@", (uint8_t *)&v12);
}

void __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __125__FPDDomainExtensionBackend_itemForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_request_completionHandler___block_invoke_177_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_8();
  a20 = v21;
  a21 = v22;
  id v24 = v23;
  a13 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = *(void *)(v25 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v25 + 40) + 8));
  uint64_t v28 = [WeakRetained provider];
  v29 = [v28 identifier];
  LODWORD(a9) = 138412802;
  *(void *)((char *)&a9 + 4) = v26;
  WORD6(a9) = 2112;
  *(void *)((char *)&a9 + 14) = v26;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D744C000, v24, v30, "[DEBUG] Successfully retrieved item %@ for item ID “%@” from extension %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_11();
}

void __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __95__FPDDomainExtensionBackend_enumerateWithSettings_lifetimeExtender_observer_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] couldn't get enumerator for %@ from extension: %@", v5, v6, v7, v8, 2u);
}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(v1), "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] no item ID for %@: %@", v3, 0x16u);
}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] values for %@: %@", v1, 0x16u);
}

void __82__FPDDomainExtensionBackend_valuesForAttributes_forURL_request_completionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_8();
  a21 = v24;
  a22 = v25;
  OUTLINED_FUNCTION_15();
  id v27 = OUTLINED_FUNCTION_16(v26);
  uint64_t v28 = [v27 provider];
  v29 = [v28 identifier];
  OUTLINED_FUNCTION_9();
  a12 = v23;
  OUTLINED_FUNCTION_13(&dword_1D744C000, v22, v30, "[DEBUG] can't get values for item at %@ from extension \"%@\"; %@",
    &a9);

  OUTLINED_FUNCTION_11();
}

void __85__FPDDomainExtensionBackend_bulkItemChanges_changedFields_request_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_18(&dword_1D744C000, v0, v1, "[ERROR] can't notify extension of item change %lu for items; %@");
}

- (void)triggerFeedbackApprovalRequestForItemURL:domain:uiOnly:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] triggerFeedbackApprovalRequest not supported in extension backend", v1, 2u);
}

- (void)launchFeedbackForDomain:itemIdentifier:triggeringError:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] launchFeedbackForProvider not supported in extension backend", v1, 2u);
}

@end