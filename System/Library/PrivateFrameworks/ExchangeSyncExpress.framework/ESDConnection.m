@interface ESDConnection
+ (id)sharedConnection;
+ (unint64_t)_nextStopMonitoringStatusToken;
- (BOOL)_hasConnectionForExchange;
- (BOOL)_performOofSettingsRequest:(id)a3 forAccountWithID:(id)a4 forUpdate:(BOOL)a5;
- (BOOL)_validateXPCReply:(id)a3;
- (BOOL)performServerContactsSearch:(id)a3 forAccountWithID:(id)a4;
- (BOOL)processFolderChange:(id)a3 forAccountWithID:(id)a4;
- (BOOL)processMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7;
- (BOOL)registerForInterrogationWithBlock:(id)a3;
- (BOOL)registered;
- (BOOL)requestPolicyUpdateForAccountID:(id)a3;
- (BOOL)resumeWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4;
- (BOOL)retrieveOofSettingsRequest:(id)a3 forAccountWithID:(id)a4;
- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5 forAccountID:(id)a6;
- (BOOL)stopWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4;
- (BOOL)suspendWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4;
- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclass:(int64_t)a4;
- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5;
- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclass:(int64_t)a5;
- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclasses:(int64_t)a5 isUserRequested:(BOOL)a6;
- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4;
- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5;
- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 requireChangedFolders:(BOOL)a5 isUserRequested:(BOOL)a6;
- (BOOL)updateOofSettingsRequest:(id)a3 forAccountWithID:(id)a4;
- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4;
- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5;
- (ESDConnection)init;
- (id)_connectionForExchange;
- (id)_createReplyToRequest:(id)a3 withProperties:(id)a4;
- (id)_init;
- (id)activeSyncDeviceIdentifier;
- (id)beginDownloadingAttachmentWithUUID:(id)a3 accountID:(id)a4 queue:(id)a5 progressBlock:(id)a6 completionBlock:(id)a7;
- (id)currentPolicyKeyForAccountID:(id)a3;
- (id)decodedErrorFromData:(id)a3;
- (id)performCalendarDirectorySearchWithAccountID:(id)a3 terms:(id)a4 recordTypes:(id)a5 resultLimit:(unint64_t)a6 resultsBlock:(id)a7 completionBlock:(id)a8;
- (id)requestCalendarAvailabilityWithAccountID:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8 completionBlock:(id)a9;
- (id)statusReports;
- (unint64_t)requestDaemonStopMonitoringAgents;
- (unint64_t)requestDaemonStopMonitoringAgentsSync;
- (void)_calendarAvailabilityRequestFinished:(id)a3;
- (void)_calendarAvailabilityRequestReturnedResults:(id)a3;
- (void)_calendarDirectorySearchFinished:(id)a3;
- (void)_calendarDirectorySearchReturnedResults:(id)a3;
- (void)_cancelDownloadsWithIDs:(id)a3 error:(id)a4;
- (void)_dispatchMessage:(id)a3;
- (void)_downloadFinished:(id)a3;
- (void)_downloadProgress:(id)a3;
- (void)_exchangeServerDiedWithReason:(id)a3;
- (void)_folderChangeFinished:(id)a3;
- (void)_foldersUpdated:(id)a3;
- (void)_getStatusReportsFromClient:(id)a3;
- (void)_initializeConnectionWithXPCEndpoint:(id)a3;
- (void)_initializeExchangeConnection;
- (void)_initializeXPCConnection:(id)a3;
- (void)_initializeXPCConnectionForExchange:(id)a3;
- (void)_logDataAccessStatus:(id)a3;
- (void)_oofSettingsRequestsFinished:(id)a3;
- (void)_policyKeyChanged:(id)a3;
- (void)_registerForAppResumedNotification;
- (void)_requestDaemonChangeAgentMonitoringStatus:(BOOL)a3 withToken:(unint64_t)a4 waitForReply:(BOOL)a5;
- (void)_resetCertWarningsForAccountId:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5;
- (void)_resetThrottleTimersForAccountId:(id)a3;
- (void)_sendSynchronousXPCMessageWithParameters:(id)a3 handlerBlock:(id)a4;
- (void)_serverContactsSearchQueryFinished:(id)a3;
- (void)_serverDiedWithReason:(id)a3;
- (void)_shareResponseFinished:(id)a3;
- (void)_tearDownInFlightObjects;
- (void)asyncProcessMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7;
- (void)cancelCalendarAvailabilityRequestWithID:(id)a3;
- (void)cancelCalendarDirectorySearchWithID:(id)a3;
- (void)cancelDownloadingAttachmentWithDownloadID:(id)a3 error:(id)a4;
- (void)cancelServerContactsSearch:(id)a3;
- (void)dealloc;
- (void)externalIdentificationForAccountID:(id)a3 resultsBlock:(id)a4;
- (void)fillOutCurrentEASTimeZoneInfo;
- (void)handleURL:(id)a3;
- (void)isOofSettingsSupportedForAccountWithID:(id)a3 completionBlock:(id)a4;
- (void)reallyRegisterForInterrogation;
- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6;
- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6;
- (void)requestDaemonShutdown;
- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3;
- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3;
- (void)resetTimersAndWarnings;
- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (void)setRegistered:(BOOL)a3;
@end

@implementation ESDConnection

- (void)_tearDownInFlightObjects
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x3032000000;
  v121 = __Block_byref_object_copy_;
  v122 = __Block_byref_object_dispose_;
  id v123 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke;
  block[3] = &unk_264BC9598;
  block[5] = &v118;
  block[4] = self;
  dispatch_sync(muckingWithInFlightCollections, block);
  v4 = (void *)v119[5];
  uint64_t v5 = *MEMORY[0x263F38F08];
  v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:0 userInfo:0];
  [v4 makeObjectsPerformSelector:sel_sendFinishedToConsumerWithError_ withObject:v6];

  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x3032000000;
  v114 = __Block_byref_object_copy_;
  v115 = __Block_byref_object_dispose_;
  id v116 = 0;
  v7 = self->_muckingWithInFlightCollections;
  v110[0] = MEMORY[0x263EF8330];
  v110[1] = 3221225472;
  v110[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_105;
  v110[3] = &unk_264BC9598;
  v110[5] = &v111;
  v110[4] = self;
  dispatch_sync(v7, v110);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v8 = (id)v112[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v106 objects:v129 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v107 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        v13 = [v12 consumer];
        v14 = [MEMORY[0x263F087E8] errorWithDomain:v5 code:0 userInfo:0];
        [v13 folderChange:v12 finishedWithStatus:0 error:v14];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v106 objects:v129 count:16];
    }
    while (v9);
  }

  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy_;
  v104 = __Block_byref_object_dispose_;
  id v105 = 0;
  v15 = self->_muckingWithInFlightCollections;
  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_106;
  v99[3] = &unk_264BC9598;
  v99[5] = &v100;
  v99[4] = self;
  dispatch_sync(v15, v99);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v16 = (id)v101[5];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v95 objects:v128 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v96;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v96 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v95 + 1) + 8 * j);
        v21 = [MEMORY[0x263F087E8] errorWithDomain:v5 code:0 userInfo:0];
        [v20 finishedWithError:v21];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v95 objects:v128 count:16];
    }
    while (v17);
  }

  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy_;
  v93 = __Block_byref_object_dispose_;
  id v94 = 0;
  v22 = self->_muckingWithInFlightCollections;
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_107;
  v88[3] = &unk_264BC9598;
  v88[5] = &v89;
  v88[4] = self;
  dispatch_sync(v22, v88);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v23 = (id)v90[5];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v84 objects:v127 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v85;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v85 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = *(void **)(*((void *)&v84 + 1) + 8 * k);
        v28 = [MEMORY[0x263F087E8] errorWithDomain:v5 code:-1 userInfo:0];
        [v27 finishedWithError:v28];
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v84 objects:v127 count:16];
    }
    while (v24);
  }

  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy_;
  v82 = __Block_byref_object_dispose_;
  id v83 = 0;
  v29 = self->_muckingWithInFlightCollections;
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_108;
  v77[3] = &unk_264BC9598;
  v77[4] = self;
  v77[5] = &v78;
  dispatch_sync(v29, v77);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v30 = (id)v79[5];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v73 objects:v126 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v74;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v74 != v32) {
          objc_enumerationMutation(v30);
        }
        v34 = *(void **)(*((void *)&v73 + 1) + 8 * m);
        v35 = [MEMORY[0x263F087E8] errorWithDomain:v5 code:-1 userInfo:0];
        [v34 finishedWithError:v35 exceededResultLimit:0];
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v73 objects:v126 count:16];
    }
    while (v31);
  }

  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy_;
  v71 = __Block_byref_object_dispose_;
  id v72 = 0;
  v36 = self->_muckingWithInFlightCollections;
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_109;
  v66[3] = &unk_264BC9598;
  v66[4] = self;
  v66[5] = &v67;
  dispatch_sync(v36, v66);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v37 = (id)v68[5];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v125 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v63;
    do
    {
      for (uint64_t n = 0; n != v38; ++n)
      {
        if (*(void *)v63 != v39) {
          objc_enumerationMutation(v37);
        }
        v41 = *(void **)(*((void *)&v62 + 1) + 8 * n);
        v42 = [MEMORY[0x263F087E8] errorWithDomain:v5 code:-1 userInfo:0];
        [v41 finishedWithError:v42];
      }
      uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v125 count:16];
    }
    while (v38);
  }

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  id v61 = 0;
  v43 = self->_muckingWithInFlightCollections;
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_110;
  v55[3] = &unk_264BC9598;
  v55[4] = self;
  v55[5] = &v56;
  dispatch_sync(v43, v55);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v44 = (id)v57[5];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v51 objects:v124 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v52;
    do
    {
      for (iuint64_t i = 0; ii != v45; ++ii)
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(v44);
        }
        v48 = *(void **)(*((void *)&v51 + 1) + 8 * ii);
        v49 = objc_msgSend(v48, "consumer", (void)v51);
        v50 = [MEMORY[0x263F087E8] errorWithDomain:v5 code:-1 userInfo:0];
        [v49 oofRequestInfo:v48 finishedWithResult:0 error:v50];
      }
      uint64_t v45 = [v44 countByEnumeratingWithState:&v51 objects:v124 count:16];
    }
    while (v45);
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v111, 8);

  _Block_object_dispose(&v118, 8);
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing ALL search queries", v8, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_105(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_232AD4000, v5, v6, "Failing all folder changes", v8, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_106(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing all attachment downloads", v8, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_107(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing all calendar availability lookups", v8, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_108(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing all calendar search requests", v8, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_109(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing all share requests", v8, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_110(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing all settings requests", v8, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
}

- (void)_serverDiedWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 == (id)MEMORY[0x263EF86A0])
  {
    os_log_type_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      id v8 = "Daemon died, cleaning up.";
      uint64_t v9 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v4 == (id)MEMORY[0x263EF86A8])
  {
    os_log_type_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      LOWORD(v11) = 0;
      id v8 = "LOOK AT ME!!!! dataaccessd couldn't be started.  We won't try again.  If you're seeing this, get ready for some pain";
      uint64_t v9 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl(&dword_232AD4000, v6, v7, v8, v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  [(ESDConnection *)self _tearDownInFlightObjects];
  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"DataAccessMonitoringConnectionFailed" object:0];

  [(ESDConnection *)self setRegistered:0];
}

- (void)_exchangeServerDiedWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 == (id)MEMORY[0x263EF86A0])
  {
    os_log_type_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      id v8 = "Exchange daemon died, cleaning up.";
      uint64_t v9 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v4 == (id)MEMORY[0x263EF86A8])
  {
    os_log_type_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      LOWORD(v11) = 0;
      id v8 = "LOOK AT ME!!!! exchangesyncd couldn't be started.  We won't try again.  If you're seeing this, get ready for some pain";
      uint64_t v9 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl(&dword_232AD4000, v6, v7, v8, v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  [(ESDConnection *)self _tearDownInFlightObjects];
  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"DataAccessMonitoringConnectionFailed" object:0];

  [(ESDConnection *)self setRegistered:0];
}

