@interface CDDADConnection
+ (id)sharedConnection;
+ (unint64_t)_nextStopMonitoringStatusToken;
- (BOOL)_performOofSettingsRequest:(id)a3 forAccountWithID:(id)a4 forUpdate:(BOOL)a5;
- (BOOL)_validateXPCReply:(id)a3;
- (BOOL)performServerContactsSearch:(id)a3 forAccountWithID:(id)a4;
- (BOOL)processFolderChange:(id)a3 forAccountWithID:(id)a4;
- (BOOL)processMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7;
- (BOOL)registerForInterrogationWithBlock:(id)a3;
- (BOOL)registered;
- (BOOL)requestPolicyUpdateForAccountID:(id)a3;
- (BOOL)resumeWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4;
- (BOOL)resumeWatchingFoldersWithSyncKeyMap:(id)a3 forAccountID:(id)a4;
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
- (BOOL)watchFoldersWithSyncKeyMap:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5;
- (CDDADConnection)init;
- (id)_connection;
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
- (void)_folderChangeFinished:(id)a3;
- (void)_foldersUpdated:(id)a3;
- (void)_getStatusReportsFromClient:(id)a3;
- (void)_initializeConnection;
- (void)_initializeConnectionWithXPCEndpoint:(id)a3;
- (void)_initializeXPCConnection:(id)a3;
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
- (void)removeStoresForAccountWithID:(id)a3;
- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6;
- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6;
- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3;
- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3;
- (void)resetTimersAndWarnings;
- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (void)setRegistered:(BOOL)a3;
@end

@implementation CDDADConnection

- (void)_tearDownInFlightObjects
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  uint64_t v117 = 0;
  v118 = &v117;
  uint64_t v119 = 0x3032000000;
  v120 = __Block_byref_object_copy_;
  v121 = __Block_byref_object_dispose_;
  id v122 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke;
  block[3] = &unk_1E6573B48;
  block[5] = &v117;
  block[4] = self;
  dispatch_sync(muckingWithInFlightCollections, block);
  v4 = (void *)v118[5];
  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:0 userInfo:0];
  [v4 makeObjectsPerformSelector:sel_sendFinishedToConsumerWithError_ withObject:v5];

  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x3032000000;
  v113 = __Block_byref_object_copy_;
  v114 = __Block_byref_object_dispose_;
  id v115 = 0;
  v6 = self->_muckingWithInFlightCollections;
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_105;
  v109[3] = &unk_1E6573B48;
  v109[5] = &v110;
  v109[4] = self;
  dispatch_sync(v6, v109);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v7 = (id)v111[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v105 objects:v128 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v106 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        v12 = [v11 consumer];
        v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:0 userInfo:0];
        [v12 folderChange:v11 finishedWithStatus:0 error:v13];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v105 objects:v128 count:16];
    }
    while (v8);
  }

  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x3032000000;
  v102 = __Block_byref_object_copy_;
  v103 = __Block_byref_object_dispose_;
  id v104 = 0;
  v14 = self->_muckingWithInFlightCollections;
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_106;
  v98[3] = &unk_1E6573B48;
  v98[5] = &v99;
  v98[4] = self;
  dispatch_sync(v14, v98);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v15 = (id)v100[5];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v94 objects:v127 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v95 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v94 + 1) + 8 * j);
        v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:0 userInfo:0];
        [v19 finishedWithError:v20];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v94 objects:v127 count:16];
    }
    while (v16);
  }

  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy_;
  v92 = __Block_byref_object_dispose_;
  id v93 = 0;
  v21 = self->_muckingWithInFlightCollections;
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_107;
  v87[3] = &unk_1E6573B48;
  v87[5] = &v88;
  v87[4] = self;
  dispatch_sync(v21, v87);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v22 = (id)v89[5];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v83 objects:v126 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v84;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v84 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = *(void **)(*((void *)&v83 + 1) + 8 * k);
        v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v26 finishedWithError:v27];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v83 objects:v126 count:16];
    }
    while (v23);
  }

  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x3032000000;
  v80 = __Block_byref_object_copy_;
  v81 = __Block_byref_object_dispose_;
  id v82 = 0;
  v28 = self->_muckingWithInFlightCollections;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_108;
  v76[3] = &unk_1E6573B48;
  v76[4] = self;
  v76[5] = &v77;
  dispatch_sync(v28, v76);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v29 = (id)v78[5];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v125 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v73;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v73 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = *(void **)(*((void *)&v72 + 1) + 8 * m);
        v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v33 finishedWithError:v34 exceededResultLimit:0];
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v125 count:16];
    }
    while (v30);
  }

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy_;
  v70 = __Block_byref_object_dispose_;
  id v71 = 0;
  v35 = self->_muckingWithInFlightCollections;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_109;
  v65[3] = &unk_1E6573B48;
  v65[4] = self;
  v65[5] = &v66;
  dispatch_sync(v35, v65);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v36 = (id)v67[5];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v61 objects:v124 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v62;
    do
    {
      for (uint64_t n = 0; n != v37; ++n)
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = *(void **)(*((void *)&v61 + 1) + 8 * n);
        v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v40 finishedWithError:v41];
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v61 objects:v124 count:16];
    }
    while (v37);
  }

  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy_;
  v59 = __Block_byref_object_dispose_;
  id v60 = 0;
  v42 = self->_muckingWithInFlightCollections;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_110;
  v54[3] = &unk_1E6573B48;
  v54[4] = self;
  v54[5] = &v55;
  dispatch_sync(v42, v54);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v43 = (id)v56[5];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v50 objects:v123 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v51;
    do
    {
      for (iuint64_t i = 0; ii != v44; ++ii)
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(v43);
        }
        v47 = *(void **)(*((void *)&v50 + 1) + 8 * ii);
        v48 = objc_msgSend(v47, "consumer", (void)v50);
        v49 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v48 oofRequestInfo:v47 finishedWithResult:0 error:v49];
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v50 objects:v123 count:16];
    }
    while (v44);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v110, 8);

  _Block_object_dispose(&v117, 8);
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing ALL search queries", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_105(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Failing all folder changes", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_106(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing all attachment downloads", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_107(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing all calendar availability lookups", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_108(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing all calendar search requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_109(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing all share requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_110(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing all settings requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
}

- (void)_serverDiedWithReason:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 == (id)MEMORY[0x1E4F14520])
  {
    v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v7 = "Daemon died, cleaning up.";
      uint64_t v8 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v4 == (id)MEMORY[0x1E4F14528])
  {
    v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      id v7 = "LOOK AT ME!!!! dataaccessd couldn't be started.  We won't try again.  If you're seeing this, get ready for some pain";
      uint64_t v8 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  [(CDDADConnection *)self _tearDownInFlightObjects];
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"DataAccessMonitoringConnectionFailed" object:0];

  [(CDDADConnection *)self setRegistered:0];
}

- (id)_connection
{
  conuint64_t n = self->_conn;
  if (!conn)
  {
    [(CDDADConnection *)self _initializeConnection];
    conuint64_t n = self->_conn;
  }

  return conn;
}

- (void)_initializeConnection
{
  muckingWithConuint64_t n = self->_muckingWithConn;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CDDADConnection__initializeConnection__block_invoke;
  block[3] = &unk_1E6573B20;
  block[4] = self;
  dispatch_sync(muckingWithConn, block);
}

void __40__CDDADConnection__initializeConnection__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (const char *)[@"com.apple.remindd.dataaccess" UTF8String];
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v2, v3, 0);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = mach_service;

  id v7 = *(void **)(a1 + 32);
  if (v7[1])
  {
    objc_msgSend(v7, "_initializeXPCConnection:");
  }
  else
  {
    uint64_t v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      uint64_t v10 = @"com.apple.remindd.dataaccess";
      _os_log_impl(&dword_1C8854000, v8, OS_LOG_TYPE_ERROR, "Couldn't create a connection to [%@]", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_initializeConnectionWithXPCEndpoint:(id)a3
{
  id v4 = a3;
  muckingWithConuint64_t n = self->_muckingWithConn;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CDDADConnection__initializeConnectionWithXPCEndpoint___block_invoke;
  v7[3] = &unk_1E6573AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(muckingWithConn, v7);
}

void __56__CDDADConnection__initializeConnectionWithXPCEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
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
    id v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_ERROR, "Couldn't create a connection to endpoint: [%@]", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_initializeXPCConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CDDADConnection__initializeXPCConnection___block_invoke;
  v5[3] = &unk_1E6573B70;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  xpc_connection_resume(v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__CDDADConnection__initializeXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x1CB770B20]();
  if (v3 == MEMORY[0x1E4F145A8])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _serverDiedWithReason:v5];
  }
  else
  {
    if (v3 != MEMORY[0x1E4F14590]) {
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
  uint64_t v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __56__CDDADConnection__createReplyToRequest_withProperties___block_invoke;
  applier[3] = &unk_1E6573B98;
  id v8 = reply;
  id v11 = v8;
  xpc_dictionary_apply(v7, applier);

  return v8;
}

uint64_t __56__CDDADConnection__createReplyToRequest_withProperties___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

- (id)decodedErrorFromData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v10 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v10];
    id v5 = v10;
    if (!v4)
    {
      id v6 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_DEFAULT, "Unable to read data to decode error: %@", buf, 0xCu);
      }
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"root"];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_policyKeyChanged:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CDDADConnection__policyKeyChanged___block_invoke;
  block[3] = &unk_1E6573B20;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__CDDADConnection__policyKeyChanged___block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v1 = [v0 objectForKeyedSubscript:@"kDAEPolicyKeyKey"];
  xpc_connection_t v2 = [v0 objectForKeyedSubscript:@"kDAEPolicyErrorCodeKey"];
  id v3 = [v0 objectForKeyedSubscript:@"kDAEAccountIdKey"];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (v2)
    {
      id v10 = @"ASPolicyKey";
      id v11 = @"ASPolicyErrorCodeKey";
      id v12 = v1;
      uint64_t v13 = v2;
      id v5 = (void *)MEMORY[0x1E4F1C9E8];
      id v6 = &v12;
      uint64_t v7 = &v10;
      uint64_t v8 = 2;
    }
    else
    {
      v14 = @"ASPolicyKey";
      id v15 = v1;
      id v5 = (void *)MEMORY[0x1E4F1C9E8];
      id v6 = &v15;
      uint64_t v7 = &v14;
      uint64_t v8 = 1;
    }
    uint64_t v9 = objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, v8, v10, v11, v12, v13, v14, v15);
    [v4 postNotificationName:@"ASPolicyKeyChangedNotification" object:v3 userInfo:v9];
  }
  else
  {
    id v4 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v0;
      _os_log_impl(&dword_1C8854000, v4, OS_LOG_TYPE_ERROR, "Malformed callback message from dataaccess daemon: bad account id (%@)", buf, 0xCu);
    }
  }
}

