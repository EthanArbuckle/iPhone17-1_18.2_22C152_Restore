@interface GKChallengeComposeController
+ (id)composeFlowForChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6;
+ (id)friendPickerFlowForChallenge:(id)a3 selectPlayers:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6;
+ (void)composeAndSendFlowForChallenge:(id)a3 selectPlayers:(id)a4 defaultMessage:(id)a5 forcePicker:(BOOL)a6 readyHandler:(id)a7 completionHandler:(id)a8;
- (GKChallenge)challenge;
- (GKChallengeComposeController)init;
- (GKChallengeComposeController)initWithChallenge:(id)a3 defaultMessage:(id)a4 players:(id)a5;
- (GKComposeHeaderField)challengeField;
- (NSArray)playersToLoad;
- (void)cancel;
- (void)donePressed;
- (void)loadView;
- (void)setChallenge:(id)a3;
- (void)setChallengeField:(id)a3;
- (void)setPlayersToLoad:(id)a3;
- (void)updateChallengeText;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKChallengeComposeController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)GKChallengeComposeController;
  [(GKChallengeComposeController *)&v8 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
  [v3 _setGroupName:@"gameLayerGroup"];
  v4 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  [v3 setBackgroundEffects:v4];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(GKChallengeComposeController *)self view];
  [v5 insertSubview:v3 atIndex:0];

  v6 = (void *)MEMORY[0x1E4F28DC8];
  v7 = [(GKChallengeComposeController *)self view];
  [v6 _gkInstallEdgeConstraintsForView:v3 containedWithinParentView:v7];
}

+ (void)composeAndSendFlowForChallenge:(id)a3 selectPlayers:(id)a4 defaultMessage:(id)a5 forcePicker:(BOOL)a6 readyHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v19 = v18;
  if (!v17)
  {
    BOOL v37 = a6;
    id v26 = a1;
    v27 = NSString;
    v28 = [NSString stringWithFormat:@"Assertion failed"];
    v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Compose/GKChallengeComposeController.m"];
    id v30 = [v29 lastPathComponent];
    v31 = [v27 stringWithFormat:@"%@ (readyHandler != ((void *)0))\n[%s (%s:%d)]", v28, "+[GKChallengeComposeController composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:]", objc_msgSend(v30, "UTF8String"), 66];

    a1 = v26;
    a6 = v37;

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v31 format];
    if (v19) {
      goto LABEL_3;
    }
LABEL_5:
    id v38 = a1;
    v32 = NSString;
    v33 = [NSString stringWithFormat:@"Assertion failed"];
    v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Compose/GKChallengeComposeController.m"];
    id v35 = [v34 lastPathComponent];
    v36 = [v32 stringWithFormat:@"%@ (handler != ((void *)0))\n[%s (%s:%d)]", v33, "+[GKChallengeComposeController composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:]", objc_msgSend(v35, "UTF8String"), 67];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v36 format];
    a1 = v38;
    goto LABEL_3;
  }
  if (!v18) {
    goto LABEL_5;
  }
LABEL_3:
  v20 = [MEMORY[0x1E4F63760] localPlayer];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __135__GKChallengeComposeController_composeAndSendFlowForChallenge_selectPlayers_defaultMessage_forcePicker_readyHandler_completionHandler___block_invoke;
  v39[3] = &unk_1E5F64928;
  BOOL v46 = a6;
  id v40 = v15;
  id v41 = v14;
  id v42 = v16;
  id v43 = v19;
  id v44 = v17;
  id v45 = a1;
  id v21 = v17;
  id v22 = v19;
  id v23 = v16;
  id v24 = v14;
  id v25 = v15;
  [v20 loadRecentPlayersWithCompletionHandler:v39];
}

