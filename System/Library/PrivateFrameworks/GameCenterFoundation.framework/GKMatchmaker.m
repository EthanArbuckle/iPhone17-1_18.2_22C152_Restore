@interface GKMatchmaker
+ (BOOL)canPlayMultiplayerGameWithPlayers:(id)a3;
+ (GKMatchmaker)sharedMatchmaker;
+ (id)descriptionForNearbyDictionary:(id)a3;
+ (id)syncQueue;
+ (void)sharedMatchmaker;
- (BOOL)allInviteesDidRespond;
- (BOOL)canPromptTapToRadar;
- (BOOL)generatingCompatiblityHashes;
- (BOOL)hasInviteListener;
- (BOOL)isEligibleForGroupSession;
- (BOOL)isEntitledToUseGroupActivities;
- (BOOL)nearbyAdvertising;
- (BOOL)nearbyBrowsing;
- (BOOL)nearbyDiscoverySetup;
- (BOOL)removeInvitee:(id)a3;
- (BOOL)serverHosted;
- (BOOL)shouldRespondToNearbyQuery;
- (BOOL)shouldRunGroupActivityWithDescription:(id)a3;
- (BOOL)wasNearbyBrowsing;
- (GKDispatchGroup)compatibilityHashGroup;
- (GKMatch)match;
- (GKMatchRequest)currentMatchRequest;
- (GKMatchmaker)init;
- (NSDate)nearbyQueryLastCheckDate;
- (NSDictionary)inviteesByUserID;
- (NSMutableArray)acceptedInviteesTokens;
- (NSMutableArray)shareInvitees;
- (NSMutableDictionary)nearbyInvites;
- (NSMutableDictionary)nearbyPlayers;
- (NSMutableDictionary)pendingInvitationUpdates;
- (NSMutableDictionary)sharePlayInviteeTokensFromProgrammaticInvite;
- (NSMutableSet)autoMatchedPlayers;
- (NSMutableSet)invitedInvitees;
- (NSMutableSet)invitedNearbyPlayers;
- (NSMutableSet)invitedShareInvitees;
- (NSMutableSet)siblingInvitees;
- (NSSet)nearbyCompatibleShortVersionHashes;
- (NSSet)nearbyCompatibleVersionHashes;
- (NSString)inviterPlayerID;
- (OS_dispatch_queue)invitationQueue;
- (OS_dispatch_queue)lookForInviteQueue;
- (_TtC20GameCenterFoundation22GKGroupActivityManager)groupActivityManager;
- (double)nearbyQueryAllowance;
- (id)_nearbyDeviceWithDeviceID:(id)a3;
- (id)allInvitedInvitees;
- (id)allInvitedInviteesAndInMatchRequestRecipients;
- (id)compatibilityHashQueue;
- (id)declineReasonString:(int64_t)a3;
- (id)formAGKMatchRequestForNearbyInviteWithOriginalRequest:(id)a3 nearbyPlayerIDs:(id)a4;
- (id)hashForBundleID:(id)a3 version:(id)a4 platform:(int64_t)a5;
- (id)hashForCurrentGameUsingBundleVersion;
- (id)hashForCurrentGameUsingShortBundleVersionAndPlatform;
- (id)inviteeResponseHandler;
- (id)nearbyDeviceWithDeviceID:(id)a3;
- (id)nearbyDevicesForPlayer:(id)a3 withState:(int64_t)a4;
- (id)nearbyInviteFromPlayer:(id)a3;
- (id)nearbyPlayerHandler;
- (id)nearbyPlayerIDHandler;
- (id)newMatch;
- (id)profileDictionaryForLocalPlayer;
- (id)recipientResponseHandler;
- (id)sharePlayPlayerHandler;
- (id)sharingControllerItemProvider;
- (id)unreleasedHash;
- (int)matching;
- (int)numberOfNearbyDevicesForPlayer:(id)a3 withState:(int64_t)a4;
- (int64_t)currentEnvironment;
- (int64_t)inviteeCount;
- (int64_t)responseForDeclineReason:(int64_t)a3;
- (int64_t)totalPlayerCount;
- (unint64_t)inviteApproach;
- (void)acceptNearbyInvite:(id)a3 connectionData:(id)a4;
- (void)activateGroupActivityWithHandler:(id)a3;
- (void)addInvitees:(id)a3;
- (void)addPlayersForHostedMatchRequest:(id)a3 existingPlayerCount:(int64_t)a4 completionHandler:(id)a5;
- (void)addPlayersForHostedMatchRequest:(id)a3 existingPlayerCount:(int64_t)a4 devicePushToken:(id)a5 completionHandler:(id)a6;
- (void)addPlayersToMatch:(GKMatch *)match matchRequest:(GKMatchRequest *)matchRequest completionHandler:(void *)completionHandler;
- (void)addPlayersToMatch:(id)a3 matchRequest:(id)a4 devicePushToken:(id)a5 completionHandler:(id)a6;
- (void)allInviteesDidRespond;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)applicationWillEnterForegroundNotification:(id)a3;
- (void)applicationWillTerminateNotification:(id)a3;
- (void)cancel;
- (void)cancelInviteToPlayer:(NSString *)playerID;
- (void)cancelNearbyInvitesToPlayers:(id)a3;
- (void)cancelPendingInviteToPlayer:(GKPlayer *)player;
- (void)cancelPendingInvites;
- (void)cancelSentNearbyInvites;
- (void)changeGroupActivityStateToGameStarted;
- (void)dealloc;
- (void)declineNearbyInviteFromDevice:(id)a3 reason:(int64_t)a4;
- (void)declineReceivedNearbyInvites;
- (void)determineIfShouldRespondToNearbyPlayer:(id)a3 handler:(id)a4;
- (void)doneMatchmaking;
- (void)endGroupActivity;
- (void)establishNearbyFriendRelationships:(id)a3 fromDevice:(id)a4;
- (void)findMatchForRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler;
- (void)findMatchForRequest:(id)a3 devicePushToken:(id)a4 withCompletionHandler:(id)a5;
- (void)findMatchedPlayers:(id)a3 withCompletionHandler:(id)a4;
- (void)findPlayersForHostedMatchRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler;
- (void)findPlayersForHostedRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler;
- (void)findPlayersForHostedRequest:(id)a3 match:(id)a4 withCompletionHandler:(id)a5;
- (void)findRematchForMatch:(id)a3 completionHandler:(id)a4;
- (void)finishMatchmakingForMatch:(GKMatch *)match;
- (void)finishedAuthenticating;
- (void)foundNearbyDeviceID:(id)a3 discoveryInfo:(id)a4;
- (void)generateHashedCompatibilitySetWithHandler:(id)a3;
- (void)getHashedCompatibilitySetsWithHandler:(id)a3;
- (void)handleMatchRequest:(id)a3 forCurrentMatch:(id)a4 hostedCurrentPlayerCount:(int64_t)a5 serverHosted:(BOOL)a6 rematchID:(id)a7 devicePushToken:(id)a8 completionHandler:(id)a9;
- (void)handleNearbyInvite:(id)a3 fromDevice:(id)a4;
- (void)handleNearbyInviteResponse:(id)a3 fromDevice:(id)a4;
- (void)handleNearbyProfileQuery:(id)a3 fromDevice:(id)a4;
- (void)handleNearbyProfileResponse:(id)a3 fromDevice:(id)a4 withCompletionHandler:(id)a5;
- (void)inviteAnyNearbyPlayersViaGCSWithRequest:(id)a3 onlineConnectionData:(id)a4 handler:(id)a5;
- (void)inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest:(id)a3 handler:(id)a4;
- (void)inviteHandler;
- (void)invitePlayersWithRequest:(id)a3 serverHosted:(BOOL)a4 devicePushTokenMap:(id)a5 completionHandler:(id)a6;
- (void)invitePlayersWithRequest:(id)a3 serverHosted:(BOOL)a4 onlineConnectionData:(id)a5 devicePushTokenMap:(id)a6 isNearbyInvite:(BOOL)a7 completionHandler:(id)a8;
- (void)inviteeAccepted:(id)a3 userInfo:(id)a4 allResponded:(BOOL)a5;
- (void)inviteeAcceptedNotification:(id)a3;
- (void)inviteeDeclinedNotification:(id)a3;
- (void)inviteeDeclinedWithUserInfo:(id)a3;
- (void)inviteeUpdateNotification:(id)a3;
- (void)leaveGroupActivity;
- (void)loadConnectivitySettingsWithCompletionHandler:(id)a3;
- (void)loadPhotoDataDictionaryWithHandler:(id)a3;
- (void)loadURLForMatch:(id)a3 matchRequest:(id)a4 completionHandler:(id)a5;
- (void)localPlayerAcceptedGameInviteNotification:(id)a3;
- (void)localPlayerAcceptedNearbyInvite:(id)a3;
- (void)localPlayerRespondedToNearbyInvite:(id)a3;
- (void)lookForGroupActivities;
- (void)lookForInvite;
- (void)lostNearbyDeviceID:(id)a3;
- (void)matchForInvite:(GKInvite *)invite completionHandler:(void *)completionHandler;
- (void)matchForNearbyInvite:(id)a3 handler:(id)a4;
- (void)matchForRemoteInvite:(id)a3 completionHandler:(id)a4;
- (void)matchRequestRecipientsSet:(id)a3;
- (void)nearbyDataReceived:(id)a3;
- (void)nearbyInviteWasCancelled:(id)a3 fromDevice:(id)a4;
- (void)nearbyPlayerFound:(id)a3;
- (void)nearbyPlayerLost:(id)a3;
- (void)performSync:(id)a3;
- (void)playerDisconnected:(id)a3;
- (void)presentNearbyInvite:(id)a3 fromDevice:(id)a4;
- (void)promptForRadarWithDescriptionAddition:(id)a3;
- (void)queryActivityWithCompletionHandler:(void *)completionHandler;
- (void)queryPlayerGroupActivity:(NSUInteger)playerGroup withCompletionHandler:(void *)completionHandler;
- (void)queryQueueActivity:(id)a3 withCompletionHandler:(id)a4;
- (void)receivedData:(id)a3 fromNearbyDeviceID:(id)a4;
- (void)reduceRecipientsForMatchRequest:(id)a3 toPlayersWithPlayerIDs:(id)a4;
- (void)registeredListentersChanged;
- (void)removeNearbyInviteFromPlayer:(id)a3;
- (void)reportPlayerConnectedWithPlayerID:(id)a3 forMatch:(id)a4;
- (void)reportResponse:(int64_t)a3 forInvitees:(id)a4 withCompletionHandler:(id)a5;
- (void)resetGroupActivity;
- (void)respondToHostedInvite:(id)a3 completionHandler:(id)a4;
- (void)saveNearbyInvite:(id)a3 fromPlayer:(id)a4;
- (void)sendGroupActivityInviteTo:(id)a3 participantID:(id)a4 pushToken:(id)a5;
- (void)sendMatchmakingRequest:(id)a3 forMatch:(id)a4 rematchID:(id)a5 serverHosted:(BOOL)a6 playerCount:(int64_t)a7 completionHandler:(id)a8;
- (void)sendProfileResponseToDevice:(id)a3;
- (void)setAcceptedInviteesTokens:(id)a3;
- (void)setAutoMatchedPlayers:(id)a3;
- (void)setCanPromptTapToRadar:(BOOL)a3;
- (void)setCompatibilityHashGroup:(id)a3;
- (void)setCurrentMatchRequest:(id)a3;
- (void)setGeneratingCompatiblityHashes:(BOOL)a3;
- (void)setGroupActivityManager:(id)a3;
- (void)setInvitationQueue:(id)a3;
- (void)setInviteApproach:(unint64_t)a3;
- (void)setInviteHandler:(void *)inviteHandler;
- (void)setInvitedInvitees:(id)a3;
- (void)setInvitedNearbyPlayers:(id)a3;
- (void)setInvitedShareInvitees:(id)a3;
- (void)setInviteeResponseHandler:(id)a3;
- (void)setInviteesByUserID:(id)a3;
- (void)setInviterPlayerID:(id)a3;
- (void)setLookForInviteQueue:(id)a3;
- (void)setMatch:(id)a3;
- (void)setMatching:(int)a3;
- (void)setNearbyAdvertising:(BOOL)a3;
- (void)setNearbyBrowsing:(BOOL)a3;
- (void)setNearbyCompatibleShortVersionHashes:(id)a3;
- (void)setNearbyCompatibleVersionHashes:(id)a3;
- (void)setNearbyDevice:(id)a3 reachable:(BOOL)a4;
- (void)setNearbyDiscoverySetup:(BOOL)a3;
- (void)setNearbyInvites:(id)a3;
- (void)setNearbyPlayerAccepted:(id)a3 connectionData:(id)a4;
- (void)setNearbyPlayerAccepted:(id)a3 deviceID:(id)a4 connectionData:(id)a5;
- (void)setNearbyPlayerDeclined:(id)a3 deviceID:(id)a4 reason:(int64_t)a5;
- (void)setNearbyPlayerDeclined:(id)a3 reason:(int64_t)a4;
- (void)setNearbyPlayerFailed:(id)a3;
- (void)setNearbyPlayerFailed:(id)a3 deviceID:(id)a4;
- (void)setNearbyPlayerHandler:(id)a3;
- (void)setNearbyPlayerIDHandler:(id)a3;
- (void)setNearbyPlayers:(id)a3;
- (void)setNearbyQueryAllowance:(double)a3;
- (void)setNearbyQueryLastCheckDate:(id)a3;
- (void)setPendingInvitationUpdates:(id)a3;
- (void)setRecipientResponseHandler:(id)a3;
- (void)setServerHosted:(BOOL)a3;
- (void)setShareInvitees:(id)a3;
- (void)setShareInvitees:(id)a3 forMatch:(id)a4 propagateToDaemon:(BOOL)a5;
- (void)setShareInvitees:(id)a3 propagateToDaemon:(BOOL)a4;
- (void)setSharePlayInviteeTokensFromProgrammaticInvite:(id)a3;
- (void)setSharePlayPlayerHandler:(id)a3;
- (void)setSiblingInvitees:(id)a3;
- (void)setWasNearbyBrowsing:(BOOL)a3;
- (void)setupNearbyDiscovery;
- (void)shareInviteeAcceptedWithUserInfo:(id)a3;
- (void)sharePlayPlayerFound:(id)a3;
- (void)sharingControllerItemProvider;
- (void)showSharePlayMatchDeclinedToJoinAlertWithReason:(int64_t)a3;
- (void)startBrowsingForNearbyPlayersWithHandler:(void *)reachableHandler;
- (void)startBrowsingForNearbyPlayersWithReachableHandler:(void *)reachableHandler;
- (void)startGroupActivityWithPlayerHandler:(void *)handler;
- (void)startNearbyAdvertising;
- (void)startNearbyBrowsing;
- (void)stopBrowsingForNearbyPlayers;
- (void)stopGroupActivity;
- (void)stopNearbyAdvertising;
- (void)stopNearbyBrowsing;
- (void)updateNearbyAdvertising;
- (void)userCancelledMatching;
@end

@implementation GKMatchmaker

- (GKMatchmaker)init
{
  v38.receiver = self;
  v38.super_class = (Class)GKMatchmaker;
  v2 = [(GKMatchmaker *)&v38 init];
  v3 = v2;
  if (v2)
  {
    if ([(GKMatchmaker *)v2 shouldRunGroupActivityWithDescription:@"matchmakerInit"])
    {
      v4 = [[_TtC20GameCenterFoundation22GKGroupActivityManager alloc] initWithMatchmakingSupport:v3];
      groupActivityManager = v3->_groupActivityManager;
      v3->_groupActivityManager = v4;
    }
    [(GKMatchmaker *)v3 loadConnectivitySettingsWithCompletionHandler:0];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v7 = +[GKLocalPlayer localPlayer];
    [v6 addObserver:v3 selector:sel_inviteeAcceptedNotification_ name:@"GKInviteeAcceptedGameInvite" object:v7];

    v8 = +[GKLocalPlayer localPlayer];
    [v6 addObserver:v3 selector:sel_inviteeDeclinedNotification_ name:@"GKInviteeDeclinedGameInvite" object:v8];

    v9 = +[GKLocalPlayer localPlayer];
    [v6 addObserver:v3 selector:sel_inviteeUpdateNotification_ name:@"GKUpdateGameInviteNotification" object:v9];

    v10 = +[GKLocalPlayer localPlayer];
    [v6 addObserver:v3 selector:sel_localPlayerAcceptedGameInviteNotification_ name:@"GKAcceptedGameInvite" object:v10];

    v11 = +[GKApplicationNotificationNames didEnterBackground];
    [v6 addObserver:v3 selector:sel_applicationDidEnterBackgroundNotification_ name:v11 object:0];

    v12 = +[GKApplicationNotificationNames willTerminate];
    [v6 addObserver:v3 selector:sel_applicationWillTerminateNotification_ name:v12 object:0];

    v13 = +[GKApplicationNotificationNames willEnterForeground];
    [v6 addObserver:v3 selector:sel_applicationWillEnterForegroundNotification_ name:v13 object:0];

    [v6 addObserver:v3 selector:sel_nearbyPlayerFound_ name:@"GKNearbyPlayerFoundNotification" object:0];
    [v6 addObserver:v3 selector:sel_nearbyPlayerLost_ name:@"GKNearbyPlayerLostNotification" object:0];
    [v6 addObserver:v3 selector:sel_nearbyDataReceived_ name:@"GKNearbyDataReceivedNotification" object:0];
    [v6 addObserver:v3 selector:sel_matchRequestRecipientsSet_ name:@"GKSetMatchRequestRecipientsNotification" object:0];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("GKMatchmaker.lookForInviteQueue", v14);
    lookForInviteQueue = v3->_lookForInviteQueue;
    v3->_lookForInviteQueue = (OS_dispatch_queue *)v15;

    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 117, "-[GKMatchmaker init]");
    uint64_t v18 = +[GKDispatchGroup dispatchGroupWithName:v17];
    compatibilityHashGroup = v3->_compatibilityHashGroup;
    v3->_compatibilityHashGroup = (GKDispatchGroup *)v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    invitedInvitees = v3->_invitedInvitees;
    v3->_invitedInvitees = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    invitedShareInvitees = v3->_invitedShareInvitees;
    v3->_invitedShareInvitees = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    invitedNearbyPlayers = v3->_invitedNearbyPlayers;
    v3->_invitedNearbyPlayers = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    autoMatchedPlayers = v3->_autoMatchedPlayers;
    v3->_autoMatchedPlayers = v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    siblingInvitees = v3->_siblingInvitees;
    v3->_siblingInvitees = v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    sharePlayInviteeTokensFromProgrammaticInvite = v3->_sharePlayInviteeTokensFromProgrammaticInvite;
    v3->_sharePlayInviteeTokensFromProgrammaticInvite = (NSMutableDictionary *)v30;

    uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingInvitationUpdates = v3->_pendingInvitationUpdates;
    v3->_pendingInvitationUpdates = (NSMutableDictionary *)v32;

    v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v35 = dispatch_queue_create("com.apple.GameKit.matchmaker.invitationQueue", v34);
    invitationQueue = v3->_invitationQueue;
    v3->_invitationQueue = (OS_dispatch_queue *)v35;
  }
  return v3;
}

- (void)loadConnectivitySettingsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "GKMatchmaker: loadConnectivitySettingsWithCompletionHandler", buf, 2u);
  }
  v6 = +[GKDaemonProxy proxyForLocalPlayer];
  v7 = [v6 utilityService];
  v8 = +[GKViceroyNATConfiguration settingsKeys];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__GKMatchmaker_loadConnectivitySettingsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E646ED48;
  id v11 = v3;
  id v9 = v3;
  [v7 getStoreBagValuesForKeys:v8 handler:v10];
}

void __62__GKMatchmaker_loadConnectivitySettingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __62__GKMatchmaker_loadConnectivitySettingsWithCompletionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    +[GKViceroyNATConfiguration applySettings:v5];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKMatchmaker;
  [(GKMatchmaker *)&v4 dealloc];
}

- (void)finishedAuthenticating
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_12() local];
  objc_super v4 = [v3 internal];
  id v5 = [v4 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1C2D22000, v1, v6, "Player %@ is not authenticated, cancel matchmaking", v7);
}

- (void)registeredListentersChanged
{
  [(GKMatchmaker *)self updateNearbyAdvertising];

  [(GKMatchmaker *)self lookForInvite];
}

- (BOOL)hasInviteListener
{
  id v3 = +[GKLocalPlayer localPlayer];
  objc_super v4 = [v3 eventEmitter];
  BOOL v5 = ([v4 listenerRegisteredForSelector:sel_player_didAcceptInvite_] & 1) != 0
    || self->_inviteHandler != 0;

  return v5;
}

- (BOOL)removeInvitee:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    uint64_t v8 = [v4 internal];
    id v9 = [v8 debugDescription];
    int v19 = 138412290;
    v20 = v9;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "Matchmaking removes invitee: %@", (uint8_t *)&v19, 0xCu);
  }
  v10 = [v4 internal];
  id v11 = [v10 playerID];

  if (v11
    && ([(GKMatchmaker *)self inviteesByUserID],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 objectForKeyedSubscript:v11],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    v14 = [(GKMatchmaker *)self inviteesByUserID];
    dispatch_queue_t v15 = (void *)[v14 mutableCopy];

    [v15 setObject:0 forKeyedSubscript:v11];
    v16 = (void *)[v15 copy];
    [(GKMatchmaker *)self setInviteesByUserID:v16];

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)allInvitedInvitees
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(GKMatchmaker *)self invitedNearbyPlayers];
  [v3 unionSet:v4];

  id v5 = [(GKMatchmaker *)self invitedInvitees];
  [v3 unionSet:v5];

  uint64_t v6 = [(GKMatchmaker *)self invitedShareInvitees];
  [v3 unionSet:v6];

  return v3;
}

- (id)allInvitedInviteesAndInMatchRequestRecipients
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(GKMatchmaker *)self allInvitedInvitees];
  [v3 unionSet:v4];

  id v5 = [(GKMatchmaker *)self currentMatchRequest];
  uint64_t v6 = [v5 recipients];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = [(GKMatchmaker *)self currentMatchRequest];
    v10 = [v9 recipients];
    id v11 = [v10 _gkPlayersIDsFromPlayers];
    v12 = [v8 setWithArray:v11];
    [v3 unionSet:v12];
  }
  if (!os_log_GKGeneral) {
    id v13 = GKOSLoggers();
  }
  v14 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    BOOL v17 = v3;
    _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "allInvitedInviteesAndInMatchRequestRecipients: %@", (uint8_t *)&v16, 0xCu);
  }

  return v3;
}

- (int64_t)inviteeCount
{
  id v2 = [(GKMatchmaker *)self allInvitedInviteesAndInMatchRequestRecipients];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)totalPlayerCount
{
  int64_t v3 = [(GKMatchmaker *)self match];
  if (v3)
  {
    id v4 = [(GKMatchmaker *)self match];
    id v5 = [v4 players];
    uint64_t v6 = [v5 count];
    uint64_t v7 = [(GKMatchmaker *)self match];
    int64_t v8 = v6 + [v7 expectedPlayerCount] + 1;
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)reportPlayerConnectedWithPlayerID:(id)a3 forMatch:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  id v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v10 = NSNumber;
    id v11 = v9;
    v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", -[GKMatchmaker inviteApproach](self, "inviteApproach"));
    id v13 = [(GKMatchmaker *)self invitedInvitees];
    v14 = [(GKMatchmaker *)self invitedShareInvitees];
    dispatch_queue_t v15 = [(GKMatchmaker *)self invitedNearbyPlayers];
    int v16 = [(GKMatchmaker *)self autoMatchedPlayers];
    BOOL v17 = [(GKMatchmaker *)self siblingInvitees];
    int v42 = 138413826;
    id v43 = v6;
    __int16 v44 = 2112;
    v45 = v12;
    __int16 v46 = 2112;
    v47 = v13;
    __int16 v48 = 2112;
    v49 = v14;
    __int16 v50 = 2112;
    v51 = v15;
    __int16 v52 = 2112;
    v53 = v16;
    __int16 v54 = 2112;
    v55 = v17;
    _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "reportPlayerConnectedWithPlayerID: %@, inviteApproach:%@, push: %@, msg: %@, nearby: %@, automatch: %@, indirect: %@", (uint8_t *)&v42, 0x48u);
  }
  uint64_t v18 = +[GKReporter reporter];
  [v18 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.allMatchSuccess"];

  int v19 = [(GKMatchmaker *)self invitedShareInvitees];
  if ([v19 containsObject:v6])
  {

LABEL_9:
    v22 = +[GKReporter reporter];
    [v22 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.messageBasedMatchSuccess"];

    v23 = +[GKDaemonProxy proxyForLocalPlayer];
    v24 = [v23 utilityService];
    [v24 completeMatchRecording:@"success" matchType:@"message"];
    uint64_t v25 = 2;
    goto LABEL_32;
  }
  if ([(GKMatchmaker *)self inviteApproach] == 2)
  {
    v20 = [(GKMatchmaker *)self inviterPlayerID];
    int v21 = [v6 isEqualToString:v20];

    if (v21) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  v26 = [(GKMatchmaker *)self invitedInvitees];
  if ([v26 containsObject:v6])
  {

LABEL_15:
    v29 = +[GKReporter reporter];
    [v29 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.pushBasedMatchSuccess"];

    v23 = +[GKDaemonProxy proxyForLocalPlayer];
    v24 = [v23 utilityService];
    [v24 completeMatchRecording:@"success" matchType:@"push"];
    uint64_t v25 = 1;
    goto LABEL_32;
  }
  if ([(GKMatchmaker *)self inviteApproach] == 1)
  {
    v27 = [(GKMatchmaker *)self inviterPlayerID];
    int v28 = [v6 isEqualToString:v27];

    if (v28) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v30 = [(GKMatchmaker *)self invitedNearbyPlayers];
  if ([v30 containsObject:v6])
  {

LABEL_21:
    v33 = +[GKReporter reporter];
    [v33 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.nearbyMatchSuccess"];

    v23 = +[GKDaemonProxy proxyForLocalPlayer];
    v24 = [v23 utilityService];
    [v24 completeMatchRecording:@"success" matchType:@"nearby"];
    uint64_t v25 = 3;
    goto LABEL_32;
  }
  if ([(GKMatchmaker *)self inviteApproach] == 3)
  {
    v31 = [(GKMatchmaker *)self inviterPlayerID];
    int v32 = [v6 isEqualToString:v31];

    if (v32) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v34 = [(GKMatchmaker *)self siblingInvitees];
  int v35 = [v34 containsObject:v6];

  if (v35)
  {
    v36 = +[GKReporter reporter];
    [v36 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.indirectMatchSuccess"];

    v23 = +[GKDaemonProxy proxyForLocalPlayer];
    v24 = [v23 utilityService];
    [v24 completeMatchRecording:@"success" matchType:@"sibling"];
    uint64_t v25 = 5;
  }
  else
  {
    v37 = [(GKMatchmaker *)self autoMatchedPlayers];
    int v38 = [v37 containsObject:v6];

    if (v38)
    {
      v39 = +[GKReporter reporter];
      [v39 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.autoMatchSuccess"];

      v23 = +[GKDaemonProxy proxyForLocalPlayer];
      v24 = [v23 utilityService];
      [v24 completeMatchRecording:@"success" matchType:@"automatch"];
      uint64_t v25 = 4;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v40 = GKOSLoggers();
      }
      v41 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        int v42 = 138412290;
        id v43 = v6;
        _os_log_impl(&dword_1C2D22000, v41, OS_LOG_TYPE_INFO, "playerID: %@, not found from any source of GKMatchmaker. It could be invitees of the automatched players.", (uint8_t *)&v42, 0xCu);
      }
      v23 = +[GKDaemonProxy proxyForLocalPlayer];
      v24 = [v23 utilityService];
      [v24 completeMatchRecording:@"success" matchType:@"unknown"];
      uint64_t v25 = 0;
    }
  }
LABEL_32:

  [v7 updateJoinedPlayer:v6 joinType:v25];
}

- (void)userCancelledMatching
{
}

- (void)lookForInvite
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "lookForInvite", buf, 2u);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__GKMatchmaker_lookForInvite__block_invoke;
    block[3] = &unk_1E646D7F0;
    block[4] = self;
    lookForInviteQueue = MEMORY[0x1E4F14428];
    id v9 = block;
    goto LABEL_12;
  }
  if (!_GKIsRemoteUI)
  {
    if ([(GKMatchmaker *)self hasInviteListener])
    {
      id v5 = +[GKLocalPlayer localPlayer];
      int v6 = [v5 isAuthenticated];
      char v7 = lookForInvite_lookingForInvite;

      if (v6)
      {
        if ((v7 & 1) == 0)
        {
          lookForInvite_lookingForInvite = 1;
          lookForInviteQueue = self->_lookForInviteQueue;
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __29__GKMatchmaker_lookForInvite__block_invoke_2;
          v10[3] = &unk_1E646D7F0;
          void v10[4] = self;
          id v9 = v10;
LABEL_12:
          dispatch_async(lookForInviteQueue, v9);
        }
      }
    }
  }
}

uint64_t __29__GKMatchmaker_lookForInvite__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) lookForInvite];
}

void __29__GKMatchmaker_lookForInvite__block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 296, "-[GKMatchmaker lookForInvite]_block_invoke_2");
  id v3 = +[GKDispatchGroup dispatchGroupWithName:v2];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__GKMatchmaker_lookForInvite__block_invoke_3;
  v6[3] = &unk_1E646D928;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v5 perform:v6];
  [v5 wait];
}

void __29__GKMatchmaker_lookForInvite__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 multiplayerService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__GKMatchmaker_lookForInvite__block_invoke_4;
  v9[3] = &unk_1E646F4E0;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v3;
  id v8 = v3;
  [v5 getAcceptedGameInviteWithHandler:v9];
}

void __29__GKMatchmaker_lookForInvite__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6) {
    goto LABEL_5;
  }
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
  {
    __29__GKMatchmaker_lookForInvite__block_invoke_4_cold_1();
    if (v5) {
      goto LABEL_6;
    }
  }
  else
  {
LABEL_5:
    if (v5)
    {
LABEL_6:
      id v8 = [[GKInvite alloc] initWithInternalRepresentation:v5];
      goto LABEL_9;
    }
  }
  id v8 = 0;
LABEL_9:
  if (!os_log_GKGeneral) {
    id v9 = GKOSLoggers();
  }
  id v10 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v8;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "getAcceptedGameInviteWithHandler invite: %@", buf, 0xCu);
  }
  uint64_t v11 = +[GKLocalPlayer localPlayer];
  id v12 = v11;
  if (!v8)
  {
    v22 = *(void **)(a1 + 32);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __29__GKMatchmaker_lookForInvite__block_invoke_90;
    v35[3] = &unk_1E646D928;
    id v23 = v11;
    uint64_t v24 = *(void *)(a1 + 40);
    id v36 = v23;
    uint64_t v37 = v24;
    [v22 perform:v35];
    id v25 = v36;
LABEL_24:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_25;
  }
  id v13 = [v5 declineReason];
  uint64_t v14 = [v13 integerValue];

  if (v14 != 5)
  {
    v26 = +[GKReporter reporter];
    [v26 reportAuthenticateResponseDuration];

    v27 = [MEMORY[0x1E4F1CA60] dictionary];
    int v28 = [(GKInvite *)v8 internal];
    v29 = [v28 sessionID];

    if (v29)
    {
      uint64_t v30 = [(GKInvite *)v8 internal];
      v31 = [v30 sessionID];
      [v27 setObject:v31 forKeyedSubscript:@"sid"];
    }
    int v32 = [(GKInvite *)v8 sender];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __29__GKMatchmaker_lookForInvite__block_invoke_83;
    v38[3] = &unk_1E646F4B8;
    v39 = v8;
    id v33 = *(id *)(a1 + 32);
    uint64_t v34 = *(void *)(a1 + 40);
    id v40 = v33;
    uint64_t v41 = v34;
    id v42 = v12;
    id v43 = v27;
    id v25 = v27;
    [v32 updateScopedIDs:v38];

    goto LABEL_24;
  }
  if (!os_log_GKGeneral) {
    id v15 = GKOSLoggers();
  }
  int v16 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "Found an invite declined due to incompatible transport version. Show the alert for users to upgrade.", buf, 2u);
  }
  v44[0] = @"user-id";
  BOOL v17 = [v5 peerID];
  v45[0] = v17;
  v44[1] = @"y";
  uint64_t v18 = [v5 declineReason];
  v45[1] = v18;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];

  v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v21 = +[GKLocalPlayer localPlayer];
  [v20 postNotificationName:@"GKInviteeDeclinedGameInvite" object:v21 userInfo:v19];

LABEL_25:
}

void __29__GKMatchmaker_lookForInvite__block_invoke_83(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isHosted])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__GKMatchmaker_lookForInvite__block_invoke_2_84;
    v11[3] = &unk_1E646E5C8;
    id v2 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    [v2 perform:v11];

    id v3 = v12;
  }
  else
  {
    [*(id *)(a1 + 56) setAcceptedInvite:*(void *)(a1 + 32)];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__GKMatchmaker_lookForInvite__block_invoke_89;
    v6[3] = &unk_1E646F490;
    id v7 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 64);
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = v4;
    uint64_t v10 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
    lookForInvite_lookingForInvite = 0;

    id v3 = v7;
  }
}

void __29__GKMatchmaker_lookForInvite__block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__GKMatchmaker_lookForInvite__block_invoke_3_85;
  v9[3] = &unk_1E646E048;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v3;
  id v8 = v3;
  [v4 respondToHostedInvite:v5 completionHandler:v9];
}

void __29__GKMatchmaker_lookForInvite__block_invoke_3_85(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __29__GKMatchmaker_lookForInvite__block_invoke_3_85_cold_1();
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__GKMatchmaker_lookForInvite__block_invoke_4_86;
    v10[3] = &unk_1E646F490;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v13 = v8;
    uint64_t v14 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
  lookForInvite_lookingForInvite = 0;
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v5, v6, v7);
}

