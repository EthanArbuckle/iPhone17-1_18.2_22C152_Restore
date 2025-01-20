@interface ENConfigurationManager
+ (BOOL)isRampModeEnabledFromServerResponse:(id)a3;
+ (BOOL)serverResponse:(id)a3 isOnRampMode:(unint64_t)a4;
+ (BOOL)verifyAppleServerResponse:(id)a3 signatureHeader:(id)a4;
+ (double)randomSelectPercentagePerDayFromServerResponse:(id)a3;
+ (id)iCloudServerEndpoint;
+ (id)staticRegionForBundleID:(id)a3;
+ (unint64_t)rampModeFromServerResponse:(id)a3;
+ (void)_printServerConfiguration:(id)a3;
- (BOOL)isInGracePeriodTransition;
- (BOOL)mobileCountryCodeOverriden;
- (BOOL)prefRampTrialPeriodProfile;
- (BOOL)prefTestHeaderEnabled;
- (BOOL)regionSupportsFeatures:(id)a3 featureFlags:(unsigned int)a4;
- (BOOL)updateRampModeForRegion:(id)a3 rampMode:(unint64_t)a4;
- (ENActiveEntity)activeEntity;
- (ENCloudServerChannel)cloudServerChannel;
- (ENConfigurationManager)initWithDelegate:(id)a3 activeEntity:(id)a4;
- (ENConfigurationManagerDelegate)delegate;
- (ENConfigurationStore)configurationStore;
- (ENRegionMonitor)regionMonitor;
- (ENXPCTimer)gracePeriodConfigurationFetchTimer;
- (ENXPCTimer)serverConfigurationFetchTimer;
- (NSMutableDictionary)regionRampModeOverride;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)serialQueue;
- (unint64_t)readCachedRampModeForRegion:(id)a3;
- (void)_activate;
- (void)_fetchServerConfigurationsForRegion:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)_processServerConfiguration:(id)a3 forceUpdate:(BOOL)a4;
- (void)_reportErrorMetricForHTTPStatus:(int64_t)a3;
- (void)_saveAndRemoveStaleConfigurations:(id)a3 region:(id)a4 error:(id)a5;
- (void)_scheduleRegionConfigurationRefresh;
- (void)_serverFetchRegionConfiguration:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)activate;
- (void)dealloc;
- (void)fetchServerConfigurationsForRegion:(id)a3 userInitiated:(BOOL)a4 withCompletion:(id)a5;
- (void)overrideRampModeForRegion:(id)a3 rampMode:(unint64_t)a4;
- (void)prefsChanged;
- (void)refreshServerConfigurationsUponProfileChange;
- (void)regionMonitor:(id)a3 authorizationStateDidChange:(unint64_t)a4;
- (void)regionMonitor:(id)a3 regionDidChange:(id)a4;
- (void)resetConfigurationCache;
- (void)resetConfigurationManager;
- (void)serverFetchRegionConfiguration:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)setActiveEntity:(id)a3;
- (void)setCloudServerChannel:(id)a3;
- (void)setConfigurationStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setGracePeriodConfigurationFetchTimer:(id)a3;
- (void)setMobileCountryCodeOverriden:(BOOL)a3;
- (void)setPrefRampTrialPeriodProfile:(BOOL)a3;
- (void)setPrefTestHeaderEnabled:(BOOL)a3;
- (void)setRegionMonitor:(id)a3;
- (void)setRegionRampModeOverride:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServerConfigurationFetchTimer:(id)a3;
- (void)setupGracePeriodFetchTimerWithDelay:(double)a3;
- (void)stopGracePeriodTimer;
- (void)updateRegionMonitorModeForCurrentRegion;
@end

@implementation ENConfigurationManager

- (ENConfigurationStore)configurationStore
{
  return self->_configurationStore;
}

- (ENConfigurationManager)initWithDelegate:(id)a3 activeEntity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENConfigurationManager;
  v8 = [(ENConfigurationManager *)&v14 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.exposureNotification.configManager.serialQueue", v9);
    [(ENConfigurationManager *)v8 setSerialQueue:v10];

    v11 = objc_alloc_init(ENCloudServerChannel);
    [(ENConfigurationManager *)v8 setCloudServerChannel:v11];

    v12 = objc_alloc_init(ENConfigurationStore);
    [(ENConfigurationManager *)v8 setConfigurationStore:v12];

    [(ENConfigurationManager *)v8 setDelegate:v6];
    [(ENConfigurationManager *)v8 setActiveEntity:v7];
  }

  return v8;
}

