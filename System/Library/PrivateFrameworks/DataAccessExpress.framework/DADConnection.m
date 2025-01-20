@interface DADConnection
+ (id)_dictionarySuitableForLogging:(id)a3;
+ (id)sharedConnection;
+ (unint64_t)_nextStopMonitoringStatusToken;
+ (void)_logRequestID:(id)a3 forRequestAttributes:(id)a4 associatedContext:(id)a5;
- (BOOL)_checkInvalidIdExistsInXPCRely:(id)a3;
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
- (DADConnection)init;
- (id)_connection;
- (id)_createReplyToRequest:(id)a3 withProperties:(id)a4;
- (id)_init;
- (id)activeSyncDeviceIdentifier;
- (id)beginDownloadingAttachmentWithUUID:(id)a3 accountID:(id)a4 queue:(id)a5 progressBlock:(id)a6 completionBlock:(id)a7;
- (id)currentPolicyKeyForAccountID:(id)a3;
- (id)decodedErrorFromData:(id)a3;
- (id)downloadSubscribedCalendarWithURL:(id)a3 queue:(id)a4 delegate:(id)a5;
- (id)performCalendarDirectorySearchWithAccountID:(id)a3 terms:(id)a4 recordTypes:(id)a5 resultLimit:(unint64_t)a6 resultsBlock:(id)a7 completionBlock:(id)a8;
- (id)requestCalendarAvailabilityWithAccountID:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8 completionBlock:(id)a9;
- (id)requestGrantedDelegatesListForAccountID:(id)a3 resultsBlock:(id)a4;
- (id)statusReports;
- (id)updateGrantedDelegateForAccountID:(id)a3 grantedDelegate:(id)a4 action:(int64_t)a5 resultsBlock:(id)a6;
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
- (void)_downloadSubscribedCalendarFinished:(id)a3;
- (void)_downloadSubscribedCalendarProgress:(id)a3;
- (void)_downloadSubscribedCalendarRequiresPassword:(id)a3;
- (void)_folderChangeFinished:(id)a3;
- (void)_foldersUpdated:(id)a3;
- (void)_getStatusReportsFromClient:(id)a3;
- (void)_grantedDelegatesListRequestFinished:(id)a3;
- (void)_groupExpansionFinished:(id)a3;
- (void)_holidayCalendarFetchFinished:(id)a3;
- (void)_holidayCalendarFetchReturnedResults:(id)a3;
- (void)_initializeConnection;
- (void)_initializeConnectionWithXPCEndpoint:(id)a3;
- (void)_initializeXPCConnection:(id)a3;
- (void)_logDataAccessStatus:(id)a3;
- (void)_officeHoursRequestFinished:(id)a3;
- (void)_oofSettingsRequestsFinished:(id)a3;
- (void)_policyKeyChanged:(id)a3;
- (void)_registerForAppResumedNotification;
- (void)_requestDaemonChangeAgentMonitoringStatus:(BOOL)a3 withToken:(unint64_t)a4 waitForReply:(BOOL)a5;
- (void)_resetCertWarningsForAccountId:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5;
- (void)_resetThrottleTimersForAccountId:(id)a3;
- (void)_sendXPCMessageSynchronous:(BOOL)a3 withParameters:(id)a4 handlerBlock:(id)a5;
- (void)_serverContactsSearchQueryFinished:(id)a3;
- (void)_serverDiedWithReason:(id)a3;
- (void)_shareResponseFinished:(id)a3;
- (void)_subscriptionCalendarJunkCheckFinished:(id)a3;
- (void)_tearDownInFlightObjects;
- (void)_updateGrantedDelegatePermissionRequestFinished:(id)a3;
- (void)addExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toAccountWithID:(id)a5 completion:(id)a6;
- (void)asyncProcessMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7;
- (void)beginCalDAVServerSimulationWithHostname:(id)a3;
- (void)cancelCalendarAvailabilityRequestWithID:(id)a3;
- (void)cancelCalendarDirectorySearchWithID:(id)a3;
- (void)cancelDownloadingAttachmentWithDownloadID:(id)a3 error:(id)a4;
- (void)cancelDownloadingSubscriptionCalendarWithDownloadID:(id)a3;
- (void)cancelGrantedDelegatesListRequestWithID:(id)a3;
- (void)cancelServerContactsSearch:(id)a3;
- (void)checkSubscriptionCalendarIsJunk:(id)a3 queue:(id)a4 completionBlock:(id)a5;
- (void)dealloc;
- (void)endCalDAVServerSimulationWithHostname:(id)a3;
- (void)fetchAvailableHolidayCalendarsWithResultsBlock:(id)a3 completionBlock:(id)a4 queue:(id)a5;
- (void)fetchOfficeHoursForAccountWithID:(id)a3 queue:(id)a4 completionBlock:(id)a5;
- (void)fillOutCurrentEASTimeZoneInfo;
- (void)handleAccountChange:(id)a3 callback:(id)a4;
- (void)handleURL:(id)a3;
- (void)isOofSettingsSupportedForAccountWithID:(id)a3 completionBlock:(id)a4;
- (void)performGroupExpansionWithAccountID:(id)a3 principalPath:(id)a4 completionBlock:(id)a5;
- (void)reallyRegisterForInterrogation;
- (void)removeExchangeDelegateWithSourceID:(id)a3 fromParentAccountWithID:(id)a4 completion:(id)a5;
- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6;
- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6;
- (void)reportSubscriptionCalendarAsJunk:(id)a3;
- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3;
- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3;
- (void)resetTimersAndWarnings;
- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (void)setOfficeHours:(id)a3 forAccountWithID:(id)a4 queue:(id)a5 completionBlock:(id)a6;
- (void)setRegistered:(BOOL)a3;
- (void)validateCandidateSubscriptionURLWithICloud:(id)a3 queue:(id)a4 completionBlock:(id)a5;
@end

@implementation DADConnection

- (void)_tearDownInFlightObjects
{
  uint64_t v266 = *MEMORY[0x1E4F143B8];
  uint64_t v247 = 0;
  v248 = &v247;
  uint64_t v249 = 0x3032000000;
  v250 = __Block_byref_object_copy_;
  v251 = __Block_byref_object_dispose_;
  id v252 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke;
  block[3] = &unk_1E6215490;
  block[5] = &v247;
  v100 = self;
  block[4] = self;
  dispatch_sync(muckingWithInFlightCollections, block);
  v4 = (void *)v248[5];
  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:0 userInfo:0];
  [v4 makeObjectsPerformSelector:sel_sendFinishedToConsumerWithError_ withObject:v5];

  uint64_t v240 = 0;
  v241 = &v240;
  uint64_t v242 = 0x3032000000;
  v243 = __Block_byref_object_copy_;
  v244 = __Block_byref_object_dispose_;
  id v245 = 0;
  v6 = v100->_muckingWithInFlightCollections;
  v239[0] = MEMORY[0x1E4F143A8];
  v239[1] = 3221225472;
  v239[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_181;
  v239[3] = &unk_1E6215490;
  v239[5] = &v240;
  v239[4] = v100;
  dispatch_sync(v6, v239);
  long long v238 = 0u;
  long long v237 = 0u;
  long long v236 = 0u;
  long long v235 = 0u;
  id v7 = (id)v241[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v235 objects:v265 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v236;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v236 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v235 + 1) + 8 * i);
        v12 = [v11 consumer];
        v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:0 userInfo:0];
        [v12 folderChange:v11 finishedWithStatus:0 error:v13];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v235 objects:v265 count:16];
    }
    while (v8);
  }

  uint64_t v229 = 0;
  v230 = &v229;
  uint64_t v231 = 0x3032000000;
  v232 = __Block_byref_object_copy_;
  v233 = __Block_byref_object_dispose_;
  id v234 = 0;
  v14 = v100->_muckingWithInFlightCollections;
  v228[0] = MEMORY[0x1E4F143A8];
  v228[1] = 3221225472;
  v228[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_182;
  v228[3] = &unk_1E6215490;
  v228[5] = &v229;
  v228[4] = v100;
  dispatch_sync(v14, v228);
  long long v227 = 0u;
  long long v226 = 0u;
  long long v225 = 0u;
  long long v224 = 0u;
  id v15 = (id)v230[5];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v224 objects:v264 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v225;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v225 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v224 + 1) + 8 * j);
        v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:0 userInfo:0];
        [v19 finishedWithError:v20];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v224 objects:v264 count:16];
    }
    while (v16);
  }

  uint64_t v218 = 0;
  v219 = &v218;
  uint64_t v220 = 0x3032000000;
  v221 = __Block_byref_object_copy_;
  v222 = __Block_byref_object_dispose_;
  id v223 = 0;
  v21 = v100->_muckingWithInFlightCollections;
  v217[0] = MEMORY[0x1E4F143A8];
  v217[1] = 3221225472;
  v217[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_183;
  v217[3] = &unk_1E6215490;
  v217[5] = &v218;
  v217[4] = v100;
  dispatch_sync(v21, v217);
  long long v216 = 0u;
  long long v215 = 0u;
  long long v214 = 0u;
  long long v213 = 0u;
  id v22 = (id)v219[5];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v213 objects:v263 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v214;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v214 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = *(void **)(*((void *)&v213 + 1) + 8 * k);
        v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v26 finishedWithError:v27];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v213 objects:v263 count:16];
    }
    while (v23);
  }

  uint64_t v207 = 0;
  v208 = &v207;
  uint64_t v209 = 0x3032000000;
  v210 = __Block_byref_object_copy_;
  v211 = __Block_byref_object_dispose_;
  id v212 = 0;
  v28 = v100->_muckingWithInFlightCollections;
  v206[0] = MEMORY[0x1E4F143A8];
  v206[1] = 3221225472;
  v206[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_184;
  v206[3] = &unk_1E6215490;
  v206[5] = &v207;
  v206[4] = v100;
  dispatch_sync(v28, v206);
  long long v205 = 0u;
  long long v204 = 0u;
  long long v203 = 0u;
  long long v202 = 0u;
  id v29 = (id)v208[5];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v202 objects:v262 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v203;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v203 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = *(void **)(*((void *)&v202 + 1) + 8 * m);
        v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v33 finishedWithResults:0 error:v34];
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v202 objects:v262 count:16];
    }
    while (v30);
  }

  uint64_t v196 = 0;
  v197 = &v196;
  uint64_t v198 = 0x3032000000;
  v199 = __Block_byref_object_copy_;
  v200 = __Block_byref_object_dispose_;
  id v201 = 0;
  v35 = v100->_muckingWithInFlightCollections;
  v195[0] = MEMORY[0x1E4F143A8];
  v195[1] = 3221225472;
  v195[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_185;
  v195[3] = &unk_1E6215490;
  v195[5] = &v196;
  v195[4] = v100;
  dispatch_sync(v35, v195);
  long long v194 = 0u;
  long long v193 = 0u;
  long long v192 = 0u;
  long long v191 = 0u;
  id v36 = (id)v197[5];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v191 objects:v261 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v192;
    do
    {
      for (uint64_t n = 0; n != v37; ++n)
      {
        if (*(void *)v192 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = *(void **)(*((void *)&v191 + 1) + 8 * n);
        v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v40 finishedWithError:v41];
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v191 objects:v261 count:16];
    }
    while (v37);
  }

  uint64_t v185 = 0;
  v186 = &v185;
  uint64_t v187 = 0x3032000000;
  v188 = __Block_byref_object_copy_;
  v189 = __Block_byref_object_dispose_;
  id v190 = 0;
  v42 = v100->_muckingWithInFlightCollections;
  v184[0] = MEMORY[0x1E4F143A8];
  v184[1] = 3221225472;
  v184[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_186;
  v184[3] = &unk_1E6215490;
  v184[5] = &v185;
  v184[4] = v100;
  dispatch_sync(v42, v184);
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  long long v180 = 0u;
  id v43 = (id)v186[5];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v180 objects:v260 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v181;
    do
    {
      for (iuint64_t i = 0; ii != v44; ++ii)
      {
        if (*(void *)v181 != v45) {
          objc_enumerationMutation(v43);
        }
        v47 = *(void **)(*((void *)&v180 + 1) + 8 * ii);
        v48 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v47 finishedWithError:v48 exceededResultLimit:0];
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v180 objects:v260 count:16];
    }
    while (v44);
  }

  uint64_t v174 = 0;
  v175 = &v174;
  uint64_t v176 = 0x3032000000;
  v177 = __Block_byref_object_copy_;
  v178 = __Block_byref_object_dispose_;
  id v179 = 0;
  v49 = v100->_muckingWithInFlightCollections;
  v173[0] = MEMORY[0x1E4F143A8];
  v173[1] = 3221225472;
  v173[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_187;
  v173[3] = &unk_1E6215490;
  v173[5] = &v174;
  v173[4] = v100;
  dispatch_sync(v49, v173);
  long long v172 = 0u;
  long long v171 = 0u;
  long long v170 = 0u;
  long long v169 = 0u;
  id v50 = (id)v175[5];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v169 objects:v259 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v170;
    do
    {
      for (juint64_t j = 0; jj != v51; ++jj)
      {
        if (*(void *)v170 != v52) {
          objc_enumerationMutation(v50);
        }
        v54 = *(void **)(*((void *)&v169 + 1) + 8 * jj);
        v55 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v54 finishedWithError:v55];
      }
      uint64_t v51 = [v50 countByEnumeratingWithState:&v169 objects:v259 count:16];
    }
    while (v51);
  }

  uint64_t v163 = 0;
  v164 = &v163;
  uint64_t v165 = 0x3032000000;
  v166 = __Block_byref_object_copy_;
  v167 = __Block_byref_object_dispose_;
  id v168 = 0;
  v56 = v100->_muckingWithInFlightCollections;
  v162[0] = MEMORY[0x1E4F143A8];
  v162[1] = 3221225472;
  v162[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_188;
  v162[3] = &unk_1E6215490;
  v162[5] = &v163;
  v162[4] = v100;
  dispatch_sync(v56, v162);
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v57 = (id)v164[5];
  uint64_t v58 = [v57 countByEnumeratingWithState:&v158 objects:v258 count:16];
  if (v58)
  {
    uint64_t v59 = *(void *)v159;
    do
    {
      for (kuint64_t k = 0; kk != v58; ++kk)
      {
        if (*(void *)v159 != v59) {
          objc_enumerationMutation(v57);
        }
        v61 = *(void **)(*((void *)&v158 + 1) + 8 * kk);
        v62 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v61 finishedWithError:v62];
      }
      uint64_t v58 = [v57 countByEnumeratingWithState:&v158 objects:v258 count:16];
    }
    while (v58);
  }

  uint64_t v152 = 0;
  v153 = &v152;
  uint64_t v154 = 0x3032000000;
  v155 = __Block_byref_object_copy_;
  v156 = __Block_byref_object_dispose_;
  id v157 = 0;
  v63 = v100->_muckingWithInFlightCollections;
  v151[0] = MEMORY[0x1E4F143A8];
  v151[1] = 3221225472;
  v151[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_189;
  v151[3] = &unk_1E6215490;
  v151[5] = &v152;
  v151[4] = v100;
  dispatch_sync(v63, v151);
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v64 = (id)v153[5];
  uint64_t v65 = [v64 countByEnumeratingWithState:&v147 objects:v257 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v148;
    do
    {
      for (muint64_t m = 0; mm != v65; ++mm)
      {
        if (*(void *)v148 != v66) {
          objc_enumerationMutation(v64);
        }
        v68 = *(void **)(*((void *)&v147 + 1) + 8 * mm);
        v69 = [v68 consumer];
        v70 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v69 oofRequestInfo:v68 finishedWithResult:0 error:v70];
      }
      uint64_t v65 = [v64 countByEnumeratingWithState:&v147 objects:v257 count:16];
    }
    while (v65);
  }

  uint64_t v141 = 0;
  v142 = &v141;
  uint64_t v143 = 0x3032000000;
  v144 = __Block_byref_object_copy_;
  v145 = __Block_byref_object_dispose_;
  id v146 = 0;
  v71 = v100->_muckingWithInFlightCollections;
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_190;
  v140[3] = &unk_1E6215490;
  v140[5] = &v141;
  v140[4] = v100;
  dispatch_sync(v71, v140);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v72 = (id)v142[5];
  uint64_t v73 = [v72 countByEnumeratingWithState:&v136 objects:v256 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v137;
    do
    {
      for (nuint64_t n = 0; nn != v73; ++nn)
      {
        if (*(void *)v137 != v74) {
          objc_enumerationMutation(v72);
        }
        v76 = *(void **)(*((void *)&v136 + 1) + 8 * nn);
        v77 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v76 abortWithError:v77];
      }
      uint64_t v73 = [v72 countByEnumeratingWithState:&v136 objects:v256 count:16];
    }
    while (v73);
  }

  uint64_t v130 = 0;
  v131 = &v130;
  uint64_t v132 = 0x3032000000;
  v133 = __Block_byref_object_copy_;
  v134 = __Block_byref_object_dispose_;
  id v135 = 0;
  v78 = v100->_muckingWithInFlightCollections;
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_191;
  v129[3] = &unk_1E6215490;
  v129[4] = v100;
  v129[5] = &v130;
  dispatch_sync(v78, v129);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v79 = (id)v131[5];
  uint64_t v80 = [v79 countByEnumeratingWithState:&v125 objects:v255 count:16];
  if (v80)
  {
    uint64_t v81 = *(void *)v126;
    do
    {
      for (uint64_t i1 = 0; i1 != v80; ++i1)
      {
        if (*(void *)v126 != v81) {
          objc_enumerationMutation(v79);
        }
        v83 = *(void **)(*((void *)&v125 + 1) + 8 * i1);
        v84 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_192;
        v123[3] = &unk_1E62154B8;
        id v85 = v84;
        id v124 = v85;
        [v83 asyncCallOutToDelegate:v123];
      }
      uint64_t v80 = [v79 countByEnumeratingWithState:&v125 objects:v255 count:16];
    }
    while (v80);
  }

  uint64_t v117 = 0;
  v118 = &v117;
  uint64_t v119 = 0x3032000000;
  v120 = __Block_byref_object_copy_;
  v121 = __Block_byref_object_dispose_;
  id v122 = 0;
  v86 = v100->_muckingWithInFlightCollections;
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_2;
  v116[3] = &unk_1E6215490;
  v116[4] = v100;
  v116[5] = &v117;
  dispatch_sync(v86, v116);
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v87 = (id)v118[5];
  uint64_t v88 = [v87 countByEnumeratingWithState:&v112 objects:v254 count:16];
  if (v88)
  {
    uint64_t v89 = *(void *)v113;
    do
    {
      for (uint64_t i2 = 0; i2 != v88; ++i2)
      {
        if (*(void *)v113 != v89) {
          objc_enumerationMutation(v87);
        }
        v91 = *(void **)(*((void *)&v112 + 1) + 8 * i2);
        v92 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v91 finishedWithError:v92];
      }
      uint64_t v88 = [v87 countByEnumeratingWithState:&v112 objects:v254 count:16];
    }
    while (v88);
  }

  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = __Block_byref_object_copy_;
  v110 = __Block_byref_object_dispose_;
  id v111 = 0;
  v93 = v100->_muckingWithInFlightCollections;
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_194;
  v105[3] = &unk_1E6215490;
  v105[4] = v100;
  v105[5] = &v106;
  dispatch_sync(v93, v105);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v94 = (id)v107[5];
  uint64_t v95 = [v94 countByEnumeratingWithState:&v101 objects:v253 count:16];
  if (v95)
  {
    uint64_t v96 = *(void *)v102;
    do
    {
      for (uint64_t i3 = 0; i3 != v95; ++i3)
      {
        if (*(void *)v102 != v96) {
          objc_enumerationMutation(v94);
        }
        v98 = *(void **)(*((void *)&v101 + 1) + 8 * i3);
        v99 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
        [v98 finishedWithError:v99];
      }
      uint64_t v95 = [v94 countByEnumeratingWithState:&v101 objects:v253 count:16];
    }
    while (v95);
  }

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v117, 8);

  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(&v141, 8);

  _Block_object_dispose(&v152, 8);
  _Block_object_dispose(&v163, 8);

  _Block_object_dispose(&v174, 8);
  _Block_object_dispose(&v185, 8);

  _Block_object_dispose(&v196, 8);
  _Block_object_dispose(&v207, 8);

  _Block_object_dispose(&v218, 8);
  _Block_object_dispose(&v229, 8);

  _Block_object_dispose(&v240, 8);
  _Block_object_dispose(&v247, 8);
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing ALL search queries", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_181(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Failing all folder changes", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_182(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all attachment downloads", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_183(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all calendar availability lookups", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_184(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all granted delegates list requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 128) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_185(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all update-granted-delegate-permission requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 136) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_186(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all calendar search requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_187(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all group expansions", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_188(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all share requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_189(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all settings requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_190(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all office hours requests", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 120) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_191(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing all subscribed calendar downloads", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 144) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_192(uint64_t a1, void *a2)
{
  return [a2 subscribedCalendarFailedWithError:*(void *)(a1 + 32)];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Remove all subscribed calendar junk checks", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 152) removeAllObjects];
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_194(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Remove all holiday calendar fetches", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 160) removeAllObjects];
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
      _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  [(DADConnection *)self _tearDownInFlightObjects];
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"DataAccessMonitoringConnectionFailed" object:0];

  [(DADConnection *)self setRegistered:0];
}

- (id)_connection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  muckingWithConuint64_t n = self->_muckingWithConn;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__DADConnection__connection__block_invoke;
  v5[3] = &unk_1E62154E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(muckingWithConn, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__DADConnection__connection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  if (!v3)
  {
    [v2 _initializeConnection];
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v4, v3);
}

- (void)_initializeConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (const char *)[@"com.apple.dataaccess.dataaccessd" UTF8String];
  id v4 = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service(v3, v4, 0);
  conuint64_t n = self->_conn;
  self->_conuint64_t n = mach_service;

  if (self->_conn)
  {
    -[DADConnection _initializeXPCConnection:](self, "_initializeXPCConnection:");
  }
  else
  {
    id v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = @"com.apple.dataaccess.dataaccessd";
      _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_ERROR, "Couldn't create a connection to [%@]", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_initializeConnectionWithXPCEndpoint:(id)a3
{
  id v4 = a3;
  muckingWithConuint64_t n = self->_muckingWithConn;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__DADConnection__initializeConnectionWithXPCEndpoint___block_invoke;
  v7[3] = &unk_1E6215418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(muckingWithConn, v7);
}

void __54__DADConnection__initializeConnectionWithXPCEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  xpc_connection_t v2 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  v5 = *(void **)(a1 + 32);
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
      _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_ERROR, "Couldn't create a connection to endpoint: [%@]", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_initializeXPCConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__DADConnection__initializeXPCConnection___block_invoke;
  v5[3] = &unk_1E6215508;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  xpc_connection_resume(v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__DADConnection__initializeXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x1BA9EB360]();
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
  applier[2] = __54__DADConnection__createReplyToRequest_withProperties___block_invoke;
  applier[3] = &unk_1E6215530;
  id v8 = reply;
  id v11 = v8;
  xpc_dictionary_apply(v7, applier);

  return v8;
}

uint64_t __54__DADConnection__createReplyToRequest_withProperties___block_invoke(uint64_t a1, const char *a2, void *a3)
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
        _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_DEFAULT, "Unable to read data to decode error: %@", buf, 0xCu);
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

+ (id)_dictionarySuitableForLogging:(id)a3
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  id v4 = [v3 objectForKeyedSubscript:@"kDAESubCalPasswordKey"];

  if (v4) {
    [v3 setObject:@"<redacted>" forKeyedSubscript:@"kDAESubCalPasswordKey"];
  }
  return v3;
}

+ (void)_logRequestID:(id)a3 forRequestAttributes:(id)a4 associatedContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [(id)objc_opt_class() _dictionarySuitableForLogging:v8];
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1BA3E8000, v10, OS_LOG_TYPE_DEBUG, "Received request ID [%@] for request with attributes: [%@].  Associated context: [%@]", (uint8_t *)&v12, 0x20u);
  }
}

