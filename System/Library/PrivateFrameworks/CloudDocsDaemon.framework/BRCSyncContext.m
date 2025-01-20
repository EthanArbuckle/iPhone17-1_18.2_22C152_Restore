@interface BRCSyncContext
+ (id)_contextIdentifierForMangledID:(id)a3 metadata:(BOOL)a4;
+ (id)_createCKContainerForAccountID:(id)a3 contextIdentifier:(id)a4;
+ (id)transferContextForServerZone:(id)a3 appLibrary:(id)a4;
- (BOOL)allowsCellularAccess;
- (BOOL)isForeground;
- (BOOL)isShared;
- (BRCAccountSession)session;
- (BRCSessionContext)sessionContext;
- (BRCSyncContext)initWithSession:(id)a3 contextIdentifier:(id)a4 isShared:(BOOL)a5;
- (BRCThrottleBase)applyThrottle;
- (BRCThrottleBase)downloadThrottle;
- (BRCThrottleBase)perItemSyncUpThrottle;
- (BRCThrottleBase)readerThrottle;
- (BRCThrottleBase)uploadFileModifiedThrottle;
- (BRCThrottleBase)uploadThrottle;
- (BRCTransferStream)downloadStream;
- (BRCTransferStream)uploadStream;
- (BRCUserDefaults)defaults;
- (CKContainer)ckContainer;
- (CKContainerID)ckContainerID;
- (NSString)contextIdentifier;
- (id)_database;
- (id)description;
- (id)foregroundClients;
- (void)_armForegroundGraceTimerForClientDescription:(id)a3;
- (void)_notifyContainerBeingNowForeground;
- (void)_notifyFrameworkContainersMonitorWithState:(BOOL)a3;
- (void)_preventConcurrentModifyRecordsOperations:(id)a3 nonDiscretionary:(BOOL)a4;
- (void)addForegroundClient:(id)a3;
- (void)addOperation:(id)a3;
- (void)addOperation:(id)a3 allowsCellularAccess:(id)a4;
- (void)addOperation:(id)a3 allowsCellularAccess:(id)a4 nonDiscretionary:(id)a5;
- (void)addOperation:(id)a3 nonDiscretionary:(BOOL)a4;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)didReceiveHandoffRequest;
- (void)dumpToContext:(id)a3;
- (void)forceContainerForegroundForDuration:(double)a3;
- (void)removeForegroundClient:(id)a3;
- (void)resume;
- (void)setupIfNeeded;
@end

@implementation BRCSyncContext

- (BRCSessionContext)sessionContext
{
  return (BRCSessionContext *)self->_session;
}

- (BRCUserDefaults)defaults
{
  if (self->_isShared)
  {
    v2 = +[BRCUserDefaults defaultsForSharedZone];
  }
  else
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:self->_contextIdentifier];
    v2 = +[BRCUserDefaults defaultsForMangledID:v3];
  }
  return (BRCUserDefaults *)v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  contextIdentifier = self->_contextIdentifier;
  BOOL v6 = [(BRCSyncContext *)self isForeground];
  v7 = @"background";
  if (v6) {
    v7 = @"foreground";
  }
  return (id)[v3 stringWithFormat:@"<%@: %@ %p %@>", v4, contextIdentifier, self, v7];
}

+ (id)_contextIdentifierForMangledID:(id)a3 metadata:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 isShared])
  {
    if (v4)
    {
      id v6 = (id)*MEMORY[0x1E4F59458];
    }
    else
    {
      id v6 = [v5 aliasTargetContainerString];
    }
  }
  else
  {
    if (v4 && [v5 isCloudDocsMangledID])
    {
      v7 = NSString;
      v8 = [v5 appLibraryOrZoneName];
      v9 = [v7 stringWithFormat:@"%@-metadata", v8];

      goto LABEL_10;
    }
    id v6 = [v5 appLibraryOrZoneName];
  }
  v9 = v6;
LABEL_10:

  return v9;
}

+ (id)transferContextForServerZone:(id)a3 appLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isSharedZone])
  {
    v7 = [v5 asSharedZone];
    v8 = [v7 transferSyncContext];
  }
  else
  {
    v8 = [v6 transferSyncContext];
  }

  return v8;
}

