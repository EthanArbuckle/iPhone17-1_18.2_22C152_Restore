@interface MRUViewServiceRoutingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canShowMoreButton;
- (BOOL)canShowRemoteDevices;
- (BOOL)isOnScreen;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)supportsQueueHandoff;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (MPMediaControlsConfiguration)configuration;
- (MRUNowPlayingController)selectedNowPlayingController;
- (MRUOutputDeviceRoutingDataSource)outputDeviceRoutingDataSource;
- (MRURoutingViewController)routingViewController;
- (MRUVendorSpecificDeviceManager)vendorSpecificManager;
- (MRUViewServiceRoutingViewController)init;
- (MRUViewServiceRoutingViewControllerDelegate)delegate;
- (MRUVisualStylingProvider)stylingProvider;
- (MediaControlsEndpointsManager)endpointsManager;
- (NSMutableDictionary)nowPlayingControllers;
- (UITableViewDiffableDataSource)dataSource;
- (UIViewController)alertViewController;
- (id)replaceRoutes;
- (id)selectedIdentifier;
- (void)dealloc;
- (void)didSelectListState:(id)a3;
- (void)didSelectQuickControl:(id)a3;
- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4;
- (void)loadView;
- (void)nowPlayingController:(id)a3 didChangeQuickControlItem:(id)a4;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4;
- (void)routingViewControllerDidUpdateItems:(id)a3;
- (void)setAlertViewController:(id)a3;
- (void)setCanShowRemoteDevices:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointsManager:(id)a3;
- (void)setNowPlayingControllers:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setOutputDeviceRoutingDataSource:(id)a3;
- (void)setReplaceRoutes:(id)a3;
- (void)setRoutingViewController:(id)a3;
- (void)setSelectedNowPlayingController:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSupportsQueueHandoff:(BOOL)a3;
- (void)setVendorSpecificManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forIdentifier:(id)a4;
- (void)updateCellForIdentifier:(id)a3;
- (void)updateDiscoveryMode;
- (void)updateMoreButtonVisibility;
- (void)updateNowPlayingControllers;
- (void)updateRoutingViewController;
- (void)updateRoutingViewControllerScrollIndicatorInsets;
- (void)updateSelectedViewController;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MRUViewServiceRoutingViewController

- (MRUViewServiceRoutingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUViewServiceRoutingViewController;
  v2 = [(MRUViewServiceRoutingViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    nowPlayingControllers = v2->_nowPlayingControllers;
    v2->_nowPlayingControllers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager stopDiscovery];
  v3.receiver = self;
  v3.super_class = (Class)MRUViewServiceRoutingViewController;
  [(MRUViewServiceRoutingViewController *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = [MRUViewServiceRoutingView alloc];
  v4 = -[MRUViewServiceRoutingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MRUViewServiceRoutingViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)MRUViewServiceRoutingViewController;
  [(MRUViewServiceRoutingViewController *)&v42 viewDidLoad];
  stylingProvider = self->_stylingProvider;
  v4 = [(MRUViewServiceRoutingViewController *)self view];
  [v4 setStylingProvider:stylingProvider];

  [(MPMediaControlsConfiguration *)self->_configuration preferredWidth];
  double v6 = v5;
  v7 = [(MRUViewServiceRoutingViewController *)self view];
  [v7 setPreferredWidth:v6];

  if ([(MPMediaControlsConfiguration *)self->_configuration useGenericDevicesIconInHeader])
  {
    uint64_t v8 = +[MRUAssetsProvider genericDevices];
  }
  else
  {
    v9 = +[MRUStringsProvider airplayTitle];
    v10 = [(MRUViewServiceRoutingViewController *)self view];
    v11 = [v10 headerView];
    [v11 setTitle:v9];

    if ([(MPMediaControlsConfiguration *)self->_configuration sortByIsVideoRoute]) {
      +[MRUAssetsProvider airplayVideo];
    }
    else {
    uint64_t v8 = +[MRUAssetsProvider airplay];
    }
  }
  v12 = (void *)v8;
  v13 = [(MRUViewServiceRoutingViewController *)self view];
  v14 = [v13 headerView];
  [v14 setImage:v12];

  v15 = [(MRURoutingViewController *)self->_routingViewController view];
  v16 = [(MRUViewServiceRoutingViewController *)self view];
  [v16 setContentView:v15];

  [(MRURoutingViewController *)self->_routingViewController setStylingProvider:self->_stylingProvider];
  v17 = [(MRUViewServiceRoutingViewController *)self view];
  v18 = [v17 footerView];
  v19 = [v18 button];
  [v19 addTarget:self action:sel_didSelectListState_ forControlEvents:64];

  v20 = [(MRUViewServiceRoutingViewController *)self view];
  v21 = [v20 tableView];
  [v21 setDelegate:self];

  v22 = [(MRUViewServiceRoutingViewController *)self view];
  v23 = [v22 tableView];
  uint64_t v24 = objc_opt_class();
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  [v23 registerClass:v24 forCellReuseIdentifier:v26];

  objc_initWeak(&location, self);
  id v27 = objc_alloc(MEMORY[0x1E4FB1D20]);
  v28 = [(MRUViewServiceRoutingViewController *)self view];
  v29 = [v28 tableView];
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  v38 = __50__MRUViewServiceRoutingViewController_viewDidLoad__block_invoke;
  v39 = &unk_1E5F0DC20;
  objc_copyWeak(&v40, &location);
  v30 = (UITableViewDiffableDataSource *)[v27 initWithTableView:v29 cellProvider:&v36];
  dataSource = self->_dataSource;
  self->_dataSource = v30;

  v32 = [MRUVendorSpecificDeviceManager alloc];
  v33 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];
  v34 = [(MRUVendorSpecificDeviceManager *)v32 initWithAppBundleID:v33 serviceIdentifiers:MEMORY[0x1E4F1CBF0]];
  vendorSpecificManager = self->_vendorSpecificManager;
  self->_vendorSpecificManager = v34;

  [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager startDiscovery];
  [(MRUViewServiceRoutingViewController *)self updateNowPlayingControllers];
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

id __50__MRUViewServiceRoutingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v9 dequeueReusableCellWithIdentifier:v11 forIndexPath:v8];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateCell:v12 forIdentifier:v7];

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUViewServiceRoutingViewController;
  [(MRUViewServiceRoutingViewController *)&v4 viewWillAppear:a3];
  [(MRUViewServiceRoutingViewController *)self setOnScreen:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUViewServiceRoutingViewController;
  [(MRUViewServiceRoutingViewController *)&v4 viewWillDisappear:a3];
  [(MRUViewServiceRoutingViewController *)self setOnScreen:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setOnScreen:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v4 = [(NSMutableDictionary *)self->_nowPlayingControllers allValues];
    double v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) updateAutomaticResponseLoading];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(MRUViewServiceRoutingViewController *)self updateDiscoveryMode];
  }
}