- (void)_policyKeyChanged:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__DADConnection__policyKeyChanged___block_invoke;
  block[3] = &unk_1E6215440;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __35__DADConnection__policyKeyChanged___block_invoke()
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
      int v12 = v1;
      id v13 = v2;
      id v5 = (void *)MEMORY[0x1E4F1C9E8];
      id v6 = &v12;
      id v7 = &v10;
      uint64_t v8 = 2;
    }
    else
    {
      __int16 v14 = @"ASPolicyKey";
      id v15 = v1;
      id v5 = (void *)MEMORY[0x1E4F1C9E8];
      id v6 = &v15;
      id v7 = &v14;
      uint64_t v8 = 1;
    }
    id v9 = objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, v8, v10, v11, v12, v13, v14, v15);
    [v4 postNotificationName:@"ASPolicyKeyChangedNotification" object:v3 userInfo:v9];
  }
  else
  {
    id v4 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v0;
      _os_log_impl(&dword_1BA3E8000, v4, OS_LOG_TYPE_ERROR, "Malformed callback message from dataaccess daemon: bad account id (%@)", buf, 0xCu);
    }
  }
}

- (void)_foldersUpdated:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__DADConnection__foldersUpdated___block_invoke;
  block[3] = &unk_1E6215440;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __33__DADConnection__foldersUpdated___block_invoke()
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
    _os_log_impl(&dword_1BA3E8000, v4, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
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

void __38__DADConnection__logDataAccessStatus___block_invoke()
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
  id v7 = [v5 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v8 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "doServerContactsSearchQueryFinishedWithStatus called back with status %@", (uint8_t *)&buf, 0xCu);
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
  block[2] = __52__DADConnection__serverContactsSearchQueryFinished___block_invoke;
  block[3] = &unk_1E6215578;
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
      int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v11 error:&v22];
      id v13 = v22;
      if (!v12)
      {
        __int16 v14 = DALoggingwithCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v26 = 138412290;
          v27 = v13;
          _os_log_impl(&dword_1BA3E8000, v14, OS_LOG_TYPE_DEFAULT, "Unable to read data to decode search results: %@", v26, 0xCu);
        }
      }
      id v15 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v16 = objc_opt_class();
      id v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      uint64_t v18 = [v12 decodeObjectOfClasses:v17 forKey:@"root"];
    }
    else
    {
      id v13 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_INFO, "Could not deserialize search results from the xpc message", v26, 2u);
      }
      uint64_t v18 = 0;
    }

    v19 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v26 = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1BA3E8000, v19, OS_LOG_TYPE_DEBUG, "Search results: %@", v26, 0xCu);
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
      _os_log_impl(&dword_1BA3E8000, v18, OS_LOG_TYPE_ERROR, "received results for an unknown search query", v26, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __52__DADConnection__serverContactsSearchQueryFinished___block_invoke(void *a1)
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
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing query %@ for key %@", (uint8_t *)&v9, 0x16u);
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
  uint64_t v10 = [(DADConnection *)self decodedErrorFromData:v9];

  __int16 v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_DEBUG, "folderChange finished with status %@, error %@", buf, 0x16u);
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
  block[2] = __39__DADConnection__folderChangeFinished___block_invoke;
  block[3] = &unk_1E6215578;
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
      _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_ERROR, "received results for an unknown folderChange", v18, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __39__DADConnection__folderChangeFinished___block_invoke(void *a1)
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
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing folder change %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return [*(id *)(a1[4] + 64) removeObjectForKey:a1[5]];
}

- (void)_getStatusReportsFromClient:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __45__DADConnection__getStatusReportsFromClient___block_invoke;
  v7[3] = &unk_1E6215418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__DADConnection__getStatusReportsFromClient___block_invoke(uint64_t a1)
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
        block[2] = __35__DADConnection__downloadProgress___block_invoke;
        block[3] = &unk_1E6215578;
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

uint64_t __35__DADConnection__downloadProgress___block_invoke(void *a1)
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
  uint64_t v6 = [(DADConnection *)self decodedErrorFromData:v5];

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
        block[2] = __35__DADConnection__downloadFinished___block_invoke;
        block[3] = &unk_1E6215578;
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

uint64_t __35__DADConnection__downloadFinished___block_invoke(void *a1)
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
  uint64_t v8 = [(DADConnection *)self decodedErrorFromData:v7];

  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__DADConnection__shareResponseFinished___block_invoke;
  block[3] = &unk_1E6215578;
  uint64_t v13 = &v14;
  void block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v15[5] finishedWithError:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __40__DADConnection__shareResponseFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 104) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 104);
  return [v6 removeObjectForKey:v5];
}

- (void)_officeHoursRequestFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kDAEOfficeHoursRequestIdKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  uint64_t v8 = [(DADConnection *)self decodedErrorFromData:v7];

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DADConnection__officeHoursRequestFinished___block_invoke;
  block[3] = &unk_1E6215578;
  uint64_t v16 = &v17;
  void block[4] = self;
  id v10 = v6;
  id v15 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  uint64_t v11 = (void *)v18[5];
  if (v11)
  {
    if ([v11 isFetch])
    {
      id v12 = [v5 objectForKeyedSubscript:@"kDAEOfficeHoursDataKey"];
      if (v12)
      {
        uint64_t v13 = +[CalDAVOfficeHour officeHoursFromData:v12];
      }
      else
      {
        uint64_t v13 = 0;
      }
      [(id)v18[5] finishFetchWithOfficeHours:v13 error:v8];
    }
    else
    {
      [(id)v18[5] finishSetWithError:v8];
    }
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __45__DADConnection__officeHoursRequestFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 120) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 120);
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
    _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "_oofSettingsRequestsFinished called back with status %@", (uint8_t *)&buf, 0xCu);
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
  block[2] = __46__DADConnection__oofSettingsRequestsFinished___block_invoke;
  block[3] = &unk_1E6215578;
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
            uint64_t v19 = [[DAOofParams alloc] initWithDictionary:v13];
            uint64_t v20 = DALoggingwithCategory(0);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t v27 = 138412290;
              v28 = v19;
              _os_log_impl(&dword_1BA3E8000, v20, OS_LOG_TYPE_DEBUG, "Oof settings request results: %@", v27, 0xCu);
            }

            id v21 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
            [v21 oofRequestInfo:*(void *)(*((void *)&buf + 1) + 40) finishedWithResult:v19 error:0];
          }
          else
          {
            id v22 = DALoggingwithCategory(0);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v27 = 0;
              _os_log_impl(&dword_1BA3E8000, v22, OS_LOG_TYPE_INFO, "Could not deserialize search results from the xpc message", v27, 2u);
            }

            uint64_t v19 = [*(id *)(*((void *)&buf + 1) + 40) consumer];
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
        _os_log_impl(&dword_1BA3E8000, v14, OS_LOG_TYPE_INFO, "Status missing from the xpc message", v27, 2u);
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
      _os_log_impl(&dword_1BA3E8000, v12, OS_LOG_TYPE_ERROR, "received results for an unknown oof settings request", v27, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __46__DADConnection__oofSettingsRequestsFinished___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 112) objectForKeyedSubscript:a1[5]];
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
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Removing from inflight dictionary: oof settings request %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return [*(id *)(a1[4] + 112) removeObjectForKey:a1[5]];
}

- (void)_subscriptionCalendarJunkCheckFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kDAECheckSubscribedCalendarIsJunkIdKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  uint64_t v8 = [(DADConnection *)self decodedErrorFromData:v7];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__DADConnection__subscriptionCalendarJunkCheckFinished___block_invoke;
  block[3] = &unk_1E6215578;
  uint64_t v15 = &v16;
  void block[4] = self;
  id v10 = v6;
  id v14 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (v17[5])
  {
    __int16 v11 = [v5 objectForKeyedSubscript:@"kDAECheckSubscribedCalendarJunkStatusKey"];
    uint64_t v12 = [v11 integerValue];
    [(id)v17[5] setJunkStatus:v12];
    [(id)v17[5] finishedWithError:v8];
  }
  _Block_object_dispose(&v16, 8);
}

uint64_t __56__DADConnection__subscriptionCalendarJunkCheckFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 152) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 152);
  return [v6 removeObjectForKey:v5];
}

- (void)_holidayCalendarFetchReturnedResults:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kDAEFetchHolidayCalendarsIdKey"];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DADConnection__holidayCalendarFetchReturnedResults___block_invoke;
  block[3] = &unk_1E6215578;
  uint64_t v23 = &v24;
  void block[4] = self;
  id v8 = v6;
  id v22 = v8;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (v25[5])
  {
    int v9 = [v5 objectForKeyedSubscript:@"kDAEFetchHolidayCalendarsResultsKey"];
    id v10 = (void *)MEMORY[0x1E4F28DC0];
    __int16 v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    id v20 = 0;
    uint64_t v16 = [v10 unarchivedObjectOfClasses:v15 fromData:v9 error:&v20];
    id v17 = v20;

    if (!v16 || v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v18 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v31 = v17;
        _os_log_impl(&dword_1BA3E8000, v18, OS_LOG_TYPE_ERROR, "unable to unarchive results: %@", buf, 0xCu);
      }
    }
    uint64_t v19 = [v16 objectForKey:@"kDAEFetchHolidayCalendarsResults_FetchResultsKey"];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(id)v25[5] resultsReturned:v19];
      }
    }
  }
  _Block_object_dispose(&v24, 8);
}

