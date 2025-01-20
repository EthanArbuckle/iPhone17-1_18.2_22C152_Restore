@interface GKChallengeIssueHostViewController
+ (id)challengeExtension;
- (GKHostedChallengeIssueController)delegate;
- (id)extensionObjectProxy;
- (void)extensionIsCanceling;
- (void)messageFromExtension:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation GKChallengeIssueHostViewController

+ (id)challengeExtension
{
  if (challengeExtension_onceToken != -1) {
    dispatch_once(&challengeExtension_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)challengeExtension_extension;

  return v2;
}

void __56__GKChallengeIssueHostViewController_challengeExtension__block_invoke()
{
  id v5 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28C70] _gkExtensionWithIdentifier:@"com.apple.GameCenterUI.GameCenterChallengeIssueExtension" error:&v5];
  id v1 = v5;
  v2 = (void *)challengeExtension_extension;
  challengeExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __56__GKChallengeIssueHostViewController_challengeExtension__block_invoke_cold_1((uint64_t)v1, v4);
    }
  }
}

- (void)messageFromExtension:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  v6 = GKExtensionProtocolSecureCodedClasses();
  id v19 = 0;
  v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v19];
  id v8 = v19;

  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v9 = (id)GKOSLoggers();
    }
    v10 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKChallengeIssueHostViewController messageFromExtension:]((uint64_t)v8, v10);
    }
  }
  v11 = [v7 objectForKeyedSubscript:@"MessageCommandKey"];
  uint64_t v12 = [v11 integerValue];

  if (v12 == 45)
  {
    v13 = [v7 objectForKeyedSubscript:@"PlayerList"];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 _gkMapWithBlock:&__block_literal_global_4];
    }
    else
    {
      v15 = 0;
    }
    v16 = [v7 objectForKeyedSubscript:@"ChallengeMessage"];
    v17 = [(GKChallengeIssueHostViewController *)self delegate];
    [v17 doneWithPlayers:v15 message:v16];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)GKChallengeIssueHostViewController;
    [(GKExtensionRemoteViewController *)&v18 messageFromExtension:v4];
  }
}

id __59__GKChallengeIssueHostViewController_messageFromExtension___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F63788];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithInternalRepresentation:v3];

  return v4;
}

- (void)extensionIsCanceling
{
  id v2 = [(GKChallengeIssueHostViewController *)self delegate];
  [v2 doneWithPlayers:0 message:0];
}

- (id)extensionObjectProxy
{
  id v3 = [(GKExtensionRemoteViewController *)self extension];
  id v4 = [(GKExtensionRemoteViewController *)self requestIdentifier];
  id v5 = [v3 _extensionContextForUUID:v4];

  v6 = [v5 _auxiliaryConnection];
  v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_8_0];

  return v7;
}

void __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke_cold_1(v4, v2);
  }
}

- (GKHostedChallengeIssueController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateWeak);

  return (GKHostedChallengeIssueController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __56__GKChallengeIssueHostViewController_challengeExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "Error loading Game Center challenge issue extension, %@", (uint8_t *)&v2, 0xCu);
}

- (void)messageFromExtension:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromExtension in GKChallengeIssueHostViewController:%@", (uint8_t *)&v2, 0xCu);
}

void __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1AF250000, v3, OS_LOG_TYPE_DEBUG, "error calling extension - %@", (uint8_t *)&v5, 0xCu);
}

@end