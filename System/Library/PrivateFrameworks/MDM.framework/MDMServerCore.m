@interface MDMServerCore
- (BOOL)_handleHTTPStatusGoneResponse;
- (BOOL)_isAwaitingUserConfigured;
- (BOOL)_isMAIDNotificationActive;
- (BOOL)_isTokenUpdateScheduled;
- (BOOL)_memberQueueParseMDMConfigurationDict:(id)a3;
- (BOOL)_readConfigurationOutError:(id *)a3 isUproot:(BOOL)a4;
- (BOOL)_shouldListenToEnvironment:(unint64_t)a3;
- (BOOL)executionQueueIsCheckinInProgress;
- (BOOL)isAppInstallBlocked;
- (BOOL)isObservingReachability;
- (BOOL)memberQueueIsMDMConfigurationValid;
- (BOOL)memberQueueIsUprooting;
- (BOOL)memberQueueLastResponseWasNotNow;
- (BOOL)memberQueuePinningRevocationCheckRequired;
- (BOOL)memberQueueSignMessage;
- (BOOL)memberQueueUseDevelopmentAPNS;
- (BOOL)memberQueueUseEnrollmentID;
- (BOOL)memberQueueUserSwitchAlreadyInitiated;
- (BOOL)startOutError:(id *)a3;
- (BOOL)userSwitchAlreadyInitiated;
- (DMCJobQueue)jobQueue;
- (MDMDEPPushTokenManager)depPushTokenManager;
- (MDMPushServiceManager)pushServiceManager;
- (MDMServerAppInstallBlocking)appInstallBlocker;
- (MDMServerCore)initWithChannelType:(unint64_t)a3;
- (NSArray)memberQueueCheckInPinnedSecCertificateRefs;
- (NSArray)memberQueueServerPinnedSecCertificateRefs;
- (NSData)memberQueueLastLoggedPushToken;
- (NSData)memberQueuePushToken;
- (NSDate)memberQueueLastPollingAttempt;
- (NSDate)memberQueueLastPollingSuccess;
- (NSDictionary)MDMOptions;
- (NSDictionary)memberQueueCachedResponse;
- (NSDictionary)memberQueueMDMOptions;
- (NSDictionary)memberQueueOrganizationInfo;
- (NSDictionary)organizationInfo;
- (NSDictionary)softwareUpdatePathFromDisk;
- (NSNumber)memberQueueLastPollingAttemptMonotonicTime;
- (NSNumber)memberQueueLastPollingAttemptRTCResetCount;
- (NSNumber)memberQueueLastPollingSuccessMonotonicTime;
- (NSNumber)memberQueueLastPollingSuccessRTCResetCount;
- (NSNumber)memberQueuePollingInterval;
- (NSString)daemonIdentifier;
- (NSString)memberQueueCommandUUID;
- (NSString)memberQueueEnrollmentID;
- (NSString)memberQueueManagingProfileIdentifier;
- (NSString)memberQueuePushMagic;
- (NSString)memberQueueTopic;
- (NSString)organizationName;
- (NSString)serverName;
- (NSURL)memberQueueCheckInURL;
- (NSURL)memberQueueServerURL;
- (OS_dispatch_queue)appBlockQueue;
- (OS_dispatch_queue)memberQueue;
- (OS_dispatch_queue)notificationQueue;
- (__SecIdentity)memberQueueIdentity;
- (id)_cachedResponse;
- (id)_createBadInstallationError;
- (id)_eraseWatchFailedWithUnderlayingError:(id)a3;
- (id)_httpErrorFromTransaction:(id)a3 assertion:(id)a4 rmAccountID:(id)a5 enrollmentMode:(id)a6 reauthQueue:(id)a7;
- (id)_idleResponse;
- (id)_mdmFilePathForChannelType:(unint64_t)a3;
- (id)_mdmOutstandingActivitiesFilePathForChannelType:(unint64_t)a3;
- (id)_mdmPropertiesFilePathForChannelType:(unint64_t)a3;
- (id)_memberQueueCachedResponse;
- (id)_memberQueueLastPushTokenHash;
- (id)_memberQueuePushMagicMismatchDateMarker;
- (id)_prefixNameForChannelType:(unint64_t)a3;
- (id)_processAccountDrivenUnauthorizedFromTransaction:(id)a3 rmAccountID:(id)a4 reauthQueue:(id)a5;
- (id)_processTraditionalErrorFromTransaction:(id)a3;
- (id)_processTraditionalUnauthorizedFromTransaction:(id)a3 assertion:(id)a4;
- (id)_processUnauthorizedFromTransaction:(id)a3 authParams:(id)a4 rmAccountID:(id)a5 rmAccountUsername:(id)a6 reauthQueue:(id)a7;
- (id)_reasonStringWithReason:(id)a3;
- (id)_responseDataFromResponseDictionary:(id)a3;
- (id)_sendResponseSynchornously:(id)a3;
- (id)_transactionForResponse:(id)a3;
- (id)_triggerReauthenticationForTransaction:(id)a3 authenticator:(id)a4 authParams:(id)a5 rmAccountID:(id)a6 rmAccountUsername:(id)a7;
- (id)_triggerRefreshTokenForTransaction:(id)a3 authenticator:(id)a4 authParams:(id)a5 rmAccountID:(id)a6 rmAccountUsername:(id)a7 reauthQueue:(id)a8;
- (id)_userFieldsForResponse;
- (id)appBlockCompletionBlock;
- (id)executionQueuePushTokenWaitContinuationBlock;
- (id)responseFromBasicResponse:(id)a3;
- (id)sendResponseSynchronously:(id)a3 outStatusCode:(int64_t *)a4 outError:(id *)a5;
- (int)_listenForOneTimeGlobalNotification:(id)a3 callbackQueue:(id)a4 notificationHandler:(id)a5;
- (int)buddyDoneEventToken;
- (int)keybagEventToken;
- (int)memberQueuePowerAssertionDeassertedNotificationToken;
- (int)pairedNRDeviceEventToken;
- (int64_t)_memberQueueTokenUpdateCount;
- (int64_t)_tokenUpdateCount;
- (int64_t)_tokenUpdateRetryCount;
- (int64_t)memberQueueTokenUpdateRetryCount;
- (unint64_t)channelType;
- (unint64_t)memberQueueAccessRights;
- (unsigned)_cancelDispatchNotificationWithToken:(unsigned int)a3;
- (unsigned)_registerForDispatchNotification:(id)a3 outToken:(int *)a4 targetQueue:(id)a5 handler:(id)a6;
- (void)_changeOrganizationNameForRMAccountIdentifier:(id)a3 personaID:(id)a4 organizationName:(id)a5;
- (void)_clearCachedResponse;
- (void)_clearCoreFollowup;
- (void)_clearMAIDNotification;
- (void)_currentLocaleDidChange:(id)a3;
- (void)_decreaseTokenUpdateRetryCount;
- (void)_executeBlockWhenPushTokenIsAvailable:(id)a3;
- (void)_executePushTokenWaitContinuationBlock;
- (void)_executionQueueCheckForOutstandingActivityIsReachabilityEvent:(BOOL)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_executionQueueHandleRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_executionQueuePollServerForCommandWithAssertion:(id)a3 completionBlock:(id)a4;
- (void)_executionQueueRemoveMDMProfileWithAssertion:(id)a3;
- (void)_executionQueueScheduleTokenUpdateRetryIfNeeded;
- (void)_executionQueueTellServerAboutDeviceTokenWithAssertion:(id)a3 completionBlock:(id)a4;
- (void)_executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent:(BOOL)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_keybagStateDidChange;
- (void)_listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate;
- (void)_listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue:(id)a3 perform:(id)a4;
- (void)_memberQueueDecrementTokenUpdateRequestCount;
- (void)_memberQueueForgetCurrentConfiguration;
- (void)_memberQueueIncrementTokenUpdateRequestCount;
- (void)_memberQueueLogLatestPushTokenIfNeeded:(id)a3;
- (void)_memberQueuePollOrScheduleNextPollForHRN;
- (void)_memberQueueRemoveOutstandingActivityForKey:(id)a3;
- (void)_memberQueueSetCachedResponse:(id)a3;
- (void)_memberQueueSetLastPollingAttempt;
- (void)_memberQueueSetLastPollingSuccess;
- (void)_memberQueueSetLastPushTokenHash:(id)a3;
- (void)_memberQueueSetOutstandingActivity:(id)a3 forKey:(id)a4;
- (void)_memberQueueSetPushMagicMismatchDateMarker:(id)a3;
- (void)_memberQueueSetTokenUpdateRequestCount:(int64_t)a3;
- (void)_memberQueueSetupAPSConnectionIfNeeeded:(BOOL)a3 valid:(BOOL)a4;
- (void)_memberQueueSetupAPSConnectionIsMDMConfigurationValid:(BOOL)a3 isUserDaemon:(BOOL)a4;
- (void)_memberQueueStartListeningForInterestingEvents;
- (void)_memberQueueStopListeningForInterestingEvents;
- (void)_memberQueueUpdateMDMConfiguration:(id)a3 organizationInfo:(id)a4;
- (void)_memberQueueWriteDict:(id)a3 toMDMConfigurationFileForChannel:(unint64_t)a4 shouldNotify:(BOOL)a5;
- (void)_networkReachabilityDidChange;
- (void)_pollFromServerIfNeeded:(BOOL)a3 isReachabilityEvent:(BOOL)a4 completionHandler:(id)a5;
- (void)_pollOrScheduleNextPollForHRN;
- (void)_pollingSucceeded;
- (void)_postReauthFollowUpChangedNotification;
- (void)_presentFollowUpForAuthURL:(id)a3 accountUsername:(id)a4 isMAIDAccount:(BOOL)a5;
- (void)_processRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5;
- (void)_registerAsUserSwitchStakeholder;
- (void)_scheduleNextPollWithInterval:(double)a3;
- (void)_schedulePollingServerForCommand;
- (void)_sendResponse:(id)a3 completionBlock:(id)a4;
- (void)_setCachedResponse:(id)a3;
- (void)_setLastPollingAttempt;
- (void)_setLastPollingSuccess;
- (void)_setTokenUpdateRequestCountToZero;
- (void)blockAppInstallsWithCompletion:(id)a3;
- (void)buddyDidFinish;
- (void)dealloc;
- (void)depPushTokenWithCompletion:(id)a3;
- (void)getAssertionDescriptionsWithCompletion:(id)a3;
- (void)isAwaitingUserConfiguredWithCompletion:(id)a3;
- (void)migrateMDMWithContext:(int)a3 completion:(id)a4;
- (void)notifyNewConfigurationWithCompletion:(id)a3;
- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5;
- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5;
- (void)pushServiceManager:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5 environment:(unint64_t)a6;
- (void)pushServiceManager:(id)a3 didReceivePublicToken:(id)a4 forEnvironment:(unint64_t)a5;
- (void)pushTokenWithCompletion:(id)a3;
- (void)reauthenticationCompleteWithCompletion:(id)a3;
- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3;
- (void)retryNotNowWithCompletion:(id)a3;
- (void)scheduleTokenUpdateIfNecessaryWithCompletion:(id)a3;
- (void)scheduleTokenUpdateWithCompletion:(id)a3;
- (void)setAppBlockCompletionBlock:(id)a3;
- (void)setAppBlockQueue:(id)a3;
- (void)setAppInstallBlocker:(id)a3;
- (void)setBuddyDoneEventToken:(int)a3;
- (void)setChannelType:(unint64_t)a3;
- (void)setDepPushTokenManager:(id)a3;
- (void)setExecutionQueueIsCheckinInProgress:(BOOL)a3;
- (void)setExecutionQueuePushTokenWaitContinuationBlock:(id)a3;
- (void)setIsObservingReachability:(BOOL)a3;
- (void)setKeybagEventToken:(int)a3;
- (void)setMDMOptions:(id)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueAccessRights:(unint64_t)a3;
- (void)setMemberQueueCachedResponse:(id)a3;
- (void)setMemberQueueCheckInPinnedSecCertificateRefs:(id)a3;
- (void)setMemberQueueCheckInURL:(id)a3;
- (void)setMemberQueueCommandUUID:(id)a3;
- (void)setMemberQueueEnrollmentID:(id)a3;
- (void)setMemberQueueIdentity:(__SecIdentity *)a3;
- (void)setMemberQueueIsMDMConfigurationValid:(BOOL)a3;
- (void)setMemberQueueIsUprooting:(BOOL)a3;
- (void)setMemberQueueLastLoggedPushToken:(id)a3;
- (void)setMemberQueueLastPollingAttempt:(id)a3;
- (void)setMemberQueueLastPollingAttemptMonotonicTime:(id)a3;
- (void)setMemberQueueLastPollingAttemptRTCResetCount:(id)a3;
- (void)setMemberQueueLastPollingSuccess:(id)a3;
- (void)setMemberQueueLastPollingSuccessMonotonicTime:(id)a3;
- (void)setMemberQueueLastPollingSuccessRTCResetCount:(id)a3;
- (void)setMemberQueueLastResponseWasNotNow:(BOOL)a3;
- (void)setMemberQueueMDMOptions:(id)a3;
- (void)setMemberQueueManagingProfileIdentifier:(id)a3;
- (void)setMemberQueueOrganizationInfo:(id)a3;
- (void)setMemberQueuePinningRevocationCheckRequired:(BOOL)a3;
- (void)setMemberQueuePollingInterval:(id)a3;
- (void)setMemberQueuePowerAssertionDeassertedNotificationToken:(int)a3;
- (void)setMemberQueuePushMagic:(id)a3;
- (void)setMemberQueuePushToken:(id)a3;
- (void)setMemberQueueServerPinnedSecCertificateRefs:(id)a3;
- (void)setMemberQueueServerURL:(id)a3;
- (void)setMemberQueueSignMessage:(BOOL)a3;
- (void)setMemberQueueTokenUpdateRetryCount:(int64_t)a3;
- (void)setMemberQueueTopic:(id)a3;
- (void)setMemberQueueUseDevelopmentAPNS:(BOOL)a3;
- (void)setMemberQueueUseEnrollmentID:(BOOL)a3;
- (void)setMemberQueueUserSwitchAlreadyInitiated:(BOOL)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setOrganizationInfo:(id)a3;
- (void)setPairedNRDeviceEventToken:(int)a3;
- (void)setPushServiceManager:(id)a3;
- (void)setUserSwitchAlreadyInitiated:(BOOL)a3;
- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3;
- (void)simulatePushWithCompletion:(id)a3;
- (void)syncDEPPushTokenWithCompletion:(id)a3;
- (void)touchWithCompletion:(id)a3;
- (void)unblockAppInstallsWithCompletion:(id)a3;
- (void)uprootMDMWithCompletion:(id)a3;
- (void)willSwitchUser;
@end

@implementation MDMServerCore

- (MDMServerCore)initWithChannelType:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MDMServerCore;
  v4 = [(MDMServerCore *)&v23 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("MDMServerCore member queue", v5);
    v7 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = v6;

    dispatch_queue_t v8 = dispatch_queue_create("MDMServerCore notification queue", v5);
    v9 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v8;

    v10 = (void *)[objc_alloc(MEMORY[0x263F38B80]) initWithQoS:-1 hangThreshold:@"MDMServerCore" owner:70.0];
    [v10 setShouldDumpStackshot:1];
    uint64_t v11 = [objc_alloc(MEMORY[0x263F38B88]) initWithExecutionQueue:v10];
    v12 = (void *)*((void *)v4 + 9);
    *((void *)v4 + 9) = v11;

    v13 = objc_alloc_init(MDMServerAppInstallBlocking);
    v14 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v13;

    [*((id *)v4 + 6) setServer:v4];
    *((void *)v4 + 5) = a3;
    *((_DWORD *)v4 + 2) = -1;
    *(void *)(v4 + 28) = -1;
    *((_DWORD *)v4 + 9) = -1;
    v15 = [[MDMPushServiceManager alloc] initWithChannel:a3];
    v16 = (void *)*((void *)v4 + 10);
    *((void *)v4 + 10) = v15;

    v17 = [[MDMDEPPushTokenManager alloc] initWithPushServiceManager:*((void *)v4 + 10)];
    v18 = (void *)*((void *)v4 + 11);
    *((void *)v4 + 11) = v17;

    [v4 _registerAsUserSwitchStakeholder];
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22[0] = 0;
      _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_DEFAULT, "Subscribing to locale changes.", (uint8_t *)v22, 2u);
    }
    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v4 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x263EFF458] object:0];
  }
  return (MDMServerCore *)v4;
}

- (void)dealloc
{
  if ([(MDMServerCore *)self memberQueueIdentity]) {
    CFRelease([(MDMServerCore *)self memberQueueIdentity]);
  }
  v3.receiver = self;
  v3.super_class = (Class)MDMServerCore;
  [(MDMServerCore *)&v3 dealloc];
}

- (BOOL)startOutError:(id *)a3
{
  uint64_t v4 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v4 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore startOutError:]();
  }
  id v5 = objc_alloc(MEMORY[0x263F38BC0]);
  dispatch_queue_t v6 = [(MDMServerCore *)self _reasonStringWithReason:@"StartMDMDServer"];
  v7 = (void *)[v5 initWithReason:v6];

  +[MDMMCInterface profiledCheckIn];
  dispatch_queue_t v8 = [(MDMServerCore *)self pushServiceManager];
  [v8 addPushServiceObserver:self];

  if ([MEMORY[0x263F38B68] isDEPPushEnabled])
  {
    v9 = [(MDMServerCore *)self pushServiceManager];
    v10 = [(MDMServerCore *)self depPushTokenManager];
    [v9 addPushServiceObserver:v10];

    uint64_t v11 = [(MDMServerCore *)self depPushTokenManager];
    [v11 startMonitoringDEPPushTokenChange];
  }
  id v18 = 0;
  BOOL v12 = [(MDMServerCore *)self _readConfigurationOutError:&v18 isUproot:0];
  id v13 = v18;
  if (v12)
  {
    v14 = [(MDMServerCore *)self jobQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __31__MDMServerCore_startOutError___block_invoke;
    v16[3] = &unk_264B9E2A0;
    v16[4] = self;
    id v17 = v7;
    [v14 fromFunction:"-[MDMServerCore startOutError:]" enqueueJob:v16];
  }
  return v12;
}

void __31__MDMServerCore_startOutError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__MDMServerCore_startOutError___block_invoke_2;
  v6[3] = &unk_264B9E278;
  uint64_t v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __31__MDMServerCore_startOutError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_schedulePollingServerForCommand
{
  id v3 = [(MDMServerCore *)self jobQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__MDMServerCore__schedulePollingServerForCommand__block_invoke;
  v4[3] = &unk_264B9E2F0;
  v4[4] = self;
  [v3 fromFunction:"-[MDMServerCore _schedulePollingServerForCommand]" enqueueJob:v4];
}

void __49__MDMServerCore__schedulePollingServerForCommand__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__MDMServerCore__schedulePollingServerForCommand__block_invoke_2;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __49__MDMServerCore__schedulePollingServerForCommand__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_pollFromServerIfNeeded:(BOOL)a3 isReachabilityEvent:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (v6)
  {
    id v9 = objc_alloc(MEMORY[0x263F38BE8]);
    v10 = [(MDMServerCore *)self _reasonStringWithReason:@"Polling"];
    uint64_t v11 = (void *)[v9 initWithReason:v10];

    BOOL v12 = [(MDMServerCore *)self _cachedResponse];

    if (!v12)
    {
      id v13 = [(MDMServerCore *)self _idleResponse];
      [(MDMServerCore *)self _setCachedResponse:v13];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v14 = [(MDMServerCore *)self jobQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__MDMServerCore__pollFromServerIfNeeded_isReachabilityEvent_completionHandler___block_invoke;
  v17[3] = &unk_264B9E318;
  BOOL v20 = a4;
  v17[4] = self;
  id v18 = v11;
  id v19 = v8;
  id v15 = v8;
  id v16 = v11;
  [v14 queueBlock:v17];
}

void __79__MDMServerCore__pollFromServerIfNeeded_isReachabilityEvent_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__MDMServerCore__pollFromServerIfNeeded_isReachabilityEvent_completionHandler___block_invoke_2;
  v4[3] = &unk_264B9E2C8;
  id v5 = *(id *)(a1 + 48);
  [v2 _executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent:v1 assertion:v3 completionBlock:v4];
}

uint64_t __79__MDMServerCore__pollFromServerIfNeeded_isReachabilityEvent_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent:(BOOL)a3 assertion:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  v10 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_INFO, "Checking for outstanding activity. Is reachability event: %d", buf, 8u);
  }
  *(void *)buf = 0;
  BOOL v20 = buf;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v11 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __127__MDMServerCore__executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke;
  block[3] = &unk_264B9D318;
  block[4] = self;
  block[5] = buf;
  dispatch_async_and_wait(v11, block);

  if (v20[24])
  {
    if ([(MDMServerCore *)self _isTokenUpdateScheduled])
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __127__MDMServerCore__executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke_2;
      v14[3] = &unk_264B9E318;
      v14[4] = self;
      BOOL v17 = v6;
      id v15 = v8;
      id v16 = v9;
      [(MDMServerCore *)self _executionQueueTellServerAboutDeviceTokenWithAssertion:v15 completionBlock:v14];
    }
    else
    {
      [(MDMServerCore *)self _executionQueueCheckForOutstandingActivityIsReachabilityEvent:v6 assertion:v8 completionBlock:v9];
    }
  }
  else
  {
    BOOL v12 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_INFO, "No valid MDM configuration found.", v13, 2u);
    }
    if (v9) {
      v9[2](v9);
    }
  }
  _Block_object_dispose(buf, 8);
}

uint64_t __127__MDMServerCore__executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueIsMDMConfigurationValid];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __127__MDMServerCore__executionQueueUpdateTokenIfNeededAndCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executionQueueCheckForOutstandingActivityIsReachabilityEvent:*(unsigned __int8 *)(a1 + 56) assertion:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

- (void)_executionQueueCheckForOutstandingActivityIsReachabilityEvent:(BOOL)a3 assertion:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  v10 = [(MDMServerCore *)self _cachedResponse];

  if (v10)
  {
    *(void *)buf = 0;
    id v19 = buf;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    uint64_t v11 = [(MDMServerCore *)self memberQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__MDMServerCore__executionQueueCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke;
    block[3] = &unk_264B9D318;
    block[4] = self;
    block[5] = buf;
    dispatch_async_and_wait(v11, block);

    if (v6 && v19[24] && DMCIsDeviceLocked())
    {
      BOOL v12 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEFAULT, "Not polling in response to reachability change. Waiting for device to unlock first.", v16, 2u);
      }
      int v13 = 1;
    }
    else
    {
      v14 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_DEFAULT, "Polling MDM server.", v16, 2u);
      }
      [(MDMServerCore *)self _executionQueuePollServerForCommandWithAssertion:v8 completionBlock:v9];
      int v13 = 0;
    }
    _Block_object_dispose(buf, 8);
    if (!v9) {
      goto LABEL_18;
    }
