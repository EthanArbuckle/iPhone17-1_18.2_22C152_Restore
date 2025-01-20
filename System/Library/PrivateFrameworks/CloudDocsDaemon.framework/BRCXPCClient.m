@interface BRCXPCClient
- (BOOL)_canCreateAppLibraryWithID:(id)a3 error:(id *)a4;
- (BOOL)_entitlementBooleanValueForKey:(id)a3;
- (BOOL)_hasAccessToAppLibraryID:(id)a3 error:(id *)a4;
- (BOOL)_hasPrivateIPCEntitlementForSelector:(SEL)a3 error:(id *)a4;
- (BOOL)_isAppLibraryProxyEntitled;
- (BOOL)_isAppLibraryProxyWithError:(id *)a3;
- (BOOL)_isAutomationEntitled;
- (BOOL)canAccessLogicalOrPhysicalURL:(id)a3 accessKind:(int64_t)a4 session:(id)a5;
- (BOOL)canAccessPath:(const char *)a3 accessKind:(int64_t)a4;
- (BOOL)canAccessPhysicalURL:(id)a3;
- (BOOL)checkTCCAccess;
- (BOOL)checkTCCAccessForSession:(id)a3;
- (BOOL)dieOnInvalidate;
- (BOOL)hasPrivateSharingInterfaceEntitlement;
- (BOOL)isSandboxed;
- (BOOL)isUsingUbiquity;
- (BRCAccountSession)session;
- (BRCClientPrivilegesDescriptor)clientPriviledgesDescriptor;
- (BRCXPCClient)initWithConnection:(id)a3;
- (BRMangledID)defaultMangledID;
- (NSSet)entitledAppLibraryIDs;
- (NSString)bundleID;
- (NSString)description;
- (NSXPCConnection)connection;
- (char)cloudEnabledStatus;
- (id)_auditedURLFromPath:(id)a3;
- (id)_entitlementValueForKey:(id)a3 ofClass:(Class)a4;
- (id)_overrideSessionForURL:(id)a3;
- (id)_setupAppLibrary:(id)a3 error:(id *)a4;
- (id)issueContainerExtensionForURL:(id)a3 error:(id *)a4;
- (void)_auditURL:(id)a3;
- (void)_becameXPCCLientOfSession:(id)a3;
- (void)_finishedXPCClientOfSession:(id)a3;
- (void)_process:(int)a3 didBecomeForeground:(BOOL)a4;
- (void)_setupAppLibraryAndZoneWithID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5;
- (void)_startMonitoringProcessIfNeeded;
- (void)_startSharingOperationAfterAcceptation:(id)a3 client:(id)a4 item:(id)a5;
- (void)_stopMonitoringProcess;
- (void)_waitForContainerToBeForcedIngestWithContainerID:(id)a3 containerURL:(id)a4 sandboxExtension:(id)a5 bundleVersion:(id)a6 error:(id)a7 reply:(id)a8;
- (void)accessLogicalOrPhysicalURL:(id)a3 accessKind:(int64_t)a4 dbAccessKind:(int64_t)a5 synchronouslyIfPossible:(BOOL)a6 handler:(id)a7;
- (void)addAppLibrary:(id)a3;
- (void)addOperation:(id)a3;
- (void)dumpToContext:(id)a3;
- (void)invalidate;
- (void)notificationPipe:(id)a3 didObserveAppLibrary:(id)a4;
- (void)notificationPipe:(id)a3 willObserveAppLibrary:(id)a4;
- (void)performBlock:(id)a3 withSessionFromURL:(id)a4;
- (void)performBlockWithAnySession:(id)a3;
- (void)process:(int)a3 didBecomeForeground:(BOOL)a4;
- (void)removeAppLibrary:(id)a3;
- (void)setClientPriviledgesDescriptor:(id)a3;
- (void)setIsUsingUbiquity:(BOOL)a3;
- (void)setPrivilegesDescriptor:(id)a3;
- (void)setSession:(id)a3;
- (void)setupNonSandboxedAccessForUbiquityContainers:(id)a3 forBundleID:(id)a4;
- (void)wait;
@end

@implementation BRCXPCClient

- (BOOL)isUsingUbiquity
{
  return self->_isUsingUbiquity;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_personaMonitorCounts, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_appLibraries, 0);
  objc_storeStrong((id *)&self->_foregroundBackgroundHandlingQueue, 0);
  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, 0);
  objc_storeStrong((id *)&self->__session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)_process:(int)a3 didBecomeForeground:(BOOL)a4
{
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__BRCXPCClient__process_didBecomeForeground___block_invoke;
  v5[3] = &unk_1E6996758;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, v5);
}

- (void)_stopMonitoringProcess
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] stop monitoring %@%@");
}

void __44__BRCXPCClient_process_didBecomeForeground___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __44__BRCXPCClient_process_didBecomeForeground___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v4 = *(unsigned int *)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 44);
    BOOL v6 = *(void **)(a1 + 32);
    [v6 _process:v4 didBecomeForeground:v5];
  }
}

- (void)process:(int)a3 didBecomeForeground:(BOOL)a4
{
  uint64_t v4 = [(BRCXPCClient *)self session];
  uint64_t v5 = [v4 personaIdentifier];
  BRPerformWithPersonaAndError();
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  char v3 = *((unsigned char *)v2 + 32);
  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    *((unsigned char *)v2 + 32) = v3 | 1;
    brc_task_tracker_cancel(v2->_tracker);
    uint64_t v4 = [(BRCXPCClient *)v2 session];
  }
  objc_sync_exit(v2);

  foregroundBackgroundHandlingQueue = v2->_foregroundBackgroundHandlingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__BRCXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = v2;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, block);
  if ((v3 & 1) == 0)
  {
    memset(v10, 0, sizeof(v10));
    __brc_create_section(0, (uint64_t)"-[BRCXPCClient invalidate]", 302, v10);
    BOOL v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v13 = v10[0];
      __int16 v14 = 2112;
      v15 = v2;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx invalidating connection with %@%@", buf, 0x20u);
    }

    [(BRCXPCClient *)v2 _stopMonitoringProcess];
    v8 = [v4 notificationManager];
    [v8 pipeDelegateInvalidated:v2];

    [v4 unregisterClient:v2];
    [(NSOperationQueue *)v2->_operationQueue cancelAllOperations];
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_connection);
    [WeakRetained invalidate];

    __brc_leave_section(v10);
  }
}