void __29__GKMatchmaker_lookForInvite__block_invoke_4_86(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GKAcceptedGameInvite" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) eventEmitter];
  char v4 = [v3 listenerRegisteredForSelector:sel_player_didAcceptInvite_];

  if ((v4 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      __29__GKMatchmaker_lookForInvite__block_invoke_4_86_cold_1();
    }
  }
  uint64_t v6 = [*(id *)(a1 + 32) eventEmitter];
  [v6 player:*(void *)(a1 + 32) didAcceptInvite:*(void *)(a1 + 48)];

  uint64_t v7 = [*(id *)(a1 + 56) inviteHandler];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 56) inviteHandler];
    v8[2](v8, *(void *)(a1 + 48), 0);
  }
}

void __29__GKMatchmaker_lookForInvite__block_invoke_89(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GKAcceptedGameInvite" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) eventEmitter];
  char v4 = [v3 listenerRegisteredForSelector:sel_player_didAcceptInvite_];

  if ((v4 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      __29__GKMatchmaker_lookForInvite__block_invoke_4_86_cold_1();
    }
  }
  uint64_t v6 = [*(id *)(a1 + 32) eventEmitter];
  [v6 player:*(void *)(a1 + 32) didAcceptInvite:*(void *)(a1 + 48)];

  uint64_t v7 = [*(id *)(a1 + 56) inviteHandler];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 56) inviteHandler];
    v8[2](v8, *(void *)(a1 + 48), 0);
  }
}

void __29__GKMatchmaker_lookForInvite__block_invoke_90(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 multiplayerService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__GKMatchmaker_lookForInvite__block_invoke_2_91;
  v9[3] = &unk_1E646E640;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v3;
  id v8 = v3;
  [v5 getPlayersToInviteWithHandlerV2:v9];
}

void __29__GKMatchmaker_lookForInvite__block_invoke_2_91(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 _gkPlayersFromInternals];
  char v4 = [v3 _gkPlayersIDsFromPlayers];
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v19 = v3;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "got players to invite: %@", buf, 0xCu);
  }
  if (v3)
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"GKPlayersToInviteNotification" object:*(void *)(a1 + 32) userInfo:0];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __29__GKMatchmaker_lookForInvite__block_invoke_92;
    v13[3] = &unk_1E646F490;
    id v14 = *(id *)(a1 + 32);
    id v15 = v3;
    id v11 = v4;
    uint64_t v12 = *(void *)(a1 + 40);
    id v16 = v11;
    uint64_t v17 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
  lookForInvite_lookingForInvite = 0;
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v8, v9);
}

void __29__GKMatchmaker_lookForInvite__block_invoke_92(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) eventEmitter];
  if ([v2 listenerRegisteredForSelector:sel_player_didRequestMatchWithRecipients_])
  {
    if (([v2 listenerRegisteredForSelector:sel_player_didRequestMatchWithRecipients_] & 1) == 0)
    {
      if (!os_log_GKGeneral) {
        id v3 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        __29__GKMatchmaker_lookForInvite__block_invoke_92_cold_2();
      }
    }
    [v2 player:*(void *)(a1 + 32) didRequestMatchWithRecipients:*(void *)(a1 + 40)];
    if ([v2 listenerRegisteredForSelector:sel_player_didRequestMatchWithPlayers_])
    {
      if (!os_log_GKGeneral) {
        id v4 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        __29__GKMatchmaker_lookForInvite__block_invoke_92_cold_1();
      }
    }
  }
  else if ([v2 listenerRegisteredForSelector:sel_player_didRequestMatchWithPlayers_])
  {
    if (GKApplicationLinkedOnOrAfter(917504, 659456))
    {
      if (!os_log_GKGeneral) {
        id v5 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        __29__GKMatchmaker_lookForInvite__block_invoke_92_cold_3();
      }
    }
    else
    {
      [v2 player:*(void *)(a1 + 32) didRequestMatchWithPlayers:*(void *)(a1 + 48)];
    }
  }
  id v6 = [*(id *)(a1 + 56) inviteHandler];

  if (v6)
  {
    int v7 = GKApplicationLinkedOnOrAfter(917504, 659456);
    uint64_t v8 = [*(id *)(a1 + 56) inviteHandler];
    uint64_t v9 = (void (**)(void, void, void))v8;
    if (v7)
    {
      v11[0] = @"playerID is no longer available";
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v10);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, *(void *)(a1 + 48));
    }
  }
}

- (BOOL)shouldRunGroupActivityWithDescription:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess];
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Will not do: %@, for Game Center internal processes.", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    uint64_t v8 = (void *)os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F29060];
      id v10 = v8;
      id v11 = [v9 callStackSymbols];
      int v13 = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "%@, callStacK: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v4 ^ 1;
}

- (BOOL)isEligibleForGroupSession
{
  BOOL v3 = [(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"isEligibleForGroupSession"];
  if (v3)
  {
    int v4 = [(GKMatchmaker *)self groupActivityManager];
    char v5 = [v4 isEligibleForGroupSession];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isEntitledToUseGroupActivities
{
  if (_os_feature_enabled_impl())
  {
    return +[GKEntitledContextProvider hasBooleanPublicGameCenterEntitlement];
  }
  else
  {
    return +[GKEntitledContextProvider hasPublicGroupActivitiesEntitlement];
  }
}

- (void)activateGroupActivityWithHandler:(id)a3
{
  id v4 = a3;
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"activateGroupActivity"])
  {
    char v5 = [(GKMatchmaker *)self groupActivityManager];
    id v6 = +[GKGame currentGame];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__GKMatchmaker_activateGroupActivityWithHandler___block_invoke;
    v7[3] = &unk_1E646E098;
    id v8 = v4;
    [v5 activateWithGame:v6 completionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __49__GKMatchmaker_activateGroupActivityWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)changeGroupActivityStateToGameStarted
{
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"changeGroupActivityStateToGameStarted"])
  {
    id v3 = [(GKMatchmaker *)self groupActivityManager];
    [v3 startGame];
  }
}

- (void)endGroupActivity
{
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"endGroupActivity"])
  {
    id v3 = [(GKMatchmaker *)self groupActivityManager];
    [v3 endWithCompletionHandler:&__block_literal_global_25];
  }
}

void __32__GKMatchmaker_endGroupActivity__block_invoke()
{
  if (!os_log_GKGeneral) {
    id v0 = GKOSLoggers();
  }
  v1 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_INFO, "endGroupActivity completed.", v2, 2u);
  }
}

- (void)playerDisconnected:(id)a3
{
  id v5 = a3;
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"playerDisconnected"])
  {
    id v4 = [(GKMatchmaker *)self groupActivityManager];
    [v4 playerDisconnectWithPlayer:v5 completionHandler:&__block_literal_global_130_0];
  }
}

void __35__GKMatchmaker_playerDisconnected___block_invoke()
{
  if (!os_log_GKGeneral) {
    id v0 = GKOSLoggers();
  }
  v1 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_INFO, "playerDisconnected completed.", v2, 2u);
  }
}

- (id)sharingControllerItemProvider
{
  id v2 = [(GKMatchmaker *)self groupActivityManager];
  id v3 = +[GKGame currentGame];
  id v8 = 0;
  id v4 = [v2 sharingControllerItemProviderWithGame:v3 error:&v8];
  id v5 = v8;

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker sharingControllerItemProvider]();
    }
  }

  return v4;
}

- (void)leaveGroupActivity
{
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"leaveGroupActivity"])
  {
    id v3 = [(GKMatchmaker *)self groupActivityManager];
    [v3 leaveWithCompletionHandler:&__block_literal_global_135];
  }
}

void __34__GKMatchmaker_leaveGroupActivity__block_invoke()
{
  if (!os_log_GKGeneral) {
    id v0 = GKOSLoggers();
  }
  v1 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_INFO, "leaveGroupActivity completed", v2, 2u);
  }
}

- (void)resetGroupActivity
{
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"resetGroupActivity"])
  {
    id v3 = [(GKMatchmaker *)self groupActivityManager];
    [v3 resetWithCompletionHandler:&__block_literal_global_140];
  }
}

void __34__GKMatchmaker_resetGroupActivity__block_invoke()
{
  if (!os_log_GKGeneral) {
    id v0 = GKOSLoggers();
  }
  v1 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_INFO, "resetGroupActivity completed.", v2, 2u);
  }
}

- (void)sendGroupActivityInviteTo:(id)a3 participantID:(id)a4 pushToken:(id)a5
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"groupActivityInvitePlayer"])
  {
    v13[0] = @"player";
    v13[1] = @"pushToken";
    v14[0] = v8;
    v14[1] = v10;
    v13[2] = @"participantIdentifier";
    v14[2] = v9;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"GKGroupActivityPlayerToInviteNotification" object:0 userInfo:v11];
  }
}

- (void)lookForGroupActivities
{
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"lookForGroupActivities"])
  {
    id v3 = [(GKMatchmaker *)self groupActivityManager];
    [v3 startLookingForSessions];
  }
}

- (void)showSharePlayMatchDeclinedToJoinAlertWithReason:(int64_t)a3
{
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"showSharePlayMatchDeclinedToJoinAlertWithReason"])
  {
    id v4 = +[GCFLocalizedStrings SHAREPLAY_DECLINE_UNKNOWN];
    id v5 = +[GCFLocalizedStrings SHAREPLAY_DECLINE_UNKNOWN_MESSAGE];
    switch(a3)
    {
      case 1:
        uint64_t v6 = +[GCFLocalizedStrings SHAREPLAY_DECLINE_GAME_IS_FULL];

        uint64_t v7 = +[GCFLocalizedStrings SHAREPLAY_DECLINE_GAME_IS_FULL_MESSAGE];

        if (!os_log_GKGeneral) {
          id v8 = GKOSLoggers();
        }
        id v9 = os_log_GKTrace;
        if (!os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        __int16 v31 = 0;
        id v10 = "showSharePlayMatchFullAlert";
        id v11 = (uint8_t *)&v31;
        goto LABEL_16;
      case 2:
        uint64_t v6 = +[GCFLocalizedStrings SHAREPLAY_DECLINE_GAME_HAS_STARTED];

        uint64_t v7 = +[GCFLocalizedStrings SHAREPLAY_DECLINE_GAME_HAS_STARTED_MESSAGE];

        if (!os_log_GKGeneral) {
          id v14 = GKOSLoggers();
        }
        id v9 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v30 = 0;
          id v10 = "showSharePlayGameHasStartedAlert";
          id v11 = v30;
LABEL_16:
          _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
        }
        goto LABEL_17;
      case 3:
        if (!os_log_GKGeneral) {
          id v21 = GKOSLoggers();
        }
        v22 = os_log_GKMatch;
        if (!os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO)) {
          break;
        }
        __int16 v29 = 0;
        id v23 = "Previously joined. Sorry but you cannot join at this time since you have previously joined this session. P"
              "lease try in the next session.";
        uint64_t v24 = (uint8_t *)&v29;
        goto LABEL_32;
      case 4:
        if (!os_log_GKGeneral) {
          id v25 = GKOSLoggers();
        }
        v22 = os_log_GKMatch;
        if (!os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO)) {
          break;
        }
        *(_WORD *)int v28 = 0;
        id v23 = "Game over. Sorry but you cannot join at this time since this game is over. Please try in the next session.";
        uint64_t v24 = v28;
LABEL_32:
        _os_log_impl(&dword_1C2D22000, v22, OS_LOG_TYPE_INFO, v23, v24, 2u);
        break;
      default:
        if (!os_log_GKGeneral) {
          id v12 = GKOSLoggers();
        }
        int v13 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "showSharePlayUnknownAlert", buf, 2u);
        }
        uint64_t v7 = (uint64_t)v5;
        uint64_t v6 = (uint64_t)v4;
LABEL_17:
        SEL v15 = NSSelectorFromString(&cfstr_Showalertwitht.isa);
        id v16 = +[GKLocalPlayer local];
        char v17 = objc_opt_respondsToSelector();

        if (v17)
        {
          uint64_t v18 = +[GKLocalPlayer local];
          [v18 _gkPerformSelector:v15 withObject:v6 withObject:v7];
        }
        else
        {
          if (!os_log_GKGeneral) {
            id v19 = GKOSLoggers();
          }
          uint64_t v20 = os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "showSharePlayMatchFullAlert failed since localPlayer does not respond to selector showAlertWithTitle:andMessage:", v26, 2u);
          }
        }
        id v5 = (void *)v7;
        id v4 = (void *)v6;
        break;
    }
  }
}

- (void)setInviteHandler:(void *)inviteHandler
{
  if (self->_inviteHandler != inviteHandler)
  {
    id v4 = (void *)[inviteHandler copy];
    id v5 = self->_inviteHandler;
    self->_inviteHandler = v4;

    [(GKMatchmaker *)self updateNearbyAdvertising];
    [(GKMatchmaker *)self lookForInvite];
  }
}

- (void)respondToHostedInvite:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  id v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v5;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Matchmaking respond to hosted invite: %@", buf, 0xCu);
  }
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 628, "-[GKMatchmaker respondToHostedInvite:completionHandler:]");
  id v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

  id v11 = [GKTransportContext alloc];
  id v12 = +[GKGame currentGame];
  int v13 = [v12 internal];
  id v14 = [v13 supportedTransports];
  SEL v15 = [(GKTransportContext *)v11 initWithSupportedTransports:v14];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke;
  v22[3] = &unk_1E646D9A0;
  id v16 = v5;
  id v23 = v16;
  char v17 = v15;
  uint64_t v24 = v17;
  id v18 = v10;
  id v25 = v18;
  [v18 perform:v22];
  if (v6)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_163;
    v19[3] = &unk_1E646DC30;
    id v21 = v6;
    id v20 = v18;
    [v20 notifyOnMainQueueWithBlock:v19];
  }
}

void __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 multiplayerService];
  id v6 = [*(id *)(a1 + 32) internal];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_2;
  v9[3] = &unk_1E646F508;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  id v8 = v3;
  [v5 acceptGameInvite:v6 transportContext:v7 handler:v9];
}

void __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_2_cold_1();
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) isCancelled])
    {
      uint64_t v7 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v9 = +[GKLocalPlayer localPlayer];
    [v9 setAcceptedInvite:0];
  }
  [*(id *)(a1 + 40) setError:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_163(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)newMatch
{
  id v3 = [GKMatch alloc];

  return [(GKMatch *)v3 initWithMatchmaker:self];
}

- (void)matchForNearbyInvite:(id)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(GKMatchmaker *)self setInviteApproach:3];
  id v8 = [v6 sender];
  id v9 = [v8 internal];
  id v10 = [v9 playerID];
  [(GKMatchmaker *)self setInviterPlayerID:v10];

  if (!os_log_GKGeneral) {
    id v11 = GKOSLoggers();
  }
  id v12 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Match for nearby invite: %@", buf, 0xCu);
  }
  id v13 = [(GKMatchmaker *)self newMatch];
  id v14 = +[GKDaemonProxy proxyForLocalPlayer];
  SEL v15 = [v14 multiplayerService];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__GKMatchmaker_matchForNearbyInvite_handler___block_invoke;
  v19[3] = &unk_1E646F530;
  id v20 = v13;
  id v21 = self;
  id v22 = v6;
  id v23 = v7;
  id v16 = v7;
  id v17 = v6;
  id v18 = v13;
  [v15 fetchTransportOverrideWithHandler:v19];
}

void __45__GKMatchmaker_matchForNearbyInvite_handler___block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1[4];
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 transportContext];
  [v10 updateWithForceEnabledTransports:v9 forceDisabledTransports:v8 andHealthMonitorEnabled:a4];

  id v11 = [a1[4] nearbyConnectionData];
  [a1[5] acceptNearbyInvite:a1[6] connectionData:v11];
  id v12 = a1[4];
  id v13 = [a1[6] sender];
  id v14 = [a1[6] internal];
  SEL v15 = [v14 peerBlob];
  [v12 connectToNearbyPlayer:v13 withConnectionData:v15];

  id v16 = +[GKLocalPlayer localPlayer];
  [v16 setAcceptedInvite:0];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__GKMatchmaker_matchForNearbyInvite_handler___block_invoke_2;
  v17[3] = &unk_1E646DC30;
  id v19 = a1[7];
  id v18 = a1[4];
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

uint64_t __45__GKMatchmaker_matchForNearbyInvite_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

- (void)matchForRemoteInvite:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sender];
  id v9 = [v8 internal];
  id v10 = [v9 playerID];
  [(GKMatchmaker *)self setInviterPlayerID:v10];

  if (!os_log_GKGeneral) {
    id v11 = GKOSLoggers();
  }
  id v12 = (id)os_log_GKMatch;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v6 internal];
    int v14 = [v13 isNearbyInvite];
    if (v14)
    {
      SEL v15 = [NSString stringWithFormat:@" nearby"];
    }
    else
    {
      SEL v15 = &stru_1F1E47DF8;
    }
    *(_DWORD *)buf = 138412546;
    id v43 = v15;
    __int16 v44 = 2112;
    id v45 = v6;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Match for remote%@ invite: %@", buf, 0x16u);
    if (v14) {
  }
    }
  id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 689, "-[GKMatchmaker matchForRemoteInvite:completionHandler:]");
  id v17 = +[GKDispatchGroup dispatchGroupWithName:v16];

  id v18 = [MEMORY[0x1E4F29128] UUID];
  id v19 = NSString;
  id v20 = [v18 UUIDString];
  id v21 = [v19 stringWithFormat:@"com.apple.GameKit.matchmaker.remote.%@", v20];
  id v22 = (const char *)[v21 UTF8String];

  if (!os_log_GKGeneral) {
    id v23 = GKOSLoggers();
  }
  uint64_t v24 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v43 = (void *)v22;
    _os_log_impl(&dword_1C2D22000, v24, OS_LOG_TYPE_INFO, "Created an invitee inner queue with label: %s", buf, 0xCu);
  }
  dispatch_queue_t v25 = dispatch_queue_create(v22, 0);
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  id v27 = [(GKMatchmaker *)self invitationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke;
  block[3] = &unk_1E646F620;
  id v35 = v18;
  id v36 = v17;
  dispatch_queue_t v37 = v25;
  int v38 = self;
  dispatch_semaphore_t v39 = v26;
  id v40 = v6;
  id v41 = v7;
  id v28 = v7;
  id v29 = v6;
  uint64_t v30 = v26;
  __int16 v31 = v25;
  id v32 = v17;
  id v33 = v18;
  dispatch_async(v27, block);
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = v3;
    id v6 = [v4 UUIDString];
    *(_DWORD *)buf = 138412290;
    id v45 = v6;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "Entering invitee queue with inner UUID: %@", buf, 0xCu);
  }
  [*(id *)(a1 + 40) enter];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_176;
  block[3] = &unk_1E646F558;
  id v7 = *(NSObject **)(a1 + 48);
  void block[4] = *(void *)(a1 + 56);
  id v42 = *(id *)(a1 + 40);
  id v43 = *(id *)(a1 + 64);
  dispatch_async(v7, block);
  [*(id *)(a1 + 40) enter];
  id v8 = *(NSObject **)(a1 + 48);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_177;
  v36[3] = &unk_1E646F490;
  id v37 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  id v38 = v9;
  uint64_t v39 = v10;
  id v40 = *(id *)(a1 + 72);
  dispatch_async(v8, v36);
  [*(id *)(a1 + 40) enter];
  id v11 = *(NSObject **)(a1 + 48);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_187;
  v32[3] = &unk_1E646F558;
  id v33 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  id v34 = v12;
  uint64_t v35 = v13;
  dispatch_async(v11, v32);
  [*(id *)(a1 + 40) enter];
  int v14 = *(NSObject **)(a1 + 48);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_195;
  v27[3] = &unk_1E646F490;
  id v28 = *(id *)(a1 + 64);
  id v29 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 56);
  id v30 = v15;
  uint64_t v31 = v16;
  dispatch_async(v14, v27);
  if ([*(id *)(a1 + 40) waitWithTimeout:60.0])
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    id v18 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_INFO, "Timeout handling matchForRemoteInvite.", buf, 2u);
    }
    id v19 = [MEMORY[0x1E4F28C58] userErrorForCode:28 description:@"Connection timeout."];
    [*(id *)(a1 + 40) setError:v19];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v20 = GKOSLoggers();
    }
    id v21 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v21, OS_LOG_TYPE_INFO, "Done handling matchForRemoteInvite.", buf, 2u);
    }
  }
  id v22 = *(void **)(a1 + 80);
  if (v22)
  {
    id v23 = *(void **)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_208;
    v24[3] = &unk_1E646DC30;
    id v26 = v22;
    id v25 = *(id *)(a1 + 40);
    [v23 notifyOnMainQueueWithBlock:v24];
  }
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_176(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2;
  v3[3] = &unk_1E646F010;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 loadConnectivitySettingsWithCompletionHandler:v3];
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setError:v3];
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_cold_1();
    }
  }
  [*(id *)(a1 + 32) leave];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_177(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id v2 = [*(id *)(a1 + 40) error];

  if (v2)
  {
    [*(id *)(a1 + 40) leave];
    id v3 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v3);
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) match];

    if (!v4)
    {
      id v5 = (void *)[*(id *)(a1 + 48) newMatch];
      [*(id *)(a1 + 48) setMatch:v5];
    }
    id v6 = +[GKDaemonProxy proxyForLocalPlayer];
    id v7 = [v6 multiplayerService];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_178;
    v9[3] = &unk_1E646F580;
    id v8 = *(void **)(a1 + 56);
    void v9[4] = *(void *)(a1 + 48);
    id v10 = v8;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 32);
    [v7 fetchTransportOverrideWithHandler:v9];
  }
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_178(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = (id *)(a1 + 32);
  id v8 = *(void **)(a1 + 32);
  id v9 = a3;
  id v10 = a2;
  id v11 = [v8 match];
  id v12 = [v11 transportContext];
  [v12 updateWithForceEnabledTransports:v10 forceDisabledTransports:v9 andHealthMonitorEnabled:a4];

  uint64_t v13 = [*v7 match];
  int v14 = [v13 transportContext];
  id v15 = [*(id *)(a1 + 40) internal];
  LODWORD(v12) = [v14 supportsTransportRequiredInTheInvite:v15];

  if (v12)
  {
    [*(id *)(a1 + 48) leave];
    uint64_t v16 = *(NSObject **)(a1 + 56);
    dispatch_semaphore_signal(v16);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    id v18 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_178_cold_2((void **)(a1 + 40), v18, v7);
    }
    if (!os_log_GKGeneral) {
      id v19 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_178_cold_1();
    }
    id v20 = [MEMORY[0x1E4F28C58] userErrorForCode:28 description:@"The Game Center entitlement is required to use multiplayer."];
    [*(id *)(a1 + 48) setError:v20];

    id v21 = +[GKAPIReporter reporter];
    [v21 recordMultiplayerErrorID:@"remoteInviteTransportNotSupported"];

    id v22 = +[GKDaemonProxy proxyForLocalPlayer];
    id v23 = [v22 multiplayerService];
    uint64_t v24 = [*(id *)(a1 + 40) internal];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_186;
    v25[3] = &unk_1E646EC80;
    id v26 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 56);
    [v23 declineGameInvite:v24 reason:6 handler:v25];
  }
}

intptr_t __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_186(uint64_t a1)
{
  [*(id *)(a1 + 32) leave];
  id v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_187(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id v2 = [*(id *)(a1 + 40) error];

  if (v2)
  {
    [*(id *)(a1 + 40) leave];
    id v3 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v3);
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) match];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_3;
    v7[3] = &unk_1E646F5A8;
    int8x16_t v6 = *(int8x16_t *)(a1 + 40);
    id v5 = (id)v6.i64[0];
    int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
    id v9 = *(id *)(a1 + 32);
    [v4 getLocalConnectionDataWithCompletionHandler:v7];
  }
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    int8x16_t v8 = [*(id *)(a1 + 32) match];
    id v9 = [v8 transportContext];
    [v9 updateForInviteAcceptWithConnectionData:v5];
LABEL_4:

    goto LABEL_11;
  }
  if (v6)
  {
    [*(id *)(a1 + 40) setError:v6];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"match:getLocalConnectionDataWithCompletionHandler returned with no data";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v12 = [v10 userErrorForCode:3 userInfo:v11];
    [*(id *)(a1 + 40) setError:v12];
  }
  if (!os_log_GKGeneral) {
    id v13 = GKOSLoggers();
  }
  int v14 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
  {
    if (v5) {
      id v15 = &stru_1F1E47DF8;
    }
    else {
      id v15 = @"(empty data returned)";
    }
    uint64_t v16 = *(void **)(a1 + 32);
    int8x16_t v8 = v14;
    id v9 = [v16 match];
    id v17 = [*(id *)(a1 + 40) error];
    int v18 = 138412802;
    id v19 = v15;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v17;
    _os_log_error_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_ERROR, "Error getting local connection data %@for match %@, error: %@", (uint8_t *)&v18, 0x20u);

    goto LABEL_4;
  }
LABEL_11:
  [*(id *)(a1 + 40) leave];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_195(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id v2 = [*(id *)(a1 + 40) error];

  if (v2)
  {
    [*(id *)(a1 + 40) leave];
    id v3 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v3);
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) internal];
    id v5 = [v4 sessionToken];

    id v6 = [*(id *)(a1 + 56) match];
    id v7 = [*(id *)(a1 + 48) sender];
    [v6 preLoadInviter:v7 sessionToken:v5];

    int8x16_t v8 = +[GKDaemonProxy proxyForLocalPlayer];
    id v9 = [v8 multiplayerService];
    id v10 = [*(id *)(a1 + 48) internal];
    id v11 = [*(id *)(a1 + 56) match];
    id v12 = [v11 transportContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_196;
    v15[3] = &unk_1E646F5F8;
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 32);
    int8x16_t v14 = *(int8x16_t *)(a1 + 48);
    id v13 = (id)v14.i64[0];
    int8x16_t v18 = vextq_s8(v14, v14, 8uLL);
    [v9 acceptGameInvite:v10 transportContext:v12 handler:v15];
  }
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_196(uint64_t a1, void *a2, void *a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_FAULT)) {
      __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_196_cold_1();
    }
    [*(id *)(a1 + 32) setError:v7];
    [*(id *)(a1 + 32) leave];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    id v9 = [v5 responsePlist];
    id v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 48) match];
    [v10 setObject:v11 forKeyedSubscript:@"match"];

    id v12 = +[GKLocalPlayer local];
    [v12 setAcceptedInvite:0];

    if ([*(id *)(a1 + 56) isCancelled])
    {
      id v7 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v13 = GKOSLoggers();
      }
      int8x16_t v14 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        id v15 = v14;
        id v16 = [v5 responsePlist];
        *(_DWORD *)buf = 138412290;
        v75 = v16;
        _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "Invite accept response: %@", buf, 0xCu);
      }
      id v17 = [*(id *)(a1 + 48) match];
      int8x16_t v18 = [v17 playerPushTokens];
      id v19 = [*(id *)(a1 + 56) internal];
      __int16 v20 = [v19 peerPushToken];
      id v21 = [*(id *)(a1 + 56) internal];
      __int16 v22 = [v21 peerID];
      [v18 setObject:v20 forKey:v22];

      id v23 = +[GKReporter reporter];
      [v23 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.allMatchTotal"];

      uint64_t v24 = [*(id *)(a1 + 56) internal];
      LODWORD(v19) = [v24 isMessageBasedInvite];

      id v25 = +[GKReporter reporter];
      id v26 = v25;
      BOOL v27 = v19 == 0;
      if (v19) {
        uint64_t v28 = 2;
      }
      else {
        uint64_t v28 = 1;
      }
      id v29 = GKRTMessageBasedMatchTotal;
      if (v27) {
        id v29 = GKRTPushBasedMatchTotal;
      }
      [v25 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:*v29];

      [*(id *)(a1 + 48) setInviteApproach:v28];
      id v30 = [*(id *)(a1 + 48) match];
      uint64_t v31 = [v30 transportContext];
      [v31 updateAfterAcceptingRemoveInvite:*(void *)(a1 + 56) acceptedResponse:v5];

      id v32 = [*(id *)(a1 + 48) pendingInvitationUpdates];
      id v33 = [*(id *)(a1 + 48) match];
      id v34 = [v33 transportContext];
      uint64_t v35 = [v34 sessionID];
      id v36 = [v32 objectForKeyedSubscript:v35];

      if (v36)
      {
        if (!os_log_GKGeneral) {
          id v37 = GKOSLoggers();
        }
        id v38 = os_log_GKFastSync;
        if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v36;
          _os_log_impl(&dword_1C2D22000, v38, OS_LOG_TYPE_INFO, "Has previous queued update: %@", buf, 0xCu);
        }
        uint64_t v39 = [*(id *)(a1 + 48) match];
        id v40 = [v39 transportContext];
        [v40 updateWithInviteUpdateInfo:v36];

        id v41 = [*(id *)(a1 + 48) pendingInvitationUpdates];
        id v42 = [*(id *)(a1 + 48) match];
        id v43 = [v42 transportContext];
        __int16 v44 = [v43 sessionID];
        [v41 removeObjectForKey:v44];
      }
      if (!os_log_GKGeneral) {
        id v45 = GKOSLoggers();
      }
      uint64_t v46 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v47 = *(void **)(a1 + 48);
        uint64_t v48 = v46;
        v49 = [v47 match];
        __int16 v50 = [v49 transportContext];
        v51 = [v50 peerDictionaries];
        __int16 v52 = [v51 firstObject];
        *(_DWORD *)buf = 138412290;
        v75 = v52;
        _os_log_impl(&dword_1C2D22000, v48, OS_LOG_TYPE_INFO, "Accepting peer's connectionData : %@", buf, 0xCu);
      }
      if (!os_log_GKGeneral) {
        id v53 = GKOSLoggers();
      }
      __int16 v54 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2D22000, v54, OS_LOG_TYPE_INFO, "Accepted match for remote invite, starting connection...", buf, 2u);
      }
      v55 = [*(id *)(a1 + 48) match];
      uint64_t v56 = [v55 transportContext];
      char v57 = [v56 inviteeShouldAwaitInviteUpdate];

      if (v57)
      {
        v58 = [*(id *)(a1 + 48) match];
        v59 = [*(id *)(a1 + 56) sender];
        [v58 updateEventQueueForInviter:v59];
      }
      else
      {
        [*(id *)(a1 + 32) enter];
        v60 = [*(id *)(a1 + 48) match];
        v61 = [*(id *)(a1 + 56) sender];
        v73 = v61;
        v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
        v63 = [*(id *)(a1 + 56) internal];
        uint64_t v64 = [v63 version];
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_200;
        v68[3] = &unk_1E646F5D0;
        id v69 = *(id *)(a1 + 32);
        id v65 = v9;
        uint64_t v66 = *(void *)(a1 + 48);
        v67 = *(void **)(a1 + 56);
        id v70 = v65;
        uint64_t v71 = v66;
        id v72 = v67;
        [v60 connectToPlayers:v62 version:v64 invitedByLocalPlayer:0 completionHandler:v68];

        v58 = v69;
      }

      id v7 = 0;
    }
    [*(id *)(a1 + 32) leave];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

uint64_t __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_200(id *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [MEMORY[0x1E4F28C58] userErrorForCode:28 underlyingError:a2];
    [a1[4] setError:v3];
  }
  else
  {
    id v5 = +[GKPreferences shared];
    int v6 = [v5 preemptiveRelay];

    if (!v6) {
      return [a1[4] leave];
    }
    id v3 = [a1[5] objectForKey:@"relay-type"];
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Using preemptive relay, relay-type from response %@", (uint8_t *)&v14, 0xCu);
    }
    if (v3)
    {
      if (!os_log_GKGeneral) {
        id v9 = GKOSLoggers();
      }
      id v10 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "preemptive relay accept response", (uint8_t *)&v14, 2u);
      }
      id v11 = [a1[6] match];
      id v12 = a1[5];
      id v13 = [a1[7] sender];
      [v11 acceptRelayResponse:v12 player:v13];
    }
  }

  return [a1[4] leave];
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_208(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"match"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)matchForInvite:(GKInvite *)invite completionHandler:(void *)completionHandler
{
  v34[1] = *MEMORY[0x1E4F143B8];
  int v6 = invite;
  id v7 = completionHandler;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  id v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    -[GKMatchmaker matchForInvite:completionHandler:]((uint64_t)v6, v9);
  }
  id v10 = +[GKReporter reporter];
  [v10 recordProgramaticInviteTimestamp];

  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 897, "-[GKMatchmaker matchForInvite:completionHandler:]");
  id v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  if (v6)
  {
    if (![(GKInvite *)v6 isCancelled])
    {
      if ([(GKInvite *)v6 isNearby])
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        uint8_t v28[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke;
        v28[3] = &unk_1E646D9A0;
        v28[4] = self;
        id v29 = v6;
        id v30 = v12;
        [v30 perform:v28];

        id v21 = v29;
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_3;
        v25[3] = &unk_1E646D9A0;
        void v25[4] = self;
        id v26 = v6;
        id v27 = v12;
        [v27 perform:v25];

        id v21 = v26;
      }

      if (v7) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    if (!os_log_GKGeneral) {
      id v13 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKMatchmaker matchForInvite:completionHandler:]();
    }
    int v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    id v32 = @"matchForInvite:invite was cancelled";
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = &v32;
    id v17 = &v31;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v18 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      -[GKMatchmaker matchForInvite:completionHandler:]();
    }
    int v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34[0] = @"matchForInvite:invite doesn't exist";
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = (__CFString **)v34;
    id v17 = &v33;
  }
  id v19 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
  __int16 v20 = [v14 userErrorForCode:2 userInfo:v19];
  [v12 setError:v20];

  if (v7)
  {
LABEL_18:
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_5;
    v22[3] = &unk_1E646DC30;
    id v24 = v7;
    id v23 = v12;
    [v23 notifyOnMainQueueWithBlock:v22];
  }
