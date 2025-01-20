@interface GKLocalPlayer
+ (BOOL)supportsSecureCoding;
+ (GKLocalPlayer)local;
+ (id)_localPlayersFromInternals:(id)a3 authenticated:(BOOL)a4;
+ (id)_userInfoForAuthAPINotificationForLoggedInPlayerInternals:(id)a3 loggedOutPlayerInternals:(id)a4 oldPrimary:(id)a5 newPrimary:(id)a6;
+ (id)accountServicePrivate;
+ (id)authenticatedLocalPlayers;
+ (id)authenticatedLocalPlayersFiltered:(int64_t)a3;
+ (id)authenticatedLocalPlayersWithStatus:(unint64_t)a3;
+ (id)localPlayerAccessQueue;
+ (id)localPlayerForCredential:(id)a3;
+ (id)localPlayers;
+ (void)authenticateWithUsername:(id)a3 password:(id)a4 completionHandler:(id)a5;
+ (void)authenticatedLocalPlayersDidChange:(id)a3 complete:(id)a4;
+ (void)loadHighlightsDataWithCompletionHandler:(id)a3;
+ (void)localPlayers;
+ (void)performAsync:(id)a3;
+ (void)performSync:(id)a3;
- (BOOL)appIsInBackground;
- (BOOL)didAuthenticate;
- (BOOL)enteringForeground;
- (BOOL)insideAuthenticatorInvocation;
- (BOOL)isAuthenticated;
- (BOOL)isAvatarEditingRestricted;
- (BOOL)isMultiplayerGamingRestricted;
- (BOOL)isNewToGameCenter;
- (BOOL)isPersonalizedCommunicationRestricted;
- (BOOL)isShowingFriendRequestUI;
- (BOOL)isShowingInGameUI;
- (BOOL)isWelcomeBannerTooLate;
- (BOOL)shouldDisplayWelcomeBannerForPlayer:(id)a3 lastAuthDate:(id)a4 remoteUI:(BOOL)a5 timeBetweenBanners:(double)a6;
- (BOOL)shouldPreserveOnboardingUI;
- (BOOL)validatingAccount;
- (GKDaemonProxy)daemonProxy;
- (GKInvite)acceptedInvite;
- (GKLocalPlayer)initWithCoder:(id)a3;
- (GKLocalPlayerListenerPrivate)eventEmitter;
- (NSArray)friends;
- (NSError)authenticationError;
- (UIAlertView)currentAlert;
- (double)authStartTimeStamp;
- (id)_friendsAPICommunicationsError;
- (id)_friendsAPIDeniedError;
- (id)_friendsAPIDescriptionMissingError;
- (id)_friendsAPIRestrictedError;
- (id)_gkFriendListUsageDescription;
- (id)displayNameWithOptions:(unsigned __int8)a3;
- (id)friendService;
- (id)friendServicePrivate;
- (id)matchmaker;
- (id)validateAccountCompletionHandler;
- (int64_t)environment;
- (unint64_t)authenticationState;
- (unint64_t)authenticationType;
- (void)_loadFriendPlayersWithCompletionHandler:(id)a3;
- (void)_loadFriendsListGlobalAccessOptInFlow:(id)a3;
- (void)_loadFriendsListPerGameAuthorizedFlow:(id)a3;
- (void)_loadFriendsListPerGameNotDeterminedFlow:(id)a3;
- (void)_startAuthenticationForExistingPrimaryPlayer;
- (void)_updatePerGameSettings:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)acceptFriendRequestWithIdentifier:(id)a3 sendPush:(BOOL)a4 handler:(id)a5;
- (void)authenticateHandler;
- (void)callAuthHandlerWithError:(id)a3;
- (void)cancelFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)cancelGameInvite:(id)a3;
- (void)cancelInviteWithNotification:(id)a3;
- (void)createFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)deleteSavedGamesWithName:(NSString *)name completionHandler:(void *)handler;
- (void)encodeWithCoder:(id)a3;
- (void)fetchItemsForIdentityVerificationSignature:(void *)completionHandler;
- (void)fetchSavedGamesWithCompletionHandler:(void *)handler;
- (void)fetchTurnBasedEvent;
- (void)friends;
- (void)generateIdentityVerificationSignatureWithCompletionHandler:(void *)completionHandler;
- (void)getPlayerIDFromFriendCode:(id)a3 handler:(id)a4;
- (void)handleChallengableFriendsResults:(id)a3 error:(id)a4 completion:(id)a5;
- (void)inviteeAcceptedGameInviteWithNotification:(id)a3;
- (void)inviteeDeclinedGameInviteWithNotification:(id)a3;
- (void)inviteeUpdateGameInviteWithNotification:(id)a3;
- (void)loadChallengableFriendsWithCompletionHandler:(void *)completionHandler;
- (void)loadChallengableFriendsWithFetchOptions:(unint64_t)a3 completion:(id)a4;
- (void)loadDefaultLeaderboardIdentifierWithCompletionHandler:(void *)completionHandler;
- (void)loadFriends:(void *)completionHandler;
- (void)loadFriendsAuthorizationStatus:(void *)completionHandler;
- (void)loadFriendsWithCompletionHandler:(void *)completionHandler;
- (void)loadFriendsWithIdentifiers:(NSArray *)identifiers completionHandler:(void *)completionHandler;
- (void)loadRecentPlayersWithCompletionHandler:(void *)completionHandler;
- (void)promotePlayerInternalToLocalPlayerInternal:(id)a3;
- (void)refreshInternalWithCompletion:(id)a3;
- (void)registerListener:(id)listener;
- (void)rejectFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)removeAllFriendsWithBlock:(id)a3;
- (void)removeFriend:(id)a3 block:(id)a4;
- (void)reportAuthenticatingWithAuthKitInvocation;
- (void)reportAuthenticatingWithGreenBuddyInvocation;
- (void)reportAuthenticationErrorNoInternetConnection;
- (void)reportAuthenticationLoginCanceled;
- (void)reportAuthenticationPlayerAuthenticated;
- (void)reportAuthenticationStartForPlayer;
- (void)resetTCCAuthorization;
- (void)resolveConflictingSavedGames:(NSArray *)conflictingSavedGames withData:(NSData *)data completionHandler:(void *)handler;
- (void)saveGameData:(NSData *)data withName:(NSString *)name completionHandler:(void *)handler;
- (void)setAcceptedInvite:(id)a3;
- (void)setAppIsInBackground:(BOOL)a3;
- (void)setAuthStartTimeStamp:(double)a3;
- (void)setAuthenticateHandler:(void *)authenticateHandler;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticationError:(id)a3;
- (void)setAuthenticationState:(unint64_t)a3;
- (void)setAuthenticationType:(unint64_t)a3;
- (void)setCurrentAlert:(id)a3;
- (void)setDefaultLeaderboardIdentifier:(NSString *)leaderboardIdentifier completionHandler:(void *)completionHandler;
- (void)setDidAuthenticate:(BOOL)a3;
- (void)setEnteringForeground:(BOOL)a3;
- (void)setEventEmitter:(id)a3;
- (void)setFriendListAuthorizationStatus:(int64_t)a3 forBundleID:(id)a4 handler:(id)a5;
- (void)setInsideAuthenticatorInvocation:(BOOL)a3;
- (void)setIsShowingFriendRequestUI:(BOOL)a3;
- (void)setLastContactsIntegrationConsentVersion:(id)a3;
- (void)setLastFriendSuggestionsVersion:(id)a3;
- (void)setLastPersonalizationVersion:(id)a3;
- (void)setLastPrivacyNoticeVersion:(unint64_t)a3;
- (void)setLastProfilePrivacyVersion:(id)a3;
- (void)setLastWelcomeWhatsNewCopyVersion:(unint64_t)a3;
- (void)setNewToGameCenter:(BOOL)a3;
- (void)setShouldPreserveOnboardingUI:(BOOL)a3;
- (void)setShowingInGameUI:(BOOL)a3;
- (void)setStatus:(id)a3;
- (void)setStatus:(id)a3 withCompletionHandler:(id)a4;
- (void)setValidateAccountCompletionHandler:(id)a3;
- (void)setValidatingAccount:(BOOL)a3;
- (void)setupForCloudSavedGames;
- (void)signOutAndOptOut:(BOOL)a3 completionHandler:(id)a4;
- (void)signOutWithCompletionHandler:(id)a3;
- (void)unregisterAllListeners;
- (void)unregisterListener:(id)listener;
- (void)updateFromLocalPlayer:(id)a3;
- (void)updateLoginStatus:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation GKLocalPlayer

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

+ (GKLocalPlayer)local
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__GKLocalPlayer_local__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (local_sDispatchOnceToken != -1) {
    dispatch_once(&local_sDispatchOnceToken, block);
  }
  v2 = (void *)local_sLocalPlayer;

  return (GKLocalPlayer *)v2;
}

uint64_t __22__GKLocalPlayer_local__block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)local_sLocalPlayer;
  local_sLocalPlayer = (uint64_t)v1;

  if (objc_opt_respondsToSelector())
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = local_sLocalPlayer;
    v5 = +[GKApplicationNotificationNames willEnterForeground];
    [v3 addObserver:v4 selector:sel_applicationWillEnterForeground_ name:v5 object:0];
  }
  if (objc_opt_respondsToSelector())
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = local_sLocalPlayer;
    v8 = +[GKApplicationNotificationNames didEnterBackground];
    [v6 addObserver:v7 selector:sel_applicationDidEnterBackground_ name:v8 object:0];
  }
  v14[0] = &unk_1F1EB3160;
  v14[1] = &unk_1F1EAC2A0;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v10 = +[GKEventEmitter eventEmitterForProtocols:v9];
  [(id)local_sLocalPlayer setEventEmitter:v10];

  if (([MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess] & 1) == 0)
  {
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    v12 = dispatch_get_global_queue(0, 0);
    dispatch_after(v11, v12, &__block_literal_global_101);
  }
  getpid();
  return proc_disable_wakemon();
}

- (void)setEventEmitter:(id)a3
{
}

- (void)authenticateHandler
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  v3 = _Block_copy((const void *)sAuthenticateHandler);
  objc_sync_exit(v2);

  return v3;
}

+ (id)localPlayerAccessQueue
{
  if (localPlayerAccessQueue_onceToken != -1) {
    dispatch_once(&localPlayerAccessQueue_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)localPlayerAccessQueue_sLocalPlayerAccessQueue;

  return v2;
}

void __39__GKLocalPlayer_localPlayerAccessQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.gamecenter.localplayer", v2);
  id v1 = (void *)localPlayerAccessQueue_sLocalPlayerAccessQueue;
  localPlayerAccessQueue_sLocalPlayerAccessQueue = (uint64_t)v0;
}

+ (void)performSync:(id)a3
{
  id v4 = a3;
  v5 = [a1 localPlayerAccessQueue];
  dispatch_sync(v5, v4);
}

+ (void)performAsync:(id)a3
{
  id v4 = a3;
  v5 = [a1 localPlayerAccessQueue];
  dispatch_async(v5, v4);
}

uint64_t __22__GKLocalPlayer_local__block_invoke_2()
{
  return [(id)local_sLocalPlayer setupForCloudSavedGames];
}

- (id)matchmaker
{
  return +[GKMatchmaker sharedMatchmaker];
}