void __135__GKChallengeComposeController_composeAndSendFlowForChallenge_selectPlayers_defaultMessage_forcePicker_readyHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v10 = v3;
  uint64_t v5 = [v10 count];
  uint64_t v6 = [*(id *)(a1 + 32) count];
  if (!*(unsigned char *)(a1 + 80) && (v6 || v5 < 2))
  {
    if (!v6)
    {
      id v9 = v10;

      id v4 = v9;
    }
    uint64_t v7 = [*(id *)(a1 + 72) composeFlowForChallenge:*(void *)(a1 + 40) players:v4 defaultMessage:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 72) friendPickerFlowForChallenge:*(void *)(a1 + 40) selectPlayers:*(void *)(a1 + 32) defaultMessage:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
  objc_super v8 = (void *)v7;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

+ (id)composeFlowForChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 count])
  {
    v13 = [[GKChallengeComposeController alloc] initWithChallenge:v9 defaultMessage:v11 players:0];
    objc_initWeak(&location, v13);
    [(GKChallengeComposeController *)v13 setPlayersToLoad:v10];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __97__GKChallengeComposeController_composeFlowForChallenge_players_defaultMessage_completionHandler___block_invoke;
    v15[3] = &unk_1E5F64978;
    objc_copyWeak(&v18, &location);
    id v16 = v9;
    id v17 = v12;
    [(GKSimpleComposeController *)v13 setDoneHandler:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __97__GKChallengeComposeController_composeFlowForChallenge_players_defaultMessage_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__GKChallengeComposeController_composeFlowForChallenge_players_defaultMessage_completionHandler___block_invoke_2;
  block[3] = &unk_1E5F64950;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v6;
  id v11 = a1[4];
  id v12 = v5;
  id v13 = a1[5];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __97__GKChallengeComposeController_composeFlowForChallenge_players_defaultMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [WeakRetained players];
    [*(id *)(a1 + 40) issueToPlayers:v3 message:*(void *)(a1 + 48)];
  }
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, *(void *)(a1 + 48));
  }
  [v5 setDoneHandler:0];
}

+ (id)friendPickerFlowForChallenge:(id)a3 selectPlayers:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [[GKChallengePlayerPickerViewController alloc] initWithChallenge:v9 initiallySelectedPlayers:v10];
  [(GKChallengePlayerPickerViewController *)v13 setMessage:v11];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke;
  v19[3] = &unk_1E5F649A0;
  id v14 = v12;
  id v20 = v14;
  [(GKChallengePlayerPickerViewController *)v13 setCompletionHandler:v19];
  objc_initWeak(&location, v13);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_3;
  v16[3] = &unk_1E5F636C8;
  objc_copyWeak(&v17, &location);
  [(GKChallengePlayerPickerViewController *)v13 setInviteFriendHandler:v16];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_2;
  block[3] = &unk_1E5F63268;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _os_feature_enabled_impl();
  if (v3
    || !v4
    || (id v5 = (id *)(a1 + 32),
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32)),
        WeakRetained,
        !WeakRetained))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_4;
    aBlock[3] = &unk_1E5F64710;
    id v19 = v3;
    id v31 = v19;
    objc_copyWeak(&v32, (id *)(a1 + 32));
    id v20 = (void (**)(void))_Block_copy(aBlock);
    if (v3)
    {
      if ([v19 supportsFriendingViaPush])
      {
        id v21 = [v19 contactAssociationID];

        if (v21)
        {
          +[GKMetricsBridge recordInviteFriendClickEventWithType:0 pageType:@"challenge" pageId:@"friendSelect"];
          id v22 = [v19 contact];
          id v23 = [v22 identifier];
          id v24 = [v19 contactAssociationID];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_7;
          v28[3] = &unk_1E5F638C0;
          v29 = v20;
          +[GameCenterObjcHelper sendFriendInvitationViaPushWithContactID:v23 contactAssociationID:v24 completionHandler:v28];

LABEL_13:
          objc_destroyWeak(&v32);

          goto LABEL_16;
        }
      }
      uint64_t v25 = 1;
    }
    else
    {
      uint64_t v25 = 2;
    }
    +[GKMetricsBridge recordInviteFriendClickEventWithType:v25 pageType:@"challenge" pageId:@"friendSelect"];
    v20[2](v20);
    goto LABEL_13;
  }
  +[GKMetricsBridge recordInviteFriendClickEventWithType:2 pageType:@"challenge" pageId:@"friendSelect"];
  id v7 = [MEMORY[0x1E4F637E8] shared];
  int v8 = [v7 isAddingFriendsRestricted];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4FB1418];
    id v10 = GKGameCenterUIFrameworkBundle();
    id v11 = GKGetLocalizedStringFromTableInBundle();
    id v12 = GKGameCenterUIFrameworkBundle();
    id v13 = GKGetLocalizedStringFromTableInBundle();
    id v14 = [v9 alertControllerWithTitle:v11 message:v13 preferredStyle:1];

    id v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = GKGameCenterUIFrameworkBundle();
    id v17 = GKGetLocalizedStringFromTableInBundle();
    id v18 = [v15 actionWithTitle:v17 style:0 handler:0];
    [v14 addAction:v18];
  }
  else
  {
    id v26 = objc_loadWeakRetained(v5);
    id v14 = +[GKFriendingViewControllers inviteFriendsWithContainerViewController:v26];
  }
  id v27 = objc_loadWeakRetained(v5);
  [v27 presentViewController:v14 animated:1 completion:0];

