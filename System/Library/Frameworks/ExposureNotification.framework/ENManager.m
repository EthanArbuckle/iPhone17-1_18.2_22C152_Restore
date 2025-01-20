@interface ENManager
+ (ENAuthorizationStatus)authorizationStatus;
- (BOOL)_setActivationPropertiesOnRequest:(id)a3 error:(id *)a4;
- (BOOL)analyticsEnabled;
- (BOOL)exposureNotificationEnabled;
- (BOOL)exposureNotificationPaused;
- (ENActivityHandler)activityHandler;
- (ENDiagnosisKeysAvailableHandler)diagnosisKeysAvailableHandler;
- (ENManager)init;
- (ENStatus)exposureNotificationStatus;
- (NSProgress)detectExposuresWithConfiguration:(ENExposureConfiguration *)configuration completionHandler:(ENDetectExposuresHandler)completionHandler;
- (NSProgress)detectExposuresWithConfiguration:(ENExposureConfiguration *)configuration diagnosisKeyURLs:(NSArray *)diagnosisKeyURLs completionHandler:(ENDetectExposuresHandler)completionHandler;
- (NSProgress)getExposureInfoFromSummary:(ENExposureDetectionSummary *)summary userExplanation:(NSString *)userExplanation completionHandler:(ENGetExposureInfoHandler)completionHandler;
- (NSProgress)getExposureWindowsFromSummary:(ENExposureDetectionSummary *)summary completionHandler:(ENGetExposureWindowsHandler)completionHandler;
- (OS_xpc_object)testListenerEndpoint;
- (dispatch_block_t)invalidationHandler;
- (dispatch_queue_t)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)statusChangedHandler;
- (unsigned)clientID;
- (void)_activateInitial:(BOOL)a3 completionHandler:(id)a4;
- (void)_checkRemoteDialogueRequirementForRequestType:(int64_t)a3 completionHandler:(id)a4;
- (void)_entitlementCheckUpdate:(id)a3;
- (void)_entitlementCheckWithCompletion:(id)a3;
- (void)_getDetectionHistoryFilesCompleted:(id)a3 completion:(id)a4;
- (void)_getDetectionHistorySessionsCompleted:(id)a3 completion:(id)a4;
- (void)_getDiagnosisKeysReply:(id)a3 completionHandler:(id)a4;
- (void)_getExposureInfoCompleted:(id)a3 completionHandler:(id)a4;
- (void)_getExposureWindowsCompleted:(id)a3 completionHandler:(id)a4;
- (void)_getExposureWindowsFromIndex:(unint64_t)a3 completionHandler:(id)a4;
- (void)_handleRemotePresentationRequest:(id)a3 completionHandler:(id)a4;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_populateDetectionHistoryChecks:(id)a3 forSessions:(id)a4 sessionIndex:(unint64_t)a5 completion:(id)a6;
- (void)_preAuthorizeDiagnosisKeysWithSessionID:(id)a3 completionHandler:(id)a4;
- (void)_reactivate;
- (void)_setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 region:(id)a4 metadata:(id)a5 completionHandler:(id)a6;
- (void)_tccCheckWithCompletion:(id)a3;
- (void)_xpcHandleActivity:(id)a3;
- (void)_xpcHandlePreAuthorizedDiagnosisKeysAvailable:(id)a3;
- (void)_xpcHandleStatusChanged:(id)a3 initial:(BOOL)a4;
- (void)_xpcReceivedEvent:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)activateWithCompletionHandler:(ENErrorHandler)completionHandler;
- (void)activeRegionWithCompletion:(id)a3;
- (void)agencyConfigurationForLocale:(id)a3 withCompletion:(id)a4;
- (void)allAgencyConfigurationsForLocale:(id)a3 withCompletion:(id)a4;
- (void)allRegionConfigurationsWithCompletion:(id)a3;
- (void)allRegionServerConfigurationsWithCompletion:(id)a3;
- (void)clearDeveloperServerConfigurationWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteExposureDetectionHistoryWithCompletionHandler:(id)a3;
- (void)diagnosticControl:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)didEnterLegalConsentPage:(id)a3 completionHandler:(id)a4;
- (void)downloadAndDetectExposure:(BOOL)a3 completionHandler:(id)a4;
- (void)exposureDetectionActivate:(id)a3 completion:(id)a4;
- (void)exposureDetectionAddKeys:(id)a3 completion:(id)a4;
- (void)exposureDetectionFileActivate:(id)a3 completion:(id)a4;
- (void)exposureDetectionFileAdd:(id)a3 signatureURL:(id)a4 completion:(id)a5;
- (void)exposureDetectionFileFinishWithCompletion:(id)a3;
- (void)exposureDetectionFinishWithCompletion:(id)a3;
- (void)exposureDetectionGetExposureInfoCompleted:(id)a3 completion:(id)a4;
- (void)exposureDetectionGetExposureInfoWithMaximumCount:(unint64_t)a3 completion:(id)a4;
- (void)exposureNotificationGetStatusForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)fetchConfigurationsForRegion:(id)a3 fetchReason:(unsigned int)a4 completion:(id)a5;
- (void)fetchConfigurationsForRegion:(id)a3 forceServerFetch:(BOOL)a4 completion:(id)a5;
- (void)fetchSubdivisionsForCountry:(id)a3 completion:(id)a4;
- (void)fetchTestMetadataForSession:(id)a3 completionHandler:(id)a4;
- (void)finishTestVerificationForSession:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6;
- (void)getAllEntitiesWithCompletion:(id)a3;
- (void)getDataVaultSizeWithCompletion:(id)a3;
- (void)getDetectionHistoryChecksWithCompletion:(id)a3;
- (void)getDetectionHistoryFilesForSession:(id)a3 completion:(id)a4;
- (void)getDetectionHistorySessionsWithCompletion:(id)a3;
- (void)getDiagnosisKeysForTesting:(BOOL)a3 forceRefresh:(BOOL)a4 completionHandler:(id)a5;
- (void)getDiagnosisKeysWithCompletionHandler:(ENGetDiagnosisKeysHandler)completionHandler;
- (void)getEntitiesWithCompletion:(id)a3;
- (void)getInfoForKey:(id)a3 completion:(id)a4;
- (void)getLastExposureNotificationWithCompletion:(id)a3;
- (void)getPreAuthorizeDiagnosisKeysEnabledForRegion:(id)a3 completionHandler:(id)a4;
- (void)getRegionHistoryEnabledWithCompletionHandler:(id)a3;
- (void)getRegionMonitorEnabledWithCompletionHandler:(id)a3;
- (void)getRegionVisitHistoryWithCompletion:(id)a3;
- (void)getTestDiagnosisKeysWithCompletionHandler:(ENGetDiagnosisKeysHandler)completionHandler;
- (void)getTravelStatusEnabledForRegion:(id)a3 completionHandler:(id)a4;
- (void)getTravelStatusEnabledWithCompletionHandler:(id)a3;
- (void)getUserTraveledWithCompletionHandler:(ENGetUserTraveledHandler)completionHandler;
- (void)invalidate;
- (void)onboardingDidStartForRegion:(id)a3 withSource:(id)a4 completion:(id)a5;
- (void)pauseWithExpiration:(double)a3 completionHandler:(id)a4;
- (void)preAuthorizeDiagnosisKeysWithCompletionHandler:(ENErrorHandler)completionHandler;
- (void)regionConfigurationWithCompletion:(id)a3;
- (void)regionHistoryWithCompletion:(id)a3;
- (void)regionServerConfigurationWithCompletion:(id)a3;
- (void)remotePresentationRequestDidComplete:(id)a3 completion:(id)a4;
- (void)requestPreAuthorizedDiagnosisKeysWithCompletionHandler:(ENErrorHandler)completionHandler;
- (void)resetAllDataWithCompletionHandler:(id)a3;
- (void)resetDataWithFlags:(unsigned int)a3 completionHandler:(id)a4;
- (void)sendChaffTestVerificationRequestForRegion:(id)a3 completionHandler:(id)a4;
- (void)setActiveEntityWithAppBundleID:(id)a3 completion:(id)a4;
- (void)setActiveEntityWithRegion:(id)a3 completion:(id)a4;
- (void)setActiveRegion:(id)a3 completion:(id)a4;
- (void)setActivityHandler:(ENActivityHandler)activityHandler;
- (void)setAutomaticRegionSwitchEnabled:(BOOL)a3 completion:(id)a4;
- (void)setAvailabilityAlertEnabled:(BOOL)a3 completion:(id)a4;
- (void)setClientID:(unsigned int)a3;
- (void)setCurrentActiveApp:(id)a3 completion:(id)a4;
- (void)setDeveloperServerConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setDiagnosisKeysAvailableHandler:(ENDiagnosisKeysAvailableHandler)diagnosisKeysAvailableHandler;
- (void)setDispatchQueue:(dispatch_queue_t)dispatchQueue;
- (void)setExposureNotificationEnabled:(BOOL)enabled completionHandler:(ENErrorHandler)completionHandler;
- (void)setPaused:(BOOL)a3 completionHandler:(id)a4;
- (void)setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 region:(id)a4 completionHandler:(id)a5;
- (void)setRegionConsent:(int64_t)a3 completionHandler:(id)a4;
- (void)setRegionConsent:(int64_t)a3 region:(id)a4 completionHandler:(id)a5;
- (void)setRegionHistoryEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setRegionUserConsent:(id)a3 region:(id)a4 completionHandler:(id)a5;
- (void)setStatusChangedHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)setTravelStatusEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setTravelStatusEnabled:(BOOL)a3 region:(id)a4 completionHandler:(id)a5;
- (void)setWeeklySummaryAlertEnabled:(BOOL)a3 completion:(id)a4;
- (void)showBuddyForRegion:(id)a3 completionHandler:(id)a4;
- (void)startSelfReportWebSession:(id)a3 completionHandler:(id)a4;
- (void)startTestVerificationSessionWithCode:(id)a3 region:(id)a4 completionHandler:(id)a5;
- (void)triggerNotificationOfType:(int)a3 appBundleIdentifier:(id)a4 classificationName:(id)a5 interval:(id)a6 region:(id)a7 completion:(id)a8;
- (void)verifyTextMessage:(id)a3 completionHandler:(id)a4;
@end

@implementation ENManager

- (id)description
{
  return [(ENManager *)self descriptionWithLevel:50];
}

- (void)activateWithCompletionHandler:(ENErrorHandler)completionHandler
{
  id v4 = completionHandler;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__ENManager_activateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)getEntitiesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__ENManager_getEntitiesWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateInitial:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    v7 = (void *)xpc_copy_entitlement_for_self();
    if (v7)
    {
      self->_isTestEntitlement = 1;
      if (gLogCategory_ENManager <= 50 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "mTyp", 10);
  id v17 = 0;
  BOOL v9 = [(ENManager *)self _setActivationPropertiesOnRequest:v8 error:&v17];
  id v10 = v17;
  if (v9)
  {
    v11 = [(ENManager *)self _ensureXPCStarted];
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __48__ENManager__activateInitial_completionHandler___block_invoke;
    handler[3] = &unk_264244CE0;
    BOOL v16 = v4;
    handler[4] = self;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v11, v8, dispatchQueue, handler);
  }
  else
  {
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      v13 = CUPrintNSError();
      LogPrintF_safe();
    }
    (*((void (**)(id, id))v6 + 2))(v6, v10);
  }
}

void __39__ENManager_getEntitiesWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 150);
  v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  BOOL v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __39__ENManager_getEntitiesWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  BOOL v4 = self->_xpcCnx;
  if (!v4)
  {
    v5 = self->_testListenerEndpoint;
    id v6 = v5;
    if (v5)
    {
      mach_service = xpc_connection_create_from_endpoint(v5);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.ExposureNotification", (dispatch_queue_t)self->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __30__ENManager__ensureXPCStarted__block_invoke;
    v9[3] = &unk_264244D28;
    v9[4] = self;
    BOOL v4 = mach_service;
    id v10 = v4;
    xpc_connection_set_event_handler(v4, v9);
    xpc_connection_activate(v4);
  }

  return v4;
}

- (BOOL)_setActivationPropertiesOnRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] mainBundle];
  id v6 = [v5 infoDictionary];

  if (v6)
  {
    CFStringGetTypeID();
    v7 = CFDictionaryGetTypedValue();
    id v8 = v4;
    BOOL v9 = (const char *)[v7 UTF8String];
    if (v9) {
      xpc_dictionary_set_string(v8, "aiRegion", v9);
    }

    int Int64Ranged = CFDictionaryGetInt64Ranged();
    xpc_dictionary_set_int64(v4, "apiV", Int64Ranged);
  }
  char v11 = dyld_program_sdk_at_least();
  xpc_dictionary_set_BOOL(v4, "preV2", v11 != 1);

  return 1;
}

