@interface GKMultiplayerP2PViewController
+ (void)addContactCheckTaskForMessageID:(id)a3 respondingPlayer:(id)a4 dataSource:(id)a5 toGroup:(id)a6;
- (BOOL)canStartForcedAutomatch;
- (BOOL)datasourceConfigured;
- (BOOL)haveInvitedPlayers;
- (BOOL)havePendingPlayers;
- (BOOL)isCanceling;
- (BOOL)isHosted;
- (BOOL)isInSetupMode;
- (BOOL)needRecipientPropertiesForPlayer:(id)a3;
- (BOOL)sharePlayEnabled;
- (BOOL)shouldChangeModeFromOldMode:(int64_t)a3 toNewMode:(int64_t)a4;
- (BOOL)startStagedActivity;
- (BOOL)userCancelledMatching;
- (GKInvite)acceptedInvite;
- (GKMultiplayerP2PViewController)initWithAcceptedInvite:(id)a3;
- (GKMultiplayerP2PViewController)initWithMatchRequest:(id)a3;
- (GKMultiplayerP2PViewControllerDelegate)delegate;
- (NSArray)existingRemoteReadyPlayers;
- (NSSet)activeRemoteParticipants;
- (OS_dispatch_queue)conversationManagerQueue;
- (TUConversation)firstActiveConversation;
- (double)inviteeConnectionTimeStamp;
- (id)pageId;
- (int64_t)automatchParticipantStatus;
- (int64_t)mode;
- (unint64_t)origin;
- (void)addExistingRemoteReadyPlayers:(id)a3 withCompletionHandler:(id)a4;
- (void)applicationWillEnterForeground;
- (void)cancel;
- (void)cancelAlertWithoutDelegateCallback;
- (void)cancelPendingInvites;
- (void)configureDataSource;
- (void)configureDataSourceWithCompletionHandler:(id)a3;
- (void)configureWhenEnteringTheLobby;
- (void)configureWhenLeavingTheLobby;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)displayCancelConfirmationDialog;
- (void)finishWithError:(id)a3;
- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5;
- (void)incrementOneAutoMatchPlayerCountIfPossible;
- (void)inviteFriendsButtonPressed;
- (void)invitePlayers:(id)a3;
- (void)loadShareURLWithContactPlayers:(id)a3 completion:(id)a4;
- (void)performActionsForButtonCancelCurrentMatching:(BOOL)a3;
- (void)playNow;
- (void)playerConnected:(id)a3;
- (void)playerDisconnected:(id)a3;
- (void)prepopulateSharePlayActiveParticipants;
- (void)presentSharePlaySharingController;
- (void)processStatusUpdateMessageFromPlayer:(id)a3 bytes:(const char *)a4 withLength:(unsigned int)a5;
- (void)removedPlayer:(id)a3;
- (void)resetInviteesStatus;
- (void)sendInvitesToContactPlayers:(id)a3 legacyPlayers:(id)a4 source:(unint64_t)a5 completion:(id)a6;
- (void)sendInvitesToSharePlayPlayer:(id)a3 devicePushToken:(id)a4;
- (void)sendStatusUpdate;
- (void)setAcceptedInvite:(id)a3;
- (void)setActiveRemoteParticipants:(id)a3;
- (void)setAutomatchFailedWithError:(id)a3;
- (void)setAutomatchPlayerCount:(int64_t)a3;
- (void)setConnectingStateForPlayer:(id)a3;
- (void)setDatasourceConfigured:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExistingPlayers:(id)a3;
- (void)setExistingRemoteReadyPlayers:(id)a3;
- (void)setFirstActiveConversation:(id)a3;
- (void)setHosted:(BOOL)a3;
- (void)setInviteeConnectionTimeStamp:(double)a3;
- (void)setInvitesFailedWithError:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOrigin:(unint64_t)a3;
- (void)setPlayer:(id)a3 connected:(BOOL)a4;
- (void)setPlayer:(id)a3 responded:(int64_t)a4;
- (void)setPlayer:(id)a3 sentData:(id)a4;
- (void)setShareInvitees;
- (void)setSharePlayEnabled:(BOOL)a3;
- (void)setStartStagedActivity:(BOOL)a3;
- (void)setUserCancelledMatching:(BOOL)a3;
- (void)sharePlayFetchFirstActiveConversationWithHandler:(id)a3;
- (void)showAutomatchingErrorAlert;
- (void)showInviterDisconnectedAlert;
- (void)showMatchDisconnectedAlertForPlayer:(id)a3;
- (void)showNoInternetAlert;
- (void)showParentalControlsRestrictionAlert;
- (void)startGame;
- (void)startGameButtonPressed;
- (void)updateFooterButtonStates;
- (void)updateForNewMode;
- (void)updateMode;
- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4;
- (void)updateStartGameButtonTitle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willPresentPlayerPicker:(id)a3;
@end

@implementation GKMultiplayerP2PViewController

- (GKMultiplayerP2PViewController)initWithAcceptedInvite:(id)a3
{
  id v4 = a3;
  v5 = [(GKMultiplayerP2PViewController *)self initWithMatchRequest:0];
  v6 = v5;
  if (v5)
  {
    [(GKMultiplayerP2PViewController *)v5 setAcceptedInvite:v4];
    -[GKMultiplayerP2PViewController setHosted:](v6, "setHosted:", [v4 isHosted]);
    [(GKMultiplayerP2PViewController *)v6 setOrigin:3];
  }

  return v6;
}

- (GKMultiplayerP2PViewController)initWithMatchRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKMultiplayerP2PViewController;
  return [(GKMultiplayerViewController *)&v4 initWithMatchRequest:a3];
}

- (void)configureDataSource
{
}

- (void)configureDataSourceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F636D8];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 100, "-[GKMultiplayerP2PViewController configureDataSourceWithCompletionHandler:]");
  v7 = [v5 dispatchGroupWithName:v6];

  v8 = [(GKCollectionViewController *)self dataSource];

  if (!v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E5F63650;
    v14[4] = self;
    [v7 perform:v14];
  }
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E5F646C0;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [v7 notifyOnMainQueueWithBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5F639B0;
  id v8 = v3;
  v6.receiver = v4;
  v6.super_class = (Class)GKMultiplayerP2PViewController;
  id v5 = v3;
  objc_msgSendSuper2(&v6, sel_configureDataSourceWithCompletionHandler_, v7);
}

uint64_t __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained acceptedInvite];

  id v5 = objc_loadWeakRetained(v2);
  objc_super v6 = v5;
  if (v4)
  {
    v7 = [v5 dataSource];

    [v7 setMinPlayers:2];
    [v7 setMaxPlayers:2];
    id v8 = objc_loadWeakRetained(v2);
    id v9 = [v8 acceptedInvite];
    v10 = [v9 sender];
    v21[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E5F646C0;
    objc_copyWeak(&v20, v2);
    id v19 = *(id *)(a1 + 32);
    [v7 addPlayers:v11 withStatus:6 complete:v18];

    objc_destroyWeak(&v20);
  }
  else
  {
    [v5 setDatasourceConfigured:1];

    id v12 = objc_loadWeakRetained(v2);
    uint64_t v13 = [v12 sharePlayEnabled];
    id v14 = objc_loadWeakRetained(v2);
    v15 = [v14 multiplayerDataSource];
    [v15 setSharePlayEnabled:v13];

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16)
    {
      v17 = *(void (**)(void))(v16 + 16);
      v17();
    }
  }
}

uint64_t __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDatasourceConfigured:1];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)pageId
{
  unint64_t v2 = [(GKMultiplayerP2PViewController *)self origin];
  if (v2 - 1 > 2) {
    return @"sharePlay";
  }
  else {
    return off_1E5F64908[v2 - 1];
  }
}

- (void)dealloc
{
  [(GKMultiplayerP2PViewController *)self cancelAlertWithoutDelegateCallback];
  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerP2PViewController;
  [(GKMultiplayerViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)GKMultiplayerP2PViewController;
  [(GKMultiplayerViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKMultiplayerP2PViewController;
  [(GKMultiplayerViewController *)&v6 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4F63660] reporter];
  id v5 = [(GKMultiplayerP2PViewController *)self pageId];
  [v4 recordPageWithID:v5 pageContext:@"realTimeGame" pageType:@"multiplayer"];

  if ([(GKMultiplayerP2PViewController *)self isMovingToParentViewController])[(GKMultiplayerP2PViewController *)self configureWhenEnteringTheLobby]; {
}
  }

- (void)configureWhenEnteringTheLobby
{
  if (self->_acceptedInvite)
  {
    [(GKMultiplayerP2PViewController *)self setMode:4];
  }
  else
  {
    if ([(GKMultiplayerViewController *)self canStartGroupActivities])
    {
      if ([(GKMultiplayerP2PViewController *)self startStagedActivity]) {
        uint64_t v3 = 9;
      }
      else {
        uint64_t v3 = 8;
      }
      [(GKMultiplayerP2PViewController *)self setMode:v3];
      id v4 = self;
      uint64_t v5 = 1;
    }
    else
    {
      [(GKMultiplayerP2PViewController *)self setMode:0];
      id v4 = self;
      uint64_t v5 = 0;
    }
    [(GKMultiplayerP2PViewController *)v4 setSharePlayEnabled:v5];
  }
  if (![(GKMultiplayerP2PViewController *)self datasourceConfigured])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__GKMultiplayerP2PViewController_configureWhenEnteringTheLobby__block_invoke;
    v6[3] = &unk_1E5F62EB0;
    v6[4] = self;
    [(GKMultiplayerP2PViewController *)self configureDataSourceWithCompletionHandler:v6];
  }
}

void __63__GKMultiplayerP2PViewController_configureWhenEnteringTheLobby__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_super v2 = [*(id *)(a1 + 32) existingRemoteReadyPlayers];
  uint64_t v3 = [v2 count];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 existingRemoteReadyPlayers];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__GKMultiplayerP2PViewController_configureWhenEnteringTheLobby__block_invoke_2;
    v6[3] = &unk_1E5F634E8;
    objc_copyWeak(&v7, &location);
    [v4 addExistingRemoteReadyPlayers:v5 withCompletionHandler:v6];

    objc_destroyWeak(&v7);
  }
  else
  {
    [v4 prepopulateSharePlayActiveParticipants];
  }
  objc_destroyWeak(&location);
}

void __63__GKMultiplayerP2PViewController_configureWhenEnteringTheLobby__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained prepopulateSharePlayActiveParticipants];
    id WeakRetained = v2;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKMultiplayerP2PViewController;
  [(GKMultiplayerViewController *)&v11 viewDidAppear:a3];
  id v4 = [MEMORY[0x1E4F637E8] shared];
  uint64_t v5 = [v4 multiplayerAllowedPlayerType];

  if (v5)
  {
    if ([MEMORY[0x1E4F637F0] _gkIsOnline])
    {
      objc_super v6 = [(GKMultiplayerViewController *)self originalMatchRequest];
      id v7 = [v6 validateForHosted:self->_hosted];

      if (v7) {
        [(GKMultiplayerP2PViewController *)self finishWithError:v7];
      }
      id v8 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
      id v9 = [v8 accountServicePrivate];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke;
      v10[3] = &unk_1E5F645B0;
      void v10[4] = self;
      [v9 isICloudAvailableWithHandler:v10];
    }
    else
    {
      [(GKMultiplayerP2PViewController *)self showNoInternetAlert];
    }
  }
  else
  {
    [(GKMultiplayerP2PViewController *)self showParentalControlsRestrictionAlert];
  }
}

void __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    objc_super v6 = [MEMORY[0x1E4F28C58] userErrorForCode:35 underlyingError:v5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_2;
    block[3] = &unk_1E5F63E80;
    block[4] = *(void *)(a1 + 32);
    id v10 = v6;
    id v11 = v5;
    id v7 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v8 = [MEMORY[0x1E4F63660] reporter];
    [v8 recordMultiplayerErrorID:@"iCloudUnavailable"];
  }
}

void __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  id v5 = GKGameCenterUIFrameworkBundle();
  objc_super v6 = GKGetLocalizedStringFromTableInBundle();
  id v7 = GKGameCenterUIFrameworkBundle();
  id v8 = GKGetLocalizedStringFromTableInBundle();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_3;
  v13[3] = &unk_1E5F63350;
  id v9 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_4;
  v11[3] = &unk_1E5F63350;
  v11[4] = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v10 = (id)[v2 _gkPresentConfirmationAlertWithTitle:v4 message:v6 buttonTitle:v8 block:v13 cancelAction:v11];
}

uint64_t __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

uint64_t __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerP2PViewController;
  [(GKMultiplayerViewController *)&v5 viewDidDisappear:a3];
  if ([(GKMultiplayerP2PViewController *)self isMovingFromParentViewController])
  {
    [(GKMultiplayerP2PViewController *)self configureWhenLeavingTheLobby];
    id v4 = [(GKMultiplayerP2PViewController *)self delegate];
    [v4 endGroupActivitiesForMultiplayerP2PViewController:self];
  }
}

- (void)configureWhenLeavingTheLobby
{
  [(GKMultiplayerP2PViewController *)self performActionsForButtonCancelCurrentMatching:1];
  [(GKMultiplayerP2PViewController *)self cancelAlertWithoutDelegateCallback];
  [(GKMultiplayerP2PViewController *)self cancelPendingInvites];
  id v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  [v3 clearDataSource];
  [(GKCollectionViewController *)self setDataSource:0];
  [(GKMultiplayerP2PViewController *)self setDatasourceConfigured:0];
  [(GKMultiplayerViewController *)self setDidStartForcedAutomatch:0];
  [(GKMultiplayerP2PViewController *)self setSharePlayEnabled:0];
}