- (void)setState:(int64_t)a3
{
  double v5 = [(MRUViewServiceRoutingViewController *)self view];
  [v5 setState:a3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained viewServiceRoutingViewControllerDidChangeSize:self];
  }
}

- (void)setConfiguration:(id)a3
{
  p_configuration = &self->_configuration;
  id v24 = a3;
  if ((-[MPMediaControlsConfiguration isEqual:](*p_configuration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    uint64_t v6 = [[MediaControlsEndpointsManager alloc] initWithConfiguration:v24];
    endpointsManager = self->_endpointsManager;
    self->_endpointsManager = v6;

    [(MediaControlsEndpointsManager *)self->_endpointsManager setDelegate:self];
    if ([(MPMediaControlsConfiguration *)*p_configuration style] == 3)
    {
      self->_canShowRemoteDevices = 1;
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v9 = [v24 presentingAppBundleID];
      if (objc_msgSend(v8, "mru_isSpringBoardBundleIdentifier:", v9))
      {
        self->_canShowRemoteDevices = 1;
      }
      else
      {
        long long v10 = (void *)MEMORY[0x1E4F28B50];
        long long v11 = [v24 presentingAppBundleID];
        self->_canShowRemoteDevices = objc_msgSend(v10, "mru_isMediaRemoteUIBundleIdentifier:", v11);
      }
    }
    if ([(MPMediaControlsConfiguration *)*p_configuration style] == 3)
    {
      self->_supportsQueueHandoff = 1;
    }
    else
    {
      long long v12 = (void *)MEMORY[0x1E4F28B50];
      long long v13 = [v24 presentingAppBundleID];
      if (objc_msgSend(v12, "mru_isSpringBoardBundleIdentifier:", v13))
      {
        self->_supportsQueueHandoff = 1;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v15 = [v24 presentingAppBundleID];
        if (objc_msgSend(v14, "mru_isHomeBundleIdentifier:", v15))
        {
          self->_supportsQueueHandoff = 1;
        }
        else
        {
          v16 = (void *)MEMORY[0x1E4F28B50];
          v17 = [v24 presentingAppBundleID];
          if (objc_msgSend(v16, "mru_isProximityControlBundleIdentifier:", v17))
          {
            self->_supportsQueueHandoff = 1;
          }
          else
          {
            v18 = (void *)MEMORY[0x1E4F28B50];
            v19 = [v24 presentingAppBundleID];
            self->_supportsQueueHandoff = objc_msgSend(v18, "mru_isMediaRemoteUIBundleIdentifier:", v19);
          }
        }
      }
    }
    [v24 preferredWidth];
    double v21 = v20;
    v22 = [(MRUViewServiceRoutingViewController *)self viewIfLoaded];
    [v22 setPreferredWidth:v21];

    v23 = [(MRUViewServiceRoutingViewController *)self endpointsManager];
    [v23 prewarm];

    [(MRUViewServiceRoutingViewController *)self updateDiscoveryMode];
    [(MRUViewServiceRoutingViewController *)self updateNowPlayingControllers];
    [(MRUViewServiceRoutingViewController *)self updateRoutingViewController];
  }
}

- (void)setStylingProvider:(id)a3
{
  uint64_t v6 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v6)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    double v5 = [(MRUViewServiceRoutingViewController *)self viewIfLoaded];
    [v5 setStylingProvider:v6];

    [(MRURoutingViewController *)self->_routingViewController setStylingProvider:v6];
  }
}