LABEL_19:
}

void __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_2;
  v7[3] = &unk_1E646F648;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 matchForNearbyInvite:v5 handler:v7];
}

uint64_t __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"match"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_4;
  v7[3] = &unk_1E646F648;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 matchForRemoteInvite:v5 completionHandler:v7];
}

uint64_t __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"match"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"match"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)reportResponse:(int64_t)a3 forInvitees:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  id v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v12 = NSNumber;
    id v13 = v11;
    int v14 = [v12 numberWithLong:a3];
    *(_DWORD *)buf = 138412546;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "Matchmaking reports response: %@  for invitees:%@", buf, 0x16u);
  }
  if (self->_recipientResponseHandler)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke;
    block[3] = &unk_1E646F670;
    id v25 = v8;
    id v26 = self;
    int64_t v28 = a3;
    id v27 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (!self->_inviteeResponseHandler)
    {
      if (!os_log_GKGeneral) {
        id v17 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      {
        -[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:]();
        if (!v9) {
          goto LABEL_14;
        }
      }
      else if (!v9)
      {
        goto LABEL_14;
      }
      v9[2](v9);
      goto LABEL_14;
    }
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 950, "-[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:]");
    uint64_t v16 = +[GKDispatchGroup dispatchGroupWithName:v15];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_2;
    v20[3] = &unk_1E646E7B8;
    id v21 = v8;
    __int16 v22 = self;
    int64_t v23 = a3;
    [v16 perform:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E646D7A0;
    id v19 = v9;
    [v16 notifyOnMainQueueWithBlock:v18];
  }
LABEL_14:
}

uint64_t __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "recipientResponseHandler", (void)v11);

        if (v8)
        {
          id v9 = [*(id *)(a1 + 40) recipientResponseHandler];
          v9[2](v9, v7, *(void *)(a1 + 56));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E646F670;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  uint64_t v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "inviteeResponseHandler", (void)v13);

        if (v8)
        {
          id v9 = [*(id *)(a1 + 40) inviteeResponseHandler];
          uint64_t v10 = [v7 internal];
          id v11 = [v10 playerID];
          ((void (**)(void, void *, void))v9)[2](v9, v11, *(void *)(a1 + 56));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invitePlayersWithRequest:(id)a3 serverHosted:(BOOL)a4 onlineConnectionData:(id)a5 devicePushTokenMap:(id)a6 isNearbyInvite:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v47 = a4;
  BOOL v48 = a7;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  if (!os_log_GKGeneral) {
    id v16 = GKOSLoggers();
  }
  id v17 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = NSNumber;
    id v19 = v17;
    __int16 v20 = [v18 numberWithBool:v47];
    id v21 = [NSNumber numberWithBool:v48];
    *(_DWORD *)buf = 138412802;
    id v57 = v12;
    __int16 v58 = 2112;
    id v59 = v20;
    __int16 v60 = 2112;
    v61 = v21;
    _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "Invite players with request: %@, hosted: %@, nearby: %@", buf, 0x20u);
  }
  __int16 v22 = [(GKMatchmaker *)self sharePlayInviteeTokensFromProgrammaticInvite];
  uint64_t v23 = [v22 count];

  if (!v23)
  {
    id v33 = [v12 internal];
    [v33 setArchivedSharePlayInviteeTokensFromProgrammaticInvite:0];
    goto LABEL_19;
  }
  if (!os_log_GKGeneral) {
    id v24 = GKOSLoggers();
  }
  id v25 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v26 = NSNumber;
    id v27 = v25;
    int64_t v28 = [(GKMatchmaker *)self sharePlayInviteeTokensFromProgrammaticInvite];
    id v29 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    *(_DWORD *)buf = 138412290;
    id v57 = v29;
    _os_log_impl(&dword_1C2D22000, v27, OS_LOG_TYPE_INFO, "There seems to be some invitees coming from SharePlay. Adding (%@) device push token(s).", buf, 0xCu);
  }
  id v30 = (void *)MEMORY[0x1E4F28DB0];
  __int16 v31 = [(GKMatchmaker *)self sharePlayInviteeTokensFromProgrammaticInvite];
  id v55 = 0;
  id v32 = [v30 archivedDataWithRootObject:v31 requiringSecureCoding:1 error:&v55];
  id v33 = v55;

  if (v32)
  {
    id v34 = [v12 internal];
    [v34 setArchivedSharePlayInviteeTokensFromProgrammaticInvite:v32];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v35 = GKOSLoggers();
    }
    id v36 = (void *)os_log_GKMatch;
    if (!os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    id v34 = v36;
    id v37 = [(GKMatchmaker *)self sharePlayInviteeTokensFromProgrammaticInvite];
    *(_DWORD *)buf = 138412546;
    id v57 = v37;
    __int16 v58 = 2112;
    id v59 = v33;
    _os_log_impl(&dword_1C2D22000, v34, OS_LOG_TYPE_INFO, "failed to archive shareplay invitees from programmatic invite. players: %@ error: %@", buf, 0x16u);
  }
LABEL_18:

LABEL_19:
  id v38 = [(GKMatchmaker *)self match];

  if (!v38)
  {
    id v39 = [(GKMatchmaker *)self newMatch];
    [(GKMatchmaker *)self setMatch:v39];
  }
  id v40 = [(GKMatchmaker *)self match];
  id v41 = [v40 transportContext];
  [v41 updateForInviteInitiationWithOnlineConnectionData:v13];

  id v42 = +[GKDaemonProxy proxyForLocalPlayer];
  id v43 = [v42 multiplayerService];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke;
  v49[3] = &unk_1E646F760;
  v49[4] = self;
  id v50 = v12;
  BOOL v53 = v48;
  BOOL v54 = v47;
  id v51 = v14;
  id v52 = v15;
  id v44 = v15;
  id v45 = v14;
  id v46 = v12;
  [v43 fetchTransportOverrideWithHandler:v49];
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 match];
  id v11 = [v10 transportContext];
  [v11 updateWithForceEnabledTransports:v9 forceDisabledTransports:v8 andHealthMonitorEnabled:a4];

  id v12 = +[GKDaemonProxy proxyForLocalPlayer];
  id v13 = [v12 multiplayerService];
  id v14 = [*(id *)(a1 + 40) internal];
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(unsigned __int8 *)(a1 + 64);
  id v17 = [*(id *)(a1 + 32) match];
  uint64_t v18 = [v17 transportContext];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2;
  v20[3] = &unk_1E646F738;
  id v19 = *(void **)(a1 + 40);
  void v20[4] = *(void *)(a1 + 32);
  char v23 = *(unsigned char *)(a1 + 65);
  id v21 = v19;
  id v22 = *(id *)(a1 + 56);
  [v13 invitePlayersForMatchRequest:v14 devicePushTokenMap:v15 isNearbyInvite:v16 transportContext:v18 handler:v20];
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_cold_1();
    }
  }
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__7;
  void v38[4] = __Block_byref_object_dispose__7;
  id v8 = v6;
  id v39 = v8;
  id v9 = [*(id *)(a1 + 32) match];
  uint64_t v10 = [v5 approachUsed];
  unsigned int v11 = [v10 unsignedIntValue];
  int v12 = *(unsigned __int8 *)(a1 + 56);
  id v13 = [*(id *)(a1 + 40) internal];
  id v14 = [v13 recipients];
  [v9 reportInviteSentWithApproach:v11 isHosted:v12 != 0 recipients:v14];

  uint64_t v15 = [*(id *)(a1 + 32) match];
  uint64_t v16 = [v15 transportContext];
  [v16 updateWithInviteInitiateResponse:v5];

  id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 1027, "-[GKMatchmaker invitePlayersWithRequest:serverHosted:onlineConnectionData:devicePushTokenMap:isNearbyInvite:completionHandler:]_block_invoke");
  uint64_t v18 = +[GKDispatchGroup dispatchGroupWithName:v17];

  if (!*(unsigned char *)(a1 + 56))
  {
    id v19 = [*(id *)(a1 + 32) match];
    __int16 v20 = [v19 transportContext];
    int v21 = [v20 allowEarlyConnection];

    if (v21)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      void v34[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_217;
      v34[3] = &unk_1E646F6C0;
      v34[4] = *(void *)(a1 + 32);
      id v35 = v8;
      id v37 = v38;
      id v36 = v18;
      [v36 perform:v34];
    }
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_218;
  v27[3] = &unk_1E646F710;
  id v22 = v18;
  id v28 = v22;
  id v23 = *(id *)(a1 + 48);
  uint64_t v24 = *(void *)(a1 + 32);
  id v32 = v23;
  uint64_t v29 = v24;
  id v25 = v5;
  id v30 = v25;
  id v33 = v38;
  id v26 = v8;
  id v31 = v26;
  [v22 notifyOnMainQueueWithBlock:v27];

  _Block_object_dispose(v38, 8);
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_217(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) match];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3;
  v9[3] = &unk_1E646F698;
  id v5 = *(id *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v13 = v6;
  id v11 = v7;
  id v12 = v3;
  id v8 = v3;
  [v4 connectToPlayers:MEMORY[0x1E4F1CBF0] version:1 invitedByLocalPlayer:0 completionHandler:v9];
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3_cold_1();
    }
    uint64_t v5 = [MEMORY[0x1E4F28C58] userErrorForCode:28 underlyingError:v3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  [*(id *)(a1 + 40) setError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_218(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) error];
  if (v2
    && (id v3 = (void *)v2,
        [*(id *)(a1 + 32) error],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isGKCompoundError],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    uint64_t v37 = *(void *)(a1 + 64);
    if (v37)
    {
      os_log_t log = [*(id *)(a1 + 40) match];
      id v38 = [*(id *)(a1 + 32) error];
      (*(void (**)(uint64_t, void, os_log_t, void, void *))(v37 + 16))(v37, 0, log, 0, v38);
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v7 = [*(id *)(a1 + 48) invitedUserIDs];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
      id v39 = v6;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v48 + 1) + 8 * v11);
          uint64_t v13 = [*(id *)(a1 + 48) invitedUserIDs];
          id v14 = [v13 objectForKey:v12];
          uint64_t v15 = [v14 integerValue];

          if (v15)
          {
            uint64_t v16 = [*(id *)(a1 + 40) inviteesByUserID];
            id v17 = [v16 objectForKey:v12];

            if (v17)
            {
              if (!os_log_GKGeneral) {
                id v18 = GKOSLoggers();
              }
              id v19 = (void *)os_log_GKMatch;
              if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
              {
                loga = v19;
                int v21 = [v17 internal];
                id v22 = [v21 conciseDescription];
                *(_DWORD *)buf = 138412802;
                uint64_t v53 = v12;
                __int16 v54 = 2112;
                id v55 = v22;
                __int16 v56 = 2048;
                uint64_t v57 = v15;
                _os_log_debug_impl(&dword_1C2D22000, loga, OS_LOG_TYPE_DEBUG, "invite to %@ -- %@ failed with status %ld", buf, 0x20u);

                uint64_t v6 = v39;
              }
              [v6 addObject:v17];
              [*(id *)(a1 + 40) removeInvitee:v17];
            }
          }
          else
          {
            uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
            id v17 = *(void **)(v20 + 40);
            *(void *)(v20 + 40) = 0;
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      id v23 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v23)
      {
        uint64_t v24 = [v23 userInfo];
        id v25 = (void *)[v24 mutableCopy];

        [v25 setObject:v6 forKeyedSubscript:@"FailedPlayers"];
        id v26 = (void *)MEMORY[0x1E4F28C58];
        id v27 = [*(id *)(a1 + 56) domain];
        uint64_t v28 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "code"), v25);
        uint64_t v29 = *(void *)(*(void *)(a1 + 72) + 8);
        id v30 = *(void **)(v29 + 40);
        *(void *)(v29 + 40) = v28;
      }
    }
    id v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 1083, "-[GKMatchmaker invitePlayersWithRequest:serverHosted:onlineConnectionData:devicePushTokenMap:isNearbyInvite:completionHandler:]_block_invoke");
    id v32 = +[GKDispatchGroup dispatchGroupWithName:v31];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    void v45[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_223;
    v45[3] = &unk_1E646D928;
    uint64_t v33 = *(void *)(a1 + 40);
    id v46 = v6;
    uint64_t v47 = v33;
    id v34 = v6;
    [v32 perform:v45];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_4;
    v42[3] = &unk_1E646F6E8;
    v42[4] = *(void *)(a1 + 40);
    id v35 = *(id *)(a1 + 64);
    uint64_t v36 = *(void *)(a1 + 72);
    id v43 = v35;
    uint64_t v44 = v36;
    [v32 notifyOnMainQueueWithBlock:v42];
  }
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_223(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v6 = a1 + 32;
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(void **)(v6 + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3_224;
    v7[3] = &unk_1E646D7A0;
    uint64_t v8 = v3;
    [v5 reportResponse:2 forInvitees:v4 withCompletionHandler:v7];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3_224(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) allInviteesDidRespond]) {
    [*(id *)(a1 + 32) doneMatchmaking];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) match];
    (*(void (**)(uint64_t, void, id, void, void))(v2 + 16))(v2, 0, v3, 0, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

- (void)invitePlayersWithRequest:(id)a3 serverHosted:(BOOL)a4 devicePushTokenMap:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!os_log_GKGeneral) {
    id v13 = GKOSLoggers();
  }
  id v14 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = NSNumber;
    uint64_t v16 = v14;
    id v17 = [v15 numberWithBool:v8];
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v17;
    _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "Invite players with request: %@, hosted: %@", buf, 0x16u);
  }
  id v18 = [v10 internal];
  [v18 setMatchType:v8];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke;
  v22[3] = &unk_1E646F878;
  void v22[4] = self;
  id v23 = v10;
  BOOL v26 = v8;
  id v24 = v11;
  id v25 = v12;
  id v19 = v11;
  id v20 = v12;
  id v21 = v10;
  [v21 loadRecipientsWithCompletionHandler:v22];
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addInvitees:a2];
  id v3 = [*(id *)(a1 + 40) inviteeResponseHandler];
  [*(id *)(a1 + 32) setInviteeResponseHandler:v3];

  uint64_t v4 = [*(id *)(a1 + 40) recipientResponseHandler];
  [*(id *)(a1 + 32) setRecipientResponseHandler:v4];

  if (*(unsigned char *)(a1 + 64))
  {
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    [v5 invitePlayersWithRequest:v6 serverHosted:1 onlineConnectionData:0 devicePushTokenMap:v7 isNearbyInvite:0 completionHandler:v8];
  }
  else
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 1129, "-[GKMatchmaker invitePlayersWithRequest:serverHosted:devicePushTokenMap:completionHandler:]_block_invoke");
    id v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

    id v11 = +[GKPreferences shared];
    char v12 = [v11 fastSyncTransportEnabled];

    if ((v12 & 1) == 0)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2;
      v19[3] = &unk_1E646D928;
      id v13 = *(void **)(a1 + 40);
      void v19[4] = *(void *)(a1 + 32);
      id v20 = v13;
      [v10 perform:v19];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_4;
    v14[3] = &unk_1E646F850;
    void v14[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 40);
    char v18 = *(unsigned char *)(a1 + 64);
    id v16 = *(id *)(a1 + 48);
    [v10 notifyOnMainQueueWithBlock:v14];
  }
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_3;
  v7[3] = &unk_1E646D7A0;
  id v8 = v3;
  id v6 = v3;
  [v5 inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest:v4 handler:v7];
}

uint64_t __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 1144, "-[GKMatchmaker invitePlayersWithRequest:serverHosted:devicePushTokenMap:completionHandler:]_block_invoke_4");
  id v3 = +[GKDispatchGroup dispatchGroupWithName:v2];

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__7;
  id v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__7;
  void v22[4] = __Block_byref_object_dispose__7;
  id v23 = 0;
  uint64_t v4 = [*(id *)(a1 + 32) match];
  char v5 = [v4 transportContext];
  id v6 = [v5 previouslyFetchedOnlineConnectionData];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) match];
    id v8 = [v7 transportContext];
    uint64_t v9 = [v8 previouslyFetchedOnlineConnectionData];
    id v10 = (void *)v25[5];
    void v25[5] = v9;
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_5;
    v21[3] = &unk_1E646F7D8;
    v21[4] = *(void *)(a1 + 32);
    v21[5] = v22;
    v21[6] = &v24;
    [v3 perform:v21];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_227;
  v14[3] = &unk_1E646F828;
  char v18 = v22;
  id v19 = &v24;
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v17 = v11;
  void v14[4] = v12;
  id v15 = v13;
  char v20 = *(unsigned char *)(a1 + 64);
  id v16 = *(id *)(a1 + 48);
  [v3 notifyOnMainQueueWithBlock:v14];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_6;
  v5[3] = &unk_1E646F7B0;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v4 = v3;
  [v6 loadConnectivitySettingsWithCompletionHandler:v5];
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_6_cold_1();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v6 = [*(id *)(a1 + 32) match];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_226;
    v7[3] = &unk_1E646F788;
    objc_copyWeak(&v10, &location);
    int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    id v8 = *(id *)(a1 + 40);
    [v6 getLocalConnectionDataWithCompletionHandler:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v11 || v5)
    {
      if (!v5) {
        goto LABEL_8;
      }
      id v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v8 = v5;
    }
    else
    {
      id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v8 = v11;
    }
    id v9 = v8;
    id v10 = *v7;
    void *v7 = v9;
  }
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_227(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    || (uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) == 0)
  {
    if (!os_log_GKGeneral) {
      id v2 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_227_cold_1();
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_228;
    block[3] = &unk_1E646E4E8;
    id v3 = (id *)v17;
    id v4 = *(id *)(a1 + 56);
    void block[4] = *(void *)(a1 + 32);
    v17[0] = v4;
    v17[1] = *(void *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_229;
    v10[3] = &unk_1E646F800;
    id v3 = (id *)v11;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 32);
    v11[0] = v8;
    v11[1] = v9;
    char v15 = *(unsigned char *)(a1 + 80);
    uint64_t v14 = *(void *)(a1 + 72);
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    [v7 inviteAnyNearbyPlayersViaGCSWithRequest:v8 onlineConnectionData:v5 handler:v10];
  }
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_228(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) match];
  (*(void (**)(uint64_t, void, id, void, void))(v2 + 16))(v2, 0, v3, 0, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_229(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v3;
    id v6 = [v4 internal];
    id v7 = [v6 recipients];
    int v23 = 138412290;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "Rest of the players in the request: %@", (uint8_t *)&v23, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) internal];
  uint64_t v9 = [v8 recipientPlayerIDs];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 40) invitedInvitees];
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    id v13 = [*(id *)(a1 + 32) internal];
    uint64_t v14 = [v13 recipientPlayerIDs];
    char v15 = [v12 setWithArray:v14];
    [v11 unionSet:v15];

    if (!os_log_GKGeneral) {
      id v16 = GKOSLoggers();
    }
    id v17 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      char v18 = *(void **)(a1 + 32);
      id v19 = v17;
      char v20 = [v18 internal];
      int v23 = 138412290;
      uint64_t v24 = v20;
      _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "Invite non-nearby players with request: %@", (uint8_t *)&v23, 0xCu);
    }
    [*(id *)(a1 + 40) invitePlayersWithRequest:*(void *)(a1 + 32) serverHosted:*(unsigned __int8 *)(a1 + 72) onlineConnectionData:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) devicePushTokenMap:*(void *)(a1 + 48) isNearbyInvite:0 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v21 = *(void *)(a1 + 56);
    if (v21)
    {
      id v22 = [*(id *)(a1 + 40) match];
      (*(void (**)(uint64_t, void, void *, void, void))(v21 + 16))(v21, 0, v22, 0, 0);
    }
  }
}

- (void)addInvitees:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GKMatchmaker *)self inviteesByUserID];

  if (v5)
  {
    id v6 = [(GKMatchmaker *)self inviteesByUserID];
    id v7 = (void *)[v6 mutableCopy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "internal", (void)v18);
          char v15 = [v14 playerID];

          if (v15) {
            [v7 setObject:v13 forKeyedSubscript:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v16 = v7;
  }
  else
  {
    id v16 = [v4 _gkMapDictionaryWithKeyPath:@"internal.playerID"];
    id v7 = v16;
  }
  id v17 = objc_msgSend(v16, "copy", (void)v18);
  [(GKMatchmaker *)self setInviteesByUserID:v17];
}

- (void)sendMatchmakingRequest:(id)a3 forMatch:(id)a4 rematchID:(id)a5 serverHosted:(BOOL)a6 playerCount:(int64_t)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v37 = a5;
  id v15 = a8;
  if (!os_log_GKGeneral) {
    id v16 = GKOSLoggers();
  }
  id v17 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    long long v18 = NSNumber;
    long long v19 = v17;
    long long v20 = [v18 numberWithInteger:a7];
    *(_DWORD *)buf = 138412802;
    id v45 = v13;
    __int16 v46 = 2112;
    id v47 = v14;
    __int16 v48 = 2112;
    long long v49 = v20;
    _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "Matchmaking _request: %@, match %@, playerCount: %@", buf, 0x20u);
  }
  long long v21 = +[GKDaemonProxy proxyForLocalPlayer];
  id v22 = [v21 utilityService];
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "minPlayers"));
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "maxPlayers"));
  [v22 recordMatchStart:@"host" minPlayers:v23 maxPlayers:v24];

  uint64_t v25 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v26 = [v25 utilityService];
  id v27 = v26;
  if (v10) {
    id v28 = @"thirdParty";
  }
  else {
    id v28 = @"firstParty";
  }
  [v26 recordMatchServer:v28];

  id v29 = +[GKDaemonProxy proxyForLocalPlayer];
  id v30 = [v29 multiplayerService];
  uint64_t v31 = [v13 internal];
  id v32 = [v14 transportContext];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke;
  v38[3] = &unk_1E646F9E0;
  BOOL v43 = v10;
  id v39 = v14;
  id v40 = v13;
  id v41 = self;
  id v42 = v15;
  id v33 = v15;
  id v34 = v13;
  id v35 = v14;
  [v30 getPlayersForMatchRequest:v31 playerCount:a7 rematchID:v37 transportContext:v32 handler:v38];
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v37 = a2;
  id v36 = a3;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 1257, "-[GKMatchmaker sendMatchmakingRequest:forMatch:rematchID:serverHosted:playerCount:completionHandler:]_block_invoke");
  id v38 = +[GKDispatchGroup dispatchGroupWithName:v5];

  if (v36)
  {
    id v6 = v38;
    objc_msgSend(v38, "setError:");
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Multiplayer Service getPlayersForMatchRequest returned with response: %@", (uint8_t *)&buf, 0xCu);
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v9 = [v37 matches];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v58 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          id v14 = *(void **)(a1 + 32);
          id v15 = [v13 objectForKeyedSubscript:@"properties"];
          id v16 = [v13 objectForKeyedSubscript:@"player-id"];
          [v14 updateProperties:v15 playerID:v16];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v10);
    }

    if (*(unsigned char *)(a1 + 64))
    {
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_248;
      v54[3] = &unk_1E646D928;
      id v55 = v37;
      id v56 = v38;
      [v56 perform:v54];
    }
    else
    {
      id v17 = [v37 matches];
      long long v18 = (void *)MEMORY[0x1E4F28F60];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_258;
      v52[3] = &unk_1E646F8A0;
      id v53 = *(id *)(a1 + 32);
      long long v19 = [v18 predicateWithBlock:v52];
      long long v20 = [v17 filteredArrayUsingPredicate:v19];
      [v37 setMatches:v20];

      [*(id *)(a1 + 32) setAutomatchPlayerCount:0];
      long long v21 = [*(id *)(a1 + 32) transportContext];
      [v21 updateForMatchResponse:v37 serverHosted:*(unsigned __int8 *)(a1 + 64)];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_263;
      aBlock[3] = &unk_1E646F940;
      id v47 = *(id *)(a1 + 32);
      id v22 = v37;
      id v48 = v22;
      id v49 = *(id *)(a1 + 40);
      id v23 = v38;
      uint64_t v24 = *(void *)(a1 + 48);
      id v50 = v23;
      uint64_t v51 = v24;
      uint64_t v25 = _Block_copy(aBlock);
      uint64_t v26 = [*(id *)(a1 + 32) transportContext];
      LOBYTE(v22) = [v26 shouldDelayConnectionForMatchResponse:v22];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v62 = 0x3032000000;
      v63 = __Block_byref_object_copy__7;
      uint64_t v64 = __Block_byref_object_dispose__7;
      dispatch_get_current_queue();
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_282;
      v42[3] = &unk_1E646F9B8;
      char v45 = (char)v22;
      id v27 = v25;
      id v43 = v27;
      p_long long buf = &buf;
      [v23 perform:v42];

      _Block_object_dispose(&buf, 8);
    }
    id v6 = v38;
  }
  id v28 = [v6 error];
  BOOL v29 = v28 == 0;

  if (!v29)
  {
    id v30 = [v38 error];
    uint64_t v31 = [v30 getUnderlyingErrorWithServerStatusCode:5003];

    if (v31)
    {
      if (!os_log_GKGeneral) {
        id v32 = GKOSLoggers();
      }
      id v33 = (void *)os_log_GKDeveloper;
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_cold_1(v33, v31);
      }
    }
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_287;
  v39[3] = &unk_1E646E578;
  id v34 = *(void **)(a1 + 56);
  v39[4] = *(void *)(a1 + 48);
  id v40 = v38;
  id v41 = v34;
  id v35 = v38;
  [v35 notifyOnMainQueueWithBlock:v39];
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_248(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [*(id *)(a1 + 32) matches];
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v19 + 1) + 8 * i) objectForKeyedSubscript:@"player-id"];
        id v8 = +[GKLocalPlayer local];
        uint64_t v9 = [v8 internal];
        uint64_t v10 = [v9 playerID];
        char v11 = [v7 isEqualToString:v10];

        if ((v11 & 1) == 0) {
          [v14 addObject:v7];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2;
  v16[3] = &unk_1E646DC78;
  id v17 = *(id *)(a1 + 40);
  id v18 = v13;
  id v12 = v13;
  +[GKPlayer loadPlayersForLegacyIdentifiers:v14 withCompletionHandler:v16];
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (+[GKMatchmaker canPlayMultiplayerGameWithPlayers:v5])
    {
      id v6 = 0;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v7 = GKOSLoggers();
      }
      id v8 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_cold_1(v8);
      }
      id v6 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
    }
  }
  if ([v6 code] != 10)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"count"];

    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"players"];
  }
  [*(id *)(a1 + 32) setError:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_258(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"player-id"];
  id v5 = +[GKLocalPlayer local];
  id v6 = [v5 internal];
  id v7 = [v6 playerID];
  int v8 = [v4 isEqualToString:v7];

  uint64_t v9 = [v3 objectForKeyedSubscript:@"client-data"];

  uint64_t v10 = [*(id *)(a1 + 32) transportContext];
  char v11 = [v10 representedPlayerIDs];
  BOOL v12 = ([v11 containsObject:v4] & 1) != 0 || objc_msgSend(v9, "count") == 0;

  if (!os_log_GKGeneral) {
    id v13 = GKOSLoggers();
  }
  id v14 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412802;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v12;
    _os_log_debug_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_DEBUG, "Excluding matched playerID: %@, isLocalPlayer: %d, isRepresentedPlayer: %d", (uint8_t *)&v16, 0x18u);
  }

  return (v8 | v12) ^ 1u;
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_263(uint64_t a1, void *a2)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) transportContext];
  int v5 = [v4 shouldSendInviteUpdate];

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    id v7 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "Sending invite update to participants in the lobby channel.", buf, 2u);
    }
    int v8 = +[GKDaemonProxy proxyForLocalPlayer];
    uint64_t v9 = [v8 multiplayerService];
    uint64_t v10 = [*(id *)(a1 + 32) transportContext];
    char v11 = [v10 formAnInviteUpdate];
    [v9 sendInvitationUpdate:v11 handler:&__block_literal_global_266_0];
  }
  v61 = v3;
  id v65 = [MEMORY[0x1E4F1CA48] array];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v62 = a1;
  id obj = [*(id *)(a1 + 40) matches];
  uint64_t v12 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    LODWORD(v14) = 0;
    uint64_t v66 = *(void *)v81;
    int v15 = 1;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v81 != v66) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        __int16 v18 = [v17 objectForKey:@"num-players"];
        int v19 = v18;
        int v20 = v15;
        if (v18) {
          int v21 = [v18 intValue];
        }
        else {
          int v21 = 1;
        }
        uint64_t v22 = [v17 objectForKey:@"client-data"];
        id v23 = [v22 objectForKey:@"match-version"];
        int v24 = [v23 integerValue];

        if (v24 >= v20) {
          int v15 = v20;
        }
        else {
          int v15 = v24;
        }
        uint64_t v25 = [v17 objectForKey:@"player-id"];
        if (v25) {
          [v65 addObject:v25];
        }
        uint64_t v14 = (v21 + v14);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
    LOBYTE(v15) = 1;
  }

  if (!os_log_GKGeneral) {
    id v26 = GKOSLoggers();
  }
  id v27 = (void *)os_log_GKMatch;
  id v28 = v61;
  uint64_t v29 = v62;
  id v30 = v65;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = *(void **)(v62 + 32);
    id v32 = v27;
    id v33 = [v31 transportContext];
    id v34 = [v33 peerDictionaries];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v86 = (uint64_t)v34;
    _os_log_impl(&dword_1C2D22000, v32, OS_LOG_TYPE_INFO, "Using peerDictionaries: %@", buf, 0xCu);
  }
  id v35 = [*(id *)(v62 + 48) guestPlayers];
  if ([v35 count])
  {
    if (!os_log_GKGeneral) {
      id v36 = GKOSLoggers();
    }
    id v37 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v38 = v37;
      uint64_t v39 = [v35 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v86 = v39;
      _os_log_impl(&dword_1C2D22000, v38, OS_LOG_TYPE_INFO, "Connecting to %lu guest players", buf, 0xCu);
    }
    long long v79 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v76 = 0u;
    id obja = v35;
    id v40 = v35;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v84 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v77 != v43) {
            objc_enumerationMutation(v40);
          }
          char v45 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          if (!os_log_GKGeneral) {
            id v46 = GKOSLoggers();
          }
          id v47 = (void *)os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            id v48 = v47;
            id v49 = [v45 internal];
            id v50 = [v49 debugDescription];
            *(_DWORD *)long long buf = 138412290;
            uint64_t v86 = (uint64_t)v50;
            _os_log_impl(&dword_1C2D22000, v48, OS_LOG_TYPE_INFO, "Connecting to guest player: %@", buf, 0xCu);

            uint64_t v29 = v62;
          }
          uint64_t v51 = *(void **)(v29 + 32);
          id v52 = +[GKLocalPlayer local];
          [v51 connectToGuestPlayer:v45 withHostPlayer:v52];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v76 objects:v84 count:16];
      }
      while (v42);
    }

    id v28 = v61;
    id v35 = obja;
    id v30 = v65;
  }
  if ([v30 count])
  {
    id v53 = *(void **)(v29 + 56);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_273;
    v67[3] = &unk_1E646F918;
    id v68 = v30;
    id v69 = *(id *)(v29 + 56);
    __int16 v54 = v28;
    uint64_t v55 = *(void *)(v29 + 64);
    id v73 = v54;
    uint64_t v70 = v55;
    id v71 = *(id *)(v29 + 32);
    char v75 = v15;
    id v72 = *(id *)(v29 + 40);
    int v74 = v14;
    [v53 perform:v67];
  }
  else
  {
    id v56 = [*(id *)(v29 + 48) guestPlayers];
    uint64_t v57 = [v56 count];

    if (v57)
    {
      if (!os_log_GKGeneral) {
        id v58 = GKOSLoggers();
      }
      long long v59 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v86) = v14;
        _os_log_impl(&dword_1C2D22000, v59, OS_LOG_TYPE_INFO, "GKMatchMaker has no players to load but we have guest players. Call completion handler with matchedPlayerCount: %i", buf, 8u);
      }
      long long v60 = [NSNumber numberWithUnsignedInt:v14];
      [*(id *)(v29 + 56) setObject:v60 forKeyedSubscript:@"count"];

      [*(id *)(v29 + 56) setObject:*(void *)(v29 + 32) forKeyedSubscript:@"match"];
      v28[2](v28);
    }
  }
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_264(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2_cold_1();
    }
  }
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_273(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_273_cold_1();
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_274;
  v10[3] = &unk_1E646F8F0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v3;
  id v17 = *(id *)(a1 + 72);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = *(void **)(a1 + 56);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  char v19 = *(unsigned char *)(a1 + 84);
  id v15 = *(id *)(a1 + 64);
  int v18 = *(_DWORD *)(a1 + 80);
  id v9 = v3;
  +[GKPlayer loadPlayersForLegacyIdentifiers:v5 withCompletionHandler:v10];
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_274(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    goto LABEL_2;
  }
  if (+[GKMatchmaker canPlayMultiplayerGameWithPlayers:v5])
  {
    goto LABEL_13;
  }
  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  id v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
    __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_274_cold_2(v11);
  }
  id v6 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
  if (v6)
  {
LABEL_2:
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_274_cold_1();
    }
    [*(id *)(a1 + 32) setError:v6];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    int v8 = +[GKDaemonProxy proxyForLocalPlayer];
    id v9 = [v8 utilityService];
    [v9 completeMatchRecording:@"failure" matchType:0];

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
LABEL_13:
    id v12 = +[GKReporter reporter];
    objc_msgSend(v12, "reportEvent:type:count:", @"com.apple.GameKit.multiplayer.realtime.connectionResult", @"realtime.allMatchTotal", objc_msgSend(v5, "count"));

    uint64_t v13 = +[GKReporter reporter];
    objc_msgSend(v13, "reportEvent:type:count:", @"com.apple.GameKit.multiplayer.realtime.connectionResult", @"realtime.autoMatchTotal", objc_msgSend(v5, "count"));

    id v14 = +[GKDaemonProxy proxyForLocalPlayer];
    id v15 = [v14 utilityService];
    id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    [v15 recordActiveDevices:v16];

    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    int v18 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v39 = v19;
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_INFO, "matched playerIDs: %@, players: %@", buf, 0x16u);
    }
    int v20 = [*(id *)(a1 + 48) autoMatchedPlayers];
    int v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = [v5 _gkPlayersIDsFromPlayers];
    id v23 = [v21 setWithArray:v22];
    [v20 unionSet:v23];

    int v24 = *(void **)(a1 + 56);
    uint64_t v25 = [v5 _gkPlayersIDsFromPlayers];
    id v26 = [*(id *)(a1 + 48) allInvitedInvitees];
    id v27 = [v26 allObjects];
    [v24 syncPlayers:v25 forJoinType:4 toInvitees:v27];

    id v28 = *(void **)(a1 + 56);
    uint64_t v29 = *(unsigned __int8 *)(a1 + 92);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    uint8_t v30[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278;
    v30[3] = &unk_1E646F8C8;
    id v31 = *(id *)(a1 + 32);
    id v35 = *(id *)(a1 + 72);
    id v36 = *(id *)(a1 + 80);
    id v32 = *(id *)(a1 + 64);
    id v33 = *(id *)(a1 + 56);
    id v34 = v5;
    int v37 = *(_DWORD *)(a1 + 88);
    [v28 connectToPlayers:v34 version:v29 invitedByLocalPlayer:0 completionHandler:v30];

    id v6 = v31;
  }
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    id v5 = [MEMORY[0x1E4F28C58] userErrorForCode:28 underlyingError:v3];

    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278_cold_3();
    }
    [*(id *)(a1 + 32) setError:v5];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) relayPushes];

    if (v7)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      int v8 = [*(id *)(a1 + 40) relayPushes];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v48 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            if (!os_log_GKGeneral) {
              id v14 = GKOSLoggers();
            }
            id v15 = os_log_GKMatch;
            if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v16 = *(void *)(a1 + 48);
              *(_DWORD *)long long buf = 138412290;
              uint64_t v53 = v16;
              _os_log_debug_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_DEBUG, "Relay push for match: %@", buf, 0xCu);
            }
            [*(id *)(a1 + 48) handleRelayPushData:v13 onlyIfPreemptive:0];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v54 count:16];
        }
        while (v10);
      }
    }
    id v17 = +[GKPreferences shared];
    int v18 = [v17 preemptiveRelay];

    if (v18)
    {
      id v41 = [*(id *)(a1 + 56) _gkMapDictionaryWithKeyPath:@"internal.playerID"];
      uint64_t v19 = [*(id *)(a1 + 40) matches];
      if ([v19 count])
      {
        if (!os_log_GKGeneral) {
          id v20 = GKOSLoggers();
        }
        int v21 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
          __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278_cold_2(v21);
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        __int16 v40 = v19;
        id obj = v19;
        uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v44 != v24) {
                objc_enumerationMutation(obj);
              }
              id v26 = *(void **)(*((void *)&v43 + 1) + 8 * j);
              id v27 = [v26 objectForKey:@"player-id"];
              id v28 = [v26 objectForKey:@"relay"];
              uint64_t v29 = v28;
              if (v28 && ([v28 BOOLValue] & 1) != 0
                || (+[GKPreferences shared],
                    id v30 = objc_claimAutoreleasedReturnValue(),
                    int v31 = [v30 forceRelay],
                    v30,
                    v31))
              {
                id v32 = +[GKLocalPlayer local];
                id v33 = [v32 internal];
                id v34 = [v33 playerID];
                uint64_t v35 = [v34 compare:v27];

                if (v35 == -1)
                {
                  id v36 = [v41 objectForKey:v27];
                  if (v36)
                  {
                    if (!os_log_GKGeneral) {
                      id v37 = GKOSLoggers();
                    }
                    id v38 = (void *)os_log_GKMatch;
                    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
                      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278_cold_1(buf, v38, v36, &v53);
                    }
                    [*(id *)(a1 + 48) preemptRelay:v36];
                  }
                }
              }
            }
            uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v23);
        }

        uint64_t v19 = v40;
      }
    }
    uint64_t v39 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
    [*(id *)(a1 + 32) setObject:v39 forKeyedSubscript:@"count"];

    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:@"match"];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_282(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 utilityService];
  v13[0] = @"gk-qr-allocation-delay-base-ms";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_283;
  v8[3] = &unk_1E646F990;
  char v12 = *(unsigned char *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = *(void *)(a1 + 40);
  id v7 = v3;
  [v5 getStoreBagValuesForKeys:v6 handler:v8];
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_283(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_283_cold_3();
    }
  }
  int v8 = [v5 objectForKeyedSubscript:@"gk-qr-allocation-delay-base-ms"];
  id v9 = v8;
  if (v8 && *(unsigned char *)(a1 + 56))
  {
    dispatch_time_t v10 = dispatch_time(0, 1000000 * [v8 integerValue]);
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    char v12 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_283_cold_2((unsigned __int8 *)(a1 + 56), v12);
    }
    uint64_t v13 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_285;
    v18[3] = &unk_1E646F968;
    id v14 = &v19;
    id v19 = v9;
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    dispatch_after(v10, v13, v18);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v15 = GKOSLoggers();
    }
    uint64_t v16 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_283_cold_1((uint64_t)v5, a1, v16);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_284;
    v22[3] = &unk_1E646D7A0;
    id v14 = &v23;
    uint64_t v17 = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v22);
  }
}

