@interface GKMatchmakerViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)canStartWithMinimumPlayers;
- (BOOL)inviterCancelNotificaitonReceived;
- (BOOL)isHosted;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)userCancelledMatching;
- (GKDispatchGroup)invitationGroup;
- (GKInternalPlayerPickerDelegate)internalPlayerPickerDelegate;
- (GKInvite)acceptedInvite;
- (GKMatch)match;
- (GKMatchRequest)matchRequest;
- (GKMatchmakerHostViewController)remoteViewController;
- (GKMatchmakerViewController)init;
- (GKMatchmakerViewController)initWithPlayerPickerDelegate:(id)a3 andPlayerPickerContext:(id)a4;
- (GKMatchmakingMode)matchmakingMode;
- (GKPlayerPickerContext)playerPickerContext;
- (NSMutableArray)hostedPlayers;
- (NSString)defaultInvitationMessage;
- (OS_dispatch_queue)cancellingQueue;
- (OS_dispatch_queue)invitationQueue;
- (UIAlertController)alertController;
- (id)initWithInvite:(GKInvite *)invite;
- (id)initWithMatchRequest:(GKMatchRequest *)request;
- (id)matchmaker;
- (id)matchmakerDelegate;
- (id)registerGroupActivitySharingControllerItemProvider:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setupChildViewController;
- (void)_setupRemoteViewController;
- (void)activateGroupActivities;
- (void)addPlayersToMatch:(GKMatch *)match;
- (void)applicationWillEnterForeground:(id)a3;
- (void)authenticationChanged:(id)a3;
- (void)cancel;
- (void)cancelMatching;
- (void)cancelPendingInviteToPlayer:(id)a3;
- (void)cancelWithoutNotifyingDelegate;
- (void)createMatchForAcceptedInvite;
- (void)dealloc;
- (void)disconnectFromMatch;
- (void)endGroupActivities;
- (void)extensionDidFinishWithError:(id)a3;
- (void)finishWithError:(id)a3;
- (void)finishWithMatch;
- (void)finishWithPlayers;
- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5;
- (void)handleRecipientPropertiesNeededForPlayer:(id)a3 completionHandler:(id)a4;
- (void)inviteSharePlayPlayer:(id)a3;
- (void)invitedPlayer:(id)a3 responded:(int64_t)a4;
- (void)inviterCancelledNotification:(id)a3;
- (void)match:(id)a3 didFailWithError:(id)a4;
- (void)match:(id)a3 didReceiveData:(id)a4 fromRemotePlayer:(id)a5;
- (void)match:(id)a3 player:(id)a4 didChangeConnectionState:(int64_t)a5;
- (void)playerPickerDidCancel;
- (void)playerPickerDidPickPlayers:(id)a3;
- (void)presentSharePlaySharingController;
- (void)recipientPropertiesNeededForPlayer:(id)a3;
- (void)sendData:(id)a3;
- (void)setAcceptedInvite:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setAutomatchPlayerCount:(int64_t)a3;
- (void)setBrowsingForNearbyPlayers:(BOOL)a3;
- (void)setCanStartWithMinimumPlayers:(BOOL)canStartWithMinimumPlayers;
- (void)setConnectingStateForPlayer:(id)a3;
- (void)setDefaultInvitationMessage:(NSString *)defaultInvitationMessage;
- (void)setHosted:(BOOL)hosted;
- (void)setHostedPlayer:(GKPlayer *)player didConnect:(BOOL)connected;
- (void)setHostedPlayer:(NSString *)playerID connected:(BOOL)connected;
- (void)setHostedPlayerReady:(NSString *)playerID;
- (void)setHostedPlayers:(id)a3;
- (void)setInvitationGroup:(id)a3;
- (void)setInviterCancelNotificaitonReceived:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setMatchRequest:(id)a3;
- (void)setMatchmakerDelegate:(id)matchmakerDelegate;
- (void)setMatchmakingMode:(GKMatchmakingMode)matchmakingMode;
- (void)setRemoteViewController:(id)a3;
- (void)setShareInvitees:(id)a3;
- (void)setUserCancelledMatching:(BOOL)a3;
- (void)setupNotifications;
- (void)shareMatchWithRequest:(id)a3 handler:(id)a4;
- (void)sharePlayEligibilityChanged:(id)a3;
- (void)sharePlaySharingControllerResultSucceeded:(BOOL)a3;
- (void)startMatchingWithRequest:(id)a3 devicePushToken:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKMatchmakerViewController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (id)matchmaker
{
  return (id)[MEMORY[0x1E4F63780] sharedMatchmaker];
}

- (id)initWithMatchRequest:(GKMatchRequest *)request
{
  v4 = request;
  v5 = [MEMORY[0x1E4F637F8] reporter];
  [v5 reportEvent:*MEMORY[0x1E4F63590] reportable:v4];

  v14.receiver = self;
  v14.super_class = (Class)GKMatchmakerViewController;
  v6 = [(GKMatchmakerViewController *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [(GKMatchRequest *)v4 copy];
    matchRequest = v6->_matchRequest;
    v6->_matchRequest = (GKMatchRequest *)v7;

    if ([(GKMatchRequest *)v4 restrictToAutomatch]) {
      v6->_matchmakingMode = 2;
    }
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hostedPlayers = v6->_hostedPlayers;
    v6->_hostedPlayers = v9;

    [(GKMatchmakerViewController *)v6 setupNotifications];
    [(GKMatchmakerViewController *)v6 _setupChildViewController];
    v11 = v6->_matchRequest;
    v12 = [(GKMatchmakerViewController *)v6 matchmaker];
    [v12 setCurrentMatchRequest:v11];
  }
  return v6;
}

- (id)initWithInvite:(GKInvite *)invite
{
  v4 = invite;
  v8.receiver = self;
  v8.super_class = (Class)GKMatchmakerViewController;
  v5 = [(GKMatchmakerViewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(GKMatchmakerViewController *)v5 setAcceptedInvite:v4];
    [(GKMatchmakerViewController *)v6 setHosted:[(GKInvite *)v4 isHosted]];
    [(GKMatchmakerViewController *)v6 setupNotifications];
    [(GKMatchmakerViewController *)v6 _setupChildViewController];
  }

  return v6;
}

- (GKMatchmakerViewController)initWithPlayerPickerDelegate:(id)a3 andPlayerPickerContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKMatchmakerViewController;
  objc_super v8 = [(GKMatchmakerViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_internalPlayerPickerDelegate, v6);
    objc_storeStrong((id *)&v9->_playerPickerContext, a4);
    [(GKMatchmakerViewController *)v9 _setupChildViewController];
  }

  return v9;
}

- (GKMatchmakerViewController)init
{
  return 0;
}

- (void)dealloc
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "GKMatchmakerViewController dealloc", buf, 2u);
  }
  [(GKExtensionRemoteViewController *)self->_remoteViewController cancelExtension];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  id v6 = [(GKMatchmakerViewController *)self playerPickerContext];

  if (!v6)
  {
    id v7 = [(GKMatchmakerViewController *)self matchmaker];
    [v7 cancel];
  }
  v8.receiver = self;
  v8.super_class = (Class)GKMatchmakerViewController;
  [(GKMatchmakerViewController *)&v8 dealloc];
}