+ (id)localPlayers
{
  v3 = [a1 local];
  int v4 = [v3 isAuthenticated];

  if (v4)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__5;
    v23 = __Block_byref_object_dispose__5;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __29__GKLocalPlayer_localPlayers__block_invoke;
    v18[3] = &unk_1E646EA68;
    v18[4] = &v19;
    v18[5] = a1;
    [a1 performSync:v18];
    v5 = [a1 local];
    uint64_t v6 = [(id)v20[5] indexOfObject:v5];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!os_log_GKGeneral) {
        id v7 = GKOSLoggers();
      }
      v8 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        +[GKLocalPlayer localPlayers];
      }
    }
    else
    {
      [(id)v20[5] removeObjectAtIndex:v6];
    }
    [(id)v20[5] insertObject:v5 atIndex:0];
    id v16 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

void __29__GKLocalPlayer_localPlayers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) _localPlayersFromInternals:sLocalPlayers authenticated:1];
  uint64_t v2 = [v5 mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKLocalPlayer;
  [(GKPlayer *)&v4 dealloc];
}

- (BOOL)appIsInBackground
{
  return sAppIsInBackground;
}

- (void)setAppIsInBackground:(BOOL)a3
{
  sAppIsInBackground = a3;
}

- (BOOL)isShowingInGameUI
{
  uint64_t v3 = +[GKLocalPlayer local];
  objc_super v4 = v3;
  if (v3 == self) {
    BOOL showingInGameUI = self->_showingInGameUI;
  }
  else {
    BOOL showingInGameUI = [(GKLocalPlayer *)v3 isShowingInGameUI];
  }

  return showingInGameUI;
}

- (void)setShowingInGameUI:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[GKLocalPlayer local];
  if (v5 == self)
  {
    self->_BOOL showingInGameUI = v3;
  }
  else
  {
    uint64_t v6 = v5;
    [(GKLocalPlayer *)v5 setShowingInGameUI:v3];
    id v5 = v6;
  }
}

- (void)setStatus:(id)a3
{
}

- (void)setStatus:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GKLocalPlayer *)self status];
  v17.receiver = self;
  v17.super_class = (Class)GKLocalPlayer;
  [(GKLocalPlayer *)&v17 setStatus:v7];
  uint64_t v9 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v10 = [v9 profileServicePrivate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__GKLocalPlayer_setStatus_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E646DF30;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v6;
  id v11 = v6;
  id v12 = v8;
  [v10 setStatus:v7 handler:v13];
}

void __49__GKLocalPlayer_setStatus_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v7.receiver = *(id *)(a1 + 40);
    v7.super_class = (Class)GKLocalPlayer;
    objc_msgSendSuper2(&v7, sel_setStatus_, v4);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__GKLocalPlayer_setStatus_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E646D7F0;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__GKLocalPlayer_setStatus_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) postChangeNotification];
}

- (BOOL)shouldPreserveOnboardingUI
{
  id v3 = +[GKLocalPlayer local];
  uint64_t v4 = v3;
  if (v3 == self) {
    BOOL shouldPreserveOnboardingUI = self->_shouldPreserveOnboardingUI;
  }
  else {
    BOOL shouldPreserveOnboardingUI = [(GKLocalPlayer *)v3 shouldPreserveOnboardingUI];
  }

  return shouldPreserveOnboardingUI;
}

- (void)setShouldPreserveOnboardingUI:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[GKLocalPlayer local];
  if (v5 == self)
  {
    self->_BOOL shouldPreserveOnboardingUI = v3;
  }
  else
  {
    id v6 = v5;
    [(GKLocalPlayer *)v5 setShouldPreserveOnboardingUI:v3];
    uint64_t v5 = v6;
  }
}

- (id)displayNameWithOptions:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKLocalPlayer;
  BOOL v3 = [(GKPlayer *)&v5 displayNameWithOptions:a3 | 1u];

  return v3;
}

- (BOOL)isMultiplayerGamingRestricted
{
  uint64_t v2 = +[GKPreferences shared];
  if ([v2 multiplayerAllowedPlayerType])
  {
    BOOL v3 = +[GKPreferences shared];
    BOOL v4 = [v3 multiplayerAllowedPlayerType] == 1;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)isPersonalizedCommunicationRestricted
{
  uint64_t v2 = +[GKPreferences shared];
  char v3 = [v2 shouldAllowCustomCommunication] ^ 1;

  return v3;
}

- (void)promotePlayerInternalToLocalPlayerInternal:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    objc_super v7 = v6;
    v8 = GKStackTraceWithFrameLimit(12);
    int v33 = 138412290;
    v34 = v8;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "A GKLocalPlayer contains a GKPlayerInternal object. This is wrong and should be a GKLocalPlayerInternal object. Promoting to correct the issue. Stack trace:%@", (uint8_t *)&v33, 0xCu);
  }
  uint64_t v9 = objc_alloc_init(GKLocalPlayerInternal);
  uint64_t v10 = [v4 internal];
  id v11 = [v10 playerID];
  [(GKPlayerInternal *)v9 setPlayerID:v11];

  id v12 = [v4 internal];
  uint64_t v13 = [v12 scopedIDs];
  [(GKPlayerInternal *)v9 setScopedIDs:v13];

  id v14 = [v4 internal];
  uint64_t v15 = [v14 accountName];
  [(GKLocalPlayerInternal *)v9 setAccountName:v15];

  id v16 = [v4 internal];
  -[GKLocalPlayerInternal setDefaultNickname:](v9, "setDefaultNickname:", [v16 isDefaultNickname]);

  objc_super v17 = [v4 internal];
  -[GKLocalPlayerInternal setDefaultPrivacyVisibility:](v9, "setDefaultPrivacyVisibility:", [v17 isDefaultPrivacyVisibility]);

  v18 = [v4 internal];
  -[GKLocalPlayerInternal setDefaultContactsIntegrationConsent:](v9, "setDefaultContactsIntegrationConsent:", [v18 isDefaultContactsIntegrationConsent]);

  uint64_t v19 = [v4 internal];
  v20 = [v19 alias];
  [(GKPlayerInternal *)v9 setAlias:v20];

  uint64_t v21 = [v4 internal];
  v22 = [v21 firstName];
  [(GKFamiliarPlayerInternal *)v9 setFirstName:v22];

  v23 = [v4 internal];
  id v24 = [v23 lastName];
  [(GKFamiliarPlayerInternal *)v9 setLastName:v24];

  v25 = [v4 internal];
  -[GKLocalPlayerInternal setUnderage:](v9, "setUnderage:", [v25 isUnderage]);

  v26 = [v4 internal];
  -[GKPlayerInternal setNumberOfAchievementPoints:](v9, "setNumberOfAchievementPoints:", [v26 numberOfAchievementPoints]);

  v27 = [v4 internal];
  -[GKPlayerInternal setNumberOfAchievements:](v9, "setNumberOfAchievements:", [v27 numberOfAchievements]);

  v28 = [v4 internal];
  -[GKPlayerInternal setNumberOfFriends:](v9, "setNumberOfFriends:", [v28 numberOfFriends]);

  v29 = [v4 internal];
  -[GKPlayerInternal setNumberOfGames:](v9, "setNumberOfGames:", [v29 numberOfGames]);

  v30 = [v4 internal];
  -[GKLocalPlayerInternal setNumberOfTurns:](v9, "setNumberOfTurns:", [v30 numberOfTurns]);

  v31 = [v4 internal];
  v32 = [v31 compositeName];
  [(GKFamiliarPlayerInternal *)v9 setCompositeName:v32];

  [(GKPlayer *)self setInternal:v9];
}

- (void)updateFromLocalPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 internal];
  int v6 = [v5 isLocalPlayer];

  if (v6)
  {
    objc_super v7 = [v4 internal];
    [(GKPlayer *)self setInternal:v7];
  }
  else
  {
    [(GKLocalPlayer *)self promotePlayerInternalToLocalPlayerInternal:v4];
  }
  char v8 = [v4 isAuthenticated];

  self->_authenticated = v8;
}

- (NSArray)friends
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    id v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKLocalPlayer friends](v4);
    }
    v8[0] = @"playerID is no longer available";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GKLocalPlayer;
    id v5 = [(GKPlayer *)&v7 friends];
  }

  return (NSArray *)v5;
}

- (void)_loadFriendPlayersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  int v6 = [v5 friendService];
  objc_super v7 = [(GKPlayer *)self internal];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__GKLocalPlayer__loadFriendPlayersWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E646DCF0;
  id v10 = v4;
  id v8 = v4;
  [v6 getFriendsForPlayer:v7 handler:v9];
}

void __57__GKLocalPlayer__loadFriendPlayersWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = [a2 _gkMapWithBlock:&__block_literal_global_125];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);
  }
}

GKPlayer *__57__GKLocalPlayer__loadFriendPlayersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKPlayer alloc] initWithInternalRepresentation:v2];

  return v3;
}

- (void)loadChallengableFriendsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  objc_initWeak(&location, self);
  id v5 = [(GKLocalPlayer *)self friendService];
  uint64_t v6 = [(GKPlayer *)self internal];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __62__GKLocalPlayer_loadChallengableFriendsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E646EAB0;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v5 getChallengableFriendsForPlayer:v6 handler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__GKLocalPlayer_loadChallengableFriendsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained handleChallengableFriendsResults:v7 error:v6 completion:*(void *)(a1 + 32)];
}

- (void)loadChallengableFriendsWithFetchOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(GKLocalPlayer *)self friendServicePrivate];
  id v8 = [(GKPlayer *)self internal];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__GKLocalPlayer_loadChallengableFriendsWithFetchOptions_completion___block_invoke;
  v10[3] = &unk_1E646EAB0;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  [v7 getChallengableFriendsForPlayer:v8 fetchOptions:a3 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __68__GKLocalPlayer_loadChallengableFriendsWithFetchOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained handleChallengableFriendsResults:v7 error:v6 completion:*(void *)(a1 + 32)];
}

- (void)handleChallengableFriendsResults:(id)a3 error:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke;
    block[3] = &unk_1E646DC30;
    id v20 = v8;
    id v19 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v10 = v20;
  }
  else
  {
    id v11 = [a3 _gkMapWithBlock:&__block_literal_global_129];
    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"friendBiDirectional == %@", &unk_1F1E7EAF8];
    uint64_t v13 = [v11 filteredArrayUsingPredicate:v12];
    id v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_138];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke_2_139;
    v15[3] = &unk_1E646DC30;
    id v16 = v14;
    id v17 = v9;
    id v10 = v14;
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }
}

uint64_t __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

GKPlayer *__67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKPlayer alloc] initWithInternalRepresentation:v2];

  return v3;
}

uint64_t __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 sortName];
  id v6 = [v4 sortName];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

uint64_t __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke_2_139(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v1 = MEMORY[0x1E4F1CBF0];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v1, 0);
}

- (void)loadRecentPlayersWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 465, "-[GKLocalPlayer loadRecentPlayersWithCompletionHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E646D928;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v7 perform:v11];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E646E198;
    id v9 = v7;
    id v10 = v4;
    [v9 notifyOnMainQueueWithBlock:v8];
  }
}

void __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E646DC78;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 _loadFriendPlayersWithCompletionHandler:v6];
}