- (void)activate
{
  v3 = [(ENConfigurationManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ENConfigurationManager_activate__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __34__ENConfigurationManager_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_ENConfigurationManager <= 50
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();

  [(ENConfigurationManager *)self _scheduleRegionConfigurationRefresh];
}

- (void)dealloc
{
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  [(ENRegionMonitor *)self->_regionMonitor setDelegate:0];
  regionMonitor = self->_regionMonitor;
  self->_regionMonitor = 0;

  v4 = [(ENConfigurationManager *)self serverConfigurationFetchTimer];
  [v4 invalidate];

  [(ENConfigurationManager *)self setServerConfigurationFetchTimer:0];
  v5.receiver = self;
  v5.super_class = (Class)ENConfigurationManager;
  [(ENConfigurationManager *)&v5 dealloc];
}

- (void)_reportErrorMetricForHTTPStatus:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = WeakRetained;
  if ((unint64_t)a3 <= 0x3E7) {
    uint64_t v6 = (a3 + 10000);
  }
  else {
    uint64_t v6 = 10000;
  }
  [WeakRetained configurationManager:self errorDetected:v6];
}

- (void)serverFetchRegionConfiguration:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_t v10 = [(ENConfigurationManager *)self serialQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__ENConfigurationManager_serverFetchRegionConfiguration_userInitiated_completion___block_invoke;
  v13[3] = &unk_1E69ADF88;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __82__ENConfigurationManager_serverFetchRegionConfiguration_userInitiated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serverFetchRegionConfiguration:*(void *)(a1 + 40) userInitiated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_serverFetchRegionConfiguration:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    dispatch_queue_t v10 = "no";
    if (v6) {
      dispatch_queue_t v10 = "yes";
    }
    id v52 = v8;
    v58 = v10;
    LogPrintF_safe();
  }
  id v11 = objc_msgSend(v8, "countryCode", v52, v58);

  if (v11)
  {
    id v12 = [v8 countryCode];
    v13 = [v12 uppercaseString];

    if (CFPrefs_GetInt64())
    {
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      id v14 = [(ENConfigurationManager *)self configurationStore];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke;
      v68[3] = &unk_1E69AE278;
      v68[4] = self;
      id v69 = v9;
      [v14 allCachedServerResponseConfigurationsWithCompletion:v68];

      id v15 = v69;
LABEL_46:

      goto LABEL_47;
    }
    BOOL v60 = v6;
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      v53 = v13;
      LogPrintF_safe();
    }
    BOOL v16 = +[ENConfigurationManager iCloudServerEndpoint];
    uint64_t v64 = [v16 URLByAppendingPathComponent:@"/v2/app/config"];

    v17 = [MEMORY[0x1E4F1CA68] dictionary];
    v18 = [MEMORY[0x1E4F1C9C0] date];
    [v18 timeIntervalSince1970];
    uint64_t v20 = (uint64_t)(v19 * 1000.0);

    v63 = objc_msgSend(MEMORY[0x1E4F29020], "stringWithFormat:", @"%lld", v20);
    objc_msgSend(v17, "setObject:forKey:");
    v21 = [v13 uppercaseString];
    [v17 setObject:v21 forKey:@"x-apple-ct-region-identifier"];

    v22 = [(ENConfigurationManager *)self configurationStore];
    v23 = [v22 regionHashForRegion:v8];

    if (v23) {
      [v17 setObject:v23 forKey:@"x-apple-ct-region-hash"];
    }

    v24 = [MEMORY[0x1E4F28E70] string];
    uint64_t v25 = GestaltCopyAnswer();
    v26 = (void *)v25;
    if (v25) {
      [v24 appendFormat:@"%@/", v25];
    }
    uint64_t v27 = GestaltCopyAnswer();
    if (v27) {
      [v24 appendString:v27];
    }
    if ([v24 length]) {
      [v17 setObject:v24 forKey:@"x-apple-en-os-version"];
    }
    v61 = (void *)v27;
    v62 = v26;
    if (CFPrefs_GetInt64()) {
      [v17 setObject:@"true" forKey:@"x-apple-test-application"];
    }
    v28 = [(ENConfigurationManager *)self regionRampModeOverride];
    v29 = [v28 objectForKeyedSubscript:v8];

    if (v29)
    {
      v30 = [(ENConfigurationManager *)self regionRampModeOverride];
      v31 = [v30 objectForKeyedSubscript:v8];
      uint64_t v32 = [v31 unsignedIntegerValue];

      v33 = [(ENConfigurationManager *)self regionRampModeOverride];
      [v33 setObject:0 forKeyedSubscript:v8];

      if (!v32)
      {
LABEL_41:
        v35 = +[ENCloudNetworkRequest requestWithURL:httpMethod:headers:parameters:andBody:](ENCloudNetworkRequest, "requestWithURL:httpMethod:headers:parameters:andBody:", v64, 0, v17, MEMORY[0x1E4F1CC00], 0, v54);
        v36 = [(ENConfigurationManager *)self delegate];
        if (gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          v55 = v35;
          LogPrintF_safe();
        }
        v37 = [(ENConfigurationManager *)self cloudServerChannel];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke_3;
        v65[3] = &unk_1E69AE370;
        v65[4] = v35;
        v65[5] = v36;
        id v67 = v9;
        v65[6] = self;
        id v66 = v8;
        [v37 enqueueRequest:v35 withCompletion:v65];

        id v15 = (void *)v64;
        goto LABEL_46;
      }
    }
    else if (CFPrefs_GetInt64())
    {
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      uint64_t v32 = 1;
    }
    else
    {
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v38 = [(ENConfigurationManager *)self activeEntity];
      v39 = [v38 entity];
      v40 = [v39 region];

      if (v40)
      {
        v41 = [(ENConfigurationManager *)self activeEntity];
        v42 = [v41 entity];
        v43 = [v42 region];
        unint64_t v44 = [(ENConfigurationManager *)self readCachedRampModeForRegion:v43];

        switch(v44)
        {
          case 0uLL:
            if (gLogCategory_ENConfigurationManager > 30) {
              goto LABEL_71;
            }
            if (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()) {
              goto LABEL_57;
            }
            break;
          case 1uLL:
            if (gLogCategory_ENConfigurationManager > 30) {
              goto LABEL_71;
            }
            if (gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize()) {
              break;
            }
LABEL_57:
            v45 = [(ENConfigurationManager *)self activeEntity];
            v46 = [v45 entity];
            v54 = [v46 region];
            LogPrintF_safe();

            break;
          case 2uLL:
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              v47 = [(ENConfigurationManager *)self activeEntity];
              v48 = [v47 entity];
              v56 = [v48 region];
              LogPrintF_safe();
            }
            goto LABEL_93;
          case 3uLL:
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              v49 = [(ENConfigurationManager *)self activeEntity];
              v50 = [v49 entity];
              v57 = [v50 region];
              LogPrintF_safe();
            }
            uint64_t v32 = 3;
            goto LABEL_40;
          default:
            break;
        }
      }
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        v54 = v8;
        LogPrintF_safe();
      }
LABEL_71:
      unint64_t v51 = -[ENConfigurationManager readCachedRampModeForRegion:](self, "readCachedRampModeForRegion:", v8, v54);
      if (v51)
      {
        uint64_t v32 = v51;
        if (gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          v54 = v8;
          uint64_t v59 = v32;
          LogPrintF_safe();
        }
        if (v32 != 1)
        {
          if (gLogCategory_ENConfigurationManager <= 30
            && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            uint64_t v59 = v32;
            LogPrintF_safe();
          }
          goto LABEL_40;
        }
        if (gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          v54 = v8;
          LogPrintF_safe();
        }
      }
      if (!v60) {
        goto LABEL_41;
      }
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
LABEL_93:
      uint64_t v32 = 2;
    }
LABEL_40:
    v34 = objc_msgSend(MEMORY[0x1E4F29020], "stringWithFormat:", @"%lu", v32, v59);
    [v17 setObject:v34 forKey:@"x-apple-ramp-mode"];

    goto LABEL_41;
  }
  if (!v9) {
    goto LABEL_48;
  }
  v13 = ENErrorF();
  (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
LABEL_47:

LABEL_48:
}

void __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke_2;
  v6[3] = &unk_1E69ACF50;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = [*(id *)(a1 + 32) count];
    LogPrintF_safe();
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "count", v4))
  {
    NSErrorF();
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }

  return MEMORY[0x1F4181820]();
}