- (BRCSyncContext)initWithSession:(id)a3 contextIdentifier:(id)a4 isShared:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 fsUploader];
  v12 = [v11 uploadsDeadlineScheduler];

  if (!v12)
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncContext initWithSession:contextIdentifier:isShared:](v9);
    }
  }
  v15 = [v9 fsDownloader];
  v16 = [v15 downloadsDeadlineScheduler];

  if (!v16)
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncContext initWithSession:contextIdentifier:isShared:](v9);
    }
  }
  v86.receiver = self;
  v86.super_class = (Class)BRCSyncContext;
  v19 = [(BRCSyncContext *)&v86 init];
  v20 = v19;
  if (v19)
  {
    p_session = (id *)&v19->_session;
    objc_storeStrong((id *)&v19->_session, a3);
    objc_storeStrong((id *)&v20->_contextIdentifier, a4);
    v20->_isShared = a5;
    v22 = [(BRCSyncContext *)v20 defaults];
    v23 = [BRCThrottleBase alloc];
    v24 = [v22 readerThrottleParams];
    uint64_t v25 = [(BRCThrottleBase *)v23 initWithName:@"fsreader.coordination.throttle" andParameters:v24];
    readerThrottle = v20->_readerThrottle;
    v20->_readerThrottle = (BRCThrottleBase *)v25;

    v27 = [BRCThrottleBase alloc];
    v28 = [v22 applyThrottleParams];
    uint64_t v29 = [(BRCThrottleBase *)v27 initWithName:@"fswriter.apply.throttle" andParameters:v28];
    applyThrottle = v20->_applyThrottle;
    v20->_applyThrottle = (BRCThrottleBase *)v29;

    v31 = [BRCThrottleBase alloc];
    v32 = [v22 downloadThrottleParams];
    uint64_t v33 = [(BRCThrottleBase *)v31 initWithName:@"transfer.download.throttle" andParameters:v32];
    downloadThrottle = v20->_downloadThrottle;
    v20->_downloadThrottle = (BRCThrottleBase *)v33;

    v35 = [BRCThrottleBase alloc];
    v36 = [v22 uploadThrottleParams];
    uint64_t v37 = [(BRCThrottleBase *)v35 initWithName:@"transfer.upload.throttle" andParameters:v36];
    uploadThrottle = v20->_uploadThrottle;
    v20->_uploadThrottle = (BRCThrottleBase *)v37;

    v39 = [BRCThrottleBase alloc];
    v40 = [v22 uploadFileModifiedThrottleParams];
    uint64_t v41 = [(BRCThrottleBase *)v39 initWithName:@"transfer.upload.file-modified.throttle" andParameters:v40];
    uploadFileModifiedThrottle = v20->_uploadFileModifiedThrottle;
    v20->_uploadFileModifiedThrottle = (BRCThrottleBase *)v41;

    v43 = [BRCThrottleBase alloc];
    v44 = [v22 perItemSyncUpThrottleParams];
    uint64_t v45 = [(BRCThrottleBase *)v43 initWithName:@"transfer.upload.throttle" andParameters:v44];
    perItemSyncUpThrottle = v20->_perItemSyncUpThrottle;
    v20->_perItemSyncUpThrottle = (BRCThrottleBase *)v45;

    v47 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    discretionaryRecursiveListOperationQueue = v20->_discretionaryRecursiveListOperationQueue;
    v20->_discretionaryRecursiveListOperationQueue = v47;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v20->_discretionaryRecursiveListOperationQueue, "setMaxConcurrentOperationCount:", (int)[v22 discretionaryRecursiveListMaxOperationCount]);
    v49 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    nonDiscretionaryRecursiveListOperationQueue = v20->_nonDiscretionaryRecursiveListOperationQueue;
    v20->_nonDiscretionaryRecursiveListOperationQueue = v49;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v20->_nonDiscretionaryRecursiveListOperationQueue, "setMaxConcurrentOperationCount:", (int)[v22 nonDiscretionaryRecursiveListMaxOperationCount]);
    objc_initWeak(&location, v20);
    v51 = [(NSString *)v20->_contextIdentifier stringByAppendingPathComponent:@"uploader"];
    v52 = [BRCTransferStream alloc];
    v53 = [*p_session fsUploader];
    v54 = [v53 uploadsDeadlineScheduler];
    uint64_t v55 = -[BRCTransferStream initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:](v52, "initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:", v20, v51, v54, [v22 uploadBatchCount]);
    uploadStream = v20->_uploadStream;
    v20->_uploadStream = (BRCTransferStream *)v55;

    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __61__BRCSyncContext_initWithSession_contextIdentifier_isShared___block_invoke;
    v81[3] = &unk_1E699AFB0;
    objc_copyWeak(&v84, &location);
    id v57 = v22;
    id v82 = v57;
    id v58 = v9;
    id v83 = v58;
    [(BRCTransferStream *)v20->_uploadStream setStreamDidBecomeReadyToTransferRecords:v81];
    v59 = [(NSString *)v20->_contextIdentifier stringByAppendingPathComponent:@"downloader"];

    v60 = [BRCTransferStream alloc];
    v61 = [*p_session fsDownloader];
    v62 = [v61 downloadsDeadlineScheduler];
    uint64_t v63 = -[BRCTransferStream initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:](v60, "initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:", v20, v59, v62, [v57 downloadBatchCount]);
    downloadStream = v20->_downloadStream;
    v20->_downloadStream = (BRCTransferStream *)v63;

    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __61__BRCSyncContext_initWithSession_contextIdentifier_isShared___block_invoke_37;
    v77[3] = &unk_1E699AFB0;
    objc_copyWeak(&v80, &location);
    id v65 = v57;
    id v78 = v65;
    id v79 = v58;
    [(BRCTransferStream *)v20->_downloadStream setStreamDidBecomeReadyToTransferRecords:v77];
    v20->_notifyTokenForFramework = -1;
    v66 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    foregroundClients = v20->_foregroundClients;
    v20->_foregroundClients = v66;

    v68 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v69 = dispatch_queue_attr_make_with_autorelease_frequency(v68, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v70 = dispatch_queue_create("com.apple.bird.foreground.state", v69);

    foregroundStateQueue = v20->_foregroundStateQueue;
    v20->_foregroundStateQueue = (OS_dispatch_queue *)v70;

    uint64_t v72 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    nonDiscretionaryModifyOperations = v20->_nonDiscretionaryModifyOperations;
    v20->_nonDiscretionaryModifyOperations = (NSHashTable *)v72;

    uint64_t v74 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    discretionaryModifyOperations = v20->_discretionaryModifyOperations;
    v20->_discretionaryModifyOperations = (NSHashTable *)v74;

    objc_destroyWeak(&v80);
    objc_destroyWeak(&v84);
    objc_destroyWeak(&location);
  }
  return v20;
}

