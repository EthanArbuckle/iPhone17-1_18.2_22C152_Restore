@interface GKMatchmakerHostViewController
+ (BOOL)dismissAutomaticallyAfterExtensionCompletion;
+ (id)matchmakerExtension;
- (GKMatchmakerViewController)delegate;
- (id)extensionObjectProxy;
- (void)applicationWillEnterForeground;
- (void)extensionIsCanceling;
- (void)extensionIsFinishing;
- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5;
- (void)inviterCancelled;
- (void)messageFromExtension:(id)a3;
- (void)recipientPropertiesProvided:(id)a3 forPlayer:(id)a4;
- (void)setAcceptedInviteInternal:(id)a3;
- (void)setAutomatchFailedWithError:(id)a3;
- (void)setAutomatchPlayerCount:(int64_t)a3;
- (void)setCanStartWithMinimumPlayers:(BOOL)a3;
- (void)setConnectingStateForPlayer:(id)a3;
- (void)setDefaultInvitationMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEligibilityForGroupSession:(BOOL)a3;
- (void)setExistingPlayers:(id)a3;
- (void)setFailedWithError:(id)a3;
- (void)setHosted:(BOOL)a3;
- (void)setInvitesFailedWithError:(id)a3;
- (void)setMatchRequestInternal:(id)a3;
- (void)setMatchmakingMode:(int64_t)a3;
- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4;
- (void)setPlayer:(id)a3 connected:(BOOL)a4;
- (void)setPlayer:(id)a3 responded:(int64_t)a4;
- (void)setPlayer:(id)a3 sentData:(id)a4;
- (void)setSharePlaySharingControllerResult:(BOOL)a3;
- (void)shareMatchWithRequest:(id)a3 handler:(id)a4;
@end

@implementation GKMatchmakerHostViewController

+ (id)matchmakerExtension
{
  if (matchmakerExtension_onceToken != -1) {
    dispatch_once(&matchmakerExtension_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)matchmakerExtension_extension;

  return v2;
}

void __53__GKMatchmakerHostViewController_matchmakerExtension__block_invoke()
{
  id v5 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28C70] _gkExtensionWithIdentifier:@"com.apple.GameCenterUI.GameCenterMatchmakerExtension" error:&v5];
  id v1 = v5;
  v2 = (void *)matchmakerExtension_extension;
  matchmakerExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63870];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
      __53__GKMatchmakerHostViewController_matchmakerExtension__block_invoke_cold_1((uint64_t)v1, v4);
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
  v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_3_0];

  return v7;
}

void __54__GKMatchmakerHostViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
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
    v8[0] = &unk_1F08122B8;
    v8[1] = a3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

    [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
  }
}

- (void)setAcceptedInviteInternal:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7[0] = @"MessageCommandKey";
    v7[1] = @"MessageParamKey";
    v8[0] = &unk_1F08122D0;
    v8[1] = a3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

    [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
  }
}

- (void)setHosted:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F08122E8;
  v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)setMatchmakingMode:(int64_t)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812300;
  v4 = [NSNumber numberWithInteger:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)setCanStartWithMinimumPlayers:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812318;
  v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)setEligibilityForGroupSession:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812330;
  v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)setSharePlaySharingControllerResult:(BOOL)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812348;
  v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)setExistingPlayers:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MessageCommandKey";
  v7[1] = @"MessageParamKey";
  v8[0] = &unk_1F0812360;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
}

- (void)setDefaultInvitationMessage:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MessageCommandKey";
  v7[1] = @"MessageParamKey";
  v8[0] = &unk_1F0812378;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"MessageCommandKey";
  v6[1] = @"MessageParamKey";
  v7[0] = &unk_1F0812390;
  v4 = [NSNumber numberWithInteger:a3];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v5];
}

- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v16[0] = @"MessageCommandKey";
  v16[1] = @"PlayerInternal";
  v17[0] = &unk_1F08123A8;
  v17[1] = a3;
  v16[2] = @"MessageParamKey";
  v14[0] = @"pushToken";
  v14[1] = @"participantIdentifier";
  v15[0] = a4;
  v15[1] = a5;
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v13];
}

- (void)setPlayer:(id)a3 responded:(int64_t)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"MessageCommandKey";
  v10[1] = @"PlayerInternal";
  v11[0] = &unk_1F08123C0;
  v11[1] = a3;
  v10[2] = @"MessageParamKey";
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithInteger:a4];
  v11[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v9];
}

- (void)setConnectingStateForPlayer:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MessageCommandKey";
  v7[1] = @"PlayerInternal";
  v8[0] = &unk_1F08123D8;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v6];
}

- (void)setPlayer:(id)a3 connected:(BOOL)a4
{
  BOOL v4 = a4;
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"MessageCommandKey";
  v10[1] = @"PlayerInternal";
  v11[0] = &unk_1F08123F0;
  v11[1] = a3;
  v10[2] = @"MessageParamKey";
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithBool:v4];
  v11[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v9];
}

- (void)setPlayer:(id)a3 sentData:(id)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"MessageCommandKey";
  v10[1] = @"PlayerInternal";
  v11[0] = &unk_1F0812408;
  v11[1] = a3;
  v10[2] = @"MessageParamKey";
  v11[2] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v11 forKeys:v10 count:3];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v9];
}

- (void)setInvitesFailedWithError:(id)a3
{
  id v5 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", &unk_1F0812420, @"MessageCommandKey", 0);
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"MessageParamKey"];
  }
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v4];
}

- (void)setAutomatchFailedWithError:(id)a3
{
  id v5 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", &unk_1F0812438, @"MessageCommandKey", 0);
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"MessageParamKey"];
  }
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v4];
}

- (void)setFailedWithError:(id)a3
{
  id v5 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", &unk_1F0812450, @"MessageCommandKey", 0);
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"MessageParamKey"];
  }
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v4];
}

- (void)inviterCancelled
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"MessageCommandKey";
  v5[0] = &unk_1F0812468;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v3];
}

- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4
{
  BOOL v4 = a4;
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"MessageCommandKey";
  v10[1] = @"PlayerID";
  v11[0] = &unk_1F0812480;
  v11[1] = a3;
  v10[2] = @"MessageParamKey";
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  v11[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v9];
}

- (void)applicationWillEnterForeground
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"MessageCommandKey";
  v5[0] = &unk_1F0812498;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v3];
}

- (void)recipientPropertiesProvided:(id)a3 forPlayer:(id)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"MessageCommandKey";
  v10[1] = @"MessageParamKey";
  v11[0] = &unk_1F08124B0;
  v11[1] = a3;
  v10[2] = @"PlayerInternal";
  v11[2] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v11 forKeys:v10 count:3];

  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v9];
}

