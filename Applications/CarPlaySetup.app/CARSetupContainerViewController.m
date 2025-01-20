@interface CARSetupContainerViewController
- (CARSetupPromptPresenter)promptPresenter;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setupPromptPresenter;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setPromptPresenter:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CARSetupContainerViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CARSetupContainerViewController;
  [(CARSetupContainerViewController *)&v6 viewDidLoad];
  v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000A7B0(v3);
  }

  v4 = [(CARSetupContainerViewController *)self view];
  v5 = +[UIColor clearColor];
  [v4 setBackgroundColor:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CARSetupContainerViewController;
  [(CARSetupContainerViewController *)&v4 viewDidAppear:a3];
  v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000A7F4(v3);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_setupPromptPresenter
{
  v3 = [[CARSetupPromptPresenter alloc] initWithPresentingViewController:self];
  [(CARSetupContainerViewController *)self setPromptPresenter:v3];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = CARSetupLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v6 userInfo];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Configure with context %@ userinfo %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(CARSetupContainerViewController *)self _remoteViewControllerProxy];
  [v10 setAllowsAlertItems:0];
  if (v7) {
    v7[2](v7);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(CARSetupContainerViewController *)self _setupPromptPresenter];
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

- (void)handleButtonActions:(id)a3
{
}

- (CARSetupPromptPresenter)promptPresenter
{
  return self->_promptPresenter;
}

- (void)setPromptPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end