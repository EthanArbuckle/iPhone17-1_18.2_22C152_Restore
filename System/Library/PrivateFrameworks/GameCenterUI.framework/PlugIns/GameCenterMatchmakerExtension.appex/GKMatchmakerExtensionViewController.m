@interface GKMatchmakerExtensionViewController
- (BOOL)canStartWithMinimumPlayers;
- (BOOL)hosted;
- (BOOL)isEligibleForGroupSession;
- (BOOL)isEntitledToUseGroupActivities;
- (GKInvite)acceptedInvite;
- (GKMatchRequest)matchRequest;
- (GKMatchmakerExtensionViewController)initWithCoder:(id)a3;
- (GKMultiplayerP2PViewController)delegatedContentViewController;
- (GKPlayerPickerContext)playerPickerContext;
- (NSArray)existingPlayers;
- (id)hostObjectProxy;
- (id)nearbyPlayerHandler;
- (int64_t)matchmakingMode;
- (void)activateGroupActivitiesForMultiplayerP2PViewController:(id)a3;
- (void)applicationWillEnterForeground;
- (void)constructContentViewController;
- (void)disconnectMatchForMultiplayerP2PViewController:(id)a3;
- (void)dismissWithGameController;
- (void)endGroupActivitiesForMultiplayerP2PViewController:(id)a3;
- (void)messageFromClient:(id)a3;
- (void)multiplayerP2PViewController:(id)a3 cancelInviteToPlayer:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 didFinishWithError:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 sendData:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 setShareInvitees:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 shareMatchWithRequest:(id)a4 handler:(id)a5;
- (void)multiplayerP2PViewController:(id)a3 startMatchingWithRequest:(id)a4;
- (void)multiplayerP2PViewController:(id)a3 startMatchingWithRequest:(id)a4 devicePushToken:(id)a5;
- (void)multiplayerP2PViewControllerCancelMatching:(id)a3;
- (void)multiplayerP2PViewControllerPresentSharePlaySharingController:(id)a3;
- (void)multiplayerPicker:(id)a3 didPickPlayers:(id)a4 messageGroups:(id)a5 customMessage:(id)a6;
- (void)multiplayerPickerDidCancel:(id)a3;
- (void)navigateToSharePlayChiclet;
- (void)requestRecipientProperties:(id)a3;
- (void)setAcceptedInvite:(id)a3;
- (void)setCanStartWithMinimumPlayers:(BOOL)a3;
- (void)setDefaultInvitationMessage:(id)a3;
- (void)setDelegatedContentViewController:(id)a3;
- (void)setExistingPlayers:(id)a3;
- (void)setHosted:(BOOL)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setIsEligibleForGroupSession:(BOOL)a3;
- (void)setIsEntitledToUseGroupActivities:(BOOL)a3;
- (void)setMatchRequest:(id)a3;
- (void)setMatchmakingMode:(int64_t)a3;
- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4;
- (void)setNearbyPlayerHandler:(id)a3;
- (void)setPlayerPickerContext:(id)a3;
- (void)startBrowsingForNearbyPlayersWithReachableHandler:(id)a3;
- (void)stopBrowsingForNearbyPlayers;
@end

@implementation GKMatchmakerExtensionViewController

- (GKMatchmakerExtensionViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKMatchmakerExtensionViewController;
  v3 = [(GKMatchmakerExtensionViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GKMatchmakerExtensionViewController *)v3 setAlwaysShowDoneButton:0];
  }
  return v4;
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesHosted];
  -[GKMatchmakerExtensionViewController setHosted:](self, "setHosted:", [v8 BOOLValue]);

  v9 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesMatchmakingMode];
  -[GKMatchmakerExtensionViewController setMatchmakingMode:](self, "setMatchmakingMode:", [v9 integerValue]);

  v10 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesFastStartEnabled];
  -[GKMatchmakerExtensionViewController setCanStartWithMinimumPlayers:](self, "setCanStartWithMinimumPlayers:", [v10 BOOLValue]);

  v11 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesGroupSessionEligible];
  -[GKMatchmakerExtensionViewController setIsEligibleForGroupSession:](self, "setIsEligibleForGroupSession:", [v11 BOOLValue]);

  v12 = [v6 objectForKeyedSubscript:GKExtensionItemEntitledToGroupActivities];
  -[GKMatchmakerExtensionViewController setIsEntitledToUseGroupActivities:](self, "setIsEntitledToUseGroupActivities:", [v12 BOOLValue]);

  v13 = [v6 objectForKeyedSubscript:@"playerPickerContext"];
  [(GKMatchmakerExtensionViewController *)self setPlayerPickerContext:v13];

  v14 = [v6 objectForKeyedSubscript:GKExtensionItemPlayerInternalsKey];
  [(GKMatchmakerExtensionViewController *)self setExistingPlayers:v14];

  v15 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesMatchRequestInternal];
  if (v15)
  {
    id v16 = [objc_alloc((Class)GKMatchRequest) initWithInternalRepresentation:v15];
    [(GKMatchmakerExtensionViewController *)self setMatchRequest:v16];
  }
  v17 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesAcceptedInviteInternal];
  if (v17)
  {
    id v18 = [objc_alloc((Class)GKInvite) initWithInternalRepresentation:v17];
    [(GKMatchmakerExtensionViewController *)self setAcceptedInvite:v18];
  }
  v19.receiver = self;
  v19.super_class = (Class)GKMatchmakerExtensionViewController;
  [(GKMatchmakerExtensionViewController *)&v19 setInitialState:v6 withReply:v7];
}

