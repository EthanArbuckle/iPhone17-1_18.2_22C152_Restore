@interface FPCKTask
+ (id)buildPauseResult:(BOOL)a3 semaphore:(id)a4;
+ (id)sharedManager;
+ (id)xpcServiceConnection;
+ (id)xpcServiceProxyWithConnection:(id)a3;
+ (void)runFPCKForDomain:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 options:(unint64_t)a9 reason:(unint64_t)a10 fpfs:(BOOL)a11 iCDPackageDetection:(BOOL)a12 shouldPause:(id)a13 sendDiagnostics:(id)a14 saveCheckpoint:(id)a15 isInvalidated:(id)a16 completionHandler:(id)a17;
- (FPCKTask)init;
- (unint64_t)_resolveLaunchType:(unint64_t)a3;
- (void)_launchXPCServiceWithUpdateReceiver:(id)a3 proxy:(id)a4 completionHandler:(id)a5;
- (void)_prepareXPCService:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 personaIdentifier:(id)a9 options:(unint64_t)a10 reason:(unint64_t)a11 fpfs:(BOOL)a12 iCDPackageDetection:(BOOL)a13 completionHandler:(id)a14;
- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6;
- (void)prepareFPCKRun:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 personaIdentifier:(id)a9 options:(unint64_t)a10 reason:(unint64_t)a11 fpfs:(BOOL)a12 iCDPackageDetection:(BOOL)a13 launchType:(unint64_t)a14 runOnWorkQueue:(BOOL)a15 completionHandler:(id)a16;
- (void)scheduleFPCKRun:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 options:(unint64_t)a9 reason:(unint64_t)a10 fpfs:(BOOL)a11 iCDPackageDetection:(BOOL)a12 launchType:(unint64_t)a13 updateReceiver:(id)a14 shouldPause:(id)a15 proxy:(id)a16 completionHandler:(id)a17;
@end

@implementation FPCKTask

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __25__FPCKTask_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_alloc_init(FPCKTask);

  return MEMORY[0x270F9A758]();
}

- (FPCKTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)FPCKTask;
  v2 = [(FPCKTask *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("FPCKTask-queue", v3);
    workQueue = v2->workQueue;
    v2->workQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)xpcServiceConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.FileProviderDaemon.FPCKService"];
  v3 = FPDFPCKServiceXPCInterface();
  [v2 setRemoteObjectInterface:v3];

  [v2 activate];

  return v2;
}

+ (id)xpcServiceProxyWithConnection:(id)a3
{
  v3 = (void *)MEMORY[0x263F08D68];
  id v4 = a3;
  v5 = [v3 currentConnection];
  uint64_t v6 = [v5 processIdentifier];

  objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F05578]) initWithConnection:v4 protocol:&unk_2700038D0 orError:0 name:@"FPCKServiceProxy" requestPid:v6];
  v8 = [v7 synchronousRemoteObjectProxy];

  return v8;
}