void __61__BRCSyncContext_initWithSession_contextIdentifier_isShared___block_invoke(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v9 = [a1[4] uploadBatchRecordsCount];
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSyncContext initWithSession:contextIdentifier:isShared:]_block_invoke", 185, v15);
  id v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v15[0];
    v14 = +[BRCDumpContext stringFromByteCount:a2 context:0];
    *(_DWORD *)buf = 134219266;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = WeakRetained;
    __int16 v20 = 2048;
    uint64_t v21 = v9;
    __int16 v22 = 2112;
    v23 = v14;
    __int16 v24 = 2048;
    uint64_t v25 = a3;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader: preparing next batch for %@ (max-count:%ld size:%@ priority:%ld)%@", buf, 0x3Eu);
  }
  v12 = [a1[5] fsUploader];
  [v12 transferStreamOfSyncContext:WeakRetained didBecomeReadyWithMaxRecordsCount:v9 sizeHint:a2 priority:a3 completionBlock:v7];

  __brc_leave_section(v15);
}

void __61__BRCSyncContext_initWithSession_contextIdentifier_isShared___block_invoke_37(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v9 = [a1[4] downloadBatchRecordsCount];
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSyncContext initWithSession:contextIdentifier:isShared:]_block_invoke", 201, v15);
  id v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v15[0];
    v14 = +[BRCDumpContext stringFromByteCount:a2 context:0];
    *(_DWORD *)buf = 134219266;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = WeakRetained;
    __int16 v20 = 2048;
    uint64_t v21 = v9;
    __int16 v22 = 2112;
    v23 = v14;
    __int16 v24 = 2048;
    uint64_t v25 = a3;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Downloader: preparing next batch for %@ (max-count:%ld size:%@ priority:%ld)%@", buf, 0x3Eu);
  }
  v12 = [a1[5] fsDownloader];
  [v12 transferStreamOfSyncContext:WeakRetained didBecomeReadyWithMaxRecordsCount:v9 sizeHint:a2 priority:a3 completionBlock:v7];

  __brc_leave_section(v15);
}

- (void)dealloc
{
  int notifyTokenForFramework = self->_notifyTokenForFramework;
  if (notifyTokenForFramework != -1) {
    notify_cancel(notifyTokenForFramework);
  }
  v4.receiver = self;
  v4.super_class = (Class)BRCSyncContext;
  [(BRCSyncContext *)&v4 dealloc];
}

+ (id)_createCKContainerForAccountID:(id)a3 contextIdentifier:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F19ED8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = 1;
  id v10 = (void *)[v8 initWithContainerIdentifier:*MEMORY[0x1E4F593F8] environment:1];
  v11 = objc_opt_new();
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F19E30]) initWithAccountID:v7];

  [v11 setAccountOverrideInfo:v12];
  uint64_t v13 = objc_opt_new();
  v14 = +[BRCUserDefaults defaultsForMangledID:0];
  int v15 = [v14 supportsEnhancedDrivePrivacy];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F19F58]);
    uint64_t v17 = (void *)[v16 initWithLevel:2 name:*MEMORY[0x1E4F592F8] value:*MEMORY[0x1E4F59300]];
    [v13 addObject:v17];

    uint64_t v9 = 3;
  }
  [v11 setMmcsEncryptionSupport:v9];
  [v11 setSupportedDeviceCapabilities:v13];
  __int16 v18 = +[BRCDaemon daemon];
  id v19 = objc_msgSend(objc_alloc((Class)objc_msgSend(v18, "containerClass")), "initWithContainerID:options:", v10, v11);

  __int16 v20 = [v19 options];
  [v20 setCaptureResponseHTTPHeaders:1];

  [v19 setSourceApplicationBundleIdentifier:v6];
  [v19 setSourceApplicationSecondaryIdentifier:*MEMORY[0x1E4F592E0]];

  return v19;
}