void __48__ENManager__activateInitial_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = CUXPCDecodeNSErrorIfNeeded();
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _entitlementCheckUpdate:v3];
  }
  if (!v3) {
    [*(id *)(a1 + 32) _xpcHandleStatusChanged:v4 initial:*(unsigned __int8 *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_xpcHandleStatusChanged:(id)a3 initial:(BOOL)a4
{
  id v6 = a3;
  BOOL analyticsEnabled = self->_analyticsEnabled;
  BOOL v34 = self->_analyticsEnabled;
  if (v6)
  {
    CUXPCDecodeBool();
    id v8 = 0;
    if (v8
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      v30 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    id v8 = 0;
    BOOL v34 = 0;
  }
  BOOL v9 = v34;
  BOOL v10 = v34 != analyticsEnabled;
  if (v34 != analyticsEnabled)
  {
    if (gLogCategory_ENManager <= 30)
    {
      if (gLogCategory_ENManager != -1)
      {
LABEL_10:
        if (analyticsEnabled) {
          char v11 = "yes";
        }
        else {
          char v11 = "no";
        }
        if (v9) {
          v12 = "yes";
        }
        else {
          v12 = "no";
        }
        v30 = (void *)v11;
        v31 = v12;
        LogPrintF_safe();
        goto LABEL_18;
      }
      if (_LogCategory_Initialize())
      {
        BOOL v9 = v34;
        goto LABEL_10;
      }
    }
LABEL_18:
    [(ENManager *)self willChangeValueForKey:@"analyticsEnabled", v30, v31];
    self->_BOOL analyticsEnabled = v34;
    [(ENManager *)self didChangeValueForKey:@"analyticsEnabled"];
  }
  BOOL exposureNotificationEnabled = self->_exposureNotificationEnabled;
  BOOL v33 = self->_exposureNotificationEnabled;

  if (v6)
  {
    CUXPCDecodeBool();
    id v14 = 0;
    if (v14
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      v30 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    id v14 = 0;
    BOOL v33 = 0;
  }
  BOOL v15 = v33;
  if (v33 != exposureNotificationEnabled)
  {
    if (gLogCategory_ENManager <= 30)
    {
      if (gLogCategory_ENManager != -1)
      {
LABEL_28:
        if (exposureNotificationEnabled) {
          BOOL v16 = "yes";
        }
        else {
          BOOL v16 = "no";
        }
        if (v15) {
          id v17 = "yes";
        }
        else {
          id v17 = "no";
        }
        v30 = (void *)v16;
        v31 = v17;
        LogPrintF_safe();
        goto LABEL_36;
      }
      if (_LogCategory_Initialize())
      {
        BOOL v15 = v33;
        goto LABEL_28;
      }
    }
LABEL_36:
    [(ENManager *)self willChangeValueForKey:@"exposureNotificationEnabled", v30, v31];
    self->_BOOL exposureNotificationEnabled = v33;
    [(ENManager *)self didChangeValueForKey:@"exposureNotificationEnabled"];
    BOOL v10 = 1;
  }
  BOOL exposureNotificationPaused = self->_exposureNotificationPaused;
  BOOL v32 = self->_exposureNotificationPaused;

  if (v6)
  {
    CUXPCDecodeBool();
    id v19 = 0;
    if (v19
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      v30 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    id v19 = 0;
    BOOL v32 = 0;
  }
  BOOL v20 = v32;
  if (v32 != exposureNotificationPaused)
  {
    if (gLogCategory_ENManager <= 30)
    {
      if (gLogCategory_ENManager != -1)
      {
LABEL_46:
        if (exposureNotificationPaused) {
          v21 = "yes";
        }
        else {
          v21 = "no";
        }
        if (v20) {
          v22 = "yes";
        }
        else {
          v22 = "no";
        }
        v30 = (void *)v21;
        v31 = v22;
        LogPrintF_safe();
        goto LABEL_54;
      }
      if (_LogCategory_Initialize())
      {
        BOOL v20 = v32;
        goto LABEL_46;
      }
    }
LABEL_54:
    [(ENManager *)self willChangeValueForKey:@"exposureNotificationPaused", v30, v31];
    self->_BOOL exposureNotificationPaused = v32;
    [(ENManager *)self didChangeValueForKey:@"exposureNotificationPaused"];
    BOOL v10 = 1;
  }
  unint64_t exposureNotificationStatus = self->_exposureNotificationStatus;

  if (v6)
  {
    if (CUXPCDecodeSInt64RangedEx() == 6) {
      unint64_t v24 = 0;
    }
    else {
      unint64_t v24 = exposureNotificationStatus;
    }
    id v25 = 0;
    if (v25
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      v30 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    id v25 = 0;
    unint64_t v24 = 0;
  }
  if (v24 != exposureNotificationStatus)
  {
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    {
      if (exposureNotificationStatus > 6) {
        v26 = "?";
      }
      else {
        v26 = (&off_264245240)[exposureNotificationStatus];
      }
      if (v24 > 6) {
        v27 = "?";
      }
      else {
        v27 = (&off_264245240)[v24];
      }
      v30 = (void *)v26;
      v31 = v27;
      LogPrintF_safe();
    }
    [(ENManager *)self willChangeValueForKey:@"exposureNotificationStatus", v30, v31];
    self->_unint64_t exposureNotificationStatus = v24;
    [(ENManager *)self didChangeValueForKey:@"exposureNotificationStatus"];
    BOOL v10 = 1;
  }
  if (v10 && !a4)
  {
    uint64_t v28 = MEMORY[0x2166BC8A0](self->_statusChangedHandler);
    v29 = (void *)v28;
    if (v28) {
      (*(void (**)(uint64_t))(v28 + 16))(v28);
    }
  }
}

- (void)_entitlementCheckUpdate:(id)a3
{
  id v3 = a3;
  id v7 = v3;
  if (v3)
  {
    id v4 = [v3 domain];
    if ([v4 isEqual:@"ENErrorDomain"])
    {
      uint64_t v5 = [v7 code];

      if (v5 == 3)
      {
        pthread_mutex_lock(&gENManagerLock);
        gENManagerEntitledState = 5;
        pthread_mutex_unlock(&gENManagerLock);
        if (gLogCategory_ENManager > 30 || gLogCategory_ENManager == -1 && !_LogCategory_Initialize()) {
          goto LABEL_19;
        }
LABEL_9:
        LogPrintF_safe();
        goto LABEL_19;
      }
    }
    else
    {
    }
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    pthread_mutex_lock(&gENManagerLock);
    gENManagerEntitledState = 6;
    pthread_mutex_unlock(&gENManagerLock);
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
      goto LABEL_9;
    }
  }
LABEL_19:
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__ENManager_invalidate__block_invoke;
  block[3] = &unk_2642446B0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (ENManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)ENManager;
  xpc_object_t v2 = [(ENManager *)&v5 init];
  if (v2)
  {
    v2->_clientID = CUXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    id v3 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_diagnosisKeysAvailableHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_activityHandler, 0);
  objc_storeStrong((id *)&self->_remotePresentationController, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_exposureWindows, 0);

  objc_storeStrong((id *)&self->_detectionSession, 0);
}

- (BOOL)exposureNotificationEnabled
{
  return self->_exposureNotificationEnabled;
}

- (void)setDispatchQueue:(dispatch_queue_t)dispatchQueue
{
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateDone)
  {
    xpc_object_t v2 = (ENManager *)FatalErrorF();
    [(ENManager *)v2 descriptionWithLevel:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ENManager;
    [(ENManager *)&v5 dealloc];
  }
}

- (id)descriptionWithLevel:(int)a3
{
  SEL v3 = NSPrintF();

  return v3;
}

void *__30__ENManager__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[5] == *(void *)(a1 + 40)) {
    return (void *)[result _xpcReceivedEvent:a2];
  }
  return result;
}

void __39__ENManager_getEntitiesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v12 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    objc_super v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5)
    {
      id v6 = (void *)MEMORY[0x263EFFA08];
      uint64_t v7 = objc_opt_class();
      id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
      uint64_t v9 = [v5 objectForKeyedSubscript:@"acEn"];
      if (v9)
      {
        BOOL v10 = (void *)v9;
        id v40 = 0;
        char v11 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v40];
        id v12 = v40;
        v13 = [v5 objectForKeyedSubscript:@"auEn"];

        if (v13)
        {
          id v37 = v3;
          id v39 = v12;
          id v14 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v8 fromData:v13 error:&v39];
          id v15 = v39;

          uint64_t v36 = [v14 firstObject];

          BOOL v16 = [v5 objectForKeyedSubscript:@"avaEn"];

          if (v16)
          {
            id v17 = v8;
            v18 = v11;
            uint64_t v19 = a1;
            v38[1] = v15;
            BOOL v20 = v17;
            v21 = objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClasses:fromData:error:");
            id v22 = v15;

            v23 = [v21 firstObject];

            unint64_t v24 = [v5 objectForKeyedSubscript:@"tnEn"];

            if (v24)
            {
              v38[0] = v22;
              id v25 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v24 error:v38];
              id v26 = v38[0];

              v27 = *(void (**)(void))(*(void *)(v19 + 32) + 16);
              char v11 = v18;
              uint64_t v28 = (void *)v36;
              v27();
              id v22 = v26;
            }
            else
            {
              uint64_t v35 = *(void *)(v19 + 32);
              id v25 = ENErrorF(16);
              (*(void (**)(uint64_t, void, void, void, void, void *))(v35 + 16))(v35, 0, 0, 0, 0, v25);
              char v11 = v18;
              uint64_t v28 = (void *)v36;
            }

            id v15 = v22;
            id v8 = v20;
          }
          else
          {
            uint64_t v34 = *(void *)(a1 + 32);
            unint64_t v24 = ENErrorF(16);
            (*(void (**)(uint64_t, void, void, void, void, void *))(v34 + 16))(v34, 0, 0, 0, 0, v24);
            uint64_t v28 = (void *)v36;
          }

          id v12 = v15;
          id v3 = v37;
        }
        else
        {
          uint64_t v33 = *(void *)(a1 + 32);
          uint64_t v28 = ENErrorF(16);
          (*(void (**)(uint64_t, void, void, void, void, void *))(v33 + 16))(v33, 0, 0, 0, 0, v28);
        }
      }
      else
      {
        uint64_t v31 = *(void *)(a1 + 32);
        BOOL v32 = ENErrorF(16);
        (*(void (**)(uint64_t, void, void, void, void, void *))(v31 + 16))(v31, 0, 0, 0, 0, v32);

        id v12 = 0;
      }
    }
    else
    {
      uint64_t v29 = *(void *)(a1 + 32);
      v30 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void, void, void, void *))(v29 + 16))(v29, 0, 0, 0, 0, v30);

      id v12 = 0;
    }
  }
}

uint64_t __23__ENManager_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 32) = 1;
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v3 = *(_xpc_connection_s **)(*(void *)(v2 + 32) + 40);
    if (v3) {
      xpc_connection_cancel(v3);
    }
    uint64_t v4 = *(void **)(v2 + 32);
    return [v4 _invalidated];
  }
  return result;
}

- (void)_xpcReceivedEvent:(id)a3
{
  id v11 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    [(ENManager *)self _xpcReceivedMessage:v11];
  }
  else if (v11 == (id)MEMORY[0x263EF86A0])
  {
    [(ENManager *)self _interrupted];
  }
  else if (v11 == (id)MEMORY[0x263EF86A8])
  {
    if (!self->_invalidateCalled
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    [(ENManager *)self _invalidated];
  }
  else
  {
    uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
    objc_super v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      ENErrorF(1);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v7 = v6;

    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintNSError();
      BOOL v10 = CUPrintXPC();
      LogPrintF_safe();
    }
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    uint64_t v9 = MEMORY[0x2166BC8A0](self->_invalidationHandler, a2);
    id activityHandler = self->_activityHandler;
    self->_id activityHandler = 0;

    id diagnosisKeysAvailableHandler = self->_diagnosisKeysAvailableHandler;
    self->_id diagnosisKeysAvailableHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id statusChangedHandler = self->_statusChangedHandler;
    self->_id statusChangedHandler = 0;

    uint64_t v8 = v9;
    if (v9)
    {
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(v9 + 16))(v9);
      uint64_t v8 = v9;
    }
    self->_invalidateDone = 1;
    if (gLogCategory_ENManager <= 30)
    {
      if (gLogCategory_ENManager != -1 || (v7 = _LogCategory_Initialize(), uint64_t v8 = v9, v7))
      {
        uint64_t v7 = LogPrintF_safe();
        uint64_t v8 = v9;
      }
    }
    MEMORY[0x270F9A758](v7, v8);
  }
}

void __43__ENManager_activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 8) || *(unsigned char *)(v2 + 32)) && (ENErrorF(10), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (id)v3;
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintNSError();
      LogPrintF_safe();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _activateInitial:1 completionHandler:v5];
  }
}

+ (ENAuthorizationStatus)authorizationStatus
{
  int v2 = TCCAccessPreflight();
  if (!v2) {
    return 3;
  }
  if (v2 != 1) {
    return (unint64_t)(TCCAccessRestricted() != 0);
  }
  if (TCCAccessRestricted()) {
    return 1;
  }
  return 2;
}

- (void)_reactivate
{
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }

  [(ENManager *)self _activateInitial:0 completionHandler:&__block_literal_global_0];
}

uint64_t __24__ENManager__reactivate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if (gLogCategory__ENManager <= 90)
    {
      id v6 = v2;
      if (gLogCategory__ENManager != -1 || (id v2 = (id)_LogCategory_Initialize(), v3 = v6, v2))
      {
        uint64_t v5 = CUPrintNSError();
        LogPrintF_safe();

LABEL_8:
        id v3 = v6;
      }
    }
  }
  else if (gLogCategory_ENManager <= 30)
  {
    id v6 = 0;
    if (gLogCategory_ENManager != -1 || (id v2 = (id)_LogCategory_Initialize(), v3 = 0, v2))
    {
      id v2 = (id)LogPrintF_safe();
      goto LABEL_8;
    }
  }

  return MEMORY[0x270F9A758](v2, v3);
}

- (void)_interrupted
{
  if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  [(ENManager *)self _xpcHandleStatusChanged:0 initial:0];
  if (self->_activateCalled)
  {
    [(ENManager *)self _reactivate];
  }
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_ENManager <= 30
    && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  self->_invalidateCalled = 1;
  [(ENExposureDetectionClientSession *)self->_detectionSession invalidate];
  detectionSession = self->_detectionSession;
  self->_detectionSession = 0;

  xpcCnx = self->_xpcCnx;
  if (xpcCnx) {
    xpc_connection_cancel(xpcCnx);
  }

  [(ENManager *)self _invalidated];
}

- (void)_entitlementCheckWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  if (self->_exposureNotificationStatus == 4 && !self->_isTestEntitlement) {
    goto LABEL_15;
  }
  pthread_mutex_lock(&gENManagerLock);
  int v5 = gENManagerEntitledState;
  pthread_mutex_unlock(&gENManagerLock);
  if (v5 == 5)
  {
    id v6 = ENErrorF(3);
    v4[2](v4, v6);

    goto LABEL_12;
  }
  if (v5 == 6)
  {
    v4[2](v4, 0);
  }
  else
  {
LABEL_15:
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "mTyp", 13);
    uint64_t v8 = [(ENManager *)self _ensureXPCStarted];
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __45__ENManager__entitlementCheckWithCompletion___block_invoke;
    handler[3] = &unk_264244D50;
    void handler[4] = self;
    id v11 = v4;
    xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, handler);
  }