uint64_t __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_284(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_285(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "After delay of delayMs: %@", buf, 0xCu);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_286;
  v6[3] = &unk_1E646D7A0;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

uint64_t __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_286(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_287(uint64_t a1)
{
  [*(id *)(a1 + 32) setMatching:0];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "getPlayersForMatchRequest done, set shared matchmaker's matching to NO", v10, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"count"];
  uint64_t v6 = [v5 unsignedIntValue];
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"match"];
  int v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"players"];
  uint64_t v9 = [*(id *)(a1 + 40) error];
  (*(void (**)(uint64_t, uint64_t, void *, void *, void *))(v4 + 16))(v4, v6, v7, v8, v9);
}

- (void)handleMatchRequest:(id)a3 forCurrentMatch:(id)a4 hostedCurrentPlayerCount:(int64_t)a5 serverHosted:(BOOL)a6 rematchID:(id)a7 devicePushToken:(id)a8 completionHandler:(id)a9
{
  BOOL v11 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v34 = a7;
  id v16 = a8;
  id v17 = a9;
  if (!os_log_GKGeneral) {
    id v18 = GKOSLoggers();
  }
  id v19 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412802;
    id v51 = v14;
    __int16 v52 = 1024;
    BOOL v53 = v11;
    __int16 v54 = 2112;
    id v55 = v15;
    _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "matchWithRequest: %@, serverHosted: %d, currentMatch: %@", buf, 0x1Cu);
  }
  if ((GKApplicationLinkedOnOrAfter(0, 657920) & 1) == 0) {
    [v14 ensureValidityHosted:v11];
  }
  id v20 = objc_msgSend(v14, "internal", a5);
  [v20 setMatchType:v11];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke;
  aBlock[3] = &unk_1E646E098;
  id v21 = v17;
  id v49 = v21;
  uint64_t v22 = _Block_copy(aBlock);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2;
  v46[3] = &unk_1E646FA08;
  id v23 = v22;
  id v47 = v23;
  uint64_t v24 = (void (**)(void *, uint64_t))_Block_copy(v46);
  uint64_t v25 = +[GKLocalPlayer local];
  char v26 = [v25 isAuthenticated];

  if ((v26 & 1) == 0)
  {
    v24[2](v24, 6);
LABEL_16:
    int v31 = v34;
    goto LABEL_17;
  }
  id v27 = +[GKPreferences shared];
  uint64_t v28 = [v27 multiplayerAllowedPlayerType];

  if (!v28)
  {
    v24[2](v24, 10);
    goto LABEL_16;
  }
  [(GKMatchmaker *)self setCurrentMatchRequest:v14];
  [(GKMatchmaker *)self setServerHosted:v11];
  if (!os_log_GKGeneral) {
    id v29 = GKOSLoggers();
  }
  id v30 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v30, OS_LOG_TYPE_INFO, "GKMatchmaker: calls loadRecipientsWithCompletionHandler", buf, 2u);
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291;
  v35[3] = &unk_1E646FB20;
  BOOL v45 = v11;
  uint64_t v44 = v33;
  id v36 = v14;
  id v37 = v15;
  id v38 = self;
  id v41 = v24;
  id v39 = v16;
  id v42 = v21;
  id v43 = v23;
  int v31 = v34;
  id v40 = v34;
  [v36 loadRecipientsWithCompletionHandler:v35];

LABEL_17:
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  uint64_t v5 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
    __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_cold_1(v5);
  }
  if (*(void *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_289;
    v6[3] = &unk_1E646DC30;
    id v8 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_289(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] userErrorForCode:a2 underlyingError:0];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291(uint64_t a1, void *a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = +[GKPreferences shared];
  id v8 = v7;
  if (*(unsigned char *)(a1 + 104))
  {
    unint64_t v9 = [v7 maxPlayersHosted];
    unint64_t v10 = *(void *)(a1 + 96);
  }
  else
  {
    unint64_t v9 = [v7 maxPlayersP2P];
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    id v12 = v5;
    uint64_t v13 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v14 = *(void **)(a1 + 32);
      id v15 = v13;
      id v16 = [v14 guestPlayers];
      *(_DWORD *)long long buf = 67109120;
      int v70 = [v16 count];
      _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "Loaded recipients with guest player count = %i", buf, 8u);
    }
    id v17 = [*(id *)(a1 + 40) players];
    id v18 = [v17 _gkNonGuestPlayersFromPlayers];
    id v19 = (void *)[v18 mutableCopy];

    id v20 = +[GKLocalPlayer localPlayer];
    [v19 removeObject:v20];

    id v21 = [*(id *)(a1 + 48) inviteesByUserID];
    uint64_t v22 = [v21 count];
    uint64_t v23 = [v19 count];
    uint64_t v24 = v22 + [*(id *)(a1 + 40) expectedPlayerCount];
    uint64_t v25 = [*(id *)(a1 + 32) guestPlayers];
    unint64_t v10 = v24 + [v25 count] + v23 + 1;

    if (!os_log_GKGeneral) {
      id v26 = GKOSLoggers();
    }
    id v27 = os_log_GKMatch;
    id v5 = v12;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      int v70 = v10;
      _os_log_impl(&dword_1C2D22000, v27, OS_LOG_TYPE_INFO, "Removed local player from player list, now current player count = %i", buf, 8u);
    }
  }
  if ([*(id *)(a1 + 40) initiallyStarted])
  {
    uint64_t v28 = [*(id *)(a1 + 32) internal];
    [v28 setIsLateJoin:1];

    if (!os_log_GKGeneral) {
      id v29 = GKOSLoggers();
    }
    id v30 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C2D22000, v30, OS_LOG_TYPE_INFO, "This is a late join match request.", buf, 2u);
    }
  }
  [*(id *)(a1 + 32) removeLocalPlayerFromPlayersToInvite];
  uint64_t v31 = [v6 count];

  if (v31 < 1)
  {
    if (!GKAtomicCompareAndSwap32(0, 1u, (atomic_uint *)(*(void *)(a1 + 48) + 16)))
    {
      if (!os_log_GKGeneral) {
        id v42 = GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_5();
      }
      goto LABEL_39;
    }
    if (!os_log_GKGeneral) {
      id v33 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_4();
    }
    uint64_t v34 = [*(id *)(a1 + 32) maxPlayers];
    uint64_t v35 = [*(id *)(a1 + 32) guestPlayers];
    uint64_t v36 = [v35 count] + 1;
    BOOL v37 = v34 == v36;

    if (!os_log_GKGeneral) {
      id v38 = GKOSLoggers();
    }
    id v39 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_3(v34 == v36, v39);
    }
    id v40 = [*(id *)(a1 + 32) validateForHosted:*(unsigned __int8 *)(a1 + 104)];
    if (v40)
    {
      id v41 = *(void (**)(void))(*(void *)(a1 + 88) + 16);
    }
    else
    {
      if (v10 <= [*(id *)(a1 + 32) maxPlayers] || v34 == v36)
      {
        [*(id *)(a1 + 48) setMatch:*(void *)(a1 + 40)];
        int v48 = *(unsigned __int8 *)(a1 + 104);
        id v49 = [*(id *)(a1 + 32) internal];
        long long v50 = v49;
        if (v48)
        {
          [v49 setMatchType:1];

          [*(id *)(a1 + 48) sendMatchmakingRequest:*(void *)(a1 + 32) forMatch:*(void *)(a1 + 40) rematchID:*(void *)(a1 + 64) serverHosted:*(unsigned __int8 *)(a1 + 104) playerCount:v10 completionHandler:*(void *)(a1 + 80)];
        }
        else
        {
          [v49 setMatchType:0];

          id v51 = *(void **)(a1 + 48);
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_301;
          v56[3] = &unk_1E646FAF8;
          v56[4] = v51;
          id v60 = *(id *)(a1 + 80);
          id v57 = *(id *)(a1 + 40);
          id v58 = *(id *)(a1 + 32);
          BOOL v62 = v37;
          id v52 = *(id *)(a1 + 64);
          char v63 = *(unsigned char *)(a1 + 104);
          id v59 = v52;
          unint64_t v61 = v10;
          [v51 loadConnectivitySettingsWithCompletionHandler:v56];
        }
        goto LABEL_54;
      }
      id v41 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    }
    v41();
LABEL_54:

    goto LABEL_41;
  }
  if (v31 + v10 > [*(id *)(a1 + 32) maxPlayers] || objc_msgSend(*(id *)(a1 + 32), "maxPlayers") > v9)
  {
    if (!os_log_GKGeneral) {
      id v32 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_1();
    }
LABEL_39:
    id v43 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_40:
    v43();
    goto LABEL_41;
  }
  if ([v5 code] == 10)
  {
    if (!os_log_GKGeneral) {
      id v44 = GKOSLoggers();
    }
    BOOL v45 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_2(v45);
    }
    id v43 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_40;
  }
  if ([*(id *)(a1 + 32) isConfiguredForAutomatchOnly])
  {
    id v43 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_40;
  }
  if (!*(unsigned char *)(a1 + 104))
  {
    long long v46 = [*(id *)(a1 + 48) match];

    if (!v46)
    {
      id v47 = *(void **)(a1 + 48);
      if (*(void *)(a1 + 40))
      {
        objc_msgSend(v47, "setMatch:");
      }
      else
      {
        BOOL v53 = (void *)[v47 newMatch];
        [*(id *)(a1 + 48) setMatch:v53];
      }
    }
  }
  __int16 v54 = +[GKDaemonProxy proxyForLocalPlayer];
  id v55 = [v54 multiplayerService];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_292;
  v64[3] = &unk_1E646FA58;
  v64[4] = *(void *)(a1 + 48);
  id v65 = *(id *)(a1 + 32);
  id v66 = *(id *)(a1 + 56);
  char v68 = *(unsigned char *)(a1 + 104);
  id v67 = *(id *)(a1 + 80);
  [v55 fetchTransportOverrideWithHandler:v64];

LABEL_41:
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_292(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  unint64_t v9 = [*(id *)(a1 + 32) match];
  unint64_t v10 = [v9 transportContext];
  uint64_t v34 = v7;
  [v10 updateWithForceEnabledTransports:v7 forceDisabledTransports:v8 andHealthMonitorEnabled:a4];

  if ([*(id *)(a1 + 32) shouldRunGroupActivityWithDescription:@"updateAfterTransportOverride"])
  {
    id v11 = [*(id *)(a1 + 32) groupActivityManager];
    [v11 update];
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  id v12 = [*(id *)(a1 + 40) guestPlayers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * v16);
        id v18 = [*(id *)(a1 + 32) match];
        id v19 = +[GKLocalPlayer local];
        [v18 connectToGuestPlayer:v17 withHostPlayer:v19];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v14);
  }

  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v21 = [*(id *)(a1 + 40) internal];
  uint64_t v22 = [v21 recipientPlayerIDs];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        if (*(void *)(a1 + 48))
        {
          uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * v26);
          uint64_t v47 = *(void *)(a1 + 48);
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
          [v20 setObject:v28 forKeyedSubscript:v27];
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v24);
  }

  id v30 = *(void **)(a1 + 32);
  id v29 = *(void **)(a1 + 40);
  uint64_t v31 = *(unsigned __int8 *)(a1 + 64);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_296;
  v35[3] = &unk_1E646FA30;
  id v32 = v29;
  uint64_t v33 = *(void *)(a1 + 32);
  id v36 = v32;
  uint64_t v37 = v33;
  id v38 = *(id *)(a1 + 56);
  [v30 invitePlayersWithRequest:v32 serverHosted:v31 devicePushTokenMap:v20 completionHandler:v35];
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_296(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_296_cold_1();
    }
    uint64_t v13 = [*(id *)(a1 + 40) match];
    uint64_t v14 = [NSString stringWithFormat:@"Error detected when inviting players. Error: %@", v11];
    [v13 promptRadarAndRequestRemoteLogsWithDescriptionAddition:v14];
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id, id, id))(v15 + 16))(v15, a2, v9, v10, v11);
  }
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_301(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setMatching:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    if (v4) {
      id v5 = v4;
    }
    else {
      id v5 = (id)[*(id *)(a1 + 32) newMatch];
    }
    id v6 = v5;
    id v7 = +[GKDaemonProxy proxyForLocalPlayer];
    id v8 = [v7 multiplayerService];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_302;
    v14[3] = &unk_1E646FAD0;
    id v15 = v6;
    id v9 = *(id *)(a1 + 48);
    char v21 = *(unsigned char *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 32);
    id v16 = v9;
    uint64_t v17 = v10;
    id v19 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 56);
    char v22 = *(unsigned char *)(a1 + 81);
    uint64_t v12 = *(void *)(a1 + 72);
    id v18 = v11;
    uint64_t v20 = v12;
    id v13 = v6;
    [v8 fetchTransportOverrideWithHandler:v14];
  }
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_302(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 transportContext];
  [v10 updateWithForceEnabledTransports:v9 forceDisabledTransports:v8 andHealthMonitorEnabled:a4];

  uint64_t v11 = [*(id *)(a1 + 32) version];
  uint64_t v12 = [*(id *)(a1 + 40) internal];
  [v12 setVersion:v11];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_3;
  v18[3] = &unk_1E646FAA8;
  char v25 = *(unsigned char *)(a1 + 80);
  id v13 = *(void **)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 48);
  id v20 = v14;
  uint64_t v21 = v15;
  id v23 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 56);
  char v26 = *(unsigned char *)(a1 + 81);
  uint64_t v17 = *(void *)(a1 + 72);
  id v22 = v16;
  uint64_t v24 = v17;
  [v13 getLocalConnectionDataWithCompletionHandler:v18];
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    [*(id *)(a1 + 48) setMatching:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else if (*(unsigned char *)(a1 + 80))
  {
    id v38 = v5;
    id v8 = &os_log_GKGeneral;
    if (!os_log_GKGeneral) {
      id v9 = GKOSLoggers();
    }
    uint64_t v10 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "This is a local match with guest players only", buf, 2u);
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "guestPlayers", v7);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (!*v8) {
            id v16 = GKOSLoggers();
          }
          uint64_t v17 = (void *)os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            id v18 = v17;
            [v15 internal];
            uint64_t v19 = a1;
            uint64_t v21 = v20 = v8;
            id v22 = [v21 debugDescription];
            *(_DWORD *)long long buf = 138412290;
            uint64_t v47 = v22;
            _os_log_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_INFO, "Connecting to guest player: %@", buf, 0xCu);

            id v8 = v20;
            a1 = v19;
          }
          id v23 = *(void **)(a1 + 40);
          uint64_t v24 = +[GKLocalPlayer local];
          [v23 connectToGuestPlayer:v15 withHostPlayer:v24];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v12);
    }

    [*(id *)(a1 + 48) setMatching:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v7 = v37;
    id v5 = v38;
  }
  else
  {
    char v25 = [*(id *)(a1 + 40) transportContext];
    id v26 = v5;
    [v25 updateForMatchRequestWithConnectionData:v5];

    if (!os_log_GKGeneral) {
      id v27 = GKOSLoggers();
    }
    uint64_t v28 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = *(void *)(a1 + 32);
      id v29 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v47 = v29;
      __int16 v48 = 2112;
      uint64_t v49 = v30;
      _os_log_impl(&dword_1C2D22000, v28, OS_LOG_TYPE_INFO, "Sending matchmaking request to server.\nExisting match: %@.\nRequest: %@", buf, 0x16u);
    }
    uint64_t v31 = *(void *)(a1 + 32);
    uint64_t v32 = *(void *)(a1 + 40);
    uint64_t v33 = *(void **)(a1 + 48);
    uint64_t v34 = *(void *)(a1 + 56);
    uint64_t v35 = *(unsigned __int8 *)(a1 + 81);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_303;
    v40[3] = &unk_1E646FA80;
    uint64_t v36 = *(void *)(a1 + 72);
    id v41 = *(id *)(a1 + 64);
    [v33 sendMatchmakingRequest:v31 forMatch:v32 rematchID:v34 serverHosted:v35 playerCount:v36 completionHandler:v40];

    id v5 = v26;
    id v7 = 0;
  }
}

uint64_t __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_303(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadURLForMatch:(id)a3 matchRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E646FA08;
  id v11 = v10;
  id v32 = v11;
  uint64_t v12 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v13 = +[GKLocalPlayer localPlayer];
  char v14 = [v13 isAuthenticated];

  if (v14)
  {
    uint64_t v15 = +[GKPreferences shared];
    uint64_t v16 = [v15 multiplayerAllowedPlayerType];

    if (v16)
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 1766, "-[GKMatchmaker loadURLForMatch:matchRequest:completionHandler:]");
      id v18 = +[GKDispatchGroup dispatchGroupWithName:v17];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_2;
      v27[3] = &unk_1E646E5C8;
      void v27[4] = self;
      id v19 = v18;
      id v28 = v19;
      id v20 = v8;
      id v29 = v20;
      id v30 = v9;
      [v19 perform:v27];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_305;
      v22[3] = &unk_1E646D9F0;
      id v23 = v19;
      uint64_t v24 = self;
      id v25 = v20;
      id v26 = v11;
      id v21 = v19;
      [v21 notifyOnMainQueueWithBlock:v22];
    }
    else
    {
      v12[2](v12, 10);
    }
  }
  else
  {
    v12[2](v12, 6);
  }
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
    __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_cold_1(a2, v5);
  }
  if (*(void *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_304;
    v6[3] = &unk_1E646FB48;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_304(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userErrorForCode:*(void *)(a1 + 40) underlyingError:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E646DA40;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = v3;
  id v5 = v3;
  [v4 loadConnectivitySettingsWithCompletionHandler:v6];
}

uint64_t __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  if (!a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_4;
    v6[3] = &unk_1E646D9A0;
    id v4 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    [v4 perform:v6];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_5;
  v6[3] = &unk_1E646FB98;
  id v4 = a1[4];
  id v7 = a1[5];
  id v8 = a1[4];
  id v9 = a1[6];
  id v10 = v3;
  id v5 = v3;
  [v4 getLocalConnectionDataWithCompletionHandler:v6];
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_6;
    v10[3] = &unk_1E646E5C8;
    id v9 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = v5;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 32);
    [v9 perform:v10];
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v6, v7, v8);
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) transportContext];
  [v4 updateForInviteInitiationWithOnlineConnectionData:*(void *)(a1 + 40)];

  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v6 = [v5 multiplayerService];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_7;
  v8[3] = &unk_1E646F530;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = v3;
  id v7 = v3;
  [v6 fetchTransportOverrideWithHandler:v8];
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_7(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1[4];
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 transportContext];
  [v10 updateWithForceEnabledTransports:v9 forceDisabledTransports:v8 andHealthMonitorEnabled:a4];

  id v11 = +[GKDaemonProxy proxyForLocalPlayer];
  id v12 = [v11 multiplayerService];
  id v13 = +[GKLocalPlayer local];
  id v14 = [v13 internal];
  id v15 = a1[5];
  uint64_t v16 = [a1[4] transportContext];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_8;
  v17[3] = &unk_1E646FB70;
  id v18 = a1[4];
  id v19 = a1[6];
  id v20 = a1[5];
  id v21 = a1[7];
  [v12 loadCloudKitShareURLWithPlayer:v14 matchRequest:v15 transportContext:v16 handler:v17];
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 transportContext];
  [v8 updateWithInviteInitiateResponse:v7];

  id v9 = [v7 cloudKitShareURL];

  [*(id *)(a1 + 40) setResult:v9];
  [*(id *)(a1 + 40) setError:v5];
  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v10 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_8_cold_1();
    }
  }
  else
  {
    id v11 = *(void **)(a1 + 32);
    BOOL v12 = [*(id *)(a1 + 48) matchType] == 1;
    id v13 = [*(id *)(a1 + 48) messagesBasedRecipients];
    [v11 reportInviteSentWithApproach:2 isHosted:v12 recipients:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_305(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];

  if (v2) {
    [*(id *)(a1 + 40) setMatch:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) result];
    id v4 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);
  }
}

- (void)setShareInvitees:(id)a3 propagateToDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  id v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Matchmaker set shareInvitees: %@", (uint8_t *)&v15, 0xCu);
  }
  id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
  [(GKMatchmaker *)self setShareInvitees:v9];

  if (v4)
  {
    id v10 = +[GKDaemonProxy proxyForLocalPlayer];
    id v11 = [v10 multiplayerService];
    [v11 setShareInvitees:v6];
  }
  BOOL v12 = [(GKMatchmaker *)self invitedShareInvitees];
  id v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  [v12 unionSet:v13];

  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"updateAfterSettingShareInvitees"])
  {
    id v14 = [(GKMatchmaker *)self groupActivityManager];
    [v14 update];
  }
}

- (void)setShareInvitees:(id)a3 forMatch:(id)a4 propagateToDaemon:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(GKMatchmaker *)self setShareInvitees:a3 propagateToDaemon:v5];
  uint64_t v9 = [(GKMatchmaker *)self match];
  id v11 = (id)v9;
  if (v9) {
    id v10 = (id)v9;
  }
  else {
    id v10 = v8;
  }
  [(GKMatchmaker *)self setMatch:v10];
}

- (void)findMatchForRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__GKMatchmaker_findMatchForRequest_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E646FBC0;
  id v9 = v6;
  id v7 = v6;
  [(GKMatchmaker *)self findMatchForRequest:request devicePushToken:0 withCompletionHandler:v8];
}

void __58__GKMatchmaker_findMatchForRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && !v5) {
    [v6 setInitiallyStarted:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)findMatchForRequest:(id)a3 devicePushToken:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = GKOSLoggers();
  }
  BOOL v12 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Find match for request: %@", buf, 0xCu);
  }
  [(GKMatchmaker *)self setMatch:0];
  [(GKMatchmaker *)self setInviteesByUserID:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__GKMatchmaker_findMatchForRequest_devicePushToken_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E646FA80;
  id v16 = v10;
  id v13 = v10;
  [(GKMatchmaker *)self handleMatchRequest:v8 forCurrentMatch:0 hostedCurrentPlayerCount:0 serverHosted:0 rematchID:0 devicePushToken:v9 completionHandler:v15];
  id v14 = +[GKReporter reporter];
  [v14 reportEvent:@"com.apple.GameKit.match" type:@"find"];
}

void __74__GKMatchmaker_findMatchForRequest_devicePushToken_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    BOOL v12 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v10;
      _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Matchmaker failed to find match due to error: %@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      id v14 = *(void (**)(void))(v13 + 16);
LABEL_10:
      v14();
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      id v14 = *(void (**)(void))(v15 + 16);
      goto LABEL_10;
    }
  }
}

- (void)findPlayersForHostedRequest:(id)a3 match:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = GKOSLoggers();
  }
  BOOL v12 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Find players for hosted request: %@, match: %@", buf, 0x16u);
  }
  uint64_t v13 = +[GKReporter reporter];
  [v13 reportEvent:@"com.apple.GameKit.match" reportable:v8];

  [(GKMatchmaker *)self setMatch:v9];
  [(GKMatchmaker *)self setInviteesByUserID:0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__GKMatchmaker_findPlayersForHostedRequest_match_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E646FBE8;
  void v16[4] = self;
  id v17 = v10;
  id v14 = v10;
  [(GKMatchmaker *)self handleMatchRequest:v8 forCurrentMatch:v9 hostedCurrentPlayerCount:0 serverHosted:1 rematchID:0 devicePushToken:0 completionHandler:v16];
  uint64_t v15 = +[GKReporter reporter];
  [v15 reportEvent:@"com.apple.GameKit.match" type:@"findHosted"];
}

void __72__GKMatchmaker_findPlayersForHostedRequest_match_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
  [*(id *)(a1 + 32) setMatch:0];
}

- (void)findPlayersForHostedRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler
{
  id v6 = request;
  id v7 = completionHandler;
  id v8 = v7;
  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__GKMatchmaker_findPlayersForHostedRequest_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E646FC10;
    id v19 = v7;
    [(GKMatchmaker *)self findMatchedPlayers:v6 withCompletionHandler:v18];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v9 = GKOSLoggers();
    }
    uint64_t v10 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker findPlayersForHostedRequest:withCompletionHandler:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void __66__GKMatchmaker_findPlayersForHostedRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_3:
    v7();
    goto LABEL_13;
  }
  id v8 = [v5 players];

  if (!v8)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_3;
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = objc_msgSend(v6, "players", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 addObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_13:
}

- (void)findMatchedPlayers:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(GKMatchmaker *)self newMatch];
    id v9 = +[GKDaemonProxy proxyForLocalPlayer];
    uint64_t v10 = [v9 multiplayerService];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__GKMatchmaker_findMatchedPlayers_withCompletionHandler___block_invoke;
    v21[3] = &unk_1E646F530;
    id v22 = v8;
    id v23 = self;
    id v24 = v6;
    id v25 = v7;
    id v11 = v8;
    [v10 fetchTransportOverrideWithHandler:v21];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    uint64_t v13 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker findMatchedPlayers:withCompletionHandler:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

void __57__GKMatchmaker_findMatchedPlayers_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 transportContext];
  [v10 updateWithForceEnabledTransports:v9 forceDisabledTransports:v8 andHealthMonitorEnabled:a4];

  id v12 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__GKMatchmaker_findMatchedPlayers_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E646EDC0;
  id v16 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 32);
  [v12 findPlayersForHostedRequest:v11 match:v13 withCompletionHandler:v14];
}

void __57__GKMatchmaker_findMatchedPlayers_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [[GKMatchedPlayers alloc] initWithMatch:*(void *)(a1 + 32) players:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)findPlayersForHostedMatchRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = request;
  id v7 = completionHandler;
  if (!GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v10 = GKOSLoggers();
    }
    uint64_t v11 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "Find players for hosted match request: %@", buf, 0xCu);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__GKMatchmaker_findPlayersForHostedMatchRequest_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E646DCF0;
    id v13 = v7;
    [(GKMatchmaker *)self findPlayersForHostedRequest:v6 withCompletionHandler:v12];
    id v9 = v13;
    goto LABEL_12;
  }
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
  {
    -[GKMatchmaker findPlayersForHostedMatchRequest:withCompletionHandler:]();
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  if (v7)
  {
LABEL_6:
    id v9 = [MEMORY[0x1E4F28C58] userErrorForCode:34 underlyingError:0];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v9);
LABEL_12:
  }
LABEL_13:
}

void __71__GKMatchmaker_findPlayersForHostedMatchRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 _gkMapWithBlock:&__block_literal_global_313];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __71__GKMatchmaker_findPlayersForHostedMatchRequest_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 internal];
  uint64_t v3 = [v2 playerID];

  return v3;
}

- (void)addPlayersToMatch:(GKMatch *)match matchRequest:(GKMatchRequest *)matchRequest completionHandler:(void *)completionHandler
{
}

- (void)addPlayersToMatch:(id)a3 matchRequest:(id)a4 devicePushToken:(id)a5 completionHandler:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!os_log_GKGeneral) {
    id v14 = GKOSLoggers();
  }
  id v15 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "Add players to match: %@, with request: %@", buf, 0x16u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__GKMatchmaker_addPlayersToMatch_matchRequest_devicePushToken_completionHandler___block_invoke;
  v18[3] = &unk_1E646FA80;
  id v19 = v13;
  id v16 = v13;
  [(GKMatchmaker *)self handleMatchRequest:v11 forCurrentMatch:v10 hostedCurrentPlayerCount:0 serverHosted:0 rematchID:0 devicePushToken:v12 completionHandler:v18];
  uint64_t v17 = +[GKReporter reporter];
  [v17 reportEvent:@"com.apple.GameKit.match" type:@"add"];
}

uint64_t __81__GKMatchmaker_addPlayersToMatch_matchRequest_devicePushToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a5);
  }
  return result;
}

- (void)addPlayersForHostedMatchRequest:(id)a3 existingPlayerCount:(int64_t)a4 devicePushToken:(id)a5 completionHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!os_log_GKGeneral) {
    id v13 = GKOSLoggers();
  }
  id v14 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v10;
    _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "Add players for hosted match request: %@", buf, 0xCu);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __102__GKMatchmaker_addPlayersForHostedMatchRequest_existingPlayerCount_devicePushToken_completionHandler___block_invoke;
  v17[3] = &unk_1E646FA80;
  id v18 = v12;
  id v15 = v12;
  [(GKMatchmaker *)self handleMatchRequest:v10 forCurrentMatch:0 hostedCurrentPlayerCount:a4 serverHosted:1 rematchID:0 devicePushToken:v11 completionHandler:v17];
  id v16 = +[GKReporter reporter];
  [v16 reportEvent:@"com.apple.GameKit.match" type:@"addHosted"];
}