- (BRCClientPrivilegesDescriptor)clientPriviledgesDescriptor
{
  return self->_clientPriviledgesDescriptor;
}

- (BRCAccountSession)session
{
  return self->__session;
}

- (BRCXPCClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BRCXPCClient;
  uint64_t v5 = [(BRCXPCClient *)&v24 init];
  if (v5)
  {
    if (initWithConnection__onceToken != -1) {
      dispatch_once(&initWithConnection__onceToken, &__block_literal_global_55);
    }
    uint64_t v6 = brc_task_tracker_create("XPC Client task tracker");
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    objc_storeWeak((id *)v5 + 16, v4);
    *((_DWORD *)v5 + 18) = [v4 processIdentifier];
    if (v4)
    {
      [v4 auditToken];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
    }
    *(_OWORD *)(v5 + 76) = v22;
    *(_OWORD *)(v5 + 92) = v23;
    id v8 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v9 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v8;

    objc_msgSend(NSString, "stringWithFormat:", @"xpc-client-queue-%d", *((unsigned int *)v5 + 18));
    id v10 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    uint64_t v13 = initWithConnection__xpcWorkloop;
    __int16 v14 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2(v11, v14, v13);

    __int16 v16 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("foreground-background-handling", v18);

    v20 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v19;
  }
  return (BRCXPCClient *)v5;
}

- (void)setSession:(id)a3
{
  uint64_t v5 = (BRCAccountSession *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if ((*((unsigned char *)v6 + 32) & 1) == 0)
  {
    p_session = (void **)&v6->__session;
    session = v6->__session;
    if (session != v5)
    {
      [(BRCAccountSession *)session unregisterClient:v6];
      if (!v5)
      {
        id v10 = brc_bread_crumbs();
        v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[BRCXPCClient setSession:]();
        }
      }
      objc_storeStrong((id *)&v6->__session, a3);
      if (![(BRCAccountSession *)v6->__session registerClient:v6])
      {
        v9 = *p_session;
        *p_session = 0;
      }
    }
  }
  objc_sync_exit(v6);
}

- (id)_overrideSessionForURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = __Block_byref_object_copy__42;
  __int16 v16 = __Block_byref_object_dispose__42;
  id v17 = 0;
  uint64_t v5 = [(BRCXPCClient *)self session];
  if (![v5 syncedFolderTypeForURL:v4])
  {
    uint64_t v6 = +[BRCAccountsManager sharedManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__BRCXPCClient_LegacyAdditions___overrideSessionForURL___block_invoke;
    v9[3] = &unk_1E69964D8;
    id v10 = v4;
    v11 = &v12;
    [v6 enumerateAccountHandlers:v9];
  }
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __56__BRCXPCClient_LegacyAdditions___overrideSessionForURL___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  char v3 = [v8 session];
  uint64_t v4 = [v3 syncedFolderTypeForURL:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = [v8 session];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (BOOL)canAccessLogicalOrPhysicalURL:(id)a3 accessKind:(int64_t)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 path];
  uint64_t v11 = [v9 syncedFolderTypeForURL:v8];

  if (!v11) {
    goto LABEL_5;
  }
  [(BRCXPCClient *)self _auditURL:v8];
  id v12 = v10;
  if (!-[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", [v12 fileSystemRepresentation], a4))
  {
    if ([v8 checkResourceIsReachableAndReturnError:0])
    {
LABEL_5:
      BOOL v13 = 0;
      goto LABEL_14;
    }
    if (!_CFURLIsItemPromiseAtURL())
    {
      id v14 = (id)_CFURLPromiseCopyPhysicalURL();
      if (v14) {
        goto LABEL_17;
      }
      dispatch_queue_t v15 = [v8 URLByDeletingLastPathComponent];
      __int16 v16 = [v8 lastPathComponent];
      id v17 = objc_msgSend(v16, "br_sideFaultName");
      id v14 = [v15 URLByAppendingPathComponent:v17];

      if (v14)
      {
LABEL_17:
        id v18 = [v14 path];
        BOOL v19 = -[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", [v18 fileSystemRepresentation], a4);

        if (v19)
        {
          _CFURLPromiseSetPhysicalURL();
          BOOL v13 = 1;
LABEL_13:

          goto LABEL_14;
        }
      }
    }
    id v14 = [v12 stringByDeletingLastPathComponent];
    BOOL v13 = -[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", [v14 fileSystemRepresentation], a4);
    goto LABEL_13;
  }
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

- (void)performBlock:(id)a3 withSessionFromURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCXPCClient *)self _overrideSessionForURL:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(BRCXPCClient *)self session];
  }
  uint64_t v11 = v10;

  id v12 = [v11 personaIdentifier];
  id v17 = v11;
  id v18 = v6;
  __int16 v16 = v7;
  id v13 = v11;
  id v14 = v6;
  id v15 = v7;
  BRPerformWithPersonaAndError();
}

void __65__BRCXPCClient_LegacyAdditions__performBlock_withSessionFromURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __65__BRCXPCClient_LegacyAdditions__performBlock_withSessionFromURL___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
}