uint64_t __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"friends"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2)
  {
    id v7 = [v3 error];
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v7);
  }
  else
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"friends"];
    id v7 = (id)v5;
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
    }
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, v6, 0);
  }
}

- (void)loadFriendsWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  if (!GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    id v8 = +[GKDaemonProxy proxyForLocalPlayer];
    id v9 = [v8 friendService];
    id v10 = [(GKPlayer *)self internal];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__GKLocalPlayer_loadFriendsWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E646DC78;
    v11[4] = self;
    id v12 = v4;
    [v9 getFriendsForPlayer:v10 handler:v11];

    goto LABEL_8;
  }
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
  {
    -[GKLocalPlayer loadFriendsWithCompletionHandler:](v6);
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v4)
  {
LABEL_6:
    id v7 = [MEMORY[0x1E4F28C58] userErrorForCode:34 underlyingError:0];
    (*((void (**)(void *, void, void *))v4 + 2))(v4, 0, v7);
  }
LABEL_8:
}

void __50__GKLocalPlayer_loadFriendsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = [a2 _gkValuesForKeyPath:@"playerID"];
  [*(id *)(a1 + 32) setFriends:v5];
  [*(id *)(a1 + 32) postChangeNotification];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);
  }
}

- (BOOL)isAvatarEditingRestricted
{
  return 0;
}

- (void)signOutWithCompletionHandler:(id)a3
{
}

- (void)signOutAndOptOut:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void *))a4;
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v10 = v8;
    id v11 = [(GKPlayer *)self alias];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "GKLocalPlayer: signOutAndOptOut: %@, %d", buf, 0x12u);
  }
  if (!os_log_GKGeneral) {
    id v12 = GKOSLoggers();
  }
  uint64_t v13 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "GKLocalPlayer: signOutAndOptOut:", buf, 2u);
  }
  id v14 = +[GKLocalPlayer authenticatedLocalPlayers];
  uint64_t v15 = [v14 firstObject];

  if (!v15
    || ([v15 internal],
        id v16 = objc_claimAutoreleasedReturnValue(),
        [v16 playerID],
        id v17 = objc_claimAutoreleasedReturnValue(),
        BOOL v18 = v17 == 0,
        v17,
        v16,
        v18))
  {
    if (!os_log_GKGeneral) {
      id v28 = GKOSLoggers();
    }
    v29 = (void *)os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
      -[GKLocalPlayer signOutAndOptOut:completionHandler:](v29, a2);
    }
    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28588];
    v39[0] = @"No Game Center player to sign out.";
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v32 = [v30 userErrorForCode:8 userInfo:v31];

    v7[2](v7, v32);
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v37 = 1;
    id v19 = [v15 internal];
    id v20 = [v19 playerID];
    uint64_t v21 = [(GKPlayer *)self internal];
    v22 = [v21 playerID];
    char v23 = [v20 isEqualToString:v22];

    if ((v23 & 1) == 0)
    {
      *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
      if (!os_log_GKGeneral) {
        id v24 = GKOSLoggers();
      }
      v25 = os_log_GKAccount;
      if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
        -[GKLocalPlayer signOutAndOptOut:completionHandler:](v25);
      }
    }
    v26 = +[GKDaemonProxy proxyForPlayer:v15];
    +[GKDaemonProxy removeProxyForPlayer:v15];
    v27 = [v26 accountService];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __52__GKLocalPlayer_signOutAndOptOut_completionHandler___block_invoke;
    v33[3] = &unk_1E646EAF8;
    uint64_t v35 = buf;
    v34 = v7;
    [v27 signOutPlayerWithOptOut:v4 handler:v33];

    _Block_object_dispose(buf, 8);
  }
}

void __52__GKLocalPlayer_signOutAndOptOut_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "GKLocalPlayer: signOut error:%@", buf, 0xCu);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (![v3 gkIsNotConnectedToInternetError]) {
      goto LABEL_12;
    }
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (!v3 || [v3 gkIsNotConnectedToInternetError])
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28588];
    id v11 = @"The player that was asked to be signed out was not the current local player. The current local player has been signed out.";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v6 = [v7 userErrorForCode:8 userInfo:v8];

    id v3 = (id)v8;
LABEL_11:

    id v3 = (id)v6;
  }
LABEL_12:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

+ (id)authenticatedLocalPlayers
{
  return (id)[a1 authenticatedLocalPlayersWithStatus:4];
}

+ (id)authenticatedLocalPlayersFiltered:(int64_t)a3
{
  if ((a3 & 2) != 0) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = objc_opt_class();

  return (id)[v4 authenticatedLocalPlayersWithStatus:v3];
}

+ (id)authenticatedLocalPlayersWithStatus:(unint64_t)a3
{
  id v4 = +[GKDaemonProxy daemonProxy];
  id v5 = [v4 authenticatedLocalPlayersWithStatus:a3];

  return v5;
}

- (void)updateLoginStatus:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    id v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v22 = a3;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "GKLocalPlayer: updateLoginStatus: %lX", buf, 0xCu);
  }
  if (!os_log_GKGeneral) {
    id v9 = GKOSLoggers();
  }
  uint64_t v10 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "GKLocalPlayer: setLoginStatus:", buf, 2u);
  }
  if ((a3 & 0x1C) == 0)
  {
    id v11 = NSString;
    id v12 = [NSString stringWithFormat:@"Assertion failed"];
    id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m"];
    id v14 = [v13 lastPathComponent];
    uint64_t v15 = [v11 stringWithFormat:@"%@ ((status & GKLocalPlayerLoginStatusSettableMask) != 0)\n[%s (%s:%d)]", v12, "-[GKLocalPlayer updateLoginStatus:completionHandler:]", objc_msgSend(v14, "UTF8String"), 604];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v15 format];
  }
  id v16 = [(GKLocalPlayer *)self daemonProxy];
  id v17 = [v16 accountServicePrivate];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__GKLocalPlayer_updateLoginStatus_completionHandler___block_invoke;
  v19[3] = &unk_1E646E098;
  id v20 = v6;
  id v18 = v6;
  [v17 setLoginStatus:a3 handler:v19];
}

void __53__GKLocalPlayer_updateLoginStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = GKOSLoggers();
    }
    id v5 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __53__GKLocalPlayer_updateLoginStatus_completionHandler___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);
  }
}

+ (id)localPlayerForCredential:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  id v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  id v5 = [a1 authenticatedLocalPlayersWithStatus:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__GKLocalPlayer_localPlayerForCredential___block_invoke;
  v9[3] = &unk_1E646EB20;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__GKLocalPlayer_localPlayerForCredential___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 internal];
  uint64_t v8 = [*(id *)(a1 + 32) playerInternal];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)insideAuthenticatorInvocation
{
  return sInvokedAuthenticator;
}

- (void)setInsideAuthenticatorInvocation:(BOOL)a3
{
  sInvokedAuthenticator = a3;
}

+ (id)_localPlayersFromInternals:(id)a3 authenticated:(BOOL)a4
{
  if (a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__GKLocalPlayer__localPlayersFromInternals_authenticated___block_invoke;
    v7[3] = &__block_descriptor_41_e49___GKLocalPlayer_24__0__GKLocalPlayerInternal_8Q16l;
    v7[4] = a1;
    BOOL v8 = a4;
    id v5 = [a3 _gkMapWithBlock:v7];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

id __58__GKLocalPlayer__localPlayersFromInternals_authenticated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(objc_class **)(a1 + 32);
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setInternal:v4];

  [v5 setAuthenticated:*(unsigned __int8 *)(a1 + 40)];

  return v5;
}

+ (id)_userInfoForAuthAPINotificationForLoggedInPlayerInternals:(id)a3 loggedOutPlayerInternals:(id)a4 oldPrimary:(id)a5 newPrimary:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = [a1 _localPlayersFromInternals:a3 authenticated:1];
  uint64_t v14 = [a1 _localPlayersFromInternals:v12 authenticated:0];

  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v13 count])
  {
    id v16 = (void *)[v13 copy];
    [v15 setObject:v16 forKey:@"GKPlayersSignedIn"];
  }
  if ([v14 count])
  {
    id v17 = (void *)[v14 copy];
    [v15 setObject:v17 forKey:@"GKPlayersSignedOut"];
  }
  if ([MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess])
  {
    id v18 = [v11 playerID];

    if (v18)
    {
      id v19 = [v11 playerID];
      id v20 = (void *)[v19 copy];
      [v15 setObject:v20 forKey:@"GKPlayerDidAuthenticateNewPlayerID"];
    }
    uint64_t v21 = [v10 playerID];

    if (v21)
    {
      unint64_t v22 = [v10 playerID];
      uint64_t v23 = (void *)[v22 copy];
      [v15 setObject:v23 forKey:@"GKPlayerDidAuthenticateOldPlayerID"];
    }
  }

  return v15;
}

