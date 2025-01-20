@interface BRCFileProviderDaemonUtils
+ (id)sharedInstance;
- (BOOL)boostFileProvider;
- (BOOL)waitForFPToBeReadyToAcceptXPCWithError:(id *)a3;
- (id)_initWithSyncBubble:(BOOL)a3 isFPFS:(BOOL)a4;
- (void)_signalFPReady;
- (void)_waitIsOver;
- (void)dealloc;
- (void)enableFileProviderBoosting;
- (void)interrupt;
@end

@implementation BRCFileProviderDaemonUtils

- (id)_initWithSyncBubble:(BOOL)a3 isFPFS:(BOOL)a4
{
  v16.receiver = self;
  v16.super_class = (Class)BRCFileProviderDaemonUtils;
  v6 = [(BRCFileProviderDaemonUtils *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_inSyncBubble = a3;
    v6->_isFPFS = a4;
    *(_WORD *)&v6->_interrupted = 0;
    *(_WORD *)&v6->_startedWaitingForFP = 0;
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v9 = dispatch_queue_attr_make_initially_inactive(v8);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("file-provider-ready-queue", v10);

    fileProviderReadyQueue = v7->_fileProviderReadyQueue;
    v7->_fileProviderReadyQueue = (OS_dispatch_queue *)v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    waitForFPSemaphore = v7->_waitForFPSemaphore;
    v7->_waitForFPSemaphore = (OS_dispatch_semaphore *)v13;
  }
  return v7;
}

- (void)dealloc
{
  dispatch_activate((dispatch_object_t)self->_fileProviderReadyQueue);
  v3.receiver = self;
  v3.super_class = (Class)BRCFileProviderDaemonUtils;
  [(BRCFileProviderDaemonUtils *)&v3 dealloc];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__BRCFileProviderDaemonUtils_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __44__BRCFileProviderDaemonUtils_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = +[BRCAccountsManager sharedManager];
  uint64_t v3 = [v2 isInSyncBubble];

  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) _initWithSyncBubble:v3 isFPFS:0];
  v5 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v4;
}

- (void)interrupt
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] got interrupted%@", (uint8_t *)&v5, 0xCu);
  }

  v2->_interrupted = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)v2->_waitForFPSemaphore);
  objc_sync_exit(v2);
}

- (void)_signalFPReady
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fpReady)
  {
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] FP is now ready to accept xpc connections%@", (uint8_t *)&v5, 0xCu);
    }

    v2->_fpReady = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)v2->_waitForFPSemaphore);
  }
  objc_sync_exit(v2);
}

- (void)_waitIsOver
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_fpReady)
  {
    if (obj->_interrupted) {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 4, @"BRCFileProviderDaemonUtils was interrupted while waiting for FP to accept xpc connections");
    }
    else {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_unkownErrorWithDescription:", @"Waiting without success for FP to accept xpc connections");
    }
    fpReadyError = obj->_fpReadyError;
    obj->_fpReadyError = (NSError *)v3;

    v2 = obj;
  }
  dispatch_activate((dispatch_object_t)v2->_fileProviderReadyQueue);
  objc_sync_exit(obj);
}

- (void)enableFileProviderBoosting
{
  obj = self;
  objc_sync_enter(obj);
  obj->_shouldBoostFileProvider = 1;
  objc_sync_exit(obj);
}

