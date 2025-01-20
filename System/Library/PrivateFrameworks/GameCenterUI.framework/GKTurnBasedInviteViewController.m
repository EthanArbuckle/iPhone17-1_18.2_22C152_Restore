@interface GKTurnBasedInviteViewController
- (BOOL)canStartForcedAutomatch;
- (BOOL)deletePreloadedMatch;
- (BOOL)isInSetupMode;
- (BOOL)isLoadingOrRemovingPreloadedMatch;
- (GKTurnBasedInviteViewControllerDelegate)delegate;
- (GKTurnBasedMatch)match;
- (NSMutableDictionary)inviteMessageDictionary;
- (id)pageId;
- (int64_t)automatchParticipantStatus;
- (int64_t)mode;
- (void)cancel;
- (void)cleanupStateForCancelOrErrorWithHandler:(id)a3;
- (void)createGameWithPlayersToInvite:(id)a3 forSharing:(BOOL)a4 handler:(id)a5;
- (void)didClickCancelForServiceUnavailableAlert;
- (void)didInviteContactPlayers;
- (void)finishWithError:(id)a3;
- (void)finishWithMatchID:(id)a3;
- (void)handleNewParticipantCount:(int64_t)a3;
- (void)inviteFriendsButtonPressed;
- (void)invitePlayers:(id)a3;
- (void)performActionsForButtonCancelCurrentMatching;
- (void)playNow;
- (void)removeCurrentMatchAndSetFlagIfNotLoaded:(BOOL)a3 withHandler:(id)a4;
- (void)sendInvitesToContactPlayers:(id)a3 legacyPlayers:(id)a4 source:(unint64_t)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setDeletePreloadedMatch:(BOOL)a3;
- (void)setInviteMessageDictionary:(id)a3;
- (void)setInvitesFailedWithError:(id)a3;
- (void)setMatch:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)startGameButtonPressed;
- (void)updateStartGameButtonTitle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKTurnBasedInviteViewController

- (id)pageId
{
  return @"turnBasedLobby";
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedInviteViewController;
  [(GKMultiplayerViewController *)&v4 viewDidLoad];
  v3 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  [v3 setAutomatchAddedToMinInHeader:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedInviteViewController;
  [(GKMultiplayerViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x1E4F63660] reporter];
  v5 = [(GKTurnBasedInviteViewController *)self pageId];
  [v4 recordPageWithID:v5 pageContext:@"turnBasedGame" pageType:@"multiplayer"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedInviteViewController;
  [(GKMultiplayerViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(GKMultiplayerViewController *)self originalMatchRequest];
  v5 = [v4 validateForTurnBased];

  if (v5) {
    [(GKTurnBasedInviteViewController *)self finishWithError:v5];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKTurnBasedInviteViewController;
  [(GKCollectionViewController *)&v7 viewWillDisappear:a3];
  if (![(GKTurnBasedInviteViewController *)self mode])
  {
    objc_super v4 = [(GKTurnBasedInviteViewController *)self navigationController];
    v5 = [v4 viewControllers];
    char v6 = [v5 containsObject:self];

    if ((v6 & 1) == 0) {
      [(GKTurnBasedInviteViewController *)self removeCurrentMatchAndSetFlagIfNotLoaded:1 withHandler:0];
    }
  }
}

- (void)cleanupStateForCancelOrErrorWithHandler:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a3;
  v5 = [v4 defaultCenter];
  [v5 removeObserver:self];

  [(GKTurnBasedInviteViewController *)self removeCurrentMatchAndSetFlagIfNotLoaded:1 withHandler:v6];
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__GKTurnBasedInviteViewController_cancel__block_invoke;
  v2[3] = &unk_1E5F62EB0;
  v2[4] = self;
  [(GKTurnBasedInviteViewController *)self cleanupStateForCancelOrErrorWithHandler:v2];
}

void __41__GKTurnBasedInviteViewController_cancel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 turnBasedInviteViewControllerWasCancelled:*(void *)(a1 + 32)];
}

- (void)finishWithMatchID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKTurnBasedInviteViewController *)self delegate];
  [v5 turnBasedInviteViewController:self didCreateMatchID:v4];
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__GKTurnBasedInviteViewController_finishWithError___block_invoke;
  v6[3] = &unk_1E5F63350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(GKTurnBasedInviteViewController *)self cleanupStateForCancelOrErrorWithHandler:v6];
}

void __51__GKTurnBasedInviteViewController_finishWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 turnBasedInviteViewController:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)performActionsForButtonCancelCurrentMatching
{
}

