@interface GKDashboardHostViewController
+ (BOOL)dismissAutomaticallyAfterExtensionCompletion;
+ (id)dashboardExtension;
- (GKDashboardHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (GKGameCenterViewController)delegate;
- (NSObject)dashboardAssetController;
- (id)extensionObjectProxy;
- (void)extensionIsCanceling;
- (void)extensionIsFinishing;
- (void)finishWithMatch:(id)a3;
- (void)hostDidChangeLeaderboardIdentifier:(id)a3;
- (void)hostDidChangeLeaderboardPlayerScope:(id)a3;
- (void)hostDidChangeLeaderboardTimeScope:(id)a3;
- (void)hostDidChangeViewState:(id)a3;
- (void)hostSupportsShowingPlayForChallenge:(BOOL)a3;
- (void)hostSupportsShowingPlayForTurnBasedMatch:(BOOL)a3;
- (void)hostSupportsShowingQuitForTurnBasedMatch:(BOOL)a3;
- (void)messageFromExtension:(id)a3;
- (void)playPressedForChallenge:(id)a3;
- (void)playerQuitMatch:(id)a3;
- (void)setDashboardAssetController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKDashboardHostViewController

+ (id)dashboardExtension
{
  if (dashboardExtension_onceToken != -1) {
    dispatch_once(&dashboardExtension_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)dashboardExtension_extension;

  return v2;
}

void __51__GKDashboardHostViewController_dashboardExtension__block_invoke()
{
  id v5 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28C70] _gkExtensionWithIdentifier:@"com.apple.GameCenterUI.GameCenterDashboardExtension" error:&v5];
  id v1 = v5;
  v2 = (void *)dashboardExtension_extension;
  dashboardExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __51__GKDashboardHostViewController_dashboardExtension__block_invoke_cold_1((uint64_t)v1, v4);
    }
  }
}

- (GKDashboardHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardHostViewController;
  v4 = [(GKDashboardHostViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    dashboardAssetController = v4->_dashboardAssetController;
    v4->_dashboardAssetController = v5;
  }
  return v4;
}

+ (BOOL)dismissAutomaticallyAfterExtensionCompletion
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F63760] local];
  [v5 hideAccessPoint];

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardHostViewController;
  [(GKExtensionRemoteViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardHostViewController;
  [(GKExtensionRemoteViewController *)&v4 viewDidDisappear:a3];
  BOOL v3 = [MEMORY[0x1E4F63760] local];
  [v3 showAccessPoint];
}

- (id)extensionObjectProxy
{
  BOOL v3 = [(GKExtensionRemoteViewController *)self extension];
  objc_super v4 = [(GKExtensionRemoteViewController *)self requestIdentifier];
  id v5 = [v3 _extensionContextForUUID:v4];

  objc_super v6 = [v5 _auxiliaryConnection];
  v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_9_0];

  return v7;
}

void __53__GKDashboardHostViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  objc_super v4 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke_cold_1(v4, v2);
  }
}

- (void)hostDidChangeViewState:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MessageCommandKey";
  v7[1] = @"MessageParamKey";
  v8[0] = &unk_1F0811FE8;
  v8[1] = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  objc_super v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
}

- (void)hostDidChangeLeaderboardIdentifier:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MessageCommandKey";
  v7[1] = @"MessageParamKey";
  v8[0] = &unk_1F0812000;
  v8[1] = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  objc_super v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
}

- (void)hostDidChangeLeaderboardTimeScope:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MessageCommandKey";
  v7[1] = @"MessageParamKey";
  v8[0] = &unk_1F0812018;
  v8[1] = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  objc_super v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
}

- (void)hostDidChangeLeaderboardPlayerScope:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MessageCommandKey";
  v7[1] = @"MessageParamKey";
  v8[0] = &unk_1F0812030;
  v8[1] = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  objc_super v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
}