LABEL_16:
    if (v13) {
      v9[2](v9);
    }
    goto LABEL_18;
  }
  id v15 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v15, OS_LOG_TYPE_DEFAULT, "No cached response to send.", buf, 2u);
  }
  int v13 = 1;
  if (v9) {
    goto LABEL_16;
  }
LABEL_18:
}

uint64_t __105__MDMServerCore__executionQueueCheckForOutstandingActivityIsReachabilityEvent_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueLastResponseWasNotNow];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_executionQueueTellServerAboutDeviceTokenWithAssertion:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MDMServerCore *)self executionQueueIsCheckinInProgress])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke;
    v16[3] = &unk_264B9E340;
    id v17 = v7;
    id v8 = v7;
    [(MDMServerCore *)self _executeBlockWhenPushTokenIsAvailable:v16];
    id v9 = v17;
  }
  else
  {
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_DEFAULT, "Telling server about new device token.", buf, 2u);
    }
    [(MDMServerCore *)self setExecutionQueueIsCheckinInProgress:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_53;
    v12[3] = &unk_264B9E3E0;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    id v11 = v7;
    [(MDMServerCore *)self _executeBlockWhenPushTokenIsAvailable:v12];

    id v9 = v13;
  }
}

uint64_t __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) jobQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_2;
  v7[3] = &unk_264B9E3B8;
  id v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  [v4 queueBlock:v7];
}

void __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  int v2 = DMCHasMDMMigrated();
  uint64_t v120 = 0;
  v121 = &v120;
  uint64_t v122 = 0x2020000000;
  char v123 = 0;
  uint64_t v116 = 0;
  v117 = &v116;
  uint64_t v118 = 0x2020000000;
  uint64_t v119 = 0;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__10;
  v114 = __Block_byref_object_dispose__10;
  id v115 = 0;
  id v103 = 0;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__10;
  v108 = __Block_byref_object_dispose__10;
  id v109 = 0;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__10;
  v102 = __Block_byref_object_dispose__10;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__10;
  v92 = __Block_byref_object_dispose__10;
  id v93 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  char v87 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  char v83 = 0;
  id v3 = [*(id *)(a1 + 32) memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_54;
  block[3] = &unk_264B9E368;
  uint64_t v68 = a1;
  block[4] = *(void *)(a1 + 32);
  block[5] = &v120;
  void block[6] = &v116;
  block[7] = &v110;
  block[8] = &v104;
  block[9] = &v98;
  block[10] = &v94;
  block[11] = &v88;
  block[12] = &v84;
  block[13] = &v80;
  dispatch_async_and_wait(v3, block);

  char v4 = v2;
  BOOL v5 = v2 && *((unsigned char *)v121 + 24) && *(void *)(v68 + 40) != 0;
  id v6 = [MEMORY[0x263F38B28] sharedInstance];
  int v7 = [v6 hrnMode];

  if (v5 || v7 == 2)
  {
    *(void *)v75 = 0;
    v76 = v75;
    uint64_t v77 = 0x2020000000;
    char v78 = 0;
    uint64_t v8 = v68;
    if (![*(id *)(v68 + 32) _isTokenUpdateScheduled])
    {
LABEL_67:
      [*(id *)(v8 + 32) setExecutionQueueIsCheckinInProgress:0];
      if (v76[24])
      {
        [*(id *)(v8 + 32) _executionQueueTellServerAboutDeviceTokenWithAssertion:*(void *)(v8 + 48) completionBlock:*(void *)(v8 + 56)];
      }
      else
      {
        uint64_t v58 = *(void *)(v8 + 56);
        if (v58) {
          (*(void (**)(void))(v58 + 16))();
        }
      }
      _Block_object_dispose(v75, 8);
      goto LABEL_72;
    }
    id v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "Telling MDM Check-In Server about new device token.", buf, 2u);
    }
    if ([*(id *)(v68 + 32) userSwitchAlreadyInitiated])
    {
      id v10 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_INFO, "User switch already initiated. Not telling server about new token right now.", buf, 2u);
      }
      id v11 = 0;
      BOOL v12 = 0;
LABEL_66:

      uint64_t v8 = v68;
      goto LABEL_67;
    }
    if ([MEMORY[0x263F38B98] isAppleTV]) {
      goto LABEL_24;
    }
    id v15 = [MEMORY[0x263F52808] sharedConfiguration];
    BOOL v16 = [v15 userMode] == 1;

    if (v16 || (v117[3] & 4) == 0) {
      goto LABEL_24;
    }
    if (MDMKeybagCreateMDMEscrowWithPasscode(&stru_26E549450, 0))
    {
      v59 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v59, OS_LOG_TYPE_DEFAULT, "Generated new unlock token because there's no passcode", buf, 2u);
      }
    }
    id v74 = 0;
    uint64_t v17 = MDMKeybagRetrieveMDMEscrowDataIfPresent(&v74);
    id v60 = v74;
    if (v17)
    {
      v64 = v60;
      v61 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v61, OS_LOG_TYPE_DEFAULT, "Found unlock token; including in TokenUpdate message.",
          buf,
          2u);
      }
    }
    else
    {
      if (!v60)
      {
LABEL_24:
        uint64_t v17 = 0;
        v64 = 0;
        goto LABEL_25;
      }
      v64 = v60;
      v62 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v127 = v64;
        _os_log_impl(&dword_230A49000, v62, OS_LOG_TYPE_ERROR, "Could not retrieve unlock token to include in TokenUpdate message: %@", buf, 0xCu);
      }
      uint64_t v17 = 0;
    }
LABEL_25:
    id v18 = [*(id *)(v68 + 32) memberQueue];
    v65 = (void *)v17;
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_61;
    v73[3] = &unk_264B9D3E0;
    v73[4] = *(void *)(v68 + 32);
    dispatch_async_and_wait(v18, v73);

    if ([*(id *)(v68 + 32) channelType]) {
      uint64_t v19 = [*(id *)(v68 + 32) _isAwaitingUserConfigured];
    }
    else {
      uint64_t v19 = +[MDMMCInterface isAwaitingDeviceConfigured];
    }
    uint64_t v20 = *MEMORY[0x263F52AC0];
    uint64_t v21 = *MEMORY[0x263F52AA0];
    v124[0] = *MEMORY[0x263F52AB8];
    v124[1] = v21;
    v125[0] = v20;
    char v22 = [NSNumber numberWithBool:v19];
    v125[1] = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:2];
    v67 = (void *)[v23 mutableCopy];

    if (v7 != 2)
    {
      uint64_t v24 = v111[5];
      if (v24) {
        [v67 setObject:v24 forKeyedSubscript:@"Topic"];
      }
      uint64_t v25 = v105[5];
      if (v25) {
        [v67 setObject:v25 forKeyedSubscript:@"PushMagic"];
      }
      uint64_t v26 = *(void *)(v68 + 40);
      if (v26) {
        [v67 setObject:v26 forKeyedSubscript:*MEMORY[0x263F52AB0]];
      }
    }
    if ((v117[3] & 4) != 0) {
      [v67 setObject:v17 forKeyedSubscript:*MEMORY[0x263F52AD0]];
    }
    if ([*(id *)(v68 + 32) memberQueueUseEnrollmentID])
    {
      v27 = [*(id *)(v68 + 32) memberQueueEnrollmentID];
      [v67 setObject:v27 forKeyedSubscript:*MEMORY[0x263F52AA8]];
      v28 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v127 = v27;
        v29 = "The token update dictionary has Enrollment ID: %{public}@";
LABEL_42:
        _os_log_impl(&dword_230A49000, v28, OS_LOG_TYPE_INFO, v29, buf, 0xCu);
      }
    }
    else
    {
      v27 = [MEMORY[0x263F38B98] deviceUDID];
      [v67 setObject:v27 forKeyedSubscript:*MEMORY[0x263F52AC8]];
      v28 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v127 = v27;
        v29 = "The token update dictionary has UDID: %{public}@";
        goto LABEL_42;
      }
    }

    if ([*(id *)(v68 + 32) channelType] == 1)
    {
      v30 = [*(id *)(v68 + 32) _userFieldsForResponse];
      [v67 addEntriesFromDictionary:v30];
    }
    SecCertificateRef certificateRef = 0;
    v31 = (__SecIdentity *)v95[3];
    if (v31)
    {
      SecIdentityCopyCertificate(v31, &certificateRef);
      if (certificateRef)
      {
        v32 = (void *)SecCertificateCopyProperties();
        v33 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v127 = v32;
          _os_log_impl(&dword_230A49000, v33, OS_LOG_TYPE_DEBUG, "The certificate that the device is using to authenticate itself to the server has the following properties: %{public}@", buf, 0xCu);
        }
        CFRelease(certificateRef);
      }
    }
    v66 = [MEMORY[0x263F08AC0] dataWithPropertyList:v67 format:100 options:0 error:0];
    id v34 = objc_alloc(MEMORY[0x263F52830]);
    uint64_t v35 = v99[5];
    uint64_t v36 = v95[3];
    uint64_t v37 = v89[5];
    int v38 = *((unsigned __int8 *)v85 + 24);
    int v39 = *((unsigned __int8 *)v81 + 24);
    v40 = [MEMORY[0x263F52810] sharedConfiguration];
    v41 = [v40 rmAccountID];
    BYTE2(v63) = 0;
    LOWORD(v63) = 1;
    v42 = objc_msgSend(v34, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v35, v66, v36, v37, v38 != 0, v39 != 0, v63, v41);

    if ([MEMORY[0x263F38B70] shouldSimulateMDMCommunication])
    {
      v43 = [MEMORY[0x263F52830] emptySuccessResponseBlock];
      [v42 setSimulatedTransactionBlock:v43];
    }
    [v42 performSynchronously];
    v44 = [MEMORY[0x263F52810] sharedConfiguration];
    v45 = *(void **)(v68 + 32);
    uint64_t v46 = *(void *)(v68 + 48);
    v47 = [v44 rmAccountID];
    v48 = [v44 enrollmentMode];
    v49 = [*(id *)(v68 + 32) notificationQueue];
    id v11 = [v45 _httpErrorFromTransaction:v42 assertion:v46 rmAccountID:v47 enrollmentMode:v48 reauthQueue:v49];

    if (v11)
    {
      v50 = objc_opt_new();
      [v50 logErrorEventForTopic:*MEMORY[0x263F38A68] reason:@"Token Update failed" error:v11 details:v67];
    }
    else
    {
      v50 = +[MDMEvents sharedInstance];
      v51 = [*(id *)(v68 + 40) DMCSHA256Hash];
      v52 = [*(id *)(v68 + 32) memberQueue];
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_73;
      v69[3] = &unk_264B9E390;
      v69[4] = *(void *)(v68 + 32);
      id v53 = v51;
      id v70 = v53;
      v71 = v75;
      dispatch_async_and_wait(v52, v69);

      [v50 recordDateForEvent:@"PushTokenSentToServerKey"];
      [v50 recordData:*(void *)(v68 + 40) forEvent:@"PushTokenDataSentToServerKey"];
      if (v65)
      {
        [v50 recordDateForEvent:@"UnlockTokenSentToServerDate"];
        v54 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230A49000, v54, OS_LOG_TYPE_DEFAULT, "Successfully delivered unlock token in TokenUpdate", buf, 2u);
        }
        MDMKeybagDeleteMDMEscrowData();
      }
      v55 = *(id *)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        int v56 = [v42 statusCode];
        *(_DWORD *)buf = 67109120;
        LODWORD(v127) = v56;
        _os_log_impl(&dword_230A49000, v55, OS_LOG_TYPE_DEFAULT, "Transaction completed. Status: %d", buf, 8u);
      }
    }
    if (v11)
    {
      v57 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v127 = v11;
        _os_log_impl(&dword_230A49000, v57, OS_LOG_TYPE_ERROR, "Cannot tell server of a new push token. Error: %{public}@", buf, 0xCu);
      }
      [*(id *)(v68 + 32) _executionQueueScheduleTokenUpdateRetryIfNeeded];
      BOOL v12 = v65;
    }
    else
    {
      id v11 = 0;
      BOOL v12 = v65;
    }
    goto LABEL_66;
  }
  [*(id *)(v68 + 32) setExecutionQueueIsCheckinInProgress:0];
  if ([*(id *)(v68 + 32) _isTokenUpdateScheduled]) {
    [*(id *)(v68 + 32) _executionQueueScheduleTokenUpdateRetryIfNeeded];
  }
  if ((v4 & 1) == 0)
  {
    id v13 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_230A49000, v13, OS_LOG_TYPE_DEFAULT, "Skipped token update due to incomplete migration.", v75, 2u);
    }
    [*(id *)(v68 + 32) _listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate];
  }
  uint64_t v14 = *(void *)(v68 + 56);
  if (v14) {
    (*(void (**)(void))(v14 + 16))();
  }
LABEL_72:
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v110, 8);

  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v120, 8);
}

uint64_t __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_54(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) memberQueueIsMDMConfigurationValid];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) memberQueueAccessRights];
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueTopic];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) memberQueuePushMagic];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 32) memberQueueCheckInURL];
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 32) memberQueueIdentity];
  uint64_t v11 = [*(id *)(a1 + 32) memberQueueCheckInPinnedSecCertificateRefs];
  uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [*(id *)(a1 + 32) memberQueuePinningRevocationCheckRequired];
  uint64_t result = [*(id *)(a1 + 32) memberQueueSignMessage];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = result;
  return result;
}

uint64_t __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_61(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueueSetTokenUpdateRequestCount:1];
}

uint64_t __88__MDMServerCore__executionQueueTellServerAboutDeviceTokenWithAssertion_completionBlock___block_invoke_73(uint64_t a1)
{
  [*(id *)(a1 + 32) _memberQueueSetLastPushTokenHash:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _memberQueueDecrementTokenUpdateRequestCount];
  uint64_t result = [*(id *)(a1 + 32) _memberQueueTokenUpdateCount];
  if (result >= 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)_executionQueueScheduleTokenUpdateRetryIfNeeded
{
  if ([(MDMServerCore *)self _tokenUpdateRetryCount] > 0)
  {
    [(MDMServerCore *)self _decreaseTokenUpdateRetryCount];
    char v3 = DMCHasMDMMigrated();
    char v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Will retry token update...", v7, 2u);
      if (v3) {
        goto LABEL_4;
      }
    }
    else if (v3)
    {
LABEL_4:
      double v5 = 10.0;
LABEL_9:
      [(MDMServerCore *)self _scheduleNextPollWithInterval:v5];
      return;
    }
    double v5 = 300.0;
    goto LABEL_9;
  }
  uint64_t v6 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "We've retried enough. Abort...", buf, 2u);
  }
}

- (void)_executionQueuePollServerForCommandWithAssertion:(id)a3 completionBlock:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v38 = 0;
  int v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__10;
  uint64_t v36 = __Block_byref_object_dispose__10;
  id v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v8 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke;
  block[3] = &unk_264B9E408;
  block[4] = self;
  block[5] = &v38;
  void block[6] = &v32;
  block[7] = &v28;
  dispatch_async_and_wait(v8, block);

  if (*((unsigned char *)v39 + 24) && !*((unsigned char *)v29 + 24))
  {
    id v13 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v33[5];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_230A49000, v13, OS_LOG_TYPE_DEFAULT, "Polling MDM server %{public}@ for next command.", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v12 = [(MDMServerCore *)self _cachedResponse];
    if (!v12)
    {
      uint64_t v12 = [(MDMServerCore *)self _idleResponse];
    }
    if ([(MDMServerCore *)self userSwitchAlreadyInitiated])
    {
      id v15 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_230A49000, v15, OS_LOG_TYPE_DEFAULT, "User switch already initiated. Not polling the MDM server for commands right now.", (uint8_t *)&buf, 2u);
      }
      BOOL v16 = [(MDMServerCore *)self _cachedResponse];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        id v18 = [(MDMServerCore *)self _idleResponse];
        [(MDMServerCore *)self _setCachedResponse:v18];
      }
      if (v7)
      {
        uint64_t v19 = dispatch_get_global_queue(0, 0);
        dispatch_async(v19, v7);
      }
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0;
      uint64_t v20 = [(MDMServerCore *)self memberQueue];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_74;
      v26[3] = &unk_264B9D318;
      v26[4] = self;
      v26[5] = &buf;
      dispatch_async_and_wait(v20, v26);

      uint64_t v21 = *(void *)(*((void *)&buf + 1) + 24);
      if (v21) {
        [(MDMServerCore *)self _scheduleNextPollWithInterval:(double)(unint64_t)(120 * v21)];
      }
      [(MDMServerCore *)self _setLastPollingAttempt];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_2;
      v22[3] = &unk_264B9E480;
      v22[4] = self;
      id v23 = v6;
      id v25 = v7;
      uint64_t v12 = v12;
      uint64_t v24 = v12;
      [(MDMServerCore *)self _sendResponse:v12 completionBlock:v22];

      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_7;
  }
  uint64_t v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *((unsigned __int8 *)v39 + 24);
    int v11 = *((unsigned __int8 *)v29 + 24);
    LODWORD(buf) = 67240448;
    DWORD1(buf) = v10;
    WORD4(buf) = 1026;
    *(_DWORD *)((char *)&buf + 10) = v11;
    _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring MDM server poll. Config Valid? %{public}d. Is Uprooting? %{public}d", (uint8_t *)&buf, 0xEu);
  }
  if (v7)
  {
    uint64_t v12 = dispatch_get_global_queue(0, 0);
    dispatch_async(v12, v7);
LABEL_7:
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
}

uint64_t __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) memberQueueIsMDMConfigurationValid];
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueServerURL];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(a1 + 32) memberQueueIsUprooting];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) memberQueuePollingInterval];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 unsignedIntegerValue];
}

void __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) jobQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_3;
  v7[3] = &unk_264B9E458;
  double v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  [v4 queueBlock:v7];
}

void __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_3(id *a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F52810] sharedConfiguration];
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = [v2 rmAccountID];
  id v7 = [v2 enrollmentMode];
  id v8 = [a1[4] notificationQueue];
  id v9 = [v3 _httpErrorFromTransaction:v4 assertion:v5 rmAccountID:v6 enrollmentMode:v7 reauthQueue:v8];

  id v10 = *(NSObject **)(DMCLogObjects() + 8);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      id v15 = a1[5];
      BOOL v16 = v10;
      int v17 = [v15 statusCode];
      uint64_t v18 = [a1[7] objectForKeyedSubscript:@"CommandUUID"];
      uint64_t v19 = (void *)v18;
      uint64_t v20 = @"(Idle)";
      if (v18) {
        uint64_t v20 = (__CFString *)v18;
      }
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)v55 = v17;
      *(_WORD *)&v55[4] = 2114;
      *(void *)&v55[6] = v20;
      _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_DEFAULT, "Transaction completed. Status: %d, ResponseUUID: %{public}@", buf, 0x12u);
    }
    [a1[4] _setCachedResponse:0];
    uint64_t v21 = (void *)MEMORY[0x263F08AC0];
    char v22 = [a1[5] responseData];
    id v53 = 0;
    id v23 = [v21 DMCSafePropertyListWithData:v22 options:0 format:0 error:&v53];
    id v24 = v53;

    id v25 = [a1[5] responseData];
    if ([v25 length])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v27 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)v55 = v24;
          _os_log_impl(&dword_230A49000, v27, OS_LOG_TYPE_ERROR, "Could not parse command. Error: %{public}@", buf, 0xCu);
        }
        id v28 = a1[4];
        v29 = +[MDMParser malformedRequestErrorResult];
        [v28 _setCachedResponse:v29];

        [a1[4] _schedulePollingServerForCommand];
        [a1[4] _pollingFailed];
        goto LABEL_26;
      }
    }
    else
    {
    }
    uint64_t v30 = [a1[5] responseData];
    if ([v30 length])
    {
      uint64_t v31 = [v23 count];

      if (v31)
      {
        [a1[4] _pollingSucceeded];
        id v32 = objc_alloc(MEMORY[0x263F38BE8]);
        id v33 = a1[4];
        uint64_t v34 = NSString;
        uint64_t v35 = [v23 objectForKeyedSubscript:@"Command"];
        uint64_t v36 = [v35 objectForKeyedSubscript:@"RequestType"];
        id v37 = [v34 stringWithFormat:@"Request-%@", v36];
        uint64_t v38 = [v33 _reasonStringWithReason:v37];
        int v39 = (void *)[v32 initWithReason:v38];

        id v40 = a1[4];
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_3_85;
        v47[3] = &unk_264B9E430;
        v47[4] = v40;
        id v48 = a1[8];
        [v40 _executionQueueHandleRequest:v23 assertion:v39 completionBlock:v47];

LABEL_28:
        goto LABEL_29;
      }
    }
    else
    {
    }
    char v41 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_230A49000, v41, OS_LOG_TYPE_DEFAULT, "Server has no commands for this device.", buf, 2u);
    }
    [a1[4] _pollingSucceeded];
    v42 = [a1[7] objectForKey:@"Status"];
    int v43 = [v42 isEqualToString:@"NotNow"];

    uint64_t v44 = [a1[4] memberQueue];
    if (v43)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_79;
      block[3] = &unk_264B9D408;
      block[4] = a1[4];
      uint64_t v45 = &v52;
      id v52 = a1[6];
      dispatch_async(v44, block);
    }
    else
    {
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_2_80;
      v49[3] = &unk_264B9D408;
      v49[4] = a1[4];
      uint64_t v45 = &v50;
      id v50 = a1[6];
      dispatch_barrier_async(v44, v49);
    }

LABEL_26:
    uint64_t v46 = (void (**)(void))a1[8];
    if (v46) {
      v46[2]();
    }
    goto LABEL_28;
  }
  if (v11)
  {
    uint64_t v12 = v10;
    id v13 = [v9 DMCVerboseDescription];
    *(_DWORD *)long long buf = 138543362;
    *(void *)v55 = v13;
    _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEFAULT, "Could not send response to MDM server. Error: %{public}@", buf, 0xCu);
  }
  [a1[4] _pollingFailed];
  uint64_t v14 = (void (**)(void))a1[8];
  if (v14) {
    v14[2]();
  }
LABEL_29:
}

void __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_79(uint64_t a1)
{
  [*(id *)(a1 + 32) setMemberQueueLastResponseWasNotNow:1];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 _idleResponse];
  [v2 _memberQueueSetCachedResponse:v3];
}

uint64_t __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_2_80(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueLastResponseWasNotNow:0];
}

uint64_t __82__MDMServerCore__executionQueuePollServerForCommandWithAssertion_completionBlock___block_invoke_3_85(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setCachedResponse:a2];
  if (a2) {
    [*(id *)(a1 + 32) _schedulePollingServerForCommand];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (id)sendResponseSynchronously:(id)a3 outStatusCode:(int64_t *)a4 outError:(id *)a5
{
  id v7 = [(MDMServerCore *)self _sendResponseSynchornously:a3];
  id v8 = [v7 responseData];
  int64_t v9 = [v7 statusCode];
  id v10 = [v7 error];
  BOOL v11 = v10;
  if (a5) {
    *a5 = v10;
  }
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (void)_sendResponse:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(MDMServerCore *)self _transactionForResponse:a3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__MDMServerCore__sendResponse_completionBlock___block_invoke;
  v10[3] = &unk_264B9D0E8;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [v8 performCompletionBlock:v10];
}

uint64_t __47__MDMServerCore__sendResponse_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)_sendResponseSynchornously:(id)a3
{
  id v3 = [(MDMServerCore *)self _transactionForResponse:a3];
  [v3 performSynchronously];
  return v3;
}