- (void)setupIfNeeded
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [[[UMUserManager sharedManager] br_currentPersonaID] isEqualToString:_session.personaIdentifier]%@", v2, v3, v4, v5, v6);
}

- (CKContainer)ckContainer
{
  [(BRCSyncContext *)self setupIfNeeded];
  ckContainer = self->_ckContainer;
  return ckContainer;
}

- (CKContainerID)ckContainerID
{
  return (CKContainerID *)[(CKContainer *)self->_ckContainer containerID];
}

- (id)_database
{
  BOOL isShared = self->_isShared;
  ckContainer = self->_ckContainer;
  if (isShared) {
    [(CKContainer *)ckContainer sharedCloudDatabase];
  }
  else {
  uint64_t v4 = [(CKContainer *)ckContainer privateCloudDatabase];
  }
  return v4;
}

- (void)_preventConcurrentModifyRecordsOperations:(id)a3 nonDiscretionary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 v26 = self;
  id v7 = [(BRCSyncContext *)self defaults];
  int v8 = [v7 preventConcurrentModifyRecordsOperations];

  if (v8)
  {
    p_nonDiscretionaryModifyOperations = (id *)&v26->_nonDiscretionaryModifyOperations;
    obuint64_t j = v26->_nonDiscretionaryModifyOperations;
    objc_sync_enter(obj);
    if (v4)
    {
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      id v10 = v26->_discretionaryModifyOperations;
      uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v14, "isFinished", obj) & 1) == 0)
            {
              int v15 = brc_bread_crumbs();
              id v16 = brc_default_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                id v37 = v14;
                __int16 v38 = 2112;
                id v39 = v6;
                __int16 v40 = 2112;
                uint64_t v41 = v15;
                _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling discretionary operation %@ to make room for a non discretionary operation %@%@", buf, 0x20u);
              }

              [v14 cancel];
              [v6 addDependency:v14];
            }
          }
          uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v31 objects:v42 count:16];
        }
        while (v11);
      }
    }
    else
    {
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      long long v27 = 0uLL;
      long long v28 = 0uLL;
      id v17 = *p_nonDiscretionaryModifyOperations;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            __int16 v22 = brc_bread_crumbs();
            v23 = brc_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v37 = v6;
              __int16 v38 = 2112;
              id v39 = v21;
              __int16 v40 = 2112;
              uint64_t v41 = v22;
              _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking discretionary op %@ on %@%@", buf, 0x20u);
            }

            if (([v21 isFinished] & 1) == 0) {
              [v6 addDependency:v21];
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v18);
      }

      p_nonDiscretionaryModifyOperations = (id *)&v26->_discretionaryModifyOperations;
    }
    objc_msgSend(*p_nonDiscretionaryModifyOperations, "addObject:", v6, obj);
    objc_sync_exit(obja);
  }
}

- (BOOL)allowsCellularAccess
{
  uint64_t v2 = +[BRCContainerCellularSettings containerCellularSettings];
  char v3 = [v2 isCellularEnabled];

  return v3;
}

- (void)addOperation:(id)a3
{
}

- (void)addOperation:(id)a3 allowsCellularAccess:(id)a4
{
}

- (void)addOperation:(id)a3 nonDiscretionary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  [(BRCSyncContext *)self addOperation:v7 allowsCellularAccess:0 nonDiscretionary:v8];
}

