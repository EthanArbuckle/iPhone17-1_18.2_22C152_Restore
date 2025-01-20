@interface FPDDomainDeadEndBackend
- (BOOL)isAllowedToProvideItemID:(id)a3 toConsumerWithIdentifier:(id)a4;
- (BOOL)isDeadEndBackend;
- (BOOL)isProviderForRealPathURL:(id)a3;
- (BOOL)needsRootsCreation;
- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5;
- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3;
- (FPDDomainDeadEndBackend)initWithDomain:(id)a3;
- (FPDDomainDeadEndBackend)initWithDomain:(id)a3 materializationError:(id)a4;
- (NSArray)checkableURLs;
- (NSArray)coordinationRootURLs;
- (NSArray)rootURLs;
- (NSData)backingStoreIdentity;
- (NSFileProviderDomainVersion)domainVersion;
- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5;
- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5;
- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6;
- (id)rootURLsWithTransientState:(BOOL *)a3;
- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8;
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
- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6;
- (void)fetchTelemetryReportWithCompletionHandler:(id)a3;
- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7;
- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4;
- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4;
- (void)hasNonUploadedFilesWithCompletionHandler:(id)a3;
- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7;
- (void)itemForItemID:(id)a3 request:(id)a4 completionHandler:(id)a5;
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
- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)stateWithCompletionHandler:(id)a3;
- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)triggerFeedbackApprovalRequestForItemURL:(id)a3 domain:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)waitForStabilizationForRequest:(id)a3 completionHandler:(id)a4;
- (void)wakeForPushWithCompletionHandler:(id)a3;
- (void)workingSetDidChangeWithCompletionHandler:(id)a3;
@end

@implementation FPDDomainDeadEndBackend

- (FPDDomainDeadEndBackend)initWithDomain:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F25C08];
  id v6 = a3;
  v7 = [v4 errorWithDomain:v5 code:-1004 userInfo:0];
  v8 = [(FPDDomainDeadEndBackend *)self initWithDomain:v6 materializationError:v7];

  return v8;
}

- (FPDDomainDeadEndBackend)initWithDomain:(id)a3 materializationError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FPDDomainDeadEndBackend;
  v8 = [(FPDDomainDeadEndBackend *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_domain, v6);
    objc_storeStrong((id *)&v9->_materializationError, a4);
  }

  return v9;
}

- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  p_domain = &self->_domain;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_domain);
  id v6 = [WeakRetained deactivatedBackend];
  char v7 = [v6 isProviderForRealPathURL:v4];

  return v7;
}

- (NSArray)rootURLs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  v3 = [WeakRetained deactivatedBackend];
  id v4 = [v3 rootURLs];

  return (NSArray *)v4;
}

- (NSArray)coordinationRootURLs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  v3 = [WeakRetained deactivatedBackend];
  id v4 = [v3 coordinationRootURLs];

  return (NSArray *)v4;
}

- (NSArray)checkableURLs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  v3 = [WeakRetained deactivatedBackend];
  id v4 = [v3 checkableURLs];

  return (NSArray *)v4;
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  *a3 = 0;
  return [(FPDDomainDeadEndBackend *)self rootURLs];
}

- (NSData)backingStoreIdentity
{
  return 0;
}

- (NSFileProviderDomainVersion)domainVersion
{
  return 0;
}

- (void)itemForItemID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
}

- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
}

- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
}

- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
}

- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4
{
}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  v9 = (void (**)(id, NSError *))a7;
  v10 = objc_msgSend(a3, "fp_isDatalessWithError:", 0);
  int v11 = [v10 BOOLValue];

  if (v11) {
    v9[2](v9, self->_materializationError);
  }
  v9[2](v9, 0);

  return 0;
}

- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  return 0;
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)materializeItemWithID:(id)a3 requestedRange:(_NSRange)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 request:(id)a8 completionHandler:(id)a9
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

- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8
{
  id v15 = a8;
  v10 = [a3 identifier];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F25C70]];

  if (v11
    && ([(FPDDomainDeadEndBackend *)self rootURLs],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 firstObject],
        v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    v14 = [MEMORY[0x1E4F25D78] wrapperWithURL:v13 readonly:1 error:0];
    (*((void (**)(id, void, void *, void))v15 + 2))(v15, 0, v14, 0);
  }
  else
  {
    (*((void (**)(id, void, void, void))v15 + 2))(v15, 0, 0, 0);
  }
}

- (void)waitForStabilizationForRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)dumpStateTo:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)fetchTelemetryReportWithCompletionHandler:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = @"enabled";
    char v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "userEnabled"));
    v10[1] = @"disconnection_state";
    v11[0] = v7;
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "disconnectionState"));
    v11[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v4[2](v4, v9, 0);
  }
  else
  {
    v4[2](v4, 0, 0);
  }
}

- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPNotSupportedError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
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

- (void)enumerateWithSettings:(id)a3 lifetimeExtender:(id)a4 observer:(id)a5 completionHandler:(id)a6
{
}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  if (self->_materializationError)
  {
    id v6 = (void (*)(void))*((void *)a5 + 2);
    id v8 = a5;
    v6();
  }
  else
  {
    id v7 = a5;
    FPNotSupportedError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id))a5 + 2))(v7);
  }
}

- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  return 0;
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
  return 1;
}

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPDomainUnavailableError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, id))a4 + 2))(v5, 0, 0, v6);
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPDomainUnavailableError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  FPDomainUnavailableError();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, id))a6 + 2))(v7, 0, 0, v8);
}

- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPDomainUnavailableError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (BOOL)isAllowedToProvideItemID:(id)a3 toConsumerWithIdentifier:(id)a4
{
  return 0;
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F28CC8];
  id v7 = a5;
  id v8 = [v6 providingRequiredResponse];
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (void)workingSetDidChangeWithCompletionHandler:(id)a3
{
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
  FPDomainUnavailableError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v4, v5);
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

- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v4 = (void (**)(id, void *))a4;
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[FPDDomainDeadEndBackend reindexAllItemsWithDropReason:completionHandler:]();
  }

  id v6 = FPNotSupportedError();
  v4[2](v4, v6);
}

- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5
{
  id v5 = (void (**)(id, void *))a5;
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[FPDDomainDeadEndBackend reindexItemsWithIndexReason:identifiers:completionHandler:]();
  }

  id v7 = FPNotSupportedError();
  v5[2](v5, v7);
}

- (void)triggerFeedbackApprovalRequestForItemURL:(id)a3 domain:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6
{
  id v6 = (void (**)(id, void))a6;
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[FPDDomainDeadEndBackend triggerFeedbackApprovalRequestForItemURL:domain:uiOnly:completionHandler:]();
  }

  v6[2](v6, 0);
}

- (void)launchFeedbackForDomain:(id)a3 itemIdentifier:(id)a4 triggeringError:(id)a5 completionHandler:(id)a6
{
  id v6 = (void (**)(id, void *))a6;
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[FPDDomainDeadEndBackend launchFeedbackForDomain:itemIdentifier:triggeringError:completionHandler:]();
  }

  id v8 = FPNotSupportedError();
  v6[2](v6, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializationError, 0);
  objc_destroyWeak((id *)&self->_domain);
}

- (void)reindexAllItemsWithDropReason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] Error reindex all items on unsupported backend", v2, v3, v4, v5, v6);
}

- (void)reindexItemsWithIndexReason:identifiers:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] Error reindex items with identifiers on unsupported backend", v2, v3, v4, v5, v6);
}

- (void)triggerFeedbackApprovalRequestForItemURL:domain:uiOnly:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] triggerFeedbackApprovalRequest not supported in dead end backend", v2, v3, v4, v5, v6);
}

- (void)launchFeedbackForDomain:itemIdentifier:triggeringError:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] launchFeedbackForProvider not supported in dead end", v2, v3, v4, v5, v6);
}

@end