- (void)accessLogicalOrPhysicalURL:(id)a3 accessKind:(int64_t)a4 dbAccessKind:(int64_t)a5 synchronouslyIfPossible:(BOOL)a6 handler:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v48 = (void (**)(id, void, void *))a7;
  uint64_t v11 = [(BRCXPCClient *)self _overrideSessionForURL:v10];
  session = v11;
  if (!v11) {
    session = self->__session;
  }
  id v13 = session;

  id v14 = [(BRCXPCClient *)self session];

  id v15 = [(BRCAccountSession *)v13 personaIdentifier];
  if ([v15 isEqualToString:@"__defaultPersonaID__"])
  {
  }
  else
  {
    id v16 = [(BRCAccountSession *)v13 personaIdentifier];

    if (v16)
    {
      int v17 = 0;
      goto LABEL_10;
    }
  }
  if (accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personaOnceToken != -1) {
    dispatch_once(&accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personaOnceToken, &__block_literal_global_49);
  }
  id v16 = (id)accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personalPersona;
  int v17 = 1;
LABEL_10:
  id v18 = [MEMORY[0x1E4FB36F8] sharedManager];
  v49 = [v18 currentPersona];

  id v65 = 0;
  id v19 = [v49 userPersonaUniqueString];
  v47 = v19;
  if (v19 == v16 || ([v19 isEqualToString:v16] & 1) != 0)
  {
LABEL_12:
    v46 = 0;
    goto LABEL_13;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v64 = 0;
    v33 = (void *)[v49 copyCurrentPersonaContextWithError:&v64];
    id v34 = v64;
    id v35 = v65;
    id v65 = v33;

    if (v34)
    {
      v36 = brc_bread_crumbs();
      v37 = brc_default_log();
      if (os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
        -[_BRCOperation completedWithResult:error:]();
      }
    }
    v46 = [v49 generateAndRestorePersonaContextWithPersonaUniqueString:v16];

    if (!v46) {
      goto LABEL_12;
    }
    v38 = brc_bread_crumbs();
    v39 = brc_default_log();
    if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
    {
      v40 = [(BRCAccountSession *)v13 personaIdentifier];
      *(_DWORD *)buf = 138412802;
      v67 = v40;
      __int16 v68 = 2112;
      v69 = v46;
      __int16 v70 = 2112;
      v71 = v38;
      _os_log_error_impl(&dword_1D353B000, v39, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
    }
LABEL_48:

    goto LABEL_13;
  }
  if (v17 && ([v49 isDataSeparatedPersona] & 1) == 0)
  {
    v38 = brc_bread_crumbs();
    v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_4();
    }
    v46 = 0;
    goto LABEL_48;
  }
  v42 = brc_bread_crumbs();
  v43 = brc_default_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    __br_notify_register_dispatch_block_invoke_cold_3();
  }

  v46 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
LABEL_13:
  if (v13 != v14
    || (v62[0] = MEMORY[0x1E4F143A8],
        v62[1] = 3221225472,
        v62[2] = __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_7,
        v62[3] = &unk_1E6997220,
        v63 = v48,
        int v20 = _brc_ipc_check_logged_status(self, 1, v62),
        v63,
        v20))
  {
    if (![(BRCAccountSession *)v13 syncedFolderTypeForURL:v10])
    {
      long long v23 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v10);
      v48[2](v48, 0, v23);
LABEL_38:

      goto LABEL_39;
    }
    if (a5 == 1
      && (objc_msgSend(v10, "br_mightBeBRAlias") & 1) == 0
      && (+[BRCUserDefaults defaultsForMangledID:0],
          v21 = objc_claimAutoreleasedReturnValue(),
          int v22 = [v21 allowReadOnlyDBInIPC],
          v21,
          v22))
    {
      long long v23 = [(BRCAccountSession *)v13 readOnlyWorkloop];
      char v24 = 1;
    }
    else
    {
      long long v23 = [(BRCAccountSession *)v13 clientTruthWorkloop];
      char v24 = 0;
    }
    BOOL v25 = v13 == v14;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_2;
    v55[3] = &unk_1E6999638;
    char v61 = v24;
    v26 = v13;
    v56 = v26;
    v57 = self;
    id v58 = v10;
    int64_t v60 = a4;
    v27 = v48;
    id v59 = v27;
    uint64_t v28 = MEMORY[0x1D94389C0](v55);
    v29 = (void *)v28;
    if (v25)
    {
      if (a6)
      {
        (*(void (**)(uint64_t))(v28 + 16))(v28);
LABEL_37:

        goto LABEL_38;
      }
    }
    else
    {
      v30 = brc_bread_crumbs();
      v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[BRCXPCClient(LegacyAdditions) accessLogicalOrPhysicalURL:accessKind:dbAccessKind:synchronouslyIfPossible:handler:]();
      }

      [(BRCXPCClient *)self _becameXPCCLientOfSession:v26];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_11;
      v52[3] = &unk_1E6996948;
      id v54 = v29;
      v52[4] = self;
      v53 = v26;
      v32 = (void *)MEMORY[0x1D94389C0](v52);
      v29 = (void *)MEMORY[0x1D94389C0]();
    }
    tracker = self->_tracker;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_2_12;
    v50[3] = &unk_1E6995800;
    v51 = v27;
    brc_task_tracker_async_with_logs(tracker, v23, v29, v50);

    goto LABEL_37;
  }
LABEL_39:

  _BRRestorePersona();
}

void __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  os_log_t v1 = (void *)accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personalPersona;
  accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler____personalPersona = v0;
}