- (id)_connectionForExchange
{
  uint64_t v6 = 0;
  os_log_type_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  muckingWithConuint64_t n = self->_muckingWithConn;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__ESDConnection__connectionForExchange__block_invoke;
  v5[3] = &unk_264BC95C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(muckingWithConn, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__ESDConnection__connectionForExchange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  if (!v3)
  {
    [v2 _initializeExchangeConnection];
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v4, v3);
}

- (BOOL)_hasConnectionForExchange
{
  uint64_t v6 = 0;
  os_log_type_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  muckingWithConuint64_t n = self->_muckingWithConn;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ESDConnection__hasConnectionForExchange__block_invoke;
  v5[3] = &unk_264BC9598;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(muckingWithConn, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__ESDConnection__hasConnectionForExchange__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) != 0;
  return result;
}

- (void)_initializeExchangeConnection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v3 = (const char *)[@"com.apple.exchangesyncd" UTF8String];
  id v4 = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service(v3, v4, 0);
  connExchange = self->_connExchange;
  self->_connExchange = mach_service;

  if (self->_connExchange)
  {
    -[ESDConnection _initializeXPCConnectionForExchange:](self, "_initializeXPCConnectionForExchange:");
  }
  else
  {
    os_log_type_t v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v7, v8))
    {
      int v9 = 138412290;
      uint64_t v10 = @"com.apple.exchangesyncd";
      _os_log_impl(&dword_232AD4000, v7, v8, "Couldn't create a connection to [%@]", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_initializeConnectionWithXPCEndpoint:(id)a3
{
  id v4 = a3;
  muckingWithConuint64_t n = self->_muckingWithConn;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__ESDConnection__initializeConnectionWithXPCEndpoint___block_invoke;
  v7[3] = &unk_264BC9548;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(muckingWithConn, v7);
}

void __54__ESDConnection__initializeConnectionWithXPCEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  xpc_connection_t v2 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  if (v5[1])
  {
    objc_msgSend(v5, "_initializeXPCConnection:");
  }
  else
  {
    id v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_232AD4000, v6, v7, "Couldn't create a connection to endpoint: [%@]", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_initializeXPCConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ESDConnection__initializeXPCConnection___block_invoke;
  v5[3] = &unk_264BC95E8;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  xpc_connection_resume(v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__ESDConnection__initializeXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x237DAF260]();
  if (v3 == MEMORY[0x263EF8720])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _serverDiedWithReason:v5];
  }
  else
  {
    if (v3 != MEMORY[0x263EF8708]) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _dispatchMessage:v5];
  }

LABEL_6:
}

- (void)_initializeXPCConnectionForExchange:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__ESDConnection__initializeXPCConnectionForExchange___block_invoke;
  v5[3] = &unk_264BC95E8;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  xpc_connection_resume(v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__ESDConnection__initializeXPCConnectionForExchange___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x237DAF260]();
  if (v3 == MEMORY[0x263EF8720])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _exchangeServerDiedWithReason:v5];
  }
  else
  {
    if (v3 != MEMORY[0x263EF8708]) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _dispatchMessage:v5];
  }

LABEL_6:
}

- (id)_createReplyToRequest:(id)a3 withProperties:(id)a4
{
  id v5 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  os_log_type_t v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __54__ESDConnection__createReplyToRequest_withProperties___block_invoke;
  applier[3] = &unk_264BC9610;
  id v8 = reply;
  id v11 = v8;
  xpc_dictionary_apply(v7, applier);

  return v8;
}

uint64_t __54__ESDConnection__createReplyToRequest_withProperties___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

- (id)decodedErrorFromData:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v11 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:&v11];
    id v5 = v11;
    if (!v4)
    {
      id v6 = DALoggingwithCategory();
      os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_232AD4000, v6, v7, "Unable to read data to decode error: %@", buf, 0xCu);
      }
    }
    id v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    int v9 = [v4 decodeObjectOfClasses:v8 forKey:@"root"];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (void)_policyKeyChanged:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ESDConnection__policyKeyChanged___block_invoke;
  block[3] = &unk_264BC9570;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __35__ESDConnection__policyKeyChanged___block_invoke()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v1 = [v0 objectForKeyedSubscript:*MEMORY[0x263F391E8]];
  xpc_connection_t v2 = [v0 objectForKeyedSubscript:*MEMORY[0x263F391D8]];
  id v3 = [v0 objectForKeyedSubscript:*MEMORY[0x263F38FA0]];
  if (v3)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v5 = *MEMORY[0x263F38EE0];
    if (v2)
    {
      uint64_t v6 = *MEMORY[0x263F38EC8];
      uint64_t v13 = *MEMORY[0x263F38ED8];
      uint64_t v14 = v6;
      v15 = v1;
      id v16 = v2;
      os_log_type_t v7 = NSDictionary;
      id v8 = &v15;
      int v9 = &v13;
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v17 = *MEMORY[0x263F38ED8];
      uint64_t v18 = v1;
      os_log_type_t v7 = NSDictionary;
      id v8 = &v18;
      int v9 = &v17;
      uint64_t v10 = 1;
    }
    v12 = objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10, v13, v14, v15, v16, v17, v18);
    [v4 postNotificationName:v5 object:v3 userInfo:v12];
  }
  else
  {
    id v4 = DALoggingwithCategory();
    os_log_type_t v11 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v4, v11))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v0;
      _os_log_impl(&dword_232AD4000, v4, v11, "Malformed callback message from dataaccess daemon: bad account id (%@)", buf, 0xCu);
    }
  }
}

- (void)_foldersUpdated:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ESDConnection__foldersUpdated___block_invoke;
  block[3] = &unk_264BC9570;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __33__ESDConnection__foldersUpdated___block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v1 = [v0 objectForKeyedSubscript:*MEMORY[0x263F390E8]];
  uint64_t v2 = [v0 objectForKeyedSubscript:*MEMORY[0x263F38FA0]];
  id v3 = (void *)v2;
  if (!v1)
  {
    id v4 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (!os_log_type_enabled(v4, v7)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    v12 = v0;
    id v8 = "Malformed callback message from dataaccess daemon: no folders (%@)";
LABEL_8:
    _os_log_impl(&dword_232AD4000, v4, v7, v8, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v2)
  {
    id v4 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (!os_log_type_enabled(v4, v7)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    v12 = v0;
    id v8 = "Malformed callback message from dataaccess daemon: bad account id (%@)";
    goto LABEL_8;
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F38EF0];
  v9[0] = *MEMORY[0x263F38EF8];
  v9[1] = v5;
  v10[0] = v1;
  v10[1] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 postNotificationName:@"DataAccessMonitoredFolderUpdated" object:0 userInfo:v6];

LABEL_9:
}

- (void)_logDataAccessStatus:(id)a3
{
}

void __38__ESDConnection__logDataAccessStatus___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F38EC0] object:0];
}

- (void)_serverContactsSearchQueryFinished:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39270]];
  os_log_type_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F392C0]];
  id v8 = DALoggingwithCategory();
  uint64_t v9 = MEMORY[0x263F38F90];
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v8, v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_232AD4000, v8, v10, "doServerContactsSearchQueryFinishedWithStatus called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy_;
  uint64_t v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ESDConnection__serverContactsSearchQueryFinished___block_invoke;
  block[3] = &unk_264BC9658;
  p_long long buf = &buf;
  void block[4] = self;
  id v12 = v6;
  id v31 = v12;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39280]];
    if (v13)
    {
      id v29 = 0;
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v13 error:&v29];
      v15 = v29;
      if (!v14)
      {
        id v16 = DALoggingwithCategory();
        os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)v33 = 138412290;
          v34 = v15;
          _os_log_impl(&dword_232AD4000, v16, v17, "Unable to read data to decode search results: %@", v33, 0xCu);
        }
      }
      uint64_t v18 = (void *)MEMORY[0x263EFFA08];
      uint64_t v19 = objc_opt_class();
      v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      uint64_t v21 = [v14 decodeObjectOfClasses:v20 forKey:@"root"];
    }
    else
    {
      v15 = DALoggingwithCategory();
      os_log_type_t v23 = *(unsigned char *)(v9 + 6);
      if (os_log_type_enabled(v15, v23))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_232AD4000, v15, v23, "Could not deserialize search results from the xpc message", v33, 2u);
      }
      uint64_t v21 = 0;
    }

    uint64_t v24 = DALoggingwithCategory();
    if (os_log_type_enabled(v24, v10))
    {
      *(_DWORD *)v33 = 138412290;
      v34 = v21;
      _os_log_impl(&dword_232AD4000, v24, v10, "Search results: %@", v33, 0xCu);
    }

    [*(id *)(*((void *)&buf + 1) + 40) sendResultsToConsumer:v21];
    uint64_t v25 = *(void **)(*((void *)&buf + 1) + 40);
    v26 = (void *)MEMORY[0x263F087E8];
    int v27 = [v7 intValue];
    v28 = [v26 errorWithDomain:*MEMORY[0x263F38F08] code:v27 userInfo:0];
    [v25 sendFinishedToConsumerWithError:v28];
  }
  else
  {
    uint64_t v21 = DALoggingwithCategory();
    os_log_type_t v22 = *(unsigned char *)(v9 + 3);
    if (os_log_type_enabled(v21, v22))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_232AD4000, v21, v22, "received results for an unknown search query", v33, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __52__ESDConnection__serverContactsSearchQueryFinished___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing query %@ for key %@", (uint8_t *)&v10, 0x16u);
  }

  return [*(id *)(a1[4] + 56) removeObjectForKey:a1[5]];
}

- (void)_folderChangeFinished:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F392E8]];
  os_log_type_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F392C0]];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F390E0]];
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F390F0]];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F390C0]];
  int v10 = [(ESDConnection *)self decodedErrorFromData:v9];

  uint64_t v11 = DALoggingwithCategory();
  uint64_t v12 = MEMORY[0x263F38F90];
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v11, v13))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_232AD4000, v11, v13, "folderChange finished with status %@, error %@", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  int v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ESDConnection__folderChangeFinished___block_invoke;
  block[3] = &unk_264BC9658;
  uint64_t v24 = buf;
  void block[4] = self;
  id v15 = v5;
  id v23 = v15;
  dispatch_sync(muckingWithInFlightCollections, block);
  uint64_t v16 = *(void *)&buf[8];
  os_log_type_t v17 = *(void **)(*(void *)&buf[8] + 40);
  if (v17)
  {
    if (v7)
    {
      [v17 setFolderId:v7];
      uint64_t v16 = *(void *)&buf[8];
    }
    if (v8)
    {
      [*(id *)(v16 + 40) setDisplayName:v8];
      uint64_t v16 = *(void *)&buf[8];
    }
    uint64_t v18 = [*(id *)(v16 + 40) consumer];
    -[NSObject folderChange:finishedWithStatus:error:](v18, "folderChange:finishedWithStatus:error:", *(void *)(*(void *)&buf[8] + 40), (int)[v6 intValue], v10);
  }
  else
  {
    uint64_t v18 = DALoggingwithCategory();
    os_log_type_t v19 = *(unsigned char *)(v12 + 3);
    if (os_log_type_enabled(v18, v19))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_232AD4000, v18, v19, "received results for an unknown folderChange", v21, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __39__ESDConnection__folderChangeFinished___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing folder change %@ for key %@", (uint8_t *)&v10, 0x16u);
  }

  return [*(id *)(a1[4] + 64) removeObjectForKey:a1[5]];
}

- (void)_getStatusReportsFromClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__ESDConnection__getStatusReportsFromClient___block_invoke;
  v7[3] = &unk_264BC9548;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__ESDConnection__getStatusReportsFromClient___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v3)
  {
    id v4 = (*(void (**)(void))(v3 + 16))();
    if ([v4 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            int v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "dictionaryRepresentation", (void)v15);
            [v2 addObject:v10];

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
        }
        while (v7);
      }
    }
  }
  uint64_t v19 = *MEMORY[0x263F392C8];
  id v20 = v2;
  uint64_t v11 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, (void)v15);
  __int16 v12 = (void *)[*(id *)(a1 + 32) _createReplyToRequest:*(void *)(a1 + 40) withProperties:v11];
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 40));
  uint64_t v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [*(id *)(a1 + 32) _connectionForExchange];
  if (v14 == v13) {
    xpc_connection_send_message(v13, v12);
  }
}