+ (void)authenticatedLocalPlayersDidChange:(id)a3 complete:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void (**)(void))a4;
  int v9 = +[GKLocalPlayer localPlayer];
  id v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v11 = GKOSLoggers();
    id v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v12 = v10;
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }
  int v14 = [v9 appIsInBackground];
  uint64_t v15 = os_log_GKGeneral;
  if (v14)
  {
    if (!os_log_GKGeneral)
    {
      id v16 = GKOSLoggers();
      uint64_t v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v17 = v15;
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "%@: skipping, in background", buf, 0xCu);
    }
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v19 = GKOSLoggers();
      uint64_t v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v20 = v15;
      uint64_t v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_INFO, "%@: appear not to be in the background!", buf, 0xCu);
    }
    unint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v60 = __Block_byref_object_copy__5;
    v61 = __Block_byref_object_dispose__5;
    id v62 = 0;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke;
    v56[3] = &unk_1E646EB68;
    v58 = buf;
    id v23 = v7;
    id v57 = v23;
    [a1 performSync:v56];
    id v24 = [a1 local];
    v25 = [v24 internal];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = 0;
    }
    else
    {
      v27 = [a1 local];
      v26 = [v27 internal];

      v25 = v27;
    }

    id v28 = [MEMORY[0x1E4F1CA48] array];
    v29 = *(void **)(*(void *)&buf[8] + 40);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_2;
    v53[3] = &unk_1E646EB90;
    id v30 = v22;
    id v54 = v30;
    id v31 = v28;
    id v55 = v31;
    [v29 enumerateObjectsUsingBlock:v53];
    v32 = [MEMORY[0x1E4F1CA48] array];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_3;
    v50[3] = &unk_1E646EBB8;
    v52 = buf;
    id v33 = v32;
    id v51 = v33;
    [v30 enumerateObjectsUsingBlock:v50];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__5;
    v48 = __Block_byref_object_dispose__5;
    id v49 = 0;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_4;
    v43[3] = &unk_1E646EBE0;
    v43[4] = &v44;
    [v23 enumerateObjectsUsingBlock:v43];
    if ([v33 count]
      || [v31 count]
      || v26 != (void *)v45[5] && (objc_msgSend(v26, "isEqual:") & 1) == 0)
    {
      v34 = [a1 _userInfoForAuthAPINotificationForLoggedInPlayerInternals:v33 loggedOutPlayerInternals:v31 oldPrimary:v26 newPrimary:v45[5]];
      char v35 = 1;
    }
    else
    {
      char v35 = 0;
      v34 = 0;
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_5;
    v37[3] = &unk_1E646EC30;
    v40 = &v44;
    id v38 = v9;
    char v42 = v35;
    id v36 = v34;
    id v39 = v36;
    id v41 = a1;
    dispatch_async(MEMORY[0x1E4F14428], v37);
    if (v8) {
      v8[2](v8);
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke(uint64_t a1)
{
  uint64_t v2 = sLocalPlayers;
  if (sLocalPlayers)
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:sLocalPlayers];
  }
  else
  {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (v2) {

  }
  id v4 = *(void **)(a1 + 32);

  objc_storeStrong((id *)&sLocalPlayers, v4);
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 playerID];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v6];

    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 loginStatus] & 4) != 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) playerID];

  if ((v2 != 0) != [*(id *)(a1 + 32) isAuthenticated]) {
    [*(id *)(a1 + 32) setAuthenticated:v2 != 0];
  }
  if (v2)
  {
    [*(id *)(a1 + 32) setInternal:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  else
  {
    uint64_t v3 = +[GKInternalRepresentation internalRepresentation];
    [*(id *)(a1 + 32) setInternal:v3];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_6;
    v7[3] = &unk_1E646EC08;
    id v4 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    id v8 = v5;
    uint64_t v9 = v6;
    [v4 updateScopedIDs:v7];
  }
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_6(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_7;
  block[3] = &unk_1E646EC08;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = v2;
  uint64_t v10 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  id v4 = [*(id *)(a1 + 40) local];
  if (([v4 insideAuthenticatorInvocation] & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v4 isShowingInGameUI] & 1) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_187;
    v6[3] = &unk_1E646D7F0;
    id v7 = v4;
    id v5 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_7(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v3 = GKOSLoggers();
    id v2 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1C2D22000, v2, OS_LOG_TYPE_INFO, "sending auth did change %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  NSNotificationName v6 = GKPlayerAuthenticationDidChangeNotificationName;
  id v7 = [*(id *)(a1 + 40) local];
  if ([*(id *)(a1 + 32) count]) {
    uint64_t v8 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v8 = 0;
  }
  [v5 postNotificationName:v6 object:v7 userInfo:v8];
}

uint64_t __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_187(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldPreserveOnboardingUI:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 authenticationDidCompleteWithError:0 signInOrigin:7];
}

- (GKDaemonProxy)daemonProxy
{
  return (GKDaemonProxy *)+[GKDaemonProxy proxyForPlayer:self];
}

+ (id)accountServicePrivate
{
  id v2 = +[GKDaemonProxy daemonProxy];
  id v3 = [v2 accountServicePrivate];

  return v3;
}

- (id)friendServicePrivate
{
  id v2 = [(GKLocalPlayer *)self daemonProxy];
  id v3 = [v2 friendServicePrivate];

  return v3;
}

- (id)friendService
{
  id v2 = [(GKLocalPlayer *)self daemonProxy];
  id v3 = [v2 friendService];

  return v3;
}

+ (void)authenticateWithUsername:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = [NSString stringWithFormat:@"Assertion failed"];
    id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m"];
    id v13 = [v12 lastPathComponent];
    int v14 = [v10 stringWithFormat:@"%@ (completionHandler != ((void *)0))\n[%s (%s:%d)]", v11, "+[GKLocalPlayer authenticateWithUsername:password:completionHandler:]", objc_msgSend(v13, "UTF8String"), 836];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
  }
  uint64_t v15 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v16 = GKOSLoggers();
    uint64_t v15 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v7;
    _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "authenticateWithUsername:%@", buf, 0xCu);
  }
  id v17 = +[GKLocalPlayer accountServicePrivate];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__GKLocalPlayer_authenticateWithUsername_password_completionHandler___block_invoke;
  v20[3] = &unk_1E646EC58;
  id v21 = v7;
  id v22 = v9;
  id v18 = v9;
  id v19 = v7;
  [v17 authenticatePlayerWithUsername:v19 password:v8 altDSID:0 usingFastPath:1 handler:v20];
}

void __69__GKLocalPlayer_authenticateWithUsername_password_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    id v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_INFO, "authenticateWithUsername:%@ response:%@ error:%@", (uint8_t *)&v11, 0x20u);
  }
  if (v6)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = +[GKLocalPlayer localPlayer];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)refreshInternalWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 973, "-[GKLocalPlayer refreshInternalWithCompletion:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke;
  void v14[3] = &unk_1E646D928;
  v14[4] = self;
  id v7 = v6;
  id v15 = v7;
  [v7 perform:v14];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke_3;
  v10[3] = &unk_1E646EA20;
  id v11 = v7;
  uint64_t v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v7;
  [v9 notifyOnQueue:MEMORY[0x1E4F14428] block:v10];
}

void __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) daemonProxy];
  id v5 = [v4 baseProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke_2;
  v7[3] = &unk_1E646DC78;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v5 authenticatedLocalPlayersWithStatus:4 completion:v7];
}

uint64_t __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setResult:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 firstObject];
  if (v3)
  {
    [*(id *)(a1 + 40) updateFromLocalPlayer:v3];
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    id v6 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "The local player could have signed out outside of Settings. Now, there is no authenticated local player to load the profile for Settings.", v8, 2u);
    }
    id v7 = objc_alloc_init(GKUnauthenticatedPlayerInternal);
    [*(id *)(a1 + 40) setInternal:v7];

    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v4();
}

- (void)callAuthHandlerWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    id v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_DEFAULT, "Calling AuthenticateHandlerWithError: %@", buf, 0xCu);
  }
  id v7 = [(GKPlayer *)self playerID];

  if (v7)
  {
    id v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v9 = GKOSLoggers();
      id v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_DEFAULT, "Game Center has authenticated the player", buf, 2u);
    }
  }
  uint64_t v10 = [(GKPlayer *)self internal];
  id v11 = +[GKLocalPlayer local];
  [v11 setInternal:v10];

  BOOL v12 = [(GKLocalPlayer *)self isAuthenticated];
  id v13 = +[GKLocalPlayer local];
  [v13 setAuthenticated:v12];

  if ([(GKLocalPlayer *)self isAuthenticated]) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 3;
  }
  id v15 = +[GKLocalPlayer local];
  [v15 setAuthenticationState:v14];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__GKLocalPlayer_callAuthHandlerWithError___block_invoke;
  v17[3] = &unk_1E646EC80;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

void __42__GKLocalPlayer_callAuthHandlerWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsShowingFriendRequestUI:0];
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  id v3 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "callAuthHandlerWithError:Setting the Authentication Handler", v6, 2u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) authenticateHandler];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, *(void *)(a1 + 40));
  }
}

- (void)setAuthenticateHandler:(void *)authenticateHandler
{
  uint64_t v4 = authenticateHandler;
  id v5 = objc_opt_class();
  objc_sync_enter(v5);
  if ((void *)sAuthenticateHandler == v4)
  {
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = [v4 copy];
    id v7 = (void *)sAuthenticateHandler;
    sAuthenticateHandler = v6;

    uint64_t v8 = sAuthenticateHandler;
    objc_sync_exit(v5);

    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__GKLocalPlayer_setAuthenticateHandler___block_invoke;
      block[3] = &unk_1E646D7F0;
      void block[4] = self;
      if (setAuthenticateHandler__once != -1) {
        dispatch_once(&setAuthenticateHandler__once, block);
      }
    }
  }
}

uint64_t __40__GKLocalPlayer_setAuthenticateHandler___block_invoke(uint64_t a1)
{
  id v2 = +[GKReporter reporter];
  [v2 recordAuthenticateResponseTimestamp];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__GKLocalPlayer_setAuthenticateHandler___block_invoke_2;
  v4[3] = &unk_1E646D7F0;
  v4[4] = *(void *)(a1 + 32);
  return +[GKActivity named:@"GC Activity: Starting Authentication for Existing Primary Player" execute:v4];
}

uint64_t __40__GKLocalPlayer_setAuthenticateHandler___block_invoke_2(uint64_t a1)
{
  char v2 = objc_opt_respondsToSelector();
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 startAuthenticationForExistingPrimaryPlayer];
  }
  else
  {
    return [v3 _startAuthenticationForExistingPrimaryPlayer];
  }
}

- (void)removeFriend:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[GKDaemonProxy proxyForLocalPlayer];
  id v9 = [v8 friendServicePrivate];
  uint64_t v10 = [v7 internal];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__GKLocalPlayer_removeFriend_block___block_invoke;
  v12[3] = &unk_1E646D978;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 removeFriendWithPlayer:v10 handler:v12];
}

uint64_t __36__GKLocalPlayer_removeFriend_block___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!v5 && [*(id *)(a1 + 32) numberOfFriends])
  {
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfFriends:", objc_msgSend(*(id *)(a1 + 32), "numberOfFriends") - 1);
    [*(id *)(a1 + 32) postChangeNotification];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

  return MEMORY[0x1F41817F8]();
}

- (void)removeAllFriendsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    id v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[GKLocalPlayer removeAllFriendsWithBlock:](v5);
  }
  id v7 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v8 = [v7 friendServicePrivate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__GKLocalPlayer_removeAllFriendsWithBlock___block_invoke;
  v10[3] = &unk_1E646D978;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 removeAllFriendsWithHandler:v10];
}

uint64_t __43__GKLocalPlayer_removeAllFriendsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!v5 && [*(id *)(a1 + 32) numberOfFriends])
  {
    [*(id *)(a1 + 32) setNumberOfFriends:0];
    [*(id *)(a1 + 32) postChangeNotification];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_startAuthenticationForExistingPrimaryPlayer
{
  [(GKLocalPlayer *)self setAuthenticationState:1];
  id v4 = [(GKLocalPlayer *)self daemonProxy];
  id v5 = [v4 accountService];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke;
  v6[3] = &unk_1E646ECD0;
  void v6[4] = self;
  v6[5] = a2;
  [v5 authenticatePlayerWithExistingCredentialsWithHandler:v6];
}

void __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    uint64_t v8 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  id v15 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v16 = GKOSLoggers();
    id v15 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v40 = *(const char **)(a1 + 40);
    id v41 = v15;
    char v42 = NSStringFromSelector(v40);
    *(_DWORD *)v61 = 138412802;
    *(void *)&v61[4] = v42;
    *(_WORD *)&v61[12] = 2112;
    *(void *)&v61[14] = v5;
    *(_WORD *)&v61[22] = 2112;
    id v62 = v6;
    _os_log_debug_impl(&dword_1C2D22000, v41, OS_LOG_TYPE_DEBUG, "%@ auth response:%@ error:%@", v61, 0x20u);
  }
  *(void *)v61 = 0;
  *(void *)&v61[8] = v61;
  *(void *)&v61[16] = 0x3032000000;
  id v62 = __Block_byref_object_copy__5;
  uint64_t v63 = __Block_byref_object_dispose__5;
  id v64 = 0;
  uint64_t v17 = [v5 playerID];
  id v18 = +[GKLocalPlayer authenticatedLocalPlayersWithStatus:1];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke_199;
  v55[3] = &unk_1E646ECA8;
  id v19 = v17;
  uint64_t v20 = *(void *)(a1 + 32);
  id v56 = v19;
  uint64_t v57 = v20;
  v58 = v61;
  [v18 enumerateObjectsUsingBlock:v55];

  uint64_t v21 = [*(id *)(*(void *)&v61[8] + 40) internal];
  [*(id *)(a1 + 32) setInternal:v21];

  if (v6 || ([v5 loginDisabled] & 1) != 0)
  {
    if ([v5 loginDisabled])
    {
      if (!os_log_GKGeneral) {
        id v22 = GKOSLoggers();
      }
      id v23 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2D22000, v23, OS_LOG_TYPE_INFO, "_handleAuthResponse:Login has been disabled", buf, 2u);
      }
      uint64_t v24 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];

