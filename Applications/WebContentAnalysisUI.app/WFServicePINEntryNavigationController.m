@interface WFServicePINEntryNavigationController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (unint64_t)supportedInterfaceOrientations;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)cancel;
- (void)didAcceptEnteredPIN;
- (void)didCancelEnteringPIN;
- (void)getIsPINPresentWithCompletion:(id)a3;
- (void)permitURLWithCompletion:(id)a3;
- (void)setPageTitle:(id)a3;
- (void)setURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFServicePINEntryNavigationController

- (void)viewDidLoad
{
  v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = 17;
  }
  [(WFServicePINEntryNavigationController *)self setModalPresentationStyle:v5];
  v6 = objc_alloc_init(WFServicePINEntryViewController);
  PINEntryViewController = self->_PINEntryViewController;
  self->_PINEntryViewController = v6;

  [(WFServicePINEntryViewController *)self->_PINEntryViewController setDelegate:self];
  id v12 = [(WFServicePINEntryNavigationController *)self view];
  v8 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_PINEntryViewController];
  navController = self->_navController;
  self->_navController = v8;

  v10 = [(UINavigationController *)self->_navController view];
  [(WFServicePINEntryNavigationController *)self addChildViewController:self->_navController];
  [v12 addSubview:v10];
  [(UINavigationController *)self->_navController didMoveToParentViewController:self];
  v11 = +[UIDevice currentDevice];
  [v11 userInterfaceIdiom];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WFServicePINEntryControllerProtocol];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WFPINEntryViewControllerProtocol];
}

- (void)_willAppearInRemoteViewController:(id)a3
{
}

- (void)setURL:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(NSURL *)self->_URL host];
  uint64_t v5 = [v12 host];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = [v12 scheme];
    v8 = [v12 host];
    v9 = +[NSString stringWithFormat:@"%@://%@", v7, v8];
    v10 = +[NSURL URLWithString:v9];
    URL = self->_URL;
    self->_URL = v10;
  }
}

- (void)setPageTitle:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_pageTitle, "isEqual:") & 1) == 0)
  {
    unint64_t v4 = (NSString *)[v6 copy];
    pageTitle = self->_pageTitle;
    self->_pageTitle = v4;
  }
}

- (void)getIsPINPresentWithCompletion:(id)a3
{
  id v3 = (void (**)(id, BOOL, void))a3;
  v3[2](v3, +[WFServicePINEntryViewController settingEnabled], 0);
}

- (void)permitURLWithCompletion:(id)a3
{
  unint64_t v4 = (void (**)(id, void))a3;
  uint64_t v5 = objc_opt_new();
  URL = self->_URL;
  pageTitle = self->_pageTitle;
  id v12 = 0;
  unsigned __int8 v8 = [v5 permitWebFilterURL:URL pageTitle:pageTitle error:&v12];
  id v9 = v12;
  v10 = v9;
  v11 = 0;
  if ((v8 & 1) == 0)
  {
    NSLog(@"Couldn't add URL to Screen Time: %@", 0, v9);
    v11 = v10;
  }
  ((void (**)(id, void *))v4)[2](v4, v11);
}

- (void)cancel
{
}

- (void)didAcceptEnteredPIN
{
  [(WFServicePINEntryNavigationController *)self permitURLWithCompletion:&stru_1000041B8];
  remoteViewControllerProxy = self->_remoteViewControllerProxy;

  [(WFPINEntryViewControllerProtocol *)remoteViewControllerProxy userEnteredCorrectPIN];
}

- (void)didCancelEnteringPIN
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_PINEntryViewController, 0);
  objc_storeStrong((id *)&self->_navController, 0);

  objc_storeStrong((id *)&self->_remoteViewControllerProxy, 0);
}

@end