- (BOOL)waitForFPToBeReadyToAcceptXPCWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!self->_isFPFS && self->_inSyncBubble)
  {
    brc_bread_crumbs();
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Device is in sync bubble%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorCantCallFPInSyncBubble");
    v12 = (BRCFileProviderDaemonUtils *)(id)objc_claimAutoreleasedReturnValue();
    BOOL fpReady = v12 == 0;
    if (v12)
    {
      v14 = brc_bread_crumbs();
      v15 = brc_default_log();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v36 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v41 = "-[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]";
        __int16 v42 = 2080;
        if (!a3) {
          v36 = "(ignored by caller)";
        }
        v43 = v36;
        __int16 v44 = 2112;
        v45 = v12;
        __int16 v46 = 2112;
        v47 = v14;
        _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3) {
      *a3 = v12;
    }

    goto LABEL_27;
  }
  uint64_t v4 = self;
  objc_sync_enter(v4);
  BOOL startedWaitingForFP = v4->_startedWaitingForFP;
  v4->_BOOL startedWaitingForFP = 1;
  objc_sync_exit(v4);

  if (!startedWaitingForFP)
  {
    v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]((uint64_t)v6, v7);
    }

    if ([(BRCFileProviderDaemonUtils *)v4 boostFileProvider])
    {
      v8 = brc_bread_crumbs();
      v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]((uint64_t)v8, v9);
      }
    }
    else
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __69__BRCFileProviderDaemonUtils_waitForFPToBeReadyToAcceptXPCWithError___block_invoke;
      v39[3] = &unk_1E6995380;
      v39[4] = v4;
      objc_super v16 = [MEMORY[0x1E4F25D68] beginMonitoringProviderDomainChangesWithHandler:v39];
      v17 = +[BRCUserDefaults defaultsForMangledID:0];
      unsigned int v18 = [v17 fpReadyForXpcCheckMaxWaitTimeInSec];

      waitForFPSemaphore = v4->_waitForFPSemaphore;
      dispatch_time_t v20 = dispatch_time(0, 1000000000 * v18);
      dispatch_semaphore_wait(waitForFPSemaphore, v20);
      [MEMORY[0x1E4F25D68] endMonitoringProviderDomainChanges:v16];
    }
    [(BRCFileProviderDaemonUtils *)v4 _waitIsOver];
  }
  v12 = v4;
  objc_sync_enter(v12);
  BOOL fpReady = v12->_fpReady;
  if (v12->_fpReady)
  {
LABEL_26:
    objc_sync_exit(v12);
    goto LABEL_27;
  }
  fpReadyError = v12->_fpReadyError;
  if (fpReadyError)
  {
    v22 = fpReadyError;
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
    {
      v35 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v41 = "-[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]";
      __int16 v42 = 2080;
      if (!a3) {
        v35 = "(ignored by caller)";
      }
      v43 = v35;
      __int16 v44 = 2112;
      v45 = v22;
      __int16 v46 = 2112;
      v47 = v23;
      _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a3) {
      *a3 = v22;
    }

    goto LABEL_26;
  }
  objc_sync_exit(v12);

  dispatch_sync((dispatch_queue_t)v12->_fileProviderReadyQueue, &__block_literal_global_38);
  v26 = v12;
  objc_sync_enter(v26);
  if (v12->_fpReady)
  {
    BOOL fpReady = 1;
  }
  else
  {
    v27 = v12->_fpReadyError;
    if (v27)
    {
      v28 = v27;
      v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
      {
        v37 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v41 = "-[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]";
        __int16 v42 = 2080;
        if (!a3) {
          v37 = "(ignored by caller)";
        }
        v43 = v37;
        __int16 v44 = 2112;
        v45 = v28;
        __int16 v46 = 2112;
        v47 = v29;
        _os_log_error_impl(&dword_1D353B000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      BOOL fpReady = 0;
    }
    else
    {
      v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]((uint64_t)v31, v32);
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: FP is not ready but we don't have an error");
      v28 = (BRCFileProviderDaemonUtils *)objc_claimAutoreleasedReturnValue();
      BOOL fpReady = v28 == 0;
      if (v28)
      {
        v33 = brc_bread_crumbs();
        v34 = brc_default_log();
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
        {
          v38 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v41 = "-[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]";
          __int16 v42 = 2080;
          if (!a3) {
            v38 = "(ignored by caller)";
          }
          v43 = v38;
          __int16 v44 = 2112;
          v45 = v28;
          __int16 v46 = 2112;
          v47 = v33;
          _os_log_error_impl(&dword_1D353B000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
    }
    if (a3) {
      *a3 = v28;
    }
  }
  objc_sync_exit(v26);
  v12 = v26;
LABEL_27:

  return fpReady;
}

uint64_t __69__BRCFileProviderDaemonUtils_waitForFPToBeReadyToAcceptXPCWithError___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v3 = result;
    uint64_t v4 = brc_bread_crumbs();
    int v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] Got com.apple.fileprovider.providers-changed notification. FP is ready to accept XPC calls%@", (uint8_t *)&v6, 0xCu);
    }

    return [*(id *)(v3 + 32) _signalFPReady];
  }
  return result;
}

- (BOOL)boostFileProvider
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  BOOL fpReady = v2->_fpReady;
  if (v2->_fpReady || !v2->_startedWaitingForFP)
  {
    objc_sync_exit(v2);
  }
  else
  {
    BOOL shouldBoostFileProvider = v2->_shouldBoostFileProvider;
    objc_sync_exit(v2);

    if (shouldBoostFileProvider)
    {
      int v6 = +[BRCStringAdditions _br_currentMobileDocumentsDirForLegacy];
      if (v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v12 = 0x3032000000;
        dispatch_semaphore_t v13 = __Block_byref_object_copy__35;
        v14 = __Block_byref_object_dispose__35;
        id v15 = 0;
        uint64_t v8 = [MEMORY[0x1E4F25CE0] synchronousSharedConnectionProxy];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __47__BRCFileProviderDaemonUtils_boostFileProvider__block_invoke;
        v10[3] = &unk_1E6998908;
        v10[4] = v2;
        v10[5] = &buf;
        [v8 wakeUpForURL:v7 completionHandler:v10];

        BOOL fpReady = *(void *)(*((void *)&buf + 1) + 40) == 0;
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        uint64_t v7 = brc_bread_crumbs();
        v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v7;
          _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find Mobile Documents path for current persona%@", (uint8_t *)&buf, 0xCu);
        }

        BOOL fpReady = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return fpReady;
}

void __47__BRCFileProviderDaemonUtils_boostFileProvider__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v4 = v5;
  if (!v5)
  {
    [*(id *)(a1 + 32) _signalFPReady];
    uint64_t v4 = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderReadyQueue, 0);
  objc_storeStrong((id *)&self->_waitForFPSemaphore, 0);
  objc_storeStrong((id *)&self->_fpReadyError, 0);
}

- (void)waitForFPToBeReadyToAcceptXPCWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: FP is not ready but we don't have an error%@", (uint8_t *)&v2, 0xCu);
}

- (void)waitForFPToBeReadyToAcceptXPCWithError:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FP is already ready to connect after boosting%@", (uint8_t *)&v2, 0xCu);
}

- (void)waitForFPToBeReadyToAcceptXPCWithError:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Starting to wait for FP to be ready to accept xpc connections%@", (uint8_t *)&v2, 0xCu);
}

@end