void __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    if (a2 == 200 && v10)
    {
      if ([v10 length])
      {
        id v14 = [v9 objectForKeyedSubscript:@"Content-Type"];
        int v15 = [v14 containsString:@"application/json"];

        if (v15)
        {
          if (gLogCategory_ENConfigurationManager <= 30
            && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            uint64_t v52 = [v10 length];
            LogPrintF_safe();
          }
          v26 = objc_msgSend(v9, "objectForKeyedSubscript:", @"x-apple-ct-region-identifier", v52);
          uint64_t v27 = [v9 objectForKeyedSubscript:@"x-apple-pt-server-sign1"];
          id v28 = v10;
          if (+[ENConfigurationManager verifyAppleServerResponse:v28 signatureHeader:v27])
          {
            v29 = [*(id *)(a1 + 56) countryCode];
            char v30 = [v26 isEqualToString:v29];

            if (v30)
            {
              uint64_t v31 = [v9 objectForKeyedSubscript:@"x-apple-ct-region-hash"];
              uint64_t v32 = [*(id *)(a1 + 48) configurationStore];
              uint64_t v33 = *(void *)(a1 + 56);
              uint64_t v59 = (void *)v31;
              id v60 = 0;
              LOBYTE(v31) = [v32 saveRegionHash:v31 region:v33 error:&v60];
              id v57 = v60;

              if ((v31 & 1) == 0
                && gLogCategory__ENConfigurationManager <= 30
                && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
              {
                [*(id *)(a1 + 56) countryCode];
                v55 = v53 = v59;
                LogPrintF_safe();
              }
              v41 = objc_msgSend(MEMORY[0x1E4F28D88], "JSONObjectWithData:options:error:", v28, 0, 0, v53, v55);
              v42 = +[ENLoggingPrefs sharedENLoggingPrefs];
              int v43 = [v42 isSensitiveLoggingAllowed];

              unint64_t v44 = v41;
              if (v43
                && gLogCategory_ENConfigurationManager <= 10
                && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
              {
                v54 = v41;
                LogPrintF_safe();
              }
              v45 = objc_msgSend(v41, "objectForKeyedSubscript:", @"subdivisions", v54);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v46 = [*(id *)(a1 + 48) configurationStore];
                [v46 saveCountrySubdivisionList:v45 region:*(void *)(a1 + 56) error:0];

                unint64_t v44 = v41;
              }
              v58 = v44;
              v47 = [v44 objectForKeyedSubscript:@"appConfigs"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v47 count])
              {
                uint64_t v48 = *(void *)(a1 + 64);
                v49 = v57;
                if (v48) {
                  (*(void (**)(uint64_t, void *, void))(v48 + 16))(v48, v47, 0);
                }
              }
              else
              {
                v56 = v26;
                uint64_t v50 = *(void *)(a1 + 64);
                if (v50)
                {
                  unint64_t v51 = NSErrorF();
                  (*(void (**)(uint64_t, void, void *))(v50 + 16))(v50, 0, v51);
                }
                [*(id *)(a1 + 40) configurationManager:*(void *)(a1 + 48) errorDetected:6002];
                v26 = v56;
                v49 = v57;
              }

              goto LABEL_62;
            }
            if (gLogCategory__ENConfigurationManager <= 30
              && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              [*(id *)(a1 + 56) countryCode];
              v55 = v53 = v26;
              LogPrintF_safe();
            }
            uint64_t v39 = *(void *)(a1 + 64);
            if (v39)
            {
              v53 = v26;
              v40 = NSErrorF();
              (*(void (**)(uint64_t, void, void *))(v39 + 16))(v39, 0, v40);
            }
            v36 = *(void **)(a1 + 40);
            uint64_t v37 = *(void *)(a1 + 48);
            uint64_t v38 = 6004;
          }
          else
          {
            uint64_t v34 = *(void *)(a1 + 64);
            if (v34)
            {
              v35 = NSErrorF();
              (*(void (**)(uint64_t, void, void *))(v34 + 16))(v34, 0, v35);
            }
            v36 = *(void **)(a1 + 40);
            uint64_t v37 = *(void *)(a1 + 48);
            uint64_t v38 = 6001;
          }
          objc_msgSend(v36, "configurationManager:errorDetected:", v37, v38, v53, v55);
LABEL_62:

          goto LABEL_63;
        }
      }
      goto LABEL_18;
    }
    switch(a2)
    {
      case 503:
        v22 = [v9 objectForKeyedSubscript:@"Retry-After"];
        uint64_t v23 = *(void *)(a1 + 64);
        if (v23)
        {
          uint64_t v52 = (uint64_t)v22;
          v24 = NSErrorF();
          (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
        }
        objc_msgSend(*(id *)(a1 + 48), "_reportErrorMetricForHTTPStatus:", 503, v52);
        break;
      case 404:
        uint64_t v25 = *(void *)(a1 + 64);
        if (!v25) {
          goto LABEL_63;
        }
        v22 = NSErrorF();
        (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v22);
        break;
      case 304:
        uint64_t v16 = *(void *)(a1 + 64);
        if (v16)
        {
          v17 = NSErrorF();
          (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);
        }
        v18 = *(void **)(a1 + 48);
        uint64_t v19 = 304;
        goto LABEL_21;
      default:
LABEL_18:
        uint64_t v20 = *(void *)(a1 + 64);
        if (v20)
        {
          v21 = NSErrorF();
          (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
        }
        v18 = *(void **)(a1 + 48);
        uint64_t v19 = a2;
LABEL_21:
        [v18 _reportErrorMetricForHTTPStatus:v19];
        goto LABEL_63;
    }

    goto LABEL_63;
  }
  uint64_t v12 = *(void *)(a1 + 64);
  if (v12)
  {
    uint64_t v52 = *(void *)(a1 + 32);
    v13 = NSErrorNestedF();
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  objc_msgSend(*(id *)(a1 + 40), "configurationManager:errorDetected:", *(void *)(a1 + 48), 6000, v52);
LABEL_63:
}

- (BOOL)updateRampModeForRegion:(id)a3 rampMode:(unint64_t)a4
{
  id v6 = a3;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v6)
  {
    id v7 = [(ENConfigurationManager *)self configurationStore];
    id v8 = [v7 configurationForRegion:v6];

    if (v8)
    {
      if (a4 <= 3)
      {
        [v8 setEnRampMode:a4];
        id v9 = [(ENConfigurationManager *)self configurationStore];
        id v13 = 0;
        char v10 = [v9 saveRegionConfiguration:v8 error:&v13];
        id v11 = v13;

        if ((v10 & 1) == 0
          && gLogCategory_ENConfigurationManager <= 90
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

        goto LABEL_24;
      }
      if (gLogCategory_ENConfigurationManager > 90
        || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
      {
LABEL_21:
        char v10 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    else if (gLogCategory_ENConfigurationManager > 40 {
           || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_21;
    }
    LogPrintF_safe();
    goto LABEL_21;
  }
  if (gLogCategory_ENConfigurationManager <= 90
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  char v10 = 0;
LABEL_25:

  return v10;
}

- (BOOL)regionSupportsFeatures:(id)a3 featureFlags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v6)
  {
    id v7 = [(ENConfigurationManager *)self configurationStore];
    id v8 = [v7 serverConfigurationForRegion:v6];

    if (v8)
    {
      char v9 = [v8 supportsFeatures:v4];
    }
    else
    {
      if (gLogCategory_ENConfigurationManager <= 90
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      char v9 = 0;
    }
  }
  else
  {
    if (gLogCategory_ENConfigurationManager <= 90
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)readCachedRampModeForRegion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v4)
  {
    id v5 = [(ENConfigurationManager *)self configurationStore];
    id v6 = [v5 configurationForRegion:v4];

    if (v6)
    {
      unint64_t v7 = [v6 enRampMode];
    }
    else
    {
      if (gLogCategory_ENConfigurationManager <= 90
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      unint64_t v7 = 0;
    }
  }
  else
  {
    if (gLogCategory_ENConfigurationManager <= 90
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    unint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)verifyAppleServerResponse:(id)a3 signatureHeader:(id)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  CFDataRef v5 = (const __CFData *)a3;
  id v6 = a4;
  if (IsAppleInternalBuild() && CFPrefs_GetInt64())
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    BOOL v7 = 1;
    goto LABEL_48;
  }
  BOOL v7 = 0;
  if (!v5 || !v6) {
    goto LABEL_48;
  }
  id v8 = (void *)MEMORY[0x1D9439DC0]();
  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B0]) initWithBase64EncodedString:@"BP6sTAdk49vlNzoEmFS15HX3QjglGJLaTUl1JwGVSn9nAEiZa1dPc811nQVQFKtnYVYhnZswXx63UUM8L/O9aF4=" options:0];
  if (IsAppleInternalBuild() && CFPrefs_GetInt64())
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C9B0]) initWithBase64EncodedString:@"BLZMQHP6FNq1JzrOft1byshgng28vue0mruB3/Nzx0hhKQA2++MecTBcMWJhh+juPNhjmnKGM/Mpi2WxH8/L5AA=" options:0];

    char v9 = (void *)v10;
  }
  if (gLogCategory__ENConfigurationManager <= 30
    && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v20 = [v9 length];
    LogPrintF_safe();
  }
  CFErrorRef error = 0;
  uint64_t v11 = *MEMORY[0x1E4F3B728];
  uint64_t v12 = *MEMORY[0x1E4F3B6D0];
  v22[0] = *MEMORY[0x1E4F3B720];
  v22[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F3B6F8];
  v23[0] = v11;
  v23[1] = v13;
  v22[2] = *MEMORY[0x1E4F3B710];
  v23[2] = &unk_1F2B36010;
  objc_msgSend(MEMORY[0x1E4F1C9E0], "dictionaryWithObjects:forKeys:count:", v23, v22, 3, v20);
  CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  int v15 = SecKeyCreateWithData((CFDataRef)v9, v14, &error);
  CFErrorRef v16 = error;
  if (!error)
  {
    [v6 utf8ValueSafe];
    v17 = NSDataWithHex();
    if (gLogCategory_ENConfigurationManager <= 10
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      [v17 length];
      LogPrintF_safe();
    }
    int v18 = SecKeyVerifySignature(v15, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA78], v5, (CFDataRef)v17, &error);
    BOOL v7 = v18 != 0;
    if (v18)
    {
      if (gLogCategory_ENConfigurationManager > 50
        || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_42;
      }
    }
    else if (gLogCategory__ENConfigurationManager > 90 {
           || gLogCategory__ENConfigurationManager == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_42;
    }
    LogPrintF_safe();
LABEL_42:

    goto LABEL_43;
  }
  if (gLogCategory__ENConfigurationManager > 90)
  {
    BOOL v7 = 0;
LABEL_44:
    CFRelease(v16);
    goto LABEL_45;
  }
  if (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()) {
    LogPrintF_safe();
  }
  BOOL v7 = 0;