uint64_t __102__GKMatchmaker_addPlayersForHostedMatchRequest_existingPlayerCount_devicePushToken_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addPlayersForHostedMatchRequest:(id)a3 existingPlayerCount:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)findRematchForMatch:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  id v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "Find rematch for match: %@", buf, 0xCu);
  }
  uint64_t v10 = [v6 rematchID];
  if (v10)
  {
    id v11 = (void *)v10;
    uint64_t v12 = [v6 rematchCount];

    if (v12)
    {
      id v13 = objc_alloc_init(GKMatchRequest);
      -[GKMatchRequest setMinPlayers:](v13, "setMinPlayers:", [v6 rematchCount] + 1);
      -[GKMatchRequest setMaxPlayers:](v13, "setMaxPlayers:", [v6 rematchCount] + 1);
      id v14 = [v6 rematchID];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__GKMatchmaker_findRematchForMatch_completionHandler___block_invoke;
      v15[3] = &unk_1E646FA80;
      id v16 = v7;
      [(GKMatchmaker *)self handleMatchRequest:v13 forCurrentMatch:0 hostedCurrentPlayerCount:0 serverHosted:0 rematchID:v14 devicePushToken:0 completionHandler:v15];

LABEL_10:
      goto LABEL_11;
    }
  }
  if (v7)
  {
    id v13 = [MEMORY[0x1E4F28C58] userErrorForCode:13 underlyingError:0];
    (*((void (**)(id, void, GKMatchRequest *))v7 + 2))(v7, 0, v13);
    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __54__GKMatchmaker_findRematchForMatch_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a5);
  }
  return result;
}

- (BOOL)allInviteesDidRespond
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKMatchmaker *)self inviteesByUserID];
  if ([v3 count])
  {

LABEL_4:
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    id v7 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      id v9 = [(GKMatchmaker *)self inviteesByUserID];
      int v18 = 138412290;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Waiting for response from invitees: %@", (uint8_t *)&v18, 0xCu);
    }
    if (!os_log_GKGeneral) {
      id v10 = GKOSLoggers();
    }
    id v11 = (void *)os_log_GKMatch;
    BOOL v12 = os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v12)
    {
      id v13 = v11;
      id v14 = [(GKMatchmaker *)self shareInvitees];
      int v18 = 138412290;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "Waiting for response from messages invitees: %@", (uint8_t *)&v18, 0xCu);

      LOBYTE(v12) = 0;
    }
    return v12;
  }
  BOOL v4 = [(GKMatchmaker *)self shareInvitees];
  uint64_t v5 = [v4 count];

  if (v5) {
    goto LABEL_4;
  }
  if (!os_log_GKGeneral) {
    id v15 = GKOSLoggers();
  }
  id v16 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    -[GKMatchmaker allInviteesDidRespond](v16);
  }
  LOBYTE(v12) = 1;
  return v12;
}

- (void)doneMatchmaking
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() callStackSymbols];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v4, v5, "Done matchmaking Stack: %@", v6, v7, v8, v9, v10);
}

- (void)cancelPendingInvites
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() callStackSymbols];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v4, v5, "Cancel pending invites. Call Stack: %@", v6, v7, v8, v9, v10);
}

void __36__GKMatchmaker_cancelPendingInvites__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v4 = [v3 multiplayerService];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__GKMatchmaker_cancelPendingInvites__block_invoke_2;
  v6[3] = &unk_1E646D7A0;
  id v7 = v2;
  id v5 = v2;
  [v4 cancelGameInviteWithHandler:v6];
}

uint64_t __36__GKMatchmaker_cancelPendingInvites__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __36__GKMatchmaker_cancelPendingInvites__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) doneMatchmaking];
  id v2 = [*(id *)(a1 + 32) invitedShareInvitees];
  [v2 removeAllObjects];

  uint64_t v3 = [*(id *)(a1 + 32) invitedInvitees];
  [v3 removeAllObjects];

  uint64_t v4 = [*(id *)(a1 + 32) invitedNearbyPlayers];
  [v4 removeAllObjects];

  id v5 = [*(id *)(a1 + 32) autoMatchedPlayers];
  [v5 removeAllObjects];

  uint64_t v6 = [*(id *)(a1 + 32) siblingInvitees];
  [v6 removeAllObjects];

  id v7 = [*(id *)(a1 + 32) sharePlayInviteeTokensFromProgrammaticInvite];
  [v7 removeAllObjects];

  [*(id *)(a1 + 32) setInviterPlayerID:0];
  uint64_t v8 = *(void **)(a1 + 32);

  return [v8 setInviteApproach:0];
}

- (void)cancelPendingInviteToPlayer:(GKPlayer *)player
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = player;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    uint64_t v8 = [(GKPlayer *)v4 internal];
    uint64_t v9 = [v8 debugDescription];
    *(_DWORD *)long long buf = 138412290;
    id v29 = v9;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "cancel pending invite to player: %@", buf, 0xCu);
  }
  if ([(GKMatchmaker *)self removeInvitee:v4])
  {
    uint8_t v10 = [(GKMatchmaker *)self invitedInvitees];
    id v11 = [(GKPlayer *)v4 internal];
    BOOL v12 = [v11 playerID];
    [v10 removeObject:v12];

    id v27 = v4;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [(GKMatchmaker *)self cancelNearbyInvitesToPlayers:v13];

    LODWORD(v12) = [(GKMatchmaker *)self allInviteesDidRespond];
    id v14 = +[GKDaemonProxy proxyForLocalPlayer];
    id v15 = [v14 multiplayerService];
    id v16 = v15;
    if (v12)
    {
      [v15 cancelGameInviteWithHandler:&__block_literal_global_318];

      [(GKMatchmaker *)self doneMatchmaking];
      goto LABEL_14;
    }
    int v18 = [(GKPlayer *)v4 internal];
    id v26 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v16 removePlayersFromGameInviteV2:v19 handler:&__block_literal_global_320];
  }
  else
  {
    id v14 = [(GKPlayer *)v4 internal];
    uint64_t v17 = [v14 alias];
    if (v17)
    {
    }
    else
    {
      uint64_t v20 = [(GKPlayer *)v4 messagesID];

      if (!v20) {
        goto LABEL_14;
      }
      uint64_t v21 = [(GKMatchmaker *)self shareInvitees];
      __int16 v22 = [(GKPlayer *)v4 messagesID];
      [v21 removeObject:v22];

      id v23 = [(GKMatchmaker *)self invitedShareInvitees];
      uint64_t v24 = [(GKPlayer *)v4 messagesID];
      [v23 removeObject:v24];

      id v14 = [(GKMatchmaker *)self shareInvitees];
      [(GKMatchmaker *)self setShareInvitees:v14 propagateToDaemon:1];
    }
  }

LABEL_14:
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"updateAfterCancelPendingInvite"])
  {
    id v25 = [(GKMatchmaker *)self groupActivityManager];
    [v25 update];
  }
}

- (void)cancelInviteToPlayer:(NSString *)playerID
{
  uint64_t v4 = playerID;
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker cancelInviteToPlayer:]();
    }
  }
  else
  {
    uint64_t v6 = [(GKMatchmaker *)self inviteesByUserID];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      [(GKMatchmaker *)self cancelPendingInviteToPlayer:v7];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v8 = GKOSLoggers();
      }
      uint64_t v9 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        [(GKMatchmaker *)(uint64_t)v4 cancelInviteToPlayer:self];
      }
    }
  }
}

- (void)cancel
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() callStackSymbols];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v4, v5, "GKMatchmaker cancel. Stack: \n%@", v6, v7, v8, v9, v10);
}

- (void)finishMatchmakingForMatch:(GKMatch *)match
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = match;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "Finish matchmaking for match: %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v7 = [(GKMatch *)v4 makeInviteMessageDoneData];
  [(GKMatch *)v4 sendInviteData:v7];

  [(GKMatchmaker *)self changeGroupActivityStateToGameStarted];
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "recording the realtime match persistence timestamp. game from API.", (uint8_t *)&v14, 2u);
  }
  uint8_t v10 = +[GKReporter reporter];
  [v10 recordCurrentRealtimeMatchPersistenceTimestamp];

  id v11 = +[GKReporter reporter];
  [v11 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.matchFromAPI"];

  BOOL v12 = +[GKDaemonProxy proxyForLocalPlayer];
  id v13 = [v12 utilityService];
  [v13 recordGameStart];
}

- (void)queryPlayerGroupActivity:(NSUInteger)playerGroup withCompletionHandler:(void *)completionHandler
{
  id v5 = completionHandler;
  if (v5)
  {
    uint64_t v6 = +[GKDaemonProxy proxyForLocalPlayer];
    uint64_t v7 = [v6 multiplayerService];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__GKMatchmaker_queryPlayerGroupActivity_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E646FC58;
    id v19 = v5;
    [v7 getFlowRateForPlayerGroup:playerGroup handler:v18];

    id v8 = +[GKReporter reporter];
    [v8 reportEvent:@"com.apple.GameKit.match" type:@"queryGroup"];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v9 = GKOSLoggers();
    }
    uint8_t v10 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker queryPlayerGroupActivity:withCompletionHandler:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

uint64_t __63__GKMatchmaker_queryPlayerGroupActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryActivityWithCompletionHandler:(void *)completionHandler
{
  uint64_t v3 = completionHandler;
  if (v3)
  {
    uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
    id v5 = [v4 multiplayerService];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__GKMatchmaker_queryActivityWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E646FC58;
    id v17 = v3;
    [v5 getOverallFlowRateWithHandler:v16];

    uint64_t v6 = +[GKReporter reporter];
    [v6 reportEvent:@"com.apple.GameKit.match" type:@"query"];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker queryActivityWithCompletionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

uint64_t __51__GKMatchmaker_queryActivityWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryQueueActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = +[GKDaemonProxy proxyForLocalPlayer];
    id v8 = [v7 multiplayerService];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__GKMatchmaker_queryQueueActivity_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E646FC58;
    id v20 = v6;
    [v8 getFlowRateForQueue:v5 handler:v19];

    uint64_t v9 = +[GKReporter reporter];
    [v9 reportEvent:@"com.apple.GameKit.match" type:@"queryQueue"];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v10 = GKOSLoggers();
    }
    uint64_t v11 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker queryQueueActivity:withCompletionHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t __57__GKMatchmaker_queryQueueActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startBrowsingForNearbyPlayersWithHandler:(void *)reachableHandler
{
  uint64_t v4 = reachableHandler;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker: startBrowsingForNearbyPlayersWithHandler", v7, 2u);
  }
  [(GKMatchmaker *)self setNearbyPlayerHandler:v4];
  [(GKMatchmaker *)self startNearbyBrowsing];
}

- (void)startBrowsingForNearbyPlayersWithReachableHandler:(void *)reachableHandler
{
  uint64_t v4 = reachableHandler;
  if (!GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    [(GKMatchmaker *)self setNearbyPlayerIDHandler:v4];
    [(GKMatchmaker *)self startNearbyBrowsing];
    goto LABEL_8;
  }
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
  {
    -[GKMatchmaker startBrowsingForNearbyPlayersWithReachableHandler:]();
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v4) {
LABEL_6:
  }
    v4[2](v4, @"playerID is no longer available", 0);
LABEL_8:
}

- (void)stopBrowsingForNearbyPlayers
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  uint64_t v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "GKMatchmaker: stopBrowsingForNearbyPlayers", v5, 2u);
  }
  [(GKMatchmaker *)self stopNearbyBrowsing];
  [(GKMatchmaker *)self setNearbyPlayerHandler:0];
}

- (void)startGroupActivityWithPlayerHandler:(void *)handler
{
  uint64_t v4 = handler;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "starting browsing for sharePlay players", buf, 2u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__GKMatchmaker_startGroupActivityWithPlayerHandler___block_invoke;
  v8[3] = &unk_1E646EE38;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(GKMatchmaker *)self activateGroupActivityWithHandler:v8];
}

void __52__GKMatchmaker_startGroupActivityWithPlayerHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:*(void *)(a1 + 32) selector:sel_sharePlayPlayerFound_ name:@"GKGroupActivityPlayerToInviteNotification" object:0];
    [*(id *)(a1 + 32) setSharePlayPlayerHandler:*(void *)(a1 + 40)];
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    id v5 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "started browsing for sharePlay players", v6, 2u);
    }
  }
}

- (void)stopGroupActivity
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "stopping browsing for sharePlay players", v7, 2u);
  }
  [(GKMatchmaker *)self setSharePlayPlayerHandler:0];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"GKGroupActivityPlayerToInviteNotification" object:0];
  if ([(GKMatchmaker *)self shouldRunGroupActivityWithDescription:@"endGroupActivity"])
  {
    id v6 = [(GKMatchmaker *)self groupActivityManager];
    [v6 endWithCompletionHandler:&__block_literal_global_334];
  }
}

void __33__GKMatchmaker_stopGroupActivity__block_invoke()
{
  if (!os_log_GKGeneral) {
    id v0 = GKOSLoggers();
  }
  uint64_t v1 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_INFO, "stopped browsing for sharePlay players", v2, 2u);
  }
}

- (void)sharePlayPlayerFound:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v22 = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "sharePlayPlayerFound: %@", (uint8_t *)&v22, 0xCu);
  }
  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"player"];
  id v9 = [v7 objectForKeyedSubscript:@"pushToken"];
  id v10 = [(GKMatchmaker *)self sharePlayPlayerHandler];

  if (v10)
  {
    uint64_t v11 = [(GKMatchmaker *)self sharePlayPlayerHandler];
    ((void (**)(void, void *))v11)[2](v11, v8);

    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    uint64_t v13 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "sharePlayInviteeTokensFromProgrammaticInvite gets a new player: %@, with token: %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v14 = [(GKMatchmaker *)self sharePlayInviteeTokensFromProgrammaticInvite];
    uint64_t v15 = [v8 internal];
    uint64_t v16 = [v15 playerID];
    [v14 setObject:v9 forKeyedSubscript:v16];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    uint64_t v18 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v19 = v18;
      id v20 = [v8 internal];
      uint64_t v21 = [v20 debugDescription];
      int v22 = 138412290;
      id v23 = v21;
      _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "no sharePlayPlayerHandler is set to call it back for developers. player: %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (int64_t)responseForDeclineReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3) {
    return 1;
  }
  else {
    return qword_1C2EBCFB0[a3 - 2];
  }
}

- (void)localPlayerAcceptedGameInviteNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMatchmaker *)self invitationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__GKMatchmaker_localPlayerAcceptedGameInviteNotification___block_invoke;
  v7[3] = &unk_1E646EC80;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__GKMatchmaker_localPlayerAcceptedGameInviteNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v2 objectForKeyedSubscript:@"sid"];

  id v3 = [*(id *)(a1 + 40) pendingInvitationUpdates];
  id v4 = [v3 objectForKeyedSubscript:v5];

  if (!v4) {
    [*(id *)(a1 + 40) cancel];
  }
}

- (void)inviteeAcceptedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"peer-id"];
  id v6 = [(GKMatchmaker *)self invitationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__GKMatchmaker_inviteeAcceptedNotification___block_invoke;
  block[3] = &unk_1E646F558;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __44__GKMatchmaker_inviteeAcceptedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) inviteesByUserID];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "Invitee accepted notification - userInfo: %@", (uint8_t *)&v10, 0xCu);
  }
  if ([*(id *)(a1 + 32) removeInvitee:v3])
  {
    objc_msgSend(*(id *)(a1 + 32), "inviteeAccepted:userInfo:allResponded:", v3, *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "allInviteesDidRespond"));
  }
  else if (v3 {
         || ([*(id *)(a1 + 32) shareInvitees],
  }
             id v8 = objc_claimAutoreleasedReturnValue(),
             uint64_t v9 = [v8 count],
             v8,
             !v9))
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __44__GKMatchmaker_inviteeAcceptedNotification___block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) shareInviteeAcceptedWithUserInfo:*(void *)(a1 + 48)];
  }
}

- (void)shareInviteeAcceptedWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"iCloudID"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"peer-id"];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 2383, "-[GKMatchmaker shareInviteeAcceptedWithUserInfo:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke;
  v21[3] = &unk_1E646D9A0;
  id v22 = v6;
  id v9 = v5;
  id v23 = v9;
  id v10 = v8;
  id v24 = v10;
  id v11 = v6;
  [v10 perform:v21];
  uint64_t v12 = [(GKMatchmaker *)self invitationQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_341;
  v16[3] = &unk_1E646F490;
  id v17 = v10;
  uint64_t v18 = self;
  id v19 = v9;
  id v20 = v4;
  id v13 = v4;
  id v14 = v9;
  id v15 = v10;
  [v15 notifyOnQueue:v12 block:v16];
}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v10[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_2;
  v6[3] = &unk_1E646E640;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  +[GKPlayer loadPlayersForIdentifiersPrivate:v4 withCompletionHandler:v6];
}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_2_cold_1();
    }
  }
  id v8 = [v5 lastObject];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v8 internal];
  [v10 setMessagesID:v9];

  [*(id *)(a1 + 40) setResult:v8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_341(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 40) shareInvitees];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) shareInvitees];
    [v5 removeObject:*(void *)(a1 + 48)];

    id v6 = [*(id *)(a1 + 40) invitedShareInvitees];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [v2 internal];
    uint64_t v9 = [v8 playerID];
    id v10 = [v7 setWithObject:v9];
    [v6 unionSet:v10];

    objc_msgSend(*(id *)(a1 + 40), "inviteeAccepted:userInfo:allResponded:", v2, *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "allInviteesDidRespond"));
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_341_cold_1();
    }
  }
}

- (void)inviteeAccepted:(id)a3 userInfo:(id)a4 allResponded:(BOOL)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = dispatch_get_current_queue();
  id v11 = [(GKMatchmaker *)self invitationQueue];

  if (v10 != v11)
  {
    id v28 = v8;
    uint64_t v12 = NSString;
    label = dispatch_queue_get_label(v10);
    id v14 = [(GKMatchmaker *)self invitationQueue];
    id v15 = dispatch_queue_get_label(v14);
    [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v16 = v27 = a5;
    id v17 = [v12 stringWithFormat:@"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKMatchmaker inviteeAccepted:userInfo:allResponded:]", label, v15, v16];
    uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m"];
    id v19 = [v18 lastPathComponent];
    id v20 = [v12 stringWithFormat:@"%@ (_actualCurrentQueue == self.invitationQueue)\n[%s (%s:%d)]", v17, "-[GKMatchmaker inviteeAccepted:userInfo:allResponded:]", objc_msgSend(v19, "UTF8String"), 2421];

    a5 = v27;
    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v20 format];

    id v8 = v28;
  }

  uint64_t v21 = [v9 objectForKeyedSubscript:@"peer-id"];
  uint64_t v22 = [v9 objectForKeyedSubscript:@"iCloudID"];
  id v23 = (void *)v22;
  if (v8)
  {
    BOOL v24 = v22 != 0;
    v35[0] = v8;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke;
    v29[3] = &unk_1E646FCD0;
    v29[4] = self;
    id v30 = v9;
    id v31 = v21;
    BOOL v33 = v24;
    id v32 = v8;
    BOOL v34 = a5;
    [(GKMatchmaker *)self reportResponse:0 forInvitees:v25 withCompletionHandler:v29];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v26 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker inviteeAccepted:userInfo:allResponded:]();
    }
  }
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) match];

  if (v2)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker.m", 2436, "-[GKMatchmaker inviteeAccepted:userInfo:allResponded:]_block_invoke");
    uint64_t v4 = +[GKDispatchGroup dispatchGroupWithName:v3];

    if (([*(id *)(a1 + 32) serverHosted] & 1) == 0)
    {
      id v5 = [*(id *)(a1 + 32) currentMatchRequest];
      id v6 = [v5 internal];
      uint64_t v7 = [v6 matchType];

      if (v7 != 1)
      {
        id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"peer-push-token"];
        id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"invite-version"];
        char v10 = [v9 unsignedCharValue];

        id v11 = [*(id *)(a1 + 32) match];
        uint64_t v12 = [v11 playerPushTokens];
        [v12 setObject:v8 forKey:*(void *)(a1 + 48)];

        id v13 = +[GKReporter reporter];
        [v13 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:@"realtime.allMatchTotal"];

        int v14 = *(unsigned __int8 *)(a1 + 64);
        id v15 = +[GKReporter reporter];
        uint64_t v16 = v15;
        id v17 = GKRTPushBasedMatchTotal;
        if (v14) {
          id v17 = GKRTMessageBasedMatchTotal;
        }
        [v15 reportEvent:@"com.apple.GameKit.multiplayer.realtime.connectionResult" type:*v17];

        uint64_t v18 = [*(id *)(a1 + 32) match];
        id v19 = [v18 transportContext];
        [v19 updateAfterInviteeAcceptedUserInfo:*(void *)(a1 + 40)];

        id v20 = [*(id *)(a1 + 32) match];
        uint64_t v21 = [v20 transportContext];
        int v22 = [v21 shouldSendInviteUpdate];

        if (v22)
        {
          id v23 = [*(id *)(a1 + 32) match];
          BOOL v24 = [v23 transportContext];
          id v25 = [v24 formAnInviteUpdate];

          if (!os_log_GKGeneral) {
            id v26 = GKOSLoggers();
          }
          BOOL v27 = os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v38 = v25;
            _os_log_impl(&dword_1C2D22000, v27, OS_LOG_TYPE_INFO, "Sending invite update to participants in the lobby channel: %@", buf, 0xCu);
          }
          id v28 = +[GKDaemonProxy proxyForLocalPlayer];
          id v29 = [v28 multiplayerService];
          [v29 sendInvitationUpdate:v25 handler:&__block_literal_global_364];
        }
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_365;
        v33[3] = &unk_1E646FC80;
        v33[4] = *(void *)(a1 + 32);
        id v34 = *(id *)(a1 + 56);
        char v36 = v10;
        id v35 = *(id *)(a1 + 40);
        [v4 perform:v33];
      }
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_366;
    v31[3] = &unk_1E646FCA8;
    char v32 = *(unsigned char *)(a1 + 65);
    v31[4] = *(void *)(a1 + 32);
    [v4 notifyOnMainQueueWithBlock:v31];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v30 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_cold_1();
    }
  }
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_362(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_362_cold_1();
    }
  }
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_365(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) match];
  v11[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_2;
  v8[3] = &unk_1E646DF30;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v7 = v3;
  [v4 connectToPlayers:v5 version:v6 invitedByLocalPlayer:1 completionHandler:v8];
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [MEMORY[0x1E4F28C58] userErrorForCode:28 underlyingError:v3];

    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278_cold_3();
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) match];
    [v7 handleRelayPushData:*(void *)(a1 + 40) onlyIfPreemptive:1];

    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_366(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) doneMatchmaking];
  }
  return result;
}

- (void)inviteeDeclinedNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [(GKMatchmaker *)self invitationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__GKMatchmaker_inviteeDeclinedNotification___block_invoke;
  v7[3] = &unk_1E646EC80;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__GKMatchmaker_inviteeDeclinedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) inviteeDeclinedWithUserInfo:*(void *)(a1 + 40)];
}

- (void)inviteeDeclinedWithUserInfo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = dispatch_get_current_queue();
  id v6 = [(GKMatchmaker *)self invitationQueue];

  if (v5 != v6)
  {
    id v7 = NSString;
    label = dispatch_queue_get_label(v5);
    id v9 = [(GKMatchmaker *)self invitationQueue];
    id v10 = dispatch_queue_get_label(v9);
    id v11 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v12 = [v7 stringWithFormat:@"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKMatchmaker inviteeDeclinedWithUserInfo:]", label, v10, v11];
    id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m"];
    id v14 = [v13 lastPathComponent];
    id v15 = [v7 stringWithFormat:@"%@ (_actualCurrentQueue == self.invitationQueue)\n[%s (%s:%d)]", v12, "-[GKMatchmaker inviteeDeclinedWithUserInfo:]", objc_msgSend(v14, "UTF8String"), 2505];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v15 format];
  }

  uint64_t v16 = [v4 objectForKey:@"peer-id"];
  id v17 = [(GKMatchmaker *)self inviteesByUserID];
  uint64_t v18 = [v17 objectForKey:v16];

  if (!os_log_GKGeneral) {
    id v19 = GKOSLoggers();
  }
  id v20 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v43 = v4;
    _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "Invitee declined invite - userInfo: %@", buf, 0xCu);
  }
  uint64_t v21 = [v4 objectForKey:@"y"];

  if (v21)
  {
    int v22 = [v4 objectForKey:@"y"];
    uint64_t v23 = [v22 integerValue];

    if (v23 == 5)
    {
      SEL v24 = NSSelectorFromString(&cfstr_Showconfirmati.isa);
      id v25 = +[GKLocalPlayer local];
      char v26 = objc_opt_respondsToSelector();

      if (v26)
      {
        BOOL v27 = +[GCFLocalizedStrings SOFTWARE_UPDATE_REQUIRED_TITLE];
        v41[0] = v27;
        id v28 = +[GCFLocalizedStrings SOFTWARE_UPDATE_REQUIRED_MESSAGE];
        v41[1] = v28;
        id v29 = +[GCFLocalizedStrings GO_TO_SOFTWARE_UPDATE_SETTINGS_BUTTON];
        v41[2] = v29;
        v41[3] = &__block_literal_global_371;
        v41[4] = &__block_literal_global_373;
        id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];

        id v31 = +[GKLocalPlayer local];
        [v31 _gkPerformSelector:v24 withObjects:v30];

        char v32 = +[GKAPIReporter reporter];
        [v32 recordMultiplayerErrorID:@"inviteeDeclinedIncompatibleTransport"];
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v33 = GKOSLoggers();
        }
        id v34 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1C2D22000, v34, OS_LOG_TYPE_INFO, "showSharePlayMatchFullAlert failed since localPlayer does not respond to selector showAlertWithTitle:andMessage:", buf, 2u);
        }
      }
    }
    if ([(GKMatchmaker *)self removeInvitee:v18])
    {
      BOOL v35 = [(GKMatchmaker *)self allInviteesDidRespond];
      int64_t v36 = [(GKMatchmaker *)self responseForDeclineReason:v23];
      long long v40 = v18;
      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __44__GKMatchmaker_inviteeDeclinedWithUserInfo___block_invoke_377;
      v38[3] = &unk_1E646FCA8;
      BOOL v39 = v35;
      void v38[4] = self;
      [(GKMatchmaker *)self reportResponse:v36 forInvitees:v37 withCompletionHandler:v38];
    }
  }
  else
  {
    [(GKMatchmaker *)self removeInvitee:v18];
  }
}

void __44__GKMatchmaker_inviteeDeclinedWithUserInfo___block_invoke()
{
  id v1 = +[GKDaemonProxy proxyForLocalPlayer];
  id v0 = [v1 utilityService];
  [v0 openSoftwareUpdateSettings];
}

uint64_t __44__GKMatchmaker_inviteeDeclinedWithUserInfo___block_invoke_377(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) doneMatchmaking];
  }
  return result;
}

- (void)inviteeUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMatchmaker *)self invitationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__GKMatchmaker_inviteeUpdateNotification___block_invoke;
  v7[3] = &unk_1E646EC80;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__GKMatchmaker_inviteeUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"x"];
  id v4 = v3;
  if (v3
    && ([v3 objectForKeyedSubscript:@"sid"], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = os_log_GKFastSync;
    if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
    {
      int v33 = 138412290;
      id v34 = v2;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Invitee should update invite related info with: %@", (uint8_t *)&v33, 0xCu);
    }
    id v9 = objc_alloc_init(GKUpdateInviteInfo);
    [(GKUpdateInviteInfo *)v9 setSessionID:v6];
    id v10 = [v4 objectForKeyedSubscript:@"matchID"];

    if (v10)
    {
      id v11 = [v4 objectForKeyedSubscript:@"matchID"];
      [(GKUpdateInviteInfo *)v9 setMatchID:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"gp"];

    if (v12)
    {
      id v13 = +[GKTransportParticipant participantsFrom:v4 withKey:@"gp"];
      [(GKUpdateInviteInfo *)v9 setGameParticipants:v13];
    }
    id v14 = [v4 objectForKeyedSubscript:@"lp"];

    if (v14)
    {
      id v15 = +[GKTransportParticipant participantsFrom:v4 withKey:@"lp"];
      [(GKUpdateInviteInfo *)v9 setLobbyParticipants:v15];
    }
    uint64_t v16 = [*(id *)(a1 + 40) pendingInvitationUpdates];
    id v17 = [v16 objectForKeyedSubscript:v6];

    if (v17) {
      [(GKUpdateInviteInfo *)v9 mergeWithUpdate:v17];
    }
    uint64_t v18 = [*(id *)(a1 + 40) match];

    if (v18)
    {
      id v19 = [*(id *)(a1 + 40) match];
      id v20 = [v19 transportContext];
      [v20 updateWithInviteUpdateInfo:v9];

      uint64_t v21 = [*(id *)(a1 + 40) match];
      int v22 = [v21 transportContext];
      uint64_t v23 = [v22 sessionID];

      if (v23)
      {
        SEL v24 = [*(id *)(a1 + 40) pendingInvitationUpdates];
        id v25 = [*(id *)(a1 + 40) match];
        char v26 = [v25 transportContext];
        BOOL v27 = [v26 sessionID];
        [v24 removeObjectForKey:v27];
      }
      id v28 = [*(id *)(a1 + 40) match];
      [v28 connectToPlayers:MEMORY[0x1E4F1CBF0] version:1 invitedByLocalPlayer:0 completionHandler:&__block_literal_global_385];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v31 = GKOSLoggers();
      }
      char v32 = os_log_GKFastSync;
      if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
      {
        int v33 = 138412546;
        id v34 = v6;
        __int16 v35 = 2112;
        int64_t v36 = v9;
        _os_log_impl(&dword_1C2D22000, v32, OS_LOG_TYPE_INFO, "No match yet. For sessionID: %@, adding pending invite update: %@", (uint8_t *)&v33, 0x16u);
      }
      id v28 = [*(id *)(a1 + 40) pendingInvitationUpdates];
      [v28 setObject:v9 forKeyedSubscript:v6];
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v29 = GKOSLoggers();
    }
    id v30 = os_log_GKFastSync;
    if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_1C2D22000, v30, OS_LOG_TYPE_INFO, "Cannot find sessionID from updateInvite notification.", (uint8_t *)&v33, 2u);
    }
  }
}

void __42__GKMatchmaker_inviteeUpdateNotification___block_invoke_383(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = v2;
    id v4 = [MEMORY[0x1E4F28C58] userErrorForCode:28 underlyingError:v2];

    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __42__GKMatchmaker_inviteeUpdateNotification___block_invoke_383_cold_1();
    }
  }
}

- (void)setNearbyPlayerAccepted:(id)a3 connectionData:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(GKMatchmaker *)self removeInvitee:v6])
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    id v9 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      id v11 = [v6 internal];
      uint64_t v12 = [v11 debugDescription];
      *(_DWORD *)long long buf = 138412290;
      id v19 = v12;
      _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "Nearby player accepted: %@", buf, 0xCu);
    }
    id v17 = v6;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__GKMatchmaker_setNearbyPlayerAccepted_connectionData___block_invoke;
    v14[3] = &unk_1E646F558;
    void v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    [(GKMatchmaker *)self reportResponse:0 forInvitees:v13 withCompletionHandler:v14];
  }
}

void __55__GKMatchmaker_setNearbyPlayerAccepted_connectionData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) match];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) match];
    [v3 connectToNearbyPlayer:*(void *)(a1 + 40) withConnectionData:*(void *)(a1 + 48)];

    if ([*(id *)(a1 + 32) allInviteesDidRespond])
    {
      id v4 = *(void **)(a1 + 32);
      [v4 doneMatchmaking];
    }
  }
}

- (void)setNearbyPlayerDeclined:(id)a3 reason:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(GKMatchmaker *)self removeInvitee:v6])
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    id v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v9 = v8;
      id v10 = [v6 internal];
      id v11 = [v10 debugDescription];
      *(_DWORD *)long long buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "Nearby player declined: %@", buf, 0xCu);
    }
    int64_t v12 = [(GKMatchmaker *)self responseForDeclineReason:a4];
    id v15 = v6;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__GKMatchmaker_setNearbyPlayerDeclined_reason___block_invoke;
    v14[3] = &unk_1E646D7F0;
    void v14[4] = self;
    [(GKMatchmaker *)self reportResponse:v12 forInvitees:v13 withCompletionHandler:v14];
  }
}

uint64_t __47__GKMatchmaker_setNearbyPlayerDeclined_reason___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) allInviteesDidRespond];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 doneMatchmaking];
  }
  return result;
}

- (void)setNearbyPlayerFailed:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(GKMatchmaker *)self removeInvitee:v4])
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      id v8 = [v4 internal];
      id v9 = [v8 debugDescription];
      *(_DWORD *)long long buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "Failed to set nearby player: %@", buf, 0xCu);
    }
    id v12 = v4;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __38__GKMatchmaker_setNearbyPlayerFailed___block_invoke;
    v11[3] = &unk_1E646D7F0;
    v11[4] = self;
    [(GKMatchmaker *)self reportResponse:2 forInvitees:v10 withCompletionHandler:v11];
  }
}

uint64_t __38__GKMatchmaker_setNearbyPlayerFailed___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) allInviteesDidRespond];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 doneMatchmaking];
  }
  return result;
}

- (void)promptForRadarWithDescriptionAddition:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[GKPreferences shared];
  int v6 = [v5 isInternalBuild];

  if (v6)
  {
    if ([(GKMatchmaker *)self canPromptTapToRadar])
    {
      if (!os_log_GKGeneral) {
        id v7 = GKOSLoggers();
      }
      id v8 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Starting prompting TTR with description: %@", buf, 0xCu);
      }
      id v9 = +[GKDaemonProxy proxyForLocalPlayer];
      id v10 = [v9 multiplayerService];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __54__GKMatchmaker_promptForRadarWithDescriptionAddition___block_invoke;
      void v13[3] = &unk_1E646D7F0;
      void v13[4] = self;
      [v10 fileMultiplayerTTRWithCallBackIdentifier:&stru_1F1E47DF8 descriptionAddition:v4 handler:v13];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v11 = GKOSLoggers();
      }
      id v12 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Already prompted tap to radar. Skip.", buf, 2u);
      }
    }
  }
}