- (void)cancel
{
  [(GKMultiplayerP2PViewController *)self cancelAlertWithoutDelegateCallback];
  [(GKMultiplayerP2PViewController *)self cancelPendingInvites];
  if (![(GKMultiplayerViewController *)self didAcceptGameInvite])
  {
    if ([(GKMultiplayerP2PViewController *)self sharePlayEnabled])
    {
      id v3 = [(GKMultiplayerP2PViewController *)self delegate];
      [v3 endGroupActivitiesForMultiplayerP2PViewController:self];
    }
    id v4 = [(GKMultiplayerP2PViewController *)self delegate];
    [v4 multiplayerP2PViewControllerWasCancelled:self];
  }
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  [(GKMultiplayerP2PViewController *)self cancelAlertWithoutDelegateCallback];
  id v5 = [(GKMultiplayerP2PViewController *)self delegate];
  [v5 multiplayerP2PViewController:self didFinishWithError:v4];
}

- (BOOL)shouldChangeModeFromOldMode:(int64_t)a3 toNewMode:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 2) < 2)
  {
    if (a4 == 1)
    {
      if (!*MEMORY[0x1E4F63860]) {
        id v6 = (id)GKOSLoggers();
      }
      id v7 = (void *)*MEMORY[0x1E4F63870];
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO);
      if (v8)
      {
        id v9 = NSNumber;
        id v10 = v7;
        id v11 = [v9 numberWithInteger:a3];
        id v12 = [NSNumber numberWithInteger:1];
        uint64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v23 = 138412802;
        v24 = v11;
        __int16 v25 = 2112;
        v26 = v12;
        __int16 v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_1AF250000, v10, OS_LOG_TYPE_INFO, "should not change mode from: %@, to: %@, call stack: %@", (uint8_t *)&v23, 0x20u);

LABEL_15:
        LOBYTE(v8) = 0;
        return v8;
      }
      return v8;
    }
LABEL_16:
    LOBYTE(v8) = 1;
    return v8;
  }
  if (a3 != 7) {
    goto LABEL_16;
  }
  if (!a4
    || (BOOL v14 = [(GKMultiplayerViewController *)self canStartWithMinimumPlayers],
        LOBYTE(v8) = 1,
        a4 == 1)
    && v14)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v15 = (id)GKOSLoggers();
    }
    uint64_t v16 = (void *)*MEMORY[0x1E4F63870];
    BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO);
    if (v8)
    {
      v17 = NSNumber;
      v18 = v16;
      id v19 = [v17 numberWithInteger:7];
      id v20 = [NSNumber numberWithInteger:a4];
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v23 = 138412802;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v20;
      __int16 v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_1AF250000, v18, OS_LOG_TYPE_INFO, "should not change mode from: %@, to: %@, call stack: %@", (uint8_t *)&v23, 0x20u);

      goto LABEL_15;
    }
  }
  return v8;
}

- (void)setMode:(int64_t)a3
{
  int64_t v3 = a3;
  if (((a3 == 0) & [(GKMultiplayerP2PViewController *)self sharePlayEnabled]) != 0) {
    int64_t v3 = 8;
  }
  int64_t mode = self->_mode;
  if (mode != v3
    && [(GKMultiplayerP2PViewController *)self shouldChangeModeFromOldMode:mode toNewMode:v3])
  {
    self->_int64_t mode = v3;
    [(GKMultiplayerP2PViewController *)self updateForNewMode];
  }
}

- (void)updateForNewMode
{
  switch([(GKMultiplayerP2PViewController *)self mode])
  {
    case 0:
      int v3 = 1;
      [(GKMultiplayerViewController *)self setAddButtonEnabled:1];
      id v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      [v4 setRemovingEnabled:1];

      id v5 = 0;
      goto LABEL_25;
    case 1:
      v18 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v19 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      id v20 = [v19 players];
      uint64_t v21 = [v20 count];
      v22 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v23 = [v22 maxPlayers];

      if (v21 == v23) {
        goto LABEL_20;
      }
      v36 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      v37 = [v36 items];
      uint64_t v38 = [v37 count];
      v39 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v40 = [v39 maxPlayers];

      if (v38 == v40 && ![(GKMultiplayerP2PViewController *)self havePendingPlayers])
      {
LABEL_20:
        v41 = GKGameCenterUIFrameworkBundle();
        uint64_t v42 = GKGetLocalizedStringFromTableInBundle();

        id v5 = (__CFString *)v42;
      }
      goto LABEL_21;
    case 2:
    case 5:
      v24 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      [(GKMultiplayerViewController *)self setAddButtonEnabled:0];
      __int16 v25 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      [v25 setRemovingEnabled:0];
      goto LABEL_23;
    case 3:
    case 4:
      id v6 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      [(GKMultiplayerViewController *)self setAddButtonEnabled:0];
      id v7 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      [v7 setRemovingEnabled:0];

      goto LABEL_12;
    case 6:
      [(GKMultiplayerP2PViewController *)self setUserCancelledMatching:1];
      v26 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      [(GKMultiplayerViewController *)self setAddButtonEnabled:0];
      __int16 v27 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      [v27 setRemovingEnabled:0];

      v28 = [(GKMultiplayerViewController *)self footerView];
      [v28 setInviteFriendsButtonEnabled:0];

      dispatch_time_t v29 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F63318] * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__GKMultiplayerP2PViewController_updateForNewMode__block_invoke;
      block[3] = &unk_1E5F62EB0;
      block[4] = self;
      dispatch_after(v29, MEMORY[0x1E4F14428], block);
LABEL_12:
      int v3 = 0;
      goto LABEL_25;
    case 7:
      [(GKMultiplayerViewController *)self canStartWithMinimumPlayers];
      BOOL v8 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v9 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      id v10 = [v9 items];
      uint64_t v11 = [v10 count];
      id v12 = [(GKMultiplayerViewController *)self matchRequest];
      if (v11 == [v12 maxPlayers])
      {
        uint64_t v13 = [(GKMultiplayerViewController *)self multiplayerDataSource];
        BOOL v14 = [v13 players];
        uint64_t v15 = [v14 count];
        uint64_t v16 = [(GKMultiplayerViewController *)self matchRequest];
        uint64_t v17 = [v16 maxPlayers];

        if (v15 == v17) {
          goto LABEL_21;
        }
        id v9 = GKGameCenterUIFrameworkBundle();
        GKGetLocalizedStringFromTableInBundle();
        id v10 = v5;
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
      }
LABEL_21:
      int v3 = 1;
      [(GKMultiplayerViewController *)self setAddButtonEnabled:1];
      v43 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      [v43 setRemovingEnabled:1];

LABEL_25:
      [(GKMultiplayerViewController *)self updateDataSourceInvitationEnabled];
      v44 = [(GKMultiplayerViewController *)self footerView];
      [v44 setFooterStatusString:v5];

      [(GKMultiplayerP2PViewController *)self updateStartGameButtonTitle];
      v45 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v46 = v3 & ([v45 hasFutureRecipientProperties] ^ 1);
      v47 = [(GKMultiplayerViewController *)self footerView];
      [v47 setStartGameButtonEnabled:v46];

      v48 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      [v48 didChangeMode];

      if ([(GKMultiplayerP2PViewController *)self datasourceConfigured])
      {
        v49 = [(GKCollectionViewController *)self collectionView];
        v50 = [(GKCollectionViewController *)self collectionView];
        v51 = [v50 indexPathsForVisibleItems];
        [v49 reloadItemsAtIndexPaths:v51];
      }
      return;
    case 8:
      v30 = [(GKMultiplayerP2PViewController *)self activeRemoteParticipants];
      unint64_t v31 = [v30 count];
      v32 = [(GKMultiplayerViewController *)self matchRequest];
      unint64_t v33 = [v32 maxPlayers];

      if (v31 >= v33) {
        goto LABEL_22;
      }
      v34 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      uint64_t v35 = [v34 automatchPlayerCount];

      if (v35 >= 1) {
        goto LABEL_22;
      }
      id v5 = &stru_1F07B2408;
      goto LABEL_24;
    case 9:
LABEL_22:
      __int16 v25 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    default:
      id v5 = 0;
LABEL_24:
      int v3 = 1;
      goto LABEL_25;
  }
}

uint64_t __50__GKMultiplayerP2PViewController_updateForNewMode__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserCancelledMatching:0];
  uint64_t result = [*(id *)(a1 + 32) mode];
  if (result == 6)
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 setMode:7];
  }
  return result;
}

- (BOOL)isInSetupMode
{
  return [(GKMultiplayerP2PViewController *)self mode] == 0;
}

- (void)updateFooterButtonStates
{
  v12.receiver = self;
  v12.super_class = (Class)GKMultiplayerP2PViewController;
  [(GKMultiplayerViewController *)&v12 updateFooterButtonStates];
  int64_t mode = self->_mode;
  if (mode == 2)
  {
    id v4 = [(GKMultiplayerViewController *)self footerView];
    [v4 setInviteFriendsButtonEnabled:0];

    int64_t mode = self->_mode;
  }
  if ((mode & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    id v5 = [(GKMultiplayerViewController *)self matchRequest];
    uint64_t v6 = [v5 hasFutureRecipientProperties] ^ 1;
    id v7 = [(GKMultiplayerViewController *)self footerView];
    [v7 setStartGameButtonEnabled:v6];

    if ([(GKMultiplayerP2PViewController *)self mode] == 9
      && ![(GKMultiplayerP2PViewController *)self havePendingPlayers]
      && ![(GKMultiplayerP2PViewController *)self haveInvitedPlayers])
    {
      BOOL v8 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      id v9 = [v8 readyPlayers];
      uint64_t v10 = [v9 count];

      if (v10) {
        uint64_t v11 = 7;
      }
      else {
        uint64_t v11 = 8;
      }
      [(GKMultiplayerP2PViewController *)self setMode:v11];
    }
  }
}

- (int64_t)automatchParticipantStatus
{
  int64_t v3 = [(GKMultiplayerP2PViewController *)self mode] - 1;
  int64_t result = 9;
  switch(v3)
  {
    case 0:
      int64_t result = 13;
      break;
    case 1:
    case 2:
    case 3:
      return result;
    case 5:
      int64_t result = 14;
      break;
    case 6:
      if ([(GKMultiplayerP2PViewController *)self sharePlayEnabled]) {
        int64_t result = 20;
      }
      else {
        int64_t result = 13;
      }
      break;
    case 7:
    case 8:
      int64_t result = 20;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (BOOL)isCanceling
{
  return [(GKMultiplayerP2PViewController *)self mode] == 6;
}

- (void)updateStartGameButtonTitle
{
  switch([(GKMultiplayerP2PViewController *)self mode])
  {
    case 0:
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      int64_t v3 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        id v4 = [(GKMultiplayerViewController *)self footerView];
        [v4 setPrimaryButtonTitle:v5];
      }
      break;
    default:
      return;
  }
}

- (BOOL)haveInvitedPlayers
{
  id v2 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  int64_t v3 = [v2 playersInvited];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)havePendingPlayers
{
  id v2 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  char v3 = [v2 havePendingPlayers];

  return v3;
}

- (void)addExistingRemoteReadyPlayers:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    BOOL v8 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__GKMultiplayerP2PViewController_addExistingRemoteReadyPlayers_withCompletionHandler___block_invoke;
    v9[3] = &unk_1E5F646C0;
    objc_copyWeak(&v11, &location);
    uint64_t v10 = v7;
    [v8 addPlayers:v6 withStatus:7 complete:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(GKMultiplayerP2PViewController *)self incrementOneAutoMatchPlayerCountIfPossible];
    v7[2](v7);
  }
}

void __86__GKMultiplayerP2PViewController_addExistingRemoteReadyPlayers_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateMode];
  id v3 = objc_loadWeakRetained(v2);
  [v3 incrementOneAutoMatchPlayerCountIfPossible];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setExistingPlayers:(id)a3
{
  id v4 = a3;
  id v5 = (id)[(GKMultiplayerP2PViewController *)self view];
  id v6 = [MEMORY[0x1E4F63760] localPlayer];
  id v7 = [v6 internal];
  BOOL v8 = [v7 playerID];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__GKMultiplayerP2PViewController_setExistingPlayers___block_invoke;
  v11[3] = &unk_1E5F646E8;
  id v9 = v8;
  id v12 = v9;
  uint64_t v10 = [v4 _gkFilterWithBlock:v11];

  if ([v10 count])
  {
    objc_storeStrong((id *)&self->_existingRemoteReadyPlayers, v10);
    [(GKMultiplayerP2PViewController *)self addExistingRemoteReadyPlayers:v10 withCompletionHandler:&__block_literal_global_19];
  }
}

id __53__GKMultiplayerP2PViewController_setExistingPlayers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 playerID];
  LOBYTE(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (a1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F63788] canonicalizedPlayerForInternal:v3];
  }

  return v5;
}

- (void)incrementOneAutoMatchPlayerCountIfPossible
{
  id v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v4 = [v3 players];
  uint64_t v5 = [v4 count];

  id v6 = [(GKMultiplayerViewController *)self matchRequest];
  BOOL v7 = v5 + 1 <= (unint64_t)[v6 maxPlayers];

  id v8 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  [v8 setAutomatchPlayerCount:v7 complete:0];
}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  objc_initWeak(&location, self);
  uint64_t v5 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__GKMultiplayerP2PViewController_setAutomatchPlayerCount___block_invoke;
  v6[3] = &unk_1E5F64710;
  void v6[4] = self;
  objc_copyWeak(&v7, &location);
  [v5 setAutomatchPlayerCount:a3 complete:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__GKMultiplayerP2PViewController_setAutomatchPlayerCount___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mode] == 2 && (objc_msgSend(*(id *)(a1 + 32), "havePendingPlayers") & 1) == 0)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v2 = (id)GKOSLoggers();
    }
    id v3 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1AF250000, v3, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeMatching mode, and need no pending players. Start game!", v5, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained startGame];
  }
}

- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v12 = (id)GKOSLoggers();
  }
  uint64_t v13 = (os_log_t *)MEMORY[0x1E4F63870];
  BOOL v14 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    uint64_t v16 = [v8 debugDescription];
    *(_DWORD *)buf = 138412546;
    unint64_t v33 = v16;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl(&dword_1AF250000, v15, OS_LOG_TYPE_INFO, "Player joining from Shareplay = %@, pushToken: %@", buf, 0x16u);
  }
  uint64_t v17 = [MEMORY[0x1E4F63788] canonicalizedPlayerForInternal:v8];
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F636D8];
    id v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 629, "-[GKMultiplayerP2PViewController groupActivityJoiningPlayer:devicePushToken:participantServerIdentifier:]");
    id v20 = [v18 dispatchGroupWithName:v19];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke;
    v29[3] = &unk_1E5F63008;
    v29[4] = self;
    id v21 = v17;
    id v30 = v21;
    id v31 = v10;
    [v20 perform:v29];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke_3;
    v26[3] = &unk_1E5F63E80;
    v26[4] = self;
    id v27 = v21;
    id v28 = v9;
    [v20 notifyOnMainQueueWithBlock:v26];
  }
  else
  {
    if (!*v11) {
      id v22 = (id)GKOSLoggers();
    }
    os_log_t v23 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      __int16 v25 = [v8 debugDescription];
      *(_DWORD *)buf = 138412290;
      unint64_t v33 = v25;
      _os_log_impl(&dword_1AF250000, v24, OS_LOG_TYPE_INFO, "No responding player found for player: %@", buf, 0xCu);
    }
  }
}

void __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) multiplayerDataSource];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke_2;
  v8[3] = &unk_1E5F639B0;
  id v9 = v3;
  id v7 = v3;
  [v4 replacePrepopulatedPlayerWithNormalPlayer:v6 participantServerIdentifier:v5 completionHandler:v8];
}

uint64_t __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) sendInvitesToSharePlayPlayer:*(void *)(a1 + 40) devicePushToken:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateStartGameButtonTitle];
}

- (void)sendInvitesToSharePlayPlayer:(id)a3 devicePushToken:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMultiplayerViewController *)self matchRequest];
  v11[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  [v8 setRecipients:v9];
  id v10 = [(GKMultiplayerP2PViewController *)self delegate];
  [v10 multiplayerP2PViewController:self startMatchingWithRequest:v8 devicePushToken:v6];

  [(GKMultiplayerP2PViewController *)self sendStatusUpdate];
  if (![(GKMultiplayerP2PViewController *)self mode]) {
    [(GKMultiplayerP2PViewController *)self setMode:1];
  }
}

+ (void)addContactCheckTaskForMessageID:(id)a3 respondingPlayer:(id)a4 dataSource:(id)a5 toGroup:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    if (v10)
    {
      uint64_t v13 = [v11 players];
      char v14 = [v13 containsObject:v10];

      if ((v14 & 1) == 0)
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v15 = [v11 players];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v34;
          id v27 = v11;
          id v28 = v10;
          v26 = v12;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v21 = objc_msgSend(v20, "contact", v26);
              if (v21)
              {
                id v22 = (void *)v21;
                os_log_t v23 = [v20 internal];
                v24 = [v23 messagesID];
                int v25 = [v24 isEqualToString:v9];

                if (v25)
                {
                  v29[0] = MEMORY[0x1E4F143A8];
                  v29[1] = 3221225472;
                  v29[2] = __102__GKMultiplayerP2PViewController_addContactCheckTaskForMessageID_respondingPlayer_dataSource_toGroup___block_invoke;
                  v29[3] = &unk_1E5F63008;
                  id v11 = v27;
                  id v30 = v27;
                  id v31 = v20;
                  id v10 = v28;
                  id v32 = v28;
                  id v12 = v26;
                  [v26 perform:v29];

                  goto LABEL_15;
                }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
            id v11 = v27;
            id v10 = v28;
            id v12 = v26;
            if (v17) {
              continue;
            }
            break;
          }
        }
LABEL_15:
      }
    }
  }
}

void __102__GKMultiplayerP2PViewController_addContactCheckTaskForMessageID_respondingPlayer_dataSource_toGroup___block_invoke(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)a1[4];
  v11[0] = a1[5];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v10 = a1[6];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__GKMultiplayerP2PViewController_addContactCheckTaskForMessageID_respondingPlayer_dataSource_toGroup___block_invoke_2;
  v8[3] = &unk_1E5F639B0;
  id v9 = v3;
  id v7 = v3;
  [v4 replacePlayers:v5 withGKPlayers:v6 completionHandler:v8];
}

uint64_t __102__GKMultiplayerP2PViewController_addContactCheckTaskForMessageID_respondingPlayer_dataSource_toGroup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPlayer:(id)a3 responded:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = (os_log_t *)MEMORY[0x1E4F63870];
  uint64_t v10 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = [v6 debugDescription];
    *(_DWORD *)buf = 138412290;
    id v31 = v12;
    _os_log_impl(&dword_1AF250000, v11, OS_LOG_TYPE_INFO, "Player responded = %@", buf, 0xCu);
  }
  uint64_t v13 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  char v14 = [MEMORY[0x1E4F63788] canonicalizedPlayerForInternal:v6];
  if (v14)
  {
    if (!a4
      && [(GKMultiplayerP2PViewController *)self needRecipientPropertiesForPlayer:v6])
    {
      uint64_t v15 = [(UIViewController *)self _gkExtensionViewController];
      [v15 requestRecipientProperties:v6];
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F636D8];
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 704, "-[GKMultiplayerP2PViewController setPlayer:responded:]");
    uint64_t v18 = [v16 dispatchGroupWithName:v17];

    id v19 = objc_opt_class();
    id v20 = [v6 messagesID];
    [v19 addContactCheckTaskForMessageID:v20 respondingPlayer:v14 dataSource:v13 toGroup:v18];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke;
    v25[3] = &unk_1E5F64760;
    id v26 = v13;
    id v28 = self;
    int64_t v29 = a4;
    id v27 = v14;
    [v18 notifyOnMainQueueWithBlock:v25];
  }
  else
  {
    if (!*v7) {
      id v21 = (id)GKOSLoggers();
    }
    os_log_t v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      os_log_t v23 = v22;
      v24 = [v6 debugDescription];
      *(_DWORD *)buf = 138412290;
      id v31 = v24;
      _os_log_impl(&dword_1AF250000, v23, OS_LOG_TYPE_INFO, "No responding player found for player: %@", buf, 0xCu);
    }
  }
}

void __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F636D8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 713, "-[GKMultiplayerP2PViewController setPlayer:responded:]_block_invoke");
  id v4 = [v2 dispatchGroupWithName:v3];

  uint64_t v5 = [*(id *)(a1 + 32) statusForPlayer:*(void *)(a1 + 40)];
  if (v5 == 1)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if ((unint64_t)(v9 - 2) >= 4)
    {
      if (!v9)
      {
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSince1970];
        objc_msgSend(*(id *)(a1 + 48), "setInviteeConnectionTimeStamp:");

        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_4;
        v18[3] = &unk_1E5F62F28;
        id v19 = *(id *)(a1 + 32);
        id v20 = *(id *)(a1 + 40);
        [v4 perform:v18];

        id v8 = v19;
        goto LABEL_11;
      }
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F637F8] reporter];
      [v10 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63298]];

      uint64_t v11 = 4;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_6;
    v14[3] = &unk_1E5F64738;
    id v15 = *(id *)(a1 + 32);
    uint64_t v17 = v11;
    id v16 = *(id *)(a1 + 40);
    [v4 perform:v14];
    [*(id *)(a1 + 48) updateMode];

    id v8 = v15;
    goto LABEL_11;
  }
  if (!v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) firstInvitedContactPlayer];
    if (v6)
    {
      id v7 = (void *)v6;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_2;
      v21[3] = &unk_1E5F63008;
      id v22 = *(id *)(a1 + 32);
      id v23 = v7;
      id v24 = *(id *)(a1 + 40);
      id v8 = v7;
      [v4 perform:v21];

LABEL_11:
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_8;
      v13[3] = &unk_1E5F62EB0;
      v13[4] = *(void *)(a1 + 48);
      [v4 notifyOnMainQueueWithBlock:v13];
    }
  }
}

void __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_2(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)a1[4];
  v11[0] = a1[5];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v10 = a1[6];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_3;
  v8[3] = &unk_1E5F639B0;
  id v9 = v3;
  id v7 = v3;
  [v4 replacePlayers:v5 withGKPlayers:v6 completionHandler:v8];
}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_4(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = *(void *)(a1 + 40);
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_5;
  v7[3] = &unk_1E5F639B0;
  id v8 = v3;
  id v6 = v3;
  [v4 setStatus:12 forPlayers:v5 complete:v7];
}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_6(void *a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[6];
  uint64_t v5 = (void *)a1[4];
  v10[0] = a1[5];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_7;
  v8[3] = &unk_1E5F639B0;
  id v9 = v3;
  id v7 = v3;
  [v5 setStatus:v4 forPlayers:v6 complete:v8];
}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendStatusUpdate];
}

- (void)setConnectingStateForPlayer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [v4 debugDescription];
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "Player: %@ is connecting", buf, 0xCu);
  }
  id v9 = [MEMORY[0x1E4F63788] canonicalizedPlayerForInternal:v4];
  uint64_t v10 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  uint64_t v11 = (void *)MEMORY[0x1E4F636D8];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 778, "-[GKMultiplayerP2PViewController setConnectingStateForPlayer:]");
  uint64_t v13 = [v11 dispatchGroupWithName:v12];

  char v14 = [v10 currentPlayers];
  int v15 = [v14 containsObject:v9];

  if (v15)
  {
    id v16 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    uint64_t v17 = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke;
  }
  else
  {
    id v16 = v21;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    uint64_t v17 = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_3;
  }
  v16[2] = v17;
  v16[3] = &unk_1E5F62F28;
  id v18 = v10;
  v16[4] = v18;
  id v19 = v9;
  v16[5] = v19;
  [v13 perform:v16];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_5;
  v20[3] = &unk_1E5F62EB0;
  v20[4] = self;
  [v13 notifyOnMainQueueWithBlock:v20];
}

void __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_2;
  v7[3] = &unk_1E5F639B0;
  id v8 = v3;
  id v6 = v3;
  [v4 setStatus:6 forPlayers:v5 complete:v7];
}

uint64_t __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_3(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_4;
  v7[3] = &unk_1E5F639B0;
  id v8 = v3;
  id v6 = v3;
  [v4 addPlayers:v5 withStatus:6 replaceAutomatches:1 complete:v7];
}

uint64_t __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendStatusUpdate];
}

- (void)setPlayer:(id)a3 connected:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    uint64_t v10 = [v6 debugDescription];
    uint64_t v11 = (void *)v10;
    id v12 = @"is not";
    if (v4) {
      id v12 = @"is";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "Player: %@ %@ connected", buf, 0x16u);
  }
  uint64_t v13 = [MEMORY[0x1E4F63788] canonicalizedPlayerForInternal:v6];
  char v14 = (void *)MEMORY[0x1E4F636D8];
  int v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 805, "-[GKMultiplayerP2PViewController setPlayer:connected:]");
  id v16 = [v14 dispatchGroupWithName:v15];

  if ([(GKMultiplayerP2PViewController *)self isHosted])
  {
    uint64_t v17 = objc_opt_class();
    id v18 = [v6 messagesID];
    id v19 = [MEMORY[0x1E4F63788] canonicalizedPlayerForInternal:v6];
    id v20 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    [v17 addContactCheckTaskForMessageID:v18 respondingPlayer:v19 dataSource:v20 toGroup:v16];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__GKMultiplayerP2PViewController_setPlayer_connected___block_invoke;
  v22[3] = &unk_1E5F64788;
  BOOL v24 = v4;
  v22[4] = self;
  id v23 = v13;
  id v21 = v13;
  [v16 notifyOnMainQueueWithBlock:v22];
}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_connected___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 playerConnected:v4];
  }
  else {
    return [v3 playerDisconnected:v4];
  }
}