LABEL_12:
}

void __45__ENManager__entitlementCheckWithCompletion___block_invoke(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _entitlementCheckUpdate:v2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getUserTraveledWithCompletionHandler:(ENGetUserTraveledHandler)completionHandler
{
  ENGetUserTraveledHandler v4 = completionHandler;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_264244DA0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _tccCheckWithCompletion:v4];
}

void __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke_2(uint64_t a1, size_t count)
{
  if (count)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
  else
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 15);
    ENGetUserTraveledHandler v4 = [*(id *)(a1 + 32) _ensureXPCStarted];
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke_3;
    handler[3] = &unk_264244D78;
    id v8 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v4, v3, v5, handler);
  }
}

void __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_object_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    xpc_dictionary_get_BOOL(xdict, "userTraveled");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_tccCheckWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__ENManager__tccCheckWithCompletion___block_invoke;
  v6[3] = &unk_264244DA0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ENManager *)self _entitlementCheckWithCompletion:v6];
}

void __37__ENManager__tccCheckWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "mTyp", 70);
    id v5 = [*(id *)(a1 + 32) _ensureXPCStarted];
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __37__ENManager__tccCheckWithCompletion___block_invoke_2;
    handler[3] = &unk_264244D78;
    id v8 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v5, v4, v6, handler);
  }
}

void __37__ENManager__tccCheckWithCompletion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v5 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v5, "mTyp");
  switch(int64)
  {
    case 12:
      int64_t int64 = [(ENManager *)self _xpcHandleStatusChanged:v5 initial:0];
      break;
    case 24:
      int64_t int64 = [(ENManager *)self _xpcHandlePreAuthorizedDiagnosisKeysAvailable:v5];
      break;
    case 19:
      int64_t int64 = [(ENManager *)self _xpcHandleActivity:v5];
      break;
    default:
      if (gLogCategory__ENManager <= 90)
      {
        if (gLogCategory__ENManager != -1 || (int64_t int64 = _LogCategory_Initialize(), int64)) {
          int64_t int64 = LogPrintF_safe();
        }
      }
      break;
  }

  MEMORY[0x270F9A790](int64);
}

- (void)_xpcHandleActivity:(id)a3
{
  uint64_t int64 = xpc_dictionary_get_uint64(a3, "actF");
  id v5 = (void (**)(void, void))MEMORY[0x2166BC8A0](self->_activityHandler);
  if (v5)
  {
    id v6 = v5;
    v5[2](v5, uint64);
    id v5 = (void (**)(void, void))v6;
  }
}

- (void)_xpcHandlePreAuthorizedDiagnosisKeysAvailable:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))MEMORY[0x2166BC8A0](self->_diagnosisKeysAvailableHandler);
  if (v5)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    BOOL v16 = __Block_byref_object_copy__2;
    id v17 = __Block_byref_object_dispose__2;
    id v18 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__ENManager__xpcHandlePreAuthorizedDiagnosisKeysAvailable___block_invoke;
    v12[3] = &unk_264244568;
    v12[4] = &v13;
    id v6 = (void (**)(void))MEMORY[0x2166BC8A0](v12);
    uint64_t v7 = xpc_dictionary_get_value(v4, "tekA");
    id v8 = (void *)v7;
    if (v7 && MEMORY[0x2166BCD00](v7) == MEMORY[0x263EF86D8])
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __59__ENManager__xpcHandlePreAuthorizedDiagnosisKeysAvailable___block_invoke_2;
      applier[3] = &unk_264244840;
      applier[4] = v9;
      applier[5] = &v13;
      xpc_array_apply(v8, applier);
      if (!v14[5])
      {
        if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
        {
          [v9 count];
          LogPrintF_safe();
        }
        ((void (**)(void, id))v5)[2](v5, v9);
      }
    }
    else
    {
      uint64_t v10 = ENErrorF(15);
      id v9 = (id)v14[5];
      v14[5] = v10;
    }

    v6[2](v6);
    _Block_object_dispose(&v13, 8);
  }
}

void __59__ENManager__xpcHandlePreAuthorizedDiagnosisKeysAvailable___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && gLogCategory__ENManager <= 90
    && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
  }
}

BOOL __59__ENManager__xpcHandlePreAuthorizedDiagnosisKeysAvailable___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    id v5 = [ENTemporaryExposureKey alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    uint64_t v7 = [(ENTemporaryExposureKey *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENNestedErrorF(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 2);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (void)setExposureNotificationEnabled:(BOOL)enabled completionHandler:(ENErrorHandler)completionHandler
{
  ENErrorHandler v6 = completionHandler;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke;
  block[3] = &unk_264244DF0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = enabled;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke_2;
  v4[3] = &unk_264244DC8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 48);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _tccCheckWithCompletion:v4];
}

void __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
  else
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 11);
    xpc_dictionary_set_BOOL(v3, "enbd", *(unsigned char *)(a1 + 48));
    id v4 = [*(id *)(a1 + 32) _ensureXPCStarted];
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(NSObject **)(v5 + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke_3;
    v8[3] = &unk_264244D50;
    v8[4] = v5;
    id v9 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v4, v3, v6, v8);
  }
}

void __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  xpc_object_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    [*(id *)(a1 + 32) _xpcHandleStatusChanged:v4 initial:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setPaused:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ENManager_setPaused_completionHandler___block_invoke;
  block[3] = &unk_264244DF0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __41__ENManager_setPaused_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 14);
  xpc_dictionary_set_BOOL(v2, "paus", *(unsigned char *)(a1 + 48));
  xpc_object_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__ENManager_setPaused_completionHandler___block_invoke_2;
  v6[3] = &unk_264244D50;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

void __41__ENManager_setPaused_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  xpc_object_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    [*(id *)(a1 + 32) _xpcHandleStatusChanged:v4 initial:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pauseWithExpiration:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    id v9 = CUPrintDurationDouble();
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ENManager_pauseWithExpiration_completionHandler___block_invoke;
  block[3] = &unk_264244750;
  double v12 = a3;
  block[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __51__ENManager_pauseWithExpiration_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 14);
  xpc_dictionary_set_BOOL(v2, "paus", 1);
  xpc_dictionary_set_double(v2, "dura", *(double *)(a1 + 48));
  xpc_object_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__ENManager_pauseWithExpiration_completionHandler___block_invoke_2;
  v6[3] = &unk_264244D50;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

void __51__ENManager_pauseWithExpiration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  xpc_object_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    [*(id *)(a1 + 32) _xpcHandleStatusChanged:v4 initial:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getPreAuthorizeDiagnosisKeysEnabledForRegion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__ENManager_getPreAuthorizeDiagnosisKeysEnabledForRegion_completionHandler___block_invoke;
  block[3] = &unk_264244E18;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __76__ENManager_getPreAuthorizeDiagnosisKeysEnabledForRegion_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 210);
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v11];
  id v5 = v11;
  if (v4)
  {
    id v6 = v4;
    xpc_dictionary_set_data(v2, "regionData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
    id v7 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v8 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __76__ENManager_getPreAuthorizeDiagnosisKeysEnabledForRegion_completionHandler___block_invoke_2;
    v9[3] = &unk_264244D78;
    id v10 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v7, v2, v8, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __76__ENManager_getPreAuthorizeDiagnosisKeysEnabledForRegion_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    xpc_dictionary_get_BOOL(xdict, "enbd");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 region:(id)a4 completionHandler:(id)a5
{
}

- (void)_setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 region:(id)a4 metadata:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (gLogCategory_ENManager <= 30)
  {
    if (gLogCategory_ENManager != -1 || _LogCategory_Initialize()) {
      LogPrintF_safe();
    }
    if (gLogCategory_ENManager <= 10 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__ENManager__setPreAuthorizeDiagnosisKeysEnabled_region_metadata_completionHandler___block_invoke;
  block[3] = &unk_264244E40;
  BOOL v22 = a3;
  id v18 = v11;
  id v19 = v10;
  BOOL v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(dispatchQueue, block);
}

void __84__ENManager__setPreAuthorizeDiagnosisKeysEnabled_region_metadata_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 211);
  xpc_dictionary_set_BOOL(v2, "enbd", *(unsigned char *)(a1 + 64));
  if (*(void *)(a1 + 32)) {
    xpc_dictionary_set_cf_object();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v11];
  id v5 = v11;
  if (v4)
  {
    id v6 = v4;
    xpc_dictionary_set_data(v2, "regionData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
    id v7 = [*(id *)(a1 + 48) _ensureXPCStarted];
    id v8 = *(NSObject **)(*(void *)(a1 + 48) + 80);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __84__ENManager__setPreAuthorizeDiagnosisKeysEnabled_region_metadata_completionHandler___block_invoke_2;
    v9[3] = &unk_264244D78;
    id v10 = *(id *)(a1 + 56);
    xpc_connection_send_message_with_reply(v7, v2, v8, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __84__ENManager__setPreAuthorizeDiagnosisKeysEnabled_region_metadata_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRegionHistoryEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ENManager_getRegionHistoryEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __58__ENManager_getRegionHistoryEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 56);
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __58__ENManager_getRegionHistoryEnabledWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __58__ENManager_getRegionHistoryEnabledWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    xpc_dictionary_get_BOOL(xdict, "enbd");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRegionHistoryEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ENManager_setRegionHistoryEnabled_completionHandler___block_invoke;
  block[3] = &unk_264244DF0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __55__ENManager_setRegionHistoryEnabled_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 57);
  xpc_dictionary_set_BOOL(v2, "enbd", *(unsigned char *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __55__ENManager_setRegionHistoryEnabled_completionHandler___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __55__ENManager_setRegionHistoryEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRegionMonitorEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ENManager_getRegionMonitorEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __58__ENManager_getRegionMonitorEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 61);
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __58__ENManager_getRegionMonitorEnabledWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __58__ENManager_getRegionMonitorEnabledWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    xpc_dictionary_get_BOOL(xdict, "enbd");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTravelStatusEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ENManager_getTravelStatusEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __57__ENManager_getTravelStatusEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 17);
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__ENManager_getTravelStatusEnabledWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __57__ENManager_getTravelStatusEnabledWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    xpc_dictionary_get_BOOL(xdict, "enbd");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTravelStatusEnabledForRegion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ENManager_getTravelStatusEnabledForRegion_completionHandler___block_invoke;
  block[3] = &unk_264244E18;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __63__ENManager_getTravelStatusEnabledForRegion_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 17);
  uint64_t v3 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__ENManager_getTravelStatusEnabledForRegion_completionHandler___block_invoke_2;
    v8[3] = &unk_264244D78;
    id v9 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v6, v2, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __63__ENManager_getTravelStatusEnabledForRegion_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3) {
    xpc_dictionary_get_BOOL(xdict, "enbd");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setTravelStatusEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ENManager_setTravelStatusEnabled_completionHandler___block_invoke;
  block[3] = &unk_264244DF0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __54__ENManager_setTravelStatusEnabled_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 18);
  xpc_dictionary_set_BOOL(v2, "enbd", *(unsigned char *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  BOOL v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __54__ENManager_setTravelStatusEnabled_completionHandler___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __54__ENManager_setTravelStatusEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setTravelStatusEnabled:(BOOL)a3 region:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ENManager_setTravelStatusEnabled_region_completionHandler___block_invoke;
  block[3] = &unk_264244E68;
  BOOL v17 = a3;
  id v15 = self;
  id v16 = v9;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, block);
}

void __61__ENManager_setTravelStatusEnabled_region_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 18);
  xpc_dictionary_set_BOOL(v2, "enbd", *(unsigned char *)(a1 + 56));
  uint64_t v3 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61__ENManager_setTravelStatusEnabled_region_completionHandler___block_invoke_2;
    v8[3] = &unk_264244D78;
    id v9 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v6, v2, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __61__ENManager_setTravelStatusEnabled_region_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSProgress)detectExposuresWithConfiguration:(ENExposureConfiguration *)configuration completionHandler:(ENDetectExposuresHandler)completionHandler
{
  return [(ENManager *)self detectExposuresWithConfiguration:configuration diagnosisKeyURLs:MEMORY[0x263EFFA68] completionHandler:completionHandler];
}

- (NSProgress)detectExposuresWithConfiguration:(ENExposureConfiguration *)configuration diagnosisKeyURLs:(NSArray *)diagnosisKeyURLs completionHandler:(ENDetectExposuresHandler)completionHandler
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = configuration;
  id v9 = diagnosisKeyURLs;
  ENDetectExposuresHandler v10 = completionHandler;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    [(NSArray *)v9 count];
    LogPrintF_safe();
  }
  id v11 = objc_alloc_init(ENExposureDetectionClientSession);
  [(ENExposureDetectionClientSession *)v11 setCompletionHandler:v10];
  [(ENExposureDetectionClientSession *)v11 setConfiguration:v8];
  [(ENExposureDetectionClientSession *)v11 setDiagnosisKeyURLs:v9];
  [(ENExposureDetectionClientSession *)v11 setDispatchQueue:self->_dispatchQueue];
  [(ENExposureDetectionClientSession *)v11 setManager:self];
  id v12 = objc_alloc(MEMORY[0x263F08AB8]);
  id v18 = @"ENProgressOwnerKey";
  v19[0] = self;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v14 = (void *)[v12 initWithParent:0 userInfo:v13];

  [(ENExposureDetectionClientSession *)v11 setProgress:v14];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__ENManager_detectExposuresWithConfiguration_diagnosisKeyURLs_completionHandler___block_invoke;
  block[3] = &unk_264244E90;
  void block[4] = self;
  void block[5] = v11;
  dispatch_async(dispatchQueue, block);

  return (NSProgress *)v14;
}

uint64_t __81__ENManager_detectExposuresWithConfiguration_diagnosisKeyURLs_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16)
    && gLogCategory_ENManager <= 30
    && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  BOOL v4 = *(void **)(a1 + 40);

  return [v4 activate];
}