- (void)_downloadProgress:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v14 = a3;
  long long v15 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v4 = [v15 objectForKeyedSubscript:*MEMORY[0x263F39000]];
  id v5 = [v15 objectForKeyedSubscript:*MEMORY[0x263F390B0]];
  uint64_t v6 = [v5 longLongValue];

  uint64_t v7 = [v15 objectForKeyedSubscript:*MEMORY[0x263F392F0]];
  uint64_t v8 = [v7 longLongValue];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
        uint64_t v18 = 0;
        uint64_t v19 = &v18;
        uint64_t v20 = 0x3032000000;
        uint64_t v21 = __Block_byref_object_copy_;
        uint64_t v22 = __Block_byref_object_dispose_;
        id v23 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __35__ESDConnection__downloadProgress___block_invoke;
        block[3] = &unk_264BC9658;
        void block[5] = v12;
        void block[6] = &v18;
        void block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        objc_msgSend((id)v19[5], "updateProgressDownloadedByteCount:totalByteCount:", v6, v8, v14);
        _Block_object_dispose(&v18, 8);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
}

uint64_t __35__ESDConnection__downloadProgress___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)_downloadFinished:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  uint64_t v13 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v4 = [v13 objectForKeyedSubscript:*MEMORY[0x263F39000]];
  id v5 = [v13 objectForKeyedSubscript:*MEMORY[0x263F390C0]];
  uint64_t v6 = [(ESDConnection *)self decodedErrorFromData:v5];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
        uint64_t v16 = 0;
        long long v17 = &v16;
        uint64_t v18 = 0x3032000000;
        uint64_t v19 = __Block_byref_object_copy_;
        uint64_t v20 = __Block_byref_object_dispose_;
        id v21 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __35__ESDConnection__downloadFinished___block_invoke;
        block[3] = &unk_264BC9658;
        void block[5] = v10;
        void block[6] = &v16;
        void block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        objc_msgSend((id)v17[5], "finishedWithError:", v6, v12);
        _Block_object_dispose(&v16, 8);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
}

uint64_t __35__ESDConnection__downloadFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 72);
  return [v6 removeObjectForKey:v5];
}

- (void)_shareResponseFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39298]];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F390C0]];
  uint64_t v8 = [(ESDConnection *)self decodedErrorFromData:v7];

  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ESDConnection__shareResponseFinished___block_invoke;
  block[3] = &unk_264BC9658;
  uint64_t v13 = &v14;
  void block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v15[5] finishedWithError:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __40__ESDConnection__shareResponseFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 96) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 96);
  return [v6 removeObjectForKey:v5];
}

- (void)_oofSettingsRequestsFinished:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39198]];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F392C0]];
  uint64_t v8 = DALoggingwithCategory();
  uint64_t v9 = MEMORY[0x263F38F90];
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v8, v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_232AD4000, v8, v10, "_oofSettingsRequestsFinished called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy_;
  id v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ESDConnection__oofSettingsRequestsFinished___block_invoke;
  block[3] = &unk_264BC9658;
  p_long long buf = &buf;
  void block[4] = self;
  id v12 = v6;
  id v32 = v12;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    if (v7)
    {
      if ([v7 intValue] == 2)
      {
        uint64_t v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39190]];
        uint64_t v14 = v13;
        if (v13 && [v13 BOOLValue])
        {
          long long v15 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
          [v15 oofRequestInfo:*(void *)(*((void *)&buf + 1) + 40) finishedWithResult:0 error:0];
        }
        else
        {
          long long v15 = [v5 objectForKeyedSubscript:*MEMORY[0x263F391B8]];
          if (v15)
          {
            long long v25 = (void *)[objc_alloc(MEMORY[0x263F38F70]) initWithDictionary:v15];
            long long v26 = DALoggingwithCategory();
            if (os_log_type_enabled(v26, v10))
            {
              *(_DWORD *)v34 = 138412290;
              v35 = v25;
              _os_log_impl(&dword_232AD4000, v26, v10, "Oof settings request results: %@", v34, 0xCu);
            }

            uint64_t v27 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
            [v27 oofRequestInfo:*(void *)(*((void *)&buf + 1) + 40) finishedWithResult:v25 error:0];
          }
          else
          {
            id v28 = DALoggingwithCategory();
            os_log_type_t v29 = *(unsigned char *)(v9 + 6);
            if (os_log_type_enabled(v28, v29))
            {
              *(_WORD *)v34 = 0;
              _os_log_impl(&dword_232AD4000, v28, v29, "Could not deserialize search results from the xpc message", v34, 2u);
            }

            long long v25 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
            uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
            uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:62 userInfo:0];
            [v25 oofRequestInfo:v30 finishedWithResult:0 error:v27];
          }
        }
      }
      else
      {
        uint64_t v14 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
        uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
        long long v22 = (void *)MEMORY[0x263F087E8];
        int v23 = [v7 intValue];
        long long v24 = [v22 errorWithDomain:*MEMORY[0x263F38F08] code:v23 userInfo:0];
        [v14 oofRequestInfo:v21 finishedWithResult:0 error:v24];
      }
    }
    else
    {
      long long v17 = DALoggingwithCategory();
      os_log_type_t v18 = *(unsigned char *)(v9 + 6);
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_232AD4000, v17, v18, "Status missing from the xpc message", v34, 2u);
      }

      uint64_t v14 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
      uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
      uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:62 userInfo:0];
      [v14 oofRequestInfo:v19 finishedWithResult:0 error:v20];
    }
  }
  else
  {
    uint64_t v14 = DALoggingwithCategory();
    os_log_type_t v16 = *(unsigned char *)(v9 + 3);
    if (os_log_type_enabled(v14, v16))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_232AD4000, v14, v16, "received results for an unknown oof settings request", v34, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __46__ESDConnection__oofSettingsRequestsFinished___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 104) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_232AD4000, v5, v6, "Removing from inflight dictionary: oof settings request %@ for key %@", (uint8_t *)&v10, 0x16u);
  }

  return [*(id *)(a1[4] + 104) removeObjectForKey:a1[5]];
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_124);
  }
  [(id)sharedConnection_gESDConnection reallyRegisterForInterrogation];
  uint64_t v2 = (void *)sharedConnection_gESDConnection;
  return v2;
}

uint64_t __33__ESDConnection_sharedConnection__block_invoke()
{
  sharedConnection_gESDConnectiouint64_t n = [[ESDConnection alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  return [(ESDConnection *)self watchFoldersWithKeys:a3 forAccountID:a4 persistent:0];
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5
{
  BOOL v5 = a5;
  v26[4] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  [(ESDConnection *)self _resetCertWarningsForAccountId:v8 andDataclasses:127 isUserRequested:0];
  uint64_t v10 = *MEMORY[0x263F39018];
  uint64_t v11 = *MEMORY[0x263F38FA0];
  v25[0] = *MEMORY[0x263F39170];
  v25[1] = v11;
  v26[0] = v10;
  v26[1] = v8;
  uint64_t v12 = *MEMORY[0x263F390E8];
  v26[2] = v9;
  uint64_t v13 = *MEMORY[0x263F391D0];
  v25[2] = v12;
  v25[3] = v13;
  uint64_t v14 = [NSNumber numberWithBool:v5];
  v26[3] = v14;
  long long v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

  os_log_type_t v16 = DALoggingwithCategory();
  os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v16, v17))
  {
    int v23 = 136315138;
    long long v24 = "-[ESDConnection watchFoldersWithKeys:forAccountID:persistent:]";
    _os_log_impl(&dword_232AD4000, v16, v17, "XPC call performed in: %s", (uint8_t *)&v23, 0xCu);
  }

  os_log_type_t v18 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v19 = [(ESDConnection *)self _connectionForExchange];
  xpc_object_t v20 = xpc_connection_send_message_with_reply_sync(v19, v18);

  BOOL v21 = [(ESDConnection *)self _validateXPCReply:v20];
  return v21;
}

- (BOOL)resumeWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(ESDConnection *)self _hasConnectionForExchange])
  {
    [(ESDConnection *)self _resetCertWarningsForAccountId:v7 andDataclasses:127 isUserRequested:0];
    uint64_t v8 = *MEMORY[0x263F39268];
    uint64_t v9 = *MEMORY[0x263F38FA0];
    v21[0] = *MEMORY[0x263F39170];
    v21[1] = v9;
    v22[0] = v8;
    v22[1] = v7;
    v21[2] = *MEMORY[0x263F390E8];
    v22[2] = v6;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    uint64_t v11 = DALoggingwithCategory();
    os_log_type_t v12 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
    if (os_log_type_enabled(v11, v12))
    {
      int v19 = 136315138;
      xpc_object_t v20 = "-[ESDConnection resumeWatchingFoldersWithKeys:forAccountID:]";
      _os_log_impl(&dword_232AD4000, v11, v12, "XPC call performed in: %s", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v14 = [(ESDConnection *)self _connectionForExchange];
    xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(v14, v13);

    BOOL v16 = [(ESDConnection *)self _validateXPCReply:v15];
  }
  else
  {
    uint64_t v10 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v10, v17))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_232AD4000, v10, v17, "[ESDConnection resumeWatchingFoldersWithKeys:forAccountID] called without a connection. Will not resume.", (uint8_t *)&v19, 2u);
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)suspendWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F392E0];
  uint64_t v7 = *MEMORY[0x263F38FA0];
  v21[0] = *MEMORY[0x263F39170];
  v21[1] = v7;
  v22[0] = v6;
  v22[1] = a4;
  v21[2] = *MEMORY[0x263F390E8];
  v22[2] = a3;
  uint64_t v8 = NSDictionary;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 dictionaryWithObjects:v22 forKeys:v21 count:3];

  os_log_type_t v12 = DALoggingwithCategory();
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v12, v13))
  {
    int v19 = 136315138;
    xpc_object_t v20 = "-[ESDConnection suspendWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_232AD4000, v12, v13, "XPC call performed in: %s", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v15 = [(ESDConnection *)self _connectionForExchange];
  xpc_object_t v16 = xpc_connection_send_message_with_reply_sync(v15, v14);

  BOOL v17 = [(ESDConnection *)self _validateXPCReply:v16];
  return v17;
}

- (BOOL)stopWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F392D8];
  uint64_t v7 = *MEMORY[0x263F38FA0];
  v21[0] = *MEMORY[0x263F39170];
  v21[1] = v7;
  v22[0] = v6;
  v22[1] = a4;
  v21[2] = *MEMORY[0x263F390E8];
  v22[2] = a3;
  uint64_t v8 = NSDictionary;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 dictionaryWithObjects:v22 forKeys:v21 count:3];

  os_log_type_t v12 = DALoggingwithCategory();
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v12, v13))
  {
    int v19 = 136315138;
    xpc_object_t v20 = "-[ESDConnection stopWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_232AD4000, v12, v13, "XPC call performed in: %s", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v15 = [(ESDConnection *)self _connectionForExchange];
  xpc_object_t v16 = xpc_connection_send_message_with_reply_sync(v15, v14);

  BOOL v17 = [(ESDConnection *)self _validateXPCReply:v16];
  return v17;
}

- (BOOL)_validateXPCReply:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = MEMORY[0x237DAF260]();
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v6 = _CFXPCCreateCFObjectFromXPCObject();
    id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F392C0]];
    int v10 = [v9 intValue];
    BOOL v8 = v10 == 2;
    if (v10 != 2)
    {
      uint64_t v11 = DALoggingwithCategory();
      os_log_type_t v12 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v11, v12))
      {
        int v14 = 138412290;
        uint64_t v15 = (uint64_t)v9;
        _os_log_impl(&dword_232AD4000, v11, v12, "XPC Reply Failure. Status Code: %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      int v14 = 138412290;
      uint64_t v15 = v5;
      _os_log_impl(&dword_232AD4000, v6, v7, "Unsupported XPC reply type. Reply Type: %@", (uint8_t *)&v14, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)requestPolicyUpdateForAccountID:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(ESDConnection *)self _resetCertWarningsForAccountId:v4 andDataclasses:127 isUserRequested:0];
  uint64_t v5 = *MEMORY[0x263F39240];
  uint64_t v6 = *MEMORY[0x263F38FA0];
  v11[0] = *MEMORY[0x263F39170];
  v11[1] = v6;
  v12[0] = v5;
  v12[1] = v4;
  os_log_type_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  BOOL v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  id v9 = [(ESDConnection *)self _connectionForExchange];
  xpc_connection_send_message(v9, v8);

  return 1;
}