- (void)setRoutingViewController:(id)a3
{
  double v5 = (MRURoutingViewController *)a3;
  p_routingViewController = &self->_routingViewController;
  if (self->_routingViewController != v5)
  {
    long long v11 = v5;
    objc_storeStrong((id *)&self->_routingViewController, a3);
    [(MRUViewServiceRoutingViewController *)self addChildViewController:*p_routingViewController];
    if ([(MRUViewServiceRoutingViewController *)self isViewLoaded])
    {
      uint64_t v7 = [(MRURoutingViewController *)*p_routingViewController view];
      uint64_t v8 = [(MRUViewServiceRoutingViewController *)self view];
      [v8 setContentView:v7];
    }
    [(MRUViewServiceRoutingViewController *)self updateRoutingViewControllerScrollIndicatorInsets];
    uint64_t v9 = [(MRUViewServiceRoutingViewController *)self viewIfLoaded];
    long long v10 = [v9 stylingProvider];
    [(MRURoutingViewController *)*p_routingViewController setStylingProvider:v10];

    [(MRURoutingViewController *)*p_routingViewController didMoveToParentViewController:self];
    double v5 = v11;
  }
}

- (void)setSelectedNowPlayingController:(id)a3
{
  long long v10 = (MRUNowPlayingController *)a3;
  if (self->_selectedNowPlayingController != v10)
  {
    objc_storeStrong((id *)&self->_selectedNowPlayingController, a3);
    double v5 = [(MRUNowPlayingController *)v10 endpointController];
    uint64_t v6 = [v5 route];
    [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setEndpointRoute:v6];

    uint64_t v7 = [(MRUNowPlayingController *)v10 endpointController];
    uint64_t v8 = [v7 route];
    [(MRURoutingViewController *)self->_routingViewController setEndpointRoute:v8];

    uint64_t v9 = [(MRUViewServiceRoutingViewController *)self viewIfLoaded];
    [v9 setNeedsLayout];
  }
}

- (id)selectedIdentifier
{
  return [(MRUNowPlayingController *)self->_selectedNowPlayingController identifier];
}

- (BOOL)canShowMoreButton
{
  return self->_canShowRemoteDevices
      && (unint64_t)[(NSMutableDictionary *)self->_nowPlayingControllers count] > 1;
}

- (void)setAlertViewController:(id)a3
{
  double v5 = (UIViewController *)a3;
  alertViewController = self->_alertViewController;
  if (alertViewController != v5)
  {
    uint64_t v7 = alertViewController;
    objc_storeStrong((id *)&self->_alertViewController, a3);
    [(UIViewController *)v7 willMoveToParentViewController:0];
    if (v5)
    {
      [(MRUViewServiceRoutingViewController *)self addChildViewController:v5];
      uint64_t v8 = [(UIViewController *)v5 view];
      uint64_t v9 = [(MRUViewServiceRoutingViewController *)self view];
      [v9 setAlertView:v8];

      long long v10 = [(MRUViewServiceRoutingViewController *)self view];
      [v10 layoutIfNeeded];
    }
    else
    {
      long long v10 = [(MRUViewServiceRoutingViewController *)self view];
      [v10 setAlertView:0];
    }

    long long v11 = (void *)MEMORY[0x1E4FB1EB0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__MRUViewServiceRoutingViewController_setAlertViewController___block_invoke;
    v17[3] = &unk_1E5F0DC48;
    v18 = v7;
    v19 = self;
    double v20 = v5;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__MRUViewServiceRoutingViewController_setAlertViewController___block_invoke_2;
    v13[3] = &unk_1E5F0DC70;
    v14 = v18;
    uint64_t v15 = v20;
    v16 = self;
    long long v12 = v18;
    objc_msgSend(v11, "mru_animateUsingType:animations:completion:", 0, v17, v13);
  }
}

void __62__MRUViewServiceRoutingViewController_setAlertViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  BOOL v3 = *(void *)(a1 + 48) != 0;
  objc_super v4 = [*(id *)(a1 + 40) view];
  [v4 setShowAlertView:v3];

  double v5 = [*(id *)(a1 + 40) view];
  [v5 layoutIfNeeded];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1000));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained viewServiceRoutingViewControllerDidChangeSize:*(void *)(a1 + 40)];
  }
}