- (NSProgress)getExposureInfoFromSummary:(ENExposureDetectionSummary *)summary userExplanation:(NSString *)userExplanation completionHandler:(ENGetExposureInfoHandler)completionHandler
{
  id v7 = userExplanation;
  id v8 = completionHandler;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ENManager_getExposureInfoFromSummary_userExplanation_completionHandler___block_invoke;
  block[3] = &unk_264244728;
  id v15 = v7;
  id v16 = self;
  id v17 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
  id v12 = objc_alloc_init(MEMORY[0x263F08AB8]);

  return (NSProgress *)v12;
}

void __74__ENManager_getExposureInfoFromSummary_userExplanation_completionHandler___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 43);
  xpc_dictionary_set_string(v2, "auEx", (const char *)[a1[4] utf8ValueSafe]);
  uint64_t v3 = [a1[5] _ensureXPCStarted];
  id v4 = a1[5];
  id v5 = *((void *)v4 + 10);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__ENManager_getExposureInfoFromSummary_userExplanation_completionHandler___block_invoke_2;
  v6[3] = &unk_264244D50;
  v6[4] = v4;
  id v7 = a1[6];
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

uint64_t __74__ENManager_getExposureInfoFromSummary_userExplanation_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getExposureInfoCompleted:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)_getExposureInfoCompleted:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  unint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__ENManager__getExposureInfoCompleted_completionHandler___block_invoke;
  v17[3] = &unk_264244EB8;
  id v19 = &v20;
  id v8 = v7;
  id v18 = v8;
  id v9 = (void (**)(void))MEMORY[0x2166BC8A0](v17);
  uint64_t v10 = CUXPCDecodeNSErrorIfNeeded();
  id v11 = (void *)v21[5];
  v21[5] = v10;

  if (!v21[5])
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v13 = xpc_dictionary_get_array(v6, "exIA");
    id v14 = v13;
    if (!v13
      || (v16[0] = MEMORY[0x263EF8330],
          v16[1] = 3221225472,
          v16[2] = __57__ENManager__getExposureInfoCompleted_completionHandler___block_invoke_2,
          v16[3] = &unk_264244840,
          v16[4] = v12,
          v16[5] = &v20,
          xpc_array_apply(v13, v16),
          !v21[5]))
    {
      (*((void (**)(id, id, void))v8 + 2))(v8, v12, 0);
      [(ENExposureDetectionClientSession *)self->_detectionSession invalidate];
      detectionSession = self->_detectionSession;
      self->_detectionSession = 0;
    }
  }
  v9[2](v9);

  _Block_object_dispose(&v20, 8);
}

uint64_t __57__ENManager__getExposureInfoCompleted_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

BOOL __57__ENManager__getExposureInfoCompleted_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    id v5 = [ENExposureInfo alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    id v7 = [(ENExposureInfo *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENErrorF(12);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (NSProgress)getExposureWindowsFromSummary:(ENExposureDetectionSummary *)summary completionHandler:(ENGetExposureWindowsHandler)completionHandler
{
  id v5 = completionHandler;
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__ENManager_getExposureWindowsFromSummary_completionHandler___block_invoke;
  v10[3] = &unk_264244688;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v10);
  id v8 = objc_alloc_init(MEMORY[0x263F08AB8]);

  return (NSProgress *)v8;
}

uint64_t __61__ENManager_getExposureWindowsFromSummary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 _getExposureWindowsFromIndex:0 completionHandler:v5];
}

- (void)_getExposureWindowsFromIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "mTyp", 44);
  xpc_dictionary_set_uint64(v7, "expWndIdx", a3);
  id v8 = [(ENManager *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__ENManager__getExposureWindowsFromIndex_completionHandler___block_invoke;
  v11[3] = &unk_264244D50;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, v11);
}

uint64_t __60__ENManager__getExposureWindowsFromIndex_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getExposureWindowsCompleted:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)_getExposureWindowsCompleted:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __60__ENManager__getExposureWindowsCompleted_completionHandler___block_invoke;
  v23[3] = &unk_264244EE0;
  id v25 = &v26;
  id v8 = v7;
  v23[4] = self;
  id v24 = v8;
  id v9 = (void (**)(void))MEMORY[0x2166BC8A0](v23);
  uint64_t v10 = CUXPCDecodeNSErrorIfNeeded();
  id v11 = (void *)v27[5];
  v27[5] = v10;

  if (!v27[5])
  {
    if (self->_invalidateCalled)
    {
      uint64_t v19 = ENErrorF(6);
      uint64_t v20 = (void *)v27[5];
      v27[5] = v19;
    }
    else
    {
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      v22[3] = 0;
      if (!self->_exposureWindows)
      {
        id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        exposureWindows = self->_exposureWindows;
        self->_exposureWindows = v12;
      }
      uint64_t v14 = xpc_dictionary_get_array(v6, "expWndA");
      id v15 = v14;
      if (!v14) {
        goto LABEL_7;
      }
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __60__ENManager__getExposureWindowsCompleted_completionHandler___block_invoke_2;
      v21[3] = &unk_264244F08;
      v21[4] = self;
      v21[5] = &v26;
      v21[6] = v22;
      xpc_array_apply(v14, v21);
      if (!v27[5])
      {
LABEL_7:
        uint64_t int64 = xpc_dictionary_get_uint64(v6, "expWndIdx");
        if (uint64)
        {
          [(ENManager *)self _getExposureWindowsFromIndex:uint64 completionHandler:v8];
        }
        else
        {
          (*((void (**)(id, NSMutableArray *))v8 + 2))(v8, self->_exposureWindows);
          id v17 = self->_exposureWindows;
          self->_exposureWindows = 0;

          [(ENExposureDetectionClientSession *)self->_detectionSession invalidate];
          detectionSession = self->_detectionSession;
          self->_detectionSession = 0;
        }
      }

      _Block_object_dispose(v22, 8);
    }
  }
  v9[2](v9);

  _Block_object_dispose(&v26, 8);
}

void __60__ENManager__getExposureWindowsCompleted_completionHandler___block_invoke(void *a1)
{
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v2 = a1[4];
    uint64_t v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;

    [*(id *)(a1[4] + 16) invalidate];
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;
  }
}

BOOL __60__ENManager__getExposureWindowsCompleted_completionHandler___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    uint64_t v5 = [ENExposureWindow alloc];
    uint64_t v6 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v6 + 40);
    id v7 = [(ENExposureWindow *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1[4] + 24) addObject:v7];
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
    else
    {
      uint64_t v13 = ENErrorF(12);
      uint64_t v14 = *(void *)(a1[5] + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(a1[5] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (void)preAuthorizeDiagnosisKeysWithCompletionHandler:(ENErrorHandler)completionHandler
{
  id v4 = completionHandler;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__ENManager_preAuthorizeDiagnosisKeysWithCompletionHandler___block_invoke;
  v6[3] = &unk_264244F58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ENManager *)self _checkRemoteDialogueRequirementForRequestType:3 completionHandler:v6];
}

void __60__ENManager_preAuthorizeDiagnosisKeysWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
    v10();
    goto LABEL_4;
  }
  if (!v5)
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  id v7 = v5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__ENManager_preAuthorizeDiagnosisKeysWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_264244F30;
  BOOL v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v12 = v7;
  id v13 = v9;
  v11[4] = *(void *)(a1 + 32);
  [v8 _handleRemotePresentationRequest:v7 completionHandler:v11];

LABEL_4:
}

void __60__ENManager_preAuthorizeDiagnosisKeysWithCompletionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) receiptId];
    objc_msgSend(v2, "_preAuthorizeDiagnosisKeysWithSessionID:completionHandler:");
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    ENErrorF(1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

- (void)_preAuthorizeDiagnosisKeysWithSessionID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ENManager__preAuthorizeDiagnosisKeysWithSessionID_completionHandler___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __71__ENManager__preAuthorizeDiagnosisKeysWithSessionID_completionHandler___block_invoke(id *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 16);
  *(void *)uuid = 0;
  uint64_t v8 = 0;
  [a1[4] getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v2, "rpsid", uuid);
  uint64_t v3 = [a1[5] _ensureXPCStarted];
  id v4 = *((void *)a1[5] + 10);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__ENManager__preAuthorizeDiagnosisKeysWithSessionID_completionHandler___block_invoke_2;
  v5[3] = &unk_264244D78;
  id v6 = a1[6];
  xpc_connection_send_message_with_reply(v3, v2, v4, v5);
}

void __71__ENManager__preAuthorizeDiagnosisKeysWithSessionID_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_checkRemoteDialogueRequirementForRequestType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke;
  block[3] = &unk_264244750;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke_2;
  v5[3] = &unk_264244F80;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  void v5[4] = *(void *)(a1 + 32);
  [v2 _tccCheckWithCompletion:v5];
}

void __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke_2(uint64_t a1, size_t count)
{
  if (count)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
  else
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 212);
    xpc_dictionary_set_int64(v3, "rprt", *(void *)(a1 + 48));
    uint64_t v4 = [*(id *)(a1 + 32) _ensureXPCStarted];
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke_3;
    handler[3] = &unk_264244D78;
    id v8 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v4, v3, v5, handler);
  }
}

void __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v7 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v3, "rpn"))
    {
      uint64_t v5 = objc_opt_class();
      id v8 = 0;
      id v6 = ENXPCDecodeSecureObject(v3, "rpr", v5, &v8);
      id v7 = v8;
      if (!v6
        && gLogCategory__ENManager <= 90
        && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v7 = 0;
    }
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)didEnterLegalConsentPage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ENManager_didEnterLegalConsentPage_completionHandler___block_invoke;
  block[3] = &unk_264244E18;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __56__ENManager_didEnterLegalConsentPage_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 219);
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = 0;
  uint64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v11];
  id v5 = v11;
  if (v4)
  {
    id v6 = v4;
    xpc_dictionary_set_data(v2, "regionData", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
    id v7 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v8 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__ENManager_didEnterLegalConsentPage_completionHandler___block_invoke_2;
    v9[3] = &unk_264244D78;
    id v10 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v7, v2, v8, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __56__ENManager_didEnterLegalConsentPage_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleRemotePresentationRequest:(id)a3 completionHandler:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  remotePresentationController = self->_remotePresentationController;
  if (remotePresentationController
    || (ENUICreateRemotePresentationController(),
        id v8 = (ENUIRemotePresentationController *)objc_claimAutoreleasedReturnValue(),
        id v9 = self->_remotePresentationController,
        self->_remotePresentationController = v8,
        v9,
        (remotePresentationController = self->_remotePresentationController) != 0))
  {
    [(ENUIRemotePresentationController *)remotePresentationController presentWithPresentationRequest:v12 completion:v6];
  }
  else
  {
    id v10 = ENErrorF(11);
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      id v11 = CUPrintNSError();
      LogPrintF_safe();
    }
    v6[2](v6, 0, v10);
  }
}

- (void)requestPreAuthorizedDiagnosisKeysWithCompletionHandler:(ENErrorHandler)completionHandler
{
  id v4 = completionHandler;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_264244DA0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _tccCheckWithCompletion:v4];
}

void __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
  else
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 23);
    id v4 = [*(id *)(a1 + 32) _ensureXPCStarted];
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke_3;
    handler[3] = &unk_264244D78;
    id v8 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v4, v3, v5, handler);
  }
}

void __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDiagnosisKeysWithCompletionHandler:(ENGetDiagnosisKeysHandler)completionHandler
{
}

- (void)getTestDiagnosisKeysWithCompletionHandler:(ENGetDiagnosisKeysHandler)completionHandler
{
}

- (void)getDiagnosisKeysForTesting:(BOOL)a3 forceRefresh:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke;
  v10[3] = &unk_264244FF8;
  BOOL v12 = a3;
  BOOL v13 = a4;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(ENManager *)self _checkRemoteDialogueRequirementForRequestType:2 completionHandler:v10];
}

void __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_2;
    v18[3] = &unk_264244FA8;
    __int16 v20 = *(_WORD *)(a1 + 48);
    id v6 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v6;
    uint64_t v7 = MEMORY[0x2166BC8A0](v18);
    id v8 = (void (**)(void, void))v7;
    if (v5)
    {
      uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
      id v10 = v5;
      [v10 setTestMode:v9];
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      id v15 = __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_4;
      id v16 = &unk_264244FD0;
      id v11 = *(void **)(a1 + 32);
      id v17 = *(id *)(a1 + 40);
      [v11 _handleRemotePresentationRequest:v10 completionHandler:&v13];
      BOOL v12 = objc_msgSend(v10, "receiptId", v13, v14, v15, v16);

      ((void (**)(void, void *))v8)[2](v8, v12);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
}

void __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = v4;
  if (*(unsigned char *)(a1 + 48)) {
    int64_t v6 = 22;
  }
  else {
    int64_t v6 = 20;
  }
  xpc_dictionary_set_int64(v4, "mTyp", v6);
  xpc_dictionary_set_BOOL(v5, "refr", *(unsigned char *)(a1 + 49));
  if (v3)
  {
    *(void *)uuid = 0;
    uint64_t v14 = 0;
    id v7 = v5;
    [v3 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v7, "rpsid", uuid);
  }
  id v8 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_3;
  handler[3] = &unk_264244D50;
  void handler[4] = v9;
  id v12 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v8, v5, v10, handler);
}

uint64_t __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getDiagnosisKeysReply:a2 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_4(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_getDiagnosisKeysReply:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__ENManager__getDiagnosisKeysReply_completionHandler___block_invoke;
  v16[3] = &unk_264244EB8;
  id v18 = &v19;
  id v7 = v6;
  id v17 = v7;
  id v8 = (void (**)(void))MEMORY[0x2166BC8A0](v16);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  id v10 = (void *)v20[5];
  v20[5] = v9;

  if (!v20[5])
  {
    uint64_t v11 = xpc_dictionary_get_value(v5, "tekA");
    id v12 = (void *)v11;
    if (v11 && MEMORY[0x2166BCD00](v11) == MEMORY[0x263EF86D8])
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __54__ENManager__getDiagnosisKeysReply_completionHandler___block_invoke_2;
      v15[3] = &unk_264244840;
      v15[4] = v13;
      v15[5] = &v19;
      xpc_array_apply(v12, v15);
      if (!v20[5]) {
        (*((void (**)(id, id, void))v7 + 2))(v7, v13, 0);
      }
    }
    else
    {
      uint64_t v14 = ENErrorF(15);
      id v13 = (id)v20[5];
      v20[5] = v14;
    }
  }
  v8[2](v8);

  _Block_object_dispose(&v19, 8);
}