- (void)setPlayer:(id)a3 sentData:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 length];
  if ((v8 & 0xFFFFFFFC) != 0)
  {
    int v9 = v8;
    uint64_t v10 = [MEMORY[0x1E4F63788] canonicalizedPlayerForInternal:v6];
    if (v10)
    {
      acceptedInvite = self->_acceptedInvite;
      if (acceptedInvite)
      {
        id v12 = [(GKInvite *)acceptedInvite sender];
        int v13 = [v10 isEqual:v12];
      }
      else
      {
        int v13 = 0;
      }
      char v14 = (unsigned int *)[v7 bytes];
      int v15 = v14 + 1;
      unint64_t v16 = *v14;
      if (!*MEMORY[0x1E4F63860]) {
        id v17 = (id)GKOSLoggers();
      }
      unsigned int v30 = v9 - 4;
      id v18 = (os_log_t *)MEMORY[0x1E4F63870];
      id v19 = (id)*MEMORY[0x1E4F63870];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v29 = v13;
        unint64_t v20 = [&unk_1F08126B8 count];
        if (v20 <= v16)
        {
          id v21 = @"unknown";
        }
        else
        {
          id v21 = [&unk_1F08126B8 objectAtIndex:v16];
        }
        id v22 = [v6 conciseDescription];
        *(_DWORD *)buf = 67109890;
        int v33 = v16;
        __int16 v34 = 2112;
        long long v35 = v21;
        __int16 v36 = 1024;
        unsigned int v37 = v30;
        __int16 v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_1AF250000, v19, OS_LOG_TYPE_INFO, "header = %d (%@) length = %d from playerID: %@", buf, 0x22u);
        if (v20 > v16) {

        }
        int v13 = v29;
        id v18 = (os_log_t *)MEMORY[0x1E4F63870];
      }

      switch((int)v16)
      {
        case 0:
        case 2:
        case 3:
        case 6:
          break;
        case 1:
          [(GKMultiplayerP2PViewController *)self processStatusUpdateMessageFromPlayer:v10 bytes:v15 withLength:v30];
          break;
        case 4:
          if (v13)
          {
            if (!*MEMORY[0x1E4F63860]) {
              id v25 = (id)GKOSLoggers();
            }
            uint64_t v26 = *v18;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AF250000, v26, OS_LOG_TYPE_INFO, "Invitee got start game message", buf, 2u);
            }
            [(GKMultiplayerP2PViewController *)self playNow];
          }
          break;
        case 5:
          if ([(GKMultiplayerP2PViewController *)self mode] != 5
            && [(GKMultiplayerP2PViewController *)self mode])
          {
            __int16 v27 = [(GKMultiplayerViewController *)self multiplayerDataSource];
            id v31 = v10;
            id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
            [v27 setStatus:3 forPlayers:v28 complete:0];
          }
          if (v13) {
            [(GKMultiplayerP2PViewController *)self showInviterDisconnectedAlert];
          }
          break;
        default:
          if (!*MEMORY[0x1E4F63860]) {
            id v23 = (id)GKOSLoggers();
          }
          BOOL v24 = *v18;
          if (os_log_type_enabled(*v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AF250000, v24, OS_LOG_TYPE_INFO, "unknown header", buf, 2u);
          }
          break;
      }
    }
  }
}

- (void)setInvitesFailedWithError:(id)a3
{
  id v7 = a3;
  if ([v7 code] != 2)
  {
    uint64_t v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v5 = [v7 userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"FailedPlayers"];
    [v4 failedToInvitePlayers:v6];
  }
  if (![(GKMultiplayerP2PViewController *)self userCancelledMatching]) {
    [(GKMultiplayerP2PViewController *)self setMode:0];
  }
}

- (void)setAutomatchFailedWithError:(id)a3
{
  if ([a3 code] == 2)
  {
    if (![(GKMultiplayerP2PViewController *)self userCancelledMatching]) {
      [(GKMultiplayerP2PViewController *)self setMode:0];
    }
  }
  else
  {
    [(GKMultiplayerP2PViewController *)self showAutomatchingErrorAlert];
  }

  [(GKMultiplayerViewController *)self setDidStartForcedAutomatch:0];
}

- (void)applicationWillEnterForeground
{
  if (![(GKMultiplayerP2PViewController *)self isHosted])
  {
    id v3 = [(GKMultiplayerP2PViewController *)self navigationController];
    uint64_t v4 = [v3 topViewController];

    if (v4 != self)
    {
      id v5 = [(GKMultiplayerP2PViewController *)self navigationController];
      id v9 = [v5 viewControllers];

      unint64_t v6 = [v9 indexOfObject:self] + 1;
      if (v6 >= [v9 count])
      {
        id v7 = 0;
      }
      else
      {
        id v7 = [v9 objectAtIndex:v6];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v8 = [MEMORY[0x1E4F637E8] shared];
        objc_msgSend(v7, "setSupportsNearby:", objc_msgSend(v8, "shouldAllowNearbyMultiplayer"));
      }
    }
  }
}

- (void)presentSharePlaySharingController
{
  id v3 = [(GKMultiplayerP2PViewController *)self delegate];
  [v3 multiplayerP2PViewControllerPresentSharePlaySharingController:self];
}

- (BOOL)needRecipientPropertiesForPlayer:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GKMultiplayerViewController *)self matchRequest];
  unint64_t v6 = [v5 queueName];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    int v8 = [(GKMultiplayerViewController *)self matchRequest];
    v11[0] = v4;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v8 expectFutureRecipientPropertiesForPlayers:v9];

    [(GKMultiplayerP2PViewController *)self updateFooterButtonStates];
  }

  return v7 != 0;
}

- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(GKMultiplayerViewController *)self matchRequest];
  [v8 updateRecipientProperties:v7 forPlayer:v6];

  [(GKMultiplayerP2PViewController *)self updateFooterButtonStates];
}

- (BOOL)canStartForcedAutomatch
{
  if ([(GKMultiplayerP2PViewController *)self mode]) {
    return 0;
  }
  else {
    return ![(GKMultiplayerViewController *)self didStartForcedAutomatch];
  }
}

- (void)playNow
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = [(GKMultiplayerViewController *)self matchRequest];

  if (v3)
  {
    if (![(GKMultiplayerP2PViewController *)self haveInvitedPlayers]
      || [(GKMultiplayerP2PViewController *)self mode] == 7)
    {
      id v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      if ([v4 automatchPlayerCount] <= 0)
      {
        id v5 = [v4 guestPlayers];
        uint64_t v6 = [v5 count];

        if (!v6)
        {
          [(GKMultiplayerP2PViewController *)self startGame];
LABEL_35:

          return;
        }
      }
      id v7 = [(GKMultiplayerViewController *)self matchRequest];
      int v8 = (void *)[v7 copy];

      uint64_t v9 = [v4 playerRange];
      uint64_t v11 = v10;
      [v8 setMinPlayers:v9];
      [v8 setMaxPlayers:v9 + v11];
      [v8 setDefaultNumberOfPlayers:0];
      id v12 = [v4 currentPlayers];
      int v13 = [v12 _gkGuestPlayersFromPlayers];
      [v8 setRecipients:v13];

      uint64_t v14 = [(GKMultiplayerP2PViewController *)self delegate];
      [(id)v14 multiplayerP2PViewController:self startMatchingWithRequest:v8];

      LOBYTE(v14) = [v4 havePendingPlayers];
      int v15 = [(GKMultiplayerViewController *)self matchRequest];
      uint64_t v16 = [v15 hasFutureRecipientProperties];

      if (v14)
      {
        char v17 = ![(GKMultiplayerViewController *)self canStartWithMinimumPlayers] | v16;
        [(GKMultiplayerP2PViewController *)self setMode:2];
        if (v17)
        {
          if (!*MEMORY[0x1E4F63860]) {
            id v18 = (id)GKOSLoggers();
          }
          id v19 = (void *)*MEMORY[0x1E4F63870];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
          {
            unint64_t v20 = NSNumber;
            log = v19;
            id v21 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v4, "automatchPlayerCount"));
            id v22 = NSNumber;
            id v23 = [v4 readyPlayers];
            BOOL v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
            id v25 = NSNumber;
            uint64_t v26 = [(GKMultiplayerViewController *)self matchRequest];
            __int16 v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "minPlayers"));
            id v28 = [NSNumber numberWithBool:v16];
            *(_DWORD *)buf = 138413058;
            v62 = v21;
            __int16 v63 = 2112;
            v64 = v24;
            __int16 v65 = 2112;
            v66 = v27;
            __int16 v67 = 2112;
            v68 = v28;
            _os_log_impl(&dword_1AF250000, log, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeMatching mode. automatchPlayerCount: %@, fast start: disabled, readyPlayersCount: %@, minPlayers required: %@, hasFutureRecipientProperties: %@. Start matching.", buf, 0x2Au);
          }
LABEL_27:
          [(GKMultiplayerP2PViewController *)self sendStatusUpdate];
LABEL_34:

          goto LABEL_35;
        }
        id v31 = [v4 readyPlayers];
        unint64_t v32 = [v31 count];
        int v33 = [(GKMultiplayerViewController *)self matchRequest];
        unint64_t v34 = [v33 minPlayers];

        uint64_t v35 = *MEMORY[0x1E4F63860];
        if (v32 < v34)
        {
          if (!v35) {
            id v36 = (id)GKOSLoggers();
          }
          unsigned int v37 = (void *)*MEMORY[0x1E4F63870];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
          {
            __int16 v38 = NSNumber;
            v39 = v37;
            uint64_t v40 = objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v4, "automatchPlayerCount"));
            v41 = NSNumber;
            uint64_t v42 = [v4 readyPlayers];
            v43 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
            v44 = NSNumber;
            v45 = [(GKMultiplayerViewController *)self matchRequest];
            uint64_t v46 = objc_msgSend(v44, "numberWithUnsignedInteger:", objc_msgSend(v45, "minPlayers"));
            v47 = [NSNumber numberWithBool:0];
            *(_DWORD *)buf = 138413058;
            v62 = v40;
            __int16 v63 = 2112;
            v64 = v43;
            __int16 v65 = 2112;
            v66 = v46;
            __int16 v67 = 2112;
            v68 = v47;
            _os_log_impl(&dword_1AF250000, v39, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeMatching mode, automatchPlayerCount: %@, fast start: enabled, readyPlayersCount: %@, minPlayers required: %@, hasFutureRecipientProperties: %@. Start matching.", buf, 0x2Au);
          }
          goto LABEL_27;
        }
        if (!v35) {
          id v48 = (id)GKOSLoggers();
        }
        v49 = (void *)*MEMORY[0x1E4F63870];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
        {
          v50 = NSNumber;
          v51 = v49;
          v52 = objc_msgSend(v50, "numberWithInteger:", objc_msgSend(v4, "automatchPlayerCount"));
          v53 = NSNumber;
          v54 = [v4 readyPlayers];
          v55 = objc_msgSend(v53, "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
          v56 = NSNumber;
          v57 = [(GKMultiplayerViewController *)self matchRequest];
          v58 = objc_msgSend(v56, "numberWithUnsignedInteger:", objc_msgSend(v57, "minPlayers"));
          v59 = [NSNumber numberWithBool:0];
          *(_DWORD *)buf = 138413058;
          v62 = v52;
          __int16 v63 = 2112;
          v64 = v55;
          __int16 v65 = 2112;
          v66 = v58;
          __int16 v67 = 2112;
          v68 = v59;
          _os_log_impl(&dword_1AF250000, v51, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeMatching mode, automatchPlayerCount: %@, fast start: enabled, readyPlayersCount: %@, minPlayers required: %@, hasFutureRecipientProperties: %@. Start game while matching is in the background.", buf, 0x2Au);
        }
      }
      else
      {
        [(GKMultiplayerP2PViewController *)self setMode:3];
        if (!*MEMORY[0x1E4F63860]) {
          id v29 = (id)GKOSLoggers();
        }
        unsigned int v30 = *MEMORY[0x1E4F63870];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF250000, v30, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeStartingGame mode, which is an all guest game. Start game!", buf, 2u);
        }
      }
      [(GKMultiplayerP2PViewController *)self startGame];
      goto LABEL_34;
    }
    [(GKMultiplayerP2PViewController *)self setMode:1];
  }
  else
  {
    [(GKMultiplayerP2PViewController *)self startGame];
  }
}

- (void)startGameButtonPressed
{
  id v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  [v3 recordButtonClickAction:@"play" targetId:@"startGame"];

  switch([(GKMultiplayerP2PViewController *)self mode])
  {
    case 0:
    case 7:
      [(GKMultiplayerViewController *)self performActionsForButtonStartGame];
      id v14 = [MEMORY[0x1E4F637F8] reporter];
      uint64_t v4 = *MEMORY[0x1E4F63530];
      uint64_t v5 = *MEMORY[0x1E4F632A8];
      uint64_t v6 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      id v7 = [v6 currentRemotePlayers];
      objc_msgSend(v14, "reportEvent:type:count:", v4, v5, objc_msgSend(v7, "count"));

      goto LABEL_9;
    case 1:
    case 2:
      [(GKMultiplayerP2PViewController *)self performActionsForButtonCancelCurrentMatching:0];
      break;
    case 5:
      int v8 = [(GKMultiplayerP2PViewController *)self acceptedInvite];

      if (!v8)
      {
        [(GKMultiplayerP2PViewController *)self resetInviteesStatus];
        [(GKMultiplayerP2PViewController *)self setMode:0];
      }
      break;
    case 8:
      uint64_t v9 = [(GKMultiplayerP2PViewController *)self delegate];
      [v9 activateGroupActivitiesForMultiplayerP2PViewController:self];

      uint64_t v10 = [MEMORY[0x1E4F63660] reporter];
      uint64_t v11 = [(GKMultiplayerP2PViewController *)self pageId];
      [v10 recordClickWithAction:@"navigate" targetId:@"startGame" targetType:@"button" pageId:v11 pageType:@"multiplayer"];

      [(GKMultiplayerP2PViewController *)self setMode:9];
      id v14 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      uint64_t v6 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      id v12 = [v6 shareplayPrepopulatedPlayers];
      [v14 setStatus:21 forPlayers:v12 complete:0];

LABEL_9:

      break;
    case 9:
      [(GKMultiplayerP2PViewController *)self performActionsForButtonCancelCurrentMatching:1];
      [(GKMultiplayerP2PViewController *)self configureWhenLeavingTheLobby];
      int v13 = [(GKMultiplayerP2PViewController *)self delegate];
      [v13 endGroupActivitiesForMultiplayerP2PViewController:self];

      if ([(GKMultiplayerP2PViewController *)self startStagedActivity]) {
        [(GKMultiplayerP2PViewController *)self setStartStagedActivity:0];
      }
      [(GKMultiplayerP2PViewController *)self configureWhenEnteringTheLobby];
      break;
    default:
      return;
  }
}

