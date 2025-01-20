@interface DRSService
+ (BOOL)serviceIsEnabled;
+ (BOOL)shouldRunBackstopUpload:(id)a3 currentDate:(id)a4 errorOut:(id *)a5;
+ (BOOL)updateUploadSessionDateFromContainer:(id)a3 toDate:(id)a4 errorOut:(id *)a5;
+ (double)backstopInterval;
+ (id)_currentUploadSession_ON_MOC_QUEUE:(id)a3 errorOut:(id *)a4;
+ (id)carrierConfigurationDirectory;
+ (id)configurationDirectory;
+ (id)customerConfigurationDirectory;
+ (id)databaseDirectory;
+ (id)deviceTeamConfigurationDirectory;
+ (id)fileDirectory;
+ (id)internalConfigurationDirectory;
+ (id)previousUploadSessionDateFromContainer:(id)a3 errorOut:(id *)a4;
+ (id)seedConfigurationDirectory;
+ (id)sharedInstance;
+ (unint64_t)uploadSessionUploadCapBytes;
- (BOOL)_connectionHasEntitlement:(id)a3;
- (BOOL)_enableDataGatheringQueryPassesRandomRejection;
- (BOOL)_persistEnableLogGatheringResult:(id)a3 workingContext:(id)a4;
- (BOOL)_saveDampeningManagerErrorOut:(id *)a3;
- (BOOL)_syncConfigurationToDisk:(id)a3;
- (BOOL)activateService;
- (BOOL)clearUploadSessionDate:(id *)a3;
- (BOOL)isEnabled;
- (BOOL)shouldRunBackstopUpload:(id *)a3;
- (BOOL)updateUploadSessionDate:(id *)a3;
- (DRSCKConfig)ckConfig;
- (DRSCKConfigStore)ckConfigStore;
- (DRSCloudKitHelper)ckHelper;
- (DRSDampeningManager)dampeningManager;
- (DRSService)init;
- (DRSTaskingManager)taskingManager;
- (NSMutableDictionary)configDict;
- (NSMutableDictionary)connectionToState;
- (NSNumber)ignoreAutomatedDeviceGroup;
- (NSPersistentContainer)serviceContainer;
- (OS_dispatch_queue)cloudKitQueue;
- (OS_dispatch_queue)configurationSyncQueue;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)postReceiptWorkQueue;
- (OS_dispatch_queue)uploadRequestLookupQueue;
- (OS_dispatch_semaphore)serviceDeactivatedSem;
- (OS_xpc_object)serviceConnection;
- (double)_resolvedEnableDataGatheringQueryAcceptanceRate;
- (id)_cachedMatchingQuery:(id)a3 workingContext:(id)a4;
- (id)_permissiveXPCActivitCriteriaDict:(unsigned int)a3;
- (id)_updateCKConfig:(id)a3;
- (unint64_t)_remainingMonthlyUploadQuotaBytesWithContext:(id)a3;
- (unint64_t)_remainingSessionUploadQuotaBytesWithContext:(id)a3;
- (unint64_t)maxSingleSessionUploadSizeInBytes;
- (unint64_t)monthlyUploadQuotaBytes;
- (unsigned)_randomDelaySecWithCap:(unsigned int)a3;
- (unsigned)state;
- (void)_addCKConfigSettingsToReplyMessage:(id)a3;
- (void)_addRequestToDAFileList:(id)a3;
- (void)_adjustStateForNewConfiguration;
- (void)_ckQueueDownstreamOnly_uploadInFlightWithTransaction:(id)a3 xpcActivity:(id)a4 ckHelper:(id)a5 isExpedited:(BOOL)a6 completionBlock:(id)a7;
- (void)_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction:(id)a3 xpcActivity:(id)a4 ckHelper:(id)a5 followupWorkBlock:(id)a6;
- (void)_configureExpeditedUploadXPCActivity;
- (void)_configurePermissiveActivityCriteria:(id)a3 delaySeconds:(unsigned int)a4;
- (void)_configureReportStatsXPCActivity;
- (void)_configureUploadXPCActivity;
- (void)_configureXPCActivities;
- (void)_finishReportingStatsSessionWithActivity:(id)a3 withState:(int64_t)a4 transaction:(id)a5 endResultString:(id)a6;
- (void)_finishUploadSessionWithActivity:(id)a3 withState:(int64_t)a4 isExpedited:(BOOL)a5 transaction:(id)a6 completedSuccessfully:(BOOL)a7 endResultString:(id)a8 completionBlock:(id)a9;
- (void)_getConfiguration;
- (void)_handleCKConfigUpdate:(id)a3 state:(id)a4;
- (void)_handleCKWorkTriggerRequest:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)_handleCancelScheduledUploadRequest:(id)a3 state:(id)a4;
- (void)_handleDRSRequestMessage:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)_handleDampeningConfigurationDictMessage:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)_handleDampeningConfigurationGlobalEnablementMessage:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)_handleDampeningConfigurationReset:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)_handleEnableLogGatheringRequest:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)_handleGetCKConfig:(id)a3 state:(id)a4;
- (void)_handleGetIgnoreADG:(id)a3 state:(id)a4;
- (void)_handleInjectEnableLogGatheringRequestResult:(id)a3 state:(id)a4;
- (void)_handleNewEntitledConnection:(id)a3 state:(id)a4;
- (void)_handleRefreshDampeningConfigMessage:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)_handleRequestCleanTrigger:(id)a3 state:(id)a4;
- (void)_handleResetCKConfig:(id)a3 state:(id)a4;
- (void)_handleSetIgnoreADG:(id)a3 state:(id)a4;
- (void)_handleUploadSchedulingRequest:(id)a3 state:(id)a4;
- (void)_initializeServiceContainer;
- (void)_postReceiptProcessingWork:(id)a3;
- (void)_registerPermissiveExpeditedUploadXPCActivity:(unsigned int)a3;
- (void)_rejectInjectRequest:(id)a3 state:(id)a4 reason:(const char *)a5;
- (void)_replyToCKConfigMessageWithCurrentCKConfig:(id)a3;
- (void)_runCloudKitUploadWorkSessionWithTransaction:(id)a3 xpcActivity:(id)a4 isExpedited:(BOOL)a5 completionBlock:(id)a6;
- (void)_runReportingSessionWithTransaction:(id)a3 xpcActivity:(id)a4;
- (void)_sendAdminRequestReply:(BOOL)a3 rejectionReason:(const char *)a4 requestMessage:(id)a5;
- (void)_sendCurrentIgnoreADGReply:(id)a3 state:(id)a4;
- (void)_sendRejectionMessage:(id)a3 rejectionReason:(unint64_t)a4 state:(id)a5;
- (void)_unregisterPermissiveExpeditedUploadXPCActivity;
- (void)_updateConfigDict:(id)a3;
- (void)_waitForDeviceUnlockAndInitializeServiceState;
- (void)deactivateService;
- (void)dealloc;
- (void)handleRequest:(id)a3 state:(id)a4;
- (void)setIgnoreAutomatedDeviceGroup:(id)a3;
@end

@implementation DRSService

+ (BOOL)serviceIsEnabled
{
  if (serviceIsEnabled_onceToken_0 != -1) {
    dispatch_once(&serviceIsEnabled_onceToken_0, &__block_literal_global_4);
  }
  return serviceIsEnabled_isEnabled_0;
}

void __30__DRSService_serviceIsEnabled__block_invoke()
{
  v0 = +[DRSSystemProfile sharedInstance];
  int v1 = [v0 isCarrier];

  if (v1)
  {
    serviceIsEnabled_isEnabled_0 = 0;
    v2 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v3 = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceDisabled", "Service is disabled due to being Carrier", v3, 2u);
    }
  }
  else
  {
    serviceIsEnabled_isEnabled_0 = 1;
  }
}

+ (unint64_t)uploadSessionUploadCapBytes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__DRSService_uploadSessionUploadCapBytes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (uploadSessionUploadCapBytes_onceToken != -1) {
    dispatch_once(&uploadSessionUploadCapBytes_onceToken, block);
  }
  return uploadSessionUploadCapBytes_cap;
}

void __41__DRSService_uploadSessionUploadCapBytes__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) serviceIsEnabled])
  {
    id v1 = +[DRSSystemProfile sharedInstance];
    uploadSessionUploadCapBytes_cap = [v1 uploadSessionUploadCapBytes];
  }
  else
  {
    uploadSessionUploadCapBytes_cap = 0;
  }
}

- (unint64_t)_remainingSessionUploadQuotaBytesWithContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DRSService *)self maxSingleSessionUploadSizeInBytes];
  unint64_t v6 = [(DRSService *)self _remainingMonthlyUploadQuotaBytesWithContext:v4];

  if (v5 >= v6) {
    return v6;
  }
  else {
    return v5;
  }
}

- (unint64_t)monthlyUploadQuotaBytes
{
  return 8 * [(DRSService *)self maxSingleSessionUploadSizeInBytes];
}

- (unint64_t)_remainingMonthlyUploadQuotaBytesWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  unint64_t v6 = [v4 dateWithTimeIntervalSinceNow:-2592000.0];
  id v19 = 0;
  v7 = +[DRSRequest uploadedBytesSinceDate:v6 context:v5 errorOut:&v19];

  id v8 = v19;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    v10 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v10))
    {
      uint64_t v11 = [v8 localizedDescription];
      v12 = (void *)v11;
      v13 = @"Unknown";
      if (v11) {
        v13 = (__CFString *)v11;
      }
      *(_DWORD *)buf = 138543362;
      unint64_t v21 = (unint64_t)v13;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemainingQuotaCalculationError", "Encountered error while trying to calculate remaining monthly quota: %{public}@", buf, 0xCu);
    }
    unint64_t v14 = 0;
  }
  else
  {
    unint64_t v15 = [v7 unsignedLongLongValue];
    if (v15 >= [(DRSService *)self monthlyUploadQuotaBytes])
    {
      unint64_t v14 = 0;
      goto LABEL_16;
    }
    unint64_t v16 = [(DRSService *)self monthlyUploadQuotaBytes];
    unint64_t v14 = v16 - [v7 unsignedLongLongValue];
    v10 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v10))
    {
      unint64_t v17 = [(DRSService *)self monthlyUploadQuotaBytes];
      *(_DWORD *)buf = 134218240;
      unint64_t v21 = v14;
      __int16 v22 = 2048;
      unint64_t v23 = v17;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemainingMonthlyQuotaCalculated", "%lluB remain out of monthly upload quota of %lluB", buf, 0x16u);
    }
  }

LABEL_16:
  return v14;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_47);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

void __28__DRSService_sharedInstance__block_invoke()
{
  DRSRegisterForDeviceUnlockNotification();
  v0 = objc_alloc_init(DRSService);
  id v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
}

- (void)_initializeServiceContainer
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_209E70000, a2, OS_LOG_TYPE_FAULT, "DATA LOSS ERROR: Could not migrate DB due to error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_waitForDeviceUnlockAndInitializeServiceState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke;
  block[3] = &unk_263FC9990;
  block[4] = self;
  if (_waitForDeviceUnlockAndInitializeServiceState_onceToken_0 != -1) {
    dispatch_once(&_waitForDeviceUnlockAndInitializeServiceState_onceToken_0, block);
  }
}

uint64_t __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  DRSWaitForDeviceUnlock();
  int v2 = [(id)objc_opt_class() databaseDirectory];
  uint64_t v3 = DPLogHandle_ServiceLifecycle();
  uint64_t v4 = DPLogHandle_ServiceLifecycleError();
  DRSConfirmDirectoryIsInitialized(v2, v3, v4);

  id v5 = [(id)objc_opt_class() fileDirectory];
  unint64_t v6 = DPLogHandle_ServiceLifecycle();
  v7 = DPLogHandle_ServiceLifecycleError();
  DRSConfirmDirectoryIsInitialized(v5, v6, v7);

  [*(id *)(a1 + 32) _initializeServiceContainer];
  id v8 = [DRSDampeningManager alloc];
  BOOL v9 = [*(id *)(a1 + 32) serviceContainer];
  v10 = [(id)objc_opt_class() deviceTeamConfigurationDirectory];
  uint64_t v11 = [(DRSDampeningManager *)v8 initWithPersistentContainer:v9 teamConfigurationDirectory:v10];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 96);
  *(void *)(v12 + 96) = v11;

  unint64_t v14 = [*(id *)(a1 + 32) dampeningManager];

  if (!v14)
  {
    v47 = DPLogHandle_ServiceLifecycleError();
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v47, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerCreationFailure", "FATAL ERROR: Failed to create dampening manager for service", buf, 2u);
    }

    v48 = DPLogHandle_ServiceLifecycleError();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
      __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_1(v48);
    }

    exit(1);
  }
  unint64_t v15 = [DRSCKConfigStore alloc];
  unint64_t v16 = [(id)objc_opt_class() databaseDirectory];
  id v50 = 0;
  uint64_t v17 = [(DRSCKConfigStore *)v15 initWithWorkingDirectory:v16 isReadOnly:0 errorOut:&v50];
  id v18 = v50;
  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 120);
  *(void *)(v19 + 120) = v17;

  unint64_t v21 = [*(id *)(a1 + 32) ckConfigStore];

  if (v21)
  {
    __int16 v22 = [*(id *)(a1 + 32) ckConfigStore];
    id v49 = 0;
    unint64_t v23 = [v22 currentConfig:&v49];
    id v24 = v49;

    if (v23)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v23);
      v25 = DPLogHandle_ServiceLifecycleError();
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigFetchSuccess", (const char *)&unk_209EEADD1, buf, 2u);
      }
    }
    else
    {
      v33 = DPLogHandle_ServiceLifecycleError();
      if (os_signpost_enabled(v33))
      {
        uint64_t v34 = [v24 localizedDescription];
        v35 = (void *)v34;
        v36 = @"Unknown";
        if (v34) {
          v36 = (__CFString *)v34;
        }
        *(_DWORD *)buf = 138543362;
        v52 = v36;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigFetchFailure", "ERROR: Failed to fetch current CK config due to error: %{public}@. Will fallback to default.", buf, 0xCu);
      }
      uint64_t v37 = +[DRSCKConfig defaultConfig];
      uint64_t v38 = *(void *)(a1 + 32);
      v25 = *(NSObject **)(v38 + 128);
      *(void *)(v38 + 128) = v37;
    }
  }
  else
  {
    v26 = DPLogHandle_ServiceLifecycleError();
    if (os_signpost_enabled(v26))
    {
      uint64_t v27 = [v18 localizedDescription];
      v28 = (void *)v27;
      v29 = @"Unknown";
      if (v27) {
        v29 = (__CFString *)v27;
      }
      *(_DWORD *)buf = 138543362;
      v52 = v29;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigStoreCreationFailure", "ERROR: Failed to create CK config store for service due to error: %{public}@. Will fallback to default.", buf, 0xCu);
    }
    v30 = DPLogHandle_ServiceLifecycleError();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_2(v18);
    }

    uint64_t v31 = +[DRSCKConfig defaultConfig];
    uint64_t v32 = *(void *)(a1 + 32);
    id v24 = *(id *)(v32 + 128);
    *(void *)(v32 + 128) = v31;
  }

  v39 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v39))
  {
    v40 = [*(id *)(a1 + 32) ckConfig];
    v41 = [v40 debugDescription];
    *(_DWORD *)buf = 138543362;
    v52 = v41;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigApplied", "Applied config %{public}@", buf, 0xCu);
  }
  v42 = [*(id *)(a1 + 32) ckConfig];
  uint64_t v43 = +[DRSCloudKitHelper helperForCKConfig:v42];
  uint64_t v44 = *(void *)(a1 + 32);
  v45 = *(void **)(v44 + 112);
  *(void *)(v44 + 112) = v43;

  return [*(id *)(a1 + 32) _getConfiguration];
}

+ (id)databaseDirectory
{
  return @"/private/var/mobile/Library/DiagnosticPipeline";
}

+ (id)configurationDirectory
{
  return @"/System/Library/DiagnosticPipeline/Configuration";
}

+ (id)deviceTeamConfigurationDirectory
{
  uint64_t v3 = +[DRSSystemProfile sharedInstance];
  int v4 = [v3 isCarrier];

  if (v4)
  {
    id v5 = [a1 carrierConfigurationDirectory];
  }
  else
  {
    unint64_t v6 = +[DRSSystemProfile sharedInstance];
    int v7 = [v6 isInternal];

    if (v7)
    {
      id v5 = [a1 internalConfigurationDirectory];
    }
    else
    {
      id v8 = +[DRSSystemProfile sharedInstance];
      int v9 = [v8 isSeed];

      if (v9) {
        [a1 seedConfigurationDirectory];
      }
      else {
      id v5 = [a1 customerConfigurationDirectory];
      }
    }
  }

  return v5;
}

