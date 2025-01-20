@interface HSDiscoveredAccessoryPickerViewController
- (HFAccessoryBrowsingManager)accessoryBrowsingManager;
- (HMSetupAccessoryDescription)setupAccessoryDescription;
- (HSDiscoveredAccessoryGridContentViewController)gridViewController;
- (HSDiscoveredAccessoryPickerViewController)initWithAccessoryBrowsingManager:(id)a3 entitlementContext:(id)a4 setupAccessoryDescription:(id)a5 matterDeviceSetupRequest:(id)a6;
- (HSDiscoveredAccessoryPickerViewControllerDelegate)discoveredAccessoryPickerViewControllerDelegate;
- (HSEntitlementContext)entitlementContext;
- (HSNetworkInterfaceManager)networkInterfaceManager;
- (MTSDeviceSetupRequest)matterDeviceSetupRequest;
- (NSLayoutConstraint)gridHeightConstraint;
- (id)hu_preloadContent;
- (void)_setupConstraints;
- (void)discoveredAccessoryGrid:(id)a3 didSelectDiscoveredAccessory:(id)a4;
- (void)discoveredAccessoryGrid:(id)a3 didUpdateNumberOfDiscoveredAccessories:(unint64_t)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setDiscoveredAccessoryPickerViewControllerDelegate:(id)a3;
- (void)setGridHeightConstraint:(id)a3;
- (void)setGridViewController:(id)a3;
- (void)setNetworkInterfaceManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSDiscoveredAccessoryPickerViewController

- (HSDiscoveredAccessoryPickerViewController)initWithAccessoryBrowsingManager:(id)a3 entitlementContext:(id)a4 setupAccessoryDescription:(id)a5 matterDeviceSetupRequest:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HSDiscoveredAccessoryPickerViewController.m", 36, @"Invalid parameter not satisfying: %@", @"accessoryBrowsingManager" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v23 = +[NSAssertionHandler currentHandler];
  [v23 handleFailureInMethod:a2, self, @"HSDiscoveredAccessoryPickerViewController.m", 37, @"Invalid parameter not satisfying: %@", @"entitlementContext" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  v16 = [(HSDiscoveredAccessoryPickerViewController *)&v24 initWithNibName:0 bundle:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_accessoryBrowsingManager, a3);
    objc_storeStrong((id *)&v17->_entitlementContext, a4);
    objc_storeStrong((id *)&v17->_setupAccessoryDescription, a5);
    objc_storeStrong((id *)&v17->_matterDeviceSetupRequest, a6);
    v18 = [[HSNetworkInterfaceManager alloc] initWithAlertHostViewController:v17];
    networkInterfaceManager = v17->_networkInterfaceManager;
    v17->_networkInterfaceManager = v18;

    v20 = HULocalizedString();
    [(HSDiscoveredAccessoryPickerViewController *)v17 setTitle:v20];
  }
  return v17;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  [(HSDiscoveredAccessoryPickerViewController *)&v26 viewDidLoad];
  id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v3];
  v5 = [(HSDiscoveredAccessoryPickerViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  [v3 startAnimating];
  v6 = [HSDiscoveredAccessoryFilter alloc];
  v7 = [(HSDiscoveredAccessoryPickerViewController *)self entitlementContext];
  v8 = [(HSDiscoveredAccessoryPickerViewController *)self setupAccessoryDescription];
  v9 = [(HSDiscoveredAccessoryPickerViewController *)self matterDeviceSetupRequest];
  v10 = [(HSDiscoveredAccessoryFilter *)v6 initWithEntitlementContext:v7 setupAccessoryDescription:v8 matterDeviceSetupRequest:v9];

  v11 = [HSDiscoveredAccessoryGridContentViewController alloc];
  id v12 = [(HSDiscoveredAccessoryPickerViewController *)self accessoryBrowsingManager];
  id v13 = [(HSDiscoveredAccessoryGridContentViewController *)v11 initWithAccessoryBrowsingManager:v12 discoveredAccessoryFilter:v10];
  [(HSDiscoveredAccessoryPickerViewController *)self setGridViewController:v13];

  id v14 = +[UIColor secondarySystemBackgroundColor];
  id v15 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  [v15 setCellContentViewBackgroundColor:v14];

  v16 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  [v16 setDelegate:self];

  v17 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  [v17 setContentMargins:0];

  v18 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  [v18 setWantsPreferredContentSize:1];

  v19 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  [(HSDiscoveredAccessoryPickerViewController *)self addChildViewController:v19];

  v20 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  v21 = [v20 view];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(HSDiscoveredAccessoryPickerViewController *)self view];
  v23 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  objc_super v24 = [v23 view];
  [v22 addSubview:v24];

  v25 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  [v25 didMoveToParentViewController:self];

  [(HSDiscoveredAccessoryPickerViewController *)self _setupConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  [(HSDiscoveredAccessoryPickerViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  [(HSDiscoveredAccessoryPickerViewController *)&v5 viewDidAppear:a3];
  id v4 = [(HSDiscoveredAccessoryPickerViewController *)self networkInterfaceManager];
  [v4 checkNetworkStatusAndShowAlertIfNeededForBluetooth:1 Wifi:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HSDiscoveredAccessoryPickerViewController;
  [(HSDiscoveredAccessoryPickerViewController *)&v3 viewDidDisappear:a3];
}

- (void)_setupConstraints
{
  id v30 = +[NSMutableArray array];
  objc_super v3 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  id v4 = [v3 view];

  objc_super v5 = [v4 leftAnchor];
  v6 = [(HSDiscoveredAccessoryPickerViewController *)self view];
  v7 = [v6 leftAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  [v30 addObject:v8];

  v9 = [v4 topAnchor];
  v10 = [(HSDiscoveredAccessoryPickerViewController *)self view];
  v11 = [v10 topAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  [v30 addObject:v12];

  id v13 = [v4 rightAnchor];
  id v14 = [(HSDiscoveredAccessoryPickerViewController *)self view];
  id v15 = [v14 rightAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v30 addObject:v16];

  v17 = [v4 bottomAnchor];
  v18 = [(HSDiscoveredAccessoryPickerViewController *)self view];
  v19 = [v18 bottomAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v30 addObject:v20];

  v21 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  v22 = [v21 view];
  v23 = [v22 heightAnchor];
  objc_super v24 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  [v24 preferredContentSize];
  objc_super v26 = [v23 constraintGreaterThanOrEqualToConstant:v25];
  [(HSDiscoveredAccessoryPickerViewController *)self setGridHeightConstraint:v26];

  v27 = [(HSDiscoveredAccessoryPickerViewController *)self gridHeightConstraint];
  LODWORD(v28) = 1144750080;
  [v27 setPriority:v28];

  v29 = [(HSDiscoveredAccessoryPickerViewController *)self gridHeightConstraint];
  [v30 addObject:v29];

  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
    [v7 preferredContentSize];
    double v9 = v8 + 30.0;
    v10 = [(HSDiscoveredAccessoryPickerViewController *)self gridHeightConstraint];
    [v10 setConstant:v9];

    id v12 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
    v11 = [v12 view];
    [v11 layoutIfNeeded];
  }
}

- (void)discoveredAccessoryGrid:(id)a3 didSelectDiscoveredAccessory:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!v6) {
    NSLog(@"No discovered accessory");
  }
  v7 = [(HSDiscoveredAccessoryPickerViewController *)self discoveredAccessoryPickerViewControllerDelegate];

  if (v7)
  {
    double v8 = [(HSDiscoveredAccessoryPickerViewController *)self discoveredAccessoryPickerViewControllerDelegate];
    [v8 didSelectDiscoveredAccessory:v6];
  }
}

- (void)discoveredAccessoryGrid:(id)a3 didUpdateNumberOfDiscoveredAccessories:(unint64_t)a4
{
  id v6 = [(HSDiscoveredAccessoryPickerViewController *)self discoveredAccessoryPickerViewControllerDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HSDiscoveredAccessoryPickerViewController *)self discoveredAccessoryPickerViewControllerDelegate];
    [v8 didUpdateNumberOfDiscoveredAccessories:a4];
  }
}

- (id)hu_preloadContent
{
  v2 = [(HSDiscoveredAccessoryPickerViewController *)self gridViewController];
  objc_super v3 = [v2 hu_preloadContent];

  return v3;
}

- (HFAccessoryBrowsingManager)accessoryBrowsingManager
{
  return self->_accessoryBrowsingManager;
}

- (HSEntitlementContext)entitlementContext
{
  return self->_entitlementContext;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  return self->_matterDeviceSetupRequest;
}

- (HSDiscoveredAccessoryGridContentViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
}

- (HSNetworkInterfaceManager)networkInterfaceManager
{
  return self->_networkInterfaceManager;
}

- (void)setNetworkInterfaceManager:(id)a3
{
}

- (NSLayoutConstraint)gridHeightConstraint
{
  return self->_gridHeightConstraint;
}

- (void)setGridHeightConstraint:(id)a3
{
}

- (HSDiscoveredAccessoryPickerViewControllerDelegate)discoveredAccessoryPickerViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_discoveredAccessoryPickerViewControllerDelegate);

  return (HSDiscoveredAccessoryPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDiscoveredAccessoryPickerViewControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_discoveredAccessoryPickerViewControllerDelegate);
  objc_storeStrong((id *)&self->_gridHeightConstraint, 0);
  objc_storeStrong((id *)&self->_networkInterfaceManager, 0);
  objc_storeStrong((id *)&self->_gridViewController, 0);
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_storeStrong((id *)&self->_entitlementContext, 0);

  objc_storeStrong((id *)&self->_accessoryBrowsingManager, 0);
}

@end