uint64_t __62__MRUViewServiceRoutingViewController_setAlertViewController___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 didMoveToParentViewController:v4];
}

- (void)didSelectListState:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__MRUViewServiceRoutingViewController_didSelectListState___block_invoke;
  v3[3] = &unk_1E5F0D7F8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "mru_animateUsingType:animations:", 0, v3);
}

void __58__MRUViewServiceRoutingViewController_didSelectListState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:1];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

- (void)didSelectQuickControl:(id)a3
{
  nowPlayingControllers = self->_nowPlayingControllers;
  uint64_t v4 = [a3 identifier];
  double v5 = [(NSMutableDictionary *)nowPlayingControllers objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 quickControlItem];
  uint64_t v8 = [v6 mainAction];

  uint64_t v7 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    uint64_t v7 = (void *)v8;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  uint64_t v8 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v7];
  uint64_t v9 = [(NSMutableDictionary *)self->_nowPlayingControllers objectForKeyedSubscript:v8];
  long long v10 = [v9 endpointController];

  long long v11 = [v10 route];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__MRUViewServiceRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v13[3] = &unk_1E5F0DC98;
  objc_copyWeak(&v16, &location);
  id v12 = v11;
  id v14 = v12;
  uint64_t v15 = self;
  [v10 connectAllowingAuthenticationWithCompletion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __73__MRUViewServiceRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F770C0]) initWithName:@"tableView:didSelectRowAtIndexPath:" requestID:0 reason:@"User selected active system endpoint" userInitiated:1];
    double v5 = [WeakRetained endpointsManager];
    [v5 setActiveSystemRoute:*(void *)(a1 + 32) requestDetails:v4];

    id v6 = [WeakRetained delegate];
    [v6 viewServiceRoutingViewControllerDidDismiss:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F77A20]);
    id v7 = +[MRUStringsProvider airPlayErrorTitle];
    [v4 setAlertHeader:v7];

    uint64_t v8 = [*(id *)(a1 + 32) routeName];
    uint64_t v9 = +[MRUStringsProvider airPlayConnectionErrorMessage:v8];
    [v4 setAlertMessage:v9];

    long long v10 = +[MRUStringsProvider ok];
    [v4 setDefaultButtonTitle:v10];

    [v4 setShowAsTopmost:1];
    [v4 setForceModalAlertAppearance:1];
    [v4 setShowOnLockscreen:1];
    [v4 setDismissOverlaysOnLockscreen:0];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F77A18]) initWithOptions:v4];
    [v6 presentWithCompletion:0];
  }
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4
{
  double v5 = _Block_copy(a4);
  id replaceRoutes = self->_replaceRoutes;
  self->_id replaceRoutes = v5;

  [(MRUViewServiceRoutingViewController *)self updateNowPlayingControllers];
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6 = [a3 identifier];
  [(MRUViewServiceRoutingViewController *)self updateCellForIdentifier:v6];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v6 = [a3 identifier];
  [(MRUViewServiceRoutingViewController *)self updateCellForIdentifier:v6];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6 = [a3 identifier];
  [(MRUViewServiceRoutingViewController *)self updateCellForIdentifier:v6];
}

- (void)nowPlayingController:(id)a3 didChangeQuickControlItem:(id)a4
{
  id v5 = [a3 identifier];
  [(MRUViewServiceRoutingViewController *)self updateCellForIdentifier:v5];
}

- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 actionIdentifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F31288]];

  if (!v9)
  {
    if ([v7 type] == 6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      long long v11 = [v7 vendorSpecificCustomRowIdentifier];
      [WeakRetained viewServiceRoutingViewControllerDidDismiss:self withCustomRowTapped:v11];
    }
    else
    {
      id v12 = [v7 mainRoute];
      int v13 = [v12 isGroupSession];

      if (!v13) {
        goto LABEL_8;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained viewServiceRoutingViewControllerDidDismiss:self];
    }

    goto LABEL_8;
  }
  objc_initWeak(&location, self);
  objc_copyWeak(&v14, &location);
  SBSRequestPasscodeUnlockAlertUI();
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
LABEL_8:
}