- (id)_transactionForResponse:(id)a3
{
  id v4 = a3;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__10;
  char v41 = __Block_byref_object_dispose__10;
  id v42 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__10;
  v27 = __Block_byref_object_dispose__10;
  id v28 = 0;
  id v5 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__MDMServerCore__transactionForResponse___block_invoke;
  block[3] = &unk_264B9E4A8;
  block[4] = self;
  void block[5] = &v43;
  void block[6] = &v37;
  block[7] = &v33;
  void block[8] = &v29;
  block[9] = &v23;
  dispatch_async_and_wait(v5, block);

  if ([(MDMServerCore *)self channelType] == 1)
  {
    id v6 = (void *)[v4 mutableCopy];
    id v7 = [(MDMServerCore *)self _userFieldsForResponse];
    [v6 addEntriesFromDictionary:v7];

    uint64_t v8 = [v6 copy];
    id v4 = (id)v8;
  }
  id v9 = [(MDMServerCore *)self _responseDataFromResponseDictionary:v4];
  id v10 = objc_alloc(MEMORY[0x263F52830]);
  uint64_t v11 = v24[5];
  uint64_t v12 = v44[3];
  uint64_t v13 = v38[5];
  int v14 = *((unsigned __int8 *)v34 + 24);
  int v15 = *((unsigned __int8 *)v30 + 24);
  BOOL v16 = [MEMORY[0x263F52810] sharedConfiguration];
  int v17 = [v16 rmAccountID];
  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  uint64_t v18 = objc_msgSend(v10, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v11, v9, v12, v13, v14 != 0, v15 != 0, v21, v17);

  if ([MEMORY[0x263F38B70] shouldSimulateMDMCommunication])
  {
    uint64_t v19 = [MEMORY[0x263F52830] emptySuccessResponseBlock];
    [v18 setSimulatedTransactionBlock:v19];
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  return v18;
}

uint64_t __41__MDMServerCore__transactionForResponse___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) memberQueueIdentity];
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueServerPinnedSecCertificateRefs];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) memberQueuePinningRevocationCheckRequired];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) memberQueueSignMessage];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [*(id *)(a1 + 32) memberQueueServerURL];
  return MEMORY[0x270F9A758]();
}

- (void)_processRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc(MEMORY[0x263F38BE8]);
  uint64_t v11 = NSString;
  uint64_t v12 = [v8 objectForKeyedSubscript:@"Command"];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"RequestType"];
  int v14 = [v11 stringWithFormat:@"ProcessRequest-%@", v13];
  int v15 = (void *)[v10 initWithReason:v14];

  BOOL v16 = [(MDMServerCore *)self jobQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__MDMServerCore__processRequest_encodeResponse_completion___block_invoke;
  v20[3] = &unk_264B9E4F8;
  v20[4] = self;
  id v21 = v8;
  id v22 = v15;
  id v23 = v9;
  BOOL v24 = a4;
  id v17 = v9;
  id v18 = v15;
  id v19 = v8;
  [v16 fromFunction:"-[MDMServerCore _processRequest:encodeResponse:completion:]" enqueueJob:v20];
}

void __59__MDMServerCore__processRequest_encodeResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__MDMServerCore__processRequest_encodeResponse_completion___block_invoke_2;
  v9[3] = &unk_264B9E4D0;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  char v12 = *(unsigned char *)(a1 + 64);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  [v4 _executionQueueHandleRequest:v5 assertion:v6 completionBlock:v9];
}

void __59__MDMServerCore__processRequest_encodeResponse_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = [*(id *)(a1 + 32) _responseDataFromResponseDictionary:v5];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(uint64_t, void, id, void))(v3 + 16))(v3, 0, v5, 0);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_executionQueueHandleRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__10;
  uint64_t v37 = __Block_byref_object_dispose__10;
  id v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  id v11 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke;
  block[3] = &unk_264B9E520;
  block[4] = self;
  void block[5] = &v33;
  void block[6] = &v29;
  dispatch_async_and_wait(v11, block);

  unint64_t v12 = [(MDMServerCore *)self channelType];
  if (v12)
  {
    if (v12 != 1)
    {
      int v15 = 0;
      goto LABEL_7;
    }
    uint64_t v13 = &off_264B9C7F0;
  }
  else
  {
    uint64_t v13 = &off_264B9C740;
  }
  id v14 = objc_alloc(*v13);
  int v15 = (void *)[v14 initWithManagingProfileIdentifier:v34[5]];
LABEL_7:
  [v15 setServer:self];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v16 = [v8 objectForKey:@"CommandUUID"];
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v17 = [v8 objectForKey:@"Command"];
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v18 = [(MDMServerCore *)self memberQueue];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke_2;
        v26[3] = &unk_264B9D408;
        v26[4] = self;
        id v19 = v16;
        id v27 = v19;
        dispatch_async(v18, v26);

        uint64_t v20 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v40 = v19;
          _os_log_impl(&dword_230A49000, v20, OS_LOG_TYPE_DEFAULT, "Processing command UUID: %{public}@", buf, 0xCu);
        }
        uint64_t v21 = v30[3];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke_92;
        v24[3] = &unk_264B9E430;
        v24[4] = self;
        id v25 = v10;
        [v15 processRequest:v17 accessRights:v21 assertion:v9 completionBlock:v24];

        int v22 = 0;
      }
      else
      {
        int v22 = 1;
      }
    }
    else
    {
      int v22 = 1;
    }
  }
  else
  {
    int v22 = 1;
  }
  if (v10 && v22)
  {
    id v23 = +[MDMParser malformedRequestErrorResult];
    (*((void (**)(id, void *))v10 + 2))(v10, v23);
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

uint64_t __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueManagingProfileIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(a1 + 32) memberQueueAccessRights];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueCommandUUID:*(void *)(a1 + 40)];
}

void __72__MDMServerCore__executionQueueHandleRequest_assertion_completionBlock___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseFromBasicResponse:v3];
    id v5 = [v4 objectForKey:@"Settings"];
    uint64_t v6 = v5;
    if (v5)
    {
      id v18 = v4;
      id v19 = v3;
      id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v17 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        uint64_t v12 = *MEMORY[0x263F52AC8];
        uint64_t v13 = *MEMORY[0x263F529B0];
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            int v15 = [*(id *)(a1 + 32) responseFromBasicResponse:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            [v15 removeObjectForKey:@"CommandUUID"];
            [v15 removeObjectForKey:v12];
            [v15 removeObjectForKey:v13];
            [v7 addObject:v15];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }

      id v4 = v18;
      [v18 setObject:v7 forKey:@"Settings"];

      id v3 = v19;
      uint64_t v6 = v17;
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v4);
  }
}

- (void)notifyNewConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore notifyNewConfigurationWithCompletion:]();
  }
  id v6 = objc_alloc(MEMORY[0x263F38BE8]);
  id v7 = [(MDMServerCore *)self _reasonStringWithReason:@"NewConfig"];
  id v8 = (void *)[v6 initWithReason:v7];

  uint64_t v9 = [(MDMServerCore *)self jobQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__MDMServerCore_notifyNewConfigurationWithCompletion___block_invoke;
  v12[3] = &unk_264B9E548;
  id v13 = v8;
  id v14 = v4;
  v12[4] = self;
  id v10 = v8;
  id v11 = v4;
  [v9 fromFunction:"-[MDMServerCore notifyNewConfigurationWithCompletion:]" enqueueJob:v12];
}

void __54__MDMServerCore_notifyNewConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _readConfigurationOutError:0 isUproot:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v4[2]();
}

- (void)scheduleTokenUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore scheduleTokenUpdateWithCompletion:]();
  }
  id v6 = [(MDMServerCore *)self jobQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke;
  v8[3] = &unk_264B9E598;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fromFunction:"-[MDMServerCore scheduleTokenUpdateWithCompletion:]" enqueueJob:v8];
}

void __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke_2;
  block[3] = &unk_264B9D3E0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);

  uint64_t v5 = [*(id *)(a1 + 32) _cachedResponse];
  if (v5) {
    goto LABEL_4;
  }
  id v6 = [MEMORY[0x263F38B28] sharedInstance];
  int v7 = [v6 hrnMode];

  if (v7 != 1)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v5 = [v8 _idleResponse];
    [v8 _setCachedResponse:v5];
LABEL_4:
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke_3;
  v11[3] = &unk_264B9E570;
  id v9 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v3;
  id v10 = v3;
  [v9 _pollFromServerIfNeeded:0 isReachabilityEvent:0 completionHandler:v11];
}

uint64_t __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueueIncrementTokenUpdateRequestCount];
}

uint64_t __51__MDMServerCore_scheduleTokenUpdateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)scheduleTokenUpdateIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore scheduleTokenUpdateIfNecessaryWithCompletion:]();
  }
  id v6 = [(MDMServerCore *)self jobQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__MDMServerCore_scheduleTokenUpdateIfNecessaryWithCompletion___block_invoke;
  v8[3] = &unk_264B9E598;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fromFunction:"-[MDMServerCore scheduleTokenUpdateIfNecessaryWithCompletion:]" enqueueJob:v8];
}

void __62__MDMServerCore_scheduleTokenUpdateIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__MDMServerCore_scheduleTokenUpdateIfNecessaryWithCompletion___block_invoke_2;
  v6[3] = &unk_264B9E570;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __62__MDMServerCore_scheduleTokenUpdateIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)simulatePushWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore simulatePushWithCompletion:]();
  }
  id v6 = [(MDMServerCore *)self jobQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__MDMServerCore_simulatePushWithCompletion___block_invoke;
  v8[3] = &unk_264B9E598;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fromFunction:"-[MDMServerCore simulatePushWithCompletion:]" enqueueJob:v8];
}

void __44__MDMServerCore_simulatePushWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__MDMServerCore_simulatePushWithCompletion___block_invoke_2;
  v6[3] = &unk_264B9E570;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:1 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __44__MDMServerCore_simulatePushWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore simulatePushIfNetworkTetheredWithCompletion:]();
  }
  if (DMCDeviceIsNetworkTethered())
  {
    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    id v7 = [v6 installedMDMProfileIdentifier];

    if (v7)
    {
      id v8 = [(MDMServerCore *)self jobQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __61__MDMServerCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke;
      v15[3] = &unk_264B9E598;
      v15[4] = self;
      id v16 = v4;
      [v8 fromFunction:"-[MDMServerCore simulatePushIfNetworkTetheredWithCompletion:]" enqueueJob:v15];
    }
    else if (v4)
    {
      id v13 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_230A49000, v13, OS_LOG_TYPE_DEFAULT, "Asked to poll server if tethered, but no MDM installation exists.", buf, 2u);
      }
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F38B10];
    id v11 = DMCErrorArray();
    id v12 = objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", v10, 12081, v11, *MEMORY[0x263F38A40], 0);

    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v12);
    }
  }
}

void __61__MDMServerCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__MDMServerCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke_2;
  v6[3] = &unk_264B9E570;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:1 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __61__MDMServerCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)retryNotNowWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore retryNotNowWithCompletion:]();
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v6 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__MDMServerCore_retryNotNowWithCompletion___block_invoke;
  block[3] = &unk_264B9D318;
  block[4] = self;
  void block[5] = &v15;
  dispatch_async_and_wait(v6, block);

  id v7 = [(MDMServerCore *)self _cachedResponse];
  if (v7 && (int v8 = *((unsigned __int8 *)v16 + 24), v7, v8))
  {
    id v9 = [(MDMServerCore *)self jobQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__MDMServerCore_retryNotNowWithCompletion___block_invoke_2;
    v12[3] = &unk_264B9E598;
    v12[4] = self;
    id v13 = v4;
    [v9 fromFunction:"-[MDMServerCore retryNotNowWithCompletion:]" enqueueJob:v12];
  }
  else
  {
    uint64_t v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_INFO, "Last response was not a NotNow. Ignoring poll request.", v11, 2u);
    }
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __43__MDMServerCore_retryNotNowWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueLastResponseWasNotNow];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __43__MDMServerCore_retryNotNowWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__MDMServerCore_retryNotNowWithCompletion___block_invoke_3;
  v6[3] = &unk_264B9E570;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __43__MDMServerCore_retryNotNowWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)migrateMDMWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v7 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore migrateMDMWithContext:completion:]();
  }
  id v8 = objc_alloc(MEMORY[0x263F38BE8]);
  id v9 = [(MDMServerCore *)self _reasonStringWithReason:@"MigrateMDMWithContext"];
  uint64_t v10 = (void *)[v8 initWithReason:v9];

  id v11 = objc_opt_new();
  [v11 migrateMDMWithContext:v4];

  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)reauthenticationCompleteWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore reauthenticationCompleteWithCompletion:]();
  }
  [(MDMServerCore *)self _clearCoreFollowup];
  [(MDMServerCore *)self _postReauthFollowUpChangedNotification];
  [(MDMServerCore *)self simulatePushWithCompletion:v4];
}

- (void)uprootMDMWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore uprootMDMWithCompletion:]();
  }
  id v6 = objc_alloc(MEMORY[0x263F38BE8]);
  uint64_t v7 = [(MDMServerCore *)self _reasonStringWithReason:@"UprootMDM"];
  id v8 = (void *)[v6 initWithReason:v7];

  id v9 = +[MDMEvents sharedInstance];
  [v9 recordDateForEvent:@"LastUproot"];

  uint64_t v10 = NSDictionary;
  id v11 = [(MDMServerCore *)self _mdmFilePathForChannelType:0];
  id v12 = [v10 DMCDictionaryFromFile:v11];

  id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F52A98]];
  id v14 = [(MDMServerCore *)self jobQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__MDMServerCore_uprootMDMWithCompletion___block_invoke;
  v18[3] = &unk_264B9E5C0;
  id v19 = v13;
  long long v20 = self;
  id v21 = v8;
  id v22 = v4;
  id v15 = v8;
  id v16 = v4;
  id v17 = v13;
  [v14 fromFunction:"-[MDMServerCore uprootMDMWithCompletion:]" enqueueJob:v18];
}

void __41__MDMServerCore_uprootMDMWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v45 = a2;
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_INFO, "MDMServerCore uprooting MDM installation...", buf, 2u);
  }
  uint64_t v44 = a1;
  uint64_t v4 = *(void *)(a1 + 32);
  id v57 = 0;
  BOOL v5 = +[MDMDeclarativeManagementCommand unenrollWithProfileIdentifier:v4 error:&v57];
  id v6 = v57;
  id v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      id v8 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v61 = v7;
        _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_ERROR, "MDMServerCore failed to execute remote management unenrollment with error: %{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v43 = v7;
  id v9 = [MEMORY[0x263F39D18] systemConnection];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v10 = +[MDMMCInterface managedAppIDs];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v16 = objc_opt_new();
        [v16 setBundleIdentifier:v15];
        id v52 = 0;
        id v17 = (id)[v9 performRequest:v16 error:&v52];
        id v18 = v52;
        if (v18)
        {
          id v19 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543618;
            id v61 = v15;
            __int16 v62 = 2114;
            id v63 = v18;
            _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_ERROR, "MDMServerCore failed to stop managing app '%{public}@' with error: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v12);
  }

  [*(id *)(v44 + 40) _clearCoreFollowup];
  [*(id *)(v44 + 40) _clearMAIDNotification];
  long long v20 = *(NSObject **)(DMCLogObjects() + 8);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  id v22 = (void *)*MEMORY[0x263F52F00];
  if (v21)
  {
    *(_DWORD *)long long buf = 138543362;
    id v61 = v22;
    _os_log_impl(&dword_230A49000, v20, OS_LOG_TYPE_DEFAULT, "MDMServerCore posting MDM uprooted notifications: %{public}@", buf, 0xCu);
  }
  long long v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 postNotificationName:v22 object:0];

  BOOL v24 = [MEMORY[0x263F087C8] defaultCenter];
  [v24 postNotificationName:v22 object:0];

  uint64_t v25 = +[MDMAttestation sharedInstance];
  [v25 reset];

  uint64_t v26 = [*(id *)(v44 + 40) memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__MDMServerCore_uprootMDMWithCompletion___block_invoke_114;
  block[3] = &unk_264B9D3E0;
  block[4] = *(void *)(v44 + 40);
  dispatch_async_and_wait(v26, block);

  id v27 = objc_opt_new();
  id v50 = 0;
  id v28 = (id)[v9 performRequest:v27 error:&v50];
  id v29 = v50;

  if (v29)
  {
    uint64_t v30 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v61 = v29;
      _os_log_impl(&dword_230A49000, v30, OS_LOG_TYPE_ERROR, "MDMServerCore ignoring stop managing books with error: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v31 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v32 = [*(id *)(v44 + 40) _mdmFilePathForChannelType:0];
  v59[0] = v32;
  uint64_t v33 = objc_msgSend(*(id *)(v44 + 40), "_mdmPropertiesFilePathForChannelType:", objc_msgSend(*(id *)(v44 + 40), "channelType"));
  v59[1] = v33;
  uint64_t v34 = MDMAppManagementFilePath();
  v59[2] = v34;
  uint64_t v35 = objc_msgSend(*(id *)(v44 + 40), "_mdmOutstandingActivitiesFilePathForChannelType:", objc_msgSend(*(id *)(v44 + 40), "channelType"));
  v59[3] = v35;
  char v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:4];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v37 = v36;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v37);
        }
        [v31 removeItemAtPath:*(void *)(*((void *)&v46 + 1) + 8 * j) error:0];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v39);
  }

  uint64_t v42 = *(void *)(v44 + 56);
  if (v42) {
    (*(void (**)(uint64_t, void))(v42 + 16))(v42, 0);
  }
  v45[2](v45);
}

uint64_t __41__MDMServerCore_uprootMDMWithCompletion___block_invoke_114(uint64_t a1)
{
  [*(id *)(a1 + 32) _memberQueueSetCachedResponse:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _memberQueueSetTokenUpdateRequestCount:0];
}

- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v10 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore processDeviceRequest:encodeResponse:completion:]();
  }
  if (os_variant_has_internal_ui())
  {
    [(MDMServerCore *)self _processRequest:v8 encodeResponse:v6 completion:v9];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
  }
}

- (void)pushTokenWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
  {
    -[MDMServerCore pushTokenWithCompletion:]();
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    id v6 = objc_alloc(MEMORY[0x263F38BC0]);
    id v7 = [(MDMServerCore *)self _reasonStringWithReason:@"PushToken"];
    id v8 = (void *)[v6 initWithReason:v7];

    id v9 = [(MDMServerCore *)self jobQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__MDMServerCore_pushTokenWithCompletion___block_invoke;
    v11[3] = &unk_264B9E548;
    void v11[4] = self;
    id v12 = v8;
    id v13 = v4;
    id v10 = v8;
    [v9 fromFunction:"-[MDMServerCore pushTokenWithCompletion:]" enqueueJob:v11];
  }
LABEL_4:
}

void __41__MDMServerCore_pushTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__10;
  id v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  id v4 = [*(id *)(a1 + 32) memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__MDMServerCore_pushTokenWithCompletion___block_invoke_2;
  block[3] = &unk_264B9E5E8;
  block[4] = *(void *)(a1 + 32);
  void block[5] = &v11;
  dispatch_async_and_wait(v4, block);

  uint64_t v5 = v12[5];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, v5, 0);
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    id v8 = DMCErrorArray();
    id v9 = objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], 12011, v8, *MEMORY[0x263F38A40], 0);
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v9);
  }
  v3[2](v3);
  _Block_object_dispose(&v11, 8);
}

uint64_t __41__MDMServerCore_pushTokenWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueIsMDMConfigurationValid];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueuePushToken];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)touchWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG))
  {
    -[MDMServerCore touchWithCompletion:]();
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    uint64_t v6 = [(MDMServerCore *)self jobQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__MDMServerCore_touchWithCompletion___block_invoke;
    v7[3] = &unk_264B9E610;
    id v8 = v4;
    [v6 fromFunction:"-[MDMServerCore touchWithCompletion:]" enqueueJob:v7];
  }
LABEL_4:
}

void __37__MDMServerCore_touchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (**)(uint64_t, void))(v2 + 16);
  id v4 = a2;
  v3(v2, 0);
  v4[2]();
}

- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v10 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore processUserRequest:encodeResponse:completion:]();
  }
  [(MDMServerCore *)self _processRequest:v9 encodeResponse:v5 completion:v8];
}

- (void)isAwaitingUserConfiguredWithCompletion:(id)a3
{
  id v4 = (void (**)(id, BOOL, void))a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore isAwaitingUserConfiguredWithCompletion:]();
  }
  v4[2](v4, [(MDMServerCore *)self _isAwaitingUserConfigured], 0);
}

- (BOOL)_isAwaitingUserConfigured
{
  int v2 = [MEMORY[0x263F38BA0] awaitUserConfigurationEnabled];
  if (v2) {
    LOBYTE(v2) = [MEMORY[0x263F38BA0] isCurrentUserConfigured] ^ 1;
  }
  return v2;
}

- (void)depPushTokenWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore depPushTokenWithCompletion:]();
  }
  uint64_t v6 = [(MDMServerCore *)self depPushTokenManager];
  id v7 = [v6 depPushToken];

  v4[2](v4, v7, 0);
}

- (void)syncDEPPushTokenWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DMCLogObjects();
  if (os_log_type_enabled(*(os_log_t *)(v5 + 8), OS_LOG_TYPE_DEBUG)) {
    -[MDMServerCore syncDEPPushTokenWithCompletion:]();
  }
  uint64_t v6 = [(MDMServerCore *)self depPushTokenManager];
  [v6 syncDEPPushTokenWithCompletion:v4];
}

- (BOOL)isAppInstallBlocked
{
  int v2 = [(MDMServerCore *)self appInstallBlocker];
  char v3 = [v2 isAppInstallBlocked];

  return v3;
}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMServerCore *)self appInstallBlocker];
  [v5 blockAppInstallsWithCompletion:v4];
}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMServerCore *)self appInstallBlocker];
  [v5 unblockAppInstallsWithCompletion:v4];
}

- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3
{
  char v3 = (void (**)(id, void))a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "request install, received request to install all pending applications", buf, 2u);
  }
  *(void *)long long buf = 0;
  id v18 = buf;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__10;
  BOOL v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  id v5 = [MEMORY[0x263F39D18] currentUserConnection];
  uint64_t v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = MDMFilePath();
  id v8 = [v6 dictionaryWithContentsOfFile:v7];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52D90]];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = (void *)MEMORY[0x263F4BEC0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__MDMServerCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke;
  v13[3] = &unk_264B9E658;
  id v16 = buf;
  id v11 = v9;
  id v14 = v11;
  id v12 = v5;
  id v15 = v12;
  [v10 enumerateCoordinatorsUsingBlock:v13];
  if (v3) {
    v3[2](v3, *((void *)v18 + 5));
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __61__MDMServerCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = *(NSObject **)(DMCLogObjects() + 8);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 | v6)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 138543362;
      unint64_t v38 = v5;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, coordinator: %{public}@", buf, 0xCu);
    }
    if (v6)
    {
      id v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        unint64_t v38 = v6;
        _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_ERROR, "request install, unable to enumerate install coordinators: %{public}@", buf, 0xCu);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
      goto LABEL_10;
    }
    id v12 = [(id)v5 bundleID];
    uint64_t v13 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      unint64_t v38 = (unint64_t)v12;
      _os_log_impl(&dword_230A49000, v13, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, coordinator for bundle ID: %{public}@", buf, 0xCu);
    }
    if (([(id)v5 conformsToProtocol:&unk_26E567EF0] & 1) == 0)
    {
      uint64_t v19 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_ERROR, "request install, enumerating coordinators, coordinator is not IXCoordinatorWithAppAssetPromise", buf, 2u);
      }
      goto LABEL_42;
    }
    id v14 = (id)v5;
    id v36 = 0;
    uint64_t v15 = [v14 appAssetPromiseResponsibleClientWithError:&v36];
    id v16 = v36;
    if (v15 == 23)
    {
      long long v20 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        unint64_t v38 = (unint64_t)v12;
        _os_log_impl(&dword_230A49000, v20, OS_LOG_TYPE_DEFAULT, "request install, unable to ask MDM server to install app %{public}@, canceling install coordinator", buf, 0xCu);
      }
      BOOL v21 = (void *)[objc_alloc(MEMORY[0x263F4BEB8]) initWithName:v12 client:23 diskSpaceNeeded:0];
      id v22 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        unint64_t v38 = (unint64_t)v21;
        _os_log_impl(&dword_230A49000, v22, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, promise created: %{public}@", buf, 0xCu);
      }
      id v35 = 0;
      char v23 = [v14 setAppAssetPromise:v21 error:&v35];
      id v24 = v35;
      uint64_t v25 = DMCLogObjects();
      uint64_t v26 = *(NSObject **)(v25 + 8);
      if (v23)
      {
        id v33 = v24;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_230A49000, v26, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, promise set", buf, 2u);
        }
        id v27 = IXCreateUserPresentableError();
        id v34 = 0;
        char v28 = [v21 cancelForReason:v27 client:23 error:&v34];
        id v32 = v34;
        id v29 = *(NSObject **)(DMCLogObjects() + 8);
        if (v28)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_230A49000, v29, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, promise canceled", buf, 2u);
          }
          id v30 = objc_alloc_init(MEMORY[0x263F39DA8]);
          [v30 setInternal:MEMORY[0x263EFFA88]];
          [v30 setBundleIdentifier:v12];
          [v30 setManagementOptions:1];
          [v30 setPersonaIdentifier:*(void *)(a1 + 32)];
          [*(id *)(a1 + 40) performRequest:v30 completion:&__block_literal_global_7];

          uint64_t v31 = v32;
        }
        else
        {
          uint64_t v31 = v32;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            unint64_t v38 = (unint64_t)v32;
            _os_log_impl(&dword_230A49000, v29, OS_LOG_TYPE_ERROR, "request install, unable to cancel app asset promise: %{public}@", buf, 0xCu);
          }
        }

        id v24 = v33;
      }
      else if (os_log_type_enabled(*(os_log_t *)(v25 + 8), OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        unint64_t v38 = (unint64_t)v24;
        _os_log_impl(&dword_230A49000, v26, OS_LOG_TYPE_ERROR, "request install, unable to set app asset promise: %{public}@", buf, 0xCu);
      }

      goto LABEL_41;
    }
    if (v15)
    {
      id v17 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        unint64_t v38 = v15;
        id v18 = "request install, enumerating coordinators, coordinator does not belong to Device Management, client: %lu";
        goto LABEL_34;
      }
    }
    else
    {
      id v17 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        unint64_t v38 = (unint64_t)v16;
        id v18 = "request install, unable to determine client for coordinator, skipping: %{public}@";
LABEL_34:
        _os_log_impl(&dword_230A49000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      }
    }
LABEL_41:

LABEL_42:
    uint64_t v10 = 1;
    goto LABEL_11;
  }
  if (v8)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "request install, enumerating coordinators, enumeration done", buf, 2u);
  }
LABEL_10:
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

void __61__MDMServerCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke_186(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v3;
      unint64_t v5 = "request install, enumerating coordinators, unable to start managing app: %{public}@";
      unint64_t v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_230A49000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    unint64_t v5 = "request install, enumerating coordinators, start managing app request succeeded";
    unint64_t v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

- (void)getAssertionDescriptionsWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x263F38BE8];
    id v5 = a3;
    id v6 = [v4 assertionDescriptions];
    (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
  }
}

- (BOOL)_readConfigurationOutError:(id *)a3 isUproot:(BOOL)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  id v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  os_log_type_t v7 = [(MDMServerCore *)self memberQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__MDMServerCore__readConfigurationOutError_isUproot___block_invoke;
  v10[3] = &unk_264B9E680;
  void v10[4] = self;
  v10[5] = &v18;
  BOOL v11 = a4;
  v10[6] = &v12;
  dispatch_async_and_wait(v7, v10);

  if (a3 && !*((unsigned char *)v19 + 24)) {
    *a3 = (id) v13[5];
  }
  if (![(MDMServerCore *)self channelType]) {
    [(MDMServerCore *)self _pollOrScheduleNextPollForHRN];
  }
  char v8 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __53__MDMServerCore__readConfigurationOutError_isUproot___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _memberQueueForgetCurrentConfiguration];
  int v2 = [MEMORY[0x263F52810] sharedConfiguration];
  [v2 refreshDetailsFromDisk];

  id v3 = NSDictionary;
  id v4 = [*(id *)(a1 + 32) _mdmFilePathForChannelType:0];
  id v5 = [v3 DMCDictionaryFromFile:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _memberQueueParseMDMConfigurationDict:v5];
  [*(id *)(a1 + 32) _memberQueueSetupAPSConnectionIfNeeeded:*(unsigned __int8 *)(a1 + 56) valid:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  os_log_type_t v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_INFO, "Valid MDM configuration found.", (uint8_t *)&v16, 2u);
    }
    [*(id *)(a1 + 32) _memberQueueStartListeningForInterestingEvents];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v16 = 138543362;
      uint64_t v17 = v8;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_ERROR, "No valid MDM installation found. MDM will not listen to push messages. Error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    [*(id *)(a1 + 32) _memberQueueStopListeningForInterestingEvents];
    int v9 = [MEMORY[0x263F08850] defaultManager];
    id v10 = objc_msgSend(*(id *)(a1 + 32), "_mdmOutstandingActivitiesFilePathForChannelType:", objc_msgSend(*(id *)(a1 + 32), "channelType"));
    [v9 removeItemAtPath:v10 error:0];

    BOOL v11 = [*(id *)(a1 + 32) pushServiceManager];
    [v11 stopListeningForAllMDMPushMessagesWithEnvironment:0];

    uint64_t v12 = [*(id *)(a1 + 32) pushServiceManager];
    [v12 stopListeningForAllMDMPushMessagesWithEnvironment:1];

    [*(id *)(a1 + 32) _memberQueueForgetCurrentConfiguration];
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v13 = [*(id *)(a1 + 32) _createBadInstallationError];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  [*(id *)(a1 + 32) setMemberQueueIsMDMConfigurationValid:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (void)_memberQueueForgetCurrentConfiguration
{
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "MDMDServer: memberQueueForgetCurrentConfiguration.", v4, 2u);
  }
  [(MDMServerCore *)self setMemberQueueIsMDMConfigurationValid:0];
  if ([(MDMServerCore *)self memberQueueIdentity])
  {
    CFRelease([(MDMServerCore *)self memberQueueIdentity]);
    [(MDMServerCore *)self setMemberQueueIdentity:0];
  }
  [(MDMServerCore *)self setMemberQueueAccessRights:0];
  [(MDMServerCore *)self setMemberQueueCheckInPinnedSecCertificateRefs:0];
  [(MDMServerCore *)self setMemberQueueCheckInURL:0];
  [(MDMServerCore *)self setMemberQueueEnrollmentID:0];
  [(MDMServerCore *)self setMemberQueueIsMDMConfigurationValid:0];
  [(MDMServerCore *)self setMemberQueueLastPollingAttempt:0];
  [(MDMServerCore *)self setMemberQueueLastPollingAttemptMonotonicTime:0];
  [(MDMServerCore *)self setMemberQueueLastPollingAttemptRTCResetCount:0];
  [(MDMServerCore *)self setMemberQueueLastPollingSuccess:0];
  [(MDMServerCore *)self setMemberQueueLastPollingSuccessMonotonicTime:0];
  [(MDMServerCore *)self setMemberQueueLastPollingSuccessRTCResetCount:0];
  [(MDMServerCore *)self setMemberQueueMDMOptions:0];
  [(MDMServerCore *)self setMemberQueueManagingProfileIdentifier:0];
  [(MDMServerCore *)self setMemberQueueOrganizationInfo:0];
  [(MDMServerCore *)self setMemberQueuePinningRevocationCheckRequired:0];
  [(MDMServerCore *)self setMemberQueuePollingInterval:0];
  [(MDMServerCore *)self setMemberQueuePushMagic:0];
  [(MDMServerCore *)self setMemberQueuePushToken:0];
  [(MDMServerCore *)self setMemberQueueServerPinnedSecCertificateRefs:0];
  [(MDMServerCore *)self setMemberQueueServerURL:0];
  [(MDMServerCore *)self setMemberQueueSignMessage:0];
  [(MDMServerCore *)self setMemberQueueTopic:0];
  [(MDMServerCore *)self setMemberQueueUseDevelopmentAPNS:0];
  [(MDMServerCore *)self setMemberQueueUseEnrollmentID:0];
}

- (BOOL)_memberQueueParseMDMConfigurationDict:(id)a3
{
  uint64_t v155 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v66 = (void *)MEMORY[0x263F087E8];
    uint64_t v67 = *MEMORY[0x263F38B10];
    BOOL v11 = DMCErrorArray();
    uint64_t v68 = *MEMORY[0x263F38A40];
    v69 = v66;
    uint64_t v70 = v67;
    uint64_t v71 = 12079;
LABEL_35:
    v73 = objc_msgSend(v69, "DMCErrorWithDomain:code:descriptionArray:errorType:", v70, v71, v11, v68, 0);
    int v6 = 0;
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v72 = (void *)MEMORY[0x263F087E8];
    uint64_t v67 = *MEMORY[0x263F38B10];
    BOOL v11 = DMCErrorArray();
    uint64_t v68 = *MEMORY[0x263F38A40];
    v69 = v72;
    uint64_t v70 = v67;
    uint64_t v71 = 12011;
    goto LABEL_35;
  }
  uint64_t v5 = *MEMORY[0x263F529F0];
  int v6 = [v4 objectForKey:*MEMORY[0x263F529F0]];
  if (!v6) {
    goto LABEL_83;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_83;
  }
  os_log_type_t v7 = (void *)MEMORY[0x263F38B90];
  uint64_t v8 = [MEMORY[0x263F52810] sharedConfiguration];
  int v9 = [v8 personaID];
  -[MDMServerCore setMemberQueueIdentity:](self, "setMemberQueueIdentity:", [v7 copyIdentityWithPersistentID:v6 useSystemKeychain:1 enforcePersonalPersona:v9 != 0]);

  if (![(MDMServerCore *)self memberQueueIdentity])
  {
    id v74 = (void *)MEMORY[0x263F087E8];
    uint64_t v67 = *MEMORY[0x263F38B10];
    uint64_t v151 = 0;
    BOOL v11 = DMCErrorArray();
    uint64_t v75 = *MEMORY[0x263F38A40];
    v76 = v74;
    uint64_t v77 = v67;
    uint64_t v78 = 12016;
LABEL_84:
    v73 = objc_msgSend(v76, "DMCErrorWithDomain:code:descriptionArray:errorType:", v77, v78, v11, v75, v151, v152);
    goto LABEL_85;
  }
  uint64_t v10 = *MEMORY[0x263F52E88];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F52E88]];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_97;
    }
  }
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = [MEMORY[0x263F52810] sharedConfiguration];
  uint64_t v14 = [v13 personaID];
  uint64_t v15 = (void *)[v12 copyCertificatesWithPersistentIDs:v11 useSystemKeychain:1 enforcePersonalPersona:v14 != 0];
  [(MDMServerCore *)self setMemberQueueServerPinnedSecCertificateRefs:v15];

  uint64_t v10 = *MEMORY[0x263F52990];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F52990]];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_97;
    }
  }
  int v16 = objc_opt_class();
  uint64_t v17 = [MEMORY[0x263F52810] sharedConfiguration];
  uint64_t v18 = [v17 personaID];
  uint64_t v19 = (void *)[v16 copyCertificatesWithPersistentIDs:v11 useSystemKeychain:1 enforcePersonalPersona:v18 != 0];
  [(MDMServerCore *)self setMemberQueueCheckInPinnedSecCertificateRefs:v19];

  uint64_t v10 = *MEMORY[0x263F52D98];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F52D98]];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_97;
    }
  }
  -[MDMServerCore setMemberQueuePinningRevocationCheckRequired:](self, "setMemberQueuePinningRevocationCheckRequired:", [v11 BOOLValue]);

  uint64_t v5 = *MEMORY[0x263F52A98];
  uint64_t v20 = [v4 objectForKey:*MEMORY[0x263F52A98]];
  [(MDMServerCore *)self setMemberQueueManagingProfileIdentifier:v20];

  uint64_t v21 = [(MDMServerCore *)self memberQueueManagingProfileIdentifier];
  if (!v21) {
    goto LABEL_83;
  }
  id v22 = (void *)v21;
  char v23 = [(MDMServerCore *)self memberQueueManagingProfileIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_83;
  }
  uint64_t v25 = [MEMORY[0x263F38B28] sharedInstance];
  int v26 = [v25 hrnMode];

  switch(v26)
  {
    case 2:
      uint64_t v5 = *MEMORY[0x263F52DA0];
      v79 = [v4 objectForKey:*MEMORY[0x263F52DA0]];
      [(MDMServerCore *)self setMemberQueuePollingInterval:v79];

      uint64_t v80 = [(MDMServerCore *)self memberQueuePollingInterval];
      if (!v80) {
        goto LABEL_83;
      }
      v81 = (void *)v80;
      uint64_t v82 = [(MDMServerCore *)self memberQueuePollingInterval];
      objc_opt_class();
      char v83 = objc_opt_isKindOfClass();

      if ((v83 & 1) == 0) {
        goto LABEL_83;
      }
      uint64_t v5 = *MEMORY[0x263F529F8];
      uint64_t v84 = [v4 objectForKey:*MEMORY[0x263F529F8]];
      [(MDMServerCore *)self setMemberQueueLastPollingAttempt:v84];

      uint64_t v85 = [(MDMServerCore *)self memberQueueLastPollingAttempt];
      if (v85)
      {
        uint64_t v86 = (void *)v85;
        char v87 = [(MDMServerCore *)self memberQueueLastPollingAttempt];
        objc_opt_class();
        char v88 = objc_opt_isKindOfClass();

        if ((v88 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A10];
      v89 = [v4 objectForKey:*MEMORY[0x263F52A10]];
      [(MDMServerCore *)self setMemberQueueLastPollingSuccess:v89];

      uint64_t v90 = [(MDMServerCore *)self memberQueueLastPollingSuccess];
      if (v90)
      {
        v91 = (void *)v90;
        v92 = [(MDMServerCore *)self memberQueueLastPollingSuccess];
        objc_opt_class();
        char v93 = objc_opt_isKindOfClass();

        if ((v93 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A00];
      uint64_t v94 = [v4 objectForKey:*MEMORY[0x263F52A00]];
      [(MDMServerCore *)self setMemberQueueLastPollingAttemptMonotonicTime:v94];

      uint64_t v95 = [(MDMServerCore *)self memberQueueLastPollingAttemptMonotonicTime];
      if (v95)
      {
        uint64_t v96 = (void *)v95;
        uint64_t v97 = [(MDMServerCore *)self memberQueueLastPollingAttemptMonotonicTime];
        objc_opt_class();
        char v98 = objc_opt_isKindOfClass();

        if ((v98 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A08];
      v99 = [v4 objectForKey:*MEMORY[0x263F52A08]];
      [(MDMServerCore *)self setMemberQueueLastPollingAttemptRTCResetCount:v99];

      uint64_t v100 = [(MDMServerCore *)self memberQueueLastPollingAttemptRTCResetCount];
      if (v100)
      {
        v101 = (void *)v100;
        v102 = [(MDMServerCore *)self memberQueueLastPollingAttemptRTCResetCount];
        objc_opt_class();
        char v103 = objc_opt_isKindOfClass();

        if ((v103 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A18];
      uint64_t v104 = [v4 objectForKey:*MEMORY[0x263F52A18]];
      [(MDMServerCore *)self setMemberQueueLastPollingSuccessMonotonicTime:v104];

      uint64_t v105 = [(MDMServerCore *)self memberQueueLastPollingSuccessMonotonicTime];
      if (v105)
      {
        uint64_t v106 = (void *)v105;
        v107 = [(MDMServerCore *)self memberQueueLastPollingSuccessMonotonicTime];
        objc_opt_class();
        char v108 = objc_opt_isKindOfClass();

        if ((v108 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A20];
      id v109 = [v4 objectForKey:*MEMORY[0x263F52A20]];
      [(MDMServerCore *)self setMemberQueueLastPollingSuccessRTCResetCount:v109];

      uint64_t v63 = [(MDMServerCore *)self memberQueueLastPollingSuccessRTCResetCount];
      if (v63) {
        goto LABEL_32;
      }
      break;
    case 1:
      uint64_t v5 = *MEMORY[0x263F52EF8];
      uint64_t v110 = [v4 objectForKey:*MEMORY[0x263F52EF8]];
      [(MDMServerCore *)self setMemberQueueTopic:v110];

      uint64_t v111 = [(MDMServerCore *)self memberQueueTopic];
      if (!v111) {
        goto LABEL_83;
      }
      v64 = (void *)v111;
      uint64_t v65 = [(MDMServerCore *)self memberQueueTopic];
LABEL_53:
      objc_opt_class();
      char v112 = objc_opt_isKindOfClass();

      if (v112) {
        break;
      }
LABEL_83:
      v137 = (void *)MEMORY[0x263F087E8];
      uint64_t v67 = *MEMORY[0x263F38B10];
      uint64_t v151 = v5;
      uint64_t v152 = 0;
      BOOL v11 = DMCErrorArray();
      uint64_t v75 = *MEMORY[0x263F38A40];
      v76 = v137;
      uint64_t v77 = v67;
      uint64_t v78 = 12011;
      goto LABEL_84;
    case 0:
      uint64_t v5 = *MEMORY[0x263F52EF8];
      id v27 = [v4 objectForKey:*MEMORY[0x263F52EF8]];
      [(MDMServerCore *)self setMemberQueueTopic:v27];

      uint64_t v28 = [(MDMServerCore *)self memberQueueTopic];
      if (v28)
      {
        id v29 = (void *)v28;
        id v30 = [(MDMServerCore *)self memberQueueTopic];
        objc_opt_class();
        char v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52DA0];
      id v32 = [v4 objectForKey:*MEMORY[0x263F52DA0]];
      [(MDMServerCore *)self setMemberQueuePollingInterval:v32];

      uint64_t v33 = [(MDMServerCore *)self memberQueuePollingInterval];
      if (v33)
      {
        id v34 = (void *)v33;
        id v35 = [(MDMServerCore *)self memberQueuePollingInterval];
        objc_opt_class();
        char v36 = objc_opt_isKindOfClass();

        if ((v36 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F529F8];
      id v37 = [v4 objectForKey:*MEMORY[0x263F529F8]];
      [(MDMServerCore *)self setMemberQueueLastPollingAttempt:v37];

      uint64_t v38 = [(MDMServerCore *)self memberQueueLastPollingAttempt];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        uint64_t v40 = [(MDMServerCore *)self memberQueueLastPollingAttempt];
        objc_opt_class();
        char v41 = objc_opt_isKindOfClass();

        if ((v41 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A10];
      uint64_t v42 = [v4 objectForKey:*MEMORY[0x263F52A10]];
      [(MDMServerCore *)self setMemberQueueLastPollingSuccess:v42];

      uint64_t v43 = [(MDMServerCore *)self memberQueueLastPollingSuccess];
      if (v43)
      {
        uint64_t v44 = (void *)v43;
        uint64_t v45 = [(MDMServerCore *)self memberQueueLastPollingSuccess];
        objc_opt_class();
        char v46 = objc_opt_isKindOfClass();

        if ((v46 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A00];
      long long v47 = [v4 objectForKey:*MEMORY[0x263F52A00]];
      [(MDMServerCore *)self setMemberQueueLastPollingAttemptMonotonicTime:v47];

      uint64_t v48 = [(MDMServerCore *)self memberQueueLastPollingAttemptMonotonicTime];
      if (v48)
      {
        long long v49 = (void *)v48;
        id v50 = [(MDMServerCore *)self memberQueueLastPollingAttemptMonotonicTime];
        objc_opt_class();
        char v51 = objc_opt_isKindOfClass();

        if ((v51 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A08];
      id v52 = [v4 objectForKey:*MEMORY[0x263F52A08]];
      [(MDMServerCore *)self setMemberQueueLastPollingAttemptRTCResetCount:v52];

      uint64_t v53 = [(MDMServerCore *)self memberQueueLastPollingAttemptRTCResetCount];
      if (v53)
      {
        long long v54 = (void *)v53;
        long long v55 = [(MDMServerCore *)self memberQueueLastPollingAttemptRTCResetCount];
        objc_opt_class();
        char v56 = objc_opt_isKindOfClass();

        if ((v56 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A18];
      id v57 = [v4 objectForKey:*MEMORY[0x263F52A18]];
      [(MDMServerCore *)self setMemberQueueLastPollingSuccessMonotonicTime:v57];

      uint64_t v58 = [(MDMServerCore *)self memberQueueLastPollingSuccessMonotonicTime];
      if (v58)
      {
        v59 = (void *)v58;
        id v60 = [(MDMServerCore *)self memberQueueLastPollingSuccessMonotonicTime];
        objc_opt_class();
        char v61 = objc_opt_isKindOfClass();

        if ((v61 & 1) == 0) {
          goto LABEL_83;
        }
      }
      uint64_t v5 = *MEMORY[0x263F52A20];
      __int16 v62 = [v4 objectForKey:*MEMORY[0x263F52A20]];
      [(MDMServerCore *)self setMemberQueueLastPollingSuccessRTCResetCount:v62];

      uint64_t v63 = [(MDMServerCore *)self memberQueueLastPollingSuccessRTCResetCount];
      if (v63)
      {
LABEL_32:
        v64 = (void *)v63;
        uint64_t v65 = [(MDMServerCore *)self memberQueueLastPollingSuccessRTCResetCount];
        goto LABEL_53;
      }
      break;
  }
  uint64_t v10 = *MEMORY[0x263F52E90];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F52E90]];
  if (!v11) {
    goto LABEL_97;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_97;
  }
  v113 = (void *)[objc_alloc(NSURL) initWithString:v11];
  [(MDMServerCore *)self setMemberQueueServerURL:v113];

  uint64_t v10 = *MEMORY[0x263F52998];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F52998]];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_97;
    }
    v114 = (void *)[objc_alloc(NSURL) initWithString:v11];
    [(MDMServerCore *)self setMemberQueueCheckInURL:v114];
  }
  else
  {
    v114 = [(MDMServerCore *)self memberQueueServerURL];
    id v115 = (void *)[v114 copy];
    [(MDMServerCore *)self setMemberQueueCheckInURL:v115];
  }
  uint64_t v10 = *MEMORY[0x263F528B8];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F528B8]];
  if (!v11) {
    goto LABEL_97;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_97;
  }
  -[MDMServerCore setMemberQueueAccessRights:](self, "setMemberQueueAccessRights:", [v11 unsignedIntValue]);

  uint64_t v10 = *MEMORY[0x263F52F08];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F52F08]];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_97;
    }
  }
  -[MDMServerCore setMemberQueueUseDevelopmentAPNS:](self, "setMemberQueueUseDevelopmentAPNS:", [v11 BOOLValue]);

  uint64_t v10 = *MEMORY[0x263F52EE0];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F52EE0]];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_97;
    }
  }
  -[MDMServerCore setMemberQueueSignMessage:](self, "setMemberQueueSignMessage:", [v11 BOOLValue]);

  uint64_t v5 = *MEMORY[0x263F52E48];
  uint64_t v116 = [v4 objectForKey:*MEMORY[0x263F52E48]];
  [(MDMServerCore *)self setMemberQueuePushMagic:v116];

  uint64_t v117 = [(MDMServerCore *)self memberQueuePushMagic];
  if (!v117) {
    goto LABEL_83;
  }
  uint64_t v118 = (void *)v117;
  uint64_t v119 = [(MDMServerCore *)self memberQueuePushMagic];
  objc_opt_class();
  char v120 = objc_opt_isKindOfClass();

  if ((v120 & 1) == 0) {
    goto LABEL_83;
  }
  uint64_t v5 = *MEMORY[0x263F52B10];
  v121 = [v4 objectForKey:*MEMORY[0x263F52B10]];
  [(MDMServerCore *)self setMemberQueueOrganizationInfo:v121];

  uint64_t v122 = [(MDMServerCore *)self memberQueueOrganizationInfo];
  if (v122)
  {
    char v123 = (void *)v122;
    v124 = [(MDMServerCore *)self memberQueueOrganizationInfo];
    objc_opt_class();
    char v125 = objc_opt_isKindOfClass();

    if ((v125 & 1) == 0) {
      goto LABEL_83;
    }
  }
  uint64_t v5 = *MEMORY[0x263F52B08];
  v126 = [v4 objectForKey:*MEMORY[0x263F52B08]];
  [(MDMServerCore *)self setMemberQueueMDMOptions:v126];

  uint64_t v127 = [(MDMServerCore *)self memberQueueMDMOptions];
  if (v127)
  {
    uint64_t v128 = (void *)v127;
    v129 = [(MDMServerCore *)self memberQueueMDMOptions];
    objc_opt_class();
    char v130 = objc_opt_isKindOfClass();

    if ((v130 & 1) == 0) {
      goto LABEL_83;
    }
  }
  uint64_t v10 = *MEMORY[0x263F52F20];
  BOOL v11 = [v4 objectForKey:*MEMORY[0x263F52F20]];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_97:
      v147 = (void *)MEMORY[0x263F087E8];
      uint64_t v67 = *MEMORY[0x263F38B10];
      v148 = DMCErrorArray();
      v73 = objc_msgSend(v147, "DMCErrorWithDomain:code:descriptionArray:errorType:", v67, 12011, v148, *MEMORY[0x263F38A40], v10, 0);

      goto LABEL_85;
    }
  }
  -[MDMServerCore setMemberQueueUseEnrollmentID:](self, "setMemberQueueUseEnrollmentID:", [v11 BOOLValue]);

  uint64_t v5 = *MEMORY[0x263F529B0];
  v131 = [v4 objectForKey:*MEMORY[0x263F529B0]];
  [(MDMServerCore *)self setMemberQueueEnrollmentID:v131];

  uint64_t v132 = [(MDMServerCore *)self memberQueueEnrollmentID];
  if (v132)
  {
    v133 = (void *)v132;
    v134 = [(MDMServerCore *)self memberQueueEnrollmentID];
    objc_opt_class();
    char v135 = objc_opt_isKindOfClass();

    if ((v135 & 1) == 0) {
      goto LABEL_83;
    }
  }
  if ([(MDMServerCore *)self channelType] == 1)
  {
    BOOL v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F52E80]];
    if ((![MEMORY[0x263F38BA0] isSharediPad]
       || [v11 containsObject:*MEMORY[0x263F52D88]])
      && (([MEMORY[0x263F38BA0] isSharediPad] & 1) != 0
       || [v11 containsObject:*MEMORY[0x263F52F18]]))
    {

      goto LABEL_82;
    }
    v149 = (void *)MEMORY[0x263F087E8];
    uint64_t v67 = *MEMORY[0x263F38B10];
    v150 = DMCErrorArray();
    v73 = objc_msgSend(v149, "DMCErrorWithDomain:code:descriptionArray:errorType:", v67, 12076, v150, *MEMORY[0x263F38A40], 0);

