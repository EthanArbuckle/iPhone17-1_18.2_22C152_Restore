@interface GKTurnBasedMatchmakerViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldShowPlayForTurnBasedMatch;
- (BOOL)shouldShowQuitForTurnBasedMatch;
- (BOOL)showExistingMatches;
- (GKMatchRequest)matchRequest;
- (GKMatchmakingMode)matchmakingMode;
- (GKTurnBasedMatchmakerHostViewController)remoteViewController;
- (GKTurnBasedMatchmakerViewController)init;
- (UIAlertController)alertController;
- (id)initWithMatchRequest:(GKMatchRequest *)request;
- (id)turnBasedMatchmakerDelegate;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setupChildViewController;
- (void)_setupRemoteViewController;
- (void)authenticationChanged:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)extensionDidFinishWithError:(id)a3;
- (void)finishWithError:(id)a3;
- (void)finishWithMatch:(id)a3;
- (void)loadView;
- (void)player:(id)a3 receivedTurnEventForMatch:(id)a4 didBecomeActive:(BOOL)a5;
- (void)playerQuitMatch:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setMatchRequest:(id)a3;
- (void)setMatchmakingMode:(GKMatchmakingMode)matchmakingMode;
- (void)setRemoteViewController:(id)a3;
- (void)setShowExistingMatches:(BOOL)showExistingMatches;
- (void)setTurnBasedMatchmakerDelegate:(id)turnBasedMatchmakerDelegate;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKTurnBasedMatchmakerViewController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (id)initWithMatchRequest:(GKMatchRequest *)request
{
  v4 = request;
  v13.receiver = self;
  v13.super_class = (Class)GKTurnBasedMatchmakerViewController;
  v5 = [(GKTurnBasedMatchmakerViewController *)&v13 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [(GKMatchRequest *)v4 copy];
    matchRequest = v5->_matchRequest;
    v5->_matchRequest = (GKMatchRequest *)v6;

    v5->_showExistingMatches = 1;
    [(GKTurnBasedMatchmakerViewController *)v5 _setupChildViewController];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4F63380];
    v10 = [MEMORY[0x1E4F63760] localPlayer];
    [v8 addObserver:v5 selector:sel_authenticationChanged_ name:v9 object:v10];

    v11 = [MEMORY[0x1E4F63760] localPlayer];
    [v11 registerListener:v5];
  }
  return v5;
}

- (void)player:(id)a3 receivedTurnEventForMatch:(id)a4 didBecomeActive:(BOOL)a5
{
}

- (GKTurnBasedMatchmakerViewController)init
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
    _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMatchmakerViewController dealloc", buf, 2u);
  }
  [(GKExtensionRemoteViewController *)self->_remoteViewController cancelExtension];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchmakerViewController;
  [(GKTurnBasedMatchmakerViewController *)&v6 dealloc];
}

- (void)loadView
{
  v2.receiver = self;
  v2.super_class = (Class)GKTurnBasedMatchmakerViewController;
  [(GKTurnBasedMatchmakerViewController *)&v2 loadView];
}

- (void)_setupChildViewController
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__GKTurnBasedMatchmakerViewController__setupChildViewController__block_invoke;
  v5[3] = &unk_1E5F62EB0;
  v5[4] = self;
  id v3 = [(GKTurnBasedMatchmakerViewController *)self _gkInGameUIUnavailableAlertWithRestrictionMode:2 dismissHandler:v5];
  [(GKTurnBasedMatchmakerViewController *)self setAlertController:v3];

  v4 = [(GKTurnBasedMatchmakerViewController *)self alertController];

  if (!v4)
  {
    [(GKTurnBasedMatchmakerViewController *)self setNavigationBarHidden:1];
    [(GKTurnBasedMatchmakerViewController *)self setWantsFullScreenLayout:1];
    [(GKTurnBasedMatchmakerViewController *)self setModalPresentationStyle:17];
    if (!self->_remoteViewController) {
      [(GKTurnBasedMatchmakerViewController *)self _setupRemoteViewController];
    }
  }
}

uint64_t __64__GKTurnBasedMatchmakerViewController__setupChildViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)_setupRemoteViewController
{
  id v3 = +[GKTurnBasedMatchmakerHostViewController turnBasedMatchmakerExtension];
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:v3 withParentViewController:self];
    [(GKTurnBasedMatchmakerViewController *)self _beginDelayingPresentation:&__block_literal_global_13 cancellationHandler:5.0];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke_31;
    v4[3] = &unk_1E5F64330;
    objc_copyWeak(&v5, &location);
    v4[4] = self;
    +[GKExtensionRemoteViewController viewControllerForExtension:v3 inputItems:0 completionHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

uint64_t __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke_cold_1(v4);
    }
  }
  return a2 ^ 1u;
}