- (void)addOperation:(id)a3 allowsCellularAccess:(id)a4 nonDiscretionary:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v52 = a5;
  [(BRCSyncContext *)self setupIfNeeded];
  id v10 = [(BRCSyncContext *)self _database];
  if (!v10)
  {
    v50 = brc_bread_crumbs();
    v51 = brc_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    uint64_t v12 = [v11 configuration];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      v14 = objc_opt_new();
      [v11 setConfiguration:v14];
    }
    int v15 = +[BRCUserDefaults defaultsForMangledID:0];
    if ([v15 nsurlsessiondEnabled])
    {
      char v16 = [v52 BOOLValue];

      if ((v16 & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v17 = [v11 configuration];
    [v17 setDiscretionaryNetworkBehavior:0];

    uint64_t v18 = [v11 configuration];
    [v18 setAutomaticallyRetryNetworkFailures:0];

LABEL_10:
    ckContainer = self->_ckContainer;
    __int16 v20 = [v11 configuration];
    [v20 setContainer:ckContainer];

    if (v9) {
      uint64_t v21 = [v9 BOOLValue];
    }
    else {
      uint64_t v21 = [(BRCSyncContext *)self allowsCellularAccess];
    }
    uint64_t v22 = v21;
    v23 = [v11 configuration];
    [v23 setAllowsCellularAccess:v22];

    __int16 v24 = [v11 configuration];
    LODWORD(v23) = [v24 discretionaryNetworkBehavior] == 0;

    if (v23)
    {
      long long v29 = [v11 configuration];
      [v29 setSourceApplicationBundleIdentifier:*MEMORY[0x1E4F592E0]];
    }
    else
    {
      contextIdentifier = self->_contextIdentifier;
      __int16 v26 = [v11 configuration];
      [v26 setSourceApplicationBundleIdentifier:contextIdentifier];

      long long v27 = [v11 configuration];
      [v27 setSourceApplicationSecondaryIdentifier:*MEMORY[0x1E4F592E0]];

      long long v28 = [v11 configuration];
      [v28 setDiscretionaryNetworkBehavior:1];

      long long v29 = [v11 configuration];
      [v29 setAutomaticallyRetryNetworkFailures:1];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v8;
    long long v31 = [v30 configuration];
    -[BRCSyncContext _preventConcurrentModifyRecordsOperations:nonDiscretionary:](self, "_preventConcurrentModifyRecordsOperations:nonDiscretionary:", v30, [v31 discretionaryNetworkBehavior] == 0);
  }
  if (self->_isCancelled) {
    [v8 cancel];
  }
  long long v32 = brc_bread_crumbs();
  long long v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v47 = [(CKContainer *)self->_ckContainer options];
    v48 = [v47 accountOverrideInfo];
    v49 = [v48 accountID];
    *(_DWORD *)buf = 138413058;
    id v54 = v8;
    __int16 v55 = 2112;
    v56 = v10;
    __int16 v57 = 2112;
    id v58 = v49;
    __int16 v59 = 2112;
    v60 = v32;
    _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] scheduling %@ on %@ (account %@)%@", buf, 0x2Au);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v34 = [v8 group];
    BOOL v35 = v34 == 0;

    if (v35)
    {
      v36 = brc_bread_crumbs();
      id v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:]((uint64_t)v8);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v38 = [v8 group];
    BOOL v39 = v38 == 0;

    if (v39)
    {
      __int16 v40 = brc_bread_crumbs();
      uint64_t v41 = brc_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        -[BRCSyncContext addOperation:allowsCellularAccess:nonDiscretionary:]((uint64_t)v8);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v42 = v8;
    uint64_t v43 = [(BRCAccountSession *)self->_session accountWaitOperation];
    if (v43) {
      [v42 addDependency:v43];
    }
    [v10 addOperation:v42];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v44 = [v8 nonDiscretionary];
      uint64_t v45 = 112;
      if (v44) {
        uint64_t v45 = 104;
      }
      [*(id *)((char *)&self->super.isa + v45) addOperation:v8];
    }
    else
    {
      v46 = [v10 operationQueue];
      [v46 addOperation:v8];
    }
  }
}

- (void)resume
{
  char v3 = [(BRCSyncContext *)self contextIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F59398]])
  {
  }
  else
  {
    BOOL v4 = [(BRCSyncContext *)self contextIdentifier];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F59408]];

    if (!v5) {
      goto LABEL_5;
    }
  }
  self->_foregroundState = 2;
  [(BRCSyncContext *)self _notifyFrameworkContainersMonitorWithState:1];
LABEL_5:
  [(BRCTransferStream *)self->_uploadStream resume];
  downloadStream = self->_downloadStream;
  [(BRCTransferStream *)downloadStream resume];
}

- (void)cancel
{
  self->_isCancelled = 1;
  [(BRCTransferStream *)self->_downloadStream cancel];
  [(BRCTransferStream *)self->_uploadStream cancel];
  id v4 = [(BRCSyncContext *)self _database];
  char v3 = [v4 operationQueue];
  [v3 cancelAllOperations];
}

- (void)close
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _isCancelled%@", v2, v3, v4, v5, v6);
}

void __23__BRCSyncContext_close__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 56);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint8_t v6 = *(NSObject **)(v2 + 64);
  if (v6)
  {
    dispatch_source_cancel(v6);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = 0;
  }
}