uint64_t __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 72);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 readOnlyDB];
  }
  else {
  uint64_t v4 = [v3 clientDB];
  }
  [v4 assertOnQueue];
  char v5 = [*(id *)(a1 + 40) canAccessLogicalOrPhysicalURL:*(void *)(a1 + 48) accessKind:*(void *)(a1 + 64) session:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 32))
  {
    char v6 = v5;
    id v7 = [[BRCURLToItemLookup alloc] initWithURL:*(void *)(a1 + 48) allowAppLibraryRoot:1 session:*(void *)(a1 + 32) db:v4];
    id v33 = 0;
    BOOL v8 = [(BRCURLToItemLookup *)v7 resolveAndKeepOpenWithError:&v33];
    id v9 = v33;
    if (v8)
    {
      if ((v6 & 1) == 0)
      {
        if (v7)
        {
          id v10 = [(BRCURLToItemLookup *)v7 parentRelpath];
          uint64_t v11 = [v10 appLibrary];
          id v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            id v19 = [(BRCURLToItemLookup *)v7 relpath];
            id v13 = [v19 appLibrary];
          }
          if (([*(id *)(a1 + 40) _isAppLibraryProxyEntitled] & 1) != 0
            || v13
            && (int v20 = *(void **)(a1 + 40),
                [v13 mangledID],
                v21 = objc_claimAutoreleasedReturnValue(),
                LOBYTE(v20) = [v20 _canCreateAppLibraryWithID:v21 error:0],
                v21,
                (v20 & 1) != 0))
          {

            goto LABEL_25;
          }
          int v22 = [(BRCURLToItemLookup *)v7 byIDLocalItem];
          long long v23 = v22;
          if (v22)
          {
            id v24 = v22;
          }
          else
          {
            id v24 = [(BRCURLToItemLookup *)v7 faultedLocalItem];
          }
          BOOL v25 = v24;

          v26 = [v25 setOfAppLibraryIDsWithReverseAliases];
          v27 = brc_bread_crumbs();
          uint64_t v28 = brc_default_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            id v35 = v25;
            __int16 v36 = 2112;
            v37 = v26;
            __int16 v38 = 2112;
            v39 = v27;
            _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] looking for container containing aliases to %@, found: %@%@", buf, 0x20u);
          }

          v29 = [*(id *)(a1 + 40) entitledAppLibraryIDs];
          char v30 = [v26 intersectsSet:v29];

          if (v30) {
            goto LABEL_25;
          }
LABEL_28:
          uint64_t v31 = *(void *)(a1 + 56);
          v32 = _cocoaDomainPermissionError(*(void *)(a1 + 64), *(void **)(a1 + 48));
          (*(void (**)(uint64_t, void, void *))(v31 + 16))(v31, 0, v32);

          goto LABEL_26;
        }
        id v16 = objc_alloc(MEMORY[0x1E4F594E8]);
        uint64_t v17 = objc_msgSend(*(id *)(a1 + 48), "br_containerID");
        id v18 = (void *)[v16 initWithAppLibraryName:v17];

        LOBYTE(v17) = [*(id *)(a1 + 40) _hasAccessToAppLibraryID:v18 error:0];
        if ((v17 & 1) == 0) {
          goto LABEL_28;
        }
      }
LABEL_25:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_26:
      [(BRCURLToItemLookup *)v7 closePaths];

      goto LABEL_27;
    }
    [(BRCURLToItemLookup *)v7 closePaths];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 56);
    id v15 = _cocoaDomainPermissionError(*(void *)(a1 + 64), *(void **)(a1 + 48));
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
  }
LABEL_27:
}

uint64_t __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_11(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _finishedXPCClientOfSession:v3];
}

void __116__BRCXPCClient_LegacyAdditions__accessLogicalOrPhysicalURL_accessKind_dbAccessKind_synchronouslyIfPossible_handler___block_invoke_2_12(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)setPrivilegesDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, a3);
  id v5 = a3;
  clientPriviledgesDescriptor = self->_clientPriviledgesDescriptor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained setUserInfo:clientPriviledgesDescriptor];
}

void __35__BRCXPCClient_initWithConnection___block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("xpc-client-workloop");
  uint64_t v1 = (void *)initWithConnection__xpcWorkloop;
  initWithConnection__xpcWorkloop = (uint64_t)v0;
}

void __26__BRCXPCClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isUsingUbiquity])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 56);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeClientUsingUbiquity:", *(void *)(a1 + 32), (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (void)wait
{
  brc_task_tracker_wait((uint64_t)self->_tracker);
  operationQueue = self->_operationQueue;
  [(NSOperationQueue *)operationQueue waitUntilAllOperationsAreFinished];
}

- (NSString)description
{
  uint64_t v3 = [(BRCXPCClient *)self session];

  if (v3) {
    uint64_t v4 = &stru_1F2AC7720;
  }
  else {
    uint64_t v4 = @" (Logged out)";
  }
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [NSString stringWithFormat:@"%@%@", v5->_clientPriviledgesDescriptor, v4];
  objc_sync_exit(v5);

  return (NSString *)v6;
}

- (void)dumpToContext:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [v5 writeLineWithFormat:@" o %@", v4];
  objc_sync_exit(v4);
}