LABEL_85:
    if (!v73)
    {
LABEL_95:
      BOOL v136 = 0;
      goto LABEL_96;
    }
    v138 = [v73 domain];
    if ([v138 isEqualToString:v67])
    {
      uint64_t v139 = [v73 code];

      if (v139 == 12079)
      {
        v140 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          v141 = "No MDM installation found";
          v142 = v140;
          os_log_type_t v143 = OS_LOG_TYPE_DEFAULT;
          uint32_t v144 = 2;
LABEL_93:
          _os_log_impl(&dword_230A49000, v142, v143, v141, buf, v144);
          goto LABEL_94;
        }
        goto LABEL_94;
      }
    }
    else
    {
    }
    v145 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      v154 = v73;
      v141 = "Failed to parse MDM configuration: %{public}@";
      v142 = v145;
      os_log_type_t v143 = OS_LOG_TYPE_ERROR;
      uint32_t v144 = 12;
      goto LABEL_93;
    }
LABEL_94:

    goto LABEL_95;
  }
LABEL_82:
  BOOL v136 = 1;
LABEL_96:

  return v136;
}

- (void)_memberQueueWriteDict:(id)a3 toMDMConfigurationFileForChannel:(unint64_t)a4 shouldNotify:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  uint64_t v8 = [(MDMServerCore *)self _mdmFilePathForChannelType:a4];
  int v9 = [v8 stringByDeletingLastPathComponent];
  uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
  char v11 = [v10 fileExistsAtPath:v9];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    [v12 createDirectoryAtPath:v9 withIntermediateDirectories:0 attributes:0 error:0];
  }
  [v14 DMCWriteToBinaryFile:v8];
  if (a4)
  {
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v13 = [MEMORY[0x263F52810] sharedConfiguration];
  [v13 refreshDetailsFromDisk];

  if (v5) {
LABEL_5:
  }
    MDMSendManagingOrgInfoChangedNotification();
LABEL_6:
}

- (void)_memberQueueUpdateMDMConfiguration:(id)a3 organizationInfo:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    [v10 setObject:v6 forKeyedSubscript:*MEMORY[0x263F52B10]];
    os_log_type_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F38990]];
    [(MDMServerCore *)self _memberQueueWriteDict:v10 toMDMConfigurationFileForChannel:0 shouldNotify:1];
    if (v7)
    {
      uint64_t v8 = [v10 objectForKeyedSubscript:*MEMORY[0x263F52E68]];
      int v9 = [v10 objectForKeyedSubscript:*MEMORY[0x263F52D90]];
      [(MDMServerCore *)self _changeOrganizationNameForRMAccountIdentifier:v8 personaID:v9 organizationName:v7];
    }
  }
  else
  {
    [v10 removeObjectForKey:*MEMORY[0x263F52B10]];
    [(MDMServerCore *)self _memberQueueWriteDict:v10 toMDMConfigurationFileForChannel:0 shouldNotify:1];
  }
}

- (NSDictionary)organizationInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__10;
  char v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  id v3 = [(MDMServerCore *)self memberQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__MDMServerCore_organizationInfo__block_invoke;
  v6[3] = &unk_264B9D318;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __33__MDMServerCore_organizationInfo__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueOrganizationInfo];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setOrganizationInfo:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [(MDMServerCore *)self memberQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__MDMServerCore_setOrganizationInfo___block_invoke;
  v7[3] = &unk_264B9D408;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __37__MDMServerCore_setOrganizationInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMemberQueueOrganizationInfo:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v3 = [*(id *)(a1 + 32) _mdmFilePathForChannelType:0];
  id v5 = [v2 dictionaryWithContentsOfFile:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) _memberQueueUpdateMDMConfiguration:v5 organizationInfo:*(void *)(a1 + 40)];
    id v4 = v5;
  }
}

- (NSDictionary)MDMOptions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__10;
  char v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  uint64_t v3 = [(MDMServerCore *)self memberQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__MDMServerCore_MDMOptions__block_invoke;
  v6[3] = &unk_264B9D318;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __27__MDMServerCore_MDMOptions__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueMDMOptions];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setMDMOptions:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__MDMServerCore_setMDMOptions___block_invoke;
  block[3] = &unk_264B9D408;
  block[4] = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, block);

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(MDMServerCore *)self memberQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__MDMServerCore_setMDMOptions___block_invoke_2;
  v10[3] = &unk_264B9D3E0;
  dispatch_semaphore_t v11 = v7;
  uint64_t v9 = v7;
  dispatch_async(v8, v10);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void __31__MDMServerCore_setMDMOptions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMemberQueueMDMOptions:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v3 = [*(id *)(a1 + 32) _mdmFilePathForChannelType:0];
  id v6 = [v2 dictionaryWithContentsOfFile:v3];

  id v4 = v6;
  if (v6)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F52B08]];
    }
    else {
      [v6 removeObjectForKey:*MEMORY[0x263F52B08]];
    }
    [*(id *)(a1 + 32) _memberQueueWriteDict:v6 toMDMConfigurationFileForChannel:0 shouldNotify:1];
    id v4 = v6;
  }
}

void __31__MDMServerCore_setMDMOptions___block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = __31__MDMServerCore_setMDMOptions___block_invoke_3;
  v1[3] = &unk_264B9D6F0;
  id v2 = *(id *)(a1 + 32);
  +[MDMFindMyUtilities enableActivationLockWithCompletion:v1];
}

intptr_t __31__MDMServerCore_setMDMOptions___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)userSwitchAlreadyInitiated
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if ([MEMORY[0x263F38BA0] isSharediPad])
  {
    uint64_t v3 = [(MDMServerCore *)self memberQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__MDMServerCore_userSwitchAlreadyInitiated__block_invoke;
    v6[3] = &unk_264B9D318;
    void v6[4] = self;
    v6[5] = &v7;
    dispatch_async_and_wait(v3, v6);
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__MDMServerCore_userSwitchAlreadyInitiated__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueUserSwitchAlreadyInitiated];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setUserSwitchAlreadyInitiated:(BOOL)a3
{
  uint64_t v5 = [(MDMServerCore *)self memberQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__MDMServerCore_setUserSwitchAlreadyInitiated___block_invoke;
  v6[3] = &unk_264B9E6A8;
  void v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __47__MDMServerCore_setUserSwitchAlreadyInitiated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueUserSwitchAlreadyInitiated:*(unsigned __int8 *)(a1 + 40)];
}

- (NSDictionary)softwareUpdatePathFromDisk
{
  id v2 = NSDictionary;
  uint64_t v3 = [(MDMServerCore *)self _mdmFilePathForChannelType:0];
  char v4 = [v2 DMCDictionaryFromFile:v3];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"SoftwareUpdateSettings"];

  return (NSDictionary *)v5;
}

- (NSString)organizationName
{
  id v2 = [(MDMServerCore *)self organizationInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F38990]];

  return (NSString *)v3;
}

- (NSString)serverName
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__10;
  dispatch_semaphore_t v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  uint64_t v3 = [(MDMServerCore *)self memberQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__MDMServerCore_serverName__block_invoke;
  v6[3] = &unk_264B9D318;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  char v4 = [(id)v8[5] host];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __27__MDMServerCore_serverName__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueServerURL];
  return MEMORY[0x270F9A758]();
}

- (NSString)daemonIdentifier
{
  id v2 = [(MDMServerCore *)self channelType];
  if (v2)
  {
    if (v2 != (__CFString *)1) {
      goto LABEL_6;
    }
    uint64_t v3 = kMDMDUserIdentifier;
  }
  else
  {
    uint64_t v3 = kMDMDIdentifier;
  }
  id v2 = *v3;
LABEL_6:
  return (NSString *)v2;
}

- (void)_executeBlockWhenPushTokenIsAvailable:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F38BC0]);
  id v6 = [(MDMServerCore *)self _reasonStringWithReason:@"PushToken"];
  uint64_t v7 = (void *)[v5 initWithReason:v6];

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__10;
  uint64_t v25 = __Block_byref_object_dispose__10;
  id v26 = 0;
  id v8 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke;
  block[3] = &unk_264B9D318;
  block[4] = self;
  void block[5] = &v21;
  dispatch_async_and_wait(v8, block);

  if (v22[5]
    || ([MEMORY[0x263F38B28] sharedInstance],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = [v9 hrnMode] == 1,
        v9,
        !v10))
  {
    if (v4)
    {
      id v13 = [(MDMServerCore *)self jobQueue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_4;
      v14[3] = &unk_264B9E6F8;
      id v15 = v4;
      int v16 = &v21;
      [v13 queueBlock:v14];
    }
  }
  else
  {
    dispatch_semaphore_t v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v28 = "-[MDMServerCore _executeBlockWhenPushTokenIsAvailable:]";
      _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEFAULT, "%s: Waiting for push token...", buf, 0xCu);
    }
    id v12 = [(MDMServerCore *)self jobQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_207;
    v17[3] = &unk_264B9D5B8;
    v17[4] = self;
    id v19 = v4;
    id v18 = v7;
    [v12 queueBlock:v17];
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueuePushToken];
  return MEMORY[0x270F9A758]();
}

void __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_207(id *a1)
{
  id v2 = [a1[4] executionQueuePushTokenWaitContinuationBlock];
  objc_initWeak(&location, a1[4]);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_2;
  v4[3] = &unk_264B9E6D0;
  objc_copyWeak(&v8, &location);
  id v3 = v2;
  id v6 = v3;
  id v7 = a1[6];
  id v5 = a1[5];
  [a1[4] setExecutionQueuePushTokenWaitContinuationBlock:v4];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    dispatch_semaphore_t v11 = __Block_byref_object_copy__10;
    id v12 = __Block_byref_object_dispose__10;
    id v13 = 0;
    id v4 = [WeakRetained memberQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_3;
    v7[3] = &unk_264B9D318;
    void v7[4] = v3;
    void v7[5] = &v8;
    dispatch_async_and_wait(v4, v7);

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v9[5]);
    }
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueuePushToken];
  return MEMORY[0x270F9A758]();
}

uint64_t __55__MDMServerCore__executeBlockWhenPushTokenIsAvailable___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)_executePushTokenWaitContinuationBlock
{
  id v3 = [(MDMServerCore *)self jobQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__MDMServerCore__executePushTokenWaitContinuationBlock__block_invoke;
  v4[3] = &unk_264B9D3E0;
  void v4[4] = self;
  [v3 queueBlock:v4];
}

void __55__MDMServerCore__executePushTokenWaitContinuationBlock__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) executionQueuePushTokenWaitContinuationBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) executionQueuePushTokenWaitContinuationBlock];
    [*(id *)(a1 + 32) setExecutionQueuePushTokenWaitContinuationBlock:0];
    v3[2]();
  }
}

- (void)_memberQueueSetupAPSConnectionIfNeeeded:(BOOL)a3 valid:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [MEMORY[0x263F38B28] sharedInstance];
  int v8 = [v7 hrnMode];

  if (v8)
  {
    if (v8 == 1 && !a3)
    {
      BOOL v9 = [(MDMServerCore *)self channelType] == 1;
      [(MDMServerCore *)self _memberQueueSetupAPSConnectionIsMDMConfigurationValid:v4 isUserDaemon:v9];
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F38B28] sharedInstance];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __63__MDMServerCore__memberQueueSetupAPSConnectionIfNeeeded_valid___block_invoke;
    v11[3] = &unk_264B9E6A8;
    void v11[4] = self;
    BOOL v12 = a3;
    [v10 addDidBecomeReadyKey:@"readConfigurationOutError:" callback:v11];
  }
}

void __63__MDMServerCore__memberQueueSetupAPSConnectionIfNeeeded_valid___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = 0;
  [v1 _readConfigurationOutError:&v4 isUproot:*(unsigned __int8 *)(a1 + 40)];
  id v2 = v4;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v6 = v2;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_ERROR, "No valid MDM configuration found. Error: %{public}@", buf, 0xCu);
    }
  }
}

- (void)_memberQueueSetupAPSConnectionIsMDMConfigurationValid:(BOOL)a3 isUserDaemon:(BOOL)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "MDMDServerCore has a valid MDM configuration", buf, 2u);
    }
    [(MDMServerCore *)self setMemberQueueIsUprooting:0];
    id v6 = [(MDMServerCore *)self memberQueueTopic];

    if (v6)
    {
      BOOL v7 = [(MDMServerCore *)self memberQueueUseDevelopmentAPNS];
      int v8 = *(NSObject **)(DMCLogObjects() + 8);
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          uint64_t v10 = v8;
          dispatch_semaphore_t v11 = [(MDMServerCore *)self memberQueueTopic];
          *(_DWORD *)long long buf = 138543362;
          uint64_t v33 = v11;
          _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_DEFAULT, "MDMDServerCore using Dev APS, enabling topic: %{public}@", buf, 0xCu);
        }
        BOOL v12 = [(MDMServerCore *)self pushServiceManager];
        id v13 = [(MDMServerCore *)self memberQueueTopic];
        [v12 startListeningForMDMPushMessageWithTopic:v13 environment:1];

        id v14 = [(MDMServerCore *)self pushServiceManager];
        [v14 requestPublicTokenWithEnvironment:1];

        id v15 = [(MDMServerCore *)self pushServiceManager];
        int v16 = v15;
        uint64_t v17 = 0;
      }
      else
      {
        if (v9)
        {
          id v18 = v8;
          id v19 = [(MDMServerCore *)self memberQueueTopic];
          *(_DWORD *)long long buf = 138543362;
          uint64_t v33 = v19;
          _os_log_impl(&dword_230A49000, v18, OS_LOG_TYPE_DEFAULT, "MDMDServerCore using Prod APS, enabling topic: %{public}@", buf, 0xCu);
        }
        uint64_t v20 = [(MDMServerCore *)self pushServiceManager];
        uint64_t v21 = [(MDMServerCore *)self memberQueueTopic];
        [v20 startListeningForMDMPushMessageWithTopic:v21 environment:0];

        id v22 = [(MDMServerCore *)self pushServiceManager];
        [v22 requestPublicTokenWithEnvironment:0];

        id v15 = [(MDMServerCore *)self pushServiceManager];
        int v16 = v15;
        uint64_t v17 = 1;
      }
      [v15 stopListeningForAllMDMPushMessagesWithEnvironment:v17];
    }
    if ([MEMORY[0x263F38B70] fakePushToken])
    {
      uint64_t v23 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_230A49000, v23, OS_LOG_TYPE_DEFAULT, "Using fake push token for this device...", buf, 2u);
      }
      id v24 = [@"FakePushToken" dataUsingEncoding:4];
      [(MDMServerCore *)self setMemberQueuePushToken:v24];
    }
    uint64_t v25 = [(MDMServerCore *)self memberQueuePushToken];

    if (v25)
    {
      id v26 = [(MDMServerCore *)self _memberQueueLastPushTokenHash];
      id v27 = [(MDMServerCore *)self memberQueuePushToken];
      uint64_t v28 = [v27 DMCSHA256Hash];

      if (([v26 isEqualToData:v28] & 1) == 0)
      {
        uint64_t v29 = [(MDMServerCore *)self memberQueuePushToken];
        [(MDMServerCore *)self _memberQueueLogLatestPushTokenIfNeeded:v29];
      }
    }
    else
    {
      id v30 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_230A49000, v30, OS_LOG_TYPE_DEFAULT, "MDMDServerCore waiting for push token to be assigned to this device...", buf, 2u);
      }
      id v26 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__MDMServerCore__memberQueueSetupAPSConnectionIsMDMConfigurationValid_isUserDaemon___block_invoke;
      block[3] = &unk_264B9D3E0;
      block[4] = self;
      dispatch_async(v26, block);
    }
  }
}

uint64_t __84__MDMServerCore__memberQueueSetupAPSConnectionIsMDMConfigurationValid_isUserDaemon___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeBlockWhenPushTokenIsAvailable:0];
}

- (id)_memberQueuePushMagicMismatchDateMarker
{
  id v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = [(MDMServerCore *)self _mdmFilePathForChannelType:[(MDMServerCore *)self channelType]];
  id v4 = [v2 dictionaryWithContentsOfFile:v3];

  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F52E50]];

  return v5;
}

- (void)_memberQueueSetPushMagicMismatchDateMarker:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [(MDMServerCore *)self _mdmFilePathForChannelType:[(MDMServerCore *)self channelType]];
  id v7 = [v4 dictionaryWithContentsOfFile:v6];

  [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x263F52E50]];
  [(MDMServerCore *)self _memberQueueWriteDict:v7 toMDMConfigurationFileForChannel:[(MDMServerCore *)self channelType] shouldNotify:0];
}

- (void)_memberQueueLogLatestPushTokenIfNeeded:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  id v5 = [(MDMServerCore *)self memberQueueLastLoggedPushToken];
  char v6 = [(__CFString *)v4 isEqualToData:v5];

  if ((v6 & 1) == 0)
  {
    [(MDMServerCore *)self setMemberQueueLastLoggedPushToken:v4];
    id v7 = objc_opt_new();
    uint64_t v8 = *MEMORY[0x263F38A68];
    if (v4) {
      BOOL v9 = v4;
    }
    else {
      BOOL v9 = &stru_26E549450;
    }
    v12[0] = @"Token";
    v12[1] = @"Channel";
    v13[0] = v9;
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MDMServerCore channelType](self, "channelType"));
    v13[1] = v10;
    dispatch_semaphore_t v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    [v7 logRegularEventForTopic:v8 reason:@"New Push Token Received" details:v11];
  }
}