LABEL_43:
  CFErrorRef v16 = error;
  if (error) {
    goto LABEL_44;
  }
LABEL_45:
  if (v15) {
    CFRelease(v15);
  }

LABEL_48:

  return v7;
}

+ (id)iCloudServerEndpoint
{
  uint64_t v2 = [MEMORY[0x1E4F1CB08] URLWithString:@"https://gateway.icloud.com/enservice"];
  if (CFPrefs_GetInt64() && IsAppleInternalBuild())
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v3 = [MEMORY[0x1E4F1CB08] URLWithString:@"https://gateway-ic3.icloud.com/enservice"];

    uint64_t v2 = (void *)v3;
  }

  return v2;
}

- (void)_scheduleRegionConfigurationRefresh
{
  uint64_t v3 = [(ENConfigurationManager *)self serverConfigurationFetchTimer];

  if (v3)
  {
    id v4 = [(ENConfigurationManager *)self serverConfigurationFetchTimer];
    [v4 invalidate];

    [(ENConfigurationManager *)self setServerConfigurationFetchTimer:0];
  }
  CFDataRef v5 = [(ENConfigurationManager *)self activeEntity];
  id v6 = [v5 entity];
  BOOL v7 = [v6 region];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = [(ENConfigurationManager *)self regionMonitor];
    id v35 = 0;
    uint64_t v12 = [v11 getCurrentRegionVisitWithError:&v35];
    id v10 = v35;
    id v9 = [v12 region];
  }
  if (v9)
  {
    CFPrefs_GetDouble();
    if (v13 > 0.0)
    {
      double v14 = v13;
      int v15 = [(ENConfigurationManager *)self gracePeriodConfigurationFetchTimer];

      if (!v15)
      {
        CFErrorRef v16 = [MEMORY[0x1E4F1C9C0] date];
        [v16 timeIntervalSince1970];
        if (v14 - v17 <= 0.0)
        {
          double v20 = 600.0;
        }
        else
        {
          int v18 = [MEMORY[0x1E4F1C9C0] date];
          [v18 timeIntervalSince1970];
          double v20 = v14 - v19;
        }
        [(ENConfigurationManager *)self setupGracePeriodFetchTimerWithDelay:v20];
      }
    }
    v21 = [(ENConfigurationManager *)self configurationStore];
    v22 = [v21 serverConfigurationForRegion:v9];

    if (v22)
    {
      [v22 callbackInterval];
      double v24 = v23;
    }
    else
    {
      [(ENConfigurationManager *)self _fetchServerConfigurationsForRegion:v9 userInitiated:0 completion:&__block_literal_global_5];
      double v24 = 259200.0;
    }
    double v25 = v24 + (double)arc4random_uniform(0x15180u);
    CFPrefs_GetDouble();
    double v27 = v26;
    if (IsAppleInternalBuild() && v27 > 0.0)
    {
      if (gLogCategory_ENConfigurationManager > 30)
      {
        double v25 = v27;
LABEL_28:
        id location = 0;
        objc_initWeak(&location, self);
        id v28 = [ENXPCTimer alloc];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_2;
        v32[3] = &unk_1E69AE3C0;
        objc_copyWeak(&v33, &location);
        v32[4] = self;
        v29 = [(ENXPCTimer *)v28 initWithName:@"com.apple.bluetooth.exposureNotification.fetchRegionConfiguration" delay:(unint64_t)v25 gracePeriod:1 cadence:8385 priority:v32 options:v25 block:3600.0];
        [(ENConfigurationManager *)self setServerConfigurationFetchTimer:v29];

        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);

        goto LABEL_29;
      }
      if (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize())
      {
        double v30 = v27;
        LogPrintF_safe();
      }
      double v25 = v27;
    }
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v31 = objc_msgSend(v9, "countryCode", *(void *)&v30);
      LogPrintF_safe();
    }
    goto LABEL_28;
  }
  if (gLogCategory_ENConfigurationManager <= 10
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_29:
}

void __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CFDataRef v5 = [WeakRetained serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_3;
  v6[3] = &unk_1E69ACAF0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  void v6[4] = *(void *)(a1 + 32);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
}

void __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id val = objc_loadWeakRetained((id *)(a1 + 40));
  v1 = [val activeEntity];
  uint64_t v2 = [v1 entity];
  id v3 = [v2 region];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v19 = 0;
  }
  else
  {
    id v6 = [val regionMonitor];
    id v29 = 0;
    id v7 = [v6 getCurrentRegionVisitWithError:&v29];
    id v19 = v29;
    id v5 = [v7 region];
  }
  if (v5)
  {
    id location = 0;
    objc_initWeak(&location, val);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_4;
    v26[3] = &unk_1E69AE398;
    objc_copyWeak(&v27, &location);
    v26[4] = v5;
    [val fetchServerConfigurationsForRegion:v5 userInitiated:0 withCompletion:v26];
    id v8 = [*(id *)(a1 + 32) configurationStore];
    id v9 = [v8 allCachedCountries];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          double v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          int v15 = [v5 countryCode];
          char v16 = [v14 isEqualToString:v15];

          if ((v16 & 1) == 0)
          {
            double v17 = (void *)[objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v14];
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              int v18 = v17;
              LogPrintF_safe();
            }
            objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v17, 0, &__block_literal_global_194, v18);
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v11);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else if (gLogCategory__ENConfigurationManager <= 90 {
         && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

void __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9)
  {
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    id v5 = [WeakRetained configurationStore];
    id v6 = [v5 serverConfigurationForRegion:*(void *)(a1 + 32)];

    if (v6)
    {
      if (gLogCategory__ENConfigurationManager <= 30
        && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        LogPrintF_safe();
        objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v6, 1, v8);
      }
      else
      {
        objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v6, 1, v7);
      }
    }
    else if (gLogCategory__ENConfigurationManager <= 30 {
           && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }
}

- (void)resetConfigurationCache
{
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v3 = [(ENConfigurationManager *)self configurationStore];
  [v3 resetStore];

  [(ENConfigurationManager *)self resetConfigurationManager];
}