- (void)addOperation:(id)a3
{
  id v12 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (*((unsigned char *)v4 + 32)) {
    [v12 cancel];
  }
  operationQueue = v4->_operationQueue;
  if (!operationQueue)
  {
    uint64_t v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    long long v7 = v4->_operationQueue;
    v4->_operationQueue = v6;

    long long v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("misc-operations", v9);

    [(NSOperationQueue *)v4->_operationQueue setUnderlyingQueue:v10];
    operationQueue = v4->_operationQueue;
  }
  [(NSOperationQueue *)operationQueue addOperation:v12];
  objc_sync_exit(v4);

  uint64_t v11 = [(BRCXPCClient *)v4 session];
  [v11 addMiscOperation:v12];
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 109) & 1) == *(unsigned char *)(a1 + 40))
  {
    id v2 = 0;
  }
  else
  {
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v3 = brc_bread_crumbs();
      uint64_t v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_2();
      }
    }
    else
    {
      uint64_t v3 = brc_bread_crumbs();
      uint64_t v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_1();
      }
    }

    id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];
    *(unsigned char *)(*(void *)(a1 + 32) + 109) = *(unsigned char *)(*(void *)(a1 + 32) + 109) & 0xFE | *(unsigned char *)(a1 + 40);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_queue_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = *(void *)(a1 + 32);
        if (*(unsigned char *)(a1 + 40)) {
          [v10 addForegroundClient:v11];
        }
        else {
          objc_msgSend(v10, "removeForegroundClient:", v11, (void)v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_startMonitoringProcessIfNeeded
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] starting monitoring %@%@");
}

- (BOOL)checkTCCAccess
{
  id v2 = self;
  uint64_t v3 = [(BRCXPCClient *)self session];
  LOBYTE(v2) = [(BRCXPCClient *)v2 checkTCCAccessForSession:v3];

  return (char)v2;
}

- (BOOL)checkTCCAccessForSession:(id)a3
{
  return 1;
}

- (void)addAppLibrary:(id)a3
{
  id v4 = a3;
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  long long v9 = __30__BRCXPCClient_addAppLibrary___block_invoke;
  dispatch_queue_t v10 = &unk_1E6993628;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, &v7);
  [(BRCXPCClient *)self _startMonitoringProcessIfNeeded];
}

void __30__BRCXPCClient_addAppLibrary___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v1 + 32) & 1) == 0)
  {
    char v3 = *(unsigned char *)(v1 + 109);
    [*(id *)(v1 + 56) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 56) countForObject:*(void *)(a1 + 40)];
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      dispatch_queue_t v10 = "YES";
      int v14 = 138413058;
      if (v4 == 1) {
        uint64_t v11 = "YES";
      }
      else {
        uint64_t v11 = "NO";
      }
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      if ((v3 & 1) == 0) {
        dispatch_queue_t v10 = "NO";
      }
      uint64_t v17 = v11;
      __int16 v18 = 2080;
      id v19 = v10;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - shouldNotify: %s, isForeground: %s%@", (uint8_t *)&v14, 0x2Au);
    }

    if ((v3 & 1) != 0 && v4 == 1)
    {
      brc_bread_crumbs();
      uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        long long v13 = [*(id *)(a1 + 40) logName];
        int v14 = 138412802;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - is now monitoring %@%@", (uint8_t *)&v14, 0x20u);
      }
      [*(id *)(a1 + 40) addForegroundClient:*(void *)(a1 + 32)];
    }
  }
}

- (void)removeAppLibrary:(id)a3
{
  id v4 = a3;
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__BRCXPCClient_removeAppLibrary___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, v7);
}

void __33__BRCXPCClient_removeAppLibrary___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v1 + 32) & 1) == 0)
  {
    char v3 = *(unsigned char *)(v1 + 109);
    uint64_t v4 = [*(id *)(v1 + 56) countForObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      dispatch_queue_t v10 = "YES";
      int v14 = 138413058;
      if (v4 == 1) {
        uint64_t v11 = "YES";
      }
      else {
        uint64_t v11 = "NO";
      }
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      if ((v3 & 1) == 0) {
        dispatch_queue_t v10 = "NO";
      }
      uint64_t v17 = v11;
      __int16 v18 = 2080;
      id v19 = v10;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - shouldNotify: %s, isForeground: %s%@", (uint8_t *)&v14, 0x2Au);
    }

    if ((v3 & 1) != 0 && v4 == 1)
    {
      brc_bread_crumbs();
      uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        long long v13 = [*(id *)(a1 + 40) logName];
        int v14 = 138412802;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - is no longer monitoring %@%@", (uint8_t *)&v14, 0x20u);
      }
      [*(id *)(a1 + 40) removeForegroundClient:*(void *)(a1 + 32)];
    }
  }
}

- (void)notificationPipe:(id)a3 willObserveAppLibrary:(id)a4
{
}

- (void)notificationPipe:(id)a3 didObserveAppLibrary:(id)a4
{
}

- (char)cloudEnabledStatus
{
  id v2 = self;
  objc_sync_enter(v2);
  clientPriviledgesDescriptor = v2->_clientPriviledgesDescriptor;
  uint64_t v4 = [(BRCXPCClient *)v2 session];
  LOBYTE(clientPriviledgesDescriptor) = [(BRCClientPrivilegesDescriptor *)clientPriviledgesDescriptor cloudEnabledStatusWithHasSession:v4 != 0];

  objc_sync_exit(v2);
  return (char)clientPriviledgesDescriptor;
}

- (BOOL)_hasAccessToAppLibraryID:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BRCXPCClient *)self _isAppLibraryProxyEntitled]) {
    goto LABEL_12;
  }
  if (![(BRCXPCClient *)self isSandboxed] && [(BRCXPCClient *)self checkTCCAccess])
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] granting access to %@ for non-sandboxed app %@%@", (uint8_t *)&v14, 0x20u);
    }

    goto LABEL_12;
  }
  uint64_t v9 = [(BRCXPCClient *)self entitledAppLibraryIDs];
  if ([v9 count])
  {
    if (!v6
      || ([v6 appLibraryOrZoneName],
          dispatch_queue_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v9 containsObject:v10],
          v10,
          v11))
    {
      if ([(BRCXPCClient *)self cloudEnabledStatus] == 1)
      {

LABEL_12:
        BOOL v12 = 1;
        goto LABEL_16;
      }
    }
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 1, @"Not entitled to access container");
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_16:

  return v12;
}