+ (id)carrierConfigurationDirectory
{
  int v2 = [a1 configurationDirectory];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"TeamConfiguration"];

  int v4 = [v3 stringByAppendingPathComponent:@"Carrier"];

  return v4;
}

+ (id)internalConfigurationDirectory
{
  int v2 = [a1 configurationDirectory];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"TeamConfiguration"];

  int v4 = [v3 stringByAppendingPathComponent:@"Internal"];

  return v4;
}

+ (id)seedConfigurationDirectory
{
  int v2 = [a1 configurationDirectory];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"TeamConfiguration"];

  int v4 = [v3 stringByAppendingPathComponent:@"Seed"];

  return v4;
}

+ (id)customerConfigurationDirectory
{
  int v2 = [a1 configurationDirectory];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"TeamConfiguration"];

  int v4 = [v3 stringByAppendingPathComponent:@"Customer"];

  return v4;
}

+ (id)fileDirectory
{
  return @"/private/var/mobile/Library/Logs/DiagnosticPipeline";
}

- (BOOL)_connectionHasEntitlement:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = (_xpc_connection_s *)a3;
  uint64_t v4 = xpc_connection_copy_entitlement_value();
  id v5 = (void *)v4;
  if (!v4)
  {
    unint64_t v6 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v6))
    {
      int v11 = 67109120;
      pid_t pid = xpc_connection_get_pid(v3);
      int v7 = "ClientConnectionMissingEntitlement";
      id v8 = "Client connection from [%d] missing entitlement 'com.apple.diagnosticpipeline.request'";
      goto LABEL_11;
    }
LABEL_12:

    BOOL v9 = 0;
    goto LABEL_13;
  }
  if (MEMORY[0x21050E4F0](v4) != MEMORY[0x263EF86E0])
  {
    unint64_t v6 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v6))
    {
      int v11 = 67109120;
      pid_t pid = xpc_connection_get_pid(v3);
      int v7 = "ClientConnectionBadEntitlementType";
      id v8 = "Client connection from [%d] has wrong type for entitlement 'com.apple.diagnosticpipeline.request'";
LABEL_11:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v7, v8, (uint8_t *)&v11, 8u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!xpc_BOOL_get_value(v5))
  {
    unint64_t v6 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v6))
    {
      int v11 = 67109120;
      pid_t pid = xpc_connection_get_pid(v3);
      int v7 = "ClientConnectionFalseEntitlement";
      id v8 = "Client connection from [%d] has a 'false' value for entitlement 'com.apple.diagnosticpipeline.request'";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (void)_sendRejectionMessage:(id)a3 rejectionReason:(unint64_t)a4 state:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v6 = (_xpc_connection_s *)a3;
  id v7 = a5;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "ServiceMessageType", 1uLL);
  xpc_dictionary_set_uint64(v8, "RejectionType", 1uLL);
  xpc_connection_send_message(v6, v8);
  BOOL v9 = DPLogHandle_ServiceXPCError();
  if (os_signpost_enabled(v9))
  {
    v10 = [v7 stateDescription];
    int v11 = 138543618;
    uint64_t v12 = v10;
    __int16 v13 = 2114;
    unint64_t v14 = @"Missing entitlement 'com.apple.diagnosticpipeline.request'";
    _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectingClientConnection", "Rejecting client connection from %{public}@ due to reason: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  xpc_connection_cancel(v6);
}

- (DRSService)init
{
  v28.receiver = self;
  v28.super_class = (Class)DRSService;
  int v2 = [(DRSService *)&v28 init];
  if (!v2) {
    goto LABEL_4;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.diagnosticpipeline service message queue", 0);
  messageQueue = v2->_messageQueue;
  v2->_messageQueue = (OS_dispatch_queue *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.diagnosticpipeline service CloudKit work queue", 0);
  cloudKitQueue = v2->_cloudKitQueue;
  v2->_cloudKitQueue = (OS_dispatch_queue *)v5;

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.diagnosticpipeline server post-receipt work queue", 0);
  postReceiptWorkQueue = v2->_postReceiptWorkQueue;
  v2->_postReceiptWorkQueue = (OS_dispatch_queue *)v7;

  dispatch_queue_t v9 = dispatch_queue_create("com.apple.diagnosticpipeline server outstanding upload lookup queue", 0);
  uploadRequestLookupQueue = v2->_uploadRequestLookupQueue;
  v2->_uploadRequestLookupQueue = (OS_dispatch_queue *)v9;

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.diagnosticpipeline server configuration queue", 0);
  configurationSyncQueue = v2->_configurationSyncQueue;
  v2->_configurationSyncQueue = (OS_dispatch_queue *)v11;

  __int16 v13 = [(DRSService *)v2 messageQueue];
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.diagnosticpipeline.service", v13, 1uLL);
  serviceConnection = v2->_serviceConnection;
  v2->_serviceConnection = mach_service;

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  serviceDeactivatedSem = v2->_serviceDeactivatedSem;
  v2->_serviceDeactivatedSem = (OS_dispatch_semaphore *)v16;

  v2->_maxSingleSessionUploadSizeInBytes = [(id)objc_opt_class() uploadSessionUploadCapBytes];
  v2->_state = 0;
  v2->_isEnabled = [(id)objc_opt_class() serviceIsEnabled];
  id v18 = [(DRSService *)v2 serviceConnection];

  if (v18)
  {
    objc_initWeak(location, v2);
    uint64_t v19 = [(DRSService *)v2 serviceConnection];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __18__DRSService_init__block_invoke;
    v24[3] = &unk_263FC9C90;
    v25 = v2;
    objc_copyWeak(&v26, location);
    xpc_connection_set_event_handler(v19, v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
LABEL_4:
    v20 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v20))
    {
      LOWORD(location[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceLaunch", (const char *)&unk_209EEADD1, (uint8_t *)location, 2u);
    }

    unint64_t v21 = v2;
    goto LABEL_10;
  }
  __int16 v22 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v22))
  {
    LOWORD(location[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedServiceLaunch", "Could not create connection for mach service", (uint8_t *)location, 2u);
  }

  unint64_t v21 = 0;
LABEL_10:

  return v21;
}

void __18__DRSService_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (MEMORY[0x21050E4F0]() == MEMORY[0x263EF86F0])
  {
    WeakRetained = [[DRSClientConnectionState alloc] initWithConnection:v3 service:*(void *)(a1 + 32)];
    char v7 = [*(id *)(a1 + 32) _connectionHasEntitlement:v3];
    xpc_object_t v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _handleNewEntitledConnection:v3 state:WeakRetained];
    }
    else {
      [v8 _sendRejectionMessage:v3 rejectionReason:1 state:WeakRetained];
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v3 == (id)MEMORY[0x263EF86A8])
  {
    dispatch_queue_t v9 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceConnectionInvalidated", (const char *)&unk_209EEADD1, (uint8_t *)&v12, 2u);
    }

    WeakRetained = (DRSClientConnectionState *)objc_loadWeakRetained((id *)(a1 + 40));
    WeakRetained->_hasAdminEntitlement = 2;
    v10 = [*(id *)(a1 + 32) serviceDeactivatedSem];
    dispatch_semaphore_signal(v10);

    goto LABEL_15;
  }
  if (v3 == (id)MEMORY[0x263EF86A0])
  {
    dispatch_queue_t v11 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceConnectionInterrupted", (const char *)&unk_209EEADD1, (uint8_t *)&v12, 2u);
    }
  }
  else if (MEMORY[0x21050E4F0](v3) != MEMORY[0x263EF8708])
  {
    uint64_t v4 = (void *)MEMORY[0x21050E380](v3);
    dispatch_queue_t v5 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v5))
    {
      int v12 = 136446210;
      __int16 v13 = v4;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMessageType", "Invalid message type unexpected: %{public}s", (uint8_t *)&v12, 0xCu);
    }

    if (v4) {
      free(v4);
    }
  }
LABEL_16:
}

- (BOOL)_saveDampeningManagerErrorOut:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_queue_t v5 = [(DRSService *)self dampeningManager];
  char v6 = [v5 saveToPersistentContainerWithErrorOut:a3];

  if (v6)
  {
    char v7 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v7))
    {
      xpc_object_t v8 = [(DRSService *)self dampeningManager];
      dispatch_queue_t v9 = [v8 debugDescription];
      int v12 = 138543362;
      id v13 = v9;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationUpdated", "Saved updated dampening configuration: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    char v7 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v7))
    {
      id v10 = *a3;
      int v12 = 138543362;
      id v13 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationSaveFailed", "Saving updated configuration failed due to error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }

  return v6;
}

- (void)_handleDampeningConfigurationGlobalEnablementMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v8 hasAdminEntitlement])
  {
    BOOL v9 = xpc_dictionary_get_BOOL(v7, "DampeningEnabled");
    id v10 = DPLogHandle_ServiceXPC();
    if (os_signpost_enabled(v10))
    {
      uint64_t v11 = [v8 stateDescription];
      int v12 = (void *)v11;
      id v13 = @"Disabled";
      if (v9) {
        id v13 = @"Enabled";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      uint64_t v27 = v13;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationGlobalEnablement", "Accepting global enablement request from %{public}@. Dampening will be %{public}@", buf, 0x16u);
    }
    uint64_t v14 = [(DRSService *)self dampeningManager];
    uint64_t v15 = [(id)v14 enforcementSettings];
    [v15 setAllEnforcement:v9];

    id v23 = 0;
    LOBYTE(v14) = [(DRSService *)self _saveDampeningManagerErrorOut:&v23];
    id v16 = v23;
    uint64_t v17 = v16;
    if (v14)
    {
      [(DRSService *)self _sendAdminRequestReply:1 rejectionReason:0 requestMessage:v7];
    }
    else
    {
      id v20 = [v16 localizedDescription];
      uint64_t v21 = [v20 UTF8String];
      if (v21) {
        __int16 v22 = (const char *)v21;
      }
      else {
        __int16 v22 = "Unknown save error";
      }
      [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:v22 requestMessage:v7];
    }
  }
  else
  {
    id v18 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v18))
    {
      uint64_t v19 = [v8 stateDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = (uint64_t)v19;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationGlobalEnablementRejected", "Rejecting global enablement request from %{public}@ due to missing entitlement", buf, 0xCu);
    }
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Client missing entitlement" requestMessage:v7];
  }
}

- (void)_handleDampeningConfigurationReset:(id)a3 state:(id)a4 transaction:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 hasAdminEntitlement])
  {
    uint64_t v11 = DPLogHandle_ServiceXPC();
    if (os_signpost_enabled(v11))
    {
      int v12 = [v9 stateDescription];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationReset", "Dampening configuration will be reset to defaults due to request from %{public}@", buf, 0xCu);
    }
    id v13 = [DRSDampeningManager alloc];
    uint64_t v14 = [(DRSService *)self serviceContainer];
    uint64_t v15 = [(id)objc_opt_class() deviceTeamConfigurationDirectory];
    id v16 = [(DRSDampeningManager *)v13 initWithPersistentContainer:v14 teamConfigurationDirectory:v15];
    dampeningManager = self->_dampeningManager;
    self->_dampeningManager = v16;

    id v18 = [(DRSService *)self serviceContainer];
    uint64_t v19 = (void *)[v18 newBackgroundContext];

    id v20 = [(DRSService *)self dampeningManager];
    id v57 = 0;
    char v21 = [(id)objc_opt_class() removeExistingDampeningManagerStateFromManagedObjectContext:v19 errorOut:&v57];
    id v22 = v57;

    if (v21)
    {

      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2020000000;
      char v56 = 1;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v59 = __Block_byref_object_copy__2;
      v60 = __Block_byref_object_dispose__2;
      id v61 = 0;
      uint64_t v45 = MEMORY[0x263EF8330];
      uint64_t v46 = 3221225472;
      v47 = __67__DRSService__handleDampeningConfigurationReset_state_transaction___block_invoke;
      v48 = &unk_263FC9CB8;
      v51 = &v53;
      id v49 = v19;
      v52 = buf;
      id v50 = v9;
      [v49 performBlockAndWait:&v45];
      id v23 = *(void **)(*(void *)&buf[8] + 40);
      if (v23)
      {
        id v24 = NSString;
        uint64_t v25 = [v23 localizedDescription];
        __int16 v26 = (void *)v25;
        uint64_t v27 = @"Unknown";
        if (v25) {
          uint64_t v27 = (__CFString *)v25;
        }
        uint64_t v28 = [v24 stringWithFormat:@"Failed save dampening manager due to error: %@", v27, v45, v46, v47, v48, v49];

        int v29 = *((unsigned __int8 *)v54 + 24);
        if (v28)
        {
          id v30 = v28;
          uint64_t v31 = [v30 UTF8String];
        }
        else
        {
          id v30 = 0;
          uint64_t v31 = 0;
        }
      }
      else
      {
        id v30 = 0;
        uint64_t v31 = 0;
        int v29 = *((unsigned __int8 *)v54 + 24);
      }
      [(DRSService *)self _sendAdminRequestReply:v29 != 0 rejectionReason:v31 requestMessage:v8];

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v53, 8);
    }
    else
    {
      uint64_t v34 = DPLogHandle_CoreDataError();
      if (os_signpost_enabled(v34))
      {
        v35 = [v9 stateDescription];
        uint64_t v36 = [v22 localizedDescription];
        uint64_t v37 = (void *)v36;
        if (v36) {
          uint64_t v38 = (__CFString *)v36;
        }
        else {
          uint64_t v38 = @"Unknown";
        }
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v38;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationResetPersistenceFailure", "Failed to cleanup dampening manager state for reset request from %{public}@ due to error: %{public}@", buf, 0x16u);
      }
      v39 = NSString;
      uint64_t v40 = [v22 localizedDescription];
      v41 = (void *)v40;
      if (v40) {
        v42 = (__CFString *)v40;
      }
      else {
        v42 = @"Unknown";
      }
      uint64_t v43 = [v39 stringWithFormat:@"Failed to cleanup dampening manager state due to error: %@", v42];

      id v44 = v43;
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, [v44 UTF8String], v8);
    }
  }
  else
  {
    uint64_t v32 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v32))
    {
      v33 = [v9 stateDescription];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v33;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationResetRejected", "Rejecting reset request from %{public}@ due to missing entitlement", buf, 0xCu);
    }
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Client missing entitlement" requestMessage:v8];
  }
}

void __67__DRSService__handleDampeningConfigurationReset_state_transaction___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = *(void **)(a1 + 32);
  id v11 = 0;
  char v3 = [v2 save:&v11];
  id v4 = v11;
  id v5 = v11;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    char v6 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v6))
    {
      id v7 = [*(id *)(a1 + 40) stateDescription];
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) localizedDescription];
      id v9 = (void *)v8;
      id v10 = @"Unknown";
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationResetPersistenceFailure", "Failed to save cleaned state for reset request from %{public}@ due to error: %@", buf, 0x16u);
    }
  }
}

- (void)_handleDampeningConfigurationDictMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v8 hasAdminEntitlement])
  {
    id v9 = xpc_dictionary_get_value(v7, "EnforceResourceHysteresis");

    if (v9)
    {
      BOOL v10 = xpc_dictionary_get_BOOL(v7, "EnforceResourceHysteresis");
      id v11 = [(DRSService *)self dampeningManager];
      int v12 = [v11 enforcementSettings];
      [v12 setEnforcesResourceHysteresis:v10];
    }
    id v13 = xpc_dictionary_get_value(v7, "EnforceResourceCap");

    if (v13)
    {
      BOOL v14 = xpc_dictionary_get_BOOL(v7, "EnforceResourceCap");
      uint64_t v15 = [(DRSService *)self dampeningManager];
      uint64_t v16 = [v15 enforcementSettings];
      [v16 setEnforcesResourceCap:v14];
    }
    uint64_t v17 = xpc_dictionary_get_value(v7, "EnforceResourceDownsampling");

    if (v17)
    {
      BOOL v18 = xpc_dictionary_get_BOOL(v7, "EnforceResourceDownsampling");
      uint64_t v19 = [(DRSService *)self dampeningManager];
      id v20 = [v19 enforcementSettings];
      [v20 setEnforcesResourceDownsampling:v18];
    }
    char v21 = xpc_dictionary_get_value(v7, "EnforceSignatureHysteresis");

    if (v21)
    {
      BOOL v22 = xpc_dictionary_get_BOOL(v7, "EnforceSignatureHysteresis");
      id v23 = [(DRSService *)self dampeningManager];
      id v24 = [v23 enforcementSettings];
      [v24 setEnforcesSignatureHysteresis:v22];
    }
    uint64_t v25 = xpc_dictionary_get_value(v7, "EnforceSignatureCap");

    if (v25)
    {
      BOOL v26 = xpc_dictionary_get_BOOL(v7, "EnforceSignatureCap");
      uint64_t v27 = [(DRSService *)self dampeningManager];
      uint64_t v28 = [v27 enforcementSettings];
      [v28 setEnforcesSignatureCap:v26];
    }
    int v29 = xpc_dictionary_get_value(v7, "EnforceSignatureDownsampling");

    if (v29)
    {
      BOOL v30 = xpc_dictionary_get_BOOL(v7, "EnforceSignatureDownsampling");
      uint64_t v31 = [(DRSService *)self dampeningManager];
      uint64_t v32 = [v31 enforcementSettings];
      [v32 setEnforcesSignatureDownsampling:v30];
    }
    v33 = xpc_dictionary_get_value(v7, "EnforceTotalCap");

    if (v33)
    {
      BOOL v34 = xpc_dictionary_get_BOOL(v7, "EnforceTotalCap");
      v35 = [(DRSService *)self dampeningManager];
      uint64_t v36 = [v35 enforcementSettings];
      [v36 setEnforcesTotalCap:v34];
    }
    uint64_t v37 = [(DRSService *)self dampeningManager];
    uint64_t v38 = [v37 defaultSignatureConfiguration];
    uint64_t uint64 = [v38 countCap];

    uint64_t v40 = [(DRSService *)self dampeningManager];
    v41 = [v40 defaultSignatureConfiguration];
    [v41 hysteresis];
    double v43 = v42;

    id v44 = [(DRSService *)self dampeningManager];
    uint64_t v45 = [v44 defaultSignatureConfiguration];
    [v45 acceptanceRate];
    double v47 = v46;

    v48 = xpc_dictionary_get_value(v7, "DefaultSignatureHysteresis");

    BOOL v49 = v48 != 0;
    if (v48) {
      double v43 = xpc_dictionary_get_double(v7, "DefaultSignatureHysteresis");
    }
    id v50 = xpc_dictionary_get_value(v7, "DefaultSignatureCap");

    if (v50)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v7, "DefaultSignatureCap");
      BOOL v49 = 1;
    }
    v51 = xpc_dictionary_get_value(v7, "AcceptanceRate");

    if (v51)
    {
      double v47 = xpc_dictionary_get_double(v7, "AcceptanceRate");
    }
    else if (!v49)
    {
      goto LABEL_26;
    }
    v54 = [[DRSDampeningConfiguration alloc] initWithHysteresis:uint64 cap:v43 acceptanceRate:v47];
    uint64_t v55 = [(DRSService *)self dampeningManager];
    [v55 setDefaultSignatureConfiguration:v54];

LABEL_26:
    id v61 = 0;
    BOOL v56 = [(DRSService *)self _saveDampeningManagerErrorOut:&v61];
    id v57 = v61;
    v52 = v57;
    if (v56)
    {
      [(DRSService *)self _sendAdminRequestReply:1 rejectionReason:0 requestMessage:v7];
    }
    else
    {
      id v58 = [v57 localizedDescription];
      uint64_t v59 = [v58 UTF8String];
      if (v59) {
        v60 = (const char *)v59;
      }
      else {
        v60 = "Unknown save error";
      }
      [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:v60 requestMessage:v7];
    }
    goto LABEL_32;
  }
  v52 = DPLogHandle_ServiceXPCError();
  if (os_signpost_enabled(v52))
  {
    uint64_t v53 = [v8 stateDescription];
    *(_DWORD *)buf = 138543362;
    v63 = v53;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v52, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationDictionaryRejected", "Rejecting dampening configuration dictionary request from %{public}@ due to missing entitlement", buf, 0xCu);
  }
LABEL_32:
}

- (void)_handleRefreshDampeningConfigMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v8 hasAdminEntitlement])
  {
    id v9 = [DRSDampeningManager alloc];
    BOOL v10 = [(DRSService *)self serviceContainer];
    id v11 = [(id)objc_opt_class() deviceTeamConfigurationDirectory];
    int v12 = [(DRSDampeningManager *)v9 initWithPersistentContainer:v10 teamConfigurationDirectory:v11];

    if (v12)
    {
      objc_storeStrong((id *)&self->_dampeningManager, v12);
      id v13 = DPLogHandle_ServiceXPC();
      if (os_signpost_enabled(v13))
      {
        BOOL v14 = [v8 stateDescription];
        int v21 = 138543362;
        BOOL v22 = v14;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RefreshDampeningConfigurationSucceeded", "Request from %{public}@ succeeded", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v15 = self;
      uint64_t v16 = 1;
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v19 = DPLogHandle_ServiceXPCError();
      if (os_signpost_enabled(v19))
      {
        id v20 = [v8 stateDescription];
        int v21 = 138543362;
        BOOL v22 = v20;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RefreshDampeningConfigurationFailed", "Request from %{public}@ failed: we could not instantiate a new dampening manager...", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v17 = "Could not instantiate refreshed dampening manager";
      uint64_t v15 = self;
      uint64_t v16 = 0;
    }
    [(DRSService *)v15 _sendAdminRequestReply:v16 rejectionReason:v17 requestMessage:v7];
  }
  else
  {
    int v12 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v12))
    {
      BOOL v18 = [v8 stateDescription];
      int v21 = 138543362;
      BOOL v22 = v18;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RefreshDampeningConfigurationMessageRejected", "Rejecting refresh dampening configuration request from %{public}@ due to missing entitlement", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)_addRequestToDAFileList:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 requestOutcome])
  {
    id v4 = [NSString alloc];
    id v5 = [v3 teamID];
    char v6 = [v3 issueCategory];
    id v7 = (void *)[v4 initWithFormat:@"DiagnosticRequest_%@_%@", v5, v6];

    id v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_26BDF7DE8];

    id v9 = [v3 debugDescription];
    id v14 = v3;
    id v10 = v9;
    if (OSAWriteLogForSubmission())
    {
      id v11 = DPLogHandle_DAReporting();
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v10;
        int v12 = "OSAWriteLogForSubmissionSuccess";
        id v13 = "Wrote DA log using 'OSAWriteLogForSubmission' for %{public}@";
LABEL_7:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      id v11 = DPLogHandle_DAReportingError();
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v10;
        int v12 = "OSAWriteLogForSubmissionFailed";
        id v13 = "Failed to write log using 'OSAWriteLogForSubmission' for %{public}@";
        goto LABEL_7;
      }
    }
  }
}

void __38__DRSService__addRequestToDAFileList___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) jsonCompatibleDictionaryRepresentationVerbose:1];
  id v12 = 0;
  id v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:&v12];
  id v6 = v12;
  if (v5)
  {
    [v3 writeData:v5];
  }
  else
  {
    id v7 = DPLogHandle_DAReportingError();
    if (os_signpost_enabled(v7))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [v6 localizedDescription];
      id v10 = (void *)v9;
      id v11 = @"Unknown";
      if (v9) {
        id v11 = (__CFString *)v9;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "JSONSerializationFailure", "Failed to serialize %{public}@ due to: %{public}@", buf, 0x16u);
    }
  }
}

- (void)_postReceiptProcessingWork:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DRSService *)self serviceContainer];
  id v6 = (void *)[v5 newBackgroundContext];

  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__2;
  uint64_t v32 = __Block_byref_object_dispose__2;
  id v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __41__DRSService__postReceiptProcessingWork___block_invoke;
  v19[3] = &unk_263FC9AA0;
  id v7 = v4;
  id v20 = v7;
  id v8 = v6;
  id v21 = v8;
  BOOL v22 = &v24;
  uint64_t v23 = &v28;
  [v8 performBlockAndWait:v19];
  if (*((unsigned char *)v25 + 24))
  {
    uint64_t v9 = DPLogHandle_CoreData();
    if (os_signpost_enabled(v9))
    {
      id v10 = [v7 debugDescription];
      *(_DWORD *)buf = 138543362;
      v35 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestRecordSave", "Saved request %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v9))
    {
      id v11 = [v7 debugDescription];
      uint64_t v12 = [(id)v29[5] localizedDescription];
      id v13 = (void *)v12;
      uint64_t v14 = @"Unknown";
      if (v12) {
        uint64_t v14 = (__CFString *)v12;
      }
      *(_DWORD *)buf = 138412546;
      v35 = v11;
      __int16 v36 = 2114;
      uint64_t v37 = v14;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestRecordSaveFailure", "Failed to save request %@ due to error: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  __int16 v15 = [(DRSService *)self postReceiptWorkQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __41__DRSService__postReceiptProcessingWork___block_invoke_97;
  v17[3] = &unk_263FC9D08;
  v17[4] = self;
  id v18 = v7;
  id v16 = v7;
  dispatch_async(v15, v17);
}

void __41__DRSService__postReceiptProcessingWork___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateContextWithRequest_ON_MOC_QUEUE:", *(void *)(a1 + 40));
  int v2 = *(void **)(a1 + 40);
  id obj = 0;
  char v3 = [v2 save:&obj];
  id v4 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
}

uint64_t __41__DRSService__postReceiptProcessingWork___block_invoke_97(uint64_t a1)
{
  [*(id *)(a1 + 32) _addRequestToDAFileList:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isExpedited];
  if (result)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 _randomDelaySecWithCap:3600];
    return [v3 _registerPermissiveExpeditedUploadXPCActivity:v4];
  }
  return result;
}

- (void)_handleDRSRequestMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[DRSRequest requestForMessage:v7];
  id v10 = v9;
  if (v9)
  {
    [v9 addAutomatedDeviceGroupContext];
    id v11 = [(id)objc_opt_class() fileDirectory];
    uint64_t v12 = DPLogHandle_ServiceLifecycle();
    id v13 = DPLogHandle_ServiceLifecycleError();
    DRSConfirmDirectoryIsInitialized(v11, v12, v13);

    uint64_t uint64 = xpc_dictionary_get_uint64(v7, "ClientMessageType");
    __int16 v15 = DPLogHandle_ServiceXPC();
    if (os_signpost_enabled(v15))
    {
      switch(uint64)
      {
        case 'd':
          id v16 = @"Dampening Global Enablement";
          break;
        case 'e':
          id v16 = @"Dampening Config Reset";
          break;
        case 'f':
          id v16 = @"Dampening Configuration Dictionary";
          break;
        case 'g':
          id v16 = @"CloudKit Work Trigger";
          break;
        case 'h':
          id v16 = @"EnableLogGatheringRequest Result Injection";
          break;
        case 'i':
          id v16 = @"Request Clean Trigger";
          break;
        case 'j':
          id v16 = @"Refresh Dampening Configuration";
          break;
        case 'k':
          id v16 = @"Update CK Config";
          break;
        case 'l':
          id v16 = @"Get CK Config";
          break;
        case 'm':
          id v16 = @"Reset CK Config";
          break;
        case 'n':
          id v16 = @"Schedule Permissive Upload Message";
          break;
        case 'o':
          id v16 = @"Cancel Scheduled Permissive Upload Message";
          break;
        case 'p':
          id v16 = @"Get 'Ignore AutomatedDeviceGroup' setting";
          break;
        case 'q':
          id v16 = @"Set 'Ignore AutomatedDeviceGroup' setting";
          break;
        default:
          id v16 = @"Tailspin request";
          switch(uint64)
          {
            case 0uLL:
              id v16 = @"Invalid";
              break;
            case 1uLL:
              goto LABEL_27;
            case 2uLL:
              id v16 = @"Log Donation request";
              break;
            case 3uLL:
              id v16 = @"Enable Log Gathering request";
              break;
            case 4uLL:
              id v16 = @"Submit Log to CK Container request";
              break;
            case 5uLL:
              id v16 = @"RAPID Log Donation request";
              break;
            default:
              id v16 = @"Unknown";
              break;
          }
          break;
      }
LABEL_27:
      uint64_t v19 = [v8 stateDescription];
      id v20 = [v10 teamID];
      id v21 = [v10 issueCategory];
      BOOL v22 = [v10 issueDescription];
      int v27 = 138413314;
      uint64_t v28 = v16;
      __int16 v29 = 2114;
      uint64_t v30 = v19;
      __int16 v31 = 2114;
      uint64_t v32 = v20;
      __int16 v33 = 2114;
      BOOL v34 = v21;
      __int16 v35 = 2114;
      __int16 v36 = v22;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientRequest", "Received '%@' from client %{public}@: %{public, name=teamID}@/%{public, name=issueCategory}@/%{public, name=issueDescription}@", (uint8_t *)&v27, 0x34u);
    }
    if ([(DRSService *)self isEnabled])
    {
      uint64_t v23 = [(DRSService *)self dampeningManager];
      uint64_t v24 = [v23 dampeningOutcomeForRequest:v10];
    }
    else
    {
      uint64_t v24 = 8;
    }
    uint64_t v25 = [(id)objc_opt_class() fileDirectory];
    [v10 performOnReceiptWork:v25 dampeningOutcome:v24];

    uint64_t v17 = [v10 replyForMessage:v7];
    if (v17)
    {
      xpc_dictionary_get_remote_connection(v7);
      uint64_t v26 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v26, v17);
    }
    [(DRSService *)self _postReceiptProcessingWork:v10];
  }
  else
  {
    uint64_t v17 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v17))
    {
      id v18 = [v8 stateDescription];
      int v27 = 138543362;
      uint64_t v28 = v18;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRequest", "Received invalid request from client %{public}@", (uint8_t *)&v27, 0xCu);
    }
  }
}

- (void)_finishUploadSessionWithActivity:(id)a3 withState:(int64_t)a4 isExpedited:(BOOL)a5 transaction:(id)a6 completedSuccessfully:(BOOL)a7 endResultString:(id)a8 completionBlock:(id)a9
{
  BOOL v10 = a7;
  uint64_t v39 = *MEMORY[0x263EF8340];
  __int16 v15 = (_xpc_activity_s *)a3;
  id v16 = a6;
  uint64_t v17 = (__CFString *)a8;
  id v18 = (void (**)(id, BOOL, id))a9;
  if (a5)
  {
    if (!v15) {
      goto LABEL_21;
    }
    uint64_t v19 = DPLogHandle_ServiceLifecycle();
    if (!os_signpost_enabled(v19)) {
      goto LABEL_20;
    }
    id v20 = @"Success!";
    if (v17) {
      id v20 = v17;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v20;
    id v21 = "CloudKitExpeditedUploadXPCActivity";
    goto LABEL_19;
  }
  id v35 = v16;
  int64_t v22 = a4;
  BOOL v23 = v10;
  uint64_t v24 = [(DRSService *)self serviceContainer];
  uint64_t v25 = [MEMORY[0x263EFF910] date];
  id v36 = 0;
  BOOL v26 = +[DRSRequest cullOldRequestRecordsFromPersistentContainer:v24 currentDate:v25 errorOut:&v36];
  id v27 = v36;

  uint64_t v28 = DPLogHandle_ServiceLifecycle();
  BOOL v29 = os_signpost_enabled(v28);
  if (v26)
  {
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ContainerCullingSuccess", (const char *)&unk_209EEADD1, buf, 2u);
    }
  }
  else if (v29)
  {
    uint64_t v30 = [v27 localizedDescription];
    __int16 v31 = (void *)v30;
    uint64_t v32 = @"Unknown";
    if (v30) {
      uint64_t v32 = (__CFString *)v30;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v32;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ContainerCullingFailure", "Failed to clean container due to error: %{public}@", buf, 0xCu);
  }
  BOOL v10 = v23;
  a4 = v22;
  id v16 = v35;
  if (v15)
  {
    uint64_t v19 = DPLogHandle_ServiceLifecycle();
    if (!os_signpost_enabled(v19))
    {
LABEL_20:

      xpc_activity_set_state(v15, a4);
      goto LABEL_21;
    }
    __int16 v33 = @"Success!";
    if (v17) {
      __int16 v33 = v17;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v33;
    id v21 = "CloudKitUploadXPCActivity";
LABEL_19:
    _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v21, "Ended with reason: %{public}@", buf, 0xCu);
    goto LABEL_20;
  }
LABEL_21:
  BOOL v34 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v17;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKUploadSession", "Upload session finished with result: %@", buf, 0xCu);
  }

  if (v18) {
    v18[2](v18, v10, v17);
  }
}