- (void)_foldersUpdated:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CDDADConnection__foldersUpdated___block_invoke;
  block[3] = &unk_1E6573B20;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __35__CDDADConnection__foldersUpdated___block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v1 = [v0 objectForKeyedSubscript:@"kDAEFolderIDsKey"];
  uint64_t v2 = [v0 objectForKeyedSubscript:@"kDAEAccountIdKey"];
  id v3 = (void *)v2;
  if (!v1)
  {
    id v4 = DALoggingwithCategory(0);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    id v10 = v0;
    id v6 = "Malformed callback message from dataaccess daemon: no folders (%@)";
LABEL_8:
    _os_log_impl(&dword_1C8854000, v4, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v2)
  {
    id v4 = DALoggingwithCategory(0);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    id v10 = v0;
    id v6 = "Malformed callback message from dataaccess daemon: bad account id (%@)";
    goto LABEL_8;
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v7[0] = @"DAChangedFolders";
  v7[1] = @"DAChangedAccountID";
  v8[0] = v1;
  v8[1] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v4 postNotificationName:@"DataAccessMonitoredFolderUpdated" object:0 userInfo:v5];

LABEL_9:
}

- (void)_logDataAccessStatus:(id)a3
{
}

void __40__CDDADConnection__logDataAccessStatus___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"ASClientAccountDumpStatusNotification" object:0];
}

- (void)_serverContactsSearchQueryFinished:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:@"kDAESearchIDKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v8 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C8854000, v8, OS_LOG_TYPE_DEBUG, "doServerContactsSearchQueryFinishedWithStatus called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CDDADConnection__serverContactsSearchQueryFinished___block_invoke;
  block[3] = &unk_1E6573BE0;
  p_long long buf = &buf;
  void block[4] = self;
  id v10 = v6;
  id v24 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:@"kDAESearchResultsKey"];
    if (v11)
    {
      id v22 = 0;
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v11 error:&v22];
      uint64_t v13 = v22;
      if (!v12)
      {
        v14 = DALoggingwithCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v26 = 138412290;
          v27 = v13;
          _os_log_impl(&dword_1C8854000, v14, OS_LOG_TYPE_DEFAULT, "Unable to read data to decode search results: %@", v26, 0xCu);
        }
      }
      id v15 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      uint64_t v18 = [v12 decodeObjectOfClasses:v17 forKey:@"root"];
    }
    else
    {
      uint64_t v13 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1C8854000, v13, OS_LOG_TYPE_INFO, "Could not deserialize search results from the xpc message", v26, 2u);
      }
      uint64_t v18 = 0;
    }

    v19 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v26 = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1C8854000, v19, OS_LOG_TYPE_DEBUG, "Search results: %@", v26, 0xCu);
    }

    [*(id *)(*((void *)&buf + 1) + 40) sendResultsToConsumer:v18];
    v20 = *(void **)(*((void *)&buf + 1) + 40);
    v21 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"DAErrorDomain", (int)objc_msgSend(v7, "intValue"), 0);
    [v20 sendFinishedToConsumerWithError:v21];
  }
  else
  {
    uint64_t v18 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1C8854000, v18, OS_LOG_TYPE_ERROR, "received results for an unknown search query", v26, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __54__CDDADConnection__serverContactsSearchQueryFinished___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a1[5];
    uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing query %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return [*(id *)(a1[4] + 56) removeObjectForKey:a1[5]];
}

- (void)_folderChangeFinished:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v5 = [v4 objectForKeyedSubscript:@"kDAETaskIDKey"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"kDAEFolderIDKey"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"kDAEFolderNameKey"];
  int v9 = [v4 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  uint64_t v10 = [(CDDADConnection *)self decodedErrorFromData:v9];

  __int16 v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1C8854000, v11, OS_LOG_TYPE_DEBUG, "folderChange finished with status %@, error %@", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CDDADConnection__folderChangeFinished___block_invoke;
  block[3] = &unk_1E6573BE0;
  v21 = buf;
  void block[4] = self;
  id v13 = v5;
  id v20 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  uint64_t v14 = *(void *)&buf[8];
  id v15 = *(void **)(*(void *)&buf[8] + 40);
  if (v15)
  {
    if (v7)
    {
      [v15 setFolderId:v7];
      uint64_t v14 = *(void *)&buf[8];
    }
    if (v8)
    {
      [*(id *)(v14 + 40) setDisplayName:v8];
      uint64_t v14 = *(void *)&buf[8];
    }
    uint64_t v16 = [*(id *)(v14 + 40) consumer];
    -[NSObject folderChange:finishedWithStatus:error:](v16, "folderChange:finishedWithStatus:error:", *(void *)(*(void *)&buf[8] + 40), (int)[v6 intValue], v10);
  }
  else
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1C8854000, v16, OS_LOG_TYPE_ERROR, "received results for an unknown folderChange", v18, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __41__CDDADConnection__folderChangeFinished___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a1[5];
    uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing folder change %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return [*(id *)(a1[4] + 64) removeObjectForKey:a1[5]];
}

- (void)_getStatusReportsFromClient:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __47__CDDADConnection__getStatusReportsFromClient___block_invoke;
  v7[3] = &unk_1E6573AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__CDDADConnection__getStatusReportsFromClient___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
            uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "dictionaryRepresentation", (void)v15);
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
  v19 = @"kDAEStatusReportsKey";
  id v20 = v2;
  __int16 v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, (void)v15);
  uint64_t v12 = (void *)[*(id *)(a1 + 32) _createReplyToRequest:*(void *)(a1 + 40) withProperties:v11];
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 40));
  uint64_t v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (*(_xpc_connection_s **)(*(void *)(a1 + 32) + 8) == v13) {
    xpc_connection_send_message(v13, v12);
  }
}

- (void)_downloadProgress:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  long long v15 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v4 = [v15 objectForKeyedSubscript:@"kDAEAttachmentIdsKey"];
  id v5 = [v15 objectForKeyedSubscript:@"kDAEDownloadedBytesKey"];
  uint64_t v6 = [v5 longLongValue];

  uint64_t v7 = [v15 objectForKeyedSubscript:@"kDAETotalBytesKey"];
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
        v19 = &v18;
        uint64_t v20 = 0x3032000000;
        v21 = __Block_byref_object_copy_;
        uint64_t v22 = __Block_byref_object_dispose_;
        id v23 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __37__CDDADConnection__downloadProgress___block_invoke;
        block[3] = &unk_1E6573BE0;
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

uint64_t __37__CDDADConnection__downloadProgress___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)_downloadFinished:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v4 = [v13 objectForKeyedSubscript:@"kDAEAttachmentIdsKey"];
  id v5 = [v13 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  uint64_t v6 = [(CDDADConnection *)self decodedErrorFromData:v5];

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
        v19 = __Block_byref_object_copy_;
        uint64_t v20 = __Block_byref_object_dispose_;
        id v21 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __37__CDDADConnection__downloadFinished___block_invoke;
        block[3] = &unk_1E6573BE0;
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

uint64_t __37__CDDADConnection__downloadFinished___block_invoke(void *a1)
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
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kDAESharedCalendarActionIdKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  uint64_t v8 = [(CDDADConnection *)self decodedErrorFromData:v7];

  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CDDADConnection__shareResponseFinished___block_invoke;
  block[3] = &unk_1E6573BE0;
  uint64_t v13 = &v14;
  void block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v15[5] finishedWithError:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __42__CDDADConnection__shareResponseFinished___block_invoke(void *a1)
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kDAEOofRequestIDKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v8 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C8854000, v8, OS_LOG_TYPE_DEBUG, "_oofSettingsRequestsFinished called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CDDADConnection__oofSettingsRequestsFinished___block_invoke;
  block[3] = &unk_1E6573BE0;
  p_long long buf = &buf;
  void block[4] = self;
  id v10 = v6;
  id v25 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    if (v7)
    {
      if ([v7 intValue] == 2)
      {
        uint64_t v11 = [v5 objectForKeyedSubscript:@"kDAEOofIsUpdateKey"];
        id v12 = v11;
        if (v11 && [v11 BOOLValue])
        {
          uint64_t v13 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
          [v13 oofRequestInfo:*(void *)(*((void *)&buf + 1) + 40) finishedWithResult:0 error:0];
        }
        else
        {
          uint64_t v13 = [v5 objectForKeyedSubscript:@"kDAEOofSettingsResultKey"];
          if (v13)
          {
            id v19 = [[DAOofParams alloc] initWithDictionary:v13];
            uint64_t v20 = DALoggingwithCategory(0);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t v27 = 138412290;
              v28 = v19;
              _os_log_impl(&dword_1C8854000, v20, OS_LOG_TYPE_DEBUG, "Oof settings request results: %@", v27, 0xCu);
            }

            id v21 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
            [v21 oofRequestInfo:*(void *)(*((void *)&buf + 1) + 40) finishedWithResult:v19 error:0];
          }
          else
          {
            long long v22 = DALoggingwithCategory(0);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v27 = 0;
              _os_log_impl(&dword_1C8854000, v22, OS_LOG_TYPE_INFO, "Could not deserialize search results from the xpc message", v27, 2u);
            }

            id v19 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
            uint64_t v23 = *(void *)(*((void *)&buf + 1) + 40);
            id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:62 userInfo:0];
            [(DAOofParams *)v19 oofRequestInfo:v23 finishedWithResult:0 error:v21];
          }
        }
      }
      else
      {
        id v12 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
        uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40);
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"DAErrorDomain", (int)objc_msgSend(v7, "intValue"), 0);
        [v12 oofRequestInfo:v17 finishedWithResult:0 error:v18];
      }
    }
    else
    {
      uint64_t v14 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl(&dword_1C8854000, v14, OS_LOG_TYPE_INFO, "Status missing from the xpc message", v27, 2u);
      }

      id v12 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
      uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:62 userInfo:0];
      [v12 oofRequestInfo:v15 finishedWithResult:0 error:v16];
    }
  }
  else
  {
    id v12 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_1C8854000, v12, OS_LOG_TYPE_ERROR, "received results for an unknown oof settings request", v27, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __48__CDDADConnection__oofSettingsRequestsFinished___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 104) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a1[5];
    uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Removing from inflight dictionary: oof settings request %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return [*(id *)(a1[4] + 104) removeObjectForKey:a1[5]];
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_124);
  }
  [(id)sharedConnection_gDADConnection reallyRegisterForInterrogation];
  uint64_t v2 = (void *)sharedConnection_gDADConnection;

  return v2;
}

