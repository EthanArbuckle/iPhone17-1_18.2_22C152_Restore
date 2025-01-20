@interface FPDaemonConnection
+ (BOOL)runningInSyncBubble;
+ (NSString)disallowedConnectionReason;
+ (id)connectionForUser:(unsigned int)a3;
+ (id)remoteObjectProxyWithErrorHandler:(id)a3;
+ (id)sharedConnection;
+ (id)sharedConnectionProxy;
+ (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
+ (id)synchronousSharedConnectionProxy;
+ (void)setDisallowedConnectionReason:(id)a3;
- (FPDaemonConnection)initWithUser:(unsigned int)a3;
- (id)bookmarkableStringFromDocumentURL:(id)a3 error:(id *)a4;
- (id)connectionProxy;
- (id)documentURLFromBookmarkableString:(id)a3 error:(id *)a4;
- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 completionHandler:(id)a6;
- (id)listOfMonitoredAppsWithError:(id *)a3;
- (id)makeTopologicallySortedItemsOnDisk:(id)a3 error:(id *)a4;
- (id)newXPCConnection;
- (id)nonErrorCheckingConnection;
- (id)valuesForAttributes:(id)a3 forItemAtURL:(id)a4 error:(id *)a5;
- (unsigned)user;
- (void)_test_callFileProviderManagerAPIs:(id)a3;
- (void)_test_retrieveItemWithName:(id)a3 completionHandler:(id)a4;
- (void)_test_setDocIDResolutionPolicy:(BOOL)a3 completionHandler:(id)a4;
- (void)attachItemWithID:(id)a3 completionHandler:(id)a4;
- (void)attachItemWithID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)backUpUserURL:(id)a3 outputUserURL:(id)a4 completionHandler:(id)a5;
- (void)bookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4;
- (void)calculateNonPurgeableSpaceUsageOfDomain:(id)a3 completionHandler:(id)a4;
- (void)copyDatabaseForFPCKStartingAtPath:(id)a3 completionHandler:(id)a4;
- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 completionHandler:(id)a8;
- (void)detachItemWithID:(id)a3 relocatingAtURL:(id)a4 completionHandler:(id)a5;
- (void)detachItemWithID:(id)a3 relocatingAtURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4;
- (void)documentURLFromBookmarkableString:(id)a3 completionHandler:(id)a4;
- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6;
- (void)dumpIndexerInfoFor:(id)a3 withName:(id)a4 to:(id)a5 completionHandler:(id)a6;
- (void)dumpStateTo:(id)a3 providerFilter:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)dumpTelemetryTo:(id)a3 providerFilter:(id)a4 completionHandler:(id)a5;
- (void)evictItemWithID:(id)a3 completionHandler:(id)a4;
- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 completionHandler:(id)a5;
- (void)extendBookmarkForFileURL:(id)a3 toConsumerID:(id)a4 completionHandler:(id)a5;
- (void)extendSandboxAndCreatePlaceholderForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6;
- (void)extendSandboxForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6;
- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 completionHandler:(id)a5;
- (void)fetchDomainServicerForProviderDomainID:(id)a3 handler:(id)a4;
- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4;
- (void)forceIngestionForItemIDs:(id)a3 completionHandler:(id)a4;
- (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4;
- (void)getPersonaForProvider:(id)a3 completionHandler:(id)a4;
- (void)getURLForContainerWithItemID:(id)a3 inDataScopeDomainWithIdentifier:(id)a4 documentsScopeDomainIdentifier:(id)a5 documentsFolderItemIdentifier:(id)a6 completionHandler:(id)a7;
- (void)importDetachedFolder:(id)a3 parentID:(id)a4 logicalName:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)makeTopologicallySortedItemsOnDisk:(id)a3 completionHandler:(id)a4;
- (void)pinItemWithID:(id)a3 completionHandler:(id)a4;
- (void)providerDomainsCompletionHandler:(id)a3;
- (void)providersCompletionHandler:(id)a3;
- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4;
- (void)restoreUserURL:(id)a3 cleanupOnSuccess:(BOOL)a4 completionHandler:(id)a5;
- (void)restoreUserURL:(id)a3 completionHandler:(id)a4;
- (void)restoreUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 completionHandler:(id)a6;
- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 options:(unint64_t)a5 reason:(unint64_t)a6 completionHandler:(id)a7;
- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 url:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 url:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 completionHandler:(id)a8;
- (void)runFPCKForDomainWithID:(id)a3 domainRootURL:(id)a4 databaseBackupPath:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 launchType:(unint64_t)a8 completionHandler:(id)a9;
- (void)setUser:(unsigned int)a3;
- (void)spotlightReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5;
- (void)spotlightReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6;
- (void)startProvidingItemAtURL:(id)a3 fromProviderID:(id)a4 forConsumerID:(id)a5 completionHandler:(id)a6;
- (void)stateForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)triggerDiagnosticsFor:(id)a3 triggeringError:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)unpinItemWithID:(id)a3 completionHandler:(id)a4;
- (void)updateLastUsedDateForFileURL:(id)a3 completionHandler:(id)a4;
- (void)waitForStabilizationOfDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)wakeUpForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation FPDaemonConnection

