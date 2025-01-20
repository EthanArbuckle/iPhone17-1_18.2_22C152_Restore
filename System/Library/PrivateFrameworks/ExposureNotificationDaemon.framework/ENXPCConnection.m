@interface ENXPCConnection
- (BOOL)_appActiveStatusWithError:(id *)a3;
- (BOOL)_authorizationPreflightUnknownAndReturnError:(id *)a3;
- (BOOL)_authorizedAndReturnError:(id *)a3;
- (BOOL)_entitledForAccessLevel:(int)a3 error:(id *)a4;
- (BOOL)_rateLimitAndReturnError:(id *)a3;
- (BOOL)_xpcManagerActivateIfNecessaryWithRequest:(id)a3 error:(id *)a4;
- (BOOL)skipFileSigningVerification;
- (ENDaemon)daemon;
- (ENExposureDetectionDaemonSession)detectionSession;
- (ENManager)manager;
- (ENXPCClient)client;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcCnx;
- (id)_regionConfigForXPCRequest:(id)a3 error:(id *)a4;
- (id)_regionServerConfigForXPCRequest:(id)a3 error:(id *)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)_fetchClientPublicKeyWithVerificationID:(id)a3 keyVersion:(id)a4 completion:(id)a5;
- (void)_processServerResponseConfigurationsForRegion:(id)a3 serverResponses:(id)a4 request:(id)a5;
- (void)_sendOnboardingMetricForRegionConfiguration:(id)a3;
- (void)_updateActiveEntityFromTCCResult:(BOOL)a3;
- (void)_xpcConnectionRequest:(id)a3;
- (void)_xpcDiagnosticControl:(id)a3;
- (void)_xpcDiagnosticLog:(id)a3;
- (void)_xpcDiagnosticShow:(id)a3;
- (void)_xpcDownload:(id)a3;
- (void)_xpcEntitlementCheck:(id)a3;
- (void)_xpcExposureDetectionFileActivate:(id)a3;
- (void)_xpcExposureDetectionFileAdd:(id)a3;
- (void)_xpcExposureDetectionFileAddNext:(id)a3 fileSession:(id)a4 publicKey:(id)a5;
- (void)_xpcExposureDetectionFileFinish:(id)a3;
- (void)_xpcExposureDetectionFileGetExposureWindows:(id)a3;
- (void)_xpcExposureDetectionFileGetExposures:(id)a3;
- (void)_xpcExposureDetectionHistoryGetFiles:(id)a3;
- (void)_xpcExposureDetectionHistoryGetSessions:(id)a3;
- (void)_xpcFetchTestVerificationMetadata:(id)a3;
- (void)_xpcFinishTestVerificationSession:(id)a3;
- (void)_xpcGetActiveRegion:(id)a3;
- (void)_xpcGetAllRegionAgencyConfig:(id)a3;
- (void)_xpcGetAllRegionConfig:(id)a3;
- (void)_xpcGetAllRegionGeneralConfig:(id)a3;
- (void)_xpcGetAllRegionServerConfig:(id)a3;
- (void)_xpcGetCurrentAgencyConfig:(id)a3;
- (void)_xpcGetDataVaultSize:(id)a3;
- (void)_xpcGetDiagnosisKeys:(id)a3 testMode:(BOOL)a4;
- (void)_xpcGetDiagnosisKeysCompletion:(id)a3 didPrompt:(BOOL)a4 testMode:(BOOL)a5 error:(id)a6;
- (void)_xpcGetEntities:(id)a3;
- (void)_xpcGetInfo:(id)a3;
- (void)_xpcGetLastExposureNotification:(id)a3;
- (void)_xpcGetPreAuthorizeDiagnosisKeysEnabled:(id)a3;
- (void)_xpcGetRegionAgencyConfig:(id)a3;
- (void)_xpcGetRegionConfig:(id)a3;
- (void)_xpcGetRegionHistory:(id)a3;
- (void)_xpcGetRegionHistoryEnabled:(id)a3;
- (void)_xpcGetRegionMonitorEnabled:(id)a3;
- (void)_xpcGetRegionServerConfig:(id)a3;
- (void)_xpcGetRegionSystemConfig:(id)a3;
- (void)_xpcGetRemotePresentationRequestIfNeeded:(id)a3;
- (void)_xpcGetStatusForBundleIdentifier:(id)a3;
- (void)_xpcGetSubdivisionList:(id)a3;
- (void)_xpcGetTravelStatusEnabled:(id)a3;
- (void)_xpcGetUserTraveled:(id)a3;
- (void)_xpcGetUserTraveledPromptWithCompletion:(id)a3;
- (void)_xpcGetUserTraveledReplyAllowed:(BOOL)a3 request:(id)a4;
- (void)_xpcLegalConsentPageCount:(id)a3;
- (void)_xpcManagerActivate:(id)a3;
- (void)_xpcMessageAddCommonKeys:(id)a3 allowed:(BOOL)a4;
- (void)_xpcNotificationTrigger:(id)a3;
- (void)_xpcOnboardingDidStart:(id)a3;
- (void)_xpcPreAuthorizeDiagnosisKeys:(id)a3;
- (void)_xpcPreAuthorizeDiagnosisKeysComplete:(id)a3 userDecision:(BOOL)a4;
- (void)_xpcRemotePresentationReceivedDecision:(id)a3;
- (void)_xpcRequestPreAuthorizedDiagnosisKeys:(id)a3;
- (void)_xpcResetData:(id)a3;
- (void)_xpcSendMessage:(id)a3;
- (void)_xpcSendReplyError:(id)a3 reply:(id)a4;
- (void)_xpcSendReplyError:(id)a3 request:(id)a4;
- (void)_xpcSetActiveApp:(id)a3;
- (void)_xpcSetActiveEntity:(id)a3;
- (void)_xpcSetActiveRegion:(id)a3;
- (void)_xpcSetAutomaticRegionSwitch:(id)a3;
- (void)_xpcSetAvailabilityAlertEnabled:(id)a3;
- (void)_xpcSetDeveloperRegionServerConfig:(id)a3;
- (void)_xpcSetEnabled:(id)a3;
- (void)_xpcSetMonthlySummaryAlertEnabled:(id)a3;
- (void)_xpcSetPaused:(id)a3;
- (void)_xpcSetPreAuthorizeDiagnosisKeysEnabled:(id)a3;
- (void)_xpcSetRegionConsent:(id)a3;
- (void)_xpcSetRegionHistoryEnabled:(id)a3;
- (void)_xpcSetTravelStatusEnabled:(id)a3;
- (void)_xpcShowBuddy:(id)a3;
- (void)_xpcStartSelfReportWebSession:(id)a3;
- (void)_xpcStartTestVerificationSession:(id)a3;
- (void)_xpcTCCCheck:(id)a3;
- (void)_xpcVerifyTextMessage:(id)a3;
- (void)enqueuePreAuthorizedLockScreenActionForRequest:(id)a3 outError:(id *)a4;
- (void)invalidate;
- (void)setClient:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDetectionSession:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setManager:(id)a3;
- (void)setSkipFileSigningVerification:(BOOL)a3;
- (void)setXpcCnx:(id)a3;
- (void)updateDiagnosisKeysPreAuthorizationForRequest:(id)a3 withDecision:(BOOL)a4 errorOut:(id *)a5;
- (void)xpcConnectionEvent:(id)a3;
- (void)xpcPreAuthorizedDiagnosisKeysAvailable;
- (void)xpcReportActivityFlags:(unsigned int)a3;
- (void)xpcStatusChanged;
@end

@implementation ENXPCConnection

- (void)setXpcCnx:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setDaemon:(id)a3
{
}

- (void)setClient:(id)a3
{
}

- (void)_xpcGetEntities:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0;
  v31 = (id *)&v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __35__ENXPCConnection__xpcGetEntities___block_invoke;
  v27[3] = &unk_1E69ACB90;
  v29 = &v30;
  v27[4] = self;
  id v5 = v4;
  id v28 = v5;
  v6 = (void (**)(void))MEMORY[0x1D9439FF0](v27);
  v7 = v31;
  id obj = v31[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    v9 = [(ENDaemon *)self->_daemon activeEntity];
    v10 = [v9 entity];
    v11 = (void *)[v10 copy];

    v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
    LODWORD(v10) = [v12 isSensitiveLoggingAllowed];

    if (v10
      && gLogCategory_ENDaemon <= 30
      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v13 = objc_opt_new();
    v14 = objc_opt_new();
    v15 = [(ENDaemon *)self->_daemon configurationManager];
    v16 = [v15 configurationStore];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__ENXPCConnection__xpcGetEntities___block_invoke_2;
    v20[3] = &unk_1E69ADA00;
    v20[4] = self;
    id v17 = v11;
    id v21 = v17;
    id v18 = v13;
    id v22 = v18;
    id v19 = v14;
    id v23 = v19;
    id v24 = v5;
    v25 = &v30;
    [v16 allRegionConfigurationsWithCompletion:v20];
  }
  v6[2](v6);

  _Block_object_dispose(&v30, 8);
}

- (ENManager)manager
{
  return self->_manager;
}

void __35__ENXPCConnection__xpcGetEntities___block_invoke_3(uint64_t a1)
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  v2 = (void *)TCCAccessCopyInformation();
  v3 = (void *)MEMORY[0x1E4FA99F0];
  v113 = [MEMORY[0x1E4F28F68] predicateWithFormat:@"%K == %@", *MEMORY[0x1E4FA99F0], *MEMORY[0x1E4F1CFD8]];
  id v4 = objc_msgSend(v2, "filteredArrayUsingPredicate:");
  [MEMORY[0x1E4F28F68] predicateWithFormat:@"%K == %@", *v3, *MEMORY[0x1E4F1CFC0]];
  v112 = v114 = v2;
  v118 = objc_msgSend(v2, "filteredArrayUsingPredicate:");
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) regionMonitor];
  id v136 = 0;
  v115 = [v5 getAllRegionsWithError:&v136];
  id v6 = v136;

  v111 = v6;
  if ((v6 || !v115)
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v8 = [v7 isSensitiveLoggingAllowed];

  if (v8 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v107 = v115;
    LogPrintF_safe();
  }
  v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v10 = [v9 isSensitiveLoggingAllowed];

  if (v10 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v108 = *(void **)(a1 + 40);
    LogPrintF_safe();
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v132 objects:v141 count:16];
  v13 = (void *)MEMORY[0x1E4FA99E0];
  v120 = v11;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v133;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v133 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v132 + 1) + 8 * i), "objectForKey:", *v13, v108);
        if (v17)
        {
          uint64_t v18 = v17;
          id v19 = [*(id *)(*(void *)(a1 + 32) + 32) _getBundleIDFromBundle:v17];
          if (v19)
          {
            v20 = [*(id *)(*(void *)(a1 + 32) + 32) _getInfoDictFromBundle:v18];
            if (v20)
            {
              id v21 = [*(id *)(*(void *)(a1 + 32) + 32) regionForBundleInfo:v20];
              id v22 = (void *)[objc_alloc(MEMORY[0x1E4F25728]) initWithBundleID:v19 region:v21];
              id v23 = [*(id *)(a1 + 48) bundleIdentifier];
              char v24 = [v19 isEqual:v23];

              if ((v24 & 1) == 0)
              {
                v25 = [*(id *)(a1 + 48) region];
                char v26 = [v21 isEqual:v25];

                if ((v26 & 1) == 0) {
                  [*(id *)(a1 + 56) addObject:v22];
                }
              }

              id v11 = v120;
              v13 = (void *)MEMORY[0x1E4FA99E0];
            }
          }
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v132 objects:v141 count:16];
    }
    while (v14);
  }

  long long v131 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v128 = 0u;
  id v27 = v118;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v128 objects:v140 count:16];
  v119 = v27;
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v129;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v129 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * j), "objectForKey:", *v13, v108);
        if (v32)
        {
          uint64_t v33 = v32;
          v34 = [*(id *)(*(void *)(a1 + 32) + 32) _getBundleIDFromBundle:v32];
          if (v34)
          {
            id v35 = [*(id *)(*(void *)(a1 + 32) + 32) _getInfoDictFromBundle:v33];
            if (v35)
            {
              v36 = [*(id *)(*(void *)(a1 + 32) + 32) regionForBundleInfo:v35];
              v37 = (void *)[objc_alloc(MEMORY[0x1E4F25728]) initWithBundleID:v34 region:v36];
              v38 = [*(id *)(a1 + 48) bundleIdentifier];
              char v39 = [v34 isEqual:v38];

              if ((v39 & 1) == 0)
              {
                v40 = [*(id *)(a1 + 48) region];
                char v41 = [v36 isEqual:v40];

                if ((v41 & 1) == 0) {
                  [*(id *)(a1 + 64) addObject:v37];
                }
              }

              id v27 = v119;
              v13 = (void *)MEMORY[0x1E4FA99E0];
            }
          }
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v128 objects:v140 count:16];
    }
    while (v29);
  }

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v42 = *(id *)(a1 + 40);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v124 objects:v139 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v125;
    id v116 = v42;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v125 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v124 + 1) + 8 * k);
        v48 = objc_msgSend(v47, "region", v108);
        v49 = [*(id *)(*(void *)(a1 + 32) + 32) configurationManager];
        v50 = [v49 configurationStore];
        v51 = [v50 serverConfigurationForRegion:v48];

        if (v51)
        {
          if ([v51 enEnabled])
          {
            if ((unint64_t)[v51 enVersion] >= 2)
            {
              v52 = [*(id *)(a1 + 48) region];
              char v53 = [v48 isEqual:v52];

              if ((v53 & 1) == 0)
              {
                id v54 = objc_alloc(MEMORY[0x1E4F25728]);
                v55 = [v51 appBundleID];
                v56 = (void *)[v54 initWithBundleID:v55 region:v48];

                v57 = [v56 bundleIdentifier];
                if ([v57 length])
                {

                  goto LABEL_61;
                }
                v58 = [v56 region];

                if (!v58) {
                  goto LABEL_104;
                }
LABEL_61:
                v59 = [v47 userConsent];
                uint64_t v60 = [v59 consent];

                if (v60 == 2)
                {
                  v61 = (void *)MEMORY[0x1E4F28F68];
                  v109 = [v56 region];
                  [v61 predicateWithFormat:@"region == %@"];
                  id v62 = (id)objc_claimAutoreleasedReturnValue();

                  v117 = [*(id *)(a1 + 64) filteredSetUsingPredicate:v62];
                  v63 = +[ENLoggingPrefs sharedENLoggingPrefs];
                  LODWORD(v61) = [v63 isSensitiveLoggingAllowed];

                  if (v61
                    && gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v109 = *(void **)(a1 + 64);
                    LogPrintF_safe();
                  }
                  v73 = +[ENLoggingPrefs sharedENLoggingPrefs];
                  int v74 = [v73 isSensitiveLoggingAllowed];

                  if (v74
                    && gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v110 = v117;
                    LogPrintF_safe();
                  }
                  if ((objc_msgSend(*(id *)(a1 + 64), "containsObject:", v56, v110) & 1) != 0
                    || ([v117 containsObject:v56] & 1) != 0)
                  {
                    v75 = +[ENLoggingPrefs sharedENLoggingPrefs];
                    int v76 = [v75 isSensitiveLoggingAllowed];

                    if (v76
                      && gLogCategory_ENDaemon <= 30
                      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      v108 = v56;
                      LogPrintF_safe();
                    }
                  }
                  else
                  {
                    v77 = +[ENLoggingPrefs sharedENLoggingPrefs];
                    int v78 = [v77 isSensitiveLoggingAllowed];

                    if (v78
                      && gLogCategory_ENDaemon <= 30
                      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF_safe();
                      objc_msgSend(*(id *)(a1 + 56), "addObject:", v56, v56);
                    }
                    else
                    {
                      objc_msgSend(*(id *)(a1 + 56), "addObject:", v56, v108);
                    }
                  }

                  goto LABEL_103;
                }
                if (([v115 containsObject:v48] & 1) == 0)
                {
                  v64 = [v48 countryCode];
                  v65 = [*(id *)(*(void *)(a1 + 32) + 32) prefRegionIdentifierOverride];
                  id v62 = v64;
                  id v66 = v65;
                  if (v62 == v66)
                  {
                  }
                  else
                  {
                    v67 = v66;
                    if ((v62 == 0) == (v66 != 0))
                    {

                      goto LABEL_103;
                    }
                    char v68 = [v62 isEqual:v66];

                    if ((v68 & 1) == 0) {
                      goto LABEL_104;
                    }
                  }
                }
                v69 = [*(id *)(*(void *)(a1 + 32) + 32) configurationManager];
                v70 = [v69 configurationStore];
                id v62 = [v70 agencyConfigurationForRegion:v48];

                if (v62)
                {
                  if (([*(id *)(a1 + 56) containsObject:v56] & 1) == 0) {
                    [*(id *)(a1 + 64) addObject:v56];
                  }
                }
                else
                {
                  v71 = +[ENLoggingPrefs sharedENLoggingPrefs];
                  int v72 = [v71 isSensitiveLoggingAllowed];

                  if (v72
                    && gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v108 = 0;
                    LogPrintF_safe();
                  }
                }
LABEL_103:

LABEL_104:
                id v42 = v116;
              }
            }
          }
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v124 objects:v139 count:16];
    }
    while (v44);
  }

  v79 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v80 = [v79 isSensitiveLoggingAllowed];

  if (v80 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v108 = *(void **)(a1 + 56);
    LogPrintF_safe();
  }
  v81 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v82 = [v81 isSensitiveLoggingAllowed];

  if (v82 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 72));
  if (reply)
  {
    uint64_t v84 = *(void *)(a1 + 48);
    uint64_t v85 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v85 + 40);
    v86 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v84 requiringSecureCoding:1 error:&obj];
    objc_storeStrong((id *)(v85 + 40), obj);
    id v87 = v86;
    xpc_dictionary_set_data(reply, "acEn", (const void *)[v87 bytes], objc_msgSend(v87, "length"));
    CFDataGetTypeID();
    uint64_t v88 = CFPrefs_CopyTypedValue();
    v89 = (void *)v88;
    if (v88) {
      v90 = (void *)v88;
    }
    else {
      v90 = v87;
    }
    id v91 = v90;

    id v92 = v91;
    v93 = (const void *)[v92 bytes];
    size_t v94 = [v92 length];

    xpc_dictionary_set_data(reply, "tnEn", v93, v94);
    v95 = (void *)MEMORY[0x1E4F28DA8];
    v96 = [*(id *)(a1 + 56) allObjects];
    v138 = v96;
    v97 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v138 count:1];
    uint64_t v98 = *(void *)(*(void *)(a1 + 80) + 8);
    id v122 = *(id *)(v98 + 40);
    v99 = [v95 archivedDataWithRootObject:v97 requiringSecureCoding:1 error:&v122];
    objc_storeStrong((id *)(v98 + 40), v122);

    id v100 = v99;
    xpc_dictionary_set_data(reply, "auEn", (const void *)[v100 bytes], objc_msgSend(v100, "length"));
    v101 = (void *)MEMORY[0x1E4F28DA8];
    v102 = [*(id *)(a1 + 64) allObjects];
    v137 = v102;
    v103 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v137 count:1];
    uint64_t v104 = *(void *)(*(void *)(a1 + 80) + 8);
    id v121 = *(id *)(v104 + 40);
    v105 = [v101 archivedDataWithRootObject:v103 requiringSecureCoding:1 error:&v121];
    objc_storeStrong((id *)(v104 + 40), v121);

    id v106 = v105;
    xpc_dictionary_set_data(reply, "avaEn", (const void *)[v106 bytes], objc_msgSend(v106, "length"));
    [*(id *)(a1 + 32) _xpcSendMessage:reply];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_xpcSendMessage:(id)a3
{
  xpc_object_t message = a3;
  id v4 = self->_xpcCnx;
  id v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

uint64_t __35__ENXPCConnection__xpcGetEntities___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        int v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcManagerActivate:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __39__ENXPCConnection__xpcManagerActivate___block_invoke;
  v39[3] = &unk_1E69ACB90;
  char v41 = &v42;
  v39[4] = self;
  id v5 = v4;
  id v40 = v5;
  id v35 = (void (**)(void))MEMORY[0x1D9439FF0](v39);
  id v6 = (id *)(v43 + 5);
  id obj = (id)v43[5];
  BOOL v7 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    id v36 = v5;
    if (self->_manager)
    {
      uint64_t v32 = ENErrorF();
      xpc_object_t reply = (xpc_object_t)v43[5];
      v43[5] = v32;
LABEL_28:

      id v5 = v36;
      goto LABEL_29;
    }
    int v8 = (id *)(v43 + 5);
    id v37 = (id)v43[5];
    BOOL v9 = [(ENXPCConnection *)self _xpcManagerActivateIfNecessaryWithRequest:v5 error:&v37];
    objc_storeStrong(v8, v37);
    if (v9)
    {
      [(ENDaemon *)self->_daemon setUsageManagerActivate:[(ENDaemon *)self->_daemon usageManagerActivate] + 1];
      [(ENDaemon *)self->_daemon _scheduleUpdate];
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      if (!reply)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_28;
      }
      [(ENXPCConnection *)self _xpcMessageAddCommonKeys:reply allowed:[(ENXPCConnection *)self _appActiveStatusWithError:0]];
      [(ENXPCConnection *)self _xpcSendMessage:reply];
      CFStringGetTypeID();
      id v11 = (void *)CFPrefs_CopyTypedValue();
      if (!v11) {
        goto LABEL_26;
      }
      v34 = [(ENDaemon *)self->_daemon activeEntity];
      uint64_t v33 = [v34 entity];
      uint64_t v12 = [v33 bundleIdentifier];
      id v13 = v11;
      id v14 = v12;
      uint64_t v15 = v14;
      if (v13 == v14)
      {
      }
      else
      {
        if (!v14)
        {
          int v17 = 0;
LABEL_18:

LABEL_19:
          v25 = [(ENXPCConnection *)self client];
          char v26 = [v25 signingIdentity];
          id v27 = v26;
          if (v26 != @"com.apple.enutil")
          {
            if (!v26)
            {
              int v28 = 0;
LABEL_24:

              if ((v17 | v28) == 1) {
                [(ENXPCConnection *)self enqueuePreAuthorizedLockScreenActionForRequest:v36 outError:0];
              }
LABEL_26:

              daemon = self->_daemon;
              uint64_t v30 = [(ENXPCClient *)self->_client signingIdentity];
              uint64_t v31 = [(ENDaemon *)daemon appDequeueActivityFlagsWithBundleID:v30];

              if (v31) {
                [(ENXPCConnection *)self xpcReportActivityFlags:v31];
              }
              goto LABEL_28;
            }
            int v28 = [(__CFString *)v26 isEqual:@"com.apple.enutil"];

            if (!v28) {
              goto LABEL_24;
            }
          }
          int v28 = IsAppleInternalBuild() != 0;
          goto LABEL_24;
        }
        int v16 = [v13 isEqual:v14];

        if (!v16)
        {
          int v17 = 0;
          goto LABEL_19;
        }
      }
      id v13 = [(ENXPCConnection *)self client];
      uint64_t v18 = [v13 signingIdentity];
      id v19 = [(ENDaemon *)self->_daemon activeEntity];
      v20 = [v19 entity];
      id v21 = [v20 bundleIdentifier];
      id v22 = v18;
      id v23 = v21;
      char v24 = v23;
      if (v22 == v23)
      {
        int v17 = 1;
      }
      else if ((v22 == 0) == (v23 != 0))
      {
        int v17 = 0;
      }
      else
      {
        int v17 = [v22 isEqual:v23];
      }

      goto LABEL_18;
    }
  }
LABEL_29:
  v35[2](v35);

  _Block_object_dispose(&v42, 8);
}

uint64_t __39__ENXPCConnection__xpcManagerActivate___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        int v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcMessageAddCommonKeys:(id)a3 allowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  xpc_object_t xdict = v6;
  if (v4)
  {
    xpc_dictionary_set_BOOL(v6, "enbd", [(ENDaemon *)self->_daemon prefEnabled]);
    xpc_dictionary_set_BOOL(xdict, "paus", [(ENDaemon *)self->_daemon prefPaused]);
    BOOL v7 = [(ENDaemon *)self->_daemon prefDifferentialPrivacyConsent] == 2;
  }
  else
  {
    xpc_dictionary_set_BOOL(v6, "enbd", 0);
    xpc_dictionary_set_BOOL(xdict, "paus", 0);
    BOOL v7 = 0;
  }
  xpc_dictionary_set_BOOL(xdict, "dpEn", v7);
  int v8 = [(ENXPCClient *)self->_client appAPIVersion];
  if (v4)
  {
    int64_t v9 = [(ENDaemon *)self->_daemon getOverallStatus];
  }
  else if (v8 <= 1)
  {
    int64_t v9 = 4;
  }
  else
  {
    int64_t v9 = 6;
  }
  xpc_dictionary_set_int64(xdict, "stat", v9);
}

- (BOOL)_xpcManagerActivateIfNecessaryWithRequest:(id)a3 error:(id *)a4
{
  if (!self->_manager)
  {
    id v5 = a3;
    int64_t int64 = xpc_dictionary_get_int64(v5, "apiV");
    CUXPCDecodeNSString();
    CUXPCDecodeBool();

    [(ENXPCClient *)self->_client accessLevel];
    [(ENXPCClient *)self->_client activateWithAppAPIVersion:int64 regionISO:0];
    BOOL v7 = (ENManager *)objc_alloc_init(MEMORY[0x1E4F257A0]);
    manager = self->_manager;
    self->_manager = v7;

    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  return 1;
}

- (BOOL)_entitledForAccessLevel:(int)a3 error:(id *)a4
{
  int v6 = [(ENXPCClient *)self->_client accessLevel];
  int v7 = v6;
  if (a4 && v6 < a3)
  {
    ENErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 >= a3;
}

void __35__ENXPCConnection__xpcGetEntities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ENXPCConnection__xpcGetEntities___block_invoke_3;
  block[3] = &unk_1E69AD9D8;
  block[4] = v4;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  id v14 = v6;
  uint64_t v15 = v7;
  id v8 = v3;
  dispatch_async(v5, block);
}

- (void)xpcConnectionEvent:(id)a3
{
  id v9 = a3;
  uint64_t v4 = MEMORY[0x1D943A770]();
  if (v4 == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = [(ENXPCConnection *)self _xpcConnectionRequest:v9];
    goto LABEL_14;
  }
  id v5 = v9;
  if (v9 == (id)MEMORY[0x1E4F14528])
  {
    if (gLogCategory_ENDaemon <= 20 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      [(ENXPCClient *)self->_client pid];
      id v8 = CUPrintPID();
      LogPrintF_safe();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    uint64_t v4 = [(ENXPCConnection *)self invalidate];
    goto LABEL_14;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v9, v4))
    {
      uint64_t v7 = CUPrintXPC();
      LogPrintF_safe();

LABEL_14:
      id v5 = v9;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_xpcConnectionRequest:(id)a3
{
  id v11 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v11, "mTyp");
  int64_t v5 = int64;
  if (int64 > 150)
  {
    switch(int64)
    {
      case 200:
        [(ENXPCConnection *)self _xpcGetStatusForBundleIdentifier:v11];
        break;
      case 201:
        [(ENXPCConnection *)self _xpcGetInfo:v11];
        break;
      case 202:
        [(ENXPCConnection *)self _xpcSetActiveApp:v11];
        break;
      case 203:
      case 208:
LABEL_31:
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        if (xpc_dictionary_expects_reply())
        {
          int64_t v10 = v5;
          id v9 = ENErrorF();
          -[ENXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v11, v10);
        }
        break;
      case 204:
        [(ENXPCConnection *)self _xpcGetLastExposureNotification:v11];
        break;
      case 205:
        [(ENXPCConnection *)self _xpcDownload:v11];
        break;
      case 206:
        [(ENXPCConnection *)self _xpcSetActiveRegion:v11];
        break;
      case 207:
        [(ENXPCConnection *)self _xpcSetAutomaticRegionSwitch:v11];
        break;
      case 209:
        [(ENXPCConnection *)self _xpcOnboardingDidStart:v11];
        break;
      case 210:
        [(ENXPCConnection *)self _xpcGetPreAuthorizeDiagnosisKeysEnabled:v11];
        break;
      case 211:
        [(ENXPCConnection *)self _xpcSetPreAuthorizeDiagnosisKeysEnabled:v11];
        break;
      case 212:
        [(ENXPCConnection *)self _xpcGetRemotePresentationRequestIfNeeded:v11];
        break;
      case 213:
        [(ENXPCConnection *)self _xpcRemotePresentationReceivedDecision:v11];
        break;
      case 214:
        [(ENXPCConnection *)self _xpcGetDataVaultSize:v11];
        break;
      case 215:
        [(ENXPCConnection *)self _xpcSetAvailabilityAlertEnabled:v11];
        break;
      case 216:
        [(ENXPCConnection *)self _xpcSetMonthlySummaryAlertEnabled:v11];
        break;
      case 217:
        [(ENXPCConnection *)self _xpcShowBuddy:v11];
        break;
      case 218:
        [(ENXPCConnection *)self _xpcVerifyTextMessage:v11];
        break;
      case 219:
        [(ENXPCConnection *)self _xpcLegalConsentPageCount:v11];
        break;
      default:
        switch(int64)
        {
          case 300:
            [(ENXPCConnection *)self _xpcStartTestVerificationSession:v11];
            break;
          case 301:
            [(ENXPCConnection *)self _xpcFetchTestVerificationMetadata:v11];
            break;
          case 302:
            [(ENXPCConnection *)self _xpcFinishTestVerificationSession:v11];
            break;
          case 303:
            [(ENXPCConnection *)self _xpcStartSelfReportWebSession:v11];
            break;
          default:
            if (int64 != 151) {
              goto LABEL_31;
            }
            [(ENXPCConnection *)self _xpcSetActiveEntity:v11];
            break;
        }
        break;
    }
  }
  else
  {
    switch(int64)
    {
      case 10:
        [(ENXPCConnection *)self _xpcManagerActivate:v11];
        break;
      case 11:
        [(ENXPCConnection *)self _xpcSetEnabled:v11];
        break;
      case 12:
      case 19:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 45:
      case 46:
      case 47:
      case 59:
      case 60:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
        goto LABEL_31;
      case 13:
        [(ENXPCConnection *)self _xpcEntitlementCheck:v11];
        break;
      case 14:
        [(ENXPCConnection *)self _xpcSetPaused:v11];
        break;
      case 15:
        [(ENXPCConnection *)self _xpcGetUserTraveled:v11];
        break;
      case 16:
        [(ENXPCConnection *)self _xpcPreAuthorizeDiagnosisKeys:v11];
        break;
      case 17:
        [(ENXPCConnection *)self _xpcGetTravelStatusEnabled:v11];
        break;
      case 18:
        [(ENXPCConnection *)self _xpcSetTravelStatusEnabled:v11];
        break;
      case 20:
        id v6 = self;
        id v7 = v11;
        uint64_t v8 = 0;
        goto LABEL_47;
      case 21:
        [(ENXPCConnection *)self _xpcResetData:v11];
        break;
      case 22:
        id v6 = self;
        id v7 = v11;
        uint64_t v8 = 1;
LABEL_47:
        [(ENXPCConnection *)v6 _xpcGetDiagnosisKeys:v7 testMode:v8];
        break;
      case 23:
        [(ENXPCConnection *)self _xpcRequestPreAuthorizedDiagnosisKeys:v11];
        break;
      case 40:
        [(ENXPCConnection *)self _xpcExposureDetectionFileActivate:v11];
        break;
      case 41:
        [(ENXPCConnection *)self _xpcExposureDetectionFileAdd:v11];
        break;
      case 42:
        [(ENXPCConnection *)self _xpcExposureDetectionFileFinish:v11];
        break;
      case 43:
        [(ENXPCConnection *)self _xpcExposureDetectionFileGetExposures:v11];
        break;
      case 44:
        [(ENXPCConnection *)self _xpcExposureDetectionFileGetExposureWindows:v11];
        break;
      case 48:
        [(ENXPCConnection *)self _xpcExposureDetectionHistoryGetFiles:v11];
        break;
      case 49:
        [(ENXPCConnection *)self _xpcExposureDetectionHistoryGetSessions:v11];
        break;
      case 50:
        [(ENXPCConnection *)self _xpcGetActiveRegion:v11];
        break;
      case 51:
        [(ENXPCConnection *)self _xpcGetRegionConfig:v11];
        break;
      case 52:
        [(ENXPCConnection *)self _xpcGetAllRegionConfig:v11];
        break;
      case 53:
        [(ENXPCConnection *)self _xpcSetRegionConsent:v11];
        break;
      case 54:
        [(ENXPCConnection *)self _xpcSetDeveloperRegionServerConfig:v11];
        break;
      case 55:
        [(ENXPCConnection *)self _xpcGetRegionHistory:v11];
        break;
      case 56:
        [(ENXPCConnection *)self _xpcGetRegionHistoryEnabled:v11];
        break;
      case 57:
        [(ENXPCConnection *)self _xpcSetRegionHistoryEnabled:v11];
        break;
      case 58:
        [(ENXPCConnection *)self _xpcGetCurrentAgencyConfig:v11];
        break;
      case 61:
        [(ENXPCConnection *)self _xpcGetRegionMonitorEnabled:v11];
        break;
      case 62:
        [(ENXPCConnection *)self _xpcGetSubdivisionList:v11];
        break;
      case 70:
        [(ENXPCConnection *)self _xpcTCCCheck:v11];
        break;
      default:
        switch(int64)
        {
          case 'd':
            [(ENXPCConnection *)self _xpcDiagnosticControl:v11];
            break;
          case 'e':
            [(ENXPCConnection *)self _xpcDiagnosticLog:v11];
            break;
          case 'f':
            [(ENXPCConnection *)self _xpcDiagnosticShow:v11];
            break;
          case 'g':
            [(ENXPCConnection *)self _xpcNotificationTrigger:v11];
            break;
          default:
            if (int64 != 150) {
              goto LABEL_31;
            }
            [(ENXPCConnection *)self _xpcGetEntities:v11];
            break;
        }
        break;
    }
  }
}

- (void)invalidate
{
  id v3 = self->_userAlert;
  if (v3)
  {
    if (gLogCategory_ENDaemon < 31 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(ENUserAlert *)v3 invalidate];
    userAlert = self->_userAlert;
    self->_userAlert = 0;

    int64_t v5 = [(ENDaemon *)self->_daemon userAlert];

    if (v3 == v5) {
      [(ENDaemon *)self->_daemon setUserAlert:0];
    }
  }

  id v6 = self->_detectionSession;
  if (v6)
  {
    id v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
    char v8 = [v7 isSensitiveLoggingAllowed];

    if ((v8 & 1) != 0
      && gLogCategory_ENDaemon <= 30
      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v20 = v6;
      LogPrintF_safe();
    }
    [(ENExposureDetectionDaemonSession *)v6 invalidate];
    detectionSession = self->_detectionSession;
    self->_detectionSession = 0;
  }
  int64_t v10 = self->_manager;
  if (v10)
  {
    if (gLogCategory_ENDaemon < 31 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v20 = v10;
      LogPrintF_safe();
    }
    [(ENManager *)v10 invalidate];
    manager = self->_manager;
    self->_manager = 0;
  }
  id v12 = [(ENDaemon *)self->_daemon onboardingRegionTrigger];
  if (v12)
  {
    id v13 = [(ENXPCClient *)self->_client signingIdentity];
    char v14 = [v13 isEqualToString:@"com.apple.Preferences"];

    if (v14)
    {
      uint64_t v15 = [(ENDaemon *)self->_daemon configurationManager];
      int v16 = [v15 configurationStore];

      int v17 = [v16 configurationForRegion:v12];
      if (v17)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
          -[ENXPCConnection _sendOnboardingMetricForRegionConfiguration:](self, "_sendOnboardingMetricForRegionConfiguration:", v17, v12);
        }
        else
        {
          -[ENXPCConnection _sendOnboardingMetricForRegionConfiguration:](self, "_sendOnboardingMetricForRegionConfiguration:", v17, v20);
        }
      }

      [(ENDaemon *)self->_daemon setOnboardingTrigger:0];
      [(ENDaemon *)self->_daemon setOnboardingRegionTrigger:0];
      [(ENDaemon *)self->_daemon setOnboardingFirstTime:0];
      [(ENDaemon *)self->_daemon setOnboardingLegalConsentLastViewCount:[(ENDaemon *)self->_daemon _getLegalConsentPageCount]];
    }
  }

  xpcCnx = self->_xpcCnx;
  if (xpcCnx) {
    xpc_connection_cancel(xpcCnx);
  }
  daemon = self->_daemon;

  [(ENDaemon *)daemon xpcConnectionInvalidated:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_detectionSession, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_userAlert, 0);
}