- (void)resetConfigurationManager
{
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v3 = [(ENConfigurationManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ENConfigurationManager_resetConfigurationManager__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__ENConfigurationManager_resetConfigurationManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serverConfigurationFetchTimer];
  [v2 invalidate];

  [*(id *)(a1 + 32) setServerConfigurationFetchTimer:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 stopGracePeriodTimer];
}

+ (void)_printServerConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if (gLogCategory_ENConfigurationManager <= 30)
        {
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize())
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v9, v10, v11);
            v11 = uint64_t v10 = v9;
            LogPrintF_safe();
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (BOOL)isInGracePeriodTransition
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(ENConfigurationManager *)self serialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ENConfigurationManager_isInGracePeriodTransition__block_invoke;
  v5[3] = &unk_1E69ADE30;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __51__ENConfigurationManager_isInGracePeriodTransition__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) gracePeriodConfigurationFetchTimer];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (void)setupGracePeriodFetchTimerWithDelay:(double)a3
{
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v5 = [(ENConfigurationManager *)self gracePeriodConfigurationFetchTimer];

  if (v5)
  {
    uint64_t v6 = [(ENConfigurationManager *)self gracePeriodConfigurationFetchTimer];
    [v6 invalidate];

    [(ENConfigurationManager *)self setGracePeriodConfigurationFetchTimer:0];
  }
  uint64_t v7 = [(ENConfigurationManager *)self serialQueue];
  uint64_t v8 = [(ENConfigurationManager *)self regionMonitor];
  id location = 0;
  objc_initWeak(&location, self);
  char v9 = [ENXPCTimer alloc];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __62__ENConfigurationManager_setupGracePeriodFetchTimerWithDelay___block_invoke;
  char v16 = &unk_1E69AE410;
  id v10 = v7;
  id v17 = v10;
  objc_copyWeak(&v19, &location);
  id v11 = v8;
  id v18 = v11;
  long long v12 = [(ENXPCTimer *)v9 initWithName:@"com.apple.bluetooth.exposureNotification.gracePeriodConfigurationFetchTimer" delay:1 gracePeriod:193 priority:&v13 options:a3 block:30.0];
  -[ENConfigurationManager setGracePeriodConfigurationFetchTimer:](self, "setGracePeriodConfigurationFetchTimer:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __62__ENConfigurationManager_setupGracePeriodFetchTimerWithDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ENConfigurationManager_setupGracePeriodFetchTimerWithDelay___block_invoke_2;
  block[3] = &unk_1E69AE3E8;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __62__ENConfigurationManager_setupGracePeriodFetchTimerWithDelay___block_invoke_2(id *a1)
{
  [a1[4] invalidate];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained stopGracePeriodTimer];
  CFDataGetTypeID();
  id v3 = (void *)CFPrefs_CopyTypedValue();
  if ([v3 length])
  {
    id v20 = 0;
    id v4 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v20];
    id v5 = v20;
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      id v18 = v5;
      LogPrintF_safe();
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v6 = objc_msgSend(v4, "entity", v18);
  id v7 = [v6 region];

  id v8 = [a1[5] getCurrentRegionVisitWithError:0];
  id v9 = [v8 region];

  id v10 = v7;
  id v11 = v9;
  long long v12 = v11;
  if (v10 == v11)
  {
  }
  else
  {
    if ((v10 == 0) == (v11 != 0))
    {

LABEL_17:
      uint64_t v14 = [WeakRetained configurationStore];
      long long v15 = [v14 serverConfigurationForRegion:v12];

      if (v15)
      {
        char v16 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v17 = [v16 isSensitiveLoggingAllowed];

        if (v17
          && gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
          objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v15, 1, v15);
        }
        else
        {
          objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v15, 1, v19);
        }
      }
      else if (gLogCategory_ENConfigurationManager <= 30 {
             && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }

      goto LABEL_32;
    }
    char v13 = [v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_17;
    }
  }
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_32:
}

- (void)stopGracePeriodTimer
{
  id v3 = [(ENConfigurationManager *)self gracePeriodConfigurationFetchTimer];

  if (v3)
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v4 = [(ENConfigurationManager *)self gracePeriodConfigurationFetchTimer];
    [v4 invalidate];

    [(ENConfigurationManager *)self setGracePeriodConfigurationFetchTimer:0];
  }

  CFPrefs_RemoveValue();
}

- (void)_processServerConfiguration:(id)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v36 = a3;
  uint64_t v6 = [(ENConfigurationManager *)self activeEntity];
  id v7 = [v6 entity];
  id v8 = [v7 region];

  if (v8)
  {
    id v9 = [(ENConfigurationManager *)self configurationStore];
    id v10 = [v9 serverConfigurationForRegion:v8];
  }
  else
  {
    id v10 = 0;
  }

  [(ENConfigurationManager *)self updateRegionMonitorModeForCurrentRegion];
  id v11 = +[ENLoggingPrefs sharedENLoggingPrefs];
  char v12 = [v11 isSensitiveLoggingAllowed];

  if ((v12 & 1) != 0
    && gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    char v13 = [v36 region];
    BOOL v32 = v4;
    uint64_t v34 = [v36 hasSubdivisions];
    id v28 = v13;
    LogPrintF_safe();
  }
  if (objc_msgSend(v10, "enEnabled", v28, v32, v34))
  {
    if (v4)
    {
LABEL_19:
      id v18 = [(ENConfigurationManager *)self configurationStore];
      uint64_t v19 = [v36 region];
      id v20 = [v18 configurationForRegion:v19];

      v21 = [(ENConfigurationManager *)self delegate];
      [v21 configurationManager:self exposureNotificationRegionConfigurationChanged:v20];

      goto LABEL_31;
    }
  }
  else if (([v36 enEnabled] & 1) != 0 || v4)
  {
    goto LABEL_19;
  }
  uint64_t v14 = [(ENConfigurationManager *)self gracePeriodConfigurationFetchTimer];

  long long v15 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v16 = [v15 isSensitiveLoggingAllowed];

  if (v14)
  {
    if (v16
      && gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v31 = [(ENConfigurationManager *)self gracePeriodConfigurationFetchTimer];
      LogPrintF_safe();
    }
  }
  else
  {
    if (v16
      && gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      int v17 = [v36 region];
      uint64_t v33 = [v36 enVersion];
      uint64_t v35 = [v36 enEnabled];
      id v29 = v17;
      LogPrintF_safe();
    }
    if (objc_msgSend(v36, "enEnabled", v29, v33, v35)) {
      [v36 regionTransitionGracePeriod];
    }
    else {
      [v36 regionDisabledTransitionGracePeriod];
    }
    double v23 = v22;
    if (IsAppleInternalBuild())
    {
      CFPrefs_GetDouble();
      if (v24 > 0.0)
      {
        CFPrefs_GetDouble();
        double v23 = v25;
        if (gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          double v30 = v23;
          LogPrintF_safe();
        }
      }
    }
    double v26 = objc_msgSend(MEMORY[0x1E4F1C9C0], "date", *(void *)&v30);
    id v27 = [v26 dateByAddingTimeInterval:v23];
    [v27 timeIntervalSince1970];
    CFPrefs_SetDouble();

    [(ENConfigurationManager *)self setupGracePeriodFetchTimerWithDelay:v23];
  }
LABEL_31:
}

- (void)refreshServerConfigurationsUponProfileChange
{
  BOOL v4 = [(ENConfigurationManager *)self serialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__ENConfigurationManager_refreshServerConfigurationsUponProfileChange__block_invoke;
  v5[3] = &unk_1E69ACC88;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __70__ENConfigurationManager_refreshServerConfigurationsUponProfileChange__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) activeEntity];
  uint64_t v2 = [v1 entity];
  id v3 = [v2 region];

  if (v3)
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v3, 0, &__block_literal_global_224, v3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v3, 0, &__block_literal_global_224, v23);
    }
  }
  BOOL v4 = [*(id *)(a1 + 32) regionMonitor];
  id v36 = 0;
  id v5 = [v4 getCurrentRegionVisitWithError:&v36];
  id v27 = v36;
  uint64_t v6 = [v5 region];

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    double v25 = v6;
    double v23 = v26 = v27;
    LogPrintF_safe();
  }
  if (v6 && ([v6 isEqual:v3] & 1) == 0)
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      double v23 = v6;
      LogPrintF_safe();
    }
    id v7 = objc_msgSend(v6, "countryCode", v23, v25, v26);
    id v8 = [v3 countryCode];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      [*(id *)(a1 + 32) updateRegionMonitorModeForCurrentRegion];
      id v10 = [*(id *)(a1 + 32) configurationStore];
      id v11 = [v10 serverConfigurationForRegion:v6];

      if (v11) {
        [*(id *)(a1 + 32) _processServerConfiguration:v11 forceUpdate:1];
      }
    }
    else
    {
      id location = 0;
      objc_initWeak(&location, *(id *)(a1 + 32));
      char v12 = *(void **)(a1 + 32);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __70__ENConfigurationManager_refreshServerConfigurationsUponProfileChange__block_invoke_3;
      v33[3] = &unk_1E69AE398;
      objc_copyWeak(&v34, &location);
      v33[4] = v6;
      [v12 fetchServerConfigurationsForRegion:v6 userInitiated:0 withCompletion:v33];
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
  }
  char v13 = objc_msgSend(*(id *)(a1 + 32), "configurationStore", v23);
  uint64_t v14 = [v13 allCachedCountries];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v20 = [v3 countryCode];
        if (([v19 isEqualToString:v20] & 1) == 0)
        {
          v21 = [v6 countryCode];
          char v22 = [v19 isEqualToString:v21];

          if (v22) {
            continue;
          }
          id v20 = (void *)[objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v19];
          if (gLogCategory_ENConfigurationManager <= 30
            && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v20, 0, &__block_literal_global_230, v20);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v20, 0, &__block_literal_global_230, v24);
          }
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v16);
  }
}

