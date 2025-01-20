@interface CPSInstrumentClusterCardViewController
- (BOOL)isMapContentOnly;
- (BOOL)isRightHandDrive;
- (BOOL)shouldUpdateContent;
- (BOOL)showETA;
- (BOOL)supportsVehicleData;
- (CARScreenInfo)carScreenInfo;
- (CPSClusterEstimatesViewController)estimatesViewController;
- (CPSClusterManeuversCardView)currentManeuversCardView;
- (CPSClusterPausedCardView)currentPausedCardView;
- (CPSInstrumentClusterCardLayout)layout;
- (CPSInstrumentClusterCardViewController)init;
- (CPSSafeAreaDelegate)safeAreaDelegate;
- (UIEdgeInsets)_layoutGuideForClient;
- (UIEdgeInsets)currentClientInsets;
- (UIViewController)platterViewController;
- (id)initForMapContent;
- (unint64_t)layoutOverride;
- (void)_evaluateLayout;
- (void)_setupConstraintsForETACard;
- (void)_setupConstraintsForPauseCard;
- (void)_setupConstraintsForPlatterView;
- (void)_setupConstraintsForTurnCard;
- (void)_transitionFromViews:(id)a3 inView:(id)a4 horizontalSlideAnimation:(BOOL)a5;
- (void)_updateClientSafeArea;
- (void)_updateClientSafeAreaWithInsets:(UIEdgeInsets)a3;
- (void)navigator:(id)a3 didEndTrip:(BOOL)a4;
- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6;
- (void)setCARScreenInfo:(id)a3 isRightHandDrive:(BOOL)a4 supportsVehicleData:(BOOL)a5;
- (void)setCurrentClientInsets:(UIEdgeInsets)a3;
- (void)setCurrentManeuversCardView:(id)a3;
- (void)setCurrentPausedCardView:(id)a3;
- (void)setEstimatesViewController:(id)a3;
- (void)setIsMapContentOnly:(BOOL)a3;
- (void)setIsRightHandDrive:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setLayoutOverride:(unint64_t)a3;
- (void)setPlatterViewController:(id)a3;
- (void)setSafeAreaDelegate:(id)a3;
- (void)setShowETA:(BOOL)a3;
- (void)setSupportsVehicleData:(BOOL)a3;
- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4;
- (void)updateEstimates:(id)a3 forManeuver:(id)a4;
- (void)updateTripEstimates:(id)a3;
- (void)viewController:(id)a3 didUpdateSafeAreaInsets:(UIEdgeInsets)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CPSInstrumentClusterCardViewController

- (CPSInstrumentClusterCardViewController)init
{
  SEL v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)CPSInstrumentClusterCardViewController;
  v10 = [(CPSInstrumentClusterCardViewController *)&v8 init];
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v2 = (UIViewController *)objc_alloc_init(MEMORY[0x263F1CB68]);
    platterViewController = v10->_platterViewController;
    v10->_platterViewController = v2;

    v4 = objc_alloc_init(CPSClusterEstimatesViewController);
    estimatesViewController = v10->_estimatesViewController;
    v10->_estimatesViewController = v4;

    [(CPSDashboardEstimatesViewController *)v10->_estimatesViewController setSafeAreaDelegate:v10];
    v10->_shouldUpdateContent = 0;
    v10->_isMapContentOnly = 0;
  }
  v7 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (id)initForMapContent
{
  v4 = 0;
  v4 = [(CPSInstrumentClusterCardViewController *)self init];
  objc_storeStrong((id *)&v4, v4);
  if (v4) {
    v4->_isMapContentOnly = 1;
  }
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSInstrumentClusterCardViewController;
  [(CPSInstrumentClusterCardViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSInstrumentClusterCardViewController;
  [(CPSInstrumentClusterCardViewController *)&v3 viewDidAppear:a3];
  v6->_shouldUpdateContent = 1;
  [(CPSInstrumentClusterCardViewController *)v6 _evaluateLayout];
  [(CPSInstrumentClusterCardViewController *)v6 _updateClientSafeArea];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSInstrumentClusterCardViewController;
  [(CPSInstrumentClusterCardViewController *)&v3 viewDidDisappear:a3];
  -[CPSInstrumentClusterCardViewController _updateClientSafeAreaWithInsets:](v6, "_updateClientSafeAreaWithInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  v6->_shouldUpdateContent = 0;
}

- (void)viewDidLayoutSubviews
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v32 = self;
  SEL v31 = a2;
  v30.receiver = self;
  v30.super_class = (Class)CPSInstrumentClusterCardViewController;
  [(CPSInstrumentClusterCardViewController *)&v30 viewDidLayoutSubviews];
  v22 = [(CPSInstrumentClusterCardViewController *)v32 layout];

  if (!v22) {
    goto LABEL_13;
  }
  if ([(CPSInstrumentClusterCardViewController *)v32 layoutOverride])
  {
    v21 = [[CPSInstrumentClusterCardLayout alloc] initWithLayout:[(CPSInstrumentClusterCardViewController *)v32 layoutOverride]];
    [(CPSInstrumentClusterCardViewController *)v32 setLayout:"setLayout:"];

LABEL_13:
    [(CPSInstrumentClusterCardViewController *)v32 _updateClientSafeArea];
    return;
  }
  v20 = [(CPSInstrumentClusterCardViewController *)v32 carScreenInfo];

  if (!v20) {
    goto LABEL_13;
  }
  id v18 = (id)[(CARScreenInfo *)v32->_carScreenInfo currentViewArea];
  [v18 visibleFrame];
  v29.origin.x = v2;
  v29.origin.y = v3;
  v29.size.width = v4;
  v29.size.height = v5;
  [(CPSInstrumentClusterCardLayout *)v32->_layout viewArea];
  v28.origin.x = v6;
  v28.origin.y = v7;
  v28.size.width = v8;
  v28.size.height = v9;
  char v25 = 0;
  LOBYTE(v19) = 1;
  if (CGRectEqualToRect(v29, v28))
  {
    id v26 = (id)[(CARScreenInfo *)v32->_carScreenInfo currentViewArea];
    char v25 = 1;
    [v26 safeFrame];
    rect1.origin.x = v10;
    rect1.origin.y = v11;
    rect1.size.width = v12;
    rect1.size.height = v13;
    [(CPSInstrumentClusterCardLayout *)v32->_layout safeArea];
    rect2.origin.x = v14;
    rect2.origin.y = v15;
    rect2.size.width = v16;
    rect2.size.height = v17;
    BOOL v19 = !CGRectEqualToRect(rect1, rect2);
  }
  if (v25) {

  }
  if (!v19) {
    goto LABEL_13;
  }
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v32);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_INFO, "%@: view area or safe area changed. Reevaluating Layout.", v33, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(CPSInstrumentClusterCardViewController *)v32 _evaluateLayout];
}