- (id)listOfMonitoredAppsWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  id v15 = 0;
  v4 = [(FPDaemonConnection *)self connectionProxy];
  v5 = [v4 synchronousRemoteObjectProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__FPDaemonConnection_listOfMonitoredAppsWithError___block_invoke;
  v9[3] = &unk_1E5AF3DD8;
  v9[4] = &v16;
  v9[5] = &v10;
  [v5 fetchListOfMonitoredApps:v9];

  if (a3)
  {
    v6 = (void *)v11[5];
    if (v6) {
      *a3 = v6;
    }
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (id)newXPCConnection
{
  v2 = self;
  objc_sync_enter(v2);
  if (daemonConnectionDisallowedReason)
  {
    v6 = [NSString stringWithFormat:@"Establishing connection to fileproviderd is disallowed in this context: %@", daemonConnectionDisallowedReason];
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      FPPerformWithPersona_cold_1();
    }

    __assert_rtn("-[FPDaemonConnection newXPCConnection]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPDaemonConnection.m", 125, (const char *)[v6 UTF8String]);
  }
  objc_sync_exit(v2);

  v3 = FPDDaemonXPCInterface();
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.FileProvider" options:0];
  [v4 setRemoteObjectInterface:v3];

  return v4;
}

+ (id)synchronousSharedConnectionProxy
{
  v2 = +[FPDaemonConnection sharedConnection];
  v3 = [v2 connectionProxy];
  v4 = [v3 synchronousRemoteObjectProxy];

  return v4;
}

+ (id)sharedConnectionProxy
{
  v2 = +[FPDaemonConnection sharedConnection];
  v3 = [v2 connectionProxy];

  return v3;
}

- (id)connectionProxy
{
  v3 = [FPXPCAutomaticErrorProxy alloc];
  v4 = [(FPDaemonConnection *)self nonErrorCheckingConnection];
  v5 = [(FPXPCAutomaticErrorProxy *)v3 initWithConnection:v4 protocol:&unk_1EF6EE180 orError:0 name:@"FPDaemonConnection proxy" requestPid:getpid()];

  [(FPXPCAutomaticErrorProxy *)v5 setSanitizeErrors:0];

  return v5;
}

- (id)nonErrorCheckingConnection
{
  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (connection)
  {
    v4 = connection;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_initLocalizationStrings");
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_INFO, "[INFO] Creating new FPDaemonConnection connection.", buf, 2u);
    }

    id v6 = [(FPDaemonConnection *)v2 newXPCConnection];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v2);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__FPDaemonConnection_nonErrorCheckingConnection__block_invoke;
    v13[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v14, (id *)buf);
    [v6 setInvalidationHandler:v13];
    id location = 0;
    objc_initWeak(&location, v6);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__FPDaemonConnection_nonErrorCheckingConnection__block_invoke_13;
    v10[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v11, &location);
    [v6 setInterruptionHandler:v10];
    [v6 resume];
    id v7 = v2->_connection;
    v2->_connection = (FPDDaemon *)v6;
    id v8 = v6;

    v4 = v2->_connection;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v2);

  return v4;
}

+ (id)sharedConnection
{
  id v2 = fp_default_log();
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_29);
  }
  v3 = (void *)sharedConnection_connection;

  return v3;
}

void __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke_cold_1(v5);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)providerDomainsCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FPDaemonConnection *)self connectionProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF3BF8;
  id v8 = v4;
  id v6 = v4;
  [v5 providerDomainsCompletionHandler:v7];
}

uint64_t __38__FPDaemonConnection_sharedConnection__block_invoke()
{
  sharedConnection_connection = [[FPDaemonConnection alloc] initWithUser:0];

  return MEMORY[0x1F41817F8]();
}