void __70__ENConfigurationManager_refreshServerConfigurationsUponProfileChange__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateRegionMonitorModeForCurrentRegion];
  if (v7)
  {
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    id v5 = [WeakRetained configurationStore];
    uint64_t v6 = [v5 serverConfigurationForRegion:*(void *)(a1 + 32)];

    if (v6) {
      [WeakRetained _processServerConfiguration:v6 forceUpdate:1];
    }
  }
}

- (void)fetchServerConfigurationsForRegion:(id)a3 userInitiated:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ENConfigurationManager *)self serialQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__ENConfigurationManager_fetchServerConfigurationsForRegion_userInitiated_withCompletion___block_invoke;
  v13[3] = &unk_1E69ADF88;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __90__ENConfigurationManager_fetchServerConfigurationsForRegion_userInitiated_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchServerConfigurationsForRegion:*(void *)(a1 + 40) userInitiated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_fetchServerConfigurationsForRegion:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__ENConfigurationManager__fetchServerConfigurationsForRegion_userInitiated_completion___block_invoke;
  v12[3] = &unk_1E69AD270;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENConfigurationManager *)self _serverFetchRegionConfiguration:v11 userInitiated:v6 completion:v12];
}

void __87__ENConfigurationManager__fetchServerConfigurationsForRegion_userInitiated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__ENConfigurationManager__fetchServerConfigurationsForRegion_userInitiated_completion___block_invoke_2;
  block[3] = &unk_1E69AE438;
  id v8 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  id v15 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __87__ENConfigurationManager__fetchServerConfigurationsForRegion_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveAndRemoveStaleConfigurations:*(void *)(a1 + 40) region:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_saveAndRemoveStaleConfigurations:(id)a3 region:(id)a4 error:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v50 = a4;
  id v49 = a5;
  id val = self;
  uint64_t v8 = [(ENConfigurationManager *)self delegate];
  uint64_t v48 = (void *)v8;
  if (v49)
  {
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      double v43 = [v50 regionCode];
      uint64_t v44 = (uint64_t)v49;
      LogPrintF_safe();
    }
    id v11 = [(ENConfigurationManager *)self configurationStore];
    id v12 = [v11 configurationForRegion:v50];
    if (v12)
    {
      id v13 = v49;
      id v14 = [v13 domain];
      if ([v14 isEqualToString:@"ENConfigurationManagerErrorDomain"])
      {
        uint64_t v15 = [v13 code];

        if (v15 == 5)
        {
          BOOL v16 = [(ENConfigurationManager *)val configurationStore];
          id v65 = 0;
          int v17 = [v16 removeConfigurationsForRegion:v50 includingSubdivisions:1 error:&v65];
          id v18 = v65;

          if (v17)
          {
            [v48 configurationManager:val exposureNotificationRegionConfigurationRemovedForRegion:v50];
          }
          else if (gLogCategory__ENConfigurationManager <= 90 {
                 && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }
        }
        goto LABEL_118;
      }
    }
    goto LABEL_118;
  }
  if (gLogCategory__ENConfigurationManager <= 30)
  {
    if (gLogCategory__ENConfigurationManager != -1 || (uint64_t v8 = _LogCategory_Initialize(), v8))
    {
      uint64_t v10 = [v47 count];
      [v50 regionCode];
      uint64_t v44 = v43 = *(double *)&v10;
      LogPrintF_safe();
    }
  }
  context = (void *)MEMORY[0x1D9439DC0](v8, v9);
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v19 = [(ENConfigurationManager *)self configurationStore];
  id v20 = [v50 countryCode];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke;
  v59[3] = &unk_1E69AE488;
  objc_copyWeak(&v63, &location);
  id v21 = v47;
  id v60 = v21;
  id v22 = v50;
  id v61 = v22;
  v62 = v48;
  [v19 enumerateCachedRegionServerConfigurationsWithCountryCode:v20 handler:v59];

  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke_3;
  v58[3] = &unk_1E69AE4B0;
  v58[4] = val;
  v58[5] = v48;
  uint64_t v52 = (void (**)(void, void))MEMORY[0x1D9439FF0](v58);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v21;
  uint64_t v23 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v23)
  {
    char v24 = 0;
    uint64_t v25 = *(void *)v55;
    while (1)
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(void **)(*((void *)&v54 + 1) + 8 * v26);
        id v28 = (void *)[objc_alloc(MEMORY[0x1E4F257C0]) initWithServerResponseDictionary:v27];
        if (v28)
        {
          if (gLogCategory_ENConfigurationManager <= 30
            && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v28, "region", *(void *)&v43, v44, v45);
            double v43 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            LogPrintF_safe();
          }
          if (+[ENConfigurationManager isRampModeEnabledFromServerResponse:](ENConfigurationManager, "isRampModeEnabledFromServerResponse:", v27, *(void *)&v43))
          {
            long long v29 = [v28 region];
            int v30 = [v29 isEqual:v22];

            if (v30)
            {
              unint64_t v31 = +[ENConfigurationManager rampModeFromServerResponse:v27];
              if (gLogCategory_ENConfigurationManager <= 30
                && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
              {
                double v43 = *(double *)&v22;
                uint64_t v44 = v31;
                LogPrintF_safe();
              }
              switch(v31)
              {
                case 1uLL:
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    double v43 = *(double *)&v22;
                    uint64_t v44 = 1;
                    LogPrintF_safe();
                  }
                  ((void (**)(void, void *))v52)[2](v52, v27);
                  uint64_t v40 = [(ENConfigurationManager *)val readCachedRampModeForRegion:v22];
                  if (v40 == 1
                    || gLogCategory_ENConfigurationManager > 90
                    || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
                  {
                    goto LABEL_69;
                  }
                  break;
                case 2uLL:
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    double v43 = *(double *)&v22;
                    uint64_t v44 = 2;
                    LogPrintF_safe();
                  }
                  ((void (**)(void, void *))v52)[2](v52, v27);
                  uint64_t v40 = [(ENConfigurationManager *)val readCachedRampModeForRegion:v22];
                  if (v40 == 2
                    || gLogCategory_ENConfigurationManager > 90
                    || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
                  {
                    goto LABEL_69;
                  }
                  break;
                case 3uLL:
                  uint64_t v35 = [(ENConfigurationManager *)val configurationStore];
                  id v36 = [v28 region];
                  uint64_t v37 = [v35 serverConfigurationForRegion:v36];

                  if (v37)
                  {
                    if (gLogCategory_ENConfigurationManager > 30
                      || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
                    {
                      goto LABEL_88;
                    }
LABEL_57:
                    double v43 = *(double *)&v22;
                    LogPrintF_safe();
                    goto LABEL_88;
                  }
                  +[ENConfigurationManager randomSelectPercentagePerDayFromServerResponse:v27];
                  double v39 = v38;
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    uint64_t v44 = *(void *)&v39;
                    double v43 = *(double *)&v22;
                    LogPrintF_safe();
                  }
                  double v41 = (double)arc4random() * 2.32830644e-10;
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    double v43 = v41;
                    LogPrintF_safe();
                  }
                  if (v41 >= v39) {
                    goto LABEL_69;
                  }
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    goto LABEL_57;
                  }
LABEL_88:
                  ((void (**)(void, void *))v52)[2](v52, v27);
                  [(ENConfigurationManager *)val updateRampModeForRegion:v22 rampMode:3];
LABEL_69:
                  char v24 = 1;
                  goto LABEL_70;
                default:
                  if (gLogCategory_ENConfigurationManager <= 90
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    double v43 = *(double *)&v22;
                    uint64_t v44 = v31;
                    LogPrintF_safe();
                  }
                  goto LABEL_69;
              }
              double v43 = *(double *)&v40;
              LogPrintF_safe();
              goto LABEL_69;
            }
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              long long v32 = [v28 region];
              uint64_t v44 = +[ENConfigurationManager rampModeFromServerResponse:v27];
              id v45 = v22;
              double v43 = *(double *)&v32;
              LogPrintF_safe();
            }
          }
          else
          {
            ((void (**)(void, void *))v52)[2](v52, v27);
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              double v43 = [v28 region];
              LogPrintF_safe();
            }
            uint64_t v33 = objc_msgSend(v28, "region", *(void *)&v43);
            int v34 = [v33 isEqual:v22];

            if (v34)
            {
              if (gLogCategory_ENConfigurationManager <= 30
                && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
                -[ENConfigurationManager updateRampModeForRegion:rampMode:](val, "updateRampModeForRegion:rampMode:", v22, 0, v22);
              }
              else
              {
                -[ENConfigurationManager updateRampModeForRegion:rampMode:](val, "updateRampModeForRegion:rampMode:", v22, 0, *(void *)&v43);
              }
              goto LABEL_69;
            }
          }
        }
        else if (gLogCategory_ENConfigurationManager <= 30 {
               && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        }
        {
          double v43 = *(double *)&v27;
          LogPrintF_safe();
        }
LABEL_70:

        ++v26;
      }
      while (v23 != v26);
      uint64_t v42 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
      uint64_t v23 = v42;
      if (!v42)
      {

        if (v24) {
          goto LABEL_115;
        }
        goto LABEL_108;
      }
    }
  }