- (void)setupNotifications
{
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F63048];
  v4 = [MEMORY[0x1E4F63760] localPlayer];
  [v9 addObserver:self selector:sel_localPlayerAcceptedGameInvite_ name:v3 object:v4];

  uint64_t v5 = *MEMORY[0x1E4F63408];
  id v6 = [MEMORY[0x1E4F63760] localPlayer];
  [v9 addObserver:self selector:sel_playersToInvite_ name:v5 object:v6];

  uint64_t v7 = *MEMORY[0x1E4F63380];
  objc_super v8 = [MEMORY[0x1E4F63760] localPlayer];
  [v9 addObserver:self selector:sel_authenticationChanged_ name:v7 object:v8];

  [v9 addObserver:self selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
  [v9 addObserver:self selector:sel_inviteSharePlayPlayer_ name:*MEMORY[0x1E4F63220] object:0];
  [v9 addObserver:self selector:sel_sharePlayEligibilityChanged_ name:*MEMORY[0x1E4F63218] object:0];
}

- (void)_setupChildViewController
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__GKMatchmakerViewController__setupChildViewController__block_invoke;
  v5[3] = &unk_1E5F62EB0;
  v5[4] = self;
  uint64_t v3 = [(GKMatchmakerViewController *)self _gkInGameUIUnavailableAlertWithRestrictionMode:2 dismissHandler:v5];
  [(GKMatchmakerViewController *)self setAlertController:v3];

  v4 = [(GKMatchmakerViewController *)self alertController];

  if (!v4)
  {
    [(GKMatchmakerViewController *)self setNavigationBarHidden:1];
    [(GKMatchmakerViewController *)self setWantsFullScreenLayout:1];
    [(GKMatchmakerViewController *)self setModalPresentationStyle:17];
    [(GKMatchmakerViewController *)self setModalTransitionStyle:2];
    if (!self->_remoteViewController) {
      [(GKMatchmakerViewController *)self _setupRemoteViewController];
    }
  }
}

uint64_t __55__GKMatchmakerViewController__setupChildViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)_setupRemoteViewController
{
  uint64_t v3 = +[GKMatchmakerHostViewController matchmakerExtension];
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:v3 withParentViewController:self];
    [(GKMatchmakerViewController *)self _beginDelayingPresentation:&__block_literal_global_32 cancellationHandler:5.0];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_42;
    v4[3] = &unk_1E5F65848;
    v4[4] = self;
    +[GKExtensionRemoteViewController viewControllerForExtension:v3 inputItems:0 completionHandler:v4];
  }
}

uint64_t __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_cold_1();
    }
  }
  return a2 ^ 1u;
}

void __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
    if (!*MEMORY[0x1E4F63860]) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      id v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "Setting remoteViewController[%p] for GKMatchmakerViewController[%p]", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setRemoteViewController:v7];
    [*(id *)(a1 + 32) _updateViewControllerStackWithViewController:v7];
    objc_super v11 = (void *)MEMORY[0x1E4F636D8];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmakerViewController_iOS.m", 216, "-[GKMatchmakerViewController _setupRemoteViewController]_block_invoke");
    v13 = [v11 dispatchGroupWithName:v12];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_2;
    v15[3] = &unk_1E5F63650;
    v15[4] = *(void *)(a1 + 32);
    [v13 perform:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_52;
    v14[3] = &unk_1E5F62EB0;
    v14[4] = *(void *)(a1 + 32);
    [v13 notifyOnMainQueueWithBlock:v14];
  }
  else
  {
    [*(id *)(a1 + 32) extensionDidFinishWithError:v6];
  }
}

void __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  id v5 = [v4 multiplayerService];
  id v6 = [*(id *)(a1 + 32) acceptedInvite];
  id v7 = [v6 sessionToken];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_3;
  v9[3] = &unk_1E5F64428;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v8 = v3;
  [v5 hasCanceledMultiplayerInitiateBulletinForSessionToken:v7 handler:v9];
}

uint64_t __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "the acceptedInvite is canceled, need to dismiss the extension. set inviterCancelNotificaitonReceived = YES", v6, 2u);
    }
    [*(id *)(a1 + 32) setInviterCancelNotificaitonReceived:1];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_52(uint64_t a1)
{
  if ([*(id *)(a1 + 32) inviterCancelNotificaitonReceived])
  {
    v2 = [*(id *)(a1 + 32) remoteViewController];
    [v2 inviterCancelled];

    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "GKMatchmakterViewController: inviterCancelledNotification - Invite Cancelled", v5, 2u);
    }
  }
}

- (void)extensionDidFinishWithError:(id)a3
{
  [(GKMatchmakerViewController *)self finishWithError:a3];
  [(UINavigationController *)self _updateViewControllerStackWithViewController:0];

  [(GKMatchmakerViewController *)self setRemoteViewController:0];
}

- (void)setRemoteViewController:(id)a3
{
  id v5 = (GKMatchmakerHostViewController *)a3;
  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    id v6 = [(GKMatchmakerViewController *)self remoteViewController];
    [v6 setDelegate:self];

    id v7 = (void *)MEMORY[0x1E4F1CA60];
    id v8 = +[GKExtensionRemoteViewController initialItemsForExtension];
    id v9 = [v7 dictionaryWithDictionary:v8];

    id v10 = [NSNumber numberWithBool:self->_hosted];
    [v9 setObject:v10 forKeyedSubscript:@"MatchesHosted"];

    objc_super v11 = [NSNumber numberWithInteger:self->_matchmakingMode];
    [v9 setObject:v11 forKeyedSubscript:@"MatchesMatchmakingMode"];

    v12 = [NSNumber numberWithBool:self->_canStartWithMinimumPlayers];
    [v9 setObject:v12 forKeyedSubscript:@"MatchesFastStartEnabled"];

    v13 = NSNumber;
    objc_super v14 = [(GKMatchmakerViewController *)self matchmaker];
    v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isEligibleForGroupSession"));
    [v9 setObject:v15 forKeyedSubscript:@"MatchesGroupSessionEligible"];

    v16 = NSNumber;
    id v17 = [(GKMatchmakerViewController *)self matchmaker];
    __int16 v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "isEntitledToUseGroupActivities"));
    [v9 setObject:v18 forKeyedSubscript:@"EntitledToGroupActivities"];

    uint64_t v19 = [(GKMatchmakerViewController *)self playerPickerContext];
    [v9 setObject:v19 forKeyedSubscript:@"playerPickerContext"];

    matchRequest = self->_matchRequest;
    if (matchRequest)
    {
      v21 = [(GKMatchRequest *)matchRequest internal];
      [v9 setObject:v21 forKeyedSubscript:@"MatchesMatchRequestInternal"];
    }
    acceptedInvite = self->_acceptedInvite;
    if (acceptedInvite)
    {
      v23 = [(GKInvite *)acceptedInvite internal];
      [v9 setObject:v23 forKeyedSubscript:@"MatchesAcceptedInviteInternal"];
    }
    match = self->_match;
    if (match)
    {
      v25 = [(GKMatch *)match players];
      v26 = [v25 _gkMapWithBlock:&__block_literal_global_61];

      [v9 setObject:v26 forKeyedSubscript:@"PlayerInternalsKey"];
    }
    remoteViewController = self->_remoteViewController;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__GKMatchmakerViewController_setRemoteViewController___block_invoke_2;
    v29[3] = &unk_1E5F63198;
    v29[4] = self;
    v28 = self;
    [(GKExtensionRemoteViewController *)remoteViewController setInitialState:v9 withReply:v29];
  }
}