- (BOOL)_canCreateAppLibraryWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(BRCXPCClient *)self _isAppLibraryProxyEntitled])
  {
    id v8 = [(BRCXPCClient *)self entitledAppLibraryIDs];
    if ([v8 count])
    {
      uint64_t v9 = [v6 appLibraryOrZoneName];
      if (v9
        && [v8 containsObject:v9]
        && [(BRCXPCClient *)self cloudEnabledStatus] == 1)
      {

        BOOL v7 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 1, @"Not entitled to create container");
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
    goto LABEL_12;
  }
  BOOL v7 = 1;
LABEL_13:

  return v7;
}

- (BOOL)_isAppLibraryProxyWithError:(id *)a3
{
  if ([(BRCXPCClient *)self _isAppLibraryProxyEntitled]
    || ![(BRCXPCClient *)self isSandboxed] && [(BRCXPCClient *)self checkTCCAccess])
  {
    return 1;
  }
  id v6 = brc_bread_crumbs();
  BOOL v7 = brc_default_log();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
    -[BRCXPCClient _isAppLibraryProxyWithError:]();
  }

  if (!a3) {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 1, @"Not a container proxy");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a3 = v8;
  return result;
}

- (BOOL)_hasPrivateIPCEntitlementForSelector:(SEL)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(BRCXPCClient *)self _isAutomationEntitled]) {
    return 1;
  }
  id v8 = NSStringFromSelector(a3);
  uint64_t v9 = [(BRCXPCClient *)self _entitlementValueForKey:*MEMORY[0x1E4F59340] ofClass:objc_opt_class()];
  char v7 = [v9 containsObject:v8];
  if ((v7 & 1) == 0)
  {
    dispatch_queue_t v10 = brc_bread_crumbs();
    int v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      int v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = v8;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] %@: is trying to call %@, but has no access%@", buf, 0x20u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 1, @"Not entitled to access: %@", v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)_entitlementValueForKey:(id)a3 ofClass:(Class)a4
{
  p_connection = &self->_connection;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  char v7 = [WeakRetained valueForEntitlement:v5];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_entitlementBooleanValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCXPCClient *)self _entitlementValueForKey:v4 ofClass:objc_opt_class()];

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BRMangledID)defaultMangledID
{
  id v2 = self;
  objc_sync_enter(v2);
  char v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor defaultAppLibraryID];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F594E8]);
    id v5 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor defaultAppLibraryID];
    char v6 = (void *)[v4 initWithAppLibraryName:v5];
  }
  else
  {
    char v6 = 0;
  }

  objc_sync_exit(v2);
  return (BRMangledID *)v6;
}

- (NSSet)entitledAppLibraryIDs
{
  id v2 = self;
  objc_sync_enter(v2);
  char v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor appLibraryIDs];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)_isAppLibraryProxyEntitled
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor isProxyEntitled];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_isAutomationEntitled
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor isAutomationEntitled];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasPrivateSharingInterfaceEntitlement
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor isSharingPrivateInterfaceEntitled];
  objc_sync_exit(v2);

  return v3;
}

- (NSString)bundleID
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor applicationIdentifier];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (BOOL)isSandboxed
{
  return 1;
}

- (void)_auditURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  if (!objc_msgSend(v5, "br_isSideFaultName"))
  {
LABEL_6:

    goto LABEL_7;
  }
  char v6 = [v4 checkResourceIsReachableAndReturnError:0];

  if ((v6 & 1) == 0)
  {
    id v5 = brc_bread_crumbs();
    char v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      id v8 = [v4 path];
      int v9 = 138412802;
      dispatch_queue_t v10 = self;
      __int16 v11 = 2112;
      BOOL v12 = v8;
      __int16 v13 = 2112;
      int v14 = v5;
      _os_log_error_impl(&dword_1D353B000, v7, (os_log_type_t)0x90u, "[ERROR] Client %@ gave us a non-existing fault URL path %@%@", (uint8_t *)&v9, 0x20u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (id)_auditedURLFromPath:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  [(BRCXPCClient *)self _auditURL:v4];
  return v4;
}

- (BOOL)canAccessPath:(const char *)a3 accessKind:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v7 = *(_OWORD *)&self->auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->auditToken.val;
  *(_OWORD *)&buf[16] = v7;
  __int16 v18 = a3;
  int v8 = sandbox_check_by_audit_token();
  if (!a4 && !v8)
  {
    long long v9 = *(_OWORD *)&self->auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->auditToken.val;
    *(_OWORD *)&buf[16] = v9;
    __int16 v18 = a3;
    if (sandbox_check_by_audit_token()) {
      goto LABEL_4;
    }
LABEL_9:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_4:
  BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (!v10) {
    return v10;
  }
  __int16 v11 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v18);
  BOOL v12 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a3);
  char v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    int v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v14;
      __int16 v16 = "[DEBUG] %@: denied access to %s%@";
LABEL_14:
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0x20u);
    }
  }
  else
  {
    int v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v14;
      __int16 v16 = "[DEBUG] %@: file doesn't exist at path: %s%@";
      goto LABEL_14;
    }
  }

  LOBYTE(v10) = 0;
  return v10;
}

- (void)performBlockWithAnySession:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__48;
  int v14 = __Block_byref_object_dispose__48;
  id v15 = [(BRCXPCClient *)self session];
  if (v11[5])
  {
    v4[2](v4);
  }
  else
  {
    id v5 = +[BRCAccountsManager sharedManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__BRCXPCClient_performBlockWithAnySession___block_invoke;
    v7[3] = &unk_1E699A5E8;
    long long v9 = &v10;
    char v6 = v4;
    id v8 = v6;
    [v5 enumerateAccountHandlers:v7];

    if (!v11[5]) {
      ((void (*)(void (**)(void), void))v6[2])(v6, 0);
    }
  }
  _Block_object_dispose(&v10, 8);
}