- (void)_finishReportingStatsSessionWithActivity:(id)a3 withState:(int64_t)a4 transaction:(id)a5 endResultString:(id)a6
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = (__CFString *)a6;
  if (a3)
  {
    uint64_t v9 = (_xpc_activity_s *)a3;
    BOOL v10 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v10))
    {
      id v11 = @"Success!";
      if (v8) {
        id v11 = v8;
      }
      int v12 = 138543362;
      id v13 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudKitReportStatsXPCActivity", "Ended with reason: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    xpc_activity_set_state(v9, a4);
  }
}

- (void)_ckQueueDownstreamOnly_uploadInFlightWithTransaction:(id)a3 xpcActivity:(id)a4 ckHelper:(id)a5 isExpedited:(BOOL)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(DRSService *)self uploadRequestLookupQueue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke;
  v21[3] = &unk_263FC9D58;
  BOOL v26 = a6;
  v21[4] = self;
  id v22 = v13;
  id v24 = v14;
  id v25 = v15;
  id v23 = v12;
  id v17 = v14;
  id v18 = v15;
  id v19 = v12;
  id v20 = v13;
  dispatch_sync(v16, v21);
}

void __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v2 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v2))
  {
    if (*(unsigned char *)(a1 + 72)) {
      char v3 = "YES";
    }
    else {
      char v3 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    __int16 v33 = v3;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ServiceCKUploadSession", "isExpedited = %s", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 32) serviceContainer];
  id v5 = (void *)[v4 newBackgroundContext];

  if (kDABugTypeString_block_invoke_onceToken != -1) {
    dispatch_once(&kDABugTypeString_block_invoke_onceToken, &__block_literal_global_105);
  }
  id v6 = +[DRSRequest leastRecentDateFirstSortDescriptor];
  id v7 = &kDABugTypeString_block_invoke_waitingForExpeditedUploadPredicate;
  if (!*(unsigned char *)(a1 + 72)) {
    id v7 = &kDABugTypeString_block_invoke_waitingForUploadPredicate;
  }
  id v8 = (id)*v7;
  __int16 v31 = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  id v30 = 0;
  BOOL v10 = +[DRSRequest requestsForFilterPredicate:v8 context:v5 sortDescriptors:v9 fetchLimit:0 errorOut:&v30];
  id v11 = v30;

  if (v11)
  {
    id v12 = NSString;
    uint64_t v13 = [v11 localizedDescription];
    id v14 = (void *)v13;
    id v15 = @"Unknown";
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    id v16 = [v12 stringWithFormat:@"Request fetch error: %@", v15];

    [*(id *)(a1 + 32) _finishUploadSessionWithActivity:*(void *)(a1 + 40) withState:5 isExpedited:*(unsigned __int8 *)(a1 + 72) transaction:*(void *)(a1 + 48) completedSuccessfully:0 endResultString:v16 completionBlock:*(void *)(a1 + 64)];
  }
  else if (v10 && [v10 count])
  {
    id v17 = *(void **)(a1 + 56);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v18 = [*(id *)(a1 + 32) _remainingSessionUploadQuotaBytesWithContext:v5];
    id v19 = [*(id *)(a1 + 32) serviceContainer];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_2;
    v23[3] = &unk_263FC9D30;
    id v20 = *(id *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 32);
    id v24 = v20;
    uint64_t v25 = v21;
    id v26 = v10;
    char v29 = *(unsigned char *)(a1 + 72);
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 64);
    [v17 uploadRequests:v26 contactDecisionServer:1 xpcActivity:v22 remainingUploadQuota:v18 backingPersistentContainer:v19 completionHandler:v23];
  }
  else
  {
    [*(id *)(a1 + 32) _finishUploadSessionWithActivity:*(void *)(a1 + 40) withState:5 isExpedited:*(unsigned __int8 *)(a1 + 72) transaction:*(void *)(a1 + 48) completedSuccessfully:1 endResultString:@"Success (no outstanding requests)!" completionBlock:*(void *)(a1 + 64)];
  }
}

void __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_103()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"requestState == %llu", 1);
  id v1 = (void *)kDABugTypeString_block_invoke_waitingForUploadPredicate;
  kDABugTypeString_block_invoke_waitingForUploadPredicate = v0;

  uint64_t v2 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"requestState == %llu AND isExpedited == YES", 1);
  char v3 = (void *)kDABugTypeString_block_invoke_waitingForExpeditedUploadPredicate;
  kDABugTypeString_block_invoke_waitingForExpeditedUploadPredicate = v2;
}

void __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v46 = a2;
  id v45 = a3;
  id v44 = a4;
  id v7 = *(_xpc_activity_s **)(a1 + 32);
  if (v7)
  {
    BOOL should_defer = xpc_activity_should_defer(v7);
    uint64_t v9 = 5;
    if (should_defer) {
      uint64_t v9 = 3;
    }
  }
  else
  {
    uint64_t v9 = 5;
  }
  uint64_t v43 = v9;
  BOOL v10 = [*(id *)(a1 + 40) serviceContainer];
  id v11 = (void *)[v10 newBackgroundContext];

  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__2;
  v68 = __Block_byref_object_dispose__2;
  id v69 = 0;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_3;
  v55[3] = &unk_263FC9AA0;
  id v56 = *(id *)(a1 + 48);
  id v57 = v11;
  id v58 = &v60;
  uint64_t v59 = &v64;
  id v42 = v57;
  [v57 performBlockAndWait:v55];
  if (*((unsigned char *)v61 + 24))
  {
    if (v46)
    {
      id v12 = NSString;
      uint64_t v13 = [v46 localizedDescription];
      id v14 = (void *)v13;
      id v15 = @"Unknown";
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      id v16 = [v12 stringWithFormat:@"Decision server error: %@", v15];
    }
    else
    {
      if (v45)
      {
        id v17 = (void *)[@"CF error(s):\n" mutableCopy];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v26 = v45;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v71 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v52 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = [*(id *)(*((void *)&v51 + 1) + 8 * i) localizedDescription];
              __int16 v31 = (void *)v30;
              if (v30) {
                uint64_t v32 = (__CFString *)v30;
              }
              else {
                uint64_t v32 = @"Unknown";
              }
              [v17 appendFormat:@"%@\n", v32];
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v71 count:16];
          }
          while (v27);
        }
      }
      else
      {
        id v17 = 0;
      }
      if (!v44) {
        goto LABEL_13;
      }
      id v14 = (void *)[@"Upload error(s):\n" mutableCopy];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v34 = v44;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v70 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v48 != v36) {
              objc_enumerationMutation(v34);
            }
            uint64_t v38 = [*(id *)(*((void *)&v47 + 1) + 8 * j) localizedDescription];
            uint64_t v39 = (void *)v38;
            if (v38) {
              uint64_t v40 = (__CFString *)v38;
            }
            else {
              uint64_t v40 = @"Unknown";
            }
            [v14 appendFormat:@"%@\n", v40];
          }
          uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v70 count:16];
        }
        while (v35);
      }

      if (v17)
      {
        id v41 = (id)[v17 stringByAppendingString:v14];
        goto LABEL_12;
      }
      id v16 = v14;
      id v14 = v16;
    }
    id v17 = v16;
LABEL_12:

LABEL_13:
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(a1 + 40);
    int v20 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v21 = *(void *)(a1 + 56);
    if (v17)
    {
      [v18 _finishUploadSessionWithActivity:v19 withState:v43 isExpedited:v20 != 0 transaction:v21 completedSuccessfully:0 endResultString:v17 completionBlock:*(void *)(a1 + 64)];
    }
    else
    {
      __int16 v33 = objc_msgSend(NSString, "stringWithFormat:", @"Successfully uploaded %llu requests!", objc_msgSend(*(id *)(a1 + 48), "count"));
      [v18 _finishUploadSessionWithActivity:v19 withState:v43 isExpedited:v20 != 0 transaction:v21 completedSuccessfully:1 endResultString:v33 completionBlock:*(void *)(a1 + 64)];
    }
    goto LABEL_31;
  }
  uint64_t v22 = NSString;
  uint64_t v23 = [(id)v65[5] localizedDescription];
  id v24 = (void *)v23;
  uint64_t v25 = @"Unknown";
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  id v17 = [v22 stringWithFormat:@"Request upload request state update error: %@", v25];

  [*(id *)(a1 + 40) _finishUploadSessionWithActivity:*(void *)(a1 + 32) withState:v43 isExpedited:*(unsigned __int8 *)(a1 + 72) transaction:*(void *)(a1 + 56) completedSuccessfully:0 endResultString:v17 completionBlock:*(void *)(a1 + 64)];
LABEL_31:

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
}

void __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v6++), "updateContextWithRequest_ON_MOC_QUEUE:", *(void *)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  id v7 = *(void **)(a1 + 40);
  id obj = 0;
  char v8 = [v7 save:&obj];
  id v9 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);
}

- (void)_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction:(id)a3 xpcActivity:(id)a4 ckHelper:(id)a5 followupWorkBlock:(id)a6
{
  v33[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", (const char *)&unk_209EEADD1, buf, 2u);
  }

  id v15 = [(DRSService *)self serviceContainer];
  uint64_t v16 = (void *)[v15 newBackgroundContext];

  if (_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__onceToken != -1) {
    dispatch_once(&_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__onceToken, &__block_literal_global_140);
  }
  id v17 = +[DRSEnableDataGatheringQuery leastRecentDateFirstSortDescriptor];
  v33[0] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];

  id v30 = 0;
  uint64_t v19 = +[DRSEnableDataGatheringQuery enableDataGatheringQueriesForFilterPredicate:_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__outstandingQueryPredicate context:v16 sortDescriptors:v18 fetchLimit:0 errorOut:&v30];
  id v20 = v30;
  if (v20)
  {
    uint64_t v21 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v21))
    {
      uint64_t v22 = [v20 localizedDescription];
      uint64_t v23 = (void *)v22;
      id v24 = @"Unknown";
      if (v22) {
        id v24 = (__CFString *)v22;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v24;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", "ERROR: Failed to look up outstanding queries due to error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v19 && [v19 count])
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke_145;
      v25[3] = &unk_263FC9D80;
      v25[4] = self;
      id v26 = v19;
      id v29 = v13;
      id v27 = v10;
      id v28 = v11;
      [v12 shouldEnableDataGathering:v26 xpcActivity:v28 replyHandler:v25];

      goto LABEL_17;
    }
    uint64_t v21 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", "No outstanding queries so no need to contact decision server", buf, 2u);
    }
  }

  if (v13) {
    (*((void (**)(id, id, id))v13 + 2))(v13, v10, v11);
  }
LABEL_17:
}

void __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"response == %llu", 2);
  id v1 = (void *)_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__outstandingQueryPredicate;
  _ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__outstandingQueryPredicate = v0;
}

void __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) serviceContainer];
  char v8 = (void *)[v7 newBackgroundContext];

  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__2;
  __int16 v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke_2;
  id v20 = &unk_263FC9AA0;
  id v21 = *(id *)(a1 + 40);
  id v9 = v8;
  id v22 = v9;
  uint64_t v23 = &v25;
  id v24 = &v29;
  [v9 performBlockAndWait:&v17];
  if (*((unsigned char *)v26 + 24))
  {
    id v10 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v10))
    {
      int v11 = objc_msgSend(*(id *)(a1 + 40), "count", v17, v18, v19, v20, v21);
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", "Successfully processed %u outstanding queries", buf, 8u);
    }
  }
  else
  {
    id v10 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v10))
    {
      uint64_t v12 = objc_msgSend((id)v30[5], "localizedDescription", v17, v18, v19, v20, v21);
      id v13 = (void *)v12;
      long long v14 = @"Unknown";
      if (v12) {
        long long v14 = (__CFString *)v12;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v14;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", "ERROR: Failed to save updated queries due to error: %{public}@", buf, 0xCu);
    }
  }

  uint64_t v15 = *(void *)(a1 + 64);
  if (v15)
  {
    (*(void (**)(uint64_t, void, void))(v15 + 16))(v15, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  else
  {
    uint64_t v16 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FollowUpBlockMissing", (const char *)&unk_209EEADD1, buf, 2u);
    }
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

void __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v6++), "updateContextWithDataGatheringQuery_ON_MOC_QUEUE:", *(void *)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  id v7 = *(void **)(a1 + 40);
  id obj = 0;
  char v8 = [v7 save:&obj];
  id v9 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);
}

- (void)_runCloudKitUploadWorkSessionWithTransaction:(id)a3 xpcActivity:(id)a4 isExpedited:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(DRSService *)self _updateUploadDate];
  if (v11 && !xpc_activity_set_state((xpc_activity_t)v11, 4))
  {
    [(DRSService *)self _finishUploadSessionWithActivity:v11 withState:5 isExpedited:v7 transaction:v10 completedSuccessfully:0 endResultString:@"Failed to mark activity as continued, so bailing on activity" completionBlock:v12];
  }
  else
  {
    long long v13 = [(DRSService *)self cloudKitQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __99__DRSService__runCloudKitUploadWorkSessionWithTransaction_xpcActivity_isExpedited_completionBlock___block_invoke;
    block[3] = &unk_263FC9DD0;
    block[4] = self;
    BOOL v18 = v7;
    id v17 = v12;
    id v15 = v10;
    id v16 = v11;
    dispatch_async(v13, block);
  }
}

void __99__DRSService__runCloudKitUploadWorkSessionWithTransaction_xpcActivity_isExpedited_completionBlock___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__DRSService__runCloudKitUploadWorkSessionWithTransaction_xpcActivity_isExpedited_completionBlock___block_invoke_2;
  aBlock[3] = &unk_263FC9DA8;
  aBlock[4] = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  id v2 = _Block_copy(aBlock);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 64))
  {
    (*((void (**)(void *, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    BOOL v7 = [v6 ckHelper];
    objc_msgSend(v6, "_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction:xpcActivity:ckHelper:followupWorkBlock:", v4, v5, v7, v3);
  }
}

void __99__DRSService__runCloudKitUploadWorkSessionWithTransaction_xpcActivity_isExpedited_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = v5;
  if (v5 && xpc_activity_should_defer(v5))
  {
    [*(id *)(a1 + 32) _finishUploadSessionWithActivity:v6 withState:3 isExpedited:*(unsigned __int8 *)(a1 + 48) transaction:v9 completedSuccessfully:0 endResultString:@"Deferral before upload work" completionBlock:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v7 = *(void **)(a1 + 32);
    char v8 = [v7 ckHelper];
    objc_msgSend(v7, "_ckQueueDownstreamOnly_uploadInFlightWithTransaction:xpcActivity:ckHelper:isExpedited:completionBlock:", v9, v6, v8, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
  }
}

- (void)_runReportingSessionWithTransaction:(id)a3 xpcActivity:(id)a4
{
  id v6 = a3;
  BOOL v7 = (_xpc_activity_s *)a4;
  char v8 = v7;
  if (v7 && !xpc_activity_set_state(v7, 4))
  {
    [(DRSService *)self _finishReportingStatsSessionWithActivity:v8 withState:5 transaction:v6 endResultString:@"Failed to mark activity as continued, so bailing on activity"];
  }
  else
  {
    id v9 = [(DRSService *)self cloudKitQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke;
    block[3] = &unk_263FC9E20;
    block[4] = self;
    id v11 = v8;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceContainer];
  uint64_t v3 = (void *)[v2 newBackgroundContext];

  id v13 = 0;
  uint64_t v4 = +[DRSRequest unreportedTerminalRequestsFromContext:v3 sortDescriptors:0 fetchLimit:0 errorOut:&v13];
  id v5 = v13;
  id v6 = [*(id *)(a1 + 32) ckHelper];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke_2;
  v9[3] = &unk_263FC9DF8;
  BOOL v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v4;
  id v11 = v7;
  id v12 = *(id *)(a1 + 48);
  id v8 = v4;
  [v6 reportTerminalRequestStats:v8 xpcActivity:v7 replyHandler:v9];
}

void __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [NSString alloc];
    uint64_t v5 = [*(id *)(a1 + 40) count];
    uint64_t v6 = [v3 localizedDescription];
    BOOL v7 = (void *)v6;
    id v8 = @"Unknown";
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    id v9 = (id)[v4 initWithFormat:@"Failed to report stats for %lu requests due to error: %@", v5, v8];

    [*(id *)(a1 + 32) _finishReportingStatsSessionWithActivity:*(void *)(a1 + 48) withState:5 transaction:*(void *)(a1 + 56) endResultString:v9];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) serviceContainer];
    id v11 = (void *)[v10 newBackgroundContext];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke_3;
    v13[3] = &unk_263FC9D08;
    id v14 = *(id *)(a1 + 40);
    id v15 = v11;
    id v9 = v11;
    [v9 performBlockAndWait:v13];
    id v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Successfully reported stats for %lu requests", objc_msgSend(*(id *)(a1 + 40), "count"));
    [*(id *)(a1 + 32) _finishReportingStatsSessionWithActivity:*(void *)(a1 + 48) withState:5 transaction:*(void *)(a1 + 56) endResultString:v12];
  }
}

void __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v7 setHasBeenCountedByTelemetry:1];
        objc_msgSend(v7, "updateContextWithRequest_ON_MOC_QUEUE:", *(void *)(a1 + 40));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v4);
  }

  id v8 = *(void **)(a1 + 40);
  id v16 = 0;
  char v9 = [v8 save:&v16];
  id v10 = v16;
  if (v9)
  {
    id v11 = DPLogHandle_CoreData();
    if (os_signpost_enabled(v11))
    {
      uint64_t v12 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReportRequestStatsSave", "Successfully reported stats for %lu records", buf, 0xCu);
    }
  }
  else
  {
    id v11 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v11))
    {
      uint64_t v13 = [v10 localizedDescription];
      id v14 = (void *)v13;
      id v15 = @"Unknown";
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = (uint64_t)v15;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReportRequestStatsSaveFailure", "Failed to save reported request stats to error: %{public}@", buf, 0xCu);
    }
  }
}