- (FPDaemonConnection)initWithUser:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPDaemonConnection;
  result = [(FPDaemonConnection *)&v5 init];
  if (result) {
    result->_user = a3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_getAttributeConnectionsIdleCleanupTimer, 0);
  objc_storeStrong((id *)&self->_getAttributeConnections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);

  objc_storeStrong((id *)&self->_connectionQueueConnection, 0);
}

void __51__FPDaemonConnection_listOfMonitoredAppsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

+ (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedConnection];
  uint64_t v6 = [v5 nonErrorCheckingConnection];
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v4];

  return v7;
}

+ (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedConnection];
  uint64_t v6 = [v5 nonErrorCheckingConnection];
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v7;
}

+ (id)connectionForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = fp_default_log();
  if (connectionForUser__onceToken != -1) {
    dispatch_once(&connectionForUser__onceToken, &__block_literal_global_2_0);
  }
  id v5 = (id)connectionForUser__connectionByUID;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)connectionForUser__connectionByUID;
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v8 = [[FPDaemonConnection alloc] initWithUser:v3];
    uint64_t v9 = (void *)connectionForUser__connectionByUID;
    uint64_t v10 = [NSNumber numberWithUnsignedInt:v3];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  objc_sync_exit(v5);

  return v8;
}

uint64_t __40__FPDaemonConnection_connectionForUser___block_invoke()
{
  connectionForUser__connectionByUID = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (void)setDisallowedConnectionReason:(id)a3
{
  id v4 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  id v5 = (void *)daemonConnectionDisallowedReason;
  daemonConnectionDisallowedReason = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (NSString)disallowedConnectionReason
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)daemonConnectionDisallowedReason;
  objc_sync_exit(v2);

  return (NSString *)v3;
}

void __48__FPDaemonConnection_nonErrorCheckingConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_INFO, "[INFO] FPDaemonConnection invalidated.", v6, 2u);
    }

    id v5 = (void *)v3[6];
    v3[6] = 0;

    objc_sync_exit(v3);
  }
}

void __48__FPDaemonConnection_nonErrorCheckingConnection__block_invoke_13(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_INFO, "[INFO] FPDaemonConnection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

+ (BOOL)runningInSyncBubble
{
  if (runningInSyncBubble_onceToken != -1) {
    dispatch_once(&runningInSyncBubble_onceToken, &__block_literal_global_235);
  }
  return runningInSyncBubble_res;
}

void __41__FPDaemonConnection_runningInSyncBubble__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  if ([v2 isSharedIPad])
  {
    v0 = [v2 currentUser];
    int v1 = [v0 uid];
    runningInSyncBubble_res = v1 != geteuid();
  }
  else
  {
    runningInSyncBubble_res = 0;
  }
}

- (void)wakeUpForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__FPDaemonConnection_wakeUpForURL_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF3BD0;
  id v11 = v6;
  id v9 = v6;
  [v8 wakeUpForURL:v7 completionHandler:v10];
}

void __53__FPDaemonConnection_wakeUpForURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__FPDaemonConnection_wakeUpForURL_completionHandler___block_invoke_cold_1(v5);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)extendSandboxForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  FPNotSupportedError();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (void)extendSandboxAndCreatePlaceholderForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  FPNotSupportedError();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void, void, void))a6 + 2))(v7, v8, 0, 0, 0);
}

- (void)startProvidingItemAtURL:(id)a3 fromProviderID:(id)a4 forConsumerID:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  FPNotSupportedError();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);
}

- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  v13 = [(FPDaemonConnection *)self connectionProxy];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__FPDaemonConnection_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler___block_invoke;
  v18[3] = &unk_1E5AF0800;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  uint64_t v16 = [v13 evictItemAtURL:v15 evenIfEnumeratingFP:v8 andClearACLForConsumer:v12 completionHandler:v18];

  return v16;
}

void __98__FPDaemonConnection_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __98__FPDaemonConnection_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler___block_invoke_cold_1(a1, v3);
    }
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = *MEMORY[0x1E4F281F8];
    v16[0] = @"NSFileProviderErrorDomain";
    v16[1] = v5;
    v16[2] = *MEMORY[0x1E4F28798];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    id v7 = objc_msgSend(v3, "fp_unwrappedErrorForDomains:", v6);

    if (objc_msgSend(v7, "fp_isPOSIXErrorCode:", 16))
    {
      BOOL v8 = [v3 userInfo];
      id v9 = [v8 objectForKey:*MEMORY[0x1E4F28228]];

      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      id v15 = v7;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      v13 = [v11 errorWithDomain:v5 code:255 userInfo:v12];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)evictItemWithID:(id)a3 completionHandler:(id)a4
{
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(FPDaemonConnection *)self connectionProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__FPDaemonConnection_evictItemWithID_evictionReason_completionHandler___block_invoke;
  v13[3] = &unk_1E5AF0800;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 evictItemWithID:v12 evictionReason:v6 completionHandler:v13];
}