uint64_t __54__GKMatchmaker_promptForRadarWithDescriptionAddition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCanPromptTapToRadar:0];
}

- (void)nearbyPlayerFound:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"deviceID"];
  int v6 = [v4 objectForKeyedSubscript:@"discoveryInfo"];
  if (v6 && v5)
  {
    [(GKMatchmaker *)self foundNearbyDeviceID:v5 discoveryInfo:v6];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker nearbyPlayerFound:]((uint64_t)v5);
    }
  }
}

- (void)nearbyPlayerLost:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"deviceID"];
  if (v5)
  {
    [(GKMatchmaker *)self lostNearbyDeviceID:v5];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    id v7 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker nearbyPlayerLost:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)nearbyDataReceived:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"deviceID"];
  id v6 = [v4 objectForKey:@"data"];
  if (v6 && v5)
  {
    [(GKMatchmaker *)self receivedData:v6 fromNearbyDeviceID:v5];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmaker nearbyDataReceived:]((uint64_t)v5);
    }
  }
}

- (void)matchRequestRecipientsSet:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKeyedSubscript:@"request"];
  if (v4) {
    [(GKMatchmaker *)self setCurrentMatchRequest:v4];
  }
}

+ (GKMatchmaker)sharedMatchmaker
{
  if ([MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess])
  {
    if (!os_log_GKGeneral) {
      id v2 = GKOSLoggers();
    }
    id v3 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      +[GKMatchmaker sharedMatchmaker](v3);
    }
    id v4 = 0;
  }
  else
  {
    if (sharedMatchmaker_sDispatchOnceToken != -1) {
      dispatch_once(&sharedMatchmaker_sDispatchOnceToken, &__block_literal_global_399);
    }
    id v4 = (id)sharedMatchmaker_sSharedMatchmaker;
  }

  return (GKMatchmaker *)v4;
}

void __32__GKMatchmaker_sharedMatchmaker__block_invoke()
{
  if (!os_log_GKGeneral) {
    id v0 = GKOSLoggers();
  }
  id v1 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    __32__GKMatchmaker_sharedMatchmaker__block_invoke_cold_1(v1);
  }
  id v2 = objc_alloc_init(GKMatchmaker);
  id v3 = (void *)sharedMatchmaker_sSharedMatchmaker;
  sharedMatchmaker_sSharedMatchmaker = (uint64_t)v2;
}

+ (BOOL)canPlayMultiplayerGameWithPlayers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[GKPreferences shared];
  uint64_t v5 = [v4 multiplayerAllowedPlayerType];

  if (v5)
  {
    id v6 = +[GKPreferences shared];
    uint64_t v7 = [v6 multiplayerAllowedPlayerType];

    if (v7 == 2
      || (+[GKPreferences shared],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 multiplayerAllowedPlayerType],
          v8,
          v9 != 1))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v3;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isLocalPlayer", (void)v19) & 1) == 0)
            {
              uint64_t v16 = [v15 friendBiDirectional];
              int v17 = [v16 isEqualToNumber:&unk_1F1E7EB40];

              if (!v17)
              {
                LOBYTE(v5) = 0;
                goto LABEL_16;
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      LOBYTE(v5) = 1;
LABEL_16:
    }
  }

  return v5;
}

- (_TtC20GameCenterFoundation22GKGroupActivityManager)groupActivityManager
{
  return self->_groupActivityManager;
}

- (void)setGroupActivityManager:(id)a3
{
}

- (void)inviteHandler
{
  return self->_inviteHandler;
}

- (GKMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (id)inviteeResponseHandler
{
  return self->_inviteeResponseHandler;
}

- (void)setInviteeResponseHandler:(id)a3
{
}

- (id)recipientResponseHandler
{
  return self->_recipientResponseHandler;
}

- (void)setRecipientResponseHandler:(id)a3
{
}

- (NSDictionary)inviteesByUserID
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInviteesByUserID:(id)a3
{
}

- (id)nearbyPlayerHandler
{
  return self->_nearbyPlayerHandler;
}

- (void)setNearbyPlayerHandler:(id)a3
{
}

- (id)nearbyPlayerIDHandler
{
  return self->_nearbyPlayerIDHandler;
}

- (void)setNearbyPlayerIDHandler:(id)a3
{
}

- (OS_dispatch_queue)lookForInviteQueue
{
  return self->_lookForInviteQueue;
}

- (void)setLookForInviteQueue:(id)a3
{
}

- (int)matching
{
  return self->_matching;
}

- (void)setMatching:(int)a3
{
  self->_matching = a3;
}

- (BOOL)nearbyAdvertising
{
  return self->_nearbyAdvertising;
}

- (void)setNearbyAdvertising:(BOOL)a3
{
  self->_nearbyAdvertising = a3;
}

- (NSMutableDictionary)nearbyPlayers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNearbyPlayers:(id)a3
{
}

- (BOOL)wasNearbyBrowsing
{
  return self->_wasNearbyBrowsing;
}

- (void)setWasNearbyBrowsing:(BOOL)a3
{
  self->_wasNearbyBrowsing = a3;
}

- (BOOL)nearbyBrowsing
{
  return self->_nearbyBrowsing;
}

- (void)setNearbyBrowsing:(BOOL)a3
{
  self->_nearbyBrowsing = a3;
}

- (NSDate)nearbyQueryLastCheckDate
{
  return self->_nearbyQueryLastCheckDate;
}

- (void)setNearbyQueryLastCheckDate:(id)a3
{
}

- (double)nearbyQueryAllowance
{
  return self->_nearbyQueryAllowance;
}

- (void)setNearbyQueryAllowance:(double)a3
{
  self->_nearbyQueryAllowance = a3;
}

- (NSSet)nearbyCompatibleVersionHashes
{
  return self->_nearbyCompatibleVersionHashes;
}

- (void)setNearbyCompatibleVersionHashes:(id)a3
{
}

- (NSSet)nearbyCompatibleShortVersionHashes
{
  return self->_nearbyCompatibleShortVersionHashes;
}

- (void)setNearbyCompatibleShortVersionHashes:(id)a3
{
}

- (BOOL)generatingCompatiblityHashes
{
  return self->_generatingCompatiblityHashes;
}

- (void)setGeneratingCompatiblityHashes:(BOOL)a3
{
  self->_generatingCompatiblityHashes = a3;
}

- (GKDispatchGroup)compatibilityHashGroup
{
  return self->_compatibilityHashGroup;
}

- (void)setCompatibilityHashGroup:(id)a3
{
}

- (NSMutableDictionary)nearbyInvites
{
  return self->_nearbyInvites;
}

- (void)setNearbyInvites:(id)a3
{
}

- (NSMutableArray)shareInvitees
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setShareInvitees:(id)a3
{
}

- (NSMutableArray)acceptedInviteesTokens
{
  return self->_acceptedInviteesTokens;
}

- (void)setAcceptedInviteesTokens:(id)a3
{
}

- (BOOL)canPromptTapToRadar
{
  return self->_canPromptTapToRadar;
}

- (void)setCanPromptTapToRadar:(BOOL)a3
{
  self->_canPromptTapToRadar = a3;
}

- (BOOL)serverHosted
{
  return self->_serverHosted;
}

- (void)setServerHosted:(BOOL)a3
{
  self->_serverHosted = a3;
}

- (NSMutableDictionary)pendingInvitationUpdates
{
  return self->_pendingInvitationUpdates;
}

- (void)setPendingInvitationUpdates:(id)a3
{
}

- (BOOL)nearbyDiscoverySetup
{
  return self->_nearbyDiscoverySetup;
}

- (void)setNearbyDiscoverySetup:(BOOL)a3
{
  self->_nearbyDiscoverySetup = a3;
}

- (id)sharePlayPlayerHandler
{
  return self->_sharePlayPlayerHandler;
}

- (void)setSharePlayPlayerHandler:(id)a3
{
}

- (NSMutableSet)autoMatchedPlayers
{
  return self->_autoMatchedPlayers;
}

- (void)setAutoMatchedPlayers:(id)a3
{
}

- (NSMutableSet)invitedInvitees
{
  return self->_invitedInvitees;
}

- (void)setInvitedInvitees:(id)a3
{
}

- (NSMutableSet)invitedShareInvitees
{
  return (NSMutableSet *)objc_getProperty(self, a2, 200, 1);
}

- (void)setInvitedShareInvitees:(id)a3
{
}

- (NSMutableSet)invitedNearbyPlayers
{
  return self->_invitedNearbyPlayers;
}

- (void)setInvitedNearbyPlayers:(id)a3
{
}

- (NSString)inviterPlayerID
{
  return self->_inviterPlayerID;
}

- (void)setInviterPlayerID:(id)a3
{
}

- (unint64_t)inviteApproach
{
  return self->_inviteApproach;
}

- (void)setInviteApproach:(unint64_t)a3
{
  self->_inviteApproach = a3;
}

- (NSMutableSet)siblingInvitees
{
  return self->_siblingInvitees;
}

- (void)setSiblingInvitees:(id)a3
{
}

- (NSMutableDictionary)sharePlayInviteeTokensFromProgrammaticInvite
{
  return self->_sharePlayInviteeTokensFromProgrammaticInvite;
}

- (void)setSharePlayInviteeTokensFromProgrammaticInvite:(id)a3
{
}

- (GKMatchRequest)currentMatchRequest
{
  return self->_currentMatchRequest;
}

- (void)setCurrentMatchRequest:(id)a3
{
}

- (OS_dispatch_queue)invitationQueue
{
  return self->_invitationQueue;
}

- (void)setInvitationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationQueue, 0);
  objc_storeStrong((id *)&self->_currentMatchRequest, 0);
  objc_storeStrong((id *)&self->_sharePlayInviteeTokensFromProgrammaticInvite, 0);
  objc_storeStrong((id *)&self->_siblingInvitees, 0);
  objc_storeStrong((id *)&self->_inviterPlayerID, 0);
  objc_storeStrong((id *)&self->_invitedNearbyPlayers, 0);
  objc_storeStrong((id *)&self->_invitedShareInvitees, 0);
  objc_storeStrong((id *)&self->_invitedInvitees, 0);
  objc_storeStrong((id *)&self->_autoMatchedPlayers, 0);
  objc_storeStrong(&self->_sharePlayPlayerHandler, 0);
  objc_storeStrong((id *)&self->_pendingInvitationUpdates, 0);
  objc_storeStrong((id *)&self->_acceptedInviteesTokens, 0);
  objc_storeStrong((id *)&self->_shareInvitees, 0);
  objc_storeStrong((id *)&self->_nearbyInvites, 0);
  objc_storeStrong((id *)&self->_compatibilityHashGroup, 0);
  objc_storeStrong((id *)&self->_nearbyCompatibleShortVersionHashes, 0);
  objc_storeStrong((id *)&self->_nearbyCompatibleVersionHashes, 0);
  objc_storeStrong((id *)&self->_nearbyQueryLastCheckDate, 0);
  objc_storeStrong((id *)&self->_nearbyPlayers, 0);
  objc_storeStrong((id *)&self->_lookForInviteQueue, 0);
  objc_storeStrong(&self->_nearbyPlayerIDHandler, 0);
  objc_storeStrong(&self->_nearbyPlayerHandler, 0);
  objc_storeStrong((id *)&self->_inviteesByUserID, 0);
  objc_storeStrong(&self->_recipientResponseHandler, 0);
  objc_storeStrong(&self->_inviteeResponseHandler, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong(&self->_inviteHandler, 0);

  objc_storeStrong((id *)&self->_groupActivityManager, 0);
}

+ (id)syncQueue
{
  if (syncQueue_onceToken_0 != -1) {
    dispatch_once(&syncQueue_onceToken_0, &__block_literal_global_42);
  }
  id v2 = (void *)syncQueue_sSyncQueue_0;

  return v2;
}

void __33__GKMatchmaker_Nearby__syncQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.GameKit.GKMatchmaker.nearby.sync", v2);
  id v1 = (void *)syncQueue_sSyncQueue_0;
  syncQueue_sSyncQueue_0 = (uint64_t)v0;
}

- (void)performSync:(id)a3
{
  dispatch_block_t block = a3;
  id v3 = [(id)objc_opt_class() syncQueue];
  id v4 = dispatch_get_current_queue();

  if (v4 == v3)
  {
    uint64_t v5 = NSString;
    label = dispatch_queue_get_label(v3);
    uint64_t v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v8 = [v5 stringWithFormat:@"%s invoked on the same queue(\"%s\", would deadlock at %@"), "-[GKMatchmaker(Nearby) performSync:]", label, v7];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKMatchmaker+Nearby.m"];
    id v10 = [v9 lastPathComponent];
    uint64_t v11 = [v5 stringWithFormat:@"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]", v8, "-[GKMatchmaker(Nearby) performSync:]", objc_msgSend(v10, "UTF8String"), 163];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
  }
  dispatch_sync(v3, block);
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  [(GKMatchmaker *)self stopNearbyAdvertising];
  if ([(GKMatchmaker *)self nearbyBrowsing])
  {
    [(GKMatchmaker *)self setWasNearbyBrowsing:1];
    [(GKMatchmaker *)self stopNearbyBrowsing];
  }
  [(GKMatchmaker *)self cancelSentNearbyInvites];

  [(GKMatchmaker *)self declineReceivedNearbyInvites];
}

- (void)applicationWillTerminateNotification:(id)a3
{
  [(GKMatchmaker *)self stopNearbyAdvertising];
  [(GKMatchmaker *)self stopNearbyBrowsing];
  [(GKMatchmaker *)self cancelSentNearbyInvites];
  [(GKMatchmaker *)self declineReceivedNearbyInvites];

  [(GKMatchmaker *)self leaveGroupActivity];
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(GKMatchmaker *)self wasNearbyBrowsing])
  {
    [(GKMatchmaker *)self setWasNearbyBrowsing:0];
    id v4 = [(GKMatchmaker *)self nearbyPlayerHandler];

    if (v4)
    {
      uint64_t v5 = [(GKMatchmaker *)self nearbyPlayers];
      id v6 = (void *)[v5 copy];

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = -[GKMatchmaker nearbyDeviceWithDeviceID:](self, "nearbyDeviceWithDeviceID:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
            [(GKMatchmaker *)self setNearbyDevice:v12 reachable:0];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      [(GKMatchmaker *)self startNearbyBrowsing];
    }
  }
}

- (void)setupNearbyDiscovery
{
  if ([(GKMatchmaker *)self nearbyDiscoverySetup])
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    id v4 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "skip setting up nearbyDiscovery as we have done it", buf, 2u);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: setupNearbyDiscovery", v9, 2u);
    }
    id v7 = +[GKDaemonProxy proxyForLocalPlayer];
    uint64_t v8 = [v7 multiplayerService];
    [v8 setupNearbyDiscovery];

    [(GKMatchmaker *)self setNearbyDiscoverySetup:1];
  }
}

- (int64_t)currentEnvironment
{
  return 5;
}

+ (id)descriptionForNearbyDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKey:@"profile"];
  id v5 = [v4 objectForKey:@"photoData"];
  if (v5)
  {
    id v23 = v3;
    long long v20 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
    long long v22 = v4;
    long long v19 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v21 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          long long v13 = [v7 objectForKey:v12];
          if ((unint64_t)[v13 length] < 9)
          {
            long long v16 = [v13 description];
          }
          else
          {
            long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v13, "bytes"), 8, 0);
            long long v15 = [v14 description];
            long long v16 = [v15 stringByReplacingOccurrencesOfString:@">" withString:@"...>"];
          }
          [v6 setObject:v16 forKey:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    [v19 setObject:v6 forKey:@"photoData"];
    [v20 setObject:v19 forKey:@"profile"];
    int v17 = [v20 description];

    id v4 = v22;
    id v3 = v23;
    id v5 = v21;
  }
  else
  {
    int v17 = [v3 description];
  }

  return v17;
}

- (void)receivedData:(id)a3 fromNearbyDeviceID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    uint64_t v11 = +[GKMatchmaker descriptionForNearbyDictionary:v7];
    int v19 = 138412546;
    *(void *)long long v20 = v11;
    *(_WORD *)&v20[8] = 2112;
    *(void *)&v20[10] = v6;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "received dict %@ from nearby deviceID %@", (uint8_t *)&v19, 0x16u);
  }
  if (v7)
  {
    uint64_t v12 = [(GKMatchmaker *)self nearbyDeviceWithDeviceID:v6];
    long long v13 = [v7 objectForKeyedSubscript:@"usePeerDiscovery"];
    int v14 = [v13 BOOLValue];

    if (v14) {
      [v12 setUsePeerDiscovery:1];
    }
    long long v15 = [v7 objectForKey:@"message"];
    uint64_t v16 = [v15 unsignedIntegerValue];

    switch(v16)
    {
      case 0:
        if ([(GKMatchmaker *)self nearbyAdvertising]) {
          [(GKMatchmaker *)self handleNearbyProfileQuery:v7 fromDevice:v12];
        }
        break;
      case 1:
        if ([(GKMatchmaker *)self nearbyBrowsing]) {
          [(GKMatchmaker *)self handleNearbyProfileResponse:v7 fromDevice:v12 withCompletionHandler:0];
        }
        break;
      case 2:
        if ([(GKMatchmaker *)self nearbyAdvertising]) {
          [(GKMatchmaker *)self handleNearbyInvite:v7 fromDevice:v12];
        }
        break;
      case 3:
        [(GKMatchmaker *)self handleNearbyInviteResponse:v7 fromDevice:v12];
        break;
      case 4:
        if ([(GKMatchmaker *)self nearbyAdvertising]) {
          [(GKMatchmaker *)self nearbyInviteWasCancelled:v7 fromDevice:v12];
        }
        break;
      case 5:
        [(GKMatchmaker *)self establishNearbyFriendRelationships:v7 fromDevice:v12];
        break;
      default:
        if (!os_log_GKGeneral) {
          id v17 = GKOSLoggers();
        }
        uint64_t v18 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        {
          int v19 = 67109634;
          *(_DWORD *)long long v20 = v16;
          *(_WORD *)&void v20[4] = 2112;
          *(void *)&v20[6] = v7;
          *(_WORD *)&v20[14] = 2112;
          *(void *)&v20[16] = v12;
          _os_log_error_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_ERROR, "Unknown nearby message type: %u dictionary:%@ from deviceID:%@", (uint8_t *)&v19, 0x1Cu);
        }
        break;
    }
  }
}

- (void)determineIfShouldRespondToNearbyPlayer:(id)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    dispatch_group_t v8 = dispatch_group_create();
    uint64_t v9 = [v7 objectForKey:@"playerID"];

    uint64_t v10 = +[GKPreferences shared];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke;
    void v13[3] = &unk_1E6470D90;
    void v13[4] = self;
    id v14 = v9;
    dispatch_group_t v15 = v8;
    id v16 = v6;
    uint64_t v11 = v8;
    id v12 = v9;
    [v10 getMultiplayerAllowedPlayerTypeWithHandler:v13];
  }
}

void __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = a2 == 0;
  id v5 = +[GKPreferences shared];
  unsigned int v6 = [v5 shouldDisallowInvitesFromStrangers];
  if (a2 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }

  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  if (v4)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) nearbyAdvertising];
    if (v8) {
      LOBYTE(v8) = [*(id *)(a1 + 32) shouldRespondToNearbyQuery];
    }
  }
  char v35 = v8;
  if (*((unsigned char *)v33 + 24)) {
    int v9 = v7;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1)
  {
    uint64_t v10 = +[GKLocalPlayer localPlayer];
    uint64_t v11 = v10;
    id v12 = *(void **)(a1 + 40);
    if (v12)
    {
      long long v13 = [v10 internal];
      id v14 = [v13 playerID];
      char v15 = [v12 isEqualToString:v14];

      if ((v15 & 1) == 0)
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        v46[0] = *(void *)(a1 + 40);
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke_2;
        v29[3] = &unk_1E6470D68;
        id v31 = &v32;
        id v30 = *(id *)(a1 + 48);
        +[GKPlayer loadPlayersForIdentifiersPrivate:v16 withCompletionHandler:v29];
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    uint64_t v11 = (id)os_log_GKMatch;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      int v19 = [NSNumber numberWithBool:a2 == 0];
      long long v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "nearbyAdvertising"));
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "shouldRespondToNearbyQuery"));
      long long v22 = [NSNumber numberWithBool:v7];
      *(_DWORD *)long long buf = 138413314;
      uint64_t v37 = v18;
      __int16 v38 = 2112;
      BOOL v39 = v19;
      __int16 v40 = 2112;
      id v41 = v20;
      __int16 v42 = 2112;
      id v43 = v21;
      __int16 v44 = 2112;
      long long v45 = v22;
      _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "should not respond to nearby player: %@. blockMultiplayer = %@, advertising = %@, should respond to query = %@, friends only = %@", buf, 0x34u);
    }
  }

  id v23 = *(NSObject **)(a1 + 48);
  long long v24 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke_100;
  block[3] = &unk_1E646E8B8;
  id v26 = *(id *)(a1 + 40);
  id v28 = &v32;
  id v27 = *(id *)(a1 + 56);
  dispatch_group_notify(v23, v24, block);

  _Block_object_dispose(&v32, 8);
}

void __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 lastObject];
  id v3 = [v4 friendBiDirectional];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isEqualToNumber:&unk_1F1E7EC60];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke_100(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[4];
    id v5 = NSNumber;
    uint64_t v6 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v7 = v3;
    int v8 = [v5 numberWithBool:v6];
    int v10 = 138412546;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    long long v13 = v8;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "should respond to nearby player %@:%@", (uint8_t *)&v10, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (BOOL)shouldRespondToNearbyQuery
{
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "always return YES for shouldRespondToNearbyQuery", v5, 2u);
  }
  return 1;
}

- (id)profileDictionaryForLocalPlayer
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = +[GKLocalPlayer localPlayer];
  v15[0] = @"playerID";
  id v3 = [v2 internal];
  uint64_t v4 = [v3 playerID];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1F1E47DF8;
  }
  v16[0] = v6;
  v15[1] = @"alias";
  uint64_t v7 = [v2 alias];
  int v8 = (void *)v7;
  if (v7) {
    int v9 = (__CFString *)v7;
  }
  else {
    int v9 = &stru_1F1E47DF8;
  }
  v16[1] = v9;
  v15[2] = @"photos";
  int v10 = [v2 internal];
  uint64_t v11 = [v10 photos];
  __int16 v12 = v11;
  if (!v11)
  {
    __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  v16[2] = v12;
  long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  if (!v11) {

  }
  return v13;
}

- (void)loadPhotoDataDictionaryWithHandler:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v21 = v3;
    id v5 = dispatch_group_create();
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = +[GKLocalPlayer localPlayer];
    uint64_t v6 = [v20 internal];
    uint64_t v7 = [v6 photos];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * v12);
          dispatch_group_enter(v5);
          uint64_t v14 = [v8 objectForKey:v13];
          char v15 = (void *)MEMORY[0x1E4F1C9B8];
          id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
          id v17 = dispatch_get_global_queue(0, 0);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __59__GKMatchmaker_Nearby__loadPhotoDataDictionaryWithHandler___block_invoke;
          v26[3] = &unk_1E6470DB8;
          id v27 = v22;
          id v28 = v14;
          uint64_t v29 = v5;
          id v18 = v14;
          [v15 _gkLoadRemoteImageDataForURL:v16 subdirectory:0 filename:0 queue:v17 handler:v26];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__GKMatchmaker_Nearby__loadPhotoDataDictionaryWithHandler___block_invoke_2;
    block[3] = &unk_1E646DC30;
    uint64_t v4 = v21;
    id v24 = v22;
    id v25 = v21;
    id v19 = v22;
    dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
  }
}

void __59__GKMatchmaker_Nearby__loadPhotoDataDictionaryWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    [*(id *)(a1 + 32) setObject:v4 forKey:*(void *)(a1 + 40)];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __59__GKMatchmaker_Nearby__loadPhotoDataDictionaryWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)unreleasedHash
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__GKMatchmaker_Nearby__unreleasedHash__block_invoke;
  block[3] = &unk_1E646D7F0;
  void block[4] = self;
  if (unreleasedHash_onceToken != -1) {
    dispatch_once(&unreleasedHash_onceToken, block);
  }
  return (id)unreleasedHash__unreleasedHash;
}

void __38__GKMatchmaker_Nearby__unreleasedHash__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v5 = +[GKGame currentGame];
  id v2 = [v5 bundleIdentifier];
  uint64_t v3 = [v1 hashForBundleID:v2 version:@"-1" platform:0];
  id v4 = (void *)unreleasedHash__unreleasedHash;
  unreleasedHash__unreleasedHash = v3;
}

- (id)compatibilityHashQueue
{
  if (compatibilityHashQueue_onceToken != -1) {
    dispatch_once(&compatibilityHashQueue_onceToken, &__block_literal_global_119);
  }
  id v2 = (void *)compatibilityHashQueue_sHashQueue;

  return v2;
}

void __46__GKMatchmaker_Nearby__compatibilityHashQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.gamecenter.compatibilityhashqueue", v2);
  id v1 = (void *)compatibilityHashQueue_sHashQueue;
  compatibilityHashQueue_sHashQueue = (uint64_t)v0;
}

- (void)getHashedCompatibilitySetsWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: getHashedCompatibilitySetsWithHandler", buf, 2u);
  }
  uint64_t v7 = [(GKMatchmaker *)self compatibilityHashQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke;
  v9[3] = &unk_1E646E198;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

void __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nearbyCompatibleVersionHashes];
  if (v2)
  {
  }
  else if (([*(id *)(a1 + 32) generatingCompatiblityHashes] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) compatibilityHashGroup];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_2;
    v8[3] = &unk_1E646DCA0;
    void v8[4] = *(void *)(a1 + 32);
    [v3 perform:v8];
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) compatibilityHashGroup];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_4;
    v6[3] = &unk_1E646DC30;
    id v5 = *(id *)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    [v4 notifyOnMainQueueWithBlock:v6];
  }
}

void __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setGeneratingCompatiblityHashes:1];
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_3;
  v6[3] = &unk_1E646E198;
  void v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 generateHashedCompatibilitySetWithHandler:v6];
}

uint64_t __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setGeneratingCompatiblityHashes:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) nearbyCompatibleVersionHashes];
  id v3 = [*(id *)(a1 + 32) nearbyCompatibleShortVersionHashes];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)generateHashedCompatibilitySetWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: generateHashedCompatibilitySet", buf, 2u);
  }
  id v7 = +[GKGame currentGame];
  id v8 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v9 = [v8 multiplayerService];
  id v10 = [v7 gameDescriptorDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __66__GKMatchmaker_Nearby__generateHashedCompatibilitySetWithHandler___block_invoke;
  void v13[3] = &unk_1E646E640;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  [v9 getCompatibilityMatrix:v10 handler:v13];
}

void __66__GKMatchmaker_Nearby__generateHashedCompatibilitySetWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:10];
  id v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:10];
  id v60 = v4;
  if ([v3 count] < 1)
  {
    uint64_t v37 = *(void **)(a1 + 32);
    __int16 v38 = [*(id *)(a1 + 40) bundleIdentifier];
    BOOL v39 = [*(id *)(a1 + 40) bundleVersion];
    __int16 v40 = objc_msgSend(v37, "hashForBundleID:version:platform:", v38, v39, objc_msgSend(*(id *)(a1 + 40), "platform"));
    [v60 addObject:v40];

    id v41 = *(void **)(a1 + 32);
    __int16 v42 = [*(id *)(a1 + 40) bundleIdentifier];
    id v43 = [*(id *)(a1 + 40) bundleVersion];
    __int16 v44 = [v41 hashForBundleID:v42 version:v43 platform:0];
    [v60 addObject:v44];

    long long v45 = *(void **)(a1 + 32);
    long long v46 = [*(id *)(a1 + 40) bundleIdentifier];
    uint64_t v47 = [*(id *)(a1 + 40) shortBundleVersion];
    __int16 v48 = objc_msgSend(v45, "hashForBundleID:version:platform:", v46, v47, objc_msgSend(*(id *)(a1 + 40), "platform"));
    [v5 addObject:v48];

    uint64_t v49 = *(void **)(a1 + 32);
    uint64_t v50 = [*(id *)(a1 + 40) bundleIdentifier];
    uint64_t v51 = [*(id *)(a1 + 40) shortBundleVersion];
    id v52 = [v49 hashForBundleID:v50 version:v51 platform:0];
    [v5 addObject:v52];

    id v4 = v60;
  }
  else
  {
    char v63 = v5;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v54 = v3;
    id obj = v3;
    uint64_t v57 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
    if (v57)
    {
      uint64_t v56 = *(void *)v74;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v74 != v56) {
            objc_enumerationMutation(obj);
          }
          uint64_t v58 = v6;
          id v7 = *(void **)(*((void *)&v73 + 1) + 8 * v6);
          id v8 = objc_msgSend(v7, "bundleID", v54);
          uint64_t v64 = [v7 platform];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v61 = v7;
          id v59 = [v7 versions];
          uint64_t v9 = [v59 countByEnumeratingWithState:&v69 objects:v86 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v70;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v70 != v11) {
                  objc_enumerationMutation(v59);
                }
                uint64_t v13 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                id v14 = [*(id *)(a1 + 32) hashForBundleID:v8 version:v13 platform:0];
                [v4 addObject:v14];
                if (!os_log_GKGeneral) {
                  id v15 = GKOSLoggers();
                }
                id v16 = os_log_GKMatch;
                if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412802;
                  long long v79 = v8;
                  __int16 v80 = 2112;
                  long long v81 = v13;
                  __int16 v82 = 2112;
                  long long v83 = v14;
                  _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "nearby compatibility matrix: bundleID = %@, version = %@, compatible hash = %@", buf, 0x20u);
                }
                id v17 = objc_msgSend(*(id *)(a1 + 32), "hashForBundleID:version:platform:", v8, v13, objc_msgSend(v61, "platform"));

                [v4 addObject:v17];
                if (!os_log_GKGeneral) {
                  id v18 = GKOSLoggers();
                }
                id v19 = (void *)os_log_GKMatch;
                if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
                {
                  long long v20 = NSNumber;
                  uint64_t v21 = v19;
                  id v22 = [v20 numberWithInteger:v64];
                  *(_DWORD *)long long buf = 138413058;
                  long long v79 = v8;
                  __int16 v80 = 2112;
                  long long v81 = v22;
                  __int16 v82 = 2112;
                  long long v83 = v13;
                  __int16 v84 = 2112;
                  v85 = v17;
                  _os_log_impl(&dword_1C2D22000, v21, OS_LOG_TYPE_INFO, "nearby compatibility matrix: bundleID = %@, platform = %@, version = %@, compatible hash = %@", buf, 0x2Au);

                  id v4 = v60;
                }
              }
              uint64_t v10 = [v59 countByEnumeratingWithState:&v69 objects:v86 count:16];
            }
            while (v10);
          }

          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v62 = [v61 shortVersions];
          uint64_t v23 = [v62 countByEnumeratingWithState:&v65 objects:v77 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v66;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v66 != v25) {
                  objc_enumerationMutation(v62);
                }
                id v27 = *(void **)(*((void *)&v65 + 1) + 8 * j);
                id v28 = [*(id *)(a1 + 32) hashForBundleID:v8 version:v27 platform:0];
                [v63 addObject:v28];
                if (!os_log_GKGeneral) {
                  id v29 = GKOSLoggers();
                }
                long long v30 = os_log_GKMatch;
                if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412802;
                  long long v79 = v8;
                  __int16 v80 = 2112;
                  long long v81 = v27;
                  __int16 v82 = 2112;
                  long long v83 = v28;
                  _os_log_impl(&dword_1C2D22000, v30, OS_LOG_TYPE_INFO, "nearby compatibility matrix: bundleID = %@, shortVersion = %@, compatible hash = %@", buf, 0x20u);
                }
                long long v31 = [*(id *)(a1 + 32) hashForBundleID:v8 version:v27 platform:v64];

                [v63 addObject:v31];
                if (!os_log_GKGeneral) {
                  id v32 = GKOSLoggers();
                }
                long long v33 = (void *)os_log_GKMatch;
                if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
                {
                  uint64_t v34 = NSNumber;
                  uint64_t v35 = v33;
                  int64_t v36 = [v34 numberWithInteger:v64];
                  *(_DWORD *)long long buf = 138413058;
                  long long v79 = v8;
                  __int16 v80 = 2112;
                  long long v81 = v36;
                  __int16 v82 = 2112;
                  long long v83 = v27;
                  __int16 v84 = 2112;
                  v85 = v31;
                  _os_log_impl(&dword_1C2D22000, v35, OS_LOG_TYPE_INFO, "nearby compatibility matrix: bundleID = %@, platform = %@, shortVersion = %@, compatible hash = %@", buf, 0x2Au);

                  id v4 = v60;
                }
              }
              uint64_t v24 = [v62 countByEnumeratingWithState:&v65 objects:v77 count:16];
            }
            while (v24);
          }

          uint64_t v6 = v58 + 1;
        }
        while (v58 + 1 != v57);
        uint64_t v57 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
      }
      while (v57);
    }

    id v3 = v54;
    id v5 = v63;
  }
  objc_msgSend(*(id *)(a1 + 32), "setNearbyCompatibleVersionHashes:", v4, v54);
  [*(id *)(a1 + 32) setNearbyCompatibleShortVersionHashes:v5];
  uint64_t v53 = *(void *)(a1 + 48);
  if (v53) {
    (*(void (**)(void))(v53 + 16))();
  }
}

- (id)_nearbyDeviceWithDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMatchmaker *)self nearbyPlayers];
  uint64_t v6 = [v5 objectForKey:v4];
  if (!v6)
  {
    uint64_t v6 = +[GKNearbyDevice nearbyDeviceWithID:v4];
    id v7 = [v6 deviceID];
    [v5 setObject:v6 forKey:v7];
  }

  return v6;
}