void __86__MRUViewServiceRoutingViewController_routingViewController_didSelectRoutingViewItem___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    id v4 = [MEMORY[0x1E4F9F760] instantiateViewController];
    [v4 setFlags:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__MRUViewServiceRoutingViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2;
    v6[3] = &unk_1E5F0DCC0;
    id v5 = WeakRetained;
    id v7 = v5;
    [v4 setCompletion:v6];
    [v5 setAlertViewController:v4];
  }
}

void __86__MRUViewServiceRoutingViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    int v9 = [v5 mediaRouteIdentifier];
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    int v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%@ ShareAudio dismissed: RouteID %@, Error %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) setAlertViewController:0];
}

- (void)routingViewControllerDidUpdateItems:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [(MRUViewServiceRoutingViewController *)self view];
  if ([v4 state])
  {
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    id v6 = WeakRetained;
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    [WeakRetained viewServiceRoutingViewControllerDidChangeSize:self];
  }
  id v6 = WeakRetained;
LABEL_6:
}

- (void)updateNowPlayingControllers
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id replaceRoutes = (uint64_t (**)(id, SEL))self->_replaceRoutes;
  if (replaceRoutes)
  {
    id v4 = (id)replaceRoutes[2](replaceRoutes, a2);
    id v5 = self->_replaceRoutes;
    self->_id replaceRoutes = 0;
  }
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
  uint64_t v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  int v9 = (void *)MEMORY[0x1E4F1CA80];
  int v10 = [(NSMutableDictionary *)self->_nowPlayingControllers allKeys];
  v33 = [v9 setWithArray:v10];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v11 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
  v32 = v8;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v35;
    *(void *)&long long v13 = 138412546;
    long long v31 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "routeUID", v31);
        if (v18)
        {
          [v8 addObject:v18];
          [v33 removeObject:v18];
          v19 = [(NSMutableDictionary *)self->_nowPlayingControllers objectForKeyedSubscript:v18];

          if (v19) {
            goto LABEL_14;
          }
          double v20 = [(MediaControlsEndpointsManager *)self->_endpointsManager endpointControllerForRoute:v17];
          double v21 = [[MRUEndpointController alloc] initWithEndpointController:v20];
          v22 = [[MRUNowPlayingController alloc] initWithEndpointController:v21];
          [(MRUNowPlayingController *)v22 addObserver:self];
          [(NSMutableDictionary *)self->_nowPlayingControllers setObject:v22 forKeyedSubscript:v18];

          uint64_t v8 = v32;
        }
        else
        {
          double v20 = MCLogCategoryDefault();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = objc_opt_class();
            *(_DWORD *)buf = v31;
            uint64_t v39 = v23;
            __int16 v40 = 2112;
            v41 = v17;
            _os_log_impl(&dword_1AE7DF000, v20, OS_LOG_TYPE_ERROR, "%@ ignoring endpoint route with no routeUID: %@", buf, 0x16u);
          }
        }

LABEL_14:
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v14);
  }

  nowPlayingControllers = self->_nowPlayingControllers;
  v25 = [v33 allObjects];
  [(NSMutableDictionary *)nowPlayingControllers removeObjectsForKeys:v25];

  id v26 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v26 appendSectionsWithIdentifiers:&unk_1F069F290];
  [v26 appendItemsWithIdentifiers:v8];
  [(UITableViewDiffableDataSource *)self->_dataSource applySnapshot:v26 animatingDifferences:1];
  [(MRUViewServiceRoutingViewController *)self updateSelectedViewController];
  [(MRUViewServiceRoutingViewController *)self updateMoreButtonVisibility];
  id v27 = [(NSMutableDictionary *)self->_nowPlayingControllers allValues];
  [(MRURoutingViewController *)self->_routingViewController setNowPlayingControllers:v27];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v29 = [(MRUViewServiceRoutingViewController *)self view];
  if ([v29 state] == 1)
  {
    char v30 = objc_opt_respondsToSelector();

    if (v30) {
      [WeakRetained viewServiceRoutingViewControllerDidChangeSize:self];
    }
  }
  else
  {
  }
}