- (BOOL)_appActiveStatusWithError:(id *)a3
{
  int64_t v5 = [(ENXPCClient *)self->_client signingIdentity];
  id v6 = v5;
  if (!v5)
  {
    if (a3)
    {
LABEL_21:
      ENErrorF();
      BOOL v19 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_22:
    BOOL v19 = 0;
    goto LABEL_15;
  }
  if (v5 == @"com.apple.enutil") {
    int v7 = 1;
  }
  else {
    int v7 = [(__CFString *)v5 isEqual:@"com.apple.enutil"];
  }
  int v8 = [(__CFString *)v6 hasPrefix:@"com.apple."];
  id v9 = [(ENDaemon *)self->_daemon activeEntity];
  int64_t v10 = [v9 entity];
  id v11 = [v10 bundleIdentifier];
  id v12 = v6;
  id v13 = v11;
  char v14 = v13;
  if (v12 == v13)
  {
  }
  else
  {
    if (!v13)
    {

      goto LABEL_17;
    }
    char v15 = [(__CFString *)v12 isEqual:v13];

    if ((v15 & 1) == 0)
    {
LABEL_17:

      if (((v7 | v8) & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_14;
    }
  }
  int v16 = [(ENDaemon *)self->_daemon activeEntity];
  int v17 = [v16 activeStatus];

  if (v17 == 3) {
    int v18 = v7;
  }
  else {
    int v18 = 1;
  }
  if (((v18 | v8) & 1) == 0)
  {
LABEL_18:
    if (a3) {
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_14:
  BOOL v19 = 1;
LABEL_15:

  return v19;
}

- (id)description
{
  return [(ENXPCConnection *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if (self->_xpcCnx)
  {
    [(ENXPCClient *)self->_client pid];
    NSAppendPrintF();
    uint64_t v4 = (__CFString *)0;
  }
  else
  {
    uint64_t v4 = 0;
  }
  manager = self->_manager;
  if (manager)
  {
    id v12 = manager;
    NSAppendPrintF_safe();
    id v6 = v4;

    uint64_t v4 = v6;
  }
  detectionSession = self->_detectionSession;
  if (detectionSession)
  {
    id v13 = detectionSession;
    NSAppendPrintF_safe();
    int v8 = v4;

    uint64_t v4 = v8;
  }
  if (v4) {
    id v9 = v4;
  }
  else {
    id v9 = &stru_1F2B29B10;
  }
  int64_t v10 = v9;

  return v10;
}

- (BOOL)_authorizedAndReturnError:(id *)a3
{
  if (!MEMORY[0x1E4FA99B8])
  {
    if (!a3) {
      return 0;
    }
    ENErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v5 = 0;
    goto LABEL_10;
  }
  xpc_connection_get_audit_token();
  int v4 = TCCAccessCheckAuditToken();
  BOOL v5 = v4 != 0;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 0;
  }
  if (!v6)
  {
    ENErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    *a3 = v8;
  }
  return v5;
}

- (BOOL)_authorizationPreflightUnknownAndReturnError:(id *)a3
{
  if (MEMORY[0x1E4FA99B8])
  {
    xpc_connection_get_audit_token();
    return TCCAccessPreflightWithAuditToken() == 2;
  }
  else if (a3)
  {
    ENErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v5;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)_rateLimitAndReturnError:(id *)a3
{
  unint64_t Int64 = CFPrefs_GetInt64();
  double Current = CFAbsoluteTimeGetCurrent();
  CFPrefs_GetDouble();
  if (vabdd_f64(Current, v7) >= 86400.0)
  {
    CFPrefs_SetDouble();
    unint64_t Int64 = 0;
  }
  int v8 = [(ENXPCClient *)self->_client appAPIVersion];
  daemon = self->_daemon;
  if (v8 < 2) {
    unsigned int v10 = [(ENDaemon *)daemon prefRateLimitMaxAPICount];
  }
  else {
    unsigned int v10 = [(ENDaemon *)daemon prefRateLimitMaxAPICountV2];
  }
  unint64_t v11 = v10;
  if (Int64 >= v10)
  {
    if (a3)
    {
      ENErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    CFPrefs_SetInt64();
  }
  return Int64 < v11;
}

- (id)_regionConfigForXPCRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(ENDaemon *)self->_daemon configurationManager];
  if (v7)
  {
    int v8 = [(ENDaemon *)self->_daemon activeEntity];
    id v9 = [v8 entity];
    unsigned int v10 = [v9 region];

    objc_opt_class();
    unint64_t v11 = ENXPCDecodeSecureObjectIfPresent();
    if (v11)
    {
      id v12 = [v7 configurationStore];
      id v13 = [v12 configurationForRegion:v11];

      if (!v13)
      {
        if (a4) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else
    {
      if (!v10)
      {
        if (a4) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      char v14 = [v7 configurationStore];
      id v13 = [v14 configurationForRegion:v10];

      if (!v13)
      {
        if (a4)
        {
LABEL_17:
          ENErrorF();
          id v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
LABEL_18:
        id v13 = 0;
      }
    }
LABEL_8:

    goto LABEL_9;
  }
  if (a4)
  {
    ENErrorF();
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
LABEL_9:

  return v13;
}

- (id)_regionServerConfigForXPCRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(ENDaemon *)self->_daemon configurationManager];
  if (v7)
  {
    int v8 = [(ENDaemon *)self->_daemon activeEntity];
    id v9 = [v8 entity];
    unsigned int v10 = [v9 region];

    objc_opt_class();
    unint64_t v11 = ENXPCDecodeSecureObjectIfPresent();
    if (v11)
    {
      id v12 = [v7 configurationStore];
      id v13 = [v12 serverConfigurationForRegion:v11];

      if (!v13)
      {
        if (a4) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else
    {
      if (!v10)
      {
        if (a4) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      char v14 = [v7 configurationStore];
      id v13 = [v14 serverConfigurationForRegion:v10];

      if (!v13)
      {
        if (a4)
        {
LABEL_17:
          ENErrorF();
          id v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
LABEL_18:
        id v13 = 0;
      }
    }
LABEL_8:

    goto LABEL_9;
  }
  if (a4)
  {
    ENErrorF();
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
LABEL_9:

  return v13;
}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  double v7 = self->_xpcCnx;
  if (v7)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      [(ENXPCConnection *)self _xpcSendReplyError:v9 reply:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_xpcSendReplyError:(id)a3 reply:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  double v7 = self->_xpcCnx;
  if (v7)
  {
    CUXPCEncodeNSError();
    xpc_connection_send_message(v7, v6);
    int v8 = [(ENXPCClient *)self->_client signingIdentity];
    if (v8 != @"com.apple.enutil")
    {
      id v9 = v8;
      if (!v8
        || (char v10 = [(__CFString *)v8 isEqual:@"com.apple.enutil"],
            v9,
            v9,
            (v10 & 1) == 0))
      {
        unint64_t v11 = [v16 domain];
        int v12 = [v11 isEqualToString:*MEMORY[0x1E4F25700]];

        if (v12)
        {
          unint64_t v13 = [v16 code] - 5;
          if (v13 <= 0xB && ((0xCE9u >> v13) & 1) != 0)
          {
            uint64_t v14 = dword_1D3A7B1DC[v13];
            char v15 = [(ENDaemon *)self->_daemon delegate];
            [v15 sendErrorMetricWithType:v14];
          }
        }
      }
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_xpcEntitlementCheck:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  BOOL v5 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&v9];
  id v6 = v9;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v5)
  {
    if ([(ENDaemon *)self->_daemon getOverallStatus] == 4)
    {
      uint64_t v7 = ENErrorF();

      [(ENXPCConnection *)self _xpcSendReplyError:v7 request:v4];
      id v6 = (id)v7;
    }
    else
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v4);
      if (reply)
      {
        [(ENXPCConnection *)self _xpcSendMessage:reply];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
  else
  {
    [(ENXPCConnection *)self _xpcSendReplyError:v6 request:v4];
  }
}

- (void)_xpcGetUserTraveled:(id)a3
{
  id v4 = a3;
  uint64_t v36 = 0;
  id v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000;
  char v39 = __Block_byref_object_copy__3;
  id v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __39__ENXPCConnection__xpcGetUserTraveled___block_invoke;
  v33[3] = &unk_1E69ACB90;
  id v35 = &v36;
  v33[4] = self;
  id v5 = v4;
  id v34 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v33);
  uint64_t v7 = v37;
  id obj = v37[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    id v9 = v37;
    id v31 = v37[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v31];
    objc_storeStrong(v9 + 5, v31);
    if (v10)
    {
      unint64_t v11 = v37;
      id v30 = v37[5];
      BOOL v12 = [(ENXPCConnection *)self _appActiveStatusWithError:&v30];
      objc_storeStrong(v11 + 5, v30);
      if (v12)
      {
        if ([(ENDaemon *)self->_daemon overallStatus] != 1
          || ([(ENDaemon *)self->_daemon regionMonitor],
              unint64_t v13 = objc_claimAutoreleasedReturnValue(),
              uint64_t v14 = [v13 getAuthorizationState],
              v13,
              v14 != 2))
        {
          uint64_t v21 = ENErrorF();
          id v16 = v37[5];
          v37[5] = (id)v21;
          goto LABEL_15;
        }
        char v15 = v37;
        id v29 = v37[5];
        id v16 = [(ENXPCConnection *)self _regionConfigForXPCRequest:v5 error:&v29];
        objc_storeStrong(v15 + 5, v29);
        if (!v16)
        {
LABEL_15:

          goto LABEL_16;
        }
        int v17 = [(ENDaemon *)self->_daemon configurationManager];
        int v18 = [v17 configurationStore];

        if (!v18)
        {
          uint64_t v22 = ENErrorF();
          id v23 = v37[5];
          v37[5] = (id)v22;

          goto LABEL_14;
        }
        uint64_t v19 = [v16 travelerModeEnabled];
        if (v19 == 1)
        {
          uint64_t v20 = 0;
        }
        else
        {
          if (!v19)
          {
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __39__ENXPCConnection__xpcGetUserTraveled___block_invoke_2;
            v24[3] = &unk_1E69AD4E8;
            v24[4] = self;
            int v28 = &v36;
            id v25 = v5;
            char v26 = v16;
            id v27 = v18;
            [(ENXPCConnection *)self _xpcGetUserTraveledPromptWithCompletion:v24];

LABEL_14:
            goto LABEL_15;
          }
          uint64_t v20 = 1;
        }
        [(ENXPCConnection *)self _xpcGetUserTraveledReplyAllowed:v20 request:v5];
        goto LABEL_14;
      }
    }
  }
LABEL_16:
  v6[2](v6);

  _Block_object_dispose(&v36, 8);
}

uint64_t __39__ENXPCConnection__xpcGetUserTraveled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __39__ENXPCConnection__xpcGetUserTraveled___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 _xpcSendReplyError:v4 request:v6];
  }
  else
  {
    if (a2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [*(id *)(a1 + 48) setTravelerModeEnabled:v8];
    uint64_t v10 = *(void *)(a1 + 48);
    id v9 = *(void **)(a1 + 56);
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(id *)(v11 + 40);
    int v12 = [v9 saveRegionConfiguration:v10 error:&v19];
    objc_storeStrong((id *)(v11 + 40), v19);
    unint64_t v13 = *(void **)(a1 + 32);
    if (v12)
    {
      [v13 _xpcGetUserTraveledReplyAllowed:a2 request:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v14 = v13[6];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __39__ENXPCConnection__xpcGetUserTraveled___block_invoke_3;
      v16[3] = &unk_1E69AD4C0;
      uint64_t v15 = *(void *)(a1 + 64);
      v16[4] = v13;
      uint64_t v18 = v15;
      id v17 = *(id *)(a1 + 40);
      dispatch_async(v14, v16);
    }
  }
}

uint64_t __39__ENXPCConnection__xpcGetUserTraveled___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcSendReplyError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) request:*(void *)(a1 + 40)];
}

- (void)_xpcGetUserTraveledPromptWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__3;
  id v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke;
  v24[3] = &unk_1E69AD510;
  char v26 = &v27;
  id v5 = v4;
  id v25 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1D9439FF0](v24);
  if (self->_userAlert
    || ([(ENDaemon *)self->_daemon userAlert],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v8 = ENErrorF();
    id v9 = (id)v28[5];
    v28[5] = v8;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F4E270]);
    uint64_t v10 = objc_msgSend(v9, "applicationInfoForPID:", -[ENXPCClient pid](self->_client, "pid"));
    int Int64Ranged = CFDictionaryGetInt64Ranged();
    [v9 invalidate];
    if (Int64Ranged == 8)
    {
      int v12 = [(ENXPCClient *)self->_client signingIdentity];
      if (v12)
      {
        unint64_t v13 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v12 placeholder:0];
        uint64_t v14 = [v13 localizedName];

        id v15 = objc_alloc_init(MEMORY[0x1E4F25810]);
        objc_storeStrong((id *)&self->_userAlert, v15);
        [v15 setDispatchQueue:self->_dispatchQueue];
        [v15 setTitleKey:@"SHARE_TRAVEL_TITLE_FORMAT"];
        if (v14) {
          id v16 = v14;
        }
        else {
          id v16 = @"?";
        }
        [v15 setTitleParameter:v16];
        [v15 setSubTitleKey:@"SHARE_TRAVEL_MESSAGE"];
        [v15 setDefaultButtonTitleKey:@"SHARE_BUTTON"];
        [v15 setAlternativeButtonTitleKey:@"DONT_SHARE_BUTTON"];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke_2;
        v22[3] = &unk_1E69AD538;
        v22[4] = self;
        v22[5] = v15;
        id v17 = v5;
        id v23 = v17;
        [v15 setActionHandler:v22];
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke_3;
        v20[3] = &unk_1E69AD560;
        v20[4] = self;
        void v20[5] = v15;
        id v21 = v17;
        [v15 activateWithCompletionHandler:v20];
      }
      else
      {
        uint64_t v19 = ENErrorF();
        uint64_t v14 = (__CFString *)v28[5];
        v28[5] = v19;
      }
    }
    else
    {
      uint64_t v18 = ENErrorF();
      int v12 = (void *)v28[5];
      v28[5] = v18;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v27, 8);
}

uint64_t __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke_2(void *a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  uint64_t v2 = a1[4];
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  id v4 = (void *)a1[5];
  id v5 = [*(id *)(a1[4] + 32) userAlert];

  if (v4 == v5) {
    [*(id *)(a1[4] + 32) setUserAlert:0];
  }
  uint64_t v6 = *(uint64_t (**)(void))(a1[6] + 16);

  return v6();
}

void __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke_3(void *a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = a1[4];
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;

    id v5 = (void *)a1[5];
    uint64_t v6 = [*(id *)(a1[4] + 32) userAlert];

    if (v5 == v6) {
      [*(id *)(a1[4] + 32) setUserAlert:0];
    }
    (*(void (**)(void))(a1[6] + 16))(a1[6]);
  }
  else if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_xpcGetUserTraveledReplyAllowed:(BOOL)a3 request:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__3;
  id v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__ENXPCConnection__xpcGetUserTraveledReplyAllowed_request___block_invoke;
  v23[3] = &unk_1E69ACB90;
  id v25 = &v26;
  v23[4] = self;
  id v7 = v6;
  id v24 = v7;
  id v8 = (void (**)(void))MEMORY[0x1D9439FF0](v23);
  if (!v4)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    BOOL v16 = 0;
    goto LABEL_16;
  }
  id v9 = [(ENDaemon *)self->_daemon activeEntity];
  uint64_t v10 = [v9 entity];
  uint64_t v11 = [v10 region];

  int v12 = [(ENDaemon *)self->_daemon regionMonitor];
  unint64_t v13 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  uint64_t v14 = [v12 getAllRegionsWithError:&obj];
  objc_storeStrong(v13, obj);

  if (v27[5])
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    goto LABEL_26;
  }
  if (!v14 || !v11)
  {
    uint64_t v20 = ENErrorF();
    id v21 = (void *)v27[5];
    void v27[5] = v20;

LABEL_26:
    goto LABEL_18;
  }
  id v15 = [MEMORY[0x1E4F1CA88] setWithSet:v14];
  [v15 addObject:v11];
  BOOL v16 = (unint64_t)[v15 count] > 1;
  id v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v18 = [v17 isSensitiveLoggingAllowed];

  if (v18 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }

LABEL_16:
  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  uint64_t v11 = reply;
  if (reply)
  {
    xpc_dictionary_set_BOOL(reply, "userTraveled", v16);
    [(ENXPCConnection *)self _xpcSendMessage:v11];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_18:

  v8[2](v8);
  _Block_object_dispose(&v26, 8);
}

uint64_t __59__ENXPCConnection__xpcGetUserTraveledReplyAllowed_request___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        id v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetTravelStatusEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__3;
  id v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__ENXPCConnection__xpcGetTravelStatusEnabled___block_invoke;
  v23[3] = &unk_1E69ACB90;
  id v25 = &v26;
  v23[4] = self;
  id v5 = v4;
  id v24 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v23);
  uint64_t v7 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = (id *)(v27 + 5);
    id v21 = (id)v27[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v21];
    objc_storeStrong(v9, v21);
    if (v10)
    {
      uint64_t v11 = (id *)(v27 + 5);
      id v20 = (id)v27[5];
      int v12 = [(ENXPCConnection *)self _regionConfigForXPCRequest:v5 error:&v20];
      objc_storeStrong(v11, v20);
      if (v12)
      {
        uint64_t v13 = [v12 travelerModeEnabled];
        uint64_t v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v15 = [v14 isSensitiveLoggingAllowed];

        if (v15
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          BOOL v16 = [v12 region];
          uint64_t v19 = [v16 regionCode];
          LogPrintF_safe();
        }
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        int v18 = reply;
        if (reply)
        {
          xpc_dictionary_set_BOOL(reply, "enbd", v13 == 2);
          [(ENXPCConnection *)self _xpcSendMessage:v18];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v26, 8);
}

uint64_t __46__ENXPCConnection__xpcGetTravelStatusEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetTravelStatusEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__3;
  uint64_t v38 = __Block_byref_object_dispose__3;
  id v39 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __46__ENXPCConnection__xpcSetTravelStatusEnabled___block_invoke;
  v31[3] = &unk_1E69ACB90;
  uint64_t v33 = &v34;
  v31[4] = self;
  id v5 = v4;
  id v32 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v31);
  uint64_t v7 = (id *)(v35 + 5);
  id obj = (id)v35[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = (id *)(v35 + 5);
    id v29 = (id)v35[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v29];
    objc_storeStrong(v9, v29);
    if (v10)
    {
      uint64_t v11 = [(ENDaemon *)self->_daemon configurationManager];
      int v12 = [v11 configurationStore];

      if (v12)
      {
        uint64_t v13 = (id *)(v35 + 5);
        id v28 = (id)v35[5];
        uint64_t v14 = [(ENXPCConnection *)self _regionConfigForXPCRequest:v5 error:&v28];
        objc_storeStrong(v13, v28);
        if (v14)
        {
          BOOL v15 = xpc_dictionary_get_BOOL(v5, "enbd");
          BOOL v16 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v17 = [v16 isSensitiveLoggingAllowed];

          if (v17
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            if (v15) {
              int v18 = "yes";
            }
            else {
              int v18 = "no";
            }
            uint64_t v19 = [v14 region];
            [v19 regionCode];
            uint64_t v26 = v25 = v18;
            LogPrintF_safe();
          }
          if (v15) {
            uint64_t v20 = 2;
          }
          else {
            uint64_t v20 = 1;
          }
          objc_msgSend(v14, "setTravelerModeEnabled:", v20, v25, v26);
          id v21 = (id *)(v35 + 5);
          id v27 = (id)v35[5];
          int v22 = [v12 saveRegionConfiguration:v14 error:&v27];
          objc_storeStrong(v21, v27);
          if (v22)
          {
            [(ENDaemon *)self->_daemon prefsChanged];
            xpc_object_t reply = xpc_dictionary_create_reply(v5);
            if (reply)
            {
              [(ENXPCConnection *)self _xpcSendMessage:reply];
            }
            else if (gLogCategory__ENDaemon <= 90 {
                   && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            }
            {
              LogPrintF_safe();
            }
          }
        }
      }
      else
      {
        uint64_t v24 = ENErrorF();
        uint64_t v14 = (void *)v35[5];
        v35[5] = v24;
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v34, 8);
}

uint64_t __46__ENXPCConnection__xpcSetTravelStatusEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)xpcReportActivityFlags:(unsigned int)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "mTyp", 19);
  xpc_dictionary_set_uint64(xdict, "actF", a3);
  [(ENXPCConnection *)self _xpcSendMessage:xdict];
}

- (void)_xpcSetEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__3;
  id v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __34__ENXPCConnection__xpcSetEnabled___block_invoke;
  v24[3] = &unk_1E69ACB90;
  uint64_t v26 = &v27;
  void v24[4] = self;
  id v5 = v4;
  id v25 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v24);
  uint64_t v7 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = (id *)(v28 + 5);
    id v22 = (id)v28[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v22];
    objc_storeStrong(v9, v22);
    if (v10)
    {
      uint64_t v11 = (id *)(v28 + 5);
      id v21 = (id)v28[5];
      BOOL v12 = [(ENXPCConnection *)self _appActiveStatusWithError:&v21];
      objc_storeStrong(v11, v21);
      if (v12)
      {
        if ([(ENXPCClient *)self->_client accessLevel] == 3)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          CFPrefs_SetValue();
        }
        else if ([(ENXPCClient *)self->_client accessLevel] == 2)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          CFPrefs_RemoveValue();
        }
        [(ENDaemon *)self->_daemon prefsChanged];
        BOOL v13 = xpc_dictionary_get_BOOL(v5, "enbd");
        if ([(ENDaemon *)self->_daemon overallStatus] == 4)
        {
          uint64_t v19 = ENErrorF();
          xpc_object_t reply = (xpc_object_t)v28[5];
          v28[5] = v19;
        }
        else
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            uint64_t v14 = "Disable";
            if (v13) {
              uint64_t v14 = "Enable";
            }
            uint64_t v20 = v14;
            LogPrintF_safe();
          }
          CFPrefs_SetValue();
          daemon = self->_daemon;
          if (v13) {
            [(ENDaemon *)daemon setUsageUserEnabled:[(ENDaemon *)self->_daemon usageUserEnabled] + 1];
          }
          else {
            [(ENDaemon *)daemon setUsageUserDisabled:[(ENDaemon *)self->_daemon usageUserDisabled] + 1];
          }
          [(ENDaemon *)self->_daemon prefsChanged];
          BOOL v16 = [(ENXPCConnection *)self client];
          int v17 = [v16 appRegion];

          if (v17) {
            [(ENDaemon *)self->_daemon startServerConfigurationFetchForRegion:v17];
          }

          xpc_object_t reply = xpc_dictionary_create_reply(v5);
          if (reply)
          {
            [(ENXPCConnection *)self _xpcMessageAddCommonKeys:reply allowed:1];
            [(ENXPCConnection *)self _xpcSendMessage:reply];
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }
        }
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v27, 8);
}

uint64_t __34__ENXPCConnection__xpcSetEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetPaused:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __33__ENXPCConnection__xpcSetPaused___block_invoke;
  v17[3] = &unk_1E69ACB90;
  uint64_t v19 = &v20;
  v17[4] = self;
  id v5 = v4;
  id v18 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v17);
  uint64_t v7 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = (id *)(v21 + 5);
    id v15 = (id)v21[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v15];
    objc_storeStrong(v9, v15);
    if (v10)
    {
      BOOL v11 = xpc_dictionary_get_BOOL(v5, "paus");
      double v12 = xpc_dictionary_get_double(v5, "dura");
      CFPrefs_SetValue();
      if (v11)
      {
        if (v12 <= 0.0)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          CFPrefs_RemoveValue();
        }
        else
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            uint64_t v14 = CUPrintDurationDouble();
            LogPrintF_safe();
          }
          CFAbsoluteTimeGetCurrent();
          CFPrefs_SetDouble();
        }
        [(ENDaemon *)self->_daemon setUsageUserPaused:[(ENDaemon *)self->_daemon usageUserPaused] + 1];
      }
      else
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        CFPrefs_RemoveValue();
        [(ENDaemon *)self->_daemon setUsageUserUnpaused:[(ENDaemon *)self->_daemon usageUserUnpaused] + 1];
      }
      [(ENDaemon *)self->_daemon pauseUpdate];
      [(ENDaemon *)self->_daemon prefsChanged];
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        [(ENXPCConnection *)self _xpcMessageAddCommonKeys:reply allowed:1];
        [(ENXPCConnection *)self _xpcSendMessage:reply];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v20, 8);
}

uint64_t __33__ENXPCConnection__xpcSetPaused___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)xpcStatusChanged
{
  BOOL v3 = [(ENXPCConnection *)self _appActiveStatusWithError:0];
  id v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "mTyp", 12);
  [(ENXPCConnection *)self _xpcMessageAddCommonKeys:v4 allowed:v3];
  [(ENXPCConnection *)self _xpcSendMessage:v4];
}

- (void)_xpcGetPreAuthorizeDiagnosisKeysEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__3;
  id v32 = __Block_byref_object_dispose__3;
  id v33 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__ENXPCConnection__xpcGetPreAuthorizeDiagnosisKeysEnabled___block_invoke;
  v25[3] = &unk_1E69ACB90;
  uint64_t v27 = &v28;
  v25[4] = self;
  id v5 = v4;
  id v26 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v25);
  uint64_t v7 = (id *)(v29 + 5);
  id obj = (id)v29[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = (id *)(v29 + 5);
    id v23 = (id)v29[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v23];
    objc_storeStrong(v9, v23);
    if (v10)
    {
      BOOL v11 = (id *)(v29 + 5);
      id v22 = (id)v29[5];
      double v12 = [(ENXPCConnection *)self _regionConfigForXPCRequest:v5 error:&v22];
      objc_storeStrong(v11, v22);
      if (v12)
      {
        BOOL v13 = [v12 diagnosisKeysPreAuthorization];
        uint64_t v14 = [v13 userAuthorization];

        id v15 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v16 = [v15 isSensitiveLoggingAllowed];

        if (v16
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          int v17 = [(ENXPCConnection *)self client];
          LogPrintF_safe();
        }
        if (v14 == 1
          || (id v18 = (id *)(v29 + 5),
              id v21 = (id)v29[5],
              [(ENXPCConnection *)self updateDiagnosisKeysPreAuthorizationForRequest:v5 withDecision:0 errorOut:&v21], objc_storeStrong(v18, v21), !v29[5]))
        {
          xpc_object_t reply = xpc_dictionary_create_reply(v5);
          uint64_t v20 = reply;
          if (reply)
          {
            xpc_dictionary_set_BOOL(reply, "enbd", v14 == 1);
            [(ENXPCConnection *)self _xpcSendMessage:v20];
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }
        }
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v28, 8);
}

uint64_t __59__ENXPCConnection__xpcGetPreAuthorizeDiagnosisKeysEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetPreAuthorizeDiagnosisKeysEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__3;
  id v35 = __Block_byref_object_dispose__3;
  id v36 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __59__ENXPCConnection__xpcSetPreAuthorizeDiagnosisKeysEnabled___block_invoke;
  v28[3] = &unk_1E69ACB90;
  uint64_t v30 = &v31;
  v28[4] = self;
  id v5 = v4;
  id v29 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v28);
  uint64_t v7 = (id *)(v32 + 5);
  id obj = (id)v32[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = (id *)(v32 + 5);
    id v26 = (id)v32[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v26];
    objc_storeStrong(v9, v26);
    if (v10)
    {
      BOOL v11 = (id *)(v32 + 5);
      id v25 = (id)v32[5];
      double v12 = [(ENXPCConnection *)self _regionServerConfigForXPCRequest:v5 error:&v25];
      objc_storeStrong(v11, v25);
      if (v12)
      {
        if ([(ENDaemon *)self->_daemon _isNKDActive]
          && ([v12 preArmTestVerificationEnabled] & 1) == 0)
        {
          uint64_t v21 = ENErrorF();
          xpc_object_t reply = (xpc_object_t)v32[5];
          v32[5] = v21;
        }
        else
        {
          BOOL v13 = xpc_dictionary_get_BOOL(v5, "enbd");
          uint64_t v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v15 = [v14 isSensitiveLoggingAllowed];

          if (v15
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            uint64_t v16 = [(ENXPCConnection *)self client];
            int v17 = (void *)v16;
            id v18 = "no";
            if (v13) {
              id v18 = "yes";
            }
            id v22 = v18;
            uint64_t v23 = v16;
            LogPrintF_safe();
          }
          uint64_t v19 = (id *)(v32 + 5);
          id v24 = (id)v32[5];
          -[ENXPCConnection updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:](self, "updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:", v5, v13, &v24, v22, v23);
          objc_storeStrong(v19, v24);
          if (v32[5]) {
            goto LABEL_17;
          }
          xpc_object_t reply = xpc_dictionary_create_reply(v5);
          if (reply)
          {
            [(ENXPCConnection *)self _xpcSendMessage:reply];
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }
        }
      }
LABEL_17:
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v31, 8);
}

uint64_t __59__ENXPCConnection__xpcSetPreAuthorizeDiagnosisKeysEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcPreAuthorizeDiagnosisKeys:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__3;
  id v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__ENXPCConnection__xpcPreAuthorizeDiagnosisKeys___block_invoke;
  v22[3] = &unk_1E69ACB90;
  id v24 = &v25;
  v22[4] = self;
  id v5 = v4;
  id v23 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v22);
  uint64_t v7 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = (id *)(v26 + 5);
    id v20 = (id)v26[5];
    BOOL v10 = [(ENXPCConnection *)self _regionServerConfigForXPCRequest:v5 error:&v20];
    objc_storeStrong(v9, v20);
    if (!v10)
    {
LABEL_15:

      goto LABEL_16;
    }
    if ([(ENDaemon *)self->_daemon _isNKDActive]
      && ([v10 preArmTestVerificationEnabled] & 1) == 0
      || (uuid = xpc_dictionary_get_uuid(v5, "rpsid")) == 0)
    {
      uint64_t v19 = ENErrorF();
      double v12 = (void *)v26[5];
      v26[5] = v19;
      goto LABEL_14;
    }
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F29120]) initWithUUIDBytes:uuid];
    BOOL v13 = [(ENDaemon *)self->_daemon remoteUISessions];
    uint64_t v14 = [v13 objectForKeyedSubscript:v12];

    if (v14)
    {
      [v14 setOriginalRequest:v5];
      [v14 setConnection:self];
      int v15 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v16 = [v15 isSensitiveLoggingAllowed];

      if (!v16 || gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_13;
      }
      int v17 = [(ENXPCConnection *)self client];
      LogPrintF_safe();
    }
    else
    {
      uint64_t v18 = ENErrorF();
      int v17 = (void *)v26[5];
      v26[5] = v18;
    }

LABEL_13:
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
  v6[2](v6);

  _Block_object_dispose(&v25, 8);
}

uint64_t __49__ENXPCConnection__xpcPreAuthorizeDiagnosisKeys___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    id v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