- (void)didClickCancelForServiceUnavailableAlert
{
  v3 = [(GKTurnBasedInviteViewController *)self delegate];

  if (v3)
  {
    id v4 = [(GKTurnBasedInviteViewController *)self delegate];
    [v4 turnBasedInviteViewControllerWasCancelled:self];
  }
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    if (a3 == 1 || a3 == 2)
    {
      [(GKMultiplayerViewController *)self setAddButtonEnabled:0];
      id v4 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      [v4 setRemovingEnabled:0];

      id v5 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 1;
      [(GKMultiplayerViewController *)self setAddButtonEnabled:1];
      id v5 = [(GKMultiplayerViewController *)self multiplayerDataSource];
      [v5 setRemovingEnabled:1];
      id v12 = 0;
    }

    id v7 = [(GKTurnBasedInviteViewController *)self navigationItem];
    v8 = [v7 leftBarButtonItem];
    [v8 setEnabled:v6];

    v9 = [(GKMultiplayerViewController *)self footerView];
    [v9 setFooterStatusString:v12];

    v10 = [(GKMultiplayerViewController *)self footerView];
    [v10 setStartGameButtonEnabled:v6];

    [(GKTurnBasedInviteViewController *)self updateStartGameButtonTitle];
    v11 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    [v11 didChangeMode];
  }
}

- (BOOL)isInSetupMode
{
  return [(GKTurnBasedInviteViewController *)self mode] == 0;
}

- (void)handleNewParticipantCount:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKTurnBasedInviteViewController;
  -[GKMultiplayerViewController handleNewParticipantCount:](&v9, sel_handleNewParticipantCount_);
  id v5 = [(GKMultiplayerViewController *)self matchRequest];
  [v5 setMaxPlayers:a3];

  uint64_t v6 = [(GKMultiplayerViewController *)self matchRequest];
  uint64_t v7 = [v6 maxPlayers];
  v8 = [(GKMultiplayerViewController *)self matchRequest];
  [v8 setDefaultNumberOfPlayers:v7];
}

- (int64_t)automatchParticipantStatus
{
  if ([(GKTurnBasedInviteViewController *)self mode] == 1) {
    return 13;
  }
  else {
    return 0;
  }
}

- (void)updateStartGameButtonTitle
{
  if ((unint64_t)[(GKTurnBasedInviteViewController *)self mode] <= 1)
  {
    v3 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      id v4 = [(GKMultiplayerViewController *)self footerView];
      [v4 setPrimaryButtonTitle:v5];
    }
  }
}

- (void)startGameButtonPressed
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v5 = NSNumber;
    uint64_t v6 = v4;
    uint64_t v7 = objc_msgSend(v5, "numberWithInteger:", -[GKTurnBasedInviteViewController mode](self, "mode"));
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "TBGame - startGameButtonPressed, self.mode = %@", (uint8_t *)&v11, 0xCu);
  }
  v8 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  [v8 recordButtonClickAction:@"play" targetId:@"startGame"];

  int64_t v9 = [(GKTurnBasedInviteViewController *)self mode];
  if (v9 == 1)
  {
    [(GKTurnBasedInviteViewController *)self performActionsForButtonCancelCurrentMatching];
  }
  else if (!v9)
  {
    [(GKMultiplayerViewController *)self performActionsForButtonStartGame];
    v10 = [(GKMultiplayerViewController *)self footerView];
    [v10 setStartGameButtonEnabled:0];
  }
}

- (void)inviteFriendsButtonPressed
{
  id v3 = [MEMORY[0x1E4F63660] reporter];
  id v4 = [(GKTurnBasedInviteViewController *)self pageId];
  [v3 recordClickWithAction:@"navigate" targetId:@"inviteFriends" targetType:@"button" pageId:v4 pageType:@"multiplayer"];

  v5.receiver = self;
  v5.super_class = (Class)GKTurnBasedInviteViewController;
  [(GKMultiplayerViewController *)&v5 inviteFriendsButtonPressed];
}

