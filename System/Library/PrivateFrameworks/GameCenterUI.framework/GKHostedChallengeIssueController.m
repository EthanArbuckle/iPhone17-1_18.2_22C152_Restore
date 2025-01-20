@interface GKHostedChallengeIssueController
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (id)hostedIssueControllerWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6;
+ (id)presentationQueue;
+ (void)presentHostedIssueControllerWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5;
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)forcePicker;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (GKChallenge)challenge;
- (GKChallengeIssueHostViewController)remoteViewController;
- (GKHostedChallengeIssueController)initWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6;
- (NSArray)players;
- (NSString)defaultMessage;
- (id)completionHandler;
- (id)dismissCompletionHandler;
- (id)receivedRemoteHandler;
- (void)_setupChildViewController;
- (void)_setupRemoteViewController;
- (void)dealloc;
- (void)doneWithPlayers:(id)a3 message:(id)a4;
- (void)extensionDidFinishWithError:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDefaultMessage:(id)a3;
- (void)setDismissCompletionHandler:(id)a3;
- (void)setForcePicker:(BOOL)a3;
- (void)setPlayers:(id)a3;
- (void)setReceivedRemoteHandler:(id)a3;
- (void)setRemoteViewController:(id)a3;
@end

@implementation GKHostedChallengeIssueController

+ (id)hostedIssueControllerWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  v26 = (id *)&v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  id v30 = 0;
  v13 = [GKHostedChallengeIssueController alloc];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __112__GKHostedChallengeIssueController_hostedIssueControllerWithChallenge_players_defaultMessage_completionHandler___block_invoke;
  v22 = &unk_1E5F66080;
  id v14 = v12;
  id v23 = v14;
  v24 = &v25;
  v15 = [(GKHostedChallengeIssueController *)v13 initWithChallenge:v9 players:v10 defaultMessage:v11 completionHandler:&v19];
  objc_storeStrong(v26 + 5, v15);
  -[GKHostedChallengeIssueController setForcePicker:](v15, "setForcePicker:", 1, v19, v20, v21, v22);
  v16 = v23;
  v17 = v15;

  _Block_object_dispose(&v25, 8);

  return v17;
}

void __112__GKHostedChallengeIssueController_hostedIssueControllerWithChallenge_players_defaultMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 count];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, BOOL, id))(v4 + 16))(v4, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3 != 0, v5);
  }
}

- (GKHostedChallengeIssueController)initWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)GKHostedChallengeIssueController;
  id v14 = [(GKHostedChallengeIssueController *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(GKHostedChallengeIssueController *)v14 setPlayers:v11];
    [(GKHostedChallengeIssueController *)v15 setChallenge:v10];
    [(GKHostedChallengeIssueController *)v15 setDefaultMessage:v12];
    [(GKHostedChallengeIssueController *)v15 setCompletionHandler:v13];
    [(GKHostedChallengeIssueController *)v15 _setupChildViewController];
  }

  return v15;
}

- (void)dealloc
{
  [(GKExtensionRemoteViewController *)self->_remoteViewController cancelExtension];
  [(GKHostedChallengeIssueController *)self setDismissCompletionHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)GKHostedChallengeIssueController;
  [(GKHostedChallengeIssueController *)&v3 dealloc];
}

- (void)_setupChildViewController
{
  objc_super v3 = [(GKHostedChallengeIssueController *)self view];
  [v3 setAlpha:1.0];

  [(GKHostedChallengeIssueController *)self setWantsFullScreenLayout:1];
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    [(GKHostedChallengeIssueController *)self setModalPresentationStyle:16];
    v6 = [MEMORY[0x1E4F63A10] sharedTheme];
    [v6 formSheetSize];
    -[GKHostedChallengeIssueController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
  else
  {
    [(GKHostedChallengeIssueController *)self setModalPresentationStyle:17];
  }
  if (!self->_remoteViewController)
  {
    [(GKHostedChallengeIssueController *)self _setupRemoteViewController];
  }
}

+ (id)presentationQueue
{
  if (presentationQueue_onceToken != -1) {
    dispatch_once(&presentationQueue_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)presentationQueue_sResult;

  return v2;
}

void __53__GKHostedChallengeIssueController_presentationQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.gamecenter.gkmodalchallangeissueviewcontroller", v2);
  v1 = (void *)presentationQueue_sResult;
  presentationQueue_sResult = (uint64_t)v0;
}

+ (void)presentHostedIssueControllerWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 presentationQueue];
  v15 = v8;
  v16 = v9;
  objc_super v17 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  gk_dispatch_async_do();
}

void __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_2;
  v5[3] = &unk_1E5F63FF0;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB20F8]);
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v4 = [v3 keyWindow];

  uint64_t v5 = [v4 rootViewController];
  id v6 = [v4 rootViewController];

  if (v6)
  {
    id v7 = [v4 rootViewController];
    id v8 = [v7 view];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v5 view];
    }
    else
    {
      id v8 = 0;
    }
  }
  [v2 setRotationDecider:v4];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_3;
  v19[3] = &unk_1E5F660A8;
  id v12 = v2;
  id v20 = v12;
  id v21 = *(id *)(a1 + 56);
  id v13 = +[GKHostedChallengeIssueController hostedIssueControllerWithChallenge:v9 players:v10 defaultMessage:v11 completionHandler:v19];
  [v13 setForcePicker:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_5;
  v16[3] = &unk_1E5F660D0;
  id v17 = v12;
  id v18 = v8;
  id v14 = v8;
  id v15 = v12;
  [v13 setReceivedRemoteHandler:v16];
}