+ (void)runFPCKForDomain:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 options:(unint64_t)a9 reason:(unint64_t)a10 fpfs:(BOOL)a11 iCDPackageDetection:(BOOL)a12 shouldPause:(id)a13 sendDiagnostics:(id)a14 saveCheckpoint:(id)a15 isInvalidated:(id)a16 completionHandler:(id)a17
{
  v51[1] = *MEMORY[0x263EF8340];
  id v22 = a13;
  BOOL v43 = v22 != 0;
  v23 = &__block_literal_global_33;
  if (v22) {
    v23 = v22;
  }
  v46 = v23;
  v45 = (void (**)(id, id, id, void *, id))a17;
  id v24 = a16;
  id v25 = a15;
  id v26 = a14;
  id v27 = a7;
  id v28 = a6;
  id v29 = a5;
  id v30 = a4;
  id v31 = a3;
  v32 = [_TtC9libfssync4FPCK alloc];
  v33 = [v29 path];

  v50 = v33;
  v34 = [v28 path];

  v51[0] = v34;
  v35 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
  BYTE1(v42) = v43;
  LOBYTE(v42) = a12;
  v36 = -[FPCK initWithDatabasesBackupsPaths:volumeRole:providerDomainID:domainUserInfo:reason:usingFPFS:iCDPackageDetection:useShouldPause:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:](v32, "initWithDatabasesBackupsPaths:volumeRole:providerDomainID:domainUserInfo:reason:usingFPFS:iCDPackageDetection:useShouldPause:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:", v35, a8, v31, v30, a10, a11, v42, v46, v26, v25, v24);

  v37 = [MEMORY[0x263F089D8] string];
  id v49 = 0;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __208__FPCKTask_runFPCKForDomain_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_shouldPause_sendDiagnostics_saveCheckpoint_isInvalidated_completionHandler___block_invoke_2;
  v47[3] = &unk_265307168;
  id v48 = v37;
  id v38 = v37;
  [(FPCK *)v36 launchFromURLs:v27 options:a9 error:&v49 resultHandler:v47];

  id v39 = v49;
  id v40 = objc_alloc_init(MEMORY[0x263F05428]);
  objc_msgSend(v40, "setNumberOfFilesChecked:", -[FPCK numberOfFilesChecked](v36, "numberOfFilesChecked"));
  objc_msgSend(v40, "setNumberOfBrokenFilesInFSAndFSSnapshotCheck:", -[FPCK numberOfBrokenFilesInFSAndFSSnapshotCheck](v36, "numberOfBrokenFilesInFSAndFSSnapshotCheck"));
  objc_msgSend(v40, "setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:", -[FPCK numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck](v36, "numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck"));
  objc_msgSend(v40, "setNumberOfBrokenFilesInReconciliationTableCheck:", -[FPCK numberOfBrokenFilesInReconciliationTableCheck](v36, "numberOfBrokenFilesInReconciliationTableCheck"));
  objc_msgSend(v40, "setNumberOfBrokenFilesInBackupManifestCheck:", -[FPCK numberOfBrokenFilesInBackupManifestCheck](v36, "numberOfBrokenFilesInBackupManifestCheck"));
  v41 = [(FPCK *)v36 telemetryReport];
  v45[2](v45, v38, v40, v41, v39);
}

_TtC9libfssync19FPShouldPauseResult *__208__FPCKTask_runFPCKForDomain_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_shouldPause_sendDiagnostics_saveCheckpoint_isInvalidated_completionHandler___block_invoke()
{
  v0 = [[_TtC9libfssync19FPShouldPauseResult alloc] initWithShouldPause:0 semaphore:0];

  return v0;
}

uint64_t __208__FPCKTask_runFPCKForDomain_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_shouldPause_sendDiagnostics_saveCheckpoint_isInvalidated_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