uint64_t __54__DADConnection__holidayCalendarFetchReturnedResults___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (void)_holidayCalendarFetchFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kDAEFetchHolidayCalendarsIdKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  id v8 = [(DADConnection *)self decodedErrorFromData:v7];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__DADConnection__holidayCalendarFetchFinished___block_invoke;
  block[3] = &unk_1E6215578;
  uint64_t v14 = &v15;
  void block[4] = self;
  id v10 = v6;
  id v13 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  __int16 v11 = (void *)v16[5];
  if (v11) {
    [v11 finishedWithError:v8];
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __47__DADConnection__holidayCalendarFetchFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 160);
  return [v6 removeObjectForKey:v5];
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_214);
  }
  [(id)sharedConnection_gDADConnection reallyRegisterForInterrogation];
  uint64_t v2 = (void *)sharedConnection_gDADConnection;
  return v2;
}

uint64_t __33__DADConnection_sharedConnection__block_invoke()
{
  sharedConnection_gDADConnectiouint64_t n = [[DADConnection alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  return [(DADConnection *)self watchFoldersWithKeys:a3 forAccountID:a4 persistent:0];
}

- (BOOL)_checkInvalidIdExistsInXPCRely:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = MEMORY[0x1BA9EB360]();
  if (v4 == MEMORY[0x1E4F14590])
  {
    id v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    int v9 = [v8 objectForKeyedSubscript:@"kDAEInvalidAccountIDKey"];
    BOOL v7 = v9 != 0;
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_ERROR, "Unsupported XPC reply type. Reply Type: %@", (uint8_t *)&v11, 0xCu);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5
{
  BOOL v5 = a5;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (char *)a4;
  [(DADConnection *)self _resetCertWarningsForAccountId:v9 andDataclasses:127 isUserRequested:0];
  v22[0] = @"kDAEMessageNameKey";
  v22[1] = @"kDAEAccountIdKey";
  v23[0] = @"kDAEBeginMonitoringFolders";
  v23[1] = v9;
  v23[2] = v8;
  v22[2] = @"kDAEFolderIDsKey";
  v22[3] = @"kDAEPersistentMonitoringKey";
  id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  v23[3] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

  uint64_t v12 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315138;
    id v21 = "-[DADConnection watchFoldersWithKeys:forAccountID:persistent:]";
    _os_log_impl(&dword_1BA3E8000, v12, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v20, 0xCu);
  }

  uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v14 = [(DADConnection *)self _connection];
  xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(v14, v13);

  if ([(DADConnection *)self _checkInvalidIdExistsInXPCRely:v15])
  {
    if (ExchangeSyncExpressLibraryCore())
    {
      uint64_t v16 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 138543362;
        id v21 = v9;
        _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEBUG, "Retry watchFoldersWithSyncKeyMap on exchangesyncd for accountID %{public}@", (uint8_t *)&v20, 0xCu);
      }

      uint64_t v17 = [getESDConnectionClass() sharedConnection];
      char v18 = [v17 watchFoldersWithKeys:v8 forAccountID:v9 persistent:v5];
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = [(DADConnection *)self _validateXPCReply:v15];
  }

  return v18;
}

- (BOOL)resumeWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (char *)a4;
  if (self->_conn)
  {
    [(DADConnection *)self _resetCertWarningsForAccountId:v7 andDataclasses:127 isUserRequested:0];
    v19[0] = @"kDAEMessageNameKey";
    v19[1] = @"kDAEAccountIdKey";
    v20[0] = @"kDAEResumeMonitoringFolders";
    v20[1] = v7;
    v19[2] = @"kDAEFolderIDsKey";
    v20[2] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    int v9 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      char v18 = "-[DADConnection resumeWatchingFoldersWithKeys:forAccountID:]";
      _os_log_impl(&dword_1BA3E8000, v9, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v17, 0xCu);
    }

    id v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    int v11 = [(DADConnection *)self _connection];
    xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(v11, v10);

    if ([(DADConnection *)self _checkInvalidIdExistsInXPCRely:v12])
    {
      if (ExchangeSyncExpressLibraryCore())
      {
        uint64_t v13 = DALoggingwithCategory(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 138543362;
          char v18 = v7;
          _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_DEBUG, "Retry resumeWatchingFoldersWithSyncKeyMap on exchangesyncd for accountID %{public}@", (uint8_t *)&v17, 0xCu);
        }

        uint64_t v14 = [getESDConnectionClass() sharedConnection];
        char v15 = [v14 resumeWatchingFoldersWithKeys:v6 forAccountID:v7];
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = [(DADConnection *)self _validateXPCReply:v12];
    }
  }
  else
  {
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_INFO, "[DADConnection resumeWatchingFoldersWithKeys:forAccountID] called without a connection. Will not resume.", (uint8_t *)&v17, 2u);
    }
    char v15 = 0;
  }

  return v15;
}

- (BOOL)suspendWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (char *)a4;
  v19[0] = @"kDAEMessageNameKey";
  v19[1] = @"kDAEAccountIdKey";
  v20[0] = @"kDAESuspendMonitoringFolders";
  v20[1] = v7;
  v19[2] = @"kDAEFolderIDsKey";
  v20[2] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  int v9 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    char v18 = "-[DADConnection suspendWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_1BA3E8000, v9, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v17, 0xCu);
  }

  id v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  int v11 = [(DADConnection *)self _connection];
  xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(v11, v10);

  if ([(DADConnection *)self _checkInvalidIdExistsInXPCRely:v12])
  {
    if (ExchangeSyncExpressLibraryCore())
    {
      uint64_t v13 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138543362;
        char v18 = v7;
        _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_DEBUG, "Retry suspendWatchingFoldersWithKeys on exchangesyncd for accountID %{public}@", (uint8_t *)&v17, 0xCu);
      }

      uint64_t v14 = [getESDConnectionClass() sharedConnection];
      char v15 = [v14 suspendWatchingFoldersWithKeys:v6 forAccountID:v7];
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = [(DADConnection *)self _validateXPCReply:v12];
  }

  return v15;
}

- (BOOL)stopWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (char *)a4;
  v19[0] = @"kDAEMessageNameKey";
  v19[1] = @"kDAEAccountIdKey";
  v20[0] = @"kDAEStopMonitoringFolders";
  v20[1] = v7;
  v19[2] = @"kDAEFolderIDsKey";
  v20[2] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  int v9 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    char v18 = "-[DADConnection stopWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_1BA3E8000, v9, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v17, 0xCu);
  }

  id v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  int v11 = [(DADConnection *)self _connection];
  xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(v11, v10);

  if ([(DADConnection *)self _checkInvalidIdExistsInXPCRely:v12])
  {
    if (ExchangeSyncExpressLibraryCore())
    {
      uint64_t v13 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138543362;
        char v18 = v7;
        _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_DEBUG, "Retry stopWatchingFoldersWithKeys on exchangesyncd for accountID %{public}@", (uint8_t *)&v17, 0xCu);
      }

      uint64_t v14 = [getESDConnectionClass() sharedConnection];
      char v15 = [v14 stopWatchingFoldersWithKeys:v6 forAccountID:v7];
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = [(DADConnection *)self _validateXPCReply:v12];
  }

  return v15;
}

- (BOOL)_validateXPCReply:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = MEMORY[0x1BA9EB360]();
  if (v4 == MEMORY[0x1E4F14590])
  {
    id v6 = _CFXPCCreateCFObjectFromXPCObject();
    id v8 = [v6 objectForKeyedSubscript:@"kDAEStatusKey"];
    int v9 = [v8 intValue];
    BOOL v7 = v9 == 2;
    if (v9 != 2)
    {
      id v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        uint64_t v13 = (uint64_t)v8;
        _os_log_impl(&dword_1BA3E8000, v10, OS_LOG_TYPE_ERROR, "XPC Reply Failure. Status Code: %@", (uint8_t *)&v12, 0xCu);
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
      _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_ERROR, "Unsupported XPC reply type. Reply Type: %@", (uint8_t *)&v12, 0xCu);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)requestPolicyUpdateForAccountID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (ExchangeSyncExpressLibraryCore())
  {
    uint64_t v4 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_1BA3E8000, v4, OS_LOG_TYPE_DEBUG, "Send current policy key to exchangesyncd for accountID %{public}@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = [getESDConnectionClass() sharedConnection];
    char v6 = [v5 requestPolicyUpdateForAccountID:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)currentPolicyKeyForAccountID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (ExchangeSyncExpressLibraryCore())
  {
    uint64_t v4 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_1BA3E8000, v4, OS_LOG_TYPE_DEBUG, "Send current policy key to exchangesyncd for accountID %{public}@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = [getESDConnectionClass() sharedConnection];
    char v6 = [v5 currentPolicyKeyForAccountID:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
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
  id v9 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = @"stop";
    if (v7) {
      uint64_t v10 = @"start";
    }
    int v21 = 138412290;
    id v22 = (const char *)v10;
    _os_log_impl(&dword_1BA3E8000, v9, OS_LOG_TYPE_INFO, "Requesting that DataAccess %@ monitoring agents.", (uint8_t *)&v21, 0xCu);
  }

  int v11 = kDAEStopMonitoringAgents;
  if (v7) {
    int v11 = kDAEStartMonitoringAgents;
  }
  int v12 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:*v11 forKey:@"kDAEMessageNameKey"];
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  [v12 setObject:v13 forKeyedSubscript:@"kDAEAgentMonitoringToken"];

  if (v5)
  {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kDAEAgentMonitoringNeedsReply"];
    uint64_t v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    char v15 = [(DADConnection *)self _connection];
    uint64_t v16 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v15, v14);

    if (MEMORY[0x1BA9EB360](v16) == MEMORY[0x1E4F14590])
    {
      int v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      char v18 = [v17 objectForKeyedSubscript:@"kDAEStatusKey"];
      uint64_t v19 = v18;
      if (!v18 || [v18 intValue] != 2)
      {
        int v20 = DALoggingwithCategory(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136315394;
          id v22 = "-[DADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:]";
          __int16 v23 = 2112;
          uint64_t v24 = v19;
          _os_log_impl(&dword_1BA3E8000, v20, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v16 = [(DADConnection *)self _connection];
    xpc_connection_send_message(v16, v14);
  }
}

- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3
{
}

- (unint64_t)requestDaemonStopMonitoringAgents
{
  unint64_t v3 = [(id)objc_opt_class() _nextStopMonitoringStatusToken];
  [(DADConnection *)self _requestDaemonChangeAgentMonitoringStatus:0 withToken:v3 waitForReply:0];
  return v3;
}

- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3
{
}

- (unint64_t)requestDaemonStopMonitoringAgentsSync
{
  unint64_t v3 = [(id)objc_opt_class() _nextStopMonitoringStatusToken];
  [(DADConnection *)self _requestDaemonChangeAgentMonitoringStatus:0 withToken:v3 waitForReply:1];
  return v3;
}

- (void)handleAccountChange:(id)a3 callback:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v25 = v6;
    _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEFAULT, "Handling account change: %{public}@", buf, 0xCu);
  }

  if (!v6)
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)long long buf = 0;
    int v17 = "No change info given";
    goto LABEL_11;
  }
  id v9 = [v6 accountIdentifier];

  if (v9)
  {
    id v21 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v21];
    id v11 = v21;
    if (v10)
    {
      v22[0] = @"kDAEMessageNameKey";
      v22[1] = @"kDAEHandleAccountChangeDataKey";
      v23[0] = @"kDAEHandleAccountChange";
      v23[1] = v10;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      uint64_t v14 = [(DADConnection *)self _connection];
      char v15 = dispatch_get_global_queue(0, 0);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __46__DADConnection_handleAccountChange_callback___block_invoke;
      void v19[3] = &unk_1E62155A0;
      id v20 = v7;
      xpc_connection_send_message_with_reply(v14, v13, v15, v19);
    }
    else
    {
      char v18 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v25 = v11;
        _os_log_impl(&dword_1BA3E8000, v18, OS_LOG_TYPE_ERROR, "Failed to encode account change info: %@", buf, 0xCu);
      }

      if (v7) {
        (*((void (**)(id, id))v7 + 2))(v7, v11);
      }
    }

    goto LABEL_19;
  }
  uint64_t v16 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    int v17 = "No account identifier given";
LABEL_11:
    _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
  }
LABEL_12:

  if (v7)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
    (*((void (**)(id, id))v7 + 2))(v7, v11);
LABEL_19:
  }
}