- (void)createGameWithPlayersToInvite:(id)a3 forSharing:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke;
  v34[3] = &unk_1E5F62EB0;
  v34[4] = self;
  [MEMORY[0x1E4F63688] named:@"TBGame - createGameWithPlayersToInvite" execute:v34];
  v10 = [(GKMultiplayerViewController *)self matchRequest];
  int v11 = (void *)[v10 copy];

  if (a4)
  {
    id v12 = [v11 internal];
    [v12 setPreloadedMatch:1];
  }
  else
  {
    [(GKTurnBasedInviteViewController *)self setMode:2];
    id v12 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    uint64_t v13 = [(GKMultiplayerViewController *)self multiplayerDataSource];
    v14 = [v13 currentPlayers];
    [v12 setStatus:7 forPlayers:v14 complete:0];
  }
  v15 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  v16 = [v15 guestPlayers];

  if ([v16 count])
  {
    v17 = [v16 arrayByAddingObjectsFromArray:v8];
    [v11 setRecipients:v17];
  }
  else
  {
    [v11 setRecipients:v8];
  }
  v18 = [(GKMultiplayerViewController *)self multiplayerDataSource];
  uint64_t v19 = [v18 playerRange];
  uint64_t v21 = v20;

  [v11 setMinPlayers:v19 + v21];
  if (!a4) {
    objc_msgSend(v11, "setMaxPlayers:", objc_msgSend(v11, "minPlayers"));
  }
  v22 = [MEMORY[0x1E4F637E8] shared];
  objc_msgSend(v22, "setRecentNumberOfPlayers:", objc_msgSend(v11, "maxPlayers"));

  v23 = [MEMORY[0x1E4F637E8] shared];
  uint64_t v24 = [v11 maxPlayers];
  v25 = [(GKMultiplayerViewController *)self game];
  v26 = [v25 bundleIdentifier];
  [v23 setRecentNumberOfPlayers:v24 forBundleID:v26];

  [v11 setDefaultNumberOfPlayers:0];
  v27 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v28 = [v27 turnBasedService];
  v29 = [v11 internal];
  inviteMessageDictionary = self->_inviteMessageDictionary;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke_71;
  v32[3] = &unk_1E5F66120;
  v32[4] = self;
  id v33 = v9;
  id v31 = v9;
  [v28 createTurnBasedGameForMatchRequest:v29 individualMessages:inviteMessageDictionary handler:v32];
}

void __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F63860]) {
    id v2 = (id)GKOSLoggers();
  }
  id v3 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v4 = *(void **)(a1 + 32);
    objc_super v5 = v3;
    uint64_t v6 = [v4 matchRequest];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "TBGame - createGameWithPlayersToInvite, self.matchRequest = %@", (uint8_t *)&v7, 0xCu);
  }
}

void __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke_2;
  v10[3] = &unk_1E5F660F8;
  id v11 = v5;
  id v7 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v7;
  uint64_t v12 = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F63818]) initWithInternalRepresentation:*(void *)(a1 + 32)];
    id v8 = v2;
    if (!*(void *)(a1 + 56))
    {
      id v3 = *(void **)(a1 + 40);
      id v4 = [v2 matchID];
      [v3 performSelector:sel_finishWithMatchID_ withObject:v4 afterDelay:1.0];
    }
  }
  else
  {
    [*(id *)(a1 + 40) setInvitesFailedWithError:*(void *)(a1 + 48)];
    id v8 = 0;
  }
  [*(id *)(a1 + 40) setDidStartForcedAutomatch:0];
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = v8;
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(v5 + 16))();
    id v6 = v8;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

- (void)setInvitesFailedWithError:(id)a3
{
  id v4 = a3;
  [(GKTurnBasedInviteViewController *)self setMode:0];
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F63650]];

  if ([v6 intValue] == 5068)
  {
    id v7 = GKGameCenterUIFrameworkBundle();
    id v8 = GKGetLocalizedStringFromTableInBundle();

    id v9 = GKGameCenterUIFrameworkBundle();
    v10 = GKGetLocalizedStringFromTableInBundle();

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke;
    v24[3] = &unk_1E5F62EB0;
    v24[4] = self;
    id v11 = v24;
  }
  else
  {
    int v12 = [v6 intValue];
    id v13 = GKGameCenterUIFrameworkBundle();
    if (v12 != 5094)
    {
      id v8 = GKGetLocalizedStringFromTableInBundle();

      v16 = GKGameCenterUIFrameworkBundle();
      v10 = GKGetLocalizedStringFromTableInBundle();

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke_3;
      v20[3] = &unk_1E5F63350;
      id v21 = v4;
      v22 = self;
      v15 = _Block_copy(v20);

      goto LABEL_7;
    }
    id v8 = GKGetLocalizedStringFromTableInBundle();

    id v14 = GKGameCenterUIFrameworkBundle();
    v10 = GKGetLocalizedStringFromTableInBundle();

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke_2;
    aBlock[3] = &unk_1E5F62EB0;
    aBlock[4] = self;
    id v11 = aBlock;
  }
  v15 = _Block_copy(v11);
LABEL_7:
  v17 = GKGameCenterUIFrameworkBundle();
  v18 = GKGetLocalizedStringFromTableInBundle();
  id v19 = (id)[(GKTurnBasedInviteViewController *)self _gkPresentAlertWithTitle:v8 message:v10 buttonTitle:v18 dismissHandler:v15];
}