- (void)inviteFriendsButtonPressed
{
  id v3 = [MEMORY[0x1E4F63660] reporter];
  uint64_t v4 = [(GKMultiplayerP2PViewController *)self pageId];
  [v3 recordClickWithAction:@"navigate" targetId:@"inviteFriends" targetType:@"button" pageId:v4 pageType:@"multiplayer"];

  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerP2PViewController;
  [(GKMultiplayerViewController *)&v5 inviteFriendsButtonPressed];
}

- (void)displayCancelConfirmationDialog
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v4 = GKGameCenterUIFrameworkBundle();
  objc_super v5 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v6 = GKGameCenterUIFrameworkBundle();
  id v7 = GKGetLocalizedStringFromTableInBundle();
  int v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = GKGameCenterUIFrameworkBundle();
  uint64_t v11 = GKGetLocalizedStringFromTableInBundle();
  id v12 = [v9 actionWithTitle:v11 style:1 handler:0];

  int v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = GKGameCenterUIFrameworkBundle();
  int v15 = GKGetLocalizedStringFromTableInBundle();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__GKMultiplayerP2PViewController_displayCancelConfirmationDialog__block_invoke;
  v17[3] = &unk_1E5F63170;
  v17[4] = self;
  uint64_t v16 = [v13 actionWithTitle:v15 style:0 handler:v17];

  [v8 addAction:v12];
  [v8 addAction:v16];
  [v8 setPreferredAction:v16];
  [(GKMultiplayerP2PViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __65__GKMultiplayerP2PViewController_displayCancelConfirmationDialog__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performActionsForButtonCancelCurrentMatching:0];
}

- (void)startGame
{
  BOOL v3 = [(GKMultiplayerViewController *)self canStartWithMinimumPlayers];
  uint64_t v4 = (uint64_t *)MEMORY[0x1E4F63530];
  if (v3)
  {
    objc_super v5 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v6 = *v4;
    [v5 reportEvent:*v4 type:*MEMORY[0x1E4F63270]];

    id v7 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    int v8 = [v7 readyPlayers];
    unint64_t v9 = [v8 count];
    uint64_t v10 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    uint64_t v11 = [v10 participants];
    unint64_t v12 = [v11 count];

    int v13 = [MEMORY[0x1E4F637F8] reporter];
    id v14 = v13;
    int v15 = (void *)MEMORY[0x1E4F63260];
    if (v9 >= v12) {
      int v15 = (void *)MEMORY[0x1E4F63258];
    }
    [v13 reportEvent:v6 type:*v15];
  }
  [(GKMultiplayerP2PViewController *)self inviteeConnectionTimeStamp];
  if (v16 > 0.0)
  {
    char v17 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v18 = *v4;
    uint64_t v19 = *MEMORY[0x1E4F632A0];
    unint64_t v20 = (void *)MEMORY[0x1E4F1C9C8];
    [(GKMultiplayerP2PViewController *)self inviteeConnectionTimeStamp];
    id v21 = objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
    [v17 reportEvent:v18 type:v19 startTime:v21];
  }
  [(GKMultiplayerP2PViewController *)self setMode:3];

  [(GKMultiplayerP2PViewController *)self finishWithError:0];
}

- (void)willPresentPlayerPicker:(id)a3
{
  id v4 = a3;
  if ([(GKMultiplayerP2PViewController *)self isHosted])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F637E8] shared];
    uint64_t v5 = [v6 shouldAllowNearbyMultiplayer];
  }
  [v4 setSupportsNearby:v5];
  id v7 = [(GKMultiplayerViewController *)self nearbyDelegate];
  [v4 setNearbyDelegate:v7];
}

- (void)loadShareURLWithContactPlayers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 _gkInternalsFromUncheckedPlayers];
  int v8 = [(GKMultiplayerViewController *)self matchRequest];
  unint64_t v9 = [v8 internal];
  [v9 setMessagesBasedRecipients:v7];

  id v11 = [(GKMultiplayerP2PViewController *)self delegate];
  uint64_t v10 = [(GKMultiplayerViewController *)self matchRequest];
  [v11 multiplayerP2PViewController:self shareMatchWithRequest:v10 handler:v6];
}

- (void)prepopulateSharePlayActiveParticipants
{
  if ([(GKMultiplayerP2PViewController *)self sharePlayEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __72__GKMultiplayerP2PViewController_prepopulateSharePlayActiveParticipants__block_invoke;
    v3[3] = &unk_1E5F647B0;
    v3[4] = self;
    [(GKMultiplayerP2PViewController *)self sharePlayFetchFirstActiveConversationWithHandler:v3];
  }
}

void __72__GKMultiplayerP2PViewController_prepopulateSharePlayActiveParticipants__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 activeRemoteParticipants];
  [*(id *)(a1 + 32) setActiveRemoteParticipants:v4];

  [*(id *)(a1 + 32) setFirstActiveConversation:v3];
  uint64_t v5 = [*(id *)(a1 + 32) activeRemoteParticipants];
  unint64_t v6 = [v5 count];
  id v7 = [*(id *)(a1 + 32) matchRequest];
  unint64_t v8 = [v7 maxPlayers];

  unint64_t v9 = (void *)MEMORY[0x1E4F63860];
  uint64_t v10 = *MEMORY[0x1E4F63860];
  if (v6 >= v8)
  {
    if (!v10) {
      id v21 = (id)GKOSLoggers();
    }
    id v22 = (os_log_t *)MEMORY[0x1E4F63870];
    id v23 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      BOOL v24 = *(void **)(a1 + 32);
      id v25 = v23;
      uint64_t v26 = [v24 activeRemoteParticipants];
      uint64_t v27 = [v26 count];
      id v28 = [*(id *)(a1 + 32) matchRequest];
      *(_DWORD *)buf = 134218240;
      uint64_t v39 = v27;
      __int16 v40 = 2048;
      uint64_t v41 = [v28 maxPlayers];
      _os_log_impl(&dword_1AF250000, v25, OS_LOG_TYPE_INFO, "Do not pre-populate remote participants from the call to the game. Active remote participant count=%lu, maxPlayers of matchRequest=%lu", buf, 0x16u);
    }
    uint64_t v18 = [*(id *)(a1 + 32) multiplayerDataSource];
    id v29 = [*(id *)(a1 + 32) activeRemoteParticipants];
    uint64_t v30 = [v29 count];
    id v31 = [v18 players];
    uint64_t v32 = [v31 count];

    if (((v30 + 1 - v32) & 0x8000000000000000) == 0)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      if (!*v9) {
        id v33 = (id)GKOSLoggers();
      }
      unint64_t v34 = *v22;
      if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v37 = 0;
        _os_log_impl(&dword_1AF250000, v34, OS_LOG_TYPE_INFO, "Setting reserved automatch spot for share play players.", v37, 2u);
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __72__GKMultiplayerP2PViewController_prepopulateSharePlayActiveParticipants__block_invoke_207;
      v35[3] = &unk_1E5F634E8;
      objc_copyWeak(&v36, (id *)buf);
      [v18 setAutomatchPlayerCount:v30 + 1 - v32 complete:v35];
      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (!v10) {
      id v11 = (id)GKOSLoggers();
    }
    unint64_t v12 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      int v13 = *(void **)(a1 + 32);
      id v14 = v12;
      int v15 = [v13 activeRemoteParticipants];
      uint64_t v16 = [v15 count];
      char v17 = [*(id *)(a1 + 32) matchRequest];
      *(_DWORD *)buf = 134218240;
      uint64_t v39 = v16;
      __int16 v40 = 2048;
      uint64_t v41 = [v17 maxPlayers];
      _os_log_impl(&dword_1AF250000, v14, OS_LOG_TYPE_INFO, "Pre-populating remote participants from the call to the game. Active remote participant count=%lu, maxPlayers of matchRequest=%lu", buf, 0x16u);
    }
    uint64_t v18 = [*(id *)(a1 + 32) multiplayerDataSource];
    uint64_t v19 = [*(id *)(a1 + 32) activeRemoteParticipants];
    unint64_t v20 = [v19 allObjects];
    [v18 prepopulateConversationParticipants:v20 complete:0];
  }
}

void __72__GKMultiplayerP2PViewController_prepopulateSharePlayActiveParticipants__block_invoke_207(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didUpdateAutoMatchPlayerCount];
}

- (void)sharePlayFetchFirstActiveConversationWithHandler:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "fetching first active TUConversation.", (uint8_t *)&v31, 2u);
  }
  unint64_t v8 = [MEMORY[0x1E4FADA90] sharedInstance];
  unint64_t v9 = [v8 conversationManager];

  uint64_t v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamed.multiplayerService.conversationManager", 0);
  conversationManagerQueue = self->_conversationManagerQueue;
  self->_conversationManagerQueue = v10;

  unint64_t v12 = [(GKMultiplayerP2PViewController *)self conversationManagerQueue];
  [v9 addDelegate:self queue:v12];

  int v13 = (os_log_t *)MEMORY[0x1E4F63870];
  if (!v9)
  {
    if (!*v5) {
      id v19 = (id)GKOSLoggers();
    }
    unint64_t v20 = *v13;
    if (!os_log_type_enabled(*v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    LOWORD(v31) = 0;
    id v21 = "conversation manager is nil from TUCallCenter";
    goto LABEL_16;
  }
  id v14 = [v9 activeConversations];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    uint64_t v16 = [v9 activeConversations];
    char v17 = [v16 allObjects];
    uint64_t v18 = [v17 _gkFilterWithBlock:&__block_literal_global_213];

    goto LABEL_18;
  }
  if (!*v5) {
    id v22 = (id)GKOSLoggers();
  }
  unint64_t v20 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v31) = 0;
    id v21 = "no active conversations found from conversation manager.";
LABEL_16:
    _os_log_impl(&dword_1AF250000, v20, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v31, 2u);
  }
LABEL_17:
  uint64_t v18 = 0;
LABEL_18:
  if (!*v5) {
    id v23 = (id)GKOSLoggers();
  }
  os_log_t v24 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    id v25 = NSNumber;
    uint64_t v26 = v24;
    uint64_t v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    int v31 = 138412290;
    uint64_t v32 = v27;
    _os_log_impl(&dword_1AF250000, v26, OS_LOG_TYPE_INFO, "found %@ active conversations that the local player is joined.", (uint8_t *)&v31, 0xCu);
  }
  if (v4)
  {
    id v28 = [v18 firstObject];
    v4[2](v4, v28);
  }
  else
  {
    if (!*v5) {
      id v29 = (id)GKOSLoggers();
    }
    uint64_t v30 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKMultiplayerP2PViewController sharePlayFetchFirstActiveConversationWithHandler:](v30);
    }
  }
}

id __83__GKMultiplayerP2PViewController_sharePlayFetchFirstActiveConversationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 3) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)sendInvitesToContactPlayers:(id)a3 legacyPlayers:(id)a4 source:(unint64_t)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(GKMultiplayerP2PViewController *)self setMode:1];
  if (!*MEMORY[0x1E4F63860]) {
    id v13 = (id)GKOSLoggers();
  }
  id v14 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl(&dword_1AF250000, v14, OS_LOG_TYPE_INFO, "GK-InviteMessage:Sender side:contactPlayers: %@", buf, 0xCu);
  }
  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F636D8];
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 1208, "-[GKMultiplayerP2PViewController sendInvitesToContactPlayers:legacyPlayers:source:completion:]");
    char v17 = [v15 dispatchGroupWithName:v16];

    if ([v10 count])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke;
      v22[3] = &unk_1E5F64738;
      v22[4] = self;
      id v23 = v10;
      unint64_t v24 = a5;
      [v17 perform:v22];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_3;
    v18[3] = &unk_1E5F647F8;
    id v19 = v11;
    unint64_t v20 = self;
    id v21 = v12;
    [v17 notifyOnMainQueueWithBlock:v18];
  }
  else
  {
    [(GKMultiplayerP2PViewController *)self setMode:0];
  }
}

void __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_2;
  v8[3] = &unk_1E5F639B0;
  id v9 = v3;
  id v7 = v3;
  [v4 inviteContactPlayers:v5 source:v6 completion:v8];
}

uint64_t __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) invitePlayers:*(void *)(a1 + 32)];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)setShareInvitees
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F63870];
  uint64_t v6 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    unint64_t v8 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v9 = [v8 playersInvited];
    *(_DWORD *)buf = 138412290;
    __int16 v40 = v9;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "GK-InviteMessage:Sender side:listOfInvitedPlayers: %@", buf, 0xCu);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v11 = [v10 playersInvited];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (!*v3) {
          id v17 = (id)GKOSLoggers();
        }
        os_log_t v18 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          id v19 = v18;
          unint64_t v20 = [v16 internal];
          id v21 = [v20 messagesID];
          *(_DWORD *)buf = 138412290;
          __int16 v40 = v21;
          _os_log_impl(&dword_1AF250000, v19, OS_LOG_TYPE_INFO, "GK-InviteMessage:Sender side:going to add a player (not formatted): %@", buf, 0xCu);
        }
        id v22 = [v16 internal];
        id v23 = [v22 messagesID];

        if (v23)
        {
          if (!*v3) {
            id v24 = (id)GKOSLoggers();
          }
          os_log_t v25 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
          {
            id v26 = v25;
            uint64_t v27 = [v16 internal];
            id v28 = [v27 messagesID];
            *(_DWORD *)buf = 138412290;
            __int16 v40 = v28;
            _os_log_impl(&dword_1AF250000, v26, OS_LOG_TYPE_INFO, "GK-InviteMessage:Sender side:going to add a player (formatted): %@", buf, 0xCu);
          }
          id v29 = [v16 internal];
          uint64_t v30 = [v29 messagesID];
          [v33 addObject:v30];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v13);
  }

  int v31 = [v32 delegate];
  [v31 multiplayerP2PViewController:v32 setShareInvitees:v33];
}