void __46__DADConnection_handleAccountChange_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1BA9EB360]() == MEMORY[0x1E4F14590])
  {
    BOOL v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    id v6 = [v5 objectForKeyedSubscript:@"kDAEStatusKey"];
    id v7 = v6;
    if (v6 && [v6 intValue] == 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      int v8 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        id v11 = "-[DADConnection handleAccountChange:callback:]_block_invoke";
        __int16 v12 = 2112;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v10, 0x16u);
      }

      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"DAErrorDomain", (int)objc_msgSend(v7, "intValue"), 0);
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:10 userInfo:0];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v4);
  }
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 requireChangedFolders:(BOOL)a5 isUserRequested:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138544130;
    id v24 = v10;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    __int16 v27 = 1024;
    BOOL v28 = v7;
    __int16 v29 = 1024;
    BOOL v30 = v6;
    _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_DEBUG, "updateFolderListForAccountID %{public}@, dataclasses %lx, requireChangedFolders %d, isUserRequested %d", buf, 0x22u);
  }

  [(DADConnection *)self _resetCertWarningsForAccountId:v10 andDataclasses:a4 isUserRequested:v6];
  [(DADConnection *)self _resetThrottleTimersForAccountId:v10];
  v22[0] = @"kDAERequestFolderListUpdate";
  v22[1] = v10;
  __int16 v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", a4, @"kDAEMessageNameKey", @"kDAEAccountIdKey", @"kDAEDataclassesBitmaskKey");
  void v22[2] = v12;
  v21[3] = @"kDAERequireChangedFoldersKey";
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
  v22[3] = v13;
  v21[4] = @"kDAEIsUserRequestedKey";
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  void v22[4] = v14;
  char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];

  uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  int v17 = [(DADConnection *)self _connection];
  xpc_connection_send_message(v17, v16);

  if (ExchangeSyncExpressLibraryCore())
  {
    char v18 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      id v24 = v10;
      _os_log_impl(&dword_1BA3E8000, v18, OS_LOG_TYPE_DEBUG, "Update folder list on exchangesyncd for accountID %{public}@", buf, 0xCu);
    }

    uint64_t v19 = [getESDConnectionClass() sharedConnection];
    [v19 updateFolderListForAccountID:v10 andDataclasses:a4 requireChangedFolders:v7 isUserRequested:v6];
  }
  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  return [(DADConnection *)self updateFolderListForAccountID:a3 andDataclasses:a4 requireChangedFolders:0 isUserRequested:a5];
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclasses:(int64_t)a5 isUserRequested:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  __int16 v12 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138413058;
    id v24 = v10;
    __int16 v25 = 2114;
    id v26 = v11;
    __int16 v27 = 2048;
    int64_t v28 = a5;
    __int16 v29 = 1024;
    BOOL v30 = v6;
    _os_log_impl(&dword_1BA3E8000, v12, OS_LOG_TYPE_DEBUG, "updateContentsOfFoldersWithKeys %@ for account id %{public}@, dataclasses 0x%lx isUserRequested %d", buf, 0x26u);
  }

  [(DADConnection *)self _resetCertWarningsForAccountId:v11 andDataclasses:a5 isUserRequested:v6];
  [(DADConnection *)self _resetThrottleTimersForAccountId:v11];
  v22[0] = @"kDAERequestFolderContentsUpdate";
  v22[1] = v11;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", a5, @"kDAEMessageNameKey", @"kDAEAccountIdKey", @"kDAEDataclassesBitmaskKey");
  void v22[2] = v13;
  v21[3] = @"kDAEIsUserRequestedKey";
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  v21[4] = @"kDAEFolderIDsKey";
  v22[3] = v14;
  void v22[4] = v10;
  char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];

  uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  int v17 = [(DADConnection *)self _connection];
  xpc_connection_send_message(v17, v16);

  if (ExchangeSyncExpressLibraryCore())
  {
    char v18 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      id v24 = v11;
      _os_log_impl(&dword_1BA3E8000, v18, OS_LOG_TYPE_DEBUG, "Update contents of folders on exchangesyncd for accountID %{public}@", buf, 0xCu);
    }

    uint64_t v19 = [getESDConnectionClass() sharedConnection];
    [v19 updateContentsOfFoldersWithKeys:v10 forAccountID:v11 andDataclasses:a5 isUserRequested:v6];
  }
  return 1;
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    id v21 = v8;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    __int16 v24 = 1024;
    BOOL v25 = v5;
    _os_log_impl(&dword_1BA3E8000, v9, OS_LOG_TYPE_DEBUG, "updateContentsOfAllFoldersForAccountID %{public}@, dataclasses 0x%lxx isUserRequested %d", buf, 0x1Cu);
  }

  [(DADConnection *)self _resetCertWarningsForAccountId:v8 andDataclasses:a4 isUserRequested:v5];
  [(DADConnection *)self _resetThrottleTimersForAccountId:v8];
  v19[0] = @"kDAERequestAllFolderContentsUpdate";
  v19[1] = v8;
  id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", a4, @"kDAEMessageNameKey", @"kDAEAccountIdKey", @"kDAEDataclassesBitmaskKey");
  v19[2] = v10;
  v18[3] = @"kDAEIsUserRequestedKey";
  id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  void v19[3] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];

  uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v14 = [(DADConnection *)self _connection];
  xpc_connection_send_message(v14, v13);

  if (ExchangeSyncExpressLibraryCore())
  {
    char v15 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      id v21 = v8;
      _os_log_impl(&dword_1BA3E8000, v15, OS_LOG_TYPE_DEBUG, "Update contents of all folders on exchangesyncd for accountID %{public}@", buf, 0xCu);
    }

    uint64_t v16 = [getESDConnectionClass() sharedConnection];
    [v16 updateContentsOfAllFoldersForAccountID:v8 andDataclasses:a4 isUserRequested:v5];
  }
  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4
{
  return [(DADConnection *)self updateFolderListForAccountID:a3 andDataclasses:a4 isUserRequested:0];
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclass:(int64_t)a5
{
  return [(DADConnection *)self updateContentsOfFoldersWithKeys:a3 forAccountID:a4 andDataclass:a5 isUserRequested:0];
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclass:(int64_t)a4
{
  return [(DADConnection *)self updateContentsOfAllFoldersForAccountID:a3 andDataclass:a4 isUserRequested:0];
}

- (BOOL)performServerContactsSearch:(id)a3 forAccountWithID:(id)a4
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(DADConnection *)self _resetCertWarningsForAccountId:v7 andDataclasses:8 isUserRequested:0];
  if (v7)
  {
    id v8 = [v6 searchString];

    if (v8)
    {
      v34[0] = @"kDAEMessageNameKey";
      v34[1] = @"kDAEAccountIdKey";
      v35[0] = @"kDAEOpenServerContactsSearch";
      v35[1] = v7;
      v34[2] = @"kDAESearchQueryKey";
      uint64_t v9 = [v6 dictionaryRepresentation];
      v35[2] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];

      id v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      __int16 v12 = [(DADConnection *)self _connection];
      xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(v12, v11);

      if (MEMORY[0x1BA9EB360](v13) != MEMORY[0x1E4F14590])
      {
LABEL_4:
        char v14 = 0;
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      int v17 = [v16 objectForKeyedSubscript:@"kDAEStatusKey"];
      uint64_t v18 = [v17 integerValue];
      if (!v17 || (uint64_t v19 = v18, v18 == 2))
      {
        id v21 = [v16 objectForKeyedSubscript:@"kDAEInvalidAccountIDKey"];
        if (v21)
        {
          __int16 v22 = DALoggingwithCategory(0);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138543362;
            id v33 = v21;
            _os_log_impl(&dword_1BA3E8000, v22, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
          }

          if (!ExchangeSyncExpressLibraryCore()) {
            goto LABEL_4;
          }
          int64_t v23 = DALoggingwithCategory(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138543362;
            id v33 = v7;
            _os_log_impl(&dword_1BA3E8000, v23, OS_LOG_TYPE_DEBUG, "Perform server contact search on exchangesyncd for accountID %{public}@", buf, 0xCu);
          }

          uint64_t v16 = [getESDConnectionClass() sharedConnection];
          char v14 = [v16 performServerContactsSearch:v6 forAccountWithID:v7];
        }
        else
        {
          __int16 v24 = [v16 objectForKeyedSubscript:@"kDAESearchIDKey"];
          [v6 setSearchID:v24];
          queue = self->_muckingWithInFlightCollections;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __62__DADConnection_performServerContactsSearch_forAccountWithID___block_invoke;
          block[3] = &unk_1E6215468;
          id v29 = v6;
          id v30 = v24;
          uint64_t v31 = self;
          id v25 = v24;
          dispatch_sync(queue, block);

          char v14 = 1;
        }
      }
      else
      {
        [v6 sendResultsToConsumer:0];
        id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v19 userInfo:0];
        [v6 sendFinishedToConsumerWithError:v20];

        char v14 = 0;
      }

      goto LABEL_23;
    }
    id v10 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      char v15 = "nil search string passed to performServerContactsSearch. Refusing to attempt search";
      goto LABEL_9;
    }
  }
  else
  {
    id v10 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      char v15 = "nil accountID passed to performServerContactsSearch. Refusing to attempt search";
LABEL_9:
      _os_log_impl(&dword_1BA3E8000, v10, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    }
  }
  char v14 = 0;
LABEL_24:

  return v14;
}

uint64_t __62__DADConnection_performServerContactsSearch_forAccountWithID___block_invoke(void *a1)
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
    _os_log_impl(&dword_1BA3E8000, v2, OS_LOG_TYPE_DEBUG, "Setting search query %@ for key %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1[6] + 56) setObject:a1[4] forKeyedSubscript:a1[5]];
}

- (void)cancelServerContactsSearch:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_DEBUG, "Cancelling search task %p", (uint8_t *)&buf, 0xCu);
    }

    __int16 v8 = [v4 searchID];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    int64_t v28 = __Block_byref_object_copy_;
    id v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__DADConnection_cancelServerContactsSearch___block_invoke;
    block[3] = &unk_1E6215578;
    p_long long buf = &buf;
    void block[4] = self;
    id v10 = v8;
    id v20 = v10;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v24[0] = @"kDAEMessageNameKey";
      v24[1] = @"kDAESearchIDKey";
      v25[0] = @"kDAECancelServerContactsSearch";
      v25[1] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      __int16 v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_object_t v13 = [(DADConnection *)self _connection];
      xpc_connection_send_message(v13, v12);

      char v14 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int16 v22 = 138412290;
        id v23 = v10;
        _os_log_impl(&dword_1BA3E8000, v14, OS_LOG_TYPE_DEBUG, "Removing search query for key %@", v22, 0xCu);
      }

      char v15 = self->_muckingWithInFlightCollections;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __44__DADConnection_cancelServerContactsSearch___block_invoke_223;
      v17[3] = &unk_1E6215418;
      v17[4] = self;
      id v18 = v10;
      dispatch_sync(v15, v17);
      [v4 setSearchID:&stru_1F13E6568];
    }
    else
    {
      if (!ExchangeSyncExpressLibraryCore())
      {
LABEL_13:

        _Block_object_dispose(&buf, 8);
        goto LABEL_14;
      }
      uint64_t v16 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int16 v22 = 138412290;
        id v23 = v10;
        _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEBUG, "Cancel server contact search on exchangesyncd for searchID %@", v22, 0xCu);
      }

      id v11 = [getESDConnectionClass() sharedConnection];
      [v11 cancelServerContactsSearch:v4];
    }

    goto LABEL_13;
  }
LABEL_14:
}

uint64_t __44__DADConnection_cancelServerContactsSearch___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

uint64_t __44__DADConnection_cancelServerContactsSearch___block_invoke_223(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
}

- (BOOL)processMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (ExchangeSyncExpressLibraryCore())
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138543362;
      id v21 = v15;
      _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEBUG, "Process meeting request on exchangesyncd for accountID %{public}@", (uint8_t *)&v20, 0xCu);
    }

    int v17 = [getESDConnectionClass() sharedConnection];
    char v18 = [v17 processMeetingRequests:v11 deliveryIdsToClear:v12 deliveryIdsToSoftClear:v13 inFolderWithId:v14 forAccountWithId:v15];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (void)asyncProcessMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (ExchangeSyncExpressLibraryCore())
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138543362;
      id v19 = v15;
      _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEBUG, "Async process meeting request on exchangesyncd for accountID %{public}@", (uint8_t *)&v18, 0xCu);
    }

    int v17 = [getESDConnectionClass() sharedConnection];
    [v17 asyncProcessMeetingRequests:v11 deliveryIdsToClear:v12 deliveryIdsToSoftClear:v13 inFolderWithId:v14 forAccountWithId:v15];
  }
}

- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5 forAccountID:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (ExchangeSyncExpressLibraryCore())
  {
    id v13 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138543362;
      id v18 = v12;
      _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_DEBUG, "Set folder IDs that external clients care about on exchangesyncd for accountID %{public}@", (uint8_t *)&v17, 0xCu);
    }

    id v14 = [getESDConnectionClass() sharedConnection];
    char v15 = [v14 setFolderIdsThatExternalClientsCareAboutAdded:v9 deleted:v10 foldersTag:v11 forAccountID:v12];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6
{
  BOOL v8 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  if (ExchangeSyncExpressLibraryCore())
  {
    id v11 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138543362;
      id v14 = v10;
      _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_DEBUG, "Report folder items sync success on exchangesyncd for accountID %{public}@", (uint8_t *)&v13, 0xCu);
    }

    id v12 = [getESDConnectionClass() sharedConnection];
    [v12 reportFolderItemsSyncSuccess:v8 forFolderWithID:v9 withItemsCount:a5 andAccountWithID:v10];
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
  BOOL v8 = [(DADConnection *)self _connection];
  xpc_connection_send_message(v8, v7);

  if (v5) {
    CFRelease(v5);
  }
}

- (void)_sendXPCMessageSynchronous:(BOOL)a3 withParameters:(id)a4 handlerBlock:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  BOOL v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__DADConnection__sendXPCMessageSynchronous_withParameters_handlerBlock___block_invoke;
  aBlock[3] = &unk_1E62155A0;
  id v16 = v7;
  id v9 = v7;
  id v10 = (void (**)(void *, xpc_object_t))_Block_copy(aBlock);
  id v11 = [(DADConnection *)self _connection];
  id v12 = v11;
  if (v5)
  {
    xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(v11, v8);

    v10[2](v10, v13);
    id v12 = (_xpc_connection_s *)v13;
  }
  else
  {
    id v14 = dispatch_get_global_queue(0, 0);
    xpc_connection_send_message_with_reply(v12, v8, v14, v10);
  }
}

void __72__DADConnection__sendXPCMessageSynchronous_withParameters_handlerBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v6 = v3;
    BOOL v4 = MEMORY[0x1BA9EB360]() == MEMORY[0x1E4F14590];
    id v3 = v6;
    if (v4)
    {
      BOOL v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      id v3 = v6;
    }
  }
}

- (id)beginDownloadingAttachmentWithUUID:(id)a3 accountID:(id)a4 queue:(id)a5 progressBlock:(id)a6 completionBlock:(id)a7
{
  v50[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1BA3E8000, v17, OS_LOG_TYPE_INFO, "Requesting download of attachment UUID %@ for accountID %{public}@", buf, 0x16u);
  }

  id v18 = [[DADownloadContext alloc] initWithAttachmentUUID:v12 accountID:v13 queue:v14 downloadProgressBlock:v15 completionBlock:v16];
  v49[0] = @"kDAEMessageNameKey";
  v49[1] = @"kDAEAttachmentUUIDKey";
  v50[0] = @"kDAEBeginDownloadingAttachment";
  v50[1] = v12;
  v49[2] = @"kDAEAccountIdKey";
  v50[2] = v13;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __98__DADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke;
  uint64_t v32 = &unk_1E62155F0;
  uint64_t v20 = v18;
  id v33 = v20;
  uint64_t v37 = buf;
  id v21 = v12;
  id v34 = v21;
  id v22 = v13;
  id v35 = v22;
  id v36 = self;
  uint64_t v38 = &v39;
  [(DADConnection *)self _sendXPCMessageSynchronous:1 withParameters:v19 handlerBlock:&v29];
  if (*((unsigned char *)v40 + 24) && ExchangeSyncExpressLibraryCore())
  {
    id v23 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v43 = 138543362;
      id v44 = v22;
      _os_log_impl(&dword_1BA3E8000, v23, OS_LOG_TYPE_DEBUG, "Begin download attachment on exchangesyncd for accountID %{public}@", v43, 0xCu);
    }

    __int16 v24 = objc_msgSend(getESDConnectionClass(), "sharedConnection", v29, v30, v31, v32, v33, v34);
    uint64_t v25 = [v24 beginDownloadingAttachmentWithUUID:v21 accountID:v22 queue:v14 progressBlock:v15 completionBlock:v16];
    uint64_t v26 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v25;
  }
  id v27 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(buf, 8);

  return v27;
}

void __98__DADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 objectForKeyedSubscript:@"kDAEInvalidAccountIDKey"];
  if (v4)
  {
    BOOL v5 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v25 = v4;
      _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
    uint64_t v7 = [v6 integerValue];
    if (v6) {
      BOOL v8 = v7 == 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      uint64_t v9 = [v3 objectForKeyedSubscript:@"kDAEAttachmentDownloadIdKey"];
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      id v12 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412802;
        uint64_t v25 = v13;
        __int16 v26 = 2114;
        uint64_t v27 = v14;
        __int16 v28 = 2114;
        uint64_t v29 = v15;
        _os_log_impl(&dword_1BA3E8000, v12, OS_LOG_TYPE_INFO, "Download context %@ set up for downloading attachment UUID %{public}@ on accountID %{public}@", buf, 0x20u);
      }

      uint64_t v16 = *(void *)(a1 + 56);
      int v17 = *(NSObject **)(v16 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__DADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_231;
      block[3] = &unk_1E62155C8;
      uint64_t v18 = *(void *)(a1 + 64);
      void block[4] = v16;
      uint64_t v23 = v18;
      id v22 = *(id *)(a1 + 32);
      dispatch_sync(v17, block);
    }
    else
    {
      uint64_t v19 = *(void **)(a1 + 32);
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v7 userInfo:0];
      [v19 finishedWithError:v20];
    }
  }
}

uint64_t __98__DADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_231(void *a1)
{
  return [*(id *)(a1[4] + 72) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)_cancelDownloadsWithIDs:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
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
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        v13[0] = 0;
        v13[1] = v13;
        v13[2] = 0x3032000000;
        v13[3] = __Block_byref_object_copy_;
        v13[4] = __Block_byref_object_dispose_;
        id v14 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __47__DADConnection__cancelDownloadsWithIDs_error___block_invoke;
        block[3] = &unk_1E6215578;
        void block[5] = v9;
        void block[6] = v13;
        void block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        _Block_object_dispose(v13, 8);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

uint64_t __47__DADConnection__cancelDownloadsWithIDs_error___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 72);
  return [v6 removeObjectForKey:v5];
}

- (void)cancelDownloadingAttachmentWithDownloadID:(id)a3 error:(id)a4
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v19[0] = @"kDAECancelDownloadingAttachment";
  v18[0] = @"kDAEMessageNameKey";
  v18[1] = @"kDAEErrorDataKey";
  uint64_t v7 = (void *)MEMORY[0x1E4F28DB0];
  id v8 = a4;
  uint64_t v9 = [v7 archivedDataWithRootObject:v8];
  v18[2] = @"kDAEAttachmentDownloadIdKey";
  v19[1] = v9;
  v19[2] = v6;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  id v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_INFO, "Cancelling Download of attachment with downloadID %@", buf, 0xCu);
  }

  [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v10 handlerBlock:0];
  id v15 = v6;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [(DADConnection *)self _cancelDownloadsWithIDs:v12 error:v8];

  if (ExchangeSyncExpressLibraryCore())
  {
    id v13 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_DEBUG, "Canceling downloading attachments on exchangesyncd for downloadIDs %@", buf, 0xCu);
    }

    id v14 = [getESDConnectionClass() sharedConnection];
    [v14 cancelDownloadingAttachmentWithDownloadID:v6 error:0];
  }
}

- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, id, id, void *))a7;
  long long v16 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    int64_t v30 = a3;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2114;
    id v34 = v13;
    _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEBUG, "Requesting share response %ld for calendar %@ for accountID %{public}@", buf, 0x20u);
  }

  if (v12 && v13)
  {
    id v17 = [[DASharedCalendarContext alloc] initWithCalendarID:v12 accountID:v13 queue:v14 completionBlock:v15];
    [(DASharedCalendarContext *)v17 setShouldSyncCalendar:a3 == 1];
    v27[0] = @"kDAEMessageNameKey";
    v27[1] = @"kDAEAccountIdKey";
    v28[0] = @"kDAERespondToSharedCalendar";
    v28[1] = v13;
    v27[2] = @"kDAESharedCalendarReponseTypeKey";
    long long v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    v27[3] = @"kDAESharedCalendarResponseCalendarIDKey";
    v28[2] = v18;
    v28[3] = v12;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __97__DADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke;
    v22[3] = &unk_1E6215618;
    uint64_t v23 = v17;
    id v24 = v12;
    id v25 = v13;
    __int16 v26 = self;
    uint64_t v20 = v17;
    [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v19 handlerBlock:v22];
  }
  else
  {
    id v21 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v21, OS_LOG_TYPE_ERROR, "Not continuing with respondToSharedCalendarInvite. Given calendarId or accountId is nil.", buf, 2u);
    }

    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
    v15[2](v15, v12, v13, v19);
  }
}