uint64_t __54__GKMatchmakerViewController_setRemoteViewController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 internal];
}

void __54__GKMatchmakerViewController_setRemoteViewController___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__GKMatchmakerViewController_setRemoteViewController___block_invoke_3;
  block[3] = &unk_1E5F62EB0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__GKMatchmakerViewController_setRemoteViewController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDelayingPresentation];
}

- (void)viewDidLoad
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF250000, v0, v1, "<Warning>: matchmakerDelegate not found for GKMatchmakerViewController instance: %{public}p", v2, v3, v4, v5, v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F63760] local];
  [v5 hideAccessPoint];

  uint8_t v6 = [(GKMatchmakerViewController *)self remoteViewController];

  if (v6)
  {
    id v7 = [(GKMatchmakerViewController *)self alertController];
    if (!v7)
    {
      id v8 = [(GKMatchmakerViewController *)self viewControllers];
      uint64_t v9 = [v8 count];

      if (v9) {
        goto LABEL_5;
      }
      id v7 = [(GKMatchmakerViewController *)self remoteViewController];
      [(UINavigationController *)self _updateViewControllerStackWithViewController:v7];
    }

LABEL_5:
    id v10 = [(GKMatchmakerViewController *)self remoteViewController];
    [v10 setDelegate:self];
  }
  v15.receiver = self;
  v15.super_class = (Class)GKMatchmakerViewController;
  [(GKMatchmakerViewController *)&v15 viewWillAppear:v3];
  acceptedInvite = self->_acceptedInvite;
  if (acceptedInvite && ![(GKInvite *)acceptedInvite isHosted])
  {
    [(GKMatchmakerViewController *)self createMatchForAcceptedInvite];
  }
  else
  {
    v12 = [(GKMatchmakerViewController *)self matchRequest];
    int v13 = [v12 isIncorrectlyInvitingPlayers];

    if (v13)
    {
      objc_super v14 = [MEMORY[0x1E4F28C58] userErrorForCode:30 userInfo:0];
      [(GKMatchmakerViewController *)self finishWithError:v14];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKMatchmakerViewController;
  [(GKMatchmakerViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = [(GKMatchmakerViewController *)self alertController];

  if (v4)
  {
    uint64_t v5 = [(GKMatchmakerViewController *)self alertController];
    [(GKMatchmakerViewController *)self presentViewController:v5 animated:1 completion:&__block_literal_global_72];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKMatchmakerViewController;
  [(GKMatchmakerViewController *)&v8 viewDidDisappear:a3];
  [(UINavigationController *)self _updateViewControllerStackWithViewController:0];
  uint64_t v4 = [MEMORY[0x1E4F63760] local];
  [v4 showAccessPoint];

  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  objc_super v6 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "GKMatchmakerVC viewDidDisappear: cancelExtension", v7, 2u);
  }
  [(GKExtensionRemoteViewController *)self->_remoteViewController cancelExtension];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)setHosted:(BOOL)hosted
{
  BOOL v3 = hosted;
  self->_hosted = hosted;
  -[GKMatchmakerHostViewController setHosted:](self->_remoteViewController, "setHosted:");
  id v6 = [(GKMatchmakerViewController *)self matchRequest];
  id v5 = [v6 internal];
  [v5 setMatchType:v3];
}

- (void)setMatchmakingMode:(GKMatchmakingMode)matchmakingMode
{
  self->_matchmakingMode = matchmakingMode;
  if (matchmakingMode == GKMatchmakingModeNearbyOnly)
  {
    id v5 = [MEMORY[0x1E4F637E8] shared];
    char v6 = [v5 shouldAllowNearbyMultiplayer];

    if (v6)
    {
      matchRequest = self->_matchRequest;
      if (!matchRequest || ![(GKMatchRequest *)matchRequest restrictToAutomatch]) {
        goto LABEL_5;
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      objc_super v11 = @"unable to set nearby only when restrictToAutomatch of the match request has been set to YES.";
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      objc_super v11 = @"unable to set nearby only due to player restrictions";
    }
    id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    objc_exception_throw(v12);
  }
LABEL_5:
  remoteViewController = self->_remoteViewController;

  [(GKMatchmakerHostViewController *)remoteViewController setMatchmakingMode:matchmakingMode];
}

- (void)setHostedPlayer:(GKPlayer *)player didConnect:(BOOL)connected
{
  BOOL v4 = connected;
  remoteViewController = self->_remoteViewController;
  id v6 = [(GKPlayer *)player internal];
  [(GKMatchmakerHostViewController *)remoteViewController setPlayer:v6 connected:v4];
}

- (void)setHostedPlayer:(NSString *)playerID connected:(BOOL)connected
{
  BOOL v4 = connected;
  id v6 = playerID;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    objc_super v8 = *MEMORY[0x1E4F63848];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKMatchmakerViewController setHostedPlayer:connected:](v8);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F637D8] internalRepresentation];
    [v9 setPlayerID:v6];
    [(GKMatchmakerHostViewController *)self->_remoteViewController setPlayer:v9 connected:v4];
  }
}

- (void)setCanStartWithMinimumPlayers:(BOOL)canStartWithMinimumPlayers
{
  self->_canStartWithMinimumPlayers = canStartWithMinimumPlayers;
  -[GKMatchmakerHostViewController setCanStartWithMinimumPlayers:](self->_remoteViewController, "setCanStartWithMinimumPlayers:");
}

- (void)addPlayersToMatch:(GKMatch *)match
{
  objc_storeStrong((id *)&self->_match, match);
  id v5 = match;
  id v6 = [(GKMatchmakerViewController *)self match];
  [v6 setInviteDelegate:self];

  id v7 = [(GKMatchmakerViewController *)self match];
  [v7 setFastStartStateActive:0];

  remoteViewController = self->_remoteViewController;
  id v10 = [(GKMatch *)v5 players];
  uint64_t v9 = [v10 _gkMapWithBlock:&__block_literal_global_90];
  [(GKMatchmakerHostViewController *)remoteViewController setExistingPlayers:v9];
}

uint64_t __48__GKMatchmakerViewController_addPlayersToMatch___block_invoke(uint64_t a1, void *a2)
{
  return [a2 internal];
}

- (void)setDefaultInvitationMessage:(NSString *)defaultInvitationMessage
{
  if (defaultInvitationMessage)
  {
    matchRequest = self->_matchRequest;
    if (matchRequest)
    {
      id v5 = defaultInvitationMessage;
      [(GKMatchRequest *)matchRequest setInviteMessage:v5];
      id v6 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
      [v6 setDefaultInvitationMessage:v5];
    }
  }
}

- (NSString)defaultInvitationMessage
{
  return [(GKMatchRequest *)self->_matchRequest inviteMessage];
}