LABEL_18:
      id v6 = (uint64_t (*)(uint64_t, uint64_t))v24;
      goto LABEL_63;
    }
    uint64_t v25 = [v6 domain];
    int v26 = [v25 isEqualToString:GKErrorDomain];

    if (v26)
    {
      uint64_t v27 = [v6 code];
      if ((unint64_t)(v27 - 5) < 2)
      {
        if (!os_log_GKGeneral) {
          id v28 = GKOSLoggers();
        }
        v29 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v29, OS_LOG_TYPE_INFO, "_handleAuthResponse:Auth Error: GKErrorInvalidCredentials", buf, 2u);
        }
        id v30 = [v6 userInfo];
        id v31 = [v30 objectForKey:*MEMORY[0x1E4F28A50]];

        uint64_t v32 = [v31 code];
        switch(v32)
        {
          case 5029:
            if (!os_log_GKGeneral) {
              id v45 = GKOSLoggers();
            }
            v34 = os_log_GKTrace;
            if (!os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO)) {
              goto LABEL_62;
            }
            *(_WORD *)buf = 0;
            char v35 = "_handleAuthResponse:Underlying Error: GKServerNotAuthorizedError";
            break;
          case 5047:
            if (!os_log_GKGeneral) {
              id v46 = GKOSLoggers();
            }
            v34 = os_log_GKTrace;
            if (!os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO)) {
              goto LABEL_62;
            }
            *(_WORD *)buf = 0;
            char v35 = "_handleAuthResponse:Underlying Error: GKServerForcePasswordChangeError";
            break;
          case 5170:
            if (!os_log_GKGeneral) {
              id v33 = GKOSLoggers();
            }
            v34 = os_log_GKTrace;
            if (!os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
            {
LABEL_62:

              goto LABEL_63;
            }
            *(_WORD *)buf = 0;
            char v35 = "_handleAuthResponse:Underlying Error: GKServerNeedsType15Repair";
            break;
          default:
            v47 = +[GKReachability _gkReachabilityForInternetConnection];
            BOOL v48 = [v47 _gkCurrentReachabilityStatus] == 0;

            if (v48)
            {
              uint64_t v49 = [MEMORY[0x1E4F28C58] gkNotConnectedToInternetError];
            }
            else
            {
              uint64_t v49 = [MEMORY[0x1E4F28C58] userErrorForCode:3 underlyingError:0];

              if (!os_log_GKGeneral) {
                id v50 = GKOSLoggers();
              }
              id v51 = (id)os_log_GKTrace;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                v52 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v31, "code"));
                *(_DWORD *)buf = 138412290;
                v60 = v52;
                _os_log_impl(&dword_1C2D22000, v51, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: %@", buf, 0xCu);
              }
            }
            id v6 = (uint64_t (*)(uint64_t, uint64_t))v49;
            goto LABEL_62;
        }
        _os_log_impl(&dword_1C2D22000, v34, OS_LOG_TYPE_INFO, v35, buf, 2u);
        goto LABEL_62;
      }
      if (v27 == 15)
      {
        if (!os_log_GKGeneral) {
          id v38 = GKOSLoggers();
        }
        id v39 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v39, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKErrorGameUnrecognized", buf, 2u);
        }
        uint64_t v24 = [MEMORY[0x1E4F28C58] userErrorForCode:15 underlyingError:0];

        goto LABEL_18;
      }
      if (!*(void *)(*(void *)&v61[8] + 40))
      {
        uint64_t v43 = +[GKLocalPlayer localPlayer];
        uint64_t v44 = *(void **)(*(void *)&v61[8] + 40);
        *(void *)(*(void *)&v61[8] + 40) = v43;
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v36 = GKOSLoggers();
    }
    char v37 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v37, OS_LOG_TYPE_INFO, "_handleAuthResponse:Login success", buf, 2u);
    }
    id v6 = 0;
  }
LABEL_63:
  [*(id *)(a1 + 32) setAuthenticationError:v6];
  v53 = [*(id *)(a1 + 32) authenticateHandler];

  if (v53)
  {
    id v54 = [*(id *)(a1 + 32) authenticateHandler];
    ((void (**)(void, void, uint64_t (*)(uint64_t, uint64_t)))v54)[2](v54, 0, v6);
  }
  _Block_object_dispose(v61, 8);
}

void __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke_199(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "_handleAuthResponse:Authenticated Local Player with Status", v13, 2u);
  }
  uint64_t v10 = [v7 internal];
  uint64_t v11 = [v10 playerID];
  int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

  if (v12)
  {
    [*(id *)(a1 + 40) setAuthenticated:1];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)fetchTurnBasedEvent
{
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  uint64_t v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "fetchTurnBasedEvent", v5, 2u);
  }
  id v4 = +[GKTurnBasedEventHandler sharedTurnBasedEventHandler];
  [v4 lookForEvent];
}

- (void)cancelGameInvite:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKLocalPlayer: daemonCancelledGameInvite", buf, 2u);
  }
  if (v4)
  {
    acceptedInvite = self->_acceptedInvite;
    if (acceptedInvite
      && ([(GKInvite *)acceptedInvite inviteID],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:v4],
          v8,
          v9))
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v11 = [(GKInvite *)self->_acceptedInvite inviter];
      int v12 = [v10 arrayWithObject:v11];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __34__GKLocalPlayer_cancelGameInvite___block_invoke;
      v17[3] = &unk_1E646ECF8;
      v17[4] = self;
      +[GKPlayer loadPlayersForIdentifiersPrivate:v12 withCompletionHandler:v17];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"invite-id"];
      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"GKInviterCancelledGameInvite" object:self userInfo:v13];
    }
  }
  else
  {
    id v15 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v16 = GKOSLoggers();
      id v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[GKLocalPlayer cancelGameInvite:](v15);
    }
  }
}

void __34__GKLocalPlayer_cancelGameInvite___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  [*(id *)(a1 + 32) showCancelledAlertForPlayer:v3];
  [*(id *)(*(void *)(a1 + 32) + 48) setCancelled:1];
  [*(id *)(a1 + 32) setAcceptedInvite:0];
}

- (void)inviteeAcceptedGameInviteWithNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 postNotificationName:@"GKInviteeAcceptedGameInvite" object:self userInfo:v5];
}

- (void)inviteeDeclinedGameInviteWithNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 postNotificationName:@"GKInviteeDeclinedGameInvite" object:self userInfo:v5];
}

- (void)inviteeUpdateGameInviteWithNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 postNotificationName:@"GKUpdateGameInviteNotification" object:self userInfo:v5];
}

- (void)cancelInviteWithNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "posting GKCancelledGameInviteNotification", v8, 2u);
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"GKInviterCancelledGameInvite" object:self userInfo:v4];
}

- (void)setDefaultLeaderboardIdentifier:(NSString *)leaderboardIdentifier completionHandler:(void *)completionHandler
{
  id v6 = leaderboardIdentifier;
  id v7 = completionHandler;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 1260, "-[GKLocalPlayer setDefaultLeaderboardIdentifier:completionHandler:]");
  int v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  uint64_t v10 = +[GKGame currentGame];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [v10 gameInfo];
  if (*((void *)&v18 + 1) >= 2uLL)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E646D9A0;
    void v15[4] = self;
    id v16 = v9;
    uint64_t v17 = v6;
    [v16 perform:v15];
  }
  if (v7)
  {
LABEL_5:
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_5;
    v12[3] = &unk_1E646DC30;
    id v14 = v7;
    id v13 = v9;
    [v13 notifyOnMainQueueWithBlock:v12];
  }
LABEL_6:
}

void __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_1E646ED20;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  [v4 loadDefaultLeaderboardIdentifierWithCompletionHandler:v6];
}

uint64_t __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setError:a3];
  LOBYTE(a3) = [v6 isEqualToString:*(void *)(a1 + 40)];

  if ((a3 & 1) == 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_3;
    v12[3] = &unk_1E646D928;
    uint64_t v10 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 32);
    [v10 perform:v12];
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v8, v9);
}

void __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_4;
  v8[3] = &unk_1E646D978;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 setDefaultLeaderboardID:v6 handler:v8];
}

uint64_t __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)loadDefaultLeaderboardIdentifierWithCompletionHandler:(void *)completionHandler
{
  if (completionHandler)
  {
    id v3 = completionHandler;
    id v5 = +[GKDaemonProxy proxyForLocalPlayer];
    id v4 = [v5 gameStatService];
    [v4 getDefaultLeaderboardIDWithHandler:v3];
  }
}

- (void)generateIdentityVerificationSignatureWithCompletionHandler:(void *)completionHandler
{
  id v3 = completionHandler;
  if (v3)
  {
    id v4 = +[GKDaemonProxy proxyForLocalPlayer];
    id v5 = [v4 accountService];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__GKLocalPlayer_generateIdentityVerificationSignatureWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E646ED48;
    id v7 = v3;
    [v5 generateIdentityVerificationSignatureWithCompletionHandler:v6];
  }
}

void __76__GKLocalPlayer_generateIdentityVerificationSignatureWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  if (v12)
  {
    id v5 = 0;
    uint64_t v6 = 0;
    id v7 = 0;
  }
  else
  {
    id v8 = a2;
    id v5 = [v8 objectForKey:@"signature"];
    uint64_t v6 = [v8 objectForKey:@"salt"];
    id v9 = [v8 valueForKey:@"timestamp"];
    [v9 unsignedLongLongValue];

    id v10 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v11 = [v8 objectForKey:@"public-key-url"];

    id v7 = [v10 URLWithString:v11];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchItemsForIdentityVerificationSignature:(void *)completionHandler
{
  id v3 = completionHandler;
  if (v3)
  {
    id v4 = +[GKDaemonProxy proxyForLocalPlayer];
    id v5 = [v4 accountService];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__GKLocalPlayer_fetchItemsForIdentityVerificationSignature___block_invoke;
    v6[3] = &unk_1E646ED48;
    id v7 = v3;
    [v5 fetchItemsForIdentityVerificationSignature:v6];
  }
}

void __60__GKLocalPlayer_fetchItemsForIdentityVerificationSignature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  if (v12)
  {
    id v5 = 0;
    uint64_t v6 = 0;
    id v7 = 0;
  }
  else
  {
    id v8 = a2;
    id v5 = [v8 objectForKey:@"signature"];
    uint64_t v6 = [v8 objectForKey:@"salt"];
    id v9 = [v8 valueForKey:@"timestamp"];
    [v9 unsignedLongLongValue];

    id v10 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v11 = [v8 objectForKey:@"public-key-url"];

    id v7 = [v10 URLWithString:v11];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPlayerIDFromFriendCode:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 1364, "-[GKLocalPlayer getPlayerIDFromFriendCode:handler:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke;
  v16[3] = &unk_1E646D928;
  id v17 = v5;
  id v9 = v8;
  id v18 = v9;
  id v10 = v5;
  [v9 perform:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke_3;
  v13[3] = &unk_1E646DC30;
  id v14 = v9;
  id v15 = v6;
  id v11 = v9;
  id v12 = v6;
  [v11 notifyOnMainQueueWithBlock:v13];
}

void __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 friendServicePrivate];
  v11[0] = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke_2;
  v8[3] = &unk_1E646DC78;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 getFriendCodeDetailWithIdentifiers:v6 handler:v8];
}