- (void)updateMoreButtonVisibility
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(MRUViewServiceRoutingViewController *)self isViewLoaded])
  {
    if (self->_onScreen
      && ([(MRUViewServiceRoutingViewController *)self view],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v3 state],
          v3,
          v4 == 1))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __65__MRUViewServiceRoutingViewController_updateMoreButtonVisibility__block_invoke;
      v11[3] = &unk_1E5F0D7F8;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "mru_animateUsingType:animations:", 0, v11);
    }
    else
    {
      BOOL v5 = [(MRUViewServiceRoutingViewController *)self canShowMoreButton];
      id v6 = [(MRUViewServiceRoutingViewController *)self view];
      [v6 setFooterVisible:v5];
    }
    [(MRUViewServiceRoutingViewController *)self updateRoutingViewControllerScrollIndicatorInsets];
    id v7 = MCLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      configuration = self->_configuration;
      uint64_t v10 = [(NSMutableDictionary *)self->_nowPlayingControllers count];
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = configuration;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ can control other devices, configuration: %{public}@ | endpoint #: %lu", buf, 0x20u);
    }
  }
}

void __65__MRUViewServiceRoutingViewController_updateMoreButtonVisibility__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) canShowMoreButton];
  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 setFooterVisible:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

- (void)updateDiscoveryMode
{
  if (self->_onScreen) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(MediaControlsEndpointsManager *)self->_endpointsManager setDiscoveryMode:v3];
  routingViewController = self->_routingViewController;

  [(MRURoutingViewController *)routingViewController setDiscoveryMode:v3];
}

- (void)updateRoutingViewController
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@(devices)", v5];

  id v7 = objc_alloc_init(MRUOutputDeviceRoutingDataSource);
  outputDeviceRoutingDataSource = self->_outputDeviceRoutingDataSource;
  self->_outputDeviceRoutingDataSource = v7;

  int v9 = [(MRUNowPlayingController *)self->_selectedNowPlayingController endpointController];
  uint64_t v10 = [v9 route];
  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setEndpointRoute:v10];

  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setDetachesRoutesToGroup:1];
  uint64_t v11 = [(MPMediaControlsConfiguration *)self->_configuration routingContextUID];
  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setRoutingContextUID:v11];

  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setInitiator:*MEMORY[0x1E4F49EE8]];
  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setSupportsQueueHandoff:self->_supportsQueueHandoff];
  uint64_t v12 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];
  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setPresentingAppBundleID:v12];

  uint64_t v13 = [(MPMediaControlsConfiguration *)self->_configuration nowPlayingAppBundleID];
  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setNowPlayingAppBundleID:v13];

  __int16 v14 = [(MPMediaControlsConfiguration *)self->_configuration visibleMediaApps];
  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setVisibleMediaApps:v14];

  uint64_t v15 = [(MPMediaControlsConfiguration *)self->_configuration donatingAppBundleID];
  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setDonatingAppBundleID:v15];

  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setDonatingAppEligible:[(MPMediaControlsConfiguration *)self->_configuration isDonatingAppEligible]];
  unint64_t v16 = [(MPMediaControlsConfiguration *)self->_configuration style];
  if (v16 <= 5 && ((0x2Fu >> v16) & 1) != 0)
  {
    [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setSupportsMultipleSelection:(0xDu >> v16) & 1];
    [(MPAVRoutingDataSource *)self->_outputDeviceRoutingDataSource setFilterMode:0];
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F31850]) initWithDataSource:self->_outputDeviceRoutingDataSource name:v6];
  uint64_t v18 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];
  [v17 setPresentedBundleID:v18];

  [v17 setPlaybackDataSource:self->_endpointsManager];
  [v17 setFetchAvailableRoutesSynchronously:1];
  vendorSpecificManager = self->_vendorSpecificManager;
  double v20 = [v17 availableRoutes];
  [(MRUVendorSpecificDeviceManager *)vendorSpecificManager resolverAddNativeRoutes:v20];

  [v17 setFetchAvailableRoutesSynchronously:0];
  double v21 = [[MRURoutingViewController alloc] initWithRoutingController:v17];
  [(MRUViewServiceRoutingViewController *)self setRoutingViewController:v21];

  [(MRURoutingViewController *)self->_routingViewController setPresentingAppProcessIdentifier:[(MPMediaControlsConfiguration *)self->_configuration presentingAppProcessIdentifier]];
  v22 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];
  [(MRURoutingViewController *)self->_routingViewController setPresentingAppBundleID:v22];

  uint64_t v23 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];
  [(MRUOutputDeviceRoutingDataSource *)self->_outputDeviceRoutingDataSource setPresentingAppBundleID:v23];

  id v24 = [(MPMediaControlsConfiguration *)self->_configuration nowPlayingAppBundleID];
  [(MRURoutingViewController *)self->_routingViewController setNowPlayingAppBundleID:v24];

  v25 = [(MPMediaControlsConfiguration *)self->_configuration visibleMediaApps];
  [(MRURoutingViewController *)self->_routingViewController setVisibleMediaApps:v25];

  id v26 = [(MPMediaControlsConfiguration *)self->_configuration donatingAppBundleID];
  [(MRURoutingViewController *)self->_routingViewController setDonatingAppBundleID:v26];

  [(MRURoutingViewController *)self->_routingViewController setDonatingAppEligible:[(MPMediaControlsConfiguration *)self->_configuration isDonatingAppEligible]];
  [(MRURoutingViewController *)self->_routingViewController setVendorSpecificManager:self->_vendorSpecificManager];
  id v27 = [(MRUNowPlayingController *)self->_selectedNowPlayingController endpointController];
  v28 = [v27 route];
  [(MRURoutingViewController *)self->_routingViewController setEndpointRoute:v28];

  [(MRURoutingViewController *)self->_routingViewController setDelegate:self];
  [(MRURoutingViewController *)self->_routingViewController setSortByIsVideoRoute:[(MPMediaControlsConfiguration *)self->_configuration sortByIsVideoRoute]];
  [(MRURoutingViewController *)self->_routingViewController setShowMetadataForEndpointRoute:1];
  -[MRURoutingViewController setContentEdgeInsets:](self->_routingViewController, "setContentEdgeInsets:", 0.0, 24.0, 0.0, 24.0);
  v29 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    char v30 = [(MPMediaControlsConfiguration *)self->_configuration customRows];
    *(_DWORD *)buf = 138412290;
    v33 = v30;
    _os_log_impl(&dword_1AE7DF000, v29, OS_LOG_TYPE_DEFAULT, "config customRows: %@", buf, 0xCu);
  }
  long long v31 = [(MPMediaControlsConfiguration *)self->_configuration customRows];
  [(MRURoutingViewController *)self->_routingViewController setCustomRows:v31];
}

