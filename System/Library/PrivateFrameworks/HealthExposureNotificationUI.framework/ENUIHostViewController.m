@interface ENUIHostViewController
+ (id)exportedInterface;
+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (ENUIHostViewControllerDelegate)delegate;
- (void)didFinishWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationRequest:(id)a3;
- (void)show;
- (void)viewDidLoad;
@end

@implementation ENUIHostViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)ENUIHostViewController;
  [(ENUIHostViewController *)&v2 viewDidLoad];
}

- (void)setPresentationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ENUIHostViewController *)self _remoteViewControllerProxy];
  [v5 setPresentationRequest:v4];
}

- (void)show
{
  id v2 = [(ENUIHostViewController *)self _remoteViewControllerProxy];
  [v2 show];
}

- (void)didFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(ENUIHostViewController *)self delegate];
  [v5 hostViewControllerDidFinishWithError:v4];
}

+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() requestViewController:@"ENUIRemotePresentationViewController" fromServiceWithBundleIdentifier:@"com.apple.PublicHealthRemoteUI" connectionHandler:v3];

  return v4;
}

+ (id)serviceViewControllerInterface
{
  return (id)MEMORY[0x270EEB700](a1, a2);
}

+ (id)exportedInterface
{
  return (id)MEMORY[0x270EEB6F8](a1, a2);
}

- (ENUIHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENUIHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end