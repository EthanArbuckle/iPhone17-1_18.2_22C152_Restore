@interface ENExposureDetectionManager
- (BOOL)_applyRegionalConfigurationToDetectionSession:(id)a3 delegate:(id)a4 error:(id *)a5;
- (BOOL)_scheduleNativeExposureDetection;
- (BOOL)enableNativeExposureDetection;
- (BOOL)scheduleDetectionAutomatically;
- (ENExposureDetectionManager)initWithConfigurationStore:(id)a3 downloadManager:(id)a4 exposureDatabase:(id)a5 queue:(id)a6;
- (ENExposureDetectionManagerDelegate)delegate;
- (NSBackgroundActivityScheduler)detectionScheduler;
- (id)_createDetectionSessionWithError:(id *)a3;
- (id)_getDelegateWithError:(id *)a3;
- (id)_publicKeyForRegion:(id)a3 dictionary:(id)a4;
- (id)createDetectionSessionForClient:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)createFileSession;
- (id)createNativeDetectionSessionWithError:(id *)a3;
- (id)createScheduler;
- (id)createXPCServiceClient;
- (int64_t)_processFileAtURL:(id)a3 publicKey:(id)a4 endpoint:(id)a5 session:(id)a6 error:(id *)a7;
- (void)_activate;
- (void)_downloadsDidBecomeAvailable:(id)a3;
- (void)_exposureDetectionSession:(id)a3 finishedWithResult:(id)a4;
- (void)_invalidate;
- (void)_performNativeExposureDetectionWithScheduler:(id)a3 resultHandler:(id)a4;
- (void)_scheduleNativeExposureDetectionForced:(BOOL)a3;
- (void)_unscheduleNativeExposureDetection;
- (void)activate;
- (void)invalidate;
- (void)performNativeExposureDetectionWithResultHandler:(id)a3;
- (void)scheduleNativeExposureDetectionForced:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableNativeExposureDetection:(BOOL)a3;
- (void)setScheduleDetectionAutomatically:(BOOL)a3;
@end

@implementation ENExposureDetectionManager

- (ENExposureDetectionManager)initWithConfigurationStore:(id)a3 downloadManager:(id)a4 exposureDatabase:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ENExposureDetectionManager;
  v15 = [(ENExposureDetectionManager *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configurationStore, a3);
    objc_storeStrong((id *)&v16->_downloadManager, a4);
    objc_storeStrong((id *)&v16->_exposureDatabase, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("ENSessions", v17);
    sessionQueue = v16->_sessionQueue;
    v16->_sessionQueue = (OS_dispatch_queue *)v18;

    v16->_scheduleDetectionAutomatically = 1;
  }

  return v16;
}

- (void)activate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ENExposureDetectionManager_activate__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__ENExposureDetectionManager_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (!self->_activated)
  {
    v3 = [MEMORY[0x1E4F28EB0] defaultCenter];
    [v3 addObserver:self selector:sel__downloadsDidBecomeAvailable_ name:@"ENDownloadManagerDownloadsAvailable" object:self->_downloadManager];

    v4 = [(ENExposureDetectionManager *)self createScheduler];
    detectionScheduler = self->_detectionScheduler;
    self->_detectionScheduler = v4;

    [(ENExposureDetectionManager *)self _unscheduleNativeExposureDetection];
    v6 = [(ENExposureDetectionManager *)self createXPCServiceClient];
    xpcServiceClient = self->_xpcServiceClient;
    self->_xpcServiceClient = v6;

    self->_activated = 1;
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ENExposureDetectionManager_invalidate__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__ENExposureDetectionManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (self->_activated)
  {
    [(ENExposureDetectionManager *)self _unscheduleNativeExposureDetection];
    v3 = [MEMORY[0x1E4F28EB0] defaultCenter];
    [v3 removeObserver:self];

    objc_storeWeak((id *)&self->_delegate, 0);
    [(ENXPCServiceClient *)self->_xpcServiceClient invalidate];
    xpcServiceClient = self->_xpcServiceClient;
    self->_xpcServiceClient = 0;

    self->_activated = 0;
  }
}