- (void)_xpcPreAuthorizeDiagnosisKeysComplete:(id)a3 userDecision:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__3;
  id v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__ENXPCConnection__xpcPreAuthorizeDiagnosisKeysComplete_userDecision___block_invoke;
  v22[3] = &unk_1E69ACB90;
  id v24 = &v25;
  v22[4] = self;
  id v7 = v6;
  id v23 = v7;
  BOOL v8 = (void (**)(void))MEMORY[0x1D9439FF0](v22);
  id v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v10 = [v9 isSensitiveLoggingAllowed];

  if (v10 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = [(ENXPCConnection *)self client];
    double v12 = (void *)v11;
    BOOL v13 = "no";
    if (v4) {
      BOOL v13 = "yes";
    }
    uint64_t v19 = v13;
    uint64_t v20 = v11;
    LogPrintF_safe();
  }
  uint64_t v14 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  -[ENXPCConnection updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:](self, "updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:", v7, v4, &obj, v19, v20);
  objc_storeStrong(v14, obj);
  if (!v26[5])
  {
    if (v4)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v7);
      if (reply)
      {
        [(ENXPCConnection *)self _xpcSendMessage:reply];
      }
      else
      {
        int v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v18 = [v17 isSensitiveLoggingAllowed];

        if (v18
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
    else
    {
      uint64_t v16 = ENErrorF();
      xpc_object_t reply = (xpc_object_t)v26[5];
      v26[5] = v16;
    }
  }
  v8[2](v8);

  _Block_object_dispose(&v25, 8);
}

uint64_t __70__ENXPCConnection__xpcPreAuthorizeDiagnosisKeysComplete_userDecision___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    id v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

- (void)_xpcRequestPreAuthorizedDiagnosisKeys:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__3;
  id v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__ENXPCConnection__xpcRequestPreAuthorizedDiagnosisKeys___block_invoke;
  v23[3] = &unk_1E69ACB90;
  uint64_t v25 = &v26;
  v23[4] = self;
  id v5 = v4;
  id v24 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v23);
  id v7 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    if ([(ENXPCConnection *)self _appActiveStatusWithError:0])
    {
      id v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v10 = [v9 isSensitiveLoggingAllowed];

      if (v10
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v20 = [(ENXPCConnection *)self client];
        LogPrintF_safe();
      }
      CFStringGetTypeID();
      uint64_t v11 = (void *)CFPrefs_CopyTypedValue();
      if (v11)
      {
        double v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v13 = [v12 isSensitiveLoggingAllowed];

        if (v13
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
      else
      {
        uint64_t v14 = (id *)(v27 + 5);
        id v21 = (id)v27[5];
        [(ENXPCConnection *)self enqueuePreAuthorizedLockScreenActionForRequest:v5 outError:&v21];
        objc_storeStrong(v14, v21);
        if (v27[5])
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        [(ENXPCConnection *)self _xpcSendMessage:reply];
      }
      else
      {
        int v18 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v19 = [v18 isSensitiveLoggingAllowed];

        if (v19
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
    else
    {
      uint64_t v11 = [(ENXPCConnection *)self client];
      xpc_object_t reply = [v11 signingIdentity];
      uint64_t v16 = ENErrorF();
      int v17 = (void *)v27[5];
      void v27[5] = v16;
    }
    goto LABEL_17;
  }
LABEL_18:
  v6[2](v6);

  _Block_object_dispose(&v26, 8);
}

uint64_t __57__ENXPCConnection__xpcRequestPreAuthorizedDiagnosisKeys___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    id v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

- (void)enqueuePreAuthorizedLockScreenActionForRequest:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__3;
  id v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__ENXPCConnection_enqueuePreAuthorizedLockScreenActionForRequest_outError___block_invoke;
  v24[3] = &unk_1E69AD588;
  void v24[4] = &v25;
  void v24[5] = a4;
  id v7 = (void (**)(void))MEMORY[0x1D9439FF0](v24);
  if ([(ENXPCConnection *)self _appActiveStatusWithError:0])
  {
    BOOL v8 = (id *)(v26 + 5);
    id obj = (id)v26[5];
    id v9 = [(ENXPCConnection *)self _regionConfigForXPCRequest:v6 error:&obj];
    objc_storeStrong(v8, obj);
    if (v9)
    {
      CFPrefs_RemoveValue();
      int v10 = [v9 diagnosisKeysPreAuthorization];
      uint64_t v11 = [v10 userAuthorization];

      if (v11 == 1)
      {
        double v12 = [(ENXPCConnection *)self client];
        int v13 = [v12 signingIdentity];
        CFPrefs_SetValue();

        id location = 0;
        objc_initWeak(&location, self);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __75__ENXPCConnection_enqueuePreAuthorizedLockScreenActionForRequest_outError___block_invoke_2;
        v20[3] = &unk_1E69AD1F8;
        objc_copyWeak(&v21, &location);
        uint64_t v14 = (void *)MEMORY[0x1D9439FF0](v20);
        [(ENDaemon *)self->_daemon enqueueScreenUnlockAction:v14 withIdentifier:@"PreArmUnlockActionIdentifier"];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v17 = ENErrorF();
        int v18 = (void *)v26[5];
        v26[5] = v17;
      }
    }
  }
  else
  {
    id v9 = [(ENXPCConnection *)self client];
    int v19 = [v9 signingIdentity];
    uint64_t v15 = ENErrorF();
    uint64_t v16 = (void *)v26[5];
    v26[5] = v15;
  }
  v7[2](v7);

  _Block_object_dispose(&v25, 8);
}

void __75__ENXPCConnection_enqueuePreAuthorizedLockScreenActionForRequest_outError___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v2 = CUPrintNSError();
      LogPrintF_safe();
    }
    if (*(void *)(a1 + 40)) {
      **(void **)(a1 + 40) = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
  }
}

void __75__ENXPCConnection_enqueuePreAuthorizedLockScreenActionForRequest_outError___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained xpcPreAuthorizedDiagnosisKeysAvailable];
}

- (void)updateDiagnosisKeysPreAuthorizationForRequest:(id)a3 withDecision:(BOOL)a4 errorOut:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__3;
  id v62 = __Block_byref_object_dispose__3;
  id v63 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __87__ENXPCConnection_updateDiagnosisKeysPreAuthorizationForRequest_withDecision_errorOut___block_invoke;
  v57[3] = &unk_1E69AD588;
  v57[4] = &v58;
  v57[5] = a5;
  id v9 = (void (**)(void))MEMORY[0x1D9439FF0](v57);
  int v10 = (id *)(v59 + 5);
  id obj = (id)v59[5];
  uint64_t v11 = [(ENXPCConnection *)self _regionConfigForXPCRequest:v8 error:&obj];
  objc_storeStrong(v10, obj);
  if (v11)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      double v12 = "no";
      if (v6) {
        double v12 = "yes";
      }
      double v51 = *(double *)&v12;
      LogPrintF_safe();
    }
    if (v6)
    {
      id v54 = v9;
      CFPrefs_GetDouble();
      double v14 = v13;
      if (v13 > 0.0
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        double v51 = v14;
        LogPrintF_safe();
      }
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9C0], "date", *(void *)&v51);
      uint64_t v16 = v15;
      double v17 = 432000.0;
      if (v14 > 0.0) {
        double v17 = v14;
      }
      uint64_t v18 = [v15 dateByAddingTimeInterval:v17];

      int v19 = [v11 diagnosisKeysPreAuthorization];

      if (!v19)
      {
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F25818]) initWithIdentifier:@"DiagnosisKeysPreAuthorization"];
        [v11 setDiagnosisKeysPreAuthorization:v20];
      }
      id v21 = [v11 diagnosisKeysPreAuthorization];
      [v21 setUserAuthorization:1 withExpiration:v18];
      char v53 = (void *)v18;

      id v22 = xpc_dictionary_get_value(v8, "meta");
      uint64_t v23 = MEMORY[0x1D943A770]();
      id v24 = (void *)MEMORY[0x1E4F1CC00];
      uint64_t v25 = (void *)MEMORY[0x1E4F1CC00];
      if (v23 == MEMORY[0x1E4F14590]) {
        uint64_t v25 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      }
      id v52 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = v24;
      }
      id v27 = v26;
      uint64_t v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F256F0]];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v30 = [v11 diagnosisKeysPreAuthorization];
      id v31 = v30;
      if (isKindOfClass) {
        id v32 = v28;
      }
      else {
        id v32 = 0;
      }
      [v30 setSymptomOnsetDate:v32];

      uint64_t v33 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F256F8]];
      objc_opt_class();
      char v34 = objc_opt_isKindOfClass();
      id v35 = [v11 diagnosisKeysPreAuthorization];
      id v36 = v35;
      if (v34) {
        id v37 = v33;
      }
      else {
        id v37 = 0;
      }
      [v35 setDidUserTravel:v37];

      uint64_t v38 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F256E8]];
      objc_opt_class();
      char v39 = objc_opt_isKindOfClass();
      id v40 = [v11 diagnosisKeysPreAuthorization];
      id v41 = v40;
      if (v39) {
        uint64_t v42 = v38;
      }
      else {
        uint64_t v42 = 0;
      }
      [v40 setIsUserVaccinated:v42];

      id v9 = v54;
      id v8 = v52;
    }
    else
    {
      [v11 setDiagnosisKeysPreAuthorization:0];
    }
    uint64_t v43 = [(ENDaemon *)self->_daemon configurationManager];
    uint64_t v44 = [v43 configurationStore];

    if (v44)
    {
      uint64_t v45 = (id *)(v59 + 5);
      id v55 = (id)v59[5];
      int v46 = [v44 saveRegionConfiguration:v11 error:&v55];
      objc_storeStrong(v45, v55);
      if (!v46) {
        goto LABEL_42;
      }
      id v47 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v48 = [v47 isSensitiveLoggingAllowed];

      if (!v48 || gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_42;
      }
      v49 = [v11 diagnosisKeysPreAuthorization];
      LogPrintF_safe();
    }
    else
    {
      uint64_t v50 = ENErrorF();
      v49 = (void *)v59[5];
      v59[5] = v50;
    }

LABEL_42:
  }

  v9[2](v9);
  _Block_object_dispose(&v58, 8);
}

void __87__ENXPCConnection_updateDiagnosisKeysPreAuthorizationForRequest_withDecision_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    if (*(void *)(a1 + 40)) {
      **(void **)(a1 + 40) = v2;
    }
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }
}

- (void)xpcPreAuthorizedDiagnosisKeysAvailable
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__3;
  uint64_t v45 = __Block_byref_object_dispose__3;
  id v46 = 0;
  id v3 = [(ENXPCConnection *)self client];
  uint64_t v28 = [v3 signingIdentity];

  uint64_t v4 = [(ENDaemon *)self->_daemon activeEntity];
  uint64_t v5 = [v4 entity];
  id v32 = [v5 region];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __57__ENXPCConnection_xpcPreAuthorizedDiagnosisKeysAvailable__block_invoke;
  v40[3] = &unk_1E69ACB90;
  v40[6] = &v41;
  v40[4] = self;
  v40[5] = v32;
  id v29 = (void (**)(void))MEMORY[0x1D9439FF0](v40);
  if (self->_xpcCnx)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "mTyp", 24);
    if ([(ENXPCConnection *)self _appActiveStatusWithError:0] && v32)
    {
      CFPrefs_RemoveValue();
      id v7 = (id *)(v42 + 5);
      id obj = (id)v42[5];
      id v30 = [(ENXPCConnection *)self _regionConfigForXPCRequest:v6 error:&obj];
      objc_storeStrong(v7, obj);
      if (v30)
      {
        id v8 = [v30 diagnosisKeysPreAuthorization];
        BOOL v9 = [v8 userAuthorization] == 1;

        if (v9)
        {
          int v10 = (id *)(v42 + 5);
          id v38 = (id)v42[5];
          [(ENXPCConnection *)self updateDiagnosisKeysPreAuthorizationForRequest:v6 withDecision:0 errorOut:&v38];
          objc_storeStrong(v10, v38);
          uint64_t v11 = [(ENDaemon *)self->_daemon temporaryExposureKeyManager];
          if (v11)
          {
            uint64_t v12 = 144 * (((CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E4F1CF70]) / 600.0) / 0x90) - 2016;
            client = self->_client;
            double v14 = (id *)(v42 + 5);
            id v37 = (id)v42[5];
            id v15 = [v11 getTemporaryExposureKeysForClient:client fromRollingStart:v12 didPrompt:1 forTesting:0 forceRefresh:0 error:&v37];
            objc_storeStrong(v14, v37);
            if (v15)
            {
              xpc_object_t v16 = xpc_array_create(0, 0);
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              id v15 = v15;
              uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v47 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v34 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
                    [v20 encodeWithXPCObject:v21];
                    xpc_array_set_value(v16, 0xFFFFFFFFFFFFFFFFLL, v21);
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v47 count:16];
                }
                while (v17);
              }

              xpc_dictionary_set_value(v6, "tekA", v16);
              if (gLogCategory_ENDaemon <= 30
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                size_t count = xpc_array_get_count(v16);
                LogPrintF_safe();
              }
              -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v6, count);
            }
          }
          else
          {
            uint64_t v26 = ENErrorF();
            id v15 = (id)v42[5];
            v42[5] = v26;
          }
        }
        else
        {
          id v24 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v25 = [v24 isSensitiveLoggingAllowed];

          if (v25
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }
      }
    }
    else
    {
      uint64_t v23 = ENErrorF();
      id v31 = (void *)v42[5];
      v42[5] = v23;
    }
  }
  else
  {
    uint64_t v22 = ENErrorF();
    xpc_object_t v6 = (xpc_object_t)v42[5];
    v42[5] = v22;
  }

  v29[2](v29);
  _Block_object_dispose(&v41, 8);
}

void __57__ENXPCConnection_xpcPreAuthorizedDiagnosisKeysAvailable__block_invoke(void *a1)
{
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }
  else
  {
    uint64_t v1 = a1[5];
    uint64_t v2 = *(void **)(a1[4] + 32);
    [v2 postPreAuthorizationNotificationForRegion:v1];
  }
}

- (void)_xpcGetDiagnosisKeys:(id)a3 testMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__3;
  uint64_t v45 = __Block_byref_object_dispose__3;
  id v46 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __49__ENXPCConnection__xpcGetDiagnosisKeys_testMode___block_invoke;
  v38[3] = &unk_1E69ACB90;
  id v40 = &v41;
  v38[4] = self;
  id v7 = v6;
  id v39 = v7;
  id v8 = (void (**)(void))MEMORY[0x1D9439FF0](v38);
  if (v4) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  int v10 = (id *)(v42 + 5);
  id obj = (id)v42[5];
  BOOL v11 = [(ENXPCConnection *)self _entitledForAccessLevel:v9 error:&obj];
  objc_storeStrong(v10, obj);
  if (v11)
  {
    uint64_t v12 = (id *)(v42 + 5);
    id v36 = (id)v42[5];
    BOOL v13 = [(ENXPCConnection *)self _authorizedAndReturnError:&v36];
    objc_storeStrong(v12, v36);
    if (v13)
    {
      double v14 = (id *)(v42 + 5);
      id v35 = (id)v42[5];
      BOOL v15 = [(ENXPCConnection *)self _appActiveStatusWithError:&v35];
      objc_storeStrong(v14, v35);
      if (v15)
      {
        xpc_object_t v16 = [(ENDaemon *)self->_daemon temporaryExposureKeyManager];
        if (v16)
        {
          BOOL v17 = xpc_dictionary_get_BOOL(v7, "refr");
          uint64_t v18 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v19 = [v18 isSensitiveLoggingAllowed];

          if (v19
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            uint64_t v20 = "no";
            if (v4) {
              xpc_object_t v21 = "yes";
            }
            else {
              xpc_object_t v21 = "no";
            }
            if (v17) {
              uint64_t v20 = "yes";
            }
            id v32 = v21;
            long long v33 = v20;
            client = self->_client;
            LogPrintF_safe();
          }
          [(ENDaemon *)self->_daemon setUsageGetDiagnosisKeys:[(ENDaemon *)self->_daemon usageGetDiagnosisKeys] + 1];
          if ([(ENXPCClient *)self->_client entitledToSkipKeyReleasePrompt]
            || ([v16 requireKeyReleasePromptForClient:self->_client] & 1) == 0)
          {
            id v24 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v25 = [v24 isSensitiveLoggingAllowed];

            if (v25
              && gLogCategory_ENDaemon <= 50
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              id v31 = self->_client;
              LogPrintF_safe();
            }
            -[ENXPCConnection _xpcGetDiagnosisKeysCompletion:didPrompt:testMode:error:](self, "_xpcGetDiagnosisKeysCompletion:didPrompt:testMode:error:", v7, 0, v4, 0, v31);
          }
          else
          {
            uint64_t v22 = (id *)(v42 + 5);
            id v34 = (id)v42[5];
            char v23 = CUXPCDecodeNSUUID();
            objc_storeStrong(v22, v34);
            if (v23)
            {
              uint64_t v28 = ENErrorF();
              id v29 = (void *)v42[5];
              v42[5] = v28;
            }
          }
        }
        else
        {
          uint64_t v26 = ENErrorF();
          id v27 = (void *)v42[5];
          v42[5] = v26;
        }
      }
    }
  }
  v8[2](v8);

  _Block_object_dispose(&v41, 8);
}

uint64_t __49__ENXPCConnection__xpcGetDiagnosisKeys_testMode___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    id v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

- (void)_xpcGetDiagnosisKeysCompletion:(id)a3 didPrompt:(BOOL)a4 testMode:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  BOOL v33 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v34 = a6;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__3;
  id v47 = __Block_byref_object_dispose__3;
  id v48 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __75__ENXPCConnection__xpcGetDiagnosisKeysCompletion_didPrompt_testMode_error___block_invoke;
  v40[3] = &unk_1E69ACB90;
  uint64_t v42 = &v43;
  v40[4] = self;
  id v10 = v9;
  id v41 = v10;
  id v32 = (void (**)(void))MEMORY[0x1D9439FF0](v40);
  if (v34)
  {
    id v27 = v44;
    id v28 = v34;
    BOOL v11 = (void *)v27[5];
    void v27[5] = (uint64_t)v28;
  }
  else
  {
    BOOL v11 = [(ENDaemon *)self->_daemon temporaryExposureKeyManager];
    if (!v11
      || (BOOL v12 = xpc_dictionary_get_BOOL(v10, "refr")) && [(ENXPCClient *)self->_client accessLevel] <= 3)
    {
      uint64_t v31 = ENErrorF();
      id v16 = (id)v44[5];
      v44[5] = v31;
    }
    else
    {
      uint64_t v13 = 144 * (((CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E4F1CF70]) / 600.0) / 0x90) - 2016;
      client = self->_client;
      BOOL v15 = (id *)(v44 + 5);
      id obj = (id)v44[5];
      id v16 = [v11 getTemporaryExposureKeysForClient:client fromRollingStart:v13 didPrompt:v33 forTesting:v7 forceRefresh:v12 error:&obj];
      objc_storeStrong(v15, obj);
      if (v16)
      {
        xpc_object_t v17 = xpc_array_create(0, 0);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v16 = v16;
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v49 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v36 != v19) {
                objc_enumerationMutation(v16);
              }
              xpc_object_t v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
              [v21 encodeWithXPCObject:v22];
              xpc_array_set_value(v17, 0xFFFFFFFFFFFFFFFFLL, v22);
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v49 count:16];
          }
          while (v18);
        }

        char v23 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v24 = [v23 isSensitiveLoggingAllowed];

        if (v24
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          xpc_array_get_count(v17);
          LogPrintF_safe();
        }
        xpc_object_t reply = xpc_dictionary_create_reply(v10);
        uint64_t v26 = reply;
        if (reply)
        {
          xpc_dictionary_set_value(reply, "tekA", v17);
          [(ENXPCConnection *)self _xpcSendMessage:v26];
        }
        else
        {
          id v29 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v30 = [v29 isSensitiveLoggingAllowed];

          if (v30
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }
      }
    }
  }
  v32[2](v32);

  _Block_object_dispose(&v43, 8);
}

uint64_t __75__ENXPCConnection__xpcGetDiagnosisKeysCompletion_didPrompt_testMode_error___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      BOOL v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    id v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

- (void)_xpcResetData:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000;
  int v25 = __Block_byref_object_copy__3;
  uint64_t v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __33__ENXPCConnection__xpcResetData___block_invoke;
  v19[3] = &unk_1E69ACB90;
  xpc_object_t v21 = &v22;
  v19[4] = self;
  id v5 = v4;
  id v20 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v19);
  BOOL v7 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = (id *)(v23 + 5);
    id v17 = (id)v23[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v17];
    objc_storeStrong(v9, v17);
    if (v10)
    {
      BOOL v11 = (id *)(v23 + 5);
      id v16 = (id)v23[5];
      uint64_t v28 = 0;
      int v12 = CUXPCDecodeUInt64RangedEx();
      unsigned int v13 = v28;
      objc_storeStrong(v11, v16);
      if (v12 != 5)
      {
        if (v12 == 6) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
        [(ENDaemon *)self->_daemon _resetDataWithFlags:v14];
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          [(ENXPCConnection *)self _xpcSendMessage:reply];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v22, 8);
}

uint64_t __33__ENXPCConnection__xpcResetData___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcDiagnosticControl:(id)a3
{
  id v4 = a3;
  uint64_t v267 = 0;
  v268 = (id *)&v267;
  uint64_t v269 = 0x3032000000;
  v270 = __Block_byref_object_copy__3;
  v271 = __Block_byref_object_dispose__3;
  id v272 = 0;
  v264[0] = MEMORY[0x1E4F143A8];
  v264[1] = 3221225472;
  v264[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke;
  v264[3] = &unk_1E69ACB90;
  v266 = &v267;
  v264[4] = self;
  id v5 = v4;
  id v265 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v264);
  uint64_t v7 = v268;
  id v263 = v268[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&v263];
  objc_storeStrong(v7 + 5, v263);
  if (v8)
  {
    uint64_t v9 = xpc_dictionary_get_value(v5, "parm");
    BOOL v10 = (void *)v9;
    if (!v9 || MEMORY[0x1D943A770](v9) != MEMORY[0x1E4F14590])
    {
      uint64_t v67 = ENErrorF();
      id v68 = v268[5];
      v268[5] = (id)v67;

      goto LABEL_93;
    }
    uint64_t v257 = 0;
    v258 = &v257;
    uint64_t v259 = 0x3032000000;
    v260 = __Block_byref_object_copy__3;
    v261 = __Block_byref_object_dispose__3;
    id v262 = 0;
    string = xpc_dictionary_get_string(v10, "iStr");
    if (!string)
    {
      uint64_t v69 = ENErrorF();
      id v70 = v268[5];
      v268[5] = (id)v69;

      goto LABEL_92;
    }
    v256[0] = MEMORY[0x1E4F143A8];
    v256[1] = 3221225472;
    v256[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_2;
    v256[3] = &unk_1E69AD5B0;
    v256[4] = v10;
    int v12 = (void (**)(void))MEMORY[0x1D9439FF0](v256);
    v255[0] = MEMORY[0x1E4F143A8];
    v255[1] = 3221225472;
    v255[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_3;
    v255[3] = &unk_1E69AD5D8;
    v255[4] = v10;
    v175 = (void (**)(void))MEMORY[0x1D9439FF0](v255);
    v176 = [(ENDaemon *)self->_daemon delegate];
    if (strcasecmp(string, "Activity"))
    {
      if (!strcasecmp(string, "BTDebug"))
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        [v176 printBluetoothDebug];
        uint64_t v31 = (id *)(v258 + 5);
        id v253 = (id)v258[5];
        NSAppendPrintF_safe();
        id v23 = v253;
        goto LABEL_66;
      }
      if (!strcasecmp(string, "chaff") && IsAppleInternalBuild())
      {
        id location = 0;
        CUXPCDecodeNSString();
        [0 doubleValue];
        if (v15 > 0.0) {
          CFPrefs_SetDouble();
        }
        id v251 = 0;
        CUXPCDecodeNSString();
        if ([0 integerValue] >= 1) {
          CFPrefs_SetDouble();
        }
        id v250 = 0;
        CUXPCDecodeNSString();
        [0 doubleValue];
        if (v16 > 0.0) {
          CFPrefs_SetDouble();
        }
        [(ENDaemon *)self->_daemon prefsChanged];
        id v17 = (id *)(v258 + 5);
        id obj = (id)v258[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v17, obj);

LABEL_47:
        id v18 = location;
LABEL_48:

        goto LABEL_83;
      }
      if (!strcasecmp(string, "chaffReset") && IsAppleInternalBuild())
      {
        xpc_object_t v21 = [(ENDaemon *)self->_daemon testResultManager];
        [v21 deactivateAutomatedChaffing];

        [(ENDaemon *)self->_daemon prefsChanged];
        uint64_t v22 = (id *)(v258 + 5);
        v248 = (void *)v258[5];
        NSAppendPrintF_safe();
        id v23 = v248;
LABEL_55:
        uint64_t v24 = v22;
LABEL_67:
        objc_storeStrong(v24, v23);
        goto LABEL_83;
      }
      if (!strcasecmp(string, "chaffOverridesReset") && IsAppleInternalBuild())
      {
        CFPrefs_RemoveValue();
        CFPrefs_RemoveValue();
        CFPrefs_RemoveValue();
        [(ENDaemon *)self->_daemon prefsChanged];
        uint64_t v22 = (id *)(v258 + 5);
        v247 = (void *)v258[5];
        NSAppendPrintF_safe();
        id v23 = v247;
        goto LABEL_55;
      }
      if (!strcasecmp(string, "configureTestRegion") && IsAppleInternalBuild())
      {
        int v25 = xpc_dictionary_get_string(v10, "mcc");
        if (!v25)
        {
          uint64_t v28 = v12[2](v12);
          goto LABEL_100;
        }
        id v26 = [MEMORY[0x1E4F29020] stringWithUTF8String:v25];
        id v27 = +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:v26];
        if (v27)
        {
          uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v27];

LABEL_100:
          if (v28)
          {
            id v47 = objc_alloc(MEMORY[0x1E4F257E0]);
            id v48 = [MEMORY[0x1E4F1C9C0] date];
            v49 = (void *)[v47 initWithRegion:v28 date:v48];

            id v246 = 0;
            uint64_t v50 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v49 requiringSecureCoding:1 error:&v246];
            id v51 = v246;
            if (v50)
            {
              CFPrefs_SetValue();
              CFPrefs_SetValue();
              id location = 0;
              objc_initWeak(&location, self);
              dispatchQueue = self->_dispatchQueue;
              v241[0] = MEMORY[0x1E4F143A8];
              v241[1] = 3221225472;
              v241[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_4;
              v241[3] = &unk_1E69AD600;
              v241[4] = self;
              v244 = &v257;
              id v242 = v28;
              id v243 = v5;
              objc_copyWeak(&v245, &location);
              dispatch_async(dispatchQueue, v241);
              char v53 = (id *)(v258 + 5);
              id v240 = (id)v258[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v53, v240);
              objc_destroyWeak(&v245);

              objc_destroyWeak(&location);
            }
            else
            {
              uint64_t v126 = ENErrorF();
              id v127 = v268[5];
              v268[5] = (id)v126;
            }
            goto LABEL_104;
          }
          uint64_t v125 = ENErrorF();
          id v26 = v268[5];
          v268[5] = (id)v125;
LABEL_90:

          goto LABEL_91;
        }
LABEL_273:
        uint64_t v128 = ENErrorF();
        id v129 = v268[5];
        v268[5] = (id)v128;

        goto LABEL_90;
      }
      if (!strcasecmp(string, "disableTestRegion"))
      {
        if (CFPrefs_GetInt64())
        {
          CFPrefs_RemoveValue();
          id location = 0;
          objc_initWeak(&location, self);
          id v29 = self->_dispatchQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_5;
          block[3] = &unk_1E69AD628;
          block[4] = self;
          v238 = &v257;
          id v237 = v5;
          objc_copyWeak(&v239, &location);
          dispatch_async(v29, block);
          objc_destroyWeak(&v239);
          int v30 = v237;
LABEL_63:

          objc_destroyWeak(&location);
          goto LABEL_91;
        }
        goto LABEL_35;
      }
      if (!strcasecmp(string, "phoneNumbers"))
      {
        id v41 = (id *)(v258 + 5);
        id v235 = (id)v258[5];
        BOOL v33 = +[ENCoreTelephonyUtility sharedInstance];
        v163 = [v33 currentPhoneNumbers];
        NSAppendPrintF();
        objc_storeStrong(v41, v235);
      }
      else
      {
        if (!strcasecmp(string, "setRegionMonitoringMode") && IsAppleInternalBuild())
        {
          uint64_t v42 = xpc_dictionary_get_string(v10, "mode");
          if (v42)
          {
            uint64_t v43 = [MEMORY[0x1E4F29020] stringWithUTF8String:v42];
            id v44 = objc_alloc_init(MEMORY[0x1E4F28ED8]);
            uint64_t v45 = [v44 numberFromString:v43];
            id v46 = v12;
          }
          else
          {
            id v46 = v12;
            uint64_t v45 = 0;
          }
          id location = 0;
          objc_initWeak(&location, self);
          id v55 = self->_dispatchQueue;
          v230[0] = MEMORY[0x1E4F143A8];
          v230[1] = 3221225472;
          v230[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_6;
          v230[3] = &unk_1E69AD650;
          v230[4] = self;
          id v231 = v45;
          v233 = &v257;
          id v232 = v5;
          id v56 = v45;
          objc_copyWeak(&v234, &location);
          dispatch_async(v55, v230);
          objc_destroyWeak(&v234);

          objc_destroyWeak(&location);
          int v12 = v46;
          goto LABEL_91;
        }
        if (!strcasecmp(string, "getRegionMonitoringMode") && IsAppleInternalBuild())
        {
          id location = 0;
          objc_initWeak(&location, self);
          id v54 = self->_dispatchQueue;
          v226[0] = MEMORY[0x1E4F143A8];
          v226[1] = 3221225472;
          v226[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_7;
          v226[3] = &unk_1E69AD628;
          v226[4] = self;
          v228 = &v257;
          id v227 = v5;
          objc_copyWeak(&v229, &location);
          dispatch_async(v54, v226);
          objc_destroyWeak(&v229);
          int v30 = v227;
          goto LABEL_63;
        }
        if (strcasecmp(string, "ErrorTest"))
        {
          if (!strcasecmp(string, "getStateMetric"))
          {
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            [(ENDaemon *)self->_daemon stateMetricVersion];
            uint64_t v22 = (id *)(v258 + 5);
            v224 = (void *)v258[5];
            NSAppendPrintF_safe();
            id v23 = v224;
            goto LABEL_55;
          }
          if (!strcasecmp(string, "PreAuthKeys"))
          {
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            [(ENDaemon *)self->_daemon xpcPreAuthorizedDiagnosisKeysAvailable];
            uint64_t v31 = (id *)(v258 + 5);
            v223 = (void *)v258[5];
            NSAppendPrintF_safe();
            id v23 = v223;
            goto LABEL_66;
          }
          if (strcasecmp(string, "ServerFetch"))
          {
            if (strcasecmp(string, "RawConfig"))
            {
              if (!strcasecmp(string, "RemoveConfiguration") && IsAppleInternalBuild())
              {
                uint64_t v171 = [(ENDaemon *)self->_daemon configurationManager];
                v12[2](v12);
                v173 = (char *)objc_claimAutoreleasedReturnValue();
                if (v173) {
                  goto LABEL_297;
                }
                uint64_t v60 = [(ENDaemon *)self->_daemon activeEntity];
                v61 = [v60 entity];
                v173 = [v61 region];

                if (v173)
                {
LABEL_297:
                  if (gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v162 = v173;
                    LogPrintF_safe();
                  }
                  uint64_t v88 = [(ENDaemon *)self->_daemon configurationManager];
                  v89 = [v88 configurationStore];
                  v90 = v268;
                  id v217 = v268[5];
                  int v91 = [v89 removeConfigurationsForRegion:v173 includingSubdivisions:1 error:&v217];
                  objc_storeStrong(v90 + 5, v217);

                  if (v91) {
                    [(ENDaemon *)self->_daemon configurationManager:v171 exposureNotificationRegionConfigurationRemovedForRegion:v173];
                  }
                  id v92 = (id *)(v258 + 5);
                  id v216 = (id)v258[5];
                  NSAppendPrintF_safe();
                  objc_storeStrong(v92, v216);

                  id v18 = (id)v171;
                  goto LABEL_48;
                }
                uint64_t v155 = ENErrorF();
                id v156 = v268[5];
                v268[5] = (id)v155;

                id v154 = (id)v171;
LABEL_279:

                goto LABEL_91;
              }
              if (!strcasecmp(string, "ResetCloudCache") && IsAppleInternalBuild())
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v93 = [(ENDaemon *)self->_daemon configurationManager];
                [v93 resetConfigurationCache];

                [(ENDaemon *)self->_daemon prefsChanged];
                uint64_t v31 = (id *)(v258 + 5);
                v215 = (void *)v258[5];
                NSAppendPrintF_safe();
                id v23 = v215;
                goto LABEL_66;
              }
              if (!strcasecmp(string, "SimulateRemoveCloudConfig") && IsAppleInternalBuild())
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v105 = [(ENDaemon *)self->_daemon configurationManager];
                [v105 resetConfigurationCache];

                [(ENDaemon *)self->_daemon prefsChanged];
                id v106 = [(ENDaemon *)self->_daemon activeEntity];
                v107 = [v106 entity];
                id v26 = [v107 region];

                if (v26)
                {
                  [(ENDaemon *)self->_daemon _exposureNotificationRegionConfigurationRemoved:v26];
                  v108 = (void **)(v258 + 5);
                  v214 = (void *)v258[5];
                  NSAppendPrintF_safe();
                  v109 = v214;
                }
                else
                {
                  v108 = (void **)(v258 + 5);
                  v213 = (void *)v258[5];
                  NSAppendPrintF_safe();
                  v109 = v213;
                }
                id v110 = v109;
                v111 = *v108;
                void *v108 = v110;

LABEL_168:
LABEL_83:
                xpc_object_t reply = xpc_dictionary_create_reply(v5);
                id v26 = reply;
                if (reply)
                {
                  if (v258[5]) {
                    long long v38 = (__CFString *)v258[5];
                  }
                  else {
                    long long v38 = @"None\n";
                  }
                  id v39 = reply;
                  id v40 = (const char *)[(__CFString *)v38 UTF8String];
                  if (v40) {
                    xpc_dictionary_set_string(v39, "oStr", v40);
                  }

                  [(ENXPCConnection *)self _xpcSendMessage:v39];
                }
                else if (gLogCategory__ENDaemon <= 90 {
                       && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
                }
                {
                  LogPrintF_safe();
                }
                goto LABEL_90;
              }
              if (!strcasecmp(string, "removeCloudOverrides"))
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                size_t v94 = (id *)(v258 + 5);
                id v212 = (id)v258[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v94, v212);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v95 = (id *)(v258 + 5);
                id v211 = (id)v258[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v95, v211);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v96 = (id *)(v258 + 5);
                id v210 = (id)v258[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v96, v210);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v97 = (id *)(v258 + 5);
                id v209 = (id)v258[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v97, v209);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                uint64_t v98 = (id *)(v258 + 5);
                id v208 = (id)v258[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v98, v208);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v99 = (id *)(v258 + 5);
                id v207 = (id)v258[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v99, v207);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                id v100 = (id *)(v258 + 5);
                id v206 = (id)v258[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v100, v206);
                CFPrefs_RemoveValue();
                CFPrefs_RemoveValue();
                goto LABEL_83;
              }
              if (!strcasecmp(string, "telemetryAuthorization") && IsAppleInternalBuild())
              {
                v77 = [(ENDaemon *)self->_daemon configurationManager];
                v174 = [v77 configurationStore];

                v12[2](v12);
                int v78 = (char *)objc_claimAutoreleasedReturnValue();
                if (v78) {
                  goto LABEL_298;
                }
                v79 = [(ENDaemon *)self->_daemon activeEntity];
                int v80 = [v79 entity];
                int v78 = [v80 region];

                if (v78)
                {
LABEL_298:
                  if (gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v162 = v78;
                    LogPrintF_safe();
                  }
                  id location = 0;
                  v112 = v268;
                  id v205 = v268[5];
                  char v113 = CUXPCDecodeNSString();
                  objc_storeStrong(v112 + 5, v205);
                  if (v113)
                  {
                    uint64_t v114 = [location BOOLValue];
                    if (gLogCategory_ENDaemon <= 30
                      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      v115 = "no";
                      if (v114) {
                        v115 = "yes";
                      }
                      v162 = v115;
                      LogPrintF_safe();
                    }
                    objc_msgSend(v174, "serverConfigurationResponseForRegion:", v78, v162);
                    id v116 = (id)objc_claimAutoreleasedReturnValue();
                    v172 = v78;
                    if (v116)
                    {
                      id v117 = [MEMORY[0x1E4F1CA68] dictionaryWithDictionary:v116];
                      v170 = [v116 objectForKeyedSubscript:@"config"];
                      v118 = [MEMORY[0x1E4F1CA68] dictionaryWithDictionary:v170];
                      v119 = [MEMORY[0x1E4F28EC8] numberWithBool:v114];
                      [v118 setValue:v119 forKey:@"telemetryAuthorization"];

                      if (gLogCategory_ENDaemon <= 30
                        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                      {
                        v120 = "no";
                        if (v114) {
                          v120 = "yes";
                        }
                        v167 = v120;
                        LogPrintF_safe();
                      }
                      objc_msgSend(v117, "setValue:forKey:", v118, @"config", v167);
                      id v121 = v268;
                      id v204 = v268[5];
                      char v122 = [v174 saveServerConfigurationResponse:v117 error:&v204];
                      objc_storeStrong(v121 + 5, v204);
                      if (v122)
                      {
                        id v123 = [v174 configurationForRegion:v172];
                        [(ENDaemon *)self->_daemon _exposureNotificationRegionConfigurationChanged:v123];
                        int v124 = 0;
                      }
                      else
                      {
                        uint64_t v161 = ENNestedErrorF();
                        id v123 = v268[5];
                        v268[5] = (id)v161;
                        int v124 = 1;
                      }
                    }
                    else
                    {
                      uint64_t v160 = ENErrorF();
                      id v117 = v268[5];
                      v268[5] = (id)v160;
                      int v124 = 1;
                    }

                    int v78 = v172;
                  }
                  else
                  {
                    uint64_t v159 = ENErrorF();
                    id v116 = v268[5];
                    v268[5] = (id)v159;
                    int v124 = 1;
                  }

                  if (v124) {
                    goto LABEL_91;
                  }
                  goto LABEL_83;
                }
                uint64_t v157 = ENErrorF();
                id v158 = v268[5];
                v268[5] = (id)v157;

                id v154 = v174;
                goto LABEL_279;
              }
              if (!strcasecmp(string, "sendErrorMetric"))
              {
                id location = 0;
                int v82 = v268;
                id v203 = v268[5];
                CUXPCDecodeNSString();
                objc_storeStrong(v82 + 5, v203);
                if (gLogCategory_ENDaemon <= 90
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
              }
              else
              {
                if (!strcasecmp(string, "latestExposureDPMetric"))
                {
                  int v87 = [(ENDaemon *)self->_daemon _getLatestExposureForDifferentialPrivacy];
                  if (v87 != 1)
                  {
                    uint64_t v22 = (id *)(v258 + 5);
                    if (v87)
                    {
                      v200 = (void *)v258[5];
                      NSAppendPrintF();
                      id v23 = v200;
                    }
                    else
                    {
                      v202 = (void *)v258[5];
                      NSAppendPrintF();
                      id v23 = v202;
                    }
                    goto LABEL_55;
                  }
                  uint64_t v31 = (id *)(v258 + 5);
                  v201 = (void *)v258[5];
                  NSAppendPrintF();
                  id v23 = v201;
LABEL_66:
                  uint64_t v24 = v31;
                  goto LABEL_67;
                }
                if (strcasecmp(string, "resetAA"))
                {
                  if (!strcasecmp(string, "help"))
                  {
                    if (gLogCategory_ENDaemon <= 30
                      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF_safe();
                    }
                    long long v130 = (id *)(v258 + 5);
                    id v199 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v130, v199);
                    long long v131 = (id *)(v258 + 5);
                    id v198 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v131, v198);
                    long long v132 = (id *)(v258 + 5);
                    id v197 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v132, v197);
                    long long v133 = (id *)(v258 + 5);
                    id v196 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v133, v196);
                    long long v134 = (id *)(v258 + 5);
                    id v195 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v134, v195);
                    long long v135 = (id *)(v258 + 5);
                    id v194 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v135, v194);
                    id v136 = (id *)(v258 + 5);
                    id v193 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v136, v193);
                    v137 = (id *)(v258 + 5);
                    id v192 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v137, v192);
                    v138 = (id *)(v258 + 5);
                    id v191 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v138, v191);
                    v139 = (id *)(v258 + 5);
                    id v190 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v139, v190);
                    v140 = (id *)(v258 + 5);
                    id v189 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v140, v189);
                    v141 = (id *)(v258 + 5);
                    id v188 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v141, v188);
                    uint64_t v142 = (id *)(v258 + 5);
                    id v187 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v142, v187);
                    v143 = (id *)(v258 + 5);
                    id v186 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v143, v186);
                    v144 = (id *)(v258 + 5);
                    id v185 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v144, v185);
                    v145 = (id *)(v258 + 5);
                    id v184 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v145, v184);
                    v146 = (id *)(v258 + 5);
                    id v183 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v146, v183);
                    v147 = (id *)(v258 + 5);
                    id v182 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v147, v182);
                    v148 = (id *)(v258 + 5);
                    id v181 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v148, v181);
                    v149 = (id *)(v258 + 5);
                    id v180 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v149, v180);
                    v150 = (id *)(v258 + 5);
                    id v179 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v150, v179);
                    v151 = (id *)(v258 + 5);
                    id v178 = (id)v258[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v151, v178);
                    uint64_t v22 = (id *)(v258 + 5);
                    v177 = (void *)v258[5];
                    NSAppendPrintF_safe();
                    id v23 = v177;
                    goto LABEL_55;
                  }
                  goto LABEL_35;
                }
                id location = 0;
                CUXPCDecodeNSString();
                if ([0 integerValue] >= 1)
                {
                  v101 = [(ENDaemon *)self->_daemon regionMonitor];
                  v102 = [v101 getCurrentRegionVisitWithError:0];
                  v103 = [v102 region];

                  if (v103)
                  {
                    [(ENDaemon *)self->_daemon _writePreferenceRegionPendingOnboarding:v103];
                    CFPrefs_SetDouble();
                    uint64_t v104 = [(ENXPCConnection *)self daemon];
                    [v104 onboardingTriggerRetry:0];
                  }
                  else if (gLogCategory_ENDaemon <= 90 {
                         && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  }
                  {
                    LogPrintF_safe();
                  }

                  goto LABEL_47;
                }
                if (gLogCategory_ENDaemon <= 90
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                uint64_t v152 = ENErrorF();
                id v153 = v268[5];
                v268[5] = (id)v152;
              }
              id v154 = location;
              goto LABEL_279;
            }
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            v12[2](v12);
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            if (v26) {
              goto LABEL_166;
            }
            v71 = [(ENDaemon *)self->_daemon activeEntity];
            int v72 = [v71 entity];
            id v26 = [v72 region];

            if (v26)
            {
LABEL_166:
              v73 = [(ENDaemon *)self->_daemon configurationManager];
              int v74 = [v73 configurationStore];
              v75 = [v74 serverConfigurationResponseForRegion:v26];

              if (!v75) {
                goto LABEL_273;
              }
              int v76 = (id *)(v258 + 5);
              id v218 = (id)v258[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v76, v218);

              goto LABEL_168;
            }