- (id)nearbyDeviceWithDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__GKMatchmaker_Nearby__nearbyDeviceWithDeviceID___block_invoke;
  v8[3] = &unk_1E6470CC8;
  uint64_t v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(GKMatchmaker *)self performSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __49__GKMatchmaker_Nearby__nearbyDeviceWithDeviceID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nearbyDeviceWithDeviceID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)hashForBundleID:(id)a3 version:(id)a4 platform:(int64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (__CFString *)a4;
  if (!os_log_GKGeneral) {
    id v9 = GKOSLoggers();
  }
  uint64_t v10 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: hashForBundleID", buf, 2u);
  }
  if (!v8)
  {
    uint64_t v11 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v12 = GKOSLoggers();
      uint64_t v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "version is nil while retrieving the hash for bundleID: %@", buf, 0xCu);
    }
    id v8 = &stru_1F1E47DF8;
  }
  uint64_t v13 = [v7 stringByAppendingString:@"."];
  id v14 = [v13 stringByAppendingString:v8];

  if (a5)
  {
    id v15 = NSString;
    id v16 = [NSNumber numberWithInteger:a5];
    id v17 = [v15 stringWithFormat:@".%@", v16];
    uint64_t v18 = [v14 stringByAppendingString:v17];

    id v14 = (void *)v18;
  }
  id v19 = v14;
  long long v20 = (unsigned char *)[v19 UTF8String];
  int v21 = *v20;
  if (*v20)
  {
    id v22 = v20 + 1;
    LODWORD(v23) = 5381;
    do
    {
      uint64_t v23 = (33 * v23 + v21);
      int v24 = *v22++;
      int v21 = v24;
    }
    while (v24);
  }
  else
  {
    uint64_t v23 = 5381;
  }
  uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%X", v23);

  return v25;
}

- (id)hashForCurrentGameUsingBundleVersion
{
  uint64_t v3 = +[GKGame currentGame];
  uint64_t v4 = [v3 bundleIdentifier];
  id v5 = [v3 bundleVersion];
  id v6 = [(GKMatchmaker *)self hashForBundleID:v4 version:v5 platform:0];

  return v6;
}

- (id)hashForCurrentGameUsingShortBundleVersionAndPlatform
{
  uint64_t v3 = +[GKGame currentGame];
  uint64_t v4 = [v3 shortBundleVersion];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 bundleVersion];
  }
  id v7 = v6;

  id v8 = [v3 bundleIdentifier];
  id v9 = -[GKMatchmaker hashForBundleID:version:platform:](self, "hashForBundleID:version:platform:", v8, v7, [v3 platform]);

  return v9;
}

- (void)startNearbyAdvertising
{
  v21[3] = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  uint64_t v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "startNearbyAdvertising", buf, 2u);
  }
  id v5 = +[GKLocalPlayer localPlayer];
  if ([v5 isAuthenticated]
    && ![(GKMatchmaker *)self nearbyAdvertising]
    && !+[GKGame isGameCenter])
  {
    id v6 = +[GKPreferences shared];
    if ([v6 shouldAllowNearbyMultiplayer])
    {
      id v7 = +[GKPreferences shared];
      uint64_t v8 = [v7 multiplayerAllowedPlayerType];

      if (v8)
      {
        [(GKMatchmaker *)self getHashedCompatibilitySetsWithHandler:0];
        [(GKMatchmaker *)self setupNearbyDiscovery];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke;
        v18[3] = &unk_1E646D7F0;
        void v18[4] = self;
        [(GKMatchmaker *)self performSync:v18];
        v20[0] = @"e";
        id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[GKMatchmaker currentEnvironment](self, "currentEnvironment"));
        v21[0] = v9;
        v20[1] = @"h";
        uint64_t v10 = [(GKMatchmaker *)self hashForCurrentGameUsingBundleVersion];
        v21[1] = v10;
        v20[2] = @"hp";
        uint64_t v11 = [(GKMatchmaker *)self hashForCurrentGameUsingShortBundleVersionAndPlatform];
        v21[2] = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

        uint64_t v13 = +[GKDaemonProxy proxyForLocalPlayer];
        id v14 = [v13 multiplayerService];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_2;
        v16[3] = &unk_1E646F010;
        void v16[4] = self;
        id v17 = v12;
        id v15 = v12;
        [v14 startNearbyAdvertisingWithDiscoveryInfo:v15 handler:v16];
      }
    }
    else
    {
    }
  }
}

void __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setNearbyInvites:v2];

  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setNearbyPlayers:v3];
}

void __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_3;
  block[3] = &unk_1E646F558;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setNearbyQueryAllowance:10.0];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setNearbyQueryLastCheckDate:v2];

  [*(id *)(a1 + 32) setNearbyAdvertising:1];
  id v3 = (uint64_t *)(a1 + 40);
  if (*(void *)(a1 + 40))
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    id v5 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_3_cold_1(v3, v5);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    id v7 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "startNearbyAdvertising:Started advertising for nearby multiplayer", (uint8_t *)&v11, 2u);
    }
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    id v9 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "start advertising for nearby multiplayer: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)stopNearbyAdvertising
{
  if ([(GKMatchmaker *)self nearbyAdvertising])
  {
    id v3 = +[GKDaemonProxy proxyForLocalPlayer];
    id v4 = [v3 multiplayerService];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__GKMatchmaker_Nearby__stopNearbyAdvertising__block_invoke;
    v5[3] = &unk_1E646D7F0;
    void v5[4] = self;
    [v4 stopNearbyAdvertisingWithHandler:v5];
  }
}

void __45__GKMatchmaker_Nearby__stopNearbyAdvertising__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNearbyAdvertising:0];
  if (!os_log_GKGeneral) {
    id v1 = GKOSLoggers();
  }
  uint64_t v2 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v2, OS_LOG_TYPE_INFO, "stopNearbyAdvertising: stopped advertising for nearby players", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "stopped advertising for nearby multiplayer", v5, 2u);
  }
}

- (void)updateNearbyAdvertising
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "updateNearbyAdvertising", v7, 2u);
  }
  if ([(GKMatchmaker *)self hasInviteListener]
    && (+[GKPreferences shared],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 shouldAllowNearbyMultiplayer],
        v5,
        v6))
  {
    [(GKMatchmaker *)self startNearbyAdvertising];
  }
  else
  {
    [(GKMatchmaker *)self stopNearbyAdvertising];
  }
}

- (void)startNearbyBrowsing
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: startNearbyBrowsing", buf, 2u);
  }
  id v5 = +[GKLocalPlayer localPlayer];
  if ([v5 isAuthenticated])
  {
    if (![(GKMatchmaker *)self nearbyBrowsing])
    {
      int v6 = +[GKPreferences shared];
      uint64_t v7 = [v6 multiplayerAllowedPlayerType];

      if (v7)
      {
        [(GKMatchmaker *)self getHashedCompatibilitySetsWithHandler:0];
        [(GKMatchmaker *)self setupNearbyDiscovery];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        void v13[2] = __43__GKMatchmaker_Nearby__startNearbyBrowsing__block_invoke;
        void v13[3] = &unk_1E646D7F0;
        void v13[4] = self;
        [(GKMatchmaker *)self performSync:v13];
        id v8 = +[GKDaemonProxy proxyForPlayer:v5];
        id v9 = [v8 multiplayerService];
        uint64_t v10 = [v5 internal];
        int v11 = [v10 playerID];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __43__GKMatchmaker_Nearby__startNearbyBrowsing__block_invoke_146;
        v12[3] = &unk_1E646D7F0;
        void v12[4] = self;
        [v9 startNearbyBrowsingWithPlayerID:v11 handler:v12];
      }
    }
  }
}

void __43__GKMatchmaker_Nearby__startNearbyBrowsing__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = v3;
    int v6 = [v4 nearbyPlayers];
    int v8 = 134217984;
    uint64_t v9 = [v6 count];
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: creating new nearbyPlayers cache (clearing %lu previous entries)", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(a1 + 32) setNearbyPlayers:v7];
}

void __43__GKMatchmaker_Nearby__startNearbyBrowsing__block_invoke_146(uint64_t a1)
{
  [*(id *)(a1 + 32) setNearbyBrowsing:1];
  if (!os_log_GKGeneral) {
    id v1 = GKOSLoggers();
  }
  id v2 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1C2D22000, v2, OS_LOG_TYPE_INFO, "started browsing for nearby players", v3, 2u);
  }
}

- (void)stopNearbyBrowsing
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: stopNearbyBrowsing", buf, 2u);
  }
  if ([(GKMatchmaker *)self nearbyBrowsing])
  {
    id v5 = +[GKDaemonProxy proxyForLocalPlayer];
    int v6 = [v5 multiplayerService];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__GKMatchmaker_Nearby__stopNearbyBrowsing__block_invoke;
    v7[3] = &unk_1E646D7F0;
    void v7[4] = self;
    [v6 stopNearbyBrowsingWithHandler:v7];
  }
}

void __42__GKMatchmaker_Nearby__stopNearbyBrowsing__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNearbyBrowsing:0];
  if (!os_log_GKGeneral) {
    id v1 = GKOSLoggers();
  }
  id v2 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1C2D22000, v2, OS_LOG_TYPE_INFO, "stopped browsing for nearby players", v3, 2u);
  }
}

- (void)foundNearbyDeviceID:(id)a3 discoveryInfo:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "found nearby deviceID: %@ discoveryInfo: %@", buf, 0x16u);
  }
  uint64_t v10 = [v7 objectForKey:@"e"];
  uint64_t v11 = [v10 integerValue];

  if (v11 == [(GKMatchmaker *)self currentEnvironment])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__GKMatchmaker_Nearby__foundNearbyDeviceID_discoveryInfo___block_invoke;
    v14[3] = &unk_1E6470DE0;
    void v14[4] = self;
    id v15 = v7;
    id v16 = v6;
    [(GKMatchmaker *)self getHashedCompatibilitySetsWithHandler:v14];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v12 = GKOSLoggers();
    }
    uint64_t v13 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "ignoring device %@, environment mismatch", buf, 0xCu);
    }
  }
}

void __58__GKMatchmaker_Nearby__foundNearbyDeviceID_discoveryInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) unreleasedHash];
  if ([v6 containsObject:v7]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = [v5 containsObject:v7];
  }
  uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"hp"];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"h"];
  }
  id v12 = v11;

  if (v6)
  {
    int v13 = [v6 containsObject:v12];
    if (!v5) {
      goto LABEL_20;
    }
  }
  else
  {
    int v13 = 1;
    if (!v5)
    {
LABEL_20:
      if (!os_log_GKGeneral) {
        id v23 = GKOSLoggers();
      }
      int v24 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1C2D22000, v24, OS_LOG_TYPE_INFO, "advertised app may be compatible", buf, 2u);
      }
      uint64_t v25 = [*(id *)(a1 + 32) nearbyDeviceWithDeviceID:*(void *)(a1 + 48)];
      id v26 = +[GKGame currentGame];
      id v27 = [MEMORY[0x1E4F1CA60] dictionary];
      id v28 = [NSNumber numberWithUnsignedInteger:0];
      [v27 setObject:v28 forKeyedSubscript:@"message"];

      uint64_t v29 = [v26 bundleIdentifier];
      [v27 setObject:v29 forKeyedSubscript:@"bundleID"];

      long long v30 = [v26 bundleVersion];
      [v27 setObject:v30 forKeyedSubscript:@"bundleVersion"];

      long long v31 = [NSNumber numberWithBool:v8];
      [v27 setObject:v31 forKeyedSubscript:@"isDevelopmentVersion"];

      id v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v26, "platform"));
      [v27 setObject:v32 forKeyedSubscript:@"platform"];

      long long v33 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"usePeerDiscovery"];
      LODWORD(v30) = [v33 BOOLValue];

      if (v30)
      {
        uint64_t v34 = [NSNumber numberWithBool:1];
        [v27 setObject:v34 forKeyedSubscript:@"usePeerDiscovery"];

        [v25 setUsePeerDiscovery:1];
        uint64_t v35 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"devicePushToken"];

        if (v35)
        {
          int64_t v36 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"devicePushToken"];
          [v25 setDevicePushToken:v36];
        }
      }
      uint64_t v37 = +[GKGame currentGame];
      __int16 v38 = [v37 shortBundleVersion];

      if (v38)
      {
        BOOL v39 = [v26 shortBundleVersion];
        [v27 setObject:v39 forKeyedSubscript:@"shortBundleVersion"];
      }
      [v25 sendDictionary:v27 withCompletionHandler:0];

      goto LABEL_30;
    }
  }
  int v14 = [v5 containsObject:v12];
  if (v12) {
    int v15 = v8;
  }
  else {
    int v15 = 1;
  }
  if (((v15 | v13) & 1) != 0 || v14) {
    goto LABEL_20;
  }
  if (!os_log_GKGeneral) {
    id v16 = GKOSLoggers();
  }
  id v17 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    __int16 v19 = [v5 allObjects];
    id v20 = [v19 componentsJoinedByString:@", "];
    uint64_t v21 = [v6 allObjects];
    id v22 = [v21 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138412546;
    id v41 = v20;
    __int16 v42 = 2112;
    id v43 = v22;
    _os_log_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_INFO, "advertised app not compatible - compatible Version Hashes: %@, compatible Short Version Hashes: %@", buf, 0x16u);
  }
LABEL_30:
}

- (void)lostNearbyDeviceID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "lost nearby deviceID: %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(GKMatchmaker *)self nearbyDeviceWithDeviceID:v4];
  [(GKMatchmaker *)self setNearbyDevice:v7 reachable:0];
}

- (void)handleNearbyProfileResponse:(id)a3 fromDevice:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 state] && objc_msgSend(v9, "state") != 1)
  {
    if (!os_log_GKGeneral) {
      id v18 = GKOSLoggers();
    }
    __int16 v19 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v20 = v19;
      uint64_t v21 = [v9 deviceID];
      id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "state"));
      *(_DWORD *)long long buf = 138412546;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      long long v31 = v22;
      _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "not handling profile response from deviceID: %@, because the state of this device is: %@", buf, 0x16u);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    id v12 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      int v13 = v12;
      int v14 = [v9 deviceID];
      int v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "state"));
      *(_DWORD *)long long buf = 138412546;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      long long v31 = v15;
      _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "received profile response from deviceID: %@, device state: %@", buf, 0x16u);
    }
    id v16 = +[GKDaemonProxy proxyForLocalPlayer];
    id v17 = [v16 multiplayerService];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E6470E08;
    id v24 = v8;
    id v25 = v9;
    id v26 = self;
    id v27 = v10;
    [v17 updateCacheWithNearbyProfileDictionary:v24 handler:v23];
  }
}

void __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = +[GKPlayer canonicalizedPlayerForInternal:v3];
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      id v8 = [v3 conciseDescription];
      id v9 = [a1[5] deviceID];
      *(_DWORD *)long long buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "received player %@ response from deviceID: %@", buf, 0x16u);
    }
    if (([v4 isLocalPlayer] & 1) == 0)
    {
      id v16 = v4;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      BOOL v11 = +[GKMatchmaker canPlayMultiplayerGameWithPlayers:v10];

      if (v11)
      {
        [a1[5] setPlayer:v4];
        [a1[5] setState:1];
        [a1[6] setNearbyDevice:a1[5] reachable:1];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke_169;
        v14[3] = &unk_1E646D7A0;
        id v15 = a1[7];
        [v4 updateScopedIDs:v14];
      }
    }
  }
  else
  {
    id v12 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v13 = GKOSLoggers();
      id v12 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke_cold_1((uint64_t)a1, v12);
    }
  }
}

uint64_t __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke_169(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int)numberOfNearbyDevicesForPlayer:(id)a3 withState:(int64_t)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__GKMatchmaker_Nearby__numberOfNearbyDevicesForPlayer_withState___block_invoke;
  v9[3] = &unk_1E6470E30;
  void v9[4] = self;
  int64_t v12 = a4;
  id v7 = v6;
  id v10 = v7;
  BOOL v11 = &v13;
  [(GKMatchmaker *)self performSync:v9];
  LODWORD(self) = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return (int)self;
}

void __65__GKMatchmaker_Nearby__numberOfNearbyDevicesForPlayer_withState___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) nearbyPlayers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(a1 + 32) _nearbyDeviceWithDeviceID:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
        if ([v7 state] == *(void *)(a1 + 56))
        {
          id v8 = *(void **)(a1 + 40);
          id v9 = [v7 player];
          LODWORD(v8) = [v8 isEqual:v9];

          if (v8) {
            ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)setNearbyDevice:(id)a3 reachable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (!v6) {
    goto LABEL_16;
  }
  if (!v4)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke;
    v19[3] = &unk_1E646EC80;
    void v19[4] = self;
    id v12 = v6;
    id v20 = v12;
    [(GKMatchmaker *)self performSync:v19];
    if ([v12 state] != 1)
    {
      long long v13 = &v20;
LABEL_15:

      goto LABEL_16;
    }
    if ([v12 usePeerDiscovery])
    {
    }
    else
    {
      int v14 = [v12 player];
      int v15 = [(GKMatchmaker *)self numberOfNearbyDevicesForPlayer:v14 withState:1];

      if (v15) {
        goto LABEL_16;
      }
    }
LABEL_14:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke_3;
    block[3] = &unk_1E6470E80;
    void block[4] = self;
    long long v13 = &v17;
    id v17 = v7;
    BOOL v18 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_15;
  }
  id v8 = [v6 player];
  uint64_t v9 = [(GKMatchmaker *)self numberOfNearbyDevicesForPlayer:v8 withState:1];

  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  long long v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    -[GKMatchmaker(Nearby) setNearbyDevice:reachable:](v11, v9, v7);
  }
  if (v9 == 1) {
    goto LABEL_14;
  }
LABEL_16:
}

void __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nearbyPlayers];
  uint64_t v3 = [*(id *)(a1 + 40) deviceID];
  [v2 removeObjectForKey:v3];

  BOOL v4 = [*(id *)(a1 + 32) nearbyPlayers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke_2;
  v5[3] = &unk_1E6470E58;
  void v5[4] = *(void *)(a1 + 32);
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 player];
  id v7 = [v5 player];
  if ([v6 isEqual:v7])
  {
    char v8 = [v5 usePeerDiscovery];

    if (v8) {
      goto LABEL_6;
    }
    id v6 = [*(id *)(a1 + 32) nearbyPlayers];
    [v6 removeObjectForKey:v9];
  }
  else
  {
  }
LABEL_6:
}

void __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nearbyPlayerHandler];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    char v8 = [v3 nearbyPlayerHandler];
    BOOL v4 = [*(id *)(a1 + 40) player];
    v8[2](v8, v4, *(unsigned __int8 *)(a1 + 48));
  }
  else
  {
    id v5 = [v3 nearbyPlayerIDHandler];

    if (!v5) {
      return;
    }
    char v8 = [*(id *)(a1 + 32) nearbyPlayerIDHandler];
    BOOL v4 = [*(id *)(a1 + 40) player];
    id v6 = [v4 internal];
    id v7 = [v6 playerID];
    v8[2](v8, v7, *(unsigned __int8 *)(a1 + 48));
  }
}

- (id)nearbyDevicesForPlayer:(id)a3 withState:(int64_t)a4
{
  id v6 = a3;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  char v8 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "GKMatchMaker+Nearby: nearbyDevicesForPlayer:withState", buf, 2u);
  }
  *(void *)long long buf = 0;
  id v17 = buf;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__13;
  id v20 = __Block_byref_object_dispose__13;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__GKMatchmaker_Nearby__nearbyDevicesForPlayer_withState___block_invoke;
  v12[3] = &unk_1E6470E30;
  void v12[4] = self;
  int64_t v15 = a4;
  id v9 = v6;
  id v13 = v9;
  int v14 = buf;
  [(GKMatchmaker *)self performSync:v12];
  id v10 = *((id *)v17 + 5);

  _Block_object_dispose(buf, 8);

  return v10;
}

void __57__GKMatchmaker_Nearby__nearbyDevicesForPlayer_withState___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) nearbyPlayers];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(a1 + 32) _nearbyDeviceWithDeviceID:*(void *)(*((void *)&v14 + 1) + 8 * v6)];
        if ([v7 state] == *(void *)(a1 + 56))
        {
          if (!*(void *)(a1 + 40)
            || ([v7 player],
                char v8 = objc_claimAutoreleasedReturnValue(),
                int v9 = [v8 isEqual:*(void *)(a1 + 40)],
                v8,
                v9))
          {
            id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            if (!v10)
            {
              uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
              id v13 = *(void **)(v12 + 40);
              *(void *)(v12 + 40) = v11;

              id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            }
            [v10 addObject:v7];
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (id)formAGKMatchRequestForNearbyInviteWithOriginalRequest:(id)a3 nearbyPlayerIDs:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  [(GKMatchmaker *)self reduceRecipientsForMatchRequest:v7 toPlayersWithPlayerIDs:v6];

  return v7;
}

- (void)reduceRecipientsForMatchRequest:(id)a3 toPlayersWithPlayerIDs:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = v5;
  char v8 = [v5 recipients];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = [v13 internal];
        long long v15 = [v14 playerID];
        int v16 = [v6 containsObject:v15];

        if (v16) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
  [v19 setRecipients:v17];

  uint64_t v18 = [v19 internal];
  [v18 setRecipientPlayerIDs:v6];
}

- (void)inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest:(id)a3 handler:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest", buf, 2u);
  }
  uint64_t v10 = [v6 internal];
  uint64_t v11 = [v10 matchType];

  if (v11 == 1)
  {
    v7[2](v7);
  }
  else
  {
    BOOL v39 = v7;
    uint64_t v12 = [(GKMatchmaker *)self match];
    id v13 = [v12 transportContext];
    [v13 updateForLegacyNearbyInvite];

    id v41 = [MEMORY[0x1E4F1CA80] set];
    id v43 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    __int16 v40 = v6;
    long long v14 = [v6 internal];
    long long v15 = [v14 recipientPlayerIDs];

    id obj = v15;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v44 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v53 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          long long v21 = +[GKPlayer playerFromPlayerID:v20];
          long long v22 = [(GKMatchmaker *)self nearbyDevicesForPlayer:v21 withState:1];
          if ([v22 count])
          {
            if (!v18)
            {
              long long v23 = [(GKMatchmaker *)self match];
              uint64_t v18 = [v23 nearbyConnectionData];
            }
            [v43 addObjectsFromArray:v22];
            id v24 = +[GKReporter reporter];
            [v24 reportEvent:@"com.apple.GameKit.invite" type:@"initiate.nearby"];

            uint64_t v25 = +[GKReporter reporter];
            [v25 reportEvent:@"com.apple.GameKit.MultiplayerPlayerSelection" type:@"NearbySelected"];

            id v26 = [(GKMatchmaker *)self invitedNearbyPlayers];
            id v27 = (void *)MEMORY[0x1E4F1CAD0];
            [v21 internal];
            v29 = id v28 = v18;
            __int16 v30 = [v29 playerID];
            long long v31 = [v27 setWithObject:v30];
            [v26 unionSet:v31];

            uint64_t v32 = [(GKMatchmaker *)self match];
            long long v33 = [v21 internal];
            uint64_t v57 = v33;
            uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
            [v32 reportInviteSentWithApproach:3 isHosted:0 recipients:v34];

            uint64_t v18 = v28;
          }
          else
          {
            [v41 addObject:v20];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
    }

    if ([v43 count])
    {
      uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
      [(GKMatchmaker *)self setAcceptedInviteesTokens:v35];

      int64_t v36 = +[GKDaemonProxy proxyForLocalPlayer];
      uint64_t v37 = [v36 friendService];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      void v45[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke;
      v45[3] = &unk_1E6470EF8;
      id v46 = v18;
      id v6 = v40;
      id v47 = v40;
      __int16 v48 = self;
      id v49 = v43;
      __int16 v38 = v41;
      id v50 = v41;
      id v7 = v39;
      uint64_t v51 = v39;
      [v37 getNearbyTokenForLocalPlayerWithHandler:v45];
    }
    else
    {
      id v7 = v39;
      v39[2](v39);
      id v6 = v40;
      __int16 v38 = v41;
    }
  }
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke(uint64_t a1, void *a2)
{
  v46[7] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v45[0] = @"message";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:2];
  uint64_t v6 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  v46[0] = v4;
  v46[1] = v6;
  v45[1] = @"connectionData";
  void v45[2] = @"inviteMessage";
  uint64_t v7 = [v5 inviteMessage];
  id v8 = (void *)v7;
  uint64_t v9 = &stru_1F1E47DF8;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  void v46[2] = v9;
  v45[3] = @"playerGroup";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "playerGroup"));
  v46[3] = v10;
  void v45[4] = @"playerAttributes";
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "playerAttributes"));
  void v46[4] = v11;
  v45[5] = @"profile";
  uint64_t v12 = [*(id *)(a1 + 48) profileDictionaryForLocalPlayer];
  v45[6] = @"playerNearbyToken";
  v46[5] = v12;
  v46[6] = v3;
  id v26 = v3;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:7];

  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker+Nearby.m", 966, "-[GKMatchmaker(Nearby) inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest:handler:]_block_invoke");
  long long v14 = +[GKDispatchGroup dispatchGroupWithName:v13];

  long long v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v25 = a1;
  id obj = *(id *)(a1 + 56);
  uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v21 setState:2];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_2;
        v36[3] = &unk_1E646E5C8;
        void v36[4] = v21;
        id v37 = v29;
        id v38 = v15;
        id v39 = v16;
        [v14 perform:v36];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v18);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  uint8_t v30[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_195;
  v30[3] = &unk_1E6470ED0;
  id v31 = v16;
  id v32 = v15;
  id v33 = *(id *)(v25 + 64);
  *(_OWORD *)id obja = *(_OWORD *)(v25 + 40);
  id v22 = obja[0];
  int8x16_t v34 = vextq_s8(*(int8x16_t *)obja, *(int8x16_t *)obja, 8uLL);
  id v35 = *(id *)(v25 + 72);
  id v23 = v15;
  id v24 = v16;
  [v14 notifyOnMainQueueWithBlock:v30];
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_3;
  v9[3] = &unk_1E646E048;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = v3;
  id v8 = v3;
  [v5 sendDictionary:v6 withCompletionHandler:v9];
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    id v5 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_3_cold_1((uint64_t)a1, v5, v6);
    }
    uint64_t v7 = (void *)a1[6];
  }
  else
  {
    uint64_t v7 = (void *)a1[7];
  }
  [v7 addObject:a1[5]];
  (*(void (**)(void))(a1[8] + 16))();
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_195(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = *(void **)(a1 + 32);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_2_196;
  v24[3] = &unk_1E6470EA8;
  id v4 = v2;
  id v25 = v4;
  [v3 enumerateObjectsUsingBlock:v24];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "player", (void)v20);
        char v12 = [v4 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          id v13 = *(void **)(a1 + 48);
          id v14 = [v10 player];
          long long v15 = [v14 internal];
          uint64_t v16 = [v15 playerID];
          [v13 addObject:v16];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v18 = *(void **)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v19 = [*(id *)(a1 + 48) allObjects];
  [v18 reduceRecipientsForMatchRequest:v17 toPlayersWithPlayerIDs:v19];

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_2_196(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 player];
  [v2 addObject:v3];
}

- (void)inviteAnyNearbyPlayersViaGCSWithRequest:(id)a3 onlineConnectionData:(id)a4 handler:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  id v35 = v9;
  id v36 = v8;
  uint64_t v11 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: inviteAnyNearbyPlayersViaGCSWithRequest", buf, 2u);
  }
  char v12 = [MEMORY[0x1E4F1CA80] set];
  id v13 = [MEMORY[0x1E4F1CA80] set];
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v37 = v7;
  long long v15 = [v7 internal];
  uint64_t v16 = [v15 recipientPlayerIDs];

  id obj = v16;
  uint64_t v44 = [v16 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v44)
  {
    long long v41 = v12;
    uint64_t v42 = *(void *)v55;
    id v39 = v14;
    long long v40 = v13;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v55 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v19 = +[GKPlayer playerFromPlayerID:v18];
        long long v20 = [(GKMatchmaker *)self nearbyDevicesForPlayer:v19 withState:1];
        if ([v20 count])
        {
          long long v45 = v19;
          [v13 addObject:v18];
          long long v21 = [MEMORY[0x1E4F1CA48] array];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v22 = v20;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v51;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v51 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void **)(*((void *)&v50 + 1) + 8 * j);
                id v28 = [v27 devicePushToken];

                if (v28)
                {
                  uint64_t v29 = [v27 devicePushToken];
                  [v21 addObject:v29];
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
            }
            while (v24);
          }

          id v14 = v39;
          [v39 setObject:v21 forKeyedSubscript:v18];

          id v13 = v40;
          char v12 = v41;
          uint64_t v19 = v45;
        }
        else
        {
          [v12 addObject:v18];
        }
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v44);
  }

  if ([v13 count])
  {
    __int16 v30 = [v13 allObjects];
    id v31 = v37;
    id v32 = [(GKMatchmaker *)self formAGKMatchRequestForNearbyInviteWithOriginalRequest:v37 nearbyPlayerIDs:v30];

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    void v46[2] = __93__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaGCSWithRequest_onlineConnectionData_handler___block_invoke;
    v46[3] = &unk_1E6470F20;
    void v46[4] = self;
    id v47 = v37;
    id v48 = v12;
    id v33 = v35;
    id v49 = v35;
    int8x16_t v34 = v36;
    [(GKMatchmaker *)self invitePlayersWithRequest:v32 serverHosted:0 onlineConnectionData:v36 devicePushTokenMap:v14 isNearbyInvite:1 completionHandler:v46];
  }
  else
  {
    id v33 = v35;
    v35[2](v35);
    int8x16_t v34 = v36;
    id v31 = v37;
  }
}

void __93__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaGCSWithRequest_onlineConnectionData_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    char v12 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __93__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaGCSWithRequest_onlineConnectionData_handler___block_invoke_cold_1((uint64_t)v10, v12);
    }
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    long long v15 = [*(id *)(a1 + 48) allObjects];
    [v13 reduceRecipientsForMatchRequest:v14 toPlayersWithPlayerIDs:v15];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)cancelNearbyInvitesToPlayers:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchMaker: cancelNearbyInvitesToPlayers", buf, 2u);
  }
  id v36 = @"message";
  id v7 = [NSNumber numberWithUnsignedInteger:4];
  v37[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v13 = [(GKMatchmaker *)self nearbyDevicesForPlayer:v12 withState:2];
        if ([v13 count])
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v26 != v17) {
                  objc_enumerationMutation(v14);
                }
                [*(id *)(*((void *)&v25 + 1) + 8 * j) sendDictionary:v8 withCompletionHandler:0];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
            }
            while (v16);
          }

          uint64_t v19 = [(GKMatchmaker *)self invitedNearbyPlayers];
          long long v20 = [v12 internal];
          long long v21 = [v20 playerID];
          [v19 removeObject:v21];

          id v22 = +[GKReporter reporter];
          [v22 reportEvent:@"com.apple.GameKit.invite" type:@"cancel.nearby"];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v10);
  }
}

- (void)cancelSentNearbyInvites
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = @"message";
  id v3 = [NSNumber numberWithUnsignedInteger:4];
  v18[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  id v5 = [(GKMatchmaker *)self nearbyDevicesForPlayer:0 withState:2];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __47__GKMatchmaker_Nearby__cancelSentNearbyInvites__block_invoke;
        v11[3] = &unk_1E646F010;
        v11[4] = self;
        void v11[5] = v10;
        [v10 sendDictionary:v4 withCompletionHandler:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void __47__GKMatchmaker_Nearby__cancelSentNearbyInvites__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) player];
  id v4 = [*(id *)(a1 + 40) deviceID];
  [v2 setNearbyPlayerFailed:v3 deviceID:v4];

  id v5 = +[GKReporter reporter];
  [v5 reportEvent:@"com.apple.GameKit.invite" type:@"cancel.nearby"];
}

- (void)handleNearbyInviteResponse:(id)a3 fromDevice:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v33 = v6;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "Handle nearby invite response dict: %@", buf, 0xCu);
  }
  uint64_t v10 = [v6 objectForKey:@"accepted"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker+Nearby.m", 1097, "-[GKMatchmaker(Nearby) handleNearbyInviteResponse:fromDevice:]");
    long long v13 = +[GKDispatchGroup dispatchGroupWithName:v12];

    long long v14 = [(GKMatchmaker *)self acceptedInviteesTokens];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      v30[0] = @"message";
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:5];
      v31[0] = v16;
      v30[1] = @"playerNearbyTokens";
      uint64_t v17 = [(GKMatchmaker *)self acceptedInviteesTokens];
      v31[1] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke;
      v27[3] = &unk_1E646D928;
      id v28 = v7;
      id v29 = v18;
      id v19 = v18;
      [v13 perform:v27];
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_3;
    v23[3] = &unk_1E646F558;
    id v24 = v6;
    long long v25 = self;
    id v26 = v7;
    [v13 notifyOnMainQueueWithBlock:v23];

    long long v20 = v24;
  }
  else
  {
    long long v21 = [v6 objectForKey:@"declineReason"];
    unsigned int v22 = [v21 integerValue];

    long long v13 = [v7 player];
    long long v20 = [v7 deviceID];
    [(GKMatchmaker *)self setNearbyPlayerDeclined:v13 deviceID:v20 reason:v22];
  }
}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_2;
  v7[3] = &unk_1E646E098;
  id v8 = v3;
  id v6 = v3;
  [v5 sendDictionary:v4 withCompletionHandler:v7];
}