- (double)_resolvedEnableDataGatheringQueryAcceptanceRate
{
  id v2 = +[DRSSystemProfile sharedInstance];
  char v3 = [v2 isInternal];

  double result = 1.0;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = +[DRSSystemProfile sharedInstance];
    int v6 = [v5 isSeed];

    double result = 0.01;
    if (v6) {
      return 0.1;
    }
  }
  return result;
}

- (BOOL)_enableDataGatheringQueryPassesRandomRejection
{
  [(DRSService *)self _resolvedEnableDataGatheringQueryAcceptanceRate];

  return +[DRSDampeningManager passesAcceptanceRate:](DRSDampeningManager, "passesAcceptanceRate:");
}

- (BOOL)_persistEnableLogGatheringResult:(id)a3 workingContext:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__2;
  __int16 v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __62__DRSService__persistEnableLogGatheringResult_workingContext___block_invoke;
  long long v20 = &unk_263FC9AA0;
  id v7 = v5;
  id v21 = v7;
  id v8 = v6;
  id v22 = v8;
  uint64_t v23 = &v25;
  uint64_t v24 = &v29;
  [v8 performBlockAndWait:&v17];
  if (*((unsigned char *)v26 + 24))
  {
    char v9 = DPLogHandle_CoreData();
    if (os_signpost_enabled(v9))
    {
      id v10 = objc_msgSend(v7, "debugDescription", v17, v18, v19, v20, v21);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnableDataGatheringRecordSave", "Saved enable data gathering query %{public}@", buf, 0xCu);
    }
  }
  else
  {
    char v9 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v9))
    {
      id v11 = objc_msgSend(v7, "debugDescription", v17, v18, v19, v20, v21);
      uint64_t v12 = [(id)v30[5] localizedDescription];
      uint64_t v13 = (void *)v12;
      id v14 = @"Unknown";
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v11;
      __int16 v37 = 2114;
      uint64_t v38 = v14;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnableDataGatheringRecordSaveFailure", "Failed to enable data gathering query %{public}@ due to error: %{public}@", buf, 0x16u);
    }
  }

  BOOL v15 = *((unsigned char *)v26 + 24) != 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __62__DRSService__persistEnableLogGatheringResult_workingContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateContextWithDataGatheringQuery_ON_MOC_QUEUE:", *(void *)(a1 + 40));
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (id)_cachedMatchingQuery:(id)a3 workingContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v17 = 0;
  id v6 = +[DRSEnableDataGatheringQuery cachedQueryResponseForQuery:v5 inContext:a4 errorOut:&v17];
  id v7 = v17;
  if (!v7)
  {
    if (!v6)
    {
      id v14 = DPLogHandle_CoreData();
      if (os_signpost_enabled(v14))
      {
        BOOL v15 = [v5 debugDescription];
        *(_DWORD *)buf = 138543362;
        long long v19 = v15;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CachedQueryResultNotFound", "No cached result for '%{public}@'", buf, 0xCu);
      }
      goto LABEL_13;
    }
LABEL_9:
    id v13 = v6;
    goto LABEL_14;
  }
  id v8 = DPLogHandle_CoreDataError();
  if (os_signpost_enabled(v8))
  {
    char v9 = [v5 debugDescription];
    uint64_t v10 = [v7 localizedDescription];
    id v11 = (void *)v10;
    uint64_t v12 = @"Unknown";
    if (v10) {
      uint64_t v12 = (__CFString *)v10;
    }
    *(_DWORD *)buf = 138543618;
    long long v19 = v9;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CachedQueryResultFetchFailure", "Encountered failure when trying to fetch cached results for '%{public}@': %{public}@", buf, 0x16u);
  }
  if (v6) {
    goto LABEL_9;
  }
LABEL_13:
  id v13 = 0;
LABEL_14:

  return v13;
}

- (void)_handleEnableLogGatheringRequest:(id)a3 state:(id)a4 transaction:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  char v9 = [[DRSEnableDataGatheringQuery alloc] initWithXPCDict:v7];
  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  id v11 = reply;
  if (v9)
  {
    uint64_t v12 = +[DRSSystemProfile sharedInstance];
    char v13 = [v12 isLogUploadEnabled];

    if (v13)
    {
      id v14 = [(DRSService *)self serviceContainer];
      BOOL v15 = [v14 newBackgroundContext];

      id v16 = [(DRSService *)self _cachedMatchingQuery:v9 workingContext:v15];
      if (v16)
      {
        id v17 = v16;
        if (![v16 response] || objc_msgSend(v17, "response") == 2)
        {
          uint64_t v18 = DPLogHandle_CoreData();
          if (os_signpost_enabled(v18))
          {
            long long v19 = [(DRSEnableDataGatheringQuery *)v9 debugDescription];
            __int16 v20 = [v17 debugDescription];
            *(_DWORD *)buf = 138543618;
            uint64_t v38 = v19;
            __int16 v39 = 2114;
            uint64_t v40 = v20;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReturningCachedQueryResult", "Returning cached result for enable query '%{public}@': %{public}@", buf, 0x16u);
          }
          xpc_dictionary_set_uint64(v11, "EnableLogGatheringQueryReply", [v17 response]);
          xpc_dictionary_get_remote_connection(v7);
          id v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
          xpc_connection_send_message(v21, v11);

LABEL_23:
          goto LABEL_24;
        }
        uint64_t v29 = DPLogHandle_CoreData();
        if (os_signpost_enabled(v29))
        {
          id v30 = [(DRSEnableDataGatheringQuery *)v9 debugDescription];
          uint64_t v31 = [v17 debugDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v38 = v30;
          __int16 v39 = 2114;
          uint64_t v40 = v31;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IgnoringCachedQueryYES", "Asking again for %@ (Ignoring cached YES result '%{public}@')", buf, 0x16u);
        }
        [(DRSEnableDataGatheringQuery *)v9 setIsContinue:1];
        xpc_dictionary_set_uint64(v11, "EnableLogGatheringQueryReply", [v17 response]);
        xpc_dictionary_get_remote_connection(v7);
        uint64_t v32 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message(v32, v11);
      }
      else if (![(DRSService *)self _enableDataGatheringQueryPassesRandomRejection])
      {
        id v26 = [NSString alloc];
        [(DRSService *)self _resolvedEnableDataGatheringQueryAcceptanceRate];
        id v17 = (void *)[v26 initWithFormat:@"Randomized rejection (%.2f%% acceptance rate)", v27 * 100.0];
        uint64_t v28 = 0;
LABEL_20:
        [(DRSEnableDataGatheringQuery *)v9 setResponse:v28];
        [(DRSEnableDataGatheringQuery *)v9 setRejectionReason:v17];
        xpc_dictionary_set_uint64(v11, "EnableLogGatheringQueryReply", v28);
        xpc_dictionary_get_remote_connection(v7);
        __int16 v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message(v33, v11);

        id v34 = DPLogHandle_ServiceXPC();
        if (os_signpost_enabled(v34))
        {
          uint64_t v35 = [(DRSEnableDataGatheringQuery *)v9 debugDescription];
          uint64_t v36 = [v8 stateDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v38 = v35;
          __int16 v39 = 2114;
          uint64_t v40 = v36;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnableLogGatheringQueryReply", "Replied %@ to query from %{public}@", buf, 0x16u);
        }
        [(DRSService *)self _persistEnableLogGatheringResult:v9 workingContext:v15];
        goto LABEL_23;
      }
      id v17 = 0;
      uint64_t v28 = 2;
      goto LABEL_20;
    }
    xpc_dictionary_set_uint64(v11, "EnableLogGatheringQueryReply", 0);
    xpc_dictionary_get_remote_connection(v7);
    uint64_t v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v25, v11);

    BOOL v15 = DPLogHandle_EnableDataGatheringQuery();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      uint64_t v23 = "CustomerDoesNotApprove";
      uint64_t v24 = "Rejecting enable data gathering query due to lack of customer approval";
      goto LABEL_13;
    }
  }
  else
  {
    xpc_dictionary_set_uint64(reply, "EnableLogGatheringQueryReply", 3uLL);
    xpc_dictionary_get_remote_connection(v7);
    uint64_t v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v22, v11);

    BOOL v15 = DPLogHandle_EnableDataGatheringQueryError();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      uint64_t v23 = "InvalidEnableDataGatheringQuery";
      uint64_t v24 = "Rejecting enable data gathering query due to malformed message";
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v23, v24, buf, 2u);
    }
  }
LABEL_24:
}

- (void)_sendAdminRequestReply:(BOOL)a3 rejectionReason:(const char *)a4 requestMessage:(id)a5
{
  BOOL v6 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a5;
  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  xpc_dictionary_set_BOOL(reply, "AdminRequest_Reply", v6);
  if (a4 && !v6) {
    xpc_dictionary_set_string(reply, "AdminRequest_RejectionReason", a4);
  }
  char v9 = DPLogHandle_ClientXPC();
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = "Rejected";
    if (v6) {
      uint64_t v10 = "Accepted";
    }
    id v11 = "Success!";
    if (a4) {
      id v11 = a4;
    }
    int v13 = 136315394;
    id v14 = v10;
    __int16 v15 = 2082;
    id v16 = v11;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestReply", "%s: %{public}s", (uint8_t *)&v13, 0x16u);
  }

  xpc_dictionary_get_remote_connection(v7);
  uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v12, reply);
}

- (void)_rejectInjectRequest:(id)a3 state:(id)a4 reason:(const char *)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a4;
  [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:a5 requestMessage:a3];
  char v9 = DPLogHandle_ServiceXPCError();
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = [v8 stateDescription];
    int v11 = 138543618;
    uint64_t v12 = v10;
    __int16 v13 = 2080;
    id v14 = a5;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InjectEnableLogGatheringResultResult_Rejected", "Rejecting inject enable log gathering result request from %{public}@ due reason: %s", (uint8_t *)&v11, 0x16u);
  }
}

- (void)_handleInjectEnableLogGatheringRequestResult:(id)a3 state:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([v7 hasAdminEntitlement] & 1) == 0)
  {
    uint64_t v12 = "Missing required entitlement";
    goto LABEL_9;
  }
  id v8 = +[DRSSystemProfile sharedInstance];
  char v9 = [v8 isInternal];

  if ((v9 & 1) == 0)
  {
    uint64_t v12 = "Device is running non-Internal build";
    goto LABEL_9;
  }
  uint64_t v10 = xpc_dictionary_get_value(v6, "InjectEnableLogGatheringQueryInjectedResult");

  if (!v10)
  {
    uint64_t v12 = "Missing injected result parameter";
    goto LABEL_9;
  }
  unsigned __int8 uint64 = xpc_dictionary_get_uint64(v6, "InjectEnableLogGatheringQueryInjectedResult");
  if ((uint64 & 0xFE) != 0)
  {
    uint64_t v12 = "Injected response is not a valid value";
LABEL_9:
    [(DRSService *)self _rejectInjectRequest:v6 state:v7 reason:v12];
    goto LABEL_10;
  }
  unsigned __int8 v13 = uint64;
  id v14 = [[DRSEnableDataGatheringQuery alloc] initWithXPCDict:v6];
  if (!v14)
  {
    uint64_t v12 = "Malformed query parameters";
    goto LABEL_9;
  }
  uint64_t v15 = v14;
  id v16 = [(DRSService *)self serviceContainer];
  uint64_t v17 = (void *)[v16 newBackgroundContext];

  uint64_t v18 = [(DRSService *)self _cachedMatchingQuery:v15 workingContext:v17];
  if (v18)
  {
    long long v19 = DPLogHandle_CoreData();
    if (os_signpost_enabled(v19))
    {
      __int16 v20 = [(DRSEnableDataGatheringQuery *)v15 debugDescription];
      id v21 = [v18 debugDescription];
      int v26 = 138543618;
      double v27 = v20;
      __int16 v28 = 2114;
      uint64_t v29 = v21;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UpdatingCachedQueryResultFound", "Updating cached result for '%{public}@': %{public}@", (uint8_t *)&v26, 0x16u);
    }
    uint64_t v22 = v18;

    uint64_t v15 = v22;
  }

  [(DRSEnableDataGatheringQuery *)v15 setResponse:v13];
  if ([(DRSEnableDataGatheringQuery *)v15 response] != 1) {
    [(DRSEnableDataGatheringQuery *)v15 setRejectionReason:@"Injected response"];
  }
  if ([(DRSService *)self _persistEnableLogGatheringResult:v15 workingContext:v17])
  {
    uint64_t v23 = DPLogHandle_ServiceXPC();
    if (os_signpost_enabled(v23))
    {
      uint64_t v24 = [v7 stateDescription];
      uint64_t v25 = [(DRSEnableDataGatheringQuery *)v15 debugDescription];
      int v26 = 138543618;
      double v27 = v24;
      __int16 v28 = 2114;
      uint64_t v29 = v25;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InjectEnableLogGatheringResultResult_Accepted", "Accepted inject enable log gathering result request from %{public}@: %{public}@", (uint8_t *)&v26, 0x16u);
    }
    [(DRSService *)self _sendAdminRequestReply:1 rejectionReason:0 requestMessage:v6];
  }
  else
  {
    [(DRSService *)self _rejectInjectRequest:v6 state:v7 reason:"Failed to persist injected result"];
  }

LABEL_10:
}

- (void)_handleCKWorkTriggerRequest:(id)a3 state:(id)a4 transaction:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 hasAdminEntitlement])
  {
    BOOL v11 = xpc_dictionary_get_BOOL(v8, "isExpedited");
    BOOL v12 = xpc_dictionary_get_BOOL(v8, "isAsync");
    unsigned __int8 v13 = DPLogHandle_ServiceXPC();
    if (os_signpost_enabled(v13))
    {
      uint64_t v14 = [v9 stateDescription];
      uint64_t v15 = (void *)v14;
      id v16 = @"NO";
      if (v11) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v14;
      double v27 = v17;
      __int16 v26 = 2112;
      if (v12) {
        id v16 = @"YES";
      }
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKWorkTrigger", "Triggering CK work due to request from %{public}@. Expedited:%@, Async:%@", buf, 0x20u);
    }
    if (v12) {
      [(DRSService *)self _sendAdminRequestReply:1 rejectionReason:0 requestMessage:v8];
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__DRSService__handleCKWorkTriggerRequest_state_transaction___block_invoke;
    v20[3] = &unk_263FC9E48;
    BOOL v23 = v12;
    v20[4] = self;
    id v21 = v8;
    id v22 = v10;
    [(DRSService *)self _runCloudKitUploadWorkSessionWithTransaction:v22 xpcActivity:0 isExpedited:v11 completionBlock:v20];
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v8];
    uint64_t v18 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v18))
    {
      long long v19 = [v9 stateDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = (uint64_t)v19;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKWorkTriggerRejected", "Rejecting CK work trigger from %{public}@ due to missing entitlement", buf, 0xCu);
    }
  }
}