- (void)_prepareXPCService:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 personaIdentifier:(id)a9 options:(unint64_t)a10 reason:(unint64_t)a11 fpfs:(BOOL)a12 iCDPackageDetection:(BOOL)a13 completionHandler:(id)a14
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v76 = a3;
  id v79 = a4;
  id v78 = a5;
  id v77 = a6;
  id v18 = a7;
  id v80 = a9;
  id v75 = a14;
  v82 = +[FPCKTask xpcServiceConnection];
  v81 = +[FPCKTask xpcServiceProxyWithConnection:](FPCKTask, "xpcServiceProxyWithConnection:");
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v93 objects:v98 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    id v23 = 0;
    uint64_t v24 = *(void *)v94;
    while (2)
    {
      uint64_t v25 = 0;
      id v26 = v23;
      do
      {
        if (*(void *)v94 != v24) {
          objc_enumerationMutation(v20);
        }
        id v27 = *(void **)(*((void *)&v93 + 1) + 8 * v25);
        id v92 = v26;
        id v28 = [MEMORY[0x263F054E0] wrapperWithURL:v27 readonly:0 error:&v92];
        id v23 = v92;

        if (!v28)
        {
          id v29 = fp_current_or_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[FPCKTask _prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:](v27);
          }

          id v30 = v75;
          id v31 = v81;
          v32 = v82;
          (*((void (**)(id, void *, void *, id))v75 + 2))(v75, v81, v82, v23);
          v33 = v20;
          v34 = v76;
          v35 = v77;
          v36 = v78;
          v37 = v80;
          goto LABEL_34;
        }
        [v19 addObject:v28];

        ++v25;
        id v26 = v23;
      }
      while (v22 != v25);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v93 objects:v98 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v23 = 0;
  }
  id v38 = v23;

  id v91 = v23;
  v36 = v78;
  uint64_t v39 = [MEMORY[0x263F054E0] wrapperWithURL:v78 readonly:0 error:&v91];
  id v23 = v91;

  v73 = (void *)v39;
  if (v39)
  {
    id v90 = v23;
    v35 = v77;
    id v40 = [MEMORY[0x263F054E0] wrapperWithURL:v77 readonly:0 error:&v90];
    id v41 = v90;

    if (!v40)
    {
      id v30 = v75;
      (*((void (**)(id, void *, void *, id))v75 + 2))(v75, v81, v82, v41);
      v34 = v76;
      v37 = v80;
LABEL_32:

      id v23 = v41;
      id v31 = v81;
      v32 = v82;
      goto LABEL_33;
    }
    uint64_t v42 = (void *)MEMORY[0x263F054E0];
    BOOL v43 = [v77 URLByDeletingLastPathComponent];
    id v89 = v41;
    uint64_t v44 = [v42 wrapperWithURL:v43 readonly:0 error:&v89];
    id v45 = v89;

    v72 = (void *)v44;
    if (!v44)
    {
      id v30 = v75;
      (*((void (**)(id, void *, void *, id))v75 + 2))(v75, v81, v82, v45);
      v34 = v76;
      v37 = v80;
      id v41 = v45;
LABEL_31:

      goto LABEL_32;
    }
    v71 = v45;
    v46 = [MEMORY[0x263F841B0] sharedManager];
    v47 = [v46 currentPersona];

    id v48 = [v47 userPersonaUniqueString];
    v37 = v80;
    v69 = v48;
    if (!v80 || v48 && ([v48 isEqualToString:v80] & 1) != 0)
    {
      v68 = v47;
      id v49 = objc_msgSend(NSURL, "fp_supportDirectoryForVolume:", v78);
      v50 = +[InternalPathsManager purgatoryPrefix];
      uint64_t v51 = [v49 URLByAppendingPathComponent:v50 isDirectory:1];

      v52 = (void *)v51;
    }
    else
    {
      id v88 = 0;
      v55 = (void *)[v47 copyCurrentPersonaContextWithError:&v88];
      id v57 = v88;
      if (v57)
      {
        id v58 = v57;
        (*((void (**)(id, void *, void *, id))v75 + 2))(v75, v81, v82, v57);
        v70 = v58;
        id v30 = v75;
        v34 = v76;
LABEL_30:

        id v41 = v71;
        goto LABEL_31;
      }
      v70 = v55;
      uint64_t v59 = [v47 generateAndRestorePersonaContextWithIdentityString:v80];
      if (v59)
      {
        v55 = (void *)v59;
        v60 = fp_current_or_default_log();
        v34 = v76;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          -[FPCKTask _prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:](v55);
        }

        id v30 = v75;
        (*((void (**)(id, void *, void *, void *))v75 + 2))(v75, v81, v82, v55);
        goto LABEL_30;
      }
      v61 = objc_msgSend(NSURL, "fp_supportDirectoryForVolume:", v78);
      v62 = +[InternalPathsManager purgatoryPrefix];
      v67 = [v61 URLByAppendingPathComponent:v62 isDirectory:1];

      uint64_t v63 = [v47 restorePersonaWithSavedPersonaContext:v55];
      if (v63)
      {
        v55 = (void *)v63;
        v64 = fp_current_or_default_log();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          -[FPCKTask _prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:](v55);
        }

        (*((void (**)(id, void *, void *, void *))v75 + 2))(v75, v81, v82, v55);
        id v30 = v75;
        v34 = v76;
        v37 = v80;
        goto LABEL_30;
      }
      v68 = v47;
      id v49 = v55;
      v52 = v67;
      v37 = v80;
    }

    id v87 = v71;
    v70 = v52;
    uint64_t v53 = [MEMORY[0x263F054E0] wrapperWithURL:v52 readonly:0 error:&v87];
    id v54 = v87;

    v55 = (void *)v53;
    if (v53)
    {
      v71 = v54;
      v97[0] = v72;
      v97[1] = v53;
      v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:2];
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __171__FPCKTask__prepareXPCService_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_personaIdentifier_options_reason_fpfs_iCDPackageDetection_completionHandler___block_invoke;
      v83[3] = &unk_265307190;
      id v30 = v75;
      id v86 = v75;
      id v84 = v81;
      id v85 = v82;
      LOWORD(v66) = __PAIR16__(a13, a12);
      v35 = v77;
      v36 = v78;
      LODWORD(v65) = a8;
      v37 = v80;
      v34 = v76;
      objc_msgSend(v84, "prepareFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:accessingPaths:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:completionHandler:", v76, v79, v73, v40, v56, v19, v65, a10, a11, v66, v83);
    }
    else
    {
      id v30 = v75;
      (*((void (**)(id, void *, void *, id))v75 + 2))(v75, v81, v82, v54);
      v71 = v54;
      v34 = v76;
    }
    v47 = v68;
    goto LABEL_30;
  }
  id v30 = v75;
  id v31 = v81;
  v32 = v82;
  (*((void (**)(id, void *, void *, id))v75 + 2))(v75, v81, v82, v23);
  v34 = v76;
  v35 = v77;
  v37 = v80;