uint64_t __35__CDDADConnection_sharedConnection__block_invoke()
{
  sharedConnection_gDADConnectiouint64_t n = [[CDDADConnection alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  return [(CDDADConnection *)self watchFoldersWithKeys:a3 forAccountID:a4 persistent:0];
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5
{
  BOOL v19 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
        uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
        [v9 setObject:v16 forKey:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  BOOL v17 = [(CDDADConnection *)self watchFoldersWithSyncKeyMap:v9 forAccountID:v8 persistent:v19];
  return v17;
}

- (BOOL)watchFoldersWithSyncKeyMap:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5
{
  BOOL v5 = a5;
  v21[4] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  [(CDDADConnection *)self _resetCertWarningsForAccountId:v8 andDataclasses:127 isUserRequested:0];
  v20[0] = @"kDAEMessageNameKey";
  v20[1] = @"kDAEAccountIdKey";
  v21[0] = @"kDAEBeginMonitoringFolders";
  v21[1] = v8;
  v21[2] = v9;
  v20[2] = @"kDAESyncKeyMapKey";
  v20[3] = @"kDAEPersistentMonitoringKey";
  id v10 = [NSNumber numberWithBool:v5];
  v21[3] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

  uint64_t v12 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    BOOL v19 = "-[CDDADConnection watchFoldersWithSyncKeyMap:forAccountID:persistent:]";
    _os_log_impl(&dword_1C8854000, v12, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v14 = [(CDDADConnection *)self _connection];
  xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(v14, v13);

  BOOL v16 = [(CDDADConnection *)self _validateXPCReply:v15];
  return v16;
}

- (BOOL)resumeWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        xpc_object_t v15 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v18);
        [v8 setObject:v15 forKey:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  BOOL v16 = [(CDDADConnection *)self resumeWatchingFoldersWithSyncKeyMap:v8 forAccountID:v7];
  return v16;
}

- (BOOL)resumeWatchingFoldersWithSyncKeyMap:(id)a3 forAccountID:(id)a4
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_conn)
  {
    [(CDDADConnection *)self _resetCertWarningsForAccountId:v7 andDataclasses:127 isUserRequested:0];
    v17[0] = @"kDAEMessageNameKey";
    v17[1] = @"kDAEAccountIdKey";
    v18[0] = @"kDAEResumeMonitoringFolders";
    v18[1] = v7;
    v17[2] = @"kDAESyncKeyMapKey";
    v18[2] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    id v9 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      BOOL v16 = "-[CDDADConnection resumeWatchingFoldersWithSyncKeyMap:forAccountID:]";
      _os_log_impl(&dword_1C8854000, v9, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v11 = [(CDDADConnection *)self _connection];
    xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(v11, v10);

    BOOL v13 = [(CDDADConnection *)self _validateXPCReply:v12];
  }
  else
  {
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1C8854000, v8, OS_LOG_TYPE_INFO, "[DADConnection resumeWatchingFoldersWithKeys:forAccountID] called without a connection. Will not resume.", (uint8_t *)&v15, 2u);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)suspendWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"kDAEMessageNameKey";
  v18[1] = @"kDAEAccountIdKey";
  v19[0] = @"kDAESuspendMonitoringFolders";
  v19[1] = a4;
  v18[2] = @"kDAEFolderIDsKey";
  v19[2] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v19 forKeys:v18 count:3];

  uint64_t v10 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    BOOL v17 = "-[CDDADConnection suspendWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v12 = [(CDDADConnection *)self _connection];
  xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(v12, v11);

  BOOL v14 = [(CDDADConnection *)self _validateXPCReply:v13];
  return v14;
}

- (BOOL)stopWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"kDAEMessageNameKey";
  v18[1] = @"kDAEAccountIdKey";
  v19[0] = @"kDAEStopMonitoringFolders";
  v19[1] = a4;
  v18[2] = @"kDAEFolderIDsKey";
  v19[2] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v19 forKeys:v18 count:3];

  uint64_t v10 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    BOOL v17 = "-[CDDADConnection stopWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v12 = [(CDDADConnection *)self _connection];
  xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(v12, v11);

  BOOL v14 = [(CDDADConnection *)self _validateXPCReply:v13];
  return v14;
}

- (BOOL)_validateXPCReply:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = MEMORY[0x1CB770B20]();
  if (v4 == MEMORY[0x1E4F14590])
  {
    id v6 = _CFXPCCreateCFObjectFromXPCObject();
    id v8 = [v6 objectForKeyedSubscript:@"kDAEStatusKey"];
    int v9 = [v8 intValue];
    BOOL v7 = v9 == 2;
    if (v9 != 2)
    {
      uint64_t v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        uint64_t v13 = (uint64_t)v8;
        _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_ERROR, "XPC Reply Failure. Status Code: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v5 = v4;
    id v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_ERROR, "Unsupported XPC reply type. Reply Type: %@", (uint8_t *)&v12, 0xCu);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)requestPolicyUpdateForAccountID:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CDDADConnection *)self _resetCertWarningsForAccountId:v4 andDataclasses:127 isUserRequested:0];
  v9[0] = @"kDAEMessageNameKey";
  v9[1] = @"kDAEAccountIdKey";
  v10[0] = @"kDAERequestPolicyUpdate";
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v7 = [(CDDADConnection *)self _connection];
  xpc_connection_send_message(v7, v6);

  return 1;
}

- (id)currentPolicyKeyForAccountID:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  long long v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v22[0] = @"kDAEMessageNameKey";
  v22[1] = @"kDAEAccountIdKey";
  v23[0] = @"kDAEGetCurrentPolicyKey";
  v23[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  id v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(CDDADConnection *)self _connection];
  int v9 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __48__CDDADConnection_currentPolicyKeyForAccountID___block_invoke;
  handler[3] = &unk_1E6573C08;
  int v15 = &v16;
  uint64_t v10 = v7;
  uint64_t v14 = v10;
  xpc_connection_send_message_with_reply(v8, v6, v9, handler);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v11;
}