- (void)setHostedPlayerReady:(NSString *)playerID
{
  BOOL v4 = playerID;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v5 = (id)GKOSLoggers();
    }
    id v6 = *MEMORY[0x1E4F63848];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKMatchmakerViewController setHostedPlayerReady:](v6);
    }
  }
  else
  {
    [(GKMatchmakerViewController *)self setHostedPlayer:v4 connected:1];
  }
}

- (void)cancel
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "<Warning>: matchmakerViewControllerWasCancelled: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
}

- (void)cancelWithoutNotifyingDelegate
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = [(GKMatchmakerViewController *)self matchmaker];
  [v4 cancel];

  uint64_t v5 = [(GKMatchmakerViewController *)self matchmaker];
  [v5 stopBrowsingForNearbyPlayers];

  [(GKMatchRequest *)self->_matchRequest setRecipientResponseHandler:0];
  match = self->_match;
  if (match)
  {
    int v8 = 5;
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v8 length:4];
    [(GKMatch *)match sendInviteData:v7];

    [(GKMatch *)self->_match setInviteDelegate:0];
    [(GKMatchmakerViewController *)self setMatch:0];
  }
}

- (OS_dispatch_queue)cancellingQueue
{
  if (cancellingQueue_onceToken != -1) {
    dispatch_once(&cancellingQueue_onceToken, &__block_literal_global_98);
  }
  uint64_t v2 = (void *)cancellingQueue_sCancellingQueue;

  return (OS_dispatch_queue *)v2;
}

uint64_t __45__GKMatchmakerViewController_cancellingQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.gamecenter.matchmakerviewcontroller.cancelqueue", MEMORY[0x1E4F14430]);
  uint64_t v1 = cancellingQueue_sCancellingQueue;
  cancellingQueue_sCancellingQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (OS_dispatch_queue)invitationQueue
{
  if (invitationQueue_onceTokenForInvitationQueue != -1) {
    dispatch_once(&invitationQueue_onceTokenForInvitationQueue, &__block_literal_global_101);
  }
  uint64_t v2 = (void *)invitationQueue_sInvitationQueue;

  return (OS_dispatch_queue *)v2;
}

void __45__GKMatchmakerViewController_invitationQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.gamecenter.matchmakerviewcontroller.invitationQueue", v2);
  uint64_t v1 = (void *)invitationQueue_sInvitationQueue;
  invitationQueue_sInvitationQueue = (uint64_t)v0;
}

- (BOOL)userCancelledMatching
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(GKMatchmakerViewController *)self cancellingQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__GKMatchmakerViewController_userCancelledMatching__block_invoke;
  v5[3] = &unk_1E5F64DC8;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __51__GKMatchmakerViewController_userCancelledMatching__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 1416);
  return result;
}

- (void)setUserCancelledMatching:(BOOL)a3
{
  uint64_t v5 = [(GKMatchmakerViewController *)self cancellingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__GKMatchmakerViewController_setUserCancelledMatching___block_invoke;
  v6[3] = &unk_1E5F63D68;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

uint64_t __55__GKMatchmakerViewController_setUserCancelledMatching___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1416) = *(unsigned char *)(result + 40);
  return result;
}

- (void)cancelMatching
{
  uint64_t v3 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  uint64_t v5 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "GKMatchmakerViewController: cancelMatching", buf, 2u);
  }
  [(GKMatchmakerViewController *)self setUserCancelledMatching:1];
  if (!*v3) {
    id v6 = (id)GKOSLoggers();
  }
  BOOL v7 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "userCancelledMatching, set shared matchmaker matching to NO", v10, 2u);
  }
  uint64_t v8 = [(GKMatchmakerViewController *)self matchmaker];
  [v8 userCancelledMatching];

  char v9 = [(GKMatchmakerViewController *)self matchmaker];
  [v9 cancel];
}

- (void)finishWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  BOOL v7 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "GKMatchmakerViewController finish with error: %@", buf, 0xCu);
  }
  if (![(GKMatchmakerViewController *)self canStartWithMinimumPlayers])
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self];

    char v9 = [(GKMatchmakerViewController *)self matchmaker];
    [v9 cancel];

    id v10 = [(GKMatchmakerViewController *)self matchmaker];
    [v10 stopBrowsingForNearbyPlayers];

    [(GKMatchRequest *)self->_matchRequest setRecipientResponseHandler:0];
  }
  objc_super v11 = [(GKMatchmakerViewController *)self matchmaker];
  id v12 = v11;
  if (v4)
  {
    [v11 endGroupActivity];

    int v13 = [(GKMatchmakerViewController *)self match];
    [v13 setInviteDelegate:0];

    objc_super v14 = [(GKMatchmakerViewController *)self matchmaker];
    objc_super v15 = [NSString stringWithFormat:@"%@", v4];
    [v14 promptForRadarWithDescriptionAddition:v15];

    match = self->_match;
    self->_match = 0;

    id v17 = [(GKMatchmakerViewController *)self matchmakerDelegate];
    if (v17)
    {
      if (objc_opt_respondsToSelector())
      {
        [v17 matchmakerViewController:self didFailWithError:v4];
      }
      else
      {
        if (!*v5) {
          id v19 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
          -[GKMatchmakerViewController finishWithError:]();
        }
      }
    }
    else
    {
      if (!*v5) {
        id v18 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
        -[GKMatchmakerViewController finishWithError:]();
      }
    }
    uint64_t v20 = [v4 domain];
    int v21 = [v20 isEqualToString:*MEMORY[0x1E4F63140]];

    if (v21 && [v4 code] == 35)
    {
      v22 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
      v23 = [v22 utilityService];
      [v23 openICloudSettings];
    }
  }
  else
  {
    [v11 resetGroupActivity];

    if (self->_hosted)
    {
      [(GKMatchmakerViewController *)self finishWithPlayers];
    }
    else
    {
      [(GKMatchmakerViewController *)self finishWithMatch];
      [(GKMatch *)self->_match setFastStartStateActive:[(GKMatchmakerViewController *)self canStartWithMinimumPlayers]];
    }
  }
}

- (void)finishWithMatch
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "<Warning>: matchmakerViewController:didFindMatch: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
}

- (void)finishWithPlayers
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "<Warning>: matchmakerViewController:didFindHostedPlayers: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
}

id __47__GKMatchmakerViewController_finishWithPlayers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 internal];
  uint64_t v3 = [v2 playerID];

  return v3;
}

- (void)playerPickerDidPickPlayers:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 _gkPlayersFromInternals];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  uint8_t v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    char v9 = v4;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "Client - player picker - didPickPlayers: %@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v7 = [(GKMatchmakerViewController *)self internalPlayerPickerDelegate];
  [v7 internalPlayerPickerDidPickPlayers:v4];
}

- (void)playerPickerDidCancel
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  uint64_t v4 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "Client - player picker - playerPickerDidCancel, didCancel", v6, 2u);
  }
  id v5 = [(GKMatchmakerViewController *)self internalPlayerPickerDelegate];
  [v5 internalPlayerPickerDidCancel];
}