- (void)invitePlayers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "invitePlayers - players: %@", (uint8_t *)&v14, 0xCu);
  }
  id v7 = [(GKMultiplayerViewController *)self matchRequest];
  unint64_t v8 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v9 = [v8 guestPlayers];
  id v10 = [v4 arrayByAddingObjectsFromArray:v9];
  [v7 setRecipients:v10];

  id v11 = [v7 recipients];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [(GKMultiplayerP2PViewController *)self delegate];
    [v13 multiplayerP2PViewController:self startMatchingWithRequest:v7];

    [(GKMultiplayerP2PViewController *)self sendStatusUpdate];
  }
  else
  {
    [(GKMultiplayerP2PViewController *)self setMode:0];
  }
}

- (void)cancelPendingInvites
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v4 = [v3 playersInvited];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = [(GKMultiplayerP2PViewController *)self delegate];
        uint64_t v12 = [v10 internal];
        [v11 multiplayerP2PViewController:self cancelInviteToPlayer:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    uint64_t v13 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    [v13 removePlayers:v5 complete:0];
  }
}

- (void)resetInviteesStatus
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  id v4 = [v3 currentRemotePlayers];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = [(GKMultiplayerP2PViewController *)self delegate];
        uint64_t v12 = [v10 internal];
        [v11 multiplayerP2PViewController:self cancelInviteToPlayer:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    uint64_t v13 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    [v13 setStatus:11 forPlayers:v5 complete:0];
  }
}

- (void)performActionsForButtonCancelCurrentMatching:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  char v6 = [v5 canCancelCurrentMatchmaking];

  if ((v6 & 1) != 0 || v3)
  {
    [(GKMultiplayerViewController *)self setShareURL:0];
    uint64_t v9 = [(GKMultiplayerP2PViewController *)self delegate];
    [v9 multiplayerP2PViewControllerCancelMatching:self];

    id v10 = [(GKMultiplayerP2PViewController *)self delegate];
    [v10 disconnectMatchForMultiplayerP2PViewController:self];

    [(GKMultiplayerP2PViewController *)self setMode:6];
    id v11 = [(GKMultiplayerViewController *)self footerView];
    [v11 setStartGameButtonEnabled:0];

    uint64_t v12 = [MEMORY[0x1E4F637F8] reporter];
    [v12 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63238]];

    id v13 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    [v13 recordButtonClickAction:@"cancel" targetId:@"cancelGame"];
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    uint64_t v8 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      -[GKMultiplayerP2PViewController performActionsForButtonCancelCurrentMatching:](v8, self);
    }
  }
}

- (void)removedPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMultiplayerP2PViewController *)self delegate];
  char v6 = [v4 internal];

  [v5 multiplayerP2PViewController:self cancelInviteToPlayer:v6];
  [(GKMultiplayerP2PViewController *)self updateMode];
  [(GKMultiplayerP2PViewController *)self sendStatusUpdate];
  if ([(GKMultiplayerP2PViewController *)self mode] == 9)
  {
    unint64_t v20 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v7 = [v20 readyPlayers];
    uint64_t v8 = [v7 count];
    uint64_t v9 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v10 = [v9 connectingPlayers];
    uint64_t v11 = v8 + [v10 count];
    uint64_t v12 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v13 = [v12 shareplayInvitedPlayers];
    uint64_t v14 = v11 + [v13 count] - 1;
    long long v15 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    long long v16 = [v15 shareplayPrepopulatedPlayers];
    uint64_t v17 = [v16 count];

    if (!(v14 + v17))
    {
      if (!*MEMORY[0x1E4F63860]) {
        id v18 = (id)GKOSLoggers();
      }
      uint64_t v19 = *MEMORY[0x1E4F63870];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF250000, v19, OS_LOG_TYPE_INFO, "in GKMultiplayerP2PModeSharePlayStarted and each shareplay pre-populated or invited player has been removed.", buf, 2u);
      }
      [(GKMultiplayerP2PViewController *)self startGameButtonPressed];
    }
  }
}

- (void)updateMode
{
  if ([(GKMultiplayerP2PViewController *)self mode] == 1
    && ![(GKMultiplayerP2PViewController *)self haveInvitedPlayers])
  {
    char v6 = self;
    uint64_t v7 = 0;
  }
  else
  {
    if (![(GKMultiplayerViewController *)self canStartWithMinimumPlayers]) {
      return;
    }
    id v9 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    BOOL v3 = [v9 readyPlayers];
    unint64_t v4 = [v3 count];
    id v5 = [(GKMultiplayerViewController *)self matchRequest];
    if (v4 < [v5 minPlayers])
    {

      return;
    }
    int64_t v8 = [(GKMultiplayerP2PViewController *)self mode];

    if (v8 == 7) {
      return;
    }
    char v6 = self;
    uint64_t v7 = 7;
  }

  [(GKMultiplayerP2PViewController *)v6 setMode:v7];
}

- (void)playerConnected:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  char v6 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v6;
    int64_t v8 = [v4 internal];
    id v9 = [v8 debugDescription];
    *(_DWORD *)buf = 138412290;
    id v24 = v9;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "Player connected = %@", buf, 0xCu);
  }
  id v10 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  uint64_t v11 = (void *)MEMORY[0x1E4F636D8];
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 1335, "-[GKMultiplayerP2PViewController playerConnected:]");
  id v13 = [v11 dispatchGroupWithName:v12];

  uint64_t v14 = [v10 currentPlayers];
  int v15 = [v14 containsObject:v4];

  if (v15)
  {
    long long v16 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    uint64_t v17 = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke;
  }
  else
  {
    long long v16 = v21;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    uint64_t v17 = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_3;
  }
  v16[2] = v17;
  v16[3] = &unk_1E5F62F28;
  id v18 = v10;
  v16[4] = v18;
  id v19 = v4;
  v16[5] = v19;
  [v13 perform:v16];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_5;
  v20[3] = &unk_1E5F62EB0;
  v20[4] = self;
  [v13 notifyOnMainQueueWithBlock:v20];
}

void __50__GKMultiplayerP2PViewController_playerConnected___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_2;
  v7[3] = &unk_1E5F639B0;
  id v8 = v3;
  id v6 = v3;
  [v4 setStatus:7 forPlayers:v5 complete:v7];
}

uint64_t __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_3(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_4;
  v7[3] = &unk_1E5F639B0;
  id v8 = v3;
  id v6 = v3;
  [v4 addPlayers:v5 withStatus:7 replaceAutomatches:1 complete:v7];
}

uint64_t __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_5(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) sendStatusUpdate];
  id v2 = [*(id *)(a1 + 32) matchRequest];

  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) havePendingPlayers];
    char v4 = [*(id *)(a1 + 32) haveInvitedPlayers];
    id v5 = [*(id *)(a1 + 32) matchRequest];
    uint64_t v6 = [v5 maxPlayers];
    uint64_t v7 = [*(id *)(a1 + 32) multiplayerDataSource];
    id v8 = [v7 players];
    uint64_t v64 = [v8 count];

    id v9 = [*(id *)(a1 + 32) multiplayerDataSource];
    id v10 = [v9 readyPlayers];
    unint64_t v11 = [v10 count];

    uint64_t v12 = (void *)MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860]) {
      id v13 = (id)GKOSLoggers();
    }
    uint64_t v14 = (os_log_t *)MEMORY[0x1E4F63870];
    int v15 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      long long v16 = NSNumber;
      uint64_t v17 = *(void **)(a1 + 32);
      id v18 = v15;
      id v19 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "mode"));
      unint64_t v20 = [*(id *)(a1 + 32) multiplayerDataSource];
      [v20 playersInvited];
      v22 = char v21 = v4;
      id v23 = [*(id *)(a1 + 32) multiplayerDataSource];
      int v24 = [v23 havePendingPlayers];
      uint64_t v25 = @"No";
      *(_DWORD *)buf = 138412802;
      v66 = v19;
      __int16 v67 = 2112;
      if (v24) {
        uint64_t v25 = @"Has";
      }
      v68 = v22;
      __int16 v69 = 2112;
      v70 = v25;
      _os_log_impl(&dword_1AF250000, v18, OS_LOG_TYPE_INFO, "int64_t mode = %@ - invited players = %@ - %@ pending players", buf, 0x20u);

      char v4 = v21;
      uint64_t v14 = (os_log_t *)MEMORY[0x1E4F63870];
      uint64_t v12 = (void *)MEMORY[0x1E4F63860];
    }
    if ([*(id *)(a1 + 32) mode] == 2) {
      char v26 = v3;
    }
    else {
      char v26 = 1;
    }
    if (v26)
    {
      uint64_t v27 = [*(id *)(a1 + 32) matchRequest];
      uint64_t v28 = [v27 maxPlayers];

      if (v28 == v11)
      {
        if (!*v12) {
          id v29 = (id)GKOSLoggers();
        }
        os_log_t v30 = *v14;
        if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        int v31 = NSNumber;
        uint64_t v32 = *(void **)(a1 + 32);
        uint64_t v33 = v30;
        long long v34 = objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "mode"));
        *(_DWORD *)buf = 138412290;
        v66 = v34;
        long long v35 = "In GKMultiplayerP2PMode %@, have enough players. Start game!";
        goto LABEL_17;
      }
      if ([*(id *)(a1 + 32) mode] == 9)
      {
        uint64_t v39 = [*(id *)(a1 + 32) multiplayerDataSource];
        __int16 v40 = [v39 players];
        unint64_t v41 = [v40 count];

        if (v11 >= v41)
        {
          if (!*v12) {
            id v53 = (id)GKOSLoggers();
          }
          v54 = *v14;
          if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO)) {
            goto LABEL_52;
          }
          *(_WORD *)buf = 0;
          v55 = "In GKMultiplayerP2PModeSharePlayStarted and no pending players. Change to GKMultiplayerP2PModeInviteOrStart";
LABEL_51:
          _os_log_impl(&dword_1AF250000, v54, OS_LOG_TYPE_INFO, v55, buf, 2u);
          goto LABEL_52;
        }
      }
      if (![*(id *)(a1 + 32) canStartWithMinimumPlayers]
        || ([*(id *)(a1 + 32) matchRequest],
            uint64_t v42 = objc_claimAutoreleasedReturnValue(),
            unint64_t v43 = [v42 minPlayers],
            v42,
            v11 < v43))
      {
        if ([*(id *)(a1 + 32) mode] == 1)
        {
          if (v4) {
            goto LABEL_24;
          }
        }
        else
        {
          if ([*(id *)(a1 + 32) mode] == 7) {
            char v44 = v4;
          }
          else {
            char v44 = 1;
          }
          if (v44) {
            goto LABEL_24;
          }
        }
        v45 = [*(id *)(a1 + 32) matchRequest];
        unint64_t v46 = [v45 maxPlayers];

        if (v11 >= v46)
        {
          if (v3) {
            goto LABEL_24;
          }
          if (!*v12) {
            id v57 = (id)GKOSLoggers();
          }
          os_log_t v58 = *v14;
          if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO)) {
            goto LABEL_23;
          }
          v59 = NSNumber;
          v60 = *(void **)(a1 + 32);
          uint64_t v33 = v58;
          long long v34 = objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v60, "mode"));
          *(_DWORD *)buf = 138412290;
          v66 = v34;
          long long v35 = "In GKMultiplayerP2PMode:%@ , and no pending players. Start game!";
LABEL_17:
          _os_log_impl(&dword_1AF250000, v33, OS_LOG_TYPE_INFO, v35, buf, 0xCu);

LABEL_23:
          [*(id *)(a1 + 32) startGame];
LABEL_24:
          [*(id *)(a1 + 32) updateFooterButtonStates];
          return;
        }
        if (!*v12) {
          id v47 = (id)GKOSLoggers();
        }
        os_log_t v48 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
        {
          v49 = NSNumber;
          v50 = *(void **)(a1 + 32);
          v51 = v48;
          v52 = objc_msgSend(v49, "numberWithInteger:", objc_msgSend(v50, "mode"));
          *(_DWORD *)buf = 138412290;
          v66 = v52;
          _os_log_impl(&dword_1AF250000, v51, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PMode: %@, all invited players connected but there are less players than maxPlayers. Set mode to GKMultiplayerP2PModeInviteOrStart.", buf, 0xCu);
        }
LABEL_52:
        [*(id *)(a1 + 32) setMode:7];
        goto LABEL_24;
      }
      if ([*(id *)(a1 + 32) mode] == 1)
      {
        if (!*v12) {
          id v56 = (id)GKOSLoggers();
        }
        v54 = *v14;
        if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO)) {
          goto LABEL_52;
        }
        *(_WORD *)buf = 0;
        v55 = "In GKMultiplayerP2PModeInviting mode, have enough players for fast start but players can invite more.";
        goto LABEL_51;
      }
      if ([*(id *)(a1 + 32) mode] == 2 || objc_msgSend(*(id *)(a1 + 32), "mode") == 3)
      {
        if (!*v12) {
          id v61 = (id)GKOSLoggers();
        }
        long long v37 = *v14;
        if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
        __int16 v38 = "In GKMultiplayerP2PModeMatching / GKMultiplayerP2PModeStartingGame mode, have enough players for fast start. Start game!";
      }
      else
      {
        if ([*(id *)(a1 + 32) mode] == 7) {
          char v62 = v3;
        }
        else {
          char v62 = 1;
        }
        if ((v62 & 1) != 0 || v6 != v64) {
          goto LABEL_24;
        }
        if (!*v12) {
          id v63 = (id)GKOSLoggers();
        }
        long long v37 = *v14;
        if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
        __int16 v38 = "In GKMultiplayerP2PModeInviteOrStart mode with fast start enabled, and all invited players are ready.. Start game!";
      }
    }
    else
    {
      if (!*v12) {
        id v36 = (id)GKOSLoggers();
      }
      long long v37 = *v14;
      if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      __int16 v38 = "In GKMultiplayerP2PModeMatching mode, and no pending players. Start game!";
    }
    _os_log_impl(&dword_1AF250000, v37, OS_LOG_TYPE_INFO, v38, buf, 2u);
    goto LABEL_23;
  }
}