- (void)constructContentViewController
{
  v3 = [(GKMatchmakerExtensionViewController *)self acceptedInvite];
  if (v3
    || ([(GKMatchmakerExtensionViewController *)self matchRequest],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v32 = [(GKMatchmakerExtensionViewController *)self playerPickerContext];

    if (!v32) {
      return;
    }
  }
  v4 = [(GKMatchmakerExtensionViewController *)self playerPickerContext];

  if (v4)
  {
    id v5 = objc_alloc((Class)GKDashboardMultiplayerPickerViewController);
    id v6 = [(GKMatchmakerExtensionViewController *)self playerPickerContext];
    id v7 = [v6 maxPlayers];
    v8 = [(GKMatchmakerExtensionViewController *)self playerPickerContext];
    v9 = [v8 excludedPlayers];
    v10 = [(GKMatchmakerExtensionViewController *)self playerPickerContext];
    id v11 = objc_msgSend(v5, "initWithMaxSelectable:hiddenPlayers:nearbyOnly:pickerOrigin:", v7, v9, 0, objc_msgSend(v10, "pickerOrigin"));

    [v11 setMultiplayerPickerDelegate:self];
    [v11 setNearbyDelegate:self];
    v12 = +[GKPreferences shared];
    objc_msgSend(v11, "setSupportsNearby:", objc_msgSend(v12, "shouldAllowNearbyMultiplayer"));

LABEL_8:
    [(GKMatchmakerExtensionViewController *)self setContentViewController:v11];
    goto LABEL_9;
  }
  v13 = [(GKMatchmakerExtensionViewController *)self acceptedInvite];

  if (v13)
  {
    id v14 = objc_alloc((Class)GKMultiplayerP2PViewController);
    v15 = [(GKMatchmakerExtensionViewController *)self acceptedInvite];
    id v16 = [v14 initWithAcceptedInvite:v15];
    [(GKMatchmakerExtensionViewController *)self setDelegatedContentViewController:v16];

    id v11 = [(GKMatchmakerExtensionViewController *)self delegatedContentViewController];
    goto LABEL_8;
  }
  v33 = [(GKMatchmakerExtensionViewController *)self matchRequest];

  if (v33)
  {
    id v34 = objc_alloc((Class)GKMultiplayerP2PViewController);
    v35 = [(GKMatchmakerExtensionViewController *)self matchRequest];
    id v36 = [v34 initWithMatchRequest:v35];
    [(GKMatchmakerExtensionViewController *)self setDelegatedContentViewController:v36];

    BOOL v37 = [(GKMatchmakerExtensionViewController *)self canStartWithMinimumPlayers];
    v38 = [(GKMatchmakerExtensionViewController *)self delegatedContentViewController];
    [v38 setCanStartWithMinimumPlayers:v37];

    v39 = [(GKMatchmakerExtensionViewController *)self matchRequest];
    v40 = +[GKGame currentGame];
    v41 = [(GKMatchmakerExtensionViewController *)self delegatedContentViewController];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100003C20;
    v53[3] = &unk_1000209F0;
    v53[4] = self;
    v42 = +[MultiplayerModeSelectionViewController viewControllerWithRequest:v39 game:v40 multiplayerViewController:v41 dismissHandler:v53];
    [(GKMatchmakerExtensionViewController *)self setContentViewController:v42];

    int64_t v43 = [(GKMatchmakerExtensionViewController *)self matchmakingMode];
    v44 = [(GKMatchmakerExtensionViewController *)self contentViewController];
    [v44 setOriginalMatchmakingMode:v43];

    BOOL v45 = [(GKMatchmakerExtensionViewController *)self isEligibleForGroupSession];
    v46 = [(GKMatchmakerExtensionViewController *)self contentViewController];
    [v46 setIsEligibleForGroupSession:v45];

    BOOL v47 = [(GKMatchmakerExtensionViewController *)self isEntitledToUseGroupActivities];
    v48 = [(GKMatchmakerExtensionViewController *)self contentViewController];
    [v48 setIsEntitledToUseGroupActivities:v47];

    goto LABEL_10;
  }
  v49 = +[NSString stringWithFormat:@"Configuration failure for GKMatchmakerExtensionViewController."];
  v50 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/GameCenterMatchmakerExtension/GKMatchmakerExtensionViewController.m"];
  id v51 = [v50 lastPathComponent];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v49, "-[GKMatchmakerExtensionViewController constructContentViewController]", [v51 UTF8String], 143);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  +[NSException raise:@"GameKit Exception", @"%@", v11 format];
LABEL_9:

LABEL_10:
  v17 = [(GKMatchmakerExtensionViewController *)self playerPickerContext];

  if (!v17)
  {
    id v18 = +[GKGame currentGame];
    objc_super v19 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
    [v19 setGame:v18];

    BOOL v20 = [(GKMatchmakerExtensionViewController *)self hosted];
    v21 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
    [v21 setHosted:v20];

    int64_t v22 = [(GKMatchmakerExtensionViewController *)self matchmakingMode];
    v23 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
    [v23 setMatchmakingMode:v22];

    v24 = [(GKMatchmakerExtensionViewController *)self existingPlayers];
    id v25 = [v24 count];

    if (v25)
    {
      v26 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      v27 = [(GKMatchmakerExtensionViewController *)self existingPlayers];
      [v26 setExistingPlayers:v27];

      v28 = [(GKMatchmakerExtensionViewController *)self contentViewController];

      if (v28)
      {
        v29 = [(GKMatchmakerExtensionViewController *)self contentViewController];
        [v29 setSkipModeSelection:1];
      }
    }
    v30 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
    [v30 setDelegate:self];

    v31 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
    [v31 setNearbyDelegate:self];
  }
  [(GKMatchmakerExtensionViewController *)self setAdjustTopConstraint:0];
  v52.receiver = self;
  v52.super_class = (Class)GKMatchmakerExtensionViewController;
  [(GKMatchmakerExtensionViewController *)&v52 constructContentViewController];
}