void __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_4;
  v6[3] = &unk_1E5F63E30;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 dismissViewControllerAnimated:1 completion:v6];
}

void __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_4(uint64_t a1)
{
  id v4 = *(id *)(a1 + 32);
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v4 dismissCompletionHandler];

    if (v2)
    {
      id v3 = [v4 dismissCompletionHandler];
      v3[2]();

      [v4 setDismissCompletionHandler:0];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentViewController:a2 sendingView:*(void *)(a1 + 40) animated:1];
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (void)doneWithPlayers:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_completionHandler)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__GKHostedChallengeIssueController_doneWithPlayers_message___block_invoke;
    block[3] = &unk_1E5F63E80;
    block[4] = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __60__GKHostedChallengeIssueController_doneWithPlayers_message___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 1016) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 setCompletionHandler:0];
}

- (void)_setupRemoteViewController
{
  id v3 = +[GKChallengeIssueHostViewController challengeExtension];
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:v3 withParentViewController:self];
    [(GKHostedChallengeIssueController *)self _beginDelayingPresentation:&__block_literal_global_18 cancellationHandler:5.0];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke_19;
    v4[3] = &unk_1E5F64330;
    objc_copyWeak(&v5, &location);
    v4[4] = self;
    +[GKExtensionRemoteViewController viewControllerForExtension:v3 inputItems:0 completionHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

uint64_t __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    id v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke_cold_1(v4);
    }
  }
  return a2 ^ 1u;
}

void __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v5 = a3;
  id v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v26)
  {
    id v8 = v26;
    id v9 = objc_loadWeakRetained(v6);
    [v9 setRemoteViewController:v8];

    id v10 = objc_loadWeakRetained(v6);
    uint64_t v11 = [v10 remoteViewController];
    [v11 setDelegate:WeakRetained];

    [WeakRetained addChildViewController:v8];
    id v12 = [WeakRetained view];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    id v21 = [v8 view];
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    v22 = [WeakRetained view];
    id v23 = [v8 view];
    [v22 addSubview:v23];

    [v8 didMoveToParentViewController:WeakRetained];
    v24 = [WeakRetained receivedRemoteHandler];

    if (v24)
    {
      uint64_t v25 = [WeakRetained receivedRemoteHandler];
      ((void (**)(void, id))v25)[2](v25, v8);
    }
  }
  else
  {
    [*(id *)(a1 + 32) extensionDidFinishWithError:v5];
  }
}

- (void)setRemoteViewController:(id)a3
{
  id v5 = (GKChallengeIssueHostViewController *)a3;
  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    id v6 = (void *)MEMORY[0x1E4F1CA60];
    id v7 = +[GKExtensionRemoteViewController initialItemsForExtension];
    id v8 = [v6 dictionaryWithDictionary:v7];

    id v9 = [(GKHostedChallengeIssueController *)self players];
    id v10 = [v9 _gkMapWithBlock:&__block_literal_global_24_0];

    [v8 setObject:v10 forKeyedSubscript:@"PlayerInternalsKey"];
    uint64_t v11 = [NSNumber numberWithBool:self->_forcePicker];
    [v8 setObject:v11 forKeyedSubscript:@"ForcePickerKey"];

    defaultMessage = self->_defaultMessage;
    if (defaultMessage) {
      [v8 setObject:defaultMessage forKeyedSubscript:@"MessageKey"];
    }
    challenge = self->_challenge;
    if (challenge)
    {
      double v14 = [(GKChallenge *)challenge internal];
      [v8 setObject:v14 forKeyedSubscript:@"ChallengeKey"];
    }
    objc_initWeak(&location, self);
    remoteViewController = self->_remoteViewController;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke_2;
    v16[3] = &unk_1E5F64358;
    objc_copyWeak(&v17, &location);
    [(GKExtensionRemoteViewController *)remoteViewController setInitialState:v8 withReply:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 internal];
}

void __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke_3;
  block[3] = &unk_1E5F634E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _endDelayingPresentation];
    id WeakRetained = v2;
  }
}

- (void)extensionDidFinishWithError:(id)a3
{
  id v4 = [(GKHostedChallengeIssueController *)self completionHandler];

  if (v4)
  {
    id v5 = [(GKHostedChallengeIssueController *)self completionHandler];
    v5[2](v5, 0, 0);

    [(GKHostedChallengeIssueController *)self setCompletionHandler:0];
  }
  [(GKChallengeIssueHostViewController *)self->_remoteViewController willMoveToParentViewController:0];
  id v6 = [(GKChallengeIssueHostViewController *)self->_remoteViewController view];
  [v6 removeFromSuperview];

  [(GKChallengeIssueHostViewController *)self->_remoteViewController removeFromParentViewController];

  [(GKHostedChallengeIssueController *)self setRemoteViewController:0];
}

- (GKChallengeIssueHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (NSString)defaultMessage
{
  return self->_defaultMessage;
}

- (void)setDefaultMessage:(id)a3
{
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (BOOL)forcePicker
{
  return self->_forcePicker;
}

- (void)setForcePicker:(BOOL)a3
{
  self->_forcePicker = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)receivedRemoteHandler
{
  return self->_receivedRemoteHandler;
}

- (void)setReceivedRemoteHandler:(id)a3
{
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong(&self->_receivedRemoteHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_defaultMessage, 0);
  objc_storeStrong((id *)&self->_players, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "We failed to present challenge issue extension.", v1, 2u);
}

@end