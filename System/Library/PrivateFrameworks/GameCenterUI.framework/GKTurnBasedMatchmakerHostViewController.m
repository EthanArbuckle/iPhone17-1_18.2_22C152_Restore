@interface GKTurnBasedMatchmakerHostViewController
+ (BOOL)dismissAutomaticallyAfterExtensionCompletion;
+ (id)turnBasedMatchmakerExtension;
- (GKTurnBasedMatchmakerViewController)delegate;
- (id)extensionObjectProxy;
- (void)extensionIsCanceling;
- (void)messageFromExtension:(id)a3;
- (void)refreshMatches;
- (void)setDelegate:(id)a3;
- (void)setMatchRequestInternal:(id)a3;
- (void)setShowExistingMatches:(BOOL)a3;
- (void)setShowPlay:(BOOL)a3;
- (void)setShowQuit:(BOOL)a3;
@end

@implementation GKTurnBasedMatchmakerHostViewController

+ (id)turnBasedMatchmakerExtension
{
  if (turnBasedMatchmakerExtension_onceToken != -1) {
    dispatch_once(&turnBasedMatchmakerExtension_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)turnBasedMatchmakerExtension_extension;

  return v2;
}

void __71__GKTurnBasedMatchmakerHostViewController_turnBasedMatchmakerExtension__block_invoke()
{
  id v5 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28C70] _gkExtensionWithIdentifier:@"com.apple.GameCenterUI.GameCenterTurnBasedMatchmakerExtension" error:&v5];
  id v1 = v5;
  v2 = (void *)turnBasedMatchmakerExtension_extension;
  turnBasedMatchmakerExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __71__GKTurnBasedMatchmakerHostViewController_turnBasedMatchmakerExtension__block_invoke_cold_1((uint64_t)v1, v4);
    }
  }
}

+ (BOOL)dismissAutomaticallyAfterExtensionCompletion
{
  return 0;
}

- (id)extensionObjectProxy
{
  id v3 = [(GKExtensionRemoteViewController *)self extension];
  v4 = [(GKExtensionRemoteViewController *)self requestIdentifier];
  id v5 = [v3 _extensionContextForUUID:v4];

  v6 = [v5 _auxiliaryConnection];
  v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_3];

  return v7;
}

void __63__GKTurnBasedMatchmakerHostViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke_cold_1(v4, v2);
  }
}

- (void)setMatchRequestInternal:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7[0] = @"MessageCommandKey";
    v7[1] = @"MessageParamKey";
    v8[0] = &unk_1F08120F0;
    v8[1] = a3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

    [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
  }
}

- (void)setShowExistingMatches:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812108;
  v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)setShowPlay:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812120;
  v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)setShowQuit:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812138;
  v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)refreshMatches
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"MessageCommandKey";
  v5[0] = &unk_1F0812150;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v3];
}

- (void)messageFromExtension:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  v6 = GKExtensionProtocolSecureCodedClasses();
  id v18 = 0;
  v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v18];
  id v8 = v18;

  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v9 = (id)GKOSLoggers();
    }
    v10 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKTurnBasedMatchmakerHostViewController messageFromExtension:]((uint64_t)v8, v10);
    }
  }
  v11 = [v7 objectForKeyedSubscript:@"MessageCommandKey"];
  uint64_t v12 = [v11 integerValue];

  v13 = [v7 objectForKeyedSubscript:@"MessageParamKey"];
  if (v12 == 19)
  {
    v16 = [(GKTurnBasedMatchmakerHostViewController *)self delegate];
    [v16 finishWithError:v13];
  }
  else
  {
    if (v12 == 11)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F63818]) initWithInternalRepresentation:v13];
      v15 = [(GKTurnBasedMatchmakerHostViewController *)self delegate];
      [v15 playerQuitMatch:v14];
    }
    else
    {
      if (v12 != 10)
      {
        v17.receiver = self;
        v17.super_class = (Class)GKTurnBasedMatchmakerHostViewController;
        [(GKExtensionRemoteViewController *)&v17 messageFromExtension:v4];
        goto LABEL_14;
      }
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F63818]) initWithInternalRepresentation:v13];
      v15 = [(GKTurnBasedMatchmakerHostViewController *)self delegate];
      [v15 finishWithMatch:v14];
    }
  }
LABEL_14:
}

- (void)extensionIsCanceling
{
  id v2 = [(GKTurnBasedMatchmakerHostViewController *)self delegate];
  [v2 cancel];
}

- (GKTurnBasedMatchmakerViewController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKTurnBasedMatchmakerViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __71__GKTurnBasedMatchmakerHostViewController_turnBasedMatchmakerExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "Error loading Game Center turn based matchmaker extension, %@", (uint8_t *)&v2, 0xCu);
}

- (void)messageFromExtension:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromExtension archive in GKTurnBasedMatchmakerHostViewController:%@", (uint8_t *)&v2, 0xCu);
}

@end