LABEL_16:
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_4(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 contact];
    v11[0] = v3;
    int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = (id *)(a1 + 40);
  if (*MEMORY[0x1E4F63830])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_5;
    v9[3] = &unk_1E5F649C8;
    id v6 = &v10;
    objc_copyWeak(&v10, v5);
    +[FriendRequestFacilitator makeViewControllerWithRecipients:v4 chatGUID:0 completionHandler:v9];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_6;
    v7[3] = &unk_1E5F649F0;
    id v6 = &v8;
    objc_copyWeak(&v8, v5);
    +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:v4 chatGUID:0 resultHandler:v7];
  }
  objc_destroyWeak(v6);
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained presentViewController:v3 animated:1 completion:0];
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9) {
    id v6 = v9;
  }
  else {
    id v6 = v5;
  }
  if (v6)
  {
    id v7 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained presentViewController:v7 animated:1 completion:0];
  }
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v4 = (id)GKOSLoggers();
    }
    id v5 = *MEMORY[0x1E4F63858];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63858], OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "Unable to send friend invitation via push, falling back to Messages flow. %@", (uint8_t *)&v6, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (GKChallengeComposeController)init
{
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeComposeController;
  v2 = [(GKBaseComposeController *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    [(GKBaseComposeController *)v2 setShowHeaderFieldContainer:0];
    id v4 = GKGameCenterUIFrameworkBundle();
    id v5 = GKGetLocalizedStringFromTableInBundle();
    int v6 = [(GKBaseComposeController *)v3 messageField];
    [v6 setPlaceholderText:v5];

    id v7 = [(GKBaseComposeController *)v3 messageField];
    objc_msgSend(v7, "setTextContainerInset:", 5.0, 0.0, 0.0, 0.0);
  }
  return v3;
}

- (GKChallengeComposeController)initWithChallenge:(id)a3 defaultMessage:(id)a4 players:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GKChallengeComposeController *)self init];
  id v12 = v11;
  if (v11)
  {
    [(GKChallengeComposeController *)v11 setChallenge:v8];
    [(GKSimpleComposeController *)v12 setDefaultMessage:v9];
    [(GKSimpleComposeController *)v12 setPlayers:v10];
  }

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKChallengeComposeController *)self updateChallengeText];
  v5.receiver = self;
  v5.super_class = (Class)GKChallengeComposeController;
  [(GKSimpleComposeController *)&v5 viewWillAppear:v3];
}