void __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke_31(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = v7;
    [WeakRetained setRemoteViewController:v6];
    [WeakRetained _updateViewControllerStackWithViewController:v6];
  }
  else
  {
    [*(id *)(a1 + 32) extensionDidFinishWithError:a3];
  }
}

- (void)extensionDidFinishWithError:(id)a3
{
  [(GKTurnBasedMatchmakerViewController *)self finishWithError:a3];
  [(UINavigationController *)self _updateViewControllerStackWithViewController:0];

  [(GKTurnBasedMatchmakerViewController *)self setRemoteViewController:0];
}

- (void)setRemoteViewController:(id)a3
{
  id v5 = (GKTurnBasedMatchmakerHostViewController *)a3;
  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    id v6 = [(GKTurnBasedMatchmakerViewController *)self remoteViewController];
    [v6 setDelegate:self];

    id v7 = (void *)MEMORY[0x1E4F1CA60];
    v8 = +[GKExtensionRemoteViewController initialItemsForExtension];
    uint64_t v9 = [v7 dictionaryWithDictionary:v8];

    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[GKTurnBasedMatchmakerViewController shouldShowPlayForTurnBasedMatch](self, "shouldShowPlayForTurnBasedMatch"));
    [v9 setObject:v10 forKeyedSubscript:@"MatchesShowPlayForMatch"];

    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[GKTurnBasedMatchmakerViewController shouldShowQuitForTurnBasedMatch](self, "shouldShowQuitForTurnBasedMatch"));
    [v9 setObject:v11 forKeyedSubscript:@"MatchesShowQuitForMatch"];

    v12 = [NSNumber numberWithBool:self->_showExistingMatches];
    [v9 setObject:v12 forKeyedSubscript:@"MatchesShowExistingMatches"];

    matchRequest = self->_matchRequest;
    if (matchRequest)
    {
      v14 = [(GKMatchRequest *)matchRequest internal];
      [v9 setObject:v14 forKeyedSubscript:@"MatchesMatchRequestInternal"];
    }
    objc_initWeak(&location, self);
    v15 = [(GKTurnBasedMatchmakerViewController *)self remoteViewController];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__GKTurnBasedMatchmakerViewController_setRemoteViewController___block_invoke;
    v16[3] = &unk_1E5F64358;
    objc_copyWeak(&v17, &location);
    [v15 setInitialState:v9 withReply:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __63__GKTurnBasedMatchmakerViewController_setRemoteViewController___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__GKTurnBasedMatchmakerViewController_setRemoteViewController___block_invoke_2;
  block[3] = &unk_1E5F634E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __63__GKTurnBasedMatchmakerViewController_setRemoteViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endDelayingPresentation];
}

- (BOOL)shouldShowPlayForTurnBasedMatch
{
  id v3 = [MEMORY[0x1E4F63760] localPlayer];
  v4 = [v3 eventEmitter];
  char v5 = [v4 listenerRegisteredForSelector:sel_player_receivedTurnEventForMatch_didBecomeActive_];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [(GKTurnBasedMatchmakerViewController *)self turnBasedMatchmakerDelegate];
    char v6 = objc_opt_respondsToSelector();
  }
  return v6 & 1;
}

- (BOOL)shouldShowQuitForTurnBasedMatch
{
  id v3 = [MEMORY[0x1E4F63760] localPlayer];
  v4 = [v3 eventEmitter];
  char v5 = [v4 listenerRegisteredForSelector:sel_player_wantsToQuitMatch_];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [(GKTurnBasedMatchmakerViewController *)self turnBasedMatchmakerDelegate];
    char v6 = objc_opt_respondsToSelector();
  }
  return v6 & 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)GKTurnBasedMatchmakerViewController;
  [(GKTurnBasedMatchmakerViewController *)&v3 viewDidLoad];
  [(GKTurnBasedMatchmakerViewController *)self setOverrideUserInterfaceStyle:2];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [MEMORY[0x1E4F63760] local];
  [v5 hideAccessPoint];

  char v6 = [(GKTurnBasedMatchmakerViewController *)self remoteViewController];

  if (!v6)
  {
    [(GKTurnBasedMatchmakerViewController *)self _setupChildViewController];
    goto LABEL_7;
  }
  id v7 = [(GKTurnBasedMatchmakerViewController *)self alertController];
  if (!v7)
  {
    v8 = [(GKTurnBasedMatchmakerViewController *)self viewControllers];
    uint64_t v9 = [v8 count];

    if (v9) {
      goto LABEL_6;
    }
    id v7 = [(GKTurnBasedMatchmakerViewController *)self remoteViewController];
    [(UINavigationController *)self _updateViewControllerStackWithViewController:v7];
  }

LABEL_6:
  v10 = [(GKTurnBasedMatchmakerViewController *)self remoteViewController];
  [v10 setDelegate:self];