- (void)updateSelectedViewController
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPMediaControlsConfiguration *)self->_configuration routeUID];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    nowPlayingControllers = self->_nowPlayingControllers;
    id v6 = [(MPMediaControlsConfiguration *)self->_configuration routeUID];
    id v7 = [(NSMutableDictionary *)nowPlayingControllers objectForKeyedSubscript:v6];

    if (!v7)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v8 = [(NSMutableDictionary *)self->_nowPlayingControllers allValues];
      id v7 = (id)[v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7)
      {
        uint64_t v9 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v8);
            }
            uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v12 = [v11 endpointController];
            uint64_t v13 = [(MPMediaControlsConfiguration *)self->_configuration routeUID];
            int v14 = [v12 containsOutputDeviceWithRouteUID:v13];

            if (v14)
            {
              id v7 = v11;
              goto LABEL_16;
            }
          }
          id v7 = (id)[v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
  else
  {
    if (self->_canShowRemoteDevices)
    {
      uint64_t v15 = [(MediaControlsEndpointsManager *)self->_endpointsManager activeSystemRoute];
      char v16 = [v15 canModifyGroupMembership];

      if ((v16 & 1) == 0)
      {
        [(MRUViewServiceRoutingViewController *)self setState:1];
        double v21 = [(MRUViewServiceRoutingViewController *)self view];
        [v21 layoutIfNeeded];

        id v7 = 0;
        goto LABEL_20;
      }
      uint64_t v17 = self->_nowPlayingControllers;
      uint64_t v18 = [(MediaControlsEndpointsManager *)self->_endpointsManager activeSystemRoute];
    }
    else
    {
      uint64_t v17 = self->_nowPlayingControllers;
      uint64_t v18 = [MEMORY[0x1E4F31850] systemRoute];
    }
    v19 = v18;
    double v20 = [v18 routeUID];
    id v7 = [(NSMutableDictionary *)v17 objectForKeyedSubscript:v20];
  }
LABEL_20:
  [(MRUViewServiceRoutingViewController *)self setSelectedNowPlayingController:v7];
}

- (void)updateRoutingViewControllerScrollIndicatorInsets
{
  if ([(MRUViewServiceRoutingViewController *)self canShowMoreButton])
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    routingViewController = self->_routingViewController;
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    -[MRURoutingViewController setScrollIndicatorInsets:](routingViewController, "setScrollIndicatorInsets:", v3, v4, v6, v7);
  }
  else
  {
    id v9 = [(MRUViewServiceRoutingViewController *)self view];
    [v9 cornerRadius];
    -[MRURoutingViewController setScrollIndicatorInsets:](self->_routingViewController, "setScrollIndicatorInsets:", 0.0, 0.0, v8, 0.0);
  }
}