- (void)setLayout:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CGFloat v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = CarPlaySupportGeneralLogging();
  os_log_type_t v9 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
  {
    CGFloat v6 = v12;
    id v7 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(location[0], "layoutForCard"));
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v6, (uint64_t)v7);
    _os_log_impl(&dword_22B689000, (os_log_t)v10, v9, "%@: Setting Layout: %@", v13, 0x16u);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v12->_layout, location[0]);
  [(CPSInstrumentClusterCardViewController *)v12 _setupConstraintsForPlatterView];
  [(CPSInstrumentClusterCardViewController *)v12 _setupConstraintsForETACard];
  CGFloat v5 = [(CPSInstrumentClusterCardViewController *)v12 currentManeuversCardView];

  if (v5)
  {
    CGFloat v4 = [(CPSInstrumentClusterCardViewController *)v12 currentManeuversCardView];
    CGFloat v3 = [(CPSManeuversCardView *)v4 maneuvers];
    id v8 = (id)[(NSArray *)v3 copy];

    objc_storeStrong((id *)&v12->_currentManeuversCardView, 0);
    [(CPSInstrumentClusterCardViewController *)v12 showManeuvers:v8 usingDisplayStyles:MEMORY[0x263EFFA68]];
    objc_storeStrong(&v8, 0);
  }
  [(CPSInstrumentClusterCardViewController *)v12 _setupConstraintsForPauseCard];
  [(CPSInstrumentClusterCardViewController *)v12 _updateClientSafeArea];
  objc_storeStrong(location, 0);
}

- (void)setCARScreenInfo:(id)a3 isRightHandDrive:(BOOL)a4 supportsVehicleData:(BOOL)a5
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v8->_carScreenInfo, location[0]);
  v8->_isRightHandDrive = a4;
  v8->_supportsVehicleData = a5;
  [(CPSInstrumentClusterCardViewController *)v8 _evaluateLayout];
  objc_storeStrong(location, 0);
}

- (void)setSafeAreaDelegate:(id)a3
{
  CGFloat v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_safeAreaDelegate);
  BOOL v4 = WeakRetained == location[0];

  if (!v4)
  {
    objc_storeWeak((id *)&v6->_safeAreaDelegate, location[0]);
    [(CPSInstrumentClusterCardViewController *)v6 _updateClientSafeArea];
  }
  objc_storeStrong(location, 0);
}

- (void)_evaluateLayout
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  v86 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  os_log_type_t v84 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v90, (uint64_t)v86);
    _os_log_impl(&dword_22B689000, (os_log_t)location[0], v84, "%@: Evaluating Layout", v90, 0xCu);
  }
  objc_storeStrong(location, 0);
  if ([(CPSInstrumentClusterCardViewController *)v86 supportsVehicleData])
  {
    id v83 = CarPlaySupportGeneralLogging();
    os_log_type_t v82 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v89, (uint64_t)v86);
      _os_log_impl(&dword_22B689000, (os_log_t)v83, v82, "%@: Supports vehicle data", v89, 0xCu);
    }
    objc_storeStrong(&v83, 0);
    id v47 = (id)[(CPSInstrumentClusterCardViewController *)v86 view];
    [v47 frame];
    double v78 = v2;
    double v79 = v3;
    uint64_t v80 = v4;
    uint64_t v81 = v5;

    id v49 = (id)[(CPSInstrumentClusterCardViewController *)v86 view];
    id v48 = (id)[v49 safeAreaLayoutGuide];
    [v48 layoutFrame];
    double v74 = v6;
    double v75 = v7;
    double v76 = v8;
    uint64_t v77 = v9;

    if (v76 > 300.0)
    {
      id v37 = (id)[(CPSInstrumentClusterCardViewController *)v86 view];
      id v36 = (id)[v37 window];
      id v35 = (id)[v36 screen];
      id v34 = (id)[v35 displayConfiguration];
      [v34 pointScale];
      double v38 = v10;

      double v71 = v38;
      v41 = [(CPSInstrumentClusterCardViewController *)v86 carScreenInfo];
      [(CARScreenInfo *)v41 physicalSize];
      double v68 = v11;
      uint64_t v69 = v12;
      double v40 = v11;
      v39 = [(CPSInstrumentClusterCardViewController *)v86 carScreenInfo];
      [(CARScreenInfo *)v39 pixelSize];
      double v66 = v13;
      uint64_t v67 = v14;
      double v42 = v40 / v13;

      double v70 = v42;
      CGSizeMake_14();
      uint64_t v64 = v15;
      uint64_t v65 = v16;
      CGSizeMake_14();
      uint64_t v62 = v17;
      uint64_t v63 = v18;
      double v61 = (v74 - v78) * v38;
      double v60 = (v75 - v79) * v38;
      CGPointMake_0();
      uint64_t v58 = v19;
      uint64_t v59 = v20;
      CGRectMake_7();
      *(void *)&long long v56 = v21;
      *((void *)&v56 + 1) = v22;
      *(void *)&long long v57 = v23;
      *((void *)&v57 + 1) = v24;
      CGRectMake_7();
      *(void *)&long long v54 = v25;
      *((void *)&v54 + 1) = v26;
      *(void *)&long long v55 = v27;
      *((void *)&v55 + 1) = v28;
      CGRect v29 = [CPSInstrumentClusterCardLayout alloc];
      id v53 = -[CPSInstrumentClusterCardLayout initWithSafeAreaFrame:viewAreaFrame:displayFrame:physicalPixelWidth:isRightHandDrive:](v29, "initWithSafeAreaFrame:viewAreaFrame:displayFrame:physicalPixelWidth:isRightHandDrive:", v86->_isRightHandDrive, v56, v57, v54, v55, v54, v55, *(void *)&v42);
      [(CPSInstrumentClusterCardViewController *)v86 setLayout:v53];
      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      os_log_type_t v51 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        v32 = v86;
        id v33 = (id)[NSNumber numberWithDouble:v76];
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v87, (uint64_t)v32, (uint64_t)v33);
        _os_log_impl(&dword_22B689000, oslog, v51, "%@: Cluster safe area width %@ greater than 300. Showing ETA.", v87, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [(CPSInstrumentClusterCardViewController *)v86 setShowETA:1];
      objc_storeStrong(&v53, 0);
    }
    else
    {
      id v73 = CarPlaySupportGeneralLogging();
      os_log_type_t v72 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_INFO))
      {
        v45 = v86;
        id v46 = (id)[NSNumber numberWithDouble:v76];
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v88, (uint64_t)v45, (uint64_t)v46);
        _os_log_impl(&dword_22B689000, (os_log_t)v73, v72, "%@: Cluster safe area width %@ less/equal to 300. Using center layout.", v88, 0x16u);
      }
      objc_storeStrong(&v73, 0);
      [(CPSInstrumentClusterCardViewController *)v86 setShowETA:0];
      v43 = v86;
      v44 = +[CPSInstrumentClusterCardLayout layoutWithLayoutType:1];
      [(CPSInstrumentClusterCardViewController *)v43 setLayout:"setLayout:"];
    }
  }
  else
  {
    objc_super v30 = [CPSInstrumentClusterCardLayout alloc];
    SEL v31 = [(CPSInstrumentClusterCardViewController *)v86 carScreenInfo];
    v50 = [(CPSInstrumentClusterCardLayout *)v30 initWithCarScreenInfo:v31 isRightHandDrive:[(CPSInstrumentClusterCardViewController *)v86 isRightHandDrive]];

    [(CPSInstrumentClusterCardViewController *)v86 setLayout:v50];
    objc_storeStrong((id *)&v50, 0);
  }
}