- (void)createMatchForAcceptedInvite
{
  id v3 = [MEMORY[0x1E4F637F8] reporter];
  [v3 recordInviteeUILaunchTimestamp];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke;
  v4[3] = &unk_1E5F62EB0;
  v4[4] = self;
  [MEMORY[0x1E4F63688] named:@"createMatchForAcceptedInvite" execute:v4];
}

void __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) matchmaker];
  id v3 = [*(id *)(a1 + 32) acceptedInvite];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke_2;
  v4[3] = &unk_1E5F65890;
  v4[4] = *(void *)(a1 + 32);
  [v2 matchForInvite:v3 completionHandler:v4];
}

void __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) setMatch:v5];
    int v8 = *(void **)(a1 + 32);
    char v9 = [v8 match];
    [v9 setInviteDelegate:v8];
  }
  else if (v6)
  {
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v10 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke_2_cold_1();
    }
  }
}

- (void)shareMatchWithRequest:(id)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    int v8 = [(GKMatchmakerViewController *)self match];

    if (!v8)
    {
      char v9 = [(GKMatchmakerViewController *)self matchmaker];
      id v10 = (void *)[v9 newMatch];
      [(GKMatchmakerViewController *)self setMatch:v10];

      objc_super v11 = [(GKMatchmakerViewController *)self match];
      [v11 setInviteDelegate:self];
    }
    id v12 = [(GKMatchmakerViewController *)self matchmaker];
    match = self->_match;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__GKMatchmakerViewController_shareMatchWithRequest_handler___block_invoke;
    v14[3] = &unk_1E5F658B8;
    id v15 = v6;
    [v12 loadURLForMatch:match matchRequest:v7 completionHandler:v14];
  }
}

uint64_t __60__GKMatchmakerViewController_shareMatchWithRequest_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setShareInvitees:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMatchmakerViewController *)self matchmaker];
  id v6 = [(GKMatchmakerViewController *)self match];
  [v5 setShareInvitees:v4 forMatch:v6 propagateToDaemon:1];

  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v9, &location);
  id v7 = [(GKMatchmakerViewController *)self matchmaker];
  [v7 setRecipientResponseHandler:&v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__GKMatchmakerViewController_setShareInvitees___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained invitedPlayer:v5 responded:a3];
}

- (void)startMatchingWithRequest:(id)a3 devicePushToken:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))objc_alloc_init(MEMORY[0x1E4F29128]);
  id v9 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v10 = (id)GKOSLoggers();
  }
  objc_super v11 = (os_log_t *)MEMORY[0x1E4F63870];
  id v12 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    v31 = v8;
    _os_log_impl(&dword_1AF250000, v12, OS_LOG_TYPE_INFO, "GKMatchmakerVC start matching with request: %@, pushToken: %@. UUID: %@", buf, 0x20u);
  }
  int v13 = [(GKMatchmakerViewController *)self invitationGroup];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    if (!*v9) {
      id v15 = (id)GKOSLoggers();
    }
    v16 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_1AF250000, v16, OS_LOG_TYPE_INFO, "Creating invitation group for matchmakerVC. UUID: %@", buf, 0xCu);
    }
    id v17 = (void *)MEMORY[0x1E4F636D8];
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmakerViewController_iOS.m", 714, "-[GKMatchmakerViewController startMatchingWithRequest:devicePushToken:]");
    id v19 = [v17 dispatchGroupWithName:v18];
    [(GKMatchmakerViewController *)self setInvitationGroup:v19];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__6;
  v32 = __Block_byref_object_dispose__6;
  id v33 = 0;
  uint64_t v20 = [(GKMatchmakerViewController *)self invitationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke;
  block[3] = &unk_1E5F65A48;
  id v25 = v8;
  id v26 = v6;
  id v28 = v7;
  v29 = buf;
  v27 = self;
  id v21 = v7;
  id v22 = v6;
  v23 = v8;
  dispatch_async(v20, block);

  _Block_object_dispose(buf, 8);
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (os_log_t *)MEMORY[0x1E4F63870];
  id v5 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v6;
    _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "GKMatchmakerVC entered async queue. UUID: %@", buf, 0xCu);
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F63770]) initWithInternalRepresentation:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setMatchRequest:v7];
  [*(id *)(a1 + 48) setUserCancelledMatching:0];
  uint64_t v8 = [*(id *)(a1 + 48) invitationGroup];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_127;
  v20[3] = &unk_1E5F65A20;
  id v21 = *(id *)(a1 + 32);
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 48);
  id v22 = v9;
  uint64_t v23 = v10;
  long long v19 = *(_OWORD *)(a1 + 56);
  id v11 = (id)v19;
  long long v24 = v19;
  [v8 perform:v20];

  id v12 = [*(id *)(a1 + 48) invitationGroup];
  uint64_t v13 = [v12 waitWithTimeout:5.0];

  if (v13)
  {
    if (!*v2) {
      id v14 = (id)GKOSLoggers();
    }
    id v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_cold_1((uint64_t *)(a1 + 40), a1 + 64, v15);
    }
  }
  if (!*v2) {
    id v16 = (id)GKOSLoggers();
  }
  id v17 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v18;
    _os_log_impl(&dword_1AF250000, v17, OS_LOG_TYPE_INFO, "After invitation group wait or timeout. UUID: %@", buf, 0xCu);
  }
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_127(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "Performed invitation group. UUID: %@", buf, 0xCu);
  }
  id v7 = (void *)MEMORY[0x1E4F63688];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmakerViewController_iOS.m", 727, "-[GKMatchmakerViewController startMatchingWithRequest:devicePushToken:]_block_invoke");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2;
  v12[3] = &unk_1E5F659F8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v13 = v9;
  uint64_t v14 = v10;
  uint64_t v18 = *(void *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  id v17 = v3;
  id v16 = *(id *)(a1 + 56);
  id v11 = v3;
  [v7 named:v8 execute:v12];
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeLocalPlayerFromPlayersToInvite];
  uint64_t v2 = [*(id *)(a1 + 32) recipients];
  id v3 = [v2 _gkNonGuestPlayersFromPlayers];
  uint64_t v4 = [v3 count];
  BOOL v5 = v4 != 0;

  if (v4)
  {
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_3;
    v67[3] = &unk_1E5F65908;
    uint64_t v6 = *(void **)(a1 + 32);
    v67[4] = *(void *)(a1 + 40);
    [v6 setRecipientResponseHandler:v67];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_4;
  aBlock[3] = &unk_1E5F65930;
  BOOL v66 = v4 != 0;
  aBlock[4] = *(void *)(a1 + 40);
  id v7 = _Block_copy(aBlock);
  int v8 = [*(id *)(a1 + 40) isHosted];
  id v9 = *(void **)(a1 + 40);
  if (v8)
  {
    uint64_t v10 = [v9 hostedPlayers];
    uint64_t v11 = [v10 count];

    id v12 = [*(id *)(a1 + 40) hostedPlayers];
    id v13 = [MEMORY[0x1E4F63760] localPlayer];
    int v14 = [v12 containsObject:v13];

    if (!*MEMORY[0x1E4F63860]) {
      id v15 = (id)GKOSLoggers();
    }
    uint64_t v16 = v11 + (v14 ^ 1u);
    id v17 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void **)(a1 + 40);
      long long v19 = v17;
      uint64_t v20 = [v18 hostedPlayers];
      *(_DWORD *)buf = 138412290;
      v69 = v20;
      _os_log_impl(&dword_1AF250000, v19, OS_LOG_TYPE_INFO, "Adding players for Hosted Match Request: %@", buf, 0xCu);
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F63688];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_132;
    v59[3] = &unk_1E5F65980;
    id v22 = (id *)&v60.i64[1];
    int8x16_t v50 = *(int8x16_t *)(a1 + 32);
    id v23 = (id)v50.i64[0];
    int8x16_t v60 = vextq_s8(v50, v50, 8uLL);
    v63[2] = v16;
    long long v24 = &v62;
    v63[1] = *(void *)(a1 + 72);
    v62 = v7;
    BOOL v64 = v5;
    id v25 = &v61;
    id v61 = *(id *)(a1 + 48);
    uint64_t v26 = (id *)v63;
    v63[0] = *(id *)(a1 + 64);
    id v27 = v7;
    [v21 named:@"Adding Players for Hosted Match Request" execute:v59];
  }
  else
  {
    id v28 = [v9 match];

    v29 = (void *)MEMORY[0x1E4F63860];
    v30 = (os_log_t *)MEMORY[0x1E4F63870];
    if (!v28)
    {
      v31 = [*(id *)(a1 + 40) matchmaker];
      v32 = (void *)[v31 newMatch];
      [*(id *)(a1 + 40) setMatch:v32];

      id v33 = *(void **)(a1 + 40);
      uint64_t v34 = [v33 match];
      [v34 setInviteDelegate:v33];

      if (!*v29) {
        id v35 = (id)GKOSLoggers();
      }
      os_log_t v36 = *v30;
      if (os_log_type_enabled(*v30, OS_LOG_TYPE_INFO))
      {
        v37 = *(void **)(a1 + 40);
        v38 = v36;
        v39 = [v37 match];
        uint64_t v40 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v69 = v39;
        __int16 v70 = 2112;
        uint64_t v71 = v40;
        _os_log_impl(&dword_1AF250000, v38, OS_LOG_TYPE_INFO, "Created a new GKMatch: %@. UUID: %@", buf, 0x16u);
      }
    }
    if (!*v29) {
      id v41 = (id)GKOSLoggers();
    }
    os_log_t v42 = *v30;
    if (os_log_type_enabled(*v30, OS_LOG_TYPE_INFO))
    {
      v43 = *(void **)(a1 + 40);
      v44 = v42;
      v45 = [v43 match];
      *(_DWORD *)buf = 138412290;
      v69 = v45;
      _os_log_impl(&dword_1AF250000, v44, OS_LOG_TYPE_INFO, "Adding players to Match: %@", buf, 0xCu);
    }
    v46 = (void *)MEMORY[0x1E4F63688];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_138;
    v52[3] = &unk_1E5F659D0;
    id v22 = (id *)&v53.i64[1];
    int8x16_t v51 = *(int8x16_t *)(a1 + 32);
    id v47 = (id)v51.i64[0];
    int8x16_t v53 = vextq_s8(v51, v51, 8uLL);
    long long v24 = &v54;
    id v48 = *(id *)(a1 + 56);
    uint64_t v58 = *(void *)(a1 + 72);
    id v25 = &v56;
    id v54 = v48;
    v56 = v7;
    uint64_t v26 = &v55;
    id v55 = *(id *)(a1 + 48);
    id v57 = *(id *)(a1 + 64);
    id v49 = v7;
    [v46 named:@"Add Players To Match" execute:v52];
  }
}