uint64_t __60__DRSService__handleCKWorkTriggerRequest_state_transaction___block_invoke(uint64_t result, uint64_t a2, id a3)
{
  if (!*(unsigned char *)(result + 56))
  {
    uint64_t v4 = result;
    id v5 = *(void **)(result + 32);
    uint64_t v6 = [a3 UTF8String];
    if (v6) {
      id v7 = (const char *)v6;
    }
    else {
      id v7 = "Unknown rejection reason";
    }
    uint64_t v8 = *(void *)(v4 + 40);
    return [v5 _sendAdminRequestReply:a2 rejectionReason:v7 requestMessage:v8];
  }
  return result;
}

- (void)_handleRequestCleanTrigger:(id)a3 state:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v6, "KeepRequestRecords");
    BOOL v9 = xpc_dictionary_get_BOOL(v6, "KeepRequestLogs");
    id v10 = [(DRSService *)self serviceContainer];
    id v28 = 0;
    BOOL v11 = +[DRSRequest cleanRequestRecordsFromPersistentContainer:v10 removeFiles:!v9 removeRecord:!v8 matchingPredicate:0 errorOut:&v28];
    BOOL v12 = v28;

    if (v11)
    {
      unsigned __int8 v13 = DPLogHandle_ServiceXPC();
      if (os_signpost_enabled(v13))
      {
        if (v8) {
          uint64_t v14 = "YES";
        }
        else {
          uint64_t v14 = "NO";
        }
        if (v9) {
          uint64_t v15 = "YES";
        }
        else {
          uint64_t v15 = "NO";
        }
        id v16 = [v7 stateDescription];
        *(_DWORD *)buf = 136446722;
        uint64_t v30 = v14;
        __int16 v31 = 2082;
        uint64_t v32 = v15;
        __int16 v33 = 2114;
        id v34 = v16;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestCleanTrigger_Success", "clean request records with 'KeepRecords' %{public}s ' KeepLogs' %{public}s from %{public}@ succeeded", buf, 0x20u);
      }
      [(DRSService *)self _sendAdminRequestReply:1 rejectionReason:0 requestMessage:v6];
    }
    else
    {
      id v18 = [NSString alloc];
      uint64_t v19 = [v12 localizedDescription];
      __int16 v20 = (void *)v19;
      id v21 = @"Unknown";
      if (v19) {
        id v21 = (__CFString *)v19;
      }
      id v22 = (void *)[v18 initWithFormat:@"Error encountered trying to clean records: %@", v21];

      id v23 = v22;
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, [v23 UTF8String], v6);
      uint64_t v24 = DPLogHandle_ServiceXPCError();
      if (os_signpost_enabled(v24))
      {
        if (v8) {
          uint64_t v25 = "YES";
        }
        else {
          uint64_t v25 = "NO";
        }
        if (v9) {
          __int16 v26 = "YES";
        }
        else {
          __int16 v26 = "NO";
        }
        double v27 = [v7 stateDescription];
        *(_DWORD *)buf = 136446978;
        uint64_t v30 = v25;
        __int16 v31 = 2082;
        uint64_t v32 = v26;
        __int16 v33 = 2114;
        id v34 = v27;
        __int16 v35 = 2114;
        id v36 = v23;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestCleanTrigger_Failed", "Failed to clean request records with 'KeepRecords' %{public}s ' KeepLogs' %{public}s from %{public}@ due reason: %{public}@", buf, 0x2Au);
      }
    }
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v6];
    BOOL v12 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v12))
    {
      uint64_t v17 = [v7 stateDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v17;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestCleanTrigger_Rejected", "Rejecting request to clean request records from %{public}@ due to missing entitlement", buf, 0xCu);
    }
  }
}

- (void)_addCKConfigSettingsToReplyMessage:(id)a3
{
  xpc_object_t xdict = a3;
  uint64_t v4 = [(DRSService *)self ckConfig];
  BOOL v5 = [v4 containerEnvironment] == 1;

  id v6 = [(DRSService *)self ckConfig];
  LOBYTE(v4) = [v6 rapidEnvironment] == 1;

  xpc_dictionary_set_BOOL(xdict, "ContainerEnv", v5);
  xpc_dictionary_set_BOOL(xdict, "RapidEnv", (BOOL)v4);
}

- (void)_replyToCKConfigMessageWithCurrentCKConfig:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = _acceptingAdminReplyMessage(v4);
  id v6 = [(DRSService *)self ckConfig];
  int v7 = [v6 containerEnvironment];

  BOOL v8 = [(DRSService *)self ckConfig];
  int v9 = [v8 rapidEnvironment];

  xpc_dictionary_set_BOOL(v5, "ContainerEnv", v7 == 1);
  xpc_dictionary_set_BOOL(v5, "RapidEnv", v9 == 1);
  id v10 = [(DRSService *)self ckConfig];
  xpc_dictionary_set_BOOL(v5, "OverridesDefault", [v10 overridesDefault]);

  BOOL v11 = DPLogHandle_ClientXPC();
  if (os_signpost_enabled(v11))
  {
    BOOL v12 = "Sandbox";
    if (v7 == 1) {
      unsigned __int8 v13 = "Prod";
    }
    else {
      unsigned __int8 v13 = "Sandbox";
    }
    if (v9 == 1) {
      BOOL v12 = "Prod";
    }
    int v15 = 136446466;
    id v16 = v13;
    __int16 v17 = 2082;
    id v18 = v12;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigRequestReply", "Container environment: %{public}s, RAPID environment: %{public}s", (uint8_t *)&v15, 0x16u);
  }

  xpc_dictionary_get_remote_connection(v4);
  uint64_t v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v14, v5);
}

- (id)_updateCKConfig:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  BOOL v5 = [(DRSService *)self cloudKitQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__DRSService__updateCKConfig___block_invoke;
  block[3] = &unk_263FC97C0;
  block[4] = self;
  id v10 = v4;
  BOOL v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __30__DRSService__updateCKConfig___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) ckConfig];
  uint64_t v3 = +[DRSCloudKitHelper helperForCKConfig:v2];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v3;

  id v6 = [*(id *)(a1 + 32) ckConfigStore];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) ckConfigStore];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v9 + 40);
    char v10 = [v7 saveConfig:v8 errorOut:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);

    if (v10)
    {
      BOOL v11 = DPLogHandle_ServiceXPC();
      if (os_signpost_enabled(v11))
      {
        uint64_t v12 = [*(id *)(a1 + 32) ckConfig];
        unsigned __int8 v13 = [v12 debugDescription];
        *(_DWORD *)buf = 138543362;
        id v18 = v13;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceCKConfigUpdated", "Service CK Config updated to: %{public}@", buf, 0xCu);

LABEL_9:
      }
    }
    else
    {
      BOOL v11 = DPLogHandle_ServiceXPCError();
      if (os_signpost_enabled(v11))
      {
        uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) localizedDescription];
        uint64_t v12 = (void *)v14;
        int v15 = @"Unknown";
        if (v14) {
          int v15 = (__CFString *)v14;
        }
        *(_DWORD *)buf = 138543362;
        id v18 = v15;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceCKConfigUpdate_Failed", "Service CK Config failed to update due to reason: %{public}@", buf, 0xCu);
        goto LABEL_9;
      }
    }
  }
}

- (void)_handleCKConfigUpdate:(id)a3 state:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v6, "ContainerEnv");
    BOOL v9 = xpc_dictionary_get_BOOL(v6, "RapidEnv");
    BOOL v10 = v9;
    if (v8) {
      unsigned __int8 v11 = 1;
    }
    else {
      unsigned __int8 v11 = 2;
    }
    if (v9) {
      unsigned __int8 v12 = 1;
    }
    else {
      unsigned __int8 v12 = 2;
    }
    unsigned __int8 v13 = DPLogHandle_ServiceXPC();
    if (os_signpost_enabled(v13))
    {
      uint64_t v14 = [v7 stateDescription];
      int v15 = (void *)v14;
      id v16 = "Sandbox";
      if (v8) {
        id v17 = "Prod";
      }
      else {
        id v17 = "Sandbox";
      }
      *(_DWORD *)__int16 v31 = 138543874;
      *(void *)&v31[4] = v14;
      *(_WORD *)&v31[12] = 2082;
      *(void *)&v31[14] = v17;
      if (v10) {
        id v16 = "Prod";
      }
      *(_WORD *)&v31[22] = 2082;
      uint64_t v32 = v16;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigUpdate_Status", "Client %{public}@ requesting: Container environment: %{public}s, RAPID environment: %{public}s", v31, 0x20u);
    }
    id v18 = [(DRSService *)self ckConfig];
    if ([v18 containerEnvironment] == v11)
    {
      uint64_t v19 = [(DRSService *)self ckConfig];
      int v20 = [v19 rapidEnvironment];

      if (v20 == v12)
      {
        id v21 = DPLogHandle_ServiceXPC();
        if (os_signpost_enabled(v21))
        {
          id v22 = [v7 stateDescription];
          *(_DWORD *)__int16 v31 = 138543362;
          *(void *)&v31[4] = v22;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigUpdate_AlreadySet", "Config is already what client %{public}@ is asking for", v31, 0xCu);
        }
        [(DRSService *)self _replyToCKConfigMessageWithCurrentCKConfig:v6];
        goto LABEL_31;
      }
    }
    else
    {
    }
    uint64_t v25 = [[DRSCKConfig alloc] initWithContainerEnvironment:v11 rapidEnvironment:v12 overridesDefault:1];
    __int16 v26 = [(DRSService *)self _updateCKConfig:v25];
    double v27 = v26;
    if (v26)
    {
      id v28 = [v26 localizedDescription];
      uint64_t v29 = [v28 UTF8String];
      if (v29) {
        uint64_t v30 = (const char *)v29;
      }
      else {
        uint64_t v30 = "Unknown";
      }
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, v30, v6, *(_OWORD *)v31, *(void *)&v31[16]);
    }
    else
    {
      [(DRSService *)self _replyToCKConfigMessageWithCurrentCKConfig:v6];
    }
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v6];
    id v23 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v23))
    {
      uint64_t v24 = [v7 stateDescription];
      *(_DWORD *)__int16 v31 = 138543362;
      *(void *)&v31[4] = v24;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigUpdate_Rejected", "Rejecting request to update CK config %{public}@ due to missing entitlement", v31, 0xCu);
    }
  }
LABEL_31:
}

- (void)_handleGetCKConfig:(id)a3 state:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  if ([v6 hasAdminEntitlement])
  {
    [(DRSService *)self _replyToCKConfigMessageWithCurrentCKConfig:v7];
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v7];

    id v7 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v7))
    {
      BOOL v8 = [v6 stateDescription];
      int v9 = 138543362;
      BOOL v10 = v8;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetCKConfig_Rejected", "Rejecting request for current CK config %{public}@ due to missing entitlement", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_handleResetCKConfig:(id)a3 state:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    BOOL v8 = +[DRSCKConfig defaultConfig];
    int v9 = [(DRSService *)self _updateCKConfig:v8];

    if (v9)
    {
      id v10 = [v9 localizedDescription];
      uint64_t v11 = [v10 UTF8String];
      if (v11) {
        unsigned __int8 v12 = (const char *)v11;
      }
      else {
        unsigned __int8 v12 = "Unknown";
      }
      [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:v12 requestMessage:v6];
    }
    else
    {
      [(DRSService *)self _replyToCKConfigMessageWithCurrentCKConfig:v6];
    }
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v6];
    unsigned __int8 v13 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v13))
    {
      uint64_t v14 = [v7 stateDescription];
      int v15 = 138543362;
      id v16 = v14;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResetCKConfig_Rejected", "Rejecting request to reset CK config %{public}@ due to missing entitlement", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_handleUploadSchedulingRequest:(id)a3 state:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    [(DRSService *)self _registerPermissiveExpeditedUploadXPCActivity:xpc_dictionary_get_uint64(v6, "delaySeconds")];
    [(DRSService *)self _sendAdminRequestReply:1 rejectionReason:0 requestMessage:v6];
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v6];
    BOOL v8 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v8))
    {
      int v9 = [v7 stateDescription];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadSchedulingRequest_Rejected", "Rejecting request to schedule a more permissive expedited upload from %{public}@ due to missing entitlement", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_handleCancelScheduledUploadRequest:(id)a3 state:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    BOOL v8 = DPLogHandle_PermissiveUploadActivity();
    if (os_signpost_enabled(v8))
    {
      int v9 = [v7 stateDescription];
      int v12 = 138543362;
      unsigned __int8 v13 = v9;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelScheduledUploadRequest", "Cancelling scheduled permissive expedited upload due to request from %{public}@", (uint8_t *)&v12, 0xCu);
    }
    [(DRSService *)self _unregisterPermissiveExpeditedUploadXPCActivity];
    [(DRSService *)self _sendAdminRequestReply:1 rejectionReason:0 requestMessage:v6];
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v6];
    int v10 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v10))
    {
      uint64_t v11 = [v7 stateDescription];
      int v12 = 138543362;
      unsigned __int8 v13 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelScheduledUploadRequest_Rejected", "Rejecting request to cancel scheduled permissive expedited upload from %{public}@ due to missing entitlement", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_sendCurrentIgnoreADGReply:(id)a3 state:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _acceptingAdminReplyMessage(v5);
  id v7 = [(DRSService *)self ignoreAutomatedDeviceGroup];

  if (v7)
  {
    BOOL v8 = [(DRSService *)self ignoreAutomatedDeviceGroup];
    xpc_dictionary_set_BOOL(v6, "IgnoreADGValue", [v8 BOOLValue]);
  }
  int v9 = DPLogHandle_ClientXPC();
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = [(DRSService *)self ignoreAutomatedDeviceGroup];
    uint64_t v11 = (void *)v10;
    int v12 = @"<none>";
    if (v10) {
      int v12 = (__CFString *)v10;
    }
    int v14 = 138543362;
    int v15 = v12;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IgnoreADGRequestReply", "Current value: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  xpc_dictionary_get_remote_connection(v5);
  unsigned __int8 v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v13, v6);
}

- (void)_handleGetIgnoreADG:(id)a3 state:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  if ([v6 hasAdminEntitlement])
  {
    [(DRSService *)self _sendCurrentIgnoreADGReply:v7 state:v6];
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v7];

    id v7 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v7))
    {
      v8[0] = 67109120;
      v8[1] = [v6 pid];
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetIgnoreADG_Rejected", "Rejecting request for current 'Ignore AutomatedDeviceGroup' setting [%d] due to missing entitlement", (uint8_t *)v8, 8u);
    }
  }
}

- (void)_handleSetIgnoreADG:(id)a3 state:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    BOOL v8 = xpc_dictionary_get_value(v6, "IgnoreADGValue");

    if (v8)
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v6, "IgnoreADGValue"));
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(DRSService *)self setIgnoreAutomatedDeviceGroup:v9];
    [(DRSService *)self _sendCurrentIgnoreADGReply:v6 state:v7];
  }
  else
  {
    [(DRSService *)self _sendAdminRequestReply:0 rejectionReason:"Missing required entitlement" requestMessage:v6];
    uint64_t v10 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v10))
    {
      v11[0] = 67109120;
      v11[1] = [v7 pid];
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetIgnoreADG_Rejected", "Rejecting request to update 'Ignore AutomatedDeviceGroup' setting [%d] due to missing entitlement", (uint8_t *)v11, 8u);
    }
  }
}