- (void)hostSupportsShowingPlayForChallenge:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812048;
  objc_super v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)hostSupportsShowingPlayForTurnBasedMatch:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812060;
  objc_super v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)hostSupportsShowingQuitForTurnBasedMatch:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812078;
  objc_super v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)messageFromExtension:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  objc_super v6 = GKExtensionProtocolSecureCodedClasses();
  id v16 = 0;
  v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v16];
  id v8 = v16;

  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v9 = (id)GKOSLoggers();
    }
    v10 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKDashboardHostViewController messageFromExtension:]((uint64_t)v8, v10);
    }
  }
  v11 = [v7 objectForKeyedSubscript:@"MessageCommandKey"];
  uint64_t v12 = [v11 integerValue];

  v13 = [v7 objectForKeyedSubscript:@"MessageParamKey"];
  switch(v12)
  {
    case 5:
      v14 = [(GKDashboardHostViewController *)self delegate];
      objc_msgSend(v14, "setViewStateFromExtension:", objc_msgSend(v13, "integerValue"));
      goto LABEL_13;
    case 6:
      v14 = [(GKDashboardHostViewController *)self delegate];
      [v14 setLeaderboardIdentifierFromExtension:v13];
      goto LABEL_13;
    case 7:
      v14 = [(GKDashboardHostViewController *)self delegate];
      objc_msgSend(v14, "setLeaderboardTimeScopeFromExtension:", objc_msgSend(v13, "integerValue"));
      goto LABEL_13;
    case 8:
      [(GKDashboardHostViewController *)self playPressedForChallenge:v13];
      goto LABEL_17;
    case 9:
      goto LABEL_10;
    case 10:
      [(GKDashboardHostViewController *)self finishWithMatch:v13];
      goto LABEL_17;
    case 11:
      [(GKDashboardHostViewController *)self playerQuitMatch:v13];
      goto LABEL_17;
    default:
      if (v12 == 50)
      {
        v14 = [(GKDashboardHostViewController *)self delegate];
        objc_msgSend(v14, "setLeaderboardPlayerScopeFromExtension:", objc_msgSend(v13, "integerValue"));
LABEL_13:
      }
      else
      {
LABEL_10:
        v15.receiver = self;
        v15.super_class = (Class)GKDashboardHostViewController;
        [(GKExtensionRemoteViewController *)&v15 messageFromExtension:v4];
      }
LABEL_17:

      return;
  }
}

- (void)playPressedForChallenge:(id)a3
{
  id v7 = [MEMORY[0x1E4F636A8] challengeForInternalRepresentation:a3];
  id v3 = [MEMORY[0x1E4F636B0] challengeEventHandler];
  id v4 = [v3 delegate];

  if (objc_opt_respondsToSelector()) {
    [v4 localPlayerDidSelectChallenge:v7];
  }
  id v5 = [MEMORY[0x1E4F63760] localPlayer];
  objc_super v6 = [v5 eventEmitter];
  [v6 player:v5 wantsToPlayChallenge:v7];
}

- (void)finishWithMatch:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F63760];
  id v4 = a3;
  id v7 = [v3 localPlayer];
  id v5 = [v7 eventEmitter];
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F63818]) initWithInternalRepresentation:v4];

  [v5 player:v7 receivedTurnEventForMatch:v6 didBecomeActive:1];
}

- (void)playerQuitMatch:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F63760];
  id v4 = a3;
  id v7 = [v3 localPlayer];
  id v5 = [v7 eventEmitter];
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F63818]) initWithInternalRepresentation:v4];

  [v5 player:v7 wantsToQuitMatch:v6];
}

- (void)extensionIsCanceling
{
  id v3 = [(GKDashboardHostViewController *)self delegate];
  [v3 notifyDelegateOnWillFinish];

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardHostViewController;
  [(GKExtensionRemoteViewController *)&v4 extensionIsCanceling];
}

- (void)extensionIsFinishing
{
  id v3 = [(GKDashboardHostViewController *)self delegate];
  [v3 notifyDelegateOnWillFinish];

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardHostViewController;
  [(GKExtensionRemoteViewController *)&v4 extensionIsFinishing];
}

- (GKGameCenterViewController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateWeak);

  return (GKGameCenterViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSObject)dashboardAssetController
{
  return self->_dashboardAssetController;
}

- (void)setDashboardAssetController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashboardAssetController, 0);

  objc_destroyWeak((id *)&self->_delegateWeak);
}

void __51__GKDashboardHostViewController_dashboardExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "Error loading Game Center dashboard extension, %@", (uint8_t *)&v2, 0xCu);
}

- (void)messageFromExtension:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromExtension in GKDashboardHostViewController:%@", (uint8_t *)&v2, 0xCu);
}

@end