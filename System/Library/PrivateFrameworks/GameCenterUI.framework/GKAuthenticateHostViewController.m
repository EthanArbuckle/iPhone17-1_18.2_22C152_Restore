@interface GKAuthenticateHostViewController
+ (BOOL)dismissAutomaticallyAfterExtensionCompletion;
+ (id)authenticateExtension;
- (GKHostedAuthenticateViewController)delegate;
- (void)applicationWillTerminate:(id)a3;
- (void)extensionIsCanceling;
- (void)extensionIsFinishing;
- (void)messageFromExtension:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation GKAuthenticateHostViewController

+ (id)authenticateExtension
{
  if (authenticateExtension_onceToken != -1) {
    dispatch_once(&authenticateExtension_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)authenticateExtension_extension;

  return v2;
}

void __57__GKAuthenticateHostViewController_authenticateExtension__block_invoke()
{
  id v5 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28C70] _gkExtensionWithIdentifier:@"com.apple.GameCenterUI.GameCenterAuthenticateExtension" error:&v5];
  id v1 = v5;
  v2 = (void *)authenticateExtension_extension;
  authenticateExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __57__GKAuthenticateHostViewController_authenticateExtension__block_invoke_cold_1((uint64_t)v1, v4);
    }
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)GKAuthenticateHostViewController;
  [(GKExtensionRemoteViewController *)&v5 viewDidLoad];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [MEMORY[0x1E4F63690] willTerminate];
  [v3 addObserver:self selector:sel_applicationWillTerminate_ name:v4 object:0];
}

+ (BOOL)dismissAutomaticallyAfterExtensionCompletion
{
  return 0;
}

- (void)messageFromExtension:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F28DC0];
  v6 = GKExtensionProtocolSecureCodedClasses();
  id v15 = 0;
  v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v15];
  id v8 = v15;

  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v9 = (id)GKOSLoggers();
    }
    v10 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKAuthenticateHostViewController messageFromExtension:]((uint64_t)v8, v10);
    }
  }
  v11 = [v7 objectForKeyedSubscript:@"MessageCommandKey"];
  uint64_t v12 = [v11 integerValue];

  if (v12 == 46)
  {
    v13 = [(GKAuthenticateHostViewController *)self delegate];
    [v13 onboardingFlowDidSignOut];
  }
  else
  {
    if (v12 != 44)
    {
      v14.receiver = self;
      v14.super_class = (Class)GKAuthenticateHostViewController;
      [(GKExtensionRemoteViewController *)&v14 messageFromExtension:v4];
      goto LABEL_12;
    }
    v13 = [(GKAuthenticateHostViewController *)self delegate];
    [v13 setRotationLocked:0];
  }

LABEL_12:
}

- (void)extensionIsFinishing
{
  id v3 = [(GKAuthenticateHostViewController *)self delegate];
  [v3 dismissViewControllerAnimated:1 completion:0];

  v4.receiver = self;
  v4.super_class = (Class)GKAuthenticateHostViewController;
  [(GKExtensionRemoteViewController *)&v4 extensionIsFinishing];
}

- (void)extensionIsCanceling
{
  id v3 = [MEMORY[0x1E4F28C58] userErrorForCode:2 underlyingError:0];
  objc_super v4 = [(GKAuthenticateHostViewController *)self delegate];
  [v4 setError:v3];

  objc_super v5 = [(GKAuthenticateHostViewController *)self delegate];
  [v5 dismissViewControllerAnimated:1 completion:0];

  v6.receiver = self;
  v6.super_class = (Class)GKAuthenticateHostViewController;
  [(GKExtensionRemoteViewController *)&v6 extensionIsCanceling];
}

- (void)applicationWillTerminate:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = @"MessageCommandKey";
  v7[0] = &unk_1F08121C8;
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v4];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];
}

- (GKHostedAuthenticateViewController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKHostedAuthenticateViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __57__GKAuthenticateHostViewController_authenticateExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "Error loading Game Center authenticate issue extension, %@", (uint8_t *)&v2, 0xCu);
}

- (void)messageFromExtension:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromExtension arhive in GKAuthenticateHostViewController:%@", (uint8_t *)&v2, 0xCu);
}

@end