- (void)_updateClientSafeArea
{
  double v11 = [(CPSInstrumentClusterCardViewController *)self currentPausedCardView];
  char v17 = 0;
  char v15 = 0;
  char v13 = 0;
  LOBYTE(v12) = 1;
  if (!v11)
  {
    uint64_t v18 = [(CPSInstrumentClusterCardViewController *)self currentManeuversCardView];
    char v17 = 1;
    LOBYTE(v12) = 1;
    if (!v18)
    {
      uint64_t v16 = [(CPSInstrumentClusterCardViewController *)self estimatesViewController];
      char v15 = 1;
      uint64_t v14 = [(CPSDashboardEstimatesViewController *)v16 cardPlatterView];
      char v13 = 1;
      int v12 = [(CPSCardPlatterView *)v14 isHidden] ^ 1;
    }
  }
  if (v13) {

  }
  if (v15) {
  if (v17)
  }

  if (v12)
  {
    [(CPSInstrumentClusterCardViewController *)self _layoutGuideForClient];
    -[CPSInstrumentClusterCardViewController _updateClientSafeAreaWithInsets:](self, "_updateClientSafeAreaWithInsets:", v2, v3, v4, v5);
  }
  else
  {
    id v10 = (id)[(CPSInstrumentClusterCardViewController *)self view];
    [v10 safeAreaInsets];
    -[CPSInstrumentClusterCardViewController _updateClientSafeAreaWithInsets:](self, "_updateClientSafeAreaWithInsets:", v6, v7, v8, v9);
  }
}

- (UIEdgeInsets)_layoutGuideForClient
{
  int v12 = [(CPSInstrumentClusterCardViewController *)self platterViewController];
  double v11 = [(UIViewController *)v12 view];
  [(UIView *)v11 layoutIfNeeded];

  id v14 = (id)[(CPSInstrumentClusterCardViewController *)self view];
  id v13 = (id)[v14 safeAreaLayoutGuide];
  [v13 layoutFrame];

  id v15 = (id)[(CPSInstrumentClusterCardViewController *)self view];
  [v15 safeAreaInsets];

  if (![(CPSInstrumentClusterCardViewController *)self isMapContentOnly]
    || ![(CPSInstrumentClusterCardViewController *)self showETA])
  {
    if ([(CPSInstrumentClusterCardLayout *)self->_layout layoutForCard] == 1 && self->_layout)
    {
      [(CPSInstrumentClusterCardViewController *)self showETA];
    }
    else if ([(CPSInstrumentClusterCardLayout *)self->_layout layoutForCard] == 2)
    {
      id v10 = [(CPSInstrumentClusterCardViewController *)self platterViewController];
      double v9 = [(UIViewController *)v10 view];
      [(UIView *)v9 bounds];
      double v8 = [(CPSInstrumentClusterCardViewController *)self platterViewController];
      double v7 = [(UIViewController *)v8 view];
      [(UIView *)v7 frame];
    }
    else
    {
      double v6 = [(UIViewController *)self->_platterViewController view];
      [(UIView *)v6 bounds];
    }
  }
  UIEdgeInsetsMake_6();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_updateClientSafeAreaWithInsets:(UIEdgeInsets)a3
{
  if (self->_shouldUpdateContent)
  {
    [(CPSInstrumentClusterCardViewController *)self currentClientInsets];
    if (!UIEdgeInsetsEqualToEdgeInsets_0(a3.top, a3.left, a3.bottom, a3.right, v3, v4, v5, v6))
    {
      -[CPSInstrumentClusterCardViewController setCurrentClientInsets:](self, "setCurrentClientInsets:", a3.top, a3.left, a3.bottom, a3.right);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_safeAreaDelegate);
      [(CPSInstrumentClusterCardViewController *)self currentClientInsets];
      objc_msgSend(WeakRetained, "viewController:didUpdateSafeAreaInsets:", self, v7, v8, v9, v10);
    }
  }
}