- (void)messageFromExtension:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  v6 = GKExtensionProtocolSecureCodedClasses();
  id v22 = 0;
  id v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v22];
  id v8 = v22;

  id v9 = (void *)MEMORY[0x1E4F63860];
  id v10 = (os_log_t *)MEMORY[0x1E4F63870];
  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v11 = (id)GKOSLoggers();
    }
    v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
      -[GKMatchmakerHostViewController messageFromExtension:]((uint64_t)v8, v12);
    }
  }
  v13 = [v7 objectForKeyedSubscript:@"MessageCommandKey"];
  uint64_t v14 = [v13 integerValue];

  v15 = [v7 objectForKeyedSubscript:@"MessageParamKey"];
  if (!*v9) {
    id v16 = (id)GKOSLoggers();
  }
  v17 = *v10;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v7;
    _os_log_impl(&dword_1AF250000, v17, OS_LOG_TYPE_INFO, "Got message from extension: %@", buf, 0xCu);
  }
  switch(v14)
  {
    case '5':
      v18 = [(GKMatchmakerHostViewController *)self delegate];
      v19 = [v15 objectForKeyedSubscript:@"request"];
      v20 = [v15 objectForKeyedSubscript:@"pushToken"];
      [v18 startMatchingWithRequest:v19 devicePushToken:v20];

      goto LABEL_20;
    case '6':
      v18 = [(GKMatchmakerHostViewController *)self delegate];
      [v18 activateGroupActivities];
      break;
    case '7':
      v18 = [(GKMatchmakerHostViewController *)self delegate];
      [v18 endGroupActivities];
      break;
    case '8':
    case ':':
    case '=':
    case '>':
LABEL_22:
      v21.receiver = self;
      v21.super_class = (Class)GKMatchmakerHostViewController;
      [(GKExtensionRemoteViewController *)&v21 messageFromExtension:v4];
      goto LABEL_30;
    case '9':
      v18 = [(GKMatchmakerHostViewController *)self delegate];
      [v18 presentSharePlaySharingController];
      break;
    case ';':
      v18 = [(GKMatchmakerHostViewController *)self delegate];
      [v18 disconnectFromMatch];
      break;
    case '<':
      v18 = [(GKMatchmakerHostViewController *)self delegate];
      [v18 recipientPropertiesNeededForPlayer:v15];
      break;
    case '?':
      v18 = [(GKMatchmakerHostViewController *)self delegate];
      v19 = [v15 objectForKeyedSubscript:@"players"];
      [v18 playerPickerDidPickPlayers:v19];
LABEL_20:

      break;
    case '@':
      v18 = [(GKMatchmakerHostViewController *)self delegate];
      [v18 playerPickerDidCancel];
      break;
    default:
      switch(v14)
      {
        case 19:
          v18 = [(GKMatchmakerHostViewController *)self delegate];
          [v18 finishWithError:v15];
          goto LABEL_29;
        case 21:
          v18 = [(GKMatchmakerHostViewController *)self delegate];
          [v18 setShareInvitees:v15];
          goto LABEL_29;
        case 22:
          v18 = [(GKMatchmakerHostViewController *)self delegate];
          [v18 startMatchingWithRequest:v15 devicePushToken:0];
          goto LABEL_29;
        case 23:
          v18 = [(GKMatchmakerHostViewController *)self delegate];
          [v18 cancelPendingInviteToPlayer:v15];
          goto LABEL_29;
        case 24:
          v18 = [(GKMatchmakerHostViewController *)self delegate];
          [v18 sendData:v15];
          goto LABEL_29;
        case 25:
          v18 = [(GKMatchmakerHostViewController *)self delegate];
          [v18 cancelMatching];
          goto LABEL_29;
        case 26:
          v18 = [(GKMatchmakerHostViewController *)self delegate];
          objc_msgSend(v18, "setBrowsingForNearbyPlayers:", objc_msgSend(v15, "BOOLValue"));
          goto LABEL_29;
        default:
          goto LABEL_22;
      }
  }
LABEL_29:

LABEL_30:
}

- (void)shareMatchWithRequest:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMatchmakerHostViewController *)self delegate];
  [v8 shareMatchWithRequest:v7 handler:v6];
}

- (void)extensionIsCanceling
{
  id v2 = [(GKMatchmakerHostViewController *)self delegate];
  [v2 cancel];
}

- (void)extensionIsFinishing
{
  id v2 = [(GKMatchmakerHostViewController *)self delegate];
  [v2 cancel];
}

- (GKMatchmakerViewController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKMatchmakerViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __53__GKMatchmakerHostViewController_matchmakerExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "Error loading Game Center matchmaker extension, %@", (uint8_t *)&v2, 0xCu);
}

- (void)messageFromExtension:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromExtension archive in GKMatchmakerHostViewController:%@", (uint8_t *)&v2, 0xCu);
}

@end