LABEL_35:
            uint64_t v13 = ENErrorF();
            id v14 = v268[5];
            v268[5] = (id)v13;

LABEL_91:
LABEL_92:
            _Block_object_dispose(&v257, 8);

LABEL_93:
            goto LABEL_94;
          }
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          uint64_t v28 = v12[2](v12);
          if (!v28)
          {
            id v62 = [(ENDaemon *)self->_daemon activeEntity];
            id v63 = [v62 entity];
            uint64_t v28 = [v63 region];

            if (!v28) {
              goto LABEL_35;
            }
          }
          v64 = v175[2]();
          v65 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v66 = [v65 isSensitiveLoggingAllowed];

          if (v66
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v162 = (const char *)v28;
            v168 = v64;
            LogPrintF_safe();
          }
          if (objc_msgSend(v64, "length", v162, v168))
          {
            unint64_t v81 = [v64 integerValue];
            if (v81 > 3)
            {
              if (gLogCategory_ENDaemon <= 90
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              uint64_t v85 = ENErrorF();
              id v86 = v268[5];
              v268[5] = (id)v85;

              goto LABEL_191;
            }
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v166 = v28;
              unint64_t v169 = v81;
              LogPrintF_safe();
            }
            v83 = [(ENDaemon *)self->_daemon configurationManager];
            [v83 overrideRampModeForRegion:v28 rampMode:v81];
          }
          id location = 0;
          objc_initWeak(&location, self);
          uint64_t v84 = [(ENDaemon *)self->_daemon configurationManager];
          v219[0] = MEMORY[0x1E4F143A8];
          v219[1] = 3221225472;
          v219[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_8;
          v219[3] = &unk_1E69AD6A0;
          v219[4] = self;
          v221 = &v257;
          id v220 = v5;
          objc_copyWeak(&v222, &location);
          [v84 fetchServerConfigurationsForRegion:v28 userInitiated:0 withCompletion:v219];

          objc_destroyWeak(&v222);
          objc_destroyWeak(&location);
LABEL_191:

LABEL_104:
          goto LABEL_91;
        }
        BOOL v33 = ENErrorF();
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v164 = CUPrintNSError();
          LogPrintF_safe();
        }
        v57 = NSErrorF();
        uint64_t v58 = ENNestedErrorF();
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v165 = CUPrintNSError();
          LogPrintF_safe();
        }
        v59 = (id *)(v258 + 5);
        id v225 = (id)v258[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v59, v225);
      }
LABEL_82:

      goto LABEL_83;
    }
    if (!xpc_dictionary_get_string(v10, "activity")) {
      goto LABEL_35;
    }
    if (stricmp_prefix())
    {
      if (stricmp_prefix())
      {
        if (stricmp_prefix())
        {
          if (stricmp_prefix()) {
            goto LABEL_35;
          }
          uint64_t v20 = 8;
          int v19 = 1;
        }
        else
        {
          int v19 = 0;
          uint64_t v20 = 4;
        }
      }
      else
      {
        int v19 = 0;
        uint64_t v20 = 2;
      }
    }
    else
    {
      int v19 = 0;
      uint64_t v20 = 1;
    }
    id v32 = xpc_dictionary_get_string(v10, "bundleID");
    if (!v32) {
      goto LABEL_35;
    }
    BOOL v33 = [MEMORY[0x1E4F29020] stringWithUTF8String:v32];
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintFlags32();
      v168 = v162 = (const char *)v33;
      LogPrintF_safe();
    }
    if ((v20 & 3) != 0)
    {
      BOOL v34 = 0;
      uint64_t v35 = 30;
    }
    else
    {
      BOOL v34 = (v20 & 4) == 0;
      if ((v20 & 4) != 0) {
        uint64_t v35 = 210;
      }
      else {
        uint64_t v35 = 0;
      }
      if ((v19 | ((v20 & 4) >> 2)) != 1) {
        goto LABEL_81;
      }
    }
    -[ENDaemon appLaunchWithBundleID:activity:shouldEnterForeground:requiredRuntimeInSeconds:](self->_daemon, "appLaunchWithBundleID:activity:shouldEnterForeground:requiredRuntimeInSeconds:", v33, v20, v34, v35, v162, v168);
LABEL_81:
    long long v36 = (id *)(v258 + 5);
    id v254 = (id)v258[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v36, v254);
    goto LABEL_82;
  }
LABEL_94:
  v6[2](v6);

  _Block_object_dispose(&v267, 8);
}

uint64_t __41__ENXPCConnection__xpcDiagnosticControl___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

id __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_2()
{
  CUXPCDecodeNSString();
  CUXPCDecodeNSString();

  return 0;
}

id __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_3()
{
  CUXPCDecodeNSString();
  id v0 = 0;

  return v0;
}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) regionMonitor];
  int v3 = [v2 testRegionDataSource];

  int v4 = [*(id *)(*(void *)(a1 + 32) + 32) regionMonitor];
  uint64_t v5 = v4;
  if (v3)
  {
    id v6 = [v4 testRegionDataSource];
    [v6 regionChanged];
  }
  else
  {
    [v4 resetRegionMonitor];
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void *)(a1 + 40);
  id obj = *(id *)(v7 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v7 + 40), obj);
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    LogPrintF_safe();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  uint64_t v9 = reply;
  if (reply)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      BOOL v10 = *(__CFString **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    else {
      BOOL v10 = @"None\n";
    }
    id v11 = reply;
    int v12 = (const char *)[(__CFString *)v10 UTF8String];
    if (v12) {
      xpc_dictionary_set_string(v11, "oStr", v12);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _xpcSendMessage:v11];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) regionMonitor];
  [v2 resetRegionMonitor];

  int v3 = [*(id *)(*(void *)(a1 + 32) + 32) regionMonitor];
  int v4 = [v3 getCurrentRegionVisitWithError:0];

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  int v12 = v4;
  id obj = *(id *)(v5 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    int v12 = v4;
    LogPrintF_safe();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
  uint64_t v7 = reply;
  if (reply)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      BOOL v8 = *(__CFString **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    else {
      BOOL v8 = @"None\n";
    }
    id v9 = reply;
    BOOL v10 = (const char *)[(__CFString *)v8 UTF8String];
    if (v10) {
      xpc_dictionary_set_string(v9, "oStr", v10);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _xpcSendMessage:v9];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) regionMonitor];
  objc_msgSend(v2, "updateRegionMonitorMonitoringMode:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));

  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void *)(a1 + 40);
  id obj = *(id *)(v3 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v3 + 40), obj);
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    LogPrintF_safe();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  uint64_t v5 = reply;
  if (reply)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      id v6 = *(__CFString **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    else {
      id v6 = @"None\n";
    }
    id v7 = reply;
    BOOL v8 = (const char *)[(__CFString *)v6 UTF8String];
    if (v8) {
      xpc_dictionary_set_string(v7, "oStr", v8);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _xpcSendMessage:v7];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) regionMonitor];
  uint64_t v3 = [v2 getMonitoringMode];

  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v5 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v6 = [v5 isSensitiveLoggingAllowed];

  if (v6 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
  BOOL v8 = reply;
  if (reply)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      id v9 = *(__CFString **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    else {
      id v9 = @"None";
    }
    id v10 = reply;
    id v11 = (const char *)[(__CFString *)v9 UTF8String];
    if (v11) {
      xpc_dictionary_set_string(v10, "oStr", v11);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _xpcSendMessage:v10];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_9;
  block[3] = &unk_1E69AD678;
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  dispatch_async(v7, block);
  objc_destroyWeak(&v16);
}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v2 + 40);
  uint64_t v3 = (id *)(v2 + 40);
  id obj = v4;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    uint64_t v5 = *(void *)(a1 + 40);
  }
  uint64_t v12 = v5;
  NSAppendPrintF_safe();
  objc_storeStrong(v3, obj);
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  id v7 = reply;
  if (reply)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      id v8 = *(__CFString **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    else {
      id v8 = @"None\n";
    }
    id v9 = reply;
    id v10 = (const char *)[(__CFString *)v8 UTF8String];
    if (v10) {
      xpc_dictionary_set_string(v9, "oStr", v10);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _xpcSendMessage:v9];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_xpcDiagnosticLog:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__3;
  uint64_t v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__ENXPCConnection__xpcDiagnosticLog___block_invoke;
  v21[3] = &unk_1E69ACB90;
  id v23 = &v24;
  v21[4] = self;
  id v5 = v4;
  id v22 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v21);
  id v7 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = xpc_dictionary_get_value(v5, "parm");
    id v10 = (void *)v9;
    if (v9)
    {
      if (MEMORY[0x1D943A770](v9) == MEMORY[0x1E4F14590])
      {
        if (!xpc_dictionary_get_string(v10, "iStr") || !LogControl()) {
          goto LABEL_6;
        }
        id v17 = NSErrorF();
        uint64_t v18 = ENNestedErrorF();
        int v19 = (void *)v25[5];
        void v25[5] = v18;
      }
      else
      {
        uint64_t v15 = ENErrorF();
        id v16 = (void *)v25[5];
        void v25[5] = v15;
      }
LABEL_10:

      goto LABEL_11;
    }
LABEL_6:
    if (LogShow())
    {
      uint64_t v12 = NSErrorF();
      uint64_t v13 = ENNestedErrorF();
      id v14 = (void *)v25[5];
      void v25[5] = v13;
    }
    else
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      uint64_t v12 = reply;
      if (reply)
      {
        xpc_dictionary_set_string(reply, "oStr", 0);
        free(0);
        [(ENXPCConnection *)self _xpcSendMessage:v12];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  v6[2](v6);

  _Block_object_dispose(&v24, 8);
}

uint64_t __37__ENXPCConnection__xpcDiagnosticLog___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcDiagnosticShow:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = (id *)&v30;
  uint64_t v32 = 0x3032000000;
  BOOL v33 = __Block_byref_object_copy__3;
  BOOL v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __38__ENXPCConnection__xpcDiagnosticShow___block_invoke;
  v27[3] = &unk_1E69ACB90;
  id v29 = &v30;
  v27[4] = self;
  id v5 = v4;
  id v28 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v27);
  uint64_t v7 = v31;
  id obj = v31[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    uint64_t v9 = xpc_dictionary_get_value(v5, "parm");
    id v10 = (void *)v9;
    if (!v9) {
      goto LABEL_7;
    }
    if (MEMORY[0x1D943A770](v9) != MEMORY[0x1E4F14590]) {
      goto LABEL_6;
    }
    string = xpc_dictionary_get_string(v10, "iStr");
    xpc_dictionary_get_int64(v10, "vrbL");
    if (string)
    {
      if (strcasecmp(string, "adv"))
      {
LABEL_6:
        uint64_t v12 = ENErrorF();
        uint64_t v13 = 0;
        id v14 = v31[5];
        void v31[5] = (id)v12;
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v20 = [(ENDaemon *)self->_daemon btTracingAppID];

      if (!v20)
      {
        NSAppendPrintF_safe();
        uint64_t v13 = (__CFString *)0;
LABEL_9:
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        id v14 = reply;
        if (reply)
        {
          if (v13) {
            uint64_t v18 = v13;
          }
          else {
            uint64_t v18 = @"None\n";
          }
          id v14 = reply;
          int v19 = (const char *)[(__CFString *)v18 UTF8String];
          if (v19) {
            xpc_dictionary_set_string(v14, "oStr", v19);
          }

          [(ENXPCConnection *)self _xpcSendMessage:v14];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
        goto LABEL_16;
      }
      xpc_object_t v21 = [(ENDaemon *)self->_daemon delegate];
      id v22 = [v21 retrieveCurrentAdvertisingPayload];

      id v15 = v22;
      [v15 bytes];
      if ((unint64_t)[v15 length] < 0x14)
      {
        uint64_t v24 = 0;
        id v23 = (void **)&v24;
        [v15 length];
        NSAppendPrintF();
      }
      else
      {
        v25[0] = 0;
        id v23 = (void **)v25;
        NSAppendPrintF();
      }
      id v16 = *v23;
    }
    else
    {
LABEL_7:
      v25[1] = 0;
      CUDescriptionWithLevel();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      id v16 = 0;
    }
    uint64_t v13 = v16;

    goto LABEL_9;
  }
LABEL_17:
  v6[2](v6);

  _Block_object_dispose(&v30, 8);
}

uint64_t __38__ENXPCConnection__xpcDiagnosticShow___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcNotificationTrigger:(id)a3
{
  id v4 = a3;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__3;
  id v51 = __Block_byref_object_dispose__3;
  id v52 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __43__ENXPCConnection__xpcNotificationTrigger___block_invoke;
  v44[3] = &unk_1E69ACB90;
  id v46 = &v47;
  v44[4] = self;
  id v5 = v4;
  id v45 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v44);
  uint64_t v7 = (id *)(v48 + 5);
  id obj = (id)v48[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    int int64 = xpc_dictionary_get_int64(v5, "noteType");
    uint int64 = xpc_dictionary_get_uint64(v5, "intS");
    long long v11 = [(ENDaemon *)self->_daemon activeEntity];
    uint64_t v12 = [v11 entity];
    uint64_t v13 = [v12 bundleIdentifier];

    string = xpc_dictionary_get_string(v5, "aBid");
    if (string)
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F29020]) initWithUTF8String:string];

      uint64_t v13 = (void *)v15;
    }
    id v16 = (id *)(v48 + 5);
    id v42 = (id)v48[5];
    char v17 = CUXPCDecodeNSString();
    objc_storeStrong(v16, v42);
    if (v17)
    {
      uint64_t v18 = [(ENDaemon *)self->_daemon activeEntity];
      int v19 = [v18 entity];
      uint64_t v20 = [v19 region];

      xpc_object_t v21 = xpc_dictionary_get_value(v5, "regionData");

      if (!v21) {
        goto LABEL_7;
      }
      objc_opt_class();
      id v22 = (id *)(v48 + 5);
      id v41 = (id)v48[5];
      uint64_t v23 = ENXPCDecodeSecureObject();
      objc_storeStrong(v22, v41);

      uint64_t v20 = (void *)v23;
      if (v23)
      {
LABEL_7:
        switch(int64)
        {
          case 1:
            if (!v20) {
              goto LABEL_69;
            }
            uint64_t v24 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v25 = [v24 isSensitiveLoggingAllowed];

            if (v25
              && gLogCategory_ENDaemon <= 50
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
            id v34 = objc_alloc_init(MEMORY[0x1E4F25778]);
            id v35 = [MEMORY[0x1E4F29120] UUID];
            [v34 setIdentifier:v35];

            long long v36 = [MEMORY[0x1E4F1CB08] URLWithString:@"https://example.com"];
            [v34 setLearnMoreURL:v36];

            [v34 setLocalizedBodyText:@"Example body text."];
            [v34 setLocalizedSubjectText:@"Example Title"];
            long long v37 = [MEMORY[0x1E4F1C9C0] date];
            [v34 setNotificationDate:v37];

            [v34 setRegion:v20];
            [(ENDaemon *)self->_daemon postExposureNotification:v34];

            goto LABEL_55;
          case 2:
            if (!v20) {
              goto LABEL_69;
            }
            id v28 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v29 = [v28 isSensitiveLoggingAllowed];

            if (v29
              && gLogCategory_ENDaemon <= 50
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              id v40 = v20;
              LogPrintF_safe();
            }
            -[ENDaemon postOnboardingNotificationForRegion:](self->_daemon, "postOnboardingNotificationForRegion:", v20, v40);
            goto LABEL_55;
          case 3:
            if (![v13 length]) {
              goto LABEL_13;
            }
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            [(ENDaemon *)self->_daemon postExposureSummaryAccessNotificationWithAppBundleIdentifier:v13 string:@"{Example string from the Public Health Agency}"];
            goto LABEL_55;
          case 4:
            if (uint64)
            {
              if (gLogCategory_ENDaemon <= 30
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                id v40 = (void *)uint64;
                LogPrintF_safe();
              }
              -[ENDaemon monthlyTriggerActivateWithIntervalOverride:](self->_daemon, "monthlyTriggerActivateWithIntervalOverride:", uint64, v40);
            }
            else
            {
              if (![v13 length])
              {
LABEL_13:
                uint64_t v26 = ENErrorF();
                id v27 = (void *)v48[5];
                v48[5] = v26;

                goto LABEL_58;
              }
              if (gLogCategory_ENDaemon <= 50
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              [(ENDaemon *)self->_daemon postMonthlySummaryNotificationForAppBundleIdentifier:v13];
            }
            goto LABEL_55;
          case 5:
            if (!v20) {
              goto LABEL_69;
            }
            uint64_t v30 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v31 = [v30 isSensitiveLoggingAllowed];

            if (v31
              && gLogCategory_ENDaemon <= 50
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              id v40 = v20;
              LogPrintF_safe();
            }
            -[ENDaemon postAnalyticsOptInNotificationForRegion:](self->_daemon, "postAnalyticsOptInNotificationForRegion:", v20, v40);
            goto LABEL_55;
          case 6:
            if (v20)
            {
              uint64_t v32 = +[ENLoggingPrefs sharedENLoggingPrefs];
              int v33 = [v32 isSensitiveLoggingAllowed];

              if (v33
                && gLogCategory_ENDaemon <= 50
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                id v40 = v20;
                LogPrintF_safe();
              }
              -[ENDaemon postPreAuthorizationNotificationForRegion:](self->_daemon, "postPreAuthorizationNotificationForRegion:", v20, v40);
LABEL_55:
              xpc_object_t reply = xpc_dictionary_create_reply(v5);
              if (reply)
              {
                [(ENXPCConnection *)self _xpcSendMessage:reply];
              }
              else if (gLogCategory__ENDaemon <= 90 {
                     && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
              }
              {
                LogPrintF_safe();
              }
            }
            else
            {
LABEL_69:
              uint64_t v39 = ENErrorF();
              uint64_t v20 = (void *)v48[5];
              v48[5] = v39;
            }
LABEL_58:

            break;
          default:
            goto LABEL_13;
        }
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v47, 8);
}

uint64_t __43__ENXPCConnection__xpcNotificationTrigger___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetActiveRegion:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  int v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__ENXPCConnection__xpcGetActiveRegion___block_invoke;
  v18[3] = &unk_1E69ACB90;
  uint64_t v20 = &v21;
  v18[4] = self;
  id v5 = v4;
  id v19 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v18);
  uint64_t v7 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = [(ENDaemon *)self->_daemon activeEntity];
    id v10 = [v9 entity];
    long long v11 = [v10 region];

    if (v11)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        uint64_t v13 = (id *)(v22 + 5);
        id v16 = (id)v22[5];
        int v14 = ENXPCEncodeSecureObject();
        objc_storeStrong(v13, v16);
        if (v14) {
          [(ENXPCConnection *)self _xpcSendMessage:reply];
        }
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v15 = ENErrorF();
      xpc_object_t reply = (xpc_object_t)v22[5];
      void v22[5] = v15;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v21, 8);
}

uint64_t __39__ENXPCConnection__xpcGetActiveRegion___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetRegionHistory:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__3;
  id v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __40__ENXPCConnection__xpcGetRegionHistory___block_invoke;
  v20[3] = &unk_1E69ACB90;
  id v22 = &v23;
  void v20[4] = self;
  id v5 = v4;
  id v21 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v20);
  uint64_t v7 = (id *)(v24 + 5);
  id obj = (id)v24[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = [(ENDaemon *)self->_daemon regionMonitor];
    id v18 = 0;
    id v10 = [v9 getAllRegionVisitsWithError:&v18];
    id v11 = v18;

    if (v11)
    {
      uint64_t v16 = ENNestedErrorF();
    }
    else
    {
      if (v10)
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          uint64_t v13 = (id *)(v24 + 5);
          id v17 = (id)v24[5];
          int v14 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v17];
          objc_storeStrong(v13, v17);
          uint64_t v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          xpc_dictionary_set_value(reply, "rgnHy", v15);
          [(ENXPCConnection *)self _xpcSendMessage:reply];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
        goto LABEL_6;
      }
      uint64_t v16 = ENErrorF();
    }
    xpc_object_t reply = (xpc_object_t)v24[5];
    void v24[5] = v16;
LABEL_6:
  }
  v6[2](v6);

  _Block_object_dispose(&v23, 8);
}

uint64_t __40__ENXPCConnection__xpcGetRegionHistory___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetRegionHistoryEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__ENXPCConnection__xpcGetRegionHistoryEnabled___block_invoke;
  v16[3] = &unk_1E69ACB90;
  id v18 = &v19;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v16);
  uint64_t v7 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = (id *)(v20 + 5);
    id v14 = (id)v20[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v14];
    objc_storeStrong(v9, v14);
    if (v10)
    {
      uint64_t Int64 = CFPrefs_GetInt64();
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      uint64_t v13 = reply;
      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "enbd", Int64 == 0);
        [(ENXPCConnection *)self _xpcSendMessage:v13];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __47__ENXPCConnection__xpcGetRegionHistoryEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetRegionHistoryEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__ENXPCConnection__xpcSetRegionHistoryEnabled___block_invoke;
  v14[3] = &unk_1E69ACB90;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v14);
  uint64_t v7 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = (id *)(v18 + 5);
    id v12 = (id)v18[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v12];
    objc_storeStrong(v9, v12);
    if (v10)
    {
      xpc_dictionary_get_BOOL(v5, "enbd");
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      CFPrefs_SetValue();
      [(ENDaemon *)self->_daemon prefsChanged];
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        [(ENXPCConnection *)self _xpcSendMessage:reply];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __47__ENXPCConnection__xpcSetRegionHistoryEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetRegionMonitorEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__3;
  id v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__ENXPCConnection__xpcGetRegionMonitorEnabled___block_invoke;
  v17[3] = &unk_1E69ACB90;
  uint64_t v19 = &v20;
  v17[4] = self;
  id v5 = v4;
  id v18 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v17);
  uint64_t v7 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = (id *)(v21 + 5);
    id v15 = (id)v21[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v15];
    objc_storeStrong(v9, v15);
    if (v10)
    {
      id v11 = [(ENDaemon *)self->_daemon regionMonitor];
      uint64_t v12 = [v11 getAuthorizationState];

      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      id v14 = reply;
      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "enbd", v12 == 2);
        [(ENXPCConnection *)self _xpcSendMessage:v14];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v20, 8);
}

uint64_t __47__ENXPCConnection__xpcGetRegionMonitorEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetRegionConfig:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__ENXPCConnection__xpcGetRegionConfig___block_invoke;
  v16[3] = &unk_1E69ACB90;
  id v18 = &v19;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v16);
  uint64_t v7 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = [(ENDaemon *)self->_daemon activeEntity];
    BOOL v10 = [v9 entity];
    id v11 = [v10 region];

    if (v11)
    {
      int64_t int64 = xpc_dictionary_get_int64(v5, "cty");
      switch(int64)
      {
        case 0:
          [(ENXPCConnection *)self _xpcGetRegionSystemConfig:v5];
          goto LABEL_10;
        case 10:
          [(ENXPCConnection *)self _xpcGetRegionServerConfig:v5];
          goto LABEL_10;
        case 20:
          [(ENXPCConnection *)self _xpcGetRegionAgencyConfig:v5];
LABEL_10:

          goto LABEL_11;
      }
    }
    uint64_t v13 = ENErrorF();
    id v14 = (void *)v20[5];
    void v20[5] = v13;

    goto LABEL_10;
  }
LABEL_11:
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __39__ENXPCConnection__xpcGetRegionConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetRegionSystemConfig:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__ENXPCConnection__xpcGetRegionSystemConfig___block_invoke;
  v18[3] = &unk_1E69ACB90;
  uint64_t v20 = &v21;
  v18[4] = self;
  id v5 = v4;
  id v19 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v18);
  uint64_t v7 = [(ENDaemon *)self->_daemon activeEntity];
  BOOL v8 = [v7 entity];
  uint64_t v9 = [v8 region];

  if (v9)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      id v11 = [(ENDaemon *)self->_daemon configurationManager];
      uint64_t v12 = [v11 configurationStore];
      uint64_t v13 = [v12 configurationForRegion:v9];

      if (v13)
      {
        id v14 = (id *)(v22 + 5);
        id obj = (id)v22[5];
        id v15 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&obj];
        objc_storeStrong(v14, obj);
        id v16 = v15;
        xpc_dictionary_set_data(reply, "svrCfg", (const void *)[v16 bytes], objc_msgSend(v16, "length"));
      }
      [(ENXPCConnection *)self _xpcSendMessage:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  v6[2](v6);
  _Block_object_dispose(&v21, 8);
}