- (void)_setupConstraintsForPlatterView
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  double v76 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  os_log_type_t v74 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    id v64 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CPSInstrumentClusterCardLayout layoutForCard](v76->_layout, "layoutForCard"));
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v81, (uint64_t)v76, (uint64_t)v64);
    _os_log_impl(&dword_22B689000, (os_log_t)location[0], v74, "%@ Setting constraints for platter view with layout: %@", v81, 0x16u);
  }
  objc_storeStrong(location, 0);
  id v73 = objc_alloc_init(MEMORY[0x263F1CB60]);
  id v56 = (id)[(CPSInstrumentClusterCardViewController *)v76 view];
  id v55 = (id)[v56 safeAreaLayoutGuide];
  [v55 layoutFrame];
  v70[1] = v2;
  v70[2] = v3;
  double v71 = v4;
  double v72 = v5;

  [(UIViewController *)v76->_platterViewController setView:v73];
  [(UIViewController *)v76->_platterViewController willMoveToParentViewController:v76];
  [(CPSInstrumentClusterCardViewController *)v76 addChildViewController:v76->_platterViewController];
  id v58 = (id)[(CPSInstrumentClusterCardViewController *)v76 view];
  long long v57 = [(UIViewController *)v76->_platterViewController view];
  objc_msgSend(v58, "addSubview:");

  [(UIViewController *)v76->_platterViewController didMoveToParentViewController:v76];
  uint64_t v59 = [(UIViewController *)v76->_platterViewController view];
  [(UIView *)v59 setClipsToBounds:0];

  v70[0] = [(UIViewController *)v76->_platterViewController view];
  [v70[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v60 = (id)[v70[0] widthAnchor];
  id v69 = (id)[v60 constraintGreaterThanOrEqualToConstant:140.0];

  objc_msgSend(v69, "setPriority:");
  id v61 = (id)[v70[0] widthAnchor];
  id v68 = (id)[v61 constraintLessThanOrEqualToConstant:213.0];

  LODWORD(v6) = 1148846080;
  [v68 setPriority:v6];
  uint64_t v62 = (void *)MEMORY[0x263F08938];
  v80[0] = v69;
  v80[1] = v68;
  id v63 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:2];
  objc_msgSend(v62, "activateConstraints:");

  if ([(CPSInstrumentClusterCardLayout *)v76->_layout layoutForCard] == 1 && v76->_layout)
  {
    id v40 = (id)[v70[0] widthAnchor];
    id v67 = (id)[v40 constraintEqualToConstant:v71 - 8.0];

    LODWORD(v7) = 1144750080;
    [v67 setPriority:v7];
    v41 = (void *)MEMORY[0x263F08938];
    id v54 = (id)[v70[0] centerXAnchor];
    id v53 = (id)[(CPSInstrumentClusterCardViewController *)v76 view];
    id v52 = (id)[v53 safeAreaLayoutGuide];
    id v51 = (id)[v52 centerXAnchor];
    id v50 = (id)objc_msgSend(v54, "constraintEqualToAnchor:");
    v79[0] = v50;
    id v49 = (id)[v70[0] centerYAnchor];
    id v48 = (id)[(CPSInstrumentClusterCardViewController *)v76 view];
    id v47 = (id)[v48 safeAreaLayoutGuide];
    id v46 = (id)[v47 centerYAnchor];
    id v45 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v79[1] = v45;
    id v44 = (id)[v70[0] heightAnchor];
    id v43 = (id)[v44 constraintEqualToConstant:v72 - 8.0];
    v79[2] = v43;
    v79[3] = v67;
    id v42 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:4];
    objc_msgSend(v41, "activateConstraints:");

    objc_storeStrong(&v67, 0);
  }
  else if ([(CPSInstrumentClusterCardLayout *)v76->_layout layoutForCard] == 2)
  {
    id v25 = (id)[v70[0] widthAnchor];
    id v66 = (id)[v25 constraintEqualToConstant:v71 * 0.4];

    LODWORD(v8) = 1144750080;
    [v66 setPriority:v8];
    uint64_t v26 = (void *)MEMORY[0x263F08938];
    id v39 = (id)[v70[0] leftAnchor];
    id v38 = (id)[(CPSInstrumentClusterCardViewController *)v76 view];
    id v37 = (id)[v38 safeAreaLayoutGuide];
    id v36 = (id)[v37 leftAnchor];
    id v35 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:");
    v78[0] = v35;
    id v34 = (id)[v70[0] topAnchor];
    id v33 = (id)[(CPSInstrumentClusterCardViewController *)v76 view];
    id v32 = (id)[v33 safeAreaLayoutGuide];
    id v31 = (id)[v32 topAnchor];
    id v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:constant:", 4.0);
    v78[1] = v30;
    id v29 = (id)[v70[0] heightAnchor];
    id v28 = (id)[v29 constraintEqualToConstant:v72 - 8.0];
    v78[2] = v28;
    v78[3] = v66;
    id v27 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:4];
    objc_msgSend(v26, "activateConstraints:");

    objc_storeStrong(&v66, 0);
  }
  else if ([(CPSInstrumentClusterCardLayout *)v76->_layout layoutForCard] == 3)
  {
    id v10 = (id)[v70[0] widthAnchor];
    id v65 = (id)[v10 constraintEqualToConstant:v71 * 0.4];

    LODWORD(v9) = 1144750080;
    [v65 setPriority:v9];
    double v11 = (void *)MEMORY[0x263F08938];
    id v24 = (id)[v70[0] rightAnchor];
    id v23 = (id)[(CPSInstrumentClusterCardViewController *)v76 view];
    id v22 = (id)[v23 safeAreaLayoutGuide];
    id v21 = (id)[v22 rightAnchor];
    id v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:", -8.0);
    v77[0] = v20;
    id v19 = (id)[v70[0] topAnchor];
    id v18 = (id)[(CPSInstrumentClusterCardViewController *)v76 view];
    id v17 = (id)[v18 safeAreaLayoutGuide];
    id v16 = (id)[v17 topAnchor];
    id v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 4.0);
    v77[1] = v15;
    id v14 = (id)[v70[0] heightAnchor];
    id v13 = (id)[v14 constraintEqualToConstant:v72 - 8.0];
    v77[2] = v13;
    v77[3] = v65;
    id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:4];
    objc_msgSend(v11, "activateConstraints:");

    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(v70, 0);
  objc_storeStrong(&v73, 0);
}