- (id)_getDelegateWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
  }
  else if (a3)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_createDetectionSessionWithError:(id *)a3
{
  v5 = -[ENExposureDetectionManager _getDelegateWithError:](self, "_getDelegateWithError:");
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 exposureDetectionManager:self advertisementDatabaseQuerySessionWithAttenuationThreshold:255 error:a3];
    if (v7)
    {
      if ([(ENExposureDatabase *)self->_exposureDatabase openWithError:a3])
      {
        v8 = [[ENExposureDetectionDaemonSession alloc] initWithQueue:self->_sessionQueue];
        [(ENExposureDetectionDaemonSession *)v8 setAdvertisementDatabaseQuerySession:v7];
        [(ENExposureDetectionDaemonSession *)v8 setExposureDatabase:self->_exposureDatabase];
        if ([(ENExposureDetectionManager *)self _applyRegionalConfigurationToDetectionSession:v8 delegate:v6 error:a3])
        {
          v9 = v8;
        }
        else
        {
          v9 = 0;
        }

        goto LABEL_7;
      }
    }
    else if (gLogCategory__ENExposureDetectionManager <= 90 {
           && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
    v9 = 0;
LABEL_7:

    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)_applyRegionalConfigurationToDetectionSession:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a4 activeRegionForExposureDetectionManager:self];
  if (v9)
  {
    v10 = [(ENConfigurationStore *)self->_configurationStore configurationForRegion:v9];
    [v8 setRegionConfiguration:v10];

    id v11 = [(ENConfigurationStore *)self->_configurationStore serverConfigurationForRegion:v9];
    [v8 setRegionServerConfiguration:v11];

    id v12 = [(ENConfigurationStore *)self->_configurationStore serverExposureConfigurationForRegion:v9];
    [v8 setServerExposureConfiguration:v12];

    id v13 = +[ENLoggingPrefs sharedENLoggingPrefs];
    LODWORD(v11) = [v13 isSensitiveLoggingAllowed];

    if (v11
      && gLogCategory_ENExposureDetectionManager <= 50
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (a5)
  {
    ENErrorF();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 != 0;
}

- (id)createDetectionSessionForClient:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  dispatch_queue_t v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__ENExposureDetectionManager_createDetectionSessionForClient_configuration_error___block_invoke;
  block[3] = &unk_1E69ACD50;
  block[4] = self;
  void block[5] = &v15;
  block[6] = a5;
  dispatch_sync(queue, block);
  id v11 = (void *)v16[5];
  if (v11)
  {
    [v11 setClient:v8];
    [(id)v16[5] setClientExposureConfiguration:v9];
    id v12 = (id)v16[5];
  }
  else
  {
    id v12 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

uint64_t __82__ENExposureDetectionManager_createDetectionSessionForClient_configuration_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createDetectionSessionWithError:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)createFileSession
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F25790];
  uint64_t v3 = self->_xpcServiceClient;
  uint64_t v4 = (void *)[[v2 alloc] initWithServiceClient:v3];

  [v4 setFlags:1];

  return v4;
}