uint64_t __45__ENXPCConnection__xpcGetRegionSystemConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetRegionServerConfig:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__3;
  id v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__ENXPCConnection__xpcGetRegionServerConfig___block_invoke;
  v21[3] = &unk_1E69ACB90;
  uint64_t v23 = &v24;
  v21[4] = self;
  id v5 = v4;
  id v22 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v21);
  objc_opt_class();
  uint64_t v7 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  BOOL v8 = ENXPCDecodeSecureObjectIfPresent();
  objc_storeStrong(v7, obj);
  if (v8) {
    goto LABEL_2;
  }
  if (v25[5]) {
    goto LABEL_24;
  }
  id v17 = [(ENDaemon *)self->_daemon activeEntity];
  id v18 = [v17 entity];
  BOOL v8 = [v18 region];

  if (v8)
  {
LABEL_2:
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      BOOL v10 = [(ENDaemon *)self->_daemon configurationManager];
      id v11 = [v10 configurationStore];
      uint64_t v12 = [v11 serverConfigurationForRegion:v8];

      if (v12)
      {
        uint64_t v13 = (id *)(v25 + 5);
        id v19 = (id)v25[5];
        id v14 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v19];
        objc_storeStrong(v13, v19);
        id v15 = v14;
        xpc_dictionary_set_data(reply, "svrCfg", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
        [(ENXPCConnection *)self _xpcSendMessage:reply];
      }
      else
      {
        uint64_t v16 = ENErrorF();
        id v15 = (id)v25[5];
        void v25[5] = v16;
      }
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
LABEL_24:
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v24, 8);
}

uint64_t __45__ENXPCConnection__xpcGetRegionServerConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetRegionAgencyConfig:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__ENXPCConnection__xpcGetRegionAgencyConfig___block_invoke;
  v18[3] = &unk_1E69ACB90;
  uint64_t v20 = &v21;
  v18[4] = self;
  id v5 = v4;
  id v19 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v18);
  uint64_t v7 = [(ENDaemon *)self->_daemon activeEntity];
  BOOL v8 = [v7 entity];
  uint64_t v9 = [v8 region];

  if (v9)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      id v11 = [(ENDaemon *)self->_daemon configurationManager];
      uint64_t v12 = [v11 configurationStore];
      uint64_t v13 = [v12 agencyConfigurationForRegion:v9];

      if (v13)
      {
        id v14 = (id *)(v22 + 5);
        id obj = (id)v22[5];
        id v15 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&obj];
        objc_storeStrong(v14, obj);
        id v16 = v15;
        xpc_dictionary_set_data(reply, "svrCfg", (const void *)[v16 bytes], objc_msgSend(v16, "length"));
      }
      [(ENXPCConnection *)self _xpcSendMessage:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  v6[2](v6);
  _Block_object_dispose(&v21, 8);
}

uint64_t __45__ENXPCConnection__xpcGetRegionAgencyConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetAllRegionConfig:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__ENXPCConnection__xpcGetAllRegionConfig___block_invoke;
  v13[3] = &unk_1E69ACB90;
  id v15 = &v16;
  v13[4] = self;
  id v5 = v4;
  id v14 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v13);
  uint64_t v7 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    int64_t int64 = xpc_dictionary_get_int64(v5, "cty");
    if (int64)
    {
      if (int64 == 10)
      {
        [(ENXPCConnection *)self _xpcGetAllRegionServerConfig:v5];
      }
      else if (int64 == 20)
      {
        [(ENXPCConnection *)self _xpcGetAllRegionAgencyConfig:v5];
      }
      else
      {
        uint64_t v10 = ENErrorF();
        id v11 = (void *)v17[5];
        void v17[5] = v10;
      }
    }
    else
    {
      [(ENXPCConnection *)self _xpcGetAllRegionGeneralConfig:v5];
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v16, 8);
}

uint64_t __42__ENXPCConnection__xpcGetAllRegionConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetAllRegionGeneralConfig:(id)a3
{
  id v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__3;
  v14[4] = __Block_byref_object_dispose__3;
  id v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__ENXPCConnection__xpcGetAllRegionGeneralConfig___block_invoke;
  v11[3] = &unk_1E69ACB90;
  uint64_t v13 = v14;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v11);
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  if (reply)
  {
    BOOL v8 = [(ENDaemon *)self->_daemon configurationManager];
    uint64_t v9 = [v8 configurationStore];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__ENXPCConnection__xpcGetAllRegionGeneralConfig___block_invoke_2;
    v10[3] = &unk_1E69AD6C8;
    v10[5] = self;
    v10[6] = v14;
    v10[4] = reply;
    [v9 allRegionConfigurationsWithCompletion:v10];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  v6[2](v6);
  _Block_object_dispose(v14, 8);
}

uint64_t __49__ENXPCConnection__xpcGetAllRegionGeneralConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __49__ENXPCConnection__xpcGetAllRegionGeneralConfig___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  xpc_dictionary_set_data(v5, "svrCfg", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  [*(id *)(a1 + 40) _xpcSendMessage:*(void *)(a1 + 32)];
}

- (void)_xpcGetAllRegionServerConfig:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0;
  int v31 = (id *)&v30;
  uint64_t v32 = 0x3032000000;
  int v33 = __Block_byref_object_copy__3;
  id v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke;
  v27[3] = &unk_1E69ACB90;
  id v29 = &v30;
  v27[4] = self;
  id v5 = v4;
  id v28 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v27);
  id v19 = v6;
  uint64_t v7 = [(ENDaemon *)self->_daemon configurationManager];
  BOOL v8 = [(ENDaemon *)self->_daemon configurationManager];
  uint64_t v9 = [v8 configurationStore];

  if (!v7 || !v9)
  {
    uint64_t v18 = ENErrorF();
    xpc_object_t reply = v31[5];
    void v31[5] = (id)v18;
    goto LABEL_28;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  if (reply)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_2;
    v23[3] = &unk_1E69AD740;
    v23[4] = v7;
    void v23[5] = self;
    id v26 = &v30;
    id v11 = v5;
    id v24 = v11;
    xpc_object_t v25 = reply;
    id v12 = (void (**)(void, void, void))MEMORY[0x1D9439FF0](v23);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_5;
    v22[3] = &unk_1E69AD790;
    v22[4] = v9;
    void v22[5] = self;
    void v22[6] = reply;
    uint64_t v13 = (void (**)(void, void))MEMORY[0x1D9439FF0](v22);
    objc_opt_class();
    id v14 = v31;
    id obj = v31[5];
    id v15 = ENXPCDecodeSecureObjectIfPresent();
    objc_storeStrong(v14 + 5, obj);
    if (v15)
    {
      if (!xpc_dictionary_get_BOOL(v11, "frcFet"))
      {
        int int64 = xpc_dictionary_get_int64(v11, "feRsn");
        switch(int64)
        {
          case 0:
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            ((void (**)(void, void *))v13)[2](v13, v15);
            goto LABEL_27;
          case 1:
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              uint64_t v17 = 1;
              LogPrintF_safe();
            }
            else
            {
              uint64_t v17 = 1;
            }
            break;
          case 2:
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            uint64_t v17 = 0;
            break;
          default:
            goto LABEL_27;
        }
        ((void (**)(void, void *, uint64_t))v12)[2](v12, v15, v17);
        goto LABEL_27;
      }
      ((void (**)(void, void *, void))v12)[2](v12, v15, 0);
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_8;
      v20[3] = &unk_1E69AD6C8;
      void v20[5] = self;
      void v20[6] = &v30;
      void v20[4] = reply;
      [v9 allRegionServerConfigurationsWithCompletion:v20];
    }
LABEL_27:

    id v6 = v19;
    goto LABEL_28;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_28:

  v6[2](v6);
  _Block_object_dispose(&v30, 8);
}

uint64_t __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_3;
  v11[3] = &unk_1E69AD718;
  uint64_t v15 = a1[8];
  id v6 = (void *)a1[4];
  uint64_t v7 = (void *)a1[6];
  v11[4] = a1[5];
  id v12 = v5;
  id v8 = v7;
  uint64_t v9 = a1[7];
  id v13 = v8;
  uint64_t v14 = v9;
  id v10 = v5;
  [v6 fetchServerConfigurationsForRegion:v10 userInitiated:a3 withCompletion:v11];
}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_4;
  block[3] = &unk_1E69AD6F0;
  id v15 = v6;
  id v16 = v5;
  uint64_t v21 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v17 = v8;
  uint64_t v18 = v9;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  id v19 = v10;
  uint64_t v20 = v11;
  id v12 = v5;
  id v13 = v6;
  dispatch_async(v7, block);
}

uint64_t __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_4(void *a1)
{
  if (a1[4] || !a1[5])
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v5 = ENNestedErrorF();
    uint64_t v6 = *(void *)(a1[10] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(*(void *)(a1[10] + 8) + 40);
    uint64_t v9 = (void *)a1[7];
    uint64_t v10 = a1[8];
    return [v9 _xpcSendReplyError:v8 request:v10];
  }
  else
  {
    uint64_t v3 = a1[6];
    uint64_t v2 = (void *)a1[7];
    return objc_msgSend(v2, "_processServerResponseConfigurationsForRegion:serverResponses:request:", v3);
  }
}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)a1[4];
  uint64_t v5 = [v3 countryCode];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_6;
  v8[3] = &unk_1E69AD068;
  uint64_t v6 = a1[6];
  v8[4] = a1[5];
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v4 allCachedServerResponseConfigurationsWithCountryCode:v5 completion:v8];
}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_7;
  v7[3] = &unk_1E69AD768;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processServerResponseConfigurationsForRegion:*(void *)(a1 + 40) serverResponses:*(void *)(a1 + 48) request:*(void *)(a1 + 56)];
}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  xpc_dictionary_set_data(v5, "svrCfg", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  [*(id *)(a1 + 40) _xpcSendMessage:*(void *)(a1 + 32)];
}

- (void)_processServerResponseConfigurationsForRegion:(id)a3 serverResponses:(id)a4 request:(id)a5
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v53 = a4;
  id v8 = a5;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__3;
  int v76 = __Block_byref_object_dispose__3;
  id v77 = 0;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __89__ENXPCConnection__processServerResponseConfigurationsForRegion_serverResponses_request___block_invoke;
  v69[3] = &unk_1E69ACB90;
  v71 = &v72;
  id v51 = self;
  v69[4] = self;
  xpc_object_t xdict = v8;
  id v70 = xdict;
  uint64_t v50 = (void (**)(void))MEMORY[0x1D9439FF0](v69);
  id v52 = [(ENDaemon *)self->_daemon configurationManager];
  id v9 = [(ENDaemon *)self->_daemon configurationManager];
  uint64_t v10 = [v9 configurationStore];

  if (!v52 || !v10)
  {
    uint64_t v48 = ENErrorF();
    uint64_t v47 = (void *)v73[5];
    v73[5] = v48;
    goto LABEL_25;
  }
  uint64_t v11 = [v10 serverConfigurationForRegion:v58];
  uint64_t v49 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend(v53, "count"));
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend(v53, "count"));
    id v55 = objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend(v53, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v26 = v53;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v62 objects:v78 count:16];
    if (!v27) {
      goto LABEL_23;
    }
    uint64_t v28 = *(void *)v63;
    while (1)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F257C0]) initWithServerResponseDictionary:*(void *)(*((void *)&v62 + 1) + 8 * i)];
        int v31 = [v30 region];
        if ([v31 isEqual:v58])
        {
        }
        else
        {
          uint64_t v32 = [v30 region];
          int v33 = [v32 isCountryCodeEqualToRegion:v58];

          if (!v33) {
            goto LABEL_21;
          }
        }
        [v57 addObject:v30];
        id v34 = [v30 region];
        id v35 = [v10 configurationForRegion:v34];

        if (v35) {
          [v56 addObject:v35];
        }
        long long v36 = [v35 region];
        long long v37 = [v10 agencyConfigurationForRegion:v36];

        if (v37) {
          [v55 addObject:v37];
        }

LABEL_21:
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v62 objects:v78 count:16];
      if (!v27)
      {
LABEL_23:

        long long v38 = (id *)(v73 + 5);
        id v61 = (id)v73[5];
        uint64_t v39 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v57 requiringSecureCoding:1 error:&v61];
        objc_storeStrong(v38, v61);
        id v40 = v39;
        xpc_dictionary_set_data(xdict, "svrCfg", (const void *)[v40 bytes], objc_msgSend(v40, "length"));
        id v41 = (id *)(v73 + 5);
        id v60 = (id)v73[5];
        id v42 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v56 requiringSecureCoding:1 error:&v60];
        objc_storeStrong(v41, v60);

        id v43 = v42;
        xpc_dictionary_set_data(xdict, "rgnCfg", (const void *)[v43 bytes], objc_msgSend(v43, "length"));
        id v44 = (id *)(v73 + 5);
        id v59 = (id)v73[5];
        id v45 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v55 requiringSecureCoding:1 error:&v59];
        objc_storeStrong(v44, v59);

        id v46 = v45;
        xpc_dictionary_set_data(xdict, "agnCfg", (const void *)[v46 bytes], objc_msgSend(v46, "length"));

        goto LABEL_24;
      }
    }
  }
  id v12 = (void *)MEMORY[0x1E4F28DA8];
  v81[0] = v11;
  id v13 = [MEMORY[0x1E4F1C970] arrayWithObjects:v81 count:1];
  uint64_t v14 = (id *)(v73 + 5);
  id obj = (id)v73[5];
  id v15 = [v12 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&obj];
  objc_storeStrong(v14, obj);

  id v56 = v15;
  xpc_dictionary_set_data(xdict, "svrCfg", (const void *)[v56 bytes], objc_msgSend(v56, "length"));
  uint64_t v16 = [v10 configurationForRegion:v58];
  v57 = (void *)v16;
  if (v16)
  {
    id v17 = (void *)MEMORY[0x1E4F28DA8];
    uint64_t v80 = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v80 count:1];
    id v19 = (id *)(v73 + 5);
    id v67 = (id)v73[5];
    uint64_t v20 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v67];
    objc_storeStrong(v19, v67);

    id v56 = v20;
    xpc_dictionary_set_data(xdict, "rgnCfg", (const void *)[v56 bytes], objc_msgSend(v56, "length"));
  }
  uint64_t v21 = [v10 agencyConfigurationForRegion:v58];
  id v55 = (void *)v21;
  if (v21)
  {
    id v22 = (void *)MEMORY[0x1E4F28DA8];
    uint64_t v79 = v21;
    uint64_t v23 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v79 count:1];
    id v24 = (id *)(v73 + 5);
    id v66 = (id)v73[5];
    xpc_object_t v25 = [v22 archivedDataWithRootObject:v23 requiringSecureCoding:1 error:&v66];
    objc_storeStrong(v24, v66);

    id v56 = v25;
    xpc_dictionary_set_data(xdict, "agnCfg", (const void *)[v56 bytes], objc_msgSend(v56, "length"));
  }
LABEL_24:

  [(ENXPCConnection *)v51 _xpcSendMessage:xdict];
  uint64_t v47 = v49;
LABEL_25:

  v50[2](v50);
  _Block_object_dispose(&v72, 8);
}

uint64_t __89__ENXPCConnection__processServerResponseConfigurationsForRegion_serverResponses_request___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        id v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetAllRegionAgencyConfig:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__ENXPCConnection__xpcGetAllRegionAgencyConfig___block_invoke;
  v12[3] = &unk_1E69ACB90;
  uint64_t v14 = &v15;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v12);
  if (xpc_dictionary_get_string(v5, "loc"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      id v8 = [(ENDaemon *)self->_daemon configurationManager];
      id v9 = [v8 configurationStore];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __48__ENXPCConnection__xpcGetAllRegionAgencyConfig___block_invoke_2;
      v11[3] = &unk_1E69AD6C8;
      void v11[5] = self;
      v11[6] = &v15;
      v11[4] = reply;
      [v9 allAgencyServerRegionConfigurationsWithCompletion:v11];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    uint64_t v10 = ENErrorF();
    xpc_object_t reply = (xpc_object_t)v16[5];
    void v16[5] = v10;
  }

  v6[2](v6);
  _Block_object_dispose(&v15, 8);
}

uint64_t __48__ENXPCConnection__xpcGetAllRegionAgencyConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        id v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __48__ENXPCConnection__xpcGetAllRegionAgencyConfig___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  xpc_dictionary_set_data(v5, "svrCfg", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  [*(id *)(a1 + 40) _xpcSendMessage:*(void *)(a1 + 32)];
}

- (void)_xpcGetSubdivisionList:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__3;
  id v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __42__ENXPCConnection__xpcGetSubdivisionList___block_invoke;
  v39[3] = &unk_1E69ACB90;
  id v41 = &v42;
  v39[4] = self;
  id v5 = v4;
  id v40 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v39);
  objc_opt_class();
  uint64_t v7 = (id *)(v43 + 5);
  id obj = (id)v43[5];
  id v8 = ENXPCDecodeSecureObjectIfPresent();
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v32 = 0;
    int v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__3;
    long long v36 = __Block_byref_object_dispose__3;
    id v37 = 0;
    id v9 = [(ENDaemon *)self->_daemon configurationManager];
    uint64_t v10 = [v9 configurationStore];
    id v37 = [v10 subdivisionListForRegion:v8];

    xpc_object_t v11 = xpc_array_create(0, 0);
    if (v33[5])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = (id)v33[5];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(id *)(*((void *)&v21 + 1) + 8 * i);
            uint64_t v17 = (const char *)objc_msgSend(v16, "cStringUsingEncoding:", 4, (void)v21);
            if (v17) {
              xpc_array_set_string(v11, 0xFFFFFFFFFFFFFFFFLL, v17);
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v48 count:16];
        }
        while (v13);
      }

      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      id v19 = reply;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "subCodes", v11);
        [(ENXPCConnection *)self _xpcSendMessage:v19];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
    else
    {
      id location = 0;
      objc_initWeak(&location, self);
      id v20 = [(ENDaemon *)self->_daemon configurationManager];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __42__ENXPCConnection__xpcGetSubdivisionList___block_invoke_2;
      v25[3] = &unk_1E69AD7B8;
      id v29 = &v32;
      v25[4] = self;
      id v26 = v8;
      xpc_object_t v27 = v11;
      id v28 = v5;
      objc_copyWeak(&v30, &location);
      [v20 fetchServerConfigurationsForRegion:v26 userInitiated:0 withCompletion:v25];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v32, 8);
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  v6[2](v6);
  _Block_object_dispose(&v42, 8);
}

uint64_t __42__ENXPCConnection__xpcGetSubdivisionList___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        id v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __42__ENXPCConnection__xpcGetSubdivisionList___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) configurationManager];
  uint64_t v3 = [v2 configurationStore];
  uint64_t v4 = [v3 subdivisionListForRegion:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = (const char *)objc_msgSend(v12, "cStringUsingEncoding:", 4, (void)v17);
        if (v13) {
          xpc_array_set_string(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v13);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 56));
  uint64_t v15 = reply;
  if (reply)
  {
    xpc_dictionary_set_value(reply, "subCodes", *(xpc_object_t *)(a1 + 48));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained _xpcSendMessage:v15];
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_xpcGetCurrentAgencyConfig:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  xpc_object_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__3;
  id v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__ENXPCConnection__xpcGetCurrentAgencyConfig___block_invoke;
  v23[3] = &unk_1E69ACB90;
  xpc_object_t v25 = &v26;
  v23[4] = self;
  id v5 = v4;
  id v24 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v23);
  id v7 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    uint64_t v9 = [(ENDaemon *)self->_daemon configurationManager];
    if (!v9)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      goto LABEL_14;
    }
    if (xpc_dictionary_get_BOOL(v5, "feAll"))
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      if (!reply)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_13;
      }
      xpc_object_t v11 = [v9 configurationStore];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __46__ENXPCConnection__xpcGetCurrentAgencyConfig___block_invoke_2;
      v21[3] = &unk_1E69AD6C8;
      void v21[5] = self;
      v21[6] = &v26;
      v21[4] = reply;
      [v11 allAgencyServerRegionConfigurationsWithCompletion:v21];
    }
    else
    {
      id v12 = [(ENDaemon *)self->_daemon activeEntity];
      uint64_t v13 = [v12 entity];
      xpc_object_t reply = [v13 region];

      if (reply)
      {
        uint64_t v14 = [v9 configurationStore];
        xpc_object_t v11 = [v14 agencyConfigurationForRegion:reply];

        uint64_t v15 = (id *)(v27 + 5);
        id v20 = (id)v27[5];
        id v16 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v20];
        objc_storeStrong(v15, v20);
        if (v16)
        {
          xpc_object_t v17 = xpc_dictionary_create_reply(v5);
          if (v17)
          {
            id v18 = v16;
            xpc_dictionary_set_data(v17, "svrCfg", (const void *)[v18 bytes], objc_msgSend(v18, "length"));
            [(ENXPCConnection *)self _xpcSendMessage:v17];
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }
        }
      }
      else
      {
        uint64_t v19 = ENErrorF();
        xpc_object_t v11 = (void *)v27[5];
        void v27[5] = v19;
      }
    }

LABEL_13:
LABEL_14:
  }
  v6[2](v6);

  _Block_object_dispose(&v26, 8);
}

uint64_t __46__ENXPCConnection__xpcGetCurrentAgencyConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __46__ENXPCConnection__xpcGetCurrentAgencyConfig___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  xpc_dictionary_set_data(v5, "svrCfg", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  [*(id *)(a1 + 40) _xpcSendMessage:*(void *)(a1 + 32)];
}

- (void)_xpcSetDeveloperRegionServerConfig:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__3;
  long long v36 = __Block_byref_object_dispose__3;
  id v37 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __54__ENXPCConnection__xpcSetDeveloperRegionServerConfig___block_invoke;
  v29[3] = &unk_1E69ACB90;
  id v31 = &v32;
  v29[4] = self;
  id v5 = v4;
  id v30 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v29);
  uint64_t v7 = (id *)(v33 + 5);
  id obj = (id)v33[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    if (![(ENDaemon *)self->_daemon prefDeveloperServerConfiguration])
    {
      uint64_t v23 = ENErrorF();
      uint64_t v9 = (void *)v33[5];
      void v33[5] = v23;
      goto LABEL_29;
    }
    uint64_t v9 = xpc_dictionary_get_value(v5, "svrCfg");
    uint64_t v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    xpc_object_t v11 = [(ENDaemon *)self->_daemon configurationManager];
    id v12 = [v11 configurationStore];

    if (!v10)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      [v12 clearTemporaryCountrySubdivisionList];
      [v12 clearTemporaryServerConfigurations];
      goto LABEL_26;
    }
    xpc_object_t v25 = v6;
    xpc_object_t reply = [v10 objectForKeyedSubscript:@"appConfigs"];
    if (reply && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [reply count])
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      uint64_t v14 = (id *)(v33 + 5);
      id v27 = (id)v33[5];
      char v15 = objc_msgSend(v12, "saveTemporaryServerConfigurations:error:", reply, &v27, v9);
      objc_storeStrong(v14, v27);
      if ((v15 & 1) == 0)
      {
        uint64_t v9 = v24;
        goto LABEL_28;
      }
      id v16 = [reply objectAtIndexedSubscript:0];
      xpc_object_t v17 = [v16 objectForKeyedSubscript:@"countryCode"];

      id v18 = [v10 objectForKeyedSubscript:@"subdivisions"];
      if (!v18) {
        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v18 count]) {
        goto LABEL_25;
      }
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      uint64_t v19 = [MEMORY[0x1E4F257A8] regionWithCode:v17];
      id v20 = (id *)(v33 + 5);
      id v26 = (id)v33[5];
      int v21 = [v12 saveTemporaryCountrySubdivisionList:v18 region:v19 error:&v26];
      objc_storeStrong(v20, v26);

      if (v21)
      {
LABEL_25:

        uint64_t v9 = v24;
        id v6 = v25;
LABEL_26:
        [(ENDaemon *)self->_daemon prefsChanged];
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          [(ENXPCConnection *)self _xpcSendMessage:reply];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
        goto LABEL_28;
      }

      uint64_t v9 = v24;
      id v6 = v25;
    }
    else
    {
      uint64_t v22 = ENErrorF();
      xpc_object_t v17 = (void *)v33[5];
      void v33[5] = v22;
    }

LABEL_28:
LABEL_29:
  }
  v6[2](v6);

  _Block_object_dispose(&v32, 8);
}

uint64_t __54__ENXPCConnection__xpcSetDeveloperRegionServerConfig___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetRegionConsent:(id)a3
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v84 = 0;
  uint64_t v85 = (id *)&v84;
  uint64_t v86 = 0x3032000000;
  int v87 = __Block_byref_object_copy__3;
  uint64_t v88 = __Block_byref_object_dispose__3;
  id v89 = 0;
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __40__ENXPCConnection__xpcSetRegionConsent___block_invoke;
  void v81[3] = &unk_1E69ACB90;
  v83 = &v84;
  v81[4] = self;
  xpc_object_t original = v4;
  id v82 = original;
  id v68 = (void (**)(void))MEMORY[0x1D9439FF0](v81);
  uint64_t v5 = v85;
  id obj = v85[5];
  BOOL v6 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v5 + 5, obj);
  if (v6)
  {
    uint64_t v7 = [(ENDaemon *)self->_daemon configurationManager];
    id v67 = v7;
    if (!v7)
    {
      uint64_t v58 = ENErrorF();
      id v71 = v85[5];
      v85[5] = (id)v58;

      goto LABEL_62;
    }
    id v70 = [v7 configurationStore];
    BOOL v8 = v85;
    id v79 = v85[5];
    uint64_t v9 = [(ENXPCConnection *)self _regionConfigForXPCRequest:original error:&v79];
    objc_storeStrong(v8 + 5, v79);
    if (!v9)
    {
LABEL_61:

LABEL_62:
      goto LABEL_63;
    }
    if ((unint64_t)[v9 enVersion] <= 1)
    {
      uint64_t v59 = ENErrorF();
      id v10 = v85[5];
      v85[5] = (id)v59;
      goto LABEL_60;
    }
    id v10 = [v9 region];
    uint64_t v69 = [v70 serverConfigurationForRegion:v10];
    v73 = [v69 appBundleID];
    if (v73)
    {
      id v11 = [MEMORY[0x1E4F223C0] applicationProxyForIdentifier:v73 placeholder:0];
      id v12 = [v11 appState];
      if ([v12 isInstalled])
      {

        goto LABEL_8;
      }
      uint64_t v13 = [v11 appState];
      int v14 = [v13 isPlaceholder];

      if (v14)
      {
LABEL_8:
        uint64_t v15 = ENErrorF();
        id v16 = v85[5];
        v85[5] = (id)v15;

LABEL_59:
LABEL_60:

        goto LABEL_61;
      }
    }
    xpc_object_t v17 = [(ENDaemon *)self->_daemon activeEntity];
    id v18 = [v17 entity];
    uint64_t v19 = [v18 region];
    id v20 = [v19 regionCode];
    int v21 = [v10 regionCode];
    if ([v20 hasPrefix:v21])
    {
    }
    else
    {
      uint64_t v22 = [v9 userConsent];
      BOOL v23 = [v22 consent] == 4;

      if (v23)
      {
        uint64_t v24 = ENErrorF();
        id v11 = v85[5];
        v85[5] = (id)v24;
        goto LABEL_59;
      }
    }
    objc_opt_class();
    xpc_object_t v25 = v85;
    id v78 = v85[5];
    ENXPCDecodeSecureObjectIfPresent();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v25 + 5, v78);
    if (!v11) {
      goto LABEL_59;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v60 = v10;
      long long v63 = v11;
      LogPrintF_safe();
    }
    id v26 = objc_msgSend(v9, "userConsent", v60, v63);
    id v27 = [v26 consentVersion];
    uint64_t v28 = [v11 consentVersion];
    char v29 = [v27 isEqualToString:v28];

    if ((v29 & 1) == 0)
    {
      id v30 = [v69 legalConsentVersion];
      id v31 = [v11 consentVersion];
      char v32 = [v30 isEqualToString:v31];

      if ((v32 & 1) == 0)
      {
        id v35 = [v11 consentVersion];
        uint64_t v36 = ENErrorF();
        id v37 = v85[5];
        v85[5] = (id)v36;
LABEL_58:

        goto LABEL_59;
      }
    }
    int v33 = [v9 userConsent];
    uint64_t v34 = [v33 updatedConsent:v11];
    [v9 setUserConsent:v34];

    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      [v9 userConsent];
      v64 = id v61 = v10;
      LogPrintF_safe();
    }
    -[ENXPCConnection _sendOnboardingMetricForRegionConfiguration:](self, "_sendOnboardingMetricForRegionConfiguration:", v9, v61, v64);
    long long v38 = v85;
    id v77 = v85[5];
    int v39 = [v70 saveRegionConfiguration:v9 error:&v77];
    objc_storeStrong(v38 + 5, v77);
    if (!v39) {
      goto LABEL_59;
    }
    id v40 = [v9 userConsent];
    uint64_t v41 = [v40 consent];

    id v35 = [(ENDaemon *)self->_daemon _readPreferenceRegionPendingOnboarding];
    unint64_t v66 = v41 - 1;
    switch(v41)
    {
      case 1:
        goto LABEL_30;
      case 2:
        [(ENDaemon *)self->_daemon _disableAvailabilityAlertIfNeeded];
        [(ENDaemon *)self->_daemon prefsChanged];
        break;
      case 3:
LABEL_30:
        uint64_t v42 = [(ENDaemon *)self->_daemon activeEntity];
        id v43 = [v42 entity];
        uint64_t v44 = [v43 region];
        int v45 = [v10 isEqual:v44];

        if (v45)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            if (v66 > 2) {
              id v46 = "?";
            }
            else {
              id v46 = off_1E69ADD58[v66];
            }
            long long v62 = v10;
            long long v65 = v46;
            LogPrintF_safe();
          }
          [(ENDaemon *)self->_daemon _turnOffEN];
        }
        break;
    }
    int v47 = [v35 isEqual:v10];
    if (v41) {
      int v48 = v47;
    }
    else {
      int v48 = 0;
    }
    if (v48 == 1)
    {
      uint64_t v49 = [(ENDaemon *)self->_daemon userNotificationCenter];
      v90[0] = @"com.apple.ExposureNotification.onboarding";
      uint64_t v50 = [MEMORY[0x1E4F1C970] arrayWithObjects:v90 count:1];
      [v49 removeDeliveredNotificationsWithIdentifiers:v50];

      id v51 = [(ENDaemon *)self->_daemon onboardingManager];
      [v51 setShouldObserveDeviceUnlocks:0];

      id v52 = [(ENDaemon *)self->_daemon onboardingManager];
      [v52 setPendingBuddyOnboarding:0];
    }
    id v53 = [(ENDaemon *)self->_daemon userNotificationCenter];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __40__ENXPCConnection__xpcSetRegionConsent___block_invoke_2;
    v74[3] = &unk_1E69AD7E0;
    id v54 = v10;
    id v75 = v54;
    int v76 = self;
    [v53 getDeliveredNotificationsWithCompletionHandler:v74];

    int v55 = [v35 isEqual:v54];
    if (v66 < 2) {
      int v56 = v55;
    }
    else {
      int v56 = 0;
    }
    if (v56 == 1) {
      [(ENDaemon *)self->_daemon onboardingTriggerDeactivate];
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    if (reply)
    {
      [(ENXPCConnection *)self _xpcSendMessage:reply];
      [(ENDaemon *)self->_daemon prefsChanged];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    id v37 = v75;
    goto LABEL_58;
  }
LABEL_63:
  v68[2](v68);

  _Block_object_dispose(&v84, 8);
}

uint64_t __40__ENXPCConnection__xpcSetRegionConsent___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __40__ENXPCConnection__xpcSetRegionConsent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a2;
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v20 = *(void *)v22;
    int v4 = @"regionCode";
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v7 = [v6 request];
        BOOL v8 = [v7 content];
        uint64_t v9 = [v8 userInfo];
        id v10 = [v9 objectForKeyedSubscript:v4];

        id v11 = [v6 request];
        id v12 = [v11 content];
        uint64_t v13 = [v12 categoryIdentifier];
        if ([v13 isEqualToString:@"com.apple.ExposureNotification.UserNotification.analyticsConsent"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [*(id *)(a1 + 32) regionCode];
            v15 = int v14 = v4;
            int v16 = [v15 isEqualToString:v10];

            int v4 = v14;
            if (!v16) {
              goto LABEL_11;
            }
            id v11 = [*(id *)(*(void *)(a1 + 40) + 32) userNotificationCenter];
            id v12 = [v6 request];
            uint64_t v13 = [v12 identifier];
            xpc_object_t v25 = v13;
            xpc_object_t v17 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v25 count:1];
            [v11 removeDeliveredNotificationsWithIdentifiers:v17];

            int v4 = v14;
          }
        }

LABEL_11:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v3);
  }
}

- (void)_sendOnboardingMetricForRegionConfiguration:(id)a3
{
  id v35 = a3;
  uint64_t v4 = [(ENDaemon *)self->_daemon onboardingTrigger];
  uint64_t v5 = v35;
  if (v4)
  {
    BOOL v6 = [v35 userConsent];
    uint64_t v7 = [v6 consent];

    BOOL v33 = [(ENDaemon *)self->_daemon onboardingFirstTime];
    BOOL v8 = [v35 region];
    uint64_t v9 = [v8 countryCode];
    uint64_t v10 = [v9 utf8ValueSafe];

    id v11 = [(ENDaemon *)self->_daemon onboardingRegionTrigger];
    unsigned int v12 = [v8 isSubdivisionCodeEqualToRegion:v11];
    unsigned int v13 = [(ENDaemon *)self->_daemon _getLegalConsentPageCount];
    if ([(ENDaemon *)self->_daemon onboardingLegalConsentLastViewCount] < v13) {
      unsigned int v14 = v12;
    }
    else {
      unsigned int v14 = 0;
    }
    unsigned int v34 = v14;
    if ([v8 validSubdivisionCode])
    {
      uint64_t v15 = [v8 subdivisionCode];
    }
    else
    {
      uint64_t v15 = 0;
    }
    int v16 = [v15 componentsSeparatedByString:@"-"];
    if ([v16 count] == 2)
    {
      xpc_object_t v17 = [v16 objectAtIndexedSubscript:1];
      uint64_t v18 = [v17 utf8ValueSafe];
    }
    else
    {
      uint64_t v18 = 0;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      if (v4 > 4) {
        uint64_t v19 = "?";
      }
      else {
        uint64_t v19 = off_1E69ADD70[(int)v4 - 1];
      }
      if (v18) {
        uint64_t v20 = v18;
      }
      else {
        uint64_t v20 = v10;
      }
      long long v21 = "no";
      if (v34) {
        long long v22 = "yes";
      }
      else {
        long long v22 = "no";
      }
      if (v7 == 2) {
        long long v23 = "yes";
      }
      else {
        long long v23 = "no";
      }
      if (v33) {
        long long v21 = "yes";
      }
      id v31 = v23;
      char v32 = v21;
      uint64_t v29 = v20;
      id v30 = v22;
      uint64_t v28 = v19;
      LogPrintF_safe();
    }
    long long v24 = [(ENDaemon *)self->_daemon delegate];
    xpc_object_t v25 = [v8 countryCode];
    if ([v8 validSubdivisionCode])
    {
      [v8 subdivisionCode];
      v27 = id v26 = v11;
      [v24 sendOnBoardingMetricWithTrigger:v4 completed:v7 == 2 firstTime:v33 countryCode:v25 subdivisionCode:v27 legalConsent:v34];

      id v11 = v26;
    }
    else
    {
      [v24 sendOnBoardingMetricWithTrigger:v4 completed:v7 == 2 firstTime:v33 countryCode:v25 subdivisionCode:@"Unknown" legalConsent:v34];
    }

    [(ENDaemon *)self->_daemon setOnboardingTrigger:0];
    [(ENDaemon *)self->_daemon setOnboardingFirstTime:0];
    [(ENDaemon *)self->_daemon setOnboardingRegionTrigger:0];
    [(ENDaemon *)self->_daemon setOnboardingLegalConsentLastViewCount:[(ENDaemon *)self->_daemon _getLegalConsentPageCount]];

    uint64_t v5 = v35;
  }
}