- (void)handleRequest:(id)a3 state:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)MEMORY[0x21050DCE0]();
  uint64_t v9 = (void *)os_transaction_create();
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "ClientMessageType");
  switch(uint64)
  {
    case 'd':
      [(DRSService *)self _handleDampeningConfigurationGlobalEnablementMessage:v6 state:v7 transaction:v9];
      goto LABEL_6;
    case 'e':
      [(DRSService *)self _handleDampeningConfigurationReset:v6 state:v7 transaction:v9];
      goto LABEL_6;
    case 'f':
      [(DRSService *)self _handleDampeningConfigurationDictMessage:v6 state:v7 transaction:v9];
      goto LABEL_6;
    case 'g':
      [(DRSService *)self _handleCKWorkTriggerRequest:v6 state:v7 transaction:v9];
      goto LABEL_6;
    case 'h':
      [(DRSService *)self _handleInjectEnableLogGatheringRequestResult:v6 state:v7];
      goto LABEL_6;
    case 'i':
      [(DRSService *)self _handleRequestCleanTrigger:v6 state:v7];
      goto LABEL_6;
    case 'j':
      [(DRSService *)self _handleRefreshDampeningConfigMessage:v6 state:v7 transaction:v9];
      goto LABEL_6;
    case 'k':
      [(DRSService *)self _handleCKConfigUpdate:v6 state:v7];
      goto LABEL_6;
    case 'l':
      [(DRSService *)self _handleGetCKConfig:v6 state:v7];
      goto LABEL_6;
    case 'm':
      [(DRSService *)self _handleResetCKConfig:v6 state:v7];
      goto LABEL_6;
    case 'n':
      [(DRSService *)self _handleUploadSchedulingRequest:v6 state:v7];
      goto LABEL_6;
    case 'o':
      [(DRSService *)self _handleCancelScheduledUploadRequest:v6 state:v7];
      goto LABEL_6;
    case 'p':
      [(DRSService *)self _handleGetIgnoreADG:v6 state:v7];
      goto LABEL_6;
    case 'q':
      [(DRSService *)self _handleSetIgnoreADG:v6 state:v7];
      goto LABEL_6;
    default:
      uint64_t v11 = uint64;
      if (uint64 > 5) {
        goto LABEL_22;
      }
      if (((1 << uint64) & 0x36) != 0)
      {
        [(DRSService *)self _handleDRSRequestMessage:v6 state:v7 transaction:v9];
      }
      else if (uint64 == 3)
      {
        [(DRSService *)self _handleEnableLogGatheringRequest:v6 state:v7 transaction:v9];
      }
      else
      {
LABEL_22:
        uint64_t v12 = DPLogHandle_ServiceXPCError();
        if (os_signpost_enabled(v12))
        {
          unsigned __int8 v13 = [v7 stateDescription];
          int v14 = 134349314;
          uint64_t v15 = v11;
          __int16 v16 = 2114;
          uint64_t v17 = v13;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnknownRequest", "Received unknown request %{public}llu from client %{public}@", (uint8_t *)&v14, 0x16u);
        }
      }
LABEL_6:

      return;
  }
}

- (void)_handleNewEntitledConnection:(id)a3 state:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  [(DRSService *)self _waitForDeviceUnlockAndInitializeServiceState];
  BOOL v8 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v8))
  {
    uint64_t v9 = [v6 stateDescription];
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewClientConnection", "New connection from client %{public}@", (uint8_t *)&v10, 0xCu);
  }
  [(DRSService *)self _sendCurrentConfigurationToConnection:v7];
}

- (BOOL)activateService
{
  [(DRSService *)self _configureXPCActivities];
  uint64_t v3 = [(DRSService *)self messageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__DRSService_activateService__block_invoke;
  block[3] = &unk_263FC9990;
  block[4] = self;
  dispatch_sync(v3, block);

  return 1;
}

void __29__DRSService_activateService__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = DPLogHandle_ServiceLifecycle();
  BOOL v4 = os_signpost_enabled(v3);
  if (v2)
  {
    if (v4)
    {
      id v5 = DRSStringForServiceState([*(id *)(a1 + 32) state]);
      int v6 = 138543362;
      id v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RedundantServiceActivation", "Tried to activate while in state: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceActivation", (const char *)&unk_209EEADD1, (uint8_t *)&v6, 2u);
    }

    uint64_t v3 = [*(id *)(a1 + 32) serviceConnection];
    xpc_connection_activate((xpc_connection_t)v3);
  }
}

- (void)deactivateService
{
  if ([(DRSService *)self state] == 2)
  {
    uint64_t v3 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v3))
    {
      __int16 v9 = 0;
      BOOL v4 = "RedundantServiceDeactivation";
      id v5 = "Tried to deactivate already deactivated service";
      int v6 = (uint8_t *)&v9;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v4, v5, v6, 2u);
    }
  }
  else
  {
    self->_state = 2;
    id v7 = [(DRSService *)self serviceConnection];
    xpc_connection_cancel(v7);

    uint64_t v3 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v3))
    {
      __int16 v8 = 0;
      BOOL v4 = "ServiceDeactivated";
      id v5 = (const char *)&unk_209EEADD1;
      int v6 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }
}

- (void)dealloc
{
  [(DRSService *)self deactivateService];
  v3.receiver = self;
  v3.super_class = (Class)DRSService;
  [(DRSService *)&v3 dealloc];
}

- (void)_configureXPCActivities
{
  [(DRSService *)self _configureUploadXPCActivity];
  [(DRSService *)self _configureExpeditedUploadXPCActivity];
  [(DRSService *)self _configureBackstopUploadXPCActivity];

  [(DRSService *)self _configureReportStatsXPCActivity];
}

- (void)_configureUploadXPCActivity
{
  objc_super v3 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfiguringUploadXPCActivity", (const char *)&unk_209EEADD1, buf, 2u);
  }

  BOOL v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __41__DRSService__configureUploadXPCActivity__block_invoke;
  handler[3] = &unk_263FC9968;
  handler[4] = self;
  xpc_activity_register("com.apple.diagnosticpipeline.cloudkit_activity", v4, handler);
}

void __41__DRSService__configureUploadXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  BOOL v4 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    xpc_activity_state_t v6 = state;
    if (state)
    {
      id v7 = DPLogHandle_ServiceLifecycle();
      if (os_signpost_enabled(v7))
      {
        *(_DWORD *)buf = 134217984;
        xpc_activity_state_t v16 = v6;
        __int16 v8 = "CloudKitXPCActivityUnknownState";
        __int16 v9 = "Unknown XPC activity state %ld";
        int v10 = v7;
        uint32_t v11 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      id v7 = DPLogHandle_ServiceLifecycle();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        __int16 v8 = "UploadXPCActivityCheckIn";
        __int16 v9 = (const char *)&unk_209EEADD1;
        int v10 = v7;
        uint32_t v11 = 2;
LABEL_12:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, buf, v11);
      }
    }

    goto LABEL_17;
  }
  [*(id *)(a1 + 32) _waitForDeviceUnlockAndInitializeServiceState];
  uint64_t v12 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudKitUploadXPCActivity", (const char *)&unk_209EEADD1, buf, 2u);
  }

  if ([*(id *)(a1 + 32) isEnabled])
  {
    BOOL should_defer = xpc_activity_should_defer(v3);
    int v14 = *(void **)(a1 + 32);
    if (should_defer)
    {
      [v14 _finishUploadSessionWithActivity:v3 withState:3 isExpedited:0 transaction:v4 completedSuccessfully:0 endResultString:@"Immediate deferral" completionBlock:0];
    }
    else
    {
      [v14 _unregisterPermissiveExpeditedUploadXPCActivity];
      [*(id *)(a1 + 32) _runCloudKitUploadWorkSessionWithTransaction:v4 xpcActivity:v3 isExpedited:0 completionBlock:0];
    }
  }
  else
  {
    [*(id *)(a1 + 32) _finishUploadSessionWithActivity:v3 withState:5 isExpedited:0 transaction:v4 completedSuccessfully:0 endResultString:@"Service is disabled" completionBlock:0];
  }
LABEL_17:
}

- (void)_configureExpeditedUploadXPCActivity
{
  objc_super v3 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfiguringExpeditedUploadXPCActivity", (const char *)&unk_209EEADD1, buf, 2u);
  }

  BOOL v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __50__DRSService__configureExpeditedUploadXPCActivity__block_invoke;
  handler[3] = &unk_263FC9968;
  handler[4] = self;
  xpc_activity_register("com.apple.diagnosticpipeline.cloudkit_expedited_upload", v4, handler);
}

void __50__DRSService__configureExpeditedUploadXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  BOOL v4 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    xpc_activity_state_t v6 = state;
    if (state)
    {
      id v7 = DPLogHandle_ServiceLifecycle();
      if (os_signpost_enabled(v7))
      {
        *(_DWORD *)buf = 134217984;
        xpc_activity_state_t v16 = v6;
        __int16 v8 = "ExpeditedCloudKitXPCActivityUnknownState";
        __int16 v9 = "Unknown XPC activity state %ld";
        int v10 = v7;
        uint32_t v11 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      id v7 = DPLogHandle_ServiceLifecycle();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        __int16 v8 = "ExpeditedUploadXPCActivityCheckIn";
        __int16 v9 = (const char *)&unk_209EEADD1;
        int v10 = v7;
        uint32_t v11 = 2;
LABEL_12:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, buf, v11);
      }
    }

    goto LABEL_17;
  }
  [*(id *)(a1 + 32) _waitForDeviceUnlockAndInitializeServiceState];
  uint64_t v12 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudKitExpeditedUploadXPCActivity", (const char *)&unk_209EEADD1, buf, 2u);
  }

  if ([*(id *)(a1 + 32) isEnabled])
  {
    BOOL should_defer = xpc_activity_should_defer(v3);
    int v14 = *(void **)(a1 + 32);
    if (should_defer)
    {
      [v14 _finishUploadSessionWithActivity:v3 withState:3 isExpedited:1 transaction:v4 completedSuccessfully:0 endResultString:@"Immediate deferral" completionBlock:0];
    }
    else
    {
      [v14 _unregisterPermissiveExpeditedUploadXPCActivity];
      [*(id *)(a1 + 32) _runCloudKitUploadWorkSessionWithTransaction:v4 xpcActivity:v3 isExpedited:1 completionBlock:0];
    }
  }
  else
  {
    [*(id *)(a1 + 32) _finishUploadSessionWithActivity:v3 withState:5 isExpedited:1 transaction:v4 completedSuccessfully:0 endResultString:@"Service is disabled" completionBlock:0];
  }
LABEL_17:
}

- (unsigned)_randomDelaySecWithCap:(unsigned int)a3
{
  return arc4random_uniform(a3 + 1);
}

- (id)_permissiveXPCActivitCriteriaDict:(unsigned int)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82A0], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82C8], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82D0], 1);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x263EF8260], 20971520);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF81F0]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x263EF81A0], a3);

  return v4;
}

- (void)_configurePermissiveActivityCriteria:(id)a3 delaySeconds:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  xpc_activity_state_t v6 = (_xpc_activity_s *)a3;
  id v7 = [(DRSService *)self _permissiveXPCActivitCriteriaDict:v4];
  xpc_activity_set_criteria(v6, v7);

  __int16 v8 = DPLogHandle_PermissiveUploadActivity();
  if (os_signpost_enabled(v8))
  {
    v9[0] = 67240192;
    v9[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UpdatePermissiveActivity", "%{public, name=delaySeconds}u second(s) delay", (uint8_t *)v9, 8u);
  }
}

- (void)_unregisterPermissiveExpeditedUploadXPCActivity
{
  int v2 = DPLogHandle_PermissiveUploadActivity();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelScheduledUploadActivity", (const char *)&unk_209EEADD1, v3, 2u);
  }

  xpc_activity_unregister("com.apple.diagnosticpipeline.cloudkit_permissive_upload");
}

- (void)_registerPermissiveExpeditedUploadXPCActivity:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = DPLogHandle_PermissiveUploadActivity();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v10 = a3;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SchedulingPermissiveExpeditedUploadXPCActivity", "%{public, name=delaySeconds}u second(s) delay", buf, 8u);
  }

  xpc_activity_state_t v6 = (void *)*MEMORY[0x263EF8188];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__DRSService__registerPermissiveExpeditedUploadXPCActivity___block_invoke;
  v7[3] = &unk_263FC9E98;
  v7[4] = self;
  unsigned int v8 = a3;
  xpc_activity_register("com.apple.diagnosticpipeline.cloudkit_permissive_upload", v6, v7);
}

void __60__DRSService__registerPermissiveExpeditedUploadXPCActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  uint64_t v4 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    xpc_activity_state_t v6 = state;
    if (state == 2)
    {
      id v7 = DPLogHandle_PermissiveUploadActivity();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RunPermissiveUploadActivity", (const char *)&unk_209EEADD1, buf, 2u);
      }

      [*(id *)(a1 + 32) _waitForDeviceUnlockAndInitializeServiceState];
      unsigned int v8 = DPLogHandle_ServiceLifecycle();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudKitExpeditedUploadXPCActivitySingleton permissive expedited upload activity", (const char *)&unk_209EEADD1, buf, 2u);
      }

      if ([*(id *)(a1 + 32) isEnabled])
      {
        BOOL should_defer = xpc_activity_should_defer(v3);
        unsigned int v10 = *(void **)(a1 + 32);
        if (should_defer)
        {
          [v10 _finishUploadSessionWithActivity:v3 withState:3 isExpedited:1 transaction:v4 completedSuccessfully:0 endResultString:@"Immediate deferral" completionBlock:0];
        }
        else
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __60__DRSService__registerPermissiveExpeditedUploadXPCActivity___block_invoke_207;
          v16[3] = &unk_263FC9E70;
          v16[4] = v10;
          [v10 _runCloudKitUploadWorkSessionWithTransaction:v4 xpcActivity:v3 isExpedited:1 completionBlock:v16];
        }
      }
      else
      {
        [*(id *)(a1 + 32) _finishUploadSessionWithActivity:v3 withState:5 isExpedited:1 transaction:v4 completedSuccessfully:0 endResultString:@"Service is disabled" completionBlock:0];
        [*(id *)(a1 + 32) _unregisterPermissiveExpeditedUploadXPCActivity];
      }
    }
    else
    {
      uint64_t v15 = DPLogHandle_PermissiveUploadActivity();
      if (os_signpost_enabled(v15))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v18 = v6;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PermissiveCloudKitXPCActivityUnknownState", "Unexpected XPC activity state %ld", buf, 0xCu);
      }
    }
  }
  else
  {
    xpc_object_t v11 = xpc_activity_copy_criteria(v3);
    uint64_t v12 = v11;
    if (v11 && xpc_dictionary_get_count(v11))
    {
      unsigned __int8 v13 = DPLogHandle_PermissiveUploadActivity();
      if (os_signpost_enabled(v13))
      {
        int64_t int64 = xpc_dictionary_get_int64(v12, (const char *)*MEMORY[0x263EF81A0]);
        *(_DWORD *)buf = 134349056;
        int64_t v18 = int64;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PermissiveActivityAlreadyScheduled", "Activity already scheduled with %{public, name=delaySeconds}lld s as a delay cap", buf, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _configurePermissiveActivityCriteria:v3 delaySeconds:*(unsigned int *)(a1 + 40)];
    }
  }
}

uint64_t __60__DRSService__registerPermissiveExpeditedUploadXPCActivity___block_invoke_207(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterPermissiveExpeditedUploadXPCActivity];
}

- (void)_configureReportStatsXPCActivity
{
  objc_super v3 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfiguringReportStatsXPCActivity", (const char *)&unk_209EEADD1, buf, 2u);
  }

  uint64_t v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __46__DRSService__configureReportStatsXPCActivity__block_invoke;
  handler[3] = &unk_263FC9968;
  handler[4] = self;
  xpc_activity_register("com.apple.diagnosticpipeline.cloudkit_report_stats", v4, handler);
}