uint64_t __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) invitedPlayer:a2 responded:a3];
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_4(uint64_t a1, void *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v3 remoteViewController];
  id v6 = v5;
  if (v2) {
    [v5 setInvitesFailedWithError:v4];
  }
  else {
    [v5 setAutomatchFailedWithError:v4];
  }
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_132(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) matchmaker];
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2_133;
  v7[3] = &unk_1E5F65958;
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 72);
  id v5 = *(id *)(a1 + 56);
  char v12 = *(unsigned char *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 64);
  [v2 addPlayersForHostedMatchRequest:v3 existingPlayerCount:v4 completionHandler:v7];
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2_133(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (!*(unsigned char *)(a1 + 72))
  {
    uint64_t v7 = [v5 count];
    id v8 = [*(id *)(a1 + 32) hostedPlayers];
    [v8 addObjectsFromArray:v5];

    id v9 = [*(id *)(a1 + 32) remoteViewController];
    [v9 setAutomatchPlayerCount:v7];

    if (v7) {
      [*(id *)(a1 + 32) finishWithPlayers];
    }
  }
  if (!*MEMORY[0x1E4F63860]) {
    id v10 = (id)GKOSLoggers();
  }
  uint64_t v11 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138412290;
    uint64_t v14 = v12;
    _os_log_impl(&dword_1AF250000, v11, OS_LOG_TYPE_INFO, "Done invitation group from addPlayersForHosted. UUID: %@", (uint8_t *)&v13, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_138(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) matchmaker];
  uint64_t v3 = [*(id *)(a1 + 32) match];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2_139;
  v7[3] = &unk_1E5F659A8;
  uint64_t v6 = *(void *)(a1 + 80);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v11 = v6;
  id v9 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 72);
  [v2 addPlayersToMatch:v3 matchRequest:v4 devicePushToken:v5 completionHandler:v7];
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2_139(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) userCancelledMatching])
  {
    if (!v3)
    {
      id v3 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];
    }
    [*(id *)(a1 + 32) setUserCancelledMatching:0];
  }
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v4 = [*(id *)(a1 + 32) match];
    uint64_t v5 = [NSString stringWithFormat:@"%@", v3];
    [v4 promptRadarAndRequestRemoteLogsWithDescriptionAddition:v5];
  }
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  uint64_t v7 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "Done invitation group from addPlayersToMatch. UUID: %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)cancelPendingInviteToPlayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F63688];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmakerViewController_iOS.m", 810, "-[GKMatchmakerViewController cancelPendingInviteToPlayer:]");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__GKMatchmakerViewController_cancelPendingInviteToPlayer___block_invoke;
  v8[3] = &unk_1E5F63350;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 named:v6 execute:v8];
}

void __58__GKMatchmakerViewController_cancelPendingInviteToPlayer___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) matchmaker];
  int v2 = [MEMORY[0x1E4F63788] canonicalizedPlayerForInternal:*(void *)(a1 + 40)];
  [v3 cancelPendingInviteToPlayer:v2];
}

- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (NSObject **)MEMORY[0x1E4F63860];
  uint64_t v12 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v13 = (id)GKOSLoggers();
    uint64_t v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_1AF250000, v12, OS_LOG_TYPE_DEFAULT, "groupActivityJoiningPlayer player: %@, participantID: %@", (uint8_t *)&v16, 0x16u);
  }
  remoteViewController = self->_remoteViewController;
  uint64_t v15 = [v8 internal];
  [(GKMatchmakerHostViewController *)remoteViewController groupActivityJoiningPlayer:v15 devicePushToken:v9 participantServerIdentifier:v10];
}