uint64_t __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_3(uint64_t a1)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"playerNearbyToken"];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmaker+Nearby.m", 1114, "-[GKMatchmaker(Nearby) handleNearbyInviteResponse:fromDevice:]_block_invoke_3");
  uint64_t v4 = +[GKDispatchGroup dispatchGroupWithName:v3];

  id v5 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touchdowns on level 1\"";
  if ([v2 length])
  {
    id v6 = +[GKDaemonProxy proxyForLocalPlayer];
    id v7 = [v6 friendService];
    v38[0] = v2;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    [v7 establishNearbyRelationshipsUsingPlayerTokens:v8 handler:&__block_literal_global_207];

    uint64_t v9 = [*(id *)(a1 + 40) nearbyDevicesForPlayer:0 withState:3];
    if ([v9 count])
    {
      v36[0] = @"message";
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:5];
      v36[1] = @"playerNearbyTokens";
      v37[0] = v10;
      id v35 = v2;
      int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      v37[1] = v11;
      long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            uint8_t v28[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_5;
            v28[3] = &unk_1E646D928;
            v28[4] = v18;
            id v29 = v12;
            [v4 perform:v28];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);
      }

      id v5 = "Challenges detail goal description for score challenge, for example \"Doc Brown’s challenge: score 500 touchd"
           "owns on level 1\"";
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = *((void *)v5 + 462);
    v26[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_7;
    v26[3] = &unk_1E646D928;
    void v26[4] = *(void *)(a1 + 40);
    id v27 = v2;
    [v4 perform:v26];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = *((void *)v5 + 462);
  v22[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_8;
  v22[3] = &unk_1E646F558;
  id v19 = *(id *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  long long v21 = *(void **)(a1 + 48);
  id v23 = v19;
  uint64_t v24 = v20;
  id v25 = v21;
  [v4 notifyOnMainQueueWithBlock:v22];
}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_6;
  v7[3] = &unk_1E646E098;
  id v8 = v3;
  id v6 = v3;
  [v5 sendDictionary:v4 withCompletionHandler:v7];
}

uint64_t __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v3 acceptedInviteesTokens];
  [v4 addObject:*(void *)(a1 + 40)];

  v5[2]();
}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_8(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) objectForKey:@"connectionData"];
  id v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) player];
  uint64_t v4 = [*(id *)(a1 + 48) deviceID];
  [v2 setNearbyPlayerAccepted:v3 deviceID:v4 connectionData:v5];
}

- (void)establishNearbyFriendRelationships:(id)a3 fromDevice:(id)a4
{
  objc_msgSend(a3, "objectForKeyedSubscript:", @"playerNearbyTokens", a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 count])
  {
    uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
    id v5 = [v4 friendService];
    [v5 establishNearbyRelationshipsUsingPlayerTokens:v6 handler:&__block_literal_global_212];
  }
}

- (void)setNearbyPlayerAccepted:(id)a3 deviceID:(id)a4 connectionData:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(GKMatchmaker *)self nearbyDeviceWithDeviceID:a4];
  if ([v10 state] == 2)
  {
    [v10 setState:3];
    [(GKMatchmaker *)self setNearbyPlayerAccepted:v8 connectionData:v9];
    v12[0] = v8;
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [(GKMatchmaker *)self cancelNearbyInvitesToPlayers:v11];
  }
}

- (void)setNearbyPlayerDeclined:(id)a3 deviceID:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(GKMatchmaker *)self nearbyDeviceWithDeviceID:v9];
  if ([v10 state] == 2)
  {
    [v10 setState:4];
    int v11 = +[GKDaemonProxy proxyForLocalPlayer];
    long long v12 = [v11 multiplayerService];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __64__GKMatchmaker_Nearby__setNearbyPlayerDeclined_deviceID_reason___block_invoke;
    void v13[3] = &unk_1E6470F48;
    void v13[4] = self;
    id v14 = v8;
    int64_t v15 = a5;
    [v12 forgetParticipant:0 deviceID:v9 handler:v13];
  }
}

uint64_t __64__GKMatchmaker_Nearby__setNearbyPlayerDeclined_deviceID_reason___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfNearbyDevicesForPlayer:*(void *)(a1 + 40) withState:2];
  if (!result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v3 setNearbyPlayerDeclined:v4 reason:v5];
  }
  return result;
}

- (void)setNearbyPlayerFailed:(id)a3 deviceID:(id)a4
{
  id v7 = a3;
  id v6 = [(GKMatchmaker *)self nearbyDeviceWithDeviceID:a4];
  if ([v6 state] == 2)
  {
    [v6 setState:0];
    if (![(GKMatchmaker *)self numberOfNearbyDevicesForPlayer:v7 withState:2])[(GKMatchmaker *)self setNearbyPlayerFailed:v7]; {
  }
    }
}

- (void)handleNearbyProfileQuery:(id)a3 fromDevice:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"bundleID"];
  id v9 = [v6 objectForKeyedSubscript:@"shortBundleVersion"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"bundleVersion"];
  int v11 = [v6 objectForKeyedSubscript:@"isDevelopmentVersion"];
  long long v12 = v11;
  if (v11)
  {
    char v13 = [v11 BOOLValue];
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    char v13 = 0;
    if (!v8) {
      goto LABEL_7;
    }
  }
  if (v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__GKMatchmaker_Nearby__handleNearbyProfileQuery_fromDevice___block_invoke;
    v16[3] = &unk_1E6470F98;
    void v16[4] = self;
    id v17 = v6;
    id v18 = v10;
    id v19 = v9;
    char v22 = v13;
    id v20 = v8;
    id v21 = v7;
    [(GKMatchmaker *)self getHashedCompatibilitySetsWithHandler:v16];

    goto LABEL_11;
  }
LABEL_7:
  if (!os_log_GKGeneral) {
    id v14 = GKOSLoggers();
  }
  int64_t v15 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v24 = v6;
    _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "nearby profile query missing bundle info:%@", buf, 0xCu);
  }
LABEL_11:
}

void __60__GKMatchmaker_Nearby__handleNearbyProfileQuery_fromDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __60__GKMatchmaker_Nearby__handleNearbyProfileQuery_fromDevice___block_invoke_2;
  void v13[3] = &unk_1E6470F70;
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  char v22 = *(unsigned char *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = *(id *)(a1 + 64);
  id v19 = v6;
  id v20 = v5;
  id v21 = *(id *)(a1 + 72);
  id v11 = v5;
  id v12 = v6;
  [v8 determineIfShouldRespondToNearbyPlayer:v14 handler:v13];
}

void __60__GKMatchmaker_Nearby__handleNearbyProfileQuery_fromDevice___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"platform"];
    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"platform"];
      uint64_t v5 = [v4 integerValue];
    }
    else
    {
      uint64_t v5 = 0;
    }

    if ([*(id *)(a1 + 40) isEqualToString:@"-1"]) {
      goto LABEL_13;
    }
    if ([*(id *)(a1 + 48) isEqualToString:@"-1"]) {
      goto LABEL_13;
    }
    if (*(unsigned char *)(a1 + 96)) {
      goto LABEL_13;
    }
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = [*(id *)(a1 + 56) hashForBundleID:*(void *)(a1 + 64) version:v11 platform:v5];
      char v13 = [*(id *)(a1 + 72) containsObject:v12];

      if (v13) {
        goto LABEL_13;
      }
    }
    id v14 = [*(id *)(a1 + 56) hashForBundleID:*(void *)(a1 + 64) version:*(void *)(a1 + 40) platform:v5];
    int v15 = [*(id *)(a1 + 80) containsObject:v14];

    if (v15)
    {
LABEL_13:
      id v9 = *(void **)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 88);
      [v9 sendProfileResponseToDevice:v10];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v16 = GKOSLoggers();
      }
      uint64_t v17 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)(a1 + 64);
        id v19 = NSNumber;
        id v20 = v17;
        id v21 = [v19 numberWithInteger:v5];
        uint64_t v23 = *(void *)(a1 + 40);
        uint64_t v22 = *(void *)(a1 + 48);
        int v24 = 138413058;
        uint64_t v25 = v18;
        __int16 v26 = 2112;
        id v27 = v21;
        __int16 v28 = 2112;
        uint64_t v29 = v22;
        __int16 v30 = 2112;
        uint64_t v31 = v23;
        _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "Not compatibile with app making profile query: bundleID: %@, platform: %@, short version, %@, version %@", (uint8_t *)&v24, 0x2Au);
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    id v7 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v24 = 138412290;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "Nearby - should not respond to nearby profile query:%@", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)sendProfileResponseToDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    uint64_t v8 = [v4 deviceID];
    *(_DWORD *)long long buf = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "sending profile response to device:%@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __52__GKMatchmaker_Nearby__sendProfileResponseToDevice___block_invoke;
  v10[3] = &unk_1E6470FE8;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  [(GKMatchmaker *)self loadPhotoDataDictionaryWithHandler:v10];
}

void __52__GKMatchmaker_Nearby__sendProfileResponseToDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    uint64_t v8 = [v6 deviceID];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "did load photo data:%@", buf, 0xCu);
  }
  id v9 = [*(id *)(a1 + 40) profileDictionaryForLocalPlayer];
  if ([v3 count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v9];
    [v10 setObject:v3 forKey:@"photoData"];

    id v9 = v10;
  }
  id v11 = +[GKDaemonProxy proxyForLocalPlayer];
  id v12 = [v11 multiplayerService];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__GKMatchmaker_Nearby__sendProfileResponseToDevice___block_invoke_214;
  v14[3] = &unk_1E6470FC0;
  id v15 = v9;
  id v16 = *(id *)(a1 + 32);
  id v13 = v9;
  [v12 fetchDevicePushToken:v14];
}

void __52__GKMatchmaker_Nearby__sendProfileResponseToDevice___block_invoke_214(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "Did get push token for local device: %@.", buf, 0xCu);
  }
  if (v3)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1, @"message");
    uint64_t v7 = *(void *)(a1 + 32);
    v12[0] = v6;
    v12[1] = v7;
    v11[1] = @"profile";
    void v11[2] = @"pushToken";
    void v12[2] = v3;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

    [*(id *)(a1 + 40) sendDictionary:v8 withCompletionHandler:0];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v9 = GKOSLoggers();
    }
    uint64_t v10 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "Cannot reply to profile query with a nil push token.", buf, 2u);
    }
  }
}

- (void)handleNearbyInvite:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __54__GKMatchmaker_Nearby__handleNearbyInvite_fromDevice___block_invoke;
  v10[3] = &unk_1E6471010;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [(GKMatchmaker *)self determineIfShouldRespondToNearbyPlayer:v8 handler:v10];
}

void __54__GKMatchmaker_Nearby__handleNearbyInvite_fromDevice___block_invoke(uint64_t *a1, int a2)
{
  if (a2)
  {
    if ([(id)a1[4] state] >= 1
      && ([(id)a1[4] player], id v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
    {
      id v4 = (void *)a1[5];
      uint64_t v5 = a1[6];
      uint64_t v6 = a1[4];
      [v4 presentNearbyInvite:v5 fromDevice:v6];
    }
    else
    {
      id v8 = (void *)a1[5];
      id v7 = (void *)a1[6];
      uint64_t v9 = a1[4];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __54__GKMatchmaker_Nearby__handleNearbyInvite_fromDevice___block_invoke_2;
      v10[3] = &unk_1E646F558;
      void v10[4] = v8;
      id v11 = v7;
      id v12 = (id)a1[4];
      [v8 handleNearbyProfileResponse:v11 fromDevice:v9 withCompletionHandler:v10];
    }
  }
}

uint64_t __54__GKMatchmaker_Nearby__handleNearbyInvite_fromDevice___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentNearbyInvite:*(void *)(a1 + 40) fromDevice:*(void *)(a1 + 48)];
}

- (void)presentNearbyInvite:(id)a3 fromDevice:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v22 = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "gonna present nearby invite:%@", (uint8_t *)&v22, 0xCu);
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
  id v11 = +[GKGame currentGame];
  id v12 = [v11 adamID];
  [v10 setObject:v12 forKey:@"adamID"];

  id v13 = [v11 bundleIdentifier];
  [v10 setObject:v13 forKey:@"bundleID"];

  id v14 = [v11 bundleVersion];
  [v10 setObject:v14 forKey:@"bundleVersion"];

  uint64_t v15 = [v7 deviceID];
  [v10 setObject:v15 forKey:@"deviceID"];

  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "platform"));
  [v10 setObject:v16 forKey:@"platform"];

  uint64_t v17 = [v11 shortBundleVersion];

  if (v17)
  {
    uint64_t v18 = [v11 shortBundleVersion];
    [v10 setObject:v18 forKey:@"shortBundleVersion"];
  }
  uint64_t v19 = [v7 player];
  [(GKMatchmaker *)self saveNearbyInvite:v10 fromPlayer:v19];

  id v20 = +[GKDaemonProxy proxyForLocalPlayer];
  id v21 = [v20 multiplayerService];
  [v21 presentNearbyInvite:v10];
}

- (void)saveNearbyInvite:(id)a3 fromPlayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __52__GKMatchmaker_Nearby__saveNearbyInvite_fromPlayer___block_invoke;
  v10[3] = &unk_1E646F558;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(GKMatchmaker *)self performSync:v10];
}

void __52__GKMatchmaker_Nearby__saveNearbyInvite_fromPlayer___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) nearbyInvites];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) referenceKey];
  [v4 setObject:v2 forKey:v3];
}

- (void)removeNearbyInviteFromPlayer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__GKMatchmaker_Nearby__removeNearbyInviteFromPlayer___block_invoke;
  v6[3] = &unk_1E646EC80;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(GKMatchmaker *)self performSync:v6];
}

void __53__GKMatchmaker_Nearby__removeNearbyInviteFromPlayer___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) nearbyInvites];
  uint64_t v2 = [*(id *)(a1 + 40) referenceKey];
  [v3 removeObjectForKey:v2];
}

- (id)nearbyInviteFromPlayer:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  uint64_t v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__GKMatchmaker_Nearby__nearbyInviteFromPlayer___block_invoke;
  v8[3] = &unk_1E6470CC8;
  uint64_t v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(GKMatchmaker *)self performSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __47__GKMatchmaker_Nearby__nearbyInviteFromPlayer___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) nearbyInvites];
  uint64_t v2 = [*(id *)(a1 + 40) referenceKey];
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)declineReceivedNearbyInvites
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__13;
  uint64_t v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__GKMatchmaker_Nearby__declineReceivedNearbyInvites__block_invoke;
  v5[3] = &unk_1E646EB68;
  void v5[4] = self;
  void v5[5] = &v6;
  [(GKMatchmaker *)self performSync:v5];
  uint64_t v3 = (void *)v7[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__GKMatchmaker_Nearby__declineReceivedNearbyInvites__block_invoke_2;
  v4[3] = &unk_1E6471038;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  _Block_object_dispose(&v6, 8);
}

void __52__GKMatchmaker_Nearby__declineReceivedNearbyInvites__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nearbyInvites];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) nearbyInvites];
  [v6 removeAllObjects];
}

void __52__GKMatchmaker_Nearby__declineReceivedNearbyInvites__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 objectForKey:@"deviceID"];
  uint64_t v4 = [*(id *)(a1 + 32) nearbyDeviceWithDeviceID:v5];
  [*(id *)(a1 + 32) declineNearbyInviteFromDevice:v4 reason:3];
}

- (void)localPlayerRespondedToNearbyInvite:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: localPlayerRespondedToNearbyInvite:", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  uint64_t v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v35 = v4;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "local player responded to nearby invite: %@", buf, 0xCu);
  }
  id v9 = [v4 objectForKey:@"deviceID"];
  if (v9)
  {
    uint64_t v10 = [(GKMatchmaker *)self nearbyDeviceWithDeviceID:v9];
    id v11 = [v10 player];

    if (!v11)
    {
      id v12 = NSString;
      uint64_t v13 = [NSString stringWithFormat:@"Assertion failed"];
      id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKMatchmaker+Nearby.m"];
      id v15 = [v14 lastPathComponent];
      id v16 = [v12 stringWithFormat:@"%@ (device.player)\n[%s (%s:%d)]", v13, "-[GKMatchmaker(Nearby) localPlayerRespondedToNearbyInvite:]", objc_msgSend(v15, "UTF8String"), 1364];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v16 format];
    }
    uint64_t v17 = [v10 player];
    [(GKMatchmaker *)self removeNearbyInviteFromPlayer:v17];

    uint64_t v18 = [v4 objectForKey:@"participantID"];
    uint64_t v19 = [v4 objectForKey:@"accepted"];
    int v20 = [v19 BOOLValue];

    if (v20 && [(GKMatchmaker *)self nearbyAdvertising])
    {
      id v21 = [v10 player];
      int v22 = [v21 internal];
      id v23 = [v4 objectForKey:@"bundleID"];
      uint64_t v24 = [v4 objectForKey:@"connectionData"];
      uint64_t v25 = +[GKInviteInternal inviteFromNearbyPlayer:v22 participantID:v18 deviceID:v9 bundleID:v23 connectionData:v24];

      __int16 v26 = [v4 objectForKey:@"playerGroup"];
      objc_msgSend(v25, "setPlayerGroup:", (int)objc_msgSend(v26, "integerValue"));

      id v27 = [v4 objectForKey:@"playerAttributes"];
      objc_msgSend(v25, "setPlayerAttributes:", objc_msgSend(v27, "unsignedIntegerValue"));

      __int16 v28 = [[GKInvite alloc] initWithInternalRepresentation:v25];
      [(GKMatchmaker *)self localPlayerAcceptedNearbyInvite:v28];
      uint64_t v29 = [v4 objectForKeyedSubscript:@"playerNearbyToken"];
      if ([v29 length])
      {
        __int16 v30 = +[GKDaemonProxy proxyForLocalPlayer];
        uint64_t v31 = [v30 friendService];
        long long v33 = v29;
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        [v31 establishNearbyRelationshipsUsingPlayerTokens:v32 handler:&__block_literal_global_238];
      }
    }
    else
    {
      uint64_t v25 = [v4 objectForKey:@"declineReason"];
      -[GKMatchmaker declineNearbyInviteFromDevice:reason:](self, "declineNearbyInviteFromDevice:reason:", v10, [v25 integerValue]);
    }
  }
}

- (void)localPlayerAcceptedNearbyInvite:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: localPlayerAcceptedNearbyInvite:", buf, 2u);
  }
  if ([(GKMatchmaker *)self hasInviteListener])
  {
    id v7 = +[GKLocalPlayer localPlayer];
    [v7 setAcceptedInvite:v4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__GKMatchmaker_Nearby__localPlayerAcceptedNearbyInvite___block_invoke;
    block[3] = &unk_1E646F558;
    id v10 = v7;
    id v11 = v4;
    id v12 = self;
    id v8 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __56__GKMatchmaker_Nearby__localPlayerAcceptedNearbyInvite___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GKAcceptedGameInvite" object:*(void *)(a1 + 32) userInfo:0];

  uint64_t v3 = +[GKLocalPlayer localPlayer];
  id v4 = [v3 eventEmitter];
  char v5 = [v4 listenerRegisteredForSelector:sel_player_didAcceptInvite_];

  if ((v5 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v6 = GKOSLoggers();
    }
    id v7 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      __56__GKMatchmaker_Nearby__localPlayerAcceptedNearbyInvite___block_invoke_cold_1(v7);
    }
  }
  id v8 = [v3 eventEmitter];
  [v8 player:v3 didAcceptInvite:*(void *)(a1 + 40)];

  id v9 = [*(id *)(a1 + 48) inviteHandler];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 48) inviteHandler];
    v10[2](v10, *(void *)(a1 + 40), 0);
  }
}

- (void)acceptNearbyInvite:(id)a3 connectionData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: acceptNearbyInvite: connectionData:", buf, 2u);
  }
  id v10 = +[GKDaemonProxy proxyForLocalPlayer];
  id v11 = [v10 friendService];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke;
  v14[3] = &unk_1E6471060;
  id v15 = v7;
  id v16 = self;
  id v17 = v6;
  id v12 = v6;
  id v13 = v7;
  [v11 getNearbyTokenForLocalPlayerWithHandler:v14];
}

void __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke(uint64_t a1, void *a2)
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"message";
  uint64_t v3 = NSNumber;
  id v4 = a2;
  char v5 = [v3 numberWithUnsignedInteger:3];
  v16[0] = v5;
  v15[1] = @"accepted";
  id v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = *(void *)(a1 + 32);
  v16[1] = v6;
  v16[2] = v7;
  v15[2] = @"connectionData";
  void v15[3] = @"playerNearbyToken";
  v16[3] = v4;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  id v9 = *(void **)(a1 + 40);
  id v10 = [*(id *)(a1 + 48) internal];
  id v11 = [v10 deviceID];
  id v12 = [v9 nearbyDeviceWithDeviceID:v11];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke_2;
  void v13[3] = &unk_1E646DB08;
  id v14 = *(id *)(a1 + 48);
  [v12 sendDictionary:v8 withCompletionHandler:v13];
}

void __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke_2_cold_1();
    }
  }
  else
  {
    id v4 = +[GKReporter reporter];
    [v4 reportEvent:@"com.apple.GameKit.Invite.NearbyResponse" type:@"GKInviteAccepted"];

    char v5 = +[GKReporter reporter];
    [v5 reportEvent:@"com.apple.GameKit.invite" type:@"accept.nearby"];
  }
}

- (void)declineNearbyInviteFromDevice:(id)a3 reason:(int64_t)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16[0] = @"message";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:3];
  v17[0] = v7;
  v16[1] = @"accepted";
  id v8 = [NSNumber numberWithBool:0];
  v17[1] = v8;
  v16[2] = @"declineReason";
  id v9 = [NSNumber numberWithInteger:a4];
  void v17[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __61__GKMatchmaker_Nearby__declineNearbyInviteFromDevice_reason___block_invoke;
  void v12[3] = &unk_1E6471088;
  id v13 = v6;
  id v14 = self;
  int64_t v15 = a4;
  id v11 = v6;
  [v11 sendDictionary:v10 withCompletionHandler:v12];
}

void __61__GKMatchmaker_Nearby__declineNearbyInviteFromDevice_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      __61__GKMatchmaker_Nearby__declineNearbyInviteFromDevice_reason___block_invoke_cold_1();
    }
  }
  else
  {
    char v5 = [*(id *)(a1 + 40) declineReasonString:*(void *)(a1 + 48)];
    id v6 = +[GKReporter reporter];
    [v6 reportEvent:@"com.apple.GameKit.Invite.NearbyResponse" type:v5];

    uint64_t v7 = +[GKReporter reporter];
    [v7 reportEvent:@"com.apple.GameKit.invite" type:@"decline.nearby"];
  }
}

- (id)declineReasonString:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    id v3 = GKDeclinedUnknown;
  }
  else {
    id v3 = off_1E64710A8[a3];
  }
  return *v3;
}

- (void)nearbyInviteWasCancelled:(id)a3 fromDevice:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 player];
  if (v7)
  {
    [(GKMatchmaker *)self removeNearbyInviteFromPlayer:v7];
    id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v20];
    id v9 = +[GKGame currentGame];
    id v10 = [v7 internal];
    id v11 = [v10 playerID];
    [v8 setObject:v11 forKey:@"playerID"];

    id v12 = [v6 deviceID];
    [v8 setObject:v12 forKey:@"deviceID"];

    id v13 = [v9 bundleIdentifier];
    [v8 setObject:v13 forKey:@"bundleID"];

    id v14 = [v9 bundleVersion];
    [v8 setObject:v14 forKey:@"bundleVersion"];

    int64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "platform"));
    [v8 setObject:v15 forKey:@"platform"];

    id v16 = [v9 shortBundleVersion];

    if (v16)
    {
      id v17 = [v9 shortBundleVersion];
      [v8 setObject:v17 forKey:@"shortBundleVersion"];
    }
    uint64_t v18 = +[GKDaemonProxy proxyForLocalPlayer];
    uint64_t v19 = [v18 multiplayerService];
    [v19 nearbyInviteWasCancelled:v8];
  }
}

void __62__GKMatchmaker_loadConnectivitySettingsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Matchmaker getStoreBagValuesForKeys encountered error: %@", v2, v3, v4, v5, v6);
}

void __29__GKMatchmaker_lookForInvite__block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Matchmaking failed to accept game invite due to error: %@", v2, v3, v4, v5, v6);
}

void __29__GKMatchmaker_lookForInvite__block_invoke_3_85_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Matchmaking failed to respond to hosted invite due to error: %@", v2, v3, v4, v5, v6);
}

void __29__GKMatchmaker_lookForInvite__block_invoke_4_86_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "<Warning>: listener not registered for: player:didAcceptInvite: defined in GKInviteEventListener. Please register listener correctly for the local player", v2, v3, v4, v5, v6);
}

void __29__GKMatchmaker_lookForInvite__block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "warning: listener registered for both player:didRequestMatchWithPlayers:(array of GKPlayer *) and the deprecated method player:didRequestMatchWithPlayers:(array of NSString *playerID). Game Center doesn't invoke the deprecated method on iOS 8 and later if the non-deprecated method is registered.", v2, v3, v4, v5, v6);
}

void __29__GKMatchmaker_lookForInvite__block_invoke_92_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "<Warning>: listener not registered for: player:didRequestMatchWithRecipients: defined in GKInviteEventListener. Please register listener correctly for the local player", v2, v3, v4, v5, v6);
}

void __29__GKMatchmaker_lookForInvite__block_invoke_92_cold_3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: delegate registered for the '%{public}@'. Game Center doesn't invoke this obsolete delegate method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)sharingControllerItemProvider
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "error encountered while creating item provider: %@", v2, v3, v4, v5, v6);
}

void __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Matchmaking failed to accept Game invite due to error: %@", v2, v3, v4, v5, v6);
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Matchmaking failed to load connectivity settings due to error: %@", v2, v3, v4, v5, v6);
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_178_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "WARNING: The Game Center entitlement is required to use GameKit. To avoid failing App Store Review, follow these instructions:\nhttps://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_game-center", v2, v3, v4, v5, v6);
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_178_cold_2(void **a1, void *a2, id *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  uint8_t v6 = [v4 internal];
  uint64_t v7 = [v6 transportVersionToUse];
  id v8 = [*a3 match];
  id v9 = [v8 transportContext];
  id v10 = [v9 supportedTransportVersions];
  int v11 = 138412546;
  id v12 = v7;
  OUTLINED_FUNCTION_14();
  _os_log_error_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_ERROR, "Cannot accept invite with required transport version: %@. Supported transports are: %@", (uint8_t *)&v11, 0x16u);
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_196_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_FAULT, "GKMatchmaking failed to accept game invite due to error: %@", v1, 0xCu);
}

- (void)matchForInvite:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Matchmaker could not find match for invite which is nil", v2, v3, v4, v5, v6);
}

- (void)matchForInvite:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Matchmaker could not find match for invite which is cancelled", v2, v3, v4, v5, v6);
}

- (void)matchForInvite:(uint64_t)a1 completionHandler:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_21() callStackSymbols];
  int v6 = 138412546;
  uint64_t v7 = a1;
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_1C2D22000, v2, OS_LOG_TYPE_DEBUG, "Match for invite: %@. Stack: %@", (uint8_t *)&v6, 0x16u);
}

- (void)reportResponse:forInvitees:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "No recipient or invitee response handler set.", v2, v3, v4, v5, v6);
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to invite players due to error: %@", v2, v3, v4, v5, v6);
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to invite players due to error: %@", v2, v3, v4, v5, v6);
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to load connectivity settings due to error: %@", v2, v3, v4, v5, v6);
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_227_cold_1()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to invite players due to missing connection data. Error: %@", v2, v3, v4, v5, v6);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1C2D22000, v3, v5, "STATUS_BAD_REQUEST: %{public}@", v6);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_cold_1(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSNumber;
  id v3 = a1;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_21() shared];
  uint64_t v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "multiplayerAllowedPlayerType"));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1C2D22000, v1, v6, "Cannot create hosted match with automatched players due to allowed player type restriction %@", v7);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_273_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "GKMatchMaker calls loadPlayersForLegacyIdentifiers for non-serverHosted match", v2, v3, v4, v5, v6);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_274_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Couldn't load player to connect to due to error:%@", v2, v3, v4, v5, v6);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_274_cold_2(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSNumber;
  id v3 = a1;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_21() shared];
  uint64_t v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "multiplayerAllowedPlayerType"));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1C2D22000, v1, v6, "Cannot create match with automatched players due to allowed player type restriction %@", v7);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278_cold_1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 internal];
  id v9 = [v8 debugDescription];
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_debug_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_DEBUG, "Preemp relay for player %@", a1, 0xCu);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278_cold_2(void *a1)
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_12() count];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v3, v4, "Start to preempt relay for %lu players", v5, v6, v7, v8, v9);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_278_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to connect invitees due to error: %@", v2, v3, v4, v5, v6);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_283_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = *(unsigned __int8 *)(a2 + 56);
  id v5 = a3;
  uint8_t v6 = [v3 numberWithBool:v4];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_15_1(&dword_1C2D22000, v7, v8, "No need to delay connection. Bag values: %@. shouldDelayConnection: %@", v9, v10, v11, v12, 2u);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_283_cold_2(unsigned __int8 *a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = *a1;
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  OUTLINED_FUNCTION_15_1(&dword_1C2D22000, v6, v7, "Should delay connection: %@. delayMs: %@", v8, v9, v10, v11, 2u);
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_283_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "Failed to load bag key for GKMatchmakerQRAllocationDelay. %@", v1, 0xCu);
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1C2D22000, v1, v4, "GKMatchmaker matchWithRequest completed with error: %@", v5);
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "Too many players for match, returning GKErrorMatchRequestInvalid", v2, v3, v4, v5, v6);
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_2(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSNumber;
  id v3 = a1;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_21() shared];
  uint64_t v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "multiplayerAllowedPlayerType"));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1C2D22000, v1, v6, "Cannot play with invited players due to allowed player type restriction %@", v7);
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_3(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_DEBUG, "Is local match: %i", (uint8_t *)v2, 8u);
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Atomically set matching to YES.", v2, v3, v4, v5, v6);
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_291_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "Already matching, throwing GKErrorMatchRequestInvalid. Need wait the previous match request to finish, or cancel it, before sending another one.", v2, v3, v4, v5, v6);
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_296_cold_1()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_17(&dword_1C2D22000, v0, v1, "error occurred when inviting players. request: %@, error: %@");
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "Matchmaker failed to load url for match due to errorCode: %d", (uint8_t *)v2, 8u);
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Matchmaker failed to load URL due to error: %@", v2, v3, v4, v5, v6);
}

- (void)findPlayersForHostedRequest:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)findMatchedPlayers:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)findPlayersForHostedMatchRequest:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)allInviteesDidRespond
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() callStackSymbols];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v4, v5, "Received responses from all invitees. Stack: %@", v6, v7, v8, v9, v10);
}

- (void)cancelInviteToPlayer:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

- (void)cancelInviteToPlayer:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint64_t v6 = [a3 inviteesByUserID];
  int v7 = 138412546;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_14();
  _os_log_error_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_ERROR, "GKMatchmaker bug while cancelling invite: playerID %@ not found in invitees:%@", (uint8_t *)&v7, 0x16u);
}

- (void)queryPlayerGroupActivity:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)queryActivityWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)queryQueueActivity:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startBrowsingForNearbyPlayersWithReachableHandler:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C2D22000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
}

void __44__GKMatchmaker_inviteeAcceptedNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Cannot handle acceptance of invitee: %@", v2, v3, v4, v5, v6);
}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Error loading player for accepted invite notification %@", v2, v3, v4, v5, v6);
}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_341_cold_1()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Cannot handle acceptance of share invitee: %@", v2, v3, v4, v5, v6);
}

- (void)inviteeAccepted:userInfo:allResponded:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "No player found for accepted invite, thus cannot connect to player with ID %@.", v2, v3, v4, v5, v6);
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1C2D22000, v0, v1, "Cannot start connection since there is no valid match.", v2, v3, v4, v5, v6);
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_362_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Failed to send invitation update after getting invitee accepted notification. Error: %@", v2, v3, v4, v5, v6);
}

void __42__GKMatchmaker_inviteeUpdateNotification___block_invoke_383_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "Invitee failed to perform invite update due to error: %@", v2, v3, v4, v5, v6);
}

- (void)nearbyPlayerFound:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_17(&dword_1C2D22000, v1, v2, "nearbyDataReceived with invalid deviceID (%@) or discoveryInfo (%@).", (void)v3, DWORD2(v3));
}

- (void)nearbyPlayerLost:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)nearbyDataReceived:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_17(&dword_1C2D22000, v1, v2, "nearbyDataReceived with invalid deviceID (%@) or data (%@).", (void)v3, DWORD2(v3));
}

+ (void)sharedMatchmaker
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  long long v3 = [(id)OUTLINED_FUNCTION_12() callStackSymbols];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1C2D22000, v1, v4, "Should not initialize GKMatchmaker for the current process. %@", v5);
}

void __32__GKMatchmaker_sharedMatchmaker__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  long long v3 = [(id)OUTLINED_FUNCTION_12() callStackSymbols];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v4, v5, "GKMatchmaker being initialized in this process. %@", v6, v7, v8, v9, v10);
}

void __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "error advertising for nearby multiplayer: %@", (uint8_t *)&v3, 0xCu);
}

void __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_DEBUG, "no playerInternal for profile response %@, dropping on the floor", (uint8_t *)&v3, 0xCu);
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1C2D22000, a2, a3, "failed to send dict: %@, to device: %@", (uint8_t *)&v5);
}

void __93__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaGCSWithRequest_onlineConnectionData_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "Error encountered when sending invites to nearby players. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __56__GKMatchmaker_Nearby__localPlayerAcceptedNearbyInvite___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "<Warning>: listener not registered for player:didAcceptInvite: defined in GKInviteEventListener. Please register listener correctly for the local player", v1, 2u);
}

void __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2(&dword_1C2D22000, v0, (uint64_t)v0, "failed to accept nearby invite: %@, due to error: %@", v1);
}

void __61__GKMatchmaker_Nearby__declineNearbyInviteFromDevice_reason___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2(&dword_1C2D22000, v0, (uint64_t)v0, "failed to decline nearby invite from device: %@, due to error: %@", v1);
}

@end