- (id)currentPolicyKeyForAccountID:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = __Block_byref_object_copy_;
  long long v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v5 = *MEMORY[0x263F39110];
  uint64_t v6 = *MEMORY[0x263F38FA0];
  v24[0] = *MEMORY[0x263F39170];
  v24[1] = v6;
  v25[0] = v5;
  v25[1] = v4;
  os_log_type_t v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  BOOL v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  int v10 = [(ESDConnection *)self _connectionForExchange];
  uint64_t v11 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __46__ESDConnection_currentPolicyKeyForAccountID___block_invoke;
  handler[3] = &unk_264BC9680;
  BOOL v17 = &v18;
  os_log_type_t v12 = v9;
  uint64_t v16 = v12;
  xpc_connection_send_message_with_reply(v10, v8, v11, handler);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  id v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __46__ESDConnection_currentPolicyKeyForAccountID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (MEMORY[0x237DAF260]() == MEMORY[0x263EF8708])
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F391E8]];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    os_log_type_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    BOOL v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F392C0]];
    dispatch_semaphore_t v9 = v8;
    if (!v8 || [v8 intValue] != 2)
    {
      int v10 = DALoggingwithCategory();
      os_log_type_t v11 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v10, v11))
      {
        int v12 = 136315394;
        id v13 = "-[ESDConnection currentPolicyKeyForAccountID:]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_232AD4000, v10, v11, "Server error in %s communicating with daemon: %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (unint64_t)_nextStopMonitoringStatusToken
{
  os_unfair_lock_lock(&_nextStopMonitoringStatusToken_nextTokenLock);
  unint64_t v2 = ++_nextStopMonitoringStatusToken_nextToken;
  os_unfair_lock_unlock(&_nextStopMonitoringStatusToken_nextTokenLock);
  return v2;
}

- (void)_requestDaemonChangeAgentMonitoringStatus:(BOOL)a3 withToken:(unint64_t)a4 waitForReply:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v9 = DALoggingwithCategory();
  uint64_t v10 = MEMORY[0x263F38F90];
  os_log_type_t v11 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v9, v11))
  {
    int v12 = @"stop";
    if (v7) {
      int v12 = @"start";
    }
    int v24 = 138412290;
    long long v25 = (const char *)v12;
    _os_log_impl(&dword_232AD4000, v9, v11, "Requesting that DataAccess %@ monitoring agents.", (uint8_t *)&v24, 0xCu);
  }

  id v13 = (void *)MEMORY[0x263F392D0];
  if (v7) {
    id v13 = (void *)MEMORY[0x263F392B8];
  }
  __int16 v14 = [MEMORY[0x263EFF9A0] dictionaryWithObject:*v13 forKey:*MEMORY[0x263F39170]];
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
  [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F38FD8]];

  if (v5)
  {
    [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F38FD0]];
    uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    BOOL v17 = [(ESDConnection *)self _connectionForExchange];
    uint64_t v18 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v17, v16);

    if (MEMORY[0x237DAF260](v18) == MEMORY[0x263EF8708])
    {
      int v19 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      uint64_t v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F392C0]];
      BOOL v21 = v20;
      if (!v20 || [v20 intValue] != 2)
      {
        long long v22 = DALoggingwithCategory();
        os_log_type_t v23 = *(unsigned char *)(v10 + 3);
        if (os_log_type_enabled(v22, v23))
        {
          int v24 = 136315394;
          long long v25 = "-[ESDConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:]";
          __int16 v26 = 2112;
          uint64_t v27 = v21;
          _os_log_impl(&dword_232AD4000, v22, v23, "Server error in %s communicating with daemon: %@", (uint8_t *)&v24, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v18 = [(ESDConnection *)self _connectionForExchange];
    xpc_connection_send_message(v18, v16);
  }
}

- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3
{
}

- (unint64_t)requestDaemonStopMonitoringAgents
{
  unint64_t v3 = [(id)objc_opt_class() _nextStopMonitoringStatusToken];
  [(ESDConnection *)self _requestDaemonChangeAgentMonitoringStatus:0 withToken:v3 waitForReply:0];
  return v3;
}

- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3
{
}

- (unint64_t)requestDaemonStopMonitoringAgentsSync
{
  unint64_t v3 = [(id)objc_opt_class() _nextStopMonitoringStatusToken];
  [(ESDConnection *)self _requestDaemonChangeAgentMonitoringStatus:0 withToken:v3 waitForReply:1];
  return v3;
}

- (void)requestDaemonShutdown
{
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 requireChangedFolders:(BOOL)a5 isUserRequested:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  os_log_type_t v11 = DALoggingwithCategory();
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)long long buf = 138413058;
    id v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    __int16 v28 = 1024;
    BOOL v29 = v7;
    __int16 v30 = 1024;
    BOOL v31 = v6;
    _os_log_impl(&dword_232AD4000, v11, v12, "updateFolderListForAccountID %@, dataclasses %lx, requireChangedFolders %d, isUserRequested %d", buf, 0x22u);
  }

  [(ESDConnection *)self _resetCertWarningsForAccountId:v10 andDataclasses:a4 isUserRequested:v6];
  [(ESDConnection *)self _resetThrottleTimersForAccountId:v10];
  uint64_t v13 = *MEMORY[0x263F39238];
  uint64_t v14 = *MEMORY[0x263F38FA0];
  v22[0] = *MEMORY[0x263F39170];
  v23[0] = v13;
  v23[1] = v10;
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", a4, v22[0], v14, *MEMORY[0x263F390A8]);
  v23[2] = v15;
  v22[3] = *MEMORY[0x263F39248];
  uint64_t v16 = [NSNumber numberWithBool:v7];
  v23[3] = v16;
  void v22[4] = *MEMORY[0x263F39148];
  BOOL v17 = [NSNumber numberWithBool:v6];
  v23[4] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

  int v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v20 = [(ESDConnection *)self _connectionForExchange];
  xpc_connection_send_message(v20, v19);

  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  return [(ESDConnection *)self updateFolderListForAccountID:a3 andDataclasses:a4 requireChangedFolders:0 isUserRequested:a5];
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclasses:(int64_t)a5 isUserRequested:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  os_log_type_t v12 = DALoggingwithCategory();
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v12, v13))
  {
    *(_DWORD *)long long buf = 138413058;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2048;
    int64_t v29 = a5;
    __int16 v30 = 1024;
    BOOL v31 = v6;
    _os_log_impl(&dword_232AD4000, v12, v13, "updateContentsOfFoldersWithKeys %@ for account id %@, dataclasses 0x%lx isUserRequested %d", buf, 0x26u);
  }

  [(ESDConnection *)self _resetCertWarningsForAccountId:v11 andDataclasses:a5 isUserRequested:v6];
  [(ESDConnection *)self _resetThrottleTimersForAccountId:v11];
  uint64_t v14 = *MEMORY[0x263F39230];
  uint64_t v15 = *MEMORY[0x263F38FA0];
  v22[0] = *MEMORY[0x263F39170];
  v23[0] = v14;
  v23[1] = v11;
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", a5, v22[0], v15, *MEMORY[0x263F390A8]);
  v23[2] = v16;
  v22[3] = *MEMORY[0x263F39148];
  BOOL v17 = [NSNumber numberWithBool:v6];
  void v22[4] = *MEMORY[0x263F390E8];
  v23[3] = v17;
  v23[4] = v10;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

  int v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v20 = [(ESDConnection *)self _connectionForExchange];
  xpc_connection_send_message(v20, v19);

  return 1;
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_semaphore_t v9 = DALoggingwithCategory();
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)long long buf = 138412802;
    id v22 = v8;
    __int16 v23 = 2048;
    int64_t v24 = a4;
    __int16 v25 = 1024;
    BOOL v26 = v5;
    _os_log_impl(&dword_232AD4000, v9, v10, "updateContentsOfAllFoldersForAccountID %@, dataclasses 0x%lxx isUserRequested %d", buf, 0x1Cu);
  }

  [(ESDConnection *)self _resetCertWarningsForAccountId:v8 andDataclasses:a4 isUserRequested:v5];
  [(ESDConnection *)self _resetThrottleTimersForAccountId:v8];
  uint64_t v11 = *MEMORY[0x263F39220];
  uint64_t v12 = *MEMORY[0x263F38FA0];
  v19[0] = *MEMORY[0x263F39170];
  v20[0] = v11;
  v20[1] = v8;
  os_log_type_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", a4, v19[0], v12, *MEMORY[0x263F390A8]);
  v20[2] = v13;
  v19[3] = *MEMORY[0x263F39148];
  uint64_t v14 = [NSNumber numberWithBool:v5];
  v20[3] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v17 = [(ESDConnection *)self _connectionForExchange];
  xpc_connection_send_message(v17, v16);

  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4
{
  return [(ESDConnection *)self updateFolderListForAccountID:a3 andDataclasses:a4 isUserRequested:0];
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclass:(int64_t)a5
{
  return [(ESDConnection *)self updateContentsOfFoldersWithKeys:a3 forAccountID:a4 andDataclass:a5 isUserRequested:0];
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclass:(int64_t)a4
{
  return [(ESDConnection *)self updateContentsOfAllFoldersForAccountID:a3 andDataclass:a4 isUserRequested:0];
}

- (BOOL)performServerContactsSearch:(id)a3 forAccountWithID:(id)a4
{
  v34[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  [(ESDConnection *)self _resetCertWarningsForAccountId:v7 andDataclasses:8 isUserRequested:0];
  if (!v7)
  {
    os_log_type_t v13 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v13, v20))
    {
      *(_WORD *)long long buf = 0;
      BOOL v21 = "nil accountID passed to performServerContactsSearch. Refusing to attempt search";
LABEL_8:
      _os_log_impl(&dword_232AD4000, v13, v20, v21, buf, 2u);
    }
LABEL_9:
    BOOL v19 = 0;
    goto LABEL_10;
  }
  id v8 = [v6 searchString];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    os_log_type_t v13 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v13, v20))
    {
      *(_WORD *)long long buf = 0;
      BOOL v21 = "nil search string passed to performServerContactsSearch. Refusing to attempt search";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v10 = *MEMORY[0x263F391C0];
  uint64_t v11 = *MEMORY[0x263F38FA0];
  v33[0] = *MEMORY[0x263F39170];
  v33[1] = v11;
  v34[0] = v10;
  v34[1] = v7;
  v33[2] = *MEMORY[0x263F39278];
  uint64_t v12 = [v6 dictionaryRepresentation];
  v34[2] = v12;
  os_log_type_t v13 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];

  uint64_t v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  uint64_t v16 = [(ESDConnection *)self _connectionForExchange];
  BOOL v17 = dispatch_get_global_queue(0, 0);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __62__ESDConnection_performServerContactsSearch_forAccountWithID___block_invoke;
  v23[3] = &unk_264BC96D0;
  id v24 = v6;
  __int16 v25 = self;
  uint64_t v27 = &v29;
  uint64_t v18 = v15;
  BOOL v26 = v18;
  xpc_connection_send_message_with_reply(v16, v14, v17, v23);

  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v19 = *((unsigned char *)v30 + 24) != 0;

LABEL_10:
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __62__ESDConnection_performServerContactsSearch_forAccountWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x237DAF260]() == MEMORY[0x263EF8708])
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F39270]];
    [*(id *)(a1 + 32) setSearchID:v5];
    id v6 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ESDConnection_performServerContactsSearch_forAccountWithID___block_invoke_2;
    block[3] = &unk_264BC96A8;
    id v9 = *(id *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 40);
    id v7 = v5;
    dispatch_sync(v6, block);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __62__ESDConnection_performServerContactsSearch_forAccountWithID___block_invoke_2(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_232AD4000, v2, v3, "Setting search query %@ for key %@", (uint8_t *)&v7, 0x16u);
  }

  return [*(id *)(a1[6] + 56) setObject:a1[4] forKeyedSubscript:a1[5]];
}