void __97__DADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"kDAESharedCalendarActionIdKey"];
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "Share request %@ set up for sharing calendar id %@ on accountID %{public}@", buf, 0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = *(NSObject **)(v11 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__DADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_234;
    block[3] = &unk_1E6215468;
    void block[4] = v11;
    id v17 = v7;
    id v18 = *(id *)(a1 + 32);
    id v13 = v7;
    dispatch_sync(v12, block);
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    [v14 finishedWithError:v15];
  }
}

uint64_t __97__DADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_234(void *a1)
{
  return [*(id *)(a1[4] + 104) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id, id, void *))a6;
  id v14 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    id v27 = v10;
    __int16 v28 = 2114;
    id v29 = v11;
    _os_log_impl(&dword_1BA3E8000, v14, OS_LOG_TYPE_DEBUG, "Reporting calendar %@ for accountID %{public}@ as junk", buf, 0x16u);
  }

  if (v10 && v11)
  {
    id v15 = [[DASharedCalendarContext alloc] initWithCalendarID:v10 accountID:v11 queue:v12 completionBlock:v13];
    [(DASharedCalendarContext *)v15 setShouldSyncCalendar:0];
    v24[0] = @"kDAEMessageNameKey";
    v24[1] = @"kDAEAccountIdKey";
    v25[0] = @"kDAEReportSharedCalendarAsJunk";
    v25[1] = v11;
    void v24[2] = @"kDAESharedCalendarResponseCalendarIDKey";
    void v25[2] = v10;
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__DADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke;
    void v19[3] = &unk_1E6215618;
    uint64_t v20 = v15;
    id v21 = v10;
    id v22 = v11;
    __int16 v23 = self;
    id v17 = v15;
    [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v16 handlerBlock:v19];
  }
  else
  {
    id v18 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v18, OS_LOG_TYPE_ERROR, "Not continuing with reportSharedCalendarInviteAsJunkForCalendarWithID. Given calendarId or accountId is nil.", buf, 2u);
    }

    long long v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
    v13[2](v13, v10, v11, v16);
  }
}

void __99__DADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"kDAESharedCalendarActionIdKey"];
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = *(NSObject **)(v11 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__DADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_235;
    block[3] = &unk_1E6215468;
    void block[4] = v11;
    id v17 = v7;
    id v18 = *(id *)(a1 + 32);
    id v13 = v7;
    dispatch_sync(v12, block);
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    [v14 finishedWithError:v15];
  }
}

uint64_t __99__DADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_235(void *a1)
{
  return [*(id *)(a1[4] + 104) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)fetchOfficeHoursForAccountWithID:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v23 = v8;
    _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_DEBUG, "Fetching office hours for accountID %{public}@", buf, 0xCu);
  }

  id v12 = objc_opt_new();
  [v12 setAccountID:v8];
  [v12 setQueue:v10];

  [v12 setFetchCompletionBlock:v9];
  v20[0] = @"kDAEMessageNameKey";
  v20[1] = @"kDAEAccountIdKey";
  v21[0] = @"kDAEFetchOfficeHours";
  v21[1] = v8;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__DADConnection_fetchOfficeHoursForAccountWithID_queue_completionBlock___block_invoke;
  v16[3] = &unk_1E6215640;
  id v17 = v12;
  id v18 = v8;
  uint64_t v19 = self;
  id v14 = v8;
  id v15 = v12;
  [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v13 handlerBlock:v16];
}

void __72__DADConnection_fetchOfficeHoursForAccountWithID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"kDAEOfficeHoursRequestIdKey"];
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "Office hours fetch request %{public}@ set up for accountID %{public}@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(NSObject **)(v10 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__DADConnection_fetchOfficeHoursForAccountWithID_queue_completionBlock___block_invoke_237;
    block[3] = &unk_1E6215468;
    void block[4] = v10;
    id v16 = v7;
    id v17 = *(id *)(a1 + 32);
    id v12 = v7;
    dispatch_sync(v11, block);
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    [v13 abortWithError:v14];
  }
}

uint64_t __72__DADConnection_fetchOfficeHoursForAccountWithID_queue_completionBlock___block_invoke_237(void *a1)
{
  return [*(id *)(a1[4] + 120) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)setOfficeHours:(id)a3 forAccountWithID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id, void *))a6;
  id v14 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v27 = v11;
    _os_log_impl(&dword_1BA3E8000, v14, OS_LOG_TYPE_DEBUG, "Setting office hours for accountID %{public}@", buf, 0xCu);
  }

  if (!v10)
  {
    id v16 = 0;
LABEL_8:
    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:91 userInfo:0];
    v13[2](v13, v11, v18);
    goto LABEL_9;
  }
  uint64_t v15 = +[CalDAVOfficeHour dataFromOfficeHours:v10];
  id v16 = (void *)v15;
  if (!v11 || !v15) {
    goto LABEL_8;
  }
  id v17 = objc_opt_new();
  [v17 setAccountID:v11];
  [v17 setQueue:v12];
  [v17 setSetCompletionBlock:v13];
  v24[0] = @"kDAEMessageNameKey";
  v24[1] = @"kDAEAccountIdKey";
  v25[0] = @"kDAESetOfficeHours";
  v25[1] = v11;
  void v24[2] = @"kDAEOfficeHoursDataKey";
  void v25[2] = v16;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __71__DADConnection_setOfficeHours_forAccountWithID_queue_completionBlock___block_invoke;
  v20[3] = &unk_1E6215640;
  id v21 = v17;
  id v22 = v11;
  id v23 = self;
  id v19 = v17;
  [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v18 handlerBlock:v20];

LABEL_9:
}

void __71__DADConnection_setOfficeHours_forAccountWithID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"kDAEOfficeHoursRequestIdKey"];
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      id v19 = v7;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "Office hours set request %{public}@ set up for accountID %{public}@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = *(NSObject **)(v10 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__DADConnection_setOfficeHours_forAccountWithID_queue_completionBlock___block_invoke_238;
    block[3] = &unk_1E6215468;
    void block[4] = v10;
    id v16 = v7;
    id v17 = *(id *)(a1 + 32);
    id v12 = v7;
    dispatch_sync(v11, block);
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    [v13 abortWithError:v14];
  }
}

uint64_t __71__DADConnection_setOfficeHours_forAccountWithID_queue_completionBlock___block_invoke_238(void *a1)
{
  return [*(id *)(a1[4] + 120) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)reportSubscriptionCalendarAsJunk:(id)a3
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Marking a subscription calendar as junk", v7, 2u);
  }

  v8[0] = @"kDAEMessageNameKey";
  v8[1] = @"kDAEURLStringKey";
  v9[0] = @"kDAEReportSubscribedCalendarAsJunk";
  v9[1] = v4;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v6 handlerBlock:&__block_literal_global_240];
}

- (void)checkSubscriptionCalendarIsJunk:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, __CFString *, void, void *))a5;
  id v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_DEBUG, "Checking whether a subscription calendar is junk", buf, 2u);
  }

  if (v8)
  {
    id v12 = [[DACheckSubscribedCalendarIsJunkContext alloc] initWithURLString:v8 completionBlock:v10];
    [(DACheckSubscribedCalendarIsJunkContext *)v12 setQueue:v9];
    v21[0] = @"kDAEMessageNameKey";
    v21[1] = @"kDAEURLStringKey";
    v22[0] = @"kDAECheckSubscribedCalendarIsJunk";
    v22[1] = v8;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__DADConnection_checkSubscriptionCalendarIsJunk_queue_completionBlock___block_invoke;
    v16[3] = &unk_1E6215640;
    id v17 = v12;
    id v18 = v8;
    id v19 = self;
    id v14 = v12;
    [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v13 handlerBlock:v16];
  }
  else
  {
    uint64_t v15 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v15, OS_LOG_TYPE_ERROR, "Not continuing with checkSubscriptionCalendarIsJunk. Given urlString is nil.", buf, 2u);
    }

    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
    v10[2](v10, &stru_1F13E6568, 0, v13);
  }
}

void __71__DADConnection_checkSubscriptionCalendarIsJunk_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"kDAECheckSubscribedCalendarIsJunkIdKey"];
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "Check junk request %@ set up for subscribed calendar URL %@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = *(NSObject **)(v10 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__DADConnection_checkSubscriptionCalendarIsJunk_queue_completionBlock___block_invoke_242;
    block[3] = &unk_1E6215468;
    void block[4] = v10;
    id v16 = v7;
    id v17 = *(id *)(a1 + 32);
    id v12 = v7;
    dispatch_sync(v11, block);
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    [v13 finishedWithError:v14];
  }
}

uint64_t __71__DADConnection_checkSubscriptionCalendarIsJunk_queue_completionBlock___block_invoke_242(void *a1)
{
  return [*(id *)(a1[4] + 152) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)fetchAvailableHolidayCalendarsWithResultsBlock:(id)a3 completionBlock:(id)a4 queue:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, NSObject *))a4;
  id v10 = a5;
  id v11 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_DEBUG, "Fetching list of available holiday calendars", buf, 2u);
  }

  if (v9)
  {
    if (v8)
    {
      id v12 = [[DAHolidayCalendarsFetchContext alloc] initWithResultsBlock:v8 completionBlock:v9];
      [(DAHolidayCalendarsFetchContext *)v12 setQueue:v10];
      __int16 v20 = @"kDAEMessageNameKey";
      v21[0] = @"kDAEFetchHolidayCalendars";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __86__DADConnection_fetchAvailableHolidayCalendarsWithResultsBlock_completionBlock_queue___block_invoke;
      v16[3] = &unk_1E6215688;
      id v17 = v12;
      id v18 = self;
      id v14 = v12;
      [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v13 handlerBlock:v16];
    }
    else
    {
      uint64_t v15 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1BA3E8000, v15, OS_LOG_TYPE_ERROR, "Not continuing with fetchAvailableHolidayCalendarsWithResultsBlock. resultsBlock is null.", buf, 2u);
      }

      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
      v9[2](v9, v13);
    }
  }
  else
  {
    id v13 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_ERROR, "Not continuing with fetchAvailableHolidayCalendarsWithResultsBlock. completionBlock is null.", buf, 2u);
    }
  }
}

void __86__DADConnection_fetchAvailableHolidayCalendarsWithResultsBlock_completionBlock_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"kDAEFetchHolidayCalendarsIdKey"];
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "Holiday calendar fetch request set up: %@", buf, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(NSObject **)(v9 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__DADConnection_fetchAvailableHolidayCalendarsWithResultsBlock_completionBlock_queue___block_invoke_244;
    block[3] = &unk_1E6215468;
    void block[4] = v9;
    id v15 = v7;
    id v16 = *(id *)(a1 + 32);
    id v11 = v7;
    dispatch_sync(v10, block);
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    [v12 finishedWithError:v13];
  }
}

uint64_t __86__DADConnection_fetchAvailableHolidayCalendarsWithResultsBlock_completionBlock_queue___block_invoke_244(void *a1)
{
  return [*(id *)(a1[4] + 160) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (BOOL)processFolderChange:(id)a3 forAccountWithID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (ExchangeSyncExpressLibraryCore())
  {
    uint64_t v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_DEBUG, "Process folder change on exchangesyncd for accountID %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v8 = [getESDConnectionClass() sharedConnection];
    char v9 = [v8 processFolderChange:v5 forAccountWithID:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)statusReports
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v21 = @"kDAEMessageNameKey";
  v22[0] = @"kDAEGetStatusReports";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(DADConnection *)self _connection];
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __30__DADConnection_statusReports__block_invoke;
  handler[3] = &unk_1E62156B0;
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

void __30__DADConnection_statusReports__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1BA9EB360]() == MEMORY[0x1E4F14590])
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = [v4 objectForKeyedSubscript:@"kDAEStatusReportsKey"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [v4 objectForKeyedSubscript:@"kDAEStatusKey"];
    dispatch_time_t v9 = v8;
    if (!v8 || [v8 intValue] != 2)
    {
      id v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315394;
        id v12 = "-[DADConnection statusReports]_block_invoke";
        __int16 v13 = 2112;
        id v14 = v9;
        _os_log_impl(&dword_1BA3E8000, v10, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reallyRegisterForInterrogation
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_statusReportBlock && ![(DADConnection *)self registered])
  {
    [(DADConnection *)self setRegistered:1];
    id v3 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1BA3E8000, v3, OS_LOG_TYPE_INFO, "Sending message: kDAERegisterForInterrogation", v7, 2u);
    }

    id v8 = @"kDAEMessageNameKey";
    v9[0] = @"kDAERegisterForInterrogation";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v6 = [(DADConnection *)self _connection];
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
  if (ExchangeSyncExpressLibraryCore())
  {
    uint64_t v2 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BA3E8000, v2, OS_LOG_TYPE_DEBUG, "Fill out current EAS timezone info on exchangesyncd", v4, 2u);
    }

    id v3 = [getESDConnectionClass() sharedConnection];
    [v3 fillOutCurrentEASTimeZoneInfo];
  }
}

- (id)activeSyncDeviceIdentifier
{
  if (ExchangeSyncExpressLibraryCore())
  {
    uint64_t v2 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1BA3E8000, v2, OS_LOG_TYPE_DEBUG, "Get active sync device identifier on exchangesyncd", v6, 2u);
    }

    id v3 = [getESDConnectionClass() sharedConnection];
    id v4 = [v3 activeSyncDeviceIdentifier];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)_performOofSettingsRequest:(id)a3 forAccountWithID:(id)a4 forUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  v38[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v37[0] = @"kDAEMessageNameKey";
    v37[1] = @"kDAEAccountIdKey";
    v38[0] = @"kDAEOofSettings";
    v38[1] = v9;
    v37[2] = @"kDAEOofIsUpdateKey";
    int v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    v38[2] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
    __int16 v13 = [v10 initWithDictionary:v12];

    if (v5)
    {
      id v14 = [v8 dictionaryRepresentation];
      [v13 setObject:v14 forKeyedSubscript:@"kDAEOofSettingsRequestKey"];
    }
    uint64_t v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    id v16 = [(DADConnection *)self _connection];
    xpc_object_t v17 = xpc_connection_send_message_with_reply_sync(v16, v15);

    if (MEMORY[0x1BA9EB360](v17) == MEMORY[0x1E4F14590])
    {
      uint64_t v19 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      id v29 = [v19 objectForKeyedSubscript:@"kDAEOofRequestIDKey"];
      objc_msgSend(v8, "setRequestID:");
      uint64_t v30 = v19;
      id v20 = [v19 objectForKeyedSubscript:@"kDAEStatusKey"];
      uint64_t v21 = [v20 integerValue];
      if (v20) {
        BOOL v22 = v21 == 2;
      }
      else {
        BOOL v22 = 1;
      }
      BOOL v18 = v22;
      if (v22)
      {
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__DADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke;
        block[3] = &unk_1E62156D8;
        BOOL v35 = v5;
        id v32 = v8;
        id v27 = v29;
        id v33 = v29;
        id v34 = self;
        dispatch_sync(muckingWithInFlightCollections, block);

        uint64_t v25 = v32;
      }
      else
      {
        uint64_t v24 = v21;
        uint64_t v25 = [v8 consumer];
        __int16 v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v24 userInfo:0];
        [v25 oofRequestInfo:v8 finishedWithResult:0 error:v26];

        id v27 = v29;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    __int16 v13 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_ERROR, "nil accountID passed to performASSettingsRequest. Cannot continue.", buf, 2u);
    }
    BOOL v18 = 0;
  }

  return v18;
}

uint64_t __71__DADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1BA3E8000, v2, OS_LOG_TYPE_DEBUG, "Adding to inflight dictionary: oof %@ request %@ for key %@", (uint8_t *)&v7, 0x20u);
  }

  return [*(id *)(*(void *)(a1 + 48) + 112) setObject:*(void *)(a1 + 32) forKeyedSubscript:*(void *)(a1 + 40)];
}