LABEL_108:
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_115:

  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);
LABEL_118:
}

void __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  id v5 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke_2;
  v23[3] = &unk_1E69AE460;
  id v6 = v3;
  id v24 = v6;
  uint64_t v25 = &v26;
  [v5 enumerateObjectsUsingBlock:v23];
  if (*((unsigned char *)v27 + 24))
  {
    id v7 = [v6 region];
    int v8 = [v7 isCountryCodeEqualToRegion:*(void *)(a1 + 40)];

    if (v8)
    {
      uint64_t v9 = [WeakRetained configurationStore];
      uint64_t v10 = [v6 region];
      id v22 = 0;
      int v11 = [v9 removeConfigurationsForRegion:v10 includingSubdivisions:0 error:&v22];
      id v12 = v22;

      if (v11)
      {
        if (gLogCategory__ENConfigurationManager <= 30
          && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          id v20 = [v6 region];
          uint64_t v21 = *(void *)(a1 + 40);
          LogPrintF_safe();
        }
        id v13 = objc_msgSend(WeakRetained, "activeEntity", v20, v21);
        id v14 = [v13 entity];
        uint64_t v15 = [v14 region];
        BOOL v16 = [v6 region];
        int v17 = [v15 isEqual:v16];

        if (v17)
        {
          id v18 = *(void **)(a1 + 48);
          uint64_t v19 = [v6 region];
          [v18 configurationManager:WeakRetained exposureNotificationRegionConfigurationRemovedForRegion:v19];
        }
      }
      else if (gLogCategory__ENConfigurationManager <= 90 {
             && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }

  _Block_object_dispose(&v26, 8);
}

void __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (objc_class *)MEMORY[0x1E4F257C0];
  id v7 = a2;
  id v11 = (id)[[v6 alloc] initWithServerResponseDictionary:v7];

  int v8 = [*(id *)(a1 + 32) region];
  uint64_t v9 = [v11 region];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) configurationStore];
  id v10 = 0;
  int v5 = [v4 saveServerConfigurationResponse:v3 error:&v10];
  id v6 = v10;

  if (v5)
  {
    +[ENConfigurationManager _printServerConfiguration:v3];
  }
  else if (gLogCategory__ENConfigurationManager <= 90 {
         && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
  }
  {
    int v8 = [v3 allKeys];
    LogPrintF_safe();

    objc_msgSend(*(id *)(a1 + 40), "configurationManager:errorDetected:", *(void *)(a1 + 32), 6003, v8, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configurationManager:errorDetected:", *(void *)(a1 + 32), 6003, v7, v9);
  }
}

- (void)overrideRampModeForRegion:(id)a3 rampMode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ENConfigurationManager *)self regionRampModeOverride];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
    [(ENConfigurationManager *)self setRegionRampModeOverride:v8];
  }
  id v10 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInteger:a4];
  uint64_t v9 = [(ENConfigurationManager *)self regionRampModeOverride];
  [v9 setObject:v10 forKeyedSubscript:v6];
}

+ (BOOL)isRampModeEnabledFromServerResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFDictionaryGetTypeID();
    BOOL v4 = CFDictionaryGetTypedValue();
    if (CFDictionaryGetInt64Ranged() > 1)
    {
      BOOL v5 = CFDictionaryGetInt64() != 0;
    }
    else
    {
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)serverResponse:(id)a3 isOnRampMode:(unint64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && +[ENConfigurationManager isRampModeEnabledFromServerResponse:](ENConfigurationManager, "isRampModeEnabledFromServerResponse:", v5)&& +[ENConfigurationManager rampModeFromServerResponse:v5] == a4;

  return v6;
}

+ (unint64_t)rampModeFromServerResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFDictionaryGetTypeID();
    BOOL v4 = CFDictionaryGetTypedValue();
    unint64_t Int64 = CFDictionaryGetInt64();
  }
  else
  {
    unint64_t Int64 = 0;
  }

  return Int64;
}

+ (double)randomSelectPercentagePerDayFromServerResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  double v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[ENConfigurationManager serverResponse:v3 isOnRampMode:3])
  {
    CFDictionaryGetTypeID();
    id v5 = CFDictionaryGetTypedValue();
    CFDictionaryGetDouble();
    double v4 = v6 / 100.0;
  }
  return v4;
}

- (void)setActiveEntity:(id)a3
{
  id v4 = a3;
  id v5 = [(ENConfigurationManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ENConfigurationManager_setActiveEntity___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __42__ENConfigurationManager_setActiveEntity___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isEqual:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    id v3 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v4 = [v3 isSensitiveLoggingAllowed];

    if (v4
      && gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
    [*(id *)(a1 + 32) _scheduleRegionConfigurationRefresh];
    id v5 = *(void **)(a1 + 32);
    return [v5 stopGracePeriodTimer];
  }
  return result;
}

- (void)updateRegionMonitorModeForCurrentRegion
{
  int v4 = [(ENConfigurationManager *)self regionMonitor];
  id v16 = 0;
  id v5 = [v4 getCurrentRegionVisitWithError:&v16];
  id v6 = v16;
  uint64_t v7 = [v5 region];

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(a2);
    id v14 = v7;
    v13 = id v15 = v6;
    LogPrintF_safe();
  }
  if (v7)
  {
    id v8 = [(ENConfigurationManager *)self configurationStore];
    int v9 = [v8 regionSupportsSubdivisions:v7];

    id v10 = [(ENConfigurationManager *)self regionMonitor];
    id v11 = v10;
    if (v9) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 2;
    }
    objc_msgSend(v10, "updateRegionMonitorMonitoringMode:", v12, v13, v14, v15);
  }
}

- (void)prefsChanged
{
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  BOOL v4 = Int64 != 0;
  if (self->_prefTestHeaderEnabled != v4)
  {
    if (gLogCategory_ENConfigurationManager <= 30)
    {
      uint64_t v5 = Int64;
      if (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize())
      {
        id v6 = "yes";
        if (v5) {
          uint64_t v7 = "no";
        }
        else {
          uint64_t v7 = "yes";
        }
        if (!v5) {
          id v6 = "no";
        }
        int v9 = v7;
        id v10 = v6;
        LogPrintF_safe();
      }
    }
    self->_prefTestHeaderEnabled = v4;
    [(ENConfigurationManager *)self refreshServerConfigurationsUponProfileChange];
  }
  BOOL v8 = CFPrefs_GetInt64() != 0;
  if (self->_prefRampTrialPeriodProfile != v8)
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_prefRampTrialPeriodProfile = v8;
    [(ENConfigurationManager *)self refreshServerConfigurationsUponProfileChange];
  }
}