- (void)messageFromClient:(id)a3
{
  id v4 = a3;
  id v5 = GKExtensionProtocolSecureCodedClasses();
  id v21 = 0;
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v5 fromData:v4 error:&v21];
  id v7 = v21;

  if (v7)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    v9 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_100015FE0((uint64_t)v7, v9);
    }
  }
  v10 = [v6 objectForKeyedSubscript:GKExtensionMessageCommandKey];
  id v11 = [v10 integerValue];

  v12 = [v6 objectForKeyedSubscript:GKExtensionMessageParamKey];
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers();
  }
  id v14 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Got messageFromClient: %@", buf, 0xCu);
  }
  switch((unint64_t)v11)
  {
    case 0x1BuLL:
      -[GKMatchmakerExtensionViewController setHosted:](self, "setHosted:", [v12 BOOLValue]);
      break;
    case 0x1CuLL:
      id v15 = [objc_alloc((Class)GKMatchRequest) initWithInternalRepresentation:v12];
      [(GKMatchmakerExtensionViewController *)self setMatchRequest:v15];
      goto LABEL_24;
    case 0x1DuLL:
      id v15 = [objc_alloc((Class)GKInvite) initWithInternalRepresentation:v12];
      [(GKMatchmakerExtensionViewController *)self setAcceptedInvite:v15];
      goto LABEL_24;
    case 0x1EuLL:
      [(GKMatchmakerExtensionViewController *)self setExistingPlayers:v12];
      break;
    case 0x1FuLL:
      [(GKMatchmakerExtensionViewController *)self setDefaultInvitationMessage:v12];
      break;
    case 0x20uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      objc_msgSend(v16, "setAutomatchPlayerCount:", objc_msgSend(v12, "integerValue"));
      goto LABEL_36;
    case 0x21uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      v17 = [v6 objectForKeyedSubscript:GKExtensionMessagePlayerInternal];
      objc_msgSend(v16, "setPlayer:responded:", v17, objc_msgSend(v12, "integerValue"));
      goto LABEL_35;
    case 0x22uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      v17 = [v6 objectForKeyedSubscript:GKExtensionMessagePlayerInternal];
      objc_msgSend(v16, "setPlayer:connected:", v17, objc_msgSend(v12, "BOOLValue"));
      goto LABEL_35;
    case 0x23uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      v17 = [v6 objectForKeyedSubscript:GKExtensionMessagePlayerInternal];
      [v16 setPlayer:v17 sentData:v12];
      goto LABEL_35;
    case 0x24uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      [v16 setInvitesFailedWithError:v12];
      goto LABEL_36;
    case 0x25uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      [v16 setAutomatchFailedWithError:v12];
      goto LABEL_36;
    case 0x26uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      [v16 inviterCancelled];
      goto LABEL_36;
    case 0x27uLL:
      id v15 = [v6 objectForKeyedSubscript:GKExtensionMessagePlayerID];
      -[GKMatchmakerExtensionViewController setNearbyPlayer:reachable:](self, "setNearbyPlayer:reachable:", v15, [v12 BOOLValue]);
LABEL_24:

      break;
    case 0x28uLL:
      [(GKMatchmakerExtensionViewController *)self applicationWillEnterForeground];
      break;
    case 0x29uLL:
      break;
    case 0x30uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      v17 = [v6 objectForKeyedSubscript:GKExtensionMessagePlayerInternal];
      [v16 setConnectingStateForPlayer:v17];
      goto LABEL_35;
    case 0x31uLL:
      -[GKMatchmakerExtensionViewController setMatchmakingMode:](self, "setMatchmakingMode:", [v12 integerValue]);
      break;
    case 0x33uLL:
      -[GKMatchmakerExtensionViewController setCanStartWithMinimumPlayers:](self, "setCanStartWithMinimumPlayers:", [v12 BOOLValue]);
      break;
    case 0x34uLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      v17 = [v6 objectForKeyedSubscript:GKExtensionMessagePlayerInternal];
      id v18 = [v12 objectForKeyedSubscript:@"pushToken"];
      objc_super v19 = [v12 objectForKeyedSubscript:@"participantIdentifier"];
      [v16 groupActivityJoiningPlayer:v17 devicePushToken:v18 participantServerIdentifier:v19];

      goto LABEL_35;
    case 0x38uLL:
      -[GKMatchmakerExtensionViewController setIsEligibleForGroupSession:](self, "setIsEligibleForGroupSession:", [v12 BOOLValue]);
      break;
    case 0x3AuLL:
      if ([v12 BOOLValue]) {
        [(GKMatchmakerExtensionViewController *)self navigateToSharePlayChiclet];
      }
      break;
    case 0x3DuLL:
      id v16 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      v17 = [v6 objectForKeyedSubscript:GKExtensionMessagePlayerInternal];
      [v16 updateRecipientProperties:v12 forPlayer:v17];
LABEL_35:

LABEL_36:
      break;
    default:
      v20.receiver = self;
      v20.super_class = (Class)GKMatchmakerExtensionViewController;
      [(GKMatchmakerExtensionViewController *)&v20 messageFromClient:v4];
      break;
  }
}