uint64_t __54__ENManager__getDiagnosisKeysReply_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

BOOL __54__ENManager__getDiagnosisKeysReply_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    id v5 = [ENTemporaryExposureKey alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    id v7 = [(ENTemporaryExposureKey *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENNestedErrorF(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 12);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (void)resetAllDataWithCompletionHandler:(id)a3
{
}

- (void)resetDataWithFlags:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ENManager_resetDataWithFlags_completionHandler___block_invoke;
  block[3] = &unk_264245020;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __50__ENManager_resetDataWithFlags_completionHandler___block_invoke(uint64_t a1)
{
  if ((~*(_DWORD *)(a1 + 48) & 0xFFF) != 0)
  {
    if (gLogCategory_ENManager <= 50 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintFlags32();
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_ENManager <= 50 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 21);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  if (v3) {
    xpc_dictionary_set_uint64(v2, "resFl", v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v6);
  id v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __50__ENManager_resetDataWithFlags_completionHandler___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v8 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v4, v2, v5, handler);
}

void __50__ENManager_resetDataWithFlags_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ENManager_diagnosticControl_completion___block_invoke;
  block[3] = &unk_264244E18;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __42__ENManager_diagnosticControl_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 100);
  uint64_t v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v3)
  {
    xpc_dictionary_set_value(v2, "parm", v3);
    id v4 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v5 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __42__ENManager_diagnosticControl_completion___block_invoke_2;
    handler[3] = &unk_264244D78;
    id v8 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v4, v2, v5, handler);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    ENErrorF(2);
    id v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, _xpc_connection_s *))(v6 + 16))(v6, 0, v4);
  }
}

void __42__ENManager_diagnosticControl_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
    }
    else
    {
      uint64_t v6 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    }
  }
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ENManager_diagnosticShow_completion___block_invoke;
  block[3] = &unk_264244E18;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __39__ENManager_diagnosticShow_completion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 102);
  id v3 = a1[4];
  if (v3)
  {
    id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      id v7 = (void (**)(id, void, void *))a1[6];
      id v8 = ENErrorF(2);
      v7[2](v7, 0, v8);

      goto LABEL_5;
    }
    uint64_t v5 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);
  }
  id v3 = [a1[5] _ensureXPCStarted];
  id v6 = *((void *)a1[5] + 10);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __39__ENManager_diagnosticShow_completion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v10 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v6, handler);

LABEL_5:
}

void __39__ENManager_diagnosticShow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = CUXPCDecodeNSErrorIfNeeded();
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
    }
    else
    {
      id v6 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    }
  }
}

- (void)triggerNotificationOfType:(int)a3 appBundleIdentifier:(id)a4 classificationName:(id)a5 interval:(id)a6 region:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__ENManager_triggerNotificationOfType_appBundleIdentifier_classificationName_interval_region_completion___block_invoke;
  block[3] = &unk_264245048;
  int v32 = a3;
  id v26 = v14;
  id v27 = v16;
  id v28 = v15;
  id v29 = v17;
  v30 = self;
  id v31 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v15;
  id v23 = v16;
  id v24 = v14;
  dispatch_async(dispatchQueue, block);
}

void __105__ENManager_triggerNotificationOfType_appBundleIdentifier_classificationName_interval_region_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 103);
  xpc_dictionary_set_int64(v2, "noteType", *(int *)(a1 + 80));
  id v3 = (const char *)[*(id *)(a1 + 32) UTF8String];
  if (v3) {
    xpc_dictionary_set_string(v2, "aBid", v3);
  }
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_uint64(v2, "intS", [v4 unsignedLongLongValue]);
  }
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = v2;
  id v7 = (const char *)[v5 UTF8String];
  if (v7) {
    xpc_dictionary_set_string(v6, "expCID", v7);
  }

  id v8 = *(id *)(a1 + 56);
  if (v8)
  {
    id v15 = 0;
    BOOL v9 = ENXPCEncodeSecureObject(v6, "regionData", v8, &v15);
    id v10 = v15;
    unsigned int v11 = v10;
    if (!v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_11;
    }
  }
  id v8 = [*(id *)(a1 + 64) _ensureXPCStarted];
  id v12 = *(NSObject **)(*(void *)(a1 + 64) + 80);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __105__ENManager_triggerNotificationOfType_appBundleIdentifier_classificationName_interval_region_completion___block_invoke_2;
  v13[3] = &unk_264244D78;
  id v14 = *(id *)(a1 + 72);
  xpc_connection_send_message_with_reply((xpc_connection_t)v8, v6, v12, v13);
  unsigned int v11 = v14;
LABEL_11:
}

void __105__ENManager_triggerNotificationOfType_appBundleIdentifier_classificationName_interval_region_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exposureDetectionActivate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ENManager_exposureDetectionActivate_completion___block_invoke;
  block[3] = &unk_264244E18;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __50__ENManager_exposureDetectionActivate_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__ENManager_exposureDetectionActivate_completion___block_invoke_2;
  v5[3] = &unk_264245070;
  id v8 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _tccCheckWithCompletion:v5];
}

void __50__ENManager_exposureDetectionActivate_completion___block_invoke_2(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void (*)(void))*((void *)a1[6] + 2);
    v3();
  }
  else
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "mTyp", 30);
    [a1[4] encodeWithXPCObject:v4];
    uint64_t v5 = [a1[5] _ensureXPCStarted];
    id v6 = *((void *)a1[5] + 10);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __50__ENManager_exposureDetectionActivate_completion___block_invoke_3;
    handler[3] = &unk_264244D78;
    id v8 = a1[6];
    xpc_connection_send_message_with_reply(v5, v4, v6, handler);
  }
}

void __50__ENManager_exposureDetectionActivate_completion___block_invoke_3(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exposureDetectionAddKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ENManager_exposureDetectionAddKeys_completion___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __49__ENManager_exposureDetectionAddKeys_completion___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 31);
  xpc_object_t v3 = xpc_array_create(0, 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a1[4];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        [v9 encodeWithXPCObject:v10];
        xpc_array_set_value(v3, 0xFFFFFFFFFFFFFFFFLL, v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "tekA", v3);
  unsigned int v11 = [a1[5] _ensureXPCStarted];
  id v12 = *((void *)a1[5] + 10);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__ENManager_exposureDetectionAddKeys_completion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v14 = a1[6];
  xpc_connection_send_message_with_reply(v11, v2, v12, handler);
}

void __49__ENManager_exposureDetectionAddKeys_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exposureDetectionFinishWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ENManager_exposureDetectionFinishWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __51__ENManager_exposureDetectionFinishWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 32);
  xpc_object_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __51__ENManager_exposureDetectionFinishWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __51__ENManager_exposureDetectionFinishWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v6 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = 0;
    uint64_t v5 = [[ENExposureDetectionSummary alloc] initWithXPCObject:v3 error:&v7];
    id v6 = v7;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)exposureDetectionGetExposureInfoWithMaximumCount:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ENManager_exposureDetectionGetExposureInfoWithMaximumCount_completion___block_invoke;
  block[3] = &unk_264244750;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __73__ENManager_exposureDetectionGetExposureInfoWithMaximumCount_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 33);
  xpc_dictionary_set_uint64(v2, "exIC", *(void *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__ENManager_exposureDetectionGetExposureInfoWithMaximumCount_completion___block_invoke_2;
  v6[3] = &unk_264244D50;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

uint64_t __73__ENManager_exposureDetectionGetExposureInfoWithMaximumCount_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) exposureDetectionGetExposureInfoCompleted:a2 completion:*(void *)(a1 + 40)];
}

- (void)exposureDetectionGetExposureInfoCompleted:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__2;
  id v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__ENManager_exposureDetectionGetExposureInfoCompleted_completion___block_invoke;
  v16[3] = &unk_264244EB8;
  long long v18 = &v19;
  id v7 = v6;
  id v17 = v7;
  id v8 = (void (**)(void))MEMORY[0x2166BC8A0](v16);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  id v10 = (void *)v20[5];
  v20[5] = v9;

  if (!v20[5])
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v12 = xpc_dictionary_get_array(v5, "exIA");
    id v13 = v12;
    if (!v12
      || (v15[0] = MEMORY[0x263EF8330],
          v15[1] = 3221225472,
          v15[2] = __66__ENManager_exposureDetectionGetExposureInfoCompleted_completion___block_invoke_2,
          v15[3] = &unk_264244840,
          v15[4] = v11,
          v15[5] = &v19,
          xpc_array_apply(v12, v15),
          !v20[5]))
    {
      BOOL v14 = xpc_dictionary_get_BOOL(v5, "done");
      (*((void (**)(id, id, BOOL, void))v7 + 2))(v7, v11, v14, 0);
    }
  }
  v8[2](v8);

  _Block_object_dispose(&v19, 8);
}

uint64_t __66__ENManager_exposureDetectionGetExposureInfoCompleted_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

BOOL __66__ENManager_exposureDetectionGetExposureInfoCompleted_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    id v5 = [ENExposureInfo alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    id v7 = [(ENExposureInfo *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENErrorF(12);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (void)exposureDetectionFileActivate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__ENManager_exposureDetectionFileActivate_completion___block_invoke;
  v10[3] = &unk_264245070;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(ENManager *)self _tccCheckWithCompletion:v10];
}

void __54__ENManager_exposureDetectionFileActivate_completion___block_invoke(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void (*)(void))*((void *)a1[6] + 2);
    v3();
  }
  else
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "mTyp", 40);
    [a1[4] encodeWithXPCObject:v4];
    id v5 = a1[5];
    id v12 = 0;
    char v6 = [v5 _setActivationPropertiesOnRequest:v4 error:&v12];
    id v7 = v12;
    if (v6)
    {
      id v8 = [a1[5] _ensureXPCStarted];
      id v9 = *((void *)a1[5] + 10);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __54__ENManager_exposureDetectionFileActivate_completion___block_invoke_2;
      v10[3] = &unk_264244D78;
      id v11 = a1[6];
      xpc_connection_send_message_with_reply(v8, v4, v9, v10);
    }
    else
    {
      (*((void (**)(void))a1[6] + 2))();
    }
  }
}

void __54__ENManager_exposureDetectionFileActivate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)exposureDetectionFileAdd:(id)a3 signatureURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v40 = a4;
  id v9 = a5;
  uint64_t v55 = 0;
  v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__2;
  v59 = __Block_byref_object_dispose__2;
  id v60 = 0;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke;
  v52[3] = &unk_264244EB8;
  v54 = &v55;
  id v39 = v9;
  id v53 = v39;
  uint64_t v10 = (void (**)(void))MEMORY[0x2166BC8A0](v52);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v11 = v8;
  id v12 = (const char *)[v11 fileSystemRepresentation];
  if (!v12 || (v13 = realpath_DARWIN_EXTSN(v12, 0), (uint64_t v14 = v13) == 0))
  {
    uint64_t v33 = ENErrorF(2);
    long long v15 = (void (**)(void))v56[5];
    v56[5] = (id)v33;
    goto LABEL_19;
  }
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_2;
  v51[3] = &__block_descriptor_40_e5_v8__0l;
  v51[4] = v13;
  long long v15 = (void (**)(void))MEMORY[0x2166BC8A0](v51);
  int v16 = open(v14, 0);
  if (v16 < 0 && (!*__error() || *__error()))
  {
    uint64_t v32 = ENErrorF(2);
    id v17 = (void (**)(void))v56[5];
    v56[5] = (id)v32;
    goto LABEL_18;
  }
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_3;
  v49[3] = &__block_descriptor_36_e5_v8__0l;
  int v50 = v16;
  id v17 = (void (**)(void))MEMORY[0x2166BC8A0](v49);
  v38 = v10;
  xpc_object_t v18 = xpc_fd_create(v16);
  if (!v18)
  {
    uint64_t v34 = ENErrorF(1);
    uint64_t v19 = (_xpc_connection_s *)v56[5];
    v56[5] = (id)v34;
    goto LABEL_17;
  }
  uint64_t v19 = [(ENManager *)self _ensureXPCStarted];
  long long v48 = 0u;
  long long v47 = 0u;
  xpc_connection_get_audit_token();
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v20 = sandbox_extension_issue_file_to_process();
  uint64_t v21 = (const char *)v20;
  id v37 = v11;
  if (!v20)
  {
    uint64_t v35 = ENErrorF(2);
    id v22 = (void (**)(void))v56[5];
    v56[5] = (id)v35;
    goto LABEL_16;
  }
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_4;
  v44[3] = &__block_descriptor_40_e5_v8__0l;
  v44[4] = v20;
  id v22 = (void (**)(void))MEMORY[0x2166BC8A0](v44);
  xpc_object_t v23 = v40;
  id v24 = v40;
  if (!v40) {
    goto LABEL_12;
  }
  id v25 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v26 = v56;
  id obj = v56[5];
  xpc_object_t v27 = (xpc_object_t)[v25 initWithContentsOfURL:v24 options:0 error:&obj];
  objc_storeStrong(v26 + 5, obj);
  if (v27)
  {
    size_t v28 = [v27 length];
    if (v28 - 65537 > 0xFFFFFFFFFFFEFFFFLL)
    {
      id v29 = v27;
      xpc_object_t v23 = xpc_data_create((const void *)[v29 bytes], v28);

LABEL_12:
      xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v27, "mTyp", 41);
      xpc_dictionary_set_value(v27, "fd", v18);
      xpc_dictionary_set_string(v27, "sbTk", v21);
      if (v23) {
        xpc_dictionary_set_value(v27, "sigD", v23);
      }
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_5;
      handler[3] = &unk_264244D78;
      id v42 = v39;
      xpc_connection_send_message_with_reply(v19, v27, dispatchQueue, handler);
      id v31 = v42;
      id v24 = v23;
      goto LABEL_15;
    }
    uint64_t v36 = ENErrorF(2);
  }
  else
  {
    uint64_t v36 = ENNestedErrorF(v56[5], 1);
  }
  id v31 = v56[5];
  v56[5] = (id)v36;