- (void)invitedPlayer:(id)a3 responded:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "GKMatchMakerViewController: invitedPlayer: responded:", (uint8_t *)&v25, 2u);
  }
  if (!*v7) {
    id v10 = (id)GKOSLoggers();
  }
  uint64_t v11 = (os_log_t *)MEMORY[0x1E4F63870];
  uint64_t v12 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    uint64_t v14 = [v6 internal];
    uint64_t v15 = [v14 debugDescription];
    int v16 = [NSNumber numberWithInteger:a4];
    int v25 = 138412546;
    uint64_t v26 = v15;
    __int16 v27 = 2112;
    id v28 = v16;
    _os_log_impl(&dword_1AF250000, v13, OS_LOG_TYPE_INFO, "Invited player: %@ responded: %@", (uint8_t *)&v25, 0x16u);
  }
  if (!a4 && self->_hosted)
  {
    if (!*v7) {
      id v17 = (id)GKOSLoggers();
    }
    __int16 v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1AF250000, v18, OS_LOG_TYPE_INFO, "    ---> GKInviteeResponseAccepted", (uint8_t *)&v25, 2u);
    }
    [(NSMutableArray *)self->_hostedPlayers addObject:v6];
    id v19 = [(GKMatchmakerViewController *)self matchmakerDelegate];
    if (objc_opt_respondsToSelector())
    {
      [v19 matchmakerViewController:self hostedPlayerDidAccept:v6];
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v20 = [v6 internal];
      uint64_t v21 = [v20 playerID];
      [v19 matchmakerViewController:self didReceiveAcceptFromHostedPlayer:v21];
    }
    else
    {
      if (!*v7) {
        id v22 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
        -[GKMatchmakerViewController invitedPlayer:responded:]();
      }
    }
  }
  remoteViewController = self->_remoteViewController;
  long long v24 = [v6 internal];
  [(GKMatchmakerHostViewController *)remoteViewController setPlayer:v24 responded:a4];
}

- (void)match:(id)a3 didFailWithError:(id)a4
{
}

- (void)match:(id)a3 didReceiveData:(id)a4 fromRemotePlayer:(id)a5
{
  remoteViewController = self->_remoteViewController;
  id v7 = a4;
  id v8 = [a5 internal];
  [(GKMatchmakerHostViewController *)remoteViewController setPlayer:v8 sentData:v7];
}

- (void)match:(id)a3 player:(id)a4 didChangeConnectionState:(int64_t)a5
{
  remoteViewController = self->_remoteViewController;
  objc_msgSend(a4, "internal", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(GKMatchmakerHostViewController *)remoteViewController setPlayer:v7 connected:a5 == 1];
}

- (void)sendData:(id)a3
{
}

- (void)setBrowsingForNearbyPlayers:(BOOL)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F63688];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchmakerViewController_iOS.m", 869, "-[GKMatchmakerViewController setBrowsingForNearbyPlayers:]");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__GKMatchmakerViewController_setBrowsingForNearbyPlayers___block_invoke;
  v7[3] = &unk_1E5F63D68;
  BOOL v8 = a3;
  v7[4] = self;
  [v5 named:v6 execute:v7];
}

void __58__GKMatchmakerViewController_setBrowsingForNearbyPlayers___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) matchmaker];
  id v4 = v3;
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__GKMatchmakerViewController_setBrowsingForNearbyPlayers___block_invoke_2;
    v5[3] = &unk_1E5F65A70;
    v5[4] = *(void *)(a1 + 32);
    [v3 startBrowsingForNearbyPlayersWithHandler:v5];
  }
  else
  {
    [v3 stopBrowsingForNearbyPlayers];
  }
}

void __58__GKMatchmakerViewController_setBrowsingForNearbyPlayers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v8 = [v4 remoteViewController];
  id v6 = [v5 internal];

  id v7 = [v6 playerID];
  [v8 setNearbyPlayer:v7 reachable:a3];
}

- (void)activateGroupActivities
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "Game Center trying to activate GroupActivity", v6, 2u);
  }
  id v5 = [(GKMatchmakerViewController *)self matchmaker];
  [v5 activateGroupActivityWithHandler:&__block_literal_global_147];
}

void __53__GKMatchmakerViewController_activateGroupActivities__block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "Game Center done activating GroupActivity, success: %hhd", (uint8_t *)v5, 8u);
  }
}

- (void)endGroupActivities
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "Game Center trying to activate GroupActivity", v6, 2u);
  }
  id v5 = [(GKMatchmakerViewController *)self matchmaker];
  [v5 endGroupActivity];
}

- (void)presentSharePlaySharingController
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1AF250000, v0, OS_LOG_TYPE_DEBUG, "will not presentSharePlaySharingController for Game Center internal processes.", v1, 2u);
}

- (void)disconnectFromMatch
{
  id v3 = [(GKMatchmakerViewController *)self match];

  if (v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v4 = (id)GKOSLoggers();
    }
    id v5 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "Game Center trying to disconnect from match.", buf, 2u);
    }
    int v9 = 5;
    uint64_t v6 = [(GKMatchmakerViewController *)self match];
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v9 length:4];
    [v6 sendInviteData:v7];

    id v8 = [(GKMatchmakerViewController *)self match];
    [v8 setInviteDelegate:0];

    [(GKMatchmakerViewController *)self setMatch:0];
  }
}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
}

- (void)setConnectingStateForPlayer:(id)a3
{
  remoteViewController = self->_remoteViewController;
  id v4 = [a3 internal];
  [(GKMatchmakerHostViewController *)remoteViewController setConnectingStateForPlayer:v4];
}

- (void)inviterCancelledNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "GKMatchmakterViewController: inviterCancelledNotification", buf, 2u);
  }
  id v8 = [(GKMatchmakerViewController *)self acceptedInvite];

  if (v8)
  {
    int v9 = [v4 userInfo];
    id v10 = [v9 objectForKey:*MEMORY[0x1E4F632C8]];

    if (!v10)
    {
      uint64_t v11 = [v4 userInfo];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"session-token"];

      if (v12)
      {
        id v10 = [v12 base64EncodedStringWithOptions:0];
      }
      else
      {
        id v10 = 0;
      }
    }
    id v13 = [(GKMatchmakerViewController *)self acceptedInvite];
    uint64_t v14 = [v13 inviteID];
    int v15 = [v14 isEqualToString:v10];

    if (v15)
    {
      int v16 = [(GKMatchmakerViewController *)self remoteViewController];

      if (v16)
      {
        id v17 = [(GKMatchmakerViewController *)self remoteViewController];
        [v17 inviterCancelled];

        if (!*v5) {
          id v18 = (id)GKOSLoggers();
        }
        id v19 = *MEMORY[0x1E4F63870];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v22 = 0;
          _os_log_impl(&dword_1AF250000, v19, OS_LOG_TYPE_INFO, "GKMatchmakterViewController: inviterCancelledNotification - Invite Cancelled", v22, 2u);
        }
      }
      else
      {
        if (!*v5) {
          id v20 = (id)GKOSLoggers();
        }
        uint64_t v21 = *MEMORY[0x1E4F63870];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v23 = 0;
          _os_log_impl(&dword_1AF250000, v21, OS_LOG_TYPE_INFO, "the remote view controller has not been up yet, set inviterCancelNotificaitonReceived = YES", v23, 2u);
        }
        [(GKMatchmakerViewController *)self setInviterCancelNotificaitonReceived:1];
      }
    }
  }
}