void __48__CDDADConnection_currentPolicyKeyForAccountID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1CB770B20]() == MEMORY[0x1E4F14590])
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = [v4 objectForKeyedSubscript:@"kDAEPolicyKeyKey"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [v4 objectForKeyedSubscript:@"kDAEStatusKey"];
    int v9 = v8;
    if (!v8 || [v8 intValue] != 2)
    {
      uint64_t v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315394;
        int v12 = "-[CDDADConnection currentPolicyKeyForAccountID:]_block_invoke";
        __int16 v13 = 2112;
        uint64_t v14 = v9;
        _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (unint64_t)_nextStopMonitoringStatusToken
{
  os_unfair_lock_lock((os_unfair_lock_t)&_nextStopMonitoringStatusToken_nextTokenLock);
  unint64_t v2 = ++_nextStopMonitoringStatusToken_nextToken;
  os_unfair_lock_unlock((os_unfair_lock_t)&_nextStopMonitoringStatusToken_nextTokenLock);
  return v2;
}

- (void)_requestDaemonChangeAgentMonitoringStatus:(BOOL)a3 withToken:(unint64_t)a4 waitForReply:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v9 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = @"stop";
    if (v7) {
      uint64_t v10 = @"start";
    }
    int v21 = 138412290;
    long long v22 = (const char *)v10;
    _os_log_impl(&dword_1C8854000, v9, OS_LOG_TYPE_INFO, "Requesting that DataAccess %@ monitoring agents.", (uint8_t *)&v21, 0xCu);
  }

  int v11 = kDAEStopMonitoringAgents;
  if (v7) {
    int v11 = kDAEStartMonitoringAgents;
  }
  int v12 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:*v11 forKey:@"kDAEMessageNameKey"];
  __int16 v13 = [NSNumber numberWithUnsignedInteger:a4];
  [v12 setObject:v13 forKeyedSubscript:@"kDAEAgentMonitoringToken"];

  if (v5)
  {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kDAEAgentMonitoringNeedsReply"];
    uint64_t v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v15 = [(CDDADConnection *)self _connection];
    uint64_t v16 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v15, v14);

    if (MEMORY[0x1CB770B20](v16) == MEMORY[0x1E4F14590])
    {
      BOOL v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      uint64_t v18 = [v17 objectForKeyedSubscript:@"kDAEStatusKey"];
      long long v19 = v18;
      if (!v18 || [v18 intValue] != 2)
      {
        long long v20 = DALoggingwithCategory(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136315394;
          long long v22 = "-[CDDADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:]";
          __int16 v23 = 2112;
          long long v24 = v19;
          _os_log_impl(&dword_1C8854000, v20, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v16 = [(CDDADConnection *)self _connection];
    xpc_connection_send_message(v16, v14);
  }
}

- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3
{
}

- (unint64_t)requestDaemonStopMonitoringAgents
{
  unint64_t v3 = [(id)objc_opt_class() _nextStopMonitoringStatusToken];
  [(CDDADConnection *)self _requestDaemonChangeAgentMonitoringStatus:0 withToken:v3 waitForReply:0];
  return v3;
}

- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3
{
}

- (unint64_t)requestDaemonStopMonitoringAgentsSync
{
  unint64_t v3 = [(id)objc_opt_class() _nextStopMonitoringStatusToken];
  [(CDDADConnection *)self _requestDaemonChangeAgentMonitoringStatus:0 withToken:v3 waitForReply:1];
  return v3;
}

- (void)removeStoresForAccountWithID:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"kDAEMessageNameKey";
  v9[1] = @"kDAEAccountIdKey";
  v10[0] = @"kDAERemoveStoresForAccountWithID";
  v10[1] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];

  BOOL v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  id v8 = [(CDDADConnection *)self _connection];
  xpc_connection_send_message(v8, v7);
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 requireChangedFolders:(BOOL)a5 isUserRequested:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138413058;
    id v22 = v10;
    __int16 v23 = 2048;
    int64_t v24 = a4;
    __int16 v25 = 1024;
    BOOL v26 = v7;
    __int16 v27 = 1024;
    BOOL v28 = v6;
    _os_log_impl(&dword_1C8854000, v11, OS_LOG_TYPE_DEBUG, "updateFolderListForAccountID %@, dataclasses %lx, requireChangedFolders %d, isUserRequested %d", buf, 0x22u);
  }

  [(CDDADConnection *)self _resetCertWarningsForAccountId:v10 andDataclasses:a4 isUserRequested:v6];
  [(CDDADConnection *)self _resetThrottleTimersForAccountId:v10];
  v20[0] = @"kDAERequestFolderListUpdate";
  v20[1] = v10;
  int v12 = objc_msgSend(NSNumber, "numberWithInteger:", a4, @"kDAEMessageNameKey", @"kDAEAccountIdKey", @"kDAEDataclassesBitmaskKey");
  v20[2] = v12;
  v19[3] = @"kDAERequireChangedFoldersKey";
  __int16 v13 = [NSNumber numberWithBool:v7];
  v20[3] = v13;
  void v19[4] = @"kDAEIsUserRequestedKey";
  uint64_t v14 = [NSNumber numberWithBool:v6];
  void v20[4] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];

  uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v17 = [(CDDADConnection *)self _connection];
  xpc_connection_send_message(v17, v16);

  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  return [(CDDADConnection *)self updateFolderListForAccountID:a3 andDataclasses:a4 requireChangedFolders:0 isUserRequested:a5];
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclasses:(int64_t)a5 isUserRequested:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int v12 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138413058;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2048;
    int64_t v26 = a5;
    __int16 v27 = 1024;
    BOOL v28 = v6;
    _os_log_impl(&dword_1C8854000, v12, OS_LOG_TYPE_DEBUG, "updateContentsOfFoldersWithKeys %@ for account id %@, dataclasses 0x%lx isUserRequested %d", buf, 0x26u);
  }

  [(CDDADConnection *)self _resetCertWarningsForAccountId:v11 andDataclasses:a5 isUserRequested:v6];
  [(CDDADConnection *)self _resetThrottleTimersForAccountId:v11];
  v20[0] = @"kDAERequestFolderContentsUpdate";
  v20[1] = v11;
  __int16 v13 = objc_msgSend(NSNumber, "numberWithInteger:", a5, @"kDAEMessageNameKey", @"kDAEAccountIdKey", @"kDAEDataclassesBitmaskKey");
  v20[2] = v13;
  v19[3] = @"kDAEIsUserRequestedKey";
  uint64_t v14 = [NSNumber numberWithBool:v6];
  void v19[4] = @"kDAEFolderIDsKey";
  v20[3] = v14;
  void v20[4] = v10;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];

  uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v17 = [(CDDADConnection *)self _connection];
  xpc_connection_send_message(v17, v16);

  return 1;
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412802;
    id v19 = v8;
    __int16 v20 = 2048;
    int64_t v21 = a4;
    __int16 v22 = 1024;
    BOOL v23 = v5;
    _os_log_impl(&dword_1C8854000, v9, OS_LOG_TYPE_DEBUG, "updateContentsOfAllFoldersForAccountID %@, dataclasses 0x%lxx isUserRequested %d", buf, 0x1Cu);
  }

  [(CDDADConnection *)self _resetCertWarningsForAccountId:v8 andDataclasses:a4 isUserRequested:v5];
  [(CDDADConnection *)self _resetThrottleTimersForAccountId:v8];
  v17[0] = @"kDAERequestAllFolderContentsUpdate";
  v17[1] = v8;
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", a4, @"kDAEMessageNameKey", @"kDAEAccountIdKey", @"kDAEDataclassesBitmaskKey");
  v17[2] = v10;
  v16[3] = @"kDAEIsUserRequestedKey";
  id v11 = [NSNumber numberWithBool:v5];
  void v17[3] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  __int16 v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v14 = [(CDDADConnection *)self _connection];
  xpc_connection_send_message(v14, v13);

  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4
{
  return [(CDDADConnection *)self updateFolderListForAccountID:a3 andDataclasses:a4 isUserRequested:0];
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclass:(int64_t)a5
{
  return [(CDDADConnection *)self updateContentsOfFoldersWithKeys:a3 forAccountID:a4 andDataclass:a5 isUserRequested:0];
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclass:(int64_t)a4
{
  return [(CDDADConnection *)self updateContentsOfAllFoldersForAccountID:a3 andDataclass:a4 isUserRequested:0];
}

- (BOOL)performServerContactsSearch:(id)a3 forAccountWithID:(id)a4
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  [(CDDADConnection *)self _resetCertWarningsForAccountId:v7 andDataclasses:8 isUserRequested:0];
  if (!v7)
  {
    id v11 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v18 = "nil accountID passed to performServerContactsSearch. Refusing to attempt search";
LABEL_8:
      _os_log_impl(&dword_1C8854000, v11, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    }
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  id v8 = [v6 searchString];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    id v11 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v18 = "nil search string passed to performServerContactsSearch. Refusing to attempt search";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v30[0] = @"kDAEMessageNameKey";
  v30[1] = @"kDAEAccountIdKey";
  v31[0] = @"kDAEOpenServerContactsSearch";
  v31[1] = v7;
  v30[2] = @"kDAESearchQueryKey";
  id v10 = [v6 dictionaryRepresentation];
  v31[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

  int v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = [(CDDADConnection *)self _connection];
  uint64_t v15 = dispatch_get_global_queue(0, 0);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__CDDADConnection_performServerContactsSearch_forAccountWithID___block_invoke;
  v20[3] = &unk_1E6573C58;
  id v21 = v6;
  __int16 v22 = self;
  uint64_t v24 = &v26;
  uint64_t v16 = v13;
  BOOL v23 = v16;
  xpc_connection_send_message_with_reply(v14, v12, v15, v20);

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v17 = *((unsigned char *)v27 + 24) != 0;

LABEL_10:
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __64__CDDADConnection_performServerContactsSearch_forAccountWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1CB770B20]() == MEMORY[0x1E4F14590])
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    BOOL v5 = [v4 objectForKeyedSubscript:@"kDAESearchIDKey"];
    [*(id *)(a1 + 32) setSearchID:v5];
    id v6 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__CDDADConnection_performServerContactsSearch_forAccountWithID___block_invoke_2;
    block[3] = &unk_1E6573C30;
    id v9 = *(id *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 40);
    id v7 = v5;
    dispatch_sync(v6, block);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __64__CDDADConnection_performServerContactsSearch_forAccountWithID___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1C8854000, v2, OS_LOG_TYPE_DEBUG, "Setting search query %@ for key %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1[6] + 56) setObject:a1[4] forKeyedSubscript:a1[5]];
}

- (void)cancelServerContactsSearch:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 searchID];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [v4 setState:2];
    [v4 setConsumer:0];
    uint64_t v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134217984;
      id v24 = v4;
      _os_log_impl(&dword_1C8854000, v7, OS_LOG_TYPE_DEBUG, "Cancelling search task %p", buf, 0xCu);
    }

    __int16 v8 = [v4 searchID];
    v21[0] = @"kDAEMessageNameKey";
    v21[1] = @"kDAESearchIDKey";
    v22[0] = @"kDAECancelServerContactsSearch";
    v22[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v11 = [(CDDADConnection *)self _connection];
    xpc_connection_send_message(v11, v10);

    int v12 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_1C8854000, v12, OS_LOG_TYPE_DEBUG, "Removing search query for key %@", buf, 0xCu);
    }

    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    BOOL v17 = __46__CDDADConnection_cancelServerContactsSearch___block_invoke;
    uint64_t v18 = &unk_1E6573AF8;
    id v19 = self;
    id v20 = v8;
    id v14 = v8;
    dispatch_sync(muckingWithInFlightCollections, &v15);
    objc_msgSend(v4, "setSearchID:", &stru_1F2322E58, v15, v16, v17, v18, v19);
  }
}

uint64_t __46__CDDADConnection_cancelServerContactsSearch___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
}

- (BOOL)processMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a6;
  [(CDDADConnection *)self _resetCertWarningsForAccountId:v15 andDataclasses:5 isUserRequested:0];
  BOOL v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"kDAEProcessMeetingRequests", @"kDAEMessageNameKey", v15, @"kDAEAccountIdKey", v16, @"kDAEFolderIDKey", 0);

  if (v12) {
    [v17 setObject:v12 forKeyedSubscript:@"kDAEMeetingRequestDatasKey"];
  }
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:@"kDAEMeetingRequestIdsToClearKey"];
  }
  if (v14) {
    [v17 setObject:v14 forKeyedSubscript:@"kDAEMeetingRequestIdsToSoftClearKey"];
  }
  uint64_t v18 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v25 = "-[CDDADConnection processMeetingRequests:deliveryIdsToClear:deliveryIdsToSoftClear:inFolderWithId:forAccountWithId:]";
    _os_log_impl(&dword_1C8854000, v18, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  id v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  id v20 = [(CDDADConnection *)self _connection];
  xpc_object_t v21 = xpc_connection_send_message_with_reply_sync(v20, v19);

  BOOL v22 = [(CDDADConnection *)self _validateXPCReply:v21];
  return v22;
}

- (void)asyncProcessMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  [(CDDADConnection *)self _resetCertWarningsForAccountId:v14 andDataclasses:5 isUserRequested:0];
  id v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"kDAEAsyncProcessMeetingRequests", @"kDAEMessageNameKey", v14, @"kDAEAccountIdKey", v15, @"kDAEFolderIDKey", 0);

  if (v19) {
    [v16 setObject:v19 forKeyedSubscript:@"kDAEMeetingRequestDatasKey"];
  }
  if (v12) {
    [v16 setObject:v12 forKeyedSubscript:@"kDAEMeetingRequestIdsToClearKey"];
  }
  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:@"kDAEMeetingRequestIdsToSoftClearKey"];
  }
  BOOL v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v18 = [(CDDADConnection *)self _connection];
  xpc_connection_send_message(v18, v17);
}

- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5 forAccountID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v14 = a6;
  id v15 = objc_msgSend([v13 alloc], "initWithObjectsAndKeys:", @"kDAESetFolderIdsThatExternalClientsCareAbout", @"kDAEMessageNameKey", v14, @"kDAEAccountIdKey", 0);

  if (v10) {
    [v15 setObject:v10 forKeyedSubscript:@"kDAEMonitoredFolderIdsAddedKey"];
  }
  if (v11) {
    [v15 setObject:v11 forKeyedSubscript:@"kDAEMonitoredFolderIdsDeletedKey"];
  }
  if (v12) {
    [v15 setObject:v12 forKeyedSubscript:@"kDAEMonitoredFolderIdsTagKey"];
  }
  id v16 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    BOOL v23 = "-[CDDADConnection setFolderIdsThatExternalClientsCareAboutAdded:deleted:foldersTag:forAccountID:]";
    _os_log_impl(&dword_1C8854000, v16, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  BOOL v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v18 = [(CDDADConnection *)self _connection];
  xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(v18, v17);

  BOOL v20 = [(CDDADConnection *)self _validateXPCReply:v19];
  return v20;
}

- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6
{
  void v19[5] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v19[0] = @"kDAEReportFolderItemsSyncResult";
    v18[0] = @"kDAEMessageNameKey";
    v18[1] = @"kDAEStatusKey";
    uint64_t v9 = NSNumber;
    if (a3) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 10;
    }
    id v11 = a6;
    id v12 = a4;
    id v13 = [v9 numberWithInteger:v10];
    v19[1] = v13;
    v19[2] = v12;
    v18[2] = @"kDAEFolderIDKey";
    void v18[3] = @"kDAEFolderSyncItemsCountKey";
    id v14 = [NSNumber numberWithUnsignedInteger:a5];
    void v18[4] = @"kDAEAccountIdKey";
    v19[3] = v14;
    void v19[4] = v11;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];

    id v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    BOOL v17 = [(CDDADConnection *)self _connection];
    xpc_connection_send_message(v17, v16);
  }
}

- (void)handleURL:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 absoluteString];
  CFStringRef v5 = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, 0, @"&=", 0x8000100u);
  v9[0] = @"kDAEMessageNameKey";
  v9[1] = @"kDAEURLStringKey";
  v10[0] = @"kDAEHandleURL";
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  __int16 v8 = [(CDDADConnection *)self _connection];
  xpc_connection_send_message(v8, v7);

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

  uint64_t v10 = [(CDDADConnection *)self _connection];
  id v11 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__CDDADConnection__sendSynchronousXPCMessageWithParameters_handlerBlock___block_invoke;
  v14[3] = &unk_1E6573C80;
  dispatch_semaphore_t v15 = v8;
  id v16 = v6;
  id v12 = v8;
  id v13 = v6;
  xpc_connection_send_message_with_reply(v10, v9, v11, v14);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __73__CDDADConnection__sendSynchronousXPCMessageWithParameters_handlerBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(void *)(a1 + 40) && MEMORY[0x1CB770B20](v4) == MEMORY[0x1E4F14590])
  {
    uint64_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)beginDownloadingAttachmentWithUUID:(id)a3 accountID:(id)a4 queue:(id)a5 progressBlock:(id)a6 completionBlock:(id)a7
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1C8854000, v17, OS_LOG_TYPE_INFO, "Requesting download of attachment UUID %@ for accountID %@", buf, 0x16u);
  }

  uint64_t v18 = [[DADownloadContext alloc] initWithAttachmentUUID:v12 accountID:v13 queue:v14 downloadProgressBlock:v15 completionBlock:v16];
  v35[0] = @"kDAEMessageNameKey";
  v35[1] = @"kDAEAttachmentUUIDKey";
  v36[0] = @"kDAEBeginDownloadingAttachment";
  v36[1] = v12;
  v35[2] = @"kDAEAccountIdKey";
  v36[2] = v13;
  xpc_object_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v32 = __Block_byref_object_copy_;
  id v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __100__CDDADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke;
  v25[3] = &unk_1E6573CD0;
  uint64_t v30 = buf;
  id v20 = v12;
  id v26 = v20;
  id v21 = v13;
  id v27 = v21;
  uint64_t v28 = self;
  BOOL v22 = v18;
  char v29 = v22;
  [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v19 handlerBlock:v25];
  id v23 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v23;
}

void __100__CDDADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"kDAEAttachmentDownloadIdKey"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  CFStringRef v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_INFO, "Download context %@ set up for downloading attachment UUID %@ on accountID %@", buf, 0x20u);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__CDDADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_141;
  block[3] = &unk_1E6573CA8;
  void block[4] = v10;
  long long v13 = *(_OWORD *)(a1 + 56);
  id v12 = (id)v13;
  long long v15 = v13;
  dispatch_sync(v11, block);
}

uint64_t __100__CDDADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_141(void *a1)
{
  return [*(id *)(a1[4] + 72) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)_cancelDownloadsWithIDs:(id)a3 error:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
        id v16 = &v15;
        uint64_t v17 = 0x3032000000;
        __int16 v18 = __Block_byref_object_copy_;
        uint64_t v19 = __Block_byref_object_dispose_;
        id v20 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__CDDADConnection__cancelDownloadsWithIDs_error___block_invoke;
        block[3] = &unk_1E6573BE0;
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

uint64_t __49__CDDADConnection__cancelDownloadsWithIDs_error___block_invoke(void *a1)
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
  void v17[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17[0] = @"kDAECancelDownloadingAttachment";
  v16[0] = @"kDAEMessageNameKey";
  v16[1] = @"kDAEErrorDataKey";
  id v7 = (void *)MEMORY[0x1E4F28DB0];
  id v8 = a4;
  uint64_t v9 = [v7 archivedDataWithRootObject:v8];
  v16[2] = @"kDAEAttachmentDownloadIdKey";
  v17[1] = v9;
  v17[2] = v6;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  uint64_t v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1C8854000, v11, OS_LOG_TYPE_INFO, "Cancelling Download of attachment with downloadID %@", buf, 0xCu);
  }

  [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v10 handlerBlock:0];
  id v13 = v6;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [(CDDADConnection *)self _cancelDownloadsWithIDs:v12 error:v8];
}

- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    int64_t v31 = a3;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl(&dword_1C8854000, v16, OS_LOG_TYPE_DEBUG, "Requesting share response %ld for calendar %@ for accountID %@", buf, 0x20u);
  }

  uint64_t v17 = [[DASharedCalendarContext alloc] initWithCalendarID:v12 accountID:v13 queue:v15 completionBlock:v14];
  [(DASharedCalendarContext *)v17 setShouldSyncCalendar:a3 == 1];
  v28[0] = @"kDAEMessageNameKey";
  v28[1] = @"kDAEAccountIdKey";
  v29[0] = @"kDAERespondToSharedCalendar";
  v29[1] = v13;
  v28[2] = @"kDAESharedCalendarReponseTypeKey";
  __int16 v18 = [NSNumber numberWithInteger:a3];
  v28[3] = @"kDAESharedCalendarResponseCalendarIDKey";
  v29[2] = v18;
  v29[3] = v12;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__CDDADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke;
  void v23[3] = &unk_1E6573CF8;
  id v24 = v12;
  id v25 = v13;
  uint64_t v26 = self;
  id v27 = v17;
  id v20 = v17;
  id v21 = v13;
  id v22 = v12;
  [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v19 handlerBlock:v23];
}

void __99__CDDADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"kDAESharedCalendarActionIdKey"];
  uint64_t v4 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1C8854000, v4, OS_LOG_TYPE_DEBUG, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(NSObject **)(v7 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__CDDADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_145;
  block[3] = &unk_1E6573C30;
  void block[4] = v7;
  id v11 = v3;
  id v12 = *(id *)(a1 + 56);
  id v9 = v3;
  dispatch_sync(v8, block);
}

uint64_t __99__CDDADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_145(void *a1)
{
  return [*(id *)(a1[4] + 96) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl(&dword_1C8854000, v14, OS_LOG_TYPE_DEBUG, "Reporting calendar %@ for accountID %@ as junk", buf, 0x16u);
  }

  __int16 v15 = [[DASharedCalendarContext alloc] initWithCalendarID:v10 accountID:v11 queue:v13 completionBlock:v12];
  [(DASharedCalendarContext *)v15 setShouldSyncCalendar:0];
  v25[0] = @"kDAEMessageNameKey";
  v25[1] = @"kDAEAccountIdKey";
  v26[0] = @"kDAEReportSharedCalendarAsJunk";
  v26[1] = v11;
  v25[2] = @"kDAESharedCalendarResponseCalendarIDKey";
  v26[2] = v10;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__CDDADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke;
  v20[3] = &unk_1E6573CF8;
  id v21 = v10;
  id v22 = v11;
  long long v23 = self;
  id v24 = v15;
  __int16 v17 = v15;
  id v18 = v11;
  id v19 = v10;
  [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v16 handlerBlock:v20];
}

void __101__CDDADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"kDAESharedCalendarActionIdKey"];
  uint64_t v4 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1C8854000, v4, OS_LOG_TYPE_DEBUG, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(NSObject **)(v7 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__CDDADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_146;
  block[3] = &unk_1E6573C30;
  void block[4] = v7;
  id v11 = v3;
  id v12 = *(id *)(a1 + 56);
  id v9 = v3;
  dispatch_sync(v8, block);
}

uint64_t __101__CDDADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_146(void *a1)
{
  return [*(id *)(a1[4] + 96) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (BOOL)processFolderChange:(id)a3 forAccountWithID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F28DB0];
  id v8 = a4;
  id v9 = [v7 archivedDataWithRootObject:v6];
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"kDAEProcessFolderChange", @"kDAEMessageNameKey", v8, @"kDAEAccountIdKey", v9, @"kDAEFolderChangeDataKey", 0);

  id v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v25 = "-[CDDADConnection processFolderChange:forAccountWithID:]";
    _os_log_impl(&dword_1C8854000, v11, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  id v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  id v13 = [(CDDADConnection *)self _connection];
  xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(v13, v12);

  if (MEMORY[0x1CB770B20](v14) == MEMORY[0x1E4F14590])
  {
    __int16 v15 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v16 = [v15 objectForKeyedSubscript:@"kDAETaskIDKey"];
    uint64_t v17 = [v16 unsignedIntegerValue];

    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__CDDADConnection_processFolderChange_forAccountWithID___block_invoke;
    block[3] = &unk_1E6573D20;
    id v22 = self;
    uint64_t v23 = v17;
    id v21 = v6;
    dispatch_sync(muckingWithInFlightCollections, block);
  }
  return 1;
}

void __56__CDDADConnection_processFolderChange_forAccountWithID___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[6];
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1C8854000, v2, OS_LOG_TYPE_DEBUG, "Setting folder change %@ for key %lu", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = a1[4];
  id v6 = *(void **)(a1[5] + 64);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