- (void)_setupConstraintsForETACard
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v25 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  os_log_type_t v23 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    id v21 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CPSInstrumentClusterCardLayout layoutForCard](v25->_layout, "layoutForCard"));
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v27, (uint64_t)v25, (uint64_t)v21);
    _os_log_impl(&dword_22B689000, (os_log_t)location[0], v23, "%@ Setting constraints for ETA Card with layout: %@", v27, 0x16u);
  }
  objc_storeStrong(location, 0);
  [(CPSClusterEstimatesViewController *)v25->_estimatesViewController willMoveToParentViewController:v25->_platterViewController];
  [(UIViewController *)v25->_platterViewController addChildViewController:v25->_estimatesViewController];
  double v3 = [(UIViewController *)v25->_platterViewController view];
  id v2 = (id)[(CPSClusterEstimatesViewController *)v25->_estimatesViewController view];
  -[UIView addSubview:](v3, "addSubview:");

  [(CPSClusterEstimatesViewController *)v25->_estimatesViewController didMoveToParentViewController:v25->_platterViewController];
  id v22 = (id)[(CPSClusterEstimatesViewController *)v25->_estimatesViewController view];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v4 = (void *)MEMORY[0x263F08938];
  id v20 = (id)[v22 leftAnchor];
  id v19 = [(CPSInstrumentClusterCardViewController *)v25 platterViewController];
  id v18 = [(UIViewController *)v19 view];
  id v17 = [(UIView *)v18 leftAnchor];
  id v16 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
  v26[0] = v16;
  id v15 = (id)[v22 rightAnchor];
  id v14 = [(CPSInstrumentClusterCardViewController *)v25 platterViewController];
  id v13 = [(UIViewController *)v14 view];
  id v12 = [(UIView *)v13 rightAnchor];
  id v11 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v26[1] = v11;
  id v10 = (id)[v22 bottomAnchor];
  double v9 = [(CPSInstrumentClusterCardViewController *)v25 platterViewController];
  double v8 = [(UIViewController *)v9 view];
  double v7 = [(UIView *)v8 bottomAnchor];
  id v6 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v26[2] = v6;
  id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  objc_msgSend(v4, "activateConstraints:");

  objc_storeStrong(&v22, 0);
}

- (void)_setupConstraintsForTurnCard
{
  v27[4] = *MEMORY[0x263EF8340];
  uint64_t v26 = self;
  v25[1] = (id)a2;
  if (self->_currentManeuversCardView && v26->_shouldUpdateContent && !v26->_isMapContentOnly)
  {
    v25[0] = v26->_currentManeuversCardView;
    id v2 = [(UIViewController *)v26->_platterViewController view];
    [(UIView *)v2 addSubview:v26->_currentManeuversCardView];

    double v3 = (void *)MEMORY[0x263F08938];
    id v24 = (id)[v25[0] leftAnchor];
    os_log_type_t v23 = [(CPSInstrumentClusterCardViewController *)v26 platterViewController];
    id v22 = [(UIViewController *)v23 view];
    id v21 = [(UIView *)v22 leftAnchor];
    id v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v27[0] = v20;
    id v19 = (id)[v25[0] topAnchor];
    id v18 = [(CPSInstrumentClusterCardViewController *)v26 platterViewController];
    id v17 = [(UIViewController *)v18 view];
    id v16 = [(UIView *)v17 topAnchor];
    id v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v27[1] = v15;
    id v14 = (id)[v25[0] widthAnchor];
    id v13 = [(CPSInstrumentClusterCardViewController *)v26 platterViewController];
    id v12 = [(UIViewController *)v13 view];
    id v11 = [(UIView *)v12 widthAnchor];
    id v10 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v27[2] = v10;
    id v9 = (id)[v25[0] heightAnchor];
    id v8 = (id)[(CPSInstrumentClusterCardViewController *)v26 view];
    id v7 = (id)[v8 safeAreaLayoutGuide];
    id v6 = (id)[v7 heightAnchor];
    id v5 = (id)objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:");
    v27[3] = v5;
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    objc_msgSend(v3, "activateConstraints:");

    objc_storeStrong(v25, 0);
  }
}