void __71__FPDaemonConnection_evictItemWithID_evictionReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__FPDaemonConnection_evictItemWithID_evictionReason_completionHandler___block_invoke_cold_1(a1, v3);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)pinItemWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  [v8 pinItemWithID:v7 completionHandler:v6];
}

- (void)unpinItemWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  [v8 unpinItemWithID:v7 completionHandler:v6];
}

- (void)providersCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPDaemonConnection *)self connectionProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FPDaemonConnection_providersCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF3BF8;
  id v8 = v4;
  id v6 = v4;
  [v5 providerDomainsCompletionHandler:v7];
}

void __49__FPDaemonConnection_providersCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke_cold_1(v5);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)fetchDomainServicerForProviderDomainID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FPDaemonConnection *)self connectionProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__FPDaemonConnection_fetchDomainServicerForProviderDomainID_handler___block_invoke;
  v11[3] = &unk_1E5AF3C20;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 fetchDomainServicerForProviderDomainID:v10 handler:v11];
}

void __69__FPDaemonConnection_fetchDomainServicerForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __69__FPDaemonConnection_fetchDomainServicerForProviderDomainID_handler___block_invoke_cold_1(a1, v9);
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v7, v8, v9);
  }
}

- (void)extendBookmarkForFileURL:(id)a3 toConsumerID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(FPDaemonConnection *)self connectionProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__FPDaemonConnection_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke;
  v14[3] = &unk_1E5AF3C48;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 extendBookmarkForFileURL:v13 toConsumerID:v10 completionHandler:v14];
}

void __78__FPDaemonConnection_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__FPDaemonConnection_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke_cold_1(a1, v6);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)updateLastUsedDateForFileURL:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"FPDaemonConnection.m", 387, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v8 = [(FPDaemonConnection *)self connectionProxy];
  [v8 updateLastUsedDate:v10 completionHandler:v7];
}

- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"FPDaemonConnection.m", 392, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v9 = [(FPDaemonConnection *)self connectionProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__FPDaemonConnection_forceIngestionForItemID_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF0790;
  id v13 = v8;
  id v10 = v8;
  [v9 forceIngestionForItemID:v7 completionHandler:v12];
}

void __64__FPDaemonConnection_forceIngestionForItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__FPDaemonConnection_forceIngestionForItemID_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceIngestionForItemIDs:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"FPDaemonConnection.m", 402, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v9 = [(FPDaemonConnection *)self connectionProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__FPDaemonConnection_forceIngestionForItemIDs_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF3C70;
  id v13 = v8;
  id v10 = v8;
  [v9 forceIngestionForItemIDs:v7 completionHandler:v12];
}

void __65__FPDaemonConnection_forceIngestionForItemIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__FPDaemonConnection_forceIngestionForItemIDs_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"FPDaemonConnection.m", 413, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v9 = [(FPDaemonConnection *)self connectionProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__FPDaemonConnection_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke;
  v12[3] = &unk_1E5AF3C98;
  id v13 = v8;
  id v10 = v8;
  [v9 forceLatestVersionOnDiskForItemID:v7 completionHandler:v12];
}

void __74__FPDaemonConnection_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__FPDaemonConnection_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke_cold_1(v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)detachItemWithID:(id)a3 relocatingAtURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(FPDaemonConnection *)self connectionProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__FPDaemonConnection_detachItemWithID_relocatingAtURL_options_completionHandler___block_invoke;
  v17[3] = &unk_1E5AF3CC0;
  id v18 = v10;
  id v19 = v11;
  id v21 = v12;
  unint64_t v22 = a5;
  id v20 = self;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [v13 documentURLFromItemID:v15 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 completionHandler:v17];
}