LABEL_15:

  uint64_t v10 = v38;
  v22[2](v22);
LABEL_16:

  id v11 = v37;
LABEL_17:

  v17[2](v17);
LABEL_18:

  v15[2](v15);
LABEL_19:

  v10[2](v10);
  _Block_object_dispose(&v55, 8);
}

uint64_t __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_3(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_4(uint64_t a1)
{
}

void __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_5(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exposureDetectionFileFinishWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__ENManager_exposureDetectionFileFinishWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__ENManager_exposureDetectionFileFinishWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 42);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __55__ENManager_exposureDetectionFileFinishWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __55__ENManager_exposureDetectionFileFinishWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v6 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = 0;
    id v5 = [[ENExposureDetectionSummary alloc] initWithXPCObject:v3 error:&v7];
    id v6 = v7;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getDetectionHistoryChecksWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__ENManager_getDetectionHistoryChecksWithCompletion___block_invoke;
  v6[3] = &unk_2642450E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ENManager *)self getDetectionHistorySessionsWithCompletion:v6];
}

void __53__ENManager_getDetectionHistoryChecksWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)MEMORY[0x263EFFA68];
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__ENManager_getDetectionHistoryChecksWithCompletion___block_invoke_2;
    v10[3] = &unk_2642450B8;
    id v8 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    void v10[4] = v6;
    id v11 = v9;
    [v8 _populateDetectionHistoryChecks:v6 forSessions:v7 sessionIndex:0 completion:v10];
  }
}

uint64_t __53__ENManager_getDetectionHistoryChecksWithCompletion___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2)
  {
    a3 = 0;
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (void)_populateDetectionHistoryChecks:(id)a3 forSessions:(id)a4 sessionIndex:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, uint64_t, void))a6;
  if ([v11 count] <= a5)
  {
    v12[2](v12, 1, 0);
  }
  else
  {
    id v13 = objc_alloc_init(ENExposureDetectionHistoryCheck);
    uint64_t v14 = [v11 objectAtIndexedSubscript:a5];
    unint64_t v15 = a5 + 1;
    [(ENExposureDetectionHistoryCheck *)v13 setSession:v14];
    [v10 addObject:v13];
    if ([v14 fileCount])
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __81__ENManager__populateDetectionHistoryChecks_forSessions_sessionIndex_completion___block_invoke_2;
      v18[3] = &unk_264245130;
      uint64_t v21 = v12;
      v18[4] = v13;
      void v18[5] = self;
      id v19 = v10;
      id v20 = v11;
      unint64_t v22 = a5 + 1;
      [(ENManager *)self getDetectionHistoryFilesForSession:v14 completion:v18];

      int v16 = v21;
    }
    else
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__ENManager__populateDetectionHistoryChecks_forSessions_sessionIndex_completion___block_invoke;
      block[3] = &unk_264245108;
      void block[4] = self;
      id v24 = v10;
      id v25 = v11;
      unint64_t v27 = v15;
      id v26 = v12;
      dispatch_async(dispatchQueue, block);

      int v16 = v24;
    }
  }
}

uint64_t __81__ENManager__populateDetectionHistoryChecks_forSessions_sessionIndex_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _populateDetectionHistoryChecks:*(void *)(a1 + 40) forSessions:*(void *)(a1 + 48) sessionIndex:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

uint64_t __81__ENManager__populateDetectionHistoryChecks_forSessions_sessionIndex_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v11 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return v11();
  }
  else
  {
    if (a2) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = MEMORY[0x263EFFA68];
    }
    [*(id *)(a1 + 32) setFiles:v4];
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 56);
    return [v5 _populateDetectionHistoryChecks:v6 forSessions:v9 sessionIndex:v7 completion:v8];
  }
}

- (void)getDetectionHistoryFilesForSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ENManager_getDetectionHistoryFilesForSession_completion___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __59__ENManager_getDetectionHistoryFilesForSession_completion___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 48);
  id v3 = [a1[4] UUID];
  if (v3)
  {
    *(void *)uuid = 0;
    uint64_t v11 = 0;
    id v4 = v2;
    [v3 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "sessID", uuid);
  }
  uint64_t v5 = [a1[5] _ensureXPCStarted];
  id v6 = a1[5];
  id v7 = *((void *)v6 + 10);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __59__ENManager_getDetectionHistoryFilesForSession_completion___block_invoke_2;
  handler[3] = &unk_264244D50;
  void handler[4] = v6;
  id v9 = a1[6];
  xpc_connection_send_message_with_reply(v5, v2, v7, handler);
}

uint64_t __59__ENManager_getDetectionHistoryFilesForSession_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getDetectionHistoryFilesCompleted:a2 completion:*(void *)(a1 + 40)];
}

- (void)_getDetectionHistoryFilesCompleted:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unint64_t v22 = __Block_byref_object_copy__2;
  xpc_object_t v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__ENManager__getDetectionHistoryFilesCompleted_completion___block_invoke;
  v16[3] = &unk_264244EB8;
  xpc_object_t v18 = &v19;
  id v7 = v6;
  id v17 = v7;
  uint64_t v8 = (void (**)(void))MEMORY[0x2166BC8A0](v16);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  id v10 = (void *)v20[5];
  v20[5] = v9;

  if (!v20[5])
  {
    uint64_t v11 = xpc_dictionary_get_value(v5, "detHF");
    uint64_t v12 = (void *)v11;
    if (v11 && MEMORY[0x2166BCD00](v11) == MEMORY[0x263EF86D8])
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __59__ENManager__getDetectionHistoryFilesCompleted_completion___block_invoke_2;
      v15[3] = &unk_264244840;
      v15[4] = v13;
      v15[5] = &v19;
      xpc_array_apply(v12, v15);
      if (!v20[5]) {
        (*((void (**)(id, id, void))v7 + 2))(v7, v13, 0);
      }
    }
    else
    {
      uint64_t v14 = ENErrorF(15);
      id v13 = (id)v20[5];
      v20[5] = v14;
    }
  }
  v8[2](v8);

  _Block_object_dispose(&v19, 8);
}

uint64_t __59__ENManager__getDetectionHistoryFilesCompleted_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      id v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

BOOL __59__ENManager__getDetectionHistoryFilesCompleted_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    id v5 = [ENExposureDetectionHistoryFile alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    id v7 = [(ENExposureDetectionHistoryFile *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENNestedErrorF(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 2);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (void)getDetectionHistorySessionsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__ENManager_getDetectionHistorySessionsWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__ENManager_getDetectionHistorySessionsWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 49);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__ENManager_getDetectionHistorySessionsWithCompletion___block_invoke_2;
  v6[3] = &unk_264244D50;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

uint64_t __55__ENManager_getDetectionHistorySessionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getDetectionHistorySessionsCompleted:a2 completion:*(void *)(a1 + 40)];
}

- (void)_getDetectionHistorySessionsCompleted:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unint64_t v22 = __Block_byref_object_copy__2;
  xpc_object_t v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__ENManager__getDetectionHistorySessionsCompleted_completion___block_invoke;
  v16[3] = &unk_264244EB8;
  xpc_object_t v18 = &v19;
  id v7 = v6;
  id v17 = v7;
  id v8 = (void (**)(void))MEMORY[0x2166BC8A0](v16);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v10 = (void *)v20[5];
  v20[5] = v9;

  if (!v20[5])
  {
    uint64_t v11 = xpc_dictionary_get_value(v5, "detHS");
    uint64_t v12 = (void *)v11;
    if (v11 && MEMORY[0x2166BCD00](v11) == MEMORY[0x263EF86D8])
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __62__ENManager__getDetectionHistorySessionsCompleted_completion___block_invoke_2;
      v15[3] = &unk_264244840;
      v15[4] = v13;
      v15[5] = &v19;
      xpc_array_apply(v12, v15);
      if (!v20[5]) {
        (*((void (**)(id, id, void))v7 + 2))(v7, v13, 0);
      }
    }
    else
    {
      uint64_t v14 = ENErrorF(15);
      id v13 = (id)v20[5];
      v20[5] = v14;
    }
  }
  v8[2](v8);

  _Block_object_dispose(&v19, 8);
}

uint64_t __62__ENManager__getDetectionHistorySessionsCompleted_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

BOOL __62__ENManager__getDetectionHistorySessionsCompleted_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    id v5 = [ENExposureDetectionHistorySession alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    id v7 = [(ENExposureDetectionHistorySession *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENNestedErrorF(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 2);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (void)sendChaffTestVerificationRequestForRegion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ENManager_sendChaffTestVerificationRequestForRegion_completionHandler___block_invoke;
  block[3] = &unk_264244E18;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __73__ENManager_sendChaffTestVerificationRequestForRegion_completionHandler___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 300);
  xpc_dictionary_set_BOOL(v2, "chaff", 1);
  id v3 = a1[4];
  if (v3)
  {
    id v10 = 0;
    BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v10);
    id v5 = v10;
    id v6 = v5;
    if (!v4)
    {
      (*((void (**)(void))a1[6] + 2))();
      goto LABEL_5;
    }
  }
  id v3 = [a1[5] _ensureXPCStarted];
  id v7 = *((void *)a1[5] + 10);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__ENManager_sendChaffTestVerificationRequestForRegion_completionHandler___block_invoke_2;
  v8[3] = &unk_264244D78;
  id v9 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v7, v8);
  id v6 = v9;
LABEL_5:
}

void __73__ENManager_sendChaffTestVerificationRequestForRegion_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v2 == 0);
}

- (void)startSelfReportWebSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ENManager_startSelfReportWebSession_completionHandler___block_invoke;
  block[3] = &unk_264244E18;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __57__ENManager_startSelfReportWebSession_completionHandler___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 303);
  id v3 = a1[4];
  if (v3)
  {
    id v10 = 0;
    BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v10);
    id v5 = v10;
    id v6 = v5;
    if (!v4)
    {
      (*((void (**)(void))a1[6] + 2))();
      goto LABEL_5;
    }
  }
  id v3 = [a1[5] _ensureXPCStarted];
  id v7 = *((void *)a1[5] + 10);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__ENManager_startSelfReportWebSession_completionHandler___block_invoke_2;
  v8[3] = &unk_264244D78;
  id v9 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v7, v8);
  id v6 = v9;
LABEL_5:
}

void __57__ENManager_startSelfReportWebSession_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id v3 = CUXPCDecodeNSErrorIfNeeded();
  string = xpc_dictionary_get_string(xdict, "APIKey");
  if (string)
  {
    id v5 = [NSString stringWithUTF8String:string];
    if (v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v6 = xpc_dictionary_get_string(xdict, "nonce");
      if (v6)
      {
        id v7 = [NSString stringWithUTF8String:v6];
        BOOL v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      }
      else
      {
        uint64_t v10 = *(void *)(a1 + 32);
        id v7 = ENErrorF(16);
        BOOL v8 = *(void (**)(void))(v10 + 16);
      }
      v8();
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v3)
    {
      (*(void (**)(void, void, void, void *))(v9 + 16))(*(void *)(a1 + 32), 0, 0, v3);
    }
    else
    {
      uint64_t v11 = ENErrorF(16);
      (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v11);
    }
  }
}

- (void)startTestVerificationSessionWithCode:(id)a3 region:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__ENManager_startTestVerificationSessionWithCode_region_completionHandler___block_invoke;
  v15[3] = &unk_264245158;
  id v16 = v8;
  id v17 = v9;
  xpc_object_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __75__ENManager_startTestVerificationSessionWithCode_region_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 300);
  id v3 = *(void **)(a1 + 32);
  id v4 = v2;
  id v5 = (const char *)[v3 UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "veriC", v5);
  }

  id v6 = *(id *)(a1 + 40);
  if (v6)
  {
    id v13 = 0;
    BOOL v7 = ENXPCEncodeSecureObject(v4, "regionData", v6, &v13);
    id v8 = v13;
    id v9 = v8;
    if (!v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_7;
    }
  }
  id v6 = [*(id *)(a1 + 48) _ensureXPCStarted];
  id v10 = *(NSObject **)(*(void *)(a1 + 48) + 80);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__ENManager_startTestVerificationSessionWithCode_region_completionHandler___block_invoke_2;
  v11[3] = &unk_264244D78;
  id v12 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply((xpc_connection_t)v6, v4, v10, v11);
  id v9 = v12;
LABEL_7:
}

void __75__ENManager_startTestVerificationSessionWithCode_region_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v5 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    CUXPCDecodeNSUUID();
    id v5 = 0;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
    else
    {
      BOOL v7 = ENErrorF(1);
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
}

- (void)fetchTestMetadataForSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ENManager_fetchTestMetadataForSession_completionHandler___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __59__ENManager_fetchTestMetadataForSession_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 301);
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    *(void *)uuid = 0;
    uint64_t v10 = 0;
    id v4 = v2;
    [v3 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "sessID", uuid);
  }
  id v5 = [*(id *)(a1 + 40) _ensureXPCStarted];
  id v6 = *(NSObject **)(*(void *)(a1 + 40) + 80);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__ENManager_fetchTestMetadataForSession_completionHandler___block_invoke_2;
  v7[3] = &unk_264244D78;
  id v8 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v5, v2, v6, v7);
}

void __59__ENManager_fetchTestMetadataForSession_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = CUXPCDecodeNSErrorIfNeeded();
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    id v5 = [v4 objectForKeyedSubscript:@"meta"];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v5, 0);
    }
    else
    {
      id v7 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
}

- (void)finishTestVerificationForSession:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__ENManager_finishTestVerificationForSession_userDidConsent_metadata_completionHandler___block_invoke;
  block[3] = &unk_264245180;
  BOOL v22 = a4;
  id v18 = v10;
  id v19 = v11;
  id v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(dispatchQueue, block);
}