- (void)_xpcTCCCheck:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  long long v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  xpc_object_t v25 = __Block_byref_object_copy__3;
  id v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __32__ENXPCConnection__xpcTCCCheck___block_invoke;
  v19[3] = &unk_1E69ACB90;
  long long v21 = &v22;
  v19[4] = self;
  id v5 = v4;
  id v20 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v19);
  if (MEMORY[0x1E4FA99B8])
  {
    uint64_t v7 = v23;
    id obj = v23[5];
    BOOL v8 = [(ENXPCConnection *)self _authorizationPreflightUnknownAndReturnError:&obj];
    objc_storeStrong(v7 + 5, obj);
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = "no";
      if (v8) {
        uint64_t v9 = "yes";
      }
      xpc_object_t v17 = v9;
      LogPrintF_safe();
    }
    xpc_connection_get_audit_token();
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF88], 1, MEMORY[0x1E4F1D528], MEMORY[0x1E4F1D538]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4FA99D0], (const void *)*MEMORY[0x1E4F1CFD8]);
    int v11 = TCCAccessCheckAuditToken();
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      unsigned int v12 = "granted";
      if (!v11) {
        unsigned int v12 = "not granted";
      }
      xpc_object_t v17 = v12;
      LogPrintF_safe();
    }
    if (v8) {
      -[ENXPCConnection _updateActiveEntityFromTCCResult:](self, "_updateActiveEntityFromTCCResult:", v11 != 0, v17);
    }
    CFRelease(Mutable);
    if (v11)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        [(ENXPCConnection *)self _xpcSendMessage:reply];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v16 = ENErrorF();
      xpc_object_t reply = v23[5];
      void v23[5] = (id)v16;
    }
  }
  else
  {
    uint64_t v14 = ENErrorF();
    id v15 = v23[5];
    void v23[5] = (id)v14;
  }
  v6[2](v6);

  _Block_object_dispose(&v22, 8);
}

uint64_t __32__ENXPCConnection__xpcTCCCheck___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_updateActiveEntityFromTCCResult:(BOOL)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F223C0];
  BOOL v6 = [(ENXPCClient *)self->_client signingIdentity];
  uint64_t v7 = [v5 applicationProxyForIdentifier:v6 placeholder:0];

  if (v7)
  {
    BOOL v8 = [(ENDaemon *)self->_daemon _getInfoDictFromAppProxy:v7];
    if (!v8)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      goto LABEL_34;
    }
    uint64_t v9 = [(ENDaemon *)self->_daemon regionForBundleInfo:v8];
    if (v9)
    {
      if (a3)
      {
        uint64_t v10 = [ENActiveEntity alloc];
        id v11 = objc_alloc(MEMORY[0x1E4F25728]);
        unsigned int v12 = [(ENXPCClient *)self->_client signingIdentity];
        unsigned int v13 = (void *)[v11 initWithBundleID:v12 region:v9];
        uint64_t v14 = [(ENActiveEntity *)v10 initWithEntity:v13 activeStatus:2];

        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          id v35 = v9;
          LogPrintF_safe();
        }
        xpc_object_t v25 = [(ENDaemon *)self->_daemon configurationManager];
        id v26 = [v25 configurationStore];
        id v27 = [v26 configurationForRegion:v9];

        if (v27)
        {
          uint64_t v28 = [v27 userConsent];
          [v28 setConsent:4];

          uint64_t v29 = [(ENDaemon *)self->_daemon configurationManager];
          id v30 = [v29 configurationStore];
          id v38 = 0;
          char v31 = [v30 saveRegionConfiguration:v27 error:&v38];
          id v32 = v38;

          if ((v31 & 1) == 0
            && gLogCategory__ENDaemon <= 90
            && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            id v36 = v32;
            LogPrintF_safe();
          }
        }
        -[ENDaemon _writePreferenceActiveEntity:](self->_daemon, "_writePreferenceActiveEntity:", v14, v36);

        goto LABEL_30;
      }
      long long v21 = [(ENDaemon *)self->_daemon activeEntity];
      uint64_t v22 = [v21 entity];
      long long v23 = [v22 region];
      int v24 = [v23 isEqual:v9];

      if (v24)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        [(ENDaemon *)self->_daemon _turnOffEN];
        goto LABEL_33;
      }
    }
    else if (a3)
    {
      id v15 = [ENActiveEntity alloc];
      id v16 = objc_alloc(MEMORY[0x1E4F25728]);
      xpc_object_t v17 = [(ENXPCClient *)self->_client signingIdentity];
      uint64_t v18 = (void *)[v16 initWithBundleID:v17 region:0];
      uint64_t v14 = [(ENActiveEntity *)v15 initWithEntity:v18 activeStatus:2];

      [(ENDaemon *)self->_daemon _writePreferenceActiveEntity:v14];
      daemon = self->_daemon;
      id v20 = [(ENXPCClient *)self->_client signingIdentity];
      [(ENDaemon *)daemon _setActiveRegionForApp:v20 infoDict:v8];

LABEL_30:
      TCCAccessSetForBundleId();
      [(ENDaemon *)self->_daemon _disableAvailabilityAlertIfNeeded];
      [(ENDaemon *)self->_daemon prefsChanged];
      if (v9 && [(ENXPCClient *)self->_client accessLevel] <= 2)
      {
        BOOL v33 = [(ENXPCClient *)self->_client signingIdentity];
        unsigned int v34 = self->_daemon;
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __52__ENXPCConnection__updateActiveEntityFromTCCResult___block_invoke;
        v37[3] = &unk_1E69AD808;
        v37[4] = v33;
        v37[5] = v9;
        v37[6] = self;
        [(ENDaemon *)v34 fetchServerConfigurationForRegion:v9 completion:v37];
      }
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    goto LABEL_33;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_35:
}

void __52__ENXPCConnection__updateActiveEntityFromTCCResult___block_invoke(void *a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  if (v11)
  {
    uint64_t v3 = [v11 appBundleID];
    if (!v3) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = [v6 domain];
  if (![v7 isEqualToString:@"ENConfigurationManagerErrorDomain"])
  {

    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v8 = [v6 code];

  if (v11) {
  if (v8 == 5)
  }
  {
LABEL_7:
    uint64_t v9 = [ENActiveEntity alloc];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F25728]) initWithBundleID:a1[4] region:a1[5]];
    uint64_t v3 = [(ENActiveEntity *)v9 initWithEntity:v10 activeStatus:1];

    [*(id *)(a1[6] + 32) _writePreferenceActiveEntity:v3];
    CFPrefs_RemoveValue();
    [*(id *)(a1[6] + 32) prefsChanged];
LABEL_9:
  }
LABEL_10:
}

- (void)_xpcExposureDetectionFileActivate:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  id v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  int v45 = __Block_byref_object_copy__3;
  id v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __53__ENXPCConnection__xpcExposureDetectionFileActivate___block_invoke;
  v39[3] = &unk_1E69ACB90;
  uint64_t v41 = &v42;
  v39[4] = self;
  id v5 = v4;
  id v40 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v39);
  uint64_t v7 = v43;
  id obj = v43[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    uint64_t v9 = v43;
    id v37 = v43[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v37];
    objc_storeStrong(v9 + 5, v37);
    if (v10)
    {
      if (![(ENDaemon *)self->_daemon prefEnabled])
      {
        uint64_t v29 = ENErrorF();
        id v20 = v43[5];
        v43[5] = (id)v29;
LABEL_20:

        goto LABEL_21;
      }
      id v11 = v43;
      id v36 = v43[5];
      BOOL v12 = [(ENXPCConnection *)self _appActiveStatusWithError:&v36];
      objc_storeStrong(v11 + 5, v36);
      if (v12)
      {
        unsigned int v13 = v43;
        id v35 = v43[5];
        BOOL v14 = [(ENXPCConnection *)self _xpcManagerActivateIfNecessaryWithRequest:v5 error:&v35];
        objc_storeStrong(v13 + 5, v35);
        if (v14)
        {
          if ([(ENXPCClient *)self->_client accessLevel] > 2
            || (id v15 = v43,
                id v34 = v43[5],
                BOOL v16 = [(ENXPCConnection *)self _rateLimitAndReturnError:&v34],
                objc_storeStrong(v15 + 5, v34),
                v16))
          {
            [(ENExposureDetectionDaemonSession *)self->_detectionSession invalidate];
            detectionSession = self->_detectionSession;
            self->_detectionSession = 0;

            id v18 = objc_alloc(MEMORY[0x1E4F25748]);
            uint64_t v19 = v43;
            id v33 = v43[5];
            id v20 = (id)[v18 initWithXPCObject:v5 error:&v33];
            objc_storeStrong(v19 + 5, v33);
            if (v20)
            {
              long long v21 = [(ENDaemon *)self->_daemon exposureDetectionManager];
              if (v21)
              {
                client = self->_client;
                long long v23 = [v20 configuration];
                int v24 = v43;
                id v32 = v43[5];
                id v25 = [v21 createDetectionSessionForClient:client configuration:v23 error:&v32];
                objc_storeStrong(v24 + 5, v32);

                if (v25)
                {
                  objc_msgSend(v25, "setSkipFileSigningVerification:", -[ENXPCConnection skipFileSigningVerification](self, "skipFileSigningVerification"));
                  [(ENDaemon *)self->_daemon setUsageExposureDetectFileActivate:[(ENDaemon *)self->_daemon usageExposureDetectFileActivate] + 1];
                  if (gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    [(ENXPCClient *)self->_client appAPIVersion];
                    LogPrintF_safe();
                  }
                  objc_storeStrong((id *)&self->_detectionSession, v25);
                  id v26 = v43;
                  id v31 = v43[5];
                  char v27 = [v25 prepareAndReturnError:&v31];
                  objc_storeStrong(v26 + 5, v31);
                  if (v27)
                  {
                    xpc_object_t reply = xpc_dictionary_create_reply(v5);
                    if (reply)
                    {
                      [(ENXPCConnection *)self _xpcSendMessage:reply];
                    }
                    else if (gLogCategory__ENDaemon <= 90 {
                           && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
                    }
                    {
                      LogPrintF_safe();
                    }
                  }
                  else if (gLogCategory__ENDaemon <= 90 {
                         && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
                  }
                  {
                    LogPrintF_safe();
                  }
                }
              }
              else
              {
                uint64_t v30 = ENErrorF();
                id v25 = v43[5];
                v43[5] = (id)v30;
              }
            }
            goto LABEL_20;
          }
        }
      }
    }
  }
LABEL_21:
  v6[2](v6);

  _Block_object_dispose(&v42, 8);
}

uint64_t __53__ENXPCConnection__xpcExposureDetectionFileActivate___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcExposureDetectionFileAdd:(id)a3
{
  id v4 = a3;
  uint64_t v55 = 0;
  int v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__3;
  uint64_t v59 = __Block_byref_object_dispose__3;
  id v60 = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke;
  v52[3] = &unk_1E69ACB90;
  id v54 = &v55;
  v52[4] = self;
  id v5 = v4;
  id v53 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v52);
  uint64_t v7 = v56;
  id v51 = v56[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&v51];
  objc_storeStrong(v7 + 5, v51);
  if (v8)
  {
    uint64_t v9 = [(ENDaemon *)self->_daemon exposureDetectionManager];
    if (v9)
    {
      BOOL v10 = self->_detectionSession;
      if (!v10
        || ([(ENDaemon *)self->_daemon setUsageExposureDetectFileAddKeys:[(ENDaemon *)self->_daemon usageExposureDetectFileAddKeys] + 1], int v11 = xpc_dictionary_dup_fd(v5, "fd"), v11 < 0))
      {
        uint64_t v26 = ENErrorF();
        id v27 = v56[5];
        v56[5] = (id)v26;
      }
      else
      {
        xpc_dictionary_get_string(v5, "sbTk");
        BOOL v12 = v56;
        id v50 = v56[5];
        uint64_t v13 = ENCloneFileToTemporaryDirectory();
        objc_storeStrong(v12 + 5, v50);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_2;
        v48[3] = &__block_descriptor_36_e5_v8__0l;
        int v49 = v11;
        BOOL v14 = (void (**)(void))MEMORY[0x1D9439FF0](v48);
        if ((v13 & 0x80000000) == 0)
        {
          uint64_t v42 = v10;
          id v47 = 0;
          CUXPCDecodeNSData();
          id v15 = [v9 createFileSession];
          BOOL v16 = v56;
          id obj = v56[5];
          char v17 = [v15 activateWithFD:v13 signatureData:0 error:&obj];
          objc_storeStrong(v16 + 5, obj);
          if (v17)
          {
            id v18 = [v15 signatures];
            uint64_t v19 = [v18 firstObject];

            uint64_t v41 = [v19 keyID];
            id v20 = [v19 keyVersion];
            long long v21 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v22 = [v21 isSensitiveLoggingAllowed];

            if (v22
              && gLogCategory_ENDaemon <= 30
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              id v40 = [v15 sha256Data];
              long long v23 = [v19 appleBundleID];
              uint64_t v36 = [v19 batchNumber];
              uint64_t v35 = [v19 batchCount];
              int v39 = [v19 keyID];
              id v38 = [v19 keyVersion];
              id v37 = [v15 metadata];
              CUPrintNSObjectOneLine();
              v34 = id v33 = v38;
              uint64_t v31 = v35;
              id v32 = v39;
              uint64_t v29 = v23;
              uint64_t v30 = v36;
              uint64_t v28 = v40;
              LogPrintF_safe();
            }
            int v24 = objc_msgSend(v19, "signatureData", v28, v29, v30, v31, v32, v33, v34);

            if (v24 && v20)
            {
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              v43[2] = __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_3;
              v43[3] = &unk_1E69AD878;
              v43[4] = self;
              id v44 = v5;
              int v45 = v15;
              [(ENXPCConnection *)self _fetchClientPublicKeyWithVerificationID:v41 keyVersion:v20 completion:v43];
            }
            else
            {
              [(ENXPCConnection *)self _xpcExposureDetectionFileAddNext:v5 fileSession:v15 publicKey:0];
            }
          }
          else
          {
            close(v13);
          }

          BOOL v10 = v42;
        }
        v14[2](v14);
      }
    }
    else
    {
      uint64_t v25 = ENErrorF();
      BOOL v10 = (ENExposureDetectionDaemonSession *)v56[5];
      v56[5] = (id)v25;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v55, 8);
}

uint64_t __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

uint64_t __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  BOOL v8 = *(NSObject **)(v7 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_4;
  block[3] = &unk_1E69AD850;
  id v14 = v5;
  uint64_t v15 = v7;
  id v16 = v6;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v17 = v9;
  uint64_t v18 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v8, block);
}

uint64_t __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_4(void *a1)
{
  if (!a1[4]
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v2 = a1[7];
  uint64_t v3 = a1[8];
  uint64_t v5 = a1[4];
  int v4 = (void *)a1[5];

  return [v4 _xpcExposureDetectionFileAddNext:v2 fileSession:v3 publicKey:v5];
}

- (void)_fetchClientPublicKeyWithVerificationID:(id)a3 keyVersion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__3;
  id v38 = __Block_byref_object_dispose__3;
  id v39 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke;
  v31[3] = &unk_1E69AD510;
  id v33 = &v34;
  id v11 = v10;
  id v32 = v11;
  id v12 = (void (**)(void))MEMORY[0x1D9439FF0](v31);
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v24 = v8;
    id v25 = v9;
    client = self->_client;
    LogPrintF_safe();
  }
  if (!objc_msgSend(v9, "length", client, v24, v25))
  {
    uint64_t v21 = ENErrorF();
    id v14 = (id)v35[5];
    v35[5] = v21;
    goto LABEL_15;
  }
  uint64_t v13 = [(ENXPCClient *)self->_client appRegion];
  if (!v13)
  {
    id v14 = v8;
    id v15 = [(ENDaemon *)self->_daemon prefRegionIdentifierOverride];
    if (!v15)
    {
      uint64_t v16 = +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:v14];
      id v17 = (void *)v16;
      id v18 = v16 ? (id)v16 : v14;
      id v15 = v18;

      if (!v15)
      {
        uint64_t v22 = ENErrorF();
        id v20 = (void *)v35[5];
        v35[5] = v22;
        goto LABEL_14;
      }
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v15];
  }
  daemon = self->_daemon;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke_2;
  v26[3] = &unk_1E69AD8C0;
  uint64_t v30 = &v34;
  id v29 = v11;
  v26[4] = self;
  id v14 = v13;
  id v27 = v14;
  id v28 = v9;
  [(ENDaemon *)daemon fetchServerConfigurationForRegion:v14 completion:v26];

  id v20 = v29;
LABEL_14:

LABEL_15:
  v12[2](v12);

  _Block_object_dispose(&v34, 8);
}

uint64_t __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke_3;
  v33[3] = &unk_1E69AD510;
  long long v31 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v31;
  long long v34 = v31;
  id v8 = (void (**)(void))MEMORY[0x1D9439FF0](v33);
  if (v6)
  {
    id v9 = [v6 domain];
    if ([v9 isEqualToString:@"ENConfigurationManagerErrorDomain"])
    {
      uint64_t v10 = [v6 code];

      if (v10 == 5)
      {
        id v11 = [*(id *)(*(void *)(a1 + 32) + 24) signingIdentity];
        uint64_t v12 = ENErrorF();
        uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        goto LABEL_24;
      }
    }
    else
    {
    }
LABEL_11:
    uint64_t v17 = ENNestedErrorF();
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v11 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
    goto LABEL_24;
  }
  if (!v5) {
    goto LABEL_11;
  }
  id v11 = [v5 publicKeyVersion];
  if (([v11 isEqualToString:*(void *)(a1 + 48)] & 1) == 0)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      id v15 = *(void **)(a1 + 48);
      [*(id *)(*(void *)(a1 + 32) + 24) signingIdentity];
      uint64_t v30 = v29 = v16;
      id v27 = v15;
      id v28 = v11;
      LogPrintF_safe();
    }
    uint64_t v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "configurationManager", v27, v28, v29, v30);
    [v19 fetchServerConfigurationsForRegion:*(void *)(a1 + 40) userInitiated:0 withCompletion:&__block_literal_global_2285];
  }
  id v20 = [v5 publicKey];
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    id v27 = v20;
    LogPrintF_safe();
  }
  uint64_t v21 = *MEMORY[0x1E4F3B6F8];
  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v22 + 40);
  long long v23 = +[ENSecKey keyFromBase64String:keyClass:error:](ENSecKey, "keyFromBase64String:keyClass:error:", v20, v21, &obj, v27);
  objc_storeStrong((id *)(v22 + 40), obj);
  if (v23)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (([*(id *)(a1 + 32) skipFileSigningVerification] & 1) == 0)
    {
      id v24 = [*(id *)(*(void *)(a1 + 32) + 32) configurationManager];
      id v25 = [v24 configurationStore];
      uint64_t v26 = [v25 configurationForRegion:*(void *)(a1 + 40)];

      if (v26)
      {
        [*(id *)(*(void *)(a1 + 32) + 32) _exposureNotificationRegionConfigurationChanged:v26];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }

LABEL_24:
  v8[2](v8);
}

uint64_t __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke_3(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_xpcExposureDetectionFileAddNext:(id)a3 fileSession:(id)a4 publicKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v24 = a5;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  long long v34 = __Block_byref_object_copy__3;
  uint64_t v35 = __Block_byref_object_dispose__3;
  id v36 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__ENXPCConnection__xpcExposureDetectionFileAddNext_fileSession_publicKey___block_invoke;
  v26[3] = &unk_1E69AD8E8;
  id v10 = v9;
  uint64_t v30 = &v31;
  id v27 = v10;
  id v28 = self;
  id v11 = v8;
  id v29 = v11;
  uint64_t v12 = (void (**)(void))MEMORY[0x1D9439FF0](v26);
  uint64_t v13 = self->_detectionSession;
  id v14 = v13;
  if (!v13)
  {
    uint64_t v23 = ENErrorF();
    xpc_object_t reply = (xpc_object_t)v32[5];
    v32[5] = v23;
LABEL_10:

    goto LABEL_11;
  }
  id v15 = [(ENExposureDetectionDaemonSession *)v13 statistics];
  [v15 fileKeyCount];

  uint64_t v16 = [(ENExposureDetectionDaemonSession *)v14 statistics];
  [(id)v16 matchedKeyCount];

  uint64_t v17 = (id *)(v32 + 5);
  id obj = (id)v32[5];
  LOBYTE(v16) = [(ENExposureDetectionDaemonSession *)v14 addMatchesFromFileSession:v10 publicKey:v24 endpoint:0 error:&obj];
  objc_storeStrong(v17, obj);
  if (v16)
  {
    uint64_t v18 = [(ENExposureDetectionDaemonSession *)v14 statistics];
    [v18 fileKeyCount];

    uint64_t v19 = [(ENExposureDetectionDaemonSession *)v14 statistics];
    [v19 matchedKeyCount];

    id v20 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v21 = [v20 isSensitiveLoggingAllowed];

    if (v21 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v11);
    if (reply)
    {
      [(ENXPCConnection *)self _xpcSendMessage:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_10;
  }
LABEL_11:

  v12[2](v12);
  _Block_object_dispose(&v31, 8);
}

uint64_t __74__ENXPCConnection__xpcExposureDetectionFileAddNext_fileSession_publicKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 56), v4))
      {
        id v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = *(void *)(a1 + 56);
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcExposureDetectionFileFinish:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__3;
  uint64_t v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __51__ENXPCConnection__xpcExposureDetectionFileFinish___block_invoke;
  v24[3] = &unk_1E69ACB90;
  uint64_t v26 = &v27;
  void v24[4] = self;
  id v5 = v4;
  id v25 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v24);
  uint64_t v7 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = self->_detectionSession;
    id v10 = v9;
    if (v9)
    {
      id v11 = (id *)(v28 + 5);
      id v22 = (id)v28[5];
      uint64_t v12 = [(ENExposureDetectionDaemonSession *)v9 finishAndReturnError:&v22];
      objc_storeStrong(v11, v22);
      if (v12)
      {
        uint64_t v13 = [v12 statistics];
        if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          uint64_t v14 = [v13 processedFileCount];
          uint64_t v20 = [v13 fileKeyCount];
          uint64_t v21 = [v13 invalidFileSignatureCount];
          uint64_t v19 = v14;
          LogPrintF_safe();
        }
        [(ENDaemon *)self->_daemon setUsageExposureDetectFileFinish:[(ENDaemon *)self->_daemon usageExposureDetectFileFinish] + 1];
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          uint64_t v16 = [v12 summary];
          uint64_t v17 = v16;
          if (v16)
          {
            [v16 encodeWithXPCObject:reply];
            [(ENXPCConnection *)self _xpcSendMessage:reply];
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v18 = ENErrorF();
      uint64_t v12 = (void *)v28[5];
      void v28[5] = v18;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v27, 8);
}

uint64_t __51__ENXPCConnection__xpcExposureDetectionFileFinish___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcExposureDetectionFileGetExposures:(id)a3
{
  id v4 = a3;
  uint64_t v58 = 0;
  uint64_t v59 = (id *)&v58;
  uint64_t v60 = 0x3032000000;
  id v61 = __Block_byref_object_copy__3;
  long long v62 = __Block_byref_object_dispose__3;
  id v63 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __57__ENXPCConnection__xpcExposureDetectionFileGetExposures___block_invoke;
  v55[3] = &unk_1E69ACB90;
  uint64_t v57 = &v58;
  v55[4] = self;
  id v5 = v4;
  id v56 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v55);
  uint64_t v7 = v59;
  id v54 = v59[5];
  id v38 = v6;
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&v54];
  objc_storeStrong(v7 + 5, v54);
  if (v8)
  {
    if ([(ENXPCClient *)self->_client accessLevel] <= 3
      && [(ENXPCClient *)self->_client appAPIVersion] >= 2)
    {
      uint64_t v33 = ENErrorF();
      id v10 = (ENExposureDetectionDaemonSession *)v59[5];
      v59[5] = (id)v33;
    }
    else
    {
      id v9 = self->_detectionSession;
      id v10 = v9;
      if (v9)
      {
        id v11 = [(ENExposureDetectionDaemonSession *)v9 exposureCalculationSession];
        if (v11)
        {
          uint64_t v12 = v59;
          id v53 = v59[5];
          id v13 = [(ENExposureDetectionDaemonSession *)v10 getAnalysisSessionAndReturnError:&v53];
          objc_storeStrong(v12 + 5, v53);
          if (v13)
          {
            id v40 = v13;
            uint64_t v41 = [v13 configuration];
            string = xpc_dictionary_get_string(v5, "auEx");
            if (string)
            {
              id v39 = [MEMORY[0x1E4F29020] stringWithUTF8String:string];
            }
            else
            {
              id v39 = &stru_1F2B29B10;
            }
            uint64_t v49 = 0;
            id v50 = &v49;
            uint64_t v51 = 0x2020000000;
            uint64_t v52 = 0;
            v47[0] = 0;
            v47[1] = v47;
            v47[2] = 0x2020000000;
            char v48 = 0;
            char v48 = [v41 minimumRiskScore];
            [v41 minimumRiskScoreFullRange];
            uint64_t v16 = v15;
            uint64_t v43 = 0;
            id v44 = &v43;
            uint64_t v45 = 0x2020000000;
            uint64_t v46 = 0;
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            xpc_object_t v18 = xpc_array_create(0, 0);
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __57__ENXPCConnection__xpcExposureDetectionFileGetExposures___block_invoke_2;
            v42[3] = &unk_1E69AD910;
            v42[6] = &v49;
            v42[7] = v47;
            *(CFAbsoluteTime *)&v42[9] = Current;
            v42[10] = v16;
            v42[8] = &v43;
            v42[4] = v13;
            v42[5] = v18;
            [v11 enumerateCachedExposureInfo:v42];
            if (v50[3])
            {
              id v37 = v11;
              id v19 = v5;
              uint64_t v20 = [(ENDaemon *)self->_daemon activeEntity];
              uint64_t v21 = [v20 entity];
              id v22 = [v21 bundleIdentifier];
              if ([v22 length])
              {
                uint64_t v23 = [(ENDaemon *)self->_daemon activeEntity];
                id v24 = [v23 entity];
                id v25 = [v24 bundleIdentifier];
              }
              else
              {
                id v25 = @"?";
              }

              [(ENDaemon *)self->_daemon postExposureSummaryAccessNotificationWithAppBundleIdentifier:v25 string:v39];
              id v5 = v19;
              id v11 = v37;
            }
            uint64_t v26 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v27 = [v26 isSensitiveLoggingAllowed];

            if (v27
              && gLogCategory_ENDaemon <= 30
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              uint64_t v35 = v44[3];
              id v36 = v41;
              uint64_t v34 = v50[3];
              LogPrintF_safe();
            }
            [(ENDaemon *)self->_daemon setUsageExposureDetectFileGetExposures:[(ENDaemon *)self->_daemon usageExposureDetectFileGetExposures]+ 1];
            xpc_object_t reply = xpc_dictionary_create_reply(v5);
            uint64_t v29 = reply;
            if (reply)
            {
              xpc_dictionary_set_value(reply, "exIA", v18);
              [(ENXPCConnection *)self _xpcSendMessage:v29];
              if (gLogCategory_ENDaemon <= 30
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              [(ENExposureDetectionDaemonSession *)v10 invalidate];
              detectionSession = self->_detectionSession;
              self->_detectionSession = 0;
            }
            else if (gLogCategory__ENDaemon <= 90 {
                   && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            }
            {
              LogPrintF_safe();
            }

            _Block_object_dispose(&v43, 8);
            _Block_object_dispose(v47, 8);
            _Block_object_dispose(&v49, 8);

            id v13 = v40;
          }
        }
        else
        {
          uint64_t v32 = ENErrorF();
          id v13 = v59[5];
          v59[5] = (id)v32;
        }

        id v6 = v38;
      }
      else
      {
        uint64_t v31 = ENErrorF();
        id v11 = v59[5];
        v59[5] = (id)v31;
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v58, 8);
}

uint64_t __57__ENXPCConnection__xpcExposureDetectionFileGetExposures___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __57__ENXPCConnection__xpcExposureDetectionFileGetExposures___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v3 count];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    id v25 = v4;
    uint64_t v26 = a1;
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v8 = 0;
      uint64_t v27 = v6;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
        __int16 v34 = 0;
        objc_msgSend(*(id *)(a1 + 32), "estimateRiskWithExposureInfo:referenceTime:transmissionRiskLevel:skip:", v9, (char *)&v34 + 1, &v34, *(double *)(a1 + 72), v24, v25);
        if (!(_BYTE)v34)
        {
          double v11 = v10;
          if (v10 > 255.0) {
            double v10 = 255.0;
          }
          if (v10 < 0.0) {
            double v10 = 0.0;
          }
          if (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= (int)v10
            && v11 >= *(double *)(a1 + 80))
          {
            unsigned int v28 = (int)v10;
            [v9 duration];
            unsigned int v13 = 60 * ((v12 + 59) / 0x3C);
            if (v13 >= 0x708) {
              unsigned int v13 = 1800;
            }
            [v9 setDuration:(double)v13];
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v29 = v9;
            uint64_t v15 = [v9 attenuationDurations];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v31 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  unsigned int v20 = 60
                      * (([*(id *)(*((void *)&v30 + 1) + 8 * i) unsignedIntValue] + 59)
                       / 0x3C);
                  if (v20 >= 0x708) {
                    uint64_t v21 = 1800;
                  }
                  else {
                    uint64_t v21 = v20;
                  }
                  id v22 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInt:v21];
                  [v14 addObject:v22];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
              }
              while (v17);
            }

            [v29 setAttenuationDurations:v14];
            [v29 setTotalRiskScore:v28];
            [v29 setTotalRiskScoreFullRange:v11];
            [v29 setTransmissionRiskLevel:HIBYTE(v34)];
            xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
            [v29 encodeWithXPCObject:v23];
            a1 = v26;
            xpc_array_set_value(*(xpc_object_t *)(v26 + 40), 0xFFFFFFFFFFFFFFFFLL, v23);

            uint64_t v7 = v24;
            id v4 = v25;
            uint64_t v6 = v27;
          }
          else
          {
            ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v6);
  }
}

- (void)_xpcExposureDetectionFileGetExposureWindows:(id)a3
{
  id v4 = a3;
  uint64_t v58 = 0;
  uint64_t v59 = (id *)&v58;
  uint64_t v60 = 0x3032000000;
  id v61 = __Block_byref_object_copy__3;
  long long v62 = __Block_byref_object_dispose__3;
  id v63 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __63__ENXPCConnection__xpcExposureDetectionFileGetExposureWindows___block_invoke;
  v55[3] = &unk_1E69ACB90;
  uint64_t v57 = &v58;
  v55[4] = self;
  id v5 = v4;
  id v56 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1D9439FF0](v55);
  uint64_t v7 = v59;
  id obj = v59[5];
  uint64_t v45 = v6;
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    id v9 = [(ENDaemon *)self->_daemon activeEntity];
    double v10 = [v9 entity];
    double v11 = [v10 region];

    double v12 = [(ENDaemon *)self->_daemon configurationManager];
    unsigned int v13 = [v12 configurationStore];

    uint64_t v46 = v13;
    id v14 = [v13 serverConfigurationForRegion:v11];
    char v15 = [v14 variantOfConcernEnabled];

    uint64_t v16 = self->_detectionSession;
    id v47 = v16;
    if (!v16)
    {
      uint64_t v36 = ENErrorF();
      id v18 = v59[5];
      v59[5] = (id)v36;
      goto LABEL_31;
    }
    uint64_t v17 = [(ENExposureDetectionDaemonSession *)v16 exposureCalculationSession];
    id v18 = v17;
    if (!v17
      || (unint64_t v19 = [v17 cachedExposureWindowCount],
          uint int64 = xpc_dictionary_get_uint64(v5, "expWndIdx"),
          uint64_t v21 = uint64,
          v19 < uint64))
    {
      uint64_t v37 = ENErrorF();
      id v38 = v59[5];
      v59[5] = (id)v37;

      goto LABEL_31;
    }
    id v44 = v11;
    if (v19 - uint64 >= 0x400) {
      uint64_t v22 = 1024;
    }
    else {
      uint64_t v22 = v19 - uint64;
    }
    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    xpc_object_t v23 = xpc_array_create(0, 0);
    uint64_t v24 = v23;
    if (v22)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __63__ENXPCConnection__xpcExposureDetectionFileGetExposureWindows___block_invoke_2;
      v48[3] = &unk_1E69AD938;
      v48[5] = v23;
      v48[6] = &v50;
      char v49 = v15;
      void v48[4] = self;
      objc_msgSend(v18, "enumerateCachedExposureWindows:inRange:withBatchSize:", v48, v21, v22, 1024);
    }
    uint64_t v25 = v51[3] + v21;
    if (v25 >= v19)
    {
      unsigned int v28 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v29 = [v28 isSensitiveLoggingAllowed];

      if (v29
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v42 = v25;
        unint64_t v43 = v19;
        uint64_t v40 = v22;
        uint64_t v41 = v51[3];
        uint64_t v39 = v21;
        LogPrintF_safe();
      }
      [(ENDaemon *)self->_daemon setUsageExposureDetectFileGetExposureWindows:[(ENDaemon *)self->_daemon usageExposureDetectFileGetExposureWindows]+ 1];
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      long long v31 = reply;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "expWndA", v24);
        xpc_dictionary_set_uint64(v31, "expWndIdx", 0);
        [(ENXPCConnection *)self _xpcSendMessage:v31];
        long long v33 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v34 = [v33 isSensitiveLoggingAllowed];

        if (v34
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        [(ENExposureDetectionDaemonSession *)v47 invalidate];
        detectionSession = self->_detectionSession;
        self->_detectionSession = 0;

        goto LABEL_30;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
      {
LABEL_30:

        _Block_object_dispose(&v50, 8);
        double v11 = v44;
        uint64_t v6 = v45;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v26 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v27 = [v26 isSensitiveLoggingAllowed];

      if (v27
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      xpc_object_t v30 = xpc_dictionary_create_reply(v5);
      long long v31 = v30;
      if (v30)
      {
        xpc_dictionary_set_value(v30, "expWndA", v24);
        xpc_dictionary_set_uint64(v31, "expWndIdx", v25);
        [(ENXPCConnection *)self _xpcSendMessage:v31];
        goto LABEL_30;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize()) {
        goto LABEL_30;
      }
    }
    LogPrintF_safe();
    goto LABEL_30;
  }
LABEL_32:
  v6[2](v6);

  _Block_object_dispose(&v58, 8);
}