- (id)statusReports
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v21 = @"kDAEMessageNameKey";
  v22[0] = @"kDAEGetStatusReports";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(CDDADConnection *)self _connection];
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __32__CDDADConnection_statusReports__block_invoke;
  handler[3] = &unk_1E6573C08;
  xpc_object_t v14 = &v15;
  int v8 = v5;
  id v13 = v8;
  xpc_connection_send_message_with_reply(v6, v4, v7, handler);

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __32__CDDADConnection_statusReports__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1CB770B20]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = [v4 objectForKeyedSubscript:@"kDAEStatusReportsKey"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    int v8 = [v4 objectForKeyedSubscript:@"kDAEStatusKey"];
    dispatch_time_t v9 = v8;
    if (!v8 || [v8 intValue] != 2)
    {
      id v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315394;
        uint64_t v12 = "-[CDDADConnection statusReports]_block_invoke";
        __int16 v13 = 2112;
        xpc_object_t v14 = v9;
        _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reallyRegisterForInterrogation
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_statusReportBlock && ![(CDDADConnection *)self registered])
  {
    [(CDDADConnection *)self setRegistered:1];
    id v3 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1C8854000, v3, OS_LOG_TYPE_INFO, "Sending message: kDAERegisterForInterrogation", v7, 2u);
    }

    int v8 = @"kDAEMessageNameKey";
    v9[0] = @"kDAERegisterForInterrogation";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v6 = [(CDDADConnection *)self _connection];
    xpc_connection_send_message(v6, v5);
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
    uint64_t v7 = _Block_copy(v6);
    statusReportBlocuint64_t k = self->_statusReportBlock;
    self->_statusReportBlocuint64_t k = v7;
  }
  return 1;
}

- (void)fillOutCurrentEASTimeZoneInfo
{
  v12[1] = *MEMORY[0x1E4F143B8];
  int v11 = @"kDAEMessageNameKey";
  v12[0] = @"kDAEFillOutEASTimeZoneInfo";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = [(CDDADConnection *)self _connection];
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __48__CDDADConnection_fillOutCurrentEASTimeZoneInfo__block_invoke;
  v9[3] = &unk_1E6573D48;
  dispatch_semaphore_t v10 = v5;
  int v8 = v5;
  xpc_connection_send_message_with_reply(v6, v4, v7, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__CDDADConnection_fillOutCurrentEASTimeZoneInfo__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)activeSyncDeviceIdentifier
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v23 = @"kDAEMessageNameKey";
  v24[0] = @"kDAEGetActiveSyncDeviceIdentifier";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  int v4 = 3;
  while (1)
  {
    dispatch_semaphore_t v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v7 = [(CDDADConnection *)self _connection];
    int v8 = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __45__CDDADConnection_activeSyncDeviceIdentifier__block_invoke;
    handler[3] = &unk_1E6573C08;
    uint64_t v16 = &v17;
    dispatch_time_t v9 = v6;
    uint64_t v15 = v9;
    xpc_connection_send_message_with_reply(v7, v5, v8, handler);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (v18[5]) {
      break;
    }
    dispatch_semaphore_t v10 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v13 = 0;
      _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_ERROR, "Error getting activesync device identifier, will try again", v13, 2u);
    }

    if (!--v4) {
      goto LABEL_8;
    }
  }

LABEL_8:
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __45__CDDADConnection_activeSyncDeviceIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (MEMORY[0x1CB770B20]() == MEMORY[0x1E4F14590])
  {
    id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v4 = [v3 objectForKeyedSubscript:@"kDAEActiveSyncDeviceIdentifierKey"];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_performOofSettingsRequest:(id)a3 forAccountWithID:(id)a4 forUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  v34[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v33[0] = @"kDAEMessageNameKey";
    v33[1] = @"kDAEAccountIdKey";
    v34[0] = @"kDAEOofSettings";
    v34[1] = v9;
    v33[2] = @"kDAEOofIsUpdateKey";
    id v11 = [NSNumber numberWithBool:v5];
    v34[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    __int16 v13 = [v10 initWithDictionary:v12];

    if (v5)
    {
      xpc_object_t v14 = [v8 dictionaryRepresentation];
      [v13 setObject:v14 forKeyedSubscript:@"kDAEOofSettingsRequestKey"];
    }
    uint64_t v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    uint64_t v17 = [(CDDADConnection *)self _connection];
    uint64_t v18 = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __73__CDDADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke;
    handler[3] = &unk_1E6573D98;
    id v23 = v8;
    id v24 = self;
    BOOL v27 = v5;
    uint64_t v26 = &v29;
    uint64_t v19 = v16;
    id v25 = v19;
    xpc_connection_send_message_with_reply(v17, v15, v18, handler);

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v20 = *((unsigned char *)v30 + 24) != 0;
  }
  else
  {
    __int16 v13 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C8854000, v13, OS_LOG_TYPE_ERROR, "nil accountID passed to performASSettingsRequest. Cannot continue.", buf, 2u);
    }
    BOOL v20 = 0;
  }

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __73__CDDADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1CB770B20]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    BOOL v5 = [v4 objectForKeyedSubscript:@"kDAEOofRequestIDKey"];
    [*(id *)(a1 + 32) setRequestID:v5];
    dispatch_semaphore_t v6 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __73__CDDADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke_2;
    v8[3] = &unk_1E6573D70;
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

uint64_t __73__CDDADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(a1 + 56)) {
      id v3 = @"update";
    }
    else {
      id v3 = @"retrieve";
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1C8854000, v2, OS_LOG_TYPE_DEBUG, "Adding to inflight dictionary: oof %@ request %@ for key %@", (uint8_t *)&v7, 0x20u);
  }

  return [*(id *)(*(void *)(a1 + 48) + 104) setObject:*(void *)(a1 + 32) forKeyedSubscript:*(void *)(a1 + 40)];
}

- (BOOL)retrieveOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  return [(CDDADConnection *)self _performOofSettingsRequest:a3 forAccountWithID:a4 forUpdate:0];
}

- (BOOL)updateOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  return [(CDDADConnection *)self _performOofSettingsRequest:a3 forAccountWithID:a4 forUpdate:1];
}

- (void)isOofSettingsSupportedForAccountWithID:(id)a3 completionBlock:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v15[0] = @"kDAEMessageNameKey";
    v15[1] = @"kDAEAccountIdKey";
    v16[0] = @"kDAEIsOofSettingsSupported";
    v16[1] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    __int16 v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v10 = [(CDDADConnection *)self _connection];
    __int16 v11 = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __74__CDDADConnection_isOofSettingsSupportedForAccountWithID_completionBlock___block_invoke;
    handler[3] = &unk_1E6573DC0;
    id v13 = v7;
    xpc_connection_send_message_with_reply(v10, v9, v11, handler);
  }
  else
  {
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C8854000, v8, OS_LOG_TYPE_ERROR, "nil accountID passed to isOofSettingsSupportedForAccountWithID. Cannot continue.", buf, 2u);
    }
  }
}

void __74__CDDADConnection_isOofSettingsSupportedForAccountWithID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1CB770B20]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = [v4 objectForKeyedSubscript:@"kDAEIsOofSupportedKey"];
    id v6 = v5;
    if (v5)
    {
      [v5 BOOLValue];
    }
    else
    {
      id v7 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1C8854000, v7, OS_LOG_TYPE_ERROR, "Error getting activesync device identifier", v8, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)requestCalendarAvailabilityWithAccountID:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8 completionBlock:(id)a9
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v41 = a6;
  id v18 = a7;
  id v40 = a8;
  id v19 = a9;
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x3032000000;
  long long v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  id v55 = 0;
  BOOL v20 = v15;
  if (!v15)
  {
    id v21 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v57 = 0;
      id v22 = "Invalid 'accountID' provided: [%@].";
      id v23 = v21;
      uint32_t v24 = 12;
      goto LABEL_9;
    }
LABEL_10:

    id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:86 userInfo:0];
    goto LABEL_11;
  }
  if (!v16 || !v17 || [v16 compare:v17] == 1)
  {
    id v21 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v57 = v16;
      __int16 v58 = 2112;
      id v59 = v17;
      id v22 = "Invalid 'startDate' [%@] and/or 'endDate' [%@] provided.";
      id v23 = v21;
      uint32_t v24 = 22;
LABEL_9:
      _os_log_impl(&dword_1C8854000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v18 && [v18 count])
  {
    uint64_t v36 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413314;
      id v57 = v20;
      __int16 v58 = 2112;
      id v59 = v16;
      __int16 v60 = 2112;
      id v61 = v17;
      __int16 v62 = 2112;
      id v63 = v41;
      __int16 v64 = 2112;
      id v65 = v18;
      _os_log_impl(&dword_1C8854000, v36, OS_LOG_TYPE_DEBUG, "Preparing calendar availability request.  accountID: [%@] startDate: [%@] endDate: [%@] ignoredEventID: [%@] addresses: [%@]", buf, 0x34u);
    }

    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v37 setObject:@"kDAERequestCalendarAvailability" forKey:@"kDAEMessageNameKey"];
    [v37 setObject:v20 forKey:@"kDAEAccountIdKey"];
    [v37 setObject:v16 forKey:@"kDAEStartDateKey"];
    [v37 setObject:v17 forKey:@"kDAEEndDateKey"];
    [v37 setObject:v18 forKey:@"kDAEAddressesKey"];
    if (v41) {
      [v37 setObject:v41 forKey:@"kDAEIgnoredEventIDKey"];
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_153;
    v42[3] = &unk_1E6573E10;
    v46[1] = &v50;
    id v45 = v40;
    v46[0] = v19;
    id v30 = v37;
    id v43 = v30;
    uint64_t v44 = self;
    [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v30 handlerBlock:v42];

    id v32 = v19;
    id v39 = v16;
    id v27 = v17;
    id v28 = v20;
    id v29 = v18;
    id v25 = 0;
    uint64_t v31 = &v45;
    id v33 = (id *)v46;
    goto LABEL_15;
  }
  uint64_t v38 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C8854000, v38, OS_LOG_TYPE_DEBUG, "No 'addresses' provided.", buf, 2u);
  }

  id v25 = 0;
LABEL_11:
  uint64_t v26 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C8854000, v26, OS_LOG_TYPE_DEFAULT, "Will not issue calendar availability request.", buf, 2u);
  }

  if (v19)
  {
    id v39 = v16;
    id v27 = v17;
    id v28 = v20;
    id v29 = v18;
    id v30 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E6573DE8;
    uint64_t v31 = &v49;
    id v32 = v19;
    id v49 = v19;
    id v33 = &v48;
    id v25 = v25;
    id v48 = v25;
    dispatch_async(v30, block);
LABEL_15:

    id v18 = v29;
    id v16 = v39;
    BOOL v20 = v28;
    id v17 = v27;
    id v19 = v32;
  }
  id v34 = (id)v51[5];

  _Block_object_dispose(&v50, 8);

  return v34;
}