- (BOOL)retrieveOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (ExchangeSyncExpressLibraryCore())
  {
    int v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_DEBUG, "Retrieve OOF settings on exchangesyncd for accountID %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v8 = [getESDConnectionClass() sharedConnection];
    char v9 = [v8 retrieveOofSettingsRequest:v5 forAccountWithID:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)updateOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (ExchangeSyncExpressLibraryCore())
  {
    int v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_DEBUG, "Update OOF settings on exchangesyncd for accountID %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v8 = [getESDConnectionClass() sharedConnection];
    char v9 = [v8 updateOofSettingsRequest:v5 forAccountWithID:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)isOofSettingsSupportedForAccountWithID:(id)a3 completionBlock:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (ExchangeSyncExpressLibraryCore())
  {
    int v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_DEBUG, "Checking OOF supported on exchangesyncd for accountID %{public}@", (uint8_t *)&v9, 0xCu);
    }

    id v8 = [getESDConnectionClass() sharedConnection];
    [v8 isOofSettingsSupportedForAccountWithID:v5 completionBlock:v6];
  }
}

- (id)requestCalendarAvailabilityWithAccountID:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8 completionBlock:(id)a9
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v49 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy_;
  id v64 = __Block_byref_object_dispose_;
  id v65 = 0;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  if (!v15)
  {
    uint64_t v21 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v67 = 0;
      BOOL v22 = "Invalid 'accountID' provided: [%{public}@].";
      id v23 = v21;
      uint32_t v24 = 12;
      goto LABEL_9;
    }
LABEL_10:

    id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
    goto LABEL_11;
  }
  if (!v16 || !v17 || [v16 compare:v17] == 1)
  {
    uint64_t v21 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v67 = v16;
      __int16 v68 = 2112;
      id v69 = v17;
      BOOL v22 = "Invalid 'startDate' [%@] and/or 'endDate' [%@] provided.";
      id v23 = v21;
      uint32_t v24 = 22;
LABEL_9:
      _os_log_impl(&dword_1BA3E8000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v18 && [v18 count])
  {
    uint64_t v38 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138544386;
      id v67 = v15;
      __int16 v68 = 2112;
      id v69 = v16;
      __int16 v70 = 2112;
      id v71 = v17;
      __int16 v72 = 2112;
      id v73 = v49;
      __int16 v74 = 2112;
      id v75 = v18;
      _os_log_impl(&dword_1BA3E8000, v38, OS_LOG_TYPE_DEBUG, "Preparing calendar availability request.  accountID: [%{public}@] startDate: [%@] endDate: [%@] ignoredEventID: [%@] addresses: [%@]", buf, 0x34u);
    }

    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v39 setObject:@"kDAERequestCalendarAvailability" forKey:@"kDAEMessageNameKey"];
    [v39 setObject:v15 forKey:@"kDAEAccountIdKey"];
    [v39 setObject:v16 forKey:@"kDAEStartDateKey"];
    [v39 setObject:v17 forKey:@"kDAEEndDateKey"];
    [v39 setObject:v18 forKey:@"kDAEAddressesKey"];
    if (v49) {
      [v39 setObject:v49 forKey:@"kDAEIgnoredEventIDKey"];
    }
    id v47 = v20;
    id v51 = v47;
    v52[1] = &v60;
    id v40 = v19;
    v52[0] = v40;
    id v50 = v39;
    v52[2] = &v56;
    BOOL v35 = v50;
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 1);
    if (*((unsigned char *)v57 + 24) && ExchangeSyncExpressLibraryCore())
    {
      uint64_t v41 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        id v67 = v15;
        _os_log_impl(&dword_1BA3E8000, v41, OS_LOG_TYPE_DEBUG, "Retry request calendar availability on exchangesyncd for accountID %{public}@", buf, 0xCu);
      }

      char v42 = [getESDConnectionClass() sharedConnection];
      uint64_t v43 = [v42 requestCalendarAvailabilityWithAccountID:v15 startDate:v16 endDate:v17 ignoredEventID:v49 addresses:v18 resultsBlock:v40 completionBlock:v47];
      id v44 = (void *)v61[5];
      v61[5] = v43;
    }
    id v33 = v20;
    id v46 = v17;
    *(void *)type = v16;
    id v28 = v15;
    id v29 = v18;
    id v30 = v19;
    id v25 = 0;
    id v32 = &v51;
    id v34 = (id *)v52;
    goto LABEL_15;
  }
  uint64_t v45 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BA3E8000, v45, OS_LOG_TYPE_DEBUG, "No 'addresses' provided.", buf, 2u);
  }

  id v25 = 0;
LABEL_11:
  __int16 v26 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BA3E8000, v26, OS_LOG_TYPE_DEFAULT, "Will not issue calendar availability request.", buf, 2u);
  }

  if (v20)
  {
    id v27 = v20;
    id v46 = v17;
    *(void *)type = v16;
    id v28 = v15;
    id v29 = v18;
    id v30 = v19;
    __int16 v31 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E6215700;
    id v32 = &v55;
    id v33 = v27;
    id v55 = v27;
    id v34 = &v54;
    id v25 = v25;
    id v54 = v25;
    BOOL v35 = v31;
    dispatch_async(v31, block);
LABEL_15:

    id v18 = v29;
    id v15 = v28;
    id v17 = v46;
    id v16 = *(id *)type;
    id v19 = v30;
    id v20 = v33;
  }
  id v36 = (id)v61[5];

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  return v36;
}

uint64_t __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_251(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"kDAEInvalidAccountIDKey"];
  if (v4)
  {
    id v5 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      id v23 = v4;
      _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
    uint64_t v7 = [v6 integerValue];
    if (v6) {
      BOOL v8 = v7 == 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      uint64_t v9 = [v3 objectForKeyedSubscript:@"kDAECalendarAvailabilityRequestIDKey"];
      uint64_t v10 = *(void *)(a1[8] + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      id v12 = [[DAECalendarAvailabilityContext alloc] initWithResultsBlock:a1[7] completionBlock:a1[6]];
      [(id)objc_opt_class() _logRequestID:*(void *)(*(void *)(a1[8] + 8) + 40) forRequestAttributes:a1[5] associatedContext:v12];
      uint64_t v13 = a1[4];
      id v14 = *(NSObject **)(v13 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2;
      block[3] = &unk_1E62155C8;
      uint64_t v15 = a1[8];
      id v20 = v12;
      uint64_t v21 = v15;
      void block[4] = v13;
      id v16 = v12;
      dispatch_sync(v14, block);
    }
    else
    {
      uint64_t v17 = a1[6];
      id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v7 userInfo:0];
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
    }
  }
}

uint64_t __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 80) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v22[0] = @"kDAEMessageNameKey";
    v22[1] = @"kDAECalendarAvailabilityRequestIDKey";
    v23[0] = @"kDAECancelCalendarAvailabilityRequest";
    v23[1] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v6 handlerBlock:0];
    *(void *)long long buf = 0;
    uint64_t v15 = buf;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy_;
    id v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__DADConnection_cancelCalendarAvailabilityRequestWithID___block_invoke;
    block[3] = &unk_1E6215578;
    uint64_t v13 = buf;
    void block[4] = self;
    id v8 = v5;
    id v12 = v8;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*((void *)v15 + 5))
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
      [*((id *)v15 + 5) finishedWithError:v9];
    }
    else
    {
      uint64_t v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v20 = 138412290;
        id v21 = v8;
        _os_log_impl(&dword_1BA3E8000, v10, OS_LOG_TYPE_DEBUG, "Retry canceling calendar availability request on exchangesyncd for requestID %@", v20, 0xCu);
      }

      uint64_t v9 = [getESDConnectionClass() sharedConnection];
      [v9 cancelCalendarAvailabilityRequestWithID:v8];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_DEBUG, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }
}

uint64_t __57__DADConnection_cancelCalendarAvailabilityRequestWithID___block_invoke(void *a1)
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
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAECalendarAvailabilityResultsKey"];
  id v8 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  id v22 = 0;
  id v14 = [v8 unarchivedObjectOfClasses:v13 fromData:v7 error:&v22];
  id v15 = v22;

  if (!v14)
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  __int16 v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__DADConnection__calendarAvailabilityRequestReturnedResults___block_invoke;
  block[3] = &unk_1E6215578;
  p_long long buf = &buf;
  void block[4] = self;
  id v18 = v6;
  id v20 = v18;
  dispatch_sync(muckingWithInFlightCollections, block);
  [*(id *)(*((void *)&buf + 1) + 40) resultsReturned:v14];

  _Block_object_dispose(&buf, 8);
}

uint64_t __61__DADConnection__calendarAvailabilityRequestReturnedResults___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (void)_calendarAvailabilityRequestFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v6 = [v5 objectForKeyedSubscript:@"kDAECalendarAvailabilityRequestIDKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  id v8 = [(DADConnection *)self decodedErrorFromData:v7];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DADConnection__calendarAvailabilityRequestFinished___block_invoke;
  block[3] = &unk_1E6215578;
  uint64_t v13 = &v14;
  void block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v15[5] finishedWithError:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __54__DADConnection__calendarAvailabilityRequestFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 80);
  return [v6 removeObjectForKey:v5];
}

- (id)downloadSubscribedCalendarWithURL:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 setObject:@"kDAEDownloadSubscribedCalendar" forKey:@"kDAEMessageNameKey"];
    [v12 setObject:v8 forKey:@"kDAESubCalDownloadURLKey"];
    uint64_t v13 = objc_alloc_init(DAESubscriptionCalendarDownloadContext);
    [(DAESubscriptionCalendarDownloadContext *)v13 setQueue:v9];
    [(DAESubscriptionCalendarDownloadContext *)v13 setDelegate:v11];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    __int16 v26 = __Block_byref_object_copy_;
    id v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_2;
    void v18[3] = &unk_1E6215750;
    uint64_t v14 = v13;
    id v22 = &v23;
    id v19 = v14;
    id v20 = self;
    id v15 = v12;
    id v21 = v15;
    [(DADConnection *)self _sendXPCMessageSynchronous:1 withParameters:v15 handlerBlock:v18];
    id v16 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke;
    block[3] = &unk_1E6215440;
    id v30 = v10;
    dispatch_async(v9, block);
    id v16 = 0;
    id v15 = v30;
  }

  return v16;
}

void __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
  [v1 subscribedCalendarFailedWithError:v2];
}

void __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"kDAESubCalDownloadRequestIDKey"];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [(id)objc_opt_class() _logRequestID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forRequestAttributes:*(void *)(a1 + 48) associatedContext:*(void *)(a1 + 32)];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(NSObject **)(v10 + 24);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_4;
    v16[3] = &unk_1E62155C8;
    uint64_t v12 = *(void *)(a1 + 56);
    void v16[4] = v10;
    uint64_t v18 = v12;
    id v17 = *(id *)(a1 + 32);
    dispatch_sync(v11, v16);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    uint64_t v14 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_3;
    void v19[3] = &unk_1E62154B8;
    id v20 = v13;
    id v15 = v13;
    [v14 callOutToDelegate:v19];
  }
}

uint64_t __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 subscribedCalendarFailedWithError:*(void *)(a1 + 32)];
}

uint64_t __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_4(void *a1)
{
  return [*(id *)(a1[4] + 144) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)cancelDownloadingSubscriptionCalendarWithDownloadID:(id)a3
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v22[0] = @"kDAEMessageNameKey";
    v22[1] = @"kDAESubCalDownloadRequestIDKey";
    v23[0] = @"kDAECancelDownloadSubscribedCalendar";
    v23[1] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v6 handlerBlock:0];
    *(void *)long long buf = 0;
    id v17 = buf;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy_;
    id v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__DADConnection_cancelDownloadingSubscriptionCalendarWithDownloadID___block_invoke;
    block[3] = &unk_1E6215578;
    id v15 = buf;
    void block[4] = self;
    id v14 = v5;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*((void *)v17 + 5))
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
      uint64_t v9 = (void *)*((void *)v17 + 5);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __69__DADConnection_cancelDownloadingSubscriptionCalendarWithDownloadID___block_invoke_2;
      v11[3] = &unk_1E62154B8;
      id v10 = v8;
      id v12 = v10;
      [v9 asyncCallOutToDelegate:v11];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_DEBUG, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }
}

uint64_t __69__DADConnection_cancelDownloadingSubscriptionCalendarWithDownloadID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 144) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  BOOL v6 = *(void **)(a1[4] + 144);
  return [v6 removeObjectForKey:v5];
}

uint64_t __69__DADConnection_cancelDownloadingSubscriptionCalendarWithDownloadID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 subscribedCalendarFailedWithError:*(void *)(a1 + 32)];
}

- (void)_downloadSubscribedCalendarProgress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  BOOL v6 = [v5 objectForKeyedSubscript:@"kDAESubCalDownloadRequestIDKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEDownloadedBytesKey"];
  uint64_t v8 = [v7 longLongValue];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"kDAETotalBytesKey"];
  uint64_t v10 = [v9 longLongValue];

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__DADConnection__downloadSubscribedCalendarProgress___block_invoke;
  block[3] = &unk_1E6215578;
  id v17 = &v18;
  void block[4] = self;
  id v12 = v6;
  id v16 = v12;
  dispatch_sync(muckingWithInFlightCollections, block);
  uint64_t v13 = (void *)v19[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__DADConnection__downloadSubscribedCalendarProgress___block_invoke_2;
  v14[3] = &__block_descriptor_48_e49_v16__0___DAESubscribedCalendarDownloadDelegate__8l;
  v14[4] = v8;
  v14[5] = v10;
  [v13 callOutToDelegate:v14];

  _Block_object_dispose(&v18, 8);
}

uint64_t __53__DADConnection__downloadSubscribedCalendarProgress___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 144) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

uint64_t __53__DADConnection__downloadSubscribedCalendarProgress___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 subscribedCalendarProgressedTo:*(void *)(a1 + 32) totalBytes:*(void *)(a1 + 40)];
}

- (void)_downloadSubscribedCalendarFinished:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v19 = [v4 objectForKeyedSubscript:@"kDAESubCalDownloadRequestIDKey"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kDAESubCalDownloadSummaryDataKey"];
  if (v5)
  {
    id v27 = 0;
    BOOL v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v27];
    id v7 = v27;
    if (!v6)
    {
      uint64_t v8 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_ERROR, "Error unarchiving subcal summary data: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  uint64_t v9 = [v4 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  if (v9)
  {
    id v26 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v26];
    id v11 = v26;
    if (!v10)
    {
      id v12 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1BA3E8000, v12, OS_LOG_TYPE_ERROR, "Error unarchiving subcal download error: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (!(v5 | v10))
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:10 userInfo:0];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy_;
  __int16 v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__DADConnection__downloadSubscribedCalendarFinished___block_invoke;
  block[3] = &unk_1E6215578;
  p_long long buf = &buf;
  void block[4] = self;
  id v14 = v19;
  id v24 = v14;
  dispatch_sync(muckingWithInFlightCollections, block);
  id v15 = *(void **)(*((void *)&buf + 1) + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __53__DADConnection__downloadSubscribedCalendarFinished___block_invoke_2;
  v20[3] = &unk_1E6215798;
  id v16 = v6;
  id v21 = v16;
  id v17 = (id)v10;
  id v22 = v17;
  [v15 callOutToDelegate:v20];

  _Block_object_dispose(&buf, 8);
}

uint64_t __53__DADConnection__downloadSubscribedCalendarFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 144) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  BOOL v6 = *(void **)(a1[4] + 144);
  return [v6 removeObjectForKey:v5];
}

uint64_t __53__DADConnection__downloadSubscribedCalendarFinished___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend(a2, "subscribedCalendarDidFinishLoading:");
  }
  else {
    return [a2 subscribedCalendarFailedWithError:*(void *)(a1 + 40)];
  }
}

- (void)_downloadSubscribedCalendarRequiresPassword:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  BOOL v6 = [v5 objectForKeyedSubscript:@"kDAESubCalDownloadRequestIDKey"];
  id v7 = [v5 objectForKeyedSubscript:@"kDAESubCalDownloadURLKey"];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke;
  block[3] = &unk_1E6215578;
  id v19 = &v20;
  void block[4] = self;
  id v9 = v6;
  id v18 = v9;
  dispatch_sync(muckingWithInFlightCollections, block);
  uint64_t v10 = (void *)v21[5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke_2;
  v13[3] = &unk_1E62157E8;
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  id v16 = self;
  [v10 callOutToDelegate:v13];

  _Block_object_dispose(&v20, 8);
}

uint64_t __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 144) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

void __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke_2(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke_3;
  v7[3] = &unk_1E62157C0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [a2 subscribedCalendarRequiresPassword:v4 withContinuation:v7];
}