void __43__BRCXPCClient_performBlockWithAnySession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v8 = v3;
    id v4 = [v3 session];

    id v3 = v8;
    if (v4)
    {
      uint64_t v5 = [v8 session];
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v3 = v8;
    }
  }
}

- (void)_becameXPCCLientOfSession:(id)a3
{
  id v4 = (BRCAccountSession *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  personaMonitorCounts = v5->_personaMonitorCounts;
  if (!personaMonitorCounts)
  {
    uint64_t v7 = objc_opt_new();
    id v8 = v5->_personaMonitorCounts;
    v5->_personaMonitorCounts = (NSMutableDictionary *)v7;

    personaMonitorCounts = v5->_personaMonitorCounts;
  }
  long long v9 = [(BRCAccountSession *)v4 personaIdentifier];
  uint64_t v10 = [(NSMutableDictionary *)personaMonitorCounts objectForKeyedSubscript:v9];

  uint64_t v11 = [v10 longLongValue];
  uint64_t v12 = v11;
  if (v11 < 0)
  {
    __int16 v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCXPCClient _becameXPCCLientOfSession:]();
    }
  }
  else if (!v11 && v5->__session != v4)
  {
    [(BRCAccountSession *)v4 registerClient:v5];
  }
  char v13 = [NSNumber numberWithLongLong:v12 + 1];
  int v14 = v5->_personaMonitorCounts;
  id v15 = [(BRCAccountSession *)v4 personaIdentifier];
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

  objc_sync_exit(v5);
}

- (void)_finishedXPCClientOfSession:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (BRCAccountSession *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  personaMonitorCounts = v5->_personaMonitorCounts;
  uint64_t v7 = [(BRCAccountSession *)v4 personaIdentifier];
  id v8 = [(NSMutableDictionary *)personaMonitorCounts objectForKeyedSubscript:v7];

  uint64_t v9 = [v8 longLongValue];
  uint64_t v10 = v9;
  if (v9 <= 0)
  {
    char v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      id v15 = [(BRCAccountSession *)v4 personaIdentifier];
      -[BRCXPCClient _finishedXPCClientOfSession:](v15, (uint64_t)v13, v19, v14);
    }

    goto LABEL_8;
  }
  if (v9 != 1)
  {
LABEL_8:
    __int16 v16 = [NSNumber numberWithLongLong:v10 - 1];
    __int16 v17 = v5->_personaMonitorCounts;
    __int16 v18 = [(BRCAccountSession *)v4 personaIdentifier];
    [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];

    goto LABEL_9;
  }
  uint64_t v11 = v5->_personaMonitorCounts;
  uint64_t v12 = [(BRCAccountSession *)v4 personaIdentifier];
  [(NSMutableDictionary *)v11 setObject:0 forKeyedSubscript:v12];

  if (v5->__session != v4) {
    [(BRCAccountSession *)v4 unregisterClient:v5];
  }
LABEL_9:

  objc_sync_exit(v5);
}

- (BOOL)canAccessPhysicalURL:(id)a3
{
  id v4 = [a3 path];
  LOBYTE(self) = -[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", [v4 fileSystemRepresentation], 0);

  return (char)self;
}

- (id)issueContainerExtensionForURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)*MEMORY[0x1E4F592D0];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "brc_issueSandboxExtensionOfClass:error:", objc_msgSend(v5, "UTF8String"), a4);

  return v7;
}

- (id)_setupAppLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__48;
  uint64_t v20 = __Block_byref_object_dispose__48;
  id v21 = 0;
  tracker = self->_tracker;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__BRCXPCClient__setupAppLibrary_error___block_invoke;
  v12[3] = &unk_1E699A610;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  int v14 = &v16;
  id v15 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__BRCXPCClient__setupAppLibrary_error___block_invoke_88;
  v11[3] = &__block_descriptor_40_e5_v8__0l;
  v11[4] = a4;
  brc_task_tracker_sync(tracker, v12, v11);
  if ([(BRCXPCClient *)self isUsingUbiquity]) {
    [(id)v17[5] addClientUsingUbiquity:self];
  }
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __39__BRCXPCClient__setupAppLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _canCreateAppLibraryWithID:*(void *)(a1 + 40) error:0];
  id v3 = [*(id *)(a1 + 32) session];
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v2) {
    [v3 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v5];
  }
  else {
  uint64_t v6 = [v3 appLibraryByMangledID:v5];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = "create";
    if (!v2) {
      id v9 = "load";
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 1, @"can't %s app library for %@", v9, *(void *)(a1 + 40));
    if (v10)
    {
      uint64_t v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        uint64_t v14 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        if (v14) {
          id v15 = "(passed to caller)";
        }
        else {
          id v15 = "(ignored by caller)";
        }
        __int16 v17 = "-[BRCXPCClient _setupAppLibrary:error:]_block_invoke";
        __int16 v18 = 2080;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        id v21 = v10;
        __int16 v22 = 2112;
        long long v23 = v11;
        _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    id v13 = *(id **)(a1 + 56);
    if (v13) {
      objc_storeStrong(v13, v10);
    }
  }
}

void __39__BRCXPCClient__setupAppLibrary_error___block_invoke_88(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  if (v2)
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 136315906;
      if (v6) {
        uint64_t v7 = "(passed to caller)";
      }
      else {
        uint64_t v7 = "(ignored by caller)";
      }
      id v9 = "-[BRCXPCClient _setupAppLibrary:error:]_block_invoke";
      __int16 v10 = 2080;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v2;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_1D353B000, v4, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v8, 0x2Au);
    }
  }
  uint64_t v5 = *(id **)(a1 + 32);
  if (v5) {
    objc_storeStrong(v5, v2);
  }
}