- (void)updateCellForIdentifier:(id)a3
{
  dataSource = self->_dataSource;
  id v5 = a3;
  id v9 = [(UITableViewDiffableDataSource *)dataSource indexPathForItemIdentifier:v5];
  double v6 = [(MRUViewServiceRoutingViewController *)self view];
  double v7 = [v6 tableView];
  double v8 = [v7 cellForRowAtIndexPath:v9];

  [(MRUViewServiceRoutingViewController *)self updateCell:v8 forIdentifier:v5];
}

- (void)updateCell:(id)a3 forIdentifier:(id)a4
{
  nowPlayingControllers = self->_nowPlayingControllers;
  id v6 = a3;
  id v34 = [(NSMutableDictionary *)nowPlayingControllers objectForKeyedSubscript:a4];
  double v7 = [v34 endpointController];
  v32 = [v7 route];

  double v8 = [v34 metadataController];
  id v9 = [v8 artwork];

  uint64_t v10 = [v34 metadataController];
  uint64_t v11 = [v10 nowPlayingInfo];

  uint64_t v12 = [v34 quickControlItem];
  uint64_t v13 = [v6 cellContentView];
  int v14 = [v13 artworkView];

  uint64_t v15 = [v6 cellContentView];
  char v16 = [v15 headerView];

  uint64_t v17 = [v6 cellContentView];
  uint64_t v18 = [v17 headerView];
  v19 = [v18 labelView];

  [v14 setArtwork:v9];
  double v20 = (void *)MEMORY[0x1E4FB1818];
  double v21 = [v34 deviceSymbolName];
  long long v22 = [v20 _systemImageNamed:v21];
  [v14 setPlaceholderImage:v22];

  [v19 setRoute:v32];
  long long v23 = [v11 stringForComponents:59];
  [v19 setTitle:v23];

  long long v24 = [v11 placeholder];
  [v19 setPlaceholder:v24];

  objc_msgSend(v19, "setShowPlaceholder:", objc_msgSend(v11, "showPlaceholder"));
  long long v25 = [v34 identifier];
  id v26 = [v16 transportButton];
  [v26 setIdentifier:v25];

  objc_msgSend(v16, "setShowTransportButton:", objc_msgSend(v12, "isEnabled"));
  uint64_t v27 = [v16 transportButton];
  v28 = [v12 asset];
  [v27 setAsset:v28];

  v29 = [v16 transportButton];
  [v29 addTarget:self action:sel_didSelectQuickControl_ forControlEvents:64];

  char v30 = [(MRUViewServiceRoutingViewController *)self view];
  long long v31 = [v30 stylingProvider];
  [v6 setStylingProvider:v31];

  objc_msgSend(v6, "setContentEdgeInsets:", 24.0, 24.0, 24.0, 24.0);
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUViewServiceRoutingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUViewServiceRoutingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MediaControlsEndpointsManager)endpointsManager
{
  return self->_endpointsManager;
}

- (void)setEndpointsManager:(id)a3
{
}

- (MRURoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (MRUOutputDeviceRoutingDataSource)outputDeviceRoutingDataSource
{
  return self->_outputDeviceRoutingDataSource;
}

- (void)setOutputDeviceRoutingDataSource:(id)a3
{
}

- (UITableViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSMutableDictionary)nowPlayingControllers
{
  return self->_nowPlayingControllers;
}

- (void)setNowPlayingControllers:(id)a3
{
}

- (MRUNowPlayingController)selectedNowPlayingController
{
  return self->_selectedNowPlayingController;
}

- (id)replaceRoutes
{
  return self->_replaceRoutes;
}

- (void)setReplaceRoutes:(id)a3
{
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)canShowRemoteDevices
{
  return self->_canShowRemoteDevices;
}

- (void)setCanShowRemoteDevices:(BOOL)a3
{
  self->_canShowRemoteDevices = a3;
}

- (BOOL)supportsQueueHandoff
{
  return self->_supportsQueueHandoff;
}

- (void)setSupportsQueueHandoff:(BOOL)a3
{
  self->_supportsQueueHandoff = a3;
}

- (UIViewController)alertViewController
{
  return self->_alertViewController;
}

- (MRUVendorSpecificDeviceManager)vendorSpecificManager
{
  return self->_vendorSpecificManager;
}

- (void)setVendorSpecificManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorSpecificManager, 0);
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong(&self->_replaceRoutes, 0);
  objc_storeStrong((id *)&self->_selectedNowPlayingController, 0);
  objc_storeStrong((id *)&self->_nowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_outputDeviceRoutingDataSource, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_endpointsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end