- (void)cancelServerContactsSearch:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 searchID];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [v4 setState:2];
    [v4 setConsumer:0];
    int v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)long long buf = 134217984;
      id v27 = v4;
      _os_log_impl(&dword_232AD4000, v7, v8, "Cancelling search task %p", buf, 0xCu);
    }

    __int16 v9 = [v4 searchID];
    uint64_t v10 = *MEMORY[0x263F390A0];
    uint64_t v11 = *MEMORY[0x263F39270];
    v24[0] = *MEMORY[0x263F39170];
    v24[1] = v11;
    v25[0] = v10;
    v25[1] = v9;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    os_log_type_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v14 = [(ESDConnection *)self _connectionForExchange];
    xpc_connection_send_message(v14, v13);

    dispatch_semaphore_t v15 = DALoggingwithCategory();
    if (os_log_type_enabled(v15, v8))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v9;
      _os_log_impl(&dword_232AD4000, v15, v8, "Removing search query for key %@", buf, 0xCu);
    }

    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    os_log_type_t v20 = __44__ESDConnection_cancelServerContactsSearch___block_invoke;
    BOOL v21 = &unk_264BC9548;
    id v22 = self;
    id v23 = v9;
    id v17 = v9;
    dispatch_sync(muckingWithInFlightCollections, &v18);
    objc_msgSend(v4, "setSearchID:", &stru_26E663198, v18, v19, v20, v21, v22);
  }
}

uint64_t __44__ESDConnection_cancelServerContactsSearch___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
}

- (BOOL)processMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a6;
  [(ESDConnection *)self _resetCertWarningsForAccountId:v15 andDataclasses:5 isUserRequested:0];
  id v17 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F391F8], *MEMORY[0x263F39170], v15, *MEMORY[0x263F38FA0], v16, *MEMORY[0x263F390E0], 0);

  if (v12) {
    [v17 setObject:v12 forKeyedSubscript:*MEMORY[0x263F39158]];
  }
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x263F39160]];
  }
  if (v14) {
    [v17 setObject:v14 forKeyedSubscript:*MEMORY[0x263F39168]];
  }
  uint64_t v18 = DALoggingwithCategory();
  os_log_type_t v19 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v18, v19))
  {
    *(_DWORD *)long long buf = 136315138;
    BOOL v26 = "-[ESDConnection processMeetingRequests:deliveryIdsToClear:deliveryIdsToSoftClear:inFolderWithId:forAccountWithId:]";
    _os_log_impl(&dword_232AD4000, v18, v19, "XPC call performed in: %s", buf, 0xCu);
  }

  os_log_type_t v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v21 = [(ESDConnection *)self _connectionForExchange];
  xpc_object_t v22 = xpc_connection_send_message_with_reply_sync(v21, v20);

  BOOL v23 = [(ESDConnection *)self _validateXPCReply:v22];
  return v23;
}

- (void)asyncProcessMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  [(ESDConnection *)self _resetCertWarningsForAccountId:v14 andDataclasses:5 isUserRequested:0];
  id v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F38FE0], *MEMORY[0x263F39170], v14, *MEMORY[0x263F38FA0], v15, *MEMORY[0x263F390E0], 0);

  if (v19) {
    [v16 setObject:v19 forKeyedSubscript:*MEMORY[0x263F39158]];
  }
  if (v12) {
    [v16 setObject:v12 forKeyedSubscript:*MEMORY[0x263F39160]];
  }
  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x263F39168]];
  }
  id v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v18 = [(ESDConnection *)self _connectionForExchange];
  xpc_connection_send_message(v18, v17);
}

- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5 forAccountID:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (objc_class *)MEMORY[0x263EFF9A0];
  id v14 = a6;
  id v15 = [v13 alloc];
  id v16 = objc_msgSend(v15, "initWithObjectsAndKeys:", *MEMORY[0x263F39290], *MEMORY[0x263F39170], v14, *MEMORY[0x263F38FA0], 0);

  if (v10) {
    [v16 setObject:v10 forKeyedSubscript:*MEMORY[0x263F39178]];
  }
  if (v11) {
    [v16 setObject:v11 forKeyedSubscript:*MEMORY[0x263F39180]];
  }
  if (v12) {
    [v16 setObject:v12 forKeyedSubscript:*MEMORY[0x263F39188]];
  }
  id v17 = DALoggingwithCategory();
  os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v17, v18))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v25 = "-[ESDConnection setFolderIdsThatExternalClientsCareAboutAdded:deleted:foldersTag:forAccountID:]";
    _os_log_impl(&dword_232AD4000, v17, v18, "XPC call performed in: %s", buf, 0xCu);
  }

  id v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  os_log_type_t v20 = [(ESDConnection *)self _connectionForExchange];
  xpc_object_t v21 = xpc_connection_send_message_with_reply_sync(v20, v19);

  BOOL v22 = [(ESDConnection *)self _validateXPCReply:v21];
  return v22;
}

- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6
{
  void v23[5] = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v9 = *MEMORY[0x263F39170];
    v23[0] = *MEMORY[0x263F39208];
    uint64_t v10 = *MEMORY[0x263F392C0];
    v22[0] = v9;
    v22[1] = v10;
    id v11 = NSNumber;
    if (a3) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 10;
    }
    id v13 = a6;
    id v14 = a4;
    id v15 = [v11 numberWithInteger:v12];
    uint64_t v16 = *MEMORY[0x263F390E0];
    v23[1] = v15;
    v23[2] = v14;
    uint64_t v17 = *MEMORY[0x263F390F8];
    v22[2] = v16;
    v22[3] = v17;
    os_log_type_t v18 = [NSNumber numberWithUnsignedInteger:a5];
    void v22[4] = *MEMORY[0x263F38FA0];
    v23[3] = v18;
    void v23[4] = v13;
    id v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

    os_log_type_t v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_object_t v21 = [(ESDConnection *)self _connectionForExchange];
    xpc_connection_send_message(v21, v20);
  }
}

- (void)handleURL:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = [a3 absoluteString];
  CFStringRef v5 = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, 0, @"&=", 0x8000100u);
  uint64_t v6 = *MEMORY[0x263F39128];
  uint64_t v7 = *MEMORY[0x263F392F8];
  v11[0] = *MEMORY[0x263F39170];
  v11[1] = v7;
  v12[0] = v6;
  v12[1] = v5;
  os_log_type_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v10 = [(ESDConnection *)self _connectionForExchange];
  xpc_connection_send_message(v10, v9);

  if (v5) {
    CFRelease(v5);
  }
}

- (void)_sendSynchronousXPCMessageWithParameters:(id)a3 handlerBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  uint64_t v10 = [(ESDConnection *)self _connectionForExchange];
  id v11 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__ESDConnection__sendSynchronousXPCMessageWithParameters_handlerBlock___block_invoke;
  v14[3] = &unk_264BC96F8;
  dispatch_semaphore_t v15 = v8;
  id v16 = v6;
  uint64_t v12 = v8;
  id v13 = v6;
  xpc_connection_send_message_with_reply(v10, v9, v11, v14);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __71__ESDConnection__sendSynchronousXPCMessageWithParameters_handlerBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(void *)(a1 + 40) && MEMORY[0x237DAF260](v4) == MEMORY[0x263EF8708])
  {
    os_log_type_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)beginDownloadingAttachmentWithUUID:(id)a3 accountID:(id)a4 queue:(id)a5 progressBlock:(id)a6 completionBlock:(id)a7
{
  v39[3] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = DALoggingwithCategory();
  os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v17, v18))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_232AD4000, v17, v18, "Requesting download of attachment UUID %@ for accountID %@", buf, 0x16u);
  }

  id v19 = [[ESDownloadContext alloc] initWithAttachmentUUID:v12 accountID:v13 queue:v14 downloadProgressBlock:v15 completionBlock:v16];
  uint64_t v20 = *MEMORY[0x263F39010];
  uint64_t v21 = *MEMORY[0x263F39008];
  v38[0] = *MEMORY[0x263F39170];
  v38[1] = v21;
  v39[0] = v20;
  v39[1] = v12;
  v38[2] = *MEMORY[0x263F38FA0];
  v39[2] = v13;
  BOOL v22 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  uint64_t v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __98__ESDConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke;
  v28[3] = &unk_264BC9748;
  v33 = buf;
  id v23 = v12;
  id v29 = v23;
  id v24 = v13;
  id v30 = v24;
  uint64_t v31 = self;
  __int16 v25 = v19;
  char v32 = v25;
  [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v22 handlerBlock:v28];
  id v26 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v26;
}

void __98__ESDConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F38FF0]];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  CFStringRef v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl(&dword_232AD4000, v6, v7, "Download context %@ set up for downloading attachment UUID %@ on accountID %@", buf, 0x20u);
  }

  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = *(NSObject **)(v11 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__ESDConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_140;
  block[3] = &unk_264BC9720;
  void block[4] = v11;
  long long v14 = *(_OWORD *)(a1 + 56);
  id v13 = (id)v14;
  long long v16 = v14;
  dispatch_sync(v12, block);
}

uint64_t __98__ESDConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_140(void *a1)
{
  return [*(id *)(a1[4] + 72) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)_cancelDownloadsWithIDs:(id)a3 error:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        uint64_t v15 = 0;
        long long v16 = &v15;
        uint64_t v17 = 0x3032000000;
        uint64_t v18 = __Block_byref_object_copy_;
        __int16 v19 = __Block_byref_object_dispose_;
        id v20 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __47__ESDConnection__cancelDownloadsWithIDs_error___block_invoke;
        block[3] = &unk_264BC9658;
        void block[5] = v11;
        void block[6] = &v15;
        void block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        [(id)v16[5] finishedWithError:v7];
        _Block_object_dispose(&v15, 8);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

uint64_t __47__ESDConnection__cancelDownloadsWithIDs_error___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 72);
  return [v6 removeObjectForKey:v5];
}

- (void)cancelDownloadingAttachmentWithDownloadID:(id)a3 error:(id)a4
{
  v20[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F39170];
  v20[0] = *MEMORY[0x263F39098];
  uint64_t v8 = *MEMORY[0x263F390C0];
  v19[0] = v7;
  v19[1] = v8;
  uint64_t v9 = (void *)MEMORY[0x263F08910];
  id v10 = a4;
  uint64_t v11 = [v9 archivedDataWithRootObject:v10];
  v19[2] = *MEMORY[0x263F38FF0];
  v20[1] = v11;
  v20[2] = v6;
  id v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  id v13 = DALoggingwithCategory();
  os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_232AD4000, v13, v14, "Cancelling Download of attachment with downloadID %@", buf, 0xCu);
  }

  [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v12 handlerBlock:0];
  id v16 = v6;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  [(ESDConnection *)self _cancelDownloadsWithIDs:v15 error:v10];
}

- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = DALoggingwithCategory();
  os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)long long buf = 134218498;
    int64_t v33 = a3;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    id v37 = v13;
    _os_log_impl(&dword_232AD4000, v16, v17, "Requesting share response %ld for calendar %@ for accountID %@", buf, 0x20u);
  }

  id v18 = [[ESSharedCalendarContext alloc] initWithCalendarID:v12 accountID:v13 queue:v15 completionBlock:v14];
  [(ESSharedCalendarContext *)v18 setShouldSyncCalendar:a3 == 1];
  uint64_t v19 = *MEMORY[0x263F38FA0];
  v30[0] = *MEMORY[0x263F39170];
  v30[1] = v19;
  v31[0] = *MEMORY[0x263F39260];
  v31[1] = v13;
  v30[2] = *MEMORY[0x263F392A0];
  id v20 = [NSNumber numberWithInteger:a3];
  v30[3] = *MEMORY[0x263F392A8];
  v31[2] = v20;
  v31[3] = v12;
  long long v21 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  void v25[2] = __97__ESDConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke;
  void v25[3] = &unk_264BC9770;
  id v26 = v12;
  id v27 = v13;
  uint64_t v28 = self;
  id v29 = v18;
  long long v22 = v18;
  id v23 = v13;
  id v24 = v12;
  [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v21 handlerBlock:v25];
}

void __97__ESDConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F39298]];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    id v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_232AD4000, v4, v5, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(NSObject **)(v8 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__ESDConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_144;
  block[3] = &unk_264BC96A8;
  void block[4] = v8;
  id v12 = v3;
  id v13 = *(id *)(a1 + 56);
  id v10 = v3;
  dispatch_sync(v9, block);
}