- (void)_waitForContainerToBeForcedIngestWithContainerID:(id)a3 containerURL:(id)a4 sandboxExtension:(id)a5 bundleVersion:(id)a6 error:(id)a7 reply:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = (void (**)(id, id, id, id, id))a8;
  __int16 v18 = brc_bread_crumbs();
  uint64_t v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v20 = 138413570;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 2112;
    uint64_t v31 = v18;
    _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v20, 0x3Eu);
  }

  v17[2](v17, v13, v14, v15, v16);
}

- (void)_setupAppLibraryAndZoneWithID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id location = 0;
  id v9 = a5;
  __int16 v10 = [(BRCXPCClient *)self _setupAppLibrary:v8 error:&location];
  if (v10)
  {
    if (v6)
    {
      uint64_t v11 = [(BRCXPCClient *)self session];
      __int16 v12 = [v11 clientTruthWorkloop];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke;
      block[3] = &unk_1E6993698;
      id v25 = v10;
      dispatch_async_and_wait(v12, block);
    }
    id v13 = [v10 url];
    if ([(BRCXPCClient *)self canAccessPhysicalURL:v13])
    {
      uint64_t v14 = 0;
    }
    else
    {
      id obj = location;
      uint64_t v14 = [(BRCXPCClient *)self issueContainerExtensionForURL:v13 error:&obj];
      objc_storeStrong(&location, obj);
      if (!v14)
      {

        id v13 = 0;
      }
    }
    __int16 v18 = [v10 containerMetadata];
    uint64_t v19 = [(BRCXPCClient *)self bundleID];
    int v20 = [v18 versionNumberForBundleIdentifier:v19];

    [(BRCXPCClient *)self addAppLibrary:v10];
    id v21 = [v8 appLibraryOrZoneName];
    __int16 v22 = objc_msgSend(location, "brc_wrappedError");
    [(BRCXPCClient *)self _waitForContainerToBeForcedIngestWithContainerID:v21 containerURL:v13 sandboxExtension:v14 bundleVersion:v20 error:v22 reply:v9];

    id v9 = (id)v14;
  }
  else
  {
    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = objc_msgSend(location, "brc_wrappedError");
      *(_DWORD *)buf = 138413570;
      __int16 v28 = self;
      __int16 v29 = 2112;
      uint64_t v30 = 0;
      __int16 v31 = 2112;
      uint64_t v32 = 0;
      __int16 v33 = 2112;
      uint64_t v34 = 0;
      __int16 v35 = 2112;
      __int16 v36 = v17;
      __int16 v37 = 2112;
      __int16 v38 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
    }
    id v13 = objc_msgSend(location, "brc_wrappedError");
    (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v13);
  }
}

uint64_t __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recreateDocumentsFolderIfNeededOnDisk];
}

- (void)setupNonSandboxedAccessForUbiquityContainers:(id)a3 forBundleID:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [BRCClientPrivilegesDescriptor alloc];
  long long v10 = *(_OWORD *)&v8->auditToken.val[4];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v8->auditToken.val;
  *(_OWORD *)&v14[16] = v10;
  uint64_t v11 = [(BRCClientPrivilegesDescriptor *)v9 initWithNonSandboxedAppWithAppLibraryIDs:v6 bundleID:v7 auditToken:v14];
  [(BRCXPCClient *)v8 setPrivilegesDescriptor:v11];

  objc_sync_exit(v8);
  __int16 v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v14 = 138413058;
    *(void *)&v14[4] = v8;
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = v6;
    *(_WORD *)&v14[22] = 2112;
    *(void *)&v14[24] = v7;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: unsandboxed app is now using %@ as %@%@", v14, 0x2Au);
  }
}

- (void)_startSharingOperationAfterAcceptation:(id)a3 client:(id)a4 item:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [v8 setRemoteClientProxy:a4];
  long long v10 = [v9 clientZone];
  if ([v10 isSharedZone])
  {
    uint64_t v11 = [v9 clientZone];
    __int16 v12 = [v11 asSharedClientZone];
  }
  else
  {
    __int16 v12 = 0;
  }

  id v13 = [v9 itemID];
  uint64_t v14 = [v12 shareAcceptOperationForItemID:v13];

  if (v14)
  {
    __int16 v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138412802;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] add dependency %@ for operation %@%@", (uint8_t *)&v18, 0x20u);
    }

    [v8 addDependency:v14];
  }
  uint64_t v17 = [(BRCXPCClient *)self session];
  [v17 addMiscOperation:v8];

  [v8 schedule];
}

- (void)setClientPriviledgesDescriptor:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (BOOL)dieOnInvalidate
{
  return self->_dieOnInvalidate;
}

- (void)setIsUsingUbiquity:(BOOL)a3
{
  self->_isUsingUbiquity = a3;
}

void __65__BRCXPCClient_LegacyAdditions__performBlock_withSessionFromURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) path];
  uint64_t v5 = objc_msgSend(v4, "fp_obfuscatedPath");
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1D353B000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't switch personas to look up session from url %@%@", v6, 0x16u);
}

- (void)setSession:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: session != nil%@", v2, v3, v4, v5, v6);
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] %@ - is now background%@", (void)v3, DWORD2(v3));
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] %@ - is now foreground%@", (void)v3, DWORD2(v3));
}

void __44__BRCXPCClient_process_didBecomeForeground___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona, bailing out%@", v2, v3, v4, v5, v6);
}

- (void)_isAppLibraryProxyWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] %@ is talking to us without container proxy right%@");
}

- (void)_becameXPCCLientOfSession:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: count >= 0%@", v2, v3, v4, v5, v6);
}

- (void)_finishedXPCClientOfSession:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No xpc client group found for %@%@", buf, 0x16u);
}

@end