LABEL_33:
  v33 = v73;
LABEL_34:
}

uint64_t __171__FPCKTask__prepareXPCService_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_personaIdentifier_options_reason_fpfs_iCDPackageDetection_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

- (void)_launchXPCServiceWithUpdateReceiver:(id)a3 proxy:(id)a4 completionHandler:(id)a5
{
}

- (unint64_t)_resolveLaunchType:(unint64_t)a3
{
  unint64_t result = a3;
  if (a3 == 2) {
    return FPIsFPCKXPCServiceEnabled();
  }
  return result;
}

- (void)prepareFPCKRun:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 personaIdentifier:(id)a9 options:(unint64_t)a10 reason:(unint64_t)a11 fpfs:(BOOL)a12 iCDPackageDetection:(BOOL)a13 launchType:(unint64_t)a14 runOnWorkQueue:(BOOL)a15 completionHandler:(id)a16
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a9;
  id v27 = a16;
  unint64_t v28 = [(FPCKTask *)self _resolveLaunchType:a14];
  if (a15)
  {
    workQueue = self->workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __193__FPCKTask_prepareFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_personaIdentifier_options_reason_fpfs_iCDPackageDetection_launchType_runOnWorkQueue_completionHandler___block_invoke;
    block[3] = &unk_2653071B8;
    unint64_t v40 = v28;
    id v39 = v27;
    block[4] = self;
    id v33 = v21;
    id v34 = v22;
    id v35 = v23;
    id v36 = v24;
    id v37 = v25;
    unsigned int v43 = a8;
    id v38 = v26;
    unint64_t v41 = a10;
    unint64_t v42 = a11;
    BOOL v44 = a12;
    BOOL v45 = a13;
    dispatch_async(workQueue, block);
  }
  else if (v28)
  {
    LOWORD(v30) = __PAIR16__(a13, a12);
    -[FPCKTask _prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:](self, "_prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:", v21, v22, v23, v24, v25, a8, v26, a10, a11, v30, v27);
  }
  else
  {
    (*((void (**)(id, void, void, void))v27 + 2))(v27, 0, 0, 0);
  }
}