uint64_t __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_153(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"kDAECalendarAvailabilityRequestIDKey"];
  uint64_t v4 = *(void *)(a1[8] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [[DAECalendarAvailabilityContext alloc] initWithResultsBlock:a1[6] completionBlock:a1[7]];
  id v7 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(*(void *)(a1[8] + 8) + 40);
    uint64_t v9 = a1[4];
    *(_DWORD *)long long buf = 138412802;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1C8854000, v7, OS_LOG_TYPE_DEBUG, "Received request ID [%@] for request with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
  }

  uint64_t v10 = a1[5];
  __int16 v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_155;
  block[3] = &unk_1E6573CA8;
  uint64_t v12 = a1[8];
  id v15 = v6;
  uint64_t v16 = v12;
  void block[4] = v10;
  id v13 = v6;
  dispatch_sync(v11, block);
}

uint64_t __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_155(void *a1)
{
  return [*(id *)(a1[4] + 80) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v18[0] = @"kDAEMessageNameKey";
    v18[1] = @"kDAECalendarAvailabilityRequestIDKey";
    v19[0] = @"kDAECancelCalendarAvailabilityRequest";
    v19[1] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v6 handlerBlock:0];
    *(void *)long long buf = 0;
    id v13 = buf;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy_;
    uint64_t v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__CDDADConnection_cancelCalendarAvailabilityRequestWithID___block_invoke;
    block[3] = &unk_1E6573BE0;
    __int16 v11 = buf;
    void block[4] = self;
    id v10 = v5;
    dispatch_sync(muckingWithInFlightCollections, block);
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
    [*((id *)v13 + 5) finishedWithError:v8];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_DEBUG, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }
}

uint64_t __59__CDDADConnection_cancelCalendarAvailabilityRequestWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 80);

  return [v6 removeObjectForKey:v5];
}

- (void)_calendarAvailabilityRequestReturnedResults:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:@"kDAECalendarAvailabilityRequestIDKey"];
  id v7 = [v5 objectForKeyedSubscript:@"kDAECalendarAvailabilityResultsKey"];
  uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  id v22 = 0;
  uint64_t v14 = [v8 unarchivedObjectOfClasses:v13 fromData:v7 error:&v22];
  id v15 = v22;

  if (!v14)
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1C8854000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CDDADConnection__calendarAvailabilityRequestReturnedResults___block_invoke;
  block[3] = &unk_1E6573BE0;
  p_long long buf = &buf;
  void block[4] = self;
  id v18 = v6;
  id v20 = v18;
  dispatch_sync(muckingWithInFlightCollections, block);
  [*(id *)(*((void *)&buf + 1) + 40) resultsReturned:v14];

  _Block_object_dispose(&buf, 8);
}

uint64_t __63__CDDADConnection__calendarAvailabilityRequestReturnedResults___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)_calendarAvailabilityRequestFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:@"kDAECalendarAvailabilityRequestIDKey"];
  id v7 = [v5 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  uint64_t v8 = [(CDDADConnection *)self decodedErrorFromData:v7];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CDDADConnection__calendarAvailabilityRequestFinished___block_invoke;
  block[3] = &unk_1E6573BE0;
  id v13 = &v14;
  void block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v15[5] finishedWithError:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __56__CDDADConnection__calendarAvailabilityRequestFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 80);

  return [v6 removeObjectForKey:v5];
}

- (id)performCalendarDirectorySearchWithAccountID:(id)a3 terms:(id)a4 recordTypes:(id)a5 resultLimit:(unint64_t)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  if (v14)
  {
    if (v15 && [v15 count])
    {
      if (v16 && [v16 count])
      {
        id v19 = DALoggingwithCategory(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138413058;
          id v49 = v14;
          __int16 v50 = 2112;
          id v51 = v16;
          __int16 v52 = 2048;
          unint64_t v53 = a6;
          __int16 v54 = 2112;
          id v55 = v15;
          _os_log_impl(&dword_1C8854000, v19, OS_LOG_TYPE_DEBUG, "Preparing calendar directory search.  accountID: [%@] recordTypes:[%@] resultLimit: [%lu] terms: [%@]", buf, 0x2Au);
        }

        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v20 setObject:@"kDAEPerformCalendarDirectorySearch" forKey:@"kDAEMessageNameKey"];
        [v20 setObject:v14 forKey:@"kDAEAccountIdKey"];
        __int16 v21 = [v15 allObjects];
        [v20 setObject:v21 forKey:@"kDAECalendarDirectorySearchTermsKey"];

        id v22 = [v16 allObjects];
        [v20 setObject:v22 forKey:@"kDAECalendarDirectorySearchRecordTypesKey"];

        uint64_t v23 = [NSNumber numberWithUnsignedInteger:a6];
        [v20 setObject:v23 forKey:@"kDAECalendarDirectorySearchResultLimitKey"];

        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_157;
        v34[3] = &unk_1E6573E10;
        v38[1] = &v42;
        id v37 = v17;
        v38[0] = v18;
        uint64_t v24 = v20;
        id v35 = v24;
        uint64_t v36 = self;
        [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v24 handlerBlock:v34];

        id v25 = 0;
        uint64_t v26 = &v37;
        id v27 = (id *)v38;
        goto LABEL_22;
      }
      uint64_t v28 = DALoggingwithCategory(0);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      *(_WORD *)long long buf = 0;
      id v29 = "No 'recordTypes' provided.";
    }
    else
    {
      uint64_t v28 = DALoggingwithCategory(0);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
LABEL_17:

        id v25 = 0;
        goto LABEL_18;
      }
      *(_WORD *)long long buf = 0;
      id v29 = "No 'terms' provided.";
    }
    _os_log_impl(&dword_1C8854000, v28, OS_LOG_TYPE_DEBUG, v29, buf, 2u);
    goto LABEL_17;
  }
  id v30 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v49 = 0;
    _os_log_impl(&dword_1C8854000, v30, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%@].", buf, 0xCu);
  }

  id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:86 userInfo:0];
LABEL_18:
  uint64_t v31 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C8854000, v31, OS_LOG_TYPE_DEFAULT, "Will not issue calendar directory search.", buf, 2u);
  }

  if (v18)
  {
    uint64_t v24 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E6573DE8;
    uint64_t v26 = &v41;
    id v41 = v18;
    id v27 = &v40;
    id v25 = v25;
    id v40 = v25;
    dispatch_async(v24, block);
LABEL_22:
  }
  id v32 = (id)v43[5];

  _Block_object_dispose(&v42, 8);

  return v32;
}

uint64_t __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_157(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"kDAECalendarDirectorySearchIDKey"];
  uint64_t v4 = *(void *)(a1[8] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [[DAECalendarDirectorySearchContext alloc] initWithResultsBlock:a1[6] completionBlock:a1[7]];
  id v7 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(*(void *)(a1[8] + 8) + 40);
    uint64_t v9 = a1[4];
    *(_DWORD *)long long buf = 138412802;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1C8854000, v7, OS_LOG_TYPE_DEBUG, "Received search ID [%@] for search with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
  }

  uint64_t v10 = a1[5];
  uint64_t v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_159;
  block[3] = &unk_1E6573CA8;
  uint64_t v12 = a1[8];
  id v15 = v6;
  uint64_t v16 = v12;
  void block[4] = v10;
  id v13 = v6;
  dispatch_sync(v11, block);
}

uint64_t __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_159(void *a1)
{
  return [*(id *)(a1[4] + 88) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v22[0] = @"kDAEMessageNameKey";
    v22[1] = @"kDAECalendarDirectorySearchIDKey";
    v23[0] = @"kDAECancelCalendarDirectorySearch";
    v23[1] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v6 handlerBlock:0];
    *(void *)id v14 = 0;
    id v15 = v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy_;
    uint64_t v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__CDDADConnection_cancelCalendarDirectorySearchWithID___block_invoke;
    block[3] = &unk_1E6573BE0;
    id v13 = v14;
    void block[4] = self;
    id v8 = v5;
    id v12 = v8;
    dispatch_sync(muckingWithInFlightCollections, block);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
    [*((id *)v15 + 5) finishedWithError:v9 exceededResultLimit:0];
    uint64_t v10 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v8;
      _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_DEBUG, "Cancelled calendar directory search with ID: [%@].", buf, 0xCu);
    }

    _Block_object_dispose(v14, 8);
  }
  else
  {
    id v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_DEBUG, "nil 'searchID' provided.  Will not cancel any calendar directory searches.", v14, 2u);
    }
  }
}

uint64_t __55__CDDADConnection_cancelCalendarDirectorySearchWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 88);

  return [v6 removeObjectForKey:v5];
}

- (void)_calendarDirectorySearchReturnedResults:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:@"kDAECalendarDirectorySearchIDKey"];
  id v7 = [v5 objectForKeyedSubscript:@"kDAECalendarDirectorySearchResultsKey"];
  id v8 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  id v27 = 0;
  id v14 = [v8 unarchivedObjectOfClasses:v13 fromData:v7 error:&v27];
  id v15 = v27;

  if (!v14)
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1C8854000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CDDADConnection__calendarDirectorySearchReturnedResults___block_invoke;
  block[3] = &unk_1E6573BE0;
  p_long long buf = &buf;
  void block[4] = self;
  id v18 = v6;
  id v25 = v18;
  dispatch_sync(muckingWithInFlightCollections, block);
  uint64_t v19 = [v14 count];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __59__CDDADConnection__calendarDirectorySearchReturnedResults___block_invoke_2;
  v22[3] = &unk_1E6573E38;
  id v21 = v20;
  id v23 = v21;
  [v14 enumerateKeysAndObjectsUsingBlock:v22];
  [*(id *)(*((void *)&buf + 1) + 40) resultsReturned:v21];

  _Block_object_dispose(&buf, 8);
}

uint64_t __59__CDDADConnection__calendarDirectorySearchReturnedResults___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

void __59__CDDADConnection__calendarDirectorySearchReturnedResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithArray:v6];

  [*(id *)(a1 + 32) setObject:v8 forKey:v7];
}