- (BOOL)_shouldListenToEnvironment:(unint64_t)a3
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__MDMServerCore__shouldListenToEnvironment___block_invoke;
  block[3] = &unk_264B9E720;
  block[4] = self;
  void block[5] = &v8;
  void block[6] = a3;
  dispatch_async_and_wait(v5, block);

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

uint64_t __44__MDMServerCore__shouldListenToEnvironment___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueUseDevelopmentAPNS];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a1 + 48) == result;
  return result;
}

- (void)pushServiceManager:(id)a3 didReceivePublicToken:(id)a4 forEnvironment:(unint64_t)a5
{
  id v7 = a4;
  if ([(MDMServerCore *)self _shouldListenToEnvironment:a5])
  {
    uint64_t v8 = [(MDMServerCore *)self jobQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke;
    v9[3] = &unk_264B9D408;
    id v10 = v7;
    char v11 = self;
    [v8 queueBlock:v9];
  }
}

void __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_230A49000, v2, OS_LOG_TYPE_DEFAULT, "Push token received.", buf, 2u);
  }
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = v3;
    id v7 = [v4 memberQueueTopic];
    uint64_t v8 = [*(id *)(a1 + 40) memberQueuePushMagic];
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    id v27 = v8;
    _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Push token data: '%{public}@' Topic: '%{public}@' Magic: '%{public}@'", buf, 0x20u);
  }
  BOOL v9 = [*(id *)(a1 + 40) memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_223;
  block[3] = &unk_264B9D408;
  int8x16_t v17 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v17.i64[0];
  int8x16_t v25 = vextq_s8(v17, v17, 8uLL);
  dispatch_async_and_wait(v9, block);

  [*(id *)(a1 + 40) _executePushTokenWaitContinuationBlock];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v27) = 0;
  char v11 = [*(id *)(a1 + 32) DMCSHA256Hash];
  BOOL v12 = [*(id *)(a1 + 40) memberQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_2;
  v20[3] = &unk_264B9E748;
  v20[4] = *(void *)(a1 + 40);
  id v13 = v11;
  id v21 = v13;
  id v22 = *(id *)(a1 + 32);
  uint64_t v23 = buf;
  dispatch_async_and_wait(v12, v20);

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_DEBUG, "Push token is new, need to update", v19, 2u);
    }
    id v15 = objc_msgSend(*(id *)(a1 + 40), "jobQueue", *(_OWORD *)&v17);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_2_224;
    v18[3] = &unk_264B9E2F0;
    void v18[4] = *(void *)(a1 + 40);
    [v15 fromFunction:"-[MDMServerCore pushServiceManager:didReceivePublicToken:forEnvironment:]_block_invoke" enqueueJob:v18];
  }
  else
  {
    int v16 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_DEBUG, "Push token is not new, don't need to update", v19, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_223(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueuePushToken:*(void *)(a1 + 40)];
}

void __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _memberQueueLastPushTokenHash];
  if (([v2 isEqualToData:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(a1 + 32) _memberQueueLogLatestPushTokenIfNeeded:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _memberQueueIncrementTokenUpdateRequestCount];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_2_224(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_3;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __73__MDMServerCore_pushServiceManager_didReceivePublicToken_forEnvironment___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pushServiceManager:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5 environment:(unint64_t)a6
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(MDMServerCore *)self _shouldListenToEnvironment:a6])
  {
    id v13 = objc_alloc(MEMORY[0x263F38BE8]);
    id v14 = [(MDMServerCore *)self _reasonStringWithReason:@"ReceivedMessageForTopic"];
    uint64_t v47 = [v13 initWithReason:v14];

    id v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_230A49000, v15, OS_LOG_TYPE_DEFAULT, "Received push notification.", (uint8_t *)&buf, 2u);
    }
    int v16 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_DEBUG, "Push notification data: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v74 = 0x3032000000;
    uint64_t v75 = __Block_byref_object_copy__10;
    v76 = __Block_byref_object_dispose__10;
    id v77 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    char v61 = __Block_byref_object_copy__10;
    __int16 v62 = __Block_byref_object_dispose__10;
    id v63 = 0;
    uint64_t v54 = 0;
    long long v55 = &v54;
    uint64_t v56 = 0x2020000000;
    char v57 = 0;
    int8x16_t v17 = [(MDMServerCore *)self memberQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke;
    block[3] = &unk_264B9E408;
    void block[4] = self;
    void block[5] = &buf;
    void block[6] = &v58;
    void block[7] = &v54;
    dispatch_async_and_wait(v17, block);

    if (*((unsigned char *)v55 + 24))
    {
      id v18 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v68) = 0;
        _os_log_impl(&dword_230A49000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring push notification because MDM uproot already began", (uint8_t *)&v68, 2u);
      }
      id v19 = 0;
      int v20 = 0;
      goto LABEL_43;
    }
    if ([v11 isEqualToString:*(void *)(*((void *)&buf + 1) + 40)])
    {
      uint64_t v21 = *MEMORY[0x263F52E40];
      id v22 = [v12 objectForKey:*MEMORY[0x263F52E40]];
      BOOL v23 = v22 == 0;

      if (v23)
      {
        id v32 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v68) = 138543362;
          *(void *)((char *)&v68 + 4) = v21;
          _os_log_impl(&dword_230A49000, v32, OS_LOG_TYPE_ERROR, "Rejecting MDM push dictionary because it does not contain the \"%{public}@\" key", (uint8_t *)&v68, 0xCu);
        }
        id v19 = 0;
        int v20 = 0;
      }
      else
      {
        id v24 = [v12 objectForKey:v21];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v26 = [v12 objectForKey:v21];
          char v27 = [v26 isEqualToString:v59[5]];

          if (v27)
          {
            if ((unint64_t)[v12 count] >= 2)
            {
              uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v12];
              [v28 removeObjectForKey:v21];
              uint64_t v29 = *(NSObject **)(DMCLogObjects() + 8);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                LODWORD(v68) = 138543362;
                *(void *)((char *)&v68 + 4) = v28;
                _os_log_impl(&dword_230A49000, v29, OS_LOG_TYPE_INFO, "Ignoring extra keys in push dictionary: %{public}@", (uint8_t *)&v68, 0xCu);
              }
            }
            int v20 = 0;
            id v19 = 0;
            int v30 = 1;
            goto LABEL_45;
          }
          uint64_t v34 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v68) = 0;
            _os_log_impl(&dword_230A49000, v34, OS_LOG_TYPE_ERROR, "Rejecting MDM push dictionary because it does not have the right magic string.", (uint8_t *)&v68, 2u);
          }
          *(void *)&long long v68 = 0;
          *((void *)&v68 + 1) = &v68;
          uint64_t v69 = 0x3032000000;
          uint64_t v70 = __Block_byref_object_copy__10;
          uint64_t v71 = __Block_byref_object_dispose__10;
          id v72 = 0;
          id v35 = [(MDMServerCore *)self memberQueue];
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v52[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_228;
          v52[3] = &unk_264B9D318;
          v52[4] = self;
          v52[5] = &v68;
          dispatch_async_and_wait(v35, v52);

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v36 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = *(void *)(*((void *)&v68 + 1) + 40);
              *(_DWORD *)v64 = 138543362;
              uint64_t v65 = v37;
              _os_log_impl(&dword_230A49000, v36, OS_LOG_TYPE_DEFAULT, "Push magic mismatch marker already exists with date: %{public}@", v64, 0xCu);
            }
            [*(id *)(*((void *)&v68 + 1) + 40) timeIntervalSinceNow];
            double v39 = v38;
            if (v38 < -90000.0)
            {
              uint64_t v40 = *(NSObject **)(DMCLogObjects() + 8);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v64 = 134218240;
                uint64_t v65 = 0x40F5F90000000000;
                __int16 v66 = 2048;
                double v67 = -v39;
                _os_log_impl(&dword_230A49000, v40, OS_LOG_TYPE_DEFAULT, "Existing push magic mismatch marker is older than %f seconds (%f seconds old), scheduling token update", v64, 0x16u);
              }
              char v41 = [MEMORY[0x263F52800] sharedClient];
              [v41 scheduleTokenUpdate];

              id v19 = 0;
              int v20 = 1;
              goto LABEL_42;
            }
            id v19 = 0;
          }
          else
          {
            uint64_t v42 = *(id *)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v43 = [MEMORY[0x263EFF910] date];
              *(_DWORD *)v64 = 138543362;
              uint64_t v65 = (uint64_t)v43;
              _os_log_impl(&dword_230A49000, v42, OS_LOG_TYPE_DEFAULT, "Setting push magic mismatch marker with date: %{public}@", v64, 0xCu);
            }
            id v19 = [MEMORY[0x263EFF910] date];
          }
          int v20 = 0;
LABEL_42:
          _Block_object_dispose(&v68, 8);

          goto LABEL_43;
        }
        uint64_t v33 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v68) = 138543362;
          *(void *)((char *)&v68 + 4) = v21;
          _os_log_impl(&dword_230A49000, v33, OS_LOG_TYPE_ERROR, "Rejecting MDM push dictionary because the \"%{public}@\" key is not a string.", (uint8_t *)&v68, 0xCu);
        }
        id v19 = 0;
        int v20 = 0;
      }
    }
    else
    {
      char v31 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v68) = 138543362;
        *(void *)((char *)&v68 + 4) = v11;
        _os_log_impl(&dword_230A49000, v31, OS_LOG_TYPE_ERROR, "Ignoring push notification with mismatched topic: %{public}@", (uint8_t *)&v68, 0xCu);
      }
      id v19 = 0;
      int v20 = 0;
    }
LABEL_43:
    int v30 = 0;
    if ((v20 & 1) == 0 && !v19)
    {
LABEL_47:
      char v46 = [MEMORY[0x263F52810] sharedConfiguration];
      [v46 isUserEnrollment];
      MDMAnalyticsSendPushEvent();

      _Block_object_dispose(&v54, 8);
      _Block_object_dispose(&v58, 8);

      _Block_object_dispose(&buf, 8);
      goto LABEL_48;
    }
LABEL_45:
    uint64_t v44 = [(MDMServerCore *)self memberQueue];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_230;
    v50[3] = &unk_264B9D408;
    v50[4] = self;
    id v19 = v19;
    id v51 = v19;
    dispatch_barrier_async(v44, v50);

    if ((v30 | v20) == 1)
    {
      uint64_t v45 = [(MDMServerCore *)self jobQueue];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_2;
      v49[3] = &unk_264B9E2F0;
      v49[4] = self;
      [v45 fromFunction:"-[MDMServerCore pushServiceManager:didReceiveMessageForTopic:userInfo:environment:]" enqueueJob:v49];
    }
    goto LABEL_47;
  }
LABEL_48:
}

uint64_t __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueTopic];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) memberQueuePushMagic];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t result = [*(id *)(a1 + 32) memberQueueIsUprooting];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_228(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _memberQueuePushMagicMismatchDateMarker];
  return MEMORY[0x270F9A758]();
}

uint64_t __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_230(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueueSetPushMagicMismatchDateMarker:*(void *)(a1 + 40)];
}

void __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_3;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:1 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __83__MDMServerCore_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_httpErrorFromTransaction:(id)a3 assertion:(id)a4 rmAccountID:(id)a5 enrollmentMode:(id)a6 reauthQueue:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int8x16_t v17 = [v12 error];

  if (!v17)
  {
    uint64_t v21 = 0;
    goto LABEL_19;
  }
  uint64_t v18 = [v12 statusCode];
  if (v18 == 410)
  {
    if ([(MDMServerCore *)self _handleHTTPStatusGoneResponse])
    {
      uint64_t v20 = [(MDMServerCore *)self _processTraditionalErrorFromTransaction:v12];
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v18 == 403)
  {
    id v22 = [v12 error];
    uint64_t v23 = [v22 code];

    if (v23 == 23008)
    {
      id v24 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_230A49000, v24, OS_LOG_TYPE_DEFAULT, "Received 403 with UnrecognizedDevice error for transaction", (uint8_t *)&v26, 2u);
      }
      goto LABEL_16;
    }
LABEL_17:
    uint64_t v20 = [v12 error];
    goto LABEL_18;
  }
  if (v18 != 401) {
    goto LABEL_17;
  }
  id v19 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543362;
    id v27 = v15;
    _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_DEFAULT, "Received 401 for transaction. EnrollmentMode: %{public}@", (uint8_t *)&v26, 0xCu);
  }
  if (!v15 || [v15 isEqualToString:*MEMORY[0x263F529C8]])
  {
LABEL_16:
    uint64_t v20 = [(MDMServerCore *)self _processTraditionalUnauthorizedFromTransaction:v12 assertion:v13];
    goto LABEL_18;
  }
  uint64_t v20 = [(MDMServerCore *)self _processAccountDrivenUnauthorizedFromTransaction:v12 rmAccountID:v14 reauthQueue:v16];
LABEL_18:
  uint64_t v21 = (void *)v20;
LABEL_19:

  return v21;
}

- (BOOL)_handleHTTPStatusGoneResponse
{
  unint64_t v2 = [(MDMServerCore *)self channelType];
  if (v2 == 1)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "MDM server returned 410 response, does not want to manage the current user.", v5, 2u);
    }
  }
  return v2 == 1;
}

- (id)_processTraditionalErrorFromTransaction:(id)a3
{
  id v4 = a3;
  if ([v4 isCheckIn]) {
    [(MDMServerCore *)self _setTokenUpdateRequestCountToZero];
  }
  else {
    [(MDMServerCore *)self _clearCachedResponse];
  }
  id v5 = [v4 error];

  return v5;
}

- (id)_processTraditionalUnauthorizedFromTransaction:(id)a3 assertion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isCheckIn])
  {
    uint64_t v8 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = v8;
      id v10 = [v6 error];
      id v11 = [v10 DMCVerboseDescription];
      int v18 = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_ERROR, "Cannot tell MDM server about updated token. Error: %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }
  id v12 = objc_opt_new();
  uint64_t v13 = *MEMORY[0x263F38A70];
  id v14 = [MEMORY[0x263F52830] unauthorizedByServerError];
  [v12 logErrorEventForTopic:v13 reason:@"Received 401 / 403(code: Unrecognized) error from server" error:v14 details:0];

  [(MDMServerCore *)self _executionQueueRemoveMDMProfileWithAssertion:v7];
  id v15 = [(MDMServerCore *)self _processTraditionalErrorFromTransaction:v6];
  id v16 = [MEMORY[0x263F52830] unauthorizedByServerError];

  return v16;
}

- (id)_processAccountDrivenUnauthorizedFromTransaction:(id)a3 rmAccountID:(id)a4 reauthQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v23 = 0;
    id v11 = [MEMORY[0x263F527E0] rmAccountWithIdentifier:v9 fromStore:0 error:&v23];
    id v12 = v23;
    uint64_t v13 = v12;
    if (v11)
    {
      id v14 = [v8 responseHeaders];
      id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F38A90]];

      id v22 = 0;
      unint64_t v16 = [MEMORY[0x263F527E8] enrollmentMethodFromAuthenticateString:v15 outParams:&v22];
      id v17 = v22;
      if (v16 > 5 || ((1 << v16) & 0x26) == 0)
      {
        id v20 = [v8 error];
      }
      else
      {
        id v19 = [v11 username];
        id v20 = [(MDMServerCore *)self _processUnauthorizedFromTransaction:v8 authParams:v17 rmAccountID:v9 rmAccountUsername:v19 reauthQueue:v10];
      }
    }
    else
    {
      id v20 = v12;
    }
  }
  else
  {
    id v20 = [v8 error];
  }

  return v20;
}

- (void)_executionQueueRemoveMDMProfileWithAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__10;
  unint64_t v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  id v5 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__MDMServerCore__executionQueueRemoveMDMProfileWithAssertion___block_invoke;
  block[3] = &unk_264B9E408;
  void block[4] = self;
  void block[5] = &v22;
  void block[6] = &v12;
  void block[7] = &v18;
  dispatch_async_and_wait(v5, block);

  if (*((unsigned char *)v19 + 24))
  {
    id v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "MDMServerCore ignoring extraneous remove MDM profile request", v10, 2u);
    }
  }
  else if (*((unsigned char *)v23 + 24))
  {
    id v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "MDMServerCore removing MDM profile...", v10, 2u);
    }
    id v8 = objc_opt_new();
    [v8 setProfileIdentifier:v13[5]];
    [v8 setType:0];
    id v9 = [MEMORY[0x263F39D18] systemConnection];
    [v9 performRequest:v8 completion:&__block_literal_global_240];

    [(MDMServerCore *)self _readConfigurationOutError:0 isUproot:1];
    [(MDMServerCore *)self _setTokenUpdateRequestCountToZero];
    [(MDMServerCore *)self _clearCachedResponse];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __62__MDMServerCore__executionQueueRemoveMDMProfileWithAssertion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) memberQueueIsMDMConfigurationValid];
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueManagingProfileIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if ([*(id *)(a1 + 32) memberQueueIsUprooting])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) pushServiceManager];
      [v5 stopListeningForAllMDMPushMessagesWithEnvironment:0];

      id v6 = [*(id *)(a1 + 32) pushServiceManager];
      [v6 stopListeningForAllMDMPushMessagesWithEnvironment:1];

      id v7 = *(void **)(a1 + 32);
      [v7 setMemberQueueIsUprooting:1];
    }
  }
}

void __62__MDMServerCore__executionQueueRemoveMDMProfileWithAssertion___block_invoke_237(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_ERROR, "MDMServerCore could not remove MDM profile. Error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)_processUnauthorizedFromTransaction:(id)a3 authParams:(id)a4 rmAccountID:(id)a5 rmAccountUsername:(id)a6 reauthQueue:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 authenticator];
  if ([v17 conformsToProtocol:&unk_26E568118])
  {
    if ([v17 validAuthParams:v13])
    {
      if ([v17 canRefreshToken]) {
        [(MDMServerCore *)self _triggerRefreshTokenForTransaction:v12 authenticator:v17 authParams:v13 rmAccountID:v14 rmAccountUsername:v15 reauthQueue:v16];
      }
      else {
      uint64_t v18 = [(MDMServerCore *)self _triggerReauthenticationForTransaction:v12 authenticator:v17 authParams:v13 rmAccountID:v14 rmAccountUsername:v15];
      }
      goto LABEL_12;
    }
    id v23 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v26 = 138543362;
      *(void *)&v26[4] = v13;
      uint64_t v20 = "Invalid Bearer token refresh params: %{public}@";
      char v21 = v23;
      uint32_t v22 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    id v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v26 = 0;
      uint64_t v20 = "Error refreshing Bearer token";
      char v21 = v19;
      uint32_t v22 = 2;
LABEL_10:
      _os_log_impl(&dword_230A49000, v21, OS_LOG_TYPE_ERROR, v20, v26, v22);
    }
  }
  uint64_t v18 = objc_msgSend(v12, "error", *(_OWORD *)v26);
LABEL_12:
  uint64_t v24 = (void *)v18;

  return v24;
}

- (id)_triggerReauthenticationForTransaction:(id)a3 authenticator:(id)a4 authParams:(id)a5 rmAccountID:(id)a6 rmAccountUsername:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  id v19 = 0;
  id v13 = [v11 prepareForReauthenticationWithAuthParams:a5 accountID:a6 error:&v19];
  id v14 = v19;
  id v15 = v14;
  if (v13)
  {
    objc_opt_class();
    [(MDMServerCore *)self _presentFollowUpForAuthURL:v13 accountUsername:v12 isMAIDAccount:objc_opt_isKindOfClass() & 1];
    [(MDMServerCore *)self _postReauthFollowUpChangedNotification];
    id v16 = [MEMORY[0x263F52830] reauthRequiredThirdPartyError];
  }
  else
  {
    id v16 = v14;
  }
  id v17 = v16;

  return v17;
}

- (id)_triggerRefreshTokenForTransaction:(id)a3 authenticator:(id)a4 authParams:(id)a5 rmAccountID:(id)a6 rmAccountUsername:(id)a7 reauthQueue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__10;
  uint64_t v45 = __Block_byref_object_dispose__10;
  id v46 = 0;
  uint64_t v20 = objc_opt_new();
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __119__MDMServerCore__triggerRefreshTokenForTransaction_authenticator_authParams_rmAccountID_rmAccountUsername_reauthQueue___block_invoke;
  v38[3] = &unk_264B9E770;
  uint64_t v40 = &v41;
  id v21 = v20;
  id v39 = v21;
  [v15 refreshTokenWithAuthParams:v16 accountID:v17 completionHandler:v38];
  [v21 waitForCompletion];
  uint32_t v22 = (void *)v42[5];
  if (v22)
  {
    id v23 = [v22 domain];
    uint64_t v24 = v23;
    if (v23 == (void *)*MEMORY[0x263F38A38])
    {
      uint64_t v27 = [(id)v42[5] code];

      if (v27 == 15009)
      {
        objc_initWeak(&buf, self);
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __119__MDMServerCore__triggerRefreshTokenForTransaction_authenticator_authParams_rmAccountID_rmAccountUsername_reauthQueue___block_invoke_2;
        v30[3] = &unk_264B9E798;
        objc_copyWeak(&v36, &buf);
        id v31 = v14;
        id v32 = v16;
        id v33 = v17;
        id v34 = v18;
        id v35 = v19;
        [(MDMServerCore *)self _listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue:v35 perform:v30];
        id v28 = (id)v42[5];

        objc_destroyWeak(&v36);
        objc_destroyWeak(&buf);
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v26 = [(MDMServerCore *)self _triggerReauthenticationForTransaction:v14 authenticator:v15 authParams:v16 rmAccountID:v17 rmAccountUsername:v18];
  }
  else
  {
    char v25 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_230A49000, v25, OS_LOG_TYPE_INFO, "Successfully refreshed MAID credentials automatically. Saving bearer token and re-doing HTTP transaction...", (uint8_t *)&buf, 2u);
    }
    [(MDMServerCore *)self _clearCoreFollowup];
    [v14 performSynchronously];
    uint64_t v26 = [v14 error];
  }
  id v28 = (id)v26;
LABEL_11:

  _Block_object_dispose(&v41, 8);
  return v28;
}

void __119__MDMServerCore__triggerRefreshTokenForTransaction_authenticator_authParams_rmAccountID_rmAccountUsername_reauthQueue___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  [*(id *)(a1 + 32) complete];
}

void __119__MDMServerCore__triggerRefreshTokenForTransaction_authenticator_authParams_rmAccountID_rmAccountUsername_reauthQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = (id)[WeakRetained _processUnauthorizedFromTransaction:*(void *)(a1 + 32) authParams:*(void *)(a1 + 40) rmAccountID:*(void *)(a1 + 48) rmAccountUsername:*(void *)(a1 + 56) reauthQueue:*(void *)(a1 + 64)];
    id WeakRetained = v4;
  }
}