void __81__FPDaemonConnection_detachItemWithID_relocatingAtURL_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v18 = *(void *)(a1 + 56);
    if (v9)
    {
      (*(void (**)(void, id))(v18 + 16))(*(void *)(a1 + 56), v9);
    }
    else
    {
      id v19 = [*(id *)(a1 + 32) identifier];
      id v20 = FPItemNotFoundError((uint64_t)v19);
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v20);
    }
  }
  else
  {
    id v11 = [NSFileProviderKnownFolderDescriptor alloc];
    id v12 = *(void **)(a1 + 40);
    id v13 = v12;
    if (!v12)
    {
      id v13 = [v7 url];
    }
    id v14 = [v7 url];
    id v15 = [(NSFileProviderKnownFolderDescriptor *)v11 initWithKnownFolder:v13 logicalLocation:v14 detachOptions:*(void *)(a1 + 64)];

    if (!v12) {
    id v16 = *(void **)(a1 + 48);
    }
    v21[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v16 detachKnownFolders:v17 completionHandler:*(void *)(a1 + 56)];
  }
}

- (void)detachItemWithID:(id)a3 relocatingAtURL:(id)a4 completionHandler:(id)a5
{
}

- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  [v8 detachKnownFolders:v7 completionHandler:v6];
}

- (void)importDetachedFolder:(id)a3 parentID:(id)a4 logicalName:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(FPDaemonConnection *)self connectionProxy];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __90__FPDaemonConnection_importDetachedFolder_parentID_logicalName_options_completionHandler___block_invoke;
  v21[3] = &unk_1E5AF3CE8;
  id v22 = v13;
  id v23 = v14;
  id v26 = v15;
  unint64_t v27 = a6;
  id v24 = v12;
  v25 = self;
  id v17 = v12;
  id v18 = v14;
  id v19 = v13;
  id v20 = v15;
  [v16 documentURLFromItemID:v19 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 completionHandler:v21];
}

void __90__FPDaemonConnection_importDetachedFolder_parentID_logicalName_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v16 = *(void *)(a1 + 64);
    if (v9)
    {
      (*(void (**)(void, id))(v16 + 16))(*(void *)(a1 + 64), v9);
    }
    else
    {
      id v17 = [*(id *)(a1 + 32) identifier];
      id v18 = FPItemNotFoundError((uint64_t)v17);
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v18);
    }
  }
  else
  {
    id v11 = [v7 url];
    id v12 = [v11 URLByAppendingPathComponent:*(void *)(a1 + 40) isDirectory:1];

    id v13 = [[NSFileProviderKnownFolderDescriptor alloc] initWithKnownFolder:*(void *)(a1 + 48) logicalLocation:v12 detachOptions:*(void *)(a1 + 72)];
    id v14 = *(void **)(a1 + 56);
    v19[0] = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v14 detachKnownFolders:v15 completionHandler:*(void *)(a1 + 64)];
  }
}

- (void)attachItemWithID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(FPDaemonConnection *)self connectionProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__FPDaemonConnection_attachItemWithID_options_completionHandler___block_invoke;
  v13[3] = &unk_1E5AF3D10;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v8;
  id v12 = v9;
  [v10 documentURLFromItemID:v11 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 completionHandler:v13];
}

void __65__FPDaemonConnection_attachItemWithID_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (v9)
    {
      (*(void (**)(void, id))(v14 + 16))(*(void *)(a1 + 48), v9);
    }
    else
    {
      id v15 = [*(id *)(a1 + 32) identifier];
      id v16 = FPItemNotFoundError((uint64_t)v15);
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);
    }
  }
  else
  {
    id v11 = *(void **)(a1 + 40);
    id v12 = [v7 url];
    v17[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v11 attachKnownFolders:v13 options:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)attachItemWithID:(id)a3 completionHandler:(id)a4
{
}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(FPDaemonConnection *)self connectionProxy];
  [v10 attachKnownFolders:v9 options:a4 completionHandler:v8];
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v19 = a3;
  id v15 = a5;
  id v16 = a8;
  if (!v16)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"FPDaemonConnection.m", 490, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  unint64_t v17 = [(FPDaemonConnection *)self connectionProxy];
  [v17 createItemBasedOnTemplate:v19 fields:a4 urlWrapper:v15 options:a6 bounceOnCollision:v9 completionHandler:v16];
}

- (void)bookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  [v8 bookmarkableStringFromDocumentURL:v7 completionHandler:v6];
}

- (id)bookmarkableStringFromDocumentURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__15;
  id v23 = __Block_byref_object_dispose__15;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__15;
  unint64_t v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  id v7 = [(FPDaemonConnection *)self connectionProxy];
  id v8 = [v7 synchronousRemoteObjectProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__FPDaemonConnection_bookmarkableStringFromDocumentURL_error___block_invoke;
  v12[3] = &unk_1E5AF3D38;
  void v12[4] = &v19;
  v12[5] = &v13;
  [v8 bookmarkableStringFromDocumentURL:v6 completionHandler:v12];

  if (a4)
  {
    BOOL v9 = (void *)v14[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __62__FPDaemonConnection_bookmarkableStringFromDocumentURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)documentURLFromBookmarkableString:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__FPDaemonConnection_documentURLFromBookmarkableString_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF3D60;
  id v11 = v6;
  id v9 = v6;
  [v8 documentURLFromBookmarkableString:v7 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 completionHandler:v10];
}

void __74__FPDaemonConnection_documentURLFromBookmarkableString_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = a4;
    id v7 = [a2 url];
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
  }
}

- (id)documentURLFromBookmarkableString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__15;
  id v23 = __Block_byref_object_dispose__15;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__15;
  unint64_t v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  id v7 = [(FPDaemonConnection *)self connectionProxy];
  id v8 = [v7 synchronousRemoteObjectProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__FPDaemonConnection_documentURLFromBookmarkableString_error___block_invoke;
  v12[3] = &unk_1E5AF3D88;
  void v12[4] = &v19;
  v12[5] = &v13;
  [v8 documentURLFromBookmarkableString:v6 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 completionHandler:v12];

  if (a4)
  {
    id v9 = (void *)v14[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __62__FPDaemonConnection_documentURLFromBookmarkableString_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = [a2 url];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (id)valuesForAttributes:(id)a3 forItemAtURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15;
  v29 = __Block_byref_object_dispose__15;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__15;
  id v23 = __Block_byref_object_dispose__15;
  id v24 = 0;
  uint64_t v10 = [(FPDaemonConnection *)self connectionProxy];
  id v11 = [v10 synchronousRemoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__FPDaemonConnection_valuesForAttributes_forItemAtURL_error___block_invoke;
  v15[3] = &unk_1E5AF3DB0;
  id v12 = v9;
  id v16 = v12;
  unint64_t v17 = &v19;
  id v18 = &v25;
  [v11 valuesForAttributes:v8 forItemAtURL:v12 completionHandler:v15];

  if (a5) {
    *a5 = (id) v26[5];
  }
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __61__FPDaemonConnection_valuesForAttributes_forItemAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __61__FPDaemonConnection_valuesForAttributes_forItemAtURL_error___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

- (void)dumpStateTo:(id)a3 providerFilter:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(FPDaemonConnection *)self connectionProxy];
  [v13 dumpStateTo:v12 providerFilter:v11 options:a5 completionHandler:v10];
}

- (void)dumpTelemetryTo:(id)a3 providerFilter:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FPDaemonConnection *)self connectionProxy];
  [v11 dumpTelemetryTo:v10 providerFilter:v9 completionHandler:v8];
}

- (void)getPersonaForProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(FPDaemonConnection *)self connectionProxy];
  id v8 = [v9 synchronousRemoteObjectProxy];
  [v8 getPersonaForProvider:v7 completionHandler:v6];
}

- (void)copyDatabaseForFPCKStartingAtPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  void v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__15;
  void v17[4] = __Block_byref_object_dispose__15;
  id v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__15;
  void v15[4] = __Block_byref_object_dispose__15;
  id v16 = 0;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  id v9 = [v8 synchronousRemoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__FPDaemonConnection_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF3E00;
  id v13 = v17;
  uint64_t v14 = v15;
  id v10 = v7;
  id v12 = v10;
  [v9 copyDatabaseForFPCKStartingAtPath:v6 completionHandler:v11];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

void __74__FPDaemonConnection_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke(void *a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [v6 copy];

  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)waitForStabilizationOfDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(FPDaemonConnection *)self connectionProxy];
  uint64_t v8 = [v9 synchronousRemoteObjectProxy];
  [v8 waitForStabilizationOfDomainWithID:v7 completionHandler:v6];
}

- (void)spotlightReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(FPDaemonConnection *)self connectionProxy];
  id v11 = [v12 synchronousRemoteObjectProxy];
  [v11 spotlightReindexAllItemsForBundleID:v10 protectionClass:v9 completionHandler:v8];
}

- (void)spotlightReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [(FPDaemonConnection *)self connectionProxy];
  uint64_t v14 = [v15 synchronousRemoteObjectProxy];
  [v14 spotlightReindexItemsWithIdentifiers:v13 bundleID:v12 protectionClass:v11 completionHandler:v10];
}

- (void)_test_setDocIDResolutionPolicy:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(FPDaemonConnection *)self connectionProxy];
  objc_msgSend(v7, "_test_setDocIDResolutionPolicy:completionHandler:", v4, v6);
}