void __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if (!a3 && [v11 count])
  {
    id v5 = [v11 firstObject];
    id v6 = [v5 creatorPlayerID];
    [*(id *)(a1 + 32) setResult:v6];

    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "friendCodeUsageCount"));
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"friendCodeUsageCount"];

    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "friendCodeState"));
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"friendCodeState"];

    id v9 = [v5 alreadyUsedPlayerIDs];

    if (v9)
    {
      id v10 = [v5 alreadyUsedPlayerIDs];
      [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"usedPlayerIDs"];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"usedPlayerIDs"];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"friendCodeUsageCount"];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"friendCodeState"];
  id v6 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *, void *, void *, void *))(v2 + 16))(v2, v7, v3, v4, v5, v6);
}

- (void)createFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 1388, "-[GKLocalPlayer createFriendRequestWithIdentifier:handler:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke;
  v16[3] = &unk_1E646D928;
  id v17 = v5;
  id v9 = v8;
  id v18 = v9;
  id v10 = v5;
  [v9 perform:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_5;
  v13[3] = &unk_1E646DC30;
  id v14 = v9;
  id v15 = v6;
  id v11 = v9;
  id v12 = v6;
  [v11 notifyOnMainQueueWithBlock:v13];
}

void __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 friendServicePrivate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_2;
  v11[3] = &unk_1E646E5F0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v3;
  id v7 = v3;
  [v5 createFriendRequestWithIdentifier:v6 handler:v11];

  id v8 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_3;
  v9[3] = &unk_1E646DCA0;
  id v10 = v8;
  [v10 perform:v9];
}

uint64_t __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setError:a3];
  [*(id *)(a1 + 32) setResult:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 profileServicePrivate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_4;
  v7[3] = &unk_1E646E5F0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  [v5 getFriendSupportPageURLWithHandler:v7];
}

uint64_t __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:@"friendUrl"];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"friendUrl"];
  id v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

- (void)cancelFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 1412, "-[GKLocalPlayer cancelFriendRequestWithIdentifier:handler:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke;
  v16[3] = &unk_1E646D928;
  id v17 = v5;
  id v9 = v8;
  id v18 = v9;
  id v10 = v5;
  [v9 perform:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke_3;
  v13[3] = &unk_1E646DC30;
  id v14 = v9;
  id v15 = v6;
  id v11 = v9;
  id v12 = v6;
  [v11 notifyOnMainQueueWithBlock:v13];
}

void __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 friendServicePrivate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke_2;
  v8[3] = &unk_1E646D978;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 cancelFriendRequestWithIdentifier:v6 handler:v8];
}

uint64_t __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)acceptFriendRequestWithIdentifier:(id)a3 sendPush:(BOOL)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 1428, "-[GKLocalPlayer acceptFriendRequestWithIdentifier:sendPush:handler:]");
  id v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke;
  v18[3] = &unk_1E646ED70;
  id v19 = v7;
  BOOL v21 = a4;
  id v11 = v10;
  id v20 = v11;
  id v12 = v7;
  [v11 perform:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke_3;
  v15[3] = &unk_1E646DC30;
  id v16 = v11;
  id v17 = v8;
  id v13 = v11;
  id v14 = v8;
  [v13 notifyOnMainQueueWithBlock:v15];
}

void __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 friendServicePrivate];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke_2;
  v9[3] = &unk_1E646D978;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v8 = v3;
  [v5 acceptFriendRequestWithIdentifier:v7 sendPush:v6 handler:v9];
}

uint64_t __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)rejectFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 1444, "-[GKLocalPlayer rejectFriendRequestWithIdentifier:handler:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke;
  v16[3] = &unk_1E646D928;
  id v17 = v5;
  id v9 = v8;
  id v18 = v9;
  id v10 = v5;
  [v9 perform:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke_3;
  v13[3] = &unk_1E646DC30;
  id v14 = v9;
  id v15 = v6;
  id v11 = v9;
  id v12 = v6;
  [v11 notifyOnMainQueueWithBlock:v13];
}

void __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 friendServicePrivate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke_2;
  v8[3] = &unk_1E646D978;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 rejectFriendRequestWithIdentifier:v6 handler:v8];
}

uint64_t __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)shouldDisplayWelcomeBannerForPlayer:(id)a3 lastAuthDate:(id)a4 remoteUI:(BOOL)a5 timeBetweenBanners:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  if (+[GKGame isGameCenter])
  {
    BOOL v12 = 0;
  }
  else
  {
    id v13 = [(GKLocalPlayer *)self authenticateHandler];
    BOOL v12 = 0;
    if (v13 && !a5)
    {
      if (+[GKGame isPreferences]
        || +[GKGame isFirstParty])
      {
        BOOL v12 = 0;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F28B50] mainBundle];
        if ([v14 _gkIsPurpleBuddy])
        {
          BOOL v12 = 0;
        }
        else
        {
          BOOL v12 = 1;
          if (v10 && v11)
          {
            id v15 = [(GKPlayer *)self internal];
            id v16 = [v15 playerID];
            if ([v10 isEqualToString:v16])
            {
              id v17 = [MEMORY[0x1E4F1C9C8] date];
              [v17 timeIntervalSinceDate:v11];
              BOOL v12 = v18 >= a6;
            }
          }
        }
      }
    }
  }
  return v12;
}

- (BOOL)isWelcomeBannerTooLate
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = +[GKLocalPlayer localPlayer];
  [v3 authStartTimeStamp];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    LOBYTE(v16) = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSince1970];
    double v8 = v7;
    id v9 = +[GKLocalPlayer localPlayer];
    [v9 authStartTimeStamp];
    double v11 = v8 - v10;

    if (v11 <= 5.0)
    {
      LOBYTE(v16) = 0;
    }
    else
    {
      BOOL v12 = [(GKPlayer *)self playerID];
      id v13 = [v12 componentsSeparatedByString:@":"];

      if ((unint64_t)[v13 count] < 2)
      {
        LOBYTE(v16) = 0;
      }
      else
      {
        id v14 = [v13 objectAtIndexedSubscript:1];
        unint64_t v15 = [v14 longLongValue];

        BOOL v16 = (v15 >> 2) & 1;
      }
    }
    id v17 = +[GKReporter reporter];
    unint64_t v18 = [(GKLocalPlayer *)self authenticationType];
    id v19 = GKReporterPlayerAuthenticationElapsedTime;
    if (v18) {
      id v19 = GKReporterPlayerAuthenticationElapsedTimeWithUI;
    }
    id v20 = *v19;
    BOOL v21 = (void *)MEMORY[0x1E4F1C9C8];
    id v22 = +[GKLocalPlayer localPlayer];
    [v22 authStartTimeStamp];
    id v23 = objc_msgSend(v21, "dateWithTimeIntervalSince1970:");
    [v17 reportEvent:@"com.apple.GameKit.PlayerAuthentication" type:v20 startTime:v23];

    uint64_t v24 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v25 = GKOSLoggers();
      uint64_t v24 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v27 = 134217984;
      double v28 = v11;
      _os_log_impl(&dword_1C2D22000, v24, OS_LOG_TYPE_INFO, "shouldDisplayWelcomeBannerForPlayer: Welcome banner displayed in %g seconds", (uint8_t *)&v27, 0xCu);
    }
  }
  return v16;
}

- (void)reportAuthenticationStartForPlayer
{
  id v2 = +[GKReporter reporter];
  [v2 reportEvent:@"com.apple.GameKit.PlayerAuthentication" type:@"Start"];

  id v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v4 = GKOSLoggers();
    id v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "reportAuthenticationStartForPlayer: Account login starts", v5, 2u);
  }
}

- (void)reportAuthenticationPlayerAuthenticated
{
  id v2 = +[GKReporter reporter];
  [v2 reportEvent:@"com.apple.GameKit.PlayerAuthentication" type:@"PlayerAuthenticated"];

  id v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v4 = GKOSLoggers();
    id v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "reportAuthenticationPlayerAuthenticated: Player authenticated", v5, 2u);
  }
}

- (void)reportAuthenticationErrorNoInternetConnection
{
  id v2 = +[GKReporter reporter];
  [v2 reportEvent:@"com.apple.GameKit.PlayerAuthentication" type:@"DeviceOffline"];

  id v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v4 = GKOSLoggers();
    id v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "reportAuthenticationErrorNoInternetConnection: Authentication bypassed because device is offline", v5, 2u);
  }
}

- (void)reportAuthenticatingWithGreenBuddyInvocation
{
  id v2 = +[GKLocalPlayer localPlayer];
  [v2 setAuthenticationType:1];

  id v3 = +[GKReporter reporter];
  [v3 reportEvent:@"com.apple.GameKit.PlayerAuthentication" type:@"GreenBuddyInvocation"];

  id v4 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v5 = GKOSLoggers();
    id v4 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "reportAuthenticatingWithGreenBuddyInvocation: Authentication requires GreenBuddy UI invocation", v6, 2u);
  }
}

- (void)reportAuthenticatingWithAuthKitInvocation
{
  [(GKLocalPlayer *)self setAuthenticationType:2];
  id v2 = +[GKReporter reporter];
  [v2 reportEvent:@"com.apple.GameKit.PlayerAuthentication" type:@"AuthKitInvocation"];

  id v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v4 = GKOSLoggers();
    id v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "reportAuthenticatingWithAuthKitInvocation: Authentication requires AuthKit UI invocation", v5, 2u);
  }
}

- (void)reportAuthenticationLoginCanceled
{
  id v2 = +[GKReporter reporter];
  [v2 reportEvent:@"com.apple.GameKit.PlayerAuthentication" type:@"LoginCancel"];

  id v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v4 = GKOSLoggers();
    id v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "reportAuthenticationLoginCanceled: Account login was canceled", v5, 2u);
  }
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (NSError)authenticationError
{
  return self->_authenticationError;
}

- (void)setAuthenticationError:(id)a3
{
  self->_authenticationError = (NSError *)a3;
}

- (GKInvite)acceptedInvite
{
  return self->_acceptedInvite;
}

- (void)setAcceptedInvite:(id)a3
{
}

- (id)validateAccountCompletionHandler
{
  return self->_validateAccountCompletionHandler;
}

- (void)setValidateAccountCompletionHandler:(id)a3
{
}

- (UIAlertView)currentAlert
{
  return self->_currentAlert;
}

- (void)setCurrentAlert:(id)a3
{
  self->_currentAlert = (UIAlertView *)a3;
}

- (BOOL)didAuthenticate
{
  return self->_didAuthenticate;
}

- (void)setDidAuthenticate:(BOOL)a3
{
  self->_didAuthenticate = a3;
}

- (BOOL)validatingAccount
{
  return self->_validatingAccount;
}

- (void)setValidatingAccount:(BOOL)a3
{
  self->_validatingAccount = a3;
}