- (id)createNativeDetectionSessionWithError:(id *)a3
{
  uint64_t v4 = -[ENExposureDetectionManager _createDetectionSessionWithError:](self, "_createDetectionSessionWithError:");
  v5 = v4;
  if (!v4) {
    goto LABEL_18;
  }
  id v6 = [v4 regionConfiguration];

  if (!v6)
  {
    if (!a3) {
      goto LABEL_18;
    }
LABEL_17:
    ENErrorF();
    id v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = [v5 serverExposureConfiguration];

  if (!v7)
  {
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v8 = [v5 regionServerConfiguration];

  if (!v8)
  {
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v9 = [v5 regionConfiguration];
  v10 = [v9 userConsent];
  uint64_t v11 = [v10 consent];

  if (v11 == 2)
  {
    id v12 = v5;
    goto LABEL_7;
  }
  if (a3) {
    goto LABEL_17;
  }
LABEL_18:
  id v12 = 0;
LABEL_7:

  return v12;
}

- (void)performNativeExposureDetectionWithResultHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__ENExposureDetectionManager_performNativeExposureDetectionWithResultHandler___block_invoke;
  v7[3] = &unk_1E69ACF50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __78__ENExposureDetectionManager_performNativeExposureDetectionWithResultHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __78__ENExposureDetectionManager_performNativeExposureDetectionWithResultHandler___block_invoke_2;
  v2[3] = &unk_1E69AECC0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _performNativeExposureDetectionWithScheduler:0 resultHandler:v2];
}

uint64_t __78__ENExposureDetectionManager_performNativeExposureDetectionWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performNativeExposureDetectionWithScheduler:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_ENExposureDetectionManager <= 50
    && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    id v8 = "background";
    if (!v6) {
      id v8 = "immediate";
    }
    v34 = v8;
    LogPrintF_safe();
  }
  uint64_t v71 = 0;
  v72 = (id *)&v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__10;
  v75 = __Block_byref_object_dispose__10;
  id v76 = 0;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __89__ENExposureDetectionManager__performNativeExposureDetectionWithScheduler_resultHandler___block_invoke;
  v67[3] = &unk_1E69AECE8;
  id v68 = 0;
  id v9 = v7;
  id v69 = v9;
  v70 = &v71;
  v10 = (void (**)(void))MEMORY[0x1D9439FF0](v67);
  if (self->_enableNativeExposureDetection)
  {
    uint64_t v11 = v72;
    id v66 = v72[5];
    id v12 = [(ENExposureDetectionManager *)self createNativeDetectionSessionWithError:&v66];
    objc_storeStrong(v11 + 5, v66);
    if (v12)
    {
      v38 = v10;
      id v13 = [v12 exposureDatabase];
      id v65 = 0;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v72;
      id v64 = v72[5];
      char v16 = [v13 getValue:&v65 forKey:@"LastExposureClassification" ofClass:v14 error:&v64];
      id v40 = v65;
      objc_storeStrong(v15 + 5, v64);

      if (v16)
      {
        [v12 setPreviousExposureClassification:v40];
        uint64_t v17 = v72;
        id v63 = v72[5];
        char v18 = [v12 prepareAndReturnError:&v63];
        objc_storeStrong(v17 + 5, v63);
        if (v18)
        {
          id v39 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
          uint64_t v59 = 0;
          v60 = &v59;
          uint64_t v61 = 0x2020000000;
          char v62 = 0;
          char v62 = [v6 shouldDefer];
          uint64_t v55 = 0;
          v56 = &v55;
          uint64_t v57 = 0x2020000000;
          uint64_t v58 = 0;
          uint64_t v51 = 0;
          v52 = &v51;
          uint64_t v53 = 0x2020000000;
          uint64_t v54 = 0;
          downloadManager = self->_downloadManager;
          id v20 = v72;
          id obj = v72[5];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __89__ENExposureDetectionManager__performNativeExposureDetectionWithScheduler_resultHandler___block_invoke_2;
          v42[3] = &unk_1E69AED10;
          id v43 = v6;
          v44 = self;
          v47 = &v59;
          id v45 = v39;
          id v21 = v12;
          id v46 = v21;
          v48 = &v51;
          v49 = &v55;
          BOOL v22 = [(ENDownloadManager *)downloadManager enumerateDownloadsWithError:&obj handler:v42];
          objc_storeStrong(v20 + 5, obj);
          if (v22)
          {
            v23 = v72;
            id v41 = v72[5];
            v24 = [v21 finishAndReturnError:&v41];
            objc_storeStrong(v23 + 5, v41);
          }
          else
          {
            v24 = 0;
          }
          if (gLogCategory_ENExposureDetectionManager <= 50
            && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
          {
            v27 = "";
            v28 = "un";
            if (v24) {
              v28 = "";
            }
            if (*((unsigned char *)v60 + 24)) {
              v27 = " (deferred)";
            }
            uint64_t v36 = v56[3];
            uint64_t v37 = v52[3];
            v34 = v28;
            v35 = v27;
            LogPrintF_safe();
          }
          if (v24)
          {
            v29 = [v24 summary];
            v30 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v31 = [v30 isSensitiveLoggingAllowed];

            if (v31
              && gLogCategory_ENExposureDetectionManager <= 30
              && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
            {
              v32 = objc_msgSend(v29, "daySummaries", v34, v35, v36, v37);
              [v32 count];
              LogPrintF_safe();
            }
            CFPrefs_SetValue();
            [(ENExposureDetectionManager *)self _exposureDetectionSession:v21 finishedWithResult:v24];
            [(ENExposureDetectionManager *)self _unscheduleNativeExposureDetection];
          }
          else
          {
            if (gLogCategory__ENExposureDetectionManager > 90
              || gLogCategory__ENExposureDetectionManager == -1 && !_LogCategory_Initialize())
            {
LABEL_37:
              if (*((unsigned char *)v60 + 24)) {
                uint64_t v33 = 2;
              }
              else {
                uint64_t v33 = 1;
              }
              (*((void (**)(id, void *, uint64_t, id))v9 + 2))(v9, v24, v33, v72[5]);
              [v21 invalidate];

              _Block_object_dispose(&v51, 8);
              _Block_object_dispose(&v55, 8);
              _Block_object_dispose(&v59, 8);

              goto LABEL_41;
            }
            v29 = CUPrintNSError();
            LogPrintF_safe();
          }

          goto LABEL_37;
        }
        if (gLogCategory__ENExposureDetectionManager <= 90
          && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
      v10[2](v10);
LABEL_41:

      v10 = v38;
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v25 = ENErrorF();
    id v26 = v72[5];
    v72[5] = (id)v25;
  }
  v10[2](v10);
  id v12 = 0;
LABEL_42:

  _Block_object_dispose(&v71, 8);
}

uint64_t __89__ENExposureDetectionManager__performNativeExposureDetectionWithScheduler_resultHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __89__ENExposureDetectionManager__performNativeExposureDetectionWithScheduler_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (![*(id *)(a1 + 32) shouldDefer])
  {
    v10 = (void *)MEMORY[0x1D9439DC0]();
    uint64_t v11 = [v8 region];
    if (v11)
    {
      id v12 = [*(id *)(a1 + 40) _publicKeyForRegion:v11 dictionary:*(void *)(a1 + 48)];

      if (v12)
      {
        id v13 = *(void **)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 56);
        id v18 = 0;
        uint64_t v9 = [v13 _processFileAtURL:v7 publicKey:v12 endpoint:v8 session:v14 error:&v18];
        id v15 = v18;

        if (v9 == 1)
        {
          uint64_t v16 = *(void *)(a1 + 80);
          goto LABEL_15;
        }
        if (v9 == 2)
        {
          uint64_t v16 = *(void *)(a1 + 72);
LABEL_15:
          ++*(void *)(*(void *)(v16 + 8) + 24);
LABEL_16:

          goto LABEL_17;
        }
LABEL_12:
        if (a4)
        {
          id v15 = v15;
          *a4 = v15;
        }
        goto LABEL_16;
      }
    }
    else
    {
    }
    ENErrorF();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if (a4)
  {
    ENErrorF();
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_17:

  return v9;
}

- (void)_exposureDetectionSession:(id)a3 finishedWithResult:(id)a4
{
  exposureDatabase = self->_exposureDatabase;
  id v6 = a4;
  id v7 = [v6 exposureClassification];
  id v8 = ENDefaultExpirationDate();
  id v13 = 0;
  BOOL v9 = [(ENExposureDatabase *)exposureDatabase setValue:v7 forKey:@"LastExposureClassification" expiryDate:v8 error:&v13];
  id v10 = v13;

  if (!v9
    && gLogCategory__ENExposureDetectionManager <= 90
    && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    id v12 = CUPrintNSError();
    LogPrintF_safe();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained exposureDetectionManager:self finishedSessionWithResult:v6];
}

- (id)_publicKeyForRegion:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    BOOL v9 = [v7 objectForKeyedSubscript:v6];
    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      uint64_t v11 = [(ENConfigurationStore *)self->_configurationStore serverConfigurationForRegion:v6];
      id v12 = v11;
      if (v11)
      {
        id v13 = [v11 publicKey];
        uint64_t v14 = *MEMORY[0x1E4F3B6F8];
        id v19 = 0;
        id v10 = +[ENSecKey keyFromBase64String:v13 keyClass:v14 error:&v19];
        id v15 = v19;

        if (v10)
        {
          [v8 setObject:v10 forKeyedSubscript:v6];
          id v16 = v10;
        }
        else if (gLogCategory__ENExposureDetectionManager <= 90 {
               && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
        }
        {
          id v18 = CUPrintNSError();
          LogPrintF_safe();
        }
      }
      else
      {
        if (gLogCategory__ENExposureDetectionManager <= 90
          && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (int64_t)_processFileAtURL:(id)a3 publicKey:(id)a4 endpoint:(id)a5 session:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v16 = [v11 path];
  uint64_t v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v18 = [v17 isSensitiveLoggingAllowed];

  if (v18
    && gLogCategory_ENExposureDetectionManager <= 10
    && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v33 = v16;
    LogPrintF_safe();
  }
  if (v16)
  {
    id v19 = [v16 pathExtension];
    char v20 = [v19 isEqualToString:@"zip"];

    if (v20)
    {
      id v21 = [(ENExposureDetectionManager *)self createFileSession];
      id v40 = 0;
      char v22 = [v21 activateWithArchivePath:v16 error:&v40];
      id v37 = v40;
      if ((v22 & 1) == 0)
      {
        if (gLogCategory__ENExposureDetectionManager <= 90
          && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v34 = uint64_t v33 = v16;
          LogPrintF_safe();
        }
        objc_msgSend(WeakRetained, "exposureDetectionManager:errorDetected:", self, 3002, v33, v34);
        int64_t v25 = 2;
        goto LABEL_36;
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __81__ENExposureDetectionManager__processFileAtURL_publicKey_endpoint_session_error___block_invoke;
      v39[3] = &unk_1E69ACA50;
      v39[4] = v21;
      uint64_t v36 = (void (**)(void))MEMORY[0x1D9439FF0](v39);
      id v38 = 0;
      char v23 = [v14 addMatchesFromFileSession:v21 publicKey:v12 endpoint:v13 error:&v38];
      id v24 = v38;
      if (v23)
      {
        int64_t v25 = 1;
LABEL_35:

        v36[2](v36);
LABEL_36:

        goto LABEL_37;
      }
      id v35 = v24;
      id v26 = [v24 domain];
      if ([v26 isEqualToString:@"ENExposureDetectionDaemonSessionErrorDomain"])
      {
        uint64_t v27 = [v35 code];

        if (v27 == 2)
        {
          v28 = [v21 signatures];
          v29 = [v28 firstObject];

          if (v29)
          {
            if (gLogCategory__ENExposureDetectionManager > 90
              || gLogCategory__ENExposureDetectionManager == -1 && !_LogCategory_Initialize())
            {
              uint64_t v31 = 3003;
              goto LABEL_34;
            }
            v30 = CUPrintNSError();
            uint64_t v33 = v16;
            v34 = v30;
            LogPrintF_safe();
            uint64_t v31 = 3003;
          }
          else
          {
            if (gLogCategory__ENExposureDetectionManager > 90
              || gLogCategory__ENExposureDetectionManager == -1 && !_LogCategory_Initialize())
            {
              uint64_t v31 = 3001;
              goto LABEL_34;
            }
            v30 = CUPrintNSError();
            uint64_t v33 = v16;
            v34 = v30;
            LogPrintF_safe();
            uint64_t v31 = 3001;
          }
          goto LABEL_29;
        }
      }
      else
      {
      }
      if (gLogCategory__ENExposureDetectionManager > 90
        || gLogCategory__ENExposureDetectionManager == -1 && !_LogCategory_Initialize())
      {
        uint64_t v31 = 3004;
        goto LABEL_34;
      }
      v30 = CUPrintNSError();
      uint64_t v33 = v16;
      v34 = v30;
      LogPrintF_safe();
      uint64_t v31 = 3004;
LABEL_29:

LABEL_34:
      objc_msgSend(WeakRetained, "exposureDetectionManager:errorDetected:", self, v31, v33, v34);
      int64_t v25 = 2;
      id v24 = v35;
      goto LABEL_35;
    }
  }
  if (gLogCategory__ENExposureDetectionManager <= 90
    && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  objc_msgSend(WeakRetained, "exposureDetectionManager:errorDetected:", self, 3000, v33);
  int64_t v25 = 2;
LABEL_37:

  return v25;
}

uint64_t __81__ENExposureDetectionManager__processFileAtURL_publicKey_endpoint_session_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)scheduleNativeExposureDetectionForced:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__ENExposureDetectionManager_scheduleNativeExposureDetectionForced___block_invoke;
  v4[3] = &unk_1E69AED38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __68__ENExposureDetectionManager_scheduleNativeExposureDetectionForced___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNativeExposureDetectionForced:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_scheduleNativeExposureDetectionForced:(BOOL)a3
{
  BOOL v3 = a3;
  downloadManager = self->_downloadManager;
  id v15 = 0;
  id v6 = [(ENDownloadManager *)downloadManager countOfAvailableDownloadsWithError:&v15];
  id v7 = v15;
  id v8 = v7;
  if (!v6)
  {
    id v9 = v7;
    id v10 = [v9 domain];
    if ([v10 isEqualToString:*MEMORY[0x1E4F25700]])
    {
      uint64_t v11 = [v9 code];

      int v12 = v11 == 16 ? 30 : 90;
    }
    else
    {

      int v12 = 90;
    }
    if (v12 >= gLogCategory_ENExposureDetectionManager
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      id v14 = v9;
      LogPrintF_safe();
    }
  }
  if (objc_msgSend(v6, "unsignedIntValue", v14)) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = !v3;
  }
  if (v13)
  {
    [(ENExposureDetectionManager *)self _unscheduleNativeExposureDetection];
  }
  else if ([(ENExposureDetectionManager *)self _scheduleNativeExposureDetection] {
         && gLogCategory_ENExposureDetectionManager <= 30
  }
         && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_downloadsDidBecomeAvailable:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ENExposureDetectionManager <= 30
    && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (self->_scheduleDetectionAutomatically) {
    [(ENExposureDetectionManager *)self scheduleNativeExposureDetectionForced:0];
  }
}

- (BOOL)_scheduleNativeExposureDetection
{
  detectionScheduler = self->_detectionScheduler;
  if (detectionScheduler)
  {
    if (gLogCategory_ENExposureDetectionManager <= 10
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    id v4 = [(ENExposureDetectionManager *)self createScheduler];
    BOOL v5 = self->_detectionScheduler;
    self->_detectionScheduler = v4;

    [(NSBackgroundActivityScheduler *)self->_detectionScheduler setQualityOfService:17];
    [(NSBackgroundActivityScheduler *)self->_detectionScheduler setInterval:900.0];
    [(NSBackgroundActivityScheduler *)self->_detectionScheduler setTolerance:810.0];
    [(NSBackgroundActivityScheduler *)self->_detectionScheduler setRepeats:0];
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14320], 1);
    [(NSBackgroundActivityScheduler *)self->_detectionScheduler _setAdditionalXPCActivityProperties:v6];
    id v7 = self->_detectionScheduler;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke;
    v9[3] = &unk_1E69AED60;
    v9[4] = self;
    [(NSBackgroundActivityScheduler *)v7 scheduleWithBlock:v9];
    if (gLogCategory_ENExposureDetectionManager <= 10
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  return detectionScheduler == 0;
}

void __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_ENExposureDetectionManager <= 50
    && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke_2;
  block[3] = &unk_1E69ACF50;
  block[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_sync(v5, block);
}

void __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[9];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke_3;
  v4[3] = &unk_1E69AECC0;
  id v5 = *(id *)(a1 + 40);
  [v2 _performNativeExposureDetectionWithScheduler:v3 resultHandler:v4];
  [*(id *)(a1 + 32) _unscheduleNativeExposureDetection];
}

void __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  if (!v8
    && gLogCategory__ENExposureDetectionManager <= 90
    && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    id v7 = CUPrintNSError();
    LogPrintF_safe();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (void)_unscheduleNativeExposureDetection
{
  if (self->_detectionScheduler)
  {
    if (gLogCategory_ENExposureDetectionManager <= 30
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    [(NSBackgroundActivityScheduler *)self->_detectionScheduler invalidate];
    detectionScheduler = self->_detectionScheduler;
    self->_detectionScheduler = 0;
  }
}

- (id)createScheduler
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B30]) initWithIdentifier:@"com.apple.ExposureNotification.detection"];

  return v2;
}

- (id)createXPCServiceClient
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F25820]);

  return v2;
}

- (ENExposureDetectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENExposureDetectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSBackgroundActivityScheduler)detectionScheduler
{
  return self->_detectionScheduler;
}

- (BOOL)enableNativeExposureDetection
{
  return self->_enableNativeExposureDetection;
}

- (void)setEnableNativeExposureDetection:(BOOL)a3
{
  self->_enableNativeExposureDetection = a3;
}

- (BOOL)scheduleDetectionAutomatically
{
  return self->_scheduleDetectionAutomatically;
}

- (void)setScheduleDetectionAutomatically:(BOOL)a3
{
  self->_scheduleDetectionAutomatically = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcServiceClient, 0);
  objc_storeStrong((id *)&self->_exposureDatabase, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);

  objc_storeStrong((id *)&self->_configurationStore, 0);
}

@end