+ (id)staticRegionForBundleID:(id)a3
{
  id v3 = a3;
  BOOL v4 = ENDaemonBundle();
  uint64_t v5 = [v4 URLForResource:@"RegionBundleID" withExtension:@".plist"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1C9E0] dictionaryWithContentsOfURL:v5];
    uint64_t v7 = [v6 objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)setRegionMonitor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ENConfigurationManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ENConfigurationManager_setRegionMonitor___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __43__ENConfigurationManager_setRegionMonitor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id *)(*(void *)(a1 + 40) + 40);
  if (v2)
  {
    objc_storeStrong(v3, v2);
    id v4 = *(void **)(*(void *)(a1 + 40) + 40);
    objc_msgSend(v4, "setDelegate:");
  }
  else
  {
    [*v3 setDelegate:0];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

- (void)regionMonitor:(id)a3 regionDidChange:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ENConfigurationManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ENConfigurationManager_regionMonitor_regionDidChange___block_invoke;
  block[3] = &unk_1E69AD018;
  id v10 = v6;
  id v11 = self;
  SEL v12 = a2;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __56__ENConfigurationManager_regionMonitor_regionDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v3 = v1;
    id v4 = [*(id *)(a1 + 40) configurationStore];
    uint64_t v5 = [v4 serverConfigurationForRegion:v3];

    id v6 = [*(id *)(a1 + 40) configurationStore];
    uint64_t v7 = [v6 subdivisionListForRegion:v3];
    uint64_t v8 = [v7 count];

    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      int v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v10 = [*(id *)(a1 + 40) activeEntity];
      id v11 = (void *)v10;
      SEL v12 = "yes";
      if (v5) {
        id v13 = "yes";
      }
      else {
        id v13 = "no";
      }
      if (!v8) {
        SEL v12 = "no";
      }
      uint64_t v26 = v13;
      id v27 = v12;
      id v24 = v3;
      uint64_t v25 = v10;
      uint64_t v23 = v9;
      LogPrintF_safe();
    }
    id v14 = objc_msgSend(*(id *)(a1 + 40), "activeEntity", v23, v24, v25, v26, v27);
    id v15 = [v14 entity];
    id v16 = [v15 region];
    int v17 = [v16 isEqual:v3];

    if (v17) {
      [*(id *)(a1 + 40) stopGracePeriodTimer];
    }
    id v18 = [*(id *)(a1 + 40) serverConfigurationFetchTimer];

    if (v18)
    {
      if (v5)
      {
LABEL_15:
        uint64_t v19 = *(void **)(a1 + 40);
        id v20 = [v19 activeEntity];
        [v19 _processServerConfiguration:v5 forceUpdate:v20 == 0];

LABEL_20:
        id v22 = [*(id *)(a1 + 40) delegate];
        [v22 configurationManager:*(void *)(a1 + 40) didResolveCurrentRegion:1];

        return;
      }
    }
    else
    {
      [*(id *)(a1 + 40) _scheduleRegionConfigurationRefresh];
      if (v5) {
        goto LABEL_15;
      }
    }
    if (v8)
    {
      [*(id *)(a1 + 40) updateRegionMonitorModeForCurrentRegion];
    }
    else
    {
      id location = 0;
      objc_initWeak(&location, *(id *)(a1 + 40));
      uint64_t v21 = *(void **)(a1 + 40);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __56__ENConfigurationManager_regionMonitor_regionDidChange___block_invoke_2;
      v28[3] = &unk_1E69AE398;
      objc_copyWeak(&v30, &location);
      id v29 = v3;
      [v21 fetchServerConfigurationsForRegion:v29 userInitiated:0 withCompletion:v28];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    goto LABEL_20;
  }
  if (gLogCategory__ENConfigurationManager <= 90
    && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

void __56__ENConfigurationManager_regionMonitor_regionDidChange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateRegionMonitorModeForCurrentRegion];
  if (v8)
  {
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    uint64_t v5 = [WeakRetained configurationStore];
    id v6 = [v5 serverConfigurationForRegion:*(void *)(a1 + 32)];

    if (v6)
    {
      uint64_t v7 = [WeakRetained activeEntity];
      [WeakRetained _processServerConfiguration:v6 forceUpdate:v7 == 0];
    }
  }
}

- (void)regionMonitor:(id)a3 authorizationStateDidChange:(unint64_t)a4
{
  id v6 = [(ENConfigurationManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ENConfigurationManager_regionMonitor_authorizationStateDidChange___block_invoke;
  v7[3] = &unk_1E69ACC88;
  void v7[4] = self;
  void v7[5] = a4;
  dispatch_async(v6, v7);
}

void __68__ENConfigurationManager_regionMonitor_authorizationStateDidChange___block_invoke(uint64_t a1)
{
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = +[ENRegionMonitor regionMonitorAuthorizationStateToString:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) activeEntity];
    uint64_t v10 = v9 = v2;
    LogPrintF_safe();
  }
  objc_msgSend(*(id *)(a1 + 32), "activeEntity", v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if ([v11 activeStatus] == 1)
  {
    uint64_t v3 = *(void *)(a1 + 40);

    if (v3 == 1)
    {
      id v4 = [*(id *)(a1 + 32) activeEntity];
      uint64_t v5 = [v4 entity];
      id v6 = [v5 region];

      if (v6)
      {
        uint64_t v7 = [*(id *)(a1 + 32) delegate];
        [v7 configurationManager:*(void *)(a1 + 32) exposureNotificationRegionConfigurationRemovedForRegion:v6];
      }
      id v8 = *(void **)(a1 + 32);
      [v8 stopGracePeriodTimer];
    }
  }
  else
  {
  }
}

- (ENConfigurationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENConfigurationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setConfigurationStore:(id)a3
{
}

- (ENActiveEntity)activeEntity
{
  return self->_activeEntity;
}

- (ENRegionMonitor)regionMonitor
{
  return self->_regionMonitor;
}

- (BOOL)mobileCountryCodeOverriden
{
  return self->_mobileCountryCodeOverriden;
}

- (void)setMobileCountryCodeOverriden:(BOOL)a3
{
  self->_mobileCountryCodeOverriden = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (ENXPCTimer)serverConfigurationFetchTimer
{
  return self->_serverConfigurationFetchTimer;
}

- (void)setServerConfigurationFetchTimer:(id)a3
{
}

- (ENXPCTimer)gracePeriodConfigurationFetchTimer
{
  return self->_gracePeriodConfigurationFetchTimer;
}

- (void)setGracePeriodConfigurationFetchTimer:(id)a3
{
}

- (ENCloudServerChannel)cloudServerChannel
{
  return self->_cloudServerChannel;
}

- (void)setCloudServerChannel:(id)a3
{
}

- (NSMutableDictionary)regionRampModeOverride
{
  return self->_regionRampModeOverride;
}

- (void)setRegionRampModeOverride:(id)a3
{
}

- (BOOL)prefTestHeaderEnabled
{
  return self->_prefTestHeaderEnabled;
}

- (void)setPrefTestHeaderEnabled:(BOOL)a3
{
  self->_prefTestHeaderEnabled = a3;
}

- (BOOL)prefRampTrialPeriodProfile
{
  return self->_prefRampTrialPeriodProfile;
}

- (void)setPrefRampTrialPeriodProfile:(BOOL)a3
{
  self->_prefRampTrialPeriodProfile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionRampModeOverride, 0);
  objc_storeStrong((id *)&self->_cloudServerChannel, 0);
  objc_storeStrong((id *)&self->_gracePeriodConfigurationFetchTimer, 0);
  objc_storeStrong((id *)&self->_serverConfigurationFetchTimer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_regionMonitor, 0);
  objc_storeStrong((id *)&self->_activeEntity, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end