- (void)updateChallengeText
{
  id v3 = [(GKChallenge *)self->_challenge composeGoalText];
  [(GKComposeHeaderField *)self->_challengeField setValueText:v3];
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)GKChallengeComposeController;
  [(GKSimpleComposeController *)&v12 loadView];
  id v3 = [(GKChallengeComposeController *)self navigationItem];
  id v4 = GKGameCenterUIFrameworkBundle();
  objc_super v5 = GKGetLocalizedStringFromTableInBundle();
  [v3 setTitle:v5];

  if ([(NSArray *)self->_playersToLoad count]
    || ([(GKChallenge *)self->_challenge detailsLoaded] & 1) == 0)
  {
    int v6 = (void *)MEMORY[0x1E4F636D8];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeComposeController.m", 275, "-[GKChallengeComposeController loadView]");
    id v8 = [v6 dispatchGroupWithName:v7];

    [(GKLoadableContentViewController *)self setLoadingState:@"LoadingState"];
    if ([(NSArray *)self->_playersToLoad count])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __40__GKChallengeComposeController_loadView__block_invoke;
      v11[3] = &unk_1E5F63650;
      v11[4] = self;
      [v8 perform:v11];
    }
    if (([(GKChallenge *)self->_challenge detailsLoaded] & 1) == 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__GKChallengeComposeController_loadView__block_invoke_4;
      v10[3] = &unk_1E5F63650;
      v10[4] = self;
      [v8 perform:v10];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__GKChallengeComposeController_loadView__block_invoke_6;
    v9[3] = &unk_1E5F62EB0;
    void v9[4] = self;
    [v8 notifyOnMainQueueWithBlock:v9];
  }
}

void __40__GKChallengeComposeController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F63788];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 1200);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__GKChallengeComposeController_loadView__block_invoke_2;
  v8[3] = &unk_1E5F63300;
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 loadCompletePlayersForPlayers:v6 completionHandler:v8];
}

uint64_t __40__GKChallengeComposeController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setPlayers:v4];
  uint64_t v5 = [v4 _gkMapWithBlock:&__block_literal_global_20];

  uint64_t v6 = [*(id *)(a1 + 32) toField];
  [v6 setRecipientNameStrings:v5];

  [*(id *)(a1 + 32) setPlayersToLoad:0];
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

uint64_t __40__GKChallengeComposeController_loadView__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 displayNameWithOptions:0];
}

void __40__GKChallengeComposeController_loadView__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1192);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__GKChallengeComposeController_loadView__block_invoke_5;
  v7[3] = &unk_1E5F63E30;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 loadDetailsWithCompletionHandler:v7];
}

uint64_t __40__GKChallengeComposeController_loadView__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) updateChallengeText];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __40__GKChallengeComposeController_loadView__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLoadingState:@"LoadedState"];
}

- (void)cancel
{
  id v3 = [(GKBaseComposeController *)self intendedFirstResponder];
  [v3 resignFirstResponder];

  uint64_t v4 = [(GKSimpleComposeController *)self doneHandler];

  if (v4)
  {
    uint64_t v5 = [(GKSimpleComposeController *)self doneHandler];
    id v6 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];
    ((void (**)(void, void, void *))v5)[2](v5, 0, v6);

    [(GKSimpleComposeController *)self setDoneHandler:0];
  }
}

- (void)donePressed
{
  id v3 = [(GKBaseComposeController *)self intendedFirstResponder];
  [v3 resignFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)GKChallengeComposeController;
  [(GKSimpleComposeController *)&v4 donePressed];
}

- (GKComposeHeaderField)challengeField
{
  return self->_challengeField;
}

- (void)setChallengeField:(id)a3
{
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSArray)playersToLoad
{
  return self->_playersToLoad;
}

- (void)setPlayersToLoad:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playersToLoad, 0);
  objc_storeStrong((id *)&self->_challenge, 0);

  objc_storeStrong((id *)&self->_challengeField, 0);
}

@end