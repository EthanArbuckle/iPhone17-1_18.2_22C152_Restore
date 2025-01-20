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
  if (qword_100AE2AC8 != -1) {
    dispatch_once(&qword_100AE2AC8, &stru_100A69990);
  }
  v2 = (void *)qword_100AE2AC0;

  return v2;
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
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.FileProviderDaemon.FPCKService"];
  v3 = FPDFPCKServiceXPCInterface();
  [v2 setRemoteObjectInterface:v3];

  [v2 activate];

  return v2;
}

+ (id)xpcServiceProxyWithConnection:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = +[NSXPCConnection currentConnection];
  id v5 = [v4 processIdentifier];

  id v6 = [objc_alloc((Class)FPXPCAutomaticErrorProxy) initWithConnection:v3 protocol:&OBJC_PROTOCOL___FPCKServiceProtocol orError:0 name:@"FPCKServiceProxy" requestPid:v5];
  objc_super v7 = [v6 synchronousRemoteObjectProxy];

  return v7;
}

+ (void)runFPCKForDomain:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 options:(unint64_t)a9 reason:(unint64_t)a10 fpfs:(BOOL)a11 iCDPackageDetection:(BOOL)a12 shouldPause:(id)a13 sendDiagnostics:(id)a14 saveCheckpoint:(id)a15 isInvalidated:(id)a16 completionHandler:(id)a17
{
  v22 = (Block_layout *)a13;
  BOOL v42 = v22 != 0;
  v23 = &stru_100A699D0;
  if (v22) {
    v23 = v22;
  }
  v45 = v23;
  v44 = (void (**)(id, id, id, void *, id))a17;
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

  v49 = v33;
  v34 = [v28 path];

  v50 = v34;
  v35 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  BYTE1(v41) = v42;
  LOBYTE(v41) = a12;
  v36 = -[FPCK initWithDatabasesBackupsPaths:volumeRole:providerDomainID:domainUserInfo:reason:usingFPFS:iCDPackageDetection:useShouldPause:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:](v32, "initWithDatabasesBackupsPaths:volumeRole:providerDomainID:domainUserInfo:reason:usingFPFS:iCDPackageDetection:useShouldPause:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:", v35, a8, v31, v30, a10, a11, v41, v45, v26, v25, v24);

  +[NSMutableString string];
  id v48 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100085FA0;
  v46[3] = &unk_100A699F8;
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = v47;
  [(FPCK *)v36 launchFromURLs:v27 options:a9 error:&v48 resultHandler:v46];

  id v38 = v48;
  id v39 = objc_alloc_init((Class)FPCKStats);
  objc_msgSend(v39, "setNumberOfFilesChecked:", -[FPCK numberOfFilesChecked](v36, "numberOfFilesChecked"));
  objc_msgSend(v39, "setNumberOfBrokenFilesInFSAndFSSnapshotCheck:", -[FPCK numberOfBrokenFilesInFSAndFSSnapshotCheck](v36, "numberOfBrokenFilesInFSAndFSSnapshotCheck"));
  objc_msgSend(v39, "setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:", -[FPCK numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck](v36, "numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck"));
  objc_msgSend(v39, "setNumberOfBrokenFilesInReconciliationTableCheck:", -[FPCK numberOfBrokenFilesInReconciliationTableCheck](v36, "numberOfBrokenFilesInReconciliationTableCheck"));
  objc_msgSend(v39, "setNumberOfBrokenFilesInBackupManifestCheck:", -[FPCK numberOfBrokenFilesInBackupManifestCheck](v36, "numberOfBrokenFilesInBackupManifestCheck"));
  v40 = [(FPCK *)v36 telemetryReport];
  v44[2](v44, v37, v39, v40, v38);
}