uint64_t __63__ENXPCConnection__xpcExposureDetectionFileGetExposureWindows___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __63__ENXPCConnection__xpcExposureDetectionFileGetExposureWindows___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v3 count];
  if (([*(id *)(*(void *)(a1 + 32) + 32) prefSkipExposureWindowShuffling] & 1) == 0)
  {
    uint64_t v4 = [v3 enRandomlyShuffled];

    id v3 = (id)v4;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
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
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "infectiousness", (void)v12))
        {
          if (!*(unsigned char *)(a1 + 56)) {
            [v10 setVariantOfConcernType:0];
          }
          xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
          [v10 encodeWithXPCObject:v11];
          xpc_array_set_value(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v11);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_xpcExposureDetectionHistoryGetFiles:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  unint64_t v19 = (id *)&v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__3;
  uint64_t v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__ENXPCConnection__xpcExposureDetectionHistoryGetFiles___block_invoke;
  v15[3] = &unk_1E69ACB90;
  uint64_t v17 = &v18;
  v15[4] = self;
  id v5 = v4;
  id v16 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1D9439FF0](v15);
  uint64_t v7 = v19;
  id obj = v19[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    id v9 = v19;
    id v12 = v19[5];
    id v13 = 0;
    char v10 = CUXPCDecodeNSUUID();
    objc_storeStrong(v9 + 5, v12);
    if (v10) {
      id v11 = (id)ENErrorF();
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v18, 8);
}

uint64_t __56__ENXPCConnection__xpcExposureDetectionHistoryGetFiles___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __56__ENXPCConnection__xpcExposureDetectionHistoryGetFiles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t value = xpc_dictionary_create(0, 0, 0);
  [v3 encodeWithXPCObject:value];

  xpc_array_set_value(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, value);
}

- (void)_xpcExposureDetectionHistoryGetSessions:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  unsigned int v28 = __Block_byref_object_copy__3;
  int v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__ENXPCConnection__xpcExposureDetectionHistoryGetSessions___block_invoke;
  v22[3] = &unk_1E69ACB90;
  uint64_t v24 = &v25;
  v22[4] = self;
  id v5 = v4;
  id v23 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1D9439FF0](v22);
  uint64_t v7 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    daemon = self->_daemon;
    char v10 = (id *)(v26 + 5);
    id v20 = (id)v26[5];
    id v11 = [(ENDaemon *)daemon getExposureDatabaseAndReturnError:&v20];
    objc_storeStrong(v10, v20);
    if (v11)
    {
      [(ENDaemon *)self->_daemon _migrateLegacyHistoryIfNecessary];
      xpc_object_t v12 = xpc_array_create(0, 0);
      long long v14 = (id *)(v26 + 5);
      id v13 = (void *)v26[5];
      v18[4] = v12;
      id v19 = v13;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__ENXPCConnection__xpcExposureDetectionHistoryGetSessions___block_invoke_2;
      v18[3] = &unk_1E69AD960;
      char v15 = [v11 enumerateExposureDetectionHistorySessionsWithError:&v19 handler:v18];
      objc_storeStrong(v14, v19);
      if (v15)
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        uint64_t v17 = reply;
        if (reply)
        {
          xpc_dictionary_set_value(reply, "detHS", v12);
          [(ENXPCConnection *)self _xpcSendMessage:v17];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v25, 8);
}

uint64_t __59__ENXPCConnection__xpcExposureDetectionHistoryGetSessions___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __59__ENXPCConnection__xpcExposureDetectionHistoryGetSessions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t value = xpc_dictionary_create(0, 0, 0);
  [v3 encodeWithXPCObject:value];

  xpc_array_set_value(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, value);
}

- (void)_xpcDownload:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  uint64_t v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __32__ENXPCConnection__xpcDownload___block_invoke;
  v18[3] = &unk_1E69ACB90;
  id v20 = &v21;
  v18[4] = self;
  id v5 = v4;
  id v19 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1D9439FF0](v18);
  uint64_t v7 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    BOOL v9 = xpc_dictionary_get_BOOL(v5, "detX");
    char v10 = [(ENDaemon *)self->_daemon downloadManager];
    id v11 = v10;
    if (v10 && [v10 enabledEndpointCount])
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      id v13 = reply;
      if (reply)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __32__ENXPCConnection__xpcDownload___block_invoke_2;
        v15[3] = &unk_1E69AD9B0;
        BOOL v16 = v9;
        v15[4] = self;
        void v15[5] = reply;
        [v11 performDownloadsForced:1 completion:v15];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v14 = ENErrorF();
      id v13 = (void *)v22[5];
      void v22[5] = v14;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v21, 8);
}

uint64_t __32__ENXPCConnection__xpcDownload___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __32__ENXPCConnection__xpcDownload___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(id **)(a1 + 32);
  if (v2)
  {
    int v4 = [v3[4] exposureDetectionManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__ENXPCConnection__xpcDownload___block_invoke_3;
    v6[3] = &unk_1E69AD988;
    long long v7 = *(_OWORD *)(a1 + 32);
    [v4 performNativeExposureDetectionWithResultHandler:v6];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    [v3 _xpcSendMessage:v5];
  }
}

void __32__ENXPCConnection__xpcDownload___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    [*(id *)(a1 + 32) _xpcSendMessage:*(void *)(a1 + 40)];
  }
  else
  {
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      ENErrorF();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v7 = v6;
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      BOOL v8 = CUPrintNSError();
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:reply:", v7, *(void *)(a1 + 40), v8);
  }
}

- (void)_xpcGetInfo:(id)a3
{
  id v4 = a3;
  uint64_t v47 = 0;
  char v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__3;
  uint64_t v51 = __Block_byref_object_dispose__3;
  id v52 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __31__ENXPCConnection__xpcGetInfo___block_invoke;
  v44[3] = &unk_1E69ACB90;
  uint64_t v46 = &v47;
  v44[4] = self;
  id v5 = v4;
  id v45 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v44);
  long long v7 = (id *)(v48 + 5);
  id obj = (id)v48[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = [(ENDaemon *)self->_daemon delegate];
    string = xpc_dictionary_get_string(v5, "iStr");
    if (!string)
    {
      uint64_t v38 = ENErrorF();
      id v11 = (void *)v48[5];
      v48[5] = v38;
      goto LABEL_36;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v42 = string;
      LogPrintF_safe();
    }
    id v11 = [(ENDaemon *)self->_daemon activeEntity];
    if (!strcmp(string, "activeApp"))
    {
      switch([v11 activeStatus])
      {
        case 2u:
          uint64_t v24 = [v11 entity];
          id v16 = [v24 bundleIdentifier];

          if (!v16) {
            goto LABEL_35;
          }
          goto LABEL_30;
        default:
          goto LABEL_35;
      }
    }
    if (!strcmp(string, "activeRegion"))
    {
      xpc_object_t v12 = [(ENDaemon *)self->_daemon activeEntity];
      id v13 = [v12 entity];
      uint64_t v14 = [v13 region];

      if (!v14) {
        goto LABEL_35;
      }
      uint64_t v15 = [v14 regionCode];
    }
    else
    {
      if (!strcmp(string, "automaticRegionSwitch"))
      {
        int v17 = [(ENDaemon *)self->_daemon automaticRegionSwitchEnabled];
        goto LABEL_23;
      }
      if (!strcmp(string, "availabilityAlertEnabled"))
      {
        int v17 = [(ENDaemon *)self->_daemon availabilityAlertDisabled];
LABEL_25:
        uint64_t v18 = (void *)MEMORY[0x1E4F1CC40];
        id v19 = (void *)MEMORY[0x1E4F1CC30];
        goto LABEL_26;
      }
      if (!strcmp(string, "dataPresent"))
      {
        int v27 = [v9 storedAdvertisementCount];
        unsigned int v28 = (void *)MEMORY[0x1E4F1CC40];
        if (!v27)
        {
          int v29 = [v9 retrieveTEKHistoryIncludingActive:1 generateNewTEK:0];
          uint64_t v30 = [v29 count];

          if (!v30) {
            unsigned int v28 = (void *)MEMORY[0x1E4F1CC30];
          }
        }
        id v20 = v28;
        goto LABEL_29;
      }
      if (strcmp(string, "differentialPrivacyMetadata"))
      {
        if (strcmp(string, "profileInstalled"))
        {
          if (strcmp(string, "supported"))
          {
            if (strcmp(string, "weeklySummaryAlertEnabled"))
            {
LABEL_35:
              uint64_t v25 = ENErrorF();
              id v26 = (void *)v48[5];
              v48[5] = v25;

LABEL_36:
              goto LABEL_37;
            }
            int v17 = [(ENDaemon *)self->_daemon monthlySummaryDisabled];
            goto LABEL_25;
          }
          long long v31 = [v11 entity];
          long long v32 = [v31 region];

          if (!v32) {
            goto LABEL_35;
          }
          long long v33 = [(ENDaemon *)self->_daemon configurationManager];
          int v34 = [v33 configurationStore];
          long long v35 = [v34 serverConfigurationForRegion:v32];

          if (!v35)
          {
            uint64_t v40 = ENErrorF();
            uint64_t v41 = (void *)v48[5];
            v48[5] = v40;

            goto LABEL_36;
          }
          int v36 = [v35 enEnabled];
          uint64_t v37 = (void *)MEMORY[0x1E4F1CC30];
          if (v36) {
            uint64_t v37 = (void *)MEMORY[0x1E4F1CC40];
          }
          id v16 = v37;

LABEL_30:
          uint64_t v21 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          if (v21)
          {
            xpc_object_t reply = xpc_dictionary_create_reply(v5);
            uint64_t v23 = reply;
            if (reply)
            {
              xpc_dictionary_set_value(reply, "oObj", v21);
              [(ENXPCConnection *)self _xpcSendMessage:v23];
            }
            else if (gLogCategory__ENDaemon <= 90 {
                   && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            }
            {
              LogPrintF_safe();
            }
          }
          else
          {
            uint64_t v39 = ENErrorF();
            uint64_t v23 = (void *)v48[5];
            v48[5] = v39;
          }

          goto LABEL_36;
        }
        int v17 = [v9 isENLoggingProfileInstalled];
LABEL_23:
        uint64_t v18 = (void *)MEMORY[0x1E4F1CC30];
        id v19 = (void *)MEMORY[0x1E4F1CC40];
LABEL_26:
        if (v17) {
          uint64_t v18 = v19;
        }
        id v20 = v18;
LABEL_29:
        id v16 = v20;
        goto LABEL_30;
      }
      if (![(ENXPCClient *)self->_client entitledForDifferentialPrivacy]) {
        goto LABEL_35;
      }
      uint64_t v14 = [(ENDaemon *)self->_daemon differentialPrivacyManager];
      uint64_t v15 = [v14 metadata];
    }
    id v16 = (id)v15;

    if (!v16) {
      goto LABEL_35;
    }
    goto LABEL_30;
  }
LABEL_37:
  v6[2](v6);

  _Block_object_dispose(&v47, 8);
}

uint64_t __31__ENXPCConnection__xpcGetInfo___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetDataVaultSize:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v40 = 0;
  uint64_t v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  unint64_t v43 = __Block_byref_object_copy__3;
  id v44 = __Block_byref_object_dispose__3;
  id v45 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __40__ENXPCConnection__xpcGetDataVaultSize___block_invoke;
  v37[3] = &unk_1E69ACB90;
  uint64_t v39 = &v40;
  int v27 = self;
  v37[4] = self;
  xpc_object_t original = v4;
  id v38 = original;
  uint64_t v24 = (void (**)(void))MEMORY[0x1D9439FF0](v37);
  uint64_t v5 = v41;
  id obj = v41[5];
  LOBYTE(self) = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v5 + 5, obj);
  if (self)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
    id v6 = ENDataVaultURL();
    uint64_t v29 = *MEMORY[0x1E4F1C5F0];
    v47[0] = *MEMORY[0x1E4F1C5F0];
    uint64_t v7 = [MEMORY[0x1E4F1C970] arrayWithObjects:v47 count:1];
    BOOL v8 = [v26 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:0 errorHandler:0];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v28 = v8;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = [v28 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v28);
          }
          uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v30 = 0;
          id v31 = 0;
          int v15 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v31, v29, &v30, v22, v23);
          id v16 = v31;
          id v17 = v30;
          if (v15)
          {
            v9 += [v16 unsignedLongLongValue];
            ++v10;
          }
          else
          {
            uint64_t v18 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v19 = [v18 isSensitiveLoggingAllowed];

            if (v19
              && gLogCategory_ENDaemon <= 90
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              CUPrintNSError();
              v23 = uint64_t v22 = v14;
              LogPrintF_safe();
            }
          }
        }
        uint64_t v11 = [v28 countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v11);
    }

    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    uint64_t v21 = reply;
    if (reply)
    {
      xpc_dictionary_set_uint64(reply, "bytes", v9);
      [(ENXPCConnection *)v27 _xpcSendMessage:v21];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  v24[2](v24);

  _Block_object_dispose(&v40, 8);
}

uint64_t __40__ENXPCConnection__xpcGetDataVaultSize___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetActiveEntity:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v49 = 0;
  uint64_t v50 = (id *)&v49;
  uint64_t v51 = 0x3032000000;
  id v52 = __Block_byref_object_copy__3;
  uint64_t v53 = __Block_byref_object_dispose__3;
  id v54 = 0;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __39__ENXPCConnection__xpcSetActiveEntity___block_invoke;
  v46[3] = &unk_1E69ACB90;
  char v48 = &v49;
  unint64_t v43 = self;
  v46[4] = self;
  xpc_object_t original = v4;
  id v47 = original;
  uint64_t v40 = (void (**)(void))MEMORY[0x1D9439FF0](v46);
  uint64_t v5 = v50;
  id obj = v50[5];
  BOOL v6 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v5 + 5, obj);
  if (v6)
  {
    objc_opt_class();
    uint64_t v7 = v50 + 5;
    id v44 = v50[5];
    uint64_t v42 = ENXPCDecodeSecureObjectIfPresent();
    objc_storeStrong(v7, v44);
    if (v50[5])
    {
      uint64_t v35 = ENErrorF();
      id v36 = v50[5];
      v50[5] = (id)v35;
    }
    else
    {
      if (v42)
      {
        BOOL v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v9 = [v8 isSensitiveLoggingAllowed];

        if (v9
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          uint64_t v39 = v42;
          LogPrintF_safe();
        }
        uint64_t v10 = [(ENDaemon *)self->_daemon configurationManager];
        uint64_t v11 = [v10 configurationStore];
        uint64_t v12 = [v11 configurationForRegion:v42];

        id v13 = v42;
        uint64_t v14 = [(ENDaemon *)self->_daemon configurationManager];
        int v15 = [v14 configurationStore];
        id v16 = [v15 serverConfigurationForRegion:v13];

        if (!v16)
        {
          uint64_t v22 = 0;
          uint64_t v23 = 0;
LABEL_24:
          if (![(ENDaemon *)v43->_daemon prefEnabled])
          {
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            CFPrefs_SetValue();
          }

          uint64_t v29 = [ENActiveEntity alloc];
          id v30 = (void *)[objc_alloc(MEMORY[0x1E4F25728]) initWithBundleID:v22 region:v13];
          id v31 = [(ENActiveEntity *)v29 initWithEntity:v30 activeStatus:v23];

          if ([(ENDaemon *)v43->_daemon _writePreferenceActiveEntity:v31])
          {
            [(ENDaemon *)v43->_daemon _disableAvailabilityAlertIfNeeded];
            [(ENDaemon *)v43->_daemon prefsChanged];
            [(ENDaemon *)v43->_daemon xpcReportStatus];
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }
          xpc_object_t reply = xpc_dictionary_create_reply(original);
          if (reply)
          {
            [(ENXPCConnection *)v43 _xpcSendMessage:reply];
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }

          goto LABEL_42;
        }
        id v17 = (void *)MEMORY[0x1E4F223C0];
        uint64_t v18 = [v16 appBundleID];
        int v19 = [v17 applicationProxyForIdentifier:v18 placeholder:0];

        id v20 = [v16 appBundleID];
        if ([v20 length])
        {
          uint64_t v21 = [v16 appBundleID];
        }
        else
        {
          uint64_t v21 = &stru_1F2B29B10;
        }

        uint64_t v24 = [v19 appState];
        if ([v24 isInstalled])
        {
          BOOL v25 = [(__CFString *)v21 length] == 0;

          if (!v25)
          {
            if ([(ENDaemon *)v43->_daemon tccAccessForBundleID:v21] != 2)
            {
              uint64_t v22 = [v16 appBundleID];
              uint64_t v23 = 2;
LABEL_23:

              goto LABEL_24;
            }
LABEL_45:
            uint64_t v33 = ENErrorF();
            id v34 = v50[5];
            v50[5] = (id)v33;

            uint64_t v22 = 0;
LABEL_42:

            goto LABEL_43;
          }
        }
        else
        {
        }
        if ([v12 enVersion] == 2)
        {
          id v26 = [v12 userConsent];
          uint64_t v27 = [v26 consent];

          if ((unint64_t)(v27 - 1) < 2)
          {
            TCCAccessSetForBundleId();
            uint64_t v22 = 0;
            uint64_t v23 = 3;
            goto LABEL_23;
          }
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          id v28 = [v19 appState];
          [v28 isInstalled];
          [v12 enVersion];
          LogPrintF_safe();
        }
        goto LABEL_45;
      }
      CUXPCDecodeNSString();
      uint64_t v37 = ENErrorF();
      id v38 = v50[5];
      v50[5] = (id)v37;
    }
    uint64_t v22 = 0;
    id v13 = 0;
    goto LABEL_42;
  }
LABEL_43:
  v40[2](v40);

  _Block_object_dispose(&v49, 8);
}

uint64_t __39__ENXPCConnection__xpcSetActiveEntity___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetLastExposureNotification:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__3;
  id v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __51__ENXPCConnection__xpcGetLastExposureNotification___block_invoke;
  v24[3] = &unk_1E69ACB90;
  id v26 = &v27;
  void v24[4] = self;
  id v5 = v4;
  id v25 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v24);
  uint64_t v7 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    daemon = self->_daemon;
    uint64_t v10 = (id *)(v28 + 5);
    id v22 = (id)v28[5];
    uint64_t v11 = [(ENDaemon *)daemon getExposureDatabaseAndReturnError:&v22];
    objc_storeStrong(v10, v22);
    if (v11)
    {
      id v21 = 0;
      uint64_t v12 = objc_opt_class();
      id v13 = (id *)(v28 + 5);
      id v20 = (id)v28[5];
      char v14 = [v11 getValue:&v21 forKey:@"LastExposureNotification" ofClass:v12 error:&v20];
      id v15 = v21;
      objc_storeStrong(v13, v20);
      if (v14)
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          if (!v15
            || (id v17 = (id *)(v28 + 5), v19 = (id)v28[5],
                                       int v18 = ENXPCEncodeSecureObject(),
                                       objc_storeStrong(v17, v19),
                                       v18))
          {
            -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply, v19);
          }
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v27, 8);
}

uint64_t __51__ENXPCConnection__xpcGetLastExposureNotification___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetStatusForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__3;
  uint64_t v37 = __Block_byref_object_dispose__3;
  id v38 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52__ENXPCConnection__xpcGetStatusForBundleIdentifier___block_invoke;
  v30[3] = &unk_1E69ACB90;
  id v32 = &v33;
  v30[4] = self;
  id v5 = v4;
  id v31 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v30);
  uint64_t v7 = (id *)(v34 + 5);
  id obj = (id)v34[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (!v8) {
    goto LABEL_21;
  }
  int v9 = [(ENDaemon *)self->_daemon activeEntity];
  uint64_t v10 = [v9 entity];
  uint64_t v11 = [v10 bundleIdentifier];

  if (v11)
  {
    uint64_t v12 = [(ENDaemon *)self->_daemon activeEntity];
    id v13 = [v12 entity];
    char v14 = [v13 region];

    id v15 = [(ENDaemon *)self->_daemon configurationManager];
    id v16 = [v15 configurationStore];
    id v17 = [v16 serverConfigurationForRegion:v14];

    string = xpc_dictionary_get_string(v5, "aBid");
    if (!string)
    {
      LOBYTE(v23) = 0;
      uint64_t v24 = 0;
LABEL_14:
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      id v28 = reply;
      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "enbd", v23);
        xpc_dictionary_set_uint64(v28, "aBARi", v24);
        [(ENXPCConnection *)self _xpcSendMessage:v28];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }

      goto LABEL_21;
    }
    id v19 = [(ENDaemon *)self->_daemon activeEntity];
    id v20 = [v19 entity];
    id v21 = [v20 bundleIdentifier];
    id v22 = (const char *)[v21 utf8ValueSafe];

    if (v22)
    {
      BOOL v23 = strcmp(v22, string) == 0;
      if (!v17) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v23 = 0;
      if (!v17)
      {
LABEL_10:
        unsigned int v26 = 14400;
LABEL_11:
        if (v23) {
          uint64_t v24 = v26;
        }
        else {
          uint64_t v24 = 0;
        }
        goto LABEL_14;
      }
    }
    [v17 applicationBackgroundRuntimeInterval];
    unsigned int v26 = v25;
    if (v25) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_21:
  v6[2](v6);

  _Block_object_dispose(&v33, 8);
}

uint64_t __52__ENXPCConnection__xpcGetStatusForBundleIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcLegalConsentPageCount:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__ENXPCConnection__xpcLegalConsentPageCount___block_invoke;
  v12[3] = &unk_1E69ACB90;
  char v14 = &v15;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v12);
  objc_opt_class();
  uint64_t v7 = (id *)(v16 + 5);
  id obj = (id)v16[5];
  BOOL v8 = ENXPCDecodeSecureObject();
  objc_storeStrong(v7, obj);
  if (v8)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = v8;
      LogPrintF_safe();
    }
    [(ENDaemon *)self->_daemon _getLegalConsentPageCount];
    CFPrefs_SetInt64();
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      [(ENXPCConnection *)self _xpcSendMessage:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v15, 8);
}

uint64_t __45__ENXPCConnection__xpcLegalConsentPageCount___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcOnboardingDidStart:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  unint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__3;
  uint64_t v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __42__ENXPCConnection__xpcOnboardingDidStart___block_invoke;
  v39[3] = &unk_1E69ACB90;
  uint64_t v41 = &v42;
  v39[4] = self;
  id v5 = v4;
  id v40 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v39);
  uint64_t v7 = (id *)(v43 + 5);
  id obj = (id)v43[5];
  id v34 = v6;
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    string = xpc_dictionary_get_string(v5, "iStr");
    if (!string)
    {
      uint64_t v26 = ENErrorF();
      uint64_t v10 = (void *)v43[5];
      void v43[5] = v26;
      goto LABEL_33;
    }
    uint64_t v10 = [MEMORY[0x1E4F29020] stringWithUTF8String:string];
    if ([v10 isEqualToString:@"com.apple.Preferences"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"com.apple.PublicHealthRemoteUI"])
    {
      if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      CFPrefs_SetValue();
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"com.apple.ENDaemon"])
    {
      uint64_t v11 = 3;
    }
    else
    {
      if (([v10 isEqualToString:@"com.apple.HealthENLauncher"] & 1) == 0)
      {
        uint64_t v27 = ENErrorF();
        id v13 = (void *)v43[5];
        void v43[5] = v27;
        goto LABEL_32;
      }
      uint64_t v11 = 4;
    }
    objc_opt_class();
    uint64_t v12 = (id *)(v43 + 5);
    id v37 = (id)v43[5];
    id v13 = ENXPCDecodeSecureObject();
    objc_storeStrong(v12, v37);
    if (!v13)
    {
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    uint64_t v35 = v5;
    uint64_t v33 = v10;
    char v14 = [(ENDaemon *)self->_daemon configurationManager];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = [v14 configurationStore];
      uint64_t v17 = [v16 configurationForRegion:v13];

      if (v17)
      {
        int v18 = [v17 everStartedOnboarding];
        [v17 setEverStartedOnboarding:1];
        id v19 = [v15 configurationStore];
        id v20 = (id *)(v43 + 5);
        id v36 = (id)v43[5];
        char v21 = [v19 saveRegionConfiguration:v17 error:&v36];
        objc_storeStrong(v20, v36);

        if ((v21 & 1) == 0)
        {
          BOOL v6 = v34;
          goto LABEL_31;
        }
        id v22 = [v13 regionCode];
        BOOL v23 = "yes";
        if (v18) {
          BOOL v23 = "no";
        }
        if (v22) {
          uint64_t v24 = v23;
        }
        else {
          uint64_t v24 = "N/A";
        }

        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          id v31 = [v13 regionCode];
          id v32 = v24;
          id v30 = string;
          LogPrintF_safe();
        }
        -[ENDaemon setOnboardingTrigger:](self->_daemon, "setOnboardingTrigger:", v11, v30, v31, v32);
        [(ENDaemon *)self->_daemon setOnboardingFirstTime:v18 ^ 1u];
        [(ENDaemon *)self->_daemon setOnboardingRegionTrigger:v13];
        [(ENDaemon *)self->_daemon setOnboardingLegalConsentLastViewCount:[(ENDaemon *)self->_daemon _getLegalConsentPageCount]];
        BOOL v6 = v34;
        xpc_object_t reply = xpc_dictionary_create_reply(v35);
        if (reply)
        {
          [(ENXPCConnection *)self _xpcSendMessage:reply];
        }
        else if (gLogCategory__ENDaemon <= 90 {
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }
      }
      else
      {
        uint64_t v29 = ENErrorF();
        xpc_object_t reply = (xpc_object_t)v43[5];
        void v43[5] = v29;
      }
    }
    else
    {
      uint64_t v28 = ENErrorF();
      uint64_t v17 = (void *)v43[5];
      void v43[5] = v28;
    }
LABEL_31:

    uint64_t v10 = v33;
    id v5 = v35;
    goto LABEL_32;
  }
LABEL_34:
  v6[2](v6);

  _Block_object_dispose(&v42, 8);
}

uint64_t __42__ENXPCConnection__xpcOnboardingDidStart___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetActiveApp:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v36 = 0;
  id v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__3;
  id v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __36__ENXPCConnection__xpcSetActiveApp___block_invoke;
  v33[3] = &unk_1E69ACB90;
  uint64_t v35 = &v36;
  void v33[4] = self;
  xpc_object_t xdict = v4;
  id v34 = xdict;
  uint64_t v26 = (void (**)(void))MEMORY[0x1D9439FF0](v33);
  uint64_t v5 = v37;
  id obj = v37[5];
  BOOL v6 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v5 + 5, obj);
  if (v6)
  {
    string = xpc_dictionary_get_string(xdict, "aBid");
    if (string)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v8 = (id)TCCAccessCopyInformation();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v42 count:16];
      if (v9)
      {
        char v10 = 0;
        uint64_t v11 = *(void *)v29;
        uint64_t v12 = (void *)MEMORY[0x1E4FA99E0];
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            char v14 = (__CFBundle *)objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "objectForKey:", *v12, v25);
            if (v14)
            {
              uint64_t v15 = [(ENDaemon *)self->_daemon _getBundleIDFromBundle:v14];
              id v16 = v15;
              if (v15 && !strcmp(string, (const char *)[v15 utf8ValueSafe]))
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  double v25 = v16;
                  LogPrintF_safe();
                }
                CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v14);
                if (InfoDictionary)
                {
                  id v18 = [(ENDaemon *)self->_daemon regionForBundleInfo:InfoDictionary];
                  if (v18) {
                    [(ENDaemon *)self->_daemon fetchServerConfigurationForAppBundleIdentifier:v16 infoDictionary:InfoDictionary];
                  }

                  goto LABEL_25;
                }
                char v10 = 1;
              }
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v42 count:16];
          if (v9) {
            continue;
          }
          break;
        }

        if (v10)
        {
          id v16 = 0;
          id v18 = 0;
LABEL_25:
          id v19 = [ENActiveEntity alloc];
          id v20 = (void *)[objc_alloc(MEMORY[0x1E4F25728]) initWithBundleID:v16 region:v18];
          char v21 = [(ENActiveEntity *)v19 initWithEntity:v20 activeStatus:2];

          [(ENDaemon *)self->_daemon _writePreferenceActiveEntity:v21];
          [(ENDaemon *)self->_daemon xpcReportStatus];
          xpc_object_t reply = xpc_dictionary_create_reply(xdict);
          if (reply)
          {
            [(ENXPCConnection *)self _xpcSendMessage:reply];
          }
          else if (gLogCategory__ENDaemon <= 90 {
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF_safe();
          }

          goto LABEL_28;
        }
      }
      else
      {
      }
      uint64_t v23 = ENErrorF();
      id v18 = v37[5];
      void v37[5] = (id)v23;
LABEL_28:
    }
    else
    {
      uint64_t v24 = ENErrorF();
      id v8 = v37[5];
      void v37[5] = (id)v24;
    }
  }
  v26[2](v26);

  _Block_object_dispose(&v36, 8);
}

uint64_t __36__ENXPCConnection__xpcSetActiveApp___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        id v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetAutomaticRegionSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  id v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__ENXPCConnection__xpcSetAutomaticRegionSwitch___block_invoke;
  v11[3] = &unk_1E69ACB90;
  id v13 = &v14;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v11);
  uint64_t v7 = (id *)(v15 + 5);
  id obj = (id)v15[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    xpc_dictionary_get_BOOL(v5, "enbd");
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    CFPrefs_SetValue();
    [(ENDaemon *)self->_daemon prefsChanged];
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      [(ENXPCConnection *)self _xpcSendMessage:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v14, 8);
}

uint64_t __48__ENXPCConnection__xpcSetAutomaticRegionSwitch___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetAvailabilityAlertEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  id v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__ENXPCConnection__xpcSetAvailabilityAlertEnabled___block_invoke;
  v11[3] = &unk_1E69ACB90;
  id v13 = &v14;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v11);
  uint64_t v7 = (id *)(v15 + 5);
  id obj = (id)v15[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    xpc_dictionary_get_BOOL(v5, "enbd");
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    CFPrefs_SetValue();
    [(ENDaemon *)self->_daemon prefsChanged];
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      [(ENXPCConnection *)self _xpcSendMessage:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v14, 8);
}

uint64_t __51__ENXPCConnection__xpcSetAvailabilityAlertEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetActiveRegion:(id)a3
{
  id v4 = a3;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__3;
  id v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __39__ENXPCConnection__xpcSetActiveRegion___block_invoke;
  v33[3] = &unk_1E69ACB90;
  uint64_t v35 = &v36;
  void v33[4] = self;
  id v5 = v4;
  id v34 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v33);
  uint64_t v7 = (id *)(v37 + 5);
  id obj = (id)v37[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    objc_opt_class();
    uint64_t v9 = (id *)(v37 + 5);
    id v31 = (id)v37[5];
    char v10 = ENXPCDecodeSecureObjectIfPresent();
    objc_storeStrong(v9, v31);
    if (v10 || !v37[5])
    {
      uint64_t v11 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v12 = [v11 isSensitiveLoggingAllowed];

      if (v12
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        long long v30 = v10;
        LogPrintF_safe();
      }
      id v13 = [(ENDaemon *)self->_daemon configurationManager];
      uint64_t v14 = [v13 configurationStore];
      uint64_t v15 = [v14 configurationForRegion:v10];

      uint64_t v16 = [(ENDaemon *)self->_daemon configurationManager];
      uint64_t v17 = [v16 configurationStore];
      id v18 = [v17 serverConfigurationForRegion:v10];

      if (v18)
      {
        id v19 = (void *)MEMORY[0x1E4F223C0];
        id v20 = [v18 appBundleID];
        char v21 = [v19 applicationProxyForIdentifier:v20 placeholder:0];

        id v22 = [v21 appState];
        int v23 = [v22 isInstalled];

        if (v23)
        {
          uint64_t v24 = [v18 appBundleID];
          uint64_t v25 = 2;
        }
        else
        {
          uint64_t v24 = 0;
          if ([v15 enVersion] == 2) {
            uint64_t v25 = 3;
          }
          else {
            uint64_t v25 = 0;
          }
        }
      }
      else
      {
        uint64_t v24 = 0;
        uint64_t v25 = 0;
      }
      uint64_t v26 = [ENActiveEntity alloc];
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F25728]) initWithBundleID:v24 region:v10];
      long long v28 = [(ENActiveEntity *)v26 initWithEntity:v27 activeStatus:v25];

      if ([(ENDaemon *)self->_daemon _writePreferenceActiveEntity:v28])
      {
        [(ENDaemon *)self->_daemon prefsChanged];
        [(ENDaemon *)self->_daemon xpcReportStatus];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        [(ENXPCConnection *)self _xpcSendMessage:reply];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v36, 8);
}