- (void)dumpToContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  obuint64_t j = v5;
  if ([(NSMutableSet *)v5->_foregroundClients count] || v5->_dateWhenLastForegroundClientLeft)
  {
    [v4 writeLineWithFormat:@"+ foreground clients:"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint8_t v6 = v5->_foregroundClients;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [v10 identifier];
            [v4 writeLineWithFormat:@"   o %@ [zone]", v11];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v11 = [v10 identifier];
              [v4 writeLineWithFormat:@"   o %@ [appLib]", v11];
            }
            else
            {
              id v11 = [v10 identifier];
              [v4 writeLineWithFormat:@"   o %@", v11];
            }
          }
        }
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    dateWhenLastForegroundClientLeft = v5->_dateWhenLastForegroundClientLeft;
    if (dateWhenLastForegroundClientLeft)
    {
      lastForegroundClientDescription = v5->_lastForegroundClientDescription;
      [(NSDate *)dateWhenLastForegroundClientLeft timeIntervalSinceNow];
      [v4 writeLineWithFormat:@"   o %@ [grace period] disconnected %.1fs ago", lastForegroundClientDescription, -v14];
    }
  }
  unint64_t foregroundState = obj->_foregroundState;
  if (foregroundState == 1)
  {
    char v16 = @"   o forced foreground";
    goto LABEL_21;
  }
  if (foregroundState == 2)
  {
    char v16 = @"   o always foreground";
LABEL_21:
    [v4 writeLineWithFormat:v16];
  }
  objc_sync_exit(obj);
}

- (void)forceContainerForegroundForDuration:(double)a3
{
  foregroundStateQueue = self->_foregroundStateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke;
  v4[3] = &unk_1E6995308;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(foregroundStateQueue, v4);
}

void __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 80) <= 1uLL)
  {
    if (*(void *)(v3 + 64))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v3 + 64));
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = 0;

      uint64_t v3 = *(void *)(a1 + 32);
    }
    if (([(id)v3 isForeground] & 1) == 0) {
      [*(id *)(a1 + 32) _notifyFrameworkContainersMonitorWithState:1];
    }
    *(void *)(*(void *)(a1 + 32) + 80) = 1;
    uint8_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      float v22 = *(double *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v21;
      __int16 v26 = 2048;
      double v27 = v22;
      __int16 v28 = 2112;
      long long v29 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] beginning forced foreground for %@ for %.1fs%@", buf, 0x20u);
    }

    uint64_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 72));
    int64_t v9 = brc_interval_to_nsec();
    dispatch_time_t v10 = dispatch_time(0, v9);
    dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_83;
    v23[3] = &unk_1E6993698;
    v23[4] = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v23;
    BOOL v13 = v11;
    double v14 = v12;
    int v15 = v14;
    char v16 = v14;
    if (*MEMORY[0x1E4F59658])
    {
      char v16 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v14);
    }
    dispatch_block_t v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v16);
    dispatch_source_set_event_handler(v13, v17);

    uint64_t v18 = *(void *)(a1 + 32);
    long long v19 = *(void **)(v18 + 64);
    *(void *)(v18 + 64) = v13;
    long long v20 = v13;

    dispatch_resume(v20);
  }
  objc_sync_exit(v2);
}

void __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_83(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_83_cold_2(a1);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 80) != 1)
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_83_cold_1();
    }

    uint64_t v4 = *(void *)(a1 + 32);
  }
  *(void *)(v4 + 80) = 0;
  if (([*(id *)(a1 + 32) isForeground] & 1) == 0) {
    [*(id *)(a1 + 32) _notifyFrameworkContainersMonitorWithState:0];
  }
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 64));
  uint64_t v5 = *(void *)(a1 + 32);
  uint8_t v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = 0;
}

- (void)addForegroundClient:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isShared)
  {
    uint64_t v5 = [(BRCAccountSession *)self->_session syncContextProvider];
    uint8_t v6 = [v5 sideCarSyncContext];
    [v6 addForegroundClient:v4];
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(NSMutableSet *)v7->_foregroundClients count];
  [(NSMutableSet *)v7->_foregroundClients addObject:v4];
  int64_t v9 = brc_bread_crumbs();
  dispatch_time_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    char v16 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Added %@ as a foreground client%@", (uint8_t *)&v11, 0x20u);
  }

  if (!v8) {
    [(BRCSyncContext *)v7 _notifyContainerBeingNowForeground];
  }
  objc_sync_exit(v7);
}

- (void)removeForegroundClient:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 description];
  if (self->_isShared)
  {
    uint8_t v6 = [(BRCAccountSession *)self->_session syncContextProvider];
    uint64_t v7 = [v6 sideCarSyncContext];
    [v7 removeForegroundClient:v4];
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if ([(NSMutableSet *)v8->_foregroundClients containsObject:v4])
  {
    [(NSMutableSet *)v8->_foregroundClients removeObject:v4];
    int64_t v9 = brc_bread_crumbs();
    dispatch_time_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412802;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      char v16 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Removed %@ as a foreground client%@", (uint8_t *)&v11, 0x20u);
    }

    if (!(v8->_foregroundState | [(NSMutableSet *)v8->_foregroundClients count])) {
      [(BRCSyncContext *)v8 _armForegroundGraceTimerForClientDescription:v5];
    }
  }
  objc_sync_exit(v8);
}