- (void)inviteSharePlayPlayer:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = (os_log_t *)MEMORY[0x1E4F63870];
  id v8 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1AF250000, v8, OS_LOG_TYPE_INFO, "inviteSharePlayPlayer: %@", (uint8_t *)&v15, 0xCu);
  }
  int v9 = [v4 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"player"];
  uint64_t v11 = [v9 objectForKeyedSubscript:@"pushToken"];
  uint64_t v12 = [v9 objectForKeyedSubscript:@"participantIdentifier"];
  if (v10 && v11)
  {
    [(GKMatchmakerViewController *)self groupActivityJoiningPlayer:v10 devicePushToken:v11 participantServerIdentifier:v12];
  }
  else
  {
    if (!*v5) {
      id v13 = (id)GKOSLoggers();
    }
    uint64_t v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_1AF250000, v14, OS_LOG_TYPE_INFO, "cannot call groupActivityJoiningPlayer as something is nil. player: %@, pushToken: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)sharePlayEligibilityChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "sharePlayEligibilityChanged: %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"isEligibleForGroupSession"];
  uint64_t v9 = [v8 BOOLValue];

  [(GKMatchmakerHostViewController *)self->_remoteViewController setEligibilityForGroupSession:v9];
}

- (void)sharePlaySharingControllerResultSucceeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v7 = NSNumber;
    id v8 = v6;
    uint64_t v9 = [v7 numberWithBool:v3];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1AF250000, v8, OS_LOG_TYPE_INFO, "sharePlaySharingControllerResultSucceeded: %@", (uint8_t *)&v10, 0xCu);
  }
  [(GKMatchmakerHostViewController *)self->_remoteViewController setSharePlaySharingControllerResult:v3];
}

- (void)recipientPropertiesNeededForPlayer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__GKMatchmakerViewController_recipientPropertiesNeededForPlayer___block_invoke;
  v6[3] = &unk_1E5F65AB8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(GKMatchmakerViewController *)self handleRecipientPropertiesNeededForPlayer:v5 completionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__GKMatchmakerViewController_recipientPropertiesNeededForPlayer___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = (id *)(a1 + 40);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    id v5 = [WeakRetained remoteViewController];
    [v5 recipientPropertiesProvided:v4 forPlayer:*(void *)(a1 + 32)];
  }
}

- (void)authenticationChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F63388]];

  if (!self->_alertController)
  {
    id v7 = [MEMORY[0x1E4F63760] localPlayer];
    if ([v7 isAuthenticated])
    {
      id v8 = [MEMORY[0x1E4F63760] localPlayer];
      uint64_t v9 = [v8 internal];
      int v10 = [v9 playerID];
      char v11 = [v10 isEqualToString:v6];

      if (v11) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if (!*MEMORY[0x1E4F63860]) {
      id v12 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_DEBUG)) {
      -[GKMatchmakerViewController authenticationChanged:]();
    }
    [(GKMatchmakerViewController *)self cancel];
  }
LABEL_11:
}

- (void)applicationWillEnterForeground:(id)a3
{
}

- (id)matchmakerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->matchmakerDelegate);

  return WeakRetained;
}

- (void)setMatchmakerDelegate:(id)matchmakerDelegate
{
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
}

- (BOOL)isHosted
{
  return self->_hosted;
}

- (GKMatchmakingMode)matchmakingMode
{
  return self->_matchmakingMode;
}

- (BOOL)canStartWithMinimumPlayers
{
  return self->_canStartWithMinimumPlayers;
}

- (GKMatchmakerHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (GKInvite)acceptedInvite
{
  return self->_acceptedInvite;
}

- (void)setAcceptedInvite:(id)a3
{
}

- (GKMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (NSMutableArray)hostedPlayers
{
  return self->_hostedPlayers;
}

- (void)setHostedPlayers:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (BOOL)inviterCancelNotificaitonReceived
{
  return self->_inviterCancelNotificaitonReceived;
}

- (void)setInviterCancelNotificaitonReceived:(BOOL)a3
{
  self->_inviterCancelNotificaitonReceived = a3;
}

- (GKDispatchGroup)invitationGroup
{
  return self->_invitationGroup;
}

- (void)setInvitationGroup:(id)a3
{
}

- (GKInternalPlayerPickerDelegate)internalPlayerPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalPlayerPickerDelegate);

  return (GKInternalPlayerPickerDelegate *)WeakRetained;
}

- (GKPlayerPickerContext)playerPickerContext
{
  return self->_playerPickerContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPickerContext, 0);
  objc_destroyWeak((id *)&self->_internalPlayerPickerDelegate);
  objc_storeStrong((id *)&self->_invitationGroup, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_hostedPlayers, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_acceptedInvite, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_matchRequest, 0);

  objc_destroyWeak((id *)&self->matchmakerDelegate);
}

- (id)registerGroupActivitySharingControllerItemProvider:(id)a3
{
  id v4 = a3;
  id v5 = self;
  GKMatchmakerViewController.registerSharingControllerItemProvider(itemProvider:)(v6, (NSItemProvider)v4);
  id v8 = v7;

  return v8;
}

- (void)handleRecipientPropertiesNeededForPlayer:(id)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_1AF6A8F80(a3, v8, (void (**)(void, void))v6);
  _Block_release(v6);
}

void __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "We failed to present Game Center matchmaker extension.", v2, v3, v4, v5, v6);
}

- (void)setHostedPlayer:(os_log_t)log connected:.cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  uint64_t v2 = "-[GKMatchmakerViewController setHostedPlayer:connected:]";
  __int16 v3 = 2114;
  uint64_t v4 = @"14.0";
  __int16 v5 = 2114;
  uint8_t v6 = @"11.0";
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

- (void)setHostedPlayerReady:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  uint64_t v2 = "-[GKMatchmakerViewController setHostedPlayerReady:]";
  __int16 v3 = 2114;
  uint64_t v4 = @"14.0";
  __int16 v5 = 2114;
  uint8_t v6 = @"11.0";
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

- (void)finishWithError:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF250000, v0, v1, "<Warning>: matchmakerDelegate not found for %{public}p", v2, v3, v4, v5, v6);
}

- (void)finishWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "<Warning>: matchmakerViewController:didFailWithError: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
}

void __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "matchForInvite done without a valid match or any error.", v2, v3, v4, v5, v6);
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "Timeout while starting matching with request: %@. Error: %@", (uint8_t *)&v5, 0x16u);
}

- (void)invitedPlayer:responded:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF250000, v0, v1, "<Warning>: matchmakerViewController:hostedPlayerDidAccept: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
}

- (void)authenticationChanged:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1AF250000, v0, OS_LOG_TYPE_DEBUG, "GKMatchmakerViewController_iOS authenticationChanged with notification: %@", v1, 0xCu);
}

@end