- (void)_test_retrieveItemWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__FPDaemonConnection__test_retrieveItemWithName_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF3A58;
  id v11 = v6;
  id v9 = v6;
  objc_msgSend(v8, "_test_retrieveItemWithName:completionHandler:", v7, v10);
}

void __67__FPDaemonConnection__test_retrieveItemWithName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 url];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)_test_callFileProviderManagerAPIs:(id)a3
{
  id v4 = a3;
  id v5 = [(FPDaemonConnection *)self connectionProxy];
  objc_msgSend(v5, "_test_callFileProviderManagerAPIs:", v4);
}

- (void)makeTopologicallySortedItemsOnDisk:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  [v8 makeTopologicallySortedItemsOnDisk:v7 completionHandler:v6];
}

- (id)makeTopologicallySortedItemsOnDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__15;
  id v23 = __Block_byref_object_dispose__15;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__15;
  unint64_t v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  id v7 = [(FPDaemonConnection *)self connectionProxy];
  id v8 = [v7 synchronousRemoteObjectProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__FPDaemonConnection_makeTopologicallySortedItemsOnDisk_error___block_invoke;
  v12[3] = &unk_1E5AF3E28;
  void v12[4] = &v19;
  v12[5] = &v13;
  [v8 makeTopologicallySortedItemsOnDisk:v6 completionHandler:v12];

  id v9 = (void *)v14[5];
  if (v9)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    id v10 = (id)v20[5];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __63__FPDaemonConnection_makeTopologicallySortedItemsOnDisk_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)getURLForContainerWithItemID:(id)a3 inDataScopeDomainWithIdentifier:(id)a4 documentsScopeDomainIdentifier:(id)a5 documentsFolderItemIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  unint64_t v17 = [(FPDaemonConnection *)self connectionProxy];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __162__FPDaemonConnection_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke;
  v19[3] = &unk_1E5AF3D60;
  id v20 = v12;
  id v18 = v12;
  [v17 getURLForContainerWithItemID:v16 inDataScopeDomainWithIdentifier:v15 documentsScopeDomainIdentifier:v14 documentsFolderItemIdentifier:v13 completionHandler:v19];
}

void __162__FPDaemonConnection_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v10 = [a2 url];
  uint64_t v9 = [v8 url];

  (*(void (**)(uint64_t, id, void *, id))(v6 + 16))(v6, v10, v9, v7);
}

- (void)backUpUserURL:(id)a3 outputUserURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FPDaemonConnection *)self connectionProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke;
  v13[3] = &unk_1E5AF1A60;
  id v14 = v8;
  id v12 = v8;
  [v11 backUpUserURL:v10 outputUserURL:v9 completionHandler:v13];
}

void __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke_cold_2();
    }

    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [v5 path];
    int v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      id v17 = 0;
      char v11 = [v8 removeItemAtURL:v5 error:&v17];
      id v12 = v17;
      if ((v11 & 1) == 0)
      {
        id v13 = fp_current_or_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke_cold_1();
        }
      }
    }
    id v14 = [v6 domain];
    if ([v14 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v15 = [v6 code];

      if (v15 == 4099)
      {
        id v16 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_16:
        v16();

        goto LABEL_17;
      }
    }
    else
    {
    }
    id v16 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_17:
}

- (void)restoreUserURL:(id)a3 completionHandler:(id)a4
{
}

- (void)restoreUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(FPDaemonConnection *)self connectionProxy];
  [v14 restoreUserURL:v13 fromBuild:v12 restoreType:v11 cleanupOnSuccess:1 completionHandler:v10];
}

- (void)restoreUserURL:(id)a3 cleanupOnSuccess:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(FPDaemonConnection *)self connectionProxy];
  [v10 restoreUserURL:v9 fromBuild:0 restoreType:@"fileproviderctl" cleanupOnSuccess:v5 completionHandler:v8];
}

- (void)stateForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__FPDaemonConnection_stateForDomainWithID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF3E50;
  id v11 = v6;
  id v9 = v6;
  [v8 stateForDomainWithID:v7 completionHandler:v10];
}

uint64_t __61__FPDaemonConnection_stateForDomainWithID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 url:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
}

- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 url:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 completionHandler:(id)a8
{
}

