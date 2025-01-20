@interface HKBridgeParentController
- (BOOL)isTinkerDevice;
- (BOOL)loadingHealthStore;
- (HKBridgeParentController)init;
- (HKHealthStore)healthStore;
- (NRDevice)activeTinkerDevice;
- (UIActivityIndicatorView)tinkerLoadingActivityIndicator;
- (UIViewController)currentBridgeViewController;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)_addExpectedHealthSettingsViewAsChildViewController;
- (void)_loadHealthStoreForActiveDevice;
- (void)_mainQueue_startActivityIndicator;
- (void)_mainQueue_stopActivityIndicator;
- (void)didSuccessfullyTearDownSharing;
- (void)initializeView;
- (void)setActiveTinkerDevice:(id)a3;
- (void)setCurrentBridgeViewController:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setIsTinkerDevice:(BOOL)a3;
- (void)setLoadingHealthStore:(BOOL)a3;
- (void)setTinkerLoadingActivityIndicator:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKBridgeParentController

- (HKBridgeParentController)init
{
  v11.receiver = self;
  v11.super_class = (Class)HKBridgeParentController;
  v2 = [(HKBridgeParentController *)&v11 init];
  if (v2)
  {
    v3 = +[NRPairedDeviceRegistry sharedInstance];
    v4 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
    v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
    uint64_t v6 = [v5 firstObject];
    activeTinkerDevice = v2->_activeTinkerDevice;
    v2->_activeTinkerDevice = (NRDevice *)v6;

    v8 = [(NRDevice *)v2->_activeTinkerDevice valueForProperty:NRDevicePropertyIsAltAccount];
    v2->_isTinkerDevice = [v8 BOOLValue];

    if (!v2->_isTinkerDevice)
    {
      v9 = v2->_activeTinkerDevice;
      v2->_activeTinkerDevice = 0;
    }
  }
  return v2;
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HEALTH_LABEL" value:&stru_18860 table:@"Localizable"];

  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HKBridgeParentController;
  [(HKBridgeParentController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"HEALTH_LABEL" value:&stru_18860 table:@"Localizable"];
  [(HKBridgeParentController *)self setTitle:v4];

  [(HKBridgeParentController *)self initializeView];
}

- (void)initializeView
{
  [(HKBridgeParentController *)self _loadHealthStoreForActiveDevice];
  if (!self->_loadingHealthStore)
  {
    [(HKBridgeParentController *)self _addExpectedHealthSettingsViewAsChildViewController];
  }
}

- (id)specifiers
{
  v3 = [(HKBridgeParentController *)self localizedPaneTitle];
  [(HKBridgeParentController *)self setTitle:v3];

  return &__NSArray0__struct;
}

- (void)_loadHealthStoreForActiveDevice
{
  if (self->_isTinkerDevice)
  {
    self->_loadingHealthStore = 1;
    [(HKBridgeParentController *)self _mainQueue_startActivityIndicator];
    activeTinkerDevice = self->_activeTinkerDevice;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_D768;
    v6[3] = &unk_18820;
    v6[4] = self;
    +[BPSAppleIDDevices fetchFamilyMemberForDevice:activeTinkerDevice withCompletion:v6];
  }
  else
  {
    v4 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = self->_healthStore;
    self->_healthStore = v4;
    _objc_release_x1(v4, healthStore);
  }
}

- (void)_mainQueue_startActivityIndicator
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  tinkerLoadingActivityIndicator = self->_tinkerLoadingActivityIndicator;
  if (!tinkerLoadingActivityIndicator)
  {
    v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    objc_super v5 = self->_tinkerLoadingActivityIndicator;
    self->_tinkerLoadingActivityIndicator = v4;

    [(UIActivityIndicatorView *)self->_tinkerLoadingActivityIndicator setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)self->_tinkerLoadingActivityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v6 = [(HKBridgeParentController *)self view];
    [v6 addSubview:self->_tinkerLoadingActivityIndicator];

    v7 = self->_tinkerLoadingActivityIndicator;
    v8 = [(HKBridgeParentController *)self view];
    [(UIActivityIndicatorView *)v7 hk_alignCenterConstraintsWithView:v8];

    tinkerLoadingActivityIndicator = self->_tinkerLoadingActivityIndicator;
  }

  [(UIActivityIndicatorView *)tinkerLoadingActivityIndicator startAnimating];
}

- (void)_mainQueue_stopActivityIndicator
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  tinkerLoadingActivityIndicator = self->_tinkerLoadingActivityIndicator;

  [(UIActivityIndicatorView *)tinkerLoadingActivityIndicator stopAnimating];
}

- (void)_addExpectedHealthSettingsViewAsChildViewController
{
  if (self->_healthStore)
  {
    v3 = [[HKBridgeHealthController alloc] initWithHealthStore:self->_healthStore activeTinkerDevice:self->_activeTinkerDevice];
    [(HKBridgeHealthController *)v3 setSecondaryUserDelegate:self];
    currentBridgeViewController = self->_currentBridgeViewController;
    self->_currentBridgeViewController = (UIViewController *)v3;
  }
  else
  {
    objc_super v5 = [[HKBridgeSharingDisabledController alloc] initWithActiveTinkerDevice:self->_activeTinkerDevice];
    currentBridgeViewController = self->_currentBridgeViewController;
    self->_currentBridgeViewController = (UIViewController *)v5;
  }

  if (self->_currentBridgeViewController)
  {
    -[HKBridgeParentController addChildViewController:](self, "addChildViewController:");
    uint64_t v6 = [(HKBridgeParentController *)self view];
    v7 = [(UIViewController *)self->_currentBridgeViewController view];
    [v6 addSubview:v7];

    v8 = [(UIViewController *)self->_currentBridgeViewController view];
    v9 = [(HKBridgeParentController *)self view];
    objc_msgSend(v8, "hk_alignConstraintsWithView:", v9);

    v10 = self->_currentBridgeViewController;
    [(UIViewController *)v10 didMoveToParentViewController:self];
  }
}

- (void)didSuccessfullyTearDownSharing
{
  [(UIViewController *)self->_currentBridgeViewController willMoveToParentViewController:0];
  v3 = [(UIViewController *)self->_currentBridgeViewController view];
  [v3 removeFromSuperview];

  [(UIViewController *)self->_currentBridgeViewController removeFromParentViewController];
  currentBridgeViewController = self->_currentBridgeViewController;
  self->_currentBridgeViewController = 0;

  [(HKBridgeParentController *)self initializeView];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (UIViewController)currentBridgeViewController
{
  return self->_currentBridgeViewController;
}

- (void)setCurrentBridgeViewController:(id)a3
{
}

- (NRDevice)activeTinkerDevice
{
  return self->_activeTinkerDevice;
}

- (void)setActiveTinkerDevice:(id)a3
{
}

- (BOOL)isTinkerDevice
{
  return self->_isTinkerDevice;
}

- (void)setIsTinkerDevice:(BOOL)a3
{
  self->_isTinkerDevice = a3;
}

- (BOOL)loadingHealthStore
{
  return self->_loadingHealthStore;
}

- (void)setLoadingHealthStore:(BOOL)a3
{
  self->_loadingHealthStore = a3;
}

- (UIActivityIndicatorView)tinkerLoadingActivityIndicator
{
  return self->_tinkerLoadingActivityIndicator;
}

- (void)setTinkerLoadingActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tinkerLoadingActivityIndicator, 0);
  objc_storeStrong((id *)&self->_activeTinkerDevice, 0);
  objc_storeStrong((id *)&self->_currentBridgeViewController, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end