- (void)_prepareXPCService:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 personaIdentifier:(id)a9 options:(unint64_t)a10 reason:(unint64_t)a11 fpfs:(BOOL)a12 iCDPackageDetection:(BOOL)a13 completionHandler:(id)a14
{
  id v75 = a3;
  id v78 = a4;
  id v77 = a5;
  id v76 = a6;
  id v18 = a7;
  id v79 = a9;
  id v74 = a14;
  v81 = +[FPCKTask xpcServiceConnection];
  v80 = +[FPCKTask xpcServiceProxyWithConnection:](FPCKTask, "xpcServiceProxyWithConnection:");
  id v19 = objc_alloc_init((Class)NSMutableArray);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v20 = v18;
  id v21 = [v20 countByEnumeratingWithState:&v92 objects:v97 count:16];
  if (v21)
  {
    id v22 = v21;
    id v23 = 0;
    uint64_t v24 = *(void *)v93;
    while (2)
    {
      id v25 = 0;
      id v26 = v23;
      do
      {
        if (*(void *)v93 != v24) {
          objc_enumerationMutation(v20);
        }
        id v27 = *(void **)(*((void *)&v92 + 1) + 8 * (void)v25);
        id v91 = v26;
        id v28 = +[FPSandboxingURLWrapper wrapperWithURL:v27 readonly:0 error:&v91];
        id v23 = v91;

        if (!v28)
        {
          id v29 = fp_current_or_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10096934C(v27);
          }

          id v30 = v74;
          id v31 = v80;
          v32 = v81;
          (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v23);
          v33 = v20;
          v34 = v75;
          v35 = v76;
          v36 = v77;
          id v37 = v79;
          goto LABEL_34;
        }
        [v19 addObject:v28];

        id v25 = (char *)v25 + 1;
        id v26 = v23;
      }
      while (v22 != v25);
      id v22 = [v20 countByEnumeratingWithState:&v92 objects:v97 count:16];
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

  id v90 = v23;
  v36 = v77;
  uint64_t v39 = +[FPSandboxingURLWrapper wrapperWithURL:v77 readonly:0 error:&v90];
  id v23 = v90;

  v72 = (void *)v39;
  if (v39)
  {
    id v89 = v23;
    v35 = v76;
    v40 = +[FPSandboxingURLWrapper wrapperWithURL:v76 readonly:0 error:&v89];
    id v41 = v89;

    if (!v40)
    {
      id v30 = v74;
      (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v41);
      v34 = v75;
      id v37 = v79;
LABEL_32:

      id v23 = v41;
      id v31 = v80;
      v32 = v81;
      goto LABEL_33;
    }
    BOOL v42 = [v76 URLByDeletingLastPathComponent];
    id v88 = v41;
    uint64_t v43 = +[FPSandboxingURLWrapper wrapperWithURL:v42 readonly:0 error:&v88];
    id v44 = v88;

    v71 = (void *)v43;
    if (!v43)
    {
      id v30 = v74;
      (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v44);
      v34 = v75;
      id v37 = v79;
      id v41 = v44;
LABEL_31:

      goto LABEL_32;
    }
    v70 = v44;
    v45 = +[UMUserManager sharedManager];
    v46 = [v45 currentPersona];

    id v47 = [v46 userPersonaUniqueString];
    id v37 = v79;
    v68 = v47;
    if (!v79 || v47 && ([v47 isEqualToString:v79] & 1) != 0)
    {
      v67 = v46;
      id v48 = +[NSURL fp_supportDirectoryForVolume:v77];
      v49 = +[InternalPathsManager purgatoryPrefix];
      uint64_t v50 = [v48 URLByAppendingPathComponent:v49 isDirectory:1];

      v51 = (void *)v50;
    }
    else
    {
      id v87 = 0;
      id v54 = [v46 copyCurrentPersonaContextWithError:&v87];
      id v56 = v87;
      if (v56)
      {
        id v57 = v56;
        (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v56);
        v69 = v57;
        id v30 = v74;
        v34 = v75;
LABEL_30:

        id v41 = v70;
        goto LABEL_31;
      }
      v69 = v54;
      uint64_t v58 = [v46 generateAndRestorePersonaContextWithIdentityString:v79];
      if (v58)
      {
        id v54 = (id)v58;
        v59 = fp_current_or_default_log();
        v34 = v75;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          sub_1009692C4(v54);
        }

        id v30 = v74;
        (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v54);
        goto LABEL_30;
      }
      v60 = +[NSURL fp_supportDirectoryForVolume:v77];
      v61 = +[InternalPathsManager purgatoryPrefix];
      v66 = [v60 URLByAppendingPathComponent:v61 isDirectory:1];

      uint64_t v62 = [v46 restorePersonaWithSavedPersonaContext:v54];
      if (v62)
      {
        id v54 = (id)v62;
        v63 = fp_current_or_default_log();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          sub_10096923C(v54);
        }

        (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v54);
        id v30 = v74;
        v34 = v75;
        id v37 = v79;
        goto LABEL_30;
      }
      v67 = v46;
      id v48 = v54;
      v51 = v66;
      id v37 = v79;
    }

    id v86 = v70;
    v69 = v51;
    uint64_t v52 = +[FPSandboxingURLWrapper wrapperWithURL:v51 readonly:0 error:&v86];
    id v53 = v86;

    id v54 = (id)v52;
    if (v52)
    {
      v70 = v53;
      v96[0] = v71;
      v96[1] = v52;
      v55 = +[NSArray arrayWithObjects:v96 count:2];
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_100086764;
      v82[3] = &unk_100A69A20;
      id v30 = v74;
      id v85 = v74;
      id v83 = v80;
      id v84 = v81;
      LOWORD(v65) = __PAIR16__(a13, a12);
      v35 = v76;
      v36 = v77;
      LODWORD(v64) = a8;
      id v37 = v79;
      v34 = v75;
      objc_msgSend(v83, "prepareFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:accessingPaths:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:completionHandler:", v75, v78, v72, v40, v55, v19, v64, a10, a11, v65, v82);
    }
    else
    {
      id v30 = v74;
      (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v53);
      v70 = v53;
      v34 = v75;
    }
    v46 = v67;
    goto LABEL_30;
  }
  id v30 = v74;
  id v31 = v80;
  v32 = v81;
  (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v23);
  v34 = v75;
  v35 = v76;
  id v37 = v79;
LABEL_33:
  v33 = v72;
LABEL_34:
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
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000869FC;
    block[3] = &unk_100A69A48;
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
      id v34 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
      (*((void (**)(id, void, void, void, void *))v29 + 2))(v29, 0, 0, 0, v34);

      break;
    case 1uLL:
      [(FPCKTask *)self _launchXPCServiceWithUpdateReceiver:v26 proxy:v28 completionHandler:v29];
      break;
    case 0uLL:
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100086D2C;
      v40[3] = &unk_100A69AB0;
      id v31 = v26;
      id v41 = v31;
      v32 = objc_retainBlock(v40);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100086D40;
      v38[3] = &unk_100A69AD8;
      id v39 = v31;
      id v33 = objc_retainBlock(v38);
      LOWORD(v35) = __PAIR16__(a12, a11);
      +[FPCKTask runFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:completionHandler:](FPCKTask, "runFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:completionHandler:", v37, v22, v23, v24, v25, a8, a9, a10, v35, v27, v33, v32, &stru_100A69A88, v29);

      break;
  }
}

- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  workQueue = self->workQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100086E48;
  v17[3] = &unk_100A69B00;
  BOOL v21 = a4;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(workQueue, v17);
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

@end