- (void)_setupConstraintsForPauseCard
{
  v27[4] = *MEMORY[0x263EF8340];
  uint64_t v26 = self;
  v25[1] = (id)a2;
  if (self->_currentPausedCardView && v26->_shouldUpdateContent && !v26->_isMapContentOnly)
  {
    v25[0] = v26->_currentPausedCardView;
    id v2 = [(UIViewController *)v26->_platterViewController view];
    [(UIView *)v2 addSubview:v26->_currentPausedCardView];

    double v3 = (void *)MEMORY[0x263F08938];
    id v24 = (id)[v25[0] leftAnchor];
    os_log_type_t v23 = [(CPSInstrumentClusterCardViewController *)v26 platterViewController];
    id v22 = [(UIViewController *)v23 view];
    id v21 = [(UIView *)v22 leftAnchor];
    id v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v27[0] = v20;
    id v19 = (id)[v25[0] topAnchor];
    id v18 = [(CPSInstrumentClusterCardViewController *)v26 platterViewController];
    id v17 = [(UIViewController *)v18 view];
    id v16 = [(UIView *)v17 topAnchor];
    id v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v27[1] = v15;
    id v14 = (id)[v25[0] widthAnchor];
    id v13 = [(CPSInstrumentClusterCardViewController *)v26 platterViewController];
    id v12 = [(UIViewController *)v13 view];
    id v11 = [(UIView *)v12 widthAnchor];
    id v10 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v27[2] = v10;
    id v9 = (id)[v25[0] heightAnchor];
    id v8 = (id)[(CPSInstrumentClusterCardViewController *)v26 view];
    id v7 = (id)[v8 safeAreaLayoutGuide];
    id v6 = (id)[v7 heightAnchor];
    id v5 = (id)objc_msgSend(v9, "constraintEqualToAnchor:multiplier:", 0.35);
    v27[3] = v5;
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    objc_msgSend(v3, "activateConstraints:");

    objc_storeStrong(v25, 0);
  }
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  if (([(CPSInstrumentClusterCardViewController *)v29 isViewLoaded] & 1) != 0 && !v29->_isMapContentOnly)
  {
    char v25 = 0;
    id v16 = [(CPSInstrumentClusterCardViewController *)v29 currentManeuversCardView];
    char v23 = 0;
    char v21 = 0;
    char v17 = 0;
    if (v16)
    {
      id v24 = [(CPSInstrumentClusterCardViewController *)v29 currentManeuversCardView];
      char v23 = 1;
      id v22 = [(CPSManeuversCardView *)v24 maneuvers];
      char v21 = 1;
      char v17 = BSEqualObjects();
    }
    if (v21) {

    }
    if (v23) {
    char v25 = v17 & 1;
    }
    if (v17)
    {
      int v26 = 1;
    }
    else
    {
      id v20 = 0;
      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v15 = [(CPSInstrumentClusterCardViewController *)v29 currentManeuversCardView];

      if (v15)
      {
        id v14 = [(CPSInstrumentClusterCardViewController *)v29 currentManeuversCardView];
        objc_msgSend(v19, "addObject:");
      }
      id v13 = [(CPSInstrumentClusterCardViewController *)v29 currentPausedCardView];

      if (v13)
      {
        id v12 = [(CPSInstrumentClusterCardViewController *)v29 currentPausedCardView];
        objc_msgSend(v19, "addObject:");
      }
      -[CPSInstrumentClusterCardViewController setCurrentManeuversCardView:](v29, "setCurrentManeuversCardView:");
      [(CPSInstrumentClusterCardViewController *)v29 setCurrentPausedCardView:0];
      if ([location[0] count])
      {
        id v4 = [CPSClusterManeuversCardView alloc];
        id v5 = [(CPSManeuversCardView *)v4 initWithManeuvers:location[0]];
        id v6 = v20;
        id v20 = v5;

        [(CPSManeuversCardView *)v20 setUsesCustomBackgroundColor:1];
        id v10 = (id)[location[0] firstObject];
        id v11 = (id)[v10 cardBackgroundColor];

        if (v11)
        {
          id v9 = [(CPSManeuversCardView *)v20 cardPlatterView];
          id v8 = (id)[location[0] firstObject];
          id v7 = (id)[v8 cardBackgroundColor];
          -[CPSCardPlatterView setBackgroundColor:](v9, "setBackgroundColor:");
        }
        [(CPSInstrumentClusterCardViewController *)v29 setCurrentManeuversCardView:v20];
        [(CPSInstrumentClusterCardViewController *)v29 _setupConstraintsForTurnCard];
      }
      [(CPSInstrumentClusterCardViewController *)v29 _transitionFromViews:v19 inView:v20 horizontalSlideAnimation:0];
      objc_storeStrong(&v19, 0);
      objc_storeStrong((id *)&v20, 0);
      int v26 = 0;
    }
  }
  else
  {
    int v26 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = [(CPSInstrumentClusterCardViewController *)v9 currentManeuversCardView];

  if (v6)
  {
    id v4 = [(CPSInstrumentClusterCardViewController *)v9 currentManeuversCardView];
    [(CPSManeuversCardView *)v4 updateEstimates:location[0] forManeuver:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v27 = a4;
  id v26 = 0;
  objc_storeStrong(&v26, a5);
  id v25 = 0;
  objc_storeStrong(&v25, a6);
  if (([(CPSInstrumentClusterCardViewController *)v29 isViewLoaded] & 1) != 0 && !v29->_isMapContentOnly)
  {
    id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
    char v17 = [(CPSInstrumentClusterCardViewController *)v29 currentManeuversCardView];

    if (v17)
    {
      id v16 = [(CPSInstrumentClusterCardViewController *)v29 currentManeuversCardView];
      objc_msgSend(v23, "addObject:");
    }
    id v15 = [(CPSInstrumentClusterCardViewController *)v29 currentPausedCardView];

    if (v15)
    {
      id v14 = [(CPSInstrumentClusterCardViewController *)v29 currentPausedCardView];
      objc_msgSend(v23, "addObject:");
    }
    -[CPSInstrumentClusterCardViewController setCurrentManeuversCardView:](v29, "setCurrentManeuversCardView:");
    [(CPSInstrumentClusterCardViewController *)v29 setCurrentPausedCardView:0];
    id v11 = [CPSClusterPausedCardView alloc];
    unint64_t v12 = v27;
    id v13 = v26;
    char v21 = 0;
    if (v25)
    {
      id v10 = v25;
    }
    else
    {
      id v22 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
      char v21 = 1;
      id v10 = v22;
    }
    id v9 = [(CPSPausedCardView *)v11 initWithReason:v12 title:v13 backgroundColor:v10];
    -[CPSInstrumentClusterCardViewController setCurrentPausedCardView:](v29, "setCurrentPausedCardView:");

    if (v21) {
    [(CPSInstrumentClusterCardViewController *)v29 _setupConstraintsForPauseCard];
    }
    id v7 = v29;
    id v6 = v23;
    id v8 = [(CPSInstrumentClusterCardViewController *)v29 currentPausedCardView];
    -[CPSInstrumentClusterCardViewController _transitionFromViews:inView:horizontalSlideAnimation:](v7, "_transitionFromViews:inView:horizontalSlideAnimation:", v6);

    objc_storeStrong(&v23, 0);
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)updateTripEstimates:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSInstrumentClusterCardViewController *)v4 _updateClientSafeArea];
  if (objc_opt_respondsToSelector()) {
    [(CPSDashboardEstimatesViewController *)v4->_estimatesViewController updateTripEstimates:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSDashboardEstimatesViewController *)v8->_estimatesViewController navigator:location[0] didEndTrip:a4];
  id v5 = [(CPSInstrumentClusterCardViewController *)v8 currentManeuversCardView];
  [(CPSClusterManeuversCardView *)v5 removeFromSuperview];

  id v6 = [(CPSInstrumentClusterCardViewController *)v8 currentPausedCardView];
  [(CPSClusterPausedCardView *)v6 removeFromSuperview];

  [(CPSInstrumentClusterCardViewController *)v8 setCurrentManeuversCardView:0];
  [(CPSInstrumentClusterCardViewController *)v8 setCurrentPausedCardView:0];
  [(CPSInstrumentClusterCardViewController *)v8 _updateClientSafeArea];
  objc_storeStrong(location, 0);
}

- (void)setShowETA:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  unsigned __int8 v15 = 0;
  char v13 = 0;
  char v11 = 0;
  if (a3)
  {
    char v10 = 1;
    if (!v18->_isMapContentOnly)
    {
      id v14 = [(CPSInstrumentClusterCardViewController *)v18 layout];
      char v13 = 1;
      char v10 = [(CPSInstrumentClusterCardLayout *)v14 showETAWithTurnCard];
    }
    char v11 = v10;
  }
  if (v13) {

  }
  unsigned __int8 v15 = v11 & 1;
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    id v9 = (id)[NSNumber numberWithBool:v16];
    id v8 = (id)[NSNumber numberWithBool:v18->_isMapContentOnly];
    id v4 = NSNumber;
    id v7 = [(CPSInstrumentClusterCardViewController *)v18 layout];
    id v6 = (id)objc_msgSend(v4, "numberWithBool:", -[CPSInstrumentClusterCardLayout showETAWithTurnCard](v7, "showETAWithTurnCard"));
    id v5 = (id)[NSNumber numberWithBool:v15 & 1];
    __os_log_helper_16_2_5_8_64_8_64_8_64_8_64_8_64((uint64_t)v19, (uint64_t)v18, (uint64_t)v9, (uint64_t)v8, (uint64_t)v6, (uint64_t)v5);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_INFO, "%@: showETA %@, mapOnly: %@, layout specified show ETA: %@, shouldShowETA: %@", v19, 0x34u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v18->_showETA = v15 & 1;
  id v3 = (id)[(CPSClusterEstimatesViewController *)v18->_estimatesViewController view];
  [v3 setHidden:(v15 ^ 1) & 1];

  [(CPSInstrumentClusterCardViewController *)v18 _updateClientSafeArea];
}