uint64_t __39__ENXPCConnection__xpcSetActiveRegion___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcSetMonthlySummaryAlertEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3;
  char v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__ENXPCConnection__xpcSetMonthlySummaryAlertEnabled___block_invoke;
  v14[3] = &unk_1E69ACB90;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v14);
  uint64_t v7 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    BOOL v9 = xpc_dictionary_get_BOOL(v5, "enbd");
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      char v10 = "disabled";
      if (v9) {
        char v10 = "enabled";
      }
      int v12 = v10;
      LogPrintF_safe();
    }
    -[ENDaemon setMonthlySummaryDisabled:](self->_daemon, "setMonthlySummaryDisabled:", !v9, v12);
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      [(ENXPCConnection *)self _xpcSendMessage:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __53__ENXPCConnection__xpcSetMonthlySummaryAlertEnabled___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcGetRemotePresentationRequestIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__3;
  id v52 = __Block_byref_object_dispose__3;
  id v53 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __60__ENXPCConnection__xpcGetRemotePresentationRequestIfNeeded___block_invoke;
  v45[3] = &unk_1E69ACB90;
  id v47 = &v48;
  v45[4] = self;
  id v5 = v4;
  id v46 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v45);
  uint64_t v7 = (id *)(v49 + 5);
  id obj = (id)v49[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:2 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    BOOL v9 = (id *)(v49 + 5);
    id v43 = (id)v49[5];
    BOOL v10 = [(ENXPCConnection *)self _authorizedAndReturnError:&v43];
    objc_storeStrong(v9, v43);
    if (v10)
    {
      int64_t int64 = xpc_dictionary_get_int64(v5, "rprt");
      int64_t v12 = int64;
      switch(int64)
      {
        case 1:
          int v16 = 0;
          int v15 = 1;
LABEL_16:
          id v22 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v23 = [v22 isSensitiveLoggingAllowed];

          if (v23
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          if (v15)
          {
            if (!v16)
            {
LABEL_25:
              xpc_object_t reply = xpc_dictionary_create_reply(v5);
              if (reply)
              {
                uint64_t v26 = [MEMORY[0x1E4F257E8] presentationRequestWithType:v12];
                uint64_t v27 = [(ENXPCClient *)self->_client signingIdentity];
                [v26 setAppBundleIdentifier:v27];

                long long v28 = [(ENXPCClient *)self->_client appRegion];
                [v26 setAgencyRegion:v28];

                long long v29 = objc_alloc_init(ENRemoteUISession);
                long long v30 = [v26 receiptId];
                [(ENRemoteUISession *)v29 setSessionID:v30];

                id v31 = [(ENDaemon *)self->_daemon remoteUISessions];
                id v32 = [v26 receiptId];
                [v31 setObject:v29 forKeyedSubscript:v32];

                uint64_t v33 = (id *)(v49 + 5);
                id v40 = (id)v49[5];
                ENXPCEncodeSecureObject();
                objc_storeStrong(v33, v40);
                xpc_dictionary_set_BOOL(reply, "rpn", 1);
                [(ENXPCConnection *)self _xpcSendMessage:reply];
              }
              else
              {
                uint64_t v37 = ENErrorF();
                uint64_t v26 = (void *)v49[5];
                v49[5] = v37;
              }

              goto LABEL_30;
            }
            xpc_object_t reply = objc_alloc_init(MEMORY[0x1E4F4E270]);
            uint64_t v24 = objc_msgSend(reply, "applicationInfoForPID:", -[ENXPCClient pid](self->_client, "pid"));
            int Int64Ranged = CFDictionaryGetInt64Ranged();
            [reply invalidate];
            if (Int64Ranged == 8)
            {

              goto LABEL_25;
            }
            uint64_t v38 = ENErrorF();
            uint64_t v39 = (void *)v49[5];
            v49[5] = v38;
          }
          else
          {
            xpc_object_t v34 = xpc_dictionary_create_reply(v5);
            xpc_object_t reply = v34;
            if (v34)
            {
              xpc_dictionary_set_BOOL(v34, "rpn", 0);
              [(ENXPCConnection *)self _xpcSendMessage:reply];
            }
            else
            {
              uint64_t v35 = ENErrorF();
              uint64_t v36 = (void *)v49[5];
              v49[5] = v35;
            }
          }
LABEL_30:

          break;
        case 2:
          uint64_t v17 = (id *)(v49 + 5);
          id v41 = (id)v49[5];
          BOOL v18 = [(ENXPCConnection *)self _appActiveStatusWithError:&v41];
          objc_storeStrong(v17, v41);
          if (v18)
          {
            uint64_t v19 = [(ENDaemon *)self->_daemon temporaryExposureKeyManager];
            if ([(ENXPCClient *)self->_client entitledToSkipKeyReleasePrompt]) {
              int v15 = 0;
            }
            else {
              int v15 = [v19 requireKeyReleasePromptForClient:self->_client];
            }

            goto LABEL_15;
          }
          break;
        case 3:
          id v13 = (id *)(v49 + 5);
          id v42 = (id)v49[5];
          BOOL v14 = [(ENXPCConnection *)self _appActiveStatusWithError:&v42];
          objc_storeStrong(v13, v42);
          if (v14)
          {
            int v15 = 1;
LABEL_15:
            int v16 = 1;
            goto LABEL_16;
          }
          break;
        default:
          uint64_t v20 = ENErrorF();
          xpc_object_t reply = (xpc_object_t)v49[5];
          v49[5] = v20;
          goto LABEL_30;
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v48, 8);
}

uint64_t __60__ENXPCConnection__xpcGetRemotePresentationRequestIfNeeded___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcRemotePresentationReceivedDecision:(id)a3
{
  id v4 = a3;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__3;
  id v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__ENXPCConnection__xpcRemotePresentationReceivedDecision___block_invoke;
  v34[3] = &unk_1E69ACB90;
  uint64_t v36 = &v37;
  v34[4] = self;
  xpc_object_t original = v4;
  id v35 = original;
  uint64_t v5 = (void (**)(void))MEMORY[0x1D9439FF0](v34);
  BOOL v6 = (id *)(v38 + 5);
  id obj = (id)v38[5];
  long long v30 = v5;
  BOOL v7 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    objc_opt_class();
    BOOL v8 = (id *)(v38 + 5);
    id v32 = (id)v38[5];
    BOOL v9 = ENXPCDecodeSecureObject();
    objc_storeStrong(v8, v32);
    if (!v9)
    {
LABEL_21:

      goto LABEL_22;
    }
    BOOL v10 = [v9 receiptId];
    uint64_t v11 = [(ENDaemon *)self->_daemon remoteUISessions];
    int64_t v12 = [v11 objectForKeyedSubscript:v10];

    if (!v12)
    {
      uint64_t v27 = ENErrorF();
      BOOL v14 = (void *)v38[5];
      void v38[5] = v27;
      goto LABEL_20;
    }
    id v13 = [(ENDaemon *)self->_daemon remoteUISessions];
    [v13 setObject:0 forKeyedSubscript:v10];

    BOOL v14 = [v12 connection];
    if (!v14)
    {
      uint64_t v28 = ENErrorF();
      int v15 = (void *)v38[5];
      void v38[5] = v28;
      goto LABEL_19;
    }
    int v15 = [v12 originalRequest];
    if (!v15
      || ([v9 decisionInfo],
          int v16 = objc_claimAutoreleasedReturnValue(),
          [v16 objectForKeyedSubscript:@"decisionType"],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          uint64_t v18 = [v17 integerValue],
          v17,
          v16,
          v18 != [v9 requestType]))
    {
      uint64_t v29 = ENErrorF();
      int v23 = (void *)v38[5];
      void v38[5] = v29;
      goto LABEL_18;
    }
    uint64_t v19 = [v9 testMode];
    uint64_t v20 = [v9 decisionInfo];
    char v21 = [v20 objectForKeyedSubscript:@"decisionResult"];
    uint64_t v22 = [v21 BOOLValue];

    if (v22)
    {
      int v23 = 0;
    }
    else
    {
      int v23 = ENErrorF();
    }
    uint64_t v24 = [v9 requestType];
    if (v24 == 2)
    {
      [v14 _xpcGetDiagnosisKeysCompletion:v15 didPrompt:1 testMode:v19 error:v23];
    }
    else
    {
      if (v24 != 3)
      {
        [v9 requestType];
        uint64_t v26 = ENErrorF();
        xpc_object_t reply = (xpc_object_t)v38[5];
        void v38[5] = v26;
LABEL_17:

LABEL_18:
LABEL_19:

LABEL_20:
        uint64_t v5 = v30;
        goto LABEL_21;
      }
      [v14 _xpcPreAuthorizeDiagnosisKeysComplete:v15 userDecision:v22];
    }
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    if (reply)
    {
      [(ENXPCConnection *)self _xpcSendMessage:reply];
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_17;
  }
LABEL_22:
  v5[2](v5);

  _Block_object_dispose(&v37, 8);
}

uint64_t __58__ENXPCConnection__xpcRemotePresentationReceivedDecision___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)_xpcStartSelfReportWebSession:(id)a3
{
  id v4 = a3;
  uint64_t v33 = 0;
  xpc_object_t v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__3;
  uint64_t v37 = __Block_byref_object_dispose__3;
  id v38 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke;
  v30[3] = &unk_1E69ACB90;
  id v32 = &v33;
  v30[4] = self;
  id v5 = v4;
  id v31 = v5;
  BOOL v6 = (void (**)(void))MEMORY[0x1D9439FF0](v30);
  objc_opt_class();
  uint64_t v7 = v34;
  id obj = v34[5];
  ENXPCDecodeSecureObjectIfPresent();
  BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7 + 5, obj);
  if (!v34[5])
  {
    BOOL v9 = [(ENDaemon *)self->_daemon activeEntity];
    BOOL v10 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v11 = [v10 isSensitiveLoggingAllowed];

    if (v11 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      int64_t v12 = @" <>";
      if (v8) {
        int64_t v12 = v8;
      }
      uint64_t v22 = v12;
      int v23 = v9;
      LogPrintF_safe();
    }
    if ([(ENDaemon *)self->_daemon _isNKDActive])
    {
      id v13 = [(ENDaemon *)self->_daemon testResultManager];
      if (v13)
      {
        if (v8) {
          goto LABEL_13;
        }
        BOOL v14 = [(ENDaemon *)self->_daemon activeEntity];
        int v15 = [v14 entity];
        BOOL v8 = [v15 region];

        if (v8)
        {
LABEL_13:
          daemon = self->_daemon;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke_2;
          v24[3] = &unk_1E69ADA50;
          uint64_t v28 = &v33;
          void v24[4] = self;
          id v25 = v5;
          uint64_t v26 = v13;
          BOOL v8 = v8;
          uint64_t v27 = v8;
          [(ENDaemon *)daemon fetchServerConfigurationForRegion:v8 completion:v24];
        }
        else
        {
          uint64_t v20 = ENTestResultErrorF(9);
          id v21 = v34[5];
          void v34[5] = (id)v20;

          BOOL v8 = 0;
        }
      }
      else
      {
        uint64_t v18 = ENErrorF();
        id v19 = v34[5];
        void v34[5] = (id)v18;
      }
    }
    else
    {
      uint64_t v17 = ENErrorF();
      id v13 = v34[5];
      void v34[5] = (id)v17;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v33, 8);
}

uint64_t __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    BOOL v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

void __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    if (([v5 supportsFeatures:2] & 1) == 0)
    {
      uint64_t v14 = ENErrorF();
      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      int v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      goto LABEL_12;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
    if (reply)
    {
      BOOL v9 = *(void **)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke_3;
      v21[3] = &unk_1E69ADA28;
      uint64_t v11 = *(void *)(a1 + 32);
      v21[4] = reply;
      void v21[5] = v11;
      [v9 startSelfReportWebSession:v10 completionHandler:v21];
    }
    else
    {
      uint64_t v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v18 = [v17 isSensitiveLoggingAllowed];

      if (v18
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  else
  {
    xpc_object_t reply = ENNestedTestResultErrorF(v6, 9);
    int64_t v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v13 = [v12 isSensitiveLoggingAllowed];

    if (v13 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v20 = CUPrintNSError();
      LogPrintF_safe();

      objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", reply, *(void *)(a1 + 40), v20);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", reply, *(void *)(a1 + 40), v19);
    }
  }

LABEL_12:
}

void __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v11 && v7
    || (!v8 ? (ENErrorF(), id v9 = (id)objc_claimAutoreleasedReturnValue()) : (id v9 = v8),
        uint64_t v10 = v9,
        CUXPCEncodeNSError(),
        v10,
        v7))
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "nonce", (const char *)[v7 utf8ValueSafe]);
  }
  if (v11) {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "APIKey", (const char *)[v11 utf8ValueSafe]);
  }
  [*(id *)(a1 + 40) _xpcSendMessage:*(void *)(a1 + 32)];
}

- (void)_xpcStartTestVerificationSession:(id)a3
{
  id v4 = a3;
  uint64_t v56 = 0;
  uint64_t v57 = (id *)&v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy__3;
  uint64_t v60 = __Block_byref_object_dispose__3;
  id v61 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke;
  v53[3] = &unk_1E69ACB90;
  uint64_t v55 = &v56;
  v53[4] = self;
  id v5 = v4;
  id v54 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v53);
  if ([(ENXPCClient *)self->_client entitledForTestVerification]
    || (id v7 = v57,
        id obj = v57[5],
        BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj],
        objc_storeStrong(v7 + 5, obj),
        v8))
  {
    BOOL v9 = xpc_dictionary_get_BOOL(v5, "chaff");
    uint64_t v10 = v57;
    id v50 = v57[5];
    id v51 = 0;
    char v11 = CUXPCDecodeNSString();
    objc_storeStrong(v10 + 5, v50);
    if ((v11 & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    if (!v9)
    {
      uint64_t v34 = ENErrorF();
      int v13 = (__CFString *)v57[5];
      v57[5] = (id)v34;
      goto LABEL_25;
    }
    objc_opt_class();
    int64_t v12 = v57;
    id v49 = v57[5];
    ENXPCDecodeSecureObjectIfPresent();
    int v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12 + 5, v49);
    if (v57[5])
    {
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v14 = [(ENDaemon *)self->_daemon activeEntity];
    uint64_t v15 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v16 = [v15 isSensitiveLoggingAllowed];

    if (v16 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = "";
      if (v9) {
        uint64_t v17 = "Chaff, ";
      }
      int v18 = @" <>";
      if (v13) {
        int v18 = v13;
      }
      uint64_t v39 = v18;
      id v40 = v14;
      uint64_t v37 = v17;
      id v38 = v51;
      LogPrintF_safe();
    }
    if ([(ENDaemon *)self->_daemon getOverallStatus] == 2) {
      goto LABEL_29;
    }
    if ([v14 activeStatus] == 2)
    {
      uint64_t v19 = [v14 entity];
      id v20 = [v19 bundleIdentifier];

      uint64_t v21 = ENErrorF();
      id v22 = v57[5];
      v57[5] = (id)v21;

      int v23 = objc_msgSend(v57[5], "userInfo", v20);
      uint64_t v24 = (void *)[v23 mutableCopy];

      [v24 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F25708]];
      id v25 = objc_alloc(MEMORY[0x1E4F28C50]);
      uint64_t v26 = [v57[5] domain];
      uint64_t v27 = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, objc_msgSend(v57[5], "code"), v24);
      id v28 = v57[5];
      v57[5] = (id)v27;

LABEL_24:
      goto LABEL_25;
    }
    if (![(ENDaemon *)self->_daemon _isNKDActive])
    {
LABEL_29:
      uint64_t v35 = ENErrorF();
      id v20 = v57[5];
      v57[5] = (id)v35;
      goto LABEL_24;
    }
    id v20 = [(ENDaemon *)self->_daemon testResultManager];
    if (v20)
    {
      if (v13) {
        goto LABEL_22;
      }
      uint64_t v29 = [(ENDaemon *)self->_daemon activeEntity];
      long long v30 = [v29 entity];
      int v13 = [v30 region];

      if (v13)
      {
LABEL_22:
        id v31 = [(ENDaemon *)self->_daemon dispatchQueue];
        id v32 = [(ENDaemon *)self->_daemon differentialPrivacyManager];
        daemon = self->_daemon;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_2;
        v41[3] = &unk_1E69ADAC8;
        v41[4] = self;
        BOOL v48 = v9;
        id v42 = v5;
        id v43 = v20;
        int v13 = v13;
        uint64_t v44 = v13;
        id v45 = v51;
        id v46 = v31;
        id v47 = v32;
        [(ENDaemon *)daemon fetchServerConfigurationForRegion:v13 completion:v41];

LABEL_23:
        goto LABEL_24;
      }
      uint64_t v36 = ENTestResultErrorF(9);
      int v13 = 0;
    }
    else
    {
      uint64_t v36 = ENErrorF();
    }
    id v31 = v57[5];
    v57[5] = (id)v36;
    goto LABEL_23;
  }
LABEL_27:
  v6[2](v6);

  _Block_object_dispose(&v56, 8);
}

uint64_t __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      id v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    id v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

void __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
    uint64_t v5 = reply;
    if (reply)
    {
      id v6 = *(void **)(a1 + 48);
      if (*(unsigned char *)(a1 + 88))
      {
        uint64_t v7 = *(void *)(a1 + 56);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_3;
        v21[3] = &unk_1E69ADA78;
        uint64_t v8 = *(void *)(a1 + 32);
        v21[4] = reply;
        void v21[5] = v8;
        [v6 startChaffTestVerficationSessionForRegion:v7 completionHandler:v21];
      }
      else
      {
        uint64_t v11 = *(void *)(a1 + 64);
        uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 32) prefNetworkProxyEnabled];
        uint64_t v13 = *(void *)(a1 + 56);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_4;
        v20[3] = &unk_1E69ADAA0;
        uint64_t v14 = *(void *)(a1 + 80);
        void v20[4] = *(void *)(a1 + 72);
        void v20[5] = v5;
        uint64_t v15 = *(void *)(a1 + 32);
        void v20[6] = v14;
        void v20[7] = v15;
        [v6 startTestVerficationSessionWithCode:v11 proxyEnabled:v12 region:v13 completionHandler:v20];
      }
    }
    else
    {
      int v16 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v17 = [v16 isSensitiveLoggingAllowed];

      if (v17
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  else
  {
    ENNestedTestResultErrorF(a3, 9);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v10 = [v9 isSensitiveLoggingAllowed];

    if (v10 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      int v18 = CUPrintNSError();
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", v19, *(void *)(a1 + 40), v18);
  }
}

uint64_t __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    CUXPCEncodeNSError();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  int v3 = *(void **)(a1 + 40);

  return [v3 _xpcSendMessage:v4];
}

void __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_5;
  block[3] = &unk_1E69AD850;
  id v11 = v5;
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_5(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    int v10 = *(void **)(a1 + 64);
    if (v10)
    {
      id v11 = v10;
    }
    else
    {
      ENErrorF();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v5 = v11;
    CUXPCEncodeNSError();
LABEL_13:

    return [*(id *)(a1 + 56) _xpcSendMessage:*(void *)(a1 + 40)];
  }
  int v3 = *(void **)(a1 + 40);
  *(void *)uuid = 0;
  uint64_t v16 = 0;
  id v4 = v3;
  [v2 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v4, "sessID", uuid);

  if (*(void *)(a1 + 48))
  {
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 56) + 32) _getLatestExposureForDifferentialPrivacy];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 56) + 32) _getReportTypeForSession:v5];
    id v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v9 = [v8 isSensitiveLoggingAllowed];

    if (v9 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = v6;
      id v14 = v7;
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 48), "reportUserCodeVerified:reportType:", v6, objc_msgSend(v7, "unsignedIntValue", v13, v14));

    goto LABEL_13;
  }
  return [*(id *)(a1 + 56) _xpcSendMessage:*(void *)(a1 + 40)];
}

- (void)_xpcFetchTestVerificationMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  int v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__ENXPCConnection__xpcFetchTestVerificationMetadata___block_invoke;
  v16[3] = &unk_1E69ACB90;
  int v18 = &v19;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1D9439FF0](v16);
  uint64_t v7 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    int v9 = (id *)(v20 + 5);
    id v13 = (id)v20[5];
    id v14 = 0;
    char v10 = CUXPCDecodeNSUUID();
    objc_storeStrong(v9, v13);
    if (v10)
    {
      uint64_t v11 = ENErrorF();
      long long v12 = (void *)v20[5];
      void v20[5] = v11;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __53__ENXPCConnection__xpcFetchTestVerificationMetadata___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    uint64_t v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

- (void)_xpcFinishTestVerificationSession:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  int v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__ENXPCConnection__xpcFinishTestVerificationSession___block_invoke;
  v16[3] = &unk_1E69ACB90;
  int v18 = &v19;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1D9439FF0](v16);
  uint64_t v7 = v20;
  id obj = v20[5];
  BOOL v8 = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    int v9 = v20;
    id v13 = v20[5];
    id v14 = 0;
    char v10 = CUXPCDecodeNSUUID();
    objc_storeStrong(v9 + 5, v13);
    if (v10)
    {
      uint64_t v11 = ENErrorF();
      id v12 = v20[5];
      void v20[5] = (id)v11;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __53__ENXPCConnection__xpcFinishTestVerificationSession___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v3 = [v2 isSensitiveLoggingAllowed];

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v4 = v1[5];
    uint64_t v5 = *(void *)(*(void *)(v1[6] + 8) + 40);
    uint64_t v6 = (void *)v1[4];
    return [v6 _xpcSendReplyError:v5 request:v4];
  }
  return result;
}

void __53__ENXPCConnection__xpcFinishTestVerificationSession___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v21 = v5;
  if ((a2 & 1) == 0)
  {
    if (v5)
    {
      id v10 = v5;
    }
    else
    {
      ENErrorF();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v11 = v10;
    id v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v13 = [v12 isSensitiveLoggingAllowed];

    if (v13 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = CUPrintNSError();
      LogPrintF_safe();
    }
    CUXPCEncodeNSError();
    goto LABEL_26;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 32) differentialPrivacyManager];

    if (v6)
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 32) _getLatestExposureForDifferentialPrivacy];
      BOOL v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v9 = [v8 isSensitiveLoggingAllowed];

      if (v9 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        uint64_t v19 = v7;
        uint64_t v20 = *(void *)(a1 + 48);
        LogPrintF_safe();
      }
      id v14 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "differentialPrivacyManager", v19, v20);
      objc_msgSend(v14, "reportUserKeysUploaded:reportType:", v7, objc_msgSend(*(id *)(a1 + 48), "unsignedIntValue"));

      uint64_t v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:*MEMORY[0x1E4F256E8]];
      uint64_t v15 = [*(id *)(*(void *)(a1 + 40) + 32) _getDiagnosedVaccineStatusForDifferentialPrivacyWithUserVaccinationStatus:v11];
      if (v15)
      {
        uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 32) differentialPrivacyManager];
        [v16 reportUserDiagnosedVaccineStatus:v15];
      }
      else
      {
        id v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v18 = [v17 isSensitiveLoggingAllowed];

        if (v18
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }

LABEL_26:
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(void *)(a1 + 32), v19);
}

- (void)_xpcShowBuddy:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  int v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__ENXPCConnection__xpcShowBuddy___block_invoke;
  v16[3] = &unk_1E69ACB90;
  int v18 = &v19;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1D9439FF0](v16);
  if ([(ENXPCClient *)self->_client entitledToShowBuddy])
  {
    objc_opt_class();
    uint64_t v7 = v20;
    id obj = v20[5];
    BOOL v8 = ENXPCDecodeSecureObject();
    objc_storeStrong(v7 + 5, obj);
    if (v8)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      id v10 = reply;
      if (reply)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __33__ENXPCConnection__xpcShowBuddy___block_invoke_2;
        v14[3] = &unk_1E69ADA78;
        v14[4] = reply;
        void v14[5] = self;
        uint64_t v11 = (void *)MEMORY[0x1D9439FF0](v14);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __33__ENXPCConnection__xpcShowBuddy___block_invoke_3;
        v13[3] = &unk_1E69ADB18;
        v13[4] = self;
        void v13[5] = v10;
        id v12 = (void *)MEMORY[0x1D9439FF0](v13);
        [(ENDaemon *)self->_daemon presentBuddyForRegion:v8 errorHandler:v11 completionHandler:v12];
      }
      else if (gLogCategory__ENDaemon <= 90 {
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __33__ENXPCConnection__xpcShowBuddy___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory_ENDaemon <= 90)
    {
      if (gLogCategory_ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

void __33__ENXPCConnection__xpcShowBuddy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    CUXPCEncodeNSError();
  }
  [*(id *)(a1 + 40) _xpcSendMessage:*(void *)(a1 + 32)];
}

uint64_t __33__ENXPCConnection__xpcShowBuddy___block_invoke_3(uint64_t a1)
{
  return 1;
}

- (void)_xpcVerifyTextMessage:(id)a3
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v100 = 0;
  v101 = (id *)&v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__3;
  uint64_t v104 = __Block_byref_object_dispose__3;
  id v105 = 0;
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __41__ENXPCConnection__xpcVerifyTextMessage___block_invoke;
  v97[3] = &unk_1E69ACB90;
  v99 = &v100;
  id v78 = self;
  v97[4] = self;
  xpc_object_t original = v4;
  id v98 = original;
  uint64_t v5 = (void (**)(void))MEMORY[0x1D9439FF0](v97);
  int v96 = 0;
  uint64_t v6 = v101;
  id obj = v101[5];
  id v79 = v5;
  LOBYTE(self) = [(ENXPCConnection *)self _entitledForAccessLevel:4 error:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (self)
  {
    if ([(ENDaemon *)v78->_daemon overallStatus] != 1)
    {
      uint64_t v49 = ENErrorF();
      id v81 = v101[5];
      v101[5] = (id)v49;

      goto LABEL_78;
    }
    uint64_t v80 = [(ENDaemon *)v78->_daemon textMessageManager];
    if (!v80)
    {
      uint64_t v50 = ENErrorF();
      id v77 = v101[5];
      v101[5] = (id)v50;

      goto LABEL_77;
    }
    uint64_t v7 = [(ENDaemon *)v78->_daemon configurationManager];
    int v76 = [v7 configurationStore];

    if (!v76)
    {
      uint64_t v51 = ENErrorF();
      id v85 = v101[5];
      v101[5] = (id)v51;

      goto LABEL_76;
    }
    objc_opt_class();
    BOOL v8 = v101 + 5;
    id v94 = v101[5];
    uint64_t v84 = ENXPCDecodeSecureObject();
    objc_storeStrong(v8, v94);
    if (!v84)
    {
LABEL_75:

LABEL_76:
LABEL_77:

      goto LABEL_78;
    }
    unint64_t v66 = [v84 testVerificationCode];
    if (!v66) {
      goto LABEL_82;
    }
    uint64_t v9 = [v84 testVerificationRegion];
    if (!v9)
    {
      id v10 = [(ENDaemon *)v78->_daemon activeEntity];
      uint64_t v11 = [v10 entity];
      uint64_t v12 = [v11 region];

      uint64_t v9 = v12;
      if (!v12)
      {
LABEL_82:
        uint64_t v52 = ENErrorF();
        id v73 = v101[5];
        v101[5] = (id)v52;

        goto LABEL_74;
      }
    }
    uint64_t v72 = (void *)v9;
    uint64_t v69 = objc_msgSend(v76, "configurationForRegion:");
    if (!v69)
    {
      uint64_t v53 = ENErrorF();
      id v75 = v101[5];
      v101[5] = (id)v53;

      goto LABEL_73;
    }
    int v13 = [v76 serverConfigurationForRegion:v72];
    uint64_t v74 = v13;
    if (!v13 || ([v13 textMessageVerificationEnabled] & 1) == 0)
    {
      uint64_t v54 = ENErrorF();
      id v68 = v101[5];
      v101[5] = (id)v54;

      goto LABEL_72;
    }
    id v14 = [v76 agencyConfigurationForRegion:v72];
    id v67 = v14;
    if (!v14
      || ([v14 localizedConfiguration],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          [v15 testVerificationNotificationBody],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          BOOL v17 = v16 == 0,
          v16,
          v15,
          v17))
    {
      uint64_t v55 = ENErrorF();
      id v64 = v101[5];
      v101[5] = (id)v55;

      goto LABEL_71;
    }
    int v65 = [v74 preArmTestVerificationEnabled];
    int v18 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v19 = [v18 isSensitiveLoggingAllowed];

    if (v19 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      if (v65) {
        uint64_t v20 = "yes";
      }
      else {
        uint64_t v20 = "no";
      }
      uint64_t v60 = v84;
      long long v62 = v20;
      LogPrintF_safe();
    }
    CFStringGetTypeID();
    uint64_t v21 = CFPrefs_CopyTypedValue();
    id v63 = (void *)v21;
    if (v21)
    {
      v107[0] = v21;
      id v70 = [MEMORY[0x1E4F1C970] arrayWithObjects:v107 count:1];
    }
    else
    {
      id v22 = +[ENCoreTelephonyUtility sharedInstance];
      id v70 = [v22 currentPhoneNumbers];
    }
    if (!objc_msgSend(v70, "count", v60, v62))
    {
      uint64_t v56 = ENErrorF();
      id v83 = v101[5];
      v101[5] = (id)v56;

      goto LABEL_70;
    }
    int v23 = [v74 textMessagePublicKey];
    uint64_t v24 = *MEMORY[0x1E4F3B6F8];
    id v25 = v101 + 5;
    id v93 = v101[5];
    id v82 = +[ENSecKey keyFromBase64String:v23 keyClass:v24 error:&v93];
    objc_storeStrong(v25, v93);

    if (!v82)
    {
LABEL_69:

LABEL_70:
LABEL_71:

LABEL_72:
LABEL_73:

LABEL_74:
      goto LABEL_75;
    }
    uint64_t v26 = [v74 textMessagePublicKeyVersion];
    char v92 = 0;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v27 = v70;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v88 objects:v106 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v89;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v89 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void *)(*((void *)&v88 + 1) + 8 * i);
          id v32 = v101[5];
          v101[5] = 0;

          uint64_t v33 = [MEMORY[0x1E4F1C9C0] date];
          uint64_t v34 = v101 + 5;
          id v87 = v101[5];
          LOBYTE(v31) = [v80 verifyTextMessage:v84 phoneNumber:v31 verificationDate:v33 publicKey:v82 publicKeyVersion:v26 userReport:&v92 outError:&v87];
          objc_storeStrong(v34, v87);
          uint64_t v5 = v79;

          if (v31)
          {
            int v35 = 1;
            goto LABEL_37;
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v88 objects:v106 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
    int v35 = 0;
LABEL_37:

    if (v92) {
      uint64_t v36 = 3;
    }
    else {
      uint64_t v36 = 0;
    }
    if (!v92 || ([v74 supportsFeatures:2] & 1) != 0)
    {
      if (CFPrefs_GetInt64()) {
        BOOL v37 = IsAppleInternalBuild() != 0;
      }
      else {
        BOOL v37 = 0;
      }
      if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        id v38 = "no";
        if (v37) {
          id v38 = "yes";
        }
        id v61 = v38;
        LogPrintF_safe();
      }
      if ((v35 | v37))
      {
        if (v92) {
          int v39 = 0;
        }
        else {
          int v39 = v65;
        }
        if (v39 == 1
          && ([v69 diagnosisKeysPreAuthorization],
              id v40 = objc_claimAutoreleasedReturnValue(),
              BOOL v41 = [v40 userAuthorization] == 1,
              v40,
              v41))
        {
          id v42 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v43 = [v42 isSensitiveLoggingAllowed];

          if (v43
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          uint64_t v44 = objc_msgSend(v69, "diagnosisKeysPreAuthorization", v61);
          [v44 setVerificationCode:v66];

          id v45 = [v69 diagnosisKeysPreAuthorization];
          [v45 setReportType:v36];

          id v46 = v101 + 5;
          id v86 = v101[5];
          int v47 = [v76 saveRegionConfiguration:v69 error:&v86];
          objc_storeStrong(v46, v86);
          if (!v47) {
            goto LABEL_68;
          }
          [(ENDaemon *)v78->_daemon enqueuePreauthorizedTestVerificationUnlockAction];
        }
        else
        {
          -[ENDaemon postTestVerificationReceivedNotification:region:reportType:](v78->_daemon, "postTestVerificationReceivedNotification:region:reportType:", v84, v72, v36, v61);
        }
        xpc_object_t reply = xpc_dictionary_create_reply(original);
        if (reply)
        {
          [(ENXPCConnection *)v78 _xpcSendMessage:reply];
        }
        else
        {
          uint64_t v57 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v58 = [v57 isSensitiveLoggingAllowed];

          if (v58
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }
        goto LABEL_67;
      }
      if (v101[5]) {
        goto LABEL_68;
      }
    }
    uint64_t v59 = ENErrorF();
    xpc_object_t reply = v101[5];
    v101[5] = (id)v59;
LABEL_67:

LABEL_68:
    goto LABEL_69;
  }
LABEL_78:
  v5[2](v5);

  _Block_object_dispose(&v100, 8);
}

uint64_t __41__ENXPCConnection__xpcVerifyTextMessage___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        BOOL v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 _xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (ENXPCClient)client
{
  return self->_client;
}

- (ENDaemon)daemon
{
  return self->_daemon;
}

- (ENExposureDetectionDaemonSession)detectionSession
{
  return self->_detectionSession;
}

- (void)setDetectionSession:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setManager:(id)a3
{
}

- (BOOL)skipFileSigningVerification
{
  return self->_skipFileSigningVerification;
}

- (void)setSkipFileSigningVerification:(BOOL)a3
{
  self->_skipFileSigningVerification = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

@end