- (void)_listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue:(id)a3 perform:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F527D0];
  id v8 = a3;
  id v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_INFO, "idMS invalidated Managed Apple Account.", buf, 2u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __96__MDMServerCore__listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue_perform___block_invoke;
  v12[3] = &unk_264B9E278;
  v12[4] = self;
  id v13 = v6;
  id v10 = v6;
  unsigned int v11 = [(MDMServerCore *)self _listenForOneTimeGlobalNotification:v7 callbackQueue:v8 notificationHandler:v12];

  self->_reauthMAIDNotifyToken = v11;
}

uint64_t __96__MDMServerCore__listenForManagedAppleAccountLongLivedTokenChangedNotificationsOnQueue_perform___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = -1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_isMAIDNotificationActive
{
  unsigned int reauthMAIDNotifyToken = self->_reauthMAIDNotifyToken;
  return reauthMAIDNotifyToken != -1 && notify_is_valid_token(reauthMAIDNotifyToken);
}

- (void)_presentFollowUpForAuthURL:(id)a3 accountUsername:(id)a4 isMAIDAccount:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = NSString;
  uint64_t v9 = *MEMORY[0x263F53E48];
  id v10 = [MEMORY[0x263F38A20] itemSpecifierIDForReauthAccountUsername:a4];
  unsigned int v11 = [v8 stringWithFormat:@"%@/%@", v9, v10];

  id v12 = [NSURL URLWithString:v11];
  if (v12)
  {
    id v13 = DMCLocalizedString();
    id v14 = [MDMFollowUp alloc];
    id v15 = [(MDMServerCore *)self daemonIdentifier];
    id v16 = DMCLocalizedString();
    id v21 = @"auth-url";
    id v17 = [v7 absoluteString];
    uint32_t v22 = v17;
    id v18 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v19 = [(MDMFollowUp *)v14 initWithStyle:1 clientIdentifier:v15 itemIdentifier:@"com.apple.devicemanagementclient.followup.reauth" url:v12 title:v16 notificationInfo:v13 userInfo:v18];

    [(MDMFollowUp *)v19 presentFollowUp];
  }
  else
  {
    uint64_t v20 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      uint64_t v24 = v11;
      _os_log_impl(&dword_230A49000, v20, OS_LOG_TYPE_ERROR, "Failed to create URL for CoreFollowup reauth from string: %{public}@", buf, 0xCu);
    }
  }
}

- (void)_clearCoreFollowup
{
  id v2 = [(MDMServerCore *)self daemonIdentifier];
  +[MDMFollowUp clearFollowUpWithClientID:v2];
}

- (void)_postReauthFollowUpChangedNotification
{
  id v2 = [MEMORY[0x263F087C8] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x263F52E70] object:0];
}

- (void)_memberQueueStartListeningForInterestingEvents
{
  if (!self->_isObservingReachability)
  {
    id v3 = [MEMORY[0x263F255C0] sharedNetworkObserver];
    [v3 addNetworkReachableObserver:self selector:sel__networkReachabilityDidChange];

    self->_isObservingReachability = 1;
  }
  if (self->_keybagEventToken == -1
    && (![MEMORY[0x263F38BA0] isSharediPad]
     || [MEMORY[0x263F38BA0] inSharediPadUserSession]))
  {
    id v4 = [NSString stringWithUTF8String:*MEMORY[0x263F55A78]];
    id v5 = [(MDMServerCore *)self memberQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__MDMServerCore__memberQueueStartListeningForInterestingEvents__block_invoke;
    v9[3] = &unk_264B9E7C0;
    void v9[4] = self;
    [(MDMServerCore *)self _registerForDispatchNotification:v4 outToken:&self->_keybagEventToken targetQueue:v5 handler:v9];
  }
  if (self->_buddyDoneEventToken == -1)
  {
    id v6 = DMCBYSetupAssistantFinishedDarwinNotification();
    if (v6)
    {
      id v7 = [(MDMServerCore *)self memberQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __63__MDMServerCore__memberQueueStartListeningForInterestingEvents__block_invoke_2;
      v8[3] = &unk_264B9E7C0;
      v8[4] = self;
      [(MDMServerCore *)self _registerForDispatchNotification:v6 outToken:&self->_buddyDoneEventToken targetQueue:v7 handler:v8];
    }
  }
}

uint64_t __63__MDMServerCore__memberQueueStartListeningForInterestingEvents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _keybagStateDidChange];
}

uint64_t __63__MDMServerCore__memberQueueStartListeningForInterestingEvents__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) buddyDidFinish];
}

- (void)_memberQueueStopListeningForInterestingEvents
{
  if (self->_isObservingReachability)
  {
    id v3 = [MEMORY[0x263F255C0] sharedNetworkObserver];
    [v3 removeNetworkReachableObserver:self];

    self->_isObservingReachability = 0;
  }
  if (self->_keybagEventToken != -1)
  {
    -[MDMServerCore _cancelDispatchNotificationWithToken:](self, "_cancelDispatchNotificationWithToken:");
    self->_keybagEventToken = -1;
  }
  if (self->_pairedNRDeviceEventToken != -1)
  {
    -[MDMServerCore _cancelDispatchNotificationWithToken:](self, "_cancelDispatchNotificationWithToken:");
    self->_pairedNRDeviceEventToken = -1;
  }
  if (self->_buddyDoneEventToken != -1)
  {
    -[MDMServerCore _cancelDispatchNotificationWithToken:](self, "_cancelDispatchNotificationWithToken:");
    self->_buddyDoneEventToken = -1;
  }
}

- (void)_networkReachabilityDidChange
{
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "Network reachability has changed.", buf, 2u);
  }
  id v4 = [(MDMServerCore *)self jobQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__MDMServerCore__networkReachabilityDidChange__block_invoke;
  v5[3] = &unk_264B9E2F0;
  v5[4] = self;
  [v4 fromFunction:"-[MDMServerCore _networkReachabilityDidChange]" enqueueJob:v5];
}

void __46__MDMServerCore__networkReachabilityDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__MDMServerCore__networkReachabilityDidChange__block_invoke_2;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:1 completionHandler:v6];
}

uint64_t __46__MDMServerCore__networkReachabilityDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_keybagStateDidChange
{
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "Keybag state has changed.", buf, 2u);
  }
  if ((DMCIsDeviceLocked() & 1) == 0)
  {
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    id v5 = [(MDMServerCore *)self memberQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__MDMServerCore__keybagStateDidChange__block_invoke;
    block[3] = &unk_264B9D3E0;
    void block[4] = self;
    dispatch_after(v4, v5, block);
  }
}

void __38__MDMServerCore__keybagStateDidChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) jobQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__MDMServerCore__keybagStateDidChange__block_invoke_2;
  v3[3] = &unk_264B9E2F0;
  v3[4] = *(void *)(a1 + 32);
  [v2 fromFunction:"-[MDMServerCore _keybagStateDidChange]_block_invoke" enqueueJob:v3];
}

void __38__MDMServerCore__keybagStateDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__MDMServerCore__keybagStateDidChange__block_invoke_3;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:1 completionHandler:v6];
}

uint64_t __38__MDMServerCore__keybagStateDidChange__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)buddyDidFinish
{
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "Buddy did finish.", buf, 2u);
  }
  dispatch_time_t v4 = [(MDMServerCore *)self jobQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__MDMServerCore_buddyDidFinish__block_invoke;
  v5[3] = &unk_264B9E2F0;
  v5[4] = self;
  [v4 fromFunction:"-[MDMServerCore buddyDidFinish]" enqueueJob:v5];
}

void __31__MDMServerCore_buddyDidFinish__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__MDMServerCore_buddyDidFinish__block_invoke_2;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:1 completionHandler:v6];
}

uint64_t __31__MDMServerCore_buddyDidFinish__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unsigned)_registerForDispatchNotification:(id)a3 outToken:(int *)a4 targetQueue:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  unsigned int v11 = a5;
  LODWORD(a4) = notify_register_dispatch((const char *)[v9 UTF8String], a4, v11, v10);

  return a4;
}

- (unsigned)_cancelDispatchNotificationWithToken:(unsigned int)a3
{
  return notify_cancel(a3);
}

- (void)_clearMAIDNotification
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int reauthMAIDNotifyToken = self->_reauthMAIDNotifyToken;
  if (reauthMAIDNotifyToken != -1)
  {
    uint32_t v4 = notify_cancel(reauthMAIDNotifyToken);
    id v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67109120;
        v10[1] = v4;
        id v6 = "MDMServerCore couldn't cancel notification: %d";
        id v7 = v5;
        os_log_type_t v8 = OS_LOG_TYPE_ERROR;
        uint32_t v9 = 8;
LABEL_7:
        _os_log_impl(&dword_230A49000, v7, v8, v6, (uint8_t *)v10, v9);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10[0]) = 0;
      id v6 = "MDMServerCore cancelled notification";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
      uint32_t v9 = 2;
      goto LABEL_7;
    }
    self->_unsigned int reauthMAIDNotifyToken = -1;
  }
}

- (void)_currentLocaleDidChange:(id)a3
{
  id v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "Notified of locale change. Exiting when clean.", v4, 2u);
  }
  xpc_transaction_exit_clean();
}

- (id)_createBadInstallationError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint32_t v4 = DMCErrorArray();
  id v5 = DMCLocalizedString();
  id v6 = DMCUSEnglishString();
  id v7 = [v2 DMCErrorWithDomain:v3 code:12011 descriptionArray:v4 suggestion:v5 USEnglishSuggestion:v6 underlyingError:0 errorType:*MEMORY[0x263F38A40]];

  return v7;
}

- (void)_pollOrScheduleNextPollForHRN
{
  if (([MEMORY[0x263F38BA0] isSharediPad] & 1) == 0)
  {
    uint64_t v3 = [(MDMServerCore *)self memberQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__MDMServerCore__pollOrScheduleNextPollForHRN__block_invoke;
    block[3] = &unk_264B9D3E0;
    void block[4] = self;
    dispatch_async_and_wait(v3, block);
  }
}

uint64_t __46__MDMServerCore__pollOrScheduleNextPollForHRN__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueuePollOrScheduleNextPollForHRN];
}

- (void)_memberQueuePollOrScheduleNextPollForHRN
{
  uint64_t v3 = [(MDMServerCore *)self memberQueuePollingInterval];
  uint64_t v4 = [v3 unsignedIntegerValue];

  if (v4)
  {
    double v5 = MEMORY[0x230FC5E50]();
    int v6 = TMGetRTCResetCount();
    id v7 = [(MDMServerCore *)self memberQueueLastPollingAttemptMonotonicTime];
    [v7 doubleValue];
    double v9 = v8;
    id v10 = [(MDMServerCore *)self memberQueueLastPollingAttemptRTCResetCount];
    int v11 = [v10 unsignedIntValue];
    if (v7 && v10 && v6 == v11 && (double v12 = v9 + (double)(unint64_t)(60 * v4), v12 > v5))
    {
      [(MDMServerCore *)self _scheduleNextPollWithInterval:v12 - v5];
    }
    else
    {
      id v13 = [(MDMServerCore *)self jobQueue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __57__MDMServerCore__memberQueuePollOrScheduleNextPollForHRN__block_invoke;
      v14[3] = &unk_264B9E2F0;
      void v14[4] = self;
      [v13 fromFunction:"-[MDMServerCore _memberQueuePollOrScheduleNextPollForHRN]" enqueueJob:v14];
    }
  }
}

void __57__MDMServerCore__memberQueuePollOrScheduleNextPollForHRN__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__MDMServerCore__memberQueuePollOrScheduleNextPollForHRN__block_invoke_2;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:1 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __57__MDMServerCore__memberQueuePollOrScheduleNextPollForHRN__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_scheduleNextPollWithInterval:(double)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 134218240;
    double v8 = a3;
    __int16 v9 = 2048;
    double v10 = a3 * 0.1;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_INFO, "Scheduling poll in %f seconds, tolerance %f.", buf, 0x16u);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke;
  v6[3] = &unk_264B9D3E0;
  void v6[4] = self;
  [MEMORY[0x263F38B40] scheduleOneShotActivity:@"com.apple.devicemanagementclient.mdmd.polling" interval:v6 gracePeriod:a3 callback:a3 * 0.1];
}

void __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F38B28] sharedInstance];
  int v3 = [v2 hrnMode];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3 == 2)
  {
    id v5 = [v4 memberQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_2;
    block[3] = &unk_264B9D3E0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async_and_wait(v5, block);
  }
  else
  {
    id v5 = [v4 jobQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_3;
    v6[3] = &unk_264B9E2F0;
    void v6[4] = *(void *)(a1 + 32);
    -[NSObject fromFunction:enqueueJob:](v5, "fromFunction:enqueueJob:", "-[MDMServerCore _scheduleNextPollWithInterval:]_block_invoke", v6);
  }
}

uint64_t __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueuePollOrScheduleNextPollForHRN];
}

void __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_4;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __47__MDMServerCore__scheduleNextPollWithInterval___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_pollingSucceeded
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v3 = [(MDMServerCore *)self memberQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__MDMServerCore__pollingSucceeded__block_invoke;
  v4[3] = &unk_264B9D318;
  void v4[4] = self;
  void v4[5] = &v5;
  dispatch_async_and_wait(v3, v4);

  if (*((unsigned char *)v6 + 24)) {
    [(MDMServerCore *)self _clearCoreFollowup];
  }
  [(MDMServerCore *)self _setLastPollingSuccess];
  [(MDMServerCore *)self _pollOrScheduleNextPollForHRN];
  _Block_object_dispose(&v5, 8);
}

void __34__MDMServerCore__pollingSucceeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) memberQueueLastPollingSuccess];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 0;
}

- (void)_setLastPollingAttempt
{
  id v3 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__MDMServerCore__setLastPollingAttempt__block_invoke;
  block[3] = &unk_264B9D3E0;
  void block[4] = self;
  dispatch_async_and_wait(v3, block);
}

uint64_t __39__MDMServerCore__setLastPollingAttempt__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueueSetLastPollingAttempt];
}

- (void)_setLastPollingSuccess
{
  id v3 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__MDMServerCore__setLastPollingSuccess__block_invoke;
  block[3] = &unk_264B9D3E0;
  void block[4] = self;
  dispatch_async_and_wait(v3, block);
}

uint64_t __39__MDMServerCore__setLastPollingSuccess__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueueSetLastPollingSuccess];
}

- (void)_memberQueueSetLastPollingSuccess
{
  id v10 = [MEMORY[0x263EFF910] date];
  double v3 = MEMORY[0x230FC5E50]();
  uint64_t v4 = TMGetRTCResetCount();
  uint64_t v5 = [NSNumber numberWithDouble:v3];
  int v6 = [NSNumber numberWithUnsignedInt:v4];
  [(MDMServerCore *)self setMemberQueueLastPollingSuccess:v10];
  [(MDMServerCore *)self setMemberQueueLastPollingSuccessMonotonicTime:v5];
  [(MDMServerCore *)self setMemberQueueLastPollingSuccessRTCResetCount:v6];
  uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
  char v8 = [(MDMServerCore *)self _mdmFilePathForChannelType:[(MDMServerCore *)self channelType]];
  __int16 v9 = [v7 dictionaryWithContentsOfFile:v8];

  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F52A10]];
  [v9 setObject:v5 forKeyedSubscript:*MEMORY[0x263F52A18]];
  [v9 setObject:v6 forKeyedSubscript:*MEMORY[0x263F52A20]];
  [(MDMServerCore *)self _memberQueueWriteDict:v9 toMDMConfigurationFileForChannel:[(MDMServerCore *)self channelType] shouldNotify:0];
}

- (void)_memberQueueSetLastPollingAttempt
{
  id v10 = [MEMORY[0x263EFF910] date];
  double v3 = MEMORY[0x230FC5E50]();
  uint64_t v4 = TMGetRTCResetCount();
  uint64_t v5 = [NSNumber numberWithDouble:v3];
  int v6 = [NSNumber numberWithUnsignedInt:v4];
  [(MDMServerCore *)self setMemberQueueLastPollingAttempt:v10];
  [(MDMServerCore *)self setMemberQueueLastPollingAttemptMonotonicTime:v5];
  [(MDMServerCore *)self setMemberQueueLastPollingAttemptRTCResetCount:v6];
  uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
  char v8 = [(MDMServerCore *)self _mdmFilePathForChannelType:[(MDMServerCore *)self channelType]];
  __int16 v9 = [v7 dictionaryWithContentsOfFile:v8];

  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F529F8]];
  [v9 setObject:v5 forKeyedSubscript:*MEMORY[0x263F52A00]];
  [v9 setObject:v6 forKeyedSubscript:*MEMORY[0x263F52A08]];
  [(MDMServerCore *)self _memberQueueWriteDict:v9 toMDMConfigurationFileForChannel:[(MDMServerCore *)self channelType] shouldNotify:0];
}

- (void)_registerAsUserSwitchStakeholder
{
  if ([MEMORY[0x263F38BA0] isSharediPad])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_294);
    uint64_t v4 = [(id)DMCUMUserManagerClass() sharedManager];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    char v8 = __49__MDMServerCore__registerAsUserSwitchStakeholder__block_invoke_2;
    __int16 v9 = &unk_264B9E7E8;
    uint64_t v11 = &v12;
    id v5 = v3;
    id v10 = v5;
    [v4 registerUserSwitchStakeHolder:self completionHandler:&v6];

    dispatch_block_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    -[MDMServerCore setMemberQueueUserSwitchAlreadyInitiated:](self, "setMemberQueueUserSwitchAlreadyInitiated:", *((unsigned __int8 *)v13 + 24), v6, v7, v8, v9);

    _Block_object_dispose(&v12, 8);
  }
}

void __49__MDMServerCore__registerAsUserSwitchStakeholder__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 domain];
    id v5 = DMCUMUserManagerErrorDomain();
    if ([v4 isEqualToString:v5])
    {
      uint64_t v6 = [v7 code];

      if (v6 == 5) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    else
    {
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)willSwitchUser
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(MDMServerCore *)self setUserSwitchAlreadyInitiated:1];
  id v2 = [MEMORY[0x263F38BE8] assertionDescriptions];
  if (v2)
  {
    id v3 = objc_opt_new();
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }
  __int16 v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    char v15 = v3;
    _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "Will switch user. Unfinished assertions:\n%{public}@", buf, 0xCu);
  }
}

- (id)_eraseWatchFailedWithUnderlayingError:(id)a3
{
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  id v5 = a3;
  uint64_t v6 = DMCErrorArray();
  uint64_t v7 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12089, v6, v5, *MEMORY[0x263F38A40], 0);

  return v7;
}

- (id)_mdmOutstandingActivitiesFilePathForChannelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    MDMUserOutstandingActivitiesFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    MDMOutstandingActivitiesFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_mdmFilePathForChannelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    MDMUserFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    MDMFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_mdmPropertiesFilePathForChannelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    MDMPropertiesUserFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    MDMPropertiesFilePath();
    self = (MDMServerCore *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_prefixNameForChannelType:(unint64_t)a3
{
  if (a3) {
    return @"mdmuserd";
  }
  else {
    return @"mdmd";
  }
}

- (id)_reasonStringWithReason:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [(MDMServerCore *)self _prefixNameForChannelType:[(MDMServerCore *)self channelType]];
  uint64_t v7 = [v4 stringWithFormat:@"%@-%@", v6, v5];

  return v7;
}

- (BOOL)_isTokenUpdateScheduled
{
  return [(MDMServerCore *)self _tokenUpdateCount] > 0;
}

- (int64_t)_tokenUpdateCount
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v3 = [(MDMServerCore *)self memberQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__MDMServerCore__tokenUpdateCount__block_invoke;
  v6[3] = &unk_264B9D318;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  int64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __34__MDMServerCore__tokenUpdateCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _memberQueueTokenUpdateCount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)_setTokenUpdateRequestCountToZero
{
  id v3 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__MDMServerCore__setTokenUpdateRequestCountToZero__block_invoke;
  block[3] = &unk_264B9D3E0;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__MDMServerCore__setTokenUpdateRequestCountToZero__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueueSetTokenUpdateRequestCount:0];
}

- (int64_t)_tokenUpdateRetryCount
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(MDMServerCore *)self memberQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__MDMServerCore__tokenUpdateRetryCount__block_invoke;
  v6[3] = &unk_264B9D318;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__MDMServerCore__tokenUpdateRetryCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueTokenUpdateRetryCount];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_decreaseTokenUpdateRetryCount
{
  id v3 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__MDMServerCore__decreaseTokenUpdateRetryCount__block_invoke;
  block[3] = &unk_264B9D3E0;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __47__MDMServerCore__decreaseTokenUpdateRetryCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memberQueueTokenUpdateRetryCount];
  if (result >= 1)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 memberQueueTokenUpdateRetryCount] - 1;
    return [v3 setMemberQueueTokenUpdateRetryCount:v4];
  }
  return result;
}

- (int64_t)_memberQueueTokenUpdateCount
{
  id v2 = NSDictionary;
  id v3 = [(MDMServerCore *)self _mdmOutstandingActivitiesFilePathForChannelType:[(MDMServerCore *)self channelType]];
  uint64_t v4 = [v2 dictionaryWithContentsOfFile:v3];

  id v5 = [v4 objectForKey:*MEMORY[0x263F528D8]];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (void)_memberQueueSetTokenUpdateRequestCount:(int64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(MDMServerCore *)self _memberQueueSetOutstandingActivity:v5 forKey:*MEMORY[0x263F528D8]];
  }
  else
  {
    uint64_t v4 = *MEMORY[0x263F528D8];
    [(MDMServerCore *)self _memberQueueRemoveOutstandingActivityForKey:v4];
  }
}

- (void)_memberQueueSetLastPushTokenHash:(id)a3
{
  id v15 = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = [(MDMServerCore *)self _mdmFilePathForChannelType:[(MDMServerCore *)self channelType]];
  int64_t v6 = [v4 dictionaryWithContentsOfFile:v5];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  uint64_t v9 = v8;

  uint64_t v10 = *MEMORY[0x263F52A28];
  long long v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F52A28]];
  long long v12 = v11;
  id v13 = v15;
  if ((v15 != 0) != (v11 != 0) || (v14 = [v11 isEqualToData:v15], id v13 = v15, (v14 & 1) == 0))
  {
    if (v13) {
      [v9 setObject:v13 forKeyedSubscript:v10];
    }
    else {
      [v9 removeObjectForKey:v10];
    }
    [(MDMServerCore *)self _memberQueueWriteDict:v9 toMDMConfigurationFileForChannel:[(MDMServerCore *)self channelType] shouldNotify:0];
  }
}

- (id)_memberQueueLastPushTokenHash
{
  id v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = [(MDMServerCore *)self _mdmFilePathForChannelType:[(MDMServerCore *)self channelType]];
  uint64_t v4 = [v2 dictionaryWithContentsOfFile:v3];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F52A28]];

  return v5;
}

- (void)_memberQueueIncrementTokenUpdateRequestCount
{
  uint64_t v3 = [(MDMServerCore *)self _memberQueueTokenUpdateCount];
  if (v3 <= 1) {
    [(MDMServerCore *)self _memberQueueSetTokenUpdateRequestCount:v3 + 1];
  }
  [(MDMServerCore *)self setMemberQueueTokenUpdateRetryCount:2];
}