- (void)_transitionFromViews:(id)a3 inView:(id)a4 horizontalSlideAnimation:(BOOL)a5
{
  uint64_t v81 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v79 = 0;
  objc_storeStrong(&v79, a4);
  BOOL v78 = a5;
  if ([location[0] count] && v81->_shouldUpdateContent)
  {
    BOOL v77 = v79 == 0;
    id v25 = [(CPSInstrumentClusterCardViewController *)v81 platterViewController];
    id v76 = [(UIViewController *)v25 view];

    id v26 = location[0];
    uint64_t v67 = MEMORY[0x263EF8330];
    int v68 = -1073741824;
    int v69 = 0;
    double v70 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke;
    double v71 = &unk_2648A5928;
    id v72 = v76;
    BOOL v74 = v77;
    BOOL v75 = v78;
    id v73 = v81;
    [v26 enumerateObjectsUsingBlock:&v67];
    if (v79 && v78)
    {
      [v76 layoutIfNeeded];
      [v79 frame];
      *(void *)&long long v65 = v5;
      *((void *)&v65 + 1) = v6;
      *(void *)&long long v66 = v7;
      *((void *)&v66 + 1) = v8;
      [v79 frame];
      *(void *)&long long v63 = v9;
      *((void *)&v63 + 1) = v10;
      *(void *)&long long v64 = v11;
      *((void *)&v64 + 1) = v12;
      *(double *)&long long v65 = *(double *)&v65 + *(double *)&v66 + 8.0;
      objc_msgSend(v79, "setFrame:", v65, v66);
      int v24 = (void *)MEMORY[0x263F1CB60];
      uint64_t v55 = MEMORY[0x263EF8330];
      int v56 = -1073741824;
      int v57 = 0;
      id v58 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_4;
      uint64_t v59 = &unk_2648A3B68;
      id v60 = v79;
      long long v61 = v63;
      long long v62 = v64;
      uint64_t v49 = MEMORY[0x263EF8330];
      int v50 = -1073741824;
      int v51 = 0;
      id v52 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_5;
      id v53 = &unk_2648A3B90;
      id v54 = v81;
      [v24 animateWithDuration:0 delay:&v55 options:&v49 animations:0.4 completion:0.0];
      objc_storeStrong((id *)&v54, 0);
      objc_storeStrong(&v60, 0);
    }
    objc_storeStrong((id *)&v73, 0);
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v76, 0);
  }
  else if (v79 && v81->_shouldUpdateContent)
  {
    id v22 = [(CPSInstrumentClusterCardViewController *)v81 platterViewController];
    char v21 = [(UIViewController *)v22 view];
    [(UIView *)v21 layoutIfNeeded];

    [v79 frame];
    *(void *)&long long v47 = v13;
    *((void *)&v47 + 1) = v14;
    *(void *)&long long v48 = v15;
    *((void *)&v48 + 1) = v16;
    [v79 frame];
    double v43 = v17;
    double v45 = v18;
    double v46 = v19;
    double v44 = v20 - v19;
    objc_msgSend(v79, "setFrame:", v17, v20 - v19, v18, v19);
    id v23 = (void *)MEMORY[0x263F1CB60];
    uint64_t v35 = MEMORY[0x263EF8330];
    int v36 = -1073741824;
    int v37 = 0;
    id v38 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_6;
    id v39 = &unk_2648A3B68;
    id v40 = v79;
    long long v41 = v47;
    long long v42 = v48;
    uint64_t v29 = MEMORY[0x263EF8330];
    int v30 = -1073741824;
    int v31 = 0;
    id v32 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_7;
    id v33 = &unk_2648A3B90;
    id v34 = v81;
    [v23 animateWithDuration:&v35 animations:&v29 completion:0.35];
    objc_storeStrong((id *)&v34, 0);
    objc_storeStrong(&v40, 0);
  }
  objc_storeStrong(&v79, 0);
  objc_storeStrong(location, 0);
}