- (void)runFPCKForDomainWithID:(id)a3 databasesBackupsPath:(id)a4 options:(unint64_t)a5 reason:(unint64_t)a6 completionHandler:(id)a7
{
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  if ([v14 count] != 1)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"FPDaemonConnection.m", 808, @"%s Too many arguments supplied for databasesBackupsPath.", "-[FPDaemonConnection runFPCKForDomainWithID:databasesBackupsPath:options:reason:completionHandler:]");
  }
  id v16 = (void *)MEMORY[0x1E4F1CB10];
  id v17 = [v14 allKeys];
  id v18 = [v17 objectAtIndexedSubscript:0];
  id v24 = [v16 URLWithString:v18];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CB10];
  id v20 = [v14 allValues];

  uint64_t v21 = [v20 objectAtIndexedSubscript:0];
  id v22 = [v19 URLWithString:v21];

  [(FPDaemonConnection *)self runFPCKForDomainWithID:v15 domainRootURL:v24 databaseBackupPath:v22 options:a5 reason:a6 launchType:2 completionHandler:v13];
}

- (void)runFPCKForDomainWithID:(id)a3 domainRootURL:(id)a4 databaseBackupPath:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 launchType:(unint64_t)a8 completionHandler:(id)a9
{
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(FPDaemonConnection *)self connectionProxy];
  [v20 runFPCKForDomainWithID:v19 domainRootURL:v18 databaseBackupPath:v17 options:a6 reason:a7 launchType:a8 completionHandler:v16];
}

- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(FPDaemonConnection *)self connectionProxy];
  [v13 dumpDatabaseAt:v12 fullDump:v7 writeTo:v11 completionHandler:v10];
}

- (void)calculateNonPurgeableSpaceUsageOfDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  [v8 calculateNonPurgeableSpaceUsageOfDomain:v7 completionHandler:v6];
}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDaemonConnection *)self connectionProxy];
  [v8 resolveConflictAtURL:v7 completionHandler:v6];
}

- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FPDaemonConnection *)self connectionProxy];
  [v11 fetchAndStartEnumeratingWithSettings:v10 observer:v9 completionHandler:v8];
}

- (void)dumpIndexerInfoFor:(id)a3 withName:(id)a4 to:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(FPDaemonConnection *)self connectionProxy];
  [v14 dumpIndexerInfoFor:v13 withName:v12 to:v11 completionHandler:v10];
}

- (void)triggerDiagnosticsFor:(id)a3 triggeringError:(id)a4 uiOnly:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(FPDaemonConnection *)self connectionProxy];
  [v13 triggerDiagnosticsFor:v12 triggeringError:v11 uiOnly:v6 completionHandler:v10];
}

- (unsigned)user
{
  return self->_user;
}

- (void)setUser:(unsigned int)a3
{
  self->_user = a3;
}

void __53__FPDaemonConnection_wakeUpForURL_completionHandler___block_invoke_cold_1(void *a1)
{
  int v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Cannot send wakeUp message to fileproviderd. Error: %@", v4, v5, v6, v7, v8);
}

void __98__FPDaemonConnection_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v5, v6, "[ERROR] Cannot evict item at URL %@ Error: %@", v7, v8, v9, v10, v11);
}

void __71__FPDaemonConnection_evictItemWithID_evictionReason_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Cannot evict item with id %@ Error: %@", v5, v6, v7, v8, v9);
}

void __55__FPDaemonConnection_providerDomainsCompletionHandler___block_invoke_cold_1(void *a1)
{
  int v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Cannot query for providers. Error: %@", v4, v5, v6, v7, v8);
}

void __69__FPDaemonConnection_fetchDomainServicerForProviderDomainID_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Cannot fetch remote file provider for identifier %@: %@", v5, v6, v7, v8, v9);
}

void __78__FPDaemonConnection_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v5, v6, "[ERROR] Cannot convert URL %@ to a bookmarkable string. Error: %@", v7, v8, v9, v10, v11);
}

void __64__FPDaemonConnection_forceIngestionForItemID_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] Cannot forceIngestionOnDomainForItemID. Error: %@", v2);
}

void __65__FPDaemonConnection_forceIngestionForItemIDs_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] Cannot forceIngestionForItems. Error: %@", v2);
}

void __74__FPDaemonConnection_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Cannot forceLatestVersionOnDiskForItemID. error: %@", v4, v5, v6, v7, v8);
}

void __61__FPDaemonConnection_valuesForAttributes_forItemAtURL_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] returning URL properties for %@\n value: %@", v6, 0x16u);
}

void __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] backup cleanup failed: %@", v2);
}

void __68__FPDaemonConnection_backUpUserURL_outputUserURL_completionHandler___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] backup failed: %@", v2);
}

@end