- (void)playerDisconnected:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F63870];
  id v8 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [v4 internal];
    unint64_t v11 = [v10 debugDescription];
    *(_DWORD *)buf = 138412290;
    id v23 = v11;
    _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "Player disconnected: %@", buf, 0xCu);
  }
  if ([(GKMultiplayerP2PViewController *)self mode] == 5
    || ![(GKMultiplayerP2PViewController *)self mode])
  {
    if (!*v5) {
      id v19 = (id)GKOSLoggers();
    }
    unint64_t v20 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF250000, v20, OS_LOG_TYPE_INFO, "Some player disconnected but we should do nothing because the local player is in either GKMultiplayerP2PModeFailed or GKMultiplayerP2PModeSetup mode", buf, 2u);
    }
  }
  else
  {
    uint64_t v12 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v21 = v4;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v12 setStatus:3 forPlayers:v13 complete:0];

    acceptedInvite = self->_acceptedInvite;
    if (!acceptedInvite
      || ([(GKInvite *)acceptedInvite sender],
          int v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v4 isEqual:v15],
          v15,
          v16))
    {
      if (!*v5) {
        id v17 = (id)GKOSLoggers();
      }
      os_log_t v18 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        [(GKMultiplayerP2PViewController *)v18 playerDisconnected:self];
      }
      [(GKMultiplayerP2PViewController *)self showMatchDisconnectedAlertForPlayer:v4];
    }
  }
}

- (void)sendStatusUpdate
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!self->_acceptedInvite && !self->_hosted)
  {
    id v2 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = [v2 currentPlayers];
    uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v36;
      uint64_t v32 = *MEMORY[0x1E4F63390];
      uint64_t v31 = *MEMORY[0x1E4F630A0];
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v36 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v8 = v2;
          uint64_t v9 = [v2 statusForPlayer:v7];
          id v10 = [v7 internal];
          unint64_t v11 = [v10 playerID];

          if (v11)
          {
            v44[0] = v11;
            v43[0] = v32;
            v43[1] = v31;
            uint64_t v12 = [v7 alias];
            id v13 = (void *)v12;
            if (v12) {
              uint64_t v14 = (__CFString *)v12;
            }
            else {
              uint64_t v14 = &stru_1F07B2408;
            }
            v44[1] = v14;
            v43[2] = @"GKInviteStatusKey";
            int v15 = [NSNumber numberWithInteger:v9];
            v44[2] = v15;
            int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

            [v33 addObject:v16];
          }
          else
          {
            if (!*MEMORY[0x1E4F63860]) {
              id v17 = (id)GKOSLoggers();
            }
            os_log_t v18 = *MEMORY[0x1E4F63870];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = v7;
              _os_log_error_impl(&dword_1AF250000, v18, OS_LOG_TYPE_ERROR, "we don't have a playerID for player: %@", buf, 0xCu);
            }
          }

          id v2 = v8;
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v4);
    }

    if ([v2 automatchPlayerCount] >= 1)
    {
      uint64_t v19 = 0;
      uint64_t v20 = *MEMORY[0x1E4F63390];
      uint64_t v21 = *MEMORY[0x1E4F630A0];
      do
      {
        v39[0] = v20;
        v39[1] = v21;
        v40[0] = &stru_1F07B2408;
        v40[1] = &stru_1F07B2408;
        v39[2] = @"automatchParticipant";
        v39[3] = @"GKInviteStatusKey";
        v40[2] = MEMORY[0x1E4F1CC38];
        v40[3] = &unk_1F0811EF8;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];
        [v33 addObject:v22];

        ++v19;
      }
      while (v19 < [v2 automatchPlayerCount]);
    }
    int v34 = 1;
    id v23 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v33 forKey:@"involvedPlayers"];
    if (!*MEMORY[0x1E4F63860]) {
      id v24 = (id)GKOSLoggers();
    }
    uint64_t v25 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v23;
      _os_log_impl(&dword_1AF250000, v25, OS_LOG_TYPE_INFO, "sending status message: %@", buf, 0xCu);
    }
    char v26 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v23 format:200 options:0 error:0];
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v26, "length") + 4);
    [v27 appendBytes:&v34 length:4];
    [v27 appendData:v26];
    uint64_t v28 = [(GKMultiplayerP2PViewController *)self delegate];
    [v28 multiplayerP2PViewController:self sendData:v27];
  }
}

- (void)processStatusUpdateMessageFromPlayer:(id)a3 bytes:(const char *)a4 withLength:(unsigned int)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v11 = (id)GKOSLoggers();
  }
  uint64_t v12 = (os_log_t *)MEMORY[0x1E4F63870];
  id v13 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v78 = v9;
    _os_log_impl(&dword_1AF250000, v13, OS_LOG_TYPE_INFO, "Process status update - %@ - start", buf, 0xCu);
  }
  v54 = (void *)v9;
  [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:a5];
  uint64_t v53 = v75 = 0;
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F98], "propertyListWithData:options:format:error:");
  id v51 = 0;
  v52 = v14;
  v50 = [v14 objectForKey:@"involvedPlayers"];
  int v15 = [v8 internal];
  int v16 = [v15 playerID];
  v49 = self;
  id v17 = [(GKMultiplayerP2PViewController *)self acceptedInvite];
  os_log_t v18 = [v17 sender];
  uint64_t v19 = [v18 internal];
  uint64_t v20 = [v19 playerID];
  char v48 = [v16 isEqualToString:v20];

  if (!*v10) {
    id v21 = (id)GKOSLoggers();
  }
  id v22 = *v12;
  id v23 = v54;
  id v24 = v50;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v78 = (uint64_t)v54;
    __int16 v79 = 2112;
    v80 = v50;
    _os_log_impl(&dword_1AF250000, v22, OS_LOG_TYPE_INFO, "Process status update - %@ - playerInfos = %@", buf, 0x16u);
  }
  char v26 = v52;
  uint64_t v25 = (void *)v53;
  uint64_t v27 = v51;
  if (v53 && !v51 && v52 && v50 && [v50 count])
  {
    id v47 = v8;
    id v56 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v50, "count"));
    v55 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v50, "count"));
    uint64_t v46 = [MEMORY[0x1E4F1CA48] array];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = v50;
    uint64_t v28 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (!v28)
    {
      uint64_t v30 = 0;
      goto LABEL_31;
    }
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v72;
    uint64_t v32 = *MEMORY[0x1E4F63390];
    while (1)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v72 != v31) {
          objc_enumerationMutation(obj);
        }
        int v34 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        long long v35 = [v34 objectForKey:v32];
        long long v36 = v35;
        if (v35)
        {
          if (![v35 length])
          {
            int v37 = 1;
            goto LABEL_24;
          }
          [v56 addObject:v36];
        }
        int v37 = 0;
LABEL_24:
        long long v38 = [v34 objectForKey:@"automatchParticipant"];
        unsigned int v39 = [v38 BOOLValue];

        __int16 v40 = [v34 objectForKey:@"GKInviteStatusKey"];
        if (v40 && [v36 length]) {
          [v55 setObject:v40 forKey:v36];
        }
        v30 += v37 | v39;
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      if (!v29)
      {
LABEL_31:

        unint64_t v41 = (void *)MEMORY[0x1E4F636D8];
        uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 1523, "-[GKMultiplayerP2PViewController processStatusUpdateMessageFromPlayer:bytes:withLength:]");
        unint64_t v43 = [v41 dispatchGroupWithName:v42];

        if ([v56 count])
        {
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke;
          v65[3] = &unk_1E5F64848;
          id v66 = v56;
          char v70 = v48;
          id v67 = v43;
          v68 = v49;
          id v69 = v46;
          [v67 perform:v65];
        }
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3;
        v58[3] = &unk_1E5F64898;
        id v23 = v54;
        id v59 = v54;
        id v60 = v43;
        id v61 = v49;
        id v62 = v55;
        char v64 = v48;
        uint64_t v63 = v30;
        id v44 = v55;
        id v45 = v43;
        [v45 notifyOnMainQueueWithBlock:v58];

        id v8 = v47;
        char v26 = v52;
        uint64_t v25 = (void *)v53;
        id v24 = v50;
        uint64_t v27 = 0;
        break;
      }
    }
  }
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F63788];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2;
  v9[3] = &unk_1E5F64820;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 56);
  id v14 = v3;
  id v8 = v3;
  [v4 loadPlayersForIdentifiersPrivate:v5 withCompletionHandler:v9];
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([MEMORY[0x1E4F63780] canPlayMultiplayerGameWithPlayers:v3] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] userErrorForCode:10 userInfo:0];
    [*(id *)(a1 + 32) setError:v4];
  }
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"players"];
  if (*(unsigned char *)(a1 + 72))
  {
    id v18 = v3;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = [*(id *)(a1 + 40) multiplayerDataSource];
    id v6 = [v5 players];

    id obj = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v12 = [v11 internal];
          uint64_t v13 = [v12 playerID];
          if (v13)
          {
            id v14 = (void *)v13;
            char v15 = *(void **)(a1 + 48);
            int v16 = [v11 internal];
            id v17 = [v16 playerID];
            LOBYTE(v15) = [v15 containsObject:v17];

            if ((v15 & 1) == 0) {
              [*(id *)(a1 + 56) addObject:v11];
            }
          }
          else
          {
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 56) forKeyedSubscript:@"playersToRemove"];
    id v3 = v18;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F63870];
  uint64_t v5 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v6;
    _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "Process status update - %@ - mainQueue", buf, 0xCu);
  }
  uint64_t v7 = [*(id *)(a1 + 40) error];
  uint64_t v8 = [v7 code];

  if (v8 == 10)
  {
    if (!*v2) {
      id v9 = (id)GKOSLoggers();
    }
    id v10 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3_cold_1(v10);
    }
    [*(id *)(a1 + 48) showParentalControlsRestrictionAlert];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F636D8];
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerP2PViewController.m", 1556, "-[GKMultiplayerP2PViewController processStatusUpdateMessageFromPlayer:bytes:withLength:]_block_invoke");
    uint64_t v13 = [v11 dispatchGroupWithName:v12];

    id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"playersToRemove"];
    if ([v14 count])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2_248;
      v26[3] = &unk_1E5F62F28;
      id v15 = v14;
      uint64_t v16 = *(void *)(a1 + 48);
      id v27 = v15;
      uint64_t v28 = v16;
      [v13 perform:v26];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2_250;
    v19[3] = &unk_1E5F64898;
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 48);
    id v22 = v17;
    uint64_t v23 = v18;
    char v25 = *(unsigned char *)(a1 + 72);
    uint64_t v24 = *(void *)(a1 + 64);
    [v13 notifyOnMainQueueWithBlock:v19];
  }
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2_248(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  uint64_t v5 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "according to the status update from sender, remove players: %@", buf, 0xCu);
  }
  uint64_t v7 = [*(id *)(a1 + 40) multiplayerDataSource];
  uint64_t v8 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_249;
  v10[3] = &unk_1E5F639B0;
  id v11 = v3;
  id v9 = v3;
  [v7 removePlayers:v8 complete:v10];
}

uint64_t __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_249(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2_250(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"players"];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3_251;
  v16[3] = &unk_1E5F64870;
  id v17 = *(id *)(a1 + 40);
  id v4 = v3;
  id v18 = v4;
  [v2 enumerateObjectsUsingBlock:v16];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = NSNumber;
    id v9 = v6;
    id v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v2;
    _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "Process status update - %@ - %@ players = %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 56));
  if (*(unsigned char *)(a1 + 72))
  {
    id v11 = [*(id *)(a1 + 56) multiplayerDataSource];
    uint64_t v12 = *(void *)(a1 + 64);
    BOOL v13 = *(unsigned char *)(a1 + 72) != 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_253;
    v14[3] = &unk_1E5F634E8;
    objc_copyWeak(&v15, (id *)buf);
    [v11 setParticipantsWithPlayers:v2 automatchPlayerCount:v12 shouldUpdateAutomatchPlayerCount:v13 andStatuses:v4 complete:v14];

    objc_destroyWeak(&v15);
  }
  objc_destroyWeak((id *)buf);
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3_251(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v10 = v3;
  id v5 = [v3 internal];
  uint64_t v6 = [v5 playerID];
  uint64_t v7 = [v4 objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [v10 referenceKey];
    [v8 setObject:v7 forKey:v9];
  }
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_253(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained havePendingPlayers];

  id v4 = objc_loadWeakRetained(v1);
  uint64_t v5 = [v4 mode];

  if (v5 == 2 && (v3 & 1) == 0)
  {
    id v6 = objc_loadWeakRetained(v1);
    [v6 startGame];
  }
}

- (void)showParentalControlsRestrictionAlert
{
  char v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v7 = GKGameCenterUIFrameworkBundle();
  uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __70__GKMultiplayerP2PViewController_showParentalControlsRestrictionAlert__block_invoke;
  v10[3] = &unk_1E5F62EB0;
  void v10[4] = self;
  id v9 = (id)[(GKMultiplayerP2PViewController *)self _gkPresentAlertWithTitle:v4 message:v6 buttonTitle:v8 dismissHandler:v10];
}

void __70__GKMultiplayerP2PViewController_showParentalControlsRestrictionAlert__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
  [v1 finishWithError:v2];
}