void __88__ENManager_finishTestVerificationForSession_userDidConsent_metadata_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 302);
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    *(void *)uuid = 0;
    uint64_t v10 = 0;
    id v4 = v2;
    [v3 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "sessID", uuid);
  }
  xpc_dictionary_set_BOOL(v2, "consent", *(unsigned char *)(a1 + 64));
  xpc_dictionary_set_cf_object();
  id v5 = [*(id *)(a1 + 48) _ensureXPCStarted];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 80);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__ENManager_finishTestVerificationForSession_userDidConsent_metadata_completionHandler___block_invoke_2;
  v7[3] = &unk_264244D78;
  id v8 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v5, v2, v6, v7);
}

void __88__ENManager_finishTestVerificationForSession_userDidConsent_metadata_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activeRegionWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__ENManager_activeRegionWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __40__ENManager_activeRegionWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 50);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __40__ENManager_activeRegionWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __40__ENManager_activeRegionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v8 = (void *)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v11 = 0;
    id v6 = ENXPCDecodeSecureObjectIfPresent(v3, "regionData", v5, &v11);
    id v7 = v11;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v6, 0);
    }
    else if (v7)
    {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
    }
    else
    {
      uint64_t v10 = ENErrorF(16);
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
  }
}

- (void)regionConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__ENManager_regionConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __47__ENManager_regionConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 51);
  xpc_dictionary_set_int64(v2, "cty", 0);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __47__ENManager_regionConfigurationWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __47__ENManager_regionConfigurationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v8 = (void *)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v11 = 0;
    id v6 = ENXPCDecodeSecureObjectIfPresent(v3, "svrCfg", v5, &v11);
    id v7 = v11;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v6, 0);
    }
    else if (v7)
    {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
    }
    else
    {
      uint64_t v10 = ENErrorF(16);
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
  }
}

- (void)allRegionConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ENManager_allRegionConfigurationsWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __51__ENManager_allRegionConfigurationsWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 52);
  xpc_dictionary_set_int64(v2, "cty", 0);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __51__ENManager_allRegionConfigurationsWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __51__ENManager_allRegionConfigurationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v3, "svrCfg", &length);
    if (!data) {
      goto LABEL_16;
    }
    if (!length) {
      goto LABEL_16;
    }
    id v6 = data;
    id v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    id v13 = objc_alloc(MEMORY[0x263EFF8F8]);
    id v14 = (void *)[v13 initWithBytes:v6 length:length];
    id v18 = 0;
    id v15 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v12 fromData:v14 error:&v18];
    id v4 = v18;

    if (v15)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
    }
    else
    {
LABEL_16:
      if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
      {
        id v17 = CUPrintNSError();
        LogPrintF_safe();
      }
      uint64_t v16 = *(void *)(a1 + 32);
      id v15 = ENNestedErrorF(v4, 11);
      (*(void (**)(uint64_t))(v16 + 16))(v16);
    }
  }
}

- (void)allRegionServerConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ENManager_allRegionServerConfigurationsWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __57__ENManager_allRegionServerConfigurationsWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 52);
  xpc_dictionary_set_int64(v2, "cty", 10);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__ENManager_allRegionServerConfigurationsWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __57__ENManager_allRegionServerConfigurationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v13 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 objectForKeyedSubscript:@"svrCfg"];
      if (v7)
      {
        id v8 = (void *)MEMORY[0x263EFFA08];
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
        id v20 = 0;
        id v12 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v11 fromData:v7 error:&v20];
        id v13 = v20;
        if (v12)
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
        else
        {
          if (gLogCategory__ENManager <= 90
            && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          uint64_t v14 = *(void *)(a1 + 32);
          id v15 = ENErrorF(16);
          (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
        }
      }
      else
      {
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = ENErrorF(16);
        (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);

        id v13 = 0;
      }
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);

      id v13 = 0;
    }
  }
}

- (void)regionServerConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ENManager_regionServerConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __53__ENManager_regionServerConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 51);
  xpc_dictionary_set_int64(v2, "cty", 10);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __53__ENManager_regionServerConfigurationWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __53__ENManager_regionServerConfigurationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v12 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    id v6 = [v5 objectForKeyedSubscript:@"svrCfg"];
    if (v5)
    {
      id v7 = (void *)MEMORY[0x263EFFA08];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
      id v17 = 0;
      uint64_t v11 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v10 fromData:v6 error:&v17];
      id v12 = v17;
      if (v11)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = ENErrorF(16);
        (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
      }
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

      id v12 = 0;
    }
  }
}

- (void)agencyConfigurationForLocale:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ENManager_agencyConfigurationForLocale_withCompletion___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __57__ENManager_agencyConfigurationForLocale_withCompletion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 51);
  xpc_dictionary_set_int64(v2, "cty", 20);
  id v3 = [a1[4] localeIdentifier];

  if (v3)
  {
    uint64_t v4 = [a1[4] localeIdentifier];
    xpc_dictionary_set_string(v2, "loc", (const char *)[v4 utf8ValueSafe]);

    uint64_t v5 = [a1[5] _ensureXPCStarted];
    id v6 = *((void *)a1[5] + 10);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __57__ENManager_agencyConfigurationForLocale_withCompletion___block_invoke_2;
    handler[3] = &unk_264244D78;
    id v9 = a1[6];
    xpc_connection_send_message_with_reply(v5, v2, v6, handler);
  }
  else
  {
    id v7 = ENErrorF(2);
  }
}

void __57__ENManager_agencyConfigurationForLocale_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v14 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    id v6 = [v5 objectForKeyedSubscript:@"svrCfg"];
    if (v5)
    {
      id v7 = (void *)MEMORY[0x263EFFA08];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      id v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
      id v19 = 0;
      uint64_t v13 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v12 fromData:v6 error:&v19];
      id v14 = v19;
      if (v13)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = ENErrorF(16);
        (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
      }
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

      id v14 = 0;
    }
  }
}

- (void)allAgencyConfigurationsForLocale:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ENManager_allAgencyConfigurationsForLocale_withCompletion___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __61__ENManager_allAgencyConfigurationsForLocale_withCompletion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 52);
  xpc_dictionary_set_int64(v2, "cty", 20);
  id v3 = [a1[4] localeIdentifier];

  if (v3)
  {
    uint64_t v4 = [a1[4] localeIdentifier];
    xpc_dictionary_set_string(v2, "loc", (const char *)[v4 utf8ValueSafe]);

    uint64_t v5 = [a1[5] _ensureXPCStarted];
    id v6 = *((void *)a1[5] + 10);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __61__ENManager_allAgencyConfigurationsForLocale_withCompletion___block_invoke_2;
    handler[3] = &unk_264244D78;
    id v9 = a1[6];
    xpc_connection_send_message_with_reply(v5, v2, v6, handler);
  }
  else
  {
    id v7 = ENErrorF(2);
  }
}

void __61__ENManager_allAgencyConfigurationsForLocale_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v14 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    id v6 = [v5 objectForKeyedSubscript:@"svrCfg"];
    if (v5)
    {
      id v7 = (void *)MEMORY[0x263EFFA08];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      id v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
      id v19 = 0;
      uint64_t v13 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v12 fromData:v6 error:&v19];
      id v14 = v19;
      if (v13)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = ENErrorF(16);
        (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
      }
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

      id v14 = 0;
    }
  }
}

- (void)getRegionVisitHistoryWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__ENManager_getRegionVisitHistoryWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __49__ENManager_getRegionVisitHistoryWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 55);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__ENManager_getRegionVisitHistoryWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __49__ENManager_getRegionVisitHistoryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v12 = (void *)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    id v6 = [v5 objectForKeyedSubscript:@"rgnHy"];
    if (v6)
    {
      id v7 = (void *)MEMORY[0x263EFFA08];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      id v18 = 0;
      uint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v9 fromData:v6 error:&v18];
      id v11 = v18;
      id v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)(a1 + 32);
      if (v10 || (id v13 = v11) != 0)
      {
        (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v10, v13);
      }
      else
      {
        uint64_t v15 = ENErrorF(16);
        (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
      }
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);

      id v12 = 0;
    }
  }
}

- (void)regionHistoryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__ENManager_regionHistoryWithCompletion___block_invoke;
  v6[3] = &unk_2642451A8;
  id v7 = v4;
  id v5 = v4;
  [(ENManager *)self getRegionVisitHistoryWithCompletion:v6];
}

void __41__ENManager_regionHistoryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "region", (void)v14);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRegionConsent:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  ENErrorF(5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)setRegionConsent:(int64_t)a3 region:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  ENErrorF(5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)setRegionUserConsent:(id)a3 region:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    [v8 consent];
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ENManager_setRegionUserConsent_region_completionHandler___block_invoke;
  block[3] = &unk_2642451D0;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(dispatchQueue, block);
}

void __59__ENManager_setRegionUserConsent_region_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 53);
  uint64_t v3 = *(void *)(a1 + 32);
  id v16 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v16];
  id v5 = v16;
  if (v4)
  {
    id v6 = v4;
    xpc_dictionary_set_data(v2, "regionConsent", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
    uint64_t v7 = *(void *)(a1 + 40);
    id v15 = v5;
    id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v15];
    id v9 = v15;

    if (v8)
    {
      id v10 = v8;
      xpc_dictionary_set_data(v2, "regionData", (const void *)[v10 bytes], objc_msgSend(v10, "length"));
      uint64_t v11 = [*(id *)(a1 + 48) _ensureXPCStarted];
      id v12 = *(NSObject **)(*(void *)(a1 + 48) + 80);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __59__ENManager_setRegionUserConsent_region_completionHandler___block_invoke_2;
      handler[3] = &unk_264244D78;
      id v14 = *(id *)(a1 + 56);
      xpc_connection_send_message_with_reply(v11, v2, v12, handler);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v9 = v5;
  }
}

void __59__ENManager_setRegionUserConsent_region_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteExposureDetectionHistoryWithCompletionHandler:(id)a3
{
}

- (void)downloadAndDetectExposure:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ENManager_downloadAndDetectExposure_completionHandler___block_invoke;
  block[3] = &unk_264244DF0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __57__ENManager_downloadAndDetectExposure_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 205);
  xpc_dictionary_set_BOOL(v2, "detX", *(unsigned char *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__ENManager_downloadAndDetectExposure_completionHandler___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __57__ENManager_downloadAndDetectExposure_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exposureNotificationGetStatusForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ENManager_exposureNotificationGetStatusForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __73__ENManager_exposureNotificationGetStatusForBundleIdentifier_completion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 200);
  xpc_dictionary_set_string(v2, "aBid", (const char *)[a1[4] utf8ValueSafe]);
  uint64_t v3 = [a1[5] _ensureXPCStarted];
  id v4 = *((void *)a1[5] + 10);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __73__ENManager_exposureNotificationGetStatusForBundleIdentifier_completion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = a1[6];
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __73__ENManager_exposureNotificationGetStatusForBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (!v3)
  {
    xpc_dictionary_get_BOOL(xdict, "enbd");
    xpc_dictionary_get_uint64(xdict, "aBARi");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDataVaultSizeWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ENManager_getDataVaultSizeWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __44__ENManager_getDataVaultSizeWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 214);
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __44__ENManager_getDataVaultSizeWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __44__ENManager_getDataVaultSizeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t int64 = xpc_dictionary_get_uint64(xdict, "bytes");
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [NSNumber numberWithUnsignedLongLong:uint64];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
}

- (void)getInfoForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ENManager_getInfoForKey_completion___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __38__ENManager_getInfoForKey_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 201);
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = v2;
  uint64_t v5 = (const char *)[v3 UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "iStr", v5);
  }

  id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
  id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __38__ENManager_getInfoForKey_completion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v9 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v6, v4, v7, handler);
}

void __38__ENManager_getInfoForKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = CUXPCDecodeNSErrorIfNeeded();
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = xpc_dictionary_get_value(xdict, "oObj");
    if (v4)
    {
      uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      uint64_t v6 = *(void *)(a1 + 32);
      if (v5)
      {
        (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v5, 0);
      }
      else
      {
        id v8 = ENErrorF(15);
        (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v8);
      }
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v5 = ENErrorF(15);
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v5);
    }
  }
}

- (void)getAllEntitiesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ENManager_getAllEntitiesWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __42__ENManager_getAllEntitiesWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 150);
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __42__ENManager_getAllEntitiesWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __42__ENManager_getAllEntitiesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v12 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5)
    {
      id v6 = (void *)MEMORY[0x263EFFA08];
      uint64_t v7 = objc_opt_class();
      id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
      uint64_t v9 = [v5 objectForKeyedSubscript:@"acEn"];
      if (v9)
      {
        id v10 = (void *)v9;
        id v37 = 0;
        BOOL v11 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v37];
        id v12 = v37;
        id v13 = [v5 objectForKeyedSubscript:@"auEn"];

        if (v13)
        {
          id v36 = v12;
          id v14 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v8 fromData:v13 error:&v36];
          id v15 = v36;

          id v16 = [v14 firstObject];

          id v17 = [v5 objectForKeyedSubscript:@"avaEn"];

          if (v17)
          {
            id v35 = v15;
            [MEMORY[0x263F08928] unarchivedObjectOfClasses:v8 fromData:v17 error:&v35];
            id v18 = v17;
            id v19 = v16;
            id v20 = v5;
            id v21 = v8;
            BOOL v22 = v11;
            id v23 = v3;
            v25 = uint64_t v24 = a1;
            id v34 = v35;

            id v26 = [v25 firstObject];

            uint64_t v27 = *(void *)(v24 + 32);
            id v3 = v23;
            BOOL v11 = v22;
            id v8 = v21;
            uint64_t v5 = v20;
            id v16 = v19;
            id v17 = v18;
            (*(void (**)(void))(v27 + 16))();
            id v15 = v34;
          }
          else
          {
            uint64_t v33 = *(void *)(a1 + 32);
            id v26 = ENErrorF(16);
            (*(void (**)(uint64_t, void, void, void, void *))(v33 + 16))(v33, 0, 0, 0, v26);
          }

          id v12 = v15;
        }
        else
        {
          uint64_t v32 = *(void *)(a1 + 32);
          id v17 = ENErrorF(16);
          (*(void (**)(uint64_t, void, void, void, void *))(v32 + 16))(v32, 0, 0, 0, v17);
        }
      }
      else
      {
        uint64_t v30 = *(void *)(a1 + 32);
        id v31 = ENErrorF(16);
        (*(void (**)(uint64_t, void, void, void, void *))(v30 + 16))(v30, 0, 0, 0, v31);

        id v12 = 0;
      }
    }
    else
    {
      uint64_t v28 = *(void *)(a1 + 32);
      id v29 = ENErrorF(2);
      (*(void (**)(uint64_t, void, void, void, void *))(v28 + 16))(v28, 0, 0, 0, v29);

      id v12 = 0;
    }
  }
}