- (BOOL)enteringForeground
{
  return self->_enteringForeground;
}

- (void)setEnteringForeground:(BOOL)a3
{
  self->_enteringForeground = a3;
}

- (int64_t)environment
{
  return self->_environment;
}

- (BOOL)isNewToGameCenter
{
  return self->_newToGameCenter;
}

- (void)setNewToGameCenter:(BOOL)a3
{
  self->_newToGameCenter = a3;
}

- (GKLocalPlayerListenerPrivate)eventEmitter
{
  return self->_eventEmitter;
}

- (double)authStartTimeStamp
{
  return self->_authStartTimeStamp;
}

- (void)setAuthStartTimeStamp:(double)a3
{
  self->_authStartTimeStamp = a3;
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
}

- (BOOL)isShowingFriendRequestUI
{
  return self->_isShowingFriendRequestUI;
}

- (void)setIsShowingFriendRequestUI:(BOOL)a3
{
  self->_isShowingFriendRequestUI = a3;
}

- (unint64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(unint64_t)a3
{
  self->_authenticationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventEmitter, 0);
  objc_storeStrong(&self->_validateAccountCompletionHandler, 0);

  objc_storeStrong((id *)&self->_acceptedInvite, 0);
}

- (GKLocalPlayer)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKLocalPlayer;
  id v5 = [(GKPlayer *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_authenticated = [v4 decodeBoolForKey:@"authenticated"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKLocalPlayer;
  id v4 = a3;
  [(GKPlayer *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_authenticated, @"authenticated", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)registerListener:(id)listener
{
  [(GKLocalPlayerListenerPrivate *)self->_eventEmitter registerListener:listener];
  id v4 = [(GKLocalPlayer *)self matchmaker];
  [v4 registeredListentersChanged];
}

- (void)unregisterListener:(id)listener
{
  [(GKLocalPlayerListenerPrivate *)self->_eventEmitter unregisterListener:listener];
  id v4 = [(GKLocalPlayer *)self matchmaker];
  [v4 registeredListentersChanged];
}

- (void)unregisterAllListeners
{
  [(GKLocalPlayerListenerPrivate *)self->_eventEmitter unregisterAllListeners];
  id v3 = [(GKLocalPlayer *)self matchmaker];
  [v3 registeredListentersChanged];
}

- (void)setFriendListAuthorizationStatus:(int64_t)a3 forBundleID:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_opt_new();
  [v9 setBundleID:v8];

  [v9 setAllowFriendListAccess:a3];
  double v10 = +[GKDaemonProxy proxyForLocalPlayer];
  double v11 = [v10 gameService];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__GKLocalPlayer_FriendsListPrivate__setFriendListAuthorizationStatus_forBundleID_handler___block_invoke;
  v13[3] = &unk_1E646E098;
  id v14 = v7;
  id v12 = v7;
  [v11 setPerGameSettings:v9 handler:v13];
}

uint64_t __90__GKLocalPlayer_FriendsListPrivate__setFriendListAuthorizationStatus_forBundleID_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)resetTCCAuthorization
{
  id v3 = +[GKDaemonProxy proxyForLocalPlayer];
  id v2 = [v3 gameService];
  [v2 resetTCCAuthorization:&__block_literal_global_475];
}

- (void)loadFriendsAuthorizationStatus:(void *)completionHandler
{
  id v4 = completionHandler;
  objc_super v5 = +[GKReporter reporter];
  uint64_t v6 = +[GKGame currentGame];
  id v7 = [v6 bundleIdentifier];
  [v5 reportEvent:@"com.apple.GameKit.PlayerProfileDashboard" type:@"FriendsAPICheckAuthorizationStatusCalled" bundleID:v7];

  if (+[GKReachability _gkIsOnline])
  {
    id v8 = +[GKPreferences shared];
    int v9 = [v8 isFriendsSharingRestricted];

    if (v9)
    {
      double v10 = +[GKReporter reporter];
      double v11 = +[GKGame currentGame];
      id v12 = [v11 bundleIdentifier];
      [v10 reportEvent:@"com.apple.GameKit.PlayerProfileDashboard" type:@"FriendsAPIDeveloperAccessRestricted" bundleID:v12];

      if (!os_log_GKGeneral) {
        id v13 = GKOSLoggers();
      }
      id v14 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusRestricted", buf, 2u);
      }
      unint64_t v15 = [(GKLocalPlayer *)self _friendsAPIRestrictedError];
      v4[2](v4, 1, v15);
      goto LABEL_13;
    }
    unint64_t v18 = +[GKLocalPlayer local];
    id v19 = [v18 internal];
    int v20 = [v19 globalFriendListAccess];

    if ((v20 - 1) < 2)
    {
      if (!os_log_GKGeneral) {
        id v21 = GKOSLoggers();
      }
      id v22 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2D22000, v22, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusDenied", buf, 2u);
      }
      unint64_t v15 = [(GKLocalPlayer *)self _friendsAPIDeniedError];
      v4[2](v4, 2, v15);
      goto LABEL_13;
    }
    if (!v20)
    {
      id v23 = [(GKLocalPlayer *)self daemonProxy];
      uint64_t v24 = [v23 gameService];
      id v25 = +[GKGame currentGame];
      int v26 = [v25 bundleIdentifier];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __61__GKLocalPlayer_FriendsList__loadFriendsAuthorizationStatus___block_invoke;
      v27[3] = &unk_1E646ED98;
      v27[4] = self;
      double v28 = v4;
      [v24 getPerGameSettingsForBundleID:v26 handler:v27];

      goto LABEL_14;
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v16 = GKOSLoggers();
    }
    id v17 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusNotDetermined", buf, 2u);
    }
  }
  unint64_t v15 = [(GKLocalPlayer *)self _friendsAPICommunicationsError];
  v4[2](v4, 0, v15);
LABEL_13:

LABEL_14:
}

void __61__GKLocalPlayer_FriendsList__loadFriendsAuthorizationStatus___block_invoke(uint64_t a1, void *a2)
{
  switch([a2 allowFriendListAccess])
  {
    case 0:
    case 3:
      if (!os_log_GKGeneral) {
        id v3 = GKOSLoggers();
      }
      id v4 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusNotDetermined", buf, 2u);
      }
      objc_super v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_20;
    case 1:
      if (!os_log_GKGeneral) {
        id v7 = GKOSLoggers();
      }
      id v8 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusDenied", v13, 2u);
      }
      objc_super v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_20;
    case 2:
      if (!os_log_GKGeneral) {
        id v9 = GKOSLoggers();
      }
      double v10 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusAuthorized", v14, 2u);
      }
      objc_super v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_20:
      v5();
      break;
    default:
      uint64_t v6 = *(void *)(a1 + 40);
      id v11 = [*(id *)(a1 + 32) _friendsAPICommunicationsError];
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v11);

      break;
  }
}

- (void)loadFriends:(void *)completionHandler
{
  id v19 = completionHandler;
  id v4 = +[GKReporter reporter];
  objc_super v5 = +[GKGame currentGame];
  uint64_t v6 = [v5 bundleIdentifier];
  [v4 reportEvent:@"com.apple.GameKit.PlayerProfileDashboard" type:@"FriendsAPILoadFriendsListCalled" bundleID:v6];

  if (!+[GKReachability _gkIsOnline]) {
    goto LABEL_10;
  }
  id v7 = [(GKLocalPlayer *)self _gkFriendListUsageDescription];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    uint64_t v14 = [(GKLocalPlayer *)self _friendsAPIDescriptionMissingError];
    goto LABEL_11;
  }
  id v9 = +[GKPreferences shared];
  int v10 = [v9 isFriendsSharingRestricted];

  if (!v10)
  {
    unint64_t v15 = +[GKLocalPlayer local];
    id v16 = [v15 internal];
    int v17 = [v16 globalFriendListAccess];

    if ((v17 - 1) < 2)
    {
      uint64_t v14 = [(GKLocalPlayer *)self _friendsAPIDeniedError];
      goto LABEL_11;
    }
    if (!v17)
    {
      [(GKLocalPlayer *)self _loadFriendsListGlobalAccessOptInFlow:v19];
      goto LABEL_12;
    }
LABEL_10:
    uint64_t v14 = [(GKLocalPlayer *)self _friendsAPICommunicationsError];
    goto LABEL_11;
  }
  id v11 = +[GKReporter reporter];
  id v12 = +[GKGame currentGame];
  id v13 = [v12 bundleIdentifier];
  [v11 reportEvent:@"com.apple.GameKit.PlayerProfileDashboard" type:@"FriendsAPIDeveloperAccessRestricted" bundleID:v13];

  uint64_t v14 = [(GKLocalPlayer *)self _friendsAPIRestrictedError];
LABEL_11:
  unint64_t v18 = (void *)v14;
  v19[2](v19, 0, v14);

LABEL_12:
}

- (void)loadFriendsWithIdentifiers:(NSArray *)identifiers completionHandler:(void *)completionHandler
{
  uint64_t v6 = identifiers;
  id v7 = completionHandler;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__GKLocalPlayer_FriendsList__loadFriendsWithIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_1E646EDC0;
  id v11 = v6;
  id v12 = v7;
  uint64_t v8 = v6;
  id v9 = v7;
  [(GKLocalPlayer *)self loadFriends:v10];
}

void __75__GKLocalPlayer_FriendsList__loadFriendsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v25 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v12 scopedIDsArePersistent])
          {
            id v13 = [v12 gamePlayerID];
            [v6 setObject:v12 forKeyedSubscript:v13];

            uint64_t v14 = [v12 teamPlayerID];
            [v6 setObject:v12 forKeyedSubscript:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    unint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          id v22 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          id v23 = [v21 stringByTrimmingCharactersInSet:v22];

          uint64_t v24 = [v6 objectForKeyedSubscript:v23];
          if (v24) {
            [v15 addObject:v24];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v18);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = v25;
  }
}

- (void)_loadFriendsListGlobalAccessOptInFlow:(id)a3
{
  id v4 = a3;
  id v5 = [(GKLocalPlayer *)self daemonProxy];
  uint64_t v6 = [v5 gameService];
  id v7 = +[GKGame currentGame];
  uint64_t v8 = [v7 bundleIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__GKLocalPlayer_FriendsList___loadFriendsListGlobalAccessOptInFlow___block_invoke;
  v10[3] = &unk_1E646EDE8;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v6 getPerGameSettingsForBundleID:v8 handler:v10];
}

void __68__GKLocalPlayer_FriendsList___loadFriendsListGlobalAccessOptInFlow___block_invoke(uint64_t a1, void *a2)
{
  switch([a2 allowFriendListAccess])
  {
    case 0:
    case 3:
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      [v3 _loadFriendsListPerGameNotDeterminedFlow:v4];
      break;
    case 1:
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [*(id *)(a1 + 32) _friendsAPIDeniedError];
      goto LABEL_7;
    case 2:
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      [v7 _loadFriendsListPerGameAuthorizedFlow:v8];
      break;
    default:
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [*(id *)(a1 + 32) _friendsAPICommunicationsError];
LABEL_7:
      id v9 = (id)v6;
      (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, 0, v6);

      break;
  }
}

- (void)_loadFriendsListPerGameNotDeterminedFlow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[GKDaemonProxy proxyForLocalPlayer];
  uint64_t v6 = [v5 gameService];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke;
  v8[3] = &unk_1E646EE38;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 checkTCCAuthorization:v8];
}

