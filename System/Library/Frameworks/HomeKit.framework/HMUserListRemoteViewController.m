@interface HMUserListRemoteViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (HMUserManagementRemoteHost)delegate;
- (void)setDelegate:(id)a3;
- (void)userManagementDidFinishWithError:(id)a3;
- (void)userManagementDidLoad;
- (void)viewDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation HMUserListRemoteViewController

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (HMUserManagementRemoteHost)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMUserManagementRemoteHost *)WeakRetained;
}

- (void)userManagementDidFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HMUserListRemoteViewController *)self delegate];
  [v5 userManagementDidFinishWithError:v4];
}

- (void)userManagementDidLoad
{
  id v2 = [(HMUserListRemoteViewController *)self delegate];
  [v2 userManagementDidLoad];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HMUserListRemoteViewController;
  [(HMUserListRemoteViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  id v4 = [(HMUserListRemoteViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:79 userInfo:0];
  id v4 = [(HMUserListRemoteViewController *)self delegate];
  [v4 userManagementDidFinishWithError:v5];
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E4F29280], "hm_userManagementRemoteHostInterface");
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E4F29280], "hm_userManagementRemoteServiceInterface");
}

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() requestViewController:@"HSUserListNavigationViewController" fromServiceWithBundleIdentifier:@"com.apple.Home.HomeUIService" connectionHandler:v3];

  return v4;
}

@end