- (BOOL)isForeground
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_foregroundState
    || [(NSMutableSet *)v2->_foregroundClients count]
    || v2->_timerForGraceForegroundPeriod != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)foregroundClients
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)[(NSMutableSet *)v2->_foregroundClients copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)didReceiveHandoffRequest
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  if (![(NSMutableSet *)obj->_foregroundClients count])
  {
    [(BRCSyncContext *)obj _notifyContainerBeingNowForeground];
    [(BRCSyncContext *)obj _armForegroundGraceTimerForClientDescription:@"Handoff request"];
  }
  objc_sync_exit(obj);
}

- (void)_armForegroundGraceTimerForClientDescription:(id)a3
{
  id v5 = a3;
  uint8_t v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_lastForegroundClientDescription, a3);
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  dateWhenLastForegroundClientLeft = v6->_dateWhenLastForegroundClientLeft;
  v6->_dateWhenLastForegroundClientLeft = (NSDate *)v7;

  foregroundStateQueue = v6->_foregroundStateQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke;
  v11[3] = &unk_1E6993628;
  v11[4] = v6;
  id v10 = v5;
  id v12 = v10;
  dispatch_async_with_logs_14(foregroundStateQueue, v11);

  objc_sync_exit(v6);
}

void __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2[7])
  {
    BOOL v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_cold_1();
    }

    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56));
    id v5 = *(void **)(*(void *)(a1 + 32) + 56);
    *(void *)(*(void *)(a1 + 32) + 56) = 0;

    id v2 = *(void **)(a1 + 32);
  }
  uint8_t v6 = [v2 defaults];
  [v6 foregroundGracePeriod];
  double v8 = v7;

  int64_t v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = *(void *)(a1 + 40);
    float v26 = v8;
    *(_DWORD *)id location = 138413058;
    *(void *)&location[4] = v24;
    __int16 v30 = 2112;
    uint64_t v31 = v25;
    __int16 v32 = 2048;
    double v33 = v26;
    __int16 v34 = 2112;
    BOOL v35 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] beginning foreground grace period for %@ from %@ for %.1fs%@", location, 0x2Au);
  }

  int v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 72));
  int64_t v12 = brc_interval_to_nsec();
  dispatch_time_t v13 = dispatch_time(0, v12);
  dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)location, *(id *)(a1 + 32));
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_88;
  v27[3] = &unk_1E6993C50;
  objc_copyWeak(&v28, (id *)location);
  id v14 = v11;
  __int16 v15 = v27;
  char v16 = v14;
  uint64_t v17 = v15;
  uint64_t v18 = v17;
  long long v19 = v17;
  if (*MEMORY[0x1E4F59658])
  {
    long long v19 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v17);
  }
  dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
  dispatch_source_set_event_handler(v16, v20);

  uint64_t v21 = *(void *)(a1 + 32);
  float v22 = *(void **)(v21 + 56);
  *(void *)(v21 + 56) = v16;
  uint64_t v23 = v16;

  dispatch_resume(v23);
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)location);
}

void __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = brc_bread_crumbs();
    BOOL v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_88_cold_1();
    }

    id v4 = (id *)WeakRetained;
    objc_sync_enter(v4);
    id v5 = v4[5];
    v4[5] = 0;

    id v6 = v4[6];
    void v4[6] = 0;

    id v7 = v4[7];
    v4[7] = 0;

    id v8 = v4[10];
    objc_sync_exit(v4);

    if (!v8)
    {
      [v4 _notifyFrameworkContainersMonitorWithState:0];
      int64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v10 = [v4[15] personaIdentifier];
      int v11 = BRPersonaSpecificName();
      [v9 postNotificationName:v11 object:v4 userInfo:0];
    }
  }
}

- (void)_notifyFrameworkContainersMonitorWithState:(BOOL)a3
{
  id v6 = self->_contextIdentifier;
  id v4 = BRNotifyNameForForegroundChangeWithContainerID();
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_notifyTokenForFramework != -1
    || ([v4 UTF8String], !brc_notify_register_check()))
  {
    [v4 UTF8String];
    brc_notify_set_state_and_post();
  }
  objc_sync_exit(v5);
}

- (void)_notifyContainerBeingNowForeground
{
  foregroundStateQueue = self->_foregroundStateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__BRCSyncContext__notifyContainerBeingNowForeground__block_invoke;
  v3[3] = &unk_1E6993698;
  v3[4] = self;
  dispatch_async_with_logs_14(foregroundStateQueue, v3);
}