- (void)showInviterDisconnectedAlert
{
  char v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v5 = NSString;
  id v6 = GKGameCenterUIFrameworkBundle();
  uint64_t v7 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v8 = [(GKInvite *)self->_acceptedInvite sender];
  id v9 = [v8 displayNameWithOptions:0];
  id v10 = objc_msgSend(v5, "stringWithFormat:", v7, v9);
  id v11 = GKGameCenterUIFrameworkBundle();
  uint64_t v12 = GKGetLocalizedStringFromTableInBundle();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__GKMultiplayerP2PViewController_showInviterDisconnectedAlert__block_invoke;
  v14[3] = &unk_1E5F62EB0;
  void v14[4] = self;
  id v13 = (id)[(GKMultiplayerP2PViewController *)self _gkPresentAlertWithTitle:v4 message:v10 buttonTitle:v12 dismissHandler:v14];
}

uint64_t __62__GKMultiplayerP2PViewController_showInviterDisconnectedAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)showAutomatchingErrorAlert
{
  char v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v7 = GKGameCenterUIFrameworkBundle();
  uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __60__GKMultiplayerP2PViewController_showAutomatchingErrorAlert__block_invoke;
  v10[3] = &unk_1E5F62EB0;
  void v10[4] = self;
  id v9 = (id)[(GKMultiplayerP2PViewController *)self _gkPresentAlertWithTitle:v4 message:v6 buttonTitle:v8 dismissHandler:v10];
}

uint64_t __60__GKMultiplayerP2PViewController_showAutomatchingErrorAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMode:0];
}

- (void)showNoInternetAlert
{
  char v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v7 = GKGameCenterUIFrameworkBundle();
  uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __53__GKMultiplayerP2PViewController_showNoInternetAlert__block_invoke;
  v10[3] = &unk_1E5F62EB0;
  void v10[4] = self;
  id v9 = (id)[(GKMultiplayerP2PViewController *)self _gkPresentAlertWithTitle:v4 message:v6 buttonTitle:v8 dismissHandler:v10];
}

void __53__GKMultiplayerP2PViewController_showNoInternetAlert__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userErrorForCode:3 underlyingError:0];
  [v1 finishWithError:v2];
}

- (void)showMatchDisconnectedAlertForPlayer:(id)a3
{
  id v4 = a3;
  if (self->_acceptedInvite)
  {
    [(GKMultiplayerP2PViewController *)self setMode:5];
    uint64_t v5 = GKGameCenterUIFrameworkBundle();
    id v6 = GKGetLocalizedStringFromTableInBundle();
    uint64_t v7 = NSString;
    uint64_t v8 = GKGameCenterUIFrameworkBundle();
    id v9 = GKGetLocalizedStringFromTableInBundle();
    id v10 = [v4 displayNameWithOptions:0];
    id v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);
    uint64_t v12 = GKGameCenterUIFrameworkBundle();
    id v13 = GKGetLocalizedStringFromTableInBundle();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke;
    v27[3] = &unk_1E5F62EB0;
    v27[4] = self;
    id v14 = (id)[(GKMultiplayerP2PViewController *)self _gkPresentAlertWithTitle:v6 message:v11 buttonTitle:v13 dismissHandler:v27];
  }
  else
  {
    id v15 = GKGameCenterUIFrameworkBundle();
    uint64_t v16 = GKGetLocalizedStringFromTableInBundle();
    id v17 = NSString;
    id v18 = GKGameCenterUIFrameworkBundle();
    uint64_t v19 = GKGetLocalizedStringFromTableInBundle();
    uint64_t v20 = [v4 displayNameWithOptions:0];
    __int16 v21 = objc_msgSend(v17, "stringWithFormat:", v19, v20);
    id v22 = GKGameCenterUIFrameworkBundle();
    __int16 v23 = GKGetLocalizedStringFromTableInBundle();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke_2;
    v25[3] = &unk_1E5F63350;
    void v25[4] = self;
    id v26 = v4;
    id v24 = (id)[(GKMultiplayerP2PViewController *)self _gkPresentAlertWithTitle:v16 message:v21 buttonTitle:v23 dismissHandler:v25];

    uint64_t v5 = v26;
  }
}

uint64_t __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) multiplayerDataSource];
  v7[0] = *(void *)(a1 + 40);
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke_3;
  v5[3] = &unk_1E5F63350;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 removePlayers:v3 complete:v5];
}

void __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) mode] == 7
    || [*(id *)(a1 + 32) mode] == 1
    || [*(id *)(a1 + 32) mode] == 9)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v2 = (id)GKOSLoggers();
    }
    char v3 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      id v4 = *(void **)(a1 + 40);
      uint64_t v5 = v3;
      id v6 = [v4 internal];
      uint64_t v7 = [v6 debugDescription];
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "after disconnection, player removed: %@.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = (void *)*MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      id v10 = *(void **)(a1 + 40);
      id v11 = v9;
      uint64_t v12 = [v10 internal];
      id v13 = [v12 debugDescription];
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl(&dword_1AF250000, v11, OS_LOG_TYPE_INFO, "after disconnection, player removed: %@. and matching has started so we need to cancel this game.", (uint8_t *)&v14, 0xCu);
    }
    [*(id *)(a1 + 32) setMode:5];
    [*(id *)(a1 + 32) performActionsForButtonCancelCurrentMatching:0];
  }
}

- (void)cancelAlertWithoutDelegateCallback
{
  char v3 = [(GKMultiplayerP2PViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(GKMultiplayerP2PViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(GKMultiplayerP2PViewController *)self firstActiveConversation];
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = (void *)v6;
  id v8 = [v5 UUID];
  id v9 = [(GKMultiplayerP2PViewController *)self firstActiveConversation];
  id v10 = [v9 UUID];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
LABEL_4:
    if ([v5 state] == 3 || objc_msgSend(v5, "state") == 4)
    {
      if (!*MEMORY[0x1E4F63860]) {
        id v12 = (id)GKOSLoggers();
      }
      id v13 = (void *)*MEMORY[0x1E4F63870];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
      {
        int v14 = NSNumber;
        id v15 = v13;
        uint64_t v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v5, "state"));
        *(_DWORD *)buf = 138412546;
        id v19 = v5;
        __int16 v20 = 2112;
        __int16 v21 = v16;
        _os_log_impl(&dword_1AF250000, v15, OS_LOG_TYPE_INFO, "State of conversation(%@) changed to: %@", buf, 0x16u);
      }
      if ([v5 state] == 4)
      {
        [(GKMultiplayerViewController *)self setCanStartGroupActivities:0];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__GKMultiplayerP2PViewController_conversationManager_stateChangedForConversation___block_invoke;
        block[3] = &unk_1E5F62EB0;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else if ([v5 state] == 3)
      {
        [(GKMultiplayerViewController *)self setCanStartGroupActivities:1];
        [(GKMultiplayerP2PViewController *)self setFirstActiveConversation:v5];
      }
    }
  }
}

uint64_t __82__GKMultiplayerP2PViewController_conversationManager_stateChangedForConversation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a4;
  uint64_t v7 = [v5 set];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [v6 activeRemoteParticipants];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke;
  v27[3] = &unk_1E5F648C0;
  id v10 = v8;
  id v28 = v10;
  [v9 enumerateObjectsUsingBlock:v27];

  int v11 = [MEMORY[0x1E4F1CA80] set];
  id v12 = [(GKMultiplayerP2PViewController *)self activeRemoteParticipants];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke_2;
  v22[3] = &unk_1E5F648E8;
  id v13 = v10;
  id v23 = v13;
  id v24 = self;
  id v14 = v11;
  id v25 = v14;
  id v15 = v7;
  id v26 = v15;
  [v12 enumerateObjectsUsingBlock:v22];

  if ([v14 count])
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v16 = (id)GKOSLoggers();
    }
    id v17 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v14;
      _os_log_impl(&dword_1AF250000, v17, OS_LOG_TYPE_INFO, "remote members changed and someone has left: %@", buf, 0xCu);
    }
    id v18 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    id v19 = [v14 allObjects];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke_289;
    v20[3] = &unk_1E5F63350;
    v20[4] = self;
    id v21 = v15;
    [v18 removePrepopulatedPlayersIfExisted:v19 completionHandler:v20];
  }
}

void __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a2, "identifier"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = NSNumber;
  id v13 = a2;
  id v5 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v13, "identifier"));
  LOBYTE(v3) = [v3 containsObject:v5];

  if (v3)
  {
    id v6 = *(void **)(a1 + 56);
    uint64_t v7 = (uint64_t)v13;
  }
  else
  {
    [v13 identifier];

    id v8 = [*(id *)(a1 + 40) game];
    id v9 = [v8 bundleIdentifier];
    id v10 = [v9 dataUsingEncoding:4];
    uint64_t v11 = IDSIDAliasHashUInt64();

    id v12 = *(void **)(a1 + 48);
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v11);
    id v6 = v12;
    id v13 = (id)v7;
  }
  [v6 addObject:v7];
}

uint64_t __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke_289(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActiveRemoteParticipants:*(void *)(a1 + 40)];
}

- (BOOL)isHosted
{
  return self->_hosted;
}

- (void)setHosted:(BOOL)a3
{
  self->_hosted = a3;
}

- (GKMultiplayerP2PViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKMultiplayerP2PViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (BOOL)startStagedActivity
{
  return self->_startStagedActivity;
}

- (void)setStartStagedActivity:(BOOL)a3
{
  self->_startStagedActivity = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (GKInvite)acceptedInvite
{
  return self->_acceptedInvite;
}

- (void)setAcceptedInvite:(id)a3
{
}

- (double)inviteeConnectionTimeStamp
{
  return self->_inviteeConnectionTimeStamp;
}

- (void)setInviteeConnectionTimeStamp:(double)a3
{
  self->_inviteeConnectionTimeStamp = a3;
}

- (BOOL)userCancelledMatching
{
  return self->_userCancelledMatching;
}

- (void)setUserCancelledMatching:(BOOL)a3
{
  self->_userCancelledMatching = a3;
}

- (BOOL)datasourceConfigured
{
  return self->_datasourceConfigured;
}

- (void)setDatasourceConfigured:(BOOL)a3
{
  self->_datasourceConfigured = a3;
}

- (BOOL)sharePlayEnabled
{
  return self->_sharePlayEnabled;
}

- (void)setSharePlayEnabled:(BOOL)a3
{
  self->_sharePlayEnabled = a3;
}

- (NSArray)existingRemoteReadyPlayers
{
  return self->_existingRemoteReadyPlayers;
}

- (void)setExistingRemoteReadyPlayers:(id)a3
{
}

- (TUConversation)firstActiveConversation
{
  return self->_firstActiveConversation;
}

- (void)setFirstActiveConversation:(id)a3
{
}

- (OS_dispatch_queue)conversationManagerQueue
{
  return self->_conversationManagerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationManagerQueue, 0);
  objc_storeStrong((id *)&self->_firstActiveConversation, 0);
  objc_storeStrong((id *)&self->_existingRemoteReadyPlayers, 0);
  objc_storeStrong((id *)&self->_acceptedInvite, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sharePlayFetchFirstActiveConversationWithHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "handler not set for sharePlayFetchLiveConversationByUUID", v1, 2u);
}

- (void)performActionsForButtonCancelCurrentMatching:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  id v4 = a1;
  id v5 = [a2 multiplayerDataSource];
  id v6 = [v5 players];
  uint64_t v7 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  id v8 = NSNumber;
  id v9 = [a2 multiplayerDataSource];
  id v10 = [v9 readyPlayers];
  uint64_t v11 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  id v12 = NSNumber;
  id v13 = [a2 multiplayerDataSource];
  id v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "automatchPlayerCount"));
  int v15 = 138412802;
  id v16 = v7;
  __int16 v17 = 2112;
  id v18 = v11;
  __int16 v19 = 2112;
  __int16 v20 = v14;
  _os_log_error_impl(&dword_1AF250000, v4, OS_LOG_TYPE_ERROR, "cannot cancel current matching. players count = %@, ready players count = %@, automatch player count = %@", (uint8_t *)&v15, 0x20u);
}

- (void)playerDisconnected:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = [a2 internal];
  uint64_t v7 = [v6 debugDescription];
  id v8 = [a3 acceptedInvite];
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "mode"));
  int v10 = 138412802;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  id v13 = v8;
  __int16 v14 = 2112;
  int v15 = v9;
  _os_log_error_impl(&dword_1AF250000, v5, OS_LOG_TYPE_ERROR, "Player: %@ disconnected while making match. Accepted invite: %@, Matchmaker mode %@", (uint8_t *)&v10, 0x20u);
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "Match contains a player that is not a friend and restriction prevents playing with non-friends.", v1, 2u);
}

@end