uint64_t __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = [v2 delegate];
    [v4 turnBasedInviteViewController:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 32)];
  }
  else
  {
    [v2 cancel];
  }
}

- (BOOL)canStartForcedAutomatch
{
  if ([(GKTurnBasedInviteViewController *)self mode]) {
    return 0;
  }
  else {
    return ![(GKMultiplayerViewController *)self didStartForcedAutomatch];
  }
}

- (void)playNow
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "TBGame - playNow", v5, 2u);
  }
  [(GKTurnBasedInviteViewController *)self removeCurrentMatchAndSetFlagIfNotLoaded:1 withHandler:0];
  [(GKTurnBasedInviteViewController *)self createGameWithPlayersToInvite:0 forSharing:0 handler:0];
}

- (BOOL)isLoadingOrRemovingPreloadedMatch
{
  return self->_deletePreloadedMatch;
}

- (void)sendInvitesToContactPlayers:(id)a3 legacyPlayers:(id)a4 source:(unint64_t)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!*MEMORY[0x1E4F63860]) {
    id v13 = (id)GKOSLoggers();
  }
  id v14 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl(&dword_1AF250000, v14, OS_LOG_TYPE_INFO, "TBGame - sendInvitesToContactPlayers, contactPlayers = %@, legacyPlayers = %@", buf, 0x16u);
  }
  v15 = [MEMORY[0x1E4F636D8] dispatchGroupWithName:@"loadShareURLWithCompletion"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke;
  v27[3] = &unk_1E5F62F28;
  v27[4] = self;
  id v16 = v15;
  id v28 = v16;
  [v16 perform:v27];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_5;
  v21[3] = &unk_1E5F661C0;
  v21[4] = self;
  id v22 = v16;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  unint64_t v26 = a5;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  id v20 = v16;
  [v20 notifyOnMainQueueWithBlock:v21];
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:", objc_msgSend(*(id *)(a1 + 32), "deletePreloadedMatch"), 0);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 multiplayerDataSource];
  id v6 = [v5 playersToBeInvited];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_2;
  v10[3] = &unk_1E5F66170;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v3;
  id v9 = v3;
  [v4 createGameWithPlayersToInvite:v6 forSharing:1 handler:v10];
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if (v5)
  {
    [*(id *)(a1 + 40) setMatch:v5];
    if ([*(id *)(a1 + 40) deletePreloadedMatch])
    {
      [*(id *)(a1 + 40) removeCurrentMatchAndSetFlagIfNotLoaded:0 withHandler:0];
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_3;
      v9[3] = &unk_1E5F63008;
      id v10 = v5;
      int8x16_t v8 = *(int8x16_t *)(a1 + 32);
      id v7 = (id)v8.i64[0];
      int8x16_t v11 = vextq_s8(v8, v8, 8uLL);
      [v6 perform:v9];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) matchRequest];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_4;
  v7[3] = &unk_1E5F66148;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 loadURLWithMatchRequest:v5 completionHandler:v7];
}