- (void)_memberQueueDecrementTokenUpdateRequestCount
{
  uint64_t v3 = [(MDMServerCore *)self _memberQueueTokenUpdateCount];
  if (v3 >= 1)
  {
    [(MDMServerCore *)self _memberQueueSetTokenUpdateRequestCount:v3 - 1];
  }
}

- (id)responseFromBasicResponse:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
  int64_t v6 = [v5 objectForKey:@"ErrorObject"];
  uint64_t v7 = v6;
  if (v6)
  {
    if (([v6 DMCContainsErrorDomain:*MEMORY[0x263F38AB8] code:4009] & 1) != 0
      || [v7 DMCContainsErrorDomain:*MEMORY[0x263F53AE0] code:4009])
    {
      [v5 setObject:@"NotNow" forKey:@"Status"];
      id v8 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        uint64_t v10 = [v5 objectForKey:@"Status"];
        *(_DWORD *)id buf = 138543362;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "Command Status: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      char v14 = +[MDMParser errorChainFromError:v7];
      [v5 setObject:v14 forKey:@"ErrorChain"];
      id v15 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = v15;
        uint64_t v17 = [v5 objectForKey:@"Status"];
        id v18 = [v7 DMCVerboseDescription];
        *(_DWORD *)id buf = 138543618;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_ERROR, "Command Status: %{public}@\nError: %{public}@", buf, 0x16u);
      }
    }
    [v5 removeObjectForKey:@"ErrorObject"];
  }
  else
  {
    long long v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = v11;
      id v13 = [v5 objectForKey:@"Status"];
      *(_DWORD *)id buf = 138543362;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEFAULT, "Command Status: %{public}@", buf, 0xCu);
    }
  }
  id v19 = [(MDMServerCore *)self memberQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__MDMServerCore_responseFromBasicResponse___block_invoke;
  block[3] = &unk_264B9D408;
  void block[4] = self;
  id v20 = v5;
  id v26 = v20;
  dispatch_async_and_wait(v19, block);

  *(void *)id buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v28 = __Block_byref_object_copy__10;
  uint64_t v29 = __Block_byref_object_dispose__10;
  id v30 = 0;
  id v21 = [(MDMServerCore *)self memberQueue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __43__MDMServerCore_responseFromBasicResponse___block_invoke_2;
  v24[3] = &unk_264B9D318;
  v24[4] = self;
  void v24[5] = buf;
  dispatch_async_and_wait(v21, v24);

  [v20 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:@"CommandUUID"];
  id v22 = v20;
  _Block_object_dispose(buf, 8);

  return v22;
}

void __43__MDMServerCore_responseFromBasicResponse___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) memberQueueUseEnrollmentID])
  {
    uint64_t v2 = [*(id *)(a1 + 32) memberQueueEnrollmentID];
    uint64_t v3 = (void *)MEMORY[0x263F529B0];
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F38B98] deviceUDID];
    uint64_t v3 = (void *)MEMORY[0x263F52AC8];
  }
  id v4 = (id)v2;
  [*(id *)(a1 + 40) setObject:v2 forKeyedSubscript:*v3];
}

uint64_t __43__MDMServerCore_responseFromBasicResponse___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) memberQueueCommandUUID];
  return MEMORY[0x270F9A758]();
}

- (void)_clearCachedResponse
{
}

- (id)_cachedResponse
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__10;
  long long v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  uint64_t v3 = [(MDMServerCore *)self memberQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__MDMServerCore__cachedResponse__block_invoke;
  v6[3] = &unk_264B9D318;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __32__MDMServerCore__cachedResponse__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _memberQueueCachedResponse];
  return MEMORY[0x270F9A758]();
}

- (void)_setCachedResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMServerCore *)self memberQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__MDMServerCore__setCachedResponse___block_invoke;
  v7[3] = &unk_264B9D408;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __36__MDMServerCore__setCachedResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _memberQueueSetCachedResponse:*(void *)(a1 + 40)];
}

- (id)_memberQueueCachedResponse
{
  uint64_t v2 = [(MDMServerCore *)self _mdmOutstandingActivitiesFilePathForChannelType:[(MDMServerCore *)self channelType]];
  uint64_t v3 = [NSDictionary dictionaryWithContentsOfFile:v2];
  id v4 = [v3 objectForKey:*MEMORY[0x263F528D0]];

  return v4;
}

- (void)_memberQueueSetCachedResponse:(id)a3
{
  if (a3) {
    [(MDMServerCore *)self _memberQueueSetOutstandingActivity:a3 forKey:*MEMORY[0x263F528D0]];
  }
  else {
    [(MDMServerCore *)self _memberQueueRemoveOutstandingActivityForKey:*MEMORY[0x263F528D0]];
  }
}

- (id)_idleResponse
{
  v15[2] = *MEMORY[0x263EF8340];
  if ([(MDMServerCore *)self memberQueueUseEnrollmentID])
  {
    v14[0] = *MEMORY[0x263F529B0];
    uint64_t v3 = [(MDMServerCore *)self memberQueueEnrollmentID];
    v14[1] = @"Status";
    v15[0] = v3;
    v15[1] = @"Idle";
    id v4 = NSDictionary;
    id v5 = v15;
    id v6 = v14;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F38B98] deviceUDID];
    if (![v3 length])
    {
      uint64_t v7 = [MEMORY[0x263F38B98] deviceUDID];

      uint64_t v3 = (void *)v7;
    }
    if (![v3 length])
    {
      id v8 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v11 = 0;
        _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_ERROR, "Failed to get device UDID from MobileGestalt", v11, 2u);
      }
    }
    v12[0] = *MEMORY[0x263F52AC8];
    v12[1] = @"Status";
    v13[0] = v3;
    v13[1] = @"Idle";
    id v4 = NSDictionary;
    id v5 = v13;
    id v6 = v12;
  }
  uint64_t v9 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:2];

  return v9;
}

- (id)_userFieldsForResponse
{
  void v14[2] = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F38BA0] isSharediPad])
  {
    DMCLKLogoutSupportClass();
    uint64_t v3 = objc_opt_new();
    char v4 = [v3 isCurrentUserAnonymous];

    if (v4)
    {
      id v5 = (__CFString *)(id)*MEMORY[0x263F52EE8];
LABEL_6:
      id v6 = v5;
      goto LABEL_9;
    }
    uint64_t v7 = [(id)DMCUMUserManagerClass() sharedManager];
    id v8 = [v7 currentUser];

    id v6 = [v8 username];
  }
  else
  {
    if ([(MDMServerCore *)self memberQueueUseEnrollmentID])
    {
      id v5 = [(MDMServerCore *)self memberQueueEnrollmentID];
      goto LABEL_6;
    }
    id v6 = @"Device";
  }
LABEL_9:
  uint64_t v9 = *MEMORY[0x263F52F10];
  uint64_t v10 = *MEMORY[0x263F52AE0];
  v13[0] = *MEMORY[0x263F52AD8];
  v13[1] = v10;
  v14[0] = v9;
  v14[1] = v6;
  long long v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
}

- (id)_responseDataFromResponseDictionary:(id)a3
{
  return (id)[MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:100 options:0 error:0];
}

- (void)_memberQueueSetOutstandingActivity:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(MDMServerCore *)self _mdmOutstandingActivitiesFilePathForChannelType:[(MDMServerCore *)self channelType]];
  id v8 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v7];
  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  [v8 setObject:v9 forKey:v6];
  [v8 DMCWriteToBinaryFile:v7];
}

- (void)_memberQueueRemoveOutstandingActivityForKey:(id)a3
{
  id v4 = a3;
  id v7 = [(MDMServerCore *)self _mdmOutstandingActivitiesFilePathForChannelType:[(MDMServerCore *)self channelType]];
  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithContentsOfFile:");
  [v5 removeObjectForKey:v4];

  if ([v5 count])
  {
    [v5 DMCWriteToBinaryFile:v7];
  }
  else
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    [v6 removeItemAtPath:v7 error:0];
  }
}

- (void)_changeOrganizationNameForRMAccountIdentifier:(id)a3 personaID:(id)a4 organizationName:(id)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v8 = 0;
    char v5 = [MEMORY[0x263F527E0] updateOrganizationName:a5 rmAccountIdentifier:a3 personaID:a4 error:&v8];
    id v6 = v8;
    if ((v5 & 1) == 0)
    {
      id v7 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138543362;
        id v10 = v6;
        _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_ERROR, "Could not update organizatioin name from organization info. Error: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)_listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate
{
  uint64_t v3 = *MEMORY[0x263F527C0];
  id v4 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke;
  v5[3] = &unk_264B9D3E0;
  v5[4] = self;
  [(MDMServerCore *)self _listenForOneTimeGlobalNotification:v3 callbackQueue:v4 notificationHandler:v5];
}

void __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isTokenUpdateScheduled])
  {
    uint64_t v2 = [*(id *)(a1 + 32) jobQueue];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke_2;
    v3[3] = &unk_264B9E2F0;
    v3[4] = *(void *)(a1 + 32);
    [v2 fromFunction:"-[MDMServerCore _listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate]_block_invoke" enqueueJob:v3];
  }
}

void __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke_3;
  v6[3] = &unk_264B9E2C8;
  id v7 = v3;
  id v5 = v3;
  [v4 _pollFromServerIfNeeded:0 isReachabilityEvent:0 completionHandler:v6];
}

uint64_t __82__MDMServerCore__listenForCleanupMigrationFinishedNotificaitonAndRetryTokenUpdate__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)_listenForOneTimeGlobalNotification:(id)a3 callbackQueue:(id)a4 notificationHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543362;
    id v28 = v8;
    _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_INFO, "MDMServerCore listening for %{public}@ notification...", buf, 0xCu);
  }
  int out_token = -1;
  objc_initWeak(&location, self);
  id v12 = v8;
  id v13 = (const char *)[v12 UTF8String];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __87__MDMServerCore__listenForOneTimeGlobalNotification_callbackQueue_notificationHandler___block_invoke;
  handler[3] = &unk_264B9E810;
  id v14 = v12;
  id v22 = v14;
  objc_copyWeak(&v24, &location);
  id v15 = v10;
  id v23 = v15;
  uint32_t v16 = notify_register_dispatch(v13, &out_token, v9, handler);
  if (v16)
  {
    uint64_t v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543618;
      id v28 = v14;
      __int16 v29 = 1024;
      uint32_t v30 = v16;
      _os_log_impl(&dword_230A49000, v17, OS_LOG_TYPE_ERROR, "MDMServerCore couldn't register for %{public}@ notification: %d", buf, 0x12u);
    }
    int v18 = -1;
  }
  else
  {
    id v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      id v28 = v14;
      _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_DEFAULT, "MDMServerCore registered for %{public}@ notification", buf, 0xCu);
    }
    int v18 = out_token;
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v18;
}

void __87__MDMServerCore__listenForOneTimeGlobalNotification_callbackQueue_notificationHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "MDMServerCore received %{public}@ notification", (uint8_t *)&v11, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint32_t v7 = notify_cancel(a2);
    if (v7)
    {
      uint32_t v8 = v7;
      id v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 138543618;
        uint64_t v12 = v10;
        __int16 v13 = 1024;
        uint32_t v14 = v8;
        _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_ERROR, "MDMServerCore couldn't cancel %{public}@ notification: %d", (uint8_t *)&v11, 0x12u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (MDMServerAppInstallBlocking)appInstallBlocker
{
  return self->_appInstallBlocker;
}

- (void)setAppInstallBlocker:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (DMCJobQueue)jobQueue
{
  return self->_jobQueue;
}

- (MDMPushServiceManager)pushServiceManager
{
  return self->_pushServiceManager;
}

- (void)setPushServiceManager:(id)a3
{
}

- (MDMDEPPushTokenManager)depPushTokenManager
{
  return self->_depPushTokenManager;
}

- (void)setDepPushTokenManager:(id)a3
{
}

- (BOOL)memberQueueIsMDMConfigurationValid
{
  return self->_memberQueueIsMDMConfigurationValid;
}

- (void)setMemberQueueIsMDMConfigurationValid:(BOOL)a3
{
  self->_memberQueueIsMDMConfigurationValid = a3;
}

- (BOOL)memberQueueIsUprooting
{
  return self->_memberQueueIsUprooting;
}

- (void)setMemberQueueIsUprooting:(BOOL)a3
{
  self->_memberQueueIsUprooting = a3;
}

- (BOOL)memberQueueLastResponseWasNotNow
{
  return self->_memberQueueLastResponseWasNotNow;
}

- (void)setMemberQueueLastResponseWasNotNow:(BOOL)a3
{
  self->_memberQueueLastResponseWasNotNow = a3;
}

- (BOOL)memberQueuePinningRevocationCheckRequired
{
  return self->_memberQueuePinningRevocationCheckRequired;
}

- (void)setMemberQueuePinningRevocationCheckRequired:(BOOL)a3
{
  self->_memberQueuePinningRevocationCheckRequired = a3;
}

- (BOOL)memberQueueSignMessage
{
  return self->_memberQueueSignMessage;
}

- (void)setMemberQueueSignMessage:(BOOL)a3
{
  self->_memberQueueSignMessage = a3;
}

- (BOOL)memberQueueUseDevelopmentAPNS
{
  return self->_memberQueueUseDevelopmentAPNS;
}

- (void)setMemberQueueUseDevelopmentAPNS:(BOOL)a3
{
  self->_memberQueueUseDevelopmentAPNS = a3;
}

- (BOOL)memberQueueUseEnrollmentID
{
  return self->_memberQueueUseEnrollmentID;
}

- (void)setMemberQueueUseEnrollmentID:(BOOL)a3
{
  self->_memberQueueUseEnrollmentID = a3;
}

- (BOOL)memberQueueUserSwitchAlreadyInitiated
{
  return self->_memberQueueUserSwitchAlreadyInitiated;
}

- (void)setMemberQueueUserSwitchAlreadyInitiated:(BOOL)a3
{
  self->_memberQueueUserSwitchAlreadyInitiated = a3;
}

- (unint64_t)memberQueueAccessRights
{
  return self->_memberQueueAccessRights;
}

- (void)setMemberQueueAccessRights:(unint64_t)a3
{
  self->_memberQueueAccessRights = a3;
}

- (int)memberQueuePowerAssertionDeassertedNotificationToken
{
  return self->_memberQueuePowerAssertionDeassertedNotificationToken;
}

- (void)setMemberQueuePowerAssertionDeassertedNotificationToken:(int)a3
{
  self->_memberQueuePowerAssertionDeassertedNotificationToken = a3;
}

- (NSArray)memberQueueCheckInPinnedSecCertificateRefs
{
  return self->_memberQueueCheckInPinnedSecCertificateRefs;
}

- (void)setMemberQueueCheckInPinnedSecCertificateRefs:(id)a3
{
}

- (NSArray)memberQueueServerPinnedSecCertificateRefs
{
  return self->_memberQueueServerPinnedSecCertificateRefs;
}

- (void)setMemberQueueServerPinnedSecCertificateRefs:(id)a3
{
}

- (NSData)memberQueuePushToken
{
  return self->_memberQueuePushToken;
}

- (void)setMemberQueuePushToken:(id)a3
{
}

- (NSData)memberQueueLastLoggedPushToken
{
  return self->_memberQueueLastLoggedPushToken;
}

- (void)setMemberQueueLastLoggedPushToken:(id)a3
{
}

- (NSDate)memberQueueLastPollingAttempt
{
  return self->_memberQueueLastPollingAttempt;
}

- (void)setMemberQueueLastPollingAttempt:(id)a3
{
}

- (NSDate)memberQueueLastPollingSuccess
{
  return self->_memberQueueLastPollingSuccess;
}

- (void)setMemberQueueLastPollingSuccess:(id)a3
{
}

- (NSDictionary)memberQueueCachedResponse
{
  return self->_memberQueueCachedResponse;
}

- (void)setMemberQueueCachedResponse:(id)a3
{
}

- (NSDictionary)memberQueueMDMOptions
{
  return self->_memberQueueMDMOptions;
}

- (void)setMemberQueueMDMOptions:(id)a3
{
}

- (NSDictionary)memberQueueOrganizationInfo
{
  return self->_memberQueueOrganizationInfo;
}

- (void)setMemberQueueOrganizationInfo:(id)a3
{
}

- (NSNumber)memberQueueLastPollingAttemptMonotonicTime
{
  return self->_memberQueueLastPollingAttemptMonotonicTime;
}

- (void)setMemberQueueLastPollingAttemptMonotonicTime:(id)a3
{
}

- (NSNumber)memberQueueLastPollingAttemptRTCResetCount
{
  return self->_memberQueueLastPollingAttemptRTCResetCount;
}

- (void)setMemberQueueLastPollingAttemptRTCResetCount:(id)a3
{
}

- (NSNumber)memberQueueLastPollingSuccessMonotonicTime
{
  return self->_memberQueueLastPollingSuccessMonotonicTime;
}

- (void)setMemberQueueLastPollingSuccessMonotonicTime:(id)a3
{
}

- (NSNumber)memberQueueLastPollingSuccessRTCResetCount
{
  return self->_memberQueueLastPollingSuccessRTCResetCount;
}

- (void)setMemberQueueLastPollingSuccessRTCResetCount:(id)a3
{
}

- (NSNumber)memberQueuePollingInterval
{
  return self->_memberQueuePollingInterval;
}

- (void)setMemberQueuePollingInterval:(id)a3
{
}

- (NSString)memberQueueCommandUUID
{
  return self->_memberQueueCommandUUID;
}

- (void)setMemberQueueCommandUUID:(id)a3
{
}

- (NSString)memberQueueEnrollmentID
{
  return self->_memberQueueEnrollmentID;
}

- (void)setMemberQueueEnrollmentID:(id)a3
{
}

- (NSString)memberQueueManagingProfileIdentifier
{
  return self->_memberQueueManagingProfileIdentifier;
}

- (void)setMemberQueueManagingProfileIdentifier:(id)a3
{
}

- (NSString)memberQueuePushMagic
{
  return self->_memberQueuePushMagic;
}

- (void)setMemberQueuePushMagic:(id)a3
{
}

- (NSString)memberQueueTopic
{
  return self->_memberQueueTopic;
}

- (void)setMemberQueueTopic:(id)a3
{
}

- (NSURL)memberQueueCheckInURL
{
  return self->_memberQueueCheckInURL;
}

- (void)setMemberQueueCheckInURL:(id)a3
{
}

- (NSURL)memberQueueServerURL
{
  return self->_memberQueueServerURL;
}

- (void)setMemberQueueServerURL:(id)a3
{
}

- (__SecIdentity)memberQueueIdentity
{
  return self->_memberQueueIdentity;
}

- (void)setMemberQueueIdentity:(__SecIdentity *)a3
{
  self->_memberQueueIdentity = a3;
}

- (int64_t)memberQueueTokenUpdateRetryCount
{
  return self->_memberQueueTokenUpdateRetryCount;
}

- (void)setMemberQueueTokenUpdateRetryCount:(int64_t)a3
{
  self->_memberQueueTokenUpdateRetryCount = a3;
}

- (id)executionQueuePushTokenWaitContinuationBlock
{
  return self->_executionQueuePushTokenWaitContinuationBlock;
}

- (void)setExecutionQueuePushTokenWaitContinuationBlock:(id)a3
{
}

- (BOOL)executionQueueIsCheckinInProgress
{
  return self->_executionQueueIsCheckinInProgress;
}

- (void)setExecutionQueueIsCheckinInProgress:(BOOL)a3
{
  self->_executionQueueIsCheckinInProgress = a3;
}

- (int)keybagEventToken
{
  return self->_keybagEventToken;
}

- (void)setKeybagEventToken:(int)a3
{
  self->_keybagEventToken = a3;
}

- (int)buddyDoneEventToken
{
  return self->_buddyDoneEventToken;
}

- (void)setBuddyDoneEventToken:(int)a3
{
  self->_buddyDoneEventToken = a3;
}

- (int)pairedNRDeviceEventToken
{
  return self->_pairedNRDeviceEventToken;
}

- (void)setPairedNRDeviceEventToken:(int)a3
{
  self->_pairedNRDeviceEventToken = a3;
}

- (BOOL)isObservingReachability
{
  return self->_isObservingReachability;
}

- (void)setIsObservingReachability:(BOOL)a3
{
  self->_isObservingReachability = a3;
}

- (OS_dispatch_queue)appBlockQueue
{
  return self->_appBlockQueue;
}

- (void)setAppBlockQueue:(id)a3
{
}

- (id)appBlockCompletionBlock
{
  return self->_appBlockCompletionBlock;
}

- (void)setAppBlockCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appBlockCompletionBlock, 0);
  objc_storeStrong((id *)&self->_appBlockQueue, 0);
  objc_storeStrong(&self->_executionQueuePushTokenWaitContinuationBlock, 0);
  objc_storeStrong((id *)&self->_memberQueueServerURL, 0);
  objc_storeStrong((id *)&self->_memberQueueCheckInURL, 0);
  objc_storeStrong((id *)&self->_memberQueueTopic, 0);
  objc_storeStrong((id *)&self->_memberQueuePushMagic, 0);
  objc_storeStrong((id *)&self->_memberQueueManagingProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_memberQueueEnrollmentID, 0);
  objc_storeStrong((id *)&self->_memberQueueCommandUUID, 0);
  objc_storeStrong((id *)&self->_memberQueuePollingInterval, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccessRTCResetCount, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccessMonotonicTime, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttemptRTCResetCount, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttemptMonotonicTime, 0);
  objc_storeStrong((id *)&self->_memberQueueOrganizationInfo, 0);
  objc_storeStrong((id *)&self->_memberQueueMDMOptions, 0);
  objc_storeStrong((id *)&self->_memberQueueCachedResponse, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingSuccess, 0);
  objc_storeStrong((id *)&self->_memberQueueLastPollingAttempt, 0);
  objc_storeStrong((id *)&self->_memberQueueLastLoggedPushToken, 0);
  objc_storeStrong((id *)&self->_memberQueuePushToken, 0);
  objc_storeStrong((id *)&self->_memberQueueServerPinnedSecCertificateRefs, 0);
  objc_storeStrong((id *)&self->_memberQueueCheckInPinnedSecCertificateRefs, 0);
  objc_storeStrong((id *)&self->_depPushTokenManager, 0);
  objc_storeStrong((id *)&self->_pushServiceManager, 0);
  objc_storeStrong((id *)&self->_jobQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_appInstallBlocker, 0);
}

- (void)startOutError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)notifyNewConfigurationWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)scheduleTokenUpdateWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)scheduleTokenUpdateIfNecessaryWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)simulatePushWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)simulatePushIfNetworkTetheredWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)retryNotNowWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)migrateMDMWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)reauthenticationCompleteWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)uprootMDMWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)processDeviceRequest:encodeResponse:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)pushTokenWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)touchWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)processUserRequest:encodeResponse:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)isAwaitingUserConfiguredWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)depPushTokenWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)syncDEPPushTokenWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230A49000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

@end