uint64_t __97__ESDConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_144(void *a1)
{
  return [*(id *)(a1[4] + 96) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = DALoggingwithCategory();
  os_log_type_t v15 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)long long buf = 138412546;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_232AD4000, v14, v15, "Reporting calendar %@ for accountID %@ as junk", buf, 0x16u);
  }

  __int16 v16 = [[ESSharedCalendarContext alloc] initWithCalendarID:v10 accountID:v11 queue:v13 completionBlock:v12];
  [(ESSharedCalendarContext *)v16 setShouldSyncCalendar:0];
  uint64_t v17 = *MEMORY[0x263F39210];
  uint64_t v18 = *MEMORY[0x263F38FA0];
  v28[0] = *MEMORY[0x263F39170];
  v28[1] = v18;
  v29[0] = v17;
  v29[1] = v11;
  v28[2] = *MEMORY[0x263F392A8];
  v29[2] = v10;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __99__ESDConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke;
  v23[3] = &unk_264BC9770;
  id v24 = v10;
  id v25 = v11;
  id v26 = self;
  id v27 = v16;
  uint64_t v20 = v16;
  id v21 = v11;
  id v22 = v10;
  [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v19 handlerBlock:v23];
}

void __99__ESDConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F39298]];
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    os_log_type_t v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_232AD4000, v4, v5, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(NSObject **)(v8 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__ESDConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_145;
  block[3] = &unk_264BC96A8;
  void block[4] = v8;
  id v12 = v3;
  id v13 = *(id *)(a1 + 56);
  id v10 = v3;
  dispatch_sync(v9, block);
}

uint64_t __99__ESDConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_145(void *a1)
{
  return [*(id *)(a1[4] + 96) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (BOOL)processFolderChange:(id)a3 forAccountWithID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263F08910];
  id v8 = a4;
  uint64_t v9 = [v7 archivedDataWithRootObject:v6];
  id v10 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F391F0], *MEMORY[0x263F39170], v8, *MEMORY[0x263F38FA0], v9, *MEMORY[0x263F390D0], 0);

  id v11 = DALoggingwithCategory();
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)long long buf = 136315138;
    id v26 = "-[ESDConnection processFolderChange:forAccountWithID:]";
    _os_log_impl(&dword_232AD4000, v11, v12, "XPC call performed in: %s", buf, 0xCu);
  }

  id v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  id v14 = [(ESDConnection *)self _connectionForExchange];
  xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(v14, v13);

  if (MEMORY[0x237DAF260](v15) == MEMORY[0x263EF8708])
  {
    __int16 v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F392E8]];
    uint64_t v18 = [v17 unsignedIntegerValue];

    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__ESDConnection_processFolderChange_forAccountWithID___block_invoke;
    block[3] = &unk_264BC9798;
    id v23 = self;
    uint64_t v24 = v18;
    id v22 = v6;
    dispatch_sync(muckingWithInFlightCollections, block);
  }
  return 1;
}

void __54__ESDConnection_processFolderChange_forAccountWithID___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[6];
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_232AD4000, v2, v3, "Setting folder change %@ for key %lu", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v6 = a1[4];
  uint64_t v7 = *(void **)(a1[5] + 64);
  id v8 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

- (id)statusReports
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v21 = *MEMORY[0x263F39170];
  v22[0] = *MEMORY[0x263F39118];
  os_log_type_t v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = [(ESDConnection *)self _connectionForExchange];
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __30__ESDConnection_statusReports__block_invoke;
  handler[3] = &unk_264BC9680;
  id v14 = &v15;
  id v8 = v5;
  uint64_t v13 = v8;
  xpc_connection_send_message_with_reply(v6, v4, v7, handler);

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __30__ESDConnection_statusReports__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (MEMORY[0x237DAF260]() == MEMORY[0x263EF8708])
  {
    uint64_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F392C8]];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F392C0]];
    dispatch_time_t v9 = v8;
    if (!v8 || [v8 intValue] != 2)
    {
      id v10 = DALoggingwithCategory();
      os_log_type_t v11 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v10, v11))
      {
        int v12 = 136315394;
        uint64_t v13 = "-[ESDConnection statusReports]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_232AD4000, v10, v11, "Server error in %s communicating with daemon: %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reallyRegisterForInterrogation
{
  v10[1] = *MEMORY[0x263EF8340];
  if (self->_statusReportBlock && ![(ESDConnection *)self registered])
  {
    [(ESDConnection *)self setRegistered:1];
    id v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_232AD4000, v3, v4, "Sending message: kDAERegisterForInterrogation", v8, 2u);
    }

    uint64_t v9 = *MEMORY[0x263F39170];
    v10[0] = *MEMORY[0x263F39200];
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v7 = [(ESDConnection *)self _connectionForExchange];
    xpc_connection_send_message(v7, v6);
  }
}

- (BOOL)registerForInterrogationWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_statusReportBlock != v4)
  {
    if (v4) {
      uint64_t v6 = (void *)[v4 copy];
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = (void *)MEMORY[0x237DAF050](v6);
    statusReportBlocuint64_t k = self->_statusReportBlock;
    self->_statusReportBlocuint64_t k = v7;
  }
  return 1;
}

- (void)fillOutCurrentEASTimeZoneInfo
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F39170];
  v12[0] = *MEMORY[0x263F390C8];
  id v3 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = [(ESDConnection *)self _connectionForExchange];
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __46__ESDConnection_fillOutCurrentEASTimeZoneInfo__block_invoke;
  v9[3] = &unk_264BC97C0;
  dispatch_semaphore_t v10 = v5;
  id v8 = v5;
  xpc_connection_send_message_with_reply(v6, v4, v7, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __46__ESDConnection_fillOutCurrentEASTimeZoneInfo__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)activeSyncDeviceIdentifier
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v24 = *MEMORY[0x263F39170];
  v25[0] = *MEMORY[0x263F39108];
  id v3 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  int v5 = 3;
  while (1)
  {
    uint64_t v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [(ESDConnection *)self _connectionForExchange];
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __43__ESDConnection_activeSyncDeviceIdentifier__block_invoke;
    handler[3] = &unk_264BC9680;
    uint64_t v17 = &v18;
    dispatch_semaphore_t v10 = v7;
    uint64_t v16 = v10;
    xpc_connection_send_message_with_reply(v8, v6, v9, handler);

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (v19[5]) {
      break;
    }
    uint64_t v11 = DALoggingwithCategory();
    if (os_log_type_enabled(v11, v4))
    {
      *(_WORD *)__int16 v14 = 0;
      _os_log_impl(&dword_232AD4000, v11, v4, "Error getting activesync device identifier, will try again", v14, 2u);
    }

    if (!--v5) {
      goto LABEL_8;
    }
  }

LABEL_8:
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __43__ESDConnection_activeSyncDeviceIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (MEMORY[0x237DAF260]() == MEMORY[0x263EF8708])
  {
    id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F38FC0]];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_performOofSettingsRequest:(id)a3 forAccountWithID:(id)a4 forUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  v36[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v11 = *MEMORY[0x263F38FA0];
    v35[0] = *MEMORY[0x263F39170];
    v35[1] = v11;
    v36[0] = *MEMORY[0x263F391A0];
    v36[1] = v9;
    v35[2] = *MEMORY[0x263F39190];
    id v12 = [NSNumber numberWithBool:v5];
    v36[2] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
    __int16 v14 = [v10 initWithDictionary:v13];

    if (v5)
    {
      uint64_t v15 = [v8 dictionaryRepresentation];
      [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F391B0]];
    }
    uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    uint64_t v18 = [(ESDConnection *)self _connectionForExchange];
    uint64_t v19 = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __71__ESDConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke;
    handler[3] = &unk_264BC9810;
    id v25 = v8;
    id v26 = self;
    BOOL v29 = v5;
    uint64_t v28 = &v31;
    uint64_t v20 = v17;
    uint64_t v27 = v20;
    xpc_connection_send_message_with_reply(v18, v16, v19, handler);

    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v21 = *((unsigned char *)v32 + 24) != 0;
  }
  else
  {
    __int16 v14 = DALoggingwithCategory();
    os_log_type_t v22 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v14, v22))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_232AD4000, v14, v22, "nil accountID passed to performASSettingsRequest. Cannot continue.", buf, 2u);
    }
    BOOL v21 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v21;
}

void __71__ESDConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x237DAF260]() == MEMORY[0x263EF8708])
  {
    uint64_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F39198]];
    [*(id *)(a1 + 32) setRequestID:v5];
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __71__ESDConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke_2;
    v8[3] = &unk_264BC97E8;
    char v12 = *(unsigned char *)(a1 + 64);
    id v9 = *(id *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 40);
    id v7 = v5;
    dispatch_sync(v6, v8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __71__ESDConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v4 = @"update";
    }
    else {
      uint64_t v4 = @"retrieve";
    }
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138412802;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_232AD4000, v2, v3, "Adding to inflight dictionary: oof %@ request %@ for key %@", (uint8_t *)&v8, 0x20u);
  }

  return [*(id *)(*(void *)(a1 + 48) + 104) setObject:*(void *)(a1 + 32) forKeyedSubscript:*(void *)(a1 + 40)];
}

- (BOOL)retrieveOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  return [(ESDConnection *)self _performOofSettingsRequest:a3 forAccountWithID:a4 forUpdate:0];
}

- (BOOL)updateOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  return [(ESDConnection *)self _performOofSettingsRequest:a3 forAccountWithID:a4 forUpdate:1];
}

- (void)isOofSettingsSupportedForAccountWithID:(id)a3 completionBlock:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x263F39138];
    uint64_t v9 = *MEMORY[0x263F38FA0];
    v19[0] = *MEMORY[0x263F39170];
    v19[1] = v9;
    v20[0] = v8;
    v20[1] = v6;
    __int16 v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    uint64_t v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    __int16 v12 = [(ESDConnection *)self _connectionForExchange];
    uint64_t v13 = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __72__ESDConnection_isOofSettingsSupportedForAccountWithID_completionBlock___block_invoke;
    handler[3] = &unk_264BC9838;
    id v17 = v7;
    xpc_connection_send_message_with_reply(v12, v11, v13, handler);
  }
  else
  {
    uint64_t v14 = DALoggingwithCategory();
    os_log_type_t v15 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_232AD4000, v14, v15, "nil accountID passed to isOofSettingsSupportedForAccountWithID. Cannot continue.", buf, 2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __72__ESDConnection_isOofSettingsSupportedForAccountWithID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x237DAF260]() == MEMORY[0x263EF8708])
  {
    uint64_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F39140]];
    id v6 = v5;
    if (v5)
    {
      [v5 BOOLValue];
    }
    else
    {
      id v7 = DALoggingwithCategory();
      os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_232AD4000, v7, v8, "Error getting activesync device identifier", v9, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)requestCalendarAvailabilityWithAccountID:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8 completionBlock:(id)a9
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v47 = a6;
  id v18 = a7;
  id v46 = a8;
  id v19 = a9;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  id v61 = 0;
  uint64_t v20 = v15;
  if (!v15)
  {
    BOOL v21 = DALoggingwithCategory();
    uint64_t v27 = *(unsigned __int8 *)(MEMORY[0x263F38F90] + 4);
    if (os_log_type_enabled(v21, *(os_log_type_t *)(MEMORY[0x263F38F90] + 4)))
    {
      *(_DWORD *)long long buf = 138412290;
      id v63 = 0;
      id v23 = "Invalid 'accountID' provided: [%@].";
      uint64_t v24 = v21;
      os_log_type_t v25 = v27;
      uint32_t v26 = 12;
      goto LABEL_9;
    }
LABEL_10:

    id v28 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:93 userInfo:0];
    goto LABEL_11;
  }
  if (!v16 || !v17 || [v16 compare:v17] == 1)
  {
    BOOL v21 = DALoggingwithCategory();
    os_log_type_t v22 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)long long buf = 138412546;
      id v63 = v16;
      __int16 v64 = 2112;
      id v65 = v17;
      id v23 = "Invalid 'startDate' [%@] and/or 'endDate' [%@] provided.";
      uint64_t v24 = v21;
      os_log_type_t v25 = v22;
      uint32_t v26 = 22;