uint64_t __193__FPCKTask_prepareFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_personaIdentifier_options_reason_fpfs_iCDPackageDetection_launchType_runOnWorkQueue_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 96))
  {
    LOWORD(v3) = *(_WORD *)(a1 + 124);
    return objc_msgSend(*(id *)(a1 + 32), "_prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned int *)(a1 + 120), *(void *)(a1 + 80), *(void *)(a1 + 104), *(void *)(a1 + 112), v3, *(void *)(a1 + 88));
  }
  else
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 88) + 16);
    return v2();
  }
}

- (void)scheduleFPCKRun:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 options:(unint64_t)a9 reason:(unint64_t)a10 fpfs:(BOOL)a11 iCDPackageDetection:(BOOL)a12 launchType:(unint64_t)a13 updateReceiver:(id)a14 shouldPause:(id)a15 proxy:(id)a16 completionHandler:(id)a17
{
  id v37 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a14;
  id v27 = a15;
  id v28 = a16;
  id v29 = a17;
  unint64_t v30 = [(FPCKTask *)self _resolveLaunchType:a13];
  switch(v30)
  {
    case 2uLL:
      id v34 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
      (*((void (**)(id, void, void, void, void *))v29 + 2))(v29, 0, 0, 0, v34);

      break;
    case 1uLL:
      [(FPCKTask *)self _launchXPCServiceWithUpdateReceiver:v26 proxy:v28 completionHandler:v29];
      break;
    case 0uLL:
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __194__FPCKTask_scheduleFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_launchType_updateReceiver_shouldPause_proxy_completionHandler___block_invoke_2;
      aBlock[3] = &unk_265307200;
      id v31 = v26;
      id v41 = v31;
      v32 = _Block_copy(aBlock);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __194__FPCKTask_scheduleFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_launchType_updateReceiver_shouldPause_proxy_completionHandler___block_invoke_3;
      v38[3] = &unk_265307228;
      id v39 = v31;
      id v33 = _Block_copy(v38);
      LOWORD(v35) = __PAIR16__(a12, a11);
      +[FPCKTask runFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:completionHandler:](FPCKTask, "runFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:completionHandler:", v37, v22, v23, v24, v25, a8, a9, a10, v35, v27, v33, v32, &__block_literal_global_49, v29);

      break;
  }
}

uint64_t __194__FPCKTask_scheduleFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_launchType_updateReceiver_shouldPause_proxy_completionHandler___block_invoke()
{
  return 0;
}

void *__194__FPCKTask_scheduleFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_launchType_updateReceiver_shouldPause_proxy_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result saveCheckpointWithReport:a2];
  }
  return result;
}

void *__194__FPCKTask_scheduleFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_launchType_updateReceiver_shouldPause_proxy_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result sendDiagnosticsForItemIDs:a2];
  }
  return result;
}

- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  workQueue = self->workQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__FPCKTask_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke;
  v17[3] = &unk_265307250;
  BOOL v21 = a4;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(workQueue, v17);
}

void __62__FPCKTask_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = 0;
  +[FPCK dumpDatabaseAt:v3 fullDump:v2 writeTo:v4 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)buildPauseResult:(BOOL)a3 semaphore:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [[_TtC9libfssync19FPShouldPauseResult alloc] initWithShouldPause:v4 semaphore:v5];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)_prepareXPCService:(void *)a1 domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:.cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_0(&dword_24D3D0000, v2, v3, "[ERROR] 🧹 FPCK error restoring persona during XPC Service preparation %@", v4, v5, v6, v7, 2u);
}

- (void)_prepareXPCService:(void *)a1 domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:.cold.2(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_0(&dword_24D3D0000, v2, v3, "[ERROR] 🧹 FPCK error adopting persona during XPC Service preparation %@", v4, v5, v6, v7, 2u);
}

- (void)_prepareXPCService:(void *)a1 domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:.cold.3(void *a1)
{
  v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_0(&dword_24D3D0000, v2, v3, "[ERROR] Unable to launch FPCK, unable to sandbox wrap URL: %@", v4, v5, v6, v7, 2u);
}

@end