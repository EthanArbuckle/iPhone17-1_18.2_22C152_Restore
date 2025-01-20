@interface AppleEthernetSettingsController
- (AppleEthernetConfigurator)configurator;
- (AppleEthernetDetailsContext)detailsContext;
- (AppleEthernetInterface)interface;
- (AppleEthernetSettingsController)initWithDefaultConfigForInterface:(id)a3;
- (OS_dispatch_queue)queue;
- (WFNetworkSettingsViewController)settingsViewController;
- (void)detailsContextChanged;
- (void)networkSettingsViewController:(id)a3 saveConfig:(id)a4 errorHandler:(id)a5;
- (void)refresh;
- (void)setConfigurator:(id)a3;
- (void)setDetailsContext:(id)a3;
- (void)setInterface:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSettingsViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation AppleEthernetSettingsController

- (AppleEthernetSettingsController)initWithDefaultConfigForInterface:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AppleEthernetSettingsController;
  v6 = [(AppleEthernetSettingsController *)&v18 init];
  if (v6)
  {
    v7 = [[AppleEthernetConfigurator alloc] initWithInterface:v5];
    configurator = v6->_configurator;
    v6->_configurator = v7;

    [(AppleEthernetConfigurator *)v6->_configurator setSettingsDelegate:v6];
    objc_storeStrong((id *)&v6->_interface, a3);
    v9 = objc_alloc_init(AppleEthernetSettingsConfig);
    v10 = [v5 displayName];
    [(AppleEthernetSettingsConfig *)v9 setSsid:v10];

    v11 = objc_alloc_init(AppleEthernetDetailsContext);
    detailsContext = v6->_detailsContext;
    v6->_detailsContext = v11;

    [(AppleEthernetDetailsContext *)v6->_detailsContext setDelegate:v6];
    v13 = (WFNetworkSettingsViewController *)[objc_alloc((Class)WFNetworkSettingsViewController) initWithConfig:v9 detailsContext:v6->_detailsContext hardwareMACAddress:0];
    settingsViewController = v6->_settingsViewController;
    v6->_settingsViewController = v13;

    [(WFNetworkSettingsViewController *)v6->_settingsViewController setDataCoordinator:v6];
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.AppleEthernetSettingsController", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v15;
  }
  return v6;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)AppleEthernetSettingsController;
  [(AppleEthernetSettingsController *)&v16 viewDidLoad];
  [(AppleEthernetSettingsController *)self addChildViewController:self->_settingsViewController];
  v3 = [(AppleEthernetSettingsController *)self view];
  v4 = [(WFNetworkSettingsViewController *)self->_settingsViewController view];
  [v3 addSubview:v4];

  id v5 = [(AppleEthernetSettingsController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(WFNetworkSettingsViewController *)self->_settingsViewController view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  dispatch_queue_t v15 = [(AppleEthernetInterface *)self->_interface displayName];
  [(AppleEthernetSettingsController *)self setTitle:v15];

  [(AppleEthernetSettingsController *)self refresh];
}

- (void)refresh
{
  objc_initWeak(&location, self);
  v3 = self->_configurator;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_56B4;
  block[3] = &unk_C560;
  double v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v8, &location);
  dispatch_async((dispatch_queue_t)queue, block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (void)networkSettingsViewController:(id)a3 saveConfig:(id)a4 errorHandler:(id)a5
{
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Save pressed in settings view.", v7, 2u);
  }
  [(AppleEthernetConfigurator *)self->_configurator saveConfig:v6];
}

- (void)detailsContextChanged
{
  configurator = self->_configurator;
  id v3 = [(WFNetworkSettingsViewController *)self->_settingsViewController config];
  [(AppleEthernetConfigurator *)configurator saveConfig:v3];
}

- (AppleEthernetInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (WFNetworkSettingsViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
}

- (AppleEthernetConfigurator)configurator
{
  return self->_configurator;
}

- (void)setConfigurator:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (AppleEthernetDetailsContext)detailsContext
{
  return self->_detailsContext;
}

- (void)setDetailsContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end