- (void)setHosted:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hosted = a3;
  id v5 = [(GKMatchmakerExtensionViewController *)self contentViewController];

  if (v5)
  {
    id v6 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
    [v6 setHosted:v3];
  }
}

- (void)setCanStartWithMinimumPlayers:(BOOL)a3
{
  BOOL v3 = a3;
  self->_canStartWithMinimumPlayers = a3;
  id v5 = [(GKMatchmakerExtensionViewController *)self contentViewController];

  if (v5)
  {
    id v6 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
    [v6 setCanStartWithMinimumPlayers:v3];
  }
}

- (void)setIsEligibleForGroupSession:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isEligibleForGroupSession = a3;
  id v5 = [(GKMatchmakerExtensionViewController *)self contentViewController];

  if (v5)
  {
    id v6 = [(GKMatchmakerExtensionViewController *)self contentViewController];
    [v6 setIsEligibleForGroupSession:v3];
  }
}

- (void)navigateToSharePlayChiclet
{
  BOOL v3 = [(GKMatchmakerExtensionViewController *)self contentViewController];

  if (v3)
  {
    id v4 = [(GKMatchmakerExtensionViewController *)self contentViewController];
    [v4 launchSharePlayChiclet];
  }
}

- (void)setMatchmakingMode:(int64_t)a3
{
  self->_matchmakingMode = a3;
  id v5 = [(GKMatchmakerExtensionViewController *)self contentViewController];

  if (v5)
  {
    id v6 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
    [v6 setMatchmakingMode:a3];
  }
}

- (void)setExistingPlayers:(id)a3
{
  p_existingPlayers = &self->_existingPlayers;
  v10 = (NSArray *)a3;
  if (*p_existingPlayers != v10)
  {
    objc_storeStrong((id *)&self->_existingPlayers, a3);
    uint64_t v6 = [(GKMatchmakerExtensionViewController *)self contentViewController];
    if (v6)
    {
      id v7 = (void *)v6;
      NSUInteger v8 = [(NSArray *)*p_existingPlayers count];

      if (v8)
      {
        v9 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
        [v9 setExistingPlayers:v10];
      }
    }
  }
}

- (void)setDefaultInvitationMessage:(id)a3
{
  id v10 = a3;
  id v4 = [(GKMatchmakerExtensionViewController *)self matchRequest];
  id v5 = [v4 inviteMessage];

  if (v5 != v10)
  {
    uint64_t v6 = [(GKMatchmakerExtensionViewController *)self matchRequest];
    [v6 setInviteMessage:v10];

    id v7 = [(GKMatchmakerExtensionViewController *)self contentViewController];

    if (v7)
    {
      NSUInteger v8 = [(GKMatchRequest *)self->_matchRequest inviteMessage];
      v9 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
      [v9 setDefaultInvitationMessage:v8];
    }
  }
}

- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  uint64_t v6 = [(GKMatchmakerExtensionViewController *)self nearbyPlayerHandler];

  if (v6)
  {
    id v7 = [(GKMatchmakerExtensionViewController *)self nearbyPlayerHandler];
    ((void (**)(void, id, BOOL))v7)[2](v7, v8, v4);
  }
}

- (void)applicationWillEnterForeground
{
  BOOL v3 = +[GKPreferences shared];
  [v3 invalidate];

  id v4 = [(GKMatchmakerExtensionViewController *)self multiplayerViewController];
  [v4 applicationWillEnterForeground];
}

- (id)hostObjectProxy
{
  v2 = [(GKMatchmakerExtensionViewController *)self extensionContext];
  BOOL v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&stru_100020A30];

  return v4;
}

- (void)multiplayerP2PViewController:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a4;
  id v5 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &off_100021258, GKExtensionMessageCommandKey, 0);
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:GKExtensionMessageParamKey];
  }
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v5];
}

- (void)multiplayerP2PViewController:(id)a3 shareMatchWithRequest:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = [(GKMatchmakerExtensionViewController *)self hostObjectProxy];
  v9 = [v8 internal];

  [v10 shareMatchWithRequest:v9 handler:v7];
}

- (void)multiplayerP2PViewController:(id)a3 setShareInvitees:(id)a4
{
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  v8[0] = &off_100021270;
  v8[1] = a4;
  id v5 = a4;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v6];
}

- (void)multiplayerP2PViewController:(id)a3 startMatchingWithRequest:(id)a4
{
  v8[0] = &off_100021288;
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  id v5 = objc_msgSend(a4, "internal", a3);
  v8[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v6];
}

- (void)multiplayerP2PViewController:(id)a3 startMatchingWithRequest:(id)a4 devicePushToken:(id)a5
{
  v13[0] = @"request";
  id v7 = a5;
  id v8 = [a4 internal];
  v13[1] = @"pushToken";
  v14[0] = v8;
  v14[1] = v7;
  v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  v11[0] = GKExtensionMessageCommandKey;
  v11[1] = GKExtensionMessageParamKey;
  v12[0] = &off_1000212A0;
  v12[1] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v10];
}

- (void)activateGroupActivitiesForMultiplayerP2PViewController:(id)a3
{
  v5[0] = GKExtensionMessageCommandKey;
  v5[1] = GKExtensionMessageParamKey;
  v6[0] = &off_1000212B8;
  v6[1] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v4];
}

- (void)endGroupActivitiesForMultiplayerP2PViewController:(id)a3
{
  v5[0] = GKExtensionMessageCommandKey;
  v5[1] = GKExtensionMessageParamKey;
  v6[0] = &off_1000212D0;
  v6[1] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v4];
}

- (void)multiplayerP2PViewControllerPresentSharePlaySharingController:(id)a3
{
  v5[0] = GKExtensionMessageCommandKey;
  v5[1] = GKExtensionMessageParamKey;
  v6[0] = &off_1000212E8;
  v6[1] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v4];
}

- (void)disconnectMatchForMultiplayerP2PViewController:(id)a3
{
  v5[0] = GKExtensionMessageCommandKey;
  v5[1] = GKExtensionMessageParamKey;
  v6[0] = &off_100021300;
  v6[1] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v4];
}

- (void)multiplayerP2PViewController:(id)a3 cancelInviteToPlayer:(id)a4
{
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  v8[0] = &off_100021318;
  v8[1] = a4;
  id v5 = a4;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v6];
}

- (void)multiplayerP2PViewController:(id)a3 sendData:(id)a4
{
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  v8[0] = &off_100021330;
  v8[1] = a4;
  id v5 = a4;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v6];
}

- (void)multiplayerP2PViewControllerCancelMatching:(id)a3
{
  uint64_t v5 = GKExtensionMessageCommandKey;
  id v6 = &off_100021348;
  id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v4];
}