uint64_t __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResult:a2];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 40) result];
  [*(id *)(a1 + 32) setShareURL:v2];

  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (void *)*MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 shareURL];
    *(_DWORD *)buf = 138412290;
    v40 = v7;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "TBGame - setting self.shareURL = %@", buf, 0xCu);
  }
  if ([*(id *)(a1 + 48) count] || objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    id v8 = [*(id *)(a1 + 40) error];
    id v9 = v8;
    if (v8
      && ([v8 domain],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEqualToString:*MEMORY[0x1E4F19C40]],
          v10,
          (v11 & 1) == 0))
    {
      [*(id *)(a1 + 32) setMode:0];
    }
    else
    {
      [*(id *)(a1 + 32) setMode:2];
      uint64_t v12 = [*(id *)(a1 + 32) multiplayerDataSource];
      id v13 = [*(id *)(a1 + 32) multiplayerDataSource];
      id v14 = [v13 currentPlayersNotInvitedViaMessages];
      [v12 setStatus:7 forPlayers:v14 complete:0];

      v15 = [*(id *)(a1 + 32) multiplayerDataSource];
      uint64_t v16 = [v15 playerRange];
      uint64_t v18 = v17;

      unint64_t v19 = v16 + v18;
      id v20 = [*(id *)(a1 + 32) matchRequest];
      unint64_t v21 = [v20 minPlayers];

      if (v19 < v21)
      {
        id v22 = [*(id *)(a1 + 32) matchRequest];
        unint64_t v19 = [v22 minPlayers];
      }
      id v23 = [*(id *)(a1 + 32) matchRequest];
      unint64_t v24 = [v23 maxPlayers];

      if (v19 > v24)
      {
        id v25 = [*(id *)(a1 + 32) matchRequest];
        unint64_t v19 = [v25 maxPlayers];
      }
      unint64_t v26 = [*(id *)(a1 + 56) valueForKeyPath:@"internal.playerID"];
      v27 = [*(id *)(a1 + 32) match];
      uint64_t v28 = [*(id *)(a1 + 48) count];
      v29 = [*(id *)(a1 + 32) matchRequest];
      id v30 = [v29 inviteMessage];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_107;
      v34[3] = &unk_1E5F66198;
      id v31 = *(id *)(a1 + 48);
      uint64_t v32 = *(void *)(a1 + 32);
      id v35 = v31;
      uint64_t v36 = v32;
      uint64_t v33 = *(void **)(a1 + 64);
      uint64_t v38 = *(void *)(a1 + 72);
      id v37 = v33;
      [v27 reserveShareParticipantSlots:v28 minPlayerCount:v19 maxPlayerCount:v19 andInvitePlayers:v26 withMessage:v30 handler:v34];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setMode:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v13 = 138412546;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "TBGame - reserveShareParticipantSlots result, error = %@, contactPlayers = %@", (uint8_t *)&v13, 0x16u);
  }
  if (v3)
  {
    if (!*v4) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_107_cold_1((uint64_t)v3, v9);
    }
  }
  else if ([*(id *)(a1 + 32) count])
  {
    [*(id *)(a1 + 40) inviteContactPlayers:*(void *)(a1 + 32) source:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
    goto LABEL_13;
  }
  id v10 = *(void **)(a1 + 40);
  char v11 = [v10 match];
  uint64_t v12 = [v11 matchID];
  [v10 finishWithMatchID:v12];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:
}

- (void)didInviteContactPlayers
{
  id v4 = [(GKTurnBasedInviteViewController *)self match];
  id v3 = [v4 matchID];
  [(GKTurnBasedInviteViewController *)self finishWithMatchID:v3];
}

- (void)removeCurrentMatchAndSetFlagIfNotLoaded:(BOOL)a3 withHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F636D8] dispatchGroupWithName:@"removeCurrentMatchGroup"];
  id v8 = [(GKTurnBasedInviteViewController *)self match];
  id v9 = v8;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke;
    v13[3] = &unk_1E5F62F28;
    id v14 = v8;
    __int16 v15 = self;
    [v7 perform:v13];
  }
  else
  {
    self->_deletePreloadedMatch = a3;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_4;
  v11[3] = &unk_1E5F639B0;
  id v12 = v6;
  id v10 = v6;
  [v7 notifyOnMainQueueWithBlock:v11];
}

void __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) currentParticipant];
  [v4 setMatchOutcome:1];

  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C9B8] data];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_2;
  v10[3] = &unk_1E5F65FD0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v3;
  id v9 = v3;
  [v5 endMatchInTurnWithMatchData:v6 completionHandler:v10];

  [*(id *)(a1 + 40) setMatch:0];
  [*(id *)(a1 + 40) setShareURL:0];
}

void __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_2(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_3;
  v3[3] = &unk_1E5F63938;
  v1 = (void *)a1[4];
  id v2 = (void *)a1[6];
  v3[4] = a1[5];
  id v4 = v2;
  [v1 removeWithCompletionHandler:v3];
}

uint64_t __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setDeletePreloadedMatch:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invitePlayers:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "TBGame - invitePlayers, players = %@", (uint8_t *)&v7, 0xCu);
  }
  if ([v4 count])
  {
    [(GKTurnBasedInviteViewController *)self removeCurrentMatchAndSetFlagIfNotLoaded:1 withHandler:0];
    [(GKTurnBasedInviteViewController *)self createGameWithPlayersToInvite:v4 forSharing:0 handler:0];
  }
  else
  {
    [(GKTurnBasedInviteViewController *)self setMode:0];
  }
}

- (NSMutableDictionary)inviteMessageDictionary
{
  return self->_inviteMessageDictionary;
}

- (void)setInviteMessageDictionary:(id)a3
{
}

- (GKTurnBasedInviteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKTurnBasedInviteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (BOOL)deletePreloadedMatch
{
  return self->_deletePreloadedMatch;
}

- (void)setDeletePreloadedMatch:(BOOL)a3
{
  self->_deletePreloadedMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_match, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_inviteMessageDictionary, 0);
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_107_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "Error reserving turn-based slots: %@", (uint8_t *)&v2, 0xCu);
}

@end