void __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void v13[4] = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    v12[0] = @"kDAEMessageNameKey";
    v12[1] = @"kDAESubCalDownloadRequestIDKey";
    uint64_t v5 = *(void *)(a1 + 32);
    v13[0] = @"kDAESetPasswordForSubscribedCalendar";
    v13[1] = v5;
    v12[2] = @"kDAESubCalUsernameKey";
    v12[3] = @"kDAESubCalPasswordKey";
    v13[2] = a2;
    v13[3] = a3;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    id v7 = a3;
    id v8 = a2;
    id v9 = [v6 dictionaryWithObjects:v13 forKeys:v12 count:4];
    [*(id *)(a1 + 40) _sendXPCMessageSynchronous:0 withParameters:v9 handlerBlock:0];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v8 = a3;
    id v9 = a2;
    [v11 cancelDownloadingSubscriptionCalendarWithDownloadID:v10];
  }
}

- (void)validateCandidateSubscriptionURLWithICloud:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v6 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__DADConnection_validateCandidateSubscriptionURLWithICloud_queue_completionBlock___block_invoke;
  block[3] = &unk_1E6215810;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)a4, block);
}

uint64_t __82__DADConnection_validateCandidateSubscriptionURLWithICloud_queue_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestGrantedDelegatesListForAccountID:(id)a3 resultsBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (v6)
  {
    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      id v34 = v6;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "Preparing granted delegates list request for accountID: [%{public}@]", buf, 0xCu);
    }

    v31[0] = @"kDAEMessageNameKey";
    v31[1] = @"kDAEAccountIdKey";
    v32[0] = @"kDAERequestGrantedDelegatesList";
    v32[1] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__DADConnection_requestGrantedDelegatesListForAccountID_resultsBlock___block_invoke;
    v16[3] = &unk_1E6215838;
    id v10 = v7;
    id v18 = v10;
    id v19 = &v25;
    void v16[4] = self;
    id v11 = v9;
    id v17 = v11;
    uint64_t v20 = &v21;
    [(DADConnection *)self _sendXPCMessageSynchronous:1 withParameters:v11 handlerBlock:v16];
    if (*((unsigned char *)v22 + 24))
    {
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:15 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v12);
    }
    goto LABEL_11;
  }
  uint64_t v13 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v34 = 0;
    _os_log_impl(&dword_1BA3E8000, v13, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%{public}@].", buf, 0xCu);
  }

  if (v7)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v11);
LABEL_11:
  }
  id v14 = (id)v26[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

void __70__DADConnection_requestGrantedDelegatesListForAccountID_resultsBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v9 = [v3 objectForKeyedSubscript:@"kDAEInvalidAccountIDKey"];
    if (v9)
    {
      id v7 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v22 = v9;
        _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    }
    else
    {
      uint64_t v10 = [v3 objectForKeyedSubscript:@"kDAEGrantedDelegatesListRequestIDKey"];
      uint64_t v11 = *(void *)(a1[7] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = [[DAEGrantedDelegatesListContext alloc] initWithResultsBlock:a1[6]];
      [(id)objc_opt_class() _logRequestID:*(void *)(*(void *)(a1[7] + 8) + 40) forRequestAttributes:a1[5] associatedContext:v13];
      uint64_t v14 = a1[4];
      id v15 = *(NSObject **)(v14 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__DADConnection_requestGrantedDelegatesListForAccountID_resultsBlock___block_invoke_2;
      block[3] = &unk_1E62155C8;
      uint64_t v16 = a1[7];
      id v19 = v13;
      uint64_t v20 = v16;
      void block[4] = v14;
      id v17 = v13;
      dispatch_sync(v15, block);
    }
  }
  else
  {
    uint64_t v8 = a1[6];
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

uint64_t __70__DADConnection_requestGrantedDelegatesListForAccountID_resultsBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 128) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)cancelGrantedDelegatesListRequestWithID:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v18[0] = @"kDAEMessageNameKey";
    v18[1] = @"kDAEGrantedDelegatesListRequestIDKey";
    v19[0] = @"kDAECancelGrantedDelegatesListRequest";
    v19[1] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v6 handlerBlock:0];
    *(void *)long long buf = 0;
    uint64_t v13 = buf;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy_;
    uint64_t v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__DADConnection_cancelGrantedDelegatesListRequestWithID___block_invoke;
    block[3] = &unk_1E6215578;
    uint64_t v11 = buf;
    void block[4] = self;
    id v10 = v5;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*((void *)v13 + 5))
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
      [*((id *)v13 + 5) finishedWithResults:0 error:v8];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v6 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_DEBUG, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }
}

uint64_t __57__DADConnection_cancelGrantedDelegatesListRequestWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 128) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  BOOL v6 = *(void **)(a1[4] + 128);
  return [v6 removeObjectForKey:v5];
}

- (void)_grantedDelegatesListRequestFinished:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kDAEGrantedDelegatesListRequestIDKey"];
  BOOL v6 = [v4 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  id v7 = [(DADConnection *)self decodedErrorFromData:v6];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"kDAEGrantedDelegatesListResultsKey"];
  id v9 = (void *)MEMORY[0x1E4F28DC0];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  id v22 = 0;
  uint64_t v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v8 error:&v22];
  id v14 = v22;

  if (!v13)
  {
    id v15 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1BA3E8000, v15, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DADConnection__grantedDelegatesListRequestFinished___block_invoke;
  block[3] = &unk_1E6215578;
  p_long long buf = &buf;
  void block[4] = self;
  id v17 = v5;
  id v20 = v17;
  dispatch_sync(muckingWithInFlightCollections, block);
  [*(id *)(*((void *)&buf + 1) + 40) finishedWithResults:v13 error:v7];

  _Block_object_dispose(&buf, 8);
}

uint64_t __54__DADConnection__grantedDelegatesListRequestFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 128) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  BOOL v6 = *(void **)(a1[4] + 128);
  return [v6 removeObjectForKey:v5];
}

- (id)updateGrantedDelegateForAccountID:(id)a3 grantedDelegate:(id)a4 action:(int64_t)a5 resultsBlock:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy_;
  uint64_t v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  if (v9)
  {
    id v12 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [v10 uri];
      uint64_t v14 = [v10 permission];
      *(_DWORD *)long long buf = 138543874;
      id v40 = v9;
      __int16 v41 = 2112;
      char v42 = v13;
      __int16 v43 = 2048;
      uint64_t v44 = v14;
      _os_log_impl(&dword_1BA3E8000, v12, OS_LOG_TYPE_DEBUG, "Preparing update granted delegate permission for accountID: [%{public}@], delegate uri: %@, permission: %ld", buf, 0x20u);
    }
    id v28 = 0;
    id v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v28];
    id v16 = v28;
    if (v16)
    {
      id v17 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v10 uri];
        *(_DWORD *)long long buf = 138412290;
        id v40 = v18;
        _os_log_impl(&dword_1BA3E8000, v17, OS_LOG_TYPE_DEFAULT, "Unable to encode granted delegate with URI: %@", buf, 0xCu);
      }
    }
    else
    {
      v37[0] = @"kDAEMessageNameKey";
      v37[1] = @"kDAEAccountIdKey";
      v38[0] = @"kDAEUpdateGrantedDelegatePermissionRequest";
      v38[1] = v9;
      v37[2] = @"kDAEGrantedDelegateKey";
      v38[2] = v15;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __87__DADConnection_updateGrantedDelegateForAccountID_grantedDelegate_action_resultsBlock___block_invoke;
      void v23[3] = &unk_1E6215838;
      id v25 = v11;
      id v26 = &v31;
      v23[4] = self;
      id v17 = v20;
      uint64_t v24 = v17;
      id v27 = v29;
      [(DADConnection *)self _sendXPCMessageSynchronous:1 withParameters:v17 handlerBlock:v23];
    }
    goto LABEL_13;
  }
  id v19 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v40 = 0;
    _os_log_impl(&dword_1BA3E8000, v19, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%{public}@].", buf, 0xCu);
  }

  if (v11)
  {
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
    (*((void (**)(id, id))v11 + 2))(v11, v16);
LABEL_13:
  }
  id v21 = (id)v32[5];
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

  return v21;
}

void __87__DADConnection_updateGrantedDelegateForAccountID_grantedDelegate_action_resultsBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v8 = [v3 objectForKeyedSubscript:@"kDAEInvalidAccountIDKey"];
    if (v8)
    {
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    }
    else
    {
      uint64_t v9 = [v3 objectForKeyedSubscript:@"kDAEUpdateGrantedDelegatePermissionRequestIDKey"];
      uint64_t v10 = *(void *)(a1[7] + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      id v12 = [[DAEUpdateGrantedDelegatePermissionContext alloc] initWithResultsBlock:a1[6]];
      [(id)objc_opt_class() _logRequestID:*(void *)(*(void *)(a1[7] + 8) + 40) forRequestAttributes:a1[5] associatedContext:v12];
      uint64_t v13 = a1[4];
      uint64_t v14 = *(NSObject **)(v13 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87__DADConnection_updateGrantedDelegateForAccountID_grantedDelegate_action_resultsBlock___block_invoke_2;
      block[3] = &unk_1E62155C8;
      uint64_t v15 = a1[7];
      id v18 = v12;
      uint64_t v19 = v15;
      void block[4] = v13;
      id v16 = v12;
      dispatch_sync(v14, block);
    }
  }
  else
  {
    uint64_t v7 = a1[6];
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

uint64_t __87__DADConnection_updateGrantedDelegateForAccountID_grantedDelegate_action_resultsBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 136) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)addExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toAccountWithID:(id)a5 completion:(id)a6
{
  BOOL v6 = (void (**)(id, void, uint64_t, void *))a6;
  uint64_t v7 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_ERROR, "Exchange delegates are not supported on this platform", v9, 2u);
  }

  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:10 userInfo:0];
  v6[2](v6, 0, -1, v8);
}

- (void)removeExchangeDelegateWithSourceID:(id)a3 fromParentAccountWithID:(id)a4 completion:(id)a5
{
  uint64_t v5 = (void (**)(id, void, void *))a5;
  BOOL v6 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_ERROR, "Exchange delegates are not supported on this platform", v8, 2u);
  }

  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:10 userInfo:0];
  v5[2](v5, 0, v7);
}

- (void)_updateGrantedDelegatePermissionRequestFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  BOOL v6 = [v5 objectForKeyedSubscript:@"kDAEUpdateGrantedDelegatePermissionRequestIDKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAEErrorDataKey"];
  uint64_t v8 = [(DADConnection *)self decodedErrorFromData:v7];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__DADConnection__updateGrantedDelegatePermissionRequestFinished___block_invoke;
  block[3] = &unk_1E6215578;
  uint64_t v13 = &v14;
  void block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v15[5] finishedWithError:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __65__DADConnection__updateGrantedDelegatePermissionRequestFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 136) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  BOOL v6 = *(void **)(a1[4] + 136);
  return [v6 removeObjectForKey:v5];
}

- (id)performCalendarDirectorySearchWithAccountID:(id)a3 terms:(id)a4 recordTypes:(id)a5 resultLimit:(unint64_t)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy_;
  uint64_t v56 = __Block_byref_object_dispose_;
  id v57 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  if (v14)
  {
    if (v15 && [v15 count])
    {
      if (v16 && [v16 count])
      {
        id v19 = DALoggingwithCategory(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138544130;
          id v59 = v14;
          __int16 v60 = 2112;
          id v61 = v16;
          __int16 v62 = 2048;
          unint64_t v63 = a6;
          __int16 v64 = 2112;
          id v65 = v15;
          _os_log_impl(&dword_1BA3E8000, v19, OS_LOG_TYPE_DEBUG, "Preparing calendar directory search.  accountID: [%{public}@] recordTypes:[%@] resultLimit: [%lu] terms: [%@]", buf, 0x2Au);
        }

        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v20 setObject:@"kDAEPerformCalendarDirectorySearch" forKey:@"kDAEMessageNameKey"];
        [v20 setObject:v14 forKey:@"kDAEAccountIdKey"];
        id v21 = [v15 allObjects];
        [v20 setObject:v21 forKey:@"kDAECalendarDirectorySearchTermsKey"];

        id v22 = [v16 allObjects];
        [v20 setObject:v22 forKey:@"kDAECalendarDirectorySearchRecordTypesKey"];

        uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a6];
        [v20 setObject:v23 forKey:@"kDAECalendarDirectorySearchResultLimitKey"];

        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_261;
        v40[3] = &unk_1E6215728;
        id v39 = v18;
        id v43 = v39;
        v44[1] = &v52;
        id v24 = v17;
        v44[0] = v24;
        id v25 = v20;
        __int16 v41 = v25;
        char v42 = self;
        v44[2] = &v48;
        [(DADConnection *)self _sendXPCMessageSynchronous:1 withParameters:v25 handlerBlock:v40];
        if (*((unsigned char *)v49 + 24) && ExchangeSyncExpressLibraryCore())
        {
          id v26 = DALoggingwithCategory(0);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138543362;
            id v59 = v14;
            _os_log_impl(&dword_1BA3E8000, v26, OS_LOG_TYPE_DEBUG, "Retry calendar directory search on exchangesyncd for accountID %{public}@", buf, 0xCu);
          }

          id v27 = [getESDConnectionClass() sharedConnection];
          uint64_t v28 = [v27 performCalendarDirectorySearchWithAccountID:v14 terms:v15 recordTypes:v16 resultLimit:a6 resultsBlock:v24 completionBlock:v39];
          uint64_t v29 = (void *)v53[5];
          v53[5] = v28;
        }
        id v30 = 0;
        uint64_t v31 = &v43;
        id v32 = (id *)v44;
        goto LABEL_27;
      }
      uint64_t v33 = DALoggingwithCategory(0);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_22;
      }
      *(_WORD *)long long buf = 0;
      id v34 = "No 'recordTypes' provided.";
    }
    else
    {
      uint64_t v33 = DALoggingwithCategory(0);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
LABEL_22:

        id v30 = 0;
        goto LABEL_23;
      }
      *(_WORD *)long long buf = 0;
      id v34 = "No 'terms' provided.";
    }
    _os_log_impl(&dword_1BA3E8000, v33, OS_LOG_TYPE_DEBUG, v34, buf, 2u);
    goto LABEL_22;
  }
  uint64_t v35 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v59 = 0;
    _os_log_impl(&dword_1BA3E8000, v35, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%{public}@].", buf, 0xCu);
  }

  id v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
LABEL_23:
  id v36 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BA3E8000, v36, OS_LOG_TYPE_DEFAULT, "Will not issue calendar directory search.", buf, 2u);
  }

  if (v18)
  {
    id v25 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E6215700;
    uint64_t v31 = &v47;
    id v47 = v18;
    id v32 = &v46;
    id v30 = v30;
    id v46 = v30;
    dispatch_async(v25, block);
LABEL_27:
  }
  id v37 = (id)v53[5];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v37;
}

uint64_t __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_261(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v9 = [v3 objectForKeyedSubscript:@"kDAEInvalidAccountIDKey"];
    if (v9)
    {
      uint64_t v7 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        id v25 = v9;
        _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
    }
    else
    {
      uint64_t v10 = [v3 objectForKeyedSubscript:@"kDAECalendarDirectorySearchIDKey"];
      uint64_t v11 = *(void *)(a1[8] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = [[DAECalendarDirectorySearchContext alloc] initWithResultsBlock:a1[7] completionBlock:a1[6]];
      id v14 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = *(void **)(*(void *)(a1[8] + 8) + 40);
        uint64_t v16 = a1[4];
        *(_DWORD *)long long buf = 138412802;
        id v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v16;
        __int16 v28 = 2112;
        uint64_t v29 = v13;
        _os_log_impl(&dword_1BA3E8000, v14, OS_LOG_TYPE_DEBUG, "Received search ID [%@] for search with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
      }

      uint64_t v17 = a1[5];
      id v18 = *(NSObject **)(v17 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_263;
      block[3] = &unk_1E62155C8;
      uint64_t v19 = a1[8];
      id v22 = v13;
      uint64_t v23 = v19;
      void block[4] = v17;
      id v20 = v13;
      dispatch_sync(v18, block);
    }
  }
  else
  {
    uint64_t v8 = a1[6];
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
}

uint64_t __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_263(void *a1)
{
  return [*(id *)(a1[4] + 88) setObject:a1[5] forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v23[0] = @"kDAEMessageNameKey";
    v23[1] = @"kDAECalendarDirectorySearchIDKey";
    v24[0] = @"kDAECancelCalendarDirectorySearch";
    v24[1] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v6 handlerBlock:0];
    *(void *)id v15 = 0;
    uint64_t v16 = v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy_;
    uint64_t v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__DADConnection_cancelCalendarDirectorySearchWithID___block_invoke;
    block[3] = &unk_1E6215578;
    id v14 = v15;
    void block[4] = self;
    id v8 = v5;
    id v13 = v8;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*((void *)v16 + 5))
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:-1 userInfo:0];
      [*((id *)v16 + 5) finishedWithError:v9 exceededResultLimit:0];
      uint64_t v10 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v22 = v8;
        _os_log_impl(&dword_1BA3E8000, v10, OS_LOG_TYPE_DEBUG, "Cancelled calendar directory search with ID: [%@].", buf, 0xCu);
      }
    }
    else
    {
      if (!ExchangeSyncExpressLibraryCore())
      {
LABEL_13:

        _Block_object_dispose(v15, 8);
        goto LABEL_14;
      }
      uint64_t v11 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v22 = v8;
        _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_DEBUG, "Retry canceling calendar directory search on exchangesyncd for searchID %@", buf, 0xCu);
      }

      uint64_t v9 = [getESDConnectionClass() sharedConnection];
      [v9 cancelCalendarDirectorySearchWithID:v8];
    }

    goto LABEL_13;
  }
  BOOL v6 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_DEBUG, "nil 'searchID' provided.  Will not cancel any calendar directory searches.", v15, 2u);
  }