void __46__DRSService__configureReportStatsXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  uint64_t v4 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    xpc_activity_state_t v6 = state;
    if (state)
    {
      id v7 = DPLogHandle_ServiceLifecycle();
      if (os_signpost_enabled(v7))
      {
        int v20 = 134217984;
        xpc_activity_state_t v21 = v6;
        unsigned int v8 = "CloudKitXPCActivityUnknownState";
        __int16 v9 = "Unknown XPC activity state %ld";
        unsigned int v10 = v7;
        uint32_t v11 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      id v7 = DPLogHandle_ServiceLifecycle();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v20) = 0;
        unsigned int v8 = "ReportStatsXPCActivityCheckIn";
        __int16 v9 = (const char *)&unk_209EEADD1;
        unsigned int v10 = v7;
        uint32_t v11 = 2;
LABEL_12:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, (uint8_t *)&v20, v11);
      }
    }

    goto LABEL_19;
  }
  [*(id *)(a1 + 32) _waitForDeviceUnlockAndInitializeServiceState];
  char v12 = [*(id *)(a1 + 32) isEnabled];
  unsigned __int8 v13 = DPLogHandle_ServiceLifecycle();
  BOOL v14 = os_signpost_enabled(v13);
  if (v12)
  {
    if (v14)
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudKitReportStatsXPCActivity", (const char *)&unk_209EEADD1, (uint8_t *)&v20, 2u);
    }

    BOOL should_defer = xpc_activity_should_defer(v3);
    xpc_activity_state_t v16 = *(void **)(a1 + 32);
    if (!should_defer)
    {
      [v16 _runReportingSessionWithTransaction:v4 xpcActivity:v3];
      goto LABEL_19;
    }
    uint64_t v17 = @"Immediate deferral";
    int64_t v18 = v3;
    uint64_t v19 = 3;
  }
  else
  {
    if (v14)
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudKitReportStatsXPCActivity", "No-op XPC activity since the service is disabled", (uint8_t *)&v20, 2u);
    }

    xpc_activity_state_t v16 = *(void **)(a1 + 32);
    uint64_t v17 = @"Service is disabled";
    int64_t v18 = v3;
    uint64_t v19 = 5;
  }
  [v16 _finishReportingStatsSessionWithActivity:v18 withState:v19 transaction:v4 endResultString:v17];
LABEL_19:
}

+ (id)_currentUploadSession_ON_MOC_QUEUE:(id)a3 errorOut:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  xpc_activity_state_t v6 = +[DRSUploadSessionRecordMO fetchRequest];
  id v34 = 0;
  id v7 = [v5 executeFetchRequest:v6 error:&v34];
  id v8 = v34;

  if (v8)
  {
    __int16 v9 = DPLogHandle_UploadSessionDateError();
    if (os_signpost_enabled(v9))
    {
      uint64_t v10 = [v8 localizedDescription];
      uint32_t v11 = (void *)v10;
      char v12 = @"Unknown";
      if (v10) {
        char v12 = (__CFString *)v10;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadSessionDateMOFetch", "Failed to fetch an upload session managed object due to error: %{public}@", buf, 0xCu);
    }
    if (a4)
    {
      unsigned __int8 v13 = 0;
      *a4 = v8;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (![v7 count])
  {
    double v27 = DPLogHandle_UploadSessionDate();
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadSessionDateFetchMiss", "No cached CK Config", buf, 2u);
    }

    goto LABEL_30;
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    BOOL v14 = DPLogHandle_UploadSessionDateError();
    if (os_signpost_enabled(v14))
    {
      int v15 = [v7 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v37) = v15;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NonUniqueUploadSessionDate", "Found %u dates. Attempting to delete and recover from state.", buf, 8u);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          [v5 deleteObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v18);
    }

    id v29 = 0;
    char v21 = [v5 save:&v29];
    id v22 = v29;
    if ((v21 & 1) == 0)
    {
      id v23 = DPLogHandle_CoreDataError();
      if (os_signpost_enabled(v23))
      {
        uint64_t v24 = [v22 localizedDescription];
        uint64_t v25 = (void *)v24;
        __int16 v26 = @"Unknown";
        if (v24) {
          __int16 v26 = (__CFString *)v24;
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v26;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedToSaveUploadSession", "To save upload session updates due to error: %{public}@", buf, 0xCu);
      }
      if (a4) {
        *a4 = v22;
      }
    }

LABEL_30:
    unsigned __int8 v13 = 0;
    goto LABEL_31;
  }
  unsigned __int8 v13 = [v7 firstObject];
LABEL_31:

  return v13;
}

+ (id)previousUploadSessionDateFromContainer:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__2;
  __int16 v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  int v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  id v7 = (void *)[v6 newBackgroundContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __62__DRSService_previousUploadSessionDateFromContainer_errorOut___block_invoke;
  v11[3] = &unk_263FC9EC0;
  id v15 = a1;
  id v8 = v7;
  id v12 = v8;
  unsigned __int8 v13 = &v16;
  BOOL v14 = &v22;
  [v8 performBlockAndWait:v11];
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __62__DRSService_previousUploadSessionDateFromContainer_errorOut___block_invoke(void *a1)
{
  int v2 = (void *)a1[7];
  uint64_t v3 = a1[4];
  id v12 = 0;
  uint64_t v4 = objc_msgSend(v2, "_currentUploadSession_ON_MOC_QUEUE:errorOut:", v3, &v12);
  id v5 = v12;
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  uint64_t v9 = [v4 sessionDate];
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint32_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

+ (BOOL)updateUploadSessionDateFromContainer:(id)a3 toDate:(id)a4 errorOut:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v10 = (void *)[v8 newBackgroundContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__DRSService_updateUploadSessionDateFromContainer_toDate_errorOut___block_invoke;
  v15[3] = &unk_263FC9EE8;
  id v19 = a1;
  id v11 = v10;
  id v16 = v11;
  uint64_t v18 = &v20;
  id v12 = v9;
  id v17 = v12;
  [v11 performBlockAndWait:v15];
  if (a5) {
    *a5 = (id) v21[5];
  }
  BOOL v13 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __67__DRSService_updateUploadSessionDateFromContainer_toDate_errorOut___block_invoke(uint64_t *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = (void *)a1[7];
  uint64_t v3 = a1[4];
  id v16 = 0;
  objc_msgSend(v2, "_currentUploadSession_ON_MOC_QUEUE:errorOut:", v3, &v16);
  uint64_t v4 = (DRSUploadSessionRecordMO *)objc_claimAutoreleasedReturnValue();
  id v5 = v16;
  id v6 = v16;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
  }
  if (!v4) {
    uint64_t v4 = [[DRSUploadSessionRecordMO alloc] initWithContext:a1[4]];
  }
  if (a1[5]) {
    -[DRSUploadSessionRecordMO setSessionDate:](v4, "setSessionDate:");
  }
  else {
    [(id)a1[4] deleteObject:v4];
  }
  id v7 = (void *)a1[4];
  id v15 = 0;
  char v8 = [v7 save:&v15];
  id v9 = v15;
  id v10 = v15;
  if ((v8 & 1) == 0)
  {
    id v11 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v11))
    {
      uint64_t v12 = [v10 localizedDescription];
      BOOL v13 = (void *)v12;
      BOOL v14 = @"Unknown";
      if (v12) {
        BOOL v14 = (__CFString *)v12;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v14;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedToSaveUpdatedUploadSession", "To save upload session updates due to error: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v9);
  }
}

+ (double)backstopInterval
{
  return 1209600.0;
}

- (BOOL)updateUploadSessionDate:(id *)a3
{
  id v5 = objc_opt_class();
  id v6 = [(DRSService *)self serviceContainer];
  id v7 = [MEMORY[0x263EFF910] date];
  LOBYTE(a3) = [v5 updateUploadSessionDateFromContainer:v6 toDate:v7 errorOut:a3];

  return (char)a3;
}

- (BOOL)clearUploadSessionDate:(id *)a3
{
  id v5 = objc_opt_class();
  id v6 = [(DRSService *)self serviceContainer];
  LOBYTE(a3) = [v5 updateUploadSessionDateFromContainer:v6 toDate:0 errorOut:a3];

  return (char)a3;
}

- (BOOL)shouldRunBackstopUpload:(id *)a3
{
  id v5 = objc_opt_class();
  id v6 = [(DRSService *)self serviceContainer];
  id v7 = [MEMORY[0x263EFF910] date];
  LOBYTE(a3) = [v5 shouldRunBackstopUpload:v6 currentDate:v7 errorOut:a3];

  return (char)a3;
}

+ (BOOL)shouldRunBackstopUpload:(id)a3 currentDate:(id)a4 errorOut:(id *)a5
{
  id v8 = a4;
  id v17 = 0;
  id v9 = [a1 previousUploadSessionDateFromContainer:a3 errorOut:&v17];
  id v10 = v17;
  id v11 = v10;
  if (v10)
  {
    BOOL v12 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    [v8 timeIntervalSinceDate:v9];
    double v14 = v13;
    [a1 backstopInterval];
    BOOL v12 = v14 > v15;
  }

  return v12;
}

- (BOOL)_syncConfigurationToDisk:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v14 = 0;
  char v4 = DRSSetConfigurationDictionary(@"/private/var/mobile/Library/DiagnosticPipeline/Configuration", a3, &v14);
  id v5 = v14;
  if (v4)
  {
    id v6 = DPLogHandle_DRSConfig();
    if (os_signpost_enabled(v6))
    {
      id v7 = [(DRSService *)self configDict];
      uint64_t v8 = [v7 description];
      id v9 = (void *)v8;
      id v10 = @"-";
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      *(_DWORD *)buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceConfigSave", "Saved DRSService config to disk: %{public}@", buf, 0xCu);

LABEL_10:
    }
  }
  else
  {
    id v6 = DPLogHandle_DRSConfigError();
    if (os_signpost_enabled(v6))
    {
      uint64_t v11 = [v5 localizedDescription];
      id v7 = (void *)v11;
      BOOL v12 = @"Unknown";
      if (v11) {
        BOOL v12 = (__CFString *)v11;
      }
      *(_DWORD *)buf = 138543362;
      id v16 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceConfigSaveFailure", "Failed to save new config to disk due to error: %{public}@", buf, 0xCu);
      goto LABEL_10;
    }
  }

  return v4;
}

- (void)_getConfiguration
{
  uint64_t v3 = [(DRSService *)self configurationSyncQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__DRSService__getConfiguration__block_invoke;
  block[3] = &unk_263FC9990;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __31__DRSService__getConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v8 = 0;
  int v2 = DRSGetConfigurationDictionary(@"/private/var/mobile/Library/DiagnosticPipeline/Configuration", &v8);
  id v3 = v8;
  if (v3)
  {
    char v4 = DPLogHandle_DRSConfigError();
    if (os_signpost_enabled(v4))
    {
      uint64_t v5 = [v3 localizedDescription];
      id v6 = (void *)v5;
      id v7 = @"Unknown";
      if (v5) {
        id v7 = (__CFString *)v5;
      }
      *(_DWORD *)buf = 138543362;
      id v10 = v7;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceConfigGetFailure", "Failed to get DRSService config due to error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), v2);
    [*(id *)(a1 + 32) _adjustStateForNewConfiguration];
  }
}

- (void)_updateConfigDict:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(DRSService *)self _syncConfigurationToDisk:v5])
  {
    objc_storeStrong((id *)&self->_configDict, a3);
    [(DRSService *)self _adjustStateForNewConfiguration];
    id v6 = DPLogHandle_DRSConfig();
    if (os_signpost_enabled(v6))
    {
      uint64_t v7 = [v5 description];
      id v8 = (void *)v7;
      id v9 = @"<none>";
      if (v7) {
        id v9 = (__CFString *)v7;
      }
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UpdatedDRSServiceConfig", "New config: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v6 = DPLogHandle_DRSConfig();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedToUpdateDRSServiceConfig", (const char *)&unk_209EEADD1, (uint8_t *)&v10, 2u);
    }
  }
}

- (void)_adjustStateForNewConfiguration
{
  int v2 = [(DRSService *)self configDict];
  id v5 = [v2 objectForKeyedSubscript:kDRSIgnoreAutomatedDeviceGroupKey];

  if (v5 && ([v5 BOOLValue] & 1) != 0)
  {
    id v3 = +[DRSSystemProfile sharedInstance];
    [v3 setAllowsAutomatedDeviceGroupOverride:1];

    char v4 = +[DRSSystemProfile sharedInstance];
    [v4 setOverridingAutomatedDeviceGroup:0];
  }
  else
  {
    char v4 = +[DRSSystemProfile sharedInstance];
    [v4 setAllowsAutomatedDeviceGroupOverride:0];
  }
}

- (NSNumber)ignoreAutomatedDeviceGroup
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  id v3 = [(DRSService *)self configurationSyncQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__DRSService_ignoreAutomatedDeviceGroup__block_invoke;
  v6[3] = &unk_263FC9F10;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

void __40__DRSService_ignoreAutomatedDeviceGroup__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) configDict];
  uint64_t v2 = [v5 objectForKeyedSubscript:kDRSIgnoreAutomatedDeviceGroupKey];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setIgnoreAutomatedDeviceGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(DRSService *)self configurationSyncQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__DRSService_setIgnoreAutomatedDeviceGroup___block_invoke;
  v7[3] = &unk_263FC9D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __44__DRSService_setIgnoreAutomatedDeviceGroup___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) configDict];
  id v3 = (id)[v2 mutableCopy];

  if (*(void *)(a1 + 40))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v3) {
        id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:kDRSIgnoreAutomatedDeviceGroupKey];
      [*(id *)(a1 + 32) _updateConfigDict:v3];
      id v4 = DPLogHandle_DRSConfigError();
      if (os_signpost_enabled(v4))
      {
        id v5 = *(__CFString **)(a1 + 40);
        if (!v5) {
          id v5 = @"<none>";
        }
        int v7 = 138543362;
        id v8 = v5;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceSetIgnoreAutomatedDeviceGroup", "Set 'ignoreAutomatedDeviceGroup' to %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      id v4 = DPLogHandle_DRSConfigError();
      if (os_signpost_enabled(v4))
      {
        id v6 = [*(id *)(a1 + 40) description];
        int v7 = 138543362;
        id v8 = v6;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceSetIgnoreAutomatedDeviceGroupFailure", "Cannot set 'ignoreAutomatedDeviceGroup' to unexpected non-NSNumber value: %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  else
  {
    [v3 removeObjectForKey:kDRSIgnoreAutomatedDeviceGroupKey];
    if (![v3 count])
    {

      id v3 = 0;
    }
    [*(id *)(a1 + 32) _updateConfigDict:v3];
  }
}

- (unint64_t)maxSingleSessionUploadSizeInBytes
{
  return self->_maxSingleSessionUploadSizeInBytes;
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (OS_dispatch_queue)cloudKitQueue
{
  return self->_cloudKitQueue;
}

- (OS_dispatch_queue)uploadRequestLookupQueue
{
  return self->_uploadRequestLookupQueue;
}

- (OS_dispatch_queue)postReceiptWorkQueue
{
  return self->_postReceiptWorkQueue;
}

- (OS_dispatch_queue)configurationSyncQueue
{
  return self->_configurationSyncQueue;
}

- (OS_xpc_object)serviceConnection
{
  return self->_serviceConnection;
}

- (OS_dispatch_semaphore)serviceDeactivatedSem
{
  return self->_serviceDeactivatedSem;
}

- (unsigned)state
{
  return self->_state;
}

- (NSMutableDictionary)connectionToState
{
  return self->_connectionToState;
}

- (NSPersistentContainer)serviceContainer
{
  return self->_serviceContainer;
}

- (DRSDampeningManager)dampeningManager
{
  return self->_dampeningManager;
}

- (DRSTaskingManager)taskingManager
{
  return self->_taskingManager;
}

- (DRSCloudKitHelper)ckHelper
{
  return self->_ckHelper;
}

- (DRSCKConfigStore)ckConfigStore
{
  return self->_ckConfigStore;
}

- (DRSCKConfig)ckConfig
{
  return self->_ckConfig;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (NSMutableDictionary)configDict
{
  return self->_configDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDict, 0);
  objc_storeStrong((id *)&self->_ckConfig, 0);
  objc_storeStrong((id *)&self->_ckConfigStore, 0);
  objc_storeStrong((id *)&self->_ckHelper, 0);
  objc_storeStrong((id *)&self->_taskingManager, 0);
  objc_storeStrong((id *)&self->_dampeningManager, 0);
  objc_storeStrong((id *)&self->_serviceContainer, 0);
  objc_storeStrong((id *)&self->_connectionToState, 0);
  objc_storeStrong((id *)&self->_serviceDeactivatedSem, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_configurationSyncQueue, 0);
  objc_storeStrong((id *)&self->_postReceiptWorkQueue, 0);
  objc_storeStrong((id *)&self->_uploadRequestLookupQueue, 0);
  objc_storeStrong((id *)&self->_cloudKitQueue, 0);

  objc_storeStrong((id *)&self->_messageQueue, 0);
}

void __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_209E70000, log, OS_LOG_TYPE_FAULT, "FATAL ERROR: Unable to create dampening manager for service.", v1, 2u);
}

void __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_2(void *a1)
{
  id v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_209E70000, v2, v3, "Failed to initalize CK config store due to error: %{public}@. Falling back to default settings", v4, v5, v6, v7, 2u);
}

@end