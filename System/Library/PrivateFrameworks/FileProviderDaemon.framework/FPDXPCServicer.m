@interface FPDXPCServicer
- (BOOL)_isNonSandboxedConnection;
- (BOOL)clientHasSandboxAccessToFile:(id)a3;
- (BOOL)writeMetadata:(id)a3 onURL:(id)a4 error:(id *)a5;
- (FPDServer)server;
- (FPDXPCServicer)init;
- (NSString)description;
- (NSXPCConnection)connection;
- (id)_providerForIdentifier:(id)a3 enumerateEntitlementRequired:(BOOL)a4 error:(id *)a5;
- (id)createDomainServicerForProviderDomainID:(id)a3 provider:(id)a4 enumerateEntitlementRequired:(BOOL)a5 error:(id *)a6;
- (id)defaultProviderForCurrentConnection:(id *)a3;
- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 completionHandler:(id)a6;
- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 evictionReason:(unsigned int)a6 completionHandler:(id)a7;
- (id)getSyncPausedXattrForURL:(id)a3;
- (id)providerForIdentifier:(id)a3 enumerateEntitlementRequired:(BOOL)a4 error:(id *)a5;
- (id)providersForCurrentConnection;
- (id)stageLocation;
- (id)tryTransformItemIDAfterMigration:(id)a3;
- (int)pid;
- (void)_forceIngestionForItemID:(id)a3 completionHandler:(id)a4;
- (void)_performWithCheckedEnumerationAttributes:(id)a3 completionHandler:(id)a4;
- (void)_selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5;
- (void)_test_callFileProviderManagerAPIs:(id)a3;
- (void)_test_callRemoveTrashedItemsOlderThanDate:(id)a3 completionHandler:(id)a4;
- (void)_test_disableDBQueryStatistics:(id)a3 completionHandler:(id)a4;
- (void)_test_getCountersArray:(id)a3 completionHandler:(id)a4;
- (void)_test_getDBQueryStatistics:(id)a3 queryPlan:(BOOL)a4 completionHandler:(id)a5;
- (void)_test_getNeedsIndexingStateForRootURL:(id)a3 completionHandler:(id)a4;
- (void)_test_getRootSupportDirURLForDomainURL:(id)a3 completionHandler:(id)a4;
- (void)_test_importItemsPendingReconciliationProgressForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)_test_importItemsPendingScanningDiskProgressForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)_test_importItemsPendingScanningProviderProgressForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)_test_queryDiskImportSchedulerLabel:(id)a3 completionHandler:(id)a4;
- (void)_test_resetCounters:(id)a3 completionHandler:(id)a4;
- (void)_test_resetDBQueryStatistics:(id)a3 completionHandler:(id)a4;
- (void)_test_retrieveItemWithName:(id)a3 completionHandler:(id)a4;
- (void)_test_setDocIDResolutionPolicy:(BOOL)a3 completionHandler:(id)a4;
- (void)_test_simulateInstallOfBundleID:(id)a3 completionHandler:(id)a4;
- (void)_test_simulateUninstallOfBundleID:(id)a3 completionHandler:(id)a4;
- (void)accumulatedSizeOfItemsInDomain:(id)a3 completion:(id)a4;
- (void)accumulatedSizeOfPinnedItemsInDomain:(id)a3 completion:(id)a4;
- (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 nonWrappedURL:(id)a6 userAllowedDBDrop:(BOOL)a7 knownFolders:(id)a8 completionHandler:(id)a9;
- (void)appHasNonUploadedFiles:(id)a3 completionHandler:(id)a4;
- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)backUpUserURL:(id)a3 outputUserURL:(id)a4 completionHandler:(id)a5;
- (void)bookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4;
- (void)calculateNonPurgeableSpaceUsageOfDomain:(id)a3 completionHandler:(id)a4;
- (void)checkLocationEligibilityForDomain:(id)a3 completionHandler:(id)a4;
- (void)copyDatabaseForFPCKStartingAtPath:(id)a3 completionHandler:(id)a4;
- (void)createDatabaseCopyOutputPathForDomain:(id)a3 completionHandler:(id)a4;
- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 completionHandler:(id)a8;
- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4;
- (void)didUpdateAlternateContentsDocumentForDocumentAtURL:(id)a3 completionHandler:(id)a4;
- (void)documentURLFromBookmarkableString:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6;
- (void)documentURLFromItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6;
- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6;
- (void)dumpIndexerInfoFor:(id)a3 withName:(id)a4 to:(id)a5 completionHandler:(id)a6;
- (void)dumpPlistTelemetryForProviders:(id)a3 result:(id)a4 providerFilter:(id)a5 completionHandler:(id)a6;
- (void)dumpProviders:(id)a3 dumper:(id)a4 auditToken:(id *)a5 request:(id)a6 providerFilter:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9;
- (void)dumpStateTo:(id)a3 providerFilter:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)dumpTelemetryTo:(id)a3 providerFilter:(id)a4 completionHandler:(id)a5;
- (void)evictItemWithID:(id)a3 completionHandler:(id)a4;
- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 completionHandler:(id)a5;
- (void)extendBookmarkForFileURL:(id)a3 toConsumerID:(id)a4 completionHandler:(id)a5;
- (void)extendBookmarkForItemID:(id)a3 consumerID:(id)a4 completionHandler:(id)a5;
- (void)extendSandboxForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6;
- (void)fetchAccessServicer:(id)a3;
- (void)fetchAlternateContentsURLForDocumentURL:(id)a3 completionHandler:(id)a4;
- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 completionHandler:(id)a5;
- (void)fetchDaemonOperationIDsWithCompletionHandler:(id)a3;
- (void)fetchDaemonOperationWithID:(id)a3 completionHandler:(id)a4;
- (void)fetchDomainServicerForProviderDomainID:(id)a3 handler:(id)a4;
- (void)fetchFSItemsForItemIdentifiers:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5 materializingIfNeeded:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchLatestVersionForItemAtURL:(id)a3 bundleID:(id)a4 completionHandler:(id)a5;
- (void)fetchListOfMonitoredApps:(id)a3;
- (void)fetchPathComponentsForURL:(id)a3 completionHandler:(id)a4;
- (void)fetchProviderForShareURL:(id)a3 fallbackIdentifier:(id)a4 completionHandler:(id)a5;
- (void)forceIndexingInForeground:(BOOL)a3 completionHandler:(id)a4;
- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4;
- (void)forceIngestionForItemIDs:(id)a3 completionHandler:(id)a4;
- (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4;
- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4;
- (void)getDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPersonaForProvider:(id)a3 completionHandler:(id)a4;
- (void)getURLForContainerWithItemID:(id)a3 inDataScopeDomainWithIdentifier:(id)a4 documentsScopeDomainIdentifier:(id)a5 documentsFolderItemIdentifier:(id)a6 completionHandler:(id)a7;
- (void)importProgressForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)itemForURL:(id)a3 completionHandler:(id)a4;
- (void)listPausedURLsWithBundleID:(id)a3 completionHandler:(id)a4;
- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5;
- (void)makeTopologicallySortedItemsOnDisk:(id)a3 completionHandler:(id)a4;
- (void)materializeURL:(id)a3 completionHandler:(id)a4;
- (void)pauseSyncForItemAtURL:(id)a3 behavior:(unint64_t)a4 bundleID:(id)a5 completionHandler:(id)a6;
- (void)pinItemWithID:(id)a3 completionHandler:(id)a4;
- (void)prepareRemovalOfDomainWithIdentifier:(id)a3 provider:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)preventDiskImportSchedulerFromRunning:(BOOL)a3 completionHandler:(id)a4;
- (void)providerDomainForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)providerDomainForURL:(id)a3 completionHandler:(id)a4;
- (void)providerDomainsCompletionHandler:(id)a3;
- (void)providerItemIDForURL:(id)a3 completionHandler:(id)a4;
- (void)putBackURLForTrashedItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5;
- (void)removeAllDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeDomain:(id)a3 completionHandler:(id)a4;
- (void)removeDomain:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5;
- (void)removeDomainAndPreserveDataWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5;
- (void)removeDomainWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5;
- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4;
- (void)restoreUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 cleanupOnSuccess:(BOOL)a6 completionHandler:(id)a7;
- (void)resumeSyncForItemAtURL:(id)a3 behavior:(unint64_t)a4 bundleID:(id)a5 completionHandler:(id)a6;
- (void)runFPCKForDomainWithID:(id)a3 domainRootURL:(id)a4 databaseBackupPath:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 launchType:(unint64_t)a8 completionHandler:(id)a9;
- (void)scheduleActionOperationWithInfo:(id)a3 completionHandler:(id)a4;
- (void)selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5;
- (void)setAlternateContentsURL:(id)a3 onDocumentURL:(id)a4 completionHandler:(id)a5;
- (void)setConnection:(id)a3;
- (void)setEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setIndexingEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)setServer:(id)a3;
- (void)signalReindexCSIdentifiersByProviderDomainID:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5;
- (void)spotlightReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5;
- (void)spotlightReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6;
- (void)startAccessingExtensionForProviderDomainID:(id)a3 handler:(id)a4;
- (void)startAccessingOperationServiceForProviderDomainID:(id)a3 handler:(id)a4;
- (void)startAccessingServiceForItemID:(id)a3 completionHandler:(id)a4;
- (void)startAccessingServiceWithName:(id)a3 itemID:(id)a4 domain:(id)a5 connection:(id)a6 enumerateEntitlementRequired:(BOOL)a7 completionHandler:(id)a8;
- (void)startAccessingServiceWithName:(id)a3 itemURL:(id)a4 completionHandler:(id)a5;
- (void)startDownloadingItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)startOperation:(id)a3 toFetchIconsForAppBundleIDs:(id)a4 requestedSize:(CGSize)a5 scale:(double)a6 completionHandler:(id)a7;
- (void)startProvidingItemAtURL:(id)a3 fromProviderID:(id)a4 forConsumerID:(id)a5 completionHandler:(id)a6;
- (void)stateForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)trashItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)triggerDiagnosticsFor:(id)a3 triggeringError:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)unpinItemWithID:(id)a3 completionHandler:(id)a4;
- (void)updateBlockedProcessNamesForProvider:(id)a3 processNames:(id)a4 completionHandler:(id)a5;
- (void)updateLastUsedDate:(id)a3 completionHandler:(id)a4;
- (void)valuesForAttributes:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5;
- (void)waitForChangesOnItemsBelowItemWithID:(id)a3 completionHandler:(id)a4;
- (void)waitForStabilizationOfDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)wakeUpForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation FPDXPCServicer

- (void)providerDomainsCompletionHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v22 = __51__FPDXPCServicer_providerDomainsCompletionHandler___block_invoke;
  v23 = &unk_1E6A73710;
  v24 = self;
  id v6 = v5;
  id v25 = v6;
  v7 = v21;
  v8 = self;
  v9 = [(FPDXPCServicer *)v8 connection];
  uint64_t v10 = *MEMORY[0x1E4F25E08];
  *(void *)buf = *MEMORY[0x1E4F25E00];
  *(void *)&buf[8] = v10;
  *(void *)&buf[16] = *MEMORY[0x1E4F25E28];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  char v12 = objc_msgSend(v9, "fp_hasOneOfEntitlements:", v11);
  if (v12)
  {

    v13 = [(FPDXPCServicer *)v8 server];
    v14 = [v13 extensionManager];
    v15 = [v14 providerDomainsByID];

    v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer providerDomainsCompletionHandler:](a2, v15);
    }

    v20 = fpfs_adopt_log();
    v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2080;
      v27 = "-[FPDXPCServicer providerDomainsCompletionHandler:]";
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      __int16 v30 = 2112;
      v31 = v15;
      _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@, domains: %@", buf, 0x34u);
    }

    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v15);
    __fp_pop_log();
  }
  else
  {
    v18 = FPNotPermittedError();
    v22((uint64_t)v7, v18);
  }
}

- (void)itemForURL:(id)a3 completionHandler:(id)a4
{
  v36[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  uint64_t v32 = __47__FPDXPCServicer_itemForURL_completionHandler___block_invoke;
  v33 = &unk_1E6A73710;
  v34 = self;
  id v8 = v7;
  id v35 = v8;
  v9 = self;
  id v10 = v6;
  v11 = v31;
  if (!v10)
  {
    uint64_t v24 = FPInvalidParameterError();
LABEL_8:
    id v25 = (void *)v24;
    v32((uint64_t)v11, (void *)v24);

    goto LABEL_15;
  }
  char v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:accessType:logLevel:", v10, *MEMORY[0x1E4F25908], 0);

  if ((v13 & 1) == 0)
  {
    v14 = [(FPDXPCServicer *)v9 connection];
    v36[0] = *MEMORY[0x1E4F25E28];
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v24 = FPNotPermittedError();
        goto LABEL_8;
      }
    }
  }

  uint64_t v19 = [(FPDXPCServicer *)v9 server];
  v20 = [v19 extensionManager];
  v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    v22 = [v21 defaultBackend];
    v23 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v9 pid]];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __47__FPDXPCServicer_itemForURL_completionHandler___block_invoke_177;
    v28[3] = &unk_1E6A757B0;
    v28[4] = v9;
    id v29 = v8;
    [v22 itemForURL:v10 request:v23 completionHandler:v28];
  }
  else
  {
    v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer itemForURL:completionHandler:](v10);
    }

    fpfs_adopt_log();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer itemForURL:completionHandler:]();
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    __fp_pop_log();
  }
LABEL_15:
}

- (id)createDomainServicerForProviderDomainID:(id)a3 provider:(id)a4 enumerateEntitlementRequired:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v11
    || (objc_msgSend(v10, "fp_toProviderID"),
        char v12 = objc_claimAutoreleasedReturnValue(),
        [(FPDXPCServicer *)self providerForIdentifier:v12 enumerateEntitlementRequired:v7 error:a6], id v11 = (id)objc_claimAutoreleasedReturnValue(), v12, v11))
  {
    char v13 = [FPDXPCDomainServicer alloc];
    v14 = [(FPDXPCServicer *)self server];
    v15 = [(FPDXPCServicer *)self connection];
    char v16 = [(FPDXPCDomainServicer *)v13 initWithServer:v14 providerDomainID:v10 domain:0 connection:v15];

    v17 = self;
    objc_sync_enter(v17);
    providerServicers = v17->_providerServicers;
    if (!providerServicers)
    {
      uint64_t v19 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v20 = v17->_providerServicers;
      v17->_providerServicers = (NSHashTable *)v19;

      providerServicers = v17->_providerServicers;
    }
    [(NSHashTable *)providerServicers addObject:v16];
    objc_sync_exit(v17);
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (int)pid
{
  v2 = [(FPDXPCServicer *)self connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (id)providerForIdentifier:(id)a3 enumerateEntitlementRequired:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(FPDXPCServicer *)self server];
  id v10 = [v9 extensionManager];

  [v10 updateProvidersIfNecessary];
  id v11 = [(FPDXPCServicer *)self _providerForIdentifier:v8 enumerateEntitlementRequired:v6 error:a5];
  char v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      char v16 = objc_msgSend(WeakRetained, "fp_bundleIdentifier");
      int v18 = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] No provider found with identifier %@ for calling bundle %@", (uint8_t *)&v18, 0x16u);
    }
  }

  return v12;
}

- (id)_providerForIdentifier:(id)a3 enumerateEntitlementRequired:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(FPDXPCServicer *)self defaultProviderForCurrentConnection:a5];
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  char v12 = objc_msgSend(WeakRetained, "fp_bundleIdentifier");

  id v13 = [(FPDXPCServicer *)self server];
  v14 = [v13 extensionManager];

  if (a5) {
    *a5 = 0;
  }
  if (!v8)
  {
    if (v9)
    {
      id v18 = v9;
LABEL_24:
      id v17 = v18;
      goto LABEL_25;
    }
    id v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer _providerForIdentifier:enumerateEntitlementRequired:error:]();
    }

    if (!a5)
    {
LABEL_44:
      id v17 = 0;
      goto LABEL_28;
    }
    v31 = FPProviderNotFoundError();
LABEL_43:
    id v17 = 0;
    *a5 = v31;
    goto LABEL_28;
  }
  BOOL v39 = v6;
  v15 = [v9 identifier];
  int v16 = [v15 isEqualToString:v8];

  if (!v16)
  {
    [(FPDXPCServicer *)self providersForCurrentConnection];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = (id)[v19 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v17)
    {
      v36 = v14;
      v37 = v12;
      v38 = v9;
      uint64_t v20 = *(void *)v41;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v19);
          }
          uint64_t v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v23 = [v22 identifier];
          int v24 = [v23 isEqualToString:v8];

          if (v24)
          {
            id v17 = v22;
            goto LABEL_19;
          }
        }
        id v17 = (id)[v19 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v17) {
          continue;
        }
        break;
      }
LABEL_19:
      char v12 = v37;
      v9 = v38;
      v14 = v36;
    }

    p_connection = &self->_connection;
    if (v17) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  id v17 = v9;
  if (!v17)
  {
LABEL_21:
    if (!v39) {
      goto LABEL_23;
    }
    id v25 = [(FPDXPCServicer *)self connection];
    uint64_t v49 = *MEMORY[0x1E4F25E28];
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    char v27 = objc_msgSend(v25, "fp_hasOneOfEntitlements:", v26);

    if (v27)
    {
LABEL_23:
      *(void *)buf = 0;
      id v18 = [v14 providerWithIdentifier:v8 reason:buf];
      if (v18) {
        goto LABEL_24;
      }
      uint64_t v32 = fp_current_or_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer _providerForIdentifier:enumerateEntitlementRequired:error:]();
      }

      if (a5)
      {
        FPProviderNotFoundError();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_44;
    }
    v33 = fp_current_or_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[FPDXPCServicer _providerForIdentifier:enumerateEntitlementRequired:error:]();
    }

    if (!a5) {
      goto LABEL_44;
    }
    v31 = FPNotPermittedError();
    goto LABEL_43;
  }
LABEL_25:
  __int16 v28 = fp_current_or_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    id v34 = objc_loadWeakRetained((id *)p_connection);
    id v35 = [v17 identifier];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v34;
    __int16 v45 = 2112;
    id v46 = v8;
    __int16 v47 = 2112;
    v48 = v35;
    _os_log_debug_impl(&dword_1D744C000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is allowed to access %@, resolved to %@", buf, 0x20u);
  }
LABEL_28:

  return v17;
}

- (id)providersForCurrentConnection
{
  v25[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(FPDXPCServicer *)self server];
  v4 = [v3 extensionManager];

  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  BOOL v7 = objc_msgSend(WeakRetained, "fp_bundleIdentifier");

  if (v7)
  {
    id v8 = [v4 defaultProviderWithTopLevelBundleIdentifier:v7];
    if (!v8)
    {
      id v8 = [v4 providerWithIdentifier:v7 reason:0];
      if (!v8)
      {
        v9 = (void *)MEMORY[0x1E4F223F8];
        id v10 = objc_loadWeakRetained((id *)p_connection);
        id v11 = v10;
        if (v10)
        {
          [v10 auditToken];
        }
        else
        {
          long long v23 = 0u;
          long long v24 = 0u;
        }
        id v17 = [v9 bundleRecordForAuditToken:&v23 error:0];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v17 containingBundleRecord],
              id v18 = objc_claimAutoreleasedReturnValue(),
              [v18 bundleIdentifier],
              id v19 = objc_claimAutoreleasedReturnValue(),
              v18,
              !v19))
        {

LABEL_20:
          id v20 = objc_loadWeakRetained((id *)p_connection);
          v21 = objc_msgSend(v20, "fp_applicationGroups");
          uint64_t v22 = [v4 providersWithGroupContainers:v21 bundleIdentifier:v7];
          id v8 = [v22 firstObject];

          goto LABEL_7;
        }
        id v8 = [v4 defaultProviderWithTopLevelBundleIdentifier:v19];

        if (!v8) {
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_7:
  char v12 = objc_msgSend(v8, "descriptor", v23, v24);
  id v13 = [v12 topLevelBundleIdentifier];

  if (v13 || ![v8 isAppExtensionReachable])
  {
    v15 = [v4 providersWithTopLevelBundleIdentifier:v13];
  }
  else
  {
    v14 = [v8 asAppExtensionBackedProvider];
    v25[0] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  }
  return v15;
}

- (id)defaultProviderForCurrentConnection:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = [(FPDXPCServicer *)self server];
  BOOL v6 = [v5 extensionManager];

  BOOL v7 = (void *)MEMORY[0x1E4F223F8];
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained auditToken];
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
  }
  id v11 = [v7 bundleRecordForAuditToken:&v36 error:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v11 containingBundleRecord];

    id v11 = (void *)v12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v11;
  }
  else {
    id v13 = 0;
  }

  id v14 = objc_loadWeakRetained((id *)p_connection);
  v15 = objc_msgSend(v14, "fp_bundleIdentifier");

  if (v15)
  {
    int v16 = [v6 defaultProviderWithTopLevelBundleIdentifier:v15];
    if (!v16)
    {
      int v16 = [v6 providerWithIdentifier:v15 reason:0];
      if (!v16)
      {
        uint64_t v17 = [v13 bundleIdentifier];
        if (!v17
          || (id v18 = (void *)v17,
              [v6 defaultProviderWithTopLevelBundleIdentifier:v17],
              int v16 = objc_claimAutoreleasedReturnValue(),
              v18,
              !v16))
        {
          id v19 = objc_loadWeakRetained((id *)p_connection);
          id v20 = objc_msgSend(v19, "fp_applicationGroups");
          v21 = [v6 providersWithGroupContainers:v20 bundleIdentifier:v15];

          if ((unint64_t)[v21 count] >= 2)
          {
            uint64_t v22 = fp_current_or_default_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              BOOL v39 = v15;
              __int16 v40 = 2114;
              long long v41 = v21;
              _os_log_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Caller %{public}@ has multiple candidates for associated provider (%{public}@)", buf, 0x16u);
            }
          }
          int v16 = objc_msgSend(v21, "firstObject", v36, v37);
        }
      }
    }
  }
  else
  {
    int v16 = 0;
  }
  if (!objc_msgSend(v16, "isAppExtensionReachable", v36, v37))
  {
    if (a3)
    {
      FPProviderNotRegistered();
      uint64_t v32 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (!v16 || !v13)
  {
LABEL_34:
    uint64_t v32 = [v16 asAppExtensionBackedProvider];
    goto LABEL_42;
  }
  long long v23 = [v16 asAppExtensionBackedProvider];
  long long v24 = [v23 extensionRecord];

  id v25 = [v24 containingBundleRecord];
  uint64_t v26 = FPGetRelation(v13, v25);

  if (!v26)
  {

    goto LABEL_34;
  }
  char v27 = fp_current_or_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Called from a process with a different version than the provider currently in use", buf, 2u);
  }

  if (v26 == 1)
  {
    if (a3)
    {
      __int16 v28 = [v24 containingBundleRecord];
      id v29 = [v28 URL];
      FPProviderOlderVersionRunningError();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v30 = fp_current_or_default_log();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v31 = "[INFO] Calling application is newer";
  }
  else
  {
    if (a3)
    {
      v33 = [v24 containingBundleRecord];
      id v34 = [v33 URL];
      FPProviderNewerVersionFoundError();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v30 = fp_current_or_default_log();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
    v31 = "[INFO] Calling application is older";
  }
  _os_log_impl(&dword_1D744C000, v30, OS_LOG_TYPE_INFO, v31, buf, 2u);
LABEL_40:

LABEL_41:
  uint64_t v32 = 0;
LABEL_42:

  return v32;
}

- (FPDServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (FPDServer *)WeakRetained;
}

- (void)startAccessingOperationServiceForProviderDomainID:(id)a3 handler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v27 = 0;
    id v8 = [(FPDXPCServicer *)self createDomainServicerForProviderDomainID:v6 provider:0 enumerateEntitlementRequired:0 error:&v27];
    id v9 = v27;
    id v28 = 0;
    uint64_t v10 = [v8 domainOrNil:&v28];
    id v11 = (void *)v10;
    if (v8)
    {
      if (v10)
      {
        uint64_t v12 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __76__FPDXPCServicer_startAccessingOperationServiceForProviderDomainID_handler___block_invoke;
        v23[3] = &unk_1E6A75CF0;
        v23[4] = self;
        id v25 = v7;
        id v24 = v8;
        [v11 fetchOperationServiceOrEndpointWithRequest:v12 completionHandler:v23];
      }
      else
      {
        fpfs_adopt_log();
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        int v16 = fp_current_or_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = FPPopLogSectionForBlock();
          uint64_t v22 = FPProviderNotFoundError();
          *(_DWORD *)buf = 134219778;
          uint64_t v30 = v21;
          __int16 v31 = 2112;
          uint64_t v32 = self;
          __int16 v33 = 2080;
          id v34 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]";
          __int16 v35 = 2112;
          uint64_t v36 = 0;
          __int16 v37 = 2112;
          uint64_t v38 = 0;
          __int16 v39 = 2112;
          uint64_t v40 = 0;
          __int16 v41 = 2112;
          uint64_t v42 = 0;
          __int16 v43 = 2112;
          id v44 = v22;
          _os_log_debug_impl(&dword_1D744C000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
        }
        uint64_t v17 = FPProviderNotFoundError();
        (*((void (**)(id, void, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, 0, v17);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219778;
        uint64_t v30 = v20;
        __int16 v31 = 2112;
        uint64_t v32 = self;
        __int16 v33 = 2080;
        id v34 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]";
        __int16 v35 = 2112;
        uint64_t v36 = 0;
        __int16 v37 = 2112;
        uint64_t v38 = 0;
        __int16 v39 = 2112;
        uint64_t v40 = 0;
        __int16 v41 = 2112;
        uint64_t v42 = 0;
        __int16 v43 = 2112;
        id v44 = v9;
        _os_log_debug_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
      }

      (*((void (**)(id, void, void, void, void, id))v7 + 2))(v7, 0, 0, 0, 0, v9);
      __fp_pop_log();
    }
  }
  else
  {
    fpfs_adopt_log();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = FPPopLogSectionForBlock();
      id v19 = FPInvalidParameterError();
      *(_DWORD *)buf = 134219778;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      uint64_t v32 = self;
      __int16 v33 = 2080;
      id v34 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]";
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      __int16 v37 = 2112;
      uint64_t v38 = 0;
      __int16 v39 = 2112;
      uint64_t v40 = 0;
      __int16 v41 = 2112;
      uint64_t v42 = 0;
      __int16 v43 = 2112;
      id v44 = v19;
      _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
    }
    id v14 = FPInvalidParameterError();
    (*((void (**)(id, void, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, 0, v14);

    __fp_pop_log();
  }
}

- (void)setServer:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (FPDXPCServicer)init
{
  v9.receiver = self;
  v9.super_class = (Class)FPDXPCServicer;
  v2 = [(FPDXPCServicer *)&v9 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("servicer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = fp_default_log();
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;
  }
  return v2;
}

- (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 nonWrappedURL:(id)a6 userAllowedDBDrop:(BOOL)a7 knownFolders:(id)a8 completionHandler:(id)a9
{
  BOOL v142 = a7;
  v190[1] = *MEMORY[0x1E4F143B8];
  id v148 = a3;
  id v14 = a4;
  id v146 = a5;
  id v145 = a6;
  id v144 = a8;
  id v15 = a9;
  v171[0] = MEMORY[0x1E4F143A8];
  v171[1] = 3221225472;
  v172 = __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke;
  v173 = &unk_1E6A73710;
  v174 = self;
  id v16 = v15;
  id v175 = v16;
  uint64_t v17 = self;
  uint64_t v18 = v171;
  id v176 = 0;
  v143 = v14;
  id v19 = [(FPDXPCServicer *)v17 providerForIdentifier:v14 enumerateEntitlementRequired:1 error:&v176];
  id v20 = v176;
  if (!v19)
  {
    v172((uint64_t)v18, v20);
LABEL_7:
    id v147 = 0;
    goto LABEL_9;
  }
  if ([v19 invalidated])
  {
    uint64_t v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    uint64_t v22 = NSString;
    long long v23 = [v19 identifier];
    id v24 = [v22 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v23];

    id v25 = FPProviderNotRegistered();
    v172((uint64_t)v18, v25);

    goto LABEL_7;
  }
  id v147 = v19;
LABEL_9:

  if (!v147) {
    goto LABEL_88;
  }
  id v26 = [v148 volumeUUID];
  if (v26)
  {
    int IsEnabled = FPFeatureFlagEbihilIsEnabled();

    if (IsEnabled)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v17->_server);
      id v29 = [WeakRetained volumeManager];
      uint64_t v30 = [v148 volumeUUID];
      id v170 = 0;
      __int16 v31 = [v29 libraryForVolume:v30 createIfNeeded:1 error:&v170];
      id v32 = v170;

      if (v31)
      {
        if ([v31 role] != 3) {
          goto LABEL_20;
        }
        __int16 v33 = [v147 domainsByID];
        id v34 = [v148 identifier];
        __int16 v35 = [v33 objectForKeyedSubscript:v34];
        BOOL v36 = v35 == 0;

        if (!v36) {
          goto LABEL_20;
        }
        v140 = [v31 rootURL];
        v165[0] = MEMORY[0x1E4F143A8];
        v165[1] = 3221225472;
        v166 = __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_240;
        v167 = &unk_1E6A73710;
        v168 = v17;
        id v169 = v16;
        __int16 v37 = v17;
        uint64_t v38 = v165;
        if (v140)
        {
          __int16 v39 = [(FPDXPCServicer *)v37 connection];
          char v40 = objc_msgSend(v39, "fp_hasSandboxAccessToFile:logLevel:", v140, 0);

          if (v40) {
            goto LABEL_19;
          }
          __int16 v41 = [(FPDXPCServicer *)v37 connection];
          *(void *)buf = *MEMORY[0x1E4F25E28];
          uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
          char v43 = objc_msgSend(v41, "fp_hasOneOfEntitlements:logLevel:", v42, 0);

          if ((v43 & 1) != 0
            || ([(FPDXPCServicer *)v37 connection],
                id v44 = objc_claimAutoreleasedReturnValue(),
                char v45 = objc_msgSend(v44, "fp_isNonSandboxedConnection"),
                v44,
                (v45 & 1) != 0))
          {
LABEL_19:

LABEL_20:
            goto LABEL_21;
          }
          uint64_t v117 = FPNotPermittedWriteError();
        }
        else
        {
          uint64_t v117 = FPInvalidParameterError();
        }
        v118 = (void *)v117;
        v166((uint64_t)v38, (void *)v117);
      }
      else
      {
        v75 = [v148 volumeUUID];
        v76 = objc_msgSend(v75, "fp_UUID");
        int v77 = [v76 isEqualToString:*MEMORY[0x1E4F25E70]];

        if (v77)
        {
          v78 = fp_current_or_default_log();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
            -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:].cold.6();
          }
        }
        fpfs_adopt_log();
        id v176 = (id)objc_claimAutoreleasedReturnValue();
        v79 = fp_current_or_default_log();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v122 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = v122;
          __int16 v178 = 2112;
          v179 = v17;
          __int16 v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          __int16 v182 = 2112;
          *(void *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          id v184 = v32;
          _os_log_debug_impl(&dword_1D744C000, v79, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }

        (*((void (**)(id, void, id))v16 + 2))(v16, 0, v32);
        __fp_pop_log();
      }
      goto LABEL_88;
    }
  }
LABEL_21:
  if ([v148 testingModes])
  {
    id v46 = [(FPDXPCServicer *)v17 connection];
    v190[0] = *MEMORY[0x1E4F25E50];
    __int16 v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:1];
    char v48 = objc_msgSend(v46, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v47, 0, 2);

    if ((v48 & 1) == 0)
    {
      fpfs_adopt_log();
      id v176 = (id)objc_claimAutoreleasedReturnValue();
      v63 = fp_current_or_default_log();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v115 = FPPopLogSectionForBlock();
        v116 = FPNotPermittedError();
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v115;
        __int16 v178 = 2112;
        v179 = v17;
        __int16 v180 = 2080;
        v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDro"
               "p:knownFolders:completionHandler:]";
        __int16 v182 = 2112;
        *(void *)v183 = 0;
        *(_WORD *)&v183[8] = 2112;
        id v184 = v116;
        _os_log_debug_impl(&dword_1D744C000, v63, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      v64 = FPNotPermittedError();
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v64);

      __fp_pop_log();
      goto LABEL_88;
    }
  }
  uint64_t v49 = [v146 url];
  char v141 = [v49 startAccessingSecurityScopedResource];

  if (!v146)
  {
    if (v145)
    {
      v65 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v188 = *MEMORY[0x1E4F289D0];
      id v189 = v145;
      v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
      v62 = [v65 errorWithDomain:*MEMORY[0x1E4F281F8] code:513 userInfo:v66];

      if (([v145 isFileURL] & 1) == 0)
      {
        v90 = fp_current_or_default_log();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
          -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:].cold.5();
        }

        fpfs_adopt_log();
        id v176 = (id)objc_claimAutoreleasedReturnValue();
        v72 = fp_current_or_default_log();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v123 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = v123;
          __int16 v178 = 2112;
          v179 = v17;
          __int16 v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          __int16 v182 = 2112;
          *(void *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          id v184 = v62;
          _os_log_debug_impl(&dword_1D744C000, v72, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        goto LABEL_74;
      }
      v67 = [v147 identifier];
      char v68 = [v67 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"];

      if ((v68 & 1) == 0)
      {
        v91 = fp_current_or_default_log();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
          -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:].cold.4();
        }

        fpfs_adopt_log();
        id v176 = (id)objc_claimAutoreleasedReturnValue();
        v72 = fp_current_or_default_log();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v131 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = v131;
          __int16 v178 = 2112;
          v179 = v17;
          __int16 v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          __int16 v182 = 2112;
          *(void *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          id v184 = v62;
          _os_log_debug_impl(&dword_1D744C000, v72, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        goto LABEL_74;
      }
      getpid();
      id v69 = [v145 path];
      [v69 fileSystemRepresentation];
      BOOL v70 = fpfs_lp_sandbox_check() == 0;

      if (!v70)
      {
        v71 = fp_current_or_default_log();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:]();
        }

        fpfs_adopt_log();
        id v176 = (id)objc_claimAutoreleasedReturnValue();
        v72 = fp_current_or_default_log();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v132 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = v132;
          __int16 v178 = 2112;
          v179 = v17;
          __int16 v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          __int16 v182 = 2112;
          *(void *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          id v184 = v62;
          _os_log_debug_impl(&dword_1D744C000, v72, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
LABEL_74:

        (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v62);
        __fp_pop_log();

LABEL_87:
        goto LABEL_88;
      }
      id v119 = v145;

      v62 = v119;
    }
    else
    {
      v62 = 0;
    }
LABEL_52:
    if ([v144 count])
    {
      v80 = fp_current_or_default_log();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:]();
      }

      fpfs_adopt_log();
      id v176 = (id)objc_claimAutoreleasedReturnValue();
      v81 = fp_current_or_default_log();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v120 = FPPopLogSectionForBlock();
        v121 = FPNotSupportedError();
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v120;
        __int16 v178 = 2112;
        v179 = v17;
        __int16 v180 = 2080;
        v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDro"
               "p:knownFolders:completionHandler:]";
        __int16 v182 = 2112;
        *(void *)v183 = 0;
        *(_WORD *)&v183[8] = 2112;
        id v184 = v121;
        _os_log_debug_impl(&dword_1D744C000, v81, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      v82 = FPNotSupportedError();
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v82);

      __fp_pop_log();
    }
    else
    {
      if (([v143 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"] & 1) != 0
        || [v143 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"])
      {
        v83 = [MEMORY[0x1E4FB36F8] sharedManager];
        v84 = [v83 currentPersona];

        id v157 = 0;
        v138 = (void *)[v84 copyCurrentPersonaContextWithError:&v157];
        id v85 = v157;
        if (v85)
        {
          v86 = fp_current_or_default_log();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
            -[FPDProviderDescriptor initWithExtensionRecord:].cold.8();
          }
        }
        v87 = [v147 descriptor];
        v88 = [v87 personaIdentifier];
        id v89 = (id)[v84 generateAndRestorePersonaContextWithPersonaUniqueString:v88];
      }
      else
      {
        v138 = 0;
      }
      v92 = [MEMORY[0x1E4FB36F8] sharedManager];
      v139 = [v92 currentPersona];

      objc_msgSend(v148, "setIsEnterpriseDomain:", objc_msgSend(v139, "isEnterprisePersona"));
      objc_msgSend(v148, "setIsDataSeparatedDomain:", objc_msgSend(v139, "isDataSeparatedPersona"));
      v93 = [v139 userPersonaUniqueString];
      [v148 setPersonaIdentifier:v93];

      v94 = [v148 personaIdentifier];

      if (!v94) {
        goto LABEL_79;
      }
      v95 = [v148 personaIdentifier];
      v96 = [v147 descriptor];
      v97 = [v96 personaIdentifier];
      char v98 = [v95 isEqual:v97];

      if ((v98 & 1) == 0)
      {
        v109 = fp_current_or_default_log();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          id v124 = objc_loadWeakRetained((id *)&v17->_connection);
          v125 = v124;
          if (v124)
          {
            [v124 auditToken];
          }
          else
          {
            long long v155 = 0u;
            long long v156 = 0u;
          }
          v133 = FPExecutableNameForAuditToken();
          v134 = [v147 descriptor];
          v135 = [v134 personaIdentifier];
          v136 = [v148 personaIdentifier];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v133;
          __int16 v178 = 2112;
          v179 = v135;
          __int16 v180 = 2112;
          v181 = v136;
          _os_log_error_impl(&dword_1D744C000, v109, OS_LOG_TYPE_ERROR, "[ERROR] %@ called fileproviderd to add a domain for an extension with persona %@ while running in persona %@", buf, 0x20u);
        }
        fpfs_adopt_log();
        id v176 = (id)objc_claimAutoreleasedReturnValue();
        v110 = fp_current_or_default_log();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v126 = FPPopLogSectionForBlock();
          v127 = [v148 personaIdentifier];
          v128 = [v147 descriptor];
          v129 = [v128 personaIdentifier];
          v130 = FPInvalidParameterErrorWithExpectation();
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = v126;
          __int16 v178 = 2112;
          v179 = v17;
          __int16 v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          __int16 v182 = 2112;
          *(void *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          id v184 = v130;
          _os_log_debug_impl(&dword_1D744C000, v110, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        v111 = [v148 personaIdentifier];
        v112 = [v147 descriptor];
        v113 = [v112 personaIdentifier];
        v114 = FPInvalidParameterErrorWithExpectation();
        (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v114);

        __fp_pop_log();
      }
      else
      {
LABEL_79:
        v99 = fp_current_or_default_log();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          v100 = [v148 description];
          objc_msgSend(v62, "fp_shortDescription");
          v101 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();
          v102 = [v148 personaIdentifier];
          int v137 = [v139 isPersonalPersona];
          int v103 = [v139 isEnterprisePersona];
          int v104 = [v139 isDefaultPersona];
          int v105 = [v139 isSystemPersona];
          uint64_t v106 = [v139 userPersonaType];
          *(_DWORD *)buf = 138414082;
          *(void *)&uint8_t buf[4] = v100;
          __int16 v178 = 2112;
          v179 = v101;
          __int16 v180 = 2112;
          v181 = v102;
          __int16 v182 = 1024;
          *(_DWORD *)v183 = v137;
          *(_WORD *)&v183[4] = 1024;
          *(_DWORD *)&v183[6] = v103;
          LOWORD(v184) = 1024;
          *(_DWORD *)((char *)&v184 + 2) = v104;
          HIWORD(v184) = 1024;
          int v185 = v105;
          __int16 v186 = 2048;
          uint64_t v187 = v106;
          _os_log_impl(&dword_1D744C000, v99, OS_LOG_TYPE_INFO, "[INFO] Adding domain %@ at URL %@ with persona unique string:'%@', perso:%{BOOL}d ent:%{BOOL}d def:%{BOOL}d sys:%{BOOL}d type:%lu", buf, 0x42u);
        }
        v154 = v138;
        _FPRestorePersona();
        id v107 = v138;

        v108 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v17 pid]];
        v149[0] = MEMORY[0x1E4F143A8];
        v149[1] = 3221225472;
        v149[2] = __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_254;
        v149[3] = &unk_1E6A75A28;
        char v153 = v141;
        id v150 = v146;
        v151 = v17;
        id v152 = v16;
        [v147 addDomain:v148 byImportingDirectoryAtURL:v62 userAllowedDBDrop:v142 knownFolders:v144 request:v108 completionHandler:v149];

        v138 = v107;
      }
    }
    goto LABEL_87;
  }
  v50 = [v146 url];
  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v159 = __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_241;
  v160 = &unk_1E6A75A00;
  char v164 = v141;
  id v51 = v146;
  id v161 = v51;
  v162 = v17;
  id v163 = v16;
  v52 = v17;
  id v53 = v50;
  v54 = v158;
  if (v53)
  {
    v55 = [(FPDXPCServicer *)v52 connection];
    char v56 = objc_msgSend(v55, "fp_hasSandboxAccessToFile:logLevel:", v53, 0);

    if (v56) {
      goto LABEL_28;
    }
    v57 = [(FPDXPCServicer *)v52 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v59 = objc_msgSend(v57, "fp_hasOneOfEntitlements:logLevel:", v58, 0);

    if ((v59 & 1) != 0
      || ([(FPDXPCServicer *)v52 connection],
          v60 = objc_claimAutoreleasedReturnValue(),
          char v61 = objc_msgSend(v60, "fp_isNonSandboxedConnection"),
          v60,
          (v61 & 1) != 0))
    {
LABEL_28:

      v62 = [v51 url];
      goto LABEL_52;
    }
    uint64_t v73 = FPNotPermittedWriteError();
  }
  else
  {
    uint64_t v73 = FPInvalidParameterError();
  }
  v74 = (void *)v73;
  v159((uint64_t)v54, (void *)v73);

LABEL_88:
}

void __76__FPDXPCServicer_startAccessingOperationServiceForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a2;
  unint64_t v8 = a3;
  id v9 = a4;
  if (v7 | v8)
  {
    [*(id *)(a1 + 40) startExtendingLifetime];
    uint64_t v21 = fpfs_adopt_log();
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = FPPopLogSectionForBlock();
      uint64_t v17 = *(void *)(a1 + 32);
      id v16 = *(void **)(a1 + 40);
      uint64_t v18 = [v16 providerDomainID];
      *(_DWORD *)buf = 134219778;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2080;
      id v28 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]_block_invoke";
      __int16 v29 = 2112;
      unint64_t v30 = v7;
      __int16 v31 = 2112;
      unint64_t v32 = v8;
      __int16 v33 = 2112;
      id v34 = v16;
      __int16 v35 = 2112;
      BOOL v36 = v18;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
    }
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [v11 providerDomainID];
    (*(void (**)(uint64_t, unint64_t, unint64_t, void *, void *, id))(v12 + 16))(v12, v7, v8, v11, v13, v9);

    __fp_pop_log();
  }
  else
  {
    uint64_t v22 = fpfs_adopt_log();
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = FPPopLogSectionForBlock();
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219778;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      __int16 v27 = 2080;
      id v28 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]_block_invoke";
      __int16 v29 = 2112;
      unint64_t v30 = 0;
      __int16 v31 = 2112;
      unint64_t v32 = 0;
      __int16 v33 = 2112;
      id v34 = 0;
      __int16 v35 = 2112;
      BOOL v36 = 0;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_debug_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __fp_pop_log();
  }
}

void __47__FPDXPCServicer_itemForURL_completionHandler___block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = fpfs_adopt_log();
  unint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    id v16 = "-[FPDXPCServicer itemForURL:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)fetchDaemonOperationIDsWithCompletionHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  uint64_t v22 = __63__FPDXPCServicer_fetchDaemonOperationIDsWithCompletionHandler___block_invoke;
  long long v23 = &unk_1E6A73710;
  uint64_t v24 = self;
  id v5 = v4;
  id v25 = v5;
  id v6 = v21;
  unint64_t v7 = self;
  uint64_t v8 = [(FPDXPCServicer *)v7 connection];
  uint64_t v9 = *MEMORY[0x1E4F25E08];
  *(void *)buf = *MEMORY[0x1E4F25E00];
  *(void *)&buf[8] = v9;
  *(void *)&buf[16] = *MEMORY[0x1E4F25E28];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  char v11 = objc_msgSend(v8, "fp_hasOneOfEntitlements:", v10);
  if (v11)
  {

    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer fetchDaemonOperationIDsWithCompletionHandler:]();
    }

    id WeakRetained = objc_loadWeakRetained((id *)&v7->_server);
    uint64_t v14 = [WeakRetained operationEngine];
    __int16 v15 = [v14 inFlightOperations];
    id v16 = objc_msgSend(v15, "fp_map:", &__block_literal_global_349);

    id v20 = fpfs_adopt_log();
    __int16 v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2080;
      __int16 v27 = "-[FPDXPCServicer fetchDaemonOperationIDsWithCompletionHandler:]";
      __int16 v28 = 2112;
      __int16 v29 = v16;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, void *, void))v5 + 2))(v5, v16, 0);
    __fp_pop_log();
  }
  else
  {
    id v18 = FPNotPermittedError();
    v22((uint64_t)v6, v18);
  }
}

- (void)fetchListOfMonitoredApps:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  long long v23 = __43__FPDXPCServicer_fetchListOfMonitoredApps___block_invoke;
  uint64_t v24 = &unk_1E6A73710;
  id v25 = self;
  id v5 = v4;
  id v26 = v5;
  id v6 = v22;
  unint64_t v7 = self;
  uint64_t v8 = [(FPDXPCServicer *)v7 connection];
  uint64_t v9 = *MEMORY[0x1E4F25E08];
  *(void *)buf = *MEMORY[0x1E4F25E00];
  *(void *)&buf[8] = v9;
  *(void *)&buf[16] = *MEMORY[0x1E4F25E28];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  char v11 = objc_msgSend(v8, "fp_hasOneOfEntitlements:", v10);
  if (v11)
  {

    id WeakRetained = objc_loadWeakRetained((id *)&v7->_server);
    __int16 v13 = [WeakRetained appMonitor];

    [v13 startMonitoring];
    uint64_t v21 = fpfs_adopt_log();
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = FPPopLogSectionForBlock();
      uint64_t v19 = [v13 appRegistry];
      id v20 = [v19 listOfMonitoredApps];
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2080;
      __int16 v28 = "-[FPDXPCServicer fetchListOfMonitoredApps:]";
      __int16 v29 = 2112;
      __int16 v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = 0;
      _os_log_debug_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    __int16 v15 = [v13 appRegistry];
    id v16 = [v15 listOfMonitoredApps];
    (*((void (**)(id, void *, void))v5 + 2))(v5, v16, 0);

    __fp_pop_log();
  }
  else
  {
    __int16 v17 = FPNotPermittedError();
    v23((uint64_t)v6, v17);
  }
}

- (void)forceIndexingInForeground:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v21[0] = *MEMORY[0x1E4F25E28];
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  __int16 v17 = __62__FPDXPCServicer_forceIndexingInForeground_completionHandler___block_invoke;
  uint64_t v18 = &unk_1E6A73710;
  uint64_t v19 = self;
  id v20 = v6;
  id v8 = v7;
  uint64_t v9 = &v15;
  uint64_t v10 = (FPDDomainIndexerSchedulerAssertion *)v6;
  char v11 = [(FPDXPCServicer *)self connection];
  char v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v8);

  if (v12)
  {

    __int16 v13 = [[FPDDomainIndexerSchedulerAssertion alloc] initWithPID:[(FPDXPCServicer *)self pid] forceForeground:v4];
    (*(void (**)(FPDDomainIndexerSchedulerAssertion *, FPDDomainIndexerSchedulerAssertion *, void))&v10->_pid)(v10, v13, 0);

    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v14 = FPNotPermittedError();
    v17((uint64_t)v9, v14);
  }
}

- (void)providerDomainForIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  uint64_t v24 = __64__FPDXPCServicer_providerDomainForIdentifier_completionHandler___block_invoke;
  id v25 = &unk_1E6A73710;
  id v26 = self;
  id v8 = v7;
  id v27 = v8;
  uint64_t v9 = v23;
  uint64_t v10 = self;
  char v11 = [(FPDXPCServicer *)v10 connection];
  uint64_t v12 = *MEMORY[0x1E4F25E08];
  *(void *)buf = *MEMORY[0x1E4F25E00];
  *(void *)&buf[8] = v12;
  *(void *)&buf[16] = *MEMORY[0x1E4F25E28];
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  char v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if (v14)
  {

    uint64_t v15 = [(FPDXPCServicer *)v10 server];
    uint64_t v16 = [v15 extensionManager];
    __int16 v17 = [v16 providerDomainsByID];

    uint64_t v18 = [v17 objectForKeyedSubscript:v6];
    uint64_t v22 = fpfs_adopt_log();
    uint64_t v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2080;
      __int16 v29 = "-[FPDXPCServicer providerDomainForIdentifier:completionHandler:]";
      __int16 v30 = 2112;
      __int16 v31 = v18;
      __int16 v32 = 2112;
      uint64_t v33 = 0;
      _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s domain: %@, error: %@", buf, 0x34u);
    }

    (*((void (**)(id, void *, void))v8 + 2))(v8, v18, 0);
    __fp_pop_log();
  }
  else
  {
    id v20 = FPNotPermittedError();
    v24((uint64_t)v9, v20);
  }
}

- (void)fetchDomainServicerForProviderDomainID:(id)a3 handler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, id))a4;
  id v15 = 0;
  id v8 = [(FPDXPCServicer *)self createDomainServicerForProviderDomainID:v6 provider:0 enumerateEntitlementRequired:1 error:&v15];
  id v9 = v15;
  char v14 = fpfs_adopt_log();
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = FPPopLogSectionForBlock();
    __int16 v13 = objc_msgSend(v8, "providerDomainID", v14);
    *(_DWORD *)buf = 134219266;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = self;
    __int16 v20 = 2080;
    uint64_t v21 = "-[FPDXPCServicer fetchDomainServicerForProviderDomainID:handler:]";
    __int16 v22 = 2112;
    long long v23 = v8;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }
  char v11 = [v8 providerDomainID];
  v7[2](v7, v8, v11, v9);

  __fp_pop_log();
}

- (NSString)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained processIdentifier];
  id v6 = FPExecutableNameForProcessIdentifier();
  id v7 = objc_loadWeakRetained((id *)&self->_connection);
  id v8 = [v3 stringWithFormat:@"<%@:%p %@[%d]>", v4, self, v6, objc_msgSend(v7, "processIdentifier")];

  return (NSString *)v8;
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v3 = v2->_providerServicers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invalidate", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (BOOL)_isNonSandboxedConnection
{
  v2 = [(FPDXPCServicer *)self connection];
  char v3 = objc_msgSend(v2, "fp_isNonSandboxedConnection");

  return v3;
}

- (BOOL)clientHasSandboxAccessToFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPDXPCServicer *)self connection];
  char v6 = objc_msgSend(v5, "fp_hasSandboxAccessToFile:logLevel:", v4, 2);

  return v6;
}

- (void)startAccessingServiceWithName:(id)a3 itemID:(id)a4 domain:(id)a5 connection:(id)a6 enumerateEntitlementRequired:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v32 = a6;
  id v18 = a8;
  uint64_t v19 = [v16 providerDomainID];
  SEL v20 = a2;
  if (v17)
  {
    uint64_t v21 = [v17 provider];
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v41 = 0;
  __int16 v22 = -[FPDXPCServicer createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:](self, "createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:", v19, v21, v9, &v41, v15);
  id v23 = v41;
  if (v17)
  {

    if (!v22) {
      goto LABEL_10;
    }
  }
  else
  {

    if (!v22)
    {
LABEL_10:
      (*((void (**)(id, void, void, void, void, id))v18 + 2))(v18, 0, 0, 0, 0, v23);
LABEL_12:

      __int16 v29 = v31;
      uint64_t v28 = v32;
      goto LABEL_13;
    }
    uint64_t v40 = 0;
    __int16 v24 = [(FPDXPCServicer *)self server];
    id v25 = [v24 extensionManager];
    id v17 = [v25 domainFromItemID:v16 reason:&v40];

    if (!v17)
    {
      id v17 = [v16 providerID];
      __int16 v30 = FPProviderNotFoundError();
      (*((void (**)(id, void, void, void, void, void *))v18 + 2))(v18, 0, 0, 0, 0, v30);

      goto LABEL_12;
    }
  }
  __int16 v26 = [v17 defaultBackend];
  id v27 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke;
  v33[3] = &unk_1E6A756C0;
  id v38 = v18;
  uint64_t v28 = v32;
  SEL v39 = v20;
  id v34 = v32;
  __int16 v35 = self;
  __int16 v29 = v31;
  id v36 = v31;
  id v37 = v22;
  [v26 fetchServicesForItemID:v16 allowRestrictedSources:0 request:v27 completionHandler:v33];

LABEL_13:
}

void __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = v9;
  if (v7)
  {
    char v11 = objc_msgSend(*(id *)(a1 + 32), "fp_isNonSandboxedConnection");
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke_94;
    v21[3] = &unk_1E6A75698;
    uint64_t v12 = *(void *)(a1 + 40);
    __int16 v13 = *(void **)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 72);
    v21[4] = v12;
    id v22 = v13;
    char v25 = v11;
    id v23 = *(id *)(a1 + 32);
    char v14 = objc_msgSend(v8, "fp_map:", v21);
    id v15 = v14;
    if (*(void *)(a1 + 48) && ![v14 count])
    {
      uint64_t v20 = *(void *)(a1 + 64);
      id v18 = FPNotSupportedError();
      (*(void (**)(uint64_t, void, void, void, void, void *))(v20 + 16))(v20, 0, 0, 0, 0, v18);
    }
    else
    {
      [*(id *)(a1 + 56) startExtendingLifetime];
      id v17 = *(void **)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 64);
      id v18 = [v17 providerDomainID];
      (*(void (**)(uint64_t, id, void *, void *, void *, void *))(v16 + 16))(v16, v7, v17, v18, v15, v10);
    }
  }
  else
  {
    if (!v9)
    {
      uint64_t v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke_cold_1();
      }

      long long v10 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"error");
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

id __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke_94(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 serviceName];
  if (!v4)
  {
    uint64_t v19 = [NSString stringWithFormat:@"[ASSERT] ‼️ nil message interface name"];
    uint64_t v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
    }

    __assert_rtn("-[FPDXPCServicer startAccessingServiceWithName:itemID:domain:connection:enumerateEntitlementRequired:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDXPCServicer.m", 738, (const char *)[v19 UTF8String]);
  }
  uint64_t v5 = v4;
  if (*(void *)(a1 + 40) && !objc_msgSend(v4, "isEqualToString:")) {
    goto LABEL_6;
  }
  char v6 = [v3 requiredEntitlement];

  if (!v6)
  {
    if ([v5 hasPrefix:@"com.apple.iWork"])
    {
      if (!*(unsigned char *)(a1 + 64))
      {
        id v8 = *(void **)(a1 + 48);
        uint64_t v22 = *MEMORY[0x1E4F25E90];
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        char v10 = objc_msgSend(v8, "fp_hasOneOfEntitlements:logLevel:", v9, 0);

        id v7 = 0;
        if ((v10 & 1) == 0) {
          goto LABEL_17;
        }
      }
    }
    else if ([v5 hasPrefix:@"com.apple.CloudDocs.AccountManagement"])
    {
      if (!*(unsigned char *)(a1 + 64))
      {
        id v15 = *(void **)(a1 + 48);
        uint64_t v21 = *MEMORY[0x1E4F25E18];
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        int v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

        id v7 = 0;
        if (!v17) {
          goto LABEL_17;
        }
      }
    }
LABEL_16:
    id v7 = [v3 serviceName];
    goto LABEL_17;
  }
  if (*(unsigned char *)(a1 + 64))
  {
LABEL_6:
    id v7 = 0;
    goto LABEL_17;
  }
  char v11 = *(void **)(a1 + 48);
  uint64_t v12 = [v3 requiredEntitlement];
  v23[0] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  char v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:logLevel:", v13, 0);

  id v7 = 0;
  if (v14) {
    goto LABEL_16;
  }
LABEL_17:

  return v7;
}

- (void)wakeUpForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FPDXPCServicer wakeUpForURL:completionHandler:](a2);
  }

  char v14 = fpfs_adopt_log();
  char v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = FPPopLogSectionForBlock();
    __int16 v13 = objc_opt_new();
    *(_DWORD *)buf = 134219010;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = self;
    __int16 v19 = 2080;
    uint64_t v20 = "-[FPDXPCServicer wakeUpForURL:completionHandler:]";
    __int16 v21 = 2112;
    uint64_t v22 = 0;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error:%@, transaction:%@", buf, 0x34u);
  }
  char v11 = objc_opt_new();
  v8[2](v8, 0, v11);

  __fp_pop_log();
}

- (void)extendBookmarkForItemID:(id)a3 consumerID:(id)a4 completionHandler:(id)a5
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (char *)a4;
  id v10 = a5;
  v49[0] = *MEMORY[0x1E4F25E08];
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  id v34 = __71__FPDXPCServicer_extendBookmarkForItemID_consumerID_completionHandler___block_invoke;
  __int16 v35 = &unk_1E6A75188;
  id v36 = self;
  id v12 = v8;
  id v37 = v12;
  id v13 = v10;
  id v38 = v13;
  id v14 = v11;
  id v15 = v33;
  uint64_t v16 = [(FPDXPCServicer *)self connection];
  char v17 = objc_msgSend(v16, "fp_hasOneOfEntitlements:", v14);

  if (v17)
  {

    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "fp_bundleIdentifier");
    __int16 v19 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();

    uint64_t v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v40 = (uint64_t)v12;
      __int16 v41 = 2112;
      uint64_t v42 = v19;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_debug_impl(&dword_1D744C000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Extending bookmark privileges for: “%@” from bundle %@ to %@.", buf, 0x20u);
    }

    if (v9)
    {
      __int16 v21 = +[FPDAccessControlStore sharedStore];
      uint64_t v22 = [v21 bookmarkForItemID:v12 consumerIdentifier:v9];

      __int16 v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer extendBookmarkForItemID:consumerID:completionHandler:]();
      }

      __int16 v31 = fpfs_adopt_log();
      uint64_t v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219010;
        uint64_t v40 = v28;
        __int16 v41 = 2112;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        id v44 = "-[FPDXPCServicer extendBookmarkForItemID:consumerID:completionHandler:]";
        __int16 v45 = 2112;
        id v46 = v22;
        __int16 v47 = 2112;
        char v48 = 0;
        _os_log_debug_impl(&dword_1D744C000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*((void (**)(id, void *, void))v13 + 2))(v13, v22, 0);
      __fp_pop_log();
    }
    else
    {
      id v32 = fpfs_adopt_log();
      __int16 v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = FPPopLogSectionForBlock();
        __int16 v30 = FPNotPermittedWriteError();
        *(_DWORD *)buf = 134219010;
        uint64_t v40 = v29;
        __int16 v41 = 2112;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        id v44 = "-[FPDXPCServicer extendBookmarkForItemID:consumerID:completionHandler:]";
        __int16 v45 = 2112;
        id v46 = 0;
        __int16 v47 = 2112;
        char v48 = v30;
        _os_log_debug_impl(&dword_1D744C000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      id v27 = FPNotPermittedWriteError();
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v27);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v25 = FPNotPermittedError();
    v34((uint64_t)v15, v25);
  }
}

void __71__FPDXPCServicer_extendBookmarkForItemID_consumerID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __71__FPDXPCServicer_extendBookmarkForItemID_consumerID_completionHandler___block_invoke_cold_1(a1, v4);
  }

  id v8 = fpfs_adopt_log();
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    id v14 = "-[FPDXPCServicer extendBookmarkForItemID:consumerID:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

- (void)extendBookmarkForFileURL:(id)a3 toConsumerID:(id)a4 completionHandler:(id)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  __int16 v35 = objc_msgSend(WeakRetained, "fp_bundleIdentifier");

  uint64_t v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v27 = objc_msgSend(v8, "fp_shortDescription");
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v9;
    _os_log_debug_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Extending bookmark privileges for: “%@” from bundle %@ to %@.", buf, 0x20u);
  }
  if (v9 && v35)
  {
    __int16 v13 = 0;
  }
  else
  {
    __int16 v13 = FPNotPermittedWriteError();
  }
  id v14 = [(FPDXPCServicer *)self connection];
  if ((objc_msgSend(v14, "fp_hasSandboxAccessToFile:logLevel:", v8, 0) & 1) == 0)
  {
    __int16 v15 = [(FPDXPCServicer *)self connection];
    uint64_t v16 = *MEMORY[0x1E4F25E08];
    v44[0] = *MEMORY[0x1E4F25E08];
    __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    char v18 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v17, 0);

    if (v18) {
      goto LABEL_13;
    }
    uint64_t v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v34 = [(FPDXPCServicer *)self connection];
      int v33 = [v34 processIdentifier];
      __int16 v30 = [(FPDXPCServicer *)self connection];
      [v30 processIdentifier];
      __int16 v31 = FPExecutableNameForProcessIdentifier();
      id v32 = objc_msgSend(v8, "fp_shortDescription");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v31;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v16;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v32;
      _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) has neither sandbox access nor %@ entitlement to extend bookmark for %@", buf, 0x26u);
    }
    FPNotPermittedWriteError();
    __int16 v13 = v14 = v13;
  }

LABEL_13:
  if (!v13)
  {
    *(void *)buf = 0;
    uint64_t v22 = [(FPDXPCServicer *)self server];
    __int16 v23 = [v22 extensionManager];
    uint64_t v24 = [v23 domainForURL:v8 reason:buf];

    if (v24)
    {
      uint64_t v25 = [v24 defaultBackend];
      __int16 v26 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __74__FPDXPCServicer_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke;
      v37[3] = &unk_1E6A756E8;
      v37[4] = self;
      id v40 = v10;
      id v38 = v9;
      id v39 = v8;
      [v25 itemIDForURL:v39 requireProviderItemID:0 request:v26 completionHandler:v37];

      goto LABEL_21;
    }
    __int16 v13 = FPProviderNotFoundErrorForURL();
    if (!v13) {
      goto LABEL_21;
    }
  }
  uint64_t v20 = fp_current_or_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = objc_msgSend(v8, "fp_shortDescription");
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v28;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v9;
    *(_WORD *)&buf[32] = 2112;
    *(void *)&buf[34] = v13;
    _os_log_error_impl(&dword_1D744C000, v20, OS_LOG_TYPE_ERROR, "[ERROR] Could not extend bookmark privileges for %@ from bundle %@ to consumer ID %@, error: %@", buf, 0x2Au);
  }
  id v36 = fpfs_adopt_log();
  __int16 v21 = fp_current_or_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = FPPopLogSectionForBlock();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&unsigned char buf[24] = "-[FPDXPCServicer extendBookmarkForFileURL:toConsumerID:completionHandler:]";
    *(_WORD *)&buf[32] = 2112;
    *(void *)&buf[34] = 0;
    __int16 v42 = 2112;
    __int16 v43 = v13;
    _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s bookmarkstring: %@, error: %@", buf, 0x34u);
  }

  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  __fp_pop_log();

LABEL_21:
}

void __74__FPDXPCServicer_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v19 = fpfs_adopt_log();
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = FPPopLogSectionForBlock();
      uint64_t v15 = a1[4];
      uint64_t v16 = FPPluginOperationFailedError();
      *(_DWORD *)buf = 134219010;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2080;
      __int16 v26 = "-[FPDXPCServicer extendBookmarkForFileURL:toConsumerID:completionHandler:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = 0;
      __int16 v29 = 2112;
      __int16 v30 = v16;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v8 = a1[7];
    id v9 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

    __fp_pop_log();
  }
  else
  {
    id v10 = +[FPDAccessControlStore sharedStore];
    __int16 v11 = [v10 bookmarkForItemID:v5 consumerIdentifier:a1[5]];

    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __74__FPDXPCServicer_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke_cold_1();
    }

    uint64_t v20 = fpfs_adopt_log();
    __int16 v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = FPPopLogSectionForBlock();
      uint64_t v18 = a1[4];
      *(_DWORD *)buf = 134219010;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      __int16 v26 = "-[FPDXPCServicer extendBookmarkForFileURL:toConsumerID:completionHandler:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      __int16 v30 = 0;
      _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(a1[7] + 16))();
    __fp_pop_log();
  }
}

- (void)extendSandboxForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = (FPDXPCServicer *)a4;
  __int16 v13 = (char *)a5;
  uint64_t v14 = (void (**)(id, void, void *))a6;
  uint64_t v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:](a2);
  }

  uint64_t v16 = [(FPDXPCServicer *)self connection];
  v49[0] = *MEMORY[0x1E4F25E08];
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  char v18 = objc_msgSend(v16, "fp_hasOneOfEntitlements:logLevel:", v17, 2);

  if (v18)
  {
    if (!v11 || !v12 || !v13)
    {
      __int16 v21 = FPInvalidParameterError();
      if (v21)
      {
        uint64_t v22 = 0;
LABEL_18:
        __int16 v26 = fp_current_or_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v32 = objc_msgSend(v11, "fp_shortDescription");
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v32;
          __int16 v41 = 2112;
          __int16 v42 = v12;
          __int16 v43 = 2112;
          id v44 = v13;
          __int16 v45 = 2112;
          id v46 = v21;
          _os_log_error_impl(&dword_1D744C000, v26, OS_LOG_TYPE_ERROR, "[ERROR] Could not extend sandbox for %@ from provider ID %@ to consumer ID %@, error: %@", buf, 0x2Au);
        }
        fpfs_adopt_log();
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v27 = fp_current_or_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v33 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = v33;
          __int16 v41 = 2112;
          __int16 v42 = self;
          __int16 v43 = 2080;
          id v44 = "-[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:]";
          __int16 v45 = 2112;
          id v46 = 0;
          __int16 v47 = 2112;
          char v48 = v21;
          _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s url: %@, error: %@", buf, 0x34u);
        }

        v14[2](v14, 0, v21);
        __fp_pop_log();

        goto LABEL_24;
      }
    }
    *(void *)buf = 0;
    __int16 v23 = [(FPDXPCServicer *)self server];
    uint64_t v24 = [v23 extensionManager];
    uint64_t v22 = [v24 providerWithIdentifier:v12 reason:buf];

    if (v22)
    {
      __int16 v21 = [v22 domainForURL:v11];
      if (v21) {
        goto LABEL_23;
      }
      uint64_t v25 = FPProviderNotFoundErrorForURL();
    }
    else
    {
      uint64_t v25 = FPProviderNotFoundError();
    }
    __int16 v21 = (void *)v25;
    if (v25) {
      goto LABEL_18;
    }
LABEL_23:
    uint64_t v28 = [v21 defaultBackend];
    __int16 v29 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __88__FPDXPCServicer_extendSandboxForFileURL_fromProviderID_toConsumerID_completionHandler___block_invoke;
    v34[3] = &unk_1E6A73DE8;
    v34[4] = self;
    id v38 = v14;
    id v35 = v11;
    id v36 = v12;
    id v37 = v13;
    [v28 itemIDForURL:v35 requireProviderItemID:0 request:v29 completionHandler:v34];

LABEL_24:
    goto LABEL_25;
  }
  fpfs_adopt_log();
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = FPPopLogSectionForBlock();
    uint64_t v31 = FPClientLacksEntitlement();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v30;
    __int16 v41 = 2112;
    __int16 v42 = self;
    __int16 v43 = 2080;
    id v44 = "-[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:]";
    __int16 v45 = 2112;
    id v46 = 0;
    __int16 v47 = 2112;
    char v48 = v31;
    _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s url: %@, error: %@", buf, 0x34u);
  }
  uint64_t v20 = FPClientLacksEntitlement();
  v14[2](v14, 0, v20);

  __fp_pop_log();
LABEL_25:
}

void __88__FPDXPCServicer_extendSandboxForFileURL_fromProviderID_toConsumerID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    fpfs_adopt_log();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = FPPopLogSectionForBlock();
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = FPPluginOperationFailedError();
      *(_DWORD *)buf = 134219010;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      uint64_t v28 = v19;
      __int16 v29 = 2080;
      uint64_t v30 = "-[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = 0;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s url: %@, error: %@", buf, 0x34u);
    }
    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

    __fp_pop_log();
  }
  else
  {
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(const char **)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = (uint64_t)v12;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      _os_log_impl(&dword_1D744C000, v11, OS_LOG_TYPE_INFO, "[INFO] Successfully extended sandbox for %@ from provider ID %@ to consumer ID %@.", buf, 0x20u);
    }
    uint64_t v15 = *(void *)(a1 + 40);
    id v23 = 0;
    uint64_t v16 = [MEMORY[0x1E4F25D78] wrapperWithURL:v15 readonly:0 error:&v23];
    id v7 = v23;
    fpfs_adopt_log();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = FPPopLogSectionForBlock();
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      __int16 v29 = 2080;
      uint64_t v30 = "-[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = v16;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s url: %@, error: %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log();
  }
}

- (void)startProvidingItemAtURL:(id)a3 fromProviderID:(id)a4 forConsumerID:(id)a5 completionHandler:(id)a6
{
  v70[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (FPDXPCServicer *)a4;
  id v50 = a5;
  id v12 = a6;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  char v59 = __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke;
  v60 = &unk_1E6A73710;
  char v61 = self;
  id v13 = v12;
  id v62 = v13;
  uint64_t v14 = self;
  id v15 = v10;
  uint64_t v16 = v58;
  if (!v15)
  {
    uint64_t v28 = FPInvalidParameterError();
LABEL_10:
    __int16 v29 = (void *)v28;
    v59((uint64_t)v16, (void *)v28);

    goto LABEL_27;
  }
  uint64_t v17 = [(FPDXPCServicer *)v14 connection];
  char v18 = objc_msgSend(v17, "fp_hasSandboxAccessToFile:accessType:logLevel:", v15, *MEMORY[0x1E4F25908], 0);

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = [(FPDXPCServicer *)v14 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v21 = objc_msgSend(v19, "fp_hasOneOfEntitlements:logLevel:", v20, 0);

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = [(FPDXPCServicer *)v14 connection];
      char v23 = objc_msgSend(v22, "fp_isNonSandboxedConnection");

      if ((v23 & 1) == 0)
      {
        uint64_t v28 = FPNotPermittedError();
        goto LABEL_10;
      }
    }
  }

  id v24 = [(FPDXPCServicer *)v14 connection];
  uint64_t v25 = *MEMORY[0x1E4F25E08];
  v70[0] = *MEMORY[0x1E4F25E00];
  v70[1] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  char v27 = objc_msgSend(v24, "fp_hasOneOfEntitlements:logLevel:", v26, 2);

  if (v27)
  {
    if (v11 && v50 || (FPInvalidParameterError(), (id v32 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      *(void *)buf = 0;
      __int16 v33 = [(FPDXPCServicer *)v14 server];
      id v34 = [v33 extensionManager];
      uint64_t v35 = [v34 domainForURL:v15 reason:buf];

      if (v35)
      {
        id v36 = [v35 provider];
        id v37 = [v36 identifier];
        int v38 = [v37 isEqualToString:v11];

        if (v38)
        {
          id v39 = [v35 defaultBackend];
          id v40 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v14 pid]];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke_112;
          v51[3] = &unk_1E6A75738;
          id v52 = v35;
          id v53 = v14;
          id v56 = v13;
          id v54 = v15;
          id v55 = v50;
          id v41 = v35;
          [v39 itemIDForURL:v54 requireProviderItemID:0 request:v40 completionHandler:v51];

          goto LABEL_27;
        }
        id v32 = FPInvalidParameterError();
      }
      else
      {
        id v32 = FPProviderNotFoundError();
      }

      if (!v32) {
        goto LABEL_27;
      }
    }
    __int16 v42 = fp_current_or_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      __int16 v47 = objc_msgSend(v15, "fp_shortDescription");
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v47;
      __int16 v64 = 2112;
      v65 = v11;
      __int16 v66 = 2112;
      v67 = (const char *)v50;
      __int16 v68 = 2112;
      id v69 = v32;
      _os_log_error_impl(&dword_1D744C000, v42, OS_LOG_TYPE_ERROR, "[ERROR] Cannot provide item at %@ from provider ID %@ to consumer ID %@. Error: %@", buf, 0x2Au);
    }
    fpfs_adopt_log();
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v43 = fp_current_or_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v48 = FPPopLogSectionForBlock();
      uint64_t v49 = FPProviderNotFoundError();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v48;
      __int16 v64 = 2112;
      v65 = v14;
      __int16 v66 = 2080;
      v67 = "-[FPDXPCServicer startProvidingItemAtURL:fromProviderID:forConsumerID:completionHandler:]";
      __int16 v68 = 2112;
      id v69 = v49;
      _os_log_debug_impl(&dword_1D744C000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", buf, 0x2Au);
    }
    id v44 = FPProviderNotFoundError();
    (*((void (**)(id, void *))v13 + 2))(v13, v44);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v45 = FPPopLogSectionForBlock();
      id v46 = FPClientLacksEntitlement();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v45;
      __int16 v64 = 2112;
      v65 = v14;
      __int16 v66 = 2080;
      v67 = "-[FPDXPCServicer startProvidingItemAtURL:fromProviderID:forConsumerID:completionHandler:]";
      __int16 v68 = 2112;
      id v69 = v46;
      _os_log_debug_impl(&dword_1D744C000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", buf, 0x2Au);
    }
    __int16 v31 = FPClientLacksEntitlement();
    (*((void (**)(id, void *))v13 + 2))(v13, v31);

    __fp_pop_log();
  }
LABEL_27:
}

void __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer startProvidingItemAtURL:fromProviderID:forConsumerID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke_112(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6A75710;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v6;
  id v14 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v4;
  dispatch_async(v5, v8);
}

void __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v13 = fpfs_adopt_log();
    v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = FPPopLogSectionForBlock();
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = FPPluginOperationFailedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      uint64_t v19 = "-[FPDXPCServicer startProvidingItemAtURL:fromProviderID:forConsumerID:completionHandler:]_block_invoke_2";
      __int16 v20 = 2112;
      char v21 = v11;
      _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v3 = *(void *)(a1 + 72);
    id v4 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    __fp_pop_log();
  }
  else
  {
    id v12 = [*(id *)(a1 + 48) defaultBackend];
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = [NSString stringWithFormat:@"consumer %@", *(void *)(a1 + 64)];
    id v7 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 40) pid]);
    id v8 = (id)[v12 startProvidingItemAtURL:v5 readerID:v6 readingOptions:0 request:v7 completionHandler:*(void *)(a1 + 72)];
  }
}

- (void)startDownloadingItemAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  id v39 = __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke;
  id v40 = &unk_1E6A73710;
  id v41 = self;
  id v8 = v7;
  id v42 = v8;
  uint64_t v9 = self;
  id v10 = v6;
  id v11 = v38;
  if (!v10)
  {
    uint64_t v25 = FPInvalidParameterError();
LABEL_8:
    uint64_t v26 = (void *)v25;
    v39((uint64_t)v11, (void *)v25);

    goto LABEL_13;
  }
  id v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:accessType:logLevel:", v10, *MEMORY[0x1E4F25908], 0);

  if ((v13 & 1) == 0)
  {
    id v14 = [(FPDXPCServicer *)v9 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v25 = FPNotPermittedError();
        goto LABEL_8;
      }
    }
  }

  uint64_t v19 = [(FPDXPCServicer *)v9 server];
  __int16 v20 = [v19 extensionManager];
  char v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    uint64_t v22 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v9 pid]];
    char v23 = [v21 defaultBackend];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_117;
    v31[3] = &unk_1E6A75738;
    id v32 = v21;
    __int16 v33 = v9;
    id v36 = v8;
    id v34 = v10;
    id v35 = v22;
    id v24 = v22;
    [v23 itemIDForURL:v34 requireProviderItemID:0 request:v24 completionHandler:v31];
  }
  else
  {
    fpfs_adopt_log();
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    char v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = FPPopLogSectionForBlock();
      uint64_t v30 = FPProviderNotFoundErrorForURL();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v44 = 2112;
      uint64_t v45 = v9;
      __int16 v46 = 2080;
      __int16 v47 = "-[FPDXPCServicer startDownloadingItemAtURL:completionHandler:]";
      __int16 v48 = 2112;
      uint64_t v49 = v30;
      _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v28 = FPProviderNotFoundErrorForURL();
    (*((void (**)(id, void *))v8 + 2))(v8, v28);

    __fp_pop_log();
  }

LABEL_13:
}

void __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer startDownloadingItemAtURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_2;
  block[3] = &unk_1E6A75760;
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v8;
  id v18 = *(id *)(a1 + 64);
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v17 = fpfs_adopt_log();
    v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = FPPopLogSectionForBlock();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = FPPluginOperationFailedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      __int16 v24 = 2080;
      uint64_t v25 = "-[FPDXPCServicer startDownloadingItemAtURL:completionHandler:]_block_invoke_2";
      __int16 v26 = 2112;
      char v27 = v13;
      _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v3 = *(void *)(a1 + 80);
    id v4 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    __fp_pop_log();
  }
  else if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 64) defaultBackend];
    id v6 = (id)[v5 startProvidingItemAtURL:*(void *)(a1 + 56) readerID:@"startDownloadingItemAtURL" readingOptions:0 request:*(void *)(a1 + 72) completionHandler:&__block_literal_global_123];

    id v18 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    __fp_pop_log();
  }
  else
  {
    uint64_t v19 = fpfs_adopt_log();
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = FPPopLogSectionForBlock();
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = FPItemNotFoundErrorAtURL();
      *(_DWORD *)buf = 134218754;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      __int16 v24 = 2080;
      uint64_t v25 = "-[FPDXPCServicer startDownloadingItemAtURL:completionHandler:]_block_invoke";
      __int16 v26 = 2112;
      char v27 = v16;
      _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v9 = *(void *)(a1 + 80);
    id v10 = FPItemNotFoundErrorAtURL();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    __fp_pop_log();
  }
}

- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 completionHandler:(id)a6
{
  return [(FPDXPCServicer *)self evictItemAtURL:a3 evenIfEnumeratingFP:a4 andClearACLForConsumer:a5 evictionReason:3 completionHandler:a6];
}

- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 evictionReason:(unsigned int)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  v53[6] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v41 = a5;
  id v13 = a7;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  uint64_t v49 = __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke;
  uint64_t v50 = &unk_1E6A73710;
  id v51 = self;
  id v14 = v13;
  id v52 = v14;
  uint64_t v15 = self;
  id v16 = v12;
  id v17 = v48;
  if (!v16)
  {
    uint64_t v33 = FPInvalidParameterError();
LABEL_15:
    id v34 = (void *)v33;
    v49((uint64_t)v17, (void *)v33);

    id v35 = 0;
    goto LABEL_23;
  }
  id v18 = [(FPDXPCServicer *)v15 connection];
  char v19 = objc_msgSend(v18, "fp_hasSandboxAccessToFile:accessType:logLevel:", v16, *MEMORY[0x1E4F25908], 0);

  if ((v19 & 1) == 0)
  {
    __int16 v20 = [(FPDXPCServicer *)v15 connection];
    v53[0] = *MEMORY[0x1E4F25E28];
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    char v22 = objc_msgSend(v20, "fp_hasOneOfEntitlements:logLevel:", v21, 0);

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = [(FPDXPCServicer *)v15 connection];
      char v24 = objc_msgSend(v23, "fp_isNonSandboxedConnection");

      if ((v24 & 1) == 0)
      {
        uint64_t v33 = FPNotPermittedError();
        goto LABEL_15;
      }
    }
  }

  uint64_t v25 = fp_current_or_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:].cold.5(a2);
  }

  __int16 v26 = [(FPDXPCServicer *)v15 server];
  char v27 = [v26 extensionManager];
  uint64_t v28 = [v27 domainForURL:v16 reason:0];

  if (v28)
  {
    uint64_t v29 = [v28 provider];
    int v30 = [v29 supportsEnumeration];

    if ((v30 & !v9) == 0)
    {
      id v37 = [v28 defaultBackend];
      int v38 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v15 pid]];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_124;
      v42[3] = &unk_1E6A75788;
      id v43 = v28;
      id v44 = v16;
      uint64_t v45 = v15;
      id v46 = v14;
      id v35 = [v37 evictItemAtURL:v44 evictionReason:a6 request:v38 completionHandler:v42];

      goto LABEL_22;
    }
    __int16 v31 = fp_current_or_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:].cold.4();
    }

    fpfs_adopt_log();
    id v47 = (id)objc_claimAutoreleasedReturnValue();
    id v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:]();
    }
  }
  else
  {
    id v36 = fp_current_or_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:](v16);
    }

    fpfs_adopt_log();
    id v47 = (id)objc_claimAutoreleasedReturnValue();
    id v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:]();
    }
  }

  (*((void (**)(id, void))v14 + 2))(v14, 0);
  __fp_pop_log();

  id v35 = 0;
LABEL_22:

LABEL_23:
  return v35;
}

void __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_124_cold_2();
    }

    id v15 = fpfs_adopt_log();
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = FPPopLogSectionForBlock();
      uint64_t v13 = *(void *)(a1 + 48);
      __int16 v14 = FPPluginOperationFailedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2080;
      char v22 = "-[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:]_block_invoke";
      __int16 v23 = 2112;
      char v24 = v14;
      _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", buf, 0x2Au);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    __int16 v10 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    __fp_pop_log();
  }
  else
  {
    uint64_t v16 = fpfs_adopt_log();
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_124_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
}

- (void)evictItemWithID:(id)a3 completionHandler:(id)a4
{
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 providerID];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  id v37 = __67__FPDXPCServicer_evictItemWithID_evictionReason_completionHandler___block_invoke;
  int v38 = &unk_1E6A73710;
  id v39 = self;
  id v10 = v8;
  id v40 = v10;
  uint64_t v11 = self;
  uint64_t v12 = v36;
  id v41 = 0;
  uint64_t v13 = [(FPDXPCServicer *)v11 providerForIdentifier:v9 enumerateEntitlementRequired:1 error:&v41];
  id v14 = v41;
  if (!v13)
  {
    v37((uint64_t)v12, v14);
LABEL_7:
    id v20 = 0;
    goto LABEL_9;
  }
  if ([v13 invalidated])
  {
    id v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)v13;
      _os_log_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    uint64_t v16 = NSString;
    id v17 = [v13 identifier];
    uint64_t v18 = [v16 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v17];

    __int16 v19 = FPProviderNotRegistered();
    v37((uint64_t)v12, v19);

    goto LABEL_7;
  }
  id v20 = v13;
LABEL_9:

  if (v20)
  {
    id v41 = 0;
    __int16 v21 = [(FPDXPCServicer *)v11 server];
    char v22 = [v21 extensionManager];
    __int16 v23 = [v22 domainFromItemID:v7 reason:&v41];

    if (v23)
    {
      char v24 = [v23 defaultBackend];
      uint64_t v25 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v11 pid]];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      void v33[2] = __67__FPDXPCServicer_evictItemWithID_evictionReason_completionHandler___block_invoke_125;
      v33[3] = &unk_1E6A73710;
      void v33[4] = v11;
      id v34 = v10;
      [v24 evictItemWithID:v7 evictionReason:a4 request:v25 completionHandler:v33];
    }
    else
    {
      fpfs_adopt_log();
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = FPPopLogSectionForBlock();
        int v30 = [v7 providerID];
        __int16 v31 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v43 = v29;
        __int16 v44 = 2112;
        uint64_t v45 = v11;
        __int16 v46 = 2080;
        id v47 = "-[FPDXPCServicer evictItemWithID:evictionReason:completionHandler:]";
        __int16 v48 = 2112;
        uint64_t v49 = v31;
        _os_log_debug_impl(&dword_1D744C000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      char v27 = [v7 providerID];
      uint64_t v28 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v10 + 2))(v10, v28);

      __fp_pop_log();
    }
  }
}

void __67__FPDXPCServicer_evictItemWithID_evictionReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer evictItemWithID:evictionReason:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __67__FPDXPCServicer_evictItemWithID_evictionReason_completionHandler___block_invoke_125(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer evictItemWithID:evictionReason:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)pinItemWithID:(id)a3 completionHandler:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 providerID];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  id v41 = __50__FPDXPCServicer_pinItemWithID_completionHandler___block_invoke;
  id v42 = &unk_1E6A73710;
  uint64_t v43 = self;
  id v9 = v7;
  id v44 = v9;
  __int16 v10 = self;
  uint64_t v11 = v40;
  id v45 = 0;
  __int16 v12 = [(FPDXPCServicer *)v10 providerForIdentifier:v8 enumerateEntitlementRequired:1 error:&v45];
  id v13 = v45;
  if (!v12)
  {
    v41((uint64_t)v11, v13);
LABEL_7:
    id v19 = 0;
    goto LABEL_9;
  }
  if ([v12 invalidated])
  {
    __int16 v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = (uint64_t)v12;
      _os_log_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    id v15 = NSString;
    uint64_t v16 = [v12 identifier];
    id v17 = [v15 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v16];

    uint64_t v18 = FPProviderNotRegistered();
    v41((uint64_t)v11, v18);

    goto LABEL_7;
  }
  id v19 = v12;
LABEL_9:

  if (v19)
  {
    id v45 = 0;
    id v20 = [(FPDXPCServicer *)v10 server];
    __int16 v21 = [v20 extensionManager];
    char v22 = [v21 domainFromItemID:v6 reason:&v45];

    if (v22)
    {
      __int16 v23 = [v22 defaultBackend];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        uint64_t v25 = [v22 defaultBackend];
        __int16 v26 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v10 pid]];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __50__FPDXPCServicer_pinItemWithID_completionHandler___block_invoke_128;
        v37[3] = &unk_1E6A757B0;
        v37[4] = v10;
        id v38 = v9;
        [v25 pinItemWithID:v6 request:v26 completionHandler:v37];
      }
      else
      {
        fpfs_adopt_log();
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        int v30 = fp_current_or_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v35 = FPPopLogSectionForBlock();
          id v36 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v47 = v35;
          __int16 v48 = 2112;
          uint64_t v49 = v10;
          __int16 v50 = 2080;
          id v51 = "-[FPDXPCServicer pinItemWithID:completionHandler:]";
          __int16 v52 = 2112;
          uint64_t v53 = 0;
          __int16 v54 = 2112;
          id v55 = v36;
          _os_log_debug_impl(&dword_1D744C000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        __int16 v31 = FPNotSupportedError();
        (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v31);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      char v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = FPPopLogSectionForBlock();
        uint64_t v33 = [v6 providerID];
        id v34 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        uint64_t v47 = v32;
        __int16 v48 = 2112;
        uint64_t v49 = v10;
        __int16 v50 = 2080;
        id v51 = "-[FPDXPCServicer pinItemWithID:completionHandler:]";
        __int16 v52 = 2112;
        uint64_t v53 = 0;
        __int16 v54 = 2112;
        id v55 = v34;
        _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v28 = [v6 providerID];
      uint64_t v29 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v29);

      __fp_pop_log();
    }
  }
}

void __50__FPDXPCServicer_pinItemWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer pinItemWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __50__FPDXPCServicer_pinItemWithID_completionHandler___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer pinItemWithID:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)unpinItemWithID:(id)a3 completionHandler:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 providerID];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  id v41 = __52__FPDXPCServicer_unpinItemWithID_completionHandler___block_invoke;
  id v42 = &unk_1E6A73710;
  uint64_t v43 = self;
  id v9 = v7;
  id v44 = v9;
  __int16 v10 = self;
  uint64_t v11 = v40;
  id v45 = 0;
  uint64_t v12 = [(FPDXPCServicer *)v10 providerForIdentifier:v8 enumerateEntitlementRequired:1 error:&v45];
  id v13 = v45;
  if (!v12)
  {
    v41((uint64_t)v11, v13);
LABEL_7:
    id v19 = 0;
    goto LABEL_9;
  }
  if ([v12 invalidated])
  {
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = (uint64_t)v12;
      _os_log_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    __int16 v15 = NSString;
    __int16 v16 = [v12 identifier];
    __int16 v17 = [v15 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v16];

    id v18 = FPProviderNotRegistered();
    v41((uint64_t)v11, v18);

    goto LABEL_7;
  }
  id v19 = v12;
LABEL_9:

  if (v19)
  {
    id v45 = 0;
    id v20 = [(FPDXPCServicer *)v10 server];
    uint64_t v21 = [v20 extensionManager];
    char v22 = [v21 domainFromItemID:v6 reason:&v45];

    if (v22)
    {
      __int16 v23 = [v22 defaultBackend];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        uint64_t v25 = [v22 defaultBackend];
        __int16 v26 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v10 pid]];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __52__FPDXPCServicer_unpinItemWithID_completionHandler___block_invoke_132;
        v37[3] = &unk_1E6A757B0;
        v37[4] = v10;
        id v38 = v9;
        [v25 unpinItemWithID:v6 request:v26 completionHandler:v37];
      }
      else
      {
        fpfs_adopt_log();
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        int v30 = fp_current_or_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v35 = FPPopLogSectionForBlock();
          id v36 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v47 = v35;
          __int16 v48 = 2112;
          uint64_t v49 = v10;
          __int16 v50 = 2080;
          id v51 = "-[FPDXPCServicer unpinItemWithID:completionHandler:]";
          __int16 v52 = 2112;
          uint64_t v53 = 0;
          __int16 v54 = 2112;
          id v55 = v36;
          _os_log_debug_impl(&dword_1D744C000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        __int16 v31 = FPNotSupportedError();
        (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v31);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      char v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = FPPopLogSectionForBlock();
        uint64_t v33 = [v6 providerID];
        id v34 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        uint64_t v47 = v32;
        __int16 v48 = 2112;
        uint64_t v49 = v10;
        __int16 v50 = 2080;
        id v51 = "-[FPDXPCServicer unpinItemWithID:completionHandler:]";
        __int16 v52 = 2112;
        uint64_t v53 = 0;
        __int16 v54 = 2112;
        id v55 = v34;
        _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v28 = [v6 providerID];
      uint64_t v29 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v29);

      __fp_pop_log();
    }
  }
}

void __52__FPDXPCServicer_unpinItemWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer unpinItemWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __52__FPDXPCServicer_unpinItemWithID_completionHandler___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer unpinItemWithID:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E80];
  v34[0] = *MEMORY[0x1E4F25E20];
  v34[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  char v22 = __55__FPDXPCServicer_detachKnownFolders_completionHandler___block_invoke;
  __int16 v23 = &unk_1E6A73710;
  char v24 = self;
  id v10 = v7;
  id v25 = v10;
  id v11 = v9;
  uint64_t v12 = v21;
  __int16 v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    id v20 = fpfs_adopt_log();
    __int16 v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = FPPopLogSectionForBlock();
      __int16 v19 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = self;
      __int16 v30 = 2080;
      __int16 v31 = "-[FPDXPCServicer detachKnownFolders:completionHandler:]";
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      _os_log_debug_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    __int16 v16 = FPNotSupportedError();
    (*((void (**)(id, void *))v10 + 2))(v10, v16);

    __fp_pop_log();
  }
  else
  {
    __int16 v17 = FPNotPermittedError();
    v22((uint64_t)v12, v17);
  }
}

void __55__FPDXPCServicer_detachKnownFolders_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer detachKnownFolders:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F25E80];
  v35[0] = *MEMORY[0x1E4F25E20];
  v35[1] = v9;
  __int16 v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  __int16 v23 = __63__FPDXPCServicer_attachKnownFolders_options_completionHandler___block_invoke;
  char v24 = &unk_1E6A73710;
  id v25 = self;
  id v11 = v8;
  id v26 = v11;
  id v12 = v10;
  __int16 v13 = v22;
  __int16 v14 = [(FPDXPCServicer *)self connection];
  char v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if (v15)
  {

    uint64_t v21 = fpfs_adopt_log();
    uint64_t v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = FPPopLogSectionForBlock();
      id v20 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      __int16 v30 = self;
      __int16 v31 = 2080;
      __int16 v32 = "-[FPDXPCServicer attachKnownFolders:options:completionHandler:]";
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_debug_impl(&dword_1D744C000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    __int16 v17 = FPNotSupportedError();
    (*((void (**)(id, void *))v11 + 2))(v11, v17);

    __fp_pop_log();
  }
  else
  {
    uint64_t v18 = FPNotPermittedError();
    v23((uint64_t)v13, v18);
  }
}

void __63__FPDXPCServicer_attachKnownFolders_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer attachKnownFolders:options:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  FPNotSupportedError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4F25E80];
  v28[0] = *MEMORY[0x1E4F25E20];
  v28[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  char v24 = __73__FPDXPCServicer_selectNewProviderDomain_knownFolders_completionHandler___block_invoke;
  id v25 = &unk_1E6A73710;
  id v26 = self;
  id v12 = v9;
  id v27 = v12;
  id v13 = v11;
  __int16 v14 = v23;
  id v15 = [(FPDXPCServicer *)self connection];
  char v16 = objc_msgSend(v15, "fp_hasOneOfEntitlements:", v13);

  if (v16)
  {

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__FPDXPCServicer_selectNewProviderDomain_knownFolders_completionHandler___block_invoke_133;
    v19[3] = &unk_1E6A75188;
    id v20 = v8;
    uint64_t v21 = self;
    id v22 = v12;
    [(FPDXPCServicer *)self _selectNewProviderDomain:v20 knownFolders:a4 completionHandler:v19];

    id v17 = v20;
  }
  else
  {
    uint64_t v18 = FPNotPermittedError();
    v24((uint64_t)v14, v18);

    id v17 = v27;
  }
}

void __73__FPDXPCServicer_selectNewProviderDomain_knownFolders_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer selectNewProviderDomain:knownFolders:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __73__FPDXPCServicer_selectNewProviderDomain_knownFolders_completionHandler___block_invoke_133(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "fp_toProviderID");
  uint64_t v5 = (void *)v4;
  uint64_t v6 = @"no provider";
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  id v7 = v6;

  id v8 = [MEMORY[0x1E4F61980] defaultManager];
  uint64_t v9 = [v8 sessionForProviderID:v7 version:0];

  [v9 postReportWithCategory:1 type:1 payload:&unk_1F2EDBCB0 error:v3];
  id v13 = fpfs_adopt_log();
  __int16 v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = FPPopLogSectionForBlock();
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2080;
    uint64_t v19 = "-[FPDXPCServicer selectNewProviderDomain:knownFolders:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

void __51__FPDXPCServicer_providerDomainsCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer providerDomainsCompletionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@, domains: %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __64__FPDXPCServicer_providerDomainForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer providerDomainForIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@, domains: %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)providerDomainForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  id v34 = __57__FPDXPCServicer_providerDomainForURL_completionHandler___block_invoke;
  uint64_t v35 = &unk_1E6A73710;
  id v36 = self;
  id v8 = v7;
  id v37 = v8;
  uint64_t v9 = self;
  id v10 = v6;
  uint64_t v11 = v33;
  if (!v10)
  {
    uint64_t v26 = FPInvalidParameterError();
LABEL_11:
    id v27 = (void *)v26;
    v34((uint64_t)v11, (void *)v26);

    goto LABEL_18;
  }
  __int16 v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:accessType:logLevel:", v10, *MEMORY[0x1E4F25908], 0);

  if ((v13 & 1) == 0)
  {
    __int16 v14 = [(FPDXPCServicer *)v9 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      id v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v26 = FPNotPermittedError();
        goto LABEL_11;
      }
    }
  }

  uint64_t v19 = [(FPDXPCServicer *)v9 server];
  __int16 v20 = [v19 extensionManager];
  id v21 = [v20 domainForURL:v10 reason:0];

  uint64_t v22 = [v21 provider];
  __int16 v23 = v22;
  if (v21 && v22)
  {
    char v24 = [v22 providerDomainForDomain:v21];
    objc_msgSend(v24, "setShouldHideDomainDisplayName:", objc_msgSend(v23, "shouldHideDomainDisplayName"));
    __int16 v31 = fpfs_adopt_log();
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v30;
      __int16 v39 = 2112;
      id v40 = v9;
      __int16 v41 = 2080;
      id v42 = "-[FPDXPCServicer providerDomainForURL:completionHandler:]";
      __int16 v43 = 2112;
      id v44 = v24;
      __int16 v45 = 2112;
      uint64_t v46 = 0;
      _os_log_debug_impl(&dword_1D744C000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, void *, void))v8 + 2))(v8, v24, 0);
    __fp_pop_log();
  }
  else
  {
    uint64_t v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer providerDomainForURL:completionHandler:](v10);
    }

    __int16 v32 = fpfs_adopt_log();
    __int16 v29 = fp_current_or_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer providerDomainForURL:completionHandler:]();
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    __fp_pop_log();
  }
LABEL_18:
}

void __57__FPDXPCServicer_providerDomainForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer providerDomainForURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (id)tryTransformItemIDAfterMigration:(id)a3
{
  id v4 = a3;
  if (!FPIsCloudDocsWithFPFSEnabled()) {
    goto LABEL_12;
  }
  uint64_t v5 = [v4 providerID];
  if ([v5 isEqual:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
  {
  }
  else
  {
    uint64_t v6 = [v4 providerID];
    int v7 = [v6 isEqual:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

    if (!v7) {
      goto LABEL_12;
    }
  }
  id v8 = [v4 providerID];
  char v9 = [v8 isEqual:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];

  if (v9)
  {
    __int16 v10 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  }
  else
  {
    uint64_t v11 = [v4 providerID];
    int v12 = [v11 isEqual:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

    if (v12) {
      __int16 v10 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
    }
    else {
      __int16 v10 = 0;
    }
  }
  char v13 = [(FPDXPCServicer *)self server];
  __int16 v14 = [v13 extensionManager];
  uint64_t v15 = [v14 domainsForAppBundleIdentifier:v10];
  __int16 v16 = objc_msgSend(v15, "fp_filter:", &__block_literal_global_159_0);
  id v17 = [v16 firstObject];

  if (v17)
  {
    uint64_t v18 = [v17 providerDomainID];
    id v19 = [v4 transformForMigratedCloudDocsProviderDomainIdentifier:v18];

    goto LABEL_13;
  }
LABEL_12:
  id v19 = v4;
LABEL_13:

  return v19;
}

uint64_t __51__FPDXPCServicer_tryTransformItemIDAfterMigration___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqual:*MEMORY[0x1E4F25C00]] ^ 1;

  return v3;
}

- (void)documentURLFromBookmarkableString:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v63[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  int v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]();
  }

  char v13 = [(FPDXPCServicer *)self connection];
  __int16 v14 = objc_msgSend(v13, "fp_bundleIdentifier");

  uint64_t v15 = [(FPDXPCServicer *)self connection];
  v63[0] = *MEMORY[0x1E4F25E38];
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
  int v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

  if (v14) {
    char v18 = 1;
  }
  else {
    char v18 = v17;
  }
  if (v18)
  {
    id v19 = +[FPDAccessControlStore sharedStore];
    __int16 v20 = v19;
    if (v17)
    {
      id v21 = [v19 parseUnverifiedBookmark:v10];
    }
    else
    {
      char v24 = [(FPDXPCServicer *)self connection];
      id v25 = v24;
      if (v24) {
        [v24 auditToken];
      }
      else {
        memset(v49, 0, sizeof(v49));
      }
      id v21 = [v20 verifyBookmark:v10 auditToken:v49 consumerIdentifier:v14];
    }
    if (v21)
    {
      id v50 = 0;
      uint64_t v26 = [(FPDXPCServicer *)self server];
      id v27 = [v26 extensionManager];
      uint64_t v28 = [v27 domainFromItemID:v21 reason:&v50];

      if (v28)
      {
        objc_msgSend(v28, "defaultBackend", v21);
      }
      else
      {
        __int16 v45 = [(FPDXPCServicer *)self tryTransformItemIDAfterMigration:v21];

        __int16 v31 = [(FPDXPCServicer *)self server];
        __int16 v32 = [v31 extensionManager];
        uint64_t v28 = [v32 domainFromItemID:v45 reason:&v50];

        if (!v28)
        {
          uint64_t v46 = fpfs_adopt_log();
          uint64_t v35 = fp_current_or_default_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v42 = FPPopLogSectionForBlock();
            __int16 v43 = [v45 providerID];
            id v44 = FPProviderNotFoundError();
            *(_DWORD *)buf = 134219266;
            uint64_t v52 = v42;
            __int16 v53 = 2112;
            __int16 v54 = self;
            __int16 v55 = 2080;
            uint64_t v56 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContent"
                  "sURL:completionHandler:]";
            __int16 v57 = 2112;
            uint64_t v58 = 0;
            __int16 v59 = 2112;
            uint64_t v60 = 0;
            __int16 v61 = 2112;
            id v62 = v44;
            _os_log_debug_impl(&dword_1D744C000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
          }
          id v36 = [v45 providerID];
          id v37 = FPProviderNotFoundError();
          (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v37);

          __fp_pop_log();
          goto LABEL_25;
        }
        objc_msgSend(v28, "defaultBackend", v45);
      __int16 v33 = };
      id v34 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __126__FPDXPCServicer_documentURLFromBookmarkableString_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke;
      v47[3] = &unk_1E6A73788;
      v47[4] = self;
      id v48 = v11;
      [v33 URLForItemID:v45 creatingPlaceholderIfMissing:v8 ignoreAlternateContentsURL:v7 forBookmarkResolution:1 request:v34 completionHandler:v47];

LABEL_25:
      goto LABEL_26;
    }
    fpfs_adopt_log();
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v29 = fp_current_or_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = FPPopLogSectionForBlock();
      __int16 v41 = FPNotPermittedError();
      *(_DWORD *)buf = 134219266;
      uint64_t v52 = v40;
      __int16 v53 = 2112;
      __int16 v54 = self;
      __int16 v55 = 2080;
      uint64_t v56 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:c"
            "ompletionHandler:]";
      __int16 v57 = 2112;
      uint64_t v58 = 0;
      __int16 v59 = 2112;
      uint64_t v60 = 0;
      __int16 v61 = 2112;
      id v62 = v41;
      _os_log_debug_impl(&dword_1D744C000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
    uint64_t v30 = FPNotPermittedError();
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v30);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = FPPopLogSectionForBlock();
      __int16 v39 = FPNotPermittedError();
      *(_DWORD *)buf = 134219266;
      uint64_t v52 = v38;
      __int16 v53 = 2112;
      __int16 v54 = self;
      __int16 v55 = 2080;
      uint64_t v56 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:c"
            "ompletionHandler:]";
      __int16 v57 = 2112;
      uint64_t v58 = 0;
      __int16 v59 = 2112;
      uint64_t v60 = 0;
      __int16 v61 = 2112;
      id v62 = v39;
      _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
    __int16 v23 = FPNotPermittedError();
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v23);

    __fp_pop_log();
  }
LABEL_26:
}

void __126__FPDXPCServicer_documentURLFromBookmarkableString_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    uint64_t v15 = fpfs_adopt_log();
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = FPPopLogSectionForBlock();
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      id v21 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:c"
            "ompletionHandler:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = 0;
      __int16 v24 = 2112;
      id v25 = 0;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }
  else
  {
    uint64_t v15 = fpfs_adopt_log();
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = FPPopLogSectionForBlock();
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      id v21 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:c"
            "ompletionHandler:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = 0;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)documentURLFromItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v61 = a4;
  BOOL v62 = a5;
  v85[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  id v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]();
  }

  uint64_t v11 = [(FPDXPCServicer *)self connection];
  v85[0] = *MEMORY[0x1E4F25E38];
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
  char v13 = objc_msgSend(v11, "fp_hasOneOfEntitlements:logLevel:", v12, 0);

  if (v13) {
    goto LABEL_19;
  }
  uint64_t v14 = [(FPDXPCServicer *)self connection];
  uint64_t v15 = objc_msgSend(v14, "fp_bundleIdentifier");
  __int16 v16 = [v8 providerID];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {
    __int16 v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:](self, v18);
    }

    fpfs_adopt_log();
    id v72 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v49 = FPPopLogSectionForBlock();
      id v50 = FPNotPermittedError();
      *(_DWORD *)buf = 134219266;
      uint64_t v74 = v49;
      __int16 v75 = 2112;
      v76 = self;
      __int16 v77 = 2080;
      v78 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
      __int16 v79 = 2112;
      uint64_t v80 = 0;
      __int16 v81 = 2112;
      uint64_t v82 = 0;
      __int16 v83 = 2112;
      v84 = v50;
      _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
    __int16 v20 = FPNotPermittedError();
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v20);

    __fp_pop_log();
    goto LABEL_33;
  }
  uint64_t v60 = [v8 providerID];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v67 = __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke;
  __int16 v68 = &unk_1E6A75188;
  id v69 = self;
  id v59 = v8;
  id v70 = v59;
  id v71 = v9;
  id v21 = self;
  __int16 v22 = v66;
  id v72 = 0;
  id v23 = [(FPDXPCServicer *)v21 providerForIdentifier:v60 enumerateEntitlementRequired:1 error:&v72];
  id v24 = v72;
  if (!v23)
  {
    v67((uint64_t)v22, v24);
LABEL_16:
    id v30 = 0;
    goto LABEL_18;
  }
  if ([v23 invalidated])
  {
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v74 = (uint64_t)v23;
      _os_log_impl(&dword_1D744C000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    __int16 v26 = NSString;
    id v27 = [v23 identifier];
    uint64_t v28 = [v26 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v27];

    __int16 v29 = FPProviderNotRegistered();
    v67((uint64_t)v22, v29);

    goto LABEL_16;
  }
  id v30 = v23;
LABEL_18:

  if (!v30)
  {
    id v8 = v59;
    goto LABEL_33;
  }
LABEL_19:
  if (v8)
  {
    __int16 v31 = [v8 identifier];
    BOOL v32 = [v31 length] == 0;

    if (!v32)
    {
      id v72 = 0;
      __int16 v33 = [(FPDXPCServicer *)self server];
      id v34 = [v33 extensionManager];
      uint64_t v35 = [v34 domainFromItemID:v8 checkInvalidation:1 reason:&v72];

      if (v35)
      {
        id v36 = v8;
      }
      else
      {
        id v36 = [(FPDXPCServicer *)self tryTransformItemIDAfterMigration:v8];

        uint64_t v42 = [(FPDXPCServicer *)self server];
        __int16 v43 = [v42 extensionManager];
        uint64_t v35 = [v43 domainFromItemID:v36 checkInvalidation:1 reason:&v72];

        if (!v35)
        {
          v63 = fpfs_adopt_log();
          uint64_t v46 = fp_current_or_default_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v56 = FPPopLogSectionForBlock();
            __int16 v57 = [v36 providerDomainID];
            uint64_t v58 = FPProviderNotFoundError();
            *(_DWORD *)buf = 134219266;
            uint64_t v74 = v56;
            __int16 v75 = 2112;
            v76 = self;
            __int16 v77 = 2080;
            v78 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
            __int16 v79 = 2112;
            uint64_t v80 = 0;
            __int16 v81 = 2112;
            uint64_t v82 = 0;
            __int16 v83 = 2112;
            v84 = v58;
            _os_log_debug_impl(&dword_1D744C000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
          }
          uint64_t v47 = [v36 providerDomainID];
          id v48 = FPProviderNotFoundError();
          (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v48);

          __fp_pop_log();
          goto LABEL_31;
        }
      }
      id v44 = [v35 defaultBackend];
      __int16 v45 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_167;
      v64[3] = &unk_1E6A73788;
      v64[4] = self;
      id v65 = v9;
      [v44 URLForItemID:v36 creatingPlaceholderIfMissing:v61 ignoreAlternateContentsURL:v62 forBookmarkResolution:0 request:v45 completionHandler:v64];

LABEL_31:
      id v8 = v36;
      goto LABEL_33;
    }
    fpfs_adopt_log();
    id v72 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v39 = fp_current_or_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v53 = FPPopLogSectionForBlock();
      __int16 v54 = [v8 identifier];
      __int16 v55 = FPItemNotFoundError();
      *(_DWORD *)buf = 134219266;
      uint64_t v74 = v53;
      __int16 v75 = 2112;
      v76 = self;
      __int16 v77 = 2080;
      v78 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
      __int16 v79 = 2112;
      uint64_t v80 = 0;
      __int16 v81 = 2112;
      uint64_t v82 = 0;
      __int16 v83 = 2112;
      v84 = v55;
      _os_log_debug_impl(&dword_1D744C000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
    uint64_t v40 = [v8 identifier];
    __int16 v41 = FPItemNotFoundError();
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v41);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    id v72 = (id)objc_claimAutoreleasedReturnValue();
    id v37 = fp_current_or_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v51 = FPPopLogSectionForBlock();
      uint64_t v52 = FPInvalidParameterError();
      *(_DWORD *)buf = 134219266;
      uint64_t v74 = v51;
      __int16 v75 = 2112;
      v76 = self;
      __int16 v77 = 2080;
      v78 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
      __int16 v79 = 2112;
      uint64_t v80 = 0;
      __int16 v81 = 2112;
      uint64_t v82 = 0;
      __int16 v83 = 2112;
      v84 = v52;
      _os_log_debug_impl(&dword_1D744C000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
    uint64_t v38 = FPInvalidParameterError();
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v38);

    __fp_pop_log();
    id v8 = 0;
  }
LABEL_33:
}

void __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = objc_msgSend(v4, "fp_bundleIdentifier");

  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

  char v13 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = FPPopLogSectionForBlock();
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = FPNotPermittedError();
    *(_DWORD *)buf = 134219266;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2080;
    uint64_t v19 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandl"
          "er:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    __int16 v22 = 2112;
    uint64_t v23 = 0;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = FPNotPermittedError();
  (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v9);

  __fp_pop_log();
}

void __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_167(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    uint64_t v15 = fpfs_adopt_log();
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = FPPopLogSectionForBlock();
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      uint64_t v21 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHan"
            "dler:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = 0;
      __int16 v24 = 2112;
      id v25 = 0;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }
  else
  {
    uint64_t v15 = fpfs_adopt_log();
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = FPPopLogSectionForBlock();
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      uint64_t v21 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHan"
            "dler:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = 0;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FPDXPCServicer *)self server];
  id v9 = [v8 extensionManager];
  uint64_t v10 = [v9 domainFromItemID:v6 reason:0];

  if (v10)
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer _forceIngestionForItemID:completionHandler:]();
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__FPDXPCServicer__forceIngestionForItemID_completionHandler___block_invoke;
    v13[3] = &unk_1E6A757F8;
    id v14 = v7;
    [v10 forceIngestionForItemID:v6 completionHandler:v13];
  }
  else
  {
    uint64_t v12 = FPNotSupportedError();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

uint64_t __61__FPDXPCServicer__forceIngestionForItemID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  __int16 v18 = __60__FPDXPCServicer_forceIngestionForItemID_completionHandler___block_invoke;
  uint64_t v19 = &unk_1E6A73710;
  __int16 v20 = self;
  id v8 = v7;
  id v21 = v8;
  id v9 = &v16;
  uint64_t v10 = self;
  uint64_t v11 = [(FPDXPCServicer *)v10 connection];
  uint64_t v12 = *MEMORY[0x1E4F25E08];
  v22[0] = *MEMORY[0x1E4F25E00];
  v22[1] = v12;
  void v22[2] = *MEMORY[0x1E4F25E28];
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

  char v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if (v14)
  {

    [(FPDXPCServicer *)v10 _forceIngestionForItemID:v6 completionHandler:v8];
  }
  else
  {
    uint64_t v15 = FPNotPermittedError();
    v18((uint64_t)v9, v15);
  }
}

void __60__FPDXPCServicer_forceIngestionForItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer forceIngestionForItemID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)forceIngestionForItemIDs:(id)a3 completionHandler:(id)a4
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  uint64_t v40 = __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke;
  __int16 v41 = &unk_1E6A73710;
  uint64_t v42 = self;
  id v8 = v7;
  id v43 = v8;
  uint64_t v9 = v39;
  __int16 v10 = self;
  uint64_t v11 = [(FPDXPCServicer *)v10 connection];
  uint64_t v12 = *MEMORY[0x1E4F25E08];
  v45[0] = *MEMORY[0x1E4F25E00];
  v45[1] = v12;
  v45[2] = *MEMORY[0x1E4F25E28];
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];

  char v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if (v14)
  {

    if ([v6 count])
    {
      id v25 = v8;
      id v15 = dispatch_group_create();
      uint64_t v16 = objc_opt_new();
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v26 = v6;
      id obj = v6;
      uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * v20);
            dispatch_group_enter(v15);
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            void v31[2] = __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke_169;
            v31[3] = &unk_1E6A73530;
            id v32 = v16;
            uint64_t v33 = v21;
            id v34 = v15;
            [(FPDXPCServicer *)v10 _forceIngestionForItemID:v21 completionHandler:v31];

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v18);
      }

      queue = v10->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke_2;
      block[3] = &unk_1E6A74AA8;
      id v8 = v25;
      id v29 = v16;
      id v30 = v25;
      id v23 = v16;
      dispatch_group_notify(v15, queue, block);

      id v6 = v26;
    }
    else
    {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
  else
  {
    __int16 v24 = FPNotPermittedError();
    v40((uint64_t)v9, v24);
  }
}

void __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer forceIngestionForItemIDs:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke_169(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    [*(id *)(a1 + 32) setObject:v4 forKey:*(void *)(a1 + 40)];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  long long v36 = __70__FPDXPCServicer_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke;
  long long v37 = &unk_1E6A73710;
  long long v38 = self;
  id v8 = v7;
  id v39 = v8;
  uint64_t v9 = v35;
  __int16 v10 = self;
  uint64_t v11 = [(FPDXPCServicer *)v10 connection];
  uint64_t v12 = *MEMORY[0x1E4F25E08];
  *(void *)buf = *MEMORY[0x1E4F25E00];
  *(void *)&buf[8] = v12;
  *(void *)&buf[16] = *MEMORY[0x1E4F25E28];
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  char v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if (v14)
  {

    uint64_t v15 = [(FPDXPCServicer *)v10 server];
    __int16 v16 = [v15 extensionManager];
    id v17 = [v16 domainFromItemID:v6 reason:0];

    if (v17)
    {
      uint64_t v18 = [v17 defaultBackend];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        uint64_t v20 = [v17 defaultBackend];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __70__FPDXPCServicer_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke_172;
        v32[3] = &unk_1E6A757B0;
        v32[4] = v10;
        id v33 = v8;
        [v20 forceIngestionForItemID:v6 completionHandler:v32];
      }
      else
      {
        fpfs_adopt_log();
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        id v25 = fp_current_or_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = FPPopLogSectionForBlock();
          __int16 v31 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v10;
          *(_WORD *)&buf[22] = 2080;
          __int16 v41 = "-[FPDXPCServicer forceLatestVersionOnDiskForItemID:completionHandler:]";
          __int16 v42 = 2112;
          uint64_t v43 = 0;
          __int16 v44 = 2112;
          __int16 v45 = v31;
          _os_log_debug_impl(&dword_1D744C000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        id v26 = FPNotSupportedError();
        (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v26);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = FPPopLogSectionForBlock();
        uint64_t v28 = [v6 providerID];
        id v29 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2080;
        __int16 v41 = "-[FPDXPCServicer forceLatestVersionOnDiskForItemID:completionHandler:]";
        __int16 v42 = 2112;
        uint64_t v43 = 0;
        __int16 v44 = 2112;
        __int16 v45 = v29;
        _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      id v23 = [v6 providerID];
      __int16 v24 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v24);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v21 = FPNotPermittedError();
    v36((uint64_t)v9, v21);
  }
}

void __70__FPDXPCServicer_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer forceLatestVersionOnDiskForItemID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __70__FPDXPCServicer_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 itemVersion];
  uint64_t v11 = fpfs_adopt_log();
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = FPPopLogSectionForBlock();
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2080;
    id v17 = "-[FPDXPCServicer forceLatestVersionOnDiskForItemID:completionHandler:]_block_invoke";
    __int16 v18 = 2112;
    char v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v32 = a7;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v33 = a5;
  id v14 = a8;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  uint64_t v40 = __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke;
  __int16 v41 = &unk_1E6A73710;
  __int16 v42 = self;
  id v15 = v14;
  id v43 = v15;
  __int16 v16 = v39;
  id v17 = self;
  __int16 v18 = [(FPDXPCServicer *)v17 connection];
  uint64_t v19 = *MEMORY[0x1E4F25E08];
  *(void *)buf = *MEMORY[0x1E4F25E00];
  *(void *)&buf[8] = v19;
  *(void *)&buf[16] = *MEMORY[0x1E4F25E28];
  __int16 v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  LOBYTE(a8) = objc_msgSend(v18, "fp_hasOneOfEntitlements:", v20);
  if (a8)
  {

    id v21 = [(FPDXPCServicer *)v17 server];
    uint64_t v22 = [v21 extensionManager];
    id v23 = [v13 itemID];
    __int16 v24 = [v22 domainFromItemID:v23 reason:0];

    if (v24)
    {
      id v25 = [v24 defaultBackend];
      id v26 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v17 pid]];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_173;
      void v34[3] = &unk_1E6A73A50;
      id v35 = v13;
      long long v36 = v17;
      id v37 = v15;
      [v25 createItemBasedOnTemplate:v35 fields:a4 urlWrapper:v33 options:a6 bounceOnCollision:v32 request:v26 completionHandler:v34];
    }
    else
    {
      fpfs_adopt_log();
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = fp_current_or_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = FPPopLogSectionForBlock();
        __int16 v31 = FPNotSupportedError();
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2080;
        __int16 v45 = "-[FPDXPCServicer createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:]";
        __int16 v46 = 2112;
        uint64_t v47 = 0;
        __int16 v48 = 2112;
        uint64_t v49 = v31;
        _os_log_debug_impl(&dword_1D744C000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      id v29 = FPNotSupportedError();
      (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v29);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v27 = FPNotPermittedError();
    v40((uint64_t)v16, v27);
  }
}

void __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = fp_current_or_default_log();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_173_cold_2();
    }

    __int16 v14 = fpfs_adopt_log();
    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = FPPopLogSectionForBlock();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      __int16 v20 = "-[FPDXPCServicer createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_173_cold_1();
    }

    __int16 v14 = fpfs_adopt_log();
    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = FPPopLogSectionForBlock();
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      __int16 v20 = "-[FPDXPCServicer createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v5;
      __int16 v23 = 2112;
      id v24 = 0;
      _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

- (void)bookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(FPDXPCServicer *)self connection];
  uint64_t v9 = [FPDAccessRight alloc];
  uint64_t v10 = *MEMORY[0x1E4F25E38];
  v50[0] = *MEMORY[0x1E4F25E38];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  uint64_t v12 = [(FPDXPCServicer *)self server];
  uint64_t v13 = [v12 extensionManager];
  __int16 v14 = [(FPDAccessRight *)v9 initWithURL:v6 entitlements:v11 connection:v8 manager:v13];

  LODWORD(v12) = [(FPDAccessRight *)v14 level] == 0;
  uint64_t v15 = fp_current_or_default_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v16)
    {
      int v32 = [v8 processIdentifier];
      [v8 processIdentifier];
      id v33 = FPExecutableNameForProcessIdentifier();
      id v34 = objc_msgSend(v6, "fp_shortDescription");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)uint64_t v47 = v32;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v33;
      *(_WORD *)&v47[14] = 2112;
      *(void *)&v47[16] = v10;
      *(_WORD *)&v47[24] = 2112;
      *(void *)&v47[26] = v34;
      _os_log_debug_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) has neither sandbox access nor %@ entitlement to get a bookmark for %@", buf, 0x26u);
    }
    fpfs_adopt_log();
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = FPPopLogSectionForBlock();
      long long v36 = FPNotPermittedError();
      *(_DWORD *)buf = 134219010;
      *(void *)uint64_t v47 = v35;
      *(_WORD *)&v47[8] = 2112;
      *(void *)&v47[10] = self;
      *(_WORD *)&v47[18] = 2080;
      *(void *)&v47[20] = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]";
      *(_WORD *)&v47[28] = 2112;
      *(void *)&v47[30] = 0;
      __int16 v48 = 2112;
      uint64_t v49 = v36;
      _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    __int16 v23 = FPNotPermittedError();
    v7[2](v7, 0, v23);

    __fp_pop_log();
  }
  else
  {
    if (v16) {
      -[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:](v6);
    }

    __int16 v17 = [(FPDAccessRight *)v14 provider];
    if (v17)
    {
      uint64_t v18 = [(FPDAccessRight *)v14 domain];
      __int16 v19 = v18;
      if (v18)
      {
        __int16 v20 = [v18 defaultBackend];
        __int16 v21 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke;
        v41[3] = &unk_1E6A756E8;
        v41[4] = self;
        __int16 v44 = v7;
        id v42 = v6;
        id v43 = v8;
        [v20 itemIDForURL:v42 requireProviderItemID:0 request:v21 completionHandler:v41];
      }
      else
      {
        uint64_t v28 = fp_current_or_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = objc_msgSend(v6, "fp_shortDescription");
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v47 = v29;
          _os_log_impl(&dword_1D744C000, v28, OS_LOG_TYPE_INFO, "[INFO] Could not find the domain for %@", buf, 0xCu);
        }
        fpfs_adopt_log();
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = fp_current_or_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v39 = FPPopLogSectionForBlock();
          uint64_t v40 = FPProviderNotFoundErrorForURL();
          *(_DWORD *)buf = 134219010;
          *(void *)uint64_t v47 = v39;
          *(_WORD *)&v47[8] = 2112;
          *(void *)&v47[10] = self;
          *(_WORD *)&v47[18] = 2080;
          *(void *)&v47[20] = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]";
          *(_WORD *)&v47[28] = 2112;
          *(void *)&v47[30] = 0;
          __int16 v48 = 2112;
          uint64_t v49 = v40;
          _os_log_debug_impl(&dword_1D744C000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        __int16 v31 = FPProviderNotFoundErrorForURL();
        v7[2](v7, 0, v31);

        __fp_pop_log();
      }
    }
    else
    {
      id v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = objc_msgSend(v6, "fp_shortDescription");
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v47 = v25;
        _os_log_impl(&dword_1D744C000, v24, OS_LOG_TYPE_INFO, "[INFO] Could not find the provider for %@", buf, 0xCu);
      }
      fpfs_adopt_log();
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = FPPopLogSectionForBlock();
        id v38 = FPProviderNotFoundErrorForURL();
        *(_DWORD *)buf = 134219010;
        *(void *)uint64_t v47 = v37;
        *(_WORD *)&v47[8] = 2112;
        *(void *)&v47[10] = self;
        *(_WORD *)&v47[18] = 2080;
        *(void *)&v47[20] = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]";
        *(_WORD *)&v47[28] = 2112;
        *(void *)&v47[30] = 0;
        __int16 v48 = 2112;
        uint64_t v49 = v38;
        _os_log_debug_impl(&dword_1D744C000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v27 = FPProviderNotFoundErrorForURL();
      v7[2](v7, 0, v27);

      __fp_pop_log();
    }
  }
}

void __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v20 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = FPPopLogSectionForBlock();
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2080;
      uint64_t v28 = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = 0;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
  else if (v5)
  {
    id v8 = +[FPDAccessControlStore sharedStore];
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 48), "fp_bundleIdentifier");
    uint64_t v10 = [v8 bookmarkForItemID:v5 consumerIdentifier:v9];

    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke_cold_2();
    }

    __int16 v21 = fpfs_adopt_log();
    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = FPPopLogSectionForBlock();
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v19;
      __int16 v27 = 2080;
      uint64_t v28 = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v10;
      __int16 v31 = 2112;
      id v32 = 0;
      _os_log_debug_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
  else
  {
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (uint64_t)v14;
      _os_log_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Could not get Item ID for %@.", buf, 0xCu);
    }
    id v22 = fpfs_adopt_log();
    uint64_t v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
}

- (void)fetchAccessServicer:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36[0] = *MEMORY[0x1E4F25E08];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  id v22 = __38__FPDXPCServicer_fetchAccessServicer___block_invoke;
  __int16 v23 = &unk_1E6A73710;
  uint64_t v24 = self;
  id v6 = v4;
  id v25 = v6;
  id v7 = v5;
  id v8 = v21;
  uint64_t v9 = [(FPDXPCServicer *)self connection];
  char v10 = objc_msgSend(v9, "fp_hasOneOfEntitlements:", v7);

  if (v10)
  {

    __int16 v20 = fpfs_adopt_log();
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = FPPopLogSectionForBlock();
      uint64_t v17 = [FPDAccessControlServicer alloc];
      uint64_t v18 = +[FPDAccessControlStore sharedStore];
      uint64_t v19 = [(FPDAccessControlServicer *)v17 initWithAccessStore:v18];
      *(_DWORD *)buf = 134219010;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      __int16 v29 = self;
      __int16 v30 = 2080;
      __int16 v31 = "-[FPDXPCServicer fetchAccessServicer:]";
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      __int16 v34 = 2112;
      uint64_t v35 = 0;
      _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v12 = [FPDAccessControlServicer alloc];
    uint64_t v13 = +[FPDAccessControlStore sharedStore];
    __int16 v14 = [(FPDAccessControlServicer *)v12 initWithAccessStore:v13];
    (*((void (**)(id, FPDAccessControlServicer *, void))v6 + 2))(v6, v14, 0);

    __fp_pop_log();
  }
  else
  {
    uint64_t v15 = FPNotPermittedError();
    v22((uint64_t)v8, v15);
  }
}

void __38__FPDXPCServicer_fetchAccessServicer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer fetchAccessServicer:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __47__FPDXPCServicer_itemForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer itemForURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)providerItemIDForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  uint64_t v40 = __57__FPDXPCServicer_providerItemIDForURL_completionHandler___block_invoke;
  __int16 v41 = &unk_1E6A73710;
  id v42 = self;
  id v8 = v7;
  id v43 = v8;
  uint64_t v9 = self;
  id v10 = v6;
  uint64_t v11 = v39;
  if (!v10)
  {
    uint64_t v28 = FPInvalidParameterError();
LABEL_9:
    __int16 v29 = (void *)v28;
    v40((uint64_t)v11, (void *)v28);

    goto LABEL_22;
  }
  __int16 v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:accessType:logLevel:", v10, *MEMORY[0x1E4F25908], 0);

  if ((v13 & 1) == 0)
  {
    __int16 v14 = [(FPDXPCServicer *)v9 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      id v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v28 = FPNotPermittedError();
        goto LABEL_9;
      }
    }
  }

  uint64_t v19 = [(FPDXPCServicer *)v9 server];
  __int16 v20 = [v19 extensionManager];
  __int16 v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    id v22 = [v21 provider];
    __int16 v23 = [v22 identifier];
    id v37 = 0;
    uint64_t v24 = [(FPDXPCServicer *)v9 providerForIdentifier:v23 enumerateEntitlementRequired:1 error:&v37];
    id v25 = v37;

    if (v24)
    {
      uint64_t v26 = [v21 defaultBackend];
      uint64_t v27 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v9 pid]];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      void v35[2] = __57__FPDXPCServicer_providerItemIDForURL_completionHandler___block_invoke_178;
      void v35[3] = &unk_1E6A73BE0;
      v35[4] = v9;
      id v36 = v8;
      [v26 itemIDForURL:v10 requireProviderItemID:1 request:v27 completionHandler:v35];
    }
    else
    {
      __int16 v32 = fp_current_or_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer providerItemIDForURL:completionHandler:](v21, v32);
      }

      fpfs_adopt_log();
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = fp_current_or_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v34;
        __int16 v45 = 2112;
        __int16 v46 = v9;
        __int16 v47 = 2080;
        __int16 v48 = "-[FPDXPCServicer providerItemIDForURL:completionHandler:]";
        __int16 v49 = 2112;
        uint64_t v50 = 0;
        __int16 v51 = 2112;
        id v52 = v25;
        _os_log_debug_impl(&dword_1D744C000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*((void (**)(id, void, id))v8 + 2))(v8, 0, v25);
      __fp_pop_log();
    }
  }
  else
  {
    __int16 v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer providerItemIDForURL:completionHandler:](v10);
    }

    fpfs_adopt_log();
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v31 = fp_current_or_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer providerItemIDForURL:completionHandler:]();
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    __fp_pop_log();
  }
LABEL_22:
}

void __57__FPDXPCServicer_providerItemIDForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer providerItemIDForURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __57__FPDXPCServicer_providerItemIDForURL_completionHandler___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer providerItemIDForURL:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5 materializingIfNeeded:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v30 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  uint64_t v35 = __125__FPDXPCServicer_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler___block_invoke;
  id v36 = &unk_1E6A73710;
  id v37 = self;
  id v14 = v13;
  id v38 = v14;
  __int16 v15 = self;
  __int16 v16 = v34;
  id v39 = 0;
  __int16 v17 = [(FPDXPCServicer *)v15 providerForIdentifier:v11 enumerateEntitlementRequired:1 error:&v39];
  id v18 = v39;
  if (!v17)
  {
    v35((uint64_t)v16, v18);
LABEL_7:
    id v24 = 0;
    goto LABEL_9;
  }
  if ([v17 invalidated])
  {
    __int16 v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v41 = v17;
      _os_log_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    id v20 = NSString;
    uint64_t v21 = [v17 identifier];
    id v22 = [v20 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v21];

    __int16 v23 = FPProviderNotRegistered();
    v35((uint64_t)v16, v23);

    goto LABEL_7;
  }
  id v24 = v17;
LABEL_9:

  if (v24)
  {
    id v25 = [v24 domainForIdentifier:v12 reason:0];
    if (!v25)
    {
      uint64_t v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:]();
      }

      fpfs_adopt_log();
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock();
        -[FPDXPCServicer fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:]();
      }

      (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
      __fp_pop_log();
    }
    uint64_t v28 = [v25 defaultBackend];
    __int16 v29 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v15 pid]];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __125__FPDXPCServicer_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler___block_invoke_179;
    v32[3] = &unk_1E6A73940;
    v32[4] = v15;
    id v33 = v14;
    [v28 fetchFSItemsForItemIdentifiers:v31 materializingIfNeeded:v30 request:v29 completionHandler:v32];
  }
}

void __125__FPDXPCServicer_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:comp"
          "letionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __125__FPDXPCServicer_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:comp"
          "letionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)trashItemAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  id v33 = __51__FPDXPCServicer_trashItemAtURL_completionHandler___block_invoke;
  uint64_t v34 = &unk_1E6A73710;
  uint64_t v35 = self;
  id v8 = v7;
  id v36 = v8;
  uint64_t v9 = self;
  id v10 = v6;
  uint64_t v11 = v32;
  if (!v10)
  {
    uint64_t v24 = FPInvalidParameterError();
LABEL_8:
    id v25 = (void *)v24;
    v33((uint64_t)v11, (void *)v24);

    goto LABEL_15;
  }
  uint64_t v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:logLevel:", v10, 0);

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [(FPDXPCServicer *)v9 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      __int16 v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v24 = FPNotPermittedWriteError();
        goto LABEL_8;
      }
    }
  }

  __int16 v19 = [(FPDXPCServicer *)v9 server];
  id v20 = [v19 extensionManager];
  uint64_t v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    id v22 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v9 pid]];
    __int16 v23 = [v21 defaultBackend];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __51__FPDXPCServicer_trashItemAtURL_completionHandler___block_invoke_181;
    v29[3] = &unk_1E6A75820;
    v29[4] = v9;
    id v30 = v8;
    [v23 trashItemAtURL:v10 request:v22 completionHandler:v29];
  }
  else
  {
    uint64_t v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer trashItemAtURL:completionHandler:](v10);
    }

    id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    fpfs_adopt_log();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v28;
      __int16 v38 = 2112;
      id v39 = v9;
      __int16 v40 = 2080;
      __int16 v41 = "-[FPDXPCServicer trashItemAtURL:completionHandler:]";
      __int16 v42 = 2112;
      uint64_t v43 = 0;
      __int16 v44 = 2112;
      __int16 v45 = v22;
      _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v22);
    __fp_pop_log();
  }
LABEL_15:
}

void __51__FPDXPCServicer_trashItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer trashItemAtURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __51__FPDXPCServicer_trashItemAtURL_completionHandler___block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer trashItemAtURL:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)putBackURLForTrashedItemAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  uint64_t v35 = __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke;
  id v36 = &unk_1E6A75188;
  id v37 = self;
  id v38 = v6;
  id v8 = v7;
  id v39 = v8;
  uint64_t v9 = self;
  id v10 = v38;
  uint64_t v11 = v34;
  if (!v10)
  {
    uint64_t v24 = FPInvalidParameterError();
LABEL_8:
    id v25 = (void *)v24;
    v35((uint64_t)v11, (void *)v24);

    goto LABEL_15;
  }
  uint64_t v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:accessType:logLevel:", v10, *MEMORY[0x1E4F25908], 0);

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [(FPDXPCServicer *)v9 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      __int16 v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v24 = FPNotPermittedError();
        goto LABEL_8;
      }
    }
  }

  __int16 v19 = [(FPDXPCServicer *)v9 server];
  id v20 = [v19 extensionManager];
  uint64_t v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    id v22 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v9 pid]];
    __int16 v23 = [v21 defaultBackend];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke_183;
    v31[3] = &unk_1E6A75820;
    void v31[4] = v9;
    id v32 = v8;
    [v23 putBackURLForTrashedItemAtURL:v10 request:v22 completionHandler:v31];
  }
  else
  {
    uint64_t v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FPDXPCServicer putBackURLForTrashedItemAtURL:completionHandler:](v10);
    }

    fpfs_adopt_log();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = FPPopLogSectionForBlock();
      id v30 = FPProviderNotFoundErrorForURL();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v41 = 2112;
      __int16 v42 = v9;
      __int16 v43 = 2080;
      __int16 v44 = "-[FPDXPCServicer putBackURLForTrashedItemAtURL:completionHandler:]";
      __int16 v45 = 2112;
      uint64_t v46 = 0;
      __int16 v47 = 2112;
      __int16 v48 = v30;
      _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v28 = FPProviderNotFoundErrorForURL();
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v28);

    __fp_pop_log();
  }

LABEL_15:
}

void __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke_cold_1(a1);
  }

  id v8 = fpfs_adopt_log();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    uint64_t v14 = "-[FPDXPCServicer putBackURLForTrashedItemAtURL:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

void __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = fpfs_adopt_log();
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = "-[FPDXPCServicer putBackURLForTrashedItemAtURL:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  uint64_t v35 = __62__FPDXPCServicer_setPutBackInfoOnItemAtURL_completionHandler___block_invoke;
  id v36 = &unk_1E6A73710;
  id v37 = self;
  id v8 = v7;
  id v38 = v8;
  uint64_t v9 = self;
  id v10 = v6;
  __int16 v11 = v34;
  if (!v10)
  {
    uint64_t v24 = FPInvalidParameterError();
LABEL_8:
    id v25 = (void *)v24;
    v35((uint64_t)v11, (void *)v24);

    goto LABEL_15;
  }
  uint64_t v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:logLevel:", v10, 0);

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [(FPDXPCServicer *)v9 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      __int16 v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v24 = FPNotPermittedWriteError();
        goto LABEL_8;
      }
    }
  }

  __int16 v19 = [(FPDXPCServicer *)v9 server];
  id v20 = [v19 extensionManager];
  uint64_t v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    id v22 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v9 pid]];
    __int16 v23 = [v21 defaultBackend];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __62__FPDXPCServicer_setPutBackInfoOnItemAtURL_completionHandler___block_invoke_184;
    v31[3] = &unk_1E6A73710;
    void v31[4] = v9;
    id v32 = v8;
    [v23 setPutBackInfoOnItemAtURL:v10 completionHandler:v31];
  }
  else
  {
    uint64_t v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FPDXPCServicer setPutBackInfoOnItemAtURL:completionHandler:](v10);
    }

    fpfs_adopt_log();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = FPPopLogSectionForBlock();
      id v30 = FPProviderNotFoundErrorForURL();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v40 = 2112;
      __int16 v41 = v9;
      __int16 v42 = 2080;
      __int16 v43 = "-[FPDXPCServicer setPutBackInfoOnItemAtURL:completionHandler:]";
      __int16 v44 = 2112;
      __int16 v45 = v30;
      _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v28 = FPProviderNotFoundErrorForURL();
    (*((void (**)(id, void *))v8 + 2))(v8, v28);

    __fp_pop_log();
  }

LABEL_15:
}

void __62__FPDXPCServicer_setPutBackInfoOnItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer setPutBackInfoOnItemAtURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __62__FPDXPCServicer_setPutBackInfoOnItemAtURL_completionHandler___block_invoke_184(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer setPutBackInfoOnItemAtURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)fetchProviderForShareURL:(id)a3 fallbackIdentifier:(id)a4 completionHandler:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x1E4F25E20];
  v29[0] = *MEMORY[0x1E4F25E78];
  v29[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  id v25 = __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke;
  uint64_t v26 = &unk_1E6A73710;
  uint64_t v27 = self;
  id v13 = v10;
  id v28 = v13;
  id v14 = v12;
  id v15 = v24;
  uint64_t v16 = [(FPDXPCServicer *)self connection];
  char v17 = objc_msgSend(v16, "fp_hasOneOfEntitlements:", v14);

  if (v17)
  {

    char v18 = (void *)MEMORY[0x1E4F22398];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186;
    v21[3] = &unk_1E6A75848;
    v21[4] = self;
    __int16 v19 = &v23;
    id v23 = v13;
    id v22 = v9;
    [v18 getAppLinksWithURL:v8 completionHandler:v21];
    id v14 = v22;
  }
  else
  {
    __int16 v19 = &v28;
    id v20 = FPNotPermittedError();
    v25((uint64_t)v15, v20);
  }
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v46 = a3;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v52 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        __int16 v10 = fp_current_or_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_5(v65, v9, &v66, v10);
        }

        uint64_t v11 = [*(id *)(a1 + 32) server];
        __int16 v12 = [v11 extensionManager];
        id v13 = [v9 targetApplicationRecord];
        __int16 v14 = [v13 bundleIdentifier];
        uint64_t v15 = [v12 defaultProviderWithTopLevelBundleIdentifier:v14];

        if (v15)
        {
          uint64_t v21 = fp_current_or_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_4();
          }

          uint64_t v49 = fpfs_adopt_log();
          id v22 = fp_current_or_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v34 = FPPopLogSectionForBlock();
            uint64_t v35 = *(void *)(a1 + 32);
            id v36 = [v15 identifier];
            *(_DWORD *)buf = 134219010;
            uint64_t v56 = v34;
            __int16 v57 = 2112;
            uint64_t v58 = v35;
            __int16 v59 = 2080;
            uint64_t v60 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
            __int16 v61 = 2112;
            BOOL v62 = v36;
            __int16 v63 = 2112;
            __int16 v64 = 0;
            _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
          }
          uint64_t v23 = *(void *)(a1 + 48);
          uint64_t v24 = [v15 identifier];
          (*(void (**)(uint64_t, void *, void))(v23 + 16))(v23, v24, 0);

          __fp_pop_log();
          goto LABEL_34;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v67 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (*(void *)(a1 + 40))
  {
    __int16 v16 = [*(id *)(a1 + 32) server];
    id v17 = [v16 extensionManager];
    uint64_t v18 = [v17 providerWithIdentifier:*(void *)(a1 + 40) reason:0];

    if (v18)
    {
      __int16 v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_3();
      }

      __int16 v48 = fpfs_adopt_log();
      id v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v40 = FPPopLogSectionForBlock();
        uint64_t v41 = *(void *)(a1 + 32);
        __int16 v42 = [v18 identifier];
        *(_DWORD *)buf = 134219010;
        uint64_t v56 = v40;
        __int16 v57 = 2112;
        uint64_t v58 = v41;
        __int16 v59 = 2080;
        uint64_t v60 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
        __int16 v61 = 2112;
        BOOL v62 = v42;
        __int16 v63 = 2112;
        __int16 v64 = 0;
        _os_log_debug_impl(&dword_1D744C000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
LABEL_28:

      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v29 = [v18 identifier];
      (*(void (**)(uint64_t, void *, void))(v28 + 16))(v28, v29, 0);

      __fp_pop_log();
      goto LABEL_34;
    }
    id v25 = [*(id *)(a1 + 32) server];
    uint64_t v26 = [v25 extensionManager];
    uint64_t v18 = [v26 defaultProviderWithTopLevelBundleIdentifier:*(void *)(a1 + 40)];

    if (v18)
    {
      uint64_t v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_2();
      }

      __int16 v48 = fpfs_adopt_log();
      id v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v43 = FPPopLogSectionForBlock();
        uint64_t v44 = *(void *)(a1 + 32);
        __int16 v45 = [v18 identifier];
        *(_DWORD *)buf = 134219010;
        uint64_t v56 = v43;
        __int16 v57 = 2112;
        uint64_t v58 = v44;
        __int16 v59 = 2080;
        uint64_t v60 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
        __int16 v61 = 2112;
        BOOL v62 = v45;
        __int16 v63 = 2112;
        __int16 v64 = 0;
        _os_log_debug_impl(&dword_1D744C000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      goto LABEL_28;
    }
  }
  id v30 = fp_current_or_default_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_1();
  }

  uint64_t v50 = fpfs_adopt_log();
  id v31 = fp_current_or_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = FPPopLogSectionForBlock();
    uint64_t v38 = *(void *)(a1 + 32);
    id v39 = FPProviderNotFoundError();
    *(_DWORD *)buf = 134219010;
    uint64_t v56 = v37;
    __int16 v57 = 2112;
    uint64_t v58 = v38;
    __int16 v59 = 2080;
    uint64_t v60 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
    __int16 v61 = 2112;
    BOOL v62 = 0;
    __int16 v63 = 2112;
    __int16 v64 = v39;
    _os_log_debug_impl(&dword_1D744C000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  uint64_t v32 = *(void *)(a1 + 48);
  id v33 = FPProviderNotFoundError();
  (*(void (**)(uint64_t, void, void *))(v32 + 16))(v32, 0, v33);

  __fp_pop_log();
LABEL_34:
}

- (void)updateLastUsedDate:(id)a3 completionHandler:(id)a4
{
  v40[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  uint64_t v35 = __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke;
  id v36 = &unk_1E6A75188;
  uint64_t v37 = self;
  id v38 = v6;
  id v8 = v7;
  id v39 = v8;
  uint64_t v9 = self;
  id v10 = v38;
  uint64_t v11 = v34;
  if (!v10)
  {
    uint64_t v25 = FPInvalidParameterError();
LABEL_8:
    uint64_t v26 = (void *)v25;
    v35((uint64_t)v11, (void *)v25);

    goto LABEL_15;
  }
  __int16 v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:logLevel:", v10, 0);

  if ((v13 & 1) == 0)
  {
    __int16 v14 = [(FPDXPCServicer *)v9 connection];
    v40[0] = *MEMORY[0x1E4F25E28];
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      id v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v25 = FPNotPermittedWriteError();
        goto LABEL_8;
      }
    }
  }

  __int16 v19 = [(FPDXPCServicer *)v9 server];
  id v20 = [v19 extensionManager];
  uint64_t v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    id v22 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v9 pid]];
    uint64_t v23 = [v21 defaultBackend];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_188;
    v30[3] = &unk_1E6A75870;
    v30[4] = v9;
    id v33 = v8;
    id v31 = v21;
    id v32 = v22;
    id v24 = v22;
    [v23 itemForURL:v10 request:v24 completionHandler:v30];
  }
  else
  {
    uint64_t v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer updateLastUsedDate:completionHandler:](v10);
    }

    uint64_t v29 = fpfs_adopt_log();
    uint64_t v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer updateLastUsedDate:completionHandler:]();
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
    __fp_pop_log();
  }
LABEL_15:
}

void __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_cold_1(a1);
  }

  id v8 = fpfs_adopt_log();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    __int16 v14 = "-[FPDXPCServicer updateLastUsedDate:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

void __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [v5 setLastUsedDate:v7];

    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_190;
    v13[3] = &unk_1E6A757B0;
    void v13[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    [v8 daemonSideItemChange:v5 changedFields:8 request:v9 completionHandler:v13];
  }
  else
  {
    fpfs_adopt_log();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = FPPopLogSectionForBlock();
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      uint64_t v21 = "-[FPDXPCServicer updateLastUsedDate:completionHandler:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
}

void __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = fpfs_adopt_log();
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    id v16 = "-[FPDXPCServicer updateLastUsedDate:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)valuesForAttributes:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5
{
  v40[7] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  uint64_t v35 = __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke;
  id v36 = &unk_1E6A75188;
  uint64_t v37 = self;
  id v38 = v9;
  id v11 = v10;
  id v39 = v11;
  uint64_t v12 = self;
  id v13 = v38;
  uint64_t v14 = v34;
  if (!v13)
  {
    uint64_t v27 = FPInvalidParameterError();
LABEL_8:
    uint64_t v28 = (void *)v27;
    v35((uint64_t)v14, (void *)v27);

    goto LABEL_15;
  }
  __int16 v15 = [(FPDXPCServicer *)v12 connection];
  char v16 = objc_msgSend(v15, "fp_hasSandboxAccessToFile:accessType:logLevel:", v13, *MEMORY[0x1E4F25908], 0);

  if ((v16 & 1) == 0)
  {
    __int16 v17 = [(FPDXPCServicer *)v12 connection];
    v40[0] = *MEMORY[0x1E4F25E28];
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    char v19 = objc_msgSend(v17, "fp_hasOneOfEntitlements:logLevel:", v18, 0);

    if ((v19 & 1) == 0)
    {
      __int16 v20 = [(FPDXPCServicer *)v12 connection];
      char v21 = objc_msgSend(v20, "fp_isNonSandboxedConnection");

      if ((v21 & 1) == 0)
      {
        uint64_t v27 = FPNotPermittedError();
        goto LABEL_8;
      }
    }
  }

  __int16 v22 = [(FPDXPCServicer *)v12 server];
  id v23 = [v22 extensionManager];
  uint64_t v24 = [v23 domainForURL:v13 reason:0];

  if (v24)
  {
    uint64_t v25 = [v24 defaultBackend];
    uint64_t v26 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v12 pid]];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke_191;
    v31[3] = &unk_1E6A73940;
    void v31[4] = v12;
    id v32 = v11;
    [v25 valuesForAttributes:v8 forURL:v13 request:v26 completionHandler:v31];
  }
  else
  {
    uint64_t v29 = fp_current_or_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer valuesForAttributes:forItemAtURL:completionHandler:](v13);
    }

    fpfs_adopt_log();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer valuesForAttributes:forItemAtURL:completionHandler:]();
    }

    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    __fp_pop_log();
  }
LABEL_15:
}

void __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke_cold_1(a1);
  }

  id v8 = fpfs_adopt_log();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    uint64_t v14 = "-[FPDXPCServicer valuesForAttributes:forItemAtURL:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

void __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke_191(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = fpfs_adopt_log();
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = "-[FPDXPCServicer valuesForAttributes:forItemAtURL:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __43__FPDXPCServicer_fetchListOfMonitoredApps___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer fetchListOfMonitoredApps:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)startOperation:(id)a3 toFetchIconsForAppBundleIDs:(id)a4 requestedSize:(CGSize)a5 scale:(double)a6 completionHandler:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  __int16 v55 = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke;
  uint64_t v56 = &unk_1E6A73710;
  __int16 v57 = self;
  id v17 = v16;
  id v58 = v17;
  uint64_t v18 = v54;
  __int16 v19 = self;
  id v20 = [(FPDXPCServicer *)v19 connection];
  uint64_t v21 = *MEMORY[0x1E4F25E08];
  *(void *)location = *MEMORY[0x1E4F25E00];
  *(void *)&location[8] = v21;
  *(void *)&location[16] = *MEMORY[0x1E4F25E28];
  __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:location count:3];

  char v23 = objc_msgSend(v20, "fp_hasOneOfEntitlements:", v22);
  if (v23)
  {

    uint64_t v24 = -[FPDFetchAppLibraryIconOperation initWithAppBundleIDs:desiredSize:screenScale:]([FPDFetchAppLibraryIconOperation alloc], "initWithAppBundleIDs:desiredSize:screenScale:", v15, width, height, a6);
    if (v24)
    {
      dispatch_group_t v25 = dispatch_group_create();
      uint64_t v26 = [(FPOperation *)v24 callbackQueue];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_196;
      v47[3] = &unk_1E6A75898;
      id v27 = v26;
      SEL v52 = a2;
      id v48 = v27;
      uint64_t v49 = v19;
      uint64_t v28 = v25;
      uint64_t v50 = v28;
      id v29 = v14;
      id v51 = v29;
      [(FPDFetchAppLibraryIconOperation *)v24 setPerAppBundleCompletion:v47];
      *(void *)location = 0;
      objc_initWeak((id *)location, v19);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_3;
      v41[3] = &unk_1E6A758C0;
      id v30 = v27;
      id v42 = v30;
      objc_copyWeak(&v46, (id *)location);
      id v31 = v28;
      uint64_t v43 = v31;
      uint64_t v44 = v19;
      id v45 = v17;
      [(FPOperation *)v24 setFinishedBlock:v41];
      id v32 = [(FPDFetchAppLibraryIconOperation *)v24 progress];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      void v39[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_211;
      v39[3] = &unk_1E6A73580;
      id v33 = v32;
      id v40 = v33;
      uint64_t v34 = [v29 remoteObjectProxyWithErrorHandler:v39];
      [v34 setCancellationHandler:v33];
      uint64_t v35 = +[FPDFetchAppLibraryIconOperation sharedOperationQueue];
      [v35 addOperation:v24];

      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v31 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"can't fetch icons for %@", v15);
      fpfs_adopt_log();
      id v53 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = fp_current_or_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v38 = FPPopLogSectionForBlock();
        *(_DWORD *)location = 134218754;
        *(void *)&location[4] = v38;
        *(_WORD *)&location[12] = 2112;
        *(void *)&location[14] = v19;
        *(_WORD *)&location[22] = 2080;
        uint64_t v60 = "-[FPDXPCServicer startOperation:toFetchIconsForAppBundleIDs:requestedSize:scale:completionHandler:]";
        __int16 v61 = 2112;
        BOOL v62 = v31;
        _os_log_debug_impl(&dword_1D744C000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", location, 0x2Au);
      }

      (*((void (**)(id, NSObject *))v17 + 2))(v17, v31);
      __fp_pop_log();
    }
  }
  else
  {
    id v36 = FPNotPermittedError();
    v55((uint64_t)v18, v36);
  }
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer startOperation:toFetchIconsForAppBundleIDs:requestedSize:scale:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_196(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!v9)
  {
    id v15 = [NSString stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: per app bundle block call without appBundleID"];
    uint64_t v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
    }

    __assert_rtn("-[FPDXPCServicer startOperation:toFetchIconsForAppBundleIDs:requestedSize:scale:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDXPCServicer.m", 1869, (const char *)[v15 UTF8String]);
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  __int16 v13 = [MEMORY[0x1E4F1CA60] dictionary];
  [v13 setObject:v9 forKeyedSubscript:@"appBundleID"];
  if (v10) {
    [v13 setObject:v10 forKeyedSubscript:@"thumbnailData"];
  }
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:@"contentType"];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_2;
  v17[3] = &unk_1E6A73FE8;
  __int16 v14 = *(void **)(a1 + 56);
  id v18 = *(id *)(a1 + 48);
  [v14 operationDidProgressWithInfo:v13 error:v12 completionHandler:v17];
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_2(uint64_t a1)
{
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_4;
    block[3] = &unk_1E6A73760;
    uint64_t v8 = *(NSObject **)(a1 + 40);
    id v9 = *(void **)(a1 + 56);
    void block[4] = *(void *)(a1 + 48);
    id v12 = v9;
    id v11 = v4;
    dispatch_group_notify(v8, v7, block);
  }
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_4(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = fpfs_adopt_log();
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = FPPopLogSectionForBlock();
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    *(_DWORD *)buf = 134218754;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2080;
    id v12 = "-[FPDXPCServicer startOperation:toFetchIconsForAppBundleIDs:requestedSize:scale:completionHandler:]_block_invoke_4";
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
  __fp_pop_log();
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_211(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_211_cold_1(v3);
  }

  [*(id *)(a1 + 32) cancel];
}

- (void)materializeURL:(id)a3 completionHandler:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  char v23 = __51__FPDXPCServicer_materializeURL_completionHandler___block_invoke;
  uint64_t v24 = &unk_1E6A73710;
  dispatch_group_t v25 = self;
  id v8 = v7;
  id v26 = v8;
  __int16 v9 = self;
  uint64_t v10 = &v21;
  if (!v6)
  {
    uint64_t v19 = FPInvalidParameterError();
LABEL_7:
    id v20 = (void *)v19;
    v23((uint64_t)v10, (void *)v19);

    goto LABEL_8;
  }
  __int16 v11 = [(FPDXPCServicer *)v9 connection];
  char v12 = objc_msgSend(v11, "fp_hasSandboxAccessToFile:accessType:logLevel:", v6, *MEMORY[0x1E4F25908], 0);

  if ((v12 & 1) == 0)
  {
    __int16 v13 = [(FPDXPCServicer *)v9 connection];
    v27[0] = *MEMORY[0x1E4F25E28];
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    char v15 = objc_msgSend(v13, "fp_hasOneOfEntitlements:logLevel:", v14, 0);

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [(FPDXPCServicer *)v9 connection];
      char v17 = objc_msgSend(v16, "fp_isNonSandboxedConnection");

      if ((v17 & 1) == 0)
      {
        uint64_t v19 = FPNotPermittedError();
        goto LABEL_7;
      }
    }
  }

  id v18 = [(FPDXPCServicer *)v9 server];
  [v18 materializeURL:v6 completion:v8];

LABEL_8:
}

void __51__FPDXPCServicer_materializeURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer materializeURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (id)stageLocation
{
  id v2 = +[FPDServer appSupportPath];
  id v3 = [v2 stringByAppendingPathComponent:@"com.apple.fileproviderd.stage"];

  uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  __int16 v14 = __31__FPDXPCServicer_stageLocation__block_invoke;
  id v15 = &unk_1E6A736C0;
  id v16 = v5;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = stageLocation_onceToken;
  id v8 = v5;
  if (v7 != -1) {
    dispatch_once(&stageLocation_onceToken, &v12);
  }
  objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0, v12, v13, v14, v15);
  uint64_t v9 = v17;
  id v10 = v6;

  return v10;
}

uint64_t __31__FPDXPCServicer_stageLocation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
}

- (BOOL)writeMetadata:(id)a3 onURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__10;
  id v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  uint64_t v9 = [v7 extendedAttributes];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke;
  v13[3] = &unk_1E6A758E8;
  id v10 = v8;
  id v14 = v10;
  id v15 = &v16;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];

  uint64_t v11 = (void *)v17[5];
  if (a5 && v11) {
    *a5 = v11;
  }

  _Block_object_dispose(&v16, 8);
  return v11 == 0;
}

void __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = (const char *)[v6 fileSystemRepresentation];
  id v9 = v5;
  id v10 = (const char *)[v9 UTF8String];
  id v11 = v7;
  uint64_t v12 = (const void *)[v11 bytes];
  size_t v13 = [v11 length];

  if (setxattr(v8, v10, v12, v13, 0, 0) < 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke_cold_1();
    }
  }
  else
  {
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke_cold_2((uint64_t)v9, (id *)(a1 + 32));
    }
  }
}

- (void)makeTopologicallySortedItemsOnDisk:(id)a3 completionHandler:(id)a4
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v116 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v8 = [WeakRetained extensionManager];
  v118 = [v8 clouddocsExtensionIdentifier];

  v149[0] = MEMORY[0x1E4F143A8];
  v149[1] = 3221225472;
  id v150 = __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke;
  v151 = &unk_1E6A73710;
  id v152 = self;
  id v120 = v6;
  id v153 = v120;
  id v9 = self;
  id v10 = v149;
  id v143 = 0;
  v125 = v9;
  id v11 = [(FPDXPCServicer *)v9 providerForIdentifier:v118 enumerateEntitlementRequired:1 error:&v143];
  id v12 = v143;
  if (!v11)
  {
    v150((uint64_t)v10, v12);
LABEL_7:
    id v117 = 0;
    goto LABEL_9;
  }
  if ([v11 invalidated])
  {
    size_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v159 = (uint64_t)v11;
      _os_log_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    id v14 = NSString;
    uint64_t v15 = [v11 identifier];
    uint64_t v16 = [v14 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v15];

    id v17 = FPProviderNotRegistered();
    v150((uint64_t)v10, v17);

    goto LABEL_7;
  }
  id v117 = v11;
LABEL_9:

  if (v117)
  {
    uint64_t v122 = objc_opt_new();
    id v124 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v143 = 0;
    id v144 = &v143;
    uint64_t v145 = 0x3032000000;
    id v146 = __Block_byref_object_copy__10;
    id v147 = __Block_byref_object_dispose__10;
    id v148 = 0;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id obj = v116;
    uint64_t v18 = [obj countByEnumeratingWithState:&v139 objects:v168 count:16];
    if (v18)
    {
      uint64_t v121 = *(void *)v140;
      uint64_t v123 = *MEMORY[0x1E4F25C70];
      uint64_t v115 = *MEMORY[0x1E4F444D8];
LABEL_12:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v140 != v121) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v139 + 1) + 8 * v19);
        id v138 = 0;
        id v21 = [(FPDXPCServicer *)v125 server];
        uint64_t v22 = [v21 extensionManager];
        char v23 = [v20 parentItemID];
        uint64_t v24 = [v22 domainFromItemID:v23 reason:&v138];

        if (!v24)
        {
          fpfs_adopt_log();
          id v137 = (id)objc_claimAutoreleasedReturnValue();
          v88 = fp_current_or_default_log();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v102 = FPPopLogSectionForBlock();
            int v103 = [v20 parentItemID];
            int v104 = [v103 providerDomainID];
            int v105 = FPProviderNotFoundError();
            *(_DWORD *)buf = 134219010;
            uint64_t v159 = v102;
            __int16 v160 = 2112;
            id v161 = v125;
            __int16 v162 = 2080;
            id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
            __int16 v164 = 2112;
            id v165 = 0;
            __int16 v166 = 2112;
            v167 = v105;
            _os_log_debug_impl(&dword_1D744C000, v88, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
          }
          id v89 = [v20 parentItemID];
          v90 = [v89 providerDomainID];
          v91 = FPProviderNotFoundError();
          (*((void (**)(id, void, void *))v120 + 2))(v120, 0, v91);

          __fp_pop_log();
          goto LABEL_93;
        }
        dispatch_group_t v25 = [v20 itemIdentifier];
        int v26 = [v25 isEqualToString:v123];

        if (v26)
        {
          id v27 = [v24 rootURLs];
          uint64_t v28 = [v27 firstObject];
        }
        else
        {
          id v29 = [v20 parentItemIdentifier];
          int v30 = [v29 isEqualToString:v123];

          if (v30)
          {
            id v31 = [v24 rootURLs];
            [v31 firstObject];
          }
          else
          {
            id v31 = [v20 parentItemID];
            [v122 objectForKeyedSubscript:v31];
          id v27 = };

          if (!v27)
          {
            fpfs_adopt_log();
            id v137 = (id)objc_claimAutoreleasedReturnValue();
            v92 = fp_current_or_default_log();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v106 = FPPopLogSectionForBlock();
              id v107 = [v20 parentItemIdentifier];
              v108 = FPItemNotFoundError();
              *(_DWORD *)buf = 134219010;
              uint64_t v159 = v106;
              __int16 v160 = 2112;
              id v161 = v125;
              __int16 v162 = 2080;
              id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
              __int16 v164 = 2112;
              id v165 = 0;
              __int16 v166 = 2112;
              v167 = v108;
              _os_log_debug_impl(&dword_1D744C000, v92, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
            }
            v93 = [v20 parentItemIdentifier];
            v94 = FPItemNotFoundError();
            (*((void (**)(id, void, void *))v120 + 2))(v120, 0, v94);

            __fp_pop_log();
            goto LABEL_92;
          }
          id v32 = [v20 filename];
          uint64_t v28 = [v27 URLByAppendingPathComponent:v32];
        }
        if ([v20 isFolder])
        {
          id v33 = [v20 itemID];
          [v122 setObject:v28 forKeyedSubscript:v33];
        }
        uint64_t v34 = [v28 path];
        int v35 = [v124 fileExistsAtPath:v34];

        if (v35)
        {
          id v36 = fp_current_or_default_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v66 = [v28 path];
            v67 = [v20 itemID];
            *(_DWORD *)buf = 138412546;
            uint64_t v159 = (uint64_t)v66;
            __int16 v160 = 2112;
            id v161 = v67;
            _os_log_debug_impl(&dword_1D744C000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] item already exists at %@ [%@]", buf, 0x16u);
          }
        }
        else
        {
          if ([v20 isFolder])
          {
            uint64_t v37 = fp_current_or_default_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              id v70 = [v28 path];
              id v71 = [v20 itemID];
              *(_DWORD *)buf = 138412546;
              uint64_t v159 = (uint64_t)v70;
              __int16 v160 = 2112;
              id v161 = v71;
              _os_log_debug_impl(&dword_1D744C000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] creating folder %@ [%@]", buf, 0x16u);
            }
            uint64_t v38 = [(FPDXPCServicer *)v125 stageLocation];
            id v39 = [MEMORY[0x1E4F29128] UUID];
            uint64_t v40 = [v39 UUIDString];
            uint64_t v41 = [v38 URLByAppendingPathComponent:v40];

            id v42 = v144 + 5;
            id v136 = v144[5];
            LOBYTE(v40) = [v124 createDirectoryAtURL:v41 withIntermediateDirectories:0 attributes:0 error:&v136];
            objc_storeStrong(v42, v136);
            if ((v40 & 1) == 0)
            {
              id v137 = 0;
              fpfs_adopt_log();
              id v137 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v64 = fp_current_or_default_log();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v73 = FPPopLogSectionForBlock();
                id v74 = v144[5];
                *(_DWORD *)buf = 134219010;
                uint64_t v159 = v73;
                __int16 v160 = 2112;
                id v161 = v125;
                __int16 v162 = 2080;
                id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                __int16 v164 = 2112;
                id v165 = 0;
                __int16 v166 = 2112;
                v167 = v74;
                _os_log_debug_impl(&dword_1D744C000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
              goto LABEL_58;
            }
            uint64_t v43 = v144 + 5;
            id v135 = v144[5];
            BOOL v44 = [(FPDXPCServicer *)v125 writeMetadata:v20 onURL:v41 error:&v135];
            objc_storeStrong(v43, v135);
            if (!v44)
            {
              id v137 = 0;
              fpfs_adopt_log();
              id v137 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v64 = fp_current_or_default_log();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v77 = FPPopLogSectionForBlock();
                id v78 = v144[5];
                *(_DWORD *)buf = 134219010;
                uint64_t v159 = v77;
                __int16 v160 = 2112;
                id v161 = v125;
                __int16 v162 = 2080;
                id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                __int16 v164 = 2112;
                id v165 = 0;
                __int16 v166 = 2112;
                v167 = v78;
                _os_log_debug_impl(&dword_1D744C000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
              goto LABEL_58;
            }
            id v45 = v144 + 5;
            id v134 = v144[5];
            char v46 = [v124 moveItemAtURL:v41 toURL:v28 error:&v134];
            objc_storeStrong(v45, v134);
            if ((v46 & 1) == 0)
            {
              if (objc_msgSend(v144[5], "fp_isCocoaErrorCode:", 516))
              {
                __int16 v47 = fp_current_or_default_log();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  id v48 = [v28 path];
                  [(FPDXPCServicer *)v48 makeTopologicallySortedItemsOnDisk:&v157 completionHandler:v47];
                }

                int v49 = 5;
                goto LABEL_63;
              }
              id v137 = 0;
              fpfs_adopt_log();
              id v137 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v64 = fp_current_or_default_log();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v81 = FPPopLogSectionForBlock();
                id v82 = v144[5];
                *(_DWORD *)buf = 134219010;
                uint64_t v159 = v81;
                __int16 v160 = 2112;
                id v161 = v125;
                __int16 v162 = 2080;
                id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                __int16 v164 = 2112;
                id v165 = 0;
                __int16 v166 = 2112;
                v167 = v82;
                _os_log_debug_impl(&dword_1D744C000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
LABEL_58:

              (*((void (**)(id, void, id))v120 + 2))(v120, 0, v144[5]);
              __fp_pop_log();

              int v49 = 1;
              goto LABEL_63;
            }
          }
          else
          {
            uint64_t v50 = [v20 contentType];
            int v51 = [v50 conformsToType:v115];

            if (!v51)
            {
              fpfs_adopt_log();
              id v137 = (id)objc_claimAutoreleasedReturnValue();
              v95 = fp_current_or_default_log();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v109 = FPPopLogSectionForBlock();
                v110 = [v20 typeIdentifier];
                v111 = FPInvalidParameterError();
                *(_DWORD *)buf = 134219010;
                uint64_t v159 = v109;
                __int16 v160 = 2112;
                id v161 = v125;
                __int16 v162 = 2080;
                id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                __int16 v164 = 2112;
                id v165 = 0;
                __int16 v166 = 2112;
                v167 = v111;
                _os_log_debug_impl(&dword_1D744C000, v95, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
              v96 = [v20 typeIdentifier];
              v97 = FPInvalidParameterError();
              (*((void (**)(id, void, void *))v120 + 2))(v120, 0, v97);

              __fp_pop_log();
              goto LABEL_92;
            }
            SEL v52 = [v20 itemID];
            uint64_t v41 = [v122 objectForKeyedSubscript:v52];

            id v53 = fp_current_or_default_log();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              id v72 = [v28 path];
              *(_DWORD *)buf = 138412546;
              uint64_t v159 = (uint64_t)v72;
              __int16 v160 = 2112;
              id v161 = v41;
              _os_log_debug_impl(&dword_1D744C000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] creating symlink %@ to %@", buf, 0x16u);
            }
            if (!v41)
            {
              fpfs_adopt_log();
              id v137 = (id)objc_claimAutoreleasedReturnValue();
              char v98 = fp_current_or_default_log();
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v112 = FPPopLogSectionForBlock();
                v113 = [v20 itemID];
                v114 = FPInvalidParameterError();
                *(_DWORD *)buf = 134219010;
                uint64_t v159 = v112;
                __int16 v160 = 2112;
                id v161 = v125;
                __int16 v162 = 2080;
                id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                __int16 v164 = 2112;
                id v165 = 0;
                __int16 v166 = 2112;
                v167 = v114;
                _os_log_debug_impl(&dword_1D744C000, v98, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
              v99 = [v20 itemID];
              v100 = FPInvalidParameterError();
              (*((void (**)(id, void, void *))v120 + 2))(v120, 0, v100);

              __fp_pop_log();
LABEL_92:

              goto LABEL_93;
            }
            long long v54 = [(FPDXPCServicer *)v125 stageLocation];
            __int16 v55 = [MEMORY[0x1E4F29128] UUID];
            uint64_t v56 = [v55 UUIDString];
            __int16 v57 = [v54 URLByAppendingPathComponent:v56];

            id v58 = v144 + 5;
            id v133 = v144[5];
            LOBYTE(v56) = [v124 createSymbolicLinkAtURL:v57 withDestinationURL:v41 error:&v133];
            objc_storeStrong(v58, v133);
            if ((v56 & 1) == 0)
            {
              id v137 = 0;
              fpfs_adopt_log();
              id v137 = (id)objc_claimAutoreleasedReturnValue();
              id v65 = fp_current_or_default_log();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v75 = FPPopLogSectionForBlock();
                id v76 = v144[5];
                *(_DWORD *)buf = 134219010;
                uint64_t v159 = v75;
                __int16 v160 = 2112;
                id v161 = v125;
                __int16 v162 = 2080;
                id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                __int16 v164 = 2112;
                id v165 = 0;
                __int16 v166 = 2112;
                v167 = v76;
                _os_log_debug_impl(&dword_1D744C000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
LABEL_61:

              (*((void (**)(id, void, id))v120 + 2))(v120, 0, v144[5]);
              __fp_pop_log();

              int v49 = 1;
LABEL_62:

LABEL_63:
              if (v49 != 5) {
                goto LABEL_93;
              }
              goto LABEL_64;
            }
            __int16 v59 = v144 + 5;
            id v132 = v144[5];
            BOOL v60 = [(FPDXPCServicer *)v125 writeMetadata:v20 onURL:v57 error:&v132];
            objc_storeStrong(v59, v132);
            if (!v60)
            {
              id v137 = 0;
              fpfs_adopt_log();
              id v137 = (id)objc_claimAutoreleasedReturnValue();
              id v65 = fp_current_or_default_log();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v79 = FPPopLogSectionForBlock();
                id v80 = v144[5];
                *(_DWORD *)buf = 134219010;
                uint64_t v159 = v79;
                __int16 v160 = 2112;
                id v161 = v125;
                __int16 v162 = 2080;
                id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                __int16 v164 = 2112;
                id v165 = 0;
                __int16 v166 = 2112;
                v167 = v80;
                _os_log_debug_impl(&dword_1D744C000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
              goto LABEL_61;
            }
            __int16 v61 = v144 + 5;
            id v131 = v144[5];
            char v62 = [v124 moveItemAtURL:v57 toURL:v28 error:&v131];
            objc_storeStrong(v61, v131);
            if ((v62 & 1) == 0)
            {
              if (!objc_msgSend(v144[5], "fp_isCocoaErrorCode:", 516))
              {
                id v137 = 0;
                fpfs_adopt_log();
                id v137 = (id)objc_claimAutoreleasedReturnValue();
                id v65 = fp_current_or_default_log();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v83 = FPPopLogSectionForBlock();
                  id v84 = v144[5];
                  *(_DWORD *)buf = 134219010;
                  uint64_t v159 = v83;
                  __int16 v160 = 2112;
                  id v161 = v125;
                  __int16 v162 = 2080;
                  id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                  __int16 v164 = 2112;
                  id v165 = 0;
                  __int16 v166 = 2112;
                  v167 = v84;
                  _os_log_debug_impl(&dword_1D744C000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
                }
                goto LABEL_61;
              }
              uint64_t v68 = fp_current_or_default_log();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
              {
                id v69 = [v28 path];
                [(FPDXPCServicer *)v69 makeTopologicallySortedItemsOnDisk:&v155 completionHandler:v68];
              }

              int v49 = 5;
              goto LABEL_62;
            }
          }
          uint64_t v63 = fp_current_or_default_log();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
            -[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:](&v129, v130, v63);
          }

          id v36 = [v24 defaultBackend];
          [v36 fakeFSEventAtURL:v28];
        }

LABEL_64:
        if (v18 == ++v19)
        {
          uint64_t v85 = [obj countByEnumeratingWithState:&v139 objects:v168 count:16];
          uint64_t v18 = v85;
          if (v85) {
            goto LABEL_12;
          }
          break;
        }
      }
    }

    v86 = objc_opt_new();
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke_226;
    v126[3] = &unk_1E6A75910;
    v128 = &v143;
    id obj = v86;
    id v127 = obj;
    [v122 enumerateKeysAndObjectsUsingBlock:v126];
    fpfs_adopt_log();
    id v138 = (id)objc_claimAutoreleasedReturnValue();
    v87 = fp_current_or_default_log();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v101 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      uint64_t v159 = v101;
      __int16 v160 = 2112;
      id v161 = v125;
      __int16 v162 = 2080;
      id v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
      __int16 v164 = 2112;
      id v165 = obj;
      __int16 v166 = 2112;
      v167 = 0;
      _os_log_debug_impl(&dword_1D744C000, v87, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, id, void))v120 + 2))(v120, obj, 0);
    __fp_pop_log();

LABEL_93:
    _Block_object_dispose(&v143, 8);
  }
}

void __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    size_t v13 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F25D78];
  id v8 = [v6 URLByStandardizingPath];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v9 + 40);
  __int16 v10 = [v7 wrapperWithURL:v8 readonly:0 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  if (!v10)
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke_226_cold_1();
    }
  }
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v5];
}

- (void)getURLForContainerWithItemID:(id)a3 inDataScopeDomainWithIdentifier:(id)a4 documentsScopeDomainIdentifier:(id)a5 documentsFolderItemIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v57 = a4;
  id v54 = a5;
  id v55 = a6;
  id v12 = a7;
  p_server = &self->_server;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  uint64_t v15 = [WeakRetained extensionManager];
  __int16 v16 = [v15 clouddocsExtensionIdentifier];

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  __int16 v64 = __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke;
  id v65 = &unk_1E6A73710;
  uint64_t v66 = self;
  id v17 = v12;
  id v67 = v17;
  uint64_t v18 = self;
  uint64_t v19 = v63;
  id v68 = 0;
  id v20 = [(FPDXPCServicer *)v18 providerForIdentifier:v16 enumerateEntitlementRequired:1 error:&v68];
  id v21 = v68;
  if (!v20)
  {
    v64((uint64_t)v19, v21);
LABEL_7:
    id v27 = 0;
    goto LABEL_9;
  }
  if ([v20 invalidated])
  {
    uint64_t v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v70 = (uint64_t)v20;
      _os_log_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    char v23 = NSString;
    uint64_t v24 = [v20 identifier];
    dispatch_group_t v25 = [v23 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v24];

    int v26 = FPProviderNotRegistered();
    v64((uint64_t)v19, v26);

    goto LABEL_7;
  }
  id v27 = v20;
LABEL_9:

  if (v27)
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F25D30]) initWithProviderID:v16 domainIdentifier:v57 itemIdentifier:v56];
    id v68 = 0;
    id v29 = [(FPDXPCServicer *)v18 server];
    int v30 = [v29 extensionManager];
    id v53 = [v30 domainFromItemID:v28 reason:&v68];

    if (v53)
    {
      id v31 = objc_alloc(MEMORY[0x1E4F25D30]);
      id v32 = objc_loadWeakRetained((id *)p_server);
      id v33 = [v32 extensionManager];
      uint64_t v34 = [v33 clouddocsExtensionIdentifier];
      int v35 = (void *)[v31 initWithProviderID:v34 domainIdentifier:v54 itemIdentifier:v55];

      id v36 = [(FPDXPCServicer *)v18 server];
      uint64_t v37 = [v36 extensionManager];
      uint64_t v38 = [v37 domainFromItemID:v35 reason:&v68];

      if (v38)
      {
        id v39 = [v38 defaultBackend];
        uint64_t v40 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v18 pid]];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        void v58[2] = __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke_229;
        v58[3] = &unk_1E6A75960;
        v58[4] = v18;
        id v61 = v17;
        id v59 = v53;
        id v60 = v28;
        [v39 URLForItemID:v35 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v40 completionHandler:v58];
      }
      else
      {
        fpfs_adopt_log();
        id v62 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v44 = fp_current_or_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v52 = FPPopLogSectionForBlock();
          uint64_t v50 = [v35 providerDomainID];
          int v51 = FPProviderNotFoundError();
          *(_DWORD *)buf = 134219266;
          uint64_t v70 = v52;
          __int16 v71 = 2112;
          id v72 = v18;
          __int16 v73 = 2080;
          id v74 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdenti"
                "fier:documentsFolderItemIdentifier:completionHandler:]";
          __int16 v75 = 2112;
          uint64_t v76 = 0;
          __int16 v77 = 2112;
          uint64_t v78 = 0;
          __int16 v79 = 2112;
          id v80 = v51;
          _os_log_debug_impl(&dword_1D744C000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
        }
        id v45 = [v35 providerDomainID];
        char v46 = FPProviderNotFoundError();
        (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0, 0, v46);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v62 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = fp_current_or_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v47 = FPPopLogSectionForBlock();
        id v48 = [v28 providerDomainID];
        int v49 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219266;
        uint64_t v70 = v47;
        __int16 v71 = 2112;
        id v72 = v18;
        __int16 v73 = 2080;
        id v74 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifi"
              "er:documentsFolderItemIdentifier:completionHandler:]";
        __int16 v75 = 2112;
        uint64_t v76 = 0;
        __int16 v77 = 2112;
        uint64_t v78 = 0;
        __int16 v79 = 2112;
        id v80 = v49;
        _os_log_debug_impl(&dword_1D744C000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
      }
      id v42 = [v28 providerDomainID];
      uint64_t v43 = FPProviderNotFoundError();
      (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0, 0, v43);

      __fp_pop_log();
    }
  }
}

void __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    size_t v13 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier:d"
          "ocumentsFolderItemIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke_229(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    fpfs_adopt_log();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = FPPopLogSectionForBlock();
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      __int16 v24 = 2080;
      dispatch_group_t v25 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier"
            ":documentsFolderItemIdentifier:completionHandler:]_block_invoke";
      __int16 v26 = 2112;
      uint64_t v27 = 0;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 40) defaultBackend];
    uint64_t v12 = *(void *)(a1 + 48);
    size_t v13 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke_230;
    v16[3] = &unk_1E6A75938;
    v16[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 56);
    id v17 = v8;
    [v11 URLForItemID:v12 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v13 completionHandler:v16];
  }
}

void __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke_230(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    __int16 v16 = fpfs_adopt_log();
    __int16 v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = FPPopLogSectionForBlock();
      uint64_t v12 = a1[4];
      *(_DWORD *)buf = 134219266;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2080;
      __int16 v22 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier"
            ":documentsFolderItemIdentifier:completionHandler:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = 0;
      __int16 v25 = 2112;
      uint64_t v26 = 0;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }
  else
  {
    __int16 v16 = fpfs_adopt_log();
    __int16 v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = FPPopLogSectionForBlock();
      uint64_t v14 = a1[4];
      uint64_t v15 = a1[5];
      *(_DWORD *)buf = 134219266;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      __int16 v22 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier"
            ":documentsFolderItemIdentifier:completionHandler:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      id v28 = 0;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }

  (*(void (**)(void))(a1[6] + 16))();
  __fp_pop_log();
}

- (void)updateBlockedProcessNamesForProvider:(id)a3 processNames:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  __int16 v27 = __86__FPDXPCServicer_updateBlockedProcessNamesForProvider_processNames_completionHandler___block_invoke;
  id v28 = &unk_1E6A73710;
  uint64_t v29 = self;
  id v11 = v10;
  id v30 = v11;
  uint64_t v12 = self;
  uint64_t v13 = &v25;
  id v31 = 0;
  uint64_t v14 = [(FPDXPCServicer *)v12 providerForIdentifier:v8 enumerateEntitlementRequired:1 error:&v31];
  id v15 = v31;
  if (!v14)
  {
    v27((uint64_t)v13, v15);
LABEL_7:
    id v21 = 0;
    goto LABEL_9;
  }
  if ([v14 invalidated])
  {
    __int16 v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v14;
      _os_log_impl(&dword_1D744C000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    id v17 = NSString;
    uint64_t v18 = [v14 identifier];
    __int16 v19 = [v17 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v18, v25, v26];

    uint64_t v20 = FPProviderNotRegistered();
    v27((uint64_t)v13, v20);

    goto LABEL_7;
  }
  id v21 = v14;
LABEL_9:

  if (v21)
  {
    id v22 = v21;
    objc_sync_enter(v22);
    if (v9)
    {
      __int16 v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
      [v22 setBlockedProcessNames:v23];
    }
    else
    {
      [v22 setBlockedProcessNames:0];
    }
    objc_sync_exit(v22);

    fpfs_adopt_log();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer updateBlockedProcessNamesForProvider:processNames:completionHandler:]();
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
    __fp_pop_log();
  }
}

void __86__FPDXPCServicer_updateBlockedProcessNamesForProvider_processNames_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer updateBlockedProcessNamesForProvider:processNames:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)fetchPathComponentsForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  id v36 = __62__FPDXPCServicer_fetchPathComponentsForURL_completionHandler___block_invoke;
  uint64_t v37 = &unk_1E6A73710;
  uint64_t v38 = self;
  id v8 = v7;
  id v39 = v8;
  uint64_t v9 = self;
  id v10 = v6;
  uint64_t v11 = v35;
  if (!v10)
  {
    uint64_t v24 = FPInvalidParameterError();
LABEL_8:
    uint64_t v25 = (void *)v24;
    v36((uint64_t)v11, (void *)v24);

    goto LABEL_15;
  }
  __int16 v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:accessType:logLevel:", v10, *MEMORY[0x1E4F25908], 0);

  if ((v13 & 1) == 0)
  {
    __int16 v14 = [(FPDXPCServicer *)v9 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      id v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v24 = FPNotPermittedError();
        goto LABEL_8;
      }
    }
  }

  __int16 v19 = [(FPDXPCServicer *)v9 server];
  uint64_t v20 = [v19 extensionManager];
  id v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    id v22 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v9 pid]];
    __int16 v23 = [v21 defaultBackend];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __62__FPDXPCServicer_fetchPathComponentsForURL_completionHandler___block_invoke_232;
    v31[3] = &unk_1E6A75848;
    void v31[4] = v9;
    id v33 = v8;
    id v32 = v21;
    [v23 hierarchyForURL:v10 request:v22 completionHandler:v31];
  }
  else
  {
    uint64_t v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer fetchPathComponentsForURL:completionHandler:](v10);
    }

    fpfs_adopt_log();
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = FPPopLogSectionForBlock();
      id v30 = FPProviderNotFoundErrorForURL();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v41 = 2112;
      id v42 = v9;
      __int16 v43 = 2080;
      BOOL v44 = "-[FPDXPCServicer fetchPathComponentsForURL:completionHandler:]";
      __int16 v45 = 2112;
      uint64_t v46 = MEMORY[0x1E4F1CBF0];
      __int16 v47 = 2112;
      id v48 = v30;
      _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    id v28 = FPProviderNotFoundErrorForURL();
    (*((void (**)(id, void, void *))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], v28);

    __fp_pop_log();
  }

LABEL_15:
}

void __62__FPDXPCServicer_fetchPathComponentsForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer fetchPathComponentsForURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __62__FPDXPCServicer_fetchPathComponentsForURL_completionHandler___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v21 = fpfs_adopt_log();
    uint64_t v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = FPPopLogSectionForBlock();
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      __int16 v26 = 2080;
      __int16 v27 = "-[FPDXPCServicer fetchPathComponentsForURL:completionHandler:]_block_invoke";
      __int16 v28 = 2112;
      uint64_t v29 = (void *)MEMORY[0x1E4F1CBF0];
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_debug_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __fp_pop_log();
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) server];
    uint64_t v9 = [v8 extensionManager];
    __int16 v10 = [v9 providerDomainsByID];
    uint64_t v11 = [*(id *)(a1 + 40) providerDomainID];
    __int16 v12 = [v10 objectForKeyedSubscript:v11];

    char v13 = FPPathComponentsForFPItems();
    uint64_t v20 = fpfs_adopt_log();
    __int16 v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = FPPopLogSectionForBlock();
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      __int16 v26 = 2080;
      __int16 v27 = "-[FPDXPCServicer fetchPathComponentsForURL:completionHandler:]_block_invoke";
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      __int16 v30 = 2112;
      id v31 = 0;
      _os_log_debug_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __fp_pop_log();
  }
}

- (void)triggerDiagnosticsFor:(id)a3 triggeringError:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v43 = a4;
  id v11 = a6;
  v63[0] = *MEMORY[0x1E4F25E20];
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  uint64_t v52 = __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke;
  id v53 = &unk_1E6A73710;
  id v54 = self;
  id v13 = v11;
  id v55 = v13;
  __int16 v14 = self;
  id v15 = v10;
  id v16 = v12;
  uint64_t v17 = v51;
  if (!v15)
  {
    uint64_t v32 = FPInvalidParameterError();
LABEL_10:
    id v33 = (void *)v32;
    v52((uint64_t)v17, (void *)v32);

    goto LABEL_20;
  }
  uint64_t v18 = [(FPDXPCServicer *)v14 connection];
  char v19 = objc_msgSend(v18, "fp_hasSandboxAccessToFile:accessType:logLevel:", v15, *MEMORY[0x1E4F25908], 0);

  if ((v19 & 1) == 0)
  {
    uint64_t v20 = [(FPDXPCServicer *)v14 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v22 = objc_msgSend(v20, "fp_hasOneOfEntitlements:logLevel:", v21, 0);

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = [(FPDXPCServicer *)v14 connection];
      char v24 = objc_msgSend(v23, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

      if ((v24 & 1) == 0)
      {
        uint64_t v25 = [(FPDXPCServicer *)v14 connection];
        char v26 = objc_msgSend(v25, "fp_isNonSandboxedConnection");

        if ((v26 & 1) == 0)
        {
          uint64_t v32 = FPNotPermittedError();
          goto LABEL_10;
        }
      }
    }
  }

  if (fpfs_supports_tap_to_feedback())
  {
    __int16 v27 = [(FPDXPCServicer *)v14 server];
    __int16 v28 = [v27 extensionManager];
    uint64_t v29 = [v28 domainForURL:v15 reason:0];

    if (v29)
    {
      __int16 v30 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v14 pid]];
      id v31 = [v29 defaultBackend];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke_233;
      void v44[3] = &unk_1E6A759B0;
      v44[4] = v14;
      id v48 = v13;
      id v45 = v15;
      id v46 = v29;
      BOOL v49 = a5;
      id v47 = v43;
      [v31 itemIDForURL:v45 requireProviderItemID:0 request:v30 completionHandler:v44];
    }
    else
    {
      id v36 = fp_current_or_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer triggerDiagnosticsFor:triggeringError:uiOnly:completionHandler:](v15);
      }

      fpfs_adopt_log();
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = fp_current_or_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v41 = FPPopLogSectionForBlock();
        id v42 = FPItemNotFoundErrorAtURL();
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v41;
        __int16 v57 = 2112;
        id v58 = v14;
        __int16 v59 = 2080;
        id v60 = "-[FPDXPCServicer triggerDiagnosticsFor:triggeringError:uiOnly:completionHandler:]";
        __int16 v61 = 2112;
        id v62 = v42;
        _os_log_debug_impl(&dword_1D744C000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      uint64_t v38 = FPItemNotFoundErrorAtURL();
      (*((void (**)(id, void *))v13 + 2))(v13, v38);

      __fp_pop_log();
    }
  }
  else
  {
    fpfs_adopt_log();
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    id v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = FPPopLogSectionForBlock();
      uint64_t v40 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v39;
      __int16 v57 = 2112;
      id v58 = v14;
      __int16 v59 = 2080;
      id v60 = "-[FPDXPCServicer triggerDiagnosticsFor:triggeringError:uiOnly:completionHandler:]";
      __int16 v61 = 2112;
      id v62 = v40;
      _os_log_debug_impl(&dword_1D744C000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    int v35 = FPNotSupportedError();
    (*((void (**)(id, void *))v13 + 2))(v13, v35);

    __fp_pop_log();
  }
LABEL_20:
}

void __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer triggerDiagnosticsFor:triggeringError:uiOnly:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    fpfs_adopt_log();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = FPPopLogSectionForBlock();
      uint64_t v18 = *(void *)(a1 + 32);
      char v19 = FPPluginOperationFailedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v30 = v17;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      __int16 v33 = 2080;
      id v34 = "-[FPDXPCServicer triggerDiagnosticsFor:triggeringError:uiOnly:completionHandler:]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v19;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = FPPluginOperationFailedError();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    __fp_pop_log();
  }
  else if (v5)
  {
    __int16 v10 = [*(id *)(a1 + 48) defaultBackend];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 72);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke_234;
    v23[3] = &unk_1E6A75988;
    id v27 = *(id *)(a1 + 64);
    id v24 = *(id *)(a1 + 48);
    id v25 = v5;
    id v26 = *(id *)(a1 + 56);
    [v10 triggerFeedbackApprovalRequestForItemURL:v11 domain:v12 uiOnly:v13 completionHandler:v23];
  }
  else
  {
    fpfs_adopt_log();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = FPPopLogSectionForBlock();
      uint64_t v21 = *(void *)(a1 + 32);
      char v22 = FPItemNotFoundErrorAtURL();
      *(_DWORD *)buf = 134218754;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = v21;
      __int16 v33 = 2080;
      id v34 = "-[FPDXPCServicer triggerDiagnosticsFor:triggeringError:uiOnly:completionHandler:]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v22;
      _os_log_debug_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v16 = FPItemNotFoundErrorAtURL();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

    __fp_pop_log();
  }
}

void __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke_234(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) defaultBackend];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) identifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke_235;
    v8[3] = &unk_1E6A735F8;
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    [v3 launchFeedbackForDomain:v4 itemIdentifier:v5 triggeringError:v6 completionHandler:v8];
  }
  else
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke_234_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke_235(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)backUpUserURL:(id)a3 outputUserURL:(id)a4 completionHandler:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = [(FPDXPCServicer *)self connection];
  v16[0] = *MEMORY[0x1E4F25E40];
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  char v13 = objc_msgSend(v11, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v12, 0, 2);

  if (v13)
  {
    __int16 v14 = [(FPDXPCServicer *)self server];
    uint64_t v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(v14, "fpfsSQLBackupManagerClass")), "initWithUserURL:outputUserURL:", v8, v9);

    [v15 backUpWithCompletionHandler:v10];
  }
  else
  {
    uint64_t v15 = FPNotPermittedError();
    v10[2](v10, 0, v15);
  }
}

- (void)restoreUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 cleanupOnSuccess:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(id, void, void *))a7;
  uint64_t v16 = [(FPDXPCServicer *)self connection];
  v21[0] = *MEMORY[0x1E4F25E40];
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  char v18 = objc_msgSend(v16, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v17, 0, 2);

  if (v18)
  {
    char v19 = [(FPDXPCServicer *)self server];
    uint64_t v20 = objc_msgSend(objc_alloc((Class)objc_msgSend(v19, "fpfsSQLRestoreManagerClass")), "initWithUserURL:fromBuild:restoreType:cleanupOnSuccess:", v12, v13, v14, v8);

    [v20 restoreWithCompletionHandler:v15];
  }
  else
  {
    uint64_t v20 = FPNotPermittedError();
    v15[2](v15, 0, v20);
  }
}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  id v34 = __57__FPDXPCServicer_resolveConflictAtURL_completionHandler___block_invoke;
  __int16 v35 = &unk_1E6A73710;
  id v36 = self;
  id v8 = v7;
  id v37 = v8;
  id v9 = self;
  id v10 = v6;
  uint64_t v11 = v33;
  if (!v10)
  {
    uint64_t v23 = FPInvalidParameterError();
LABEL_8:
    id v24 = (void *)v23;
    v34((uint64_t)v11, (void *)v23);

    goto LABEL_15;
  }
  id v12 = [(FPDXPCServicer *)v9 connection];
  char v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:accessType:logLevel:", v10, *MEMORY[0x1E4F25908], 0);

  if ((v13 & 1) == 0)
  {
    id v14 = [(FPDXPCServicer *)v9 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [(FPDXPCServicer *)v9 connection];
      char v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        uint64_t v23 = FPNotPermittedError();
        goto LABEL_8;
      }
    }
  }

  char v19 = [(FPDXPCServicer *)v9 server];
  uint64_t v20 = [v19 extensionManager];
  uint64_t v21 = [v20 domainForURL:v10 reason:0];

  if (v21)
  {
    char v22 = [v21 defaultBackend];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__FPDXPCServicer_resolveConflictAtURL_completionHandler___block_invoke_237;
    v30[3] = &unk_1E6A73710;
    v30[4] = v9;
    id v31 = v8;
    [v22 resolveConflictAtURL:v10 completionHandler:v30];
  }
  else
  {
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer resolveConflictAtURL:completionHandler:](v10);
    }

    fpfs_adopt_log();
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = FPPopLogSectionForBlock();
      uint64_t v29 = FPProviderNotFoundErrorForURL();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v28;
      __int16 v39 = 2112;
      uint64_t v40 = v9;
      __int16 v41 = 2080;
      id v42 = "-[FPDXPCServicer resolveConflictAtURL:completionHandler:]";
      __int16 v43 = 2112;
      BOOL v44 = v29;
      _os_log_debug_impl(&dword_1D744C000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    id v27 = FPProviderNotFoundErrorForURL();
    (*((void (**)(id, void *))v8 + 2))(v8, v27);

    __fp_pop_log();
  }

LABEL_15:
}

void __57__FPDXPCServicer_resolveConflictAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer resolveConflictAtURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __57__FPDXPCServicer_resolveConflictAtURL_completionHandler___block_invoke_237(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer resolveConflictAtURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  __int16 v35 = __88__FPDXPCServicer_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler___block_invoke;
  id v36 = &unk_1E6A73710;
  id v37 = self;
  id v10 = v9;
  id v38 = v10;
  uint64_t v11 = self;
  id v12 = v8;
  char v13 = v34;
  if (!v12)
  {
    uint64_t v25 = FPInvalidParameterError();
LABEL_8:
    id v26 = (void *)v25;
    v35((uint64_t)v13, (void *)v25);

    goto LABEL_13;
  }
  __int16 v14 = [(FPDXPCServicer *)v11 connection];
  char v15 = objc_msgSend(v14, "fp_hasSandboxAccessToFile:accessType:logLevel:", v12, *MEMORY[0x1E4F25908], 0);

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = [(FPDXPCServicer *)v11 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v18 = objc_msgSend(v16, "fp_hasOneOfEntitlements:logLevel:", v17, 0);

    if ((v18 & 1) == 0)
    {
      char v19 = [(FPDXPCServicer *)v11 connection];
      char v20 = objc_msgSend(v19, "fp_isNonSandboxedConnection");

      if ((v20 & 1) == 0)
      {
        uint64_t v25 = FPNotPermittedError();
        goto LABEL_8;
      }
    }
  }

  uint64_t v21 = [(FPDXPCServicer *)v11 server];
  char v22 = [v21 extensionManager];
  uint64_t v23 = [v22 domainForURL:v12 reason:0];

  if (v23)
  {
    id v24 = [v23 defaultBackend];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __88__FPDXPCServicer_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler___block_invoke_238;
    v31[3] = &unk_1E6A759D8;
    void v31[4] = v11;
    id v32 = v10;
    [v24 listRemoteVersionsOfItemAtURL:v12 includeCachedVersions:v6 completionHandler:v31];
  }
  else
  {
    fpfs_adopt_log();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = FPPopLogSectionForBlock();
      uint64_t v30 = FPProviderNotFoundErrorForURL();
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v40 = 2112;
      __int16 v41 = v11;
      __int16 v42 = 2080;
      __int16 v43 = "-[FPDXPCServicer listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:]";
      __int16 v44 = 2112;
      uint64_t v45 = 0;
      __int16 v46 = 2112;
      uint64_t v47 = 0;
      __int16 v48 = 2112;
      BOOL v49 = v30;
      _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
    uint64_t v28 = FPProviderNotFoundErrorForURL();
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v28);

    __fp_pop_log();
  }

LABEL_13:
}

void __88__FPDXPCServicer_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __88__FPDXPCServicer_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler___block_invoke_238(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  char v13 = fpfs_adopt_log();
  __int16 v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = FPPopLogSectionForBlock();
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2080;
    id v19 = "-[FPDXPCServicer listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:kno"
          "wnFolders:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_240(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:kno"
          "wnFolders:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_241(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = [*(id *)(a1 + 32) url];
    [v4 stopAccessingSecurityScopedResource];
  }
  id v8 = fpfs_adopt_log();
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    __int16 v14 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:kno"
          "wnFolders:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

void __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_254(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v7 = [*(id *)(a1 + 32) url];
    [v7 stopAccessingSecurityScopedResource];
  }
  if (!v6)
  {
    id v8 = [*(id *)(a1 + 40) server];
    [v8 signalProviderChanges];
  }
  uint64_t v12 = fpfs_adopt_log();
  uint64_t v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = FPPopLogSectionForBlock();
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2080;
    id v18 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:kno"
          "wnFolders:completionHandler:]_block_invoke";
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

- (void)prepareRemovalOfDomainWithIdentifier:(id)a3 provider:(id)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)removeDomainAndPreserveDataWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(v8, "fp_toProviderID");
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  id v33 = __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke;
  id v34 = &unk_1E6A73710;
  __int16 v35 = self;
  id v11 = v9;
  id v36 = v11;
  uint64_t v12 = self;
  __int16 v13 = v32;
  id v37 = 0;
  uint64_t v14 = [(FPDXPCServicer *)v12 providerForIdentifier:v10 enumerateEntitlementRequired:1 error:&v37];
  id v15 = v37;
  if (v14)
  {
    if ([v14 invalidated])
    {
      unint64_t v25 = a4;
      uint64_t v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v39 = v14;
        _os_log_impl(&dword_1D744C000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
      }

      __int16 v17 = NSString;
      id v18 = [v14 identifier];
      __int16 v19 = [v17 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v18];

      id v20 = FPProviderNotRegistered();
      v33((uint64_t)v13, v20);

      id v21 = 0;
      a4 = v25;
    }
    else
    {
      id v21 = v14;
    }
  }
  else
  {
    v33((uint64_t)v13, v15);
    id v21 = 0;
  }

  if (v21)
  {
    id v22 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v12 pid]];
    uint64_t v23 = objc_msgSend(v8, "fp_toDomainIdentifier");
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke_256;
    v26[3] = &unk_1E6A75A50;
    v26[4] = v12;
    id v30 = v11;
    id v27 = v21;
    unint64_t v31 = a4;
    id v28 = v8;
    id v29 = v22;
    id v24 = v22;
    [(FPDXPCServicer *)v12 prepareRemovalOfDomainWithIdentifier:v23 provider:v27 request:v24 completionHandler:v26];
  }
}

void __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke_256(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    fpfs_adopt_log();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = FPPopLogSectionForBlock();
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      __int16 v19 = "-[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log();
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 48), "fp_toDomainIdentifier");
    uint64_t v7 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke_257;
    v11[3] = &unk_1E6A75820;
    v11[4] = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 72);
    id v12 = *(id *)(a1 + 64);
    [v5 removeDomain:v6 mode:v8 request:v7 completionHandler:v11];
  }
}

void __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke_257(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    fpfs_adopt_log();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = FPPopLogSectionForBlock();
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2080;
      id v23 = "-[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      unint64_t v25 = 0;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log();
  }
  else
  {
    if (v5)
    {
      id v16 = 0;
      uint64_t v9 = [MEMORY[0x1E4F25D78] wrapperWithURL:v5 readonly:0 error:&v16];
      id v7 = v16;
    }
    else
    {
      id v7 = 0;
      uint64_t v9 = 0;
    }
    uint64_t v10 = [*(id *)(a1 + 32) server];
    [v10 signalProviderChanges];

    fpfs_adopt_log();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = FPPopLogSectionForBlock();
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      id v23 = "-[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      unint64_t v25 = v9;
      __int16 v26 = 2112;
      id v27 = 0;
      _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log();
  }
}

- (void)removeDomainWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__FPDXPCServicer_removeDomainWithID_mode_completionHandler___block_invoke;
  v10[3] = &unk_1E6A75A78;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(FPDXPCServicer *)self removeDomainAndPreserveDataWithID:a3 mode:a4 completionHandler:v10];
}

void __60__FPDXPCServicer_removeDomainWithID_mode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    id v16 = "-[FPDXPCServicer removeDomainWithID:mode:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)removeDomain:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  unint64_t v31 = __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke;
  id v32 = &unk_1E6A73710;
  id v33 = self;
  id v10 = v9;
  id v34 = v10;
  id v11 = self;
  uint64_t v12 = v30;
  id v35 = 0;
  __int16 v13 = [(FPDXPCServicer *)v11 providerForIdentifier:0 enumerateEntitlementRequired:1 error:&v35];
  id v14 = v35;
  if (!v13)
  {
    v31((uint64_t)v12, v14);
LABEL_7:
    id v20 = 0;
    goto LABEL_9;
  }
  if ([v13 invalidated])
  {
    __int16 v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v13;
      _os_log_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    id v16 = NSString;
    __int16 v17 = [v13 identifier];
    id v18 = [v16 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v17];

    uint64_t v19 = FPProviderNotRegistered();
    v31((uint64_t)v12, v19);

    goto LABEL_7;
  }
  id v20 = v13;
LABEL_9:

  if (v20)
  {
    uint64_t v21 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v11 pid]];
    __int16 v22 = [v8 identifier];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke_259;
    v24[3] = &unk_1E6A75A50;
    v24[4] = v11;
    id v28 = v10;
    id v25 = v20;
    unint64_t v29 = a4;
    id v26 = v8;
    id v27 = v21;
    id v23 = v21;
    [(FPDXPCServicer *)v11 prepareRemovalOfDomainWithIdentifier:v22 provider:v25 request:v23 completionHandler:v24];
  }
}

void __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer removeDomain:mode:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke_259(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    fpfs_adopt_log();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = FPPopLogSectionForBlock();
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      uint64_t v19 = "-[FPDXPCServicer removeDomain:mode:completionHandler:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log();
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 48) identifier];
    uint64_t v7 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke_260;
    v11[3] = &unk_1E6A75820;
    v11[4] = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 72);
    id v12 = *(id *)(a1 + 64);
    [v5 removeDomain:v6 mode:v8 request:v7 completionHandler:v11];
  }
}

void __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke_260(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    fpfs_adopt_log();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = FPPopLogSectionForBlock();
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2080;
      id v23 = "-[FPDXPCServicer removeDomain:mode:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = 0;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log();
  }
  else
  {
    if (v5)
    {
      id v16 = 0;
      uint64_t v9 = [MEMORY[0x1E4F25D78] wrapperWithURL:v5 readonly:0 error:&v16];
      id v7 = v16;
    }
    else
    {
      id v7 = 0;
      uint64_t v9 = 0;
    }
    uint64_t v10 = [*(id *)(a1 + 32) server];
    [v10 signalProviderChanges];

    fpfs_adopt_log();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = FPPopLogSectionForBlock();
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      id v23 = "-[FPDXPCServicer removeDomain:mode:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = 0;
      _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log();
  }
}

- (void)removeDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__FPDXPCServicer_removeDomain_completionHandler___block_invoke;
  v8[3] = &unk_1E6A75A78;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(FPDXPCServicer *)self removeDomain:a3 mode:0 completionHandler:v8];
}

void __49__FPDXPCServicer_removeDomain_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    id v16 = "-[FPDXPCServicer removeDomain:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)removeAllDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  __int16 v22 = __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke;
  id v23 = &unk_1E6A73710;
  __int16 v24 = self;
  id v7 = v6;
  id v25 = v7;
  uint64_t v8 = self;
  uint64_t v9 = v21;
  id v26 = 0;
  uint64_t v10 = [(FPDXPCServicer *)v8 providerForIdentifier:a3 enumerateEntitlementRequired:1 error:&v26];
  id v11 = v26;
  if (!v10)
  {
    v22((uint64_t)v9, v11);
LABEL_7:
    id v17 = 0;
    goto LABEL_9;
  }
  if ([v10 invalidated])
  {
    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    __int16 v13 = NSString;
    uint64_t v14 = [v10 identifier];
    __int16 v15 = [v13 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v14];

    id v16 = FPProviderNotRegistered();
    v22((uint64_t)v9, v16);

    goto LABEL_7;
  }
  id v17 = v10;
LABEL_9:

  if (v17)
  {
    id v18 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v8 pid]];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke_261;
    v19[3] = &unk_1E6A73710;
    void v19[4] = v8;
    id v20 = v7;
    [v17 removeAllDomainsForRequest:v18 completionHandler:v19];
  }
}

void __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer removeAllDomainsForProviderIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke_261(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v9 = fpfs_adopt_log();
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = FPPopLogSectionForBlock();
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      uint64_t v16 = "-[FPDXPCServicer removeAllDomainsForProviderIdentifier:completionHandler:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log();
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) server];
    [v5 signalProviderChanges];

    __int16 v10 = fpfs_adopt_log();
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke_261_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log();
  }
}

- (void)getDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __68__FPDXPCServicer_getDomainsForProviderIdentifier_completionHandler___block_invoke;
  id v30 = &unk_1E6A73710;
  unint64_t v31 = self;
  id v8 = v7;
  id v32 = v8;
  uint64_t v9 = self;
  __int16 v10 = &v27;
  id v33 = 0;
  uint64_t v11 = [(FPDXPCServicer *)v9 providerForIdentifier:v6 enumerateEntitlementRequired:1 error:&v33];
  id v12 = v33;
  if (!v11)
  {
    v29((uint64_t)v10, v12);
LABEL_7:
    id v18 = 0;
    goto LABEL_9;
  }
  if ([v11 invalidated])
  {
    __int16 v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = (uint64_t)v11;
      _os_log_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    uint64_t v14 = NSString;
    __int16 v15 = [v11 identifier];
    uint64_t v16 = [v14 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v15, v27, v28];

    __int16 v17 = FPProviderNotRegistered();
    v29((uint64_t)v10, v17);

    goto LABEL_7;
  }
  id v18 = v11;
LABEL_9:

  if (v18)
  {
    fpfs_adopt_log();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = FPPopLogSectionForBlock();
      __int16 v24 = [v18 identifier];
      id v25 = [v18 nsDomainsByID];
      id v26 = [v25 allValues];
      *(_DWORD *)buf = 134219010;
      uint64_t v35 = v23;
      __int16 v36 = 2112;
      id v37 = v9;
      __int16 v38 = 2080;
      __int16 v39 = "-[FPDXPCServicer getDomainsForProviderIdentifier:completionHandler:]";
      __int16 v40 = 2112;
      __int16 v41 = v24;
      __int16 v42 = 2112;
      __int16 v43 = v26;
      _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    id v20 = [v18 identifier];
    uint64_t v21 = [v18 nsDomainsByID];
    __int16 v22 = [v21 allValues];
    (*((void (**)(id, void *, void *, void))v8 + 2))(v8, v20, v22, 0);

    __fp_pop_log();
  }
}

void __68__FPDXPCServicer_getDomainsForProviderIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer getDomainsForProviderIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)setEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  uint64_t v27 = __86__FPDXPCServicer_setEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke;
  uint64_t v28 = &unk_1E6A73710;
  uint64_t v29 = self;
  id v12 = v11;
  id v30 = v12;
  __int16 v13 = self;
  __int16 v14 = v26;
  id v31 = 0;
  uint64_t v15 = [(FPDXPCServicer *)v13 providerForIdentifier:a5 enumerateEntitlementRequired:1 error:&v31];
  id v16 = v31;
  if (v15)
  {
    if ([v15 invalidated])
    {
      uint64_t v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v15;
        _os_log_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
      }

      __int16 v18 = NSString;
      id v19 = [v15 identifier];
      uint64_t v20 = [v18 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v19];

      uint64_t v21 = FPProviderNotRegistered();
      v27((uint64_t)v14, v21);

      id v22 = 0;
    }
    else
    {
      id v22 = v15;
    }
  }
  else
  {
    v27((uint64_t)v14, v16);
    id v22 = 0;
  }

  if (v22)
  {
    uint64_t v23 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v13 pid]];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __86__FPDXPCServicer_setEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_262;
    v24[3] = &unk_1E6A73710;
    v24[4] = v13;
    id v25 = v12;
    [v22 setEnabled:v8 forDomainIdentifier:v10 request:v23 completionHandler:v24];
  }
}

void __86__FPDXPCServicer_setEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer setEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __86__FPDXPCServicer_setEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_262(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) server];
  [v4 signalProviderChanges];

  BOOL v8 = fpfs_adopt_log();
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    __int16 v14 = "-[FPDXPCServicer setEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)setHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  uint64_t v27 = __91__FPDXPCServicer_setHiddenByUser_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke;
  uint64_t v28 = &unk_1E6A73710;
  uint64_t v29 = self;
  id v12 = v11;
  id v30 = v12;
  __int16 v13 = self;
  __int16 v14 = v26;
  id v31 = 0;
  __int16 v15 = [(FPDXPCServicer *)v13 providerForIdentifier:a5 enumerateEntitlementRequired:1 error:&v31];
  id v16 = v31;
  if (v15)
  {
    if ([v15 invalidated])
    {
      uint64_t v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v15;
        _os_log_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
      }

      __int16 v18 = NSString;
      id v19 = [v15 identifier];
      uint64_t v20 = [v18 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v19];

      uint64_t v21 = FPProviderNotRegistered();
      v27((uint64_t)v14, v21);

      id v22 = 0;
    }
    else
    {
      id v22 = v15;
    }
  }
  else
  {
    v27((uint64_t)v14, v16);
    id v22 = 0;
  }

  if (v22)
  {
    uint64_t v23 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v13 pid]];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __91__FPDXPCServicer_setHiddenByUser_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_263;
    v24[3] = &unk_1E6A73710;
    v24[4] = v13;
    id v25 = v12;
    [v22 setHiddenByUser:v8 forDomainIdentifier:v10 request:v23 completionHandler:v24];
  }
}

void __91__FPDXPCServicer_setHiddenByUser_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer setHiddenByUser:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __91__FPDXPCServicer_setHiddenByUser_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_263(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) server];
  [v4 signalProviderChanges];

  BOOL v8 = fpfs_adopt_log();
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    __int16 v14 = "-[FPDXPCServicer setHiddenByUser:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)setIndexingEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6
{
  BOOL v33 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  __int16 v38 = __94__FPDXPCServicer_setIndexingEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke;
  __int16 v39 = &unk_1E6A73710;
  __int16 v40 = self;
  id v12 = v11;
  id v41 = v12;
  __int16 v13 = self;
  __int16 v14 = v37;
  id v42 = 0;
  __int16 v15 = [(FPDXPCServicer *)v13 providerForIdentifier:v10 enumerateEntitlementRequired:1 error:&v42];
  id v16 = v42;
  if (!v15)
  {
    v38((uint64_t)v14, v16);
LABEL_7:
    id v22 = 0;
    goto LABEL_9;
  }
  if ([v15 invalidated])
  {
    uint64_t v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = (uint64_t)v15;
      _os_log_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    __int16 v18 = NSString;
    id v19 = [v15 identifier];
    uint64_t v20 = [v18 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v19];

    uint64_t v21 = FPProviderNotRegistered();
    v38((uint64_t)v14, v21);

    goto LABEL_7;
  }
  id v22 = v15;
LABEL_9:

  if (v22)
  {
    id v42 = 0;
    uint64_t v23 = [v22 domainForIdentifier:v9 reason:&v42];
    __int16 v24 = v23;
    if (v23)
    {
      id v25 = [v23 indexer];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        fpfs_adopt_log();
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        id v30 = fp_current_or_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          FPPopLogSectionForBlock();
          -[FPDXPCServicer setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]();
        }

        (*((void (**)(id, void))v12 + 2))(v12, 0);
        __fp_pop_log();
      }
      else
      {
        uint64_t v27 = [v24 indexer];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        void v34[2] = __94__FPDXPCServicer_setIndexingEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_264;
        void v34[3] = &unk_1E6A73710;
        void v34[4] = v13;
        id v35 = v12;
        [v27 setIndexingEnabled:v33 completionHandler:v34];
      }
    }
    else
    {
      fpfs_adopt_log();
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = fp_current_or_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = FPPopLogSectionForBlock();
        id v32 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v44 = v31;
        __int16 v45 = 2112;
        __int16 v46 = v13;
        __int16 v47 = 2080;
        __int16 v48 = "-[FPDXPCServicer setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]";
        __int16 v49 = 2112;
        uint64_t v50 = v32;
        _os_log_debug_impl(&dword_1D744C000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      uint64_t v29 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v12 + 2))(v12, v29);

      __fp_pop_log();
    }
  }
}

void __94__FPDXPCServicer_setIndexingEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __94__FPDXPCServicer_setIndexingEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_264(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v31 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 providerID];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  id v36 = __82__FPDXPCServicer_reimportItemsBelowItemWithID_markItemDataless_completionHandler___block_invoke;
  id v37 = &unk_1E6A73710;
  __int16 v38 = self;
  id v10 = v8;
  id v39 = v10;
  uint64_t v11 = self;
  __int16 v12 = v35;
  id v40 = 0;
  __int16 v13 = [(FPDXPCServicer *)v11 providerForIdentifier:v9 enumerateEntitlementRequired:1 error:&v40];
  id v14 = v40;
  if (!v13)
  {
    v36((uint64_t)v12, v14);
LABEL_7:
    id v20 = 0;
    goto LABEL_9;
  }
  if ([v13 invalidated])
  {
    id v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = (uint64_t)v13;
      _os_log_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    uint64_t v16 = NSString;
    uint64_t v17 = [v13 identifier];
    __int16 v18 = [v16 stringWithFormat:@"A provider with ID %@ was found, but is in the process of being invalidated. Retry later.", v17];

    id v19 = FPProviderNotRegistered();
    v36((uint64_t)v12, v19);

    goto LABEL_7;
  }
  id v20 = v13;
LABEL_9:

  if (v20)
  {
    id v40 = 0;
    uint64_t v21 = [(FPDXPCServicer *)v11 server];
    id v22 = [v21 extensionManager];
    uint64_t v23 = [v22 domainFromItemID:v7 reason:&v40];

    if (v23)
    {
      __int16 v24 = [v23 defaultBackend];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __82__FPDXPCServicer_reimportItemsBelowItemWithID_markItemDataless_completionHandler___block_invoke_265;
      v32[3] = &unk_1E6A73710;
      v32[4] = v11;
      id v33 = v10;
      [v24 reimportItemsBelowItemWithID:v7 markItemDataless:v31 completionHandler:v32];
    }
    else
    {
      fpfs_adopt_log();
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = FPPopLogSectionForBlock();
        uint64_t v29 = [v7 providerID];
        id v30 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v42 = v28;
        __int16 v43 = 2112;
        uint64_t v44 = v11;
        __int16 v45 = 2080;
        __int16 v46 = "-[FPDXPCServicer reimportItemsBelowItemWithID:markItemDataless:completionHandler:]";
        __int16 v47 = 2112;
        __int16 v48 = v30;
        _os_log_debug_impl(&dword_1D744C000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      BOOL v26 = [v7 providerID];
      uint64_t v27 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v10 + 2))(v10, v27);

      __fp_pop_log();
    }
  }
}

void __82__FPDXPCServicer_reimportItemsBelowItemWithID_markItemDataless_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer reimportItemsBelowItemWithID:markItemDataless:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __82__FPDXPCServicer_reimportItemsBelowItemWithID_markItemDataless_completionHandler___block_invoke_265(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer reimportItemsBelowItemWithID:markItemDataless:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v40[0] = *MEMORY[0x1E4F25E20];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  uint64_t v28 = __77__FPDXPCServicer_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke;
  uint64_t v29 = &unk_1E6A73710;
  id v30 = self;
  id v9 = v7;
  id v31 = v9;
  id v10 = v8;
  uint64_t v11 = v27;
  __int16 v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    uint64_t v26 = 0;
    __int16 v14 = [(FPDXPCServicer *)self server];
    id v15 = [v14 extensionManager];
    uint64_t v16 = [v15 domainWithID:v6 reason:&v26];

    if (v16)
    {
      uint64_t v17 = [v16 defaultBackend];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __77__FPDXPCServicer_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke_266;
      v23[3] = &unk_1E6A73710;
      void v23[4] = self;
      id v24 = v9;
      [v17 forceUpdateBlockedProcessNamesFromDomain:v6 completionHandler:v23];
    }
    else
    {
      fpfs_adopt_log();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = FPPopLogSectionForBlock();
        id v22 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v33 = v21;
        __int16 v34 = 2112;
        id v35 = self;
        __int16 v36 = 2080;
        id v37 = "-[FPDXPCServicer forceUpdateBlockedProcessNamesFromDomain:completionHandler:]";
        __int16 v38 = 2112;
        id v39 = v22;
        _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      id v20 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v9 + 2))(v9, v20);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v18 = FPNotPermittedError();
    v28((uint64_t)v11, v18);
  }
}

void __77__FPDXPCServicer_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer forceUpdateBlockedProcessNamesFromDomain:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __77__FPDXPCServicer_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke_266(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer forceUpdateBlockedProcessNamesFromDomain:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)importProgressForDomainWithID:(id)a3 completionHandler:(id)a4
{
  _OWORD v49[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E60];
  v49[0] = *MEMORY[0x1E4F25E20];
  v49[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  id v35 = __66__FPDXPCServicer_importProgressForDomainWithID_completionHandler___block_invoke;
  __int16 v36 = &unk_1E6A73710;
  id v37 = self;
  id v10 = v7;
  id v38 = v10;
  id v11 = v9;
  __int16 v12 = v34;
  char v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    uint64_t v33 = 0;
    id v15 = [(FPDXPCServicer *)self server];
    uint64_t v16 = [v15 extensionManager];
    uint64_t v17 = [v16 domainWithID:v6 reason:&v33];

    if (v17)
    {
      __int16 v18 = [v17 defaultBackend];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v20 = [v17 defaultBackend];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = __66__FPDXPCServicer_importProgressForDomainWithID_completionHandler___block_invoke_269;
        v30[3] = &unk_1E6A75AA0;
        v30[4] = self;
        id v31 = v10;
        [v20 importProgressWithCompletionHandler:v30];
      }
      else
      {
        fpfs_adopt_log();
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        id v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = FPPopLogSectionForBlock();
          uint64_t v29 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v40 = v28;
          __int16 v41 = 2112;
          uint64_t v42 = self;
          __int16 v43 = 2080;
          uint64_t v44 = "-[FPDXPCServicer importProgressForDomainWithID:completionHandler:]";
          __int16 v45 = 2112;
          uint64_t v46 = 0;
          __int16 v47 = 2112;
          __int16 v48 = v29;
          _os_log_debug_impl(&dword_1D744C000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        id v25 = FPNotSupportedError();
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v25);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = FPPopLogSectionForBlock();
        uint64_t v27 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        uint64_t v40 = v26;
        __int16 v41 = 2112;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        uint64_t v44 = "-[FPDXPCServicer importProgressForDomainWithID:completionHandler:]";
        __int16 v45 = 2112;
        uint64_t v46 = 0;
        __int16 v47 = 2112;
        __int16 v48 = v27;
        _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v23 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v21 = FPNotPermittedError();
    v35((uint64_t)v12, v21);
  }
}

void __66__FPDXPCServicer_importProgressForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer importProgressForDomainWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __66__FPDXPCServicer_importProgressForDomainWithID_completionHandler___block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer importProgressForDomainWithID:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)checkLocationEligibilityForDomain:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  FPNotSupportedError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, id))a4 + 2))(v5, 0, 0, v6);
}

- (void)stateForDomainWithID:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  uint64_t v27 = __57__FPDXPCServicer_stateForDomainWithID_completionHandler___block_invoke;
  uint64_t v28 = &unk_1E6A73710;
  uint64_t v29 = self;
  id v8 = v7;
  id v30 = v8;
  uint64_t v9 = v26;
  __int16 v10 = self;
  uint64_t v11 = [(FPDXPCServicer *)v10 connection];
  uint64_t v12 = *MEMORY[0x1E4F25E08];
  *(void *)buf = *MEMORY[0x1E4F25E00];
  *(void *)&buf[8] = v12;
  *(void *)&buf[16] = *MEMORY[0x1E4F25E28];
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  char v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if (v14)
  {

    __int16 v15 = [(FPDXPCServicer *)v10 server];
    __int16 v16 = [v15 extensionManager];
    __int16 v17 = [v16 domainWithID:v6 reason:0];

    if (v17)
    {
      id v18 = [v17 defaultBackend];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __57__FPDXPCServicer_stateForDomainWithID_completionHandler___block_invoke_271;
      v23[3] = &unk_1E6A75AC8;
      void v23[4] = v10;
      id v24 = v8;
      [v18 stateWithCompletionHandler:v23];
    }
    else
    {
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F25C50] code:12 userInfo:0];
      fpfs_adopt_log();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2080;
        id v32 = "-[FPDXPCServicer stateForDomainWithID:completionHandler:]";
        __int16 v33 = 2048;
        uint64_t v34 = 0;
        __int16 v35 = 2112;
        __int16 v36 = v20;
        _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu, %@", buf, 0x34u);
      }

      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v20);
      __fp_pop_log();
    }
  }
  else
  {
    __int16 v19 = FPNotPermittedError();
    v27((uint64_t)v9, v19);
  }
}

void __57__FPDXPCServicer_stateForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer stateForDomainWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __57__FPDXPCServicer_stateForDomainWithID_completionHandler___block_invoke_271(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v9 = fpfs_adopt_log();
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = FPPopLogSectionForBlock();
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2080;
    uint64_t v15 = "-[FPDXPCServicer stateForDomainWithID:completionHandler:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)runFPCKForDomainWithID:(id)a3 domainRootURL:(id)a4 databaseBackupPath:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 launchType:(unint64_t)a8 completionHandler:(id)a9
{
  v81[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v49 = a4;
  id v50 = a5;
  id v14 = a9;
  uint64_t v15 = *MEMORY[0x1E4F25E30];
  v81[0] = *MEMORY[0x1E4F25E20];
  v81[1] = v15;
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  uint64_t v63 = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke;
  __int16 v64 = &unk_1E6A73710;
  id v65 = self;
  id v51 = v14;
  id v66 = v51;
  id v17 = v16;
  __int16 v18 = v62;
  id v19 = [(FPDXPCServicer *)self connection];
  char v20 = objc_msgSend(v19, "fp_hasOneOfEntitlements:", v17);

  if (v20)
  {

    uint64_t v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D744C000, v21, OS_LOG_TYPE_INFO, "[INFO] 🧹 FPCK launched from XPC", buf, 2u);
    }

    if (a8 == 1)
    {
      uint64_t v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:]();
      }
    }
    else if (a8)
    {
      uint64_t v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:]();
      }
    }
    else
    {
      uint64_t v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:]();
      }
    }

    id v24 = [(FPDXPCServicer *)self server];
    id v25 = [v24 extensionManager];
    uint64_t v26 = [v25 domainWithID:v13 reason:0];

    if (v26)
    {
      uint64_t v27 = [(FPDXPCServicer *)self server];
      uint64_t v44 = objc_msgSend((id)objc_msgSend(v27, "fpckTaskClass"), "sharedManager");
      uint64_t v28 = [v26 nsDomain];
      __int16 v45 = [v28 userInfo];
      __int16 v43 = [v26 checkableURLs];
      uint64_t v29 = [v26 volume];
      unsigned int v40 = [v29 role];
      uint64_t v46 = [v26 nsDomain];
      __int16 v41 = [v46 personaIdentifier];
      unint64_t v30 = 128;
      if (a7) {
        unint64_t v30 = a7;
      }
      unint64_t v39 = v30;
      char v38 = [v26 isUsingFPFS];
      uint64_t v42 = [v26 provider];
      id v31 = [v42 descriptor];
      char v37 = [v31 wantsBundleBitOnlyPackageDetection];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_273;
      v52[3] = &unk_1E6A75B18;
      v52[4] = self;
      id v57 = v51;
      id v53 = v26;
      id v54 = v13;
      id v55 = v49;
      id v56 = v50;
      unint64_t v58 = a6;
      unint64_t v59 = a7;
      unint64_t v60 = a8;
      LOBYTE(v36) = 1;
      BYTE1(v35) = v37;
      LOBYTE(v35) = v38;
      objc_msgSend(v44, "prepareFPCKRun:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:launchType:runOnWorkQueue:completionHandler:", v54, v45, v55, v56, v43, v40, v41, a6, v39, v35, a8, v36, v52);
    }
    else
    {
      id v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F25C50] code:12 userInfo:0];
      fpfs_adopt_log();
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v33 = fp_current_or_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219522;
        uint64_t v68 = v34;
        __int16 v69 = 2112;
        uint64_t v70 = self;
        __int16 v71 = 2080;
        id v72 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:]";
        __int16 v73 = 2112;
        uint64_t v74 = 0;
        __int16 v75 = 2112;
        uint64_t v76 = 0;
        __int16 v77 = 2112;
        uint64_t v78 = 0;
        __int16 v79 = 2112;
        id v80 = v32;
        _os_log_debug_impl(&dword_1D744C000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
      }

      (*((void (**)(id, void, void, void, void *))v51 + 2))(v51, 0, 0, 0, v32);
      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v23 = FPNotPermittedError();
    v63((uint64_t)v18, v23);
  }
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219522;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionH"
          "andler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_273(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  void v48[2] = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_2;
  v48[3] = &unk_1E6A73FE8;
  id v41 = v8;
  id v49 = v41;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained setInvalidationHandler:v48];

  if (v9)
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_273_cold_1(v9);
    }

    fpfs_adopt_log();
    id v47 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = FPPopLogSectionForBlock();
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219522;
      uint64_t v51 = v25;
      __int16 v52 = 2112;
      uint64_t v53 = v26;
      __int16 v54 = 2080;
      id v55 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completio"
            "nHandler:]_block_invoke";
      __int16 v56 = 2112;
      uint64_t v57 = 0;
      __int16 v58 = 2112;
      uint64_t v59 = 0;
      __int16 v60 = 2112;
      uint64_t v61 = 0;
      __int16 v62 = 2112;
      id v63 = v9;
      _os_log_debug_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    __fp_pop_log();

    id v13 = [MEMORY[0x1E4F29268] currentConnection];
    [(FPCKOnDemandUpdateReceiver *)v13 invalidate];
  }
  else
  {
    __int16 v14 = [FPCKOnDemandUpdateReceiver alloc];
    uint64_t v15 = (id *)(a1 + 40);
    __int16 v16 = [*(id *)(a1 + 40) defaultBackend];
    id v13 = [(FPCKOnDemandUpdateReceiver *)v14 initWithDomainBackend:v16];

    uint64_t v17 = [*(id *)(a1 + 32) server];
    __int16 v18 = objc_msgSend((id)objc_msgSend(v17, "fpckTaskClass"), "sharedManager");
    uint64_t v36 = *(void *)(a1 + 48);
    uint64_t v19 = [*(id *)(a1 + 40) nsDomain];
    unint64_t v39 = [v19 userInfo];
    uint64_t v34 = *(void *)(a1 + 64);
    uint64_t v35 = *(void *)(a1 + 56);
    char v38 = [*(id *)(a1 + 40) checkableURLs];
    unsigned int v40 = [*(id *)(a1 + 40) volume];
    unsigned int v33 = [v40 role];
    uint64_t v20 = *(void *)(a1 + 88);
    if (!v20) {
      uint64_t v20 = 128;
    }
    uint64_t v31 = v20;
    uint64_t v32 = *(void *)(a1 + 80);
    char v30 = [*v15 isUsingFPFS];
    char v37 = [*v15 provider];
    id v21 = [v37 descriptor];
    char v29 = [v21 wantsBundleBitOnlyPackageDetection];
    uint64_t v22 = *(void *)(a1 + 96);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_276;
    v42[3] = &unk_1E6A75AF0;
    uint64_t v46 = *(void *)(a1 + 80);
    id v23 = *v15;
    uint64_t v24 = *(void *)(a1 + 32);
    id v43 = v23;
    uint64_t v44 = v24;
    id v45 = *(id *)(a1 + 72);
    uint64_t v28 = v22;
    id v9 = 0;
    BYTE1(v27) = v29;
    LOBYTE(v27) = v30;
    objc_msgSend(v18, "scheduleFPCKRun:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:launchType:updateReceiver:shouldPause:proxy:completionHandler:", v36, v39, v35, v34, v38, v33, v32, v31, v27, v28, v13, 0, v7, v42);
  }
}

uint64_t __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 32) invalidate];
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_276(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D744C000, v15, OS_LOG_TYPE_INFO, "[INFO] 🧹 Saving FPCK report", buf, 2u);
    }

    __int16 v16 = [*(id *)(a1 + 32) defaultBackend];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_277;
    v21[3] = &unk_1E6A735A8;
    uint64_t v17 = *(void **)(a1 + 48);
    v21[4] = *(void *)(a1 + 40);
    id v26 = v17;
    id v22 = v9;
    id v23 = v10;
    id v24 = v11;
    id v25 = v12;
    [v16 saveFPCKTelemetryReport:v24 completionHandler:v21];
  }
  else
  {
    uint64_t v20 = fpfs_adopt_log();
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = FPPopLogSectionForBlock();
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134219522;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      __int16 v31 = 2080;
      uint64_t v32 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completio"
            "nHandler:]_block_invoke";
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v11;
      __int16 v39 = 2112;
      id v40 = v12;
      _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __fp_pop_log();

    __int16 v14 = [MEMORY[0x1E4F29268] currentConnection];
    [v14 invalidate];
  }
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_277(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v12 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[7];
    uint64_t v11 = a1[8];
    *(_DWORD *)buf = 134219522;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2080;
    uint64_t v18 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionH"
          "andler:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = v11;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
  }

  (*(void (**)(void))(a1[9] + 16))();
  __fp_pop_log();

  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  [v5 invalidate];
}

- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6
{
  BOOL v21 = a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v29[0] = *MEMORY[0x1E4F25E20];
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  __int16 v25 = __68__FPDXPCServicer_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke;
  uint64_t v26 = &unk_1E6A73710;
  uint64_t v27 = self;
  id v13 = v11;
  id v28 = v13;
  id v14 = v12;
  __int16 v15 = v24;
  uint64_t v16 = [(FPDXPCServicer *)self connection];
  char v17 = objc_msgSend(v16, "fp_hasOneOfEntitlements:", v14);

  if (v17)
  {

    uint64_t v18 = [(FPDXPCServicer *)self server];
    objc_msgSend((id)objc_msgSend(v18, "fpckTaskClass"), "sharedManager");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __68__FPDXPCServicer_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke_280;
    v22[3] = &unk_1E6A73710;
    void v22[4] = self;
    __int16 v19 = &v23;
    id v23 = v13;
    [v14 dumpDatabaseAt:v9 fullDump:v21 writeTo:v10 completionHandler:v22];
  }
  else
  {
    __int16 v19 = &v28;
    uint64_t v20 = FPNotPermittedError();
    v25((uint64_t)v15, v20);

    uint64_t v18 = v14;
  }
}

void __68__FPDXPCServicer_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer dumpDatabaseAt:fullDump:writeTo:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __68__FPDXPCServicer_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke_280(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer dumpDatabaseAt:fullDump:writeTo:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)calculateNonPurgeableSpaceUsageOfDomain:(id)a3 completionHandler:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v44[0] = *MEMORY[0x1E4F25E48];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  uint64_t v30 = __76__FPDXPCServicer_calculateNonPurgeableSpaceUsageOfDomain_completionHandler___block_invoke;
  __int16 v31 = &unk_1E6A73710;
  uint64_t v32 = self;
  id v9 = v7;
  id v33 = v9;
  id v10 = v8;
  uint64_t v11 = v29;
  __int16 v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    __int16 v14 = [(FPDXPCServicer *)self server];
    id v15 = [v14 extensionManager];
    uint64_t v16 = [v15 domainWithID:v6 reason:0];

    if (v16)
    {
      uint64_t v27 = fpfs_adopt_log();
      char v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = FPPopLogSectionForBlock();
        uint64_t v24 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "nonEvictableSpace"));
        *(_DWORD *)buf = 134219010;
        uint64_t v35 = v23;
        __int16 v36 = 2112;
        __int16 v37 = self;
        __int16 v38 = 2080;
        __int16 v39 = "-[FPDXPCServicer calculateNonPurgeableSpaceUsageOfDomain:completionHandler:]";
        __int16 v40 = 2112;
        uint64_t v41 = v24;
        __int16 v42 = 2112;
        id v43 = 0;
        _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
      }
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "nonEvictableSpace"));
      (*((void (**)(id, void *, void))v9 + 2))(v9, v18, 0);

      __fp_pop_log();
    }
    else
    {
      uint64_t v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = (uint64_t)v6;
        _os_log_impl(&dword_1D744C000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] No domain found with identifier %@", buf, 0xCu);
      }

      id v28 = fpfs_adopt_log();
      BOOL v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = FPPopLogSectionForBlock();
        uint64_t v26 = FPDomainUnavailableError();
        *(_DWORD *)buf = 134219010;
        uint64_t v35 = v25;
        __int16 v36 = 2112;
        __int16 v37 = self;
        __int16 v38 = 2080;
        __int16 v39 = "-[FPDXPCServicer calculateNonPurgeableSpaceUsageOfDomain:completionHandler:]";
        __int16 v40 = 2112;
        uint64_t v41 = 0;
        __int16 v42 = 2112;
        id v43 = v26;
        _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
      }
      uint64_t v22 = FPDomainUnavailableError();
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v22);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v19 = FPNotPermittedError();
    v30((uint64_t)v11, v19);
  }
}

void __76__FPDXPCServicer_calculateNonPurgeableSpaceUsageOfDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer calculateNonPurgeableSpaceUsageOfDomain:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)accumulatedSizeOfPinnedItemsInDomain:(id)a3 completion:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v43[0] = *MEMORY[0x1E4F25E48];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  __int16 v29 = __66__FPDXPCServicer_accumulatedSizeOfPinnedItemsInDomain_completion___block_invoke;
  uint64_t v30 = &unk_1E6A73710;
  __int16 v31 = self;
  id v9 = v7;
  id v32 = v9;
  id v10 = v8;
  uint64_t v11 = v28;
  __int16 v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    __int16 v14 = [(FPDXPCServicer *)self server];
    uint64_t v15 = [v14 extensionManager];
    __int16 v16 = [v15 domainWithID:v6 reason:0];

    if (v16)
    {
      uint64_t v26 = fpfs_adopt_log();
      id v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = FPPopLogSectionForBlock();
        uint64_t v23 = [v16 accumulatedSizeOfPinnedItems];
        *(_DWORD *)buf = 134219010;
        uint64_t v34 = v22;
        __int16 v35 = 2112;
        __int16 v36 = self;
        __int16 v37 = 2080;
        __int16 v38 = "-[FPDXPCServicer accumulatedSizeOfPinnedItemsInDomain:completion:]";
        __int16 v39 = 2048;
        uint64_t v40 = v23;
        __int16 v41 = 2112;
        __int16 v42 = 0;
        _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu %@", buf, 0x34u);
      }

      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, [v16 accumulatedSizeOfPinnedItems], 0);
      __fp_pop_log();
    }
    else
    {
      __int16 v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = (uint64_t)v6;
        _os_log_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] No domain found with identifier %@", buf, 0xCu);
      }

      uint64_t v27 = fpfs_adopt_log();
      uint64_t v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = FPPopLogSectionForBlock();
        uint64_t v25 = FPDomainUnavailableError();
        *(_DWORD *)buf = 134219010;
        uint64_t v34 = v24;
        __int16 v35 = 2112;
        __int16 v36 = self;
        __int16 v37 = 2080;
        __int16 v38 = "-[FPDXPCServicer accumulatedSizeOfPinnedItemsInDomain:completion:]";
        __int16 v39 = 2048;
        uint64_t v40 = 0;
        __int16 v41 = 2112;
        __int16 v42 = v25;
        _os_log_debug_impl(&dword_1D744C000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu %@", buf, 0x34u);
      }
      BOOL v21 = FPDomainUnavailableError();
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v21);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v18 = FPNotPermittedError();
    v29((uint64_t)v11, v18);
  }
}

void __66__FPDXPCServicer_accumulatedSizeOfPinnedItemsInDomain_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer accumulatedSizeOfPinnedItemsInDomain:completion:]_block_invoke";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)accumulatedSizeOfItemsInDomain:(id)a3 completion:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v48[0] = *MEMORY[0x1E4F25E28];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  uint64_t v34 = __60__FPDXPCServicer_accumulatedSizeOfItemsInDomain_completion___block_invoke;
  __int16 v35 = &unk_1E6A73710;
  __int16 v36 = self;
  id v9 = v7;
  id v37 = v9;
  id v10 = v8;
  uint64_t v11 = v33;
  __int16 v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    __int16 v14 = [(FPDXPCServicer *)self server];
    uint64_t v15 = [v14 extensionManager];
    __int16 v16 = [v15 domainWithID:v6 reason:0];

    if (v16)
    {
      id v17 = [v16 accumulatedSizeOfItems];
      if (v17)
      {
        uint64_t v30 = fpfs_adopt_log();
        uint64_t v18 = fp_current_or_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v25 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          uint64_t v39 = v25;
          __int16 v40 = 2112;
          __int16 v41 = self;
          __int16 v42 = 2080;
          id v43 = "-[FPDXPCServicer accumulatedSizeOfItemsInDomain:completion:]";
          __int16 v44 = 2112;
          id v45 = v17;
          __int16 v46 = 2112;
          id v47 = 0;
          _os_log_debug_impl(&dword_1D744C000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
        }

        (*((void (**)(id, void *, void))v9 + 2))(v9, v17, 0);
        __fp_pop_log();
      }
      else
      {
        id v32 = fpfs_adopt_log();
        uint64_t v23 = fp_current_or_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = FPPopLogSectionForBlock();
          __int16 v29 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v39 = v28;
          __int16 v40 = 2112;
          __int16 v41 = self;
          __int16 v42 = 2080;
          id v43 = "-[FPDXPCServicer accumulatedSizeOfItemsInDomain:completion:]";
          __int16 v44 = 2112;
          id v45 = 0;
          __int16 v46 = 2112;
          id v47 = v29;
          _os_log_debug_impl(&dword_1D744C000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
        }
        uint64_t v24 = FPNotSupportedError();
        (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v24);

        __fp_pop_log();
      }
    }
    else
    {
      uint64_t v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = (uint64_t)v6;
        _os_log_impl(&dword_1D744C000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] No domain found with identifier %@", buf, 0xCu);
      }

      __int16 v31 = fpfs_adopt_log();
      BOOL v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = FPPopLogSectionForBlock();
        uint64_t v27 = FPDomainUnavailableError();
        *(_DWORD *)buf = 134219010;
        uint64_t v39 = v26;
        __int16 v40 = 2112;
        __int16 v41 = self;
        __int16 v42 = 2080;
        id v43 = "-[FPDXPCServicer accumulatedSizeOfItemsInDomain:completion:]";
        __int16 v44 = 2112;
        id v45 = 0;
        __int16 v46 = 2112;
        id v47 = v27;
        _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
      }
      uint64_t v22 = FPDomainUnavailableError();
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v22);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v19 = FPNotPermittedError();
    v34((uint64_t)v11, v19);
  }
}

void __60__FPDXPCServicer_accumulatedSizeOfItemsInDomain_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer accumulatedSizeOfItemsInDomain:completion:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)setAlternateContentsURL:(id)a3 onDocumentURL:(id)a4 completionHandler:(id)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void *))a5;
  if (v9)
  {
    uint64_t v5 = [v9 url];
    if (![(FPDXPCServicer *)self clientHasSandboxAccessToFile:v5])
    {
      BOOL v12 = [(FPDXPCServicer *)self _isNonSandboxedConnection];

      if (!v12) {
        goto LABEL_19;
      }
      goto LABEL_14;
    }
  }
  if ([(FPDXPCServicer *)self clientHasSandboxAccessToFile:v10])
  {
    char v13 = [(FPDXPCServicer *)self connection];
    v51[0] = *MEMORY[0x1E4F25E10];
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    if (objc_msgSend(v13, "fp_hasOneOfEntitlements:", v14))
    {

      if (v9) {
      goto LABEL_14;
      }
    }
    BOOL v15 = [(FPDXPCServicer *)self _isNonSandboxedConnection];

    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v15 = [(FPDXPCServicer *)self _isNonSandboxedConnection];
  if (v9) {
LABEL_12:
  }

LABEL_13:
  if (!v15)
  {
LABEL_19:
    uint64_t v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:].cold.4();
    }

    fpfs_adopt_log();
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = FPPopLogSectionForBlock();
      uint64_t v34 = FPNotPermittedWriteError();
      *(_DWORD *)buf = 134218754;
      uint64_t v44 = v33;
      __int16 v45 = 2112;
      __int16 v46 = self;
      __int16 v47 = 2080;
      __int16 v48 = "-[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]";
      __int16 v49 = 2112;
      id v50 = v34;
      _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v28 = FPNotPermittedWriteError();
    v11[2](v11, v28);

    __fp_pop_log();
    goto LABEL_33;
  }
LABEL_14:
  __int16 v16 = [(FPDXPCServicer *)self server];
  id v17 = [v16 extensionManager];
  uint64_t v18 = [v17 domainForURL:v10 reason:0];

  if (v18)
  {
    __int16 v19 = [v18 defaultBackend];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      BOOL v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:](v21, v22, v23);
      }

      uint64_t v24 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
      uint64_t v25 = [v18 defaultBackend];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      void v37[2] = __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke;
      v37[3] = &unk_1E6A75B40;
      id v38 = v10;
      uint64_t v39 = self;
      __int16 v41 = v11;
      id v40 = v9;
      [v25 setAlternateContentsURLWrapper:v40 forDocumentWithURL:v38 request:v24 completionHandler:v37];
    }
    else
    {
      fpfs_adopt_log();
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = FPPopLogSectionForBlock();
        __int16 v36 = FPNotSupportedError();
        *(_DWORD *)buf = 134218754;
        uint64_t v44 = v35;
        __int16 v45 = 2112;
        __int16 v46 = self;
        __int16 v47 = 2080;
        __int16 v48 = "-[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]";
        __int16 v49 = 2112;
        id v50 = v36;
        _os_log_debug_impl(&dword_1D744C000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      id v32 = FPNotSupportedError();
      v11[2](v11, v32);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v29 = fp_current_or_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:](v10);
    }

    fpfs_adopt_log();
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]();
    }

    v11[2](v11, 0);
    __fp_pop_log();
  }
LABEL_33:
}

void __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    BOOL v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke_cold_2();
    }

    id v17 = fpfs_adopt_log();
    char v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = FPPopLogSectionForBlock();
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      uint64_t v23 = "-[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) server];
    id v9 = [v8 extensionManager];
    id v10 = [*(id *)(a1 + 48) url];
    [v9 setAlternateContentsURL:v10 forItemID:v5];

    __int16 v16 = fpfs_adopt_log();
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
}

- (void)fetchAlternateContentsURLForDocumentURL:(id)a3 completionHandler:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FPDXPCServicer *)self connection];
  if (objc_msgSend(v8, "fp_hasSandboxAccessToFile:accessType:logLevel:", v6, *MEMORY[0x1E4F25900], 0))
  {
    id v9 = [(FPDXPCServicer *)self connection];
    v38[0] = *MEMORY[0x1E4F25E10];
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    if (objc_msgSend(v9, "fp_hasOneOfEntitlements:", v10))
    {

LABEL_5:
      BOOL v12 = [(FPDXPCServicer *)self server];
      char v13 = [v12 extensionManager];
      uint64_t v14 = [v13 domainForURL:v6 reason:0];

      if (v14)
      {
        uint64_t v15 = [v14 defaultBackend];
        __int16 v16 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __76__FPDXPCServicer_fetchAlternateContentsURLForDocumentURL_completionHandler___block_invoke;
        v25[3] = &unk_1E6A73BE0;
        v25[4] = self;
        id v26 = v7;
        [v15 itemIDForURL:v6 requireProviderItemID:0 request:v16 completionHandler:v25];
      }
      else
      {
        uint64_t v21 = fp_current_or_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:](v6);
        }

        fpfs_adopt_log();
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v22 = fp_current_or_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          FPPopLogSectionForBlock();
          -[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:]();
        }

        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
        __fp_pop_log();
      }
      goto LABEL_19;
    }
    BOOL v17 = [(FPDXPCServicer *)self _isNonSandboxedConnection];

    if (v17) {
      goto LABEL_5;
    }
  }
  else
  {
    BOOL v11 = [(FPDXPCServicer *)self _isNonSandboxedConnection];

    if (v11) {
      goto LABEL_5;
    }
  }
  uint64_t v18 = fp_current_or_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:]();
  }

  fpfs_adopt_log();
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = FPPopLogSectionForBlock();
    __int16 v24 = FPNotPermittedError();
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v23;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2080;
    uint64_t v33 = "-[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:]";
    __int16 v34 = 2112;
    uint64_t v35 = 0;
    __int16 v36 = 2112;
    id v37 = v24;
    _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  __int16 v20 = FPNotPermittedError();
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v20);

  __fp_pop_log();
LABEL_19:
}

void __76__FPDXPCServicer_fetchAlternateContentsURLForDocumentURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v16 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = FPPopLogSectionForBlock();
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2080;
      uint64_t v23 = "-[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log();
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) server];
    id v9 = [v8 extensionManager];
    id v10 = [v9 alternateContentsURLForItemID:v5];

    BOOL v17 = fpfs_adopt_log();
    BOOL v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = FPPopLogSectionForBlock();
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      uint64_t v23 = "-[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      __int16 v26 = 2112;
      id v27 = 0;
      _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    __fp_pop_log();
  }
}

- (void)didUpdateAlternateContentsDocumentForDocumentAtURL:(id)a3 completionHandler:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FPDXPCServicer *)self connection];
  if (objc_msgSend(v8, "fp_hasSandboxAccessToFile:accessType:logLevel:", v6, *MEMORY[0x1E4F25900], 0))
  {
    id v9 = [(FPDXPCServicer *)self connection];
    v43[0] = *MEMORY[0x1E4F25E10];
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    if (objc_msgSend(v9, "fp_hasOneOfEntitlements:", v10))
    {

LABEL_5:
      uint64_t v12 = [(FPDXPCServicer *)self server];
      uint64_t v13 = [v12 extensionManager];
      uint64_t v14 = [v13 domainForURL:v6 reason:0];

      if (v14)
      {
        uint64_t v15 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
        __int16 v16 = [v14 providerDomainID];
        BOOL v17 = [v14 defaultBackend];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        void v29[2] = __87__FPDXPCServicer_didUpdateAlternateContentsDocumentForDocumentAtURL_completionHandler___block_invoke;
        void v29[3] = &unk_1E6A75B68;
        id v30 = v6;
        id v31 = v16;
        __int16 v32 = self;
        id v33 = v7;
        id v18 = v16;
        [v17 didUpdateAlternateContentsDocumentForDocumentWithURL:v30 request:v15 completionHandler:v29];
      }
      else
      {
        fpfs_adopt_log();
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = fp_current_or_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v27 = FPPopLogSectionForBlock();
          uint64_t v28 = FPProviderNotFoundErrorForURL();
          *(_DWORD *)buf = 134218754;
          uint64_t v36 = v27;
          __int16 v37 = 2112;
          id v38 = self;
          __int16 v39 = 2080;
          id v40 = "-[FPDXPCServicer didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:]";
          __int16 v41 = 2112;
          id v42 = v28;
          _os_log_debug_impl(&dword_1D744C000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
        }
        __int16 v24 = FPProviderNotFoundErrorForURL();
        (*((void (**)(id, void *))v7 + 2))(v7, v24);

        __fp_pop_log();
      }

      goto LABEL_17;
    }
    BOOL v19 = [(FPDXPCServicer *)self _isNonSandboxedConnection];

    if (v19) {
      goto LABEL_5;
    }
  }
  else
  {
    BOOL v11 = [(FPDXPCServicer *)self _isNonSandboxedConnection];

    if (v11) {
      goto LABEL_5;
    }
  }
  __int16 v20 = fp_current_or_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[FPDXPCServicer didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:]();
  }

  fpfs_adopt_log();
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = fp_current_or_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = FPPopLogSectionForBlock();
    __int16 v26 = FPNotPermittedError();
    *(_DWORD *)buf = 134218754;
    uint64_t v36 = v25;
    __int16 v37 = 2112;
    id v38 = self;
    __int16 v39 = 2080;
    id v40 = "-[FPDXPCServicer didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:]";
    __int16 v41 = 2112;
    id v42 = v26;
    _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }
  __int16 v22 = FPNotPermittedError();
  (*((void (**)(id, void *))v7 + 2))(v7, v22);

  __fp_pop_log();
LABEL_17:
}

void __87__FPDXPCServicer_didUpdateAlternateContentsDocumentForDocumentAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__FPDXPCServicer_didUpdateAlternateContentsDocumentForDocumentAtURL_completionHandler___block_invoke_cold_1(a1, v3);
    }
  }
  uint64_t v8 = fpfs_adopt_log();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    uint64_t v14 = "-[FPDXPCServicer didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  __fp_pop_log();
}

- (void)appHasNonUploadedFiles:(id)a3 completionHandler:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27[0] = *MEMORY[0x1E4F25E28];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  uint64_t v23 = __59__FPDXPCServicer_appHasNonUploadedFiles_completionHandler___block_invoke;
  __int16 v24 = &unk_1E6A73710;
  uint64_t v25 = self;
  id v9 = v7;
  id v26 = v9;
  id v10 = v8;
  __int16 v11 = v22;
  uint64_t v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    uint64_t v14 = [(FPDXPCServicer *)self server];
    __int16 v15 = [v14 extensionManager];
    id v16 = [v15 domainsForAppBundleIdentifier:v6];

    if ([v16 count])
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __59__FPDXPCServicer_appHasNonUploadedFiles_completionHandler___block_invoke_285;
      v19[3] = &unk_1E6A75B90;
      void v19[4] = self;
      id v20 = v9;
      hasNonUploadedFiles(v16, v19);
    }
    else
    {
      fpfs_adopt_log();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = fp_current_or_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock();
        -[FPDXPCServicer appHasNonUploadedFiles:completionHandler:]();
      }

      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v17 = FPNotPermittedError();
    v23((uint64_t)v11, v17);
  }
}

void __59__FPDXPCServicer_appHasNonUploadedFiles_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v10 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = FPPopLogSectionForBlock();
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = FPNotPermittedError();
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    id v16 = "-[FPDXPCServicer appHasNonUploadedFiles:completionHandler:]_block_invoke";
    __int16 v17 = 1024;
    int v18 = 0;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = FPNotPermittedError();
  (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);

  __fp_pop_log();
}

void __59__FPDXPCServicer_appHasNonUploadedFiles_completionHandler___block_invoke_285(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v9 = fpfs_adopt_log();
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = FPPopLogSectionForBlock();
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2080;
    __int16 v15 = "-[FPDXPCServicer appHasNonUploadedFiles:completionHandler:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)dumpProviders:(id)a3 dumper:(id)a4 auditToken:(id *)a5 request:(id)a6 providerFilter:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if ([v15 count])
  {
    __int16 v22 = [v15 firstObject];
    [v15 removeObjectAtIndex:0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __99__FPDXPCServicer_dumpProviders_dumper_auditToken_request_providerFilter_options_completionHandler___block_invoke;
    v24[3] = &unk_1E6A75BB8;
    v24[4] = self;
    id v25 = v15;
    id v26 = v16;
    long long v20 = *(_OWORD *)&a5->var0[4];
    long long v31 = *(_OWORD *)a5->var0;
    long long v32 = v20;
    id v27 = v17;
    id v28 = v18;
    unint64_t v30 = a8;
    id v29 = v19;
    long long v21 = *(_OWORD *)&a5->var0[4];
    v23[0] = *(_OWORD *)a5->var0;
    v23[1] = v21;
    [v22 dumpStateTo:v26 auditToken:v23 request:v27 providerFilter:v28 options:a8 completionHandler:v24];
  }
  else
  {
    (*((void (**)(id, void))v19 + 2))(v19, 0);
  }
}

uint64_t __99__FPDXPCServicer_dumpProviders_dumper_auditToken_request_providerFilter_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 104);
  v10[0] = *(_OWORD *)(a1 + 88);
  v10[1] = v8;
  return [v2 dumpProviders:v1 dumper:v3 auditToken:v10 request:v4 providerFilter:v7 options:v5 completionHandler:v6];
}

- (void)dumpStateTo:(id)a3 providerFilter:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v57 = a4;
  id v10 = a6;
  v74[0] = *MEMORY[0x1E4F25E20];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  id v67 = __71__FPDXPCServicer_dumpStateTo_providerFilter_options_completionHandler___block_invoke;
  uint64_t v68 = &unk_1E6A73710;
  __int16 v69 = self;
  id v12 = v10;
  id v70 = v12;
  id v13 = v11;
  __int16 v14 = v66;
  id v15 = [(FPDXPCServicer *)self connection];
  char v16 = objc_msgSend(v15, "fp_hasOneOfEntitlements:", v13);

  if (v16)
  {

    if (v9)
    {
      id v17 = [(FPDXPCServicer *)self connection];
      id v55 = +[FPDRequest requestForXPCConnection:v17];

      id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F25CD0]), "initWithFd:forceColor:", objc_msgSend(v9, "fileDescriptor"), 1);
      id v19 = [MEMORY[0x1E4F1C9C8] date];
      id v20 = [v19 description];
      uint64_t v21 = [v20 UTF8String];
      __int16 v22 = [MEMORY[0x1E4F1C9C8] now];
      [v22 timeIntervalSinceReferenceDate];
      [v18 write:@"Date/Time:         %s, (%f)\n", v21, v23];

      FPOSVersion();
      id v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "write:", @"OS Version:        %s\n", objc_msgSend(v24, "UTF8String"));

      FPVersion();
      id v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "write:", @"FP Version:        %s\n", objc_msgSend(v25, "UTF8String"));

      objc_msgSend(v18, "write:", @"uid:               %u\n", geteuid());
      [v18 write:@"\n\n"];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      id v27 = [WeakRetained extensionManager];
      id v28 = [v27 allProviders];
      id v29 = (void *)[v28 mutableCopy];

      if ([v29 count])
      {
        unint64_t v30 = 0;
        unsigned int v31 = 1;
        while (1)
        {
          long long v32 = [v29 objectAtIndexedSubscript:v30];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            break;
          }
          unint64_t v30 = v31++;
          if ([v29 count] <= v30) {
            goto LABEL_15;
          }
        }
        id v38 = [v29 objectAtIndexedSubscript:v30];
        [v29 removeObjectAtIndex:v30];
        [v29 insertObject:v38 atIndex:0];
      }
LABEL_15:
      BOOL v39 = [v57 length] == 0;
      uint64_t v40 = [v29 count];
      if (v39) {
        objc_msgSend(v18, "write:", @"%ld providers\n", v40);
      }
      else {
        [v18 write:@"%ld providers, filtered by '%@'\n", v40, v57];
      }
      __int16 v41 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
      uint64_t v65 = 0;
      id v42 = FPGetImportCookieForURL();
      unint64_t v43 = (unint64_t)0;

      uint64_t v44 = [v42 entries];
      BOOL v45 = ([v44 count] | v43) != 0;

      if (v45)
      {
        uint64_t v46 = [v42 description];
        __int16 v47 = (void *)v46;
        if (v46)
        {
          [v18 write:@"Import Cookie: %@\n", v46];
        }
        else
        {
          __int16 v48 = [(id)v43 localizedDescription];
          [v18 write:@"Import Cookie: %@\n", v48];
        }
      }
      memset(buf, 0, sizeof(buf));
      __int16 v49 = [(FPDXPCServicer *)self connection];
      id v50 = v49;
      if (v49) {
        [v49 auditToken];
      }
      else {
        memset(buf, 0, sizeof(buf));
      }

      id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v51 addObjectsFromArray:v29];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __71__FPDXPCServicer_dumpStateTo_providerFilter_options_completionHandler___block_invoke_317;
      v59[3] = &unk_1E6A74B48;
      id v60 = v9;
      uint64_t v61 = self;
      id v62 = v18;
      id v63 = v57;
      id v64 = v12;
      v58[0] = *(_OWORD *)buf;
      v58[1] = *(_OWORD *)&buf[16];
      id v52 = v18;
      [(FPDXPCServicer *)self dumpProviders:v51 dumper:v52 auditToken:v58 request:v55 providerFilter:v63 options:a5 completionHandler:v59];
    }
    else
    {
      uint64_t v35 = fp_current_or_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[FPDXPCServicer dumpStateTo:providerFilter:options:completionHandler:]();
      }

      *(void *)&v58[0] = fpfs_adopt_log();
      uint64_t v36 = fp_current_or_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v53 = FPPopLogSectionForBlock();
        __int16 v54 = FPInvalidParameterError();
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v53;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&unsigned char buf[24] = "-[FPDXPCServicer dumpStateTo:providerFilter:options:completionHandler:]";
        __int16 v72 = 2112;
        __int16 v73 = v54;
        _os_log_debug_impl(&dword_1D744C000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      __int16 v37 = FPInvalidParameterError();
      (*((void (**)(id, void *))v12 + 2))(v12, v37);

      __fp_pop_log();
    }
  }
  else
  {
    id v34 = FPNotPermittedError();
    v67((uint64_t)v14, v34);
  }
}

void __71__FPDXPCServicer_dumpStateTo_providerFilter_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer dumpStateTo:providerFilter:options:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __71__FPDXPCServicer_dumpStateTo_providerFilter_options_completionHandler___block_invoke_317(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  uint64_t v5 = [WeakRetained operationEngine];
  [v5 dumpStateTo:*(void *)(a1 + 48)];

  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  uint64_t v7 = [v6 appMonitor];
  [v7 dumpStateTo:*(void *)(a1 + 48)];

  if (![*(id *)(a1 + 56) length])
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    uint64_t v9 = [v8 volumeManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__FPDXPCServicer_dumpStateTo_providerFilter_options_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6A73508;
    id v15 = *(id *)(a1 + 48);
    [v9 enumerateLibrariesWithBlock:v14];
  }
  id v13 = fpfs_adopt_log();
  __int16 v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = FPPopLogSectionForBlock();
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2080;
    uint64_t v21 = "-[FPDXPCServicer dumpStateTo:providerFilter:options:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  __fp_pop_log();
}

uint64_t __71__FPDXPCServicer_dumpStateTo_providerFilter_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLibraryConfigured])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 root];
    id v6 = objc_msgSend(v5, "fp_prettyPath");
    [v4 write:@"== Volume: %@ ==\n", v6];

    +[FPDProvider dumpXattrsForSyncRootDirectoryOfVolume:v3 dumper:*(void *)(a1 + 32)];
    +[FPDProvider dumpXattrsForSystemDirectoryOfVolume:v3 dumper:*(void *)(a1 + 32)];
  }

  return 1;
}

- (void)dumpPlistTelemetryForProviders:(id)a3 result:(id)a4 providerFilter:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    __int16 v14 = [v10 firstObject];
    [v10 removeObjectAtIndex:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __89__FPDXPCServicer_dumpPlistTelemetryForProviders_result_providerFilter_completionHandler___block_invoke;
    v16[3] = &unk_1E6A75BE0;
    id v17 = v11;
    id v18 = v14;
    uint64_t v19 = self;
    id v20 = v10;
    id v21 = v12;
    id v22 = v13;
    id v15 = v14;
    [v15 fetchTelemetryReportWithProviderFilter:v21 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, id, void))v13 + 2))(v13, v11, 0);
  }
}

void __89__FPDXPCServicer_dumpPlistTelemetryForProviders_result_providerFilter_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  if (v6) {
    id v5 = v6;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }
  [v3 setObject:v5 forKeyedSubscript:v4];

  [*(id *)(a1 + 48) dumpPlistTelemetryForProviders:*(void *)(a1 + 56) result:*(void *)(a1 + 32) providerFilter:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

- (void)dumpTelemetryTo:(id)a3 providerFilter:(id)a4 completionHandler:(id)a5
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  id v9 = a5;
  v55[0] = *MEMORY[0x1E4F25E20];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  unint64_t v43 = __67__FPDXPCServicer_dumpTelemetryTo_providerFilter_completionHandler___block_invoke;
  uint64_t v44 = &unk_1E6A73710;
  BOOL v45 = self;
  id v11 = v9;
  id v46 = v11;
  id v12 = v10;
  id v13 = v42;
  __int16 v14 = [(FPDXPCServicer *)self connection];
  char v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if (v15)
  {

    if (v8)
    {
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F25CD0]), "initWithFd:forceColor:", objc_msgSend(v8, "fileDescriptor"), 1);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      id v18 = [WeakRetained extensionManager];
      uint64_t v19 = [v18 allProviders];
      id v20 = (void *)[v19 mutableCopy];

      if ([v20 count])
      {
        unint64_t v21 = 0;
        unsigned int v22 = 1;
        while (1)
        {
          id v23 = objc_msgSend(v20, "objectAtIndexedSubscript:", v21, v35);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            break;
          }
          unint64_t v21 = v22++;
          if ([v20 count] <= v21) {
            goto LABEL_15;
          }
        }
        id v29 = [v20 objectAtIndexedSubscript:v21];
        [v20 removeObjectAtIndex:v21];
        [v20 insertObject:v29 atIndex:0];
      }
LABEL_15:
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v30 addObjectsFromArray:v20];
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      void v36[2] = __67__FPDXPCServicer_dumpTelemetryTo_providerFilter_completionHandler___block_invoke_323;
      v36[3] = &unk_1E6A75C08;
      id v37 = v8;
      id v38 = v16;
      BOOL v39 = self;
      id v40 = v11;
      id v32 = v16;
      [(FPDXPCServicer *)self dumpPlistTelemetryForProviders:v30 result:v31 providerFilter:v35 completionHandler:v36];
    }
    else
    {
      id v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[FPDXPCServicer dumpStateTo:providerFilter:options:completionHandler:]();
      }

      fpfs_adopt_log();
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = FPPopLogSectionForBlock();
        id v34 = FPInvalidParameterError();
        *(_DWORD *)buf = 134218754;
        uint64_t v48 = v33;
        __int16 v49 = 2112;
        id v50 = self;
        __int16 v51 = 2080;
        id v52 = "-[FPDXPCServicer dumpTelemetryTo:providerFilter:completionHandler:]";
        __int16 v53 = 2112;
        __int16 v54 = v34;
        _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      id v28 = FPInvalidParameterError();
      (*((void (**)(id, void *))v11 + 2))(v11, v28);

      __fp_pop_log();
    }
  }
  else
  {
    id v25 = FPNotPermittedError();
    v43((uint64_t)v13, v25);
  }
}

void __67__FPDXPCServicer_dumpTelemetryTo_providerFilter_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer dumpTelemetryTo:providerFilter:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __67__FPDXPCServicer_dumpTelemetryTo_providerFilter_completionHandler___block_invoke_323(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v14 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:1 error:&v14];
  id v8 = v14;
  uint64_t v9 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  [*(id *)(a1 + 40) put:v9];
  id v13 = fpfs_adopt_log();
  __int16 v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = FPPopLogSectionForBlock();
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2080;
    id v20 = "-[FPDXPCServicer dumpTelemetryTo:providerFilter:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  __fp_pop_log();
}

- (void)getPersonaForProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v23 = self;
  uint64_t v24 = (void (**)(id, void *, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v8 = [WeakRetained extensionManager];
  uint64_t v9 = [v8 allProviders];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v16 = [v15 identifier];
        __int16 v17 = [v16 description];
        int v18 = [v17 isEqualToString:v6];

        if (v18)
        {
          __int16 v19 = [v15 descriptor];
          uint64_t v20 = [v19 personaIdentifier];

          uint64_t v11 = (void *)v20;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v40 count:16];
    }
    while (v12);
  }

  id v25 = fpfs_adopt_log();
  __int16 v21 = fp_current_or_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = FPPopLogSectionForBlock();
    *(_DWORD *)buf = 134219010;
    uint64_t v31 = v22;
    __int16 v32 = 2112;
    uint64_t v33 = v23;
    __int16 v34 = 2080;
    id v35 = "-[FPDXPCServicer getPersonaForProvider:completionHandler:]";
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    uint64_t v39 = 0;
    _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  v24[2](v24, v11, 0);
  __fp_pop_log();
}

- (void)createDatabaseCopyOutputPathForDomain:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isUsingFPFS])
  {
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_secureTempDirectory");
    id v10 = [(id)v9 path];
    uint64_t v11 = [v5 providerDomainID];
    uint64_t v12 = [v10 stringByAppendingPathComponent:v11];
    id v13 = [v8 fileURLWithPath:v12];

    id v29 = 0;
    LOBYTE(v9) = [v7 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v29];
    id v14 = v29;
    if (v9)
    {
      id v15 = NSString;
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
      [v16 timeIntervalSince1970];
      int v18 = objc_msgSend(v15, "stringWithFormat:", @"database-%f", v17);

      __int16 v19 = [v18 stringByReplacingOccurrencesOfString:@"." withString:@"-"];

      uint64_t v20 = [v19 stringByAppendingString:@".db"];

      __int16 v21 = [v13 URLByAppendingPathComponent:v20];

      uint64_t v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer createDatabaseCopyOutputPathForDomain:completionHandler:]();
      }

      uint64_t v23 = [v5 defaultBackend];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke;
      v25[3] = &unk_1E6A73968;
      id v26 = v5;
      id v28 = v6;
      id v13 = v21;
      id v27 = v13;
      [v23 copyDatabaseToURL:v13 completionHandler:v25];
    }
    else
    {
      uint64_t v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[FPDXPCServicer createDatabaseCopyOutputPathForDomain:completionHandler:]();
      }

      (*((void (**)(id, void, id))v6 + 2))(v6, 0, v14);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke_cold_1(a1);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 40) path];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
}

- (void)copyDatabaseForFPCKStartingAtPath:(id)a3 completionHandler:(id)a4
{
  v76[2] = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F25E30];
  v76[0] = *MEMORY[0x1E4F25E20];
  v76[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  id v70 = __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke;
  __int16 v71 = &unk_1E6A73710;
  __int16 v72 = self;
  id v36 = v5;
  id v73 = v36;
  id v8 = v7;
  uint64_t v9 = v69;
  id v10 = [(FPDXPCServicer *)self connection];
  char v11 = objc_msgSend(v10, "fp_hasOneOfEntitlements:", v8);

  if (v11)
  {

    uint64_t v12 = dispatch_group_create();
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = __Block_byref_object_copy__10;
    v67[4] = __Block_byref_object_dispose__10;
    id v68 = 0;
    id v68 = (id)objc_opt_new();
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3032000000;
    v65[3] = __Block_byref_object_copy__10;
    uint8_t v65[4] = __Block_byref_object_dispose__10;
    id v66 = 0;
    if (v37)
    {
      id v13 = [(FPDXPCServicer *)self server];
      id v14 = [v13 extensionManager];
      id v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v37];
      uint64_t v16 = [v14 domainForURL:v15 reason:0];

      dispatch_group_enter(v12);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_337;
      v60[3] = &unk_1E6A75C30;
      uint64_t v61 = v12;
      id v63 = v65;
      id v64 = v67;
      uint64_t v17 = v16;
      id v62 = v17;
      [(FPDXPCServicer *)self createDatabaseCopyOutputPathForDomain:v17 completionHandler:v60];

      int v18 = v61;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      __int16 v21 = objc_msgSend(WeakRetained, "extensionManager", v36);
      uint64_t v22 = [v21 allProviders];
      uint64_t v23 = (void *)[v22 mutableCopy];

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      int v18 = v23;
      uint64_t v24 = [v18 countByEnumeratingWithState:&v56 objects:v75 count:16];
      if (v24)
      {
        uint64_t v38 = *(void *)v57;
        do
        {
          uint64_t v25 = 0;
          uint64_t v39 = v24;
          do
          {
            if (*(void *)v57 != v38) {
              objc_enumerationMutation(v18);
            }
            id v26 = *(id *)(*((void *)&v56 + 1) + 8 * v25);
            objc_sync_enter(v26);
            id v27 = [v26 domainsByID];
            id v28 = [v27 allValues];
            uint64_t v41 = (void *)[v28 copy];
            uint64_t v40 = v25;

            objc_sync_exit(v26);
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v29 = v41;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v74 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v53;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v53 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                  dispatch_group_enter(v12);
                  v47[0] = MEMORY[0x1E4F143A8];
                  v47[1] = 3221225472;
                  v47[2] = __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_2;
                  v47[3] = &unk_1E6A75C30;
                  __int16 v34 = v12;
                  id v50 = v65;
                  __int16 v51 = v67;
                  uint64_t v48 = v34;
                  uint64_t v49 = v33;
                  [(FPDXPCServicer *)self createDatabaseCopyOutputPathForDomain:v33 completionHandler:v47];
                }
                uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v74 count:16];
              }
              while (v30);
            }

            uint64_t v25 = v40 + 1;
          }
          while (v40 + 1 != v39);
          uint64_t v24 = [v18 countByEnumeratingWithState:&v56 objects:v75 count:16];
        }
        while (v24);
      }
      uint64_t v17 = v18;
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_3;
    block[3] = &unk_1E6A75C58;
    BOOL v45 = v65;
    void block[4] = self;
    id v44 = v36;
    id v46 = v67;
    dispatch_group_notify(v12, queue, block);

    _Block_object_dispose(v65, 8);
    _Block_object_dispose(v67, 8);
  }
  else
  {
    __int16 v19 = FPNotPermittedError();
    v70((uint64_t)v9, v19);
  }
}

void __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer copyDatabaseForFPCKStartingAtPath:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_337(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = v5;
    uint64_t v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    if (!v13) {
      goto LABEL_6;
    }
    __int16 v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v9 = [*(id *)(a1 + 40) rootURLs];
    uint64_t v11 = [v9 firstObject];
    __int16 v12 = [v11 path];
    [v10 setValue:v13 forKey:v12];
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_sync_exit(v6);
}

void __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = v5;
    uint64_t v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    if (!v13) {
      goto LABEL_6;
    }
    __int16 v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v9 = [*(id *)(a1 + 40) rootURLs];
    uint64_t v11 = [v9 firstObject];
    __int16 v12 = [v11 path];
    [v10 setValue:v13 forKeyPath:v12];
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_sync_exit(v6);
}

void __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_3(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    __int16 v19 = fpfs_adopt_log();
    id v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = FPPopLogSectionForBlock();
      uint64_t v11 = a1[4];
      __int16 v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 134219010;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      __int16 v26 = 2080;
      id v27 = "-[FPDXPCServicer copyDatabaseForFPCKStartingAtPath:completionHandler:]_block_invoke_3";
      __int16 v28 = 2112;
      id v29 = 0;
      __int16 v30 = 2112;
      uint64_t v31 = v12;
      _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(a1[5] + 16))();
    __fp_pop_log();
  }
  else if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v20 = fpfs_adopt_log();
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = FPPopLogSectionForBlock();
      uint64_t v14 = a1[4];
      uint64_t v15 = (void *)[*(id *)(*(void *)(a1[7] + 8) + 40) copy];
      *(_DWORD *)buf = 134219010;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      __int16 v26 = 2080;
      id v27 = "-[FPDXPCServicer copyDatabaseForFPCKStartingAtPath:completionHandler:]_block_invoke";
      __int16 v28 = 2112;
      id v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      _os_log_debug_impl(&dword_1D744C000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    uint64_t v4 = a1[5];
    id v5 = (void *)[*(id *)(*(void *)(a1[7] + 8) + 40) copy];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);

    __fp_pop_log();
  }
  else
  {
    __int16 v21 = fpfs_adopt_log();
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = FPPopLogSectionForBlock();
      uint64_t v17 = a1[4];
      uint64_t v7 = *MEMORY[0x1E4F25C50];
      uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F25C50] code:21 userInfo:0];
      *(_DWORD *)buf = 134219010;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      __int16 v26 = 2080;
      id v27 = "-[FPDXPCServicer copyDatabaseForFPCKStartingAtPath:completionHandler:]_block_invoke";
      __int16 v28 = 2112;
      id v29 = 0;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    else
    {
      uint64_t v7 = *MEMORY[0x1E4F25C50];
    }

    uint64_t v8 = a1[5];
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:21 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

    __fp_pop_log();
  }
}

- (void)waitForChangesOnItemsBelowItemWithID:(id)a3 completionHandler:(id)a4
{
  void v54[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E88];
  v54[0] = *MEMORY[0x1E4F25E20];
  v54[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  id v42 = __73__FPDXPCServicer_waitForChangesOnItemsBelowItemWithID_completionHandler___block_invoke;
  unint64_t v43 = &unk_1E6A73710;
  id v44 = self;
  id v10 = v7;
  id v45 = v10;
  id v11 = v9;
  __int16 v12 = v41;
  uint64_t v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    uint64_t v40 = 0;
    uint64_t v15 = [(FPDXPCServicer *)self server];
    uint64_t v16 = [v15 extensionManager];
    uint64_t v17 = [v6 providerDomainID];
    uint64_t v18 = [v16 domainWithID:v17 reason:&v40];

    if (v18)
    {
      __int16 v19 = [v18 defaultBackend];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        __int16 v21 = [v18 defaultBackend];
        uint64_t v22 = [v6 identifier];
        uint64_t v23 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        void v37[2] = __73__FPDXPCServicer_waitForChangesOnItemsBelowItemWithID_completionHandler___block_invoke_340;
        v37[3] = &unk_1E6A73710;
        void v37[4] = self;
        id v38 = v10;
        [v21 waitForChangesOnItemsBelowItemWithIdentifier:v22 request:v23 completionHandler:v37];
      }
      else
      {
        fpfs_adopt_log();
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        id v29 = fp_current_or_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v35 = FPPopLogSectionForBlock();
          id v36 = FPNotSupportedError();
          *(_DWORD *)buf = 134218754;
          uint64_t v47 = v35;
          __int16 v48 = 2112;
          uint64_t v49 = self;
          __int16 v50 = 2080;
          __int16 v51 = "-[FPDXPCServicer waitForChangesOnItemsBelowItemWithID:completionHandler:]";
          __int16 v52 = 2112;
          long long v53 = v36;
          _os_log_debug_impl(&dword_1D744C000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
        }
        __int16 v30 = FPNotSupportedError();
        (*((void (**)(id, void *))v10 + 2))(v10, v30);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = FPPopLogSectionForBlock();
        uint64_t v32 = [v6 providerDomainID];
        uint64_t v33 = objc_msgSend(v32, "fp_toProviderID");
        __int16 v34 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v47 = v31;
        __int16 v48 = 2112;
        uint64_t v49 = self;
        __int16 v50 = 2080;
        __int16 v51 = "-[FPDXPCServicer waitForChangesOnItemsBelowItemWithID:completionHandler:]";
        __int16 v52 = 2112;
        long long v53 = v34;
        _os_log_debug_impl(&dword_1D744C000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      __int16 v26 = [v6 providerDomainID];
      id v27 = objc_msgSend(v26, "fp_toProviderID");
      __int16 v28 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v10 + 2))(v10, v28);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v24 = FPNotPermittedError();
    v42((uint64_t)v12, v24);
  }
}

void __73__FPDXPCServicer_waitForChangesOnItemsBelowItemWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer waitForChangesOnItemsBelowItemWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __73__FPDXPCServicer_waitForChangesOnItemsBelowItemWithID_completionHandler___block_invoke_340(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer waitForChangesOnItemsBelowItemWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)waitForStabilizationOfDomainWithID:(id)a3 completionHandler:(id)a4
{
  void v44[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E88];
  v44[0] = *MEMORY[0x1E4F25E20];
  v44[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  uint64_t v32 = __71__FPDXPCServicer_waitForStabilizationOfDomainWithID_completionHandler___block_invoke;
  uint64_t v33 = &unk_1E6A73710;
  __int16 v34 = self;
  id v10 = v7;
  id v35 = v10;
  id v11 = v9;
  __int16 v12 = v31;
  uint64_t v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    uint64_t v30 = 0;
    id v15 = [(FPDXPCServicer *)self server];
    uint64_t v16 = [v15 extensionManager];
    uint64_t v17 = [v16 domainWithID:v6 reason:&v30];

    if (v17)
    {
      uint64_t v18 = [v17 defaultBackend];
      __int16 v19 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __71__FPDXPCServicer_waitForStabilizationOfDomainWithID_completionHandler___block_invoke_341;
      v27[3] = &unk_1E6A73710;
      v27[4] = self;
      id v28 = v10;
      [v18 waitForStabilizationForRequest:v19 completionHandler:v27];
    }
    else
    {
      fpfs_adopt_log();
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = FPPopLogSectionForBlock();
        uint64_t v25 = objc_msgSend(v6, "fp_toProviderID");
        __int16 v26 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v37 = v24;
        __int16 v38 = 2112;
        id v39 = self;
        __int16 v40 = 2080;
        uint64_t v41 = "-[FPDXPCServicer waitForStabilizationOfDomainWithID:completionHandler:]";
        __int16 v42 = 2112;
        unint64_t v43 = v26;
        _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      uint64_t v22 = objc_msgSend(v6, "fp_toProviderID");
      uint64_t v23 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v10 + 2))(v10, v23);

      __fp_pop_log();
    }
  }
  else
  {
    char v20 = FPNotPermittedError();
    v32((uint64_t)v12, v20);
  }
}

void __71__FPDXPCServicer_waitForStabilizationOfDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer waitForStabilizationOfDomainWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __71__FPDXPCServicer_waitForStabilizationOfDomainWithID_completionHandler___block_invoke_341(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer waitForStabilizationOfDomainWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)spotlightReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x1E4F25E88];
  v29[0] = *MEMORY[0x1E4F25E20];
  v29[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  uint64_t v25 = __88__FPDXPCServicer_spotlightReindexAllItemsForBundleID_protectionClass_completionHandler___block_invoke;
  __int16 v26 = &unk_1E6A73710;
  id v27 = self;
  id v13 = v10;
  id v28 = v13;
  id v14 = v12;
  id v15 = v24;
  uint64_t v16 = [(FPDXPCServicer *)self connection];
  char v17 = objc_msgSend(v16, "fp_hasOneOfEntitlements:", v14);

  if (v17)
  {

    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    __int16 v19 = [WeakRetained spotlightDaemonClient];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __88__FPDXPCServicer_spotlightReindexAllItemsForBundleID_protectionClass_completionHandler___block_invoke_342;
    v22[3] = &unk_1E6A75118;
    id v23 = v13;
    [v19 reindexAllItemsForBundleID:v8 protectionClass:v9 acknowledgementHandler:v22];

    id v20 = v23;
  }
  else
  {
    __int16 v21 = FPNotPermittedError();
    v25((uint64_t)v15, v21);

    id v20 = v28;
  }
}

void __88__FPDXPCServicer_spotlightReindexAllItemsForBundleID_protectionClass_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer spotlightReindexAllItemsForBundleID:protectionClass:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

uint64_t __88__FPDXPCServicer_spotlightReindexAllItemsForBundleID_protectionClass_completionHandler___block_invoke_342(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)spotlightReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6
{
  void v32[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = *MEMORY[0x1E4F25E88];
  v32[0] = *MEMORY[0x1E4F25E20];
  v32[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  id v28 = __98__FPDXPCServicer_spotlightReindexItemsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke;
  id v29 = &unk_1E6A73710;
  uint64_t v30 = self;
  id v16 = v13;
  id v31 = v16;
  id v17 = v15;
  uint64_t v18 = v27;
  __int16 v19 = [(FPDXPCServicer *)self connection];
  char v20 = objc_msgSend(v19, "fp_hasOneOfEntitlements:", v17);

  if (v20)
  {

    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    uint64_t v22 = [WeakRetained spotlightDaemonClient];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __98__FPDXPCServicer_spotlightReindexItemsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_343;
    v25[3] = &unk_1E6A75118;
    id v26 = v16;
    [v22 reindexItemsWithIdentifiers:v10 bundleID:v11 protectionClass:v12 acknowledgementHandler:v25];

    id v23 = v26;
  }
  else
  {
    uint64_t v24 = FPNotPermittedError();
    v28((uint64_t)v18, v24);

    id v23 = v31;
  }
}

void __98__FPDXPCServicer_spotlightReindexItemsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer spotlightReindexItemsWithIdentifiers:bundleID:protectionClass:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

uint64_t __98__FPDXPCServicer_spotlightReindexItemsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_343(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scheduleActionOperationWithInfo:(id)a3 completionHandler:(id)a4
{
  void v28[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  uint64_t v24 = __68__FPDXPCServicer_scheduleActionOperationWithInfo_completionHandler___block_invoke;
  uint64_t v25 = &unk_1E6A73710;
  id v26 = self;
  id v8 = v7;
  id v27 = v8;
  id WeakRetained = v23;
  __int16 v10 = self;
  uint64_t v11 = [(FPDXPCServicer *)v10 connection];
  uint64_t v12 = *MEMORY[0x1E4F25E08];
  v28[0] = *MEMORY[0x1E4F25E00];
  v28[1] = v12;
  void v28[2] = *MEMORY[0x1E4F25E28];
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];

  char v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if (v14)
  {

    id v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer scheduleActionOperationWithInfo:completionHandler:]();
    }

    id WeakRetained = objc_loadWeakRetained((id *)&v10->_server);
    uint64_t v16 = [WeakRetained operationEngine];
    id v17 = [MEMORY[0x1E4F29268] currentConnection];
    uint64_t v18 = +[FPDRequest requestForXPCConnection:v17];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __68__FPDXPCServicer_scheduleActionOperationWithInfo_completionHandler___block_invoke_344;
    v21[3] = &unk_1E6A75C80;
    v21[4] = v10;
    __int16 v19 = &v22;
    id v22 = v8;
    [v16 scheduleActionOperationWithInfo:v6 request:v18 completionHandler:v21];
  }
  else
  {
    __int16 v19 = &v27;
    char v20 = FPNotPermittedError();
    v24((uint64_t)WeakRetained, v20);
  }
}

void __68__FPDXPCServicer_scheduleActionOperationWithInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer scheduleActionOperationWithInfo:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __68__FPDXPCServicer_scheduleActionOperationWithInfo_completionHandler___block_invoke_344(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer scheduleActionOperationWithInfo:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __63__FPDXPCServicer_fetchDaemonOperationIDsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer fetchDaemonOperationIDsWithCompletionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

id __63__FPDXPCServicer_fetchDaemonOperationIDsWithCompletionHandler___block_invoke_346(uint64_t a1, void *a2)
{
  id v2 = [a2 info];
  id v3 = [v2 operationID];

  return v3;
}

- (void)fetchDaemonOperationWithID:(id)a3 completionHandler:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  uint64_t v37 = __63__FPDXPCServicer_fetchDaemonOperationWithID_completionHandler___block_invoke;
  __int16 v38 = &unk_1E6A73710;
  id v39 = self;
  id v30 = v7;
  id v40 = v30;
  uint64_t v8 = v36;
  uint64_t v9 = self;
  __int16 v10 = [(FPDXPCServicer *)v9 connection];
  uint64_t v11 = *MEMORY[0x1E4F25E08];
  *(void *)buf = *MEMORY[0x1E4F25E00];
  *(void *)&buf[8] = v11;
  *(void *)&buf[16] = *MEMORY[0x1E4F25E28];
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

  char v13 = objc_msgSend(v10, "fp_hasOneOfEntitlements:", v12);
  if (v13)
  {

    __int16 v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer fetchDaemonOperationWithID:completionHandler:]();
    }

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_server);
    __int16 v16 = [WeakRetained operationEngine];
    id v17 = [v16 inFlightOperations];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = v17;
    id v19 = (id)[v18 countByEnumeratingWithState:&v32 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v23 = objc_msgSend(v22, "info", v30);
          uint64_t v24 = [v23 operationID];
          int v25 = [v24 isEqualToString:v6];

          if (v25)
          {
            id v19 = v22;
            id v26 = [v19 info];
            goto LABEL_15;
          }
        }
        id v19 = (id)[v18 countByEnumeratingWithState:&v32 objects:v47 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    id v26 = 0;
LABEL_15:

    id v31 = fpfs_adopt_log();
    id v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2080;
      __int16 v42 = "-[FPDXPCServicer fetchDaemonOperationWithID:completionHandler:]";
      __int16 v43 = 2112;
      id v44 = v19;
      __int16 v45 = 2112;
      id v46 = v26;
      _os_log_debug_impl(&dword_1D744C000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, id, void *, void))v30 + 2))(v30, v19, v26, 0);
    __fp_pop_log();
  }
  else
  {
    id v27 = FPNotPermittedError();
    v37((uint64_t)v8, v27);
  }
}

void __63__FPDXPCServicer_fetchDaemonOperationWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer fetchDaemonOperationWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)startAccessingExtensionForProviderDomainID:(id)a3 handler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v28 = 0;
    uint64_t v8 = [(FPDXPCServicer *)self createDomainServicerForProviderDomainID:v6 provider:0 enumerateEntitlementRequired:1 error:&v28];
    id v9 = v28;
    if (v8)
    {
      id v29 = 0;
      __int16 v10 = [v8 domainOrNil:&v29];
      uint64_t v11 = v10;
      if (v10)
      {
        __int16 v12 = [v10 defaultBackend];
        char v13 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        void v24[2] = __69__FPDXPCServicer_startAccessingExtensionForProviderDomainID_handler___block_invoke;
        v24[3] = &unk_1E6A75CC8;
        v24[4] = self;
        id v26 = v7;
        id v25 = v8;
        [v12 fetchVendorEndpointWithRequest:v13 completionHandler:v24];
      }
      else
      {
        fpfs_adopt_log();
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = fp_current_or_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = FPPopLogSectionForBlock();
          id v23 = FPProviderNotFoundError();
          *(_DWORD *)buf = 134219522;
          uint64_t v31 = v22;
          __int16 v32 = 2112;
          long long v33 = self;
          __int16 v34 = 2080;
          long long v35 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]";
          __int16 v36 = 2112;
          uint64_t v37 = 0;
          __int16 v38 = 2112;
          uint64_t v39 = 0;
          __int16 v40 = 2112;
          uint64_t v41 = 0;
          __int16 v42 = 2112;
          id v43 = v23;
          _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
        }
        __int16 v18 = FPProviderNotFoundError();
        (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v18);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219522;
        uint64_t v31 = v21;
        __int16 v32 = 2112;
        long long v33 = self;
        __int16 v34 = 2080;
        long long v35 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]";
        __int16 v36 = 2112;
        uint64_t v37 = 0;
        __int16 v38 = 2112;
        uint64_t v39 = 0;
        __int16 v40 = 2112;
        uint64_t v41 = 0;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_debug_impl(&dword_1D744C000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
      }

      (*((void (**)(id, void, void, void, id))v7 + 2))(v7, 0, 0, 0, v9);
      __fp_pop_log();
    }
  }
  else
  {
    fpfs_adopt_log();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = FPPopLogSectionForBlock();
      uint64_t v20 = FPInvalidParameterError();
      *(_DWORD *)buf = 134219522;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      long long v33 = self;
      __int16 v34 = 2080;
      long long v35 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]";
      __int16 v36 = 2112;
      uint64_t v37 = 0;
      __int16 v38 = 2112;
      uint64_t v39 = 0;
      __int16 v40 = 2112;
      uint64_t v41 = 0;
      __int16 v42 = 2112;
      id v43 = v20;
      _os_log_debug_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
    }
    uint64_t v15 = FPInvalidParameterError();
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v15);

    __fp_pop_log();
  }
}

void __69__FPDXPCServicer_startAccessingExtensionForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 40) startExtendingLifetime];
    __int16 v18 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = FPPopLogSectionForBlock();
      uint64_t v14 = *(void *)(a1 + 32);
      char v13 = *(void **)(a1 + 40);
      uint64_t v15 = [v13 providerDomainID];
      *(_DWORD *)buf = 134219522;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2080;
      id v25 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
    }
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    __int16 v10 = [v8 providerDomainID];
    (*(void (**)(uint64_t, id, void *, void *, id))(v9 + 16))(v9, v5, v8, v10, v6);

    __fp_pop_log();
  }
  else
  {
    uint64_t v19 = fpfs_adopt_log();
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = FPPopLogSectionForBlock();
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219522;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2080;
      id v25 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = 0;
      __int16 v28 = 2112;
      id v29 = 0;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __fp_pop_log();
  }
}

- (void)startAccessingServiceForItemID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F29268] currentConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __67__FPDXPCServicer_startAccessingServiceForItemID_completionHandler___block_invoke;
  v10[3] = &unk_1E6A75D18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(FPDXPCServicer *)self startAccessingServiceWithName:0 itemID:v7 domain:0 connection:v8 enumerateEntitlementRequired:1 completionHandler:v10];
}

void __67__FPDXPCServicer_startAccessingServiceForItemID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v19 = fpfs_adopt_log();
  uint64_t v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = FPPopLogSectionForBlock();
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219778;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    uint64_t v23 = v18;
    __int16 v24 = 2080;
    id v25 = "-[FPDXPCServicer startAccessingServiceForItemID:completionHandler:]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 2112;
    id v35 = v15;
    _os_log_debug_impl(&dword_1D744C000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)startAccessingServiceWithName:(id)a3 itemURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  id v66 = __74__FPDXPCServicer_startAccessingServiceWithName_itemURL_completionHandler___block_invoke;
  id v67 = &unk_1E6A73710;
  id v68 = self;
  id v11 = v10;
  id v69 = v11;
  id v12 = self;
  id v13 = v9;
  id v14 = v65;
  if (!v13)
  {
    uint64_t v36 = FPInvalidParameterError();
LABEL_18:
    uint64_t v37 = (void *)v36;
    v66((uint64_t)v14, (void *)v36);

    goto LABEL_28;
  }
  id v15 = [(FPDXPCServicer *)v12 connection];
  char v16 = objc_msgSend(v15, "fp_hasSandboxAccessToFile:logLevel:", v13, 0);

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = [(FPDXPCServicer *)v12 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v19 = objc_msgSend(v17, "fp_hasOneOfEntitlements:logLevel:", v18, 0);

    if ((v19 & 1) == 0)
    {
      uint64_t v20 = [(FPDXPCServicer *)v12 connection];
      char v21 = objc_msgSend(v20, "fp_isNonSandboxedConnection");

      if ((v21 & 1) == 0)
      {
        uint64_t v36 = FPNotPermittedWriteError();
        goto LABEL_18;
      }
    }
  }

  uint64_t v64 = 0;
  __int16 v22 = [(FPDXPCServicer *)v12 server];
  uint64_t v23 = [v22 extensionManager];
  __int16 v24 = [v23 domainForURL:v13 reason:&v64];

  long long v53 = [MEMORY[0x1E4F29268] currentConnection];
  if ([v8 hasPrefix:@"com.apple.CloudDocs"]
    && ([v24 provider],
        id v25 = objc_claimAutoreleasedReturnValue(),
        [v25 identifier],
        __int16 v26 = objc_claimAutoreleasedReturnValue(),
        char v27 = objc_msgSend(v26, "fp_isiCloudDriveOrCloudDocsIdentifier"),
        v26,
        v25,
        (v27 & 1) == 0))
  {
    fpfs_adopt_log();
    id v63 = (id)objc_claimAutoreleasedReturnValue();
    id v43 = fp_current_or_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v48 = FPPopLogSectionForBlock();
      uint64_t v49 = FPNotSupportedError();
      *(_DWORD *)buf = 134219778;
      *(void *)&uint8_t buf[4] = v48;
      __int16 v72 = 2112;
      id v73 = v12;
      __int16 v74 = 2080;
      __int16 v75 = "-[FPDXPCServicer startAccessingServiceWithName:itemURL:completionHandler:]";
      __int16 v76 = 2112;
      uint64_t v77 = 0;
      __int16 v78 = 2112;
      uint64_t v79 = 0;
      __int16 v80 = 2112;
      uint64_t v81 = 0;
      __int16 v82 = 2112;
      uint64_t v83 = 0;
      __int16 v84 = 2112;
      uint64_t v85 = v49;
      _os_log_debug_impl(&dword_1D744C000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
    }
    uint64_t v44 = FPNotSupportedError();
    (*((void (**)(id, void, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, 0, v44);

    __fp_pop_log();
  }
  else
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    __int16 v28 = [v24 extensionStorageURLs];
    id v29 = [v24 rootURLs];
    __int16 v30 = [v28 arrayByAddingObjectsFromArray:v29];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v60;
      while (2)
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v60 != v32) {
            objc_enumerationMutation(v30);
          }
          if (objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * v33), "fp_relationshipToItemAtURL:", v13) == 1)
          {
            __int16 v38 = (void *)MEMORY[0x1E4F25D30];
            uint64_t v39 = [v24 providerDomainID];
            __int16 v40 = objc_msgSend(v39, "fp_toProviderID");
            uint64_t v41 = [v24 identifier];
            __int16 v42 = [v38 rootItemIDWithProviderIdentifier:v40 domainIdentifier:v41];

            [(FPDXPCServicer *)v12 startAccessingServiceWithName:v8 itemID:v42 domain:v24 connection:v53 enumerateEntitlementRequired:0 completionHandler:v11];
            goto LABEL_27;
          }
          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [v30 countByEnumeratingWithState:&v59 objects:v70 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

    if (v24)
    {
      __int16 v34 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v12 pid]];
      id v35 = [v24 defaultBackend];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      void v54[2] = __74__FPDXPCServicer_startAccessingServiceWithName_itemURL_completionHandler___block_invoke_357;
      v54[3] = &unk_1E6A73DE8;
      v54[4] = v12;
      id v58 = v11;
      id v55 = v8;
      id v56 = v24;
      id v57 = v53;
      [v35 itemIDForURL:v13 requireProviderItemID:0 request:v34 completionHandler:v54];
    }
    else
    {
      fpfs_adopt_log();
      id v63 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v45 = fp_current_or_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v50 = FPPopLogSectionForBlock();
        __int16 v51 = [v13 path];
        __int16 v52 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219778;
        *(void *)&uint8_t buf[4] = v50;
        __int16 v72 = 2112;
        id v73 = v12;
        __int16 v74 = 2080;
        __int16 v75 = "-[FPDXPCServicer startAccessingServiceWithName:itemURL:completionHandler:]";
        __int16 v76 = 2112;
        uint64_t v77 = 0;
        __int16 v78 = 2112;
        uint64_t v79 = 0;
        __int16 v80 = 2112;
        uint64_t v81 = 0;
        __int16 v82 = 2112;
        uint64_t v83 = 0;
        __int16 v84 = 2112;
        uint64_t v85 = v52;
        _os_log_debug_impl(&dword_1D744C000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
      }
      id v46 = [v13 path];
      uint64_t v47 = FPProviderNotFoundError();
      (*((void (**)(id, void, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, 0, v47);

      __fp_pop_log();
    }
  }
LABEL_27:

LABEL_28:
}

void __74__FPDXPCServicer_startAccessingServiceWithName_itemURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219778;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer startAccessingServiceWithName:itemURL:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __74__FPDXPCServicer_startAccessingServiceWithName_itemURL_completionHandler___block_invoke_357(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v11 = fpfs_adopt_log();
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = FPPopLogSectionForBlock();
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219778;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      uint64_t v17 = "-[FPDXPCServicer startAccessingServiceWithName:itemURL:completionHandler:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      __int16 v22 = 2112;
      uint64_t v23 = 0;
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      char v27 = v7;
      _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log();
  }
  else
  {
    [*(id *)(a1 + 32) startAccessingServiceWithName:*(void *)(a1 + 40) itemID:v5 domain:*(void *)(a1 + 48) connection:*(void *)(a1 + 56) enumerateEntitlementRequired:0 completionHandler:*(void *)(a1 + 64)];
  }
}

- (void)_performWithCheckedEnumerationAttributes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
  if (([v6 requireSandboxAccess] & 1) != 0
    || ([v6 enumeratedURL], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer _performWithCheckedEnumerationAttributes:completionHandler:]();
    }

    id v11 = 0;
  }
  else
  {
    uint64_t v17 = [v6 enumeratedItemID];
    __int16 v18 = [v17 providerID];
    v61[0] = 0;
    uint64_t v19 = [(FPDXPCServicer *)self providerForIdentifier:v18 enumerateEntitlementRequired:1 error:v61];
    id v11 = v61[0];

    if (v19)
    {
      int v20 = 0;
      goto LABEL_15;
    }
  }
  __int16 v12 = [v6 searchQuery];
  if (v12)
  {

    goto LABEL_9;
  }
  uint64_t v13 = [v6 enumeratedItemID];
  __int16 v14 = [v13 identifier];
  int v15 = [v14 isEqual:*MEMORY[0x1E4F25CA8]];

  if (v15)
  {
LABEL_9:
    if (v11)
    {
      (*((void (**)(id, void, void, void, id))v7 + 2))(v7, 0, 0, 0, v11);
    }
    else
    {
      __int16 v16 = FPNotPermittedError();
      (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v16);

      id v11 = 0;
    }
    goto LABEL_32;
  }
  uint64_t v19 = 0;
  int v20 = 1;
LABEL_15:
  uint64_t v21 = [v6 enumeratedURL];

  if (v21)
  {
    __int16 v22 = [(FPDXPCServicer *)self connection];
    uint64_t v23 = [v6 enumeratedURL];
    char v24 = objc_msgSend(v22, "fp_hasSandboxAccessToFile:accessType:logLevel:", v23, *MEMORY[0x1E4F25910], 1);

    if (v24)
    {
      uint64_t v47 = v19;
      uint64_t v60 = 0;
      uint64_t v25 = [(FPDXPCServicer *)self server];
      __int16 v26 = [v25 extensionManager];
      char v27 = [v6 enumeratedURL];
      uint64_t v28 = [v26 domainForURL:v27 reason:&v60];

      if (v28)
      {
        id v29 = [v28 defaultBackend];
        __int16 v30 = [v6 enumeratedURL];
        uint64_t v31 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        _OWORD v49[2] = __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_358;
        void v49[3] = &unk_1E6A756E8;
        id v50 = v6;
        id v53 = v7;
        id v51 = v28;
        id v52 = v8;
        [v29 itemIDForURL:v30 requireProviderItemID:0 request:v31 completionHandler:v49];

        uint64_t v32 = v50;
      }
      else
      {
        uint64_t v32 = [v6 enumeratedURL];
        id v46 = FPProviderNotFoundErrorForURL();
        (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v46);
      }
    }
    else
    {
      __int16 v42 = fp_current_or_default_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer _performWithCheckedEnumerationAttributes:completionHandler:](v6);
      }

      id v43 = FPNotPermittedError();
      (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v43);
    }
  }
  else
  {
    uint64_t v48 = v19;
    uint64_t v60 = 0;
    uint64_t v33 = [(FPDXPCServicer *)self server];
    __int16 v34 = [v33 extensionManager];
    id v35 = [v6 enumeratedItemID];
    uint64_t v36 = [v34 domainFromItemID:v35 reason:&v60];

    uint64_t v37 = (void *)v36;
    if (v36)
    {
      __int16 v38 = v48;
      if (v20)
      {
        uint64_t v39 = fp_current_or_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[FPDXPCServicer _performWithCheckedEnumerationAttributes:completionHandler:]();
        }

        __int16 v40 = [v37 defaultBackend];
        uint64_t v41 = [v6 enumeratedItemID];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        void v54[2] = __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke;
        v54[3] = &unk_1E6A75D40;
        id v55 = v6;
        id v59 = v7;
        id v56 = self;
        id v57 = v37;
        id v58 = v8;
        [v40 URLForItemID:v41 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v58 completionHandler:v54];
      }
      else
      {
        __int16 v40 = [v6 enumeratedItemID];
        (*((void (**)(id, void *, void *, void *, void))v7 + 2))(v7, v37, v8, v40, 0);
      }
    }
    else
    {
      __int16 v40 = [v6 enumeratedItemID];
      uint64_t v44 = [v40 providerDomainID];
      __int16 v45 = FPProviderNotFoundError();
      (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v45);

      __int16 v38 = v48;
    }
  }
LABEL_32:
}

void __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 url];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) connection];
    uint64_t v9 = [v6 url];
    char v10 = objc_msgSend(v8, "fp_hasSandboxAccessToFile:accessType:logLevel:", v9, *MEMORY[0x1E4F25910], 1);

    if (v10)
    {
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 48);
      __int16 v14 = [*(id *)(a1 + 32) enumeratedItemID];
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void))(v11 + 16))(v11, v13, v12, v14, 0);
    }
    else
    {
      __int16 v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_cold_2(v6);
      }

      uint64_t v17 = *(void *)(a1 + 64);
      __int16 v18 = FPNotPermittedError();
      (*(void (**)(uint64_t, void, void, void, void *))(v17 + 16))(v17, 0, 0, 0, v18);
    }
  }
  else
  {
    int v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_358(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v8 || v5)
  {
    if (!v5)
    {
      id v7 = [*(id *)(a1 + 32) enumeratedURL];
      id v6 = FPItemNotFoundErrorAtURL();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke;
  v14[3] = &unk_1E6A75D90;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(FPDXPCServicer *)self _performWithCheckedEnumerationAttributes:v12 completionHandler:v14];
}

void __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (!v9 || v12)
  {
    fpfs_adopt_log();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = FPPopLogSectionForBlock();
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)location = 134219266;
      *(void *)&location[4] = v22;
      __int16 v31 = 2112;
      uint64_t v32 = v23;
      __int16 v33 = 2080;
      __int16 v34 = "-[FPDXPCServicer fetchAndStartEnumeratingWithSettings:observer:completionHandler:]_block_invoke";
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      __int16 v37 = 2112;
      uint64_t v38 = 0;
      __int16 v39 = 2112;
      __int16 v40 = v13;
      _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", location, 0x3Eu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
  else
  {
    __int16 v14 = (void *)[*(id *)(a1 + 40) copy];
    [v14 setEnumeratedItemID:v11];
    id v15 = [[WrappedFPXEnumeratorObserverProxy alloc] initWithTarget:*(void *)(a1 + 48)];
    id v16 = objc_opt_new();
    objc_msgSend(v16, "setRequestEffectivePID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
    id v17 = [NSString stringWithFormat:@"enumerator of %@ for %@", v14, v10];
    [v16 setPrettyDescription:v17];

    *(void *)location = 0;
    __int16 v18 = [v9 session];
    objc_initWeak((id *)location, v18);

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke_365;
    v27[3] = &unk_1E6A73990;
    objc_copyWeak(&v28, (id *)location);
    [v16 setStopBlock:v27];
    if (!v16) {
      __assert_rtn("-[FPDXPCServicer fetchAndStartEnumeratingWithSettings:observer:completionHandler:]_block_invoke_2", "FPDXPCServicer.m", 3819, "extender");
    }
    if ([v14 wantsDirectExtensionEnumeration]) {
      [v9 extensionBackend];
    }
    else {
    int v20 = [v9 defaultBackend];
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke_3;
    v24[3] = &unk_1E6A75D68;
    v24[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 56);
    id v21 = v16;
    id v25 = v21;
    [v20 enumerateWithSettings:v14 lifetimeExtender:v21 observer:v15 completionHandler:v24];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)location);
  }
}

void __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke_365(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained unregisterLifetimeExtensionForObject:v3];
}

void __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v11 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    *(_DWORD *)buf = 134219266;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    id v17 = "-[FPDXPCServicer fetchAndStartEnumeratingWithSettings:observer:completionHandler:]_block_invoke_3";
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(a1[6] + 16))();
  __fp_pop_log();
}

void __62__FPDXPCServicer_forceIndexingInForeground_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer forceIndexingInForeground:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)preventDiskImportSchedulerFromRunning:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v45[0] = *MEMORY[0x1E4F25E28];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  uint64_t v32 = __74__FPDXPCServicer_preventDiskImportSchedulerFromRunning_completionHandler___block_invoke;
  __int16 v33 = &unk_1E6A73710;
  __int16 v34 = self;
  id v8 = v6;
  id v35 = v8;
  id v9 = v7;
  __int16 v10 = v31;
  uint64_t v11 = [(FPDXPCServicer *)self connection];
  char v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v9);

  if (v12)
  {

    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = [&unk_1F2EDBB68 countByEnumeratingWithState:&v27 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(&unk_1F2EDBB68);
          }
          __int16 v16 = +[FPDSharedScheduler schedulerWithLabel:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          id v17 = v16;
          if (!v16)
          {
            id v26 = fpfs_adopt_log();
            __int16 v20 = fp_current_or_default_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v23 = FPPopLogSectionForBlock();
              uint64_t v21 = *MEMORY[0x1E4F281F8];
              uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
              *(_DWORD *)buf = 134218754;
              uint64_t v37 = v23;
              __int16 v38 = 2112;
              __int16 v39 = self;
              __int16 v40 = 2080;
              uint64_t v41 = "-[FPDXPCServicer preventDiskImportSchedulerFromRunning:completionHandler:]";
              __int16 v42 = 2112;
              id v43 = v24;
              _os_log_debug_impl(&dword_1D744C000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
            }
            else
            {
              uint64_t v21 = *MEMORY[0x1E4F281F8];
            }

            __int16 v22 = [MEMORY[0x1E4F28C58] errorWithDomain:v21 code:4 userInfo:0];
            (*((void (**)(id, void *))v8 + 2))(v8, v22);

            __fp_pop_log();
            goto LABEL_17;
          }
          [v16 setPreventRunning:v4];
        }
        uint64_t v13 = [&unk_1F2EDBB68 countByEnumeratingWithState:&v27 objects:v44 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    id v25 = fpfs_adopt_log();
    uint64_t v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer preventDiskImportSchedulerFromRunning:completionHandler:]();
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
    __fp_pop_log();
  }
  else
  {
    id v19 = FPNotPermittedError();
    v32((uint64_t)v10, v19);
  }
LABEL_17:
}

void __74__FPDXPCServicer_preventDiskImportSchedulerFromRunning_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  BOOL v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer preventDiskImportSchedulerFromRunning:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)dumpIndexerInfoFor:(id)a3 withName:(id)a4 to:(id)a5 completionHandler:(id)a6
{
  void v33[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = *MEMORY[0x1E4F25E88];
  v33[0] = *MEMORY[0x1E4F25E20];
  v33[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  long long v29 = __67__FPDXPCServicer_dumpIndexerInfoFor_withName_to_completionHandler___block_invoke;
  long long v30 = &unk_1E6A73710;
  __int16 v31 = self;
  id v16 = v13;
  id v32 = v16;
  id v17 = v15;
  uint64_t v18 = v28;
  id v19 = [(FPDXPCServicer *)self connection];
  char v20 = objc_msgSend(v19, "fp_hasOneOfEntitlements:", v17);

  if (v20)
  {

    uint64_t v21 = [(FPDXPCServicer *)self server];
    __int16 v22 = [v21 extensionManager];
    uint64_t v23 = [v22 domainWithID:v10 reason:0];

    uint64_t v24 = [v23 indexer];
    [v24 dumpStateTo:v12 withName:v11];

    long long v27 = fpfs_adopt_log();
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer dumpIndexerInfoFor:withName:to:completionHandler:]();
    }

    (*((void (**)(id, void))v16 + 2))(v16, 0);
    __fp_pop_log();
  }
  else
  {
    id v26 = FPNotPermittedError();
    v29((uint64_t)v18, v26);
  }
}

void __67__FPDXPCServicer_dumpIndexerInfoFor_withName_to_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  BOOL v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer dumpIndexerInfoFor:withName:to:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)signalReindexCSIdentifiersByProviderDomainID:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v7 = a5;
  v46[0] = *MEMORY[0x1E4F25E28];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  uint64_t v37 = __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke;
  __int16 v38 = &unk_1E6A73710;
  __int16 v39 = self;
  id v28 = v7;
  id v40 = v28;
  id v9 = v8;
  __int16 v10 = v36;
  uint64_t v11 = [(FPDXPCServicer *)self connection];
  char v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v9);

  if (v12)
  {

    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v27;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v31 = 0;
          uint64_t v18 = [(FPDXPCServicer *)self server];
          id v19 = [v18 extensionManager];
          char v20 = [v19 domainWithID:v17 reason:&v31];

          if (v20)
          {
            uint64_t v21 = [v13 objectForKeyedSubscript:v17];
            if ([v21 count])
            {
              __int16 v22 = [v20 defaultBackend];
              uint64_t v23 = v22;
              if (v22)
              {
                v30[0] = MEMORY[0x1E4F143A8];
                v30[1] = 3221225472;
                void v30[2] = __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_381;
                v30[3] = &unk_1E6A73580;
                v30[4] = v17;
                [v22 reindexItemsWithIndexReason:a4 identifiers:v21 completionHandler:v30];
              }
              else
              {
                uint64_t v24 = fp_current_or_default_log();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v42 = v17;
                  _os_log_error_impl(&dword_1D744C000, v24, OS_LOG_TYPE_ERROR, "[ERROR] No indexer to reindex items in domain: %@", buf, 0xCu);
                }
              }
            }
            else
            {
              uint64_t v23 = fp_current_or_default_log();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v42 = v17;
                _os_log_error_impl(&dword_1D744C000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Tried to reindex empty array of identifiersin domain: %@", buf, 0xCu);
              }
            }
          }
          else
          {
            uint64_t v21 = fp_current_or_default_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v42 = v17;
              __int16 v43 = 2048;
              id v44 = v31;
              _os_log_error_impl(&dword_1D744C000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Failed to reindex items in domain %@, reason %lu", buf, 0x16u);
            }
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v45 count:16];
      }
      while (v14);
    }

    fpfs_adopt_log();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer signalReindexCSIdentifiersByProviderDomainID:indexReason:completionHandler:]();
    }

    (*((void (**)(id, void))v28 + 2))(v28, 0);
    __fp_pop_log();
  }
  else
  {
    id v26 = FPNotPermittedError();
    v37((uint64_t)v10, v26);
  }
}

void __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  BOOL v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer signalReindexCSIdentifiersByProviderDomainID:indexReason:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_381(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_381_cold_2(v3);
    }
  }
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_381_cold_1(a1, v5, v6);
  }
}

- (void)_test_setDocIDResolutionPolicy:(BOOL)a3 completionHandler:(id)a4
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F25E88];
  v21[0] = *MEMORY[0x1E4F25E20];
  v21[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  uint64_t v17 = __67__FPDXPCServicer__test_setDocIDResolutionPolicy_completionHandler___block_invoke;
  uint64_t v18 = &unk_1E6A73710;
  id v19 = self;
  id v8 = v5;
  id v20 = v8;
  id v9 = v7;
  __int16 v10 = v16;
  uint64_t v11 = [(FPDXPCServicer *)self connection];
  char v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v9);

  if (v12)
  {

    GSSetDocIDResolutionPolicy();
    id v15 = fpfs_adopt_log();
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_setDocIDResolutionPolicy:completionHandler:]();
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
    __fp_pop_log();
  }
  else
  {
    __int16 v14 = FPNotPermittedError();
    v17((uint64_t)v10, v14);
  }
}

void __67__FPDXPCServicer__test_setDocIDResolutionPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  BOOL v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer _test_setDocIDResolutionPolicy:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_getNeedsIndexingStateForRootURL:(id)a3 completionHandler:(id)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v49[0] = *MEMORY[0x1E4F25E88];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  long long v35 = __74__FPDXPCServicer__test_getNeedsIndexingStateForRootURL_completionHandler___block_invoke;
  uint64_t v36 = &unk_1E6A73710;
  uint64_t v37 = self;
  id v9 = v7;
  id v38 = v9;
  id v10 = v8;
  uint64_t v11 = v34;
  __int16 v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    __int16 v14 = [(FPDXPCServicer *)self server];
    id v15 = [v14 extensionManager];

    uint64_t v16 = [v15 domainForURL:v6 reason:0];
    if (v16)
    {
      long long v32 = fpfs_adopt_log();
      uint64_t v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = FPPopLogSectionForBlock();
        id v25 = objc_alloc(NSNumber);
        id v26 = [v16 indexer];
        id v27 = [v26 state];
        id v28 = objc_msgSend(v25, "initWithBool:", objc_msgSend(v27, "needsIndexing"));
        *(_DWORD *)buf = 134219010;
        uint64_t v40 = v31;
        __int16 v41 = 2112;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        id v44 = "-[FPDXPCServicer _test_getNeedsIndexingStateForRootURL:completionHandler:]";
        __int16 v45 = 2112;
        id v46 = v28;
        __int16 v47 = 2112;
        uint64_t v48 = 0;
        _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      id v18 = objc_alloc(NSNumber);
      id v19 = [v16 indexer];
      id v20 = [v19 state];
      uint64_t v21 = objc_msgSend(v18, "initWithBool:", objc_msgSend(v20, "needsIndexing"));
      (*((void (**)(id, void *, void))v9 + 2))(v9, v21, 0);

      __fp_pop_log();
    }
    else
    {
      long long v33 = fpfs_adopt_log();
      uint64_t v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = FPPopLogSectionForBlock();
        long long v30 = (void *)[objc_alloc(NSNumber) initWithBool:0];
        *(_DWORD *)buf = 134219010;
        uint64_t v40 = v29;
        __int16 v41 = 2112;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        id v44 = "-[FPDXPCServicer _test_getNeedsIndexingStateForRootURL:completionHandler:]";
        __int16 v45 = 2112;
        id v46 = v30;
        __int16 v47 = 2112;
        uint64_t v48 = 0;
        _os_log_debug_impl(&dword_1D744C000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v24 = (void *)[objc_alloc(NSNumber) initWithBool:0];
      (*((void (**)(id, void *, void))v9 + 2))(v9, v24, 0);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v22 = FPNotPermittedError();
    v35((uint64_t)v11, v22);
  }
}

void __74__FPDXPCServicer__test_getNeedsIndexingStateForRootURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v10 = fpfs_adopt_log();
  BOOL v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = FPPopLogSectionForBlock();
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = (void *)[objc_alloc(NSNumber) initWithBool:0];
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    uint64_t v16 = "-[FPDXPCServicer _test_getNeedsIndexingStateForRootURL:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)[objc_alloc(NSNumber) initWithBool:0];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v3);

  __fp_pop_log();
}

- (void)_test_retrieveItemWithName:(id)a3 completionHandler:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v52[0] = *MEMORY[0x1E4F25E88];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  id v38 = __63__FPDXPCServicer__test_retrieveItemWithName_completionHandler___block_invoke;
  __int16 v39 = &unk_1E6A73710;
  uint64_t v40 = self;
  id v9 = v7;
  id v41 = v9;
  id v10 = v8;
  uint64_t v11 = v37;
  uint64_t v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    uint64_t v14 = [(FPDXPCServicer *)self server];
    __int16 v15 = [v14 extensionManager];

    uint64_t v36 = 0;
    uint64_t v16 = [v15 providerWithIdentifier:@"com.apple.FileProvider.TestingHarness.TestFileProvider" reason:&v36];
    __int16 v17 = v16;
    if (v16)
    {
      id v18 = [v16 providedItemsURLs];
      uint64_t v19 = [v18 firstObject];
      id v20 = [(id)v19 URLByAppendingPathComponent:v6];

      id v34 = 0;
      LOBYTE(v19) = [@"Test" writeToURL:v20 atomically:0 encoding:4 error:&v34];
      id v21 = v34;
      if (v19)
      {
        id v33 = v21;
        __int16 v22 = [MEMORY[0x1E4F25D78] wrapperWithURL:v20 readonly:0 error:&v33];
        id v23 = v33;

        fpfs_adopt_log();
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v32 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          uint64_t v43 = v32;
          __int16 v44 = 2112;
          __int16 v45 = self;
          __int16 v46 = 2080;
          __int16 v47 = "-[FPDXPCServicer _test_retrieveItemWithName:completionHandler:]";
          __int16 v48 = 2112;
          uint64_t v49 = v22;
          __int16 v50 = 2112;
          id v51 = v23;
          _os_log_debug_impl(&dword_1D744C000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }

        (*((void (**)(id, void *, id))v9 + 2))(v9, v22, v23);
        __fp_pop_log();

        id v21 = v23;
      }
      else
      {
        fpfs_adopt_log();
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        id v28 = fp_current_or_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v31 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          uint64_t v43 = v31;
          __int16 v44 = 2112;
          __int16 v45 = self;
          __int16 v46 = 2080;
          __int16 v47 = "-[FPDXPCServicer _test_retrieveItemWithName:completionHandler:]";
          __int16 v48 = 2112;
          uint64_t v49 = 0;
          __int16 v50 = 2112;
          id v51 = v21;
          _os_log_debug_impl(&dword_1D744C000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }

        (*((void (**)(id, void, id))v9 + 2))(v9, 0, v21);
        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = FPPopLogSectionForBlock();
        long long v30 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        uint64_t v43 = v29;
        __int16 v44 = 2112;
        __int16 v45 = self;
        __int16 v46 = 2080;
        __int16 v47 = "-[FPDXPCServicer _test_retrieveItemWithName:completionHandler:]";
        __int16 v48 = 2112;
        uint64_t v49 = 0;
        __int16 v50 = 2112;
        id v51 = v30;
        _os_log_debug_impl(&dword_1D744C000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      id v27 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v27);

      __fp_pop_log();
    }
  }
  else
  {
    id v25 = FPNotPermittedError();
    v38((uint64_t)v11, v25);
  }
}

void __63__FPDXPCServicer__test_retrieveItemWithName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  BOOL v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer _test_retrieveItemWithName:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_callFileProviderManagerAPIs:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36[0] = *MEMORY[0x1E4F25E88];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  uint64_t v24 = __52__FPDXPCServicer__test_callFileProviderManagerAPIs___block_invoke;
  id v25 = &unk_1E6A73710;
  id v26 = self;
  id v6 = v4;
  id v27 = v6;
  id v7 = v5;
  uint64_t v8 = v23;
  uint64_t v9 = [(FPDXPCServicer *)self connection];
  char v10 = objc_msgSend(v9, "fp_hasOneOfEntitlements:", v7);

  if (v10)
  {

    uint64_t v11 = [(FPDXPCServicer *)self server];
    __int16 v12 = [v11 extensionManager];

    uint64_t v22 = 0;
    char v13 = [v12 providerWithIdentifier:@"com.apple.FileProvider.TestingHarness.TestFileProvider" reason:&v22];
    __int16 v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 asAppExtensionBackedProvider];
      objc_msgSend(v15, "_test_callFileProviderManagerAPIs:", v6);
    }
    else
    {
      id v21 = fpfs_adopt_log();
      id v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = FPPopLogSectionForBlock();
        id v20 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        uint64_t v31 = self;
        __int16 v32 = 2080;
        id v33 = "-[FPDXPCServicer _test_callFileProviderManagerAPIs:]";
        __int16 v34 = 2112;
        id v35 = v20;
        _os_log_debug_impl(&dword_1D744C000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      uint64_t v18 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v6 + 2))(v6, v18);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v16 = FPNotPermittedError();
    v24((uint64_t)v8, v16);
  }
}

void __52__FPDXPCServicer__test_callFileProviderManagerAPIs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer _test_callFileProviderManagerAPIs:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_callRemoveTrashedItemsOlderThanDate:(id)a3 completionHandler:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29[0] = *MEMORY[0x1E4F25E88];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  id v25 = __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke;
  id v26 = &unk_1E6A73710;
  id v27 = self;
  id v9 = v7;
  id v28 = v9;
  id v10 = v8;
  uint64_t v11 = v24;
  __int16 v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    __int16 v14 = [(FPDXPCServicer *)self server];
    id v15 = [v14 extensionManager];

    uint64_t v16 = [v15 providerWithIdentifier:@"com.apple.FileProvider.LocalStorage" reason:0];
    if ([v16 isAppExtensionReachable])
    {
      id v17 = [v16 asAppExtensionBackedProvider];
      uint64_t v18 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke_391;
      void v21[3] = &unk_1E6A73878;
      v21[4] = self;
      id v22 = v9;
      [v17 removeTrashedItemsOlderThanDate:v6 request:v18 completionHandler:v21];
    }
    else
    {
      fpfs_adopt_log();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock();
        -[FPDXPCServicer _test_callRemoveTrashedItemsOlderThanDate:completionHandler:]();
      }

      (*((void (**)(id, void))v9 + 2))(v9, 0);
      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v19 = FPNotPermittedError();
    v25((uint64_t)v11, v19);
  }
}

void __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer _test_callRemoveTrashedItemsOlderThanDate:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke_391(uint64_t a1)
{
  id v3 = fpfs_adopt_log();
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock();
    __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke_391_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_simulateInstallOfBundleID:(id)a3 completionHandler:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v32[0] = *MEMORY[0x1E4F25E88];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  id v27 = __68__FPDXPCServicer__test_simulateInstallOfBundleID_completionHandler___block_invoke;
  id v28 = &unk_1E6A73710;
  uint64_t v29 = self;
  id v9 = v7;
  id v30 = v9;
  id v10 = v8;
  uint64_t v11 = v26;
  __int16 v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    __int16 v14 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    uint64_t v16 = [WeakRetained appMonitor];

    id v17 = [v16 valueForKey:@"defaultProviderByAppBundleID"];
    uint64_t v18 = [v14 bundleIdentifier];
    uint64_t v19 = [v17 objectForKeyedSubscript:v18];

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F25CC0]) initWithAppProxy:v14 providerDomainID:v19];
    id v21 = [v16 appRegistry];
    uint64_t v31 = v20;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [v21 addApps:v22];

    id v25 = fpfs_adopt_log();
    id v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_simulateInstallOfBundleID:completionHandler:]();
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
    __fp_pop_log();
  }
  else
  {
    uint64_t v24 = FPNotPermittedError();
    v27((uint64_t)v11, v24);
  }
}

void __68__FPDXPCServicer__test_simulateInstallOfBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer _test_simulateInstallOfBundleID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_simulateUninstallOfBundleID:(id)a3 completionHandler:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27[0] = *MEMORY[0x1E4F25E88];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  id v22 = __70__FPDXPCServicer__test_simulateUninstallOfBundleID_completionHandler___block_invoke;
  id v23 = &unk_1E6A73710;
  uint64_t v24 = self;
  id v9 = v7;
  id v25 = v9;
  id v10 = v8;
  uint64_t v11 = v21;
  __int16 v12 = [(FPDXPCServicer *)self connection];
  char v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if (v13)
  {

    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    id v15 = [WeakRetained appMonitor];
    uint64_t v16 = [v15 appRegistry];

    id v26 = v6;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v16 removeAppsWithBundleIDs:v17];

    id v20 = fpfs_adopt_log();
    uint64_t v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_simulateUninstallOfBundleID:completionHandler:]();
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
    __fp_pop_log();
  }
  else
  {
    uint64_t v19 = FPNotPermittedError();
    v22((uint64_t)v11, v19);
  }
}

void __70__FPDXPCServicer__test_simulateUninstallOfBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer _test_simulateUninstallOfBundleID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_getRootSupportDirURLForDomainURL:(id)a3 completionHandler:(id)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  v54[0] = *MEMORY[0x1E4F25E88];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  id v41 = __75__FPDXPCServicer__test_getRootSupportDirURLForDomainURL_completionHandler___block_invoke;
  uint64_t v42 = &unk_1E6A73710;
  uint64_t v43 = self;
  id v8 = v6;
  id v44 = v8;
  id v9 = v7;
  __int16 v10 = v40;
  uint64_t v11 = [(FPDXPCServicer *)self connection];
  char v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v9);

  if (v12)
  {

    char v13 = [(FPDXPCServicer *)self server];
    uint64_t v31 = [v13 extensionManager];

    __int16 v32 = [v31 domainForURL:v33 reason:0];
    if (v32)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      __int16 v14 = [v32 coordinationRootURLs];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v53 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend(v18, "lastPathComponent", v31);
            int v20 = [v19 isEqualToString:@"delete"];

            if (v20)
            {
              id v35 = fpfs_adopt_log();
              id v23 = fp_current_or_default_log();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v27 = FPPopLogSectionForBlock();
                id v28 = [v18 URLByDeletingLastPathComponent];
                uint64_t v29 = [v28 URLByDeletingLastPathComponent];
                id v30 = [v29 URLByDeletingLastPathComponent];
                *(_DWORD *)buf = 134218754;
                uint64_t v46 = v27;
                __int16 v47 = 2112;
                __int16 v48 = self;
                __int16 v49 = 2080;
                __int16 v50 = "-[FPDXPCServicer _test_getRootSupportDirURLForDomainURL:completionHandler:]";
                __int16 v51 = 2112;
                id v52 = v30;
                _os_log_debug_impl(&dword_1D744C000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
              }
              uint64_t v24 = [v18 URLByDeletingLastPathComponent];
              id v25 = [v24 URLByDeletingLastPathComponent];
              id v26 = [v25 URLByDeletingLastPathComponent];
              (*((void (**)(id, void *))v8 + 2))(v8, v26);

              __fp_pop_log();
              goto LABEL_19;
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v53 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    __int16 v34 = fpfs_adopt_log();
    id v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_getRootSupportDirURLForDomainURL:completionHandler:]();
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
    __fp_pop_log();

LABEL_19:
  }
  else
  {
    id v22 = FPNotPermittedError();
    v41((uint64_t)v10, v22);
  }
}

void __75__FPDXPCServicer__test_getRootSupportDirURLForDomainURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock();
    __75__FPDXPCServicer__test_getRootSupportDirURLForDomainURL_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_getCountersArray:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FPDXPCServicer *)self server];
  id v9 = [v8 extensionManager];
  __int16 v10 = [v9 domainWithID:v6 reason:0];

  if (v10)
  {
    uint64_t v11 = [v10 defaultBackend];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__FPDXPCServicer__test_getCountersArray_completionHandler___block_invoke;
    v14[3] = &unk_1E6A73918;
    void v14[4] = self;
    id v15 = v7;
    [v11 getCountersArrayWithCompletionHandler:v14];
  }
  else
  {
    char v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer _test_getCountersArray:completionHandler:]();
    }

    fpfs_adopt_log();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    char v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_getCountersArray:completionHandler:]();
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    __fp_pop_log();
  }
}

void __59__FPDXPCServicer__test_getCountersArray_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v12 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = FPPopLogSectionForBlock();
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      uint64_t v18 = "-[FPDXPCServicer _test_getCountersArray:completionHandler:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = 0;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }
  else
  {
    char v12 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = FPPopLogSectionForBlock();
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = "-[FPDXPCServicer _test_getCountersArray:completionHandler:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = 0;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_resetCounters:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FPDXPCServicer *)self server];
  uint64_t v9 = [v8 extensionManager];
  uint64_t v10 = [v9 domainWithID:v6 reason:0];

  if (v10)
  {
    uint64_t v11 = [v10 defaultBackend];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__FPDXPCServicer__test_resetCounters_completionHandler___block_invoke;
    v14[3] = &unk_1E6A73710;
    void v14[4] = self;
    id v15 = v7;
    [v11 resetCountersWithCompletionHandler:v14];
  }
  else
  {
    char v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer _test_getCountersArray:completionHandler:]();
    }

    fpfs_adopt_log();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    char v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_resetCounters:completionHandler:]();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
    __fp_pop_log();
  }
}

void __56__FPDXPCServicer__test_resetCounters_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    char v13 = "-[FPDXPCServicer _test_resetCounters:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_queryDiskImportSchedulerLabel:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FPDXPCServicer *)self server];
  uint64_t v9 = [v8 extensionManager];
  __int16 v10 = [v9 domainWithID:v6 reason:0];

  if (v10)
  {
    uint64_t v11 = [v10 defaultBackend];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__FPDXPCServicer__test_queryDiskImportSchedulerLabel_completionHandler___block_invoke;
    v14[3] = &unk_1E6A75DB8;
    void v14[4] = self;
    id v15 = v7;
    [v11 queryDiskImportSchedulerLabelWithCompletionHandler:v14];
  }
  else
  {
    __int16 v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FPDXPCServicer _test_getCountersArray:completionHandler:]();
    }

    fpfs_adopt_log();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    char v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_queryDiskImportSchedulerLabel:completionHandler:]();
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    __fp_pop_log();
  }
}

void __72__FPDXPCServicer__test_queryDiskImportSchedulerLabel_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    id v16 = "-[FPDXPCServicer _test_queryDiskImportSchedulerLabel:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_importItemsPendingReconciliationProgressForDomainWithID:(id)a3 completionHandler:(id)a4
{
  void v49[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E60];
  v49[0] = *MEMORY[0x1E4F25E20];
  v49[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  id v35 = __98__FPDXPCServicer__test_importItemsPendingReconciliationProgressForDomainWithID_completionHandler___block_invoke;
  long long v36 = &unk_1E6A73710;
  long long v37 = self;
  id v10 = v7;
  id v38 = v10;
  id v11 = v9;
  uint64_t v12 = v34;
  __int16 v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    uint64_t v33 = 0;
    __int16 v15 = [(FPDXPCServicer *)self server];
    id v16 = [v15 extensionManager];
    __int16 v17 = [v16 domainWithID:v6 reason:&v33];

    if (v17)
    {
      id v18 = [v17 defaultBackend];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v20 = [v17 defaultBackend];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = __98__FPDXPCServicer__test_importItemsPendingReconciliationProgressForDomainWithID_completionHandler___block_invoke_402;
        v30[3] = &unk_1E6A75AA0;
        v30[4] = self;
        id v31 = v10;
        [v20 importProgressForItemsPendingReconciliationWithCompletionHandler:v30];
      }
      else
      {
        fpfs_adopt_log();
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = FPPopLogSectionForBlock();
          uint64_t v29 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v40 = v28;
          __int16 v41 = 2112;
          uint64_t v42 = self;
          __int16 v43 = 2080;
          id v44 = "-[FPDXPCServicer _test_importItemsPendingReconciliationProgressForDomainWithID:completionHandler:]";
          __int16 v45 = 2112;
          uint64_t v46 = 0;
          __int16 v47 = 2112;
          __int16 v48 = v29;
          _os_log_debug_impl(&dword_1D744C000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        id v25 = FPNotSupportedError();
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v25);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = FPPopLogSectionForBlock();
        uint64_t v27 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        uint64_t v40 = v26;
        __int16 v41 = 2112;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        id v44 = "-[FPDXPCServicer _test_importItemsPendingReconciliationProgressForDomainWithID:completionHandler:]";
        __int16 v45 = 2112;
        uint64_t v46 = 0;
        __int16 v47 = 2112;
        __int16 v48 = v27;
        _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v23 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v21 = FPNotPermittedError();
    v35((uint64_t)v12, v21);
  }
}

void __98__FPDXPCServicer__test_importItemsPendingReconciliationProgressForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer _test_importItemsPendingReconciliationProgressForDomainWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __98__FPDXPCServicer__test_importItemsPendingReconciliationProgressForDomainWithID_completionHandler___block_invoke_402(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer _test_importItemsPendingReconciliationProgressForDomainWithID:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_importItemsPendingScanningDiskProgressForDomainWithID:(id)a3 completionHandler:(id)a4
{
  void v49[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E60];
  v49[0] = *MEMORY[0x1E4F25E20];
  v49[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  id v35 = __96__FPDXPCServicer__test_importItemsPendingScanningDiskProgressForDomainWithID_completionHandler___block_invoke;
  long long v36 = &unk_1E6A73710;
  long long v37 = self;
  id v10 = v7;
  id v38 = v10;
  id v11 = v9;
  uint64_t v12 = v34;
  __int16 v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    uint64_t v33 = 0;
    __int16 v15 = [(FPDXPCServicer *)self server];
    __int16 v16 = [v15 extensionManager];
    __int16 v17 = [v16 domainWithID:v6 reason:&v33];

    if (v17)
    {
      id v18 = [v17 defaultBackend];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v20 = [v17 defaultBackend];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = __96__FPDXPCServicer__test_importItemsPendingScanningDiskProgressForDomainWithID_completionHandler___block_invoke_405;
        v30[3] = &unk_1E6A75AA0;
        v30[4] = self;
        id v31 = v10;
        [v20 importProgressForItemsPendingScanningDiskWithCompletionHandler:v30];
      }
      else
      {
        fpfs_adopt_log();
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = FPPopLogSectionForBlock();
          uint64_t v29 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v40 = v28;
          __int16 v41 = 2112;
          uint64_t v42 = self;
          __int16 v43 = 2080;
          id v44 = "-[FPDXPCServicer _test_importItemsPendingScanningDiskProgressForDomainWithID:completionHandler:]";
          __int16 v45 = 2112;
          uint64_t v46 = 0;
          __int16 v47 = 2112;
          __int16 v48 = v29;
          _os_log_debug_impl(&dword_1D744C000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        id v25 = FPNotSupportedError();
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v25);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = FPPopLogSectionForBlock();
        uint64_t v27 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        uint64_t v40 = v26;
        __int16 v41 = 2112;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        id v44 = "-[FPDXPCServicer _test_importItemsPendingScanningDiskProgressForDomainWithID:completionHandler:]";
        __int16 v45 = 2112;
        uint64_t v46 = 0;
        __int16 v47 = 2112;
        __int16 v48 = v27;
        _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v23 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v21 = FPNotPermittedError();
    v35((uint64_t)v12, v21);
  }
}

void __96__FPDXPCServicer__test_importItemsPendingScanningDiskProgressForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer _test_importItemsPendingScanningDiskProgressForDomainWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __96__FPDXPCServicer__test_importItemsPendingScanningDiskProgressForDomainWithID_completionHandler___block_invoke_405(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer _test_importItemsPendingScanningDiskProgressForDomainWithID:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_importItemsPendingScanningProviderProgressForDomainWithID:(id)a3 completionHandler:(id)a4
{
  void v49[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E60];
  v49[0] = *MEMORY[0x1E4F25E20];
  v49[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  id v35 = __100__FPDXPCServicer__test_importItemsPendingScanningProviderProgressForDomainWithID_completionHandler___block_invoke;
  long long v36 = &unk_1E6A73710;
  long long v37 = self;
  id v10 = v7;
  id v38 = v10;
  id v11 = v9;
  uint64_t v12 = v34;
  __int16 v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    uint64_t v33 = 0;
    __int16 v15 = [(FPDXPCServicer *)self server];
    __int16 v16 = [v15 extensionManager];
    __int16 v17 = [v16 domainWithID:v6 reason:&v33];

    if (v17)
    {
      id v18 = [v17 defaultBackend];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v20 = [v17 defaultBackend];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = __100__FPDXPCServicer__test_importItemsPendingScanningProviderProgressForDomainWithID_completionHandler___block_invoke_408;
        v30[3] = &unk_1E6A75AA0;
        v30[4] = self;
        id v31 = v10;
        [v20 importProgressForItemsPendingScanningProviderWithCompletionHandler:v30];
      }
      else
      {
        fpfs_adopt_log();
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = FPPopLogSectionForBlock();
          uint64_t v29 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v40 = v28;
          __int16 v41 = 2112;
          uint64_t v42 = self;
          __int16 v43 = 2080;
          id v44 = "-[FPDXPCServicer _test_importItemsPendingScanningProviderProgressForDomainWithID:completionHandler:]";
          __int16 v45 = 2112;
          uint64_t v46 = 0;
          __int16 v47 = 2112;
          __int16 v48 = v29;
          _os_log_debug_impl(&dword_1D744C000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        id v25 = FPNotSupportedError();
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v25);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = FPPopLogSectionForBlock();
        uint64_t v27 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        uint64_t v40 = v26;
        __int16 v41 = 2112;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        id v44 = "-[FPDXPCServicer _test_importItemsPendingScanningProviderProgressForDomainWithID:completionHandler:]";
        __int16 v45 = 2112;
        uint64_t v46 = 0;
        __int16 v47 = 2112;
        __int16 v48 = v27;
        _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v23 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v21 = FPNotPermittedError();
    v35((uint64_t)v12, v21);
  }
}

void __100__FPDXPCServicer__test_importItemsPendingScanningProviderProgressForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer _test_importItemsPendingScanningProviderProgressForDomainWithID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __100__FPDXPCServicer__test_importItemsPendingScanningProviderProgressForDomainWithID_completionHandler___block_invoke_408(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCServicer _test_importItemsPendingScanningProviderProgressForDomainWithID:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_disableDBQueryStatistics:(id)a3 completionHandler:(id)a4
{
  void v42[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E88];
  v42[0] = *MEMORY[0x1E4F25E20];
  v42[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  id v30 = __67__FPDXPCServicer__test_disableDBQueryStatistics_completionHandler___block_invoke;
  id v31 = &unk_1E6A73710;
  id v32 = self;
  id v10 = v7;
  id v33 = v10;
  id v11 = v9;
  uint64_t v12 = v29;
  __int16 v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    uint64_t v28 = 0;
    __int16 v15 = [(FPDXPCServicer *)self server];
    __int16 v16 = [v15 extensionManager];
    __int16 v17 = [v16 domainWithID:v6 reason:&v28];

    if (v17)
    {
      id v18 = [v17 defaultBackend];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __67__FPDXPCServicer__test_disableDBQueryStatistics_completionHandler___block_invoke_409;
      v25[3] = &unk_1E6A73710;
      void v25[4] = self;
      id v26 = v10;
      [v18 disableDBQueryStatisticsWithCompletionHandler:v25];
    }
    else
    {
      id v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer _test_getCountersArray:completionHandler:]();
      }

      fpfs_adopt_log();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = FPPopLogSectionForBlock();
        uint64_t v24 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v35 = v23;
        __int16 v36 = 2112;
        long long v37 = self;
        __int16 v38 = 2080;
        long long v39 = "-[FPDXPCServicer _test_disableDBQueryStatistics:completionHandler:]";
        __int16 v40 = 2112;
        __int16 v41 = v24;
        _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      id v22 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v10 + 2))(v10, v22);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v19 = FPNotPermittedError();
    v30((uint64_t)v12, v19);
  }
}

void __67__FPDXPCServicer__test_disableDBQueryStatistics_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer _test_disableDBQueryStatistics:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __67__FPDXPCServicer__test_disableDBQueryStatistics_completionHandler___block_invoke_409(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer _test_disableDBQueryStatistics:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_resetDBQueryStatistics:(id)a3 completionHandler:(id)a4
{
  void v42[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F25E88];
  v42[0] = *MEMORY[0x1E4F25E20];
  v42[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  id v30 = __65__FPDXPCServicer__test_resetDBQueryStatistics_completionHandler___block_invoke;
  id v31 = &unk_1E6A73710;
  id v32 = self;
  id v10 = v7;
  id v33 = v10;
  id v11 = v9;
  __int16 v12 = v29;
  __int16 v13 = [(FPDXPCServicer *)self connection];
  char v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if (v14)
  {

    uint64_t v28 = 0;
    id v15 = [(FPDXPCServicer *)self server];
    uint64_t v16 = [v15 extensionManager];
    __int16 v17 = [v16 domainWithID:v6 reason:&v28];

    if (v17)
    {
      id v18 = [v17 defaultBackend];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __65__FPDXPCServicer__test_resetDBQueryStatistics_completionHandler___block_invoke_410;
      v25[3] = &unk_1E6A73710;
      void v25[4] = self;
      id v26 = v10;
      [v18 resetDBQueryStatisticsWithCompletionHandler:v25];
    }
    else
    {
      id v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer _test_getCountersArray:completionHandler:]();
      }

      fpfs_adopt_log();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = FPPopLogSectionForBlock();
        uint64_t v24 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134218754;
        uint64_t v35 = v23;
        __int16 v36 = 2112;
        long long v37 = self;
        __int16 v38 = 2080;
        long long v39 = "-[FPDXPCServicer _test_resetDBQueryStatistics:completionHandler:]";
        __int16 v40 = 2112;
        __int16 v41 = v24;
        _os_log_debug_impl(&dword_1D744C000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      id v22 = FPProviderNotFoundError();
      (*((void (**)(id, void *))v10 + 2))(v10, v22);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v19 = FPNotPermittedError();
    v30((uint64_t)v12, v19);
  }
}

void __65__FPDXPCServicer__test_resetDBQueryStatistics_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer _test_resetDBQueryStatistics:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __65__FPDXPCServicer__test_resetDBQueryStatistics_completionHandler___block_invoke_410(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCServicer _test_resetDBQueryStatistics:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)_test_getDBQueryStatistics:(id)a3 queryPlan:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  v46[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4F25E88];
  v46[0] = *MEMORY[0x1E4F25E20];
  v46[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  id v32 = __73__FPDXPCServicer__test_getDBQueryStatistics_queryPlan_completionHandler___block_invoke;
  id v33 = &unk_1E6A73710;
  __int16 v34 = self;
  id v12 = v9;
  id v35 = v12;
  id v13 = v11;
  __int16 v14 = v31;
  id v15 = [(FPDXPCServicer *)self connection];
  char v16 = objc_msgSend(v15, "fp_hasOneOfEntitlements:", v13);

  if (v16)
  {

    uint64_t v30 = 0;
    __int16 v17 = [(FPDXPCServicer *)self server];
    id v18 = [v17 extensionManager];
    __int16 v19 = [v18 domainWithID:v8 reason:&v30];

    if (v19)
    {
      id v20 = [v19 defaultBackend];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __73__FPDXPCServicer__test_getDBQueryStatistics_queryPlan_completionHandler___block_invoke_411;
      v27[3] = &unk_1E6A73940;
      void v27[4] = self;
      id v28 = v12;
      [v20 getDBQueryStatisticsWithQueryPlan:v6 completionHandler:v27];
    }
    else
    {
      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[FPDXPCServicer _test_getCountersArray:completionHandler:]();
      }

      fpfs_adopt_log();
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = FPPopLogSectionForBlock();
        id v26 = FPProviderNotFoundError();
        *(_DWORD *)buf = 134219010;
        uint64_t v37 = v25;
        __int16 v38 = 2112;
        long long v39 = self;
        __int16 v40 = 2080;
        __int16 v41 = "-[FPDXPCServicer _test_getDBQueryStatistics:queryPlan:completionHandler:]";
        __int16 v42 = 2112;
        uint64_t v43 = 0;
        __int16 v44 = 2112;
        __int16 v45 = v26;
        _os_log_debug_impl(&dword_1D744C000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v24 = FPProviderNotFoundError();
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v24);

      __fp_pop_log();
    }
  }
  else
  {
    uint64_t v21 = FPNotPermittedError();
    v32((uint64_t)v14, v21);
  }
}

void __73__FPDXPCServicer__test_getDBQueryStatistics_queryPlan_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer _test_getDBQueryStatistics:queryPlan:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __73__FPDXPCServicer__test_getDBQueryStatistics_queryPlan_completionHandler___block_invoke_411(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v12 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = FPPopLogSectionForBlock();
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      uint64_t v18 = "-[FPDXPCServicer _test_getDBQueryStatistics:queryPlan:completionHandler:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = 0;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }
  else
  {
    __int16 v12 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = FPPopLogSectionForBlock();
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = "-[FPDXPCServicer _test_getDBQueryStatistics:queryPlan:completionHandler:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = 0;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (id)getSyncPausedXattrForURL:(id)a3
{
  id v3 = a3;
  ssize_t v4 = getxattr((const char *)[v3 fileSystemRepresentation], "com.apple.file-provider-sync_paused_bundle_id#PX", 0, 0, 0, 1);
  if (v4 <= 0)
  {
    if (*__error() != 93)
    {
      uint64_t v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FPDXPCServicer getSyncPausedXattrForURL:]((uint64_t)v3, v9);
      }
    }
    uint64_t v8 = 0;
  }
  else
  {
    size_t v5 = v4;
    id v6 = malloc_type_malloc(v4, 0xB7001ED3uLL);
    ssize_t v7 = getxattr((const char *)[v3 fileSystemRepresentation], "com.apple.file-provider-sync_paused_bundle_id#PX", v6, v5, 0, 1);
    if (v7 < 1) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (void *)[[NSString alloc] initWithBytes:v6 length:v7 encoding:4];
    }
    free(v6);
  }

  return v8;
}

- (void)pauseSyncForItemAtURL:(id)a3 behavior:(unint64_t)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v51 = a5;
  id v10 = a6;
  v71[0] = *MEMORY[0x1E4F25E58];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  id v59 = __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke;
  uint64_t v60 = &unk_1E6A73710;
  long long v61 = self;
  id v12 = v10;
  id v62 = v12;
  id v13 = self;
  id v14 = v9;
  id v15 = v11;
  uint64_t v16 = v58;
  if (!v14)
  {
    uint64_t v36 = FPInvalidParameterError();
LABEL_16:
    uint64_t v37 = (void *)v36;
    v59((uint64_t)v16, (void *)v36);

    goto LABEL_24;
  }
  __int16 v17 = [(FPDXPCServicer *)v13 connection];
  char v18 = objc_msgSend(v17, "fp_hasSandboxAccessToFile:logLevel:", v14, 0);

  if ((v18 & 1) == 0)
  {
    __int16 v19 = [(FPDXPCServicer *)v13 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v21 = objc_msgSend(v19, "fp_hasOneOfEntitlements:logLevel:", v20, 0);

    if ((v21 & 1) == 0)
    {
      id v22 = [(FPDXPCServicer *)v13 connection];
      char v23 = objc_msgSend(v22, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

      if ((v23 & 1) == 0)
      {
        uint64_t v24 = [(FPDXPCServicer *)v13 connection];
        char v25 = objc_msgSend(v24, "fp_isNonSandboxedConnection");

        if ((v25 & 1) == 0)
        {
          uint64_t v36 = FPNotPermittedWriteError();
          goto LABEL_16;
        }
      }
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v13->_connection);
  id v27 = objc_msgSend(WeakRetained, "fp_bundleIdentifier");

  if (v51)
  {
    id v28 = [(FPDXPCServicer *)v13 connection];
    uint64_t v70 = *MEMORY[0x1E4F25E20];
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    int v30 = objc_msgSend(v28, "fp_hasOneOfEntitlements:", v29);

    if (v30)
    {
      id v31 = v51;

      id v27 = v31;
    }
  }
  id v32 = [(FPDXPCServicer *)v13 getSyncPausedXattrForURL:v14];
  if (v32)
  {
    id v33 = fp_current_or_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]();
    }

    fpfs_adopt_log();
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = FPPopLogSectionForBlock();
      __int16 v47 = FPFileIsAlreadyPausedError();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v46;
      __int16 v64 = 2112;
      uint64_t v65 = v13;
      __int16 v66 = 2080;
      id v67 = "-[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]";
      __int16 v68 = 2112;
      id v69 = v47;
      _os_log_debug_impl(&dword_1D744C000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    id v35 = FPFileIsAlreadyPausedError();
    (*((void (**)(id, void *))v12 + 2))(v12, v35);

    __fp_pop_log();
  }
  else
  {
    __int16 v38 = [(FPDXPCServicer *)v13 server];
    uint64_t v39 = [v38 extensionManager];
    __int16 v40 = [(id)v39 domainForURL:v14 reason:0];

    __int16 v41 = [v40 defaultBackend];
    LOBYTE(v39) = objc_opt_respondsToSelector();

    if (v39)
    {
      __int16 v42 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v13 pid]];
      uint64_t v43 = [v40 defaultBackend];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      void v52[2] = __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_415;
      v52[3] = &unk_1E6A75B40;
      id v53 = v40;
      long long v54 = v13;
      id v56 = v12;
      id v55 = v27;
      [v43 pauseSyncForItemAtURL:v14 bundleID:v55 behavior:a4 request:v42 completionHandler:v52];
    }
    else
    {
      fpfs_adopt_log();
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v44 = fp_current_or_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v48 = FPPopLogSectionForBlock();
        __int16 v49 = FPNotSupportedError();
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v48;
        __int16 v64 = 2112;
        uint64_t v65 = v13;
        __int16 v66 = 2080;
        id v67 = "-[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]";
        __int16 v68 = 2112;
        id v69 = v49;
        _os_log_debug_impl(&dword_1D744C000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      __int16 v45 = FPNotSupportedError();
      (*((void (**)(id, void *))v12 + 2))(v12, v45);

      __fp_pop_log();
    }
  }
LABEL_24:
}

void __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  ssize_t v7 = fpfs_adopt_log();
  ssize_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_415(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  ssize_t v7 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2;
  block[3] = &unk_1E6A74AF8;
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v8;
  id v16 = *(id *)(a1 + 56);
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v10 = fpfs_adopt_log();
    id v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = FPPopLogSectionForBlock();
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      char v18 = "-[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]_block_invoke_2";
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log();
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) server];
    ssize_t v4 = [v3 extensionManager];
    uint64_t v12 = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [v4 setPausedSyncItemID:v5 forBundleID:*(void *)(a1 + 56)];

    uint64_t v11 = fpfs_adopt_log();
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log();
  }
}

- (void)resumeSyncForItemAtURL:(id)a3 behavior:(unint64_t)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v52 = a5;
  id v10 = a6;
  v72[0] = *MEMORY[0x1E4F25E58];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  uint64_t v60 = __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke;
  long long v61 = &unk_1E6A73710;
  id v62 = self;
  id v12 = v10;
  id v63 = v12;
  uint64_t v13 = self;
  id v14 = v9;
  id v15 = v11;
  uint64_t v16 = v59;
  if (!v14)
  {
    uint64_t v43 = FPInvalidParameterError();
LABEL_19:
    __int16 v44 = (void *)v43;
    v60((uint64_t)v16, (void *)v43);

    goto LABEL_25;
  }
  __int16 v17 = [(FPDXPCServicer *)v13 connection];
  char v18 = objc_msgSend(v17, "fp_hasSandboxAccessToFile:accessType:logLevel:", v14, *MEMORY[0x1E4F25908], 0);

  if ((v18 & 1) == 0)
  {
    __int16 v19 = [(FPDXPCServicer *)v13 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v21 = objc_msgSend(v19, "fp_hasOneOfEntitlements:logLevel:", v20, 0);

    if ((v21 & 1) == 0)
    {
      id v22 = [(FPDXPCServicer *)v13 connection];
      char v23 = objc_msgSend(v22, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

      if ((v23 & 1) == 0)
      {
        uint64_t v24 = [(FPDXPCServicer *)v13 connection];
        char v25 = objc_msgSend(v24, "fp_isNonSandboxedConnection");

        if ((v25 & 1) == 0)
        {
          uint64_t v43 = FPNotPermittedError();
          goto LABEL_19;
        }
      }
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v13->_connection);
  id v27 = objc_msgSend(WeakRetained, "fp_bundleIdentifier");

  if (v52)
  {
    id v28 = [(FPDXPCServicer *)v13 connection];
    uint64_t v71 = *MEMORY[0x1E4F25E20];
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    int v30 = objc_msgSend(v28, "fp_hasOneOfEntitlements:", v29);

    if (v30)
    {
      id v31 = v52;

      id v27 = v31;
    }
  }
  id v32 = [(FPDXPCServicer *)v13 getSyncPausedXattrForURL:v14];
  id v33 = v32;
  if (v32 && ([v32 isEqualToString:v27] & 1) != 0)
  {
    __int16 v34 = [(FPDXPCServicer *)v13 server];
    uint64_t v35 = [v34 extensionManager];
    uint64_t v36 = [(id)v35 domainForURL:v14 reason:0];

    uint64_t v37 = [v36 defaultBackend];
    LOBYTE(v35) = objc_opt_respondsToSelector();

    if (v35)
    {
      __int16 v38 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v13 pid]];
      uint64_t v39 = [v36 defaultBackend];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_418;
      v53[3] = &unk_1E6A75B40;
      id v54 = v36;
      id v55 = v13;
      id v57 = v12;
      id v56 = v27;
      [v39 resumeSyncForItemAtURL:v14 bundleID:v56 behavior:a4 request:v38 completionHandler:v53];
    }
    else
    {
      fpfs_adopt_log();
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v45 = fp_current_or_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v49 = FPPopLogSectionForBlock();
        __int16 v50 = FPNotSupportedError();
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v49;
        __int16 v65 = 2112;
        __int16 v66 = v13;
        __int16 v67 = 2080;
        __int16 v68 = "-[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]";
        __int16 v69 = 2112;
        uint64_t v70 = v50;
        _os_log_debug_impl(&dword_1D744C000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      uint64_t v46 = FPNotSupportedError();
      (*((void (**)(id, void *))v12 + 2))(v12, v46);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v40 = fp_current_or_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]();
    }

    fpfs_adopt_log();
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v41 = fp_current_or_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v47 = FPPopLogSectionForBlock();
      uint64_t v48 = FPFileNotPausedError();
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v47;
      __int16 v65 = 2112;
      __int16 v66 = v13;
      __int16 v67 = 2080;
      __int16 v68 = "-[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]";
      __int16 v69 = 2112;
      uint64_t v70 = v48;
      _os_log_debug_impl(&dword_1D744C000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    __int16 v42 = FPFileNotPausedError();
    (*((void (**)(id, void *))v12 + 2))(v12, v42);

    __fp_pop_log();
  }

LABEL_25:
}

void __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  ssize_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_418(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2;
  block[3] = &unk_1E6A74AF8;
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v8;
  id v16 = *(id *)(a1 + 56);
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v10 = fpfs_adopt_log();
    id v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = FPPopLogSectionForBlock();
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      char v18 = "-[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]_block_invoke_2";
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log();
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) server];
    ssize_t v4 = [v3 extensionManager];
    uint64_t v12 = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [v4 removePausedSyncItemID:v5 forBundleID:*(void *)(a1 + 56)];

    uint64_t v11 = fpfs_adopt_log();
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    __fp_pop_log();
  }
}

- (void)fetchLatestVersionForItemAtURL:(id)a3 bundleID:(id)a4 completionHandler:(id)a5
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v53 = a4;
  id v9 = a5;
  v74[0] = *MEMORY[0x1E4F25E58];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  id v58 = __76__FPDXPCServicer_fetchLatestVersionForItemAtURL_bundleID_completionHandler___block_invoke;
  id v59 = &unk_1E6A73710;
  uint64_t v60 = self;
  id v11 = v9;
  id v61 = v11;
  uint64_t v12 = self;
  id v13 = v8;
  id v14 = v10;
  __int16 v15 = v57;
  if (!v13)
  {
    uint64_t v44 = FPInvalidParameterError();
LABEL_19:
    __int16 v45 = (void *)v44;
    v58((uint64_t)v15, (void *)v44);

    goto LABEL_25;
  }
  uint64_t v16 = [(FPDXPCServicer *)v12 connection];
  char v17 = objc_msgSend(v16, "fp_hasSandboxAccessToFile:accessType:logLevel:", v13, *MEMORY[0x1E4F25908], 0);

  if ((v17 & 1) == 0)
  {
    char v18 = [(FPDXPCServicer *)v12 connection];
    *(void *)buf = *MEMORY[0x1E4F25E28];
    __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    char v20 = objc_msgSend(v18, "fp_hasOneOfEntitlements:logLevel:", v19, 0);

    if ((v20 & 1) == 0)
    {
      uint64_t v21 = [(FPDXPCServicer *)v12 connection];
      char v22 = objc_msgSend(v21, "fp_hasOneOfEntitlements:logLevel:", v14, 0);

      if ((v22 & 1) == 0)
      {
        char v23 = [(FPDXPCServicer *)v12 connection];
        char v24 = objc_msgSend(v23, "fp_isNonSandboxedConnection");

        if ((v24 & 1) == 0)
        {
          uint64_t v44 = FPNotPermittedError();
          goto LABEL_19;
        }
      }
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v12->_connection);
  id v26 = objc_msgSend(WeakRetained, "fp_bundleIdentifier");

  if (v53)
  {
    id v27 = [(FPDXPCServicer *)v12 connection];
    uint64_t v73 = *MEMORY[0x1E4F25E20];
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    int v29 = objc_msgSend(v27, "fp_hasOneOfEntitlements:", v28);

    if (v29)
    {
      id v30 = v53;

      id v26 = v30;
    }
  }
  id v31 = -[FPDXPCServicer getSyncPausedXattrForURL:](v12, "getSyncPausedXattrForURL:", v13, v53);
  id v32 = v31;
  if (v31 && ([v31 isEqualToString:v26] & 1) != 0)
  {
    id v33 = [(FPDXPCServicer *)v12 server];
    __int16 v34 = [v33 extensionManager];
    uint64_t v35 = [v34 domainForURL:v13 reason:0];

    uint64_t v36 = +[FPDRequest requestForPID:[(FPDXPCServicer *)v12 pid]];
    uint64_t v37 = [v35 defaultBackend];
    char v38 = objc_opt_respondsToSelector();

    if (v38)
    {
      uint64_t v39 = [v35 defaultBackend];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      void v54[2] = __76__FPDXPCServicer_fetchLatestVersionForItemAtURL_bundleID_completionHandler___block_invoke_421;
      v54[3] = &unk_1E6A75DE0;
      void v54[4] = v12;
      id v55 = v11;
      [v39 fetchLatestVersionForURL:v13 request:v36 completionHandler:v54];
    }
    else
    {
      fpfs_adopt_log();
      id v56 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v46 = fp_current_or_default_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v50 = FPPopLogSectionForBlock();
        uint64_t v51 = FPNotSupportedError();
        *(_DWORD *)buf = 134219266;
        *(void *)&uint8_t buf[4] = v50;
        __int16 v63 = 2112;
        __int16 v64 = v12;
        __int16 v65 = 2080;
        __int16 v66 = "-[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]";
        __int16 v67 = 2112;
        uint64_t v68 = 0;
        __int16 v69 = 2112;
        uint64_t v70 = 0;
        __int16 v71 = 2112;
        uint64_t v72 = v51;
        id v52 = (void *)v51;
        _os_log_debug_impl(&dword_1D744C000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
      }
      uint64_t v47 = FPNotSupportedError();
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v47);

      __fp_pop_log();
    }
  }
  else
  {
    __int16 v40 = fp_current_or_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]();
    }

    fpfs_adopt_log();
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v41 = fp_current_or_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v48 = FPPopLogSectionForBlock();
      uint64_t v42 = *MEMORY[0x1E4F25C50];
      uint64_t v49 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F25C50] code:16 userInfo:0];
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v48;
      __int16 v63 = 2112;
      __int16 v64 = v12;
      __int16 v65 = 2080;
      __int16 v66 = "-[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]";
      __int16 v67 = 2112;
      uint64_t v68 = 0;
      __int16 v69 = 2112;
      uint64_t v70 = 0;
      __int16 v71 = 2112;
      uint64_t v72 = (uint64_t)v49;
      _os_log_debug_impl(&dword_1D744C000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
    else
    {
      uint64_t v42 = *MEMORY[0x1E4F25C50];
    }

    uint64_t v43 = [MEMORY[0x1E4F28C58] errorWithDomain:v42 code:16 userInfo:0];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v43);

    __fp_pop_log();
  }

LABEL_25:
}

void __76__FPDXPCServicer_fetchLatestVersionForItemAtURL_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  ssize_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __76__FPDXPCServicer_fetchLatestVersionForItemAtURL_bundleID_completionHandler___block_invoke_421(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v13 = fpfs_adopt_log();
  __int16 v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = FPPopLogSectionForBlock();
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2080;
    id v19 = "-[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)listPausedURLsWithBundleID:(id)a3 completionHandler:(id)a4
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v6 = a4;
  v93[0] = *MEMORY[0x1E4F25E58];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  uint64_t v77 = __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke;
  __int16 v78 = &unk_1E6A73710;
  uint64_t v79 = self;
  id v36 = v6;
  id v80 = v36;
  id v8 = v7;
  id v9 = v76;
  __int16 v10 = [(FPDXPCServicer *)self connection];
  char v11 = objc_msgSend(v10, "fp_hasOneOfEntitlements:", v8);

  if (v11)
  {

    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v43 = objc_msgSend(WeakRetained, "fp_bundleIdentifier");

    if (v37)
    {
      id v13 = [(FPDXPCServicer *)self connection];
      uint64_t v92 = *MEMORY[0x1E4F25E20];
      __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
      int v15 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v14);

      if (v15)
      {
        id v16 = v37;

        uint64_t v43 = v16;
      }
    }
    uint64_t v17 = [(FPDXPCServicer *)self server];
    __int16 v18 = [v17 extensionManager];
    __int16 v40 = [v18 syncPausedFilesForBundleID:v43];

    uint64_t v70 = 0;
    __int16 v71 = &v70;
    uint64_t v72 = 0x3032000000;
    uint64_t v73 = __Block_byref_object_copy__10;
    __int16 v74 = __Block_byref_object_dispose__10;
    id v75 = 0;
    id v75 = (id)objc_opt_new();
    uint64_t v64 = 0;
    __int16 v65 = &v64;
    uint64_t v66 = 0x3032000000;
    __int16 v67 = __Block_byref_object_copy__10;
    uint64_t v68 = __Block_byref_object_dispose__10;
    id v69 = 0;
    id v69 = (id)objc_opt_new();
    uint64_t v58 = 0;
    id v59 = &v58;
    uint64_t v60 = 0x3032000000;
    id v61 = __Block_byref_object_copy__10;
    id v62 = __Block_byref_object_dispose__10;
    dispatch_group_t v63 = 0;
    dispatch_group_t v63 = dispatch_group_create();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = [v40 allKeys];
    uint64_t v41 = [obj countByEnumeratingWithState:&v54 objects:v91 count:16];
    if (v41)
    {
      uint64_t v39 = *(void *)v55;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v55 != v39) {
            objc_enumerationMutation(obj);
          }
          id v19 = [v40 objectForKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * v42)];
          long long v53 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v50 = 0u;
          id v20 = v19;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v90 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v51;
            do
            {
              uint64_t v23 = 0;
              do
              {
                if (*(void *)v51 != v22) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v24 = *(void *)(*((void *)&v50 + 1) + 8 * v23);
                *(void *)buf = 0;
                id v25 = [(FPDXPCServicer *)self server];
                uint64_t v26 = [v25 extensionManager];
                id v27 = [v26 domainFromItemID:v24 checkInvalidation:1 reason:buf];

                if (v27)
                {
                  dispatch_group_enter((dispatch_group_t)v59[5]);
                  id v28 = [v27 defaultBackend];
                  int v29 = +[FPDRequest requestForPID:[(FPDXPCServicer *)self pid]];
                  v45[0] = MEMORY[0x1E4F143A8];
                  v45[1] = 3221225472;
                  v45[2] = __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_423;
                  v45[3] = &unk_1E6A75E08;
                  uint64_t v47 = &v64;
                  uint64_t v48 = &v58;
                  void v45[4] = v24;
                  v45[5] = self;
                  id v46 = v43;
                  uint64_t v49 = &v70;
                  [v28 URLForItemID:v24 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v29 completionHandler:v45];
                }
                else
                {
                  [(id)v65[5] addObject:v24];
                }

                ++v23;
              }
              while (v21 != v23);
              uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v90 count:16];
            }
            while (v21);
          }

          ++v42;
        }
        while (v42 != v41);
        uint64_t v41 = [obj countByEnumeratingWithState:&v54 objects:v91 count:16];
      }
      while (v41);
    }

    dispatch_group_wait((dispatch_group_t)v59[5], 0xFFFFFFFFFFFFFFFFLL);
    id v30 = [(FPDXPCServicer *)self server];
    id v31 = [v30 extensionManager];
    [v31 removePausedSyncItemID:v65[5] forBundleID:v43];

    uint64_t v44 = fpfs_adopt_log();
    id v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = FPPopLogSectionForBlock();
      uint64_t v35 = v71[5];
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v34;
      __int16 v82 = 2112;
      uint64_t v83 = self;
      __int16 v84 = 2080;
      uint64_t v85 = "-[FPDXPCServicer listPausedURLsWithBundleID:completionHandler:]";
      __int16 v86 = 2112;
      uint64_t v87 = v35;
      __int16 v88 = 2112;
      uint64_t v89 = 0;
      _os_log_debug_impl(&dword_1D744C000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, uint64_t, void))v36 + 2))(v36, v71[5], 0);
    __fp_pop_log();

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(&v70, 8);
  }
  else
  {
    id v33 = FPNotPermittedError();
    v77((uint64_t)v9, v33);
  }
}

void __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  ssize_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCServicer listPausedURLsWithBundleID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_423(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_423_cold_1((uint64_t)a1, v5);
    }

    [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:a1[4]];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[8] + 8) + 40));
  }
  else
  {
    id v8 = (void *)a1[5];
    uint64_t v9 = [v6 url];
    __int16 v10 = [v8 getSyncPausedXattrForURL:v9];

    if (v10 && ([v10 isEqualToString:a1[6]] & 1) != 0)
    {
      uint64_t v11 = *(void **)(*(void *)(a1[9] + 8) + 40);
      __int16 v12 = v7;
    }
    else
    {
      __int16 v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_423_cold_2();
      }

      uint64_t v11 = *(void **)(*(void *)(a1[7] + 8) + 40);
      __int16 v12 = (void *)a1[4];
    }
    [v11 addObject:v12];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[8] + 8) + 40));
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_providerServicers, 0);
}

- (void)_providerForIdentifier:enumerateEntitlementRequired:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] can't find the provider for the calling bundle %@", v2);
}

- (void)_providerForIdentifier:enumerateEntitlementRequired:error:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] can't find the provider for identifier %@", v2);
}

- (void)_providerForIdentifier:enumerateEntitlementRequired:error:.cold.3()
{
  OUTLINED_FUNCTION_15();
  id WeakRetained = objc_loadWeakRetained(v0);
  [WeakRetained processIdentifier];
  id v2 = FPExecutableNameForProcessIdentifier();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] %@ is missing enumerate entitlement to lookup %@", v5, v6, v7, v8, v9);
}

void __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] there should be an error specified", v2, v3, v4, v5, v6);
}

- (void)wakeUpForURL:(const char *)a1 completionHandler:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] Serving: %@ for url %@", v4, v5, v6, v7, 2u);
}

- (void)extendBookmarkForItemID:consumerID:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully generated bookmarkable string “%@” from %@.", v1, 0x16u);
}

void __71__FPDXPCServicer_extendBookmarkForItemID_consumerID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 32) connection];
  int v6 = [v5 processIdentifier];
  uint64_t v7 = [*v4 connection];
  [v7 processIdentifier];
  uint64_t v8 = FPExecutableNameForProcessIdentifier();
  uint64_t v9 = *MEMORY[0x1E4F25E08];
  uint64_t v10 = *(void *)(a1 + 40);
  v11[0] = 67109890;
  v11[1] = v6;
  __int16 v12 = 2112;
  id v13 = v8;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  __int16 v16 = 2112;
  uint64_t v17 = v10;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) does not have %@ entitlement to extend bookmark for %@", (uint8_t *)v11, 0x26u);
}

void __74__FPDXPCServicer_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  uint64_t v1 = objc_msgSend(*(id *)(v0 + 48), "fp_shortDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] Successfully generated bookmarkable string “%@” from %@.", v4, v5, v6, v7, v8);
}

- (void)extendSandboxForFileURL:(const char *)a1 fromProviderID:toConsumerID:completionHandler:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] Serving: %@", v4, v5, v6, v7, v8);
}

void __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_18_0(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)evictItemAtURL:(void *)a1 evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] %@ is not associated with a provider", v4, v5, v6, v7, v8);
}

- (void)evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", v5, v6);
}

- (void)evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_34();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(v2, "fp_shortDescription");
  uint64_t v4 = [v1 provider];
  uint64_t v5 = [v4 identifier];
  int v7 = 138412546;
  uint8_t v8 = v3;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v0, v6, "[ERROR] Not evicting item at %@ in provider %@ since it's an enumerating file provider", (uint8_t *)&v7);
}

- (void)evictItemAtURL:(const char *)a1 evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:.cold.5(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] Serving: %@", v4, v5, v6, v7, v8);
}

void __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_124_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_18_0(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", v5, v6);
}

void __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_124_cold_2()
{
  OUTLINED_FUNCTION_34();
  uint64_t v1 = v0;
  uint64_t v2 = [*(id *)(v0 + 32) providerDomainID];
  uint64_t v3 = objc_msgSend(*(id *)(v1 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_1D744C000, v4, v5, "[ERROR] Could not ask provider ID %@ to stop providing item at %@. Error: %@", v6, v7, v8, v9, 2u);
}

- (void)providerDomainsCompletionHandler:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  [a2 count];
  OUTLINED_FUNCTION_6(&dword_1D744C000, v4, v5, "[DEBUG] %@: returning %lu providers", v6, v7, v8, v9, 2u);
}

- (void)providerDomainForURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_6_2(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_7_2(v3, v4);
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)providerDomainForURL:(void *)a1 completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] %@ is not associated with a provider", v4, v5, v6, v7, v8);
}

- (void)documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] Getting URL from bookmarkable string: “%@”.", v2);
}

- (void)documentURLFromItemID:(void *)a1 creatingPlaceholderIfMissing:(NSObject *)a2 ignoreAlternateContentsURL:completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 connection];
  uint64_t v4 = objc_msgSend(v3, "fp_bundleIdentifier");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a2, v5, "[ERROR] Extension %{public}@ is not allowed to access userVisible URLs", v6);
}

- (void)documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] Getting URL from itemID: “%@”.", v2);
}

void __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 40) providerID];
  OUTLINED_FUNCTION_3();
  __int16 v8 = v6;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Provider ID %{public}@ is not allowed to provide item ID %@ to consumer ID %@", v7, 0x20u);
}

- (void)_forceIngestionForItemID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] 🥄 Calling forceIngestion for itemID %@ on domain %@", v4, v5, v6, v7, v8);
}

void __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_173_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] 🆕✅ Item creating complete: new item %@", v2);
}

void __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_173_cold_2()
{
  OUTLINED_FUNCTION_34();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7(v1) itemID];
  uint64_t v3 = [v2 identifier];
  int v5 = 138412546;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v0, v4, "[ERROR] 🆕❌ Create item with ID %@ failed with error %@", (uint8_t *)&v5);
}

- (void)bookmarkableStringFromDocumentURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] Getting bookmarkable string for %@", v4, v5, v6, v7, v8);
}

void __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  *(_DWORD *)uint64_t v0 = 134219010;
  *(void *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2112;
  *(void *)(v0 + 14) = v2;
  *(_WORD *)(v0 + 22) = 2080;
  *(void *)(v0 + 24) = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]_block_invoke";
  *(_WORD *)(v0 + 32) = 2112;
  *(void *)(v0 + 34) = 0;
  *(_WORD *)(v0 + 42) = 2112;
  *(void *)(v0 + 44) = 0;
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v3, v4);
}

void __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_30();
  uint64_t v1 = objc_msgSend(*(id *)(v0 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] Successfully generated bookmarkable string “%@” from %@.", v4, v5, v6, v7, v8);
}

- (void)itemForURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_6_2(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_7_2(v3, v4);
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)itemForURL:(void *)a1 completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no provider for url: %@", v4, v5, v6, v7, v8);
}

- (void)providerItemIDForURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_6_2(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_7_2(v3, v4);
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)providerItemIDForURL:(void *)a1 completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no domain for url: %@", v4, v5, v6, v7, v8);
}

- (void)providerItemIDForURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 provider];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, v5, "[DEBUG] caller does not have access to provider %{public}@", v6);
}

- (void)fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_6_2(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_7_2(v3, v4);
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] no domain for: %@", v2);
}

- (void)trashItemAtURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no domain for url: %@", v4, v5, v6, v7, v8);
}

- (void)putBackURLForTrashedItemAtURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] Error fetching put-back URL: no domain for url: %@", v4, v5, v6, v7, v8);
}

void __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_28(&dword_1D744C000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@, nor the %@ entitlement", v4, v5, v6, v7, v8);
}

- (void)setPutBackInfoOnItemAtURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] Error setting put-back: no domain for url: %@", v4, v5, v6, v7, v8);
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] No provider found", v2, v3, v4, v5, v6);
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] Provider %@ found via app fallback", v2);
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] Provider %@ found via direct fallback", v2);
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] Provider %@ found via universal link lookup", v2);
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_186_cold_5(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 targetApplicationRecord];
  uint8_t v8 = [v7 bundleIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl(&dword_1D744C000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] potential match %@", a1, 0xCu);
}

- (void)updateLastUsedDate:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)updateLastUsedDate:(void *)a1 completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no provider for url: %@", v4, v5, v6, v7, v8);
}

void __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_28(&dword_1D744C000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@, nor the %@ entitlement", v4, v5, v6, v7, v8);
}

- (void)valuesForAttributes:forItemAtURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_6_2(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_7_2(v3, v4);
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)valuesForAttributes:(void *)a1 forItemAtURL:completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no provider for url: %@", v4, v5, v6, v7, v8);
}

void __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_28(&dword_1D744C000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@, nor the %@ entitlement", v4, v5, v6, v7, v8);
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_211_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] cancelling operation because connection was closed: %@", v4, v5, v6, v7, v8);
}

void __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  [*v1 path];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] can't set xattr on %@: %@", v4, v5, v6, v7, v8);
}

void __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke_cold_2(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 path];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] wrote xattr %@ on %@", v5, v6, v7, v8, 2u);
}

- (void)makeTopologicallySortedItemsOnDisk:(os_log_t)log completionHandler:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] faking an fsevent", buf, 2u);
}

- (void)makeTopologicallySortedItemsOnDisk:(void *)a3 completionHandler:(NSObject *)a4 .cold.2(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a4, (uint64_t)a3, "[DEBUG] already exists at %@", a2);
}

void __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke_226_cold_1()
{
  OUTLINED_FUNCTION_15();
  [v1 path];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] can't issue sandbox extension to %@: %@", v4, v5, v6, v7, v8);
}

- (void)updateBlockedProcessNamesForProvider:processNames:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)fetchPathComponentsForURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no provider for url: %@", v4, v5, v6, v7, v8);
}

- (void)triggerDiagnosticsFor:(void *)a1 triggeringError:uiOnly:completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no domain for url: %@", v4, v5, v6, v7, v8);
}

void __81__FPDXPCServicer_triggerDiagnosticsFor_triggeringError_uiOnly_completionHandler___block_invoke_234_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] XPCServicer triggerTTRFor, returned non-yes result", v2, v3, v4, v5, v6);
}

- (void)resolveConflictAtURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no provider for url: %@", v4, v5, v6, v7, v8);
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] importing a domain with known folders is only supported on macOS", v2, v3, v4, v5, v6);
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] fileproviderd requested to import a domain without sandbox access to the source", v2, v3, v4, v5, v6);
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] in-place import is only supported for iCloudDrive", v2, v3, v4, v5, v6);
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] trying to import a domain with a non-fileURL", v2, v3, v4, v5, v6);
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.6()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] Failed to add domain %{public}@ , it has poisoned UUID - on domain init volume URL to volume UUID failed", v2);
}

void __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke_261_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_18_0(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🧹 FPCK launched with unspecified launch type", v2, v3, v4, v5, v6);
}

- (void)runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🧹 FPCK launched with daemon flag", v2, v3, v4, v5, v6);
}

- (void)runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🧹 FPCK launched with XPC flag", v2, v3, v4, v5, v6);
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_273_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] 🧹 Failed to prepare FPCK session, got error %@", v4, v5, v6, v7, v8);
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] 🧹 💔 FP XPC Servicer connection invalidated, forwarding to FPCKService connection", v2, v3, v4, v5, v6);
}

- (void)setAlternateContentsURL:onDocumentURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)setAlternateContentsURL:(void *)a1 onDocumentURL:completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no provider for url: %@", v4, v5, v6, v7, v8);
}

- (void)setAlternateContentsURL:(NSObject *)a1 onDocumentURL:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]";
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a1, a3, "[DEBUG] %s", (uint8_t *)&v3);
}

- (void)setAlternateContentsURL:onDocumentURL:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_30();
  uint64_t v1 = objc_msgSend(v0, "fp_shortDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@", v4, v5, v6, v7, v8);
}

void __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_18_0(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_34();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_7(v2), "fp_shortDescription");
  uint64_t v4 = objc_msgSend(v1, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v0, v5, "[ERROR] Cannot set alternate contents URL on document URL %@: %@", (uint8_t *)&v6);
}

- (void)fetchAlternateContentsURLForDocumentURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_6_2(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_7_2(v3, v4);
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)fetchAlternateContentsURLForDocumentURL:(void *)a1 completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] no provider for url: %@", v4, v5, v6, v7, v8);
}

- (void)fetchAlternateContentsURLForDocumentURL:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_30();
  uint64_t v1 = objc_msgSend(v0, "fp_scopeDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@", v4, v5, v6, v7, v8);
}

- (void)didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_30();
  uint64_t v1 = objc_msgSend(v0, "fp_shortDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@", v4, v5, v6, v7, v8);
}

void __87__FPDXPCServicer_didUpdateAlternateContentsDocumentForDocumentAtURL_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "fp_obfuscatedProviderDomainID");
  uint64_t v6 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_4_0(&dword_1D744C000, v7, v8, "[ERROR] Cannot alert provider that alternate contents document was updated for document URL %@ on provider %@: %@", v9, v10, v11, v12, 2u);
}

- (void)appHasNonUploadedFiles:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8524e-34);
  *(void *)(v3 + 24) = "-[FPDXPCServicer appHasNonUploadedFiles:completionHandler:]";
  *(_WORD *)(v3 + 32) = 1024;
  *(_DWORD *)(v3 + 34) = 0;
  *(_WORD *)(v3 + 38) = v4;
  *(void *)(v3 + 40) = 0;
  _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", v5, 0x30u);
}

- (void)dumpStateTo:providerFilter:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] need a proper file handle to dump state", v2, v3, v4, v5, v6);
}

- (void)createDatabaseCopyOutputPathForDomain:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = [v0 providerDomainID];
  uint64_t v2 = objc_msgSend(v1, "fp_obfuscatedProviderDomainID");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] FPCK - copything database for domain %@ to %@", v5, v6, v7, v8, v9);
}

- (void)createDatabaseCopyOutputPathForDomain:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v0, (uint64_t)v0, "[ERROR] FPCK - Unable to create output directory at %@ for database copy: %@", v1);
}

void __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_7(a1) providerDomainID];
  uint64_t v2 = objc_msgSend(v1, "fp_obfuscatedProviderDomainID");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] FPCK - Database for domain %@ was copied at %@", v5, v6, v7, v8, v9);
}

void __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7(v1) providerDomainID];
  uint64_t v3 = objc_msgSend(v2, "fp_obfuscatedProviderDomainID");
  uint64_t v4 = objc_msgSend(v0, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v5, v6, "[ERROR] FPCK - Couldn't copy database for domain %@: %@", v7, v8, v9, v10, 2u);
}

- (void)scheduleActionOperationWithInfo:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] starting move operation with info: %@", v2);
}

- (void)fetchDaemonOperationIDsWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] fetching daemon operations IDs", v2, v3, v4, v5, v6);
}

- (void)fetchDaemonOperationWithID:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] fetching daemon operations with id %@", v2);
}

- (void)_performWithCheckedEnumerationAttributes:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] no provider associated with the caller, resolving the URL for the item", v2, v3, v4, v5, v6);
}

- (void)_performWithCheckedEnumerationAttributes:(void *)a1 completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = [a1 enumeratedURL];
  uint64_t v2 = objc_msgSend(v1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v3, v4, "[DEBUG] Caller does not have sandbox access to %@", v5, v6, v7, v8, v9);
}

- (void)_performWithCheckedEnumerationAttributes:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] by-passing entitlement check", v2, v3, v4, v5, v6);
}

void __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7(v1) enumeratedItemID];
  uint64_t v3 = objc_msgSend(v0, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v4, v5, "[DEBUG] Could not find URL for item %@: %@", v6, v7, v8, v9, v10);
}

void __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 url];
  uint64_t v2 = objc_msgSend(v1, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v3, v4, "[DEBUG] Caller does not have sandbox access to %@", v5, v6, v7, v8, v9);
}

- (void)preventDiskImportSchedulerFromRunning:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)dumpIndexerInfoFor:withName:to:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)signalReindexCSIdentifiersByProviderDomainID:indexReason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_381_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, a3, "[DEBUG] Did finish signaling reindex of items for domain: %@", (uint8_t *)&v4);
}

void __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_381_cold_2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] Found error while attempting to signal items: %@", v4, v5, v6, v7, v8);
}

- (void)_test_setDocIDResolutionPolicy:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  *(_DWORD *)uint64_t v0 = 134218498;
  *(void *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2112;
  *(void *)(v0 + 14) = v2;
  *(_WORD *)(v0 + 22) = 2080;
  *(void *)(v0 + 24) = "-[FPDXPCServicer _test_setDocIDResolutionPolicy:completionHandler:]";
  _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s @", v3, 0x20u);
}

- (void)_test_callRemoveTrashedItemsOlderThanDate:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke_391_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_18_0(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_simulateInstallOfBundleID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_simulateUninstallOfBundleID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_getRootSupportDirURLForDomainURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __75__FPDXPCServicer__test_getRootSupportDirURLForDomainURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_18_0(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_getCountersArray:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_6_2(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_7_2(v3, v4);
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)_test_getCountersArray:completionHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] no provider for id: %@", v2);
}

- (void)_test_resetCounters:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_0_7(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_9_1(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_queryDiskImportSchedulerLabel:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = OUTLINED_FUNCTION_6_2(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_7_2(v3, v4);
  OUTLINED_FUNCTION_15_0(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)getSyncPausedXattrForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] failed to get xattr for %{public}@: %d", (uint8_t *)&v5, 0x12u);
}

- (void)pauseSyncForItemAtURL:behavior:bundleID:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v0, (uint64_t)v0, "[ERROR] item %{public}@ already paused by: %@", v1);
}

void __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_18_0(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)resumeSyncForItemAtURL:behavior:bundleID:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] bundleID mismatch: %@", v2);
}

void __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_18_0(v3, v4);
  OUTLINED_FUNCTION_4_4(&dword_1D744C000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)fetchLatestVersionForItemAtURL:bundleID:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] bad bundle id on xattr: %@", v2);
}

void __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_423_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] failed to get URL for %@: %@", v5, v6, v7, v8, v9);
}

void __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_423_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] bad bundleID on xattr: %@, removing from list", v2);
}

@end