void __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke_2;
    uint64_t v19 = &unk_1E646EE10;
    id v4 = &v21;
    id v5 = *(id *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = v5;
    uint64_t v6 = &v16;
    id v7 = v3;
    uint64_t v8 = 3;
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke_3;
    id v13 = &unk_1E646EE10;
    id v4 = &v15;
    id v9 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = v9;
    uint64_t v6 = &v10;
    id v7 = v3;
    uint64_t v8 = 2;
  }
  objc_msgSend(v7, "_updatePerGameSettings:withCompletionHandler:", v8, v6, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
}

uint64_t __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _loadFriendsListPerGameAuthorizedFlow:*(void *)(a1 + 40)];
  }
}

void __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0, a2);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _friendsAPIDeniedError];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

- (void)_loadFriendsListPerGameAuthorizedFlow:(id)a3
{
  id v4 = a3;
  id v5 = +[GKGame currentGame];
  uint64_t v6 = [v5 bundleIdentifier];

  id v7 = [(GKLocalPlayer *)self daemonProxy];
  uint64_t v8 = [v7 gameService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__GKLocalPlayer_FriendsList___loadFriendsListPerGameAuthorizedFlow___block_invoke;
  v10[3] = &unk_1E646DCF0;
  id v11 = v4;
  id v9 = v4;
  [v8 getPerGameFriendsForBundleID:v6 handler:v10];
}

void __68__GKLocalPlayer_FriendsList___loadFriendsListPerGameAuthorizedFlow___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = +[GKReporter reporter];
    objc_msgSend(v6, "reportEvent:type:count:", @"com.apple.GameKit.PlayerProfileDashboard", @"FriendsAPILoadFriendsListCount", objc_msgSend(v5, "count"));

    id v7 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          uint64_t v14 = [GKPlayer alloc];
          id v15 = -[GKPlayer initWithInternalRepresentation:](v14, "initWithInternalRepresentation:", v13, (void)v16);
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_updatePerGameSettings:(int64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (a3 == 3)
  {
    uint64_t v6 = 2;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    uint64_t v6 = 1;
LABEL_5:
    id v7 = +[GKLocalPlayer local];
    id v8 = +[GKGame currentGame];
    uint64_t v9 = [v8 bundleIdentifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__GKLocalPlayer_FriendsList___updatePerGameSettings_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E646E098;
    id v13 = v5;
    [v7 setFriendListAuthorizationStatus:v6 forBundleID:v9 handler:v12];

    goto LABEL_6;
  }
  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  uint64_t v11 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[GKLocalPlayer(FriendsList) _updatePerGameSettings:withCompletionHandler:]";
    _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "%s is trying to set an invalid game settings", buf, 0xCu);
  }
LABEL_6:
}

uint64_t __75__GKLocalPlayer_FriendsList___updatePerGameSettings_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_gkFriendListUsageDescription
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 infoDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"NSGKFriendListUsageDescription"];

  return v4;
}

- (id)_friendsAPIRestrictedError
{
  return (id)[MEMORY[0x1E4F28C58] userErrorForCode:101 underlyingError:0];
}

- (id)_friendsAPIDeniedError
{
  return (id)[MEMORY[0x1E4F28C58] userErrorForCode:102 underlyingError:0];
}

- (id)_friendsAPICommunicationsError
{
  return (id)[MEMORY[0x1E4F28C58] userErrorForCode:3 underlyingError:0];
}

- (id)_friendsAPIDescriptionMissingError
{
  return (id)[MEMORY[0x1E4F28C58] userErrorForCode:100 underlyingError:0];
}

- (void)setLastWelcomeWhatsNewCopyVersion:(unint64_t)a3
{
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v4 = [v5 accountService];
  [v4 setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:a3];
}

- (void)setLastPrivacyNoticeVersion:(unint64_t)a3
{
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v4 = [v5 accountService];
  [v4 setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:a3];
}

- (void)setLastPersonalizationVersion:(id)a3
{
  id v3 = a3;
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v4 = [v5 accountService];
  [v4 setLastPersonalizationVersionDisplayedForSignedInPlayer:v3];
}

- (void)setLastProfilePrivacyVersion:(id)a3
{
  id v3 = a3;
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v4 = [v5 accountService];
  [v4 setLastProfilePrivacyVersionDisplayedForSignedInPlayer:v3];
}

- (void)setLastFriendSuggestionsVersion:(id)a3
{
  id v3 = a3;
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v4 = [v5 accountService];
  [v4 setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:v3];
}

- (void)setLastContactsIntegrationConsentVersion:(id)a3
{
  id v3 = a3;
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  id v4 = [v5 accountService];
  [v4 setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:v3];
}

+ (void)loadHighlightsDataWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer.m", 1925, "+[GKLocalPlayer(DashboardHighlight) loadHighlightsDataWithCompletionHandler:]");
    id v5 = +[GKDispatchGroup dispatchGroupWithName:v4];

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setResult:v6];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E646DCA0;
    id v7 = v5;
    id v16 = v7;
    [v7 perform:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_3;
    v13[3] = &unk_1E646DCA0;
    id v8 = v7;
    id v14 = v8;
    [v8 perform:v13];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_5;
    v10[3] = &unk_1E646DC30;
    id v11 = v8;
    id v12 = v3;
    id v9 = v8;
    [v9 notifyOnMainQueueWithBlock:v10];
  }
}

void __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKLocalPlayer local];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E646DC78;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 loadFriendsAsPlayersWithCompletionHandler:v6];
}

void __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 predicateWithFormat:@"friendBiDirectional == %@", &unk_1F1E7EAF8];
  id v11 = [v7 filteredArrayUsingPredicate:v8];

  [*(id *)(a1 + 32) setError:v6];
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  id v10 = [*(id *)(a1 + 32) result];
  [v10 setObject:v9 forKeyedSubscript:@"friendsCount"];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E646EE60;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  +[GKDaemonProxy getActiveFriendRequestCount:v5];
}

uint64_t __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:");
  id v4 = [NSNumber numberWithInteger:a2];
  id v5 = [*(id *)(a1 + 32) result];
  [v5 setObject:v4 forKeyedSubscript:@"requestsCount"];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

void __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) result];
  id v3 = [v9 objectForKeyedSubscript:@"friendsCount"];
  uint64_t v4 = [v3 integerValue];
  id v5 = [*(id *)(a1 + 32) result];
  id v6 = [v5 objectForKeyedSubscript:@"requestsCount"];
  uint64_t v7 = [v6 integerValue];
  id v8 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v7, v8);
}

- (void)setupForCloudSavedGames
{
  id v2 = +[GKSavedGameManager sharedManager];
}

- (void)fetchSavedGamesWithCompletionHandler:(void *)handler
{
  id v3 = handler;
  uint64_t v4 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v5 = GKOSLoggers();
    uint64_t v4 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[GKLocalPlayer(GKSavedGame) fetchSavedGamesWithCompletionHandler:]();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__GKLocalPlayer_GKSavedGame__fetchSavedGamesWithCompletionHandler___block_invoke;
  block[3] = &unk_1E646D7A0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__GKLocalPlayer_GKSavedGame__fetchSavedGamesWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[GKSavedGameManager sharedManager];
  [v2 fetchSavedGamesWithCompletionHandler:*(void *)(a1 + 32)];
}

- (void)saveGameData:(NSData *)data withName:(NSString *)name completionHandler:(void *)handler
{
  uint64_t v7 = data;
  id v8 = name;
  id v9 = handler;
  id v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v11 = GKOSLoggers();
    id v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[GKLocalPlayer(GKSavedGame) saveGameData:withName:completionHandler:]();
    if (!v7) {
      goto LABEL_8;
    }
  }
  else if (!v7)
  {
    goto LABEL_8;
  }
  if ([(NSData *)v7 length])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__GKLocalPlayer_GKSavedGame__saveGameData_withName_completionHandler___block_invoke;
    block[3] = &unk_1E646EA20;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v12 = v14;
LABEL_10:

    goto LABEL_11;
  }
LABEL_8:
  if (v9)
  {
    id v12 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
    (*((void (**)(void *, void, void *))v9 + 2))(v9, 0, v12);
    goto LABEL_10;
  }
LABEL_11:
}

void __70__GKLocalPlayer_GKSavedGame__saveGameData_withName_completionHandler___block_invoke(void *a1)
{
  id v2 = +[GKSavedGameManager sharedManager];
  [v2 saveGameData:a1[4] withName:a1[5] completionHandler:a1[6]];
}

- (void)deleteSavedGamesWithName:(NSString *)name completionHandler:(void *)handler
{
  id v5 = name;
  id v6 = handler;
  uint64_t v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = GKOSLoggers();
    uint64_t v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[GKLocalPlayer(GKSavedGame) deleteSavedGamesWithName:completionHandler:]();
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __73__GKLocalPlayer_GKSavedGame__deleteSavedGamesWithName_completionHandler___block_invoke;
  v11[3] = &unk_1E646E198;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __73__GKLocalPlayer_GKSavedGame__deleteSavedGamesWithName_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[GKSavedGameManager sharedManager];
  [v2 deleteSavedGamesWithName:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)resolveConflictingSavedGames:(NSArray *)conflictingSavedGames withData:(NSData *)data completionHandler:(void *)handler
{
  uint64_t v7 = conflictingSavedGames;
  id v8 = data;
  id v9 = handler;
  id v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v11 = GKOSLoggers();
    id v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[GKLocalPlayer(GKSavedGame) resolveConflictingSavedGames:withData:completionHandler:]();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__GKLocalPlayer_GKSavedGame__resolveConflictingSavedGames_withData_completionHandler___block_invoke;
  block[3] = &unk_1E646EA20;
  id v16 = v7;
  long long v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__GKLocalPlayer_GKSavedGame__resolveConflictingSavedGames_withData_completionHandler___block_invoke(void *a1)
{
  id v2 = +[GKSavedGameManager sharedManager];
  [v2 resolveConflictingSavedGames:a1[4] withData:a1[5] completionHandler:a1[6]];
}

+ (void)localPlayers
{
}

- (void)friends
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  id v2 = "-[GKLocalPlayer friends]";
  __int16 v3 = 2114;
  uint64_t v4 = @"14.0";
  __int16 v5 = 2114;
  id v6 = @"11.0";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

- (void)loadFriendsWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  id v2 = "-[GKLocalPlayer loadFriendsWithCompletionHandler:]";
  __int16 v3 = 2114;
  uint64_t v4 = @"14.0";
  __int16 v5 = 2114;
  id v6 = @"11.0";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

- (void)signOutAndOptOut:(void *)a1 completionHandler:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __int16 v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_ERROR, "%@:Game Center signout was invoked with no player logged in. Notifying the caller.", (uint8_t *)&v5, 0xCu);
}

- (void)signOutAndOptOut:(os_log_t)log completionHandler:.cold.2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: trying to log out a player that is not currently logged in. The correct and current local player will be logged out", v1, 2u);
}

void __53__GKLocalPlayer_updateLoginStatus_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeAllFriendsWithBlock:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "removeAllFriendsWithBlock", v1, 2u);
}

void __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cancelGameInvite:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "ignoring cancelled invite notification without ID", v1, 2u);
}

@end