- (void)_calendarDirectorySearchFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:@"kDAECalendarDirectorySearchIDKey"];
  id v7 = [v5 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  id v8 = [(CDDADConnection *)self decodedErrorFromData:v7];
  uint64_t v9 = [v5 objectForKeyedSubscript:@"kDAECalendarDirectorySearchExceededResultLimitKey"];
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
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CDDADConnection__calendarDirectorySearchFinished___block_invoke;
  block[3] = &unk_1E6573BE0;
  uint64_t v16 = &v17;
  void block[4] = self;
  id v13 = v6;
  id v15 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v18[5] finishedWithError:v8 exceededResultLimit:v11];

  _Block_object_dispose(&v17, 8);
}

uint64_t __52__CDDADConnection__calendarDirectorySearchFinished___block_invoke(void *a1)
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
  v37[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  id v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = -1;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  if (v7)
  {
    if (v6)
    {
      v36[0] = @"kDAEMessageNameKey";
      v36[1] = @"kDAEAccountIdKey";
      v37[0] = @"kDAERequestCalendarExternalIdentification";
      v37[1] = v6;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __67__CDDADConnection_externalIdentificationForAccountID_resultsBlock___block_invoke;
      v12[3] = &unk_1E6573E60;
      v12[4] = &v30;
      v12[5] = &v24;
      v12[6] = &v20;
      v12[7] = &v14;
      [(CDDADConnection *)self _sendSynchronousXPCMessageWithParameters:v8 handlerBlock:v12];
    }
    else
    {
      uint64_t v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_DEFAULT, "No accountID provided.", buf, 2u);
      }

      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:86 userInfo:0];
      id v8 = (void *)v31[5];
      v31[5] = v11;
    }

    v7[2](v7, v31[5], v25[5], v21[3], v15[5]);
  }
  else
  {
    uint64_t v9 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C8854000, v9, OS_LOG_TYPE_DEFAULT, "No results block provided.", buf, 2u);
    }
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __67__CDDADConnection_externalIdentificationForAccountID_resultsBlock___block_invoke(void *a1, void *a2)
{
  id v11 = a2;
  if ([v11 count])
  {
    uint64_t v3 = [v11 objectForKeyedSubscript:@"kDAEAccountServerHostKey"];
    uint64_t v4 = *(void *)(a1[5] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = [v11 objectForKeyedSubscript:@"kDAEAccountServerPortKey"];
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v6 integerValue];

    uint64_t v7 = [v11 objectForKeyedSubscript:@"kDAEAccountOwnerAddressesKey"];
    uint64_t v8 = a1[7];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:28 userInfo:0];
    uint64_t v8 = a1[4];
  }
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
}

- (CDDADConnection)init
{
  uint64_t v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Should never call -init on DADConnection.  Use +sharedConnection... instead." userInfo:0];
  [v3 raise];

  return 0;
}

- (id)_init
{
  v28.receiver = self;
  v28.super_class = (Class)CDDADConnection;
  uint64_t v2 = [(CDDADConnection *)&v28 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dataaccess.muckingWithConn", v3);
    muckingWithConuint64_t n = v2->_muckingWithConn;
    v2->_muckingWithConuint64_t n = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.dataaccess.muckingWithInFlightCollections", v6);
    muckingWithInFlightCollections = v2->_muckingWithInFlightCollections;
    v2->_muckingWithInFlightCollections = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    accountIdsWithAlreadyResetCerts = v2->_accountIdsWithAlreadyResetCerts;
    v2->_accountIdsWithAlreadyResetCerts = (NSMutableSet *)v9;

    uint64_t v11 = objc_opt_new();
    accountIdsWithAlreadyResetThrottleTimers = v2->_accountIdsWithAlreadyResetThrottleTimers;
    v2->_accountIdsWithAlreadyResetThrottleTimers = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_new();
    inFlightSearchQueries = v2->_inFlightSearchQueries;
    v2->_inFlightSearchQueries = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    inFlightFolderChanges = v2->_inFlightFolderChanges;
    v2->_inFlightFolderChanges = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    inFlightAttachmentDownloads = v2->_inFlightAttachmentDownloads;
    v2->_inFlightAttachmentDownloads = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    inFlightCalendarAvailabilityRequests = v2->_inFlightCalendarAvailabilityRequests;
    v2->_inFlightCalendarAvailabilityRequests = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    inFlightCalendarDirectorySearches = v2->_inFlightCalendarDirectorySearches;
    v2->_inFlightCalendarDirectorySearches = (NSMutableDictionary *)v21;

    uint64_t v23 = objc_opt_new();
    inFlightShareRequests = v2->_inFlightShareRequests;
    v2->_inFlightShareRequests = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    inFlightOofSettingsRequests = v2->_inFlightOofSettingsRequests;
    v2->_inFlightOofSettingsRequests = (NSMutableDictionary *)v25;

    [(CDDADConnection *)v2 _registerForAppResumedNotification];
  }
  return v2;
}

- (void)dealloc
{
  [(CDDADConnection *)self _tearDownInFlightObjects];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CDDADConnection;
  [(CDDADConnection *)&v4 dealloc];
}

- (void)_resetCertWarningsForAccountId:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    accountIdsWithAlreadyResetCerts = self->_accountIdsWithAlreadyResetCerts;
    *(_DWORD *)long long buf = 138412290;
    uint64_t v21 = accountIdsWithAlreadyResetCerts;
    _os_log_impl(&dword_1C8854000, v9, OS_LOG_TYPE_DEBUG, "in _resetCertWarningsForAccount, _accountIdsWithAlreadyResetCerts is %@", buf, 0xCu);
  }

  uint64_t v11 = self;
  objc_sync_enter(v11);
  if (v8) {
    int v12 = [(NSMutableSet *)v11->_accountIdsWithAlreadyResetCerts containsObject:v8] ^ 1;
  }
  else {
    int v12 = 0;
  }
  objc_sync_exit(v11);

  if (((v8 != 0) & (v12 | v5)) == 1)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", a4, @"kDAEMessageNameKey", @"kDAEAccountIdKey", @"kDAEDataclassesBitmaskKey", @"kDAEResetCertWarnings", v8);
    v19[2] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:3];

    uint64_t v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v16 = [(CDDADConnection *)v11 _connection];
    xpc_connection_send_message(v16, v15);

    uint64_t v17 = v11;
    objc_sync_enter(v17);
    [v17[4] addObject:v8];
    objc_sync_exit(v17);
  }
}

- (void)_resetThrottleTimersForAccountId:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    Name = sel_getName(a2);
    accountIdsWithAlreadyResetThrottleTimers = self->_accountIdsWithAlreadyResetThrottleTimers;
    *(_DWORD *)long long buf = 136315394;
    uint64_t v18 = Name;
    __int16 v19 = 2112;
    uint64_t v20 = accountIdsWithAlreadyResetThrottleTimers;
    _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_DEBUG, "in %s, _accountIdsWithAlreadyResetThrottleTimers is %@", buf, 0x16u);
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  if (!v5)
  {
    objc_sync_exit(v9);
    uint64_t v11 = v9;
    goto LABEL_7;
  }
  char v10 = [(NSMutableSet *)v9->_accountIdsWithAlreadyResetThrottleTimers containsObject:v5];
  objc_sync_exit(v9);

  if ((v10 & 1) == 0)
  {
    v15[0] = @"kDAEMessageNameKey";
    v15[1] = @"kDAEAccountIdKey";
    v16[0] = @"kDAEResetThrottleTimers";
    v16[1] = v5;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    int v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v13 = [(CDDADConnection *)v9 _connection];
    xpc_connection_send_message(v13, v12);

    uint64_t v14 = v9;
    objc_sync_enter(v14);
    [(NSMutableSet *)v9->_accountIdsWithAlreadyResetThrottleTimers addObject:v5];
    objc_sync_exit(v14);

LABEL_7:
  }
}

- (void)resetTimersAndWarnings
{
  uint64_t v3 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C8854000, v3, OS_LOG_TYPE_DEBUG, "Resetting shouldResetCertWarnings and throttle timers", v5, 2u);
  }

  objc_super v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_accountIdsWithAlreadyResetCerts removeAllObjects];
  [(NSMutableSet *)v4->_accountIdsWithAlreadyResetThrottleTimers removeAllObjects];
  objc_sync_exit(v4);
}

- (void)_registerForAppResumedNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_resetTimersAndWarnings name:@"UIApplicationWillEnterForegroundNotification" object:0];
}

- (void)_dispatchMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:@"kDAEMessageNameKey"];
  if ([v6 isEqualToString:@"kDAEFoldersUpdated"])
  {
    [(CDDADConnection *)self _foldersUpdated:v4];
  }
  else if ([v6 isEqualToString:@"kDAEPolicyKeyChanged"])
  {
    [(CDDADConnection *)self _policyKeyChanged:v4];
  }
  else if ([v6 isEqualToString:@"kDAELogDataAccessStatus"])
  {
    [(CDDADConnection *)self _logDataAccessStatus:v4];
  }
  else if ([v6 isEqualToString:@"kDAEServerContactsSearchQueryFinished"])
  {
    [(CDDADConnection *)self _serverContactsSearchQueryFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEFolderChangeFinished"])
  {
    [(CDDADConnection *)self _folderChangeFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEGetStatusReportsFromClient"])
  {
    [(CDDADConnection *)self _getStatusReportsFromClient:v4];
  }
  else if ([v6 isEqualToString:@"kDAEAttachmentDownloadProgress"])
  {
    [(CDDADConnection *)self _downloadProgress:v4];
  }
  else if ([v6 isEqualToString:@"kDAEAttachmentDownloadFinished"])
  {
    [(CDDADConnection *)self _downloadFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarShareResponseFinished"])
  {
    [(CDDADConnection *)self _shareResponseFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEOofSettingsFinished"])
  {
    [(CDDADConnection *)self _oofSettingsRequestsFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarAvailabilityRequestReturnedResults"])
  {
    [(CDDADConnection *)self _calendarAvailabilityRequestReturnedResults:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarAvailabilityRequestFinished"])
  {
    [(CDDADConnection *)self _calendarAvailabilityRequestFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarDirectorySearchReturnedResults"])
  {
    [(CDDADConnection *)self _calendarDirectorySearchReturnedResults:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarDirectorySearchFinished"])
  {
    [(CDDADConnection *)self _calendarDirectorySearchFinished:v4];
  }
  else
  {
    dispatch_queue_t v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1C8854000, v7, OS_LOG_TYPE_ERROR, "unknown request sent to connection.", (uint8_t *)&v9, 2u);
    }

    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      char v10 = v5;
      _os_log_impl(&dword_1C8854000, v8, OS_LOG_TYPE_ERROR, "request: %@", (uint8_t *)&v9, 0xCu);
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

  objc_storeStrong((id *)&self->_conn, 0);
}

@end