- (void)startBrowsingForNearbyPlayersWithReachableHandler:(id)a3
{
  [(GKMatchmakerExtensionViewController *)self setNearbyPlayerHandler:a3];
  v5[0] = GKExtensionMessageCommandKey;
  v5[1] = GKExtensionMessageParamKey;
  v6[0] = &off_100021360;
  v6[1] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v4];
}

- (void)stopBrowsingForNearbyPlayers
{
  v4[0] = GKExtensionMessageCommandKey;
  v4[1] = GKExtensionMessageParamKey;
  v5[0] = &off_100021360;
  v5[1] = &__kCFBooleanFalse;
  BOOL v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v3];
}

- (void)requestRecipientProperties:(id)a3
{
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  v7[0] = &off_100021378;
  v7[1] = a3;
  id v4 = a3;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v5];
}

- (void)dismissWithGameController
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GameController: GKMatchmakerExtensionViewController was dismissed by the game controller.", v5, 2u);
  }
  [(GKMatchmakerExtensionViewController *)self extensionIsCanceling];
}

- (void)multiplayerPicker:(id)a3 didPickPlayers:(id)a4 messageGroups:(id)a5 customMessage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers();
  }
  id v15 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Extension - player picker - didPickPlayers: %@, customMessage: %@", buf, 0x16u);
  }
  id v16 = +[NSMutableDictionary dictionary];
  v17 = [v11 _gkInternalsFromPlayers];
  [v16 setObject:v17 forKeyedSubscript:@"players"];

  v19[0] = GKExtensionMessageCommandKey;
  v19[1] = GKExtensionMessageParamKey;
  v20[0] = &off_100021390;
  v20[1] = v16;
  id v18 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v18];

  [v10 dismissViewControllerAnimated:1 completion:0];
  [(GKMatchmakerExtensionViewController *)self extensionIsCanceling];
}

- (void)multiplayerPickerDidCancel:(id)a3
{
  uint64_t v9 = GKExtensionMessageCommandKey;
  id v10 = &off_1000213A8;
  id v4 = a3;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(GKMatchmakerExtensionViewController *)self sendMessageToClient:v5];

  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Extension - player picker - didCancel", v8, 2u);
  }
  [v4 dismissViewControllerAnimated:1 completion:0];

  [(GKMatchmakerExtensionViewController *)self extensionIsCanceling];
}

- (GKMultiplayerP2PViewController)delegatedContentViewController
{
  return self->_delegatedContentViewController;
}

- (void)setDelegatedContentViewController:(id)a3
{
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
}

- (GKInvite)acceptedInvite
{
  return self->_acceptedInvite;
}

- (void)setAcceptedInvite:(id)a3
{
}

- (BOOL)hosted
{
  return self->_hosted;
}

- (int64_t)matchmakingMode
{
  return self->_matchmakingMode;
}

- (NSArray)existingPlayers
{
  return self->_existingPlayers;
}

- (id)nearbyPlayerHandler
{
  return self->_nearbyPlayerHandler;
}

- (void)setNearbyPlayerHandler:(id)a3
{
}

- (BOOL)canStartWithMinimumPlayers
{
  return self->_canStartWithMinimumPlayers;
}

- (BOOL)isEligibleForGroupSession
{
  return self->_isEligibleForGroupSession;
}

- (BOOL)isEntitledToUseGroupActivities
{
  return self->_isEntitledToUseGroupActivities;
}

- (void)setIsEntitledToUseGroupActivities:(BOOL)a3
{
  self->_isEntitledToUseGroupActivities = a3;
}

- (GKPlayerPickerContext)playerPickerContext
{
  return self->_playerPickerContext;
}

- (void)setPlayerPickerContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPickerContext, 0);
  objc_storeStrong(&self->_nearbyPlayerHandler, 0);
  objc_storeStrong((id *)&self->_existingPlayers, 0);
  objc_storeStrong((id *)&self->_acceptedInvite, 0);
  objc_storeStrong((id *)&self->_matchRequest, 0);

  objc_storeStrong((id *)&self->_delegatedContentViewController, 0);
}

@end