- (void)onboardingDidStartForRegion:(id)a3 withSource:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ENManager_onboardingDidStartForRegion_withSource_completion___block_invoke;
  block[3] = &unk_264245158;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, block);
}

void __63__ENManager_onboardingDidStartForRegion_withSource_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 209);
  id v3 = *(void **)(a1 + 32);
  id v4 = v2;
  uint64_t v5 = (const char *)[v3 UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "iStr", v5);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  id v14 = 0;
  uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v14];
  id v8 = v14;
  if (v7)
  {
    id v9 = v7;
    xpc_dictionary_set_data(v4, "regionData", (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    id v10 = [*(id *)(a1 + 48) _ensureXPCStarted];
    BOOL v11 = *(NSObject **)(*(void *)(a1 + 48) + 80);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__ENManager_onboardingDidStartForRegion_withSource_completion___block_invoke_2;
    v12[3] = &unk_264244D78;
    id v13 = *(id *)(a1 + 56);
    xpc_connection_send_message_with_reply(v10, v4, v11, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __63__ENManager_onboardingDidStartForRegion_withSource_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getLastExposureNotificationWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__ENManager_getLastExposureNotificationWithCompletion___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__ENManager_getLastExposureNotificationWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 204);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __55__ENManager_getLastExposureNotificationWithCompletion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __55__ENManager_getLastExposureNotificationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v7 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v8 = 0;
    id v6 = ENXPCDecodeSecureObjectIfPresent(v3, "noteObj", v5, &v8);
    id v7 = v8;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setAutomaticRegionSwitchEnabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ENManager_setAutomaticRegionSwitchEnabled_completion___block_invoke;
  block[3] = &unk_264244DF0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __56__ENManager_setAutomaticRegionSwitchEnabled_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 207);
  xpc_dictionary_set_BOOL(v2, "enbd", *(unsigned char *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __56__ENManager_setAutomaticRegionSwitchEnabled_completion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __56__ENManager_setAutomaticRegionSwitchEnabled_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAvailabilityAlertEnabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ENManager_setAvailabilityAlertEnabled_completion___block_invoke;
  block[3] = &unk_264244DF0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __52__ENManager_setAvailabilityAlertEnabled_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 215);
  xpc_dictionary_set_BOOL(v2, "enbd", *(unsigned char *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __52__ENManager_setAvailabilityAlertEnabled_completion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __52__ENManager_setAvailabilityAlertEnabled_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCurrentActiveApp:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ENManager_setCurrentActiveApp_completion___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __44__ENManager_setCurrentActiveApp_completion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 202);
  xpc_dictionary_set_string(v2, "aBid", (const char *)[a1[4] utf8ValueSafe]);
  id v3 = [a1[5] _ensureXPCStarted];
  uint64_t v4 = *((void *)a1[5] + 10);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __44__ENManager_setCurrentActiveApp_completion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = a1[6];
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __44__ENManager_setCurrentActiveApp_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setActiveEntityWithAppBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ENManager_setActiveEntityWithAppBundleID_completion___block_invoke;
  block[3] = &unk_264244E18;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __55__ENManager_setActiveEntityWithAppBundleID_completion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 151);
  if ([a1[4] length])
  {
    xpc_dictionary_set_string(v2, "aBid", (const char *)[a1[4] utf8ValueSafe]);
    id v3 = [a1[5] _ensureXPCStarted];
    uint64_t v4 = *((void *)a1[5] + 10);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __55__ENManager_setActiveEntityWithAppBundleID_completion___block_invoke_2;
    handler[3] = &unk_264244D78;
    id v7 = a1[6];
    xpc_connection_send_message_with_reply(v3, v2, v4, handler);
  }
  else
  {
    uint64_t v5 = (void (**)(id, _xpc_connection_s *))a1[6];
    ENErrorF(2);
    id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v3);
  }
}

void __55__ENManager_setActiveEntityWithAppBundleID_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setActiveEntityWithRegion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ENManager_setActiveEntityWithRegion_completion___block_invoke;
  block[3] = &unk_264244E18;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __50__ENManager_setActiveEntityWithRegion_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 151);
  id v3 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__ENManager_setActiveEntityWithRegion_completion___block_invoke_2;
    v8[3] = &unk_264244D78;
    id v9 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v6, v2, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __50__ENManager_setActiveEntityWithRegion_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setActiveRegion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ENManager_setActiveRegion_completion___block_invoke;
  block[3] = &unk_264244E18;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __40__ENManager_setActiveRegion_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 206);
  id v3 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__ENManager_setActiveRegion_completion___block_invoke_2;
    v8[3] = &unk_264244D78;
    id v9 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v6, v2, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __40__ENManager_setActiveRegion_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDeveloperServerConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ENManager_setDeveloperServerConfiguration_completionHandler___block_invoke;
  block[3] = &unk_264244E18;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __63__ENManager_setDeveloperServerConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 54);
  if (*(void *)(a1 + 32))
  {
    id v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v3)
    {
      xpc_dictionary_set_value(v2, "svrCfg", v3);
      BOOL v4 = [*(id *)(a1 + 40) _ensureXPCStarted];
      id v5 = *(NSObject **)(*(void *)(a1 + 40) + 80);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __63__ENManager_setDeveloperServerConfiguration_completionHandler___block_invoke_2;
      handler[3] = &unk_264244D78;
      id v10 = *(id *)(a1 + 48);
      xpc_connection_send_message_with_reply(v4, v2, v5, handler);
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 48);
      ENErrorF(2);
      BOOL v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _xpc_connection_s *))(v8 + 16))(v8, v4);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = ENErrorF(2);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __63__ENManager_setDeveloperServerConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setWeeklySummaryAlertEnabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ENManager_setWeeklySummaryAlertEnabled_completion___block_invoke;
  block[3] = &unk_264244DF0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __53__ENManager_setWeeklySummaryAlertEnabled_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 216);
  xpc_dictionary_set_BOOL(v2, "enbd", *(unsigned char *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  BOOL v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __53__ENManager_setWeeklySummaryAlertEnabled_completion___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __53__ENManager_setWeeklySummaryAlertEnabled_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearDeveloperServerConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__ENManager_clearDeveloperServerConfigurationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __68__ENManager_clearDeveloperServerConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 54);
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __68__ENManager_clearDeveloperServerConfigurationWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_264244D78;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __68__ENManager_clearDeveloperServerConfigurationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remotePresentationRequestDidComplete:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ENManager_remotePresentationRequestDidComplete_completion___block_invoke;
  block[3] = &unk_264244E18;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __61__ENManager_remotePresentationRequestDidComplete_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 213);
  id v3 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v4 = ENXPCEncodeSecureObject(v2, "rpr", v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61__ENManager_remotePresentationRequestDidComplete_completion___block_invoke_2;
    v8[3] = &unk_264244D78;
    id v9 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v6, v2, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __61__ENManager_remotePresentationRequestDidComplete_completion___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchConfigurationsForRegion:(id)a3 forceServerFetch:(BOOL)a4 completion:(id)a5
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(ENManager *)self fetchConfigurationsForRegion:a3 fetchReason:v5 completion:a5];
}

- (void)fetchConfigurationsForRegion:(id)a3 fetchReason:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__ENManager_fetchConfigurationsForRegion_fetchReason_completion___block_invoke;
  v13[3] = &unk_2642451F8;
  unsigned int v17 = a4;
  id v15 = self;
  id v16 = v9;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

void __65__ENManager_fetchConfigurationsForRegion_fetchReason_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 52);
  xpc_dictionary_set_int64(v2, "cty", 10);
  xpc_dictionary_set_int64(v2, "feRsn", *(unsigned int *)(a1 + 56));
  id v3 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__ENManager_fetchConfigurationsForRegion_fetchReason_completion___block_invoke_2;
    v8[3] = &unk_264244D78;
    id v9 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v6, v2, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __65__ENManager_fetchConfigurationsForRegion_fetchReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v15 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = ENErrorF(2);
    (*(void (**)(uint64_t, void, void, void, void *))(v26 + 16))(v26, 0, 0, 0, v27);

    id v15 = 0;
    goto LABEL_9;
  }
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v13 = [v5 objectForKeyedSubscript:@"rgnCfg"];
  id v34 = 0;
  uint64_t v14 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v12 fromData:v13 error:&v34];
  id v15 = v34;
  id v31 = (void *)v14;
  if (!v14)
  {
    uint64_t v28 = *(void *)(a1 + 32);
    unsigned int v17 = ENErrorF(16);
    (*(void (**)(uint64_t, void, void, void, void *))(v28 + 16))(v28, 0, 0, 0, v17);
    id v25 = 0;
    goto LABEL_8;
  }
  id v16 = [v5 objectForKeyedSubscript:@"svrCfg"];

  id v33 = v15;
  unsigned int v17 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v12 fromData:v16 error:&v33];
  id v18 = v33;

  if (!v17)
  {
    uint64_t v29 = *(void *)(a1 + 32);
    id v21 = ENErrorF(16);
    (*(void (**)(uint64_t, void, void, void, void *))(v29 + 16))(v29, 0, 0, 0, v21);
LABEL_16:
    id v25 = v31;
    goto LABEL_7;
  }
  id v19 = v3;
  uint64_t v20 = [v5 objectForKeyedSubscript:@"agnCfg"];

  id v32 = v18;
  id v21 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v12 fromData:v20 error:&v32];
  id v22 = v32;

  uint64_t v23 = *(void *)(a1 + 32);
  if (!v21)
  {
    uint64_t v30 = ENErrorF(16);
    (*(void (**)(uint64_t, void, void, void, void *))(v23 + 16))(v23, 0, 0, 0, v30);

    id v18 = v22;
    id v16 = (void *)v20;
    id v3 = v19;
    goto LABEL_16;
  }
  uint64_t v24 = *(void (**)(void, void *, void *, void *, void))(v23 + 16);
  id v25 = v31;
  v24(*(void *)(a1 + 32), v31, v17, v21, 0);
  id v18 = v22;
  id v16 = (void *)v20;
  id v3 = v19;
LABEL_7:

  id v15 = v18;
  id v13 = v16;
LABEL_8:

LABEL_9:
LABEL_10:
}

- (void)fetchSubdivisionsForCountry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = [v6 countryCode];
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke;
  block[3] = &unk_264244E18;
  uint64_t v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 62);
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__2;
    void v13[4] = __Block_byref_object_dispose__2;
    id v14 = 0;
    id obj = 0;
    BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &obj);
    objc_storeStrong(&v14, obj);
    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) _ensureXPCStarted];
      id v6 = *(NSObject **)(*(void *)(a1 + 40) + 80);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke_2;
      handler[3] = &unk_264245220;
      id v10 = *(id *)(a1 + 48);
      uint64_t v11 = v13;
      xpc_connection_send_message_with_reply(v5, v2, v6, handler);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    _Block_object_dispose(v13, 8);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = ENErrorF(15);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = xpc_dictionary_get_array(v3, "subCodes");
    uint64_t v7 = v6;
    if (!v6) {
      goto LABEL_4;
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke_3;
    v9[3] = &unk_264244840;
    uint64_t v8 = *(void *)(a1 + 40);
    void v9[4] = v5;
    void v9[5] = v8;
    xpc_array_apply(v6, v9);
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
LABEL_4:
    }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8798])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (string_ptr)
    {
      id v9 = [NSString stringWithUTF8String:string_ptr];
      [*(id *)(a1 + 32) addObject:v9];
      uint64_t v7 = 1;
      goto LABEL_6;
    }
    uint64_t v5 = 16;
  }
  else
  {
    uint64_t v5 = 15;
  }
  uint64_t v6 = ENErrorF(v5);
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
LABEL_6:

  return v7;
}

- (void)showBuddyForRegion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ENManager_showBuddyForRegion_completionHandler___block_invoke;
  block[3] = &unk_264244E18;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __50__ENManager_showBuddyForRegion_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 217);
  id v3 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__ENManager_showBuddyForRegion_completionHandler___block_invoke_2;
    v8[3] = &unk_264244D78;
    id v9 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v6, v2, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __50__ENManager_showBuddyForRegion_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyTextMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ENManager_verifyTextMessage_completionHandler___block_invoke;
  block[3] = &unk_264244E18;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __49__ENManager_verifyTextMessage_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 218);
  id v3 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v4 = ENXPCEncodeSecureObject(v2, "txtMD", v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _ensureXPCStarted];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__ENManager_verifyTextMessage_completionHandler___block_invoke_2;
    v8[3] = &unk_264244D78;
    id v9 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v6, v2, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __49__ENManager_verifyTextMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ENActivityHandler)activityHandler
{
  return self->_activityHandler;
}

- (void)setActivityHandler:(ENActivityHandler)activityHandler
{
}

- (dispatch_queue_t)dispatchQueue
{
  return (dispatch_queue_t)self->_dispatchQueue;
}

- (ENStatus)exposureNotificationStatus
{
  return self->_exposureNotificationStatus;
}

- (dispatch_block_t)invalidationHandler
{
  return self->_invalidationHandler;
}

- (ENDiagnosisKeysAvailableHandler)diagnosisKeysAvailableHandler
{
  return self->_diagnosisKeysAvailableHandler;
}

- (void)setDiagnosisKeysAvailableHandler:(ENDiagnosisKeysAvailableHandler)diagnosisKeysAvailableHandler
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
}

- (BOOL)exposureNotificationPaused
{
  return self->_exposureNotificationPaused;
}

- (BOOL)analyticsEnabled
{
  return self->_analyticsEnabled;
}

@end