void __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v37[3] = a3;
  v37[2] = a4;
  v37[1] = (id)a1;
  v37[0] = (id)[location[0] snapshotViewAfterScreenUpdates:0];
  [*(id *)(a1 + 32) addSubview:v37[0]];
  [location[0] frame];
  double v33 = v4;
  double v34 = v5;
  double v35 = v6;
  double v36 = v7;
  objc_msgSend(v37[0], "setFrame:", v4, v5, v6, v7);
  [location[0] removeFromSuperview];
  [v37[0] frame];
  *(void *)&long long v31 = v8;
  *((void *)&v31 + 1) = v9;
  *(void *)&long long v32 = v10;
  *((void *)&v32 + 1) = v11;
  if (*(unsigned char *)(a1 + 48)) {
    *((double *)&v31 + 1) = *((double *)&v31 + 1) - *((double *)&v32 + 1) - 8.0;
  }
  else {
    *(double *)&long long v31 = *(double *)&v31 - *(double *)&v32 - 8.0;
  }
  if (*(unsigned char *)(a1 + 48) & 1) != 0 || (*(unsigned char *)(a1 + 49))
  {
    uint64_t v12 = (void *)MEMORY[0x263F1CB60];
    uint64_t v23 = MEMORY[0x263EF8330];
    int v24 = -1073741824;
    int v25 = 0;
    id v26 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_2;
    unint64_t v27 = &unk_2648A3B68;
    id v28 = v37[0];
    long long v29 = v31;
    long long v30 = v32;
    uint64_t v16 = MEMORY[0x263EF8330];
    int v17 = -1073741824;
    int v18 = 0;
    double v19 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_3;
    double v20 = &unk_2648A4F58;
    id v21 = v37[0];
    id v22 = *(id *)(a1 + 40);
    [v12 animateWithDuration:&v23 animations:&v16 completion:0.35];
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v28, 0);
  }
  else
  {
    [v37[0] removeFromSuperview];
    [*(id *)(a1 + 40) _updateClientSafeArea];
  }
  objc_storeStrong(v37, 0);
  objc_storeStrong(location, 0);
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 40) _updateClientSafeArea];
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateClientSafeArea];
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateClientSafeArea];
}

- (void)setLayoutOverride:(unint64_t)a3
{
  uint64_t v14 = self;
  SEL v13 = a2;
  unint64_t v12 = a3;
  self->_layoutOverride = a3;
  double v7 = [(CPSInstrumentClusterCardViewController *)v14 layout];
  BOOL v8 = [(CPSInstrumentClusterCardLayout *)v7 layoutForCard] == v12;

  if (!v8)
  {
    double v5 = [(CPSInstrumentClusterCardViewController *)v14 layout];
    BOOL shouldUpdateContent = 0;
    if (v5) {
      BOOL shouldUpdateContent = v14->_shouldUpdateContent;
    }

    if (shouldUpdateContent)
    {
      id location = [(CPSInstrumentClusterCardViewController *)v14 layout];
      [location setLayoutForCard:v12];
      [(CPSInstrumentClusterCardViewController *)v14 setLayout:location];
      id v3 = [(CPSInstrumentClusterCardViewController *)v14 currentPausedCardView];
      char v9 = 0;
      BOOL v4 = 1;
      if (!v3)
      {
        uint64_t v10 = [(CPSInstrumentClusterCardViewController *)v14 currentManeuversCardView];
        char v9 = 1;
        BOOL v4 = v10 != 0;
      }
      if (v9) {

      }
      if (v4) {
        [(CPSInstrumentClusterCardViewController *)v14 _updateClientSafeArea];
      }
      objc_storeStrong(&location, 0);
    }
  }
}

- (void)viewController:(id)a3 didUpdateSafeAreaInsets:(UIEdgeInsets)a4
{
  UIEdgeInsets v9 = a4;
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v5 = (CPSClusterEstimatesViewController *)location[0];
  BOOL v4 = [(CPSInstrumentClusterCardViewController *)v8 estimatesViewController];
  BOOL v6 = v5 != v4;

  if (!v6) {
    [(CPSInstrumentClusterCardViewController *)v8 _updateClientSafeArea];
  }
  objc_storeStrong(location, 0);
}

- (CARScreenInfo)carScreenInfo
{
  return self->_carScreenInfo;
}

- (CPSInstrumentClusterCardLayout)layout
{
  return self->_layout;
}

- (BOOL)shouldUpdateContent
{
  return self->_shouldUpdateContent;
}

- (CPSSafeAreaDelegate)safeAreaDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeAreaDelegate);

  return (CPSSafeAreaDelegate *)WeakRetained;
}

- (unint64_t)layoutOverride
{
  return self->_layoutOverride;
}

- (BOOL)showETA
{
  return self->_showETA;
}

- (UIEdgeInsets)currentClientInsets
{
  double left = self->_currentClientInsets.left;
  double top = self->_currentClientInsets.top;
  double right = self->_currentClientInsets.right;
  double bottom = self->_currentClientInsets.bottom;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCurrentClientInsets:(UIEdgeInsets)a3
{
  self->_currentClientInsets = a3;
}

- (UIViewController)platterViewController
{
  return self->_platterViewController;
}

- (void)setPlatterViewController:(id)a3
{
}

- (CPSClusterEstimatesViewController)estimatesViewController
{
  return self->_estimatesViewController;
}

- (void)setEstimatesViewController:(id)a3
{
}

- (CPSClusterManeuversCardView)currentManeuversCardView
{
  return self->_currentManeuversCardView;
}

- (void)setCurrentManeuversCardView:(id)a3
{
}

- (CPSClusterPausedCardView)currentPausedCardView
{
  return self->_currentPausedCardView;
}

- (void)setCurrentPausedCardView:(id)a3
{
}

- (BOOL)isMapContentOnly
{
  return self->_isMapContentOnly;
}

- (void)setIsMapContentOnly:(BOOL)a3
{
  self->_isMapContentOnly = a3;
}

- (BOOL)isRightHandDrive
{
  return self->_isRightHandDrive;
}

- (void)setIsRightHandDrive:(BOOL)a3
{
  self->_isRightHandDrive = a3;
}

- (BOOL)supportsVehicleData
{
  return self->_supportsVehicleData;
}

- (void)setSupportsVehicleData:(BOOL)a3
{
  self->_supportsVehicleData = a3;
}

- (void).cxx_destruct
{
}

@end