void __52__BRCSyncContext__notifyContainerBeingNowForeground__block_invoke(uint64_t a1)
{
  id v2 = (void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[7])
  {
    BOOL v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __52__BRCSyncContext__notifyContainerBeingNowForeground__block_invoke_cold_1(v2);
    }

    dispatch_source_cancel(*(dispatch_source_t *)(*v2 + 56));
    id v5 = *(void **)(*v2 + 56);
    *(void *)(*v2 + 56) = 0;

    uint64_t v1 = (void *)*v2;
  }
  id v6 = v1;
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(*v2 + 80);
  objc_sync_exit(v6);

  if (!v7)
  {
    [(id)*v2 _notifyFrameworkContainersMonitorWithState:1];
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int64_t v9 = [*(id *)(*v2 + 120) personaIdentifier];
    id v10 = BRPersonaSpecificName();
    [v8 postNotificationName:v10 object:*v2 userInfo:0];
  }
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (BRCThrottleBase)readerThrottle
{
  return self->_readerThrottle;
}

- (BRCThrottleBase)applyThrottle
{
  return self->_applyThrottle;
}

- (BRCThrottleBase)downloadThrottle
{
  return self->_downloadThrottle;
}

- (BRCThrottleBase)uploadThrottle
{
  return self->_uploadThrottle;
}

- (BRCThrottleBase)uploadFileModifiedThrottle
{
  return self->_uploadFileModifiedThrottle;
}

- (BRCThrottleBase)perItemSyncUpThrottle
{
  return self->_perItemSyncUpThrottle;
}

- (BRCTransferStream)uploadStream
{
  return self->_uploadStream;
}

- (BRCTransferStream)downloadStream
{
  return self->_downloadStream;
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStream, 0);
  objc_storeStrong((id *)&self->_uploadStream, 0);
  objc_storeStrong((id *)&self->_perItemSyncUpThrottle, 0);
  objc_storeStrong((id *)&self->_uploadFileModifiedThrottle, 0);
  objc_storeStrong((id *)&self->_uploadThrottle, 0);
  objc_storeStrong((id *)&self->_downloadThrottle, 0);
  objc_storeStrong((id *)&self->_applyThrottle, 0);
  objc_storeStrong((id *)&self->_readerThrottle, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_discretionaryRecursiveListOperationQueue, 0);
  objc_storeStrong((id *)&self->_nonDiscretionaryRecursiveListOperationQueue, 0);
  objc_storeStrong((id *)&self->_discretionaryModifyOperations, 0);
  objc_storeStrong((id *)&self->_nonDiscretionaryModifyOperations, 0);
  objc_storeStrong((id *)&self->_foregroundStateQueue, 0);
  objc_storeStrong((id *)&self->_timerForForcedForegroundPeriod, 0);
  objc_storeStrong((id *)&self->_timerForGraceForegroundPeriod, 0);
  objc_storeStrong((id *)&self->_dateWhenLastForegroundClientLeft, 0);
  objc_storeStrong((id *)&self->_lastForegroundClientDescription, 0);
  objc_storeStrong((id *)&self->_foregroundClients, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);
}

- (void)initWithSession:(void *)a1 contextIdentifier:isShared:.cold.1(void *a1)
{
  [a1 isOpen];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_4_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: Trying to create a sync context while downloadsDeadlineScheduler still missing. Session open: %d%@", v3, v4, v5, v6, v7);
}

- (void)initWithSession:(void *)a1 contextIdentifier:isShared:.cold.2(void *a1)
{
  [a1 isOpen];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_4_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: Trying to create a sync context while uploadsDeadlineScheduler still missing. Session open: %d%@", v3, v4, v5, v6, v7);
}

- (void)addOperation:(uint64_t)a1 allowsCellularAccess:nonDiscretionary:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: missing group for %@%@", (void)v3, DWORD2(v3));
}

- (void)addOperation:allowsCellularAccess:nonDiscretionary:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: database%@", v2, v3, v4, v5, v6);
}

void __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_83_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self->_foregroundState == BRCContainerForegroundStateForcedForeground%@", v2, v3, v4, v5, v6);
}

void __54__BRCSyncContext_forceContainerForegroundForDuration___block_invoke_83_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] forced foreground grace period over for %@%@", (void)v3, DWORD2(v3));
}

void __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: there should be no timer created%@", v2, v3, v4, v5, v6);
}

void __63__BRCSyncContext__armForegroundGraceTimerForClientDescription___block_invoke_88_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_debug_impl(&dword_1D353B000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] grace period over for %@ %@%@", v3, 0x20u);
}

void __52__BRCSyncContext__notifyContainerBeingNowForeground__block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Cancelling foreground grace timer for %@ because we're now foreground again%@", (void)v3, DWORD2(v3));
}

@end