LABEL_7:
  v14.receiver = self;
  v14.super_class = (Class)GKTurnBasedMatchmakerViewController;
  [(GKTurnBasedMatchmakerViewController *)&v14 viewWillAppear:v3];
  v11 = [(GKTurnBasedMatchmakerViewController *)self matchRequest];
  int v12 = [v11 isIncorrectlyInvitingPlayers];

  if (v12)
  {
    objc_super v13 = [MEMORY[0x1E4F28C58] userErrorForCode:30 userInfo:0];
    [(GKTurnBasedMatchmakerViewController *)self finishWithError:v13];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchmakerViewController;
  [(GKTurnBasedMatchmakerViewController *)&v6 viewDidAppear:a3];
  v4 = [(GKTurnBasedMatchmakerViewController *)self alertController];

  if (v4)
  {
    char v5 = [(GKTurnBasedMatchmakerViewController *)self alertController];
    [(GKTurnBasedMatchmakerViewController *)self presentViewController:v5 animated:1 completion:&__block_literal_global_52];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMatchmakerViewController;
  [(GKTurnBasedMatchmakerViewController *)&v8 viewDidDisappear:a3];
  [(UINavigationController *)self _updateViewControllerStackWithViewController:0];
  v4 = [MEMORY[0x1E4F63760] local];
  [v4 showAccessPoint];

  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  objc_super v6 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMatchmakerVC viewDidDisappear: cancelExtension", v7, 2u);
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

- (void)setShowExistingMatches:(BOOL)showExistingMatches
{
  self->_showExistingMatches = showExistingMatches;
  -[GKTurnBasedMatchmakerHostViewController setShowExistingMatches:](self->_remoteViewController, "setShowExistingMatches:");
}

- (void)cancel
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(GKTurnBasedMatchmakerViewController *)self turnBasedMatchmakerDelegate];
  [v4 turnBasedMatchmakerViewControllerWasCancelled:self];
}

- (void)finishWithError:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  objc_super v6 = [v4 defaultCenter];
  [v6 removeObserver:self];

  id v7 = [(GKTurnBasedMatchmakerViewController *)self turnBasedMatchmakerDelegate];
  [v7 turnBasedMatchmakerViewController:self didFailWithError:v5];
}

- (void)finishWithMatch:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  objc_super v6 = [(GKTurnBasedMatchmakerViewController *)self turnBasedMatchmakerDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v6 turnBasedMatchmakerViewController:self didFindMatch:v4];
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    objc_super v8 = *MEMORY[0x1E4F63848];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKTurnBasedMatchmakerViewController finishWithMatch:](v8);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__GKTurnBasedMatchmakerViewController_finishWithMatch___block_invoke;
    block[3] = &unk_1E5F62EB0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  uint64_t v9 = [MEMORY[0x1E4F63760] localPlayer];
  v10 = [v9 eventEmitter];
  [v10 player:v9 receivedTurnEventForMatch:v4 didBecomeActive:1];
}

uint64_t __55__GKTurnBasedMatchmakerViewController_finishWithMatch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)playerQuitMatch:(id)a3
{
  id v7 = a3;
  id v4 = [(GKTurnBasedMatchmakerViewController *)self turnBasedMatchmakerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 turnBasedMatchmakerViewController:self playerQuitForMatch:v7];
  }
  id v5 = [MEMORY[0x1E4F63760] localPlayer];
  objc_super v6 = [v5 eventEmitter];
  [v6 player:v5 wantsToQuitMatch:v7];
}

- (void)authenticationChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x1E4F63388]];

  id v5 = [MEMORY[0x1E4F63760] localPlayer];
  if (([v5 isAuthenticated] & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_super v6 = [MEMORY[0x1E4F63760] localPlayer];
  id v7 = [v6 internal];
  objc_super v8 = [v7 playerID];
  char v9 = [v8 isEqualToString:v10];

  if ((v9 & 1) == 0) {
LABEL_5:
  }
    [(GKTurnBasedMatchmakerViewController *)self cancel];
}

- (id)turnBasedMatchmakerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->turnBasedMatchmakerDelegate);

  return WeakRetained;
}

- (void)setTurnBasedMatchmakerDelegate:(id)turnBasedMatchmakerDelegate
{
}

- (GKTurnBasedMatchmakerHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (BOOL)showExistingMatches
{
  return self->_showExistingMatches;
}

- (GKMatchmakingMode)matchmakingMode
{
  return self->_matchmakingMode;
}

- (void)setMatchmakingMode:(GKMatchmakingMode)matchmakingMode
{
  self->_matchmakingMode = matchmakingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_matchRequest, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_destroyWeak((id *)&self->turnBasedMatchmakerDelegate);
}

void __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "We failed to present Game Center matchmaker extension.", v1, 2u);
}

- (void)finishWithMatch:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "<Info>: Auto-dismissing GKTurnBasedMatchmakerViewController after match became active because GKTurnBasedMatchmakerViewControllerDelegate does not implement 'turnBasedMatchmakerViewController:didFindMatch:'", v1, 2u);
}

@end