LABEL_14:
}

uint64_t __53__DADConnection_cancelCalendarDirectorySearchWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  BOOL v6 = *(void **)(a1[4] + 88);
  return [v6 removeObjectForKey:v5];
}

- (void)_calendarDirectorySearchReturnedResults:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  BOOL v6 = [v5 objectForKeyedSubscript:@"kDAECalendarDirectorySearchIDKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kDAECalendarDirectorySearchResultsKey"];
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
      _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }
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
  block[2] = __57__DADConnection__calendarDirectorySearchReturnedResults___block_invoke;
  block[3] = &unk_1E6215578;
  p_long long buf = &buf;
  void block[4] = self;
  id v18 = v6;
  id v25 = v18;
  dispatch_sync(muckingWithInFlightCollections, block);
  uint64_t v19 = [v14 count];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __57__DADConnection__calendarDirectorySearchReturnedResults___block_invoke_2;
  void v22[3] = &unk_1E6215860;
  id v21 = v20;
  id v23 = v21;
  [v14 enumerateKeysAndObjectsUsingBlock:v22];
  [*(id *)(*((void *)&buf + 1) + 40) resultsReturned:v21];

  _Block_object_dispose(&buf, 8);
}

uint64_t __57__DADConnection__calendarDirectorySearchReturnedResults___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

void __57__DADConnection__calendarDirectorySearchReturnedResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  id v8 = [(DADConnection *)self decodedErrorFromData:v7];
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
  id v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__DADConnection__calendarDirectorySearchFinished___block_invoke;
  block[3] = &unk_1E6215578;
  uint64_t v16 = &v17;
  void block[4] = self;
  id v13 = v6;
  id v15 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  [(id)v18[5] finishedWithError:v8 exceededResultLimit:v11];

  _Block_object_dispose(&v17, 8);
}

uint64_t __50__DADConnection__calendarDirectorySearchFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 88);
  return [v6 removeObjectForKey:v5];
}

- (void)performGroupExpansionWithAccountID:(id)a3 principalPath:(id)a4 completionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9 && [v9 length])
    {
      uint64_t v11 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543618;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_impl(&dword_1BA3E8000, v11, OS_LOG_TYPE_DEBUG, "Preparing group expansion.  accountID: [%{public}@]  principalPath: [%@]", buf, 0x16u);
      }

      uint64_t v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v12 setObject:@"kDAEPerformGroupExpansion" forKey:@"kDAEMessageNameKey"];
      [v12 setObject:v8 forKey:@"kDAEAccountIdKey"];
      [v12 setObject:v9 forKey:@"kDAEGroupExpansionPrincipalPathKey"];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke_266;
      void v18[3] = &unk_1E6215888;
      id v13 = &v19;
      void v18[4] = self;
      id v19 = v10;
      [(DADConnection *)self _sendXPCMessageSynchronous:0 withParameters:v12 handlerBlock:v18];
      id v14 = 0;
      goto LABEL_17;
    }
    id v15 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BA3E8000, v15, OS_LOG_TYPE_DEBUG, "No 'principalPath' provided.", buf, 2u);
    }

    id v14 = 0;
  }
  else
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v24 = 0;
      _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%{public}@].", buf, 0xCu);
    }

    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:93 userInfo:0];
  }
  uint64_t v17 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BA3E8000, v17, OS_LOG_TYPE_DEFAULT, "Will not do group expansion.", buf, 2u);
  }

  if (v10)
  {
    uint64_t v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke;
    block[3] = &unk_1E6215700;
    id v13 = &v22;
    id v22 = v10;
    id v14 = v14;
    id v21 = v14;
    dispatch_async(v12, block);

LABEL_17:
  }
}

uint64_t __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke_266(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"kDAEStatusKey"];
  uint64_t v5 = [v4 integerValue];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = [v3 objectForKeyedSubscript:@"kDAEInvalidAccountIDKey"];
    if (v7)
    {
      id v8 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        id v22 = v7;
        _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
      }

      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:15 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v10);
    }
    else
    {
      id v13 = [v3 objectForKeyedSubscript:@"kDAEGroupExpansionIDKey"];
      id v14 = [[DAEGroupExpansionContext alloc] initWithCompletionBlock:*(void *)(a1 + 40)];
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(NSObject **)(v15 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke_2;
      block[3] = &unk_1E6215468;
      void block[4] = v15;
      id v19 = v13;
      id v20 = v14;
      uint64_t v17 = v14;
      id v10 = v13;
      dispatch_sync(v16, block);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DAErrorDomain" code:v5 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
}

uint64_t __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 96) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)_groupExpansionFinished:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  BOOL v6 = [v5 objectForKeyedSubscript:@"kDAEGroupExpansionIDKey"];
  id v7 = [v5 objectForKeyedSubscript:@"kDAECalendarDirectorySearchResultsKey"];
  id v8 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  id v28 = 0;
  id v14 = [v8 unarchivedObjectOfClasses:v13 fromData:v7 error:&v28];
  id v15 = v28;

  if (!v14)
  {
    uint64_t v16 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1BA3E8000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }
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
  block[2] = __41__DADConnection__groupExpansionFinished___block_invoke;
  block[3] = &unk_1E6215578;
  p_long long buf = &buf;
  void block[4] = self;
  id v18 = v6;
  id v26 = v18;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (v15
    || ([v5 objectForKeyedSubscript:@"kDAEErrorDataKey"],
        id v19 = objc_claimAutoreleasedReturnValue(),
        [(DADConnection *)self decodedErrorFromData:v19],
        id v15 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v15))
  {
    [*(id *)(*((void *)&buf + 1) + 40) finishedWithError:v15];
  }
  else
  {
    uint64_t v20 = [v14 count];
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v20];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __41__DADConnection__groupExpansionFinished___block_invoke_2;
    void v23[3] = &unk_1E6215860;
    id v22 = v21;
    id v24 = v22;
    [v14 enumerateKeysAndObjectsUsingBlock:v23];
    [*(id *)(*((void *)&buf + 1) + 40) setResults:v22];
    [*(id *)(*((void *)&buf + 1) + 40) finishedWithError:0];

    id v15 = 0;
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __41__DADConnection__groupExpansionFinished___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 96) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  BOOL v6 = *(void **)(a1[4] + 96);
  return [v6 removeObjectForKey:v5];
}

void __41__DADConnection__groupExpansionFinished___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithArray:v6];

  [*(id *)(a1 + 32) setObject:v8 forKey:v7];
}

- (DADConnection)init
{
  uint64_t v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Should never call -init on DADConnection.  Use +sharedConnection... instead." userInfo:0];
  [v3 raise];

  return 0;
}

- (id)_init
{
  v40.receiver = self;
  v40.super_class = (Class)DADConnection;
  uint64_t v2 = [(DADConnection *)&v40 init];
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
    inFlightGrantedDelegatesListRequests = v2->_inFlightGrantedDelegatesListRequests;
    v2->_inFlightGrantedDelegatesListRequests = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    inFlightUpdateGrantedDelegatePermissionRequests = v2->_inFlightUpdateGrantedDelegatePermissionRequests;
    v2->_inFlightUpdateGrantedDelegatePermissionRequests = (NSMutableDictionary *)v21;

    uint64_t v23 = objc_opt_new();
    inFlightCalendarDirectorySearches = v2->_inFlightCalendarDirectorySearches;
    v2->_inFlightCalendarDirectorySearches = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    inFlightGroupExpansions = v2->_inFlightGroupExpansions;
    v2->_inFlightGroupExpansions = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_opt_new();
    inFlightShareRequests = v2->_inFlightShareRequests;
    v2->_inFlightShareRequests = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_opt_new();
    inFlightOofSettingsRequests = v2->_inFlightOofSettingsRequests;
    v2->_inFlightOofSettingsRequests = (NSMutableDictionary *)v29;

    uint64_t v31 = objc_opt_new();
    inFlightOfficeHoursRequests = v2->_inFlightOfficeHoursRequests;
    v2->_inFlightOfficeHoursRequests = (NSMutableDictionary *)v31;

    uint64_t v33 = objc_opt_new();
    inFlightSubscribedCalendarDownloads = v2->_inFlightSubscribedCalendarDownloads;
    v2->_inFlightSubscribedCalendarDownloads = (NSMutableDictionary *)v33;

    uint64_t v35 = objc_opt_new();
    inFlightSubscribedCalendarJunkChecks = v2->_inFlightSubscribedCalendarJunkChecks;
    v2->_inFlightSubscribedCalendarJunkChecks = (NSMutableDictionary *)v35;

    uint64_t v37 = objc_opt_new();
    inFlightHolidayCalendarFetches = v2->_inFlightHolidayCalendarFetches;
    v2->_inFlightHolidayCalendarFetches = (NSMutableDictionary *)v37;

    [(DADConnection *)v2 _registerForAppResumedNotification];
  }
  return v2;
}

- (void)dealloc
{
  [(DADConnection *)self _tearDownInFlightObjects];
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DADConnection;
  [(DADConnection *)&v4 dealloc];
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
    *(_DWORD *)long long buf = 138543362;
    uint64_t v21 = accountIdsWithAlreadyResetCerts;
    _os_log_impl(&dword_1BA3E8000, v9, OS_LOG_TYPE_DEBUG, "in _resetCertWarningsForAccount, _accountIdsWithAlreadyResetCerts is %{public}@", buf, 0xCu);
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
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", a4, @"kDAEMessageNameKey", @"kDAEAccountIdKey", @"kDAEDataclassesBitmaskKey", @"kDAEResetCertWarnings", v8);
    v19[2] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:3];

    uint64_t v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    uint64_t v16 = [(DADConnection *)v11 _connection];
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
    __int16 v19 = 2114;
    uint64_t v20 = accountIdsWithAlreadyResetThrottleTimers;
    _os_log_impl(&dword_1BA3E8000, v6, OS_LOG_TYPE_DEBUG, "in %s, _accountIdsWithAlreadyResetThrottleTimers is %{public}@", buf, 0x16u);
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
    uint64_t v13 = [(DADConnection *)v9 _connection];
    xpc_connection_send_message(v13, v12);

    id v14 = v9;
    objc_sync_enter(v14);
    [(NSMutableSet *)v9->_accountIdsWithAlreadyResetThrottleTimers addObject:v5];
    objc_sync_exit(v14);

LABEL_7:
  }
}

- (void)resetTimersAndWarnings
{
  dispatch_queue_t v3 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BA3E8000, v3, OS_LOG_TYPE_DEBUG, "Resetting shouldResetCertWarnings and throttle timers", v5, 2u);
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
    [(DADConnection *)self _foldersUpdated:v4];
  }
  else if ([v6 isEqualToString:@"kDAEPolicyKeyChanged"])
  {
    [(DADConnection *)self _policyKeyChanged:v4];
  }
  else if ([v6 isEqualToString:@"kDAELogDataAccessStatus"])
  {
    [(DADConnection *)self _logDataAccessStatus:v4];
  }
  else if ([v6 isEqualToString:@"kDAEServerContactsSearchQueryFinished"])
  {
    [(DADConnection *)self _serverContactsSearchQueryFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEFolderChangeFinished"])
  {
    [(DADConnection *)self _folderChangeFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEGetStatusReportsFromClient"])
  {
    [(DADConnection *)self _getStatusReportsFromClient:v4];
  }
  else if ([v6 isEqualToString:@"kDAEAttachmentDownloadProgress"])
  {
    [(DADConnection *)self _downloadProgress:v4];
  }
  else if ([v6 isEqualToString:@"kDAEAttachmentDownloadFinished"])
  {
    [(DADConnection *)self _downloadFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarShareResponseFinished"])
  {
    [(DADConnection *)self _shareResponseFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEOfficeHoursRequestFinished"])
  {
    [(DADConnection *)self _officeHoursRequestFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEOofSettingsFinished"])
  {
    [(DADConnection *)self _oofSettingsRequestsFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarAvailabilityRequestReturnedResults"])
  {
    [(DADConnection *)self _calendarAvailabilityRequestReturnedResults:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarAvailabilityRequestFinished"])
  {
    [(DADConnection *)self _calendarAvailabilityRequestFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEGrantedDelegatesListRequestFinished"])
  {
    [(DADConnection *)self _grantedDelegatesListRequestFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEUpdateGrantedDelegatePermissionRequestFinished"])
  {
    [(DADConnection *)self _updateGrantedDelegatePermissionRequestFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarDirectorySearchReturnedResults"])
  {
    [(DADConnection *)self _calendarDirectorySearchReturnedResults:v4];
  }
  else if ([v6 isEqualToString:@"kDAECalendarDirectorySearchFinished"])
  {
    [(DADConnection *)self _calendarDirectorySearchFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEGroupExpansionFinished"])
  {
    [(DADConnection *)self _groupExpansionFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEDownloadSubscribedCalendarProgress"])
  {
    [(DADConnection *)self _downloadSubscribedCalendarProgress:v4];
  }
  else if ([v6 isEqualToString:@"kDAEDownloadSubscribedCalendarFinished"])
  {
    [(DADConnection *)self _downloadSubscribedCalendarFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEDownloadSubscribedCalendarPasswordRequired"])
  {
    [(DADConnection *)self _downloadSubscribedCalendarRequiresPassword:v4];
  }
  else if ([v6 isEqualToString:@"kDAECheckSubscribedCalendarIsJunkFinished"])
  {
    [(DADConnection *)self _subscriptionCalendarJunkCheckFinished:v4];
  }
  else if ([v6 isEqualToString:@"kDAEFetchHolidayCalendarsReturnedResults"])
  {
    [(DADConnection *)self _holidayCalendarFetchReturnedResults:v4];
  }
  else if ([v6 isEqualToString:@"kDAEFetchHolidayCalendarsFinished"])
  {
    [(DADConnection *)self _holidayCalendarFetchFinished:v4];
  }
  else
  {
    uint64_t v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_ERROR, "unknown request sent to connection.", (uint8_t *)&v9, 2u);
    }

    id v8 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      char v10 = v5;
      _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_ERROR, "request: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)beginCalDAVServerSimulationWithHostname:(id)a3
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"kDAEMessageNameKey";
  v9[1] = @"kDAEServerSimulatorHostnameKey";
  v10[0] = @"kDAEManageCalDAVServerSimulator";
  v10[1] = a3;
  void v9[2] = @"kDAEServerSimulatorActionKey";
  v10[2] = @"kDAEServerSimulatorActionBegin";
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:3];

  uint64_t v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  id v8 = [(DADConnection *)self _connection];
  xpc_connection_send_message(v8, v7);
}

- (void)endCalDAVServerSimulationWithHostname:(id)a3
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"kDAEMessageNameKey";
  v9[1] = @"kDAEServerSimulatorHostnameKey";
  v10[0] = @"kDAEManageCalDAVServerSimulator";
  v10[1] = a3;
  void v9[2] = @"kDAEServerSimulatorActionKey";
  v10[2] = @"kDAEServerSimulatorActionEnd";
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:3];

  uint64_t v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  id v8 = [(DADConnection *)self _connection];
  xpc_connection_send_message(v8, v7);
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
  objc_storeStrong((id *)&self->_inFlightHolidayCalendarFetches, 0);
  objc_storeStrong((id *)&self->_inFlightSubscribedCalendarJunkChecks, 0);
  objc_storeStrong((id *)&self->_inFlightSubscribedCalendarDownloads, 0);
  objc_storeStrong((id *)&self->_inFlightUpdateGrantedDelegatePermissionRequests, 0);
  objc_storeStrong((id *)&self->_inFlightGrantedDelegatesListRequests, 0);
  objc_storeStrong((id *)&self->_inFlightOfficeHoursRequests, 0);
  objc_storeStrong((id *)&self->_inFlightOofSettingsRequests, 0);
  objc_storeStrong((id *)&self->_inFlightShareRequests, 0);
  objc_storeStrong((id *)&self->_inFlightGroupExpansions, 0);
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