LABEL_9:
      _os_log_impl(&dword_232AD4000, v24, v25, v23, buf, v26);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v18 && [v18 count])
  {
    id v40 = DALoggingwithCategory();
    os_log_type_t v41 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v40, v41))
    {
      *(_DWORD *)long long buf = 138413314;
      id v63 = v20;
      __int16 v64 = 2112;
      id v65 = v16;
      __int16 v66 = 2112;
      id v67 = v17;
      __int16 v68 = 2112;
      id v69 = v47;
      __int16 v70 = 2112;
      id v71 = v18;
      _os_log_impl(&dword_232AD4000, v40, v41, "Preparing calendar availability request.  accountID: [%@] startDate: [%@] endDate: [%@] ignoredEventID: [%@] addresses: [%@]", buf, 0x34u);
    }

    id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v42 setObject:*MEMORY[0x263F39228] forKey:*MEMORY[0x263F39170]];
    [v42 setObject:v20 forKey:*MEMORY[0x263F38FA0]];
    [v42 setObject:v16 forKey:*MEMORY[0x263F392B0]];
    [v42 setObject:v17 forKey:*MEMORY[0x263F390B8]];
    [v42 setObject:v18 forKey:*MEMORY[0x263F38FC8]];
    if (v47) {
      [v42 setObject:v47 forKey:*MEMORY[0x263F39130]];
    }
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_152;
    v48[3] = &unk_264BC9888;
    v52[1] = &v56;
    id v51 = v46;
    v52[0] = v19;
    char v34 = v42;
    v49 = v34;
    v50 = self;
    [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v34 handlerBlock:v48];

    id v36 = v19;
    id v45 = v16;
    id v31 = v17;
    __int16 v32 = v20;
    id v33 = v18;
    id v28 = 0;
    id v35 = &v51;
    id v37 = (id *)v52;
    goto LABEL_15;
  }
  v43 = DALoggingwithCategory();
  os_log_type_t v44 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v43, v44))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_232AD4000, v43, v44, "No 'addresses' provided.", buf, 2u);
  }

  id v28 = 0;
LABEL_11:
  BOOL v29 = DALoggingwithCategory();
  os_log_type_t v30 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
  if (os_log_type_enabled(v29, v30))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_232AD4000, v29, v30, "Will not issue calendar availability request.", buf, 2u);
  }

  if (v19)
  {
    id v45 = v16;
    id v31 = v17;
    __int16 v32 = v20;
    id v33 = v18;
    char v34 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_264BC9860;
    id v35 = &v55;
    id v36 = v19;
    id v55 = v19;
    id v37 = &v54;
    id v28 = v28;
    id v54 = v28;
    dispatch_async(v34, block);
LABEL_15:

    id v18 = v33;
    id v16 = v45;
    uint64_t v20 = v32;
    id v17 = v31;
    id v19 = v36;
  }
  id v38 = (id)v57[5];

  _Block_object_dispose(&v56, 8);
  return v38;
}

uint64_t __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_152(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F39028]];
  uint64_t v4 = *(void *)(a1[8] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [[ESECalendarAvailabilityContext alloc] initWithResultsBlock:a1[6] completionBlock:a1[7]];
  id v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(*(void *)(a1[8] + 8) + 40);
    uint64_t v10 = a1[4];
    *(_DWORD *)long long buf = 138412802;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_232AD4000, v7, v8, "Received request ID [%@] for request with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
  }

  uint64_t v11 = a1[5];
  __int16 v12 = *(NSObject **)(v11 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_154;
  block[3] = &unk_264BC9720;
  uint64_t v13 = a1[8];
  id v16 = v6;
  uint64_t v17 = v13;
  void block[4] = v11;
  uint64_t v14 = v6;
  dispatch_sync(v12, block);
}

uint64_t __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_154(void *a1)
{
  return [*(id *)(a1[4] + 80) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  void v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x263F39088];
    uint64_t v7 = *MEMORY[0x263F39028];
    v21[0] = *MEMORY[0x263F39170];
    v21[1] = v7;
    v22[0] = v6;
    v22[1] = v4;
    os_log_type_t v8 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v8 handlerBlock:0];
    *(void *)long long buf = 0;
    id v16 = buf;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy_;
    uint64_t v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__ESDConnection_cancelCalendarAvailabilityRequestWithID___block_invoke;
    block[3] = &unk_264BC9658;
    uint64_t v14 = buf;
    void block[4] = self;
    id v13 = v5;
    dispatch_sync(muckingWithInFlightCollections, block);
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:-1 userInfo:0];
    [*((id *)v16 + 5) finishedWithError:v10];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    os_log_type_t v8 = DALoggingwithCategory();
    os_log_type_t v11 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v8, v11))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_232AD4000, v8, v11, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }
}

uint64_t __57__ESDConnection_cancelCalendarAvailabilityRequestWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 80);
  return [v6 removeObjectForKey:v5];
}

- (void)_calendarAvailabilityRequestReturnedResults:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39028]];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39038]];
  os_log_type_t v8 = (void *)MEMORY[0x263F08928];
  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  id v23 = 0;
  uint64_t v14 = [v8 unarchivedObjectOfClasses:v13 fromData:v7 error:&v23];
  id v15 = v23;

  if (!v14)
  {
    id v16 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
    if (os_log_type_enabled(v16, v17))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_232AD4000, v16, v17, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  uint32_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ESDConnection__calendarAvailabilityRequestReturnedResults___block_invoke;
  block[3] = &unk_264BC9658;
  p_long long buf = &buf;
  void block[4] = self;
  id v19 = v6;
  id v21 = v19;
  dispatch_sync(muckingWithInFlightCollections, block);
  [*(id *)(*((void *)&buf + 1) + 40) resultsReturned:v14];

  _Block_object_dispose(&buf, 8);
}

uint64_t __61__ESDConnection__calendarAvailabilityRequestReturnedResults___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)_calendarAvailabilityRequestFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39028]];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F390C0]];
  os_log_type_t v8 = [(ESDConnection *)self decodedErrorFromData:v7];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  os_log_type_t v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ESDConnection__calendarAvailabilityRequestFinished___block_invoke;
  block[3] = &unk_264BC9658;
  id v13 = &v14;
  void block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v15[5] finishedWithError:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __54__ESDConnection__calendarAvailabilityRequestFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 80);
  return [v6 removeObjectForKey:v5];
}

- (id)performCalendarDirectorySearchWithAccountID:(id)a3 terms:(id)a4 recordTypes:(id)a5 resultLimit:(unint64_t)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  id v51 = 0;
  if (v14)
  {
    if (v15 && [v15 count])
    {
      if (v16 && [v16 count])
      {
        id v19 = DALoggingwithCategory();
        os_log_type_t v20 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)long long buf = 138413058;
          id v53 = v14;
          __int16 v54 = 2112;
          id v55 = v16;
          __int16 v56 = 2048;
          unint64_t v57 = a6;
          __int16 v58 = 2112;
          id v59 = v15;
          _os_log_impl(&dword_232AD4000, v19, v20, "Preparing calendar directory search.  accountID: [%@] recordTypes:[%@] resultLimit: [%lu] terms: [%@]", buf, 0x2Au);
        }

        id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v21 setObject:*MEMORY[0x263F391C8] forKey:*MEMORY[0x263F39170]];
        [v21 setObject:v14 forKey:*MEMORY[0x263F38FA0]];
        __int16 v22 = [v15 allObjects];
        [v21 setObject:v22 forKey:*MEMORY[0x263F39078]];

        id v23 = [v16 allObjects];
        [v21 setObject:v23 forKey:*MEMORY[0x263F39058]];

        uint64_t v24 = [NSNumber numberWithUnsignedInteger:a6];
        [v21 setObject:v24 forKey:*MEMORY[0x263F39060]];

        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_156;
        void v38[3] = &unk_264BC9888;
        v42[1] = &v46;
        id v41 = v17;
        v42[0] = v18;
        uint64_t v25 = v21;
        id v39 = v25;
        id v40 = self;
        [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v25 handlerBlock:v38];

        id v26 = 0;
        uint64_t v27 = &v41;
        id v28 = (id *)v42;
        goto LABEL_22;
      }
      uint64_t v29 = DALoggingwithCategory();
      os_log_type_t v30 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
      if (!os_log_type_enabled(v29, v30)) {
        goto LABEL_17;
      }
      *(_WORD *)long long buf = 0;
      id v31 = "No 'recordTypes' provided.";
    }
    else
    {
      uint64_t v29 = DALoggingwithCategory();
      os_log_type_t v30 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
      if (!os_log_type_enabled(v29, v30))
      {
LABEL_17:

        id v26 = 0;
        goto LABEL_18;
      }
      *(_WORD *)long long buf = 0;
      id v31 = "No 'terms' provided.";
    }
    _os_log_impl(&dword_232AD4000, v29, v30, v31, buf, 2u);
    goto LABEL_17;
  }
  __int16 v32 = DALoggingwithCategory();
  os_log_type_t v33 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
  if (os_log_type_enabled(v32, v33))
  {
    *(_DWORD *)long long buf = 138412290;
    id v53 = 0;
    _os_log_impl(&dword_232AD4000, v32, v33, "Invalid 'accountID' provided: [%@].", buf, 0xCu);
  }

  id v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:93 userInfo:0];
LABEL_18:
  char v34 = DALoggingwithCategory();
  os_log_type_t v35 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
  if (os_log_type_enabled(v34, v35))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_232AD4000, v34, v35, "Will not issue calendar directory search.", buf, 2u);
  }

  if (v18)
  {
    uint64_t v25 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_264BC9860;
    uint64_t v27 = &v45;
    id v45 = v18;
    id v28 = &v44;
    id v26 = v26;
    id v44 = v26;
    dispatch_async(v25, block);
LABEL_22:
  }
  id v36 = (id)v47[5];

  _Block_object_dispose(&v46, 8);
  return v36;
}

uint64_t __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_156(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F39050]];
  uint64_t v4 = *(void *)(a1[8] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [[ESECalendarDirectorySearchContext alloc] initWithResultsBlock:a1[6] completionBlock:a1[7]];
  uint64_t v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(*(void *)(a1[8] + 8) + 40);
    uint64_t v10 = a1[4];
    *(_DWORD *)long long buf = 138412802;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_232AD4000, v7, v8, "Received search ID [%@] for search with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
  }

  uint64_t v11 = a1[5];
  id v12 = *(NSObject **)(v11 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_158;
  block[3] = &unk_264BC9720;
  uint64_t v13 = a1[8];
  id v16 = v6;
  uint64_t v17 = v13;
  void block[4] = v11;
  id v14 = v6;
  dispatch_sync(v12, block);
}

uint64_t __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_158(void *a1)
{
  return [*(id *)(a1[4] + 88) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x263F39090];
    uint64_t v7 = *MEMORY[0x263F39050];
    v26[0] = *MEMORY[0x263F39170];
    v26[1] = v7;
    v27[0] = v6;
    v27[1] = v4;
    os_log_type_t v8 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v8 handlerBlock:0];
    *(void *)id v18 = 0;
    uint64_t v19 = v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy_;
    __int16 v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ESDConnection_cancelCalendarDirectorySearchWithID___block_invoke;
    block[3] = &unk_264BC9658;
    uint64_t v17 = v18;
    void block[4] = self;
    id v10 = v5;
    id v16 = v10;
    dispatch_sync(muckingWithInFlightCollections, block);
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:-1 userInfo:0];
    [*((id *)v19 + 5) finishedWithError:v11 exceededResultLimit:0];
    id v12 = DALoggingwithCategory();
    os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)long long buf = 138412290;
      id v25 = v10;
      _os_log_impl(&dword_232AD4000, v12, v13, "Cancelled calendar directory search with ID: [%@].", buf, 0xCu);
    }

    _Block_object_dispose(v18, 8);
  }
  else
  {
    os_log_type_t v8 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v8, v14))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_232AD4000, v8, v14, "nil 'searchID' provided.  Will not cancel any calendar directory searches.", v18, 2u);
    }
  }
}

uint64_t __53__ESDConnection_cancelCalendarDirectorySearchWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 88);
  return [v6 removeObjectForKey:v5];
}

- (void)_calendarDirectorySearchReturnedResults:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39050]];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39068]];
  os_log_type_t v8 = (void *)MEMORY[0x263F08928];
  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  os_log_type_t v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  id v28 = 0;
  os_log_type_t v14 = [v8 unarchivedObjectOfClasses:v13 fromData:v7 error:&v28];
  id v15 = v28;

  if (!v14)
  {
    id v16 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
    if (os_log_type_enabled(v16, v17))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_232AD4000, v16, v17, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  __int16 v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ESDConnection__calendarDirectorySearchReturnedResults___block_invoke;
  block[3] = &unk_264BC9658;
  p_long long buf = &buf;
  void block[4] = self;
  id v19 = v6;
  id v26 = v19;
  dispatch_sync(muckingWithInFlightCollections, block);
  uint64_t v20 = [v14 count];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v20];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __57__ESDConnection__calendarDirectorySearchReturnedResults___block_invoke_2;
  v23[3] = &unk_264BC98B0;
  id v22 = v21;
  id v24 = v22;
  [v14 enumerateKeysAndObjectsUsingBlock:v23];
  [*(id *)(*((void *)&buf + 1) + 40) resultsReturned:v22];

  _Block_object_dispose(&buf, 8);
}

uint64_t __57__ESDConnection__calendarDirectorySearchReturnedResults___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

void __57__ESDConnection__calendarDirectorySearchReturnedResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithArray:v6];

  [*(id *)(a1 + 32) setObject:v8 forKey:v7];
}

- (void)_calendarDirectorySearchFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39050]];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F390C0]];
  id v8 = [(ESDConnection *)self decodedErrorFromData:v7];
  uint64_t v9 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39040]];
  uint64_t v10 = v9;
  if (v9) {
    uint64_t v11 = [v9 BOOLValue];
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ESDConnection__calendarDirectorySearchFinished___block_invoke;
  block[3] = &unk_264BC9658;
  id v16 = &v17;
  void block[4] = self;
  id v13 = v6;
  id v15 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v18[5] finishedWithError:v8 exceededResultLimit:v11];

  _Block_object_dispose(&v17, 8);
}

uint64_t __50__ESDConnection__calendarDirectorySearchFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 88);
  return [v6 removeObjectForKey:v5];
}

- (void)externalIdentificationForAccountID:(id)a3 resultsBlock:(id)a4
{
  v41[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v34 = 0;
  os_log_type_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy_;
  id v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  __int16 v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = -1;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = *MEMORY[0x263F39218];
      uint64_t v9 = *MEMORY[0x263F38FA0];
      v40[0] = *MEMORY[0x263F39170];
      v40[1] = v9;
      v41[0] = v8;
      v41[1] = v6;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __65__ESDConnection_externalIdentificationForAccountID_resultsBlock___block_invoke;
      v16[3] = &unk_264BC98D8;
      v16[4] = &v34;
      v16[5] = &v28;
      v16[6] = &v24;
      v16[7] = &v18;
      [(ESDConnection *)self _sendSynchronousXPCMessageWithParameters:v10 handlerBlock:v16];
    }
    else
    {
      id v13 = DALoggingwithCategory();
      os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_232AD4000, v13, v14, "No accountID provided.", buf, 2u);
      }

      uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:93 userInfo:0];
      uint64_t v10 = (void *)v35[5];
      v35[5] = v15;
    }

    v7[2](v7, v35[5], v29[5], v25[3], v19[5]);
  }
  else
  {
    uint64_t v11 = DALoggingwithCategory();
    os_log_type_t v12 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_232AD4000, v11, v12, "No results block provided.", buf, 2u);
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void __65__ESDConnection_externalIdentificationForAccountID_resultsBlock___block_invoke(void *a1, void *a2)
{
  id v11 = a2;
  if ([v11 count])
  {
    uint64_t v3 = [v11 objectForKeyedSubscript:*MEMORY[0x263F38FB0]];
    uint64_t v4 = *(void *)(a1[5] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = [v11 objectForKeyedSubscript:*MEMORY[0x263F38FB8]];
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v6 integerValue];

    uint64_t v7 = [v11 objectForKeyedSubscript:*MEMORY[0x263F38FA8]];
    uint64_t v8 = a1[7];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:28 userInfo:0];
    uint64_t v8 = a1[4];
  }
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
}

- (ESDConnection)init
{
  uint64_t v3 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Should never call -init on DADConnection.  Use +sharedConnection... instead." userInfo:0];
  [v3 raise];

  return 0;
}

- (id)_init
{
  v26.receiver = self;
  v26.super_class = (Class)ESDConnection;
  uint64_t v2 = [(ESDConnection *)&v26 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.dataaccess.muckingWithConn", 0);
    muckingWithConuint64_t n = v2->_muckingWithConn;
    v2->_muckingWithConuint64_t n = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dataaccess.muckingWithInFlightCollections", 0);
    muckingWithInFlightCollections = v2->_muckingWithInFlightCollections;
    v2->_muckingWithInFlightCollections = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    accountIdsWithAlreadyResetCerts = v2->_accountIdsWithAlreadyResetCerts;
    v2->_accountIdsWithAlreadyResetCerts = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    accountIdsWithAlreadyResetThrottleTimers = v2->_accountIdsWithAlreadyResetThrottleTimers;
    v2->_accountIdsWithAlreadyResetThrottleTimers = (NSMutableSet *)v9;

    uint64_t v11 = objc_opt_new();
    inFlightSearchQueries = v2->_inFlightSearchQueries;
    v2->_inFlightSearchQueries = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    inFlightFolderChanges = v2->_inFlightFolderChanges;
    v2->_inFlightFolderChanges = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    inFlightAttachmentDownloads = v2->_inFlightAttachmentDownloads;
    v2->_inFlightAttachmentDownloads = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    inFlightCalendarAvailabilityRequests = v2->_inFlightCalendarAvailabilityRequests;
    v2->_inFlightCalendarAvailabilityRequests = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    inFlightCalendarDirectorySearches = v2->_inFlightCalendarDirectorySearches;
    v2->_inFlightCalendarDirectorySearches = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    inFlightShareRequests = v2->_inFlightShareRequests;
    v2->_inFlightShareRequests = (NSMutableDictionary *)v21;

    uint64_t v23 = objc_opt_new();
    inFlightOofSettingsRequests = v2->_inFlightOofSettingsRequests;
    v2->_inFlightOofSettingsRequests = (NSMutableDictionary *)v23;

    [(ESDConnection *)v2 _registerForAppResumedNotification];
  }
  return v2;
}

- (void)dealloc
{
  [(ESDConnection *)self _tearDownInFlightObjects];
  dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ESDConnection;
  [(ESDConnection *)&v4 dealloc];
}

- (void)_resetCertWarningsForAccountId:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = DALoggingwithCategory();
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v9, v10))
  {
    accountIdsWithAlreadyResetCerts = self->_accountIdsWithAlreadyResetCerts;
    *(_DWORD *)long long buf = 138412290;
    id v22 = accountIdsWithAlreadyResetCerts;
    _os_log_impl(&dword_232AD4000, v9, v10, "in _resetCertWarningsForAccount, _accountIdsWithAlreadyResetCerts is %@", buf, 0xCu);
  }

  os_log_type_t v12 = self;
  objc_sync_enter(v12);
  if (v8) {
    int v13 = [(NSMutableSet *)v12->_accountIdsWithAlreadyResetCerts containsObject:v8] ^ 1;
  }
  else {
    int v13 = 0;
  }
  objc_sync_exit(v12);

  if (((v8 != 0) & (v13 | v5)) == 1)
  {
    os_log_type_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", a4, *MEMORY[0x263F39170], *MEMORY[0x263F38FA0], *MEMORY[0x263F390A8], *MEMORY[0x263F39250], v8);
    v20[2] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:3];

    id v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v17 = [(ESDConnection *)v12 _connectionForExchange];
    xpc_connection_send_message(v17, v16);

    uint64_t v18 = v12;
    objc_sync_enter(v18);
    [v18[4] addObject:v8];
    objc_sync_exit(v18);
  }
}

- (void)_resetThrottleTimersForAccountId:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v6, v7))
  {
    Name = sel_getName(a2);
    accountIdsWithAlreadyResetThrottleTimers = self->_accountIdsWithAlreadyResetThrottleTimers;
    *(_DWORD *)long long buf = 136315394;
    uint64_t v21 = Name;
    __int16 v22 = 2112;
    uint64_t v23 = accountIdsWithAlreadyResetThrottleTimers;
    _os_log_impl(&dword_232AD4000, v6, v7, "in %s, _accountIdsWithAlreadyResetThrottleTimers is %@", buf, 0x16u);
  }

  os_log_type_t v10 = self;
  objc_sync_enter(v10);
  if (!v5)
  {
    objc_sync_exit(v10);
    os_log_type_t v14 = v10;
    goto LABEL_7;
  }
  char v11 = [(NSMutableSet *)v10->_accountIdsWithAlreadyResetThrottleTimers containsObject:v5];
  objc_sync_exit(v10);

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = *MEMORY[0x263F39258];
    uint64_t v13 = *MEMORY[0x263F38FA0];
    v18[0] = *MEMORY[0x263F39170];
    v18[1] = v13;
    v19[0] = v12;
    v19[1] = v5;
    os_log_type_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    id v16 = [(ESDConnection *)v10 _connectionForExchange];
    xpc_connection_send_message(v16, v15);

    uint64_t v17 = v10;
    objc_sync_enter(v17);
    [(NSMutableSet *)v10->_accountIdsWithAlreadyResetThrottleTimers addObject:v5];
    objc_sync_exit(v17);

LABEL_7:
  }
}

- (void)resetTimersAndWarnings
{
  dispatch_queue_t v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_232AD4000, v3, v4, "Resetting shouldResetCertWarnings and throttle timers", v6, 2u);
  }

  id v5 = self;
  objc_sync_enter(v5);
  [(NSMutableSet *)v5->_accountIdsWithAlreadyResetCerts removeAllObjects];
  [(NSMutableSet *)v5->_accountIdsWithAlreadyResetThrottleTimers removeAllObjects];
  objc_sync_exit(v5);
}

- (void)_registerForAppResumedNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_resetTimersAndWarnings name:@"UIApplicationWillEnterForegroundNotification" object:0];
}

- (void)_dispatchMessage:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F39170]];
  if ([v6 isEqualToString:*MEMORY[0x263F39100]])
  {
    [(ESDConnection *)self _foldersUpdated:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F391E0]])
  {
    [(ESDConnection *)self _policyKeyChanged:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F39150]])
  {
    [(ESDConnection *)self _logDataAccessStatus:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F39288]])
  {
    [(ESDConnection *)self _serverContactsSearchQueryFinished:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F390D8]])
  {
    [(ESDConnection *)self _folderChangeFinished:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F39120]])
  {
    [(ESDConnection *)self _getStatusReportsFromClient:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F38FF8]])
  {
    [(ESDConnection *)self _downloadProgress:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F38FE8]])
  {
    [(ESDConnection *)self _downloadFinished:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F39080]])
  {
    [(ESDConnection *)self _shareResponseFinished:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F391A8]])
  {
    [(ESDConnection *)self _oofSettingsRequestsFinished:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F39030]])
  {
    [(ESDConnection *)self _calendarAvailabilityRequestReturnedResults:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F39020]])
  {
    [(ESDConnection *)self _calendarAvailabilityRequestFinished:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F39070]])
  {
    [(ESDConnection *)self _calendarDirectorySearchReturnedResults:v4];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F39048]])
  {
    [(ESDConnection *)self _calendarDirectorySearchFinished:v4];
  }
  else
  {
    os_log_type_t v7 = DALoggingwithCategory();
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_232AD4000, v7, v8, "unknown request sent to connection.", (uint8_t *)&v10, 2u);
    }

    uint64_t v9 = DALoggingwithCategory();
    if (os_log_type_enabled(v9, v8))
    {
      int v10 = 138412290;
      char v11 = v5;
      _os_log_impl(&dword_232AD4000, v9, v8, "request: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightOofSettingsRequests, 0);
  objc_storeStrong((id *)&self->_inFlightShareRequests, 0);
  objc_storeStrong((id *)&self->_inFlightCalendarDirectorySearches, 0);
  objc_storeStrong((id *)&self->_inFlightCalendarAvailabilityRequests, 0);
  objc_storeStrong((id *)&self->_inFlightAttachmentDownloads, 0);
  objc_storeStrong((id *)&self->_inFlightFolderChanges, 0);
  objc_storeStrong((id *)&self->_inFlightSearchQueries, 0);
  objc_storeStrong(&self->_statusReportBlock, 0);
  objc_storeStrong((id *)&self->_accountIdsWithAlreadyResetThrottleTimers, 0);
  objc_storeStrong((id *)&self->_accountIdsWithAlreadyResetCerts, 0);
  objc_storeStrong((id *)&self->_muckingWithInFlightCollections, 0);
  objc_storeStrong((id *)&self->_muckingWithConn, 0);
  objc_storeStrong((id *)&self->_connExchange, 0);
}

@end