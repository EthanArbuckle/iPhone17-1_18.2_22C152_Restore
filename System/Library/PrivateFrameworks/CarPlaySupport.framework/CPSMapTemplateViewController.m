@interface CPSMapTemplateViewController
- (BKSHIDEventDeliveryPolicyObserver)eventDeliveryPolicyObserver;
- (BOOL)_isAutoHideEnabled;
- (BOOL)applicationIsFrontmost;
- (BOOL)autoHidesNavigationBar;
- (BOOL)canAnimateNavigationAlert;
- (BOOL)demoAutoHideTimerDisabled;
- (BOOL)etaViewHidden;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hasSetTripEstimateStyle;
- (BOOL)hidesButtonsWithNavigationBar;
- (BOOL)previewOnlyRouteChoices;
- (BOOL)rightHandDrive;
- (BOOL)shouldForwardEventForWindow:(id)a3 eventType:(int64_t)a4;
- (BOOL)shouldRestoreFocusToNavigationBar;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGPoint)lastPanGesturePoint;
- (CPMapClientTemplateDelegate)mapTemplateDelegate;
- (CPMapTemplate)mapTemplate;
- (CPSApplicationStateMonitor)applicationStateMonitor;
- (CPSLayoutHelperView)navigationCardViewLayoutHelperView;
- (CPSMapTemplateViewController)initWithMapTemplate:(id)a3 templateDelegate:(id)a4 safeAreaDelegate:(id)a5 applicationStateMonitor:(id)a6 templateEnvironment:(id)a7;
- (CPSNavigationAlertQueue)navigationAlertQueue;
- (CPSNavigationCardViewController)navigationCardViewController;
- (CPSNavigationETAView)navigationETAView;
- (CPSNavigator)navigator;
- (CPSNavigatorObserving)navigatorObserver;
- (CPSPanViewController)panViewController;
- (CPSSafeAreaDelegate)safeAreaDelegate;
- (CPSTripPreviewsCardView)previewsView;
- (CPTripPreviewTextConfiguration)tripPreviewTextConfiguration;
- (NSArray)tripPreviews;
- (NSLayoutConstraint)cardWidthConstraint;
- (NSLayoutConstraint)navigationAlertBottomConstraint;
- (NSLayoutConstraint)navigationCardViewLayoutViewBottomConstraint;
- (NSLayoutConstraint)navigationETAViewBottomConstraint;
- (NSLayoutConstraint)panContainerLeftConstraint;
- (NSLayoutConstraint)panContainerRightConstraint;
- (NSMutableArray)mapButtons;
- (NSMutableDictionary)lastTravelEstimatesByTrip;
- (NSMutableSet)autoHideDisabledReasons;
- (NSMutableSet)etaViewHiddenRequesters;
- (NSTimer)autoHideTimer;
- (UIColor)guidanceBackgroundColor;
- (UIEdgeInsets)_cardViewEdgeInsets;
- (UIEdgeInsets)_mapButtonsEdgeInsets;
- (UIEdgeInsets)_navBarInsets;
- (UIEdgeInsets)_navigationAlertInsets;
- (UIEdgeInsets)_previewEdgeInsets;
- (UIFocusGuide)focusHolderLeftFocusGuide;
- (UIFocusGuide)focusHolderRightFocusGuide;
- (UIFocusItem)itemFocusedBeforeNavAlert;
- (UIFocusItem)lastFocusedItem;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIStackView)trailingBottomStackView;
- (UITapGestureRecognizer)hideTapGestureRecognizer;
- (UITapGestureRecognizer)navBarHideTapGestureRecognizer;
- (UIView)panContainerView;
- (_CPSFocusHoldingButton)focusHoldingButton;
- (double)_widthForNavigationAlert;
- (id)_buttonForIdentifier:(id)a3;
- (id)_buttons;
- (id)_linearFocusItems;
- (id)_tripDidBegin:(id)a3 withEstimates:(id)a4 forIdentifier:(id)a5;
- (id)preferredFocusEnvironments;
- (unint64_t)maximumMapButtonCount;
- (unint64_t)previewSelectedIndex;
- (unint64_t)tripEstimateStyle;
- (void)_addPanControllerAsChild;
- (void)_calculateAndUpdateCardWidthConstraint;
- (void)_checkNavigationCardHelperViewForETAFit;
- (void)_createNavigationCardViewController;
- (void)_createNavigationCardViewLayoutHelperView;
- (void)_handleFocusHolderSelect;
- (void)_handlePanGesture:(id)a3;
- (void)_handleTapGesture:(id)a3;
- (void)_hideBar:(id)a3;
- (void)_nightModeChanged:(id)a3;
- (void)_performAlertSizingForAlert:(id)a3 animated:(BOOL)a4;
- (void)_reloadPreviewsView;
- (void)_removePanController;
- (void)_resetAutoHideTimerAndShowBarAnimated:(BOOL)a3 allowFocusDeferral:(BOOL)a4;
- (void)_setAutoHideDisabled:(BOOL)a3 forRequester:(id)a4;
- (void)_setButtonsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setETAViewHidden:(BOOL)a3 forRequester:(id)a4 animated:(BOOL)a5;
- (void)_setFocusHoldersEnabled:(BOOL)a3;
- (void)_setMaximumVisibleMapButtons:(unint64_t)a3;
- (void)_setNavigationAlertView:(id)a3 visible:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_setPanInterfaceVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_showBarAnimated:(BOOL)a3 allowFocusDeferral:(BOOL)a4;
- (void)_updateETAViewHidden;
- (void)_updateInterestingArea;
- (void)_updateMapButtonVisibility;
- (void)_updateMapButtonsWithButtons:(id)a3;
- (void)_updatePanGestureForHiFiTouch;
- (void)_updateSafeArea;
- (void)_viewDidLoad;
- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4;
- (void)dealloc;
- (void)didChangeLayout:(id)a3;
- (void)didSelectButton:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)dismissNavigationAlertAnimated:(BOOL)a3 completion:(id)a4;
- (void)hostPanInterfaceVisible:(id)a3;
- (void)hostSetMapButton:(id)a3 imageSet:(id)a4;
- (void)hostSetMapButtons:(id)a3;
- (void)hostSetPanInterfaceVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)hostStartNavigationSessionForTrip:(id)a3 reply:(id)a4;
- (void)hostUpdateTravelEstimates:(id)a3 forTripIdentifier:(id)a4;
- (void)invalidate;
- (void)navigationAlertQueue:(id)a3 shouldDisplayAlertView:(id)a4 animated:(BOOL)a5;
- (void)navigationAlertQueue:(id)a3 shouldRemoveAlertView:(id)a4 animated:(BOOL)a5 dismissalContext:(unint64_t)a6 completion:(id)a7;
- (void)navigationOwnershipChangedToOwner:(unint64_t)a3;
- (void)navigator:(id)a3 didEndTrip:(BOOL)a4;
- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6;
- (void)observerDeliveryPolicyDidChange:(id)a3;
- (void)panBeganWithDirection:(int64_t)a3;
- (void)panEndedWithDirection:(int64_t)a3;
- (void)panWithDirection:(int64_t)a3;
- (void)sessionDidConnect:(id)a3;
- (void)setApplicationIsFrontmost:(BOOL)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setAutoHideDisabledReasons:(id)a3;
- (void)setAutoHideTimer:(id)a3;
- (void)setAutoHidesNavigationBar:(BOOL)a3;
- (void)setCardWidthConstraint:(id)a3;
- (void)setControl:(id)a3 enabled:(BOOL)a4;
- (void)setDemoAutoHideTimerDisabled:(BOOL)a3;
- (void)setEtaViewHidden:(BOOL)a3;
- (void)setEtaViewHiddenRequesters:(id)a3;
- (void)setEventDeliveryPolicyObserver:(id)a3;
- (void)setFocusHolderLeftFocusGuide:(id)a3;
- (void)setFocusHolderRightFocusGuide:(id)a3;
- (void)setFocusHoldingButton:(id)a3;
- (void)setGuidanceBackgroundColor:(id)a3;
- (void)setHasSetTripEstimateStyle:(BOOL)a3;
- (void)setHideTapGestureRecognizer:(id)a3;
- (void)setHidesButtonsWithNavigationBar:(BOOL)a3;
- (void)setHostAutoHidesNavigationBar:(BOOL)a3;
- (void)setHostGuidanceBackgroundColor:(id)a3;
- (void)setHostHidesButtonsWithNavigationBar:(BOOL)a3;
- (void)setHostTripEstimateStyle:(unint64_t)a3;
- (void)setHostTripPreviews:(id)a3 textConfiguration:(id)a4 previewOnlyRouteChoices:(BOOL)a5 selectedIndex:(unint64_t)a6;
- (void)setItemFocusedBeforeNavAlert:(id)a3;
- (void)setLastFocusedItem:(id)a3;
- (void)setLastPanGesturePoint:(CGPoint)a3;
- (void)setLastTravelEstimatesByTrip:(id)a3;
- (void)setMapButton:(id)a3 focusedImage:(id)a4;
- (void)setMapButton:(id)a3 hidden:(BOOL)a4;
- (void)setMapButtons:(id)a3;
- (void)setMaximumMapButtonCount:(unint64_t)a3;
- (void)setNavBarHideTapGestureRecognizer:(id)a3;
- (void)setNavigationAlertBottomConstraint:(id)a3;
- (void)setNavigationAlertQueue:(id)a3;
- (void)setNavigationCardViewController:(id)a3;
- (void)setNavigationCardViewLayoutHelperView:(id)a3;
- (void)setNavigationCardViewLayoutViewBottomConstraint:(id)a3;
- (void)setNavigationETAView:(id)a3;
- (void)setNavigationETAViewBottomConstraint:(id)a3;
- (void)setNavigator:(id)a3;
- (void)setNavigatorObserver:(id)a3;
- (void)setPanContainerLeftConstraint:(id)a3;
- (void)setPanContainerRightConstraint:(id)a3;
- (void)setPanContainerView:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPanViewController:(id)a3;
- (void)setPreviewOnlyRouteChoices:(BOOL)a3;
- (void)setPreviewSelectedIndex:(unint64_t)a3;
- (void)setPreviewsView:(id)a3;
- (void)setRightHandDrive:(BOOL)a3;
- (void)setSafeAreaDelegate:(id)a3;
- (void)setShouldRestoreFocusToNavigationBar:(BOOL)a3;
- (void)setTrailingBottomStackView:(id)a3;
- (void)setTripEstimateStyle:(unint64_t)a3;
- (void)setTripPreviewTextConfiguration:(id)a3;
- (void)setTripPreviews:(id)a3;
- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4;
- (void)showNavigationAlert:(id)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)tripView:(id)a3 selectedTrip:(id)a4 routeChoice:(id)a5;
- (void)tripView:(id)a3 startedTrip:(id)a4 routeChoice:(id)a5;
- (void)updateEstimates:(id)a3 forManeuver:(id)a4;
- (void)updateNavigationAlert:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSMapTemplateViewController

- (CPSMapTemplateViewController)initWithMapTemplate:(id)a3 templateDelegate:(id)a4 safeAreaDelegate:(id)a5 applicationStateMonitor:(id)a6 templateEnvironment:(id)a7
{
  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  id v42 = 0;
  objc_storeStrong(&v42, a5);
  id v41 = 0;
  objc_storeStrong(&v41, a6);
  id v40 = 0;
  objc_storeStrong(&v40, a7);
  v7 = v45;
  v45 = 0;
  v39.receiver = v7;
  v39.super_class = (Class)CPSMapTemplateViewController;
  v36 = [(CPSBaseTemplateViewController *)&v39 initWithTemplate:location[0] templateDelegate:v43 templateEnvironment:v40];
  v45 = v36;
  objc_storeStrong((id *)&v45, v36);
  if (v36)
  {
    v8 = (BKSHIDEventDeliveryPolicyObserver *)objc_alloc_init(MEMORY[0x263F29838]);
    eventDeliveryPolicyObserver = v45->_eventDeliveryPolicyObserver;
    v45->_eventDeliveryPolicyObserver = v8;

    v28 = v45->_eventDeliveryPolicyObserver;
    id v29 = (id)[MEMORY[0x263F29820] keyboardFocusEnvironment];
    -[BKSHIDEventDeliveryPolicyObserver setDeferringEnvironment:](v28, "setDeferringEnvironment:");

    [(BKSHIDEventDeliveryPolicyObserver *)v45->_eventDeliveryPolicyObserver addObserver:v45];
    id v30 = (id)[v40 sessionStatus];
    [v30 addSessionObserver:v45];

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mapButtons = v45->_mapButtons;
    v45->_mapButtons = v10;

    v45->_maximumMapButtonCount = 4;
    v12 = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionary];
    lastTravelEstimatesByTrip = v45->_lastTravelEstimatesByTrip;
    v45->_lastTravelEstimatesByTrip = v12;

    char v14 = [location[0] automaticallyHidesNavigationBar];
    v45->_autoHidesNavigationBar = v14 & 1;
    char v15 = [location[0] hidesButtonsWithNavigationBar];
    v45->_hidesButtonsWithNavigationBar = v15 & 1;
    char v16 = [location[0] hidesButtonsWithNavigationBar];
    v45->_hidesButtonsWithNavigationBar = v16 & 1;
    objc_storeStrong((id *)&v45->_tripPreviews, 0);
    Boolean keyExistsAndHasValidFormat = 0;
    Boolean AppBooleanValue = CFPreferencesGetAppBooleanValue(@"0-Demo Auto Hide Timer Disabled", @"com.apple.internal.Neatline", &keyExistsAndHasValidFormat);
    BOOL v31 = 0;
    if (keyExistsAndHasValidFormat) {
      BOOL v31 = AppBooleanValue != 0;
    }
    v45->_demoAutoHideTimerDisabled = v31;
    v17 = [CPSNavigationAlertQueue alloc];
    uint64_t v18 = [(CPSNavigationAlertQueue *)v17 initWithDelegate:v45 applicationStateMonitor:v41];
    navigationAlertQueue = v45->_navigationAlertQueue;
    v45->_navigationAlertQueue = (CPSNavigationAlertQueue *)v18;

    objc_storeWeak((id *)&v45->_safeAreaDelegate, v42);
    char v20 = [v40 rightHandDrive];
    v45->_rightHandDrive = v20 & 1;
    v45->_applicationIsFrontmost = 1;
    objc_storeWeak((id *)&v45->_applicationStateMonitor, v41);
    [v41 addApplicationStateObserver:v45];
    id v26 = v41;
    v27 = [(CPSMapTemplateViewController *)v45 navigationAlertQueue];
    objc_msgSend(v26, "addApplicationStateObserver:");

    v21 = (UIColor *)(id)[location[0] guidanceBackgroundColor];
    guidanceBackgroundColor = v45->_guidanceBackgroundColor;
    v45->_guidanceBackgroundColor = v21;

    uint64_t v23 = [location[0] tripEstimateStyle];
    v45->_tripEstimateStyle = v23;
  }
  v25 = v45;
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v45, 0);
  return v25;
}

- (void)invalidate
{
  v9 = self;
  SEL v8 = a2;
  v2 = [(CPSMapTemplateViewController *)self navigator];
  [(CPSNavigator *)v2 invalidate];

  v3 = [(CPSMapTemplateViewController *)v9 applicationStateMonitor];
  [(CPSApplicationStateMonitor *)v3 removeApplicationStateObserver:v9];

  v5 = [(CPSMapTemplateViewController *)v9 applicationStateMonitor];
  v4 = [(CPSMapTemplateViewController *)v9 navigationAlertQueue];
  -[CPSApplicationStateMonitor removeApplicationStateObserver:](v5, "removeApplicationStateObserver:");

  v6 = [(CPSMapTemplateViewController *)v9 eventDeliveryPolicyObserver];
  [(BKSHIDEventDeliveryPolicyObserver *)v6 removeObserver:v9];

  v7.receiver = v9;
  v7.super_class = (Class)CPSMapTemplateViewController;
  [(CPSBaseTemplateViewController *)&v7 invalidate];
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(CPSMapTemplateViewController *)self invalidate];
  v2.receiver = v4;
  v2.super_class = (Class)CPSMapTemplateViewController;
  [(CPSBaseTemplateViewController *)&v2 dealloc];
}

- (void)setGuidanceBackgroundColor:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5->_guidanceBackgroundColor != location[0])
  {
    objc_storeStrong((id *)&v5->_guidanceBackgroundColor, location[0]);
    SEL v3 = [(CPSMapTemplateViewController *)v5 navigationCardViewController];
    [(CPSNavigationCardViewController *)v3 setGuidanceBackgroundColor:v5->_guidanceBackgroundColor];
  }
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)CPSMapTemplateViewController;
  [(CPSMapTemplateViewController *)&v9 traitCollectionDidChange:location[0]];
  char v7 = 0;
  BOOL v6 = 0;
  if (![(CPSMapTemplateViewController *)v11 hasSetTripEstimateStyle])
  {
    SEL v8 = [(CPSMapTemplateViewController *)v11 navigationETAView];
    char v7 = 1;
    BOOL v6 = v8 != 0;
  }
  if (v7) {

  }
  if (v6)
  {
    id v4 = (id)[(CPSMapTemplateViewController *)v11 traitCollection];
    BOOL v5 = [v4 userInterfaceStyle] != 1;

    SEL v3 = [(CPSMapTemplateViewController *)v11 navigationETAView];
    [(CPSNavigationETAView *)v3 setTripEstimateStyle:v5];
  }
  [(CPSMapTemplateViewController *)v11 _updatePanGestureForHiFiTouch];
  objc_storeStrong(location, 0);
}

- (void)setTripEstimateStyle:(unint64_t)a3
{
  [(CPSMapTemplateViewController *)self setHasSetTripEstimateStyle:1];
  if (self->_tripEstimateStyle != a3)
  {
    self->_tripEstimateStyle = a3;
    id v4 = [(CPSMapTemplateViewController *)self navigationETAView];

    if (v4)
    {
      SEL v3 = [(CPSMapTemplateViewController *)self navigationETAView];
      [(CPSNavigationETAView *)v3 setTripEstimateStyle:self->_tripEstimateStyle];
    }
  }
}

- (CPMapTemplate)mapTemplate
{
  SEL v3 = objc_opt_class();
  id v4 = [(CPSBaseTemplateViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_22(v3, v4);

  return (CPMapTemplate *)v5;
}

- (void)_viewDidLoad
{
  v152[3] = *MEMORY[0x263EF8340];
  v149 = self;
  SEL v148 = a2;
  v147.receiver = self;
  v147.super_class = (Class)CPSMapTemplateViewController;
  [(CPSBaseTemplateViewController *)&v147 _viewDidLoad];
  id v146 = (id)[(CPSMapTemplateViewController *)v149 view];
  id v2 = objc_alloc(MEMORY[0x263F1C9B8]);
  id v145 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v145 setAxis:1];
  [v145 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v145 setSpacing:8.0];
  [v146 addSubview:v145];
  [(CPSMapTemplateViewController *)v149 setTrailingBottomStackView:v145];
  v118 = v149;
  v120 = [(CPSMapTemplateViewController *)v149 mapTemplate];
  v119 = [(CPMapTemplate *)v120 mapButtons];
  -[CPSMapTemplateViewController _updateMapButtonsWithButtons:](v118, "_updateMapButtonsWithButtons:");

  char v142 = 0;
  char v140 = 0;
  char v138 = 0;
  char v136 = 0;
  if ([(CPSMapTemplateViewController *)v149 rightHandDrive])
  {
    id v143 = (id)[v146 safeAreaLayoutGuide];
    char v142 = 1;
    id v141 = (id)[v143 leftAnchor];
    char v140 = 1;
    id v3 = v141;
  }
  else
  {
    id v139 = (id)[v146 safeAreaLayoutGuide];
    char v138 = 1;
    id v137 = (id)[v139 rightAnchor];
    char v136 = 1;
    id v3 = v137;
  }
  id v144 = v3;
  if (v136) {

  }
  if (v138) {
  if (v140)
  }

  if (v142) {
  char v133 = 0;
  }
  char v131 = 0;
  if ([(CPSMapTemplateViewController *)v149 rightHandDrive])
  {
    id v134 = (id)[v145 leftAnchor];
    char v133 = 1;
    id v4 = v134;
  }
  else
  {
    id v132 = (id)[v145 rightAnchor];
    char v131 = 1;
    id v4 = v132;
  }
  id v135 = v4;
  if (v131) {

  }
  if (v133) {
  double v130 = 0.0;
  }
  BOOL v5 = [(CPSMapTemplateViewController *)v149 rightHandDrive];
  double v6 = -8.0;
  if (!v5) {
    double v6 = 8.0;
  }
  double v130 = v6;
  id v24 = (id)[v144 constraintEqualToAnchor:v135 constant:v6];
  v152[0] = v24;
  id v23 = (id)[v146 safeAreaLayoutGuide];
  id v22 = (id)[v23 bottomAnchor];
  id v21 = (id)[v145 bottomAnchor];
  id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", 8.0);
  v152[1] = v20;
  id v19 = (id)[v145 widthAnchor];
  id v18 = (id)[v19 constraintEqualToConstant:30.0];
  v152[2] = v18;
  id v129 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:3];

  [MEMORY[0x263F08938] activateConstraints:v129];
  [(CPSMapTemplateViewController *)v149 _reloadPreviewsView];
  id v7 = objc_alloc(MEMORY[0x263F1CA70]);
  id v128 = (id)[v7 initWithTarget:v149 action:sel__handleTapGesture_];
  [v128 setDelegate:v149];
  [v146 addGestureRecognizer:v128];
  [(CPSMapTemplateViewController *)v149 setHideTapGestureRecognizer:v128];
  id v8 = objc_alloc(MEMORY[0x263F1CA70]);
  id v127 = (id)objc_msgSend(v8, "initWithTarget:action:", v149);
  [v127 setDelegate:v149];
  id v26 = (id)[(CPSMapTemplateViewController *)v149 navigationController];
  id v25 = (id)[v26 navigationBar];
  [v25 addGestureRecognizer:v127];

  [(CPSMapTemplateViewController *)v149 setNavBarHideTapGestureRecognizer:v127];
  [(CPSMapTemplateViewController *)v149 _updatePanGestureForHiFiTouch];
  id v27 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v27 addObserver:v149 selector:sel__nightModeChanged_ name:*MEMORY[0x263F30DA8] object:0];

  [(CPSMapTemplateViewController *)v149 _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:1];
  v28 = [CPSPanViewController alloc];
  id v29 = [(CPSBaseTemplateViewController *)v149 templateEnvironment];
  v126 = -[CPSPanViewController initWithEnvironment:](v28, "initWithEnvironment:");

  [(CPSPanViewController *)v126 setPanDelegate:v149];
  [(CPSMapTemplateViewController *)v149 setPanViewController:v126];
  id v9 = objc_alloc(MEMORY[0x263F1CB60]);
  id v125 = (id)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v125 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v125 setHidden:1];
  [v146 insertSubview:v125 belowSubview:v145];
  id v32 = (id)[v125 leftAnchor];
  id v31 = (id)[v146 leftAnchor];
  [v146 safeAreaInsets];
  v124[5] = v10;
  v124[6] = v11;
  v124[7] = v12;
  v124[8] = v13;
  id v30 = (id)[v32 constraintEqualToAnchor:v31 constant:*(double *)&v11];
  -[CPSMapTemplateViewController setPanContainerLeftConstraint:](v149, "setPanContainerLeftConstraint:");

  id v35 = (id)[v125 rightAnchor];
  id v34 = (id)[v146 rightAnchor];
  [v146 safeAreaInsets];
  v124[1] = v14;
  v124[2] = v15;
  v124[3] = v16;
  v124[4] = v17;
  id v33 = (id)[v35 constraintEqualToAnchor:v34 constant:*(double *)&v17];
  -[CPSMapTemplateViewController setPanContainerRightConstraint:](v149, "setPanContainerRightConstraint:");

  id v36 = v146;
  v47 = [(CPSMapTemplateViewController *)v149 panContainerLeftConstraint];
  v151[0] = v47;
  id v46 = (id)[v125 topAnchor];
  id v45 = (id)[v146 safeAreaLayoutGuide];
  id v44 = (id)[v45 topAnchor];
  id v43 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
  v151[1] = v43;
  id v42 = [(CPSMapTemplateViewController *)v149 panContainerRightConstraint];
  v151[2] = v42;
  id v41 = (id)[v125 bottomAnchor];
  id v40 = (id)[v146 safeAreaLayoutGuide];
  id v39 = (id)[v40 bottomAnchor];
  id v38 = (id)objc_msgSend(v41, "constraintEqualToAnchor:");
  v151[3] = v38;
  id v37 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:4];
  objc_msgSend(v36, "addConstraints:");

  [(CPSMapTemplateViewController *)v149 setPanContainerView:v125];
  v124[0] = +[_CPSFocusHoldingButton buttonWithType:0];
  [v124[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v124[0] setEnabled:0];
  [v124[0] addTarget:v149 action:sel__handleFocusHolderSelect forControlEvents:0x2000];
  [v146 addSubview:v124[0]];
  [(CPSMapTemplateViewController *)v149 setFocusHoldingButton:v124[0]];
  id v123 = objc_alloc_init(MEMORY[0x263F1C640]);
  [v146 addLayoutGuide:v123];
  [v123 setEnabled:0];
  [(CPSMapTemplateViewController *)v149 setFocusHolderLeftFocusGuide:v123];
  id v122 = objc_alloc_init(MEMORY[0x263F1C640]);
  [v146 addLayoutGuide:v122];
  [v122 setEnabled:0];
  [(CPSMapTemplateViewController *)v149 setFocusHolderRightFocusGuide:v122];
  id v121 = objc_alloc_init(MEMORY[0x263F1C638]);
  [v146 addLayoutGuide:v121];
  v48 = (void *)MEMORY[0x263F08938];
  v117 = [(CPSMapTemplateViewController *)v149 focusHolderLeftFocusGuide];
  id v116 = (id)[(UIFocusGuide *)v117 widthAnchor];
  id v115 = (id)objc_msgSend(v116, "constraintEqualToConstant:");
  v150[0] = v115;
  v114 = [(CPSMapTemplateViewController *)v149 focusHolderLeftFocusGuide];
  id v113 = (id)[(UIFocusGuide *)v114 rightAnchor];
  v112 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v111 = (id)[(_CPSFocusHoldingButton *)v112 leftAnchor];
  id v110 = (id)objc_msgSend(v113, "constraintEqualToAnchor:");
  v150[1] = v110;
  v109 = [(CPSMapTemplateViewController *)v149 focusHolderLeftFocusGuide];
  id v108 = (id)[(UIFocusGuide *)v109 bottomAnchor];
  v107 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v106 = (id)[(_CPSFocusHoldingButton *)v107 bottomAnchor];
  id v105 = (id)objc_msgSend(v108, "constraintEqualToAnchor:");
  v150[2] = v105;
  v104 = [(CPSMapTemplateViewController *)v149 focusHolderLeftFocusGuide];
  id v103 = (id)[(UIFocusGuide *)v104 topAnchor];
  v102 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v101 = (id)[(_CPSFocusHoldingButton *)v102 topAnchor];
  id v100 = (id)objc_msgSend(v103, "constraintEqualToAnchor:");
  v150[3] = v100;
  v99 = [(CPSMapTemplateViewController *)v149 focusHolderRightFocusGuide];
  id v98 = (id)[(UIFocusGuide *)v99 widthAnchor];
  id v97 = (id)[v98 constraintEqualToConstant:1.0];
  v150[4] = v97;
  v96 = [(CPSMapTemplateViewController *)v149 focusHolderRightFocusGuide];
  id v95 = (id)[(UIFocusGuide *)v96 leftAnchor];
  v94 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v93 = (id)[(_CPSFocusHoldingButton *)v94 rightAnchor];
  id v92 = (id)objc_msgSend(v95, "constraintEqualToAnchor:");
  v150[5] = v92;
  v91 = [(CPSMapTemplateViewController *)v149 focusHolderRightFocusGuide];
  id v90 = (id)[(UIFocusGuide *)v91 bottomAnchor];
  v89 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v88 = (id)[(_CPSFocusHoldingButton *)v89 bottomAnchor];
  id v87 = (id)objc_msgSend(v90, "constraintEqualToAnchor:");
  v150[6] = v87;
  v86 = [(CPSMapTemplateViewController *)v149 focusHolderRightFocusGuide];
  id v85 = (id)[(UIFocusGuide *)v86 topAnchor];
  v84 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v83 = (id)[(_CPSFocusHoldingButton *)v84 topAnchor];
  id v82 = (id)objc_msgSend(v85, "constraintEqualToAnchor:");
  v150[7] = v82;
  v81 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v80 = (id)[(_CPSFocusHoldingButton *)v81 widthAnchor];
  id v79 = (id)[v80 constraintEqualToConstant:1.0];
  v150[8] = v79;
  v78 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v77 = (id)[(_CPSFocusHoldingButton *)v78 heightAnchor];
  id v76 = (id)[v77 constraintEqualToConstant:1.0];
  v150[9] = v76;
  v75 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v74 = (id)[(_CPSFocusHoldingButton *)v75 topAnchor];
  id v73 = (id)[v146 safeAreaLayoutGuide];
  id v72 = (id)[v73 topAnchor];
  id v71 = (id)objc_msgSend(v74, "constraintEqualToAnchor:");
  v150[10] = v71;
  v70 = [(CPSMapTemplateViewController *)v149 focusHoldingButton];
  id v69 = (id)[(_CPSFocusHoldingButton *)v70 leftAnchor];
  id v68 = (id)[v146 safeAreaLayoutGuide];
  id v67 = (id)[v68 leftAnchor];
  id v66 = (id)objc_msgSend(v69, "constraintEqualToAnchor:");
  v150[11] = v66;
  id v65 = (id)[v121 topAnchor];
  id v64 = (id)[v146 safeAreaLayoutGuide];
  id v63 = (id)[v64 topAnchor];
  id v62 = (id)objc_msgSend(v65, "constraintEqualToAnchor:");
  v150[12] = v62;
  id v61 = (id)[v121 bottomAnchor];
  id v60 = (id)[v146 safeAreaLayoutGuide];
  id v59 = (id)[v60 bottomAnchor];
  id v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
  v150[13] = v58;
  id v57 = (id)[v121 leftAnchor];
  id v56 = (id)[v146 safeAreaLayoutGuide];
  id v55 = (id)[v56 leftAnchor];
  id v54 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
  v150[14] = v54;
  id v53 = (id)[v121 rightAnchor];
  id v52 = (id)[v146 safeAreaLayoutGuide];
  id v51 = (id)[v52 rightAnchor];
  id v50 = (id)objc_msgSend(v53, "constraintEqualToAnchor:");
  v150[15] = v50;
  id v49 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:16];
  objc_msgSend(v48, "activateConstraints:");

  [(CPSMapTemplateViewController *)v149 _createNavigationCardViewController];
  [(CPSMapTemplateViewController *)v149 _createNavigationCardViewLayoutHelperView];
  [(CPSMapTemplateViewController *)v149 _updateSafeArea];
  objc_storeStrong(&v121, 0);
  objc_storeStrong(&v122, 0);
  objc_storeStrong(&v123, 0);
  objc_storeStrong(v124, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong((id *)&v126, 0);
  objc_storeStrong(&v127, 0);
  objc_storeStrong(&v128, 0);
  objc_storeStrong(&v129, 0);
  objc_storeStrong(&v135, 0);
  objc_storeStrong(&v144, 0);
  objc_storeStrong(&v145, 0);
  objc_storeStrong(&v146, 0);
}

- (void)_setMaximumVisibleMapButtons:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 > 4) {
    unint64_t v3 = 4;
  }
  if (v3 != [(CPSMapTemplateViewController *)self maximumMapButtonCount])
  {
    [(CPSMapTemplateViewController *)self setMaximumMapButtonCount:v3];
    [(CPSMapTemplateViewController *)self _updateMapButtonVisibility];
  }
}

- (void)_updateMapButtonVisibility
{
  char v16 = self;
  SEL v15 = a2;
  char v14 = 0;
  id v4 = [(CPSMapTemplateViewController *)self mapButtons];
  unint64_t v5 = [(NSMutableArray *)v4 count];

  v13 = (void *)v5;
  unint64_t v12 = [(CPSMapTemplateViewController *)v16 maximumMapButtonCount];
  if (v5 >= v12) {
    unint64_t v3 = (void *)v12;
  }
  else {
    unint64_t v3 = v13;
  }
  v11[2] = v3;
  char v14 = v3;
  id v2 = (void *)MEMORY[0x263F1CB60];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __58__CPSMapTemplateViewController__updateMapButtonVisibility__block_invoke;
  v10 = &unk_2648A4388;
  v11[0] = v16;
  v11[1] = v14;
  [v2 performWithoutAnimation:&v6];
  objc_storeStrong(v11, 0);
}

unint64_t __58__CPSMapTemplateViewController__updateMapButtonVisibility__block_invoke(uint64_t a1)
{
  id v11 = (id)[*(id *)(a1 + 32) mapButtons];
  unint64_t v12 = [v11 count] - *(void *)(a1 + 40);

  for (unint64_t i = 0; i < v12; ++i)
  {
    id v8 = (id)[*(id *)(a1 + 32) mapButtons];
    BOOL v9 = i >= [v8 count];

    if (!v9)
    {
      id v7 = (id)[*(id *)(a1 + 32) mapButtons];
      id v6 = (id)[v7 objectAtIndexedSubscript:i];
      [v6 setHidden:1];
    }
  }
  for (unint64_t j = v12; ; ++j)
  {
    unint64_t result = [*(id *)(a1 + 32) maximumMapButtonCount];
    if (j >= result) {
      break;
    }
    id v4 = (id)[*(id *)(a1 + 32) mapButtons];
    BOOL v5 = j >= [v4 count];

    if (!v5)
    {
      id v3 = (id)[*(id *)(a1 + 32) mapButtons];
      id v2 = (id)[v3 objectAtIndexedSubscript:j];
      [v2 setHidden:0];
    }
  }
  return result;
}

- (void)_updateMapButtonsWithButtons:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[(CPSMapTemplateViewController *)v20 viewIfLoaded];
  BOOL v11 = v3 != 0;

  if (v11)
  {
    id v6 = [(CPSMapTemplateViewController *)v20 trailingBottomStackView];
    BOOL v5 = [(UIStackView *)v6 arrangedSubviews];
    id v4 = (id)[(NSArray *)v5 copy];
    [v4 enumerateObjectsUsingBlock:&__block_literal_global_17];

    id v7 = [(CPSMapTemplateViewController *)v20 mapButtons];
    [(NSMutableArray *)v7 removeAllObjects];

    id v8 = location[0];
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    SEL v15 = __61__CPSMapTemplateViewController__updateMapButtonsWithButtons___block_invoke_2;
    char v16 = &unk_2648A5A40;
    v17 = v20;
    [v8 enumerateObjectsUsingBlock:&v12];
    [(CPSMapTemplateViewController *)v20 _updateMapButtonVisibility];
    [(CPSMapTemplateViewController *)v20 _updateSafeArea];
    objc_storeStrong((id *)&v17, 0);
    int v18 = 0;
  }
  else
  {
    id v9 = location[0];
    v10 = [(CPSMapTemplateViewController *)v20 mapTemplate];
    [(CPMapTemplate *)v10 setMapButtons:v9];

    int v18 = 1;
  }
  objc_storeStrong(location, 0);
}

void __61__CPSMapTemplateViewController__updateMapButtonsWithButtons___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] removeFromSuperview];
  objc_storeStrong(location, 0);
}

void __61__CPSMapTemplateViewController__updateMapButtonsWithButtons___block_invoke_2(id *a1, void *a2, char *a3, void *a4)
{
  v35[1] = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v28[3] = a3;
  v28[2] = a4;
  v28[1] = a1;
  v28[0] = +[CPSMapButton buttonWithCPMapButton:location[0]];
  [v28[0] setDelegate:a1[4]];
  id v27 = (id)objc_msgSend(NSString, "stringWithFormat:", @"CPSMapButton%lu", a3 + 1);
  objc_msgSend(v28[0], "setAccessibilityLabel:");

  if (a3)
  {
    BOOL v5 = a3;
    char v4 = 1;
  }
  else
  {
    BOOL v5 = 0;
    char v4 = 0;
  }
  if (v4)
  {
    id v15 = CPSLocalizedStringForKey(@"ACCESSIBILITY_MAP_BUTTON");
    id v31 = v15;
    id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    objc_msgSend(v28[0], "setAccessibilityUserInputLabels:");
  }
  else
  {
    switch((unint64_t)v5)
    {
      case 0uLL:
        id v23 = CPSLocalizedStringForKey(@"ACCESSIBILITY_FIRST_MAP_BUTTON");
        v35[0] = v23;
        id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
        objc_msgSend(v28[0], "setAccessibilityUserInputLabels:");

        break;
      case 1uLL:
        id v21 = CPSLocalizedStringForKey(@"ACCESSIBILITY_SECOND_MAP_BUTTON");
        id v34 = v21;
        id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
        objc_msgSend(v28[0], "setAccessibilityUserInputLabels:");

        break;
      case 2uLL:
        id v19 = CPSLocalizedStringForKey(@"ACCESSIBILITY_THIRD_MAP_BUTTON");
        id v33 = v19;
        id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
        objc_msgSend(v28[0], "setAccessibilityUserInputLabels:");

        break;
      case 3uLL:
        id v17 = CPSLocalizedStringForKey(@"ACCESSIBILITY_FOURTH_MAP_BUTTON");
        id v32 = v17;
        id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
        objc_msgSend(v28[0], "setAccessibilityUserInputLabels:");

        break;
      default:
        JUMPOUT(0);
    }
  }
  id v6 = v28[0];
  id v11 = (id)[v28[0] widthAnchor];
  id v10 = (id)objc_msgSend(v11, "constraintEqualToConstant:");
  v30[0] = v10;
  id v9 = (id)[v28[0] heightAnchor];
  id v8 = (id)[v9 constraintEqualToConstant:30.0];
  v30[1] = v8;
  id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  objc_msgSend(v6, "addConstraints:");

  id v12 = (id)[a1[4] trailingBottomStackView];
  [v12 addArrangedSubview:v28[0]];

  id v13 = (id)[a1[4] mapButtons];
  [v13 addObject:v28[0]];

  objc_storeStrong(v28, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPSMapTemplateViewController;
  [(CPSBaseTemplateViewController *)&v11 viewDidAppear:a3];
  char v4 = objc_opt_class();
  id v6 = (id)[(CPSMapTemplateViewController *)v14 view];
  id v5 = (id)[v6 window];
  id location = CPSSafeCast_22(v4, v5);

  [location addEventObserver:v14];
  [(CPSMapTemplateViewController *)v14 _setFocusHoldersEnabled:0];
  [(CPSMapTemplateViewController *)v14 _setAutoHideDisabled:0 forRequester:@"MapTemplateRequester"];
  id v7 = [(CPSMapTemplateViewController *)v14 navBarHideTapGestureRecognizer];
  [(UITapGestureRecognizer *)v7 setEnabled:1];

  [(CPSMapTemplateViewController *)v14 _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:1];
  [(CPSMapTemplateViewController *)v14 _updateSafeArea];
  id v8 = [(CPSMapTemplateViewController *)v14 navigationAlertQueue];
  id v9 = [(CPSNavigationAlertQueue *)v8 currentAlert];

  if (v9)
  {
    id v3 = [(CPSMapTemplateViewController *)v14 navigationAlertQueue];
    [(CPSNavigationAlertQueue *)v3 beginAnimatingAlertIfPossible];
  }
  objc_storeStrong(&location, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSMapTemplateViewController;
  [(CPSBaseTemplateViewController *)&v9 viewWillDisappear:a3];
  id v3 = objc_opt_class();
  id v5 = (id)[(CPSMapTemplateViewController *)v12 view];
  id v4 = (id)[v5 window];
  id v8 = CPSSafeCast_22(v3, v4);

  [v8 removeEventObserver:v12];
  [(CPSMapTemplateViewController *)v12 _setAutoHideDisabled:1 forRequester:@"MapTemplateRequester"];
  id v6 = [(CPSMapTemplateViewController *)v12 navBarHideTapGestureRecognizer];
  [(UITapGestureRecognizer *)v6 setEnabled:0];

  id v7 = [(CPSMapTemplateViewController *)v12 autoHideTimer];
  [(NSTimer *)v7 invalidate];

  -[CPSMapTemplateViewController setAutoHideTimer:](v12, "setAutoHideTimer:");
  objc_storeStrong(&v8, 0);
}

- (void)viewDidLayoutSubviews
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSMapTemplateViewController;
  [(CPSMapTemplateViewController *)&v2 viewDidLayoutSubviews];
  [(CPSMapTemplateViewController *)v4 _calculateAndUpdateCardWidthConstraint];
}

- (void)setPreviewsView:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5->_previewsView != location[0])
  {
    SEL v3 = [(CPSMapTemplateViewController *)v5 previewsView];
    [(CPSTripPreviewsCardView *)v3 removeFromSuperview];

    objc_storeStrong((id *)&v5->_previewsView, location[0]);
    if (v5->_previewsView) {
      [(CPSMapTemplateViewController *)v5 _setAutoHideDisabled:1 forRequester:@"PreviewCardRequester"];
    }
    else {
      [(CPSMapTemplateViewController *)v5 _setAutoHideDisabled:0 forRequester:@"PreviewCardRequester"];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_reloadPreviewsView
{
  v119[6] = *MEMORY[0x263EF8340];
  v118 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  char v116 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    os_log_type_t type = v116;
    __os_log_helper_16_0_0(v115);
    _os_log_debug_impl(&dword_22B689000, log, type, "_setupPreviewsView", v115, 2u);
  }
  objc_storeStrong(location, 0);
  id v114 = 0;
  id v113 = [(CPSMapTemplateViewController *)v118 tripPreviews];
  if ([v113 count] != 0)
  {
    if ([(CPSMapTemplateViewController *)v118 previewOnlyRouteChoices])
    {
      id v53 = [CPSRoutePreviewsCardView alloc];
      id v52 = v118;
      id v54 = [(CPSMapTemplateViewController *)v118 tripPreviewTextConfiguration];
      objc_super v2 = -[CPSRoutePreviewsCardView initWithTripDelegate:trips:textConfiguration:](v53, "initWithTripDelegate:trips:textConfiguration:", v52, v113);
      id v3 = v114;
      id v114 = v2;
    }
    else
    {
      id v50 = [CPSPagingTripPreviewsCardView alloc];
      id v49 = v118;
      id v51 = [(CPSMapTemplateViewController *)v118 tripPreviewTextConfiguration];
      id v4 = -[CPSPagingTripPreviewsCardView initWithTripDelegate:trips:textConfiguration:](v50, "initWithTripDelegate:trips:textConfiguration:", v49, v113);
      id v5 = v114;
      id v114 = v4;

      [(CPSMapTemplateViewController *)v118 previewSelectedIndex];
      unint64_t v48 = [v113 count];
      if (v48 > [(CPSMapTemplateViewController *)v118 previewSelectedIndex])
      {
        id v47 = (id)objc_msgSend(v113, "objectAtIndex:", -[CPSMapTemplateViewController previewSelectedIndex](v118, "previewSelectedIndex"));
        objc_msgSend(v114, "setSelectedTrip:");
      }
    }
  }
  else
  {
    id v46 = [(CPSMapTemplateViewController *)v118 previewsView];

    if (v46)
    {
      id v42 = [(CPSMapTemplateViewController *)v118 previewsView];
      id v111 = (id)[(CPSTripPreviewsCardView *)v42 snapshotViewAfterScreenUpdates:1];

      long long v109 = 0u;
      long long v110 = 0u;
      id v43 = [(CPSMapTemplateViewController *)v118 previewsView];
      [(CPSTripPreviewsCardView *)v43 frame];
      *(void *)&long long v109 = v6;
      *((void *)&v109 + 1) = v7;
      *(void *)&long long v110 = v8;
      *((void *)&v110 + 1) = v9;

      id v44 = (id)[(CPSMapTemplateViewController *)v118 view];
      [v44 addSubview:v111];

      objc_msgSend(v111, "setFrame:", v109, v110);
      id v45 = (void *)MEMORY[0x263F1CB60];
      uint64_t v101 = MEMORY[0x263EF8330];
      int v102 = -1073741824;
      int v103 = 0;
      v104 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke;
      id v105 = &unk_2648A3B68;
      id v106 = v111;
      long long v107 = v109;
      long long v108 = v110;
      uint64_t v94 = MEMORY[0x263EF8330];
      int v95 = -1073741824;
      int v96 = 0;
      id v97 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_2;
      id v98 = &unk_2648A4F58;
      v99 = v118;
      id v100 = v111;
      objc_msgSend(v45, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, &v101, &v94, 0.4, 0.0, 10.0);
      objc_storeStrong(&v100, 0);
      objc_storeStrong((id *)&v99, 0);
      objc_storeStrong(&v106, 0);
      objc_storeStrong(&v111, 0);
    }
    else
    {
      id v39 = [(CPSMapTemplateViewController *)v118 navigationCardViewController];
      -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v39, "setNavigationCardHidden:forRequester:animated:completion:", 0);

      [(CPSMapTemplateViewController *)v118 _setETAViewHidden:0 forRequester:@"PreviewCardRequester" animated:1];
      id v41 = [(CPSMapTemplateViewController *)v118 navigationAlertQueue];
      id v40 = [(CPSNavigationAlertQueue *)v41 currentAlertView];
      [(CPSNavigationAlertView *)v40 setHidden:0];
    }
  }
  [(CPSMapTemplateViewController *)v118 setPreviewsView:v114];
  if (v114)
  {
    id v35 = (id)[(CPSMapTemplateViewController *)v118 view];
    [v35 addSubview:v114];

    id v37 = (id)[(CPSMapTemplateViewController *)v118 view];
    id v36 = (id)[v37 safeAreaLayoutGuide];
    [v36 layoutFrame];
    CGRect rect = v120;
    CGFloat v38 = CGRectGetHeight(v120) - 16.0;

    double v93 = v38;
    char v89 = 0;
    char v87 = 0;
    char v85 = 0;
    char v83 = 0;
    char v81 = 0;
    char v79 = 0;
    if ([(CPSMapTemplateViewController *)v118 rightHandDrive])
    {
      id v90 = (id)[(CPSMapTemplateViewController *)v118 view];
      char v89 = 1;
      id v88 = (id)[v90 safeAreaLayoutGuide];
      char v87 = 1;
      id v86 = (id)[v88 rightAnchor];
      char v85 = 1;
      id v10 = v86;
    }
    else
    {
      id v84 = (id)[(CPSMapTemplateViewController *)v118 view];
      char v83 = 1;
      id v82 = (id)[v84 safeAreaLayoutGuide];
      char v81 = 1;
      id v80 = (id)[v82 leftAnchor];
      char v79 = 1;
      id v10 = v80;
    }
    id v91 = v10;
    if (v79) {

    }
    if (v81) {
    if (v83)
    }

    if (v85) {
    if (v87)
    }

    if (v89) {
    char v76 = 0;
    }
    char v74 = 0;
    if ([(CPSMapTemplateViewController *)v118 rightHandDrive])
    {
      id v77 = (id)[v114 rightAnchor];
      char v76 = 1;
      id v11 = v77;
    }
    else
    {
      id v75 = (id)[v114 leftAnchor];
      char v74 = 1;
      id v11 = v75;
    }
    id v78 = v11;
    if (v74) {

    }
    if (v76) {
    double v73 = 0.0;
    }
    BOOL v12 = [(CPSMapTemplateViewController *)v118 rightHandDrive];
    double v13 = -8.0;
    if (!v12) {
      double v13 = 8.0;
    }
    double v73 = v13;
    id v18 = (id)[(CPSMapTemplateViewController *)v118 view];
    id v17 = (id)[v18 safeAreaLayoutGuide];
    id v72 = (id)[v17 bottomAnchor];

    id v20 = (id)[v114 bottomAnchor];
    id v19 = (id)[(CPSMapTemplateViewController *)v118 view];
    [v19 bounds];
    CGRect v70 = v121;
    id v71 = (id)[v20 constraintEqualToAnchor:v72 constant:-CGRectGetHeight(v121)];

    id v21 = (id)[v114 widthAnchor];
    id v69 = (id)[v21 constraintGreaterThanOrEqualToConstant:140.0];

    objc_msgSend(v69, "setPriority:");
    id v22 = (id)[v114 widthAnchor];
    id v68 = (id)[v22 constraintLessThanOrEqualToConstant:213.0];

    LODWORD(v14) = 1148846080;
    [v68 setPriority:v14];
    id v26 = (id)[v114 widthAnchor];
    id v25 = (id)[(CPSMapTemplateViewController *)v118 view];
    id v24 = (id)[v25 safeAreaLayoutGuide];
    id v23 = (id)[v24 widthAnchor];
    id v67 = (id)objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", 0.4);

    LODWORD(v15) = 1148829696;
    [v67 setPriority:v15];
    id v27 = (void *)MEMORY[0x263F08938];
    id v31 = (id)[v78 constraintEqualToAnchor:v91 constant:v73];
    v119[0] = v31;
    v119[1] = v67;
    v119[2] = v69;
    v119[3] = v68;
    id v30 = (id)[v114 heightAnchor];
    id v29 = (id)[v30 constraintEqualToConstant:v93];
    v119[4] = v29;
    v119[5] = v71;
    id v28 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:6];
    objc_msgSend(v27, "activateConstraints:");

    id v32 = (id)[(CPSMapTemplateViewController *)v118 view];
    [v32 layoutIfNeeded];

    uint64_t v58 = MEMORY[0x263EF8330];
    int v59 = -1073741824;
    int v60 = 0;
    id v61 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_3;
    id v62 = &unk_2648A4AD0;
    id v63 = v71;
    id v64 = v118;
    id v65 = v114;
    id v66 = (id)MEMORY[0x230F4C6B0](&v58);
    id v33 = [(CPSMapTemplateViewController *)v118 navigationCardViewController];
    BOOL v34 = [(CPSNavigationCardViewController *)v33 navigationCardHidden];

    if (v34)
    {
      [(CPSMapTemplateViewController *)v118 _setETAViewHidden:1 forRequester:@"PreviewCardRequester" animated:1];
      (*((void (**)(void))v66 + 2))();
    }
    else
    {
      id v16 = [(CPSMapTemplateViewController *)v118 navigationCardViewController];
      id v57 = v66;
      -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v16, "setNavigationCardHidden:forRequester:animated:completion:", 1);

      [(CPSMapTemplateViewController *)v118 _setETAViewHidden:1 forRequester:@"PreviewCardRequester" animated:1];
      objc_storeStrong(&v57, 0);
    }
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v65, 0);
    objc_storeStrong((id *)&v64, 0);
    objc_storeStrong(&v63, 0);
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v71, 0);
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v78, 0);
    objc_storeStrong(&v91, 0);
  }
  [(CPSMapTemplateViewController *)v118 _updateSafeArea];
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&v114, 0);
}

uint64_t __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke(uint64_t a1)
{
  id v4 = *(void **)(a1 + 32);
  CGFloat v1 = -CGRectGetHeight(*(CGRect *)(a1 + 40)) - 44.0;
  CGRect v5 = CGRectOffset(*(CGRect *)(a1 + 40), 0.0, v1);
  return objc_msgSend(v4, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

uint64_t __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) navigationCardViewController];
  objc_msgSend(v2, "setNavigationCardHidden:forRequester:animated:completion:", 0);

  [*(id *)(a1 + 32) _setETAViewHidden:0 forRequester:@"PreviewCardRequester" animated:1];
  id v4 = (id)[*(id *)(a1 + 32) navigationAlertQueue];
  id v3 = (id)[v4 currentAlertView];
  [v3 setHidden:0];

  return [*(id *)(a1 + 40) removeFromSuperview];
}

void __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_3(id *a1)
{
  v15[2] = a1;
  v15[1] = a1;
  [a1[4] setConstant:-8.0];
  id v2 = (void *)MEMORY[0x263F1CB60];
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  double v13 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_4;
  double v14 = &unk_2648A3BE0;
  v15[0] = a1[5];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  uint64_t v6 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_5;
  uint64_t v7 = &unk_2648A4F58;
  id v8 = a1[5];
  id v9 = a1[6];
  objc_msgSend(v2, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, &v10, 0.4, 0.0, 10.0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v15, 0);
}

void __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_4(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

uint64_t __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setLastFocusedItem:*(void *)(a1 + 40)];
  id v3 = (id)[*(id *)(a1 + 32) navigationAlertQueue];
  id v2 = (id)[v3 currentAlertView];
  [v2 setHidden:1];

  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

uint64_t __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

- (void)_updatePanGestureForHiFiTouch
{
  int v12 = self;
  v11[1] = (id)a2;
  id v9 = (id)[(CPSMapTemplateViewController *)self traitCollection];
  BOOL v10 = [v9 touchLevel] != 0;

  if (v10)
  {
    int v5 = [(CPSMapTemplateViewController *)v12 panGestureRecognizer];

    if (v5)
    {
      id v4 = (id)[(CPSMapTemplateViewController *)v12 view];
      id v3 = [(CPSMapTemplateViewController *)v12 panGestureRecognizer];
      objc_msgSend(v4, "removeGestureRecognizer:");

      [(CPSMapTemplateViewController *)v12 setPanGestureRecognizer:0];
    }
  }
  else
  {
    id v2 = [(CPSMapTemplateViewController *)v12 panGestureRecognizer];
    BOOL v8 = v2 != 0;

    if (!v8)
    {
      v11[0] = (id)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:v12 action:sel__handlePanGesture_];
      [v11[0] setDelegate:v12];
      [v11[0] setAllowedTouchTypes:&unk_26DF06B98];
      [v11[0] setDelaysTouchesEnded:0];
      id v6 = (id)[(CPSMapTemplateViewController *)v12 view];
      [v6 addGestureRecognizer:v11[0]];

      [(CPSMapTemplateViewController *)v12 setPanGestureRecognizer:v11[0]];
      uint64_t v7 = [(CPSMapTemplateViewController *)v12 hideTapGestureRecognizer];
      [(UITapGestureRecognizer *)v7 requireGestureRecognizerToFail:v11[0]];

      objc_storeStrong(v11, 0);
    }
  }
}

- (void)showNavigationAlert:(id)a3 animated:(BOOL)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v14 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke;
  BOOL v10 = &unk_2648A4828;
  id v11 = location[0];
  int v12 = v16;
  BOOL v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke(uint64_t a1)
{
  v24[2] = (id)a1;
  v24[1] = (id)a1;
  uint64_t v16 = MEMORY[0x263EF8330];
  int v17 = -1073741824;
  int v18 = 0;
  id v19 = __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke_2;
  id v20 = &unk_2648A4828;
  id v21 = *(id *)(a1 + 32);
  id v22 = *(id *)(a1 + 40);
  char v23 = *(unsigned char *)(a1 + 48) & 1;
  v24[0] = (id)MEMORY[0x230F4C6B0](&v16);
  id v5 = (id)[*(id *)(a1 + 40) navigationAlertQueue];
  char v6 = [v5 isDisplayingAlert];

  if (v6)
  {
    id location = CarPlaySupportGeneralLogging();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v14;
      __os_log_helper_16_0_0(v13);
      _os_log_impl(&dword_22B689000, log, type, "Alert already displayed, dismissing", v13, 2u);
    }
    objc_storeStrong(&location, 0);
    id v1 = *(void **)(a1 + 40);
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    BOOL v10 = __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke_160;
    id v11 = &unk_2648A4F08;
    id v12 = v24[0];
    [v1 dismissNavigationAlertAnimated:1 completion:&v7];
    objc_storeStrong(&v12, 0);
  }
  else
  {
    (*((void (**)(void))v24[0] + 2))();
  }
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
}

void __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v6, *(void *)(a1 + 32));
    _os_log_impl(&dword_22B689000, (os_log_t)location[0], OS_LOG_TYPE_INFO, "Presenting navigation alert %@", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  id v3 = (id)[*(id *)(a1 + 40) navigationAlertQueue];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) templateDelegate];
  objc_msgSend(v3, "prepareNavigationAlert:templateDelegate:animated:", v1);
}

uint64_t __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissNavigationAlertAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __74__CPSMapTemplateViewController_dismissNavigationAlertAnimated_completion___block_invoke;
  int v9 = &unk_2648A5A68;
  BOOL v10 = v16;
  BOOL v12 = v14;
  id v11 = location;
  dispatch_async(queue, &v5);

  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

void __74__CPSMapTemplateViewController_dismissNavigationAlertAnimated_completion___block_invoke(uint64_t a1)
{
  v13[2] = (id)a1;
  v13[1] = (id)a1;
  id v3 = (id)[*(id *)(a1 + 32) navigationAlertQueue];
  v13[0] = (id)[v3 currentAlert];

  id v5 = (id)[*(id *)(a1 + 32) navigationAlertQueue];
  id v12 = (id)[v5 currentAlertView];

  if (v13[0] && v12)
  {
    id v2 = (id)[*(id *)(a1 + 32) navigationAlertQueue];
    char v1 = *(unsigned char *)(a1 + 48);
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    int v9 = __74__CPSMapTemplateViewController_dismissNavigationAlertAnimated_completion___block_invoke_2;
    BOOL v10 = &unk_2648A53F0;
    id v11 = *(id *)(a1 + 40);
    [v2 dismissCurrentNavigationAlertAnimated:v1 & 1 context:2 completion:&v6];

    objc_storeStrong(&v11, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
}

uint64_t __74__CPSMapTemplateViewController_dismissNavigationAlertAnimated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1);
}

- (double)_widthForNavigationAlert
{
  id v5 = (id)[(CPSMapTemplateViewController *)self view];
  id v4 = (id)[v5 safeAreaLayoutGuide];
  [v4 layoutFrame];
  double v6 = v2 * 0.4;

  double v7 = v6;
  if (v6 < 140.0) {
    return 140.0;
  }
  if (v6 > 213.0) {
    return 213.0;
  }
  return v7;
}

- (void)_performAlertSizingForAlert:(id)a3 animated:(BOOL)a4
{
  v56[3] = *MEMORY[0x263EF8340];
  id v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v53 = a4;
  [(CPSMapTemplateViewController *)v55 _widthForNavigationAlert];
  double v52 = v4;
  id v22 = location[0];
  id v23 = (id)[(CPSMapTemplateViewController *)v55 view];
  [v23 bounds];
  CGRect v47 = v57;
  CGRectGetHeight(v57);
  CGSizeMake_15();
  double v48 = v5;
  double v49 = v6;
  objc_msgSend(v22, "sizeThatFits:", v5, v6);
  uint64_t v50 = v7;
  double v51 = v8;

  id v24 = [(CPSMapTemplateViewController *)v55 navigationAlertBottomConstraint];
  [(NSLayoutConstraint *)v24 setActive:0];

  id v25 = (id)[location[0] bottomAnchor];
  id v26 = (id)[(CPSMapTemplateViewController *)v55 view];
  id v27 = (id)[v26 safeAreaLayoutGuide];
  id v28 = (id)[v27 bottomAnchor];
  if (a4) {
    double v20 = v51;
  }
  else {
    double v20 = -8.0;
  }
  id v19 = (id)[v25 constraintEqualToAnchor:v28 constant:v20];
  -[CPSMapTemplateViewController setNavigationAlertBottomConstraint:](v55, "setNavigationAlertBottomConstraint:");

  char v44 = 0;
  char v42 = 0;
  if ([(CPSMapTemplateViewController *)v55 rightHandDrive])
  {
    id v45 = (id)[location[0] rightAnchor];
    char v44 = 1;
    id v9 = v45;
  }
  else
  {
    id v43 = (id)[location[0] leftAnchor];
    char v42 = 1;
    id v9 = v43;
  }
  id v46 = v9;
  if (v42) {

  }
  if (v44) {
  char v39 = 0;
  }
  char v37 = 0;
  char v35 = 0;
  char v33 = 0;
  char v31 = 0;
  char v29 = 0;
  if ([(CPSMapTemplateViewController *)v55 rightHandDrive])
  {
    id v40 = (id)[(CPSMapTemplateViewController *)v55 view];
    char v39 = 1;
    id v38 = (id)[v40 safeAreaLayoutGuide];
    char v37 = 1;
    id v36 = (id)[v38 rightAnchor];
    char v35 = 1;
    id v10 = v36;
  }
  else
  {
    id v34 = (id)[(CPSMapTemplateViewController *)v55 view];
    char v33 = 1;
    id v32 = (id)[v34 safeAreaLayoutGuide];
    char v31 = 1;
    id v30 = (id)[v32 leftAnchor];
    char v29 = 1;
    id v10 = v30;
  }
  id v41 = v10;
  if (v29) {

  }
  if (v31) {
  if (v33)
  }

  if (v35) {
  if (v37)
  }

  if (v39) {
  BOOL v13 = (void *)MEMORY[0x263F08938];
  }
  int v18 = [(CPSMapTemplateViewController *)v55 navigationAlertBottomConstraint];
  v56[0] = v18;
  BOOL v11 = [(CPSMapTemplateViewController *)v55 rightHandDrive];
  double v12 = -8.0;
  if (!v11) {
    double v12 = 8.0;
  }
  id v17 = (id)[v46 constraintEqualToAnchor:v41 constant:v12];
  v56[1] = v17;
  id v16 = (id)[location[0] widthAnchor];
  id v15 = (id)[v16 constraintEqualToConstant:v52];
  v56[2] = v15;
  id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
  objc_msgSend(v13, "activateConstraints:");

  [location[0] setNeedsLayout];
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
}

- (void)updateNavigationAlert:(id)a3
{
  double v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __54__CPSMapTemplateViewController_updateNavigationAlert___block_invoke;
  double v8 = &unk_2648A3990;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __54__CPSMapTemplateViewController_updateNavigationAlert___block_invoke(uint64_t a1)
{
  v12[2] = (id)a1;
  v12[1] = (id)a1;
  id v4 = (id)[*(id *)(a1 + 32) navigationAlertQueue];
  v12[0] = (id)[v4 currentAlertView];

  if (v12[0])
  {
    [v12[0] updateNavigationAlert:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _performAlertSizingForAlert:v12[0] animated:0];
    double v2 = (void *)MEMORY[0x263F1CB60];
    double v1 = *MEMORY[0x263F1D4D8];
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    double v8 = __54__CPSMapTemplateViewController_updateNavigationAlert___block_invoke_2;
    id v9 = &unk_2648A3BE0;
    id v10 = *(id *)(a1 + 32);
    objc_msgSend(v2, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, &v5, v1, 0.0, 4.0, 20.0);
    objc_storeStrong(&v10, 0);
    int v11 = 0;
  }
  else
  {
    int v11 = 1;
  }
  objc_storeStrong(v12, 0);
}

void __54__CPSMapTemplateViewController_updateNavigationAlert___block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)_setNavigationAlertView:(id)a3 visible:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  v95[1] = *MEMORY[0x263EF8340];
  id v91 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v89 = a4;
  BOOL v88 = a5;
  id v87 = 0;
  objc_storeStrong(&v87, a6);
  if (v89)
  {
    id v27 = (id)[(CPSMapTemplateViewController *)v91 view];
    [v27 addSubview:location[0]];

    [(CPSMapTemplateViewController *)v91 _performAlertSizingForAlert:location[0] animated:v88];
    id v28 = (id)[(CPSMapTemplateViewController *)v91 view];
    [v28 layoutIfNeeded];

    [(CPSMapTemplateViewController *)v91 _performAlertSizingForAlert:location[0] animated:v88];
    char v29 = (void *)MEMORY[0x263F08938];
    char v31 = [(CPSMapTemplateViewController *)v91 navigationCardViewLayoutViewBottomConstraint];
    v95[0] = v31;
    id v30 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v95);
    objc_msgSend(v29, "deactivateConstraints:");

    char v35 = [(CPSMapTemplateViewController *)v91 navigationCardViewLayoutHelperView];
    id v34 = (id)[(CPSLayoutHelperView *)v35 bottomAnchor];
    id v33 = (id)[location[0] topAnchor];
    id v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:constant:", -8.0);
    [(CPSMapTemplateViewController *)v91 setNavigationCardViewLayoutViewBottomConstraint:"setNavigationCardViewLayoutViewBottomConstraint:"];

    id v36 = [(CPSMapTemplateViewController *)v91 navigationCardViewLayoutViewBottomConstraint];
    LODWORD(v6) = 1148846080;
    [(NSLayoutConstraint *)v36 setPriority:v6];

    char v37 = (void *)MEMORY[0x263F08938];
    char v39 = [(CPSMapTemplateViewController *)v91 navigationCardViewLayoutViewBottomConstraint];
    uint64_t v94 = v39;
    id v38 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
    objc_msgSend(v37, "activateConstraints:");

    uint64_t v80 = MEMORY[0x263EF8330];
    int v81 = -1073741824;
    int v82 = 0;
    char v83 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke;
    id v84 = &unk_2648A3BE0;
    char v85 = v91;
    id v86 = (id)MEMORY[0x230F4C6B0](&v80);
    uint64_t v71 = MEMORY[0x263EF8330];
    int v72 = -1073741824;
    int v73 = 0;
    char v74 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_2;
    id v75 = &unk_2648A4298;
    char v76 = v91;
    id v78 = v87;
    id v77 = location[0];
    id v79 = (id)MEMORY[0x230F4C6B0](&v71);
    if (v88)
    {
      id v26 = (void *)MEMORY[0x263F1CB60];
      double v24 = *MEMORY[0x263F1D4D8];
      id v25 = v86;
      uint64_t v65 = MEMORY[0x263EF8330];
      int v66 = -1073741824;
      int v67 = 0;
      id v68 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_3;
      id v69 = &unk_2648A4F08;
      id v70 = v79;
      [v26 animateWithDuration:4 delay:v25 usingSpringWithDamping:&v65 initialSpringVelocity:v24 options:0.0 animations:4.0 completion:20.0];
      objc_storeStrong(&v70, 0);
    }
    else
    {
      (*((void (**)(void))v86 + 2))();
      (*((void (**)(void))v79 + 2))();
    }
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v77, 0);
    objc_storeStrong(&v78, 0);
    objc_storeStrong((id *)&v76, 0);
    objc_storeStrong(&v86, 0);
    objc_storeStrong((id *)&v85, 0);
  }
  else
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    int v59 = -1073741824;
    int v60 = 0;
    id v61 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_4;
    id v62 = &unk_2648A3BE0;
    id v63 = v91;
    id v64 = (id)MEMORY[0x230F4C6B0](&v58);
    uint64_t v49 = MEMORY[0x263EF8330];
    int v50 = -1073741824;
    int v51 = 0;
    double v52 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_5;
    BOOL v53 = &unk_2648A4310;
    id v54 = location[0];
    id v55 = v91;
    id v56 = v87;
    id v57 = (id)MEMORY[0x230F4C6B0](&v49);
    [location[0] setUserInteractionEnabled:0];
    int v11 = (void *)MEMORY[0x263F08938];
    BOOL v13 = [(CPSMapTemplateViewController *)v91 navigationCardViewLayoutViewBottomConstraint];
    double v93 = v13;
    id v12 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v93);
    objc_msgSend(v11, "deactivateConstraints:");

    id v19 = [(CPSMapTemplateViewController *)v91 navigationCardViewLayoutHelperView];
    id v18 = (id)[(CPSLayoutHelperView *)v19 bottomAnchor];
    id v17 = (id)[(CPSMapTemplateViewController *)v91 view];
    id v16 = (id)[v17 safeAreaLayoutGuide];
    id v15 = (id)[v16 bottomAnchor];
    id v14 = (id)objc_msgSend(v18, "constraintEqualToAnchor:constant:", -8.0);
    [(CPSMapTemplateViewController *)v91 setNavigationCardViewLayoutViewBottomConstraint:"setNavigationCardViewLayoutViewBottomConstraint:"];

    double v20 = [(CPSMapTemplateViewController *)v91 navigationCardViewLayoutViewBottomConstraint];
    LODWORD(v7) = 1148846080;
    [(NSLayoutConstraint *)v20 setPriority:v7];

    id v21 = (void *)MEMORY[0x263F08938];
    id v23 = [(CPSMapTemplateViewController *)v91 navigationCardViewLayoutViewBottomConstraint];
    id v92 = v23;
    id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v92 count:1];
    objc_msgSend(v21, "activateConstraints:");

    if (v88)
    {
      [location[0] setNeedsLayout];
      id v10 = (void *)MEMORY[0x263F1CB60];
      double v8 = *MEMORY[0x263F1D4D8];
      id v9 = v64;
      uint64_t v43 = MEMORY[0x263EF8330];
      int v44 = -1073741824;
      int v45 = 0;
      id v46 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_6;
      CGRect v47 = &unk_2648A4F08;
      id v48 = v57;
      [v10 animateWithDuration:0x10000 delay:v9 options:&v43 animations:v8 completion:0.0];
      objc_storeStrong(&v48, 0);
    }
    else
    {
      (*((void (**)(void))v64 + 2))();
      (*((void (**)(void))v57 + 2))();
    }
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong((id *)&v55, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v64, 0);
    objc_storeStrong((id *)&v63, 0);
  }
  objc_storeStrong(&v87, 0);
  objc_storeStrong(location, 0);
}

void __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) navigationAlertBottomConstraint];
  [v1 setConstant:-8.0];

  [*(id *)(a1 + 32) _setETAViewHidden:1 forRequester:@"NavigationAlertRequester" animated:0];
  id v3 = (id)[*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

uint64_t __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_2(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) navigationAlertQueue];
  [v3 beginAnimatingAlertIfPossible];

  if (*(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  [*(id *)(a1 + 32) _updateSafeArea];
  id v2 = (id)[*(id *)(a1 + 32) lastFocusedItem];
  objc_msgSend(*(id *)(a1 + 32), "setItemFocusedBeforeNavAlert:");

  [*(id *)(a1 + 32) setLastFocusedItem:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setShouldRestoreFocusToNavigationBar:0];
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

uint64_t __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_4(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) view];
  [v3 bounds];
  double Height = CGRectGetHeight(v6);
  id v2 = (id)[*(id *)(a1 + 32) navigationAlertBottomConstraint];
  [v2 setConstant:Height];

  id v5 = (id)[*(id *)(a1 + 32) view];
  [v5 layoutIfNeeded];
}

uint64_t __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 40) _updateSafeArea];
}

uint64_t __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)navigationAlertQueue:(id)a3 shouldDisplayAlertView:(id)a4 animated:(BOOL)a5
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  BOOL v22 = a5;
  id v12 = [(CPSMapTemplateViewController *)v25 mapTemplateDelegate];
  char v13 = [(CPMapClientTemplateDelegate *)v12 conformsToProtocol:&unk_26DF78BC8];

  if (v13)
  {
    id v9 = [(CPSMapTemplateViewController *)v25 mapTemplateDelegate];
    id v8 = (id)[v23 navigationAlert];
    -[CPMapClientTemplateDelegate clientNavigationAlertWillAppear:](v9, "clientNavigationAlertWillAppear:");
  }
  objc_initWeak(&v21, v25);
  double v7 = v25;
  id v5 = v23;
  BOOL v6 = v22;
  uint64_t v14 = MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = __85__CPSMapTemplateViewController_navigationAlertQueue_shouldDisplayAlertView_animated___block_invoke;
  id v18 = &unk_2648A4C68;
  objc_copyWeak(&v20, &v21);
  id v19 = v23;
  [(CPSMapTemplateViewController *)v7 _setNavigationAlertView:v5 visible:1 animated:v6 completion:&v14];
  objc_storeStrong(&v19, 0);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v21);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __85__CPSMapTemplateViewController_navigationAlertQueue_shouldDisplayAlertView_animated___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 5);
  id v4 = (id)[location[0] mapTemplateDelegate];
  char v5 = [v4 conformsToProtocol:&unk_26DF78BC8];

  if (v5)
  {
    id v2 = (id)[location[0] mapTemplateDelegate];
    id v1 = (id)[a1[4] navigationAlert];
    objc_msgSend(v2, "clientNavigationAlertDidAppear:");
  }
  objc_storeStrong(location, 0);
}

- (void)navigationAlertQueue:(id)a3 shouldRemoveAlertView:(id)a4 animated:(BOOL)a5 dismissalContext:(unint64_t)a6 completion:(id)a7
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  BOOL v29 = a5;
  id v28 = (void *)a6;
  id v27 = 0;
  objc_storeStrong(&v27, a7);
  int v16 = [(CPSMapTemplateViewController *)v32 mapTemplateDelegate];
  char v17 = [(CPMapClientTemplateDelegate *)v16 conformsToProtocol:&unk_26DF78BC8];

  if (v17)
  {
    int v11 = [(CPSMapTemplateViewController *)v32 mapTemplateDelegate];
    id v10 = (id)[v30 navigationAlert];
    -[CPMapClientTemplateDelegate clientNavigationAlertWillDisappear:context:](v11, "clientNavigationAlertWillDisappear:context:");
  }
  objc_initWeak(&v26, v32);
  id v9 = v32;
  id v7 = v30;
  BOOL v8 = v29;
  uint64_t v18 = MEMORY[0x263EF8330];
  int v19 = -1073741824;
  int v20 = 0;
  id v21 = __112__CPSMapTemplateViewController_navigationAlertQueue_shouldRemoveAlertView_animated_dismissalContext_completion___block_invoke;
  BOOL v22 = &unk_2648A5A90;
  objc_copyWeak(v25, &v26);
  id v23 = v30;
  v25[1] = v28;
  id v24 = v27;
  [(CPSMapTemplateViewController *)v9 _setNavigationAlertView:v7 visible:0 animated:v8 completion:&v18];
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_destroyWeak(v25);
  objc_destroyWeak(&v26);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

void __112__CPSMapTemplateViewController_navigationAlertQueue_shouldRemoveAlertView_animated_dismissalContext_completion___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = (id)[location[0] mapTemplateDelegate];
  char v10 = [v9 conformsToProtocol:&unk_26DF78BC8];

  if (v10)
  {
    id v7 = (id)[location[0] mapTemplateDelegate];
    id v6 = (id)[*(id *)(a1 + 32) navigationAlert];
    objc_msgSend(v7, "clientNavigationAlertDidDisappear:context:");
  }
  id v1 = (id)[location[0] itemFocusedBeforeNavAlert];
  objc_msgSend(location[0], "setLastFocusedItem:");

  id v2 = (id)[location[0] navigationController];
  id v3 = (id)[v2 navigationBar];
  id v4 = (id)[location[0] lastFocusedItem];
  char v11 = 0;
  char isKindOfClass = 1;
  if ((objc_msgSend(v3, "containsView:") & 1) == 0)
  {
    id v12 = (id)[location[0] lastFocusedItem];
    char v11 = 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (v11) {

  }
  if (isKindOfClass) {
    [location[0] setShouldRestoreFocusToNavigationBar:1];
  }
  [location[0] setItemFocusedBeforeNavAlert:0];
  [location[0] setNeedsFocusUpdate];
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(location, 0);
}

- (BOOL)canAnimateNavigationAlert
{
  id v4 = (id)[(CPSMapTemplateViewController *)self navigationController];
  id v2 = (CPSMapTemplateViewController *)(id)[v4 visibleViewController];
  BOOL v5 = v2 == self;

  return v5;
}

- (id)_tripDidBegin:(id)a3 withEstimates:(id)a4 forIdentifier:(id)a5
{
  v91[6] = *MEMORY[0x263EF8340];
  id v90 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v88 = 0;
  objc_storeStrong(&v88, a4);
  id v87 = 0;
  objc_storeStrong(&v87, a5);
  char v84 = 0;
  char v82 = 0;
  char v80 = 0;
  char v78 = 0;
  char v76 = 0;
  char v74 = 0;
  if ([(CPSMapTemplateViewController *)v90 rightHandDrive])
  {
    id v85 = (id)[(CPSMapTemplateViewController *)v90 view];
    char v84 = 1;
    id v83 = (id)[v85 safeAreaLayoutGuide];
    char v82 = 1;
    id v81 = (id)[v83 rightAnchor];
    char v80 = 1;
    id v5 = v81;
  }
  else
  {
    id v79 = (id)[(CPSMapTemplateViewController *)v90 view];
    char v78 = 1;
    id v77 = (id)[v79 safeAreaLayoutGuide];
    char v76 = 1;
    id v75 = (id)[v77 leftAnchor];
    char v74 = 1;
    id v5 = v75;
  }
  id v86 = v5;
  if (v74) {

  }
  if (v76) {
  if (v78)
  }

  if (v80) {
  if (v82)
  }

  if (v84) {
  double v73 = 0.0;
  }
  BOOL v6 = [(CPSMapTemplateViewController *)v90 rightHandDrive];
  double v7 = -8.0;
  if (!v6) {
    double v7 = 8.0;
  }
  double v73 = v7;
  char v39 = [(CPSMapTemplateViewController *)v90 navigationCardViewController];
  [(CPSNavigationCardViewController *)v39 setNavigatingBundleIdentifier:v87];

  id v41 = [CPSNavigator alloc];
  id v40 = v87;
  int v44 = [(CPSBaseTemplateViewController *)v90 templateEnvironment];
  uint64_t v43 = [(CPSTemplateEnvironment *)v44 sessionStatus];
  id v42 = (id)[(CARSessionStatus *)v43 currentSession];
  int v72 = -[CPSNavigator initWithIdentifier:currentSession:forTrip:](v41, "initWithIdentifier:currentSession:forTrip:", v40);

  int v45 = [(CPSMapTemplateViewController *)v90 navigatorObserver];
  [(CPSNavigatorObserving *)v45 didCreateNavigator:v72];

  [(CPSNavigator *)v72 setNavigationOwnershipDelegate:v90];
  [(CPSNavigator *)v72 addDisplayDelegate:v90];
  id v46 = v90;
  CGRect v47 = [(CPSMapTemplateViewController *)v90 navigationCardViewLayoutHelperView];
  [(CPSMapTemplateViewController *)v46 didChangeLayout:"didChangeLayout:"];

  id v48 = [(CPSMapTemplateViewController *)v90 navigationETAView];
  [(CPSNavigationETAView *)v48 removeFromSuperview];

  if (![(CPSMapTemplateViewController *)v90 hasSetTripEstimateStyle])
  {
    id v37 = (id)[(CPSMapTemplateViewController *)v90 traitCollection];
    BOOL v38 = [v37 userInterfaceStyle] != 1;

    BOOL v71 = v38;
    [(CPSMapTemplateViewController *)v90 setTripEstimateStyle:v71];
  }
  BOOL v29 = [CPSNavigationETAView alloc];
  id v70 = [(CPSNavigationETAView *)v29 initWithTrip:location[0] style:[(CPSMapTemplateViewController *)v90 tripEstimateStyle]];
  [(CPSNavigationETAView *)v70 updateEstimates:v88 forManeuver:0];
  [(CPSMapTemplateViewController *)v90 setNavigationETAView:v70];
  id v31 = (id)[(CPSMapTemplateViewController *)v90 view];
  id v30 = [(CPSMapTemplateViewController *)v90 navigationETAView];
  objc_msgSend(v31, "addSubview:");

  id v36 = (id)[(CPSNavigationETAView *)v70 bottomAnchor];
  id v35 = (id)[(CPSMapTemplateViewController *)v90 view];
  id v34 = (id)[v35 safeAreaLayoutGuide];
  id v33 = (id)[v34 bottomAnchor];
  id v32 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:", 44.0);
  -[CPSMapTemplateViewController setNavigationETAViewBottomConstraint:](v90, "setNavigationETAViewBottomConstraint:");

  char v67 = 0;
  char v65 = 0;
  char v63 = 0;
  char v61 = 0;
  if ([(CPSMapTemplateViewController *)v90 rightHandDrive])
  {
    id v68 = [(CPSMapTemplateViewController *)v90 navigationETAView];
    char v67 = 1;
    id v66 = (id)[v68 rightAnchor];
    char v65 = 1;
    id v8 = v66;
  }
  else
  {
    id v64 = [(CPSMapTemplateViewController *)v90 navigationETAView];
    char v63 = 1;
    id v62 = (id)[v64 leftAnchor];
    char v61 = 1;
    id v8 = v62;
  }
  id v69 = v8;
  if (v61) {

  }
  if (v63) {
  if (v65)
  }

  if (v67) {
  id v13 = (id)[(CPSNavigationETAView *)v70 heightAnchor];
  }
  id v60 = (id)[v13 constraintEqualToConstant:44.0];

  objc_msgSend(v60, "setPriority:");
  id v14 = (id)[(CPSNavigationETAView *)v70 widthAnchor];
  id v59 = (id)[v14 constraintLessThanOrEqualToConstant:213.0];

  LODWORD(v9) = 1148846080;
  [v59 setPriority:v9];
  id v15 = (id)[(CPSNavigationETAView *)v70 widthAnchor];
  id v58 = (id)[v15 constraintGreaterThanOrEqualToConstant:140.0];

  LODWORD(v10) = 1148846080;
  [v58 setPriority:v10];
  id v19 = (id)[(CPSNavigationETAView *)v70 widthAnchor];
  id v18 = (id)[(CPSMapTemplateViewController *)v90 view];
  id v17 = (id)[v18 safeAreaLayoutGuide];
  id v16 = (id)[v17 widthAnchor];
  id v57 = (id)objc_msgSend(v19, "constraintEqualToAnchor:multiplier:", 0.4);

  LODWORD(v11) = 1148829696;
  [v57 setPriority:v11];
  int v20 = (void *)MEMORY[0x263F08938];
  id v23 = (id)[v69 constraintEqualToAnchor:v86 constant:v73];
  v91[0] = v23;
  BOOL v22 = [(CPSMapTemplateViewController *)v90 navigationETAViewBottomConstraint];
  v91[1] = v22;
  v91[2] = v60;
  v91[3] = v57;
  v91[4] = v59;
  v91[5] = v58;
  id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:6];
  objc_msgSend(v20, "activateConstraints:");

  [(CPSMapTemplateViewController *)v90 setNavigator:v72];
  [(CPSNavigationETAView *)v70 layoutIfNeeded];
  id v24 = (id)[(CPSMapTemplateViewController *)v90 view];
  [v24 layoutIfNeeded];

  [(CPSMapTemplateViewController *)v90 _setETAViewHidden:1 forRequester:@"InitialTripRequester" animated:0];
  -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v90, "_setETAViewHidden:forRequester:animated:", 0);
  id v25 = [(CPSMapTemplateViewController *)v90 navigationCardViewController];
  -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v25, "setNavigationCardHidden:forRequester:animated:completion:", 0, @"TripEndedRequester", 1);

  dispatch_time_t when = dispatch_time(0, 1000000000);
  queue = MEMORY[0x263EF83A0];
  uint64_t v51 = MEMORY[0x263EF8330];
  int v52 = -1073741824;
  int v53 = 0;
  id v54 = __74__CPSMapTemplateViewController__tripDidBegin_withEstimates_forIdentifier___block_invoke;
  id v55 = &unk_2648A3BE0;
  id v56 = v90;
  dispatch_after(when, queue, &v51);

  id v28 = v72;
  objc_storeStrong((id *)&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong((id *)&v70, 0);
  objc_storeStrong((id *)&v72, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(location, 0);

  return v28;
}

uint64_t __74__CPSMapTemplateViewController__tripDidBegin_withEstimates_forIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setETAViewHidden:forRequester:animated:", 0, @"InitialTripRequester", 1, a1, a1);
}

- (void)viewSafeAreaInsetsDidChange
{
  v9[2] = self;
  v9[1] = (id)a2;
  id v3 = (void *)MEMORY[0x263F1CB60];
  double v2 = *MEMORY[0x263F1D4D8];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  double v7 = __59__CPSMapTemplateViewController_viewSafeAreaInsetsDidChange__block_invoke;
  id v8 = &unk_2648A3BE0;
  v9[0] = self;
  objc_msgSend(v3, "animateWithDuration:animations:", v2);
  objc_storeStrong(v9, 0);
}

void __59__CPSMapTemplateViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v4 = a1;
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CPSMapTemplateViewController;
  objc_msgSendSuper2(&v3, sel_viewSafeAreaInsetsDidChange);
  id v2 = (id)[*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  id v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v40 = a4;
  id v19 = [(CPSMapTemplateViewController *)v42 navigationCardViewController];
  [(CPSNavigationCardViewController *)v19 navigator:location[0] didEndTrip:a4];

  id v39 = 0;
  int v20 = [(CPSMapTemplateViewController *)v42 previewsView];

  if (v20)
  {
    id v13 = [(CPSMapTemplateViewController *)v42 previewsView];
    id v4 = (id)[(CPSTripPreviewsCardView *)v13 snapshotViewAfterScreenUpdates:0];
    id v5 = v39;
    id v39 = v4;

    id v14 = (id)[(CPSMapTemplateViewController *)v42 view];
    [v14 addSubview:v39];

    id v15 = [(CPSMapTemplateViewController *)v42 previewsView];
    [(CPSTripPreviewsCardView *)v15 frame];
    *(void *)&long long v37 = v6;
    *((void *)&v37 + 1) = v7;
    *(void *)&long long v38 = v8;
    *((void *)&v38 + 1) = v9;

    objc_msgSend(v39, "setFrame:", v37, v38);
    id v17 = (void *)MEMORY[0x263F1CB60];
    double v16 = *MEMORY[0x263F1D4D8];
    uint64_t v28 = MEMORY[0x263EF8330];
    int v29 = -1073741824;
    int v30 = 0;
    id v31 = __53__CPSMapTemplateViewController_navigator_didEndTrip___block_invoke;
    id v32 = &unk_2648A57C8;
    id v33 = v39;
    long long v35 = v37;
    long long v36 = v38;
    id v34 = v42;
    uint64_t v21 = MEMORY[0x263EF8330];
    int v22 = -1073741824;
    int v23 = 0;
    id v24 = __53__CPSMapTemplateViewController_navigator_didEndTrip___block_invoke_2;
    id v25 = &unk_2648A4F58;
    id v26 = v39;
    id v27 = v42;
    [v17 animateWithDuration:65540 delay:&v28 options:&v21 animations:v16 completion:0.0];
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v34, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    [(CPSMapTemplateViewController *)v42 _updateSafeArea];
  }
  double v10 = [(CPSMapTemplateViewController *)v42 previewsView];
  [(CPSTripPreviewsCardView *)v10 setHidden:1];

  double v11 = [(CPSMapTemplateViewController *)v42 navigator];
  [(CPSNavigator *)v11 invalidate];

  -[CPSMapTemplateViewController setNavigator:](v42, "setNavigator:");
  -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v42, "_setETAViewHidden:forRequester:animated:", 1);
  id v12 = [(CPSMapTemplateViewController *)v42 navigationCardViewController];
  [(CPSNavigationCardViewController *)v12 setNavigationCardHidden:1 forRequester:@"TripEndedRequester" animated:1 completion:0];

  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
}

void __53__CPSMapTemplateViewController_navigator_didEndTrip___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  CGFloat v1 = -CGRectGetHeight(*(CGRect *)(a1 + 48)) - 44.0;
  CGRect v5 = CGRectOffset(*(CGRect *)(a1 + 48), 0.0, v1);
  objc_msgSend(v2, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  id v4 = (id)[*(id *)(a1 + 40) view];
  [v4 layoutIfNeeded];
}

uint64_t __53__CPSMapTemplateViewController_navigator_didEndTrip___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _updateSafeArea];
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  double v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  [(CPSMapTemplateViewController *)v10 _setETAViewHidden:0 forRequester:@"InitialTripRequester" animated:1];
  CGRect v5 = v10;
  uint64_t v6 = [(CPSMapTemplateViewController *)v10 navigationCardViewLayoutHelperView];
  [(CPSMapTemplateViewController *)v5 didChangeLayout:"didChangeLayout:"];

  uint64_t v7 = [(CPSMapTemplateViewController *)v10 navigationCardViewController];
  [(CPSNavigationCardViewController *)v7 showManeuvers:location[0] usingDisplayStyles:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v14 = a4;
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = 0;
  objc_storeStrong(&v12, a6);
  [(CPSMapTemplateViewController *)v16 _setETAViewHidden:0 forRequester:@"InitialTripRequester" animated:1];
  uint64_t v9 = v16;
  double v10 = [(CPSMapTemplateViewController *)v16 navigationCardViewLayoutHelperView];
  [(CPSMapTemplateViewController *)v9 didChangeLayout:"didChangeLayout:"];

  double v11 = [(CPSMapTemplateViewController *)v16 navigationCardViewController];
  [(CPSNavigationCardViewController *)v11 navigator:location[0] pausedTripForReason:v14 description:v13 usingColor:v12];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  CGRect v5 = [(CPSMapTemplateViewController *)v8 navigationCardViewController];
  [(CPSNavigationCardViewController *)v5 updateEstimates:location[0] forManeuver:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] identifier];
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)v9, (uint64_t)v7);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "%@: button selected with UUID: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v4 = [(CPSBaseTemplateViewController *)v9 templateDelegate];
  char v5 = [(CPTemplateDelegate *)v4 conformsToProtocol:&unk_26DF72840];

  if (v5)
  {
    objc_super v3 = [(CPSBaseTemplateViewController *)v9 templateDelegate];
    [(CPTemplateDelegate *)v3 handleActionForControlIdentifier:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)_buttons
{
  return [(CPSMapTemplateViewController *)self mapButtons];
}

- (id)_buttonForIdentifier:(id)a3
{
  int v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v12 = 0;
  id v13 = &v12;
  int v14 = 838860800;
  int v15 = 48;
  double v16 = __Block_byref_object_copy__4;
  id v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  id v5 = [(CPSMapTemplateViewController *)v20 _buttons];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __53__CPSMapTemplateViewController__buttonForIdentifier___block_invoke;
  double v10 = &unk_2648A5AB8;
  v11[0] = location[0];
  v11[1] = &v12;
  [v5 enumerateObjectsUsingBlock:&v6];

  id v4 = (id)v13[5];
  objc_storeStrong(v11, 0);
  _Block_object_dispose(&v12, 8);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);

  return v4;
}

void __53__CPSMapTemplateViewController__buttonForIdentifier___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = (id)[location[0] identifier];
  char v7 = [v6 isEqual:a1[4]];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)tripView:(id)a3 selectedTrip:(id)a4 routeChoice:(id)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  uint64_t v9 = [(CPSBaseTemplateViewController *)v13 templateDelegate];
  id v8 = (id)[v11 identifier];
  id v7 = (id)[v10 identifier];
  -[CPTemplateDelegate previewTripIdentifier:usingRouteIdentifier:](v9, "previewTripIdentifier:usingRouteIdentifier:", v8);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)tripView:(id)a3 startedTrip:(id)a4 routeChoice:(id)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  uint64_t v9 = [(CPSBaseTemplateViewController *)v13 templateDelegate];
  id v8 = (id)[v11 identifier];
  id v7 = (id)[v10 identifier];
  -[CPTemplateDelegate startTripIdentifier:usingRouteIdentifier:](v9, "startTripIdentifier:usingRouteIdentifier:", v8);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)sessionDidConnect:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_nightModeChanged:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v15 = a4;
  v14.receiver = v17;
  v14.super_class = (Class)CPSMapTemplateViewController;
  [(CPSBaseTemplateViewController *)&v14 setControl:location[0] enabled:a4];
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __51__CPSMapTemplateViewController_setControl_enabled___block_invoke;
  id v10 = &unk_2648A4828;
  id v11 = v17;
  id v12 = location[0];
  BOOL v13 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __51__CPSMapTemplateViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)[*(id *)(a1 + 32) _buttonForIdentifier:*(void *)(a1 + 40)];
  [v2[0] setEnabled:*(unsigned char *)(a1 + 48) & 1];
  objc_storeStrong(v2, 0);
}

- (void)setHostGuidanceBackgroundColor:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __63__CPSMapTemplateViewController_setHostGuidanceBackgroundColor___block_invoke;
  int v8 = &unk_2648A3990;
  id v9 = location[0];
  id v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __63__CPSMapTemplateViewController_setHostGuidanceBackgroundColor___block_invoke(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = a1[4];
  [a1[5] setGuidanceBackgroundColor:v2[0]];
  objc_storeStrong(v2, 0);
}

- (void)setHostTripEstimateStyle:(unint64_t)a3
{
  id v12 = self;
  SEL v11 = a2;
  id v10 = (void *)a3;
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __57__CPSMapTemplateViewController_setHostTripEstimateStyle___block_invoke;
  int v8 = &unk_2648A4388;
  v9[0] = v12;
  v9[1] = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong(v9, 0);
}

uint64_t __57__CPSMapTemplateViewController_setHostTripEstimateStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTripEstimateStyle:", *(void *)(a1 + 40), a1, a1);
}

- (void)setHostAutoHidesNavigationBar:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id location = CarPlaySupportGeneralLogging();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[NSNumber numberWithBool:v14];
    __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v4);
    _os_log_impl(&dword_22B689000, (os_log_t)location, v12, "setHostAutoHidesNavigationBar %@", v17, 0xCu);
  }
  objc_storeStrong(&location, 0);
  queue = MEMORY[0x263EF83A0];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __62__CPSMapTemplateViewController_setHostAutoHidesNavigationBar___block_invoke;
  id v9 = &unk_2648A4748;
  id v10 = v16;
  BOOL v11 = v14;
  dispatch_async(queue, &v5);

  objc_storeStrong((id *)&v10, 0);
}

uint64_t __62__CPSMapTemplateViewController_setHostAutoHidesNavigationBar___block_invoke(uint64_t a1)
{
  char v1 = [*(id *)(a1 + 32) autoHidesNavigationBar];
  uint64_t result = a1;
  if ((v1 & 1) != (*(unsigned char *)(a1 + 40) & 1))
  {
    [*(id *)(a1 + 32) setAutoHidesNavigationBar:*(unsigned char *)(a1 + 40) & 1];
    return [*(id *)(a1 + 32) _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:1];
  }
  return result;
}

- (void)setHostHidesButtonsWithNavigationBar:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id location = CarPlaySupportGeneralLogging();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[NSNumber numberWithBool:v14];
    __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v4);
    _os_log_impl(&dword_22B689000, (os_log_t)location, v12, "setHostHidesButtonsWithNavigationBar %@", v17, 0xCu);
  }
  objc_storeStrong(&location, 0);
  queue = MEMORY[0x263EF83A0];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __69__CPSMapTemplateViewController_setHostHidesButtonsWithNavigationBar___block_invoke;
  id v9 = &unk_2648A4748;
  id v10 = v16;
  BOOL v11 = v14;
  dispatch_async(queue, &v5);

  objc_storeStrong((id *)&v10, 0);
}

uint64_t __69__CPSMapTemplateViewController_setHostHidesButtonsWithNavigationBar___block_invoke(uint64_t a1)
{
  char v1 = [*(id *)(a1 + 32) hidesButtonsWithNavigationBar];
  uint64_t result = a1;
  if ((v1 & 1) != (*(unsigned char *)(a1 + 40) & 1))
  {
    [*(id *)(a1 + 32) setHidesButtonsWithNavigationBar:*(unsigned char *)(a1 + 40) & 1];
    return [*(id *)(a1 + 32) _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:1];
  }
  return result;
}

- (void)setHostTripPreviews:(id)a3 textConfiguration:(id)a4 previewOnlyRouteChoices:(BOOL)a5 selectedIndex:(unint64_t)a6
{
  int v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  BOOL v20 = a5;
  id v19 = (void *)a6;
  queue = MEMORY[0x263EF83A0];
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  BOOL v13 = __108__CPSMapTemplateViewController_setHostTripPreviews_textConfiguration_previewOnlyRouteChoices_selectedIndex___block_invoke;
  BOOL v14 = &unk_2648A5AE0;
  id v15 = location[0];
  double v16 = v23;
  v17[0] = v21;
  BOOL v18 = v20;
  v17[1] = v19;
  dispatch_async(queue, &v10);

  objc_storeStrong(v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __108__CPSMapTemplateViewController_setHostTripPreviews_textConfiguration_previewOnlyRouteChoices_selectedIndex___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, *(void *)(a1 + 32));
    _os_log_debug_impl(&dword_22B689000, oslog[0], type, "setHostTripPreviews %@", v8, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  id v5 = *(id *)(a1 + 32);
  if ((unint64_t)[*(id *)(a1 + 32) count] > 0xC)
  {
    char v1 = *(void **)(a1 + 32);
    oslog[4] = 0;
    oslog[3] = (os_log_t)12;
    oslog[5] = 0;
    oslog[6] = (os_log_t)12;
    id v2 = (id)objc_msgSend(v1, "subarrayWithRange:", 0, 12);
    id v3 = v5;
    id v5 = v2;
  }
  [*(id *)(a1 + 40) setTripPreviews:v5];
  [*(id *)(a1 + 40) setTripPreviewTextConfiguration:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setPreviewOnlyRouteChoices:*(unsigned char *)(a1 + 64) & 1];
  [*(id *)(a1 + 40) setPreviewSelectedIndex:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) _reloadPreviewsView];
  objc_storeStrong(&v5, 0);
}

- (void)hostUpdateTravelEstimates:(id)a3 forTripIdentifier:(id)a4
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __76__CPSMapTemplateViewController_hostUpdateTravelEstimates_forTripIdentifier___block_invoke;
  uint64_t v10 = &unk_2648A4AD0;
  id v11 = v14;
  int v12 = v16;
  id v13 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __76__CPSMapTemplateViewController_hostUpdateTravelEstimates_forTripIdentifier___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = (id)[*(id *)(a1 + 40) lastTravelEstimatesByTrip];
    [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 32)];

    id v9 = (id)[*(id *)(a1 + 40) previewsView];
    [v9 updateEstimates:*(void *)(a1 + 48) forTripIdentifier:*(void *)(a1 + 32)];

    id v12 = (id)[*(id *)(a1 + 40) navigationETAView];
    id v11 = (id)[v12 trip];
    id v10 = (id)[v11 identifier];
    char v13 = [v10 isEqual:*(void *)(a1 + 32)];

    if (v13)
    {
      id v6 = (id)[*(id *)(a1 + 40) navigationETAView];
      [v6 updateEstimates:*(void *)(a1 + 48) forManeuver:0];
    }
    id v4 = (id)[*(id *)(a1 + 40) navigator];
    id v3 = (id)[v4 trip];
    id v2 = (id)[v3 identifier];
    char v5 = [v2 isEqual:*(void *)(a1 + 32)];

    if (v5)
    {
      id v1 = (id)[*(id *)(a1 + 40) navigator];
      [v1 updateTripTravelEstimates:*(void *)(a1 + 48)];
    }
  }
}

- (void)hostStartNavigationSessionForTrip:(id)a3 reply:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v10 = [(CPSMapTemplateViewController *)v35 navigator];

  if (v10)
  {
    id v9 = [(CPSMapTemplateViewController *)v35 mapTemplateDelegate];
    [(CPMapClientTemplateDelegate *)v9 clientTripAlreadyStartedException];

    int v32 = 1;
  }
  else
  {
    id v8 = (id)[MEMORY[0x263F08D68] currentConnection];
    id v31 = (id)objc_msgSend(v8, "cp_bundleIdentifier");

    if (v31)
    {
      uint64_t v7 = +[CPSAnalytics sharedInstance];
      [(CPSAnalytics *)v7 navigationStartedWithBundleIdentifier:v31];
    }
    if ([(NSArray *)v35->_tripPreviews count])
    {
      id v30 = CarPlaySupportGeneralLogging();
      os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)location[0]);
        _os_log_debug_impl(&dword_22B689000, (os_log_t)v30, v29, "Dismissing trip preview cards for trip: %@.", v36, 0xCu);
      }
      objc_storeStrong(&v30, 0);
      [(CPSMapTemplateViewController *)v35 setHostTripPreviews:MEMORY[0x263EFFA68] textConfiguration:0 previewOnlyRouteChoices:0 selectedIndex:0];
    }
    id v28 = CarPlaySupportGeneralLogging();
    char v27 = 2;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
    {
      char v5 = v28;
      os_log_type_t v6 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_debug_impl(&dword_22B689000, v5, v6, "navigation session provider requested", v26, 2u);
    }
    objc_storeStrong(&v28, 0);
    v20[0] = 0;
    v20[1] = v20;
    int v21 = 838860800;
    int v22 = 48;
    int v23 = __Block_byref_object_copy__4;
    id v24 = __Block_byref_object_dispose__4;
    id v25 = 0;
    queue = MEMORY[0x263EF83A0];
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = __72__CPSMapTemplateViewController_hostStartNavigationSessionForTrip_reply___block_invoke;
    double v16 = &unk_2648A5B08;
    v19[1] = v20;
    id v17 = v35;
    id v18 = location[0];
    v19[0] = v31;
    dispatch_sync(queue, &v12);

    (*((void (**)(void))v33 + 2))();
    objc_storeStrong(v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    _Block_object_dispose(v20, 8);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v31, 0);
    int v32 = 0;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

void __72__CPSMapTemplateViewController_hostStartNavigationSessionForTrip_reply___block_invoke(uint64_t a1)
{
  char v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = (id)[v5 lastTravelEstimatesByTrip];
  id v7 = (id)[*(id *)(a1 + 40) identifier];
  id v6 = (id)objc_msgSend(v8, "objectForKeyedSubscript:");
  id v1 = (id)objc_msgSend(v5, "_tripDidBegin:withEstimates:forIdentifier:", v4);
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;

  id v10 = (id)[*(id *)(a1 + 32) lastTravelEstimatesByTrip];
  [v10 removeAllObjects];
}

- (void)setMapButton:(id)a3 hidden:(BOOL)a4
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v14 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __52__CPSMapTemplateViewController_setMapButton_hidden___block_invoke;
  id v10 = &unk_2648A4828;
  id v11 = v16;
  id v12 = location[0];
  BOOL v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSMapTemplateViewController_setMapButton_hidden___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _buttonForIdentifier:*(void *)(a1 + 40)];
  [v2 setHidden:*(unsigned char *)(a1 + 48) & 1];
}

- (void)hostSetMapButton:(id)a3 imageSet:(id)a4
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __58__CPSMapTemplateViewController_hostSetMapButton_imageSet___block_invoke;
  id v10 = &unk_2648A4AD0;
  id v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __58__CPSMapTemplateViewController_hostSetMapButton_imageSet___block_invoke(uint64_t a1)
{
  v4[2] = (id)a1;
  v4[1] = (id)a1;
  v4[0] = (id)[*(id *)(a1 + 32) _buttonForIdentifier:*(void *)(a1 + 40)];
  id v2 = v4[0];
  id v3 = (id)[*(id *)(a1 + 48) image];
  objc_msgSend(v2, "setImage:forState:");

  objc_storeStrong(v4, 0);
}

- (void)setMapButton:(id)a3 focusedImage:(id)a4
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __58__CPSMapTemplateViewController_setMapButton_focusedImage___block_invoke;
  id v10 = &unk_2648A4AD0;
  id v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __58__CPSMapTemplateViewController_setMapButton_focusedImage___block_invoke(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)[*(id *)(a1 + 32) _buttonForIdentifier:*(void *)(a1 + 40)];
  [v2[0] setImage:*(void *)(a1 + 48) forState:8];
  objc_storeStrong(v2, 0);
}

- (void)hostSetPanInterfaceVisible:(BOOL)a3 animated:(BOOL)a4
{
  double v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  BOOL v13 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __68__CPSMapTemplateViewController_hostSetPanInterfaceVisible_animated___block_invoke;
  id v9 = &unk_2648A5B30;
  id v10 = v16;
  BOOL v11 = v14;
  BOOL v12 = v13;
  dispatch_async(queue, &v5);

  objc_storeStrong((id *)&v10, 0);
}

uint64_t __68__CPSMapTemplateViewController_hostSetPanInterfaceVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPanInterfaceVisible:animated:", *(unsigned char *)(a1 + 40) & 1, *(unsigned char *)(a1 + 41) & 1, a1, a1);
}

- (void)hostSetMapButtons:(id)a3
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __50__CPSMapTemplateViewController_hostSetMapButtons___block_invoke;
  int v8 = &unk_2648A3990;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __50__CPSMapTemplateViewController_hostSetMapButtons___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMapButtonsWithButtons:", *(void *)(a1 + 40), a1, a1);
}

- (void)hostPanInterfaceVisible:(id)a3
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __56__CPSMapTemplateViewController_hostPanInterfaceVisible___block_invoke;
  int v8 = &unk_2648A4270;
  id v10 = location[0];
  id v9 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void __56__CPSMapTemplateViewController_hostPanInterfaceVisible___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) panContainerView];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, ([v2 isHidden] ^ 1) & 1);
}

- (BOOL)_isAutoHideEnabled
{
  id v3 = [(CPSMapTemplateViewController *)self autoHideDisabledReasons];
  BOOL v4 = 0;
  if (![(NSMutableSet *)v3 count]) {
    BOOL v4 = [(CPSMapTemplateViewController *)self autoHidesNavigationBar];
  }

  return v4;
}

- (void)_setAutoHideDisabled:(BOOL)a3 forRequester:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (v16)
  {
    BOOL v4 = [(CPSMapTemplateViewController *)v18 autoHideDisabledReasons];
    BOOL v11 = v4 != 0;

    if (!v11)
    {
      id v10 = (id)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
      -[CPSMapTemplateViewController setAutoHideDisabledReasons:](v18, "setAutoHideDisabledReasons:");
    }
    id v9 = [(CPSMapTemplateViewController *)v18 autoHideDisabledReasons];
    [(NSMutableSet *)v9 addObject:location];

    id v14 = CarPlaySupportGeneralLogging();
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v20, (uint64_t)location);
      _os_log_debug_impl(&dword_22B689000, (os_log_t)v14, v13, "Disabling auto hide for requester: %{public}@", v20, 0xCu);
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    int v7 = [(CPSMapTemplateViewController *)v18 autoHideDisabledReasons];
    char v8 = [(NSMutableSet *)v7 containsObject:location];

    if (v8)
    {
      int v6 = [(CPSMapTemplateViewController *)v18 autoHideDisabledReasons];
      [(NSMutableSet *)v6 removeObject:location];

      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        os_log_t v5 = oslog;
        __os_log_helper_16_2_1_8_66((uint64_t)v19, (uint64_t)location);
        _os_log_debug_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEBUG, "Enabling auto hide for requester: %{public}@", v19, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v18, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1, v5);
  objc_storeStrong(&location, 0);
}

- (void)_resetAutoHideTimerAndShowBarAnimated:(BOOL)a3 allowFocusDeferral:(BOOL)a4
{
  [(CPSMapTemplateViewController *)self _showBarAnimated:a3 allowFocusDeferral:a4];
  os_log_t v5 = [(CPSMapTemplateViewController *)self autoHideTimer];
  [(NSTimer *)v5 invalidate];

  if ([(CPSMapTemplateViewController *)self _isAutoHideEnabled]
    && ![(CPSMapTemplateViewController *)self demoAutoHideTimerDisabled])
  {
    id v4 = (id)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__hideBar_ selector:0 userInfo:0 repeats:5.0];
    -[CPSMapTemplateViewController setAutoHideTimer:](self, "setAutoHideTimer:");
  }
}

- (void)_setButtonsHidden:(BOOL)a3 animated:(BOOL)a4
{
  id v24 = self;
  SEL v23 = a2;
  BOOL v22 = a3;
  BOOL v21 = a4;
  double v4 = 0.0;
  double v20 = 0.0;
  if (!a3) {
    double v4 = 1.0;
  }
  double v20 = v4;
  if (v21)
  {
    int v7 = (void *)MEMORY[0x263F1CB60];
    double v6 = *MEMORY[0x263F1D4D8];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    SEL v17 = __59__CPSMapTemplateViewController__setButtonsHidden_animated___block_invoke;
    id v18 = &unk_2648A4388;
    v19[0] = v24;
    v19[1] = *(id *)&v20;
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    BOOL v11 = __59__CPSMapTemplateViewController__setButtonsHidden_animated___block_invoke_2;
    BOOL v12 = &unk_2648A3B90;
    os_log_type_t v13 = v24;
    [v7 animateWithDuration:&v14 animations:&v8 completion:v6];
    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(v19, 0);
  }
  else
  {
    os_log_t v5 = [(CPSMapTemplateViewController *)v24 trailingBottomStackView];
    [(UIStackView *)v5 setAlpha:v20];
  }
  [(CPSMapTemplateViewController *)v24 _updateSafeArea];
}

void __59__CPSMapTemplateViewController__setButtonsHidden_animated___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) trailingBottomStackView];
  [v2 setAlpha:*(double *)(a1 + 40)];
}

uint64_t __59__CPSMapTemplateViewController__setButtonsHidden_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSafeArea];
}

- (void)_setFocusHoldersEnabled:(BOOL)a3
{
  BOOL v6 = a3;
  id v3 = [(CPSMapTemplateViewController *)self focusHolderLeftFocusGuide];
  [(UIFocusGuide *)v3 setEnabled:v6];

  double v4 = [(CPSMapTemplateViewController *)self focusHolderRightFocusGuide];
  [(UIFocusGuide *)v4 setEnabled:v6];

  os_log_t v5 = [(CPSMapTemplateViewController *)self focusHoldingButton];
  [(_CPSFocusHoldingButton *)v5 setEnabled:v6];
}

- (void)_showBarAnimated:(BOOL)a3 allowFocusDeferral:(BOOL)a4
{
  BOOL v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  BOOL v19 = a4;
  id v9 = (id)[(CPSMapTemplateViewController *)self navigationController];
  char v10 = [v9 isNavigationBarHidden];

  if (v10)
  {
    [(CPSMapTemplateViewController *)v22 _setFocusHoldersEnabled:0];
    int v7 = (void *)MEMORY[0x263F158F8];
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    int v16 = __68__CPSMapTemplateViewController__showBarAnimated_allowFocusDeferral___block_invoke;
    SEL v17 = &unk_2648A3BE0;
    id v18 = v22;
    [v7 setCompletionBlock:&v13];
    [MEMORY[0x263F158F8] begin];
    id v8 = (id)[(CPSMapTemplateViewController *)v22 navigationController];
    [v8 setNavigationBarHidden:0 animated:v20];

    [MEMORY[0x263F158F8] commit];
    [(CPSMapTemplateViewController *)v22 _setButtonsHidden:0 animated:v20];
    if ([(CPSMapTemplateViewController *)v22 shouldRestoreFocusToNavigationBar])
    {
      [(CPSMapTemplateViewController *)v22 setShouldRestoreFocusToNavigationBar:0];
      id v6 = (id)[(CPSMapTemplateViewController *)v22 navigationController];
      id v5 = (id)[v6 navigationBar];
      -[CPSMapTemplateViewController setLastFocusedItem:](v22, "setLastFocusedItem:");

      id v4 = objc_alloc(MEMORY[0x263F1CCB0]);
      id v12 = (id)[v4 initWithEnvironment:v22];
      [v12 setAllowsDeferral:v19];
      id v11 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v22];
      [v11 _requestFocusUpdate:v12];
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong((id *)&v18, 0);
  }
}

void __68__CPSMapTemplateViewController__showBarAnimated_allowFocusDeferral___block_invoke(id *a1)
{
  v8[2] = a1;
  v8[1] = a1;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __68__CPSMapTemplateViewController__showBarAnimated_allowFocusDeferral___block_invoke_2;
  int v7 = &unk_2648A3BE0;
  v8[0] = a1[4];
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

uint64_t __68__CPSMapTemplateViewController__showBarAnimated_allowFocusDeferral___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSafeArea", a1, a1);
}

- (void)_hideBar:(id)a3
{
  SEL v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(CPSMapTemplateViewController *)v21 _isAutoHideEnabled])
  {
    int v4 = [(CPSMapTemplateViewController *)v21 autoHideTimer];
    [(NSTimer *)v4 invalidate];

    [(CPSMapTemplateViewController *)v21 _setFocusHoldersEnabled:1];
    id v19 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v21];
    int v5 = objc_opt_class();
    id v6 = (id)[v19 focusedItem];
    id v18 = CPSSafeCast_22(v5, v6);

    id v8 = (id)[(CPSMapTemplateViewController *)v21 navigationController];
    id v7 = (id)[v8 navigationBar];
    char v3 = objc_msgSend(v18, "isDescendantOfView:");
    [(CPSMapTemplateViewController *)v21 setShouldRestoreFocusToNavigationBar:v3 & 1];

    id v9 = (void *)MEMORY[0x263F158F8];
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    int v14 = __41__CPSMapTemplateViewController__hideBar___block_invoke;
    int v15 = &unk_2648A3990;
    int v16 = v21;
    id v17 = v19;
    [v9 setCompletionBlock:&v11];
    [MEMORY[0x263F158F8] begin];
    id v10 = (id)[(CPSMapTemplateViewController *)v21 navigationController];
    [v10 setNavigationBarHidden:1 animated:1];

    [MEMORY[0x263F158F8] commit];
    if ([(CPSMapTemplateViewController *)v21 hidesButtonsWithNavigationBar]) {
      [(CPSMapTemplateViewController *)v21 _setButtonsHidden:1 animated:1];
    }
    [(CPSMapTemplateViewController *)v21 _updateSafeArea];
    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(location, 0);
}

void __41__CPSMapTemplateViewController__hideBar___block_invoke(id *a1)
{
  id v9[2] = a1;
  v9[1] = a1;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __41__CPSMapTemplateViewController__hideBar___block_invoke_2;
  id v7 = &unk_2648A3990;
  id v8 = a1[4];
  v9[0] = a1[5];
  dispatch_async(queue, &v3);

  objc_storeStrong(v9, 0);
  objc_storeStrong(&v8, 0);
}

uint64_t __41__CPSMapTemplateViewController__hideBar___block_invoke_2(id *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  if ([a1[4] shouldRestoreFocusToNavigationBar])
  {
    id v2 = (id)[a1[4] focusHoldingButton];
    objc_msgSend(a1[4], "setLastFocusedItem:");

    v4[0] = (id)[objc_alloc(MEMORY[0x263F1CCB0]) initWithEnvironment:a1[4]];
    [v4[0] setAllowsDeferral:0];
    [a1[5] _requestFocusUpdate:v4[0]];
    objc_storeStrong(v4, 0);
  }
  return [a1[4] _updateSafeArea];
}

- (void)_handleTapGesture:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(CPSMapTemplateViewController *)v11 autoHidesNavigationBar])
  {
    id v5 = (id)[(CPSMapTemplateViewController *)v11 navigationController];
    char v6 = [v5 isNavigationBarHidden];

    if (v6)
    {
      id v9 = CarPlaySupportGeneralLogging();
      char v8 = 2;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
      {
        log = v9;
        os_log_type_t type = v8;
        __os_log_helper_16_0_0(v7);
        _os_log_debug_impl(&dword_22B689000, log, type, "Showing navigation bar with reason: tap gesture", v7, 2u);
      }
      objc_storeStrong(&v9, 0);
      [(CPSMapTemplateViewController *)v11 _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:1];
    }
    else
    {
      [(CPSMapTemplateViewController *)v11 _hideBar:0];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_handlePanGesture:(id)a3
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = location[0];
  id v19 = (id)[(CPSMapTemplateViewController *)v26 view];
  objc_msgSend(v18, "locationInView:");
  double v23 = v3;
  double v24 = v4;

  uint64_t v20 = [location[0] state];
  switch(v20)
  {
    case 1:
      -[CPSMapTemplateViewController setLastPanGesturePoint:](v26, "setLastPanGesturePoint:", v23, v24);
      id v17 = [(CPSMapTemplateViewController *)v26 mapTemplateDelegate];
      [(CPMapClientTemplateDelegate *)v17 clientPanGestureBegan];

      break;
    case 2:
      [(CPSMapTemplateViewController *)v26 lastPanGesturePoint];
      [(CPSMapTemplateViewController *)v26 lastPanGesturePoint];
      CGPointMake_1();
      double v21 = v5;
      double v22 = v6;
      int v16 = [(CPSMapTemplateViewController *)v26 mapTemplateDelegate];
      id v14 = location[0];
      id v15 = (id)[(CPSMapTemplateViewController *)v26 view];
      objc_msgSend(v14, "velocityInView:");
      -[CPMapClientTemplateDelegate clientPanGestureWithDeltaPoint:velocity:](v16, "clientPanGestureWithDeltaPoint:velocity:", v21, v22, v7, v8);

      -[CPSMapTemplateViewController setLastPanGesturePoint:](v26, "setLastPanGesturePoint:", v23, v24);
      break;
    case 3:
      int v13 = [(CPSMapTemplateViewController *)v26 mapTemplateDelegate];
      id v11 = location[0];
      id v12 = (id)[(CPSMapTemplateViewController *)v26 view];
      objc_msgSend(v11, "velocityInView:");
      -[CPMapClientTemplateDelegate clientPanGestureEndedWithVelocity:](v13, "clientPanGestureEndedWithVelocity:", v9, v10);

      break;
  }
  objc_storeStrong(location, 0);
}

- (void)_handleFocusHolderSelect
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  char v5 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    os_log_type_t type = v5;
    __os_log_helper_16_0_0(v4);
    _os_log_debug_impl(&dword_22B689000, log, type, "Showing navigation bar with reason: focus holding button select press", v4, 2u);
  }
  objc_storeStrong(location, 0);
  [(CPSMapTemplateViewController *)v7 _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  char v15 = 0;
  LOBYTE(v11) = 0;
  if ([(CPSMapTemplateViewController *)v19 autoHidesNavigationBar])
  {
    id v16 = (id)[(CPSMapTemplateViewController *)v19 navigationController];
    char v15 = 1;
    int v11 = [v16 isNavigationBarHidden] ^ 1;
  }
  if (v15) {

  }
  if (v11)
  {
    id v14 = CarPlaySupportGeneralLogging();
    char v13 = 2;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      log = v14;
      os_log_type_t type = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_22B689000, log, type, "Showing navigation bar with reason: gesture recognized touch", v12, 2u);
    }
    objc_storeStrong(&v14, 0);
    [(CPSMapTemplateViewController *)v19 _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:1];
  }
  double v6 = (UITapGestureRecognizer *)location[0];
  double v4 = [(CPSMapTemplateViewController *)v19 navBarHideTapGestureRecognizer];
  BOOL v7 = v6 != v4;

  BOOL v20 = v7;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (void)_setPanInterfaceVisible:(BOOL)a3 animated:(BOOL)a4
{
  int v53 = self;
  SEL v52 = a2;
  BOOL v51 = a3;
  BOOL v50 = a4;
  if (a3)
  {
    [(CPSMapTemplateViewController *)v53 _addPanControllerAsChild];
    int v11 = [(CPSMapTemplateViewController *)v53 navBarHideTapGestureRecognizer];
    [(UITapGestureRecognizer *)v11 setEnabled:0];

    [(CPSMapTemplateViewController *)v53 _setAutoHideDisabled:1 forRequester:@"PanModeRequester"];
    uint64_t v43 = MEMORY[0x263EF8330];
    int v44 = -1073741824;
    int v45 = 0;
    id v46 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke;
    CGRect v47 = &unk_2648A3BE0;
    id v48 = v53;
    id v49 = (id)MEMORY[0x230F4C6B0](&v43);
    if (v50)
    {
      double v8 = [(CPSMapTemplateViewController *)v53 panContainerView];
      [(UIView *)v8 setAlpha:0.0];

      double v9 = [(CPSMapTemplateViewController *)v53 panContainerView];
      [(UIView *)v9 setHidden:0];

      double v10 = (void *)MEMORY[0x263F1CB60];
      uint64_t v37 = MEMORY[0x263EF8330];
      int v38 = -1073741824;
      int v39 = 0;
      BOOL v40 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_2;
      id v41 = &unk_2648A3BE0;
      id v42 = v53;
      uint64_t v31 = MEMORY[0x263EF8330];
      int v32 = -1073741824;
      int v33 = 0;
      id v34 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_3;
      long long v35 = &unk_2648A4F08;
      id v36 = v49;
      [v10 animateWithDuration:&v37 animations:&v31 completion:0.35];
      objc_storeStrong(&v36, 0);
      objc_storeStrong((id *)&v42, 0);
    }
    else
    {
      double v6 = [(CPSMapTemplateViewController *)v53 panContainerView];
      [(UIView *)v6 setAlpha:1.0];

      BOOL v7 = [(CPSMapTemplateViewController *)v53 panContainerView];
      [(UIView *)v7 setHidden:0];

      [(CPSMapTemplateViewController *)v53 _setMaximumVisibleMapButtons:2];
      (*((void (**)(void))v49 + 2))();
    }
    objc_storeStrong(&v49, 0);
    objc_storeStrong((id *)&v48, 0);
  }
  else
  {
    char v5 = [(CPSMapTemplateViewController *)v53 mapTemplateDelegate];
    [(CPMapClientTemplateDelegate *)v5 clientPanViewWillDisappear];

    uint64_t v24 = MEMORY[0x263EF8330];
    int v25 = -1073741824;
    int v26 = 0;
    char v27 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_4;
    id v28 = &unk_2648A3BE0;
    os_log_type_t v29 = v53;
    id v30 = (id)MEMORY[0x230F4C6B0](&v24);
    if (v50)
    {
      double v4 = (void *)MEMORY[0x263F1CB60];
      uint64_t v18 = MEMORY[0x263EF8330];
      int v19 = -1073741824;
      int v20 = 0;
      double v21 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_5;
      double v22 = &unk_2648A3BE0;
      double v23 = v53;
      uint64_t v12 = MEMORY[0x263EF8330];
      int v13 = -1073741824;
      int v14 = 0;
      char v15 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_6;
      id v16 = &unk_2648A4F08;
      id v17 = v30;
      [v4 animateWithDuration:&v18 animations:&v12 completion:0.35];
      objc_storeStrong(&v17, 0);
      objc_storeStrong((id *)&v23, 0);
    }
    else
    {
      [(CPSMapTemplateViewController *)v53 _setMaximumVisibleMapButtons:4];
      (*((void (**)(void))v30 + 2))();
    }
    objc_storeStrong(&v30, 0);
    objc_storeStrong((id *)&v29, 0);
  }
  [(CPSMapTemplateViewController *)v53 setNeedsFocusUpdate];
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) mapTemplateDelegate];
  [v2 clientPanViewDidAppear];

  [*(id *)(a1 + 32) _updateInterestingArea];
  [*(id *)(a1 + 32) setLastFocusedItem:0];
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) panContainerView];
  [v2 setAlpha:1.0];

  return [*(id *)(a1 + 32) _setMaximumVisibleMapButtons:2];
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _removePanController];
  [*(id *)(a1 + 32) _setAutoHideDisabled:0 forRequester:@"PanModeRequester"];
  id v2 = (id)[*(id *)(a1 + 32) navBarHideTapGestureRecognizer];
  [v2 setEnabled:1];

  id v3 = (id)[*(id *)(a1 + 32) mapTemplateDelegate];
  [v3 clientPanViewDidDisappear];

  return [*(id *)(a1 + 32) _updateInterestingArea];
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_5(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) panContainerView];
  [v2 setAlpha:0.0];

  return [*(id *)(a1 + 32) _setMaximumVisibleMapButtons:4];
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addPanControllerAsChild
{
  v35[4] = *MEMORY[0x263EF8340];
  id v2 = [(CPSMapTemplateViewController *)self panViewController];
  [(CPSPanViewController *)v2 willMoveToParentViewController:self];

  id v3 = [(CPSMapTemplateViewController *)self panViewController];
  -[CPSMapTemplateViewController addChildViewController:](self, "addChildViewController:");

  double v6 = [(CPSMapTemplateViewController *)self panContainerView];
  char v5 = [(CPSMapTemplateViewController *)self panViewController];
  id v4 = (id)[(CPSPanViewController *)v5 view];
  -[UIView addSubview:](v6, "addSubview:");

  int v32 = [(CPSMapTemplateViewController *)self panContainerView];
  uint64_t v31 = [(CPSMapTemplateViewController *)self panViewController];
  id v30 = (id)[(CPSPanViewController *)v31 view];
  id v29 = (id)[v30 topAnchor];
  id v28 = [(CPSMapTemplateViewController *)self panContainerView];
  char v27 = [(UIView *)v28 topAnchor];
  id v26 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
  v35[0] = v26;
  int v25 = [(CPSMapTemplateViewController *)self panViewController];
  id v24 = (id)[(CPSPanViewController *)v25 view];
  id v23 = (id)[v24 bottomAnchor];
  double v22 = [(CPSMapTemplateViewController *)self panContainerView];
  double v21 = [(UIView *)v22 bottomAnchor];
  id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v35[1] = v20;
  int v19 = [(CPSMapTemplateViewController *)self panViewController];
  id v18 = (id)[(CPSPanViewController *)v19 view];
  id v17 = (id)[v18 leftAnchor];
  id v16 = [(CPSMapTemplateViewController *)self panContainerView];
  char v15 = [(UIView *)v16 leftAnchor];
  id v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  void v35[2] = v14;
  int v13 = [(CPSMapTemplateViewController *)self panViewController];
  id v12 = (id)[(CPSPanViewController *)v13 view];
  id v11 = (id)[v12 rightAnchor];
  double v10 = [(CPSMapTemplateViewController *)self panContainerView];
  double v9 = [(UIView *)v10 rightAnchor];
  id v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  v35[3] = v8;
  id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
  -[UIView addConstraints:](v32, "addConstraints:");

  int v33 = [(CPSMapTemplateViewController *)self panViewController];
  [(CPSPanViewController *)v33 didMoveToParentViewController:self];
}

- (void)_removePanController
{
  id v2 = [(CPSMapTemplateViewController *)self panContainerView];
  [(UIView *)v2 setHidden:1];

  id v3 = [(CPSMapTemplateViewController *)self panViewController];
  [(CPSPanViewController *)v3 willMoveToParentViewController:0];

  char v5 = [(CPSMapTemplateViewController *)self panViewController];
  id v4 = (id)[(CPSPanViewController *)v5 view];
  [v4 removeFromSuperview];

  double v6 = [(CPSMapTemplateViewController *)self panViewController];
  [(CPSPanViewController *)v6 removeFromParentViewController];
}

- (void)panWithDirection:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[NSNumber numberWithInteger:v6];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)v8, (uint64_t)v4);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Pan button pressed with direction: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = [(CPSMapTemplateViewController *)v8 mapTemplateDelegate];
  [(CPMapClientTemplateDelegate *)v3 clientPanWithDirection:v6];
}

- (void)panBeganWithDirection:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[NSNumber numberWithInteger:v6];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)v8, (uint64_t)v4);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Pan began with direction: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = [(CPSMapTemplateViewController *)v8 mapTemplateDelegate];
  [(CPMapClientTemplateDelegate *)v3 clientPanBeganWithDirection:v6];
}

- (void)panEndedWithDirection:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[NSNumber numberWithInteger:v6];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)v8, (uint64_t)v4);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Pan ended with direction: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = [(CPSMapTemplateViewController *)v8 mapTemplateDelegate];
  [(CPMapClientTemplateDelegate *)v3 clientPanEndedWithDirection:v6];
}

- (CPMapClientTemplateDelegate)mapTemplateDelegate
{
  return [(CPSBaseTemplateViewController *)self templateDelegate];
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  id v10 = CarPlaySupportGeneralLogging();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    os_log_type_t type = v9;
    int64_t v6 = NSStringFromNavigationOwner_1(v11);
    id v8 = v6;
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v13, (uint64_t)v8);
    _os_log_impl(&dword_22B689000, log, type, "%@: Navigation ownership changed to %@", v15, 0x16u);

    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(&v10, 0);
  if (v11 == 2)
  {
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)v13);
      _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "%@: car owns navigation, requesting client cancel trip", v14, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v3 = [(CPSMapTemplateViewController *)v13 mapTemplateDelegate];
    [(CPMapClientTemplateDelegate *)v3 clientTripCanceledByExternalNavigation];
  }
}

- (void)_updateInterestingArea
{
  [(CPSMapTemplateViewController *)self _navBarInsets];
  double v22 = v2;
  [(CPSMapTemplateViewController *)self _mapButtonsEdgeInsets];
  double v21 = v3;
  UIEdgeInsetsMake_7();
  if ([(CPSMapTemplateViewController *)self rightHandDrive])
  {
    id v17 = (id)[(CPSMapTemplateViewController *)self view];
    [v17 frame];
    double v14 = v4;
    uint64_t v16 = [(CPSMapTemplateViewController *)self trailingBottomStackView];
    [(UIStackView *)v16 frame];
    double v15 = v5;
    int v13 = [(CPSMapTemplateViewController *)self trailingBottomStackView];
    [(UIStackView *)v13 bounds];
    double v20 = v14 - (v15 + v6);

    id v18 = (id)[(CPSMapTemplateViewController *)self view];
    [v18 safeAreaInsets];
    double v19 = v7 + 8.0;
  }
  else
  {
    id v11 = (id)[(CPSMapTemplateViewController *)self view];
    [v11 safeAreaInsets];
    double v20 = v8 + 8.0;

    id v12 = (id)[(CPSMapTemplateViewController *)self view];
    [v12 bounds];
    double v19 = v9 - 38.0;
  }
  id v10 = [(CPSMapTemplateViewController *)self safeAreaDelegate];
  -[CPSSafeAreaDelegate updateInterestingInsets:](v10, "updateInterestingInsets:", v22, v19, v21, v20);
}

- (void)_updateSafeArea
{
  id v27 = (id)[(CPSMapTemplateViewController *)self view];
  [v27 setNeedsLayout];

  id v28 = (id)[(CPSMapTemplateViewController *)self view];
  [v28 layoutIfNeeded];

  id v29 = (id)[(CPSMapTemplateViewController *)self view];
  [v29 safeAreaInsets];
  double v32 = v2;
  double v33 = v3;
  double v35 = v4;
  double v36 = v5;

  [(CPSMapTemplateViewController *)self _cardViewEdgeInsets];
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  [(CPSMapTemplateViewController *)self _mapButtonsEdgeInsets];
  [(CPSMapTemplateViewController *)self _previewEdgeInsets];
  [(CPSMapTemplateViewController *)self _navBarInsets];
  [(CPSMapTemplateViewController *)self _navigationAlertInsets];
  double v34 = v33 + CPSMaxCGFloat(5uLL, v8, v9, v10, v11, v12, v13, v14, v30);
  double v37 = v36 + CPSMaxCGFloat(5uLL, v15, v16, v17, v18, v19, v20, v21, v31);
  if ([(CPSMapTemplateViewController *)self rightHandDrive]) {
    double v26 = 0.0;
  }
  else {
    double v26 = v34;
  }
  int v25 = [(CPSMapTemplateViewController *)self panContainerLeftConstraint];
  [(NSLayoutConstraint *)v25 setConstant:v26];

  if ([(CPSMapTemplateViewController *)self rightHandDrive]) {
    double v24 = v37;
  }
  else {
    double v24 = 0.0;
  }
  double v22 = [(CPSMapTemplateViewController *)self panContainerRightConstraint];
  [(NSLayoutConstraint *)v22 setConstant:-v24];

  id v23 = [(CPSMapTemplateViewController *)self safeAreaDelegate];
  -[CPSSafeAreaDelegate viewController:didUpdateSafeAreaInsets:](v23, "viewController:didUpdateSafeAreaInsets:", self, v32, v34, v35, v37);

  [(CPSMapTemplateViewController *)self _updateInterestingArea];
}

- (UIEdgeInsets)_mapButtonsEdgeInsets
{
  int v38 = self;
  SEL v37 = a2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v39 = *MEMORY[0x263F1D1C0];
  long long v40 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  uint64_t v32 = 0;
  double v33 = &v32;
  int v34 = 0x20000000;
  int v35 = 32;
  char v36 = 0;
  id v29 = [(CPSMapTemplateViewController *)self mapButtons];
  -[NSMutableArray enumerateObjectsUsingBlock:](v29, "enumerateObjectsUsingBlock:");

  char v30 = 0;
  id v28 = [(CPSMapTemplateViewController *)v38 trailingBottomStackView];
  char v27 = 0;
  if (([(UIStackView *)v28 isHidden] & 1) == 0)
  {
    uint64_t v31 = [(CPSMapTemplateViewController *)v38 trailingBottomStackView];
    char v30 = 1;
    [(UIStackView *)v31 alpha];
    char v27 = 0;
    if (v2 > 0.0) {
      char v27 = *((unsigned char *)v33 + 24);
    }
  }
  if (v30) {

  }
  if (v27)
  {
    id v26 = (id)[(CPSMapTemplateViewController *)v38 view];
    [v26 bounds];
    double v25 = v3;
    double v24 = [(CPSMapTemplateViewController *)v38 trailingBottomStackView];
    [(UIStackView *)v24 frame];
    *(double *)&long long v39 = v25 - v4;

    if ([(CPSMapTemplateViewController *)v38 rightHandDrive])
    {
      id v23 = [(CPSMapTemplateViewController *)v38 trailingBottomStackView];
      [(UIStackView *)v23 frame];
      double v22 = v5;
      uint64_t v21 = [(CPSMapTemplateViewController *)v38 trailingBottomStackView];
      [(UIStackView *)v21 frame];
      *((double *)&v39 + 1) = v22 + v6;
    }
    else
    {
      id v20 = (id)[(CPSMapTemplateViewController *)v38 view];
      [v20 bounds];
      double v19 = v7;
      uint64_t v18 = [(CPSMapTemplateViewController *)v38 trailingBottomStackView];
      [(UIStackView *)v18 frame];
      *((double *)&v40 + 1) = v19 - v8;
    }
  }
  else
  {
    id v17 = (id)[(CPSMapTemplateViewController *)v38 childViewControllers];
    uint64_t v15 = [(CPSMapTemplateViewController *)v38 panViewController];
    char v16 = objc_msgSend(v17, "containsObject:");

    if (v16)
    {
      uint64_t v14 = [(CPSMapTemplateViewController *)v38 panViewController];
      [(CPSPanViewController *)v14 sideButtonTopInset];
      *(void *)&long long v39 = v9;
    }
  }
  _Block_object_dispose(&v32, 8);
  double v11 = *((double *)&v39 + 1);
  double v10 = *(double *)&v39;
  double v13 = *((double *)&v40 + 1);
  double v12 = *(double *)&v40;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

void __53__CPSMapTemplateViewController__mapButtonsEdgeInsets__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (([location[0] isHidden] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (UIEdgeInsets)_cardViewEdgeInsets
{
  long long v28 = *MEMORY[0x263F1D1C0];
  long long v29 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  double v25 = [(CPSMapTemplateViewController *)self navigationCardViewController];
  BOOL v26 = [(CPSNavigationCardViewController *)v25 navigationCardHidden];

  if (!v26)
  {
    if ([(CPSMapTemplateViewController *)self rightHandDrive])
    {
      id v24 = (id)[(CPSMapTemplateViewController *)self view];
      [v24 bounds];
      double v19 = v2;
      id v23 = [(CPSMapTemplateViewController *)self navigationCardViewController];
      id v22 = (id)[(CPSNavigationCardViewController *)v23 view];
      [v22 frame];
      double v21 = v19 - v3;
      id v20 = (id)[(CPSMapTemplateViewController *)self view];
      [v20 safeAreaInsets];
      *((double *)&v29 + 1) = v21 - v4;
    }
    else
    {
      uint64_t v18 = [(CPSMapTemplateViewController *)self navigationCardViewController];
      id v17 = (id)[(CPSNavigationCardViewController *)v18 view];
      [v17 frame];
      double v12 = v5;
      char v16 = [(CPSMapTemplateViewController *)self navigationCardViewController];
      id v15 = (id)[(CPSNavigationCardViewController *)v16 view];
      [v15 frame];
      double v14 = v12 + v6;
      id v13 = (id)[(CPSMapTemplateViewController *)self view];
      [v13 safeAreaInsets];
      *((double *)&v28 + 1) = v14 - v7;
    }
  }
  double v9 = *((double *)&v28 + 1);
  double v8 = *(double *)&v28;
  double v11 = *((double *)&v29 + 1);
  double v10 = *(double *)&v29;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)_previewEdgeInsets
{
  long long v30 = *MEMORY[0x263F1D1C0];
  long long v31 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  id v23 = [(CPSMapTemplateViewController *)self previewsView];
  char v27 = 0;
  char v25 = 0;
  BOOL v24 = 0;
  if (v23)
  {
    long long v28 = [(CPSMapTemplateViewController *)self previewsView];
    char v27 = 1;
    BOOL v24 = 0;
    if (([(CPSTripPreviewsCardView *)v28 isHidden] & 1) == 0)
    {
      BOOL v26 = [(CPSMapTemplateViewController *)self previewsView];
      char v25 = 1;
      [(CPSTripPreviewsCardView *)v26 frame];
      BOOL v24 = v2 > 0.0;
    }
  }
  if (v25) {

  }
  if (v27) {
  if (v24)
  }
  {
    if ([(CPSMapTemplateViewController *)self rightHandDrive])
    {
      id v22 = (id)[(CPSMapTemplateViewController *)self view];
      [v22 bounds];
      double v18 = v3;
      double v21 = [(CPSMapTemplateViewController *)self previewsView];
      [(CPSTripPreviewsCardView *)v21 frame];
      double v20 = v18 - v4;
      id v19 = (id)[(CPSMapTemplateViewController *)self view];
      [v19 safeAreaInsets];
      *((double *)&v31 + 1) = v20 - v5;
    }
    else
    {
      id v17 = [(CPSMapTemplateViewController *)self previewsView];
      [(CPSTripPreviewsCardView *)v17 frame];
      double v13 = v6;
      char v16 = [(CPSMapTemplateViewController *)self previewsView];
      [(CPSTripPreviewsCardView *)v16 frame];
      double v15 = v13 + v7;
      id v14 = (id)[(CPSMapTemplateViewController *)self view];
      [v14 safeAreaInsets];
      *((double *)&v30 + 1) = v15 - v8;
    }
  }
  double v10 = *((double *)&v30 + 1);
  double v9 = *(double *)&v30;
  double v12 = *((double *)&v31 + 1);
  double v11 = *(double *)&v31;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)_navBarInsets
{
  long long v17 = *MEMORY[0x263F1D1C0];
  long long v18 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  id v14 = (id)[(CPSMapTemplateViewController *)self navigationController];
  id v13 = (id)[v14 navigationBar];
  char v15 = [v13 isHidden];

  if ((v15 & 1) == 0)
  {
    id v12 = (id)[(CPSMapTemplateViewController *)self navigationController];
    id v11 = (id)[v12 navigationBar];
    [v11 frame];
    double v9 = v2;
    id v10 = (id)[(CPSMapTemplateViewController *)self navigationController];
    id v8 = (id)[v10 navigationBar];
    [v8 frame];
    *(double *)&long long v17 = v9 + v3;
  }
  double v5 = *((double *)&v17 + 1);
  double v4 = *(double *)&v17;
  double v7 = *((double *)&v18 + 1);
  double v6 = *(double *)&v18;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)_navigationAlertInsets
{
  double v21 = self;
  location[1] = (id)a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v22 = *MEMORY[0x263F1D1C0];
  long long v23 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  id v19 = [(CPSMapTemplateViewController *)self navigationAlertQueue];
  location[0] = [(CPSNavigationAlertQueue *)v19 currentAlertView];

  if (location[0])
  {
    if ([(CPSMapTemplateViewController *)v21 rightHandDrive])
    {
      id v18 = (id)[(CPSMapTemplateViewController *)v21 view];
      [v18 bounds];
      double v15 = v2;
      [location[0] frame];
      double v17 = v15 - v3;
      id v16 = (id)[(CPSMapTemplateViewController *)v21 view];
      [v16 safeAreaInsets];
      *((double *)&v23 + 1) = v17 - v4;
    }
    else
    {
      [location[0] frame];
      double v12 = v5;
      [location[0] frame];
      double v14 = v12 + v6;
      id v13 = (id)[(CPSMapTemplateViewController *)v21 view];
      [v13 safeAreaInsets];
      *((double *)&v22 + 1) = v14 - v7;
    }
  }
  objc_storeStrong(location, 0);
  double v9 = *((double *)&v22 + 1);
  double v8 = *(double *)&v22;
  double v11 = *((double *)&v23 + 1);
  double v10 = *(double *)&v23;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  double v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] previouslyFocusedView];
  id v6 = (id)[(CPSMapTemplateViewController *)v17 navigationController];
  id v8 = (id)[v6 navigationBar];
  char v14 = 0;
  char v12 = 0;
  BOOL v9 = 0;
  if (objc_msgSend(v7, "isDescendantOfView:"))
  {
    BOOL v9 = 0;
    if ([location[0] focusHeading] == 16)
    {
      id v15 = [(CPSMapTemplateViewController *)v17 _linearFocusItems];
      char v14 = 1;
      id v13 = (id)[location[0] nextFocusedView];
      char v12 = 1;
      BOOL v9 = objc_msgSend(v15, "indexOfObject:") != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (v12) {

  }
  if (v14) {
  if (v9)
  }
  {
    id v5 = [(CPSMapTemplateViewController *)v17 _linearFocusItems];
    id v4 = (id)[location[0] nextFocusedView];
    char v18 = objc_msgSend(v5, "indexOfObject:") == 0;
  }
  else
  {
    v10.receiver = v17;
    v10.super_class = (Class)CPSMapTemplateViewController;
    char v18 = [(CPSMapTemplateViewController *)&v10 shouldUpdateFocusInContext:location[0]];
  }
  int v11 = 1;
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  long long v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v14 = (id)[location[0] nextFocusedView];
  char v24 = 0;
  char v22 = 0;
  char v15 = 0;
  if (v14)
  {
    id v25 = (id)[location[0] nextFocusedView];
    char v24 = 1;
    id v23 = (id)[(CPSMapTemplateViewController *)v28 view];
    char v22 = 1;
    char v15 = objc_msgSend(v25, "isDescendantOfView:");
  }
  if (v22) {

  }
  if (v24) {
  if (v15)
  }
  {
    id v6 = (id)[location[0] nextFocusedItem];
    -[CPSMapTemplateViewController setLastFocusedItem:](v28, "setLastFocusedItem:");

    BOOL v9 = [(CPSMapTemplateViewController *)v28 focusHolderLeftFocusGuide];
    id v8 = [(CPSMapTemplateViewController *)v28 lastFocusedItem];
    v30[0] = v8;
    id v7 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v30);
    -[UIFocusGuide setPreferredFocusEnvironments:](v9, "setPreferredFocusEnvironments:");

    char v12 = [(CPSMapTemplateViewController *)v28 focusHolderRightFocusGuide];
    int v11 = [(CPSMapTemplateViewController *)v28 lastFocusedItem];
    long long v29 = v11;
    id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    -[UIFocusGuide setPreferredFocusEnvironments:](v12, "setPreferredFocusEnvironments:");
  }
  else
  {
    id v4 = (id)[location[0] nextFocusedItem];
    char v20 = 0;
    char v18 = 0;
    char v16 = 0;
    char v5 = 0;
    if (v4)
    {
      id v21 = (id)[location[0] nextFocusedView];
      char v20 = 1;
      id v19 = (id)[(CPSMapTemplateViewController *)v28 parentViewController];
      char v18 = 1;
      id v17 = (id)[v19 view];
      char v16 = 1;
      char v5 = objc_msgSend(v21, "isDescendantOfView:");
    }
    if (v16) {

    }
    if (v18) {
    if (v20)
    }

    if (v5) {
      [(CPSMapTemplateViewController *)v28 setLastFocusedItem:0];
    }
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  char v22 = self;
  v21[1] = (id)a2;
  v21[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  char v18 = [(CPSMapTemplateViewController *)v22 lastFocusedItem];

  if (v18)
  {
    id v17 = [(CPSMapTemplateViewController *)v22 lastFocusedItem];
    objc_msgSend(v21[0], "addObject:");
  }
  char v16 = [(CPSMapTemplateViewController *)v22 previewsView];

  if (v16)
  {
    char v15 = [(CPSMapTemplateViewController *)v22 previewsView];
    objc_msgSend(v21[0], "addObject:");
  }
  id v13 = [(CPSMapTemplateViewController *)v22 panViewController];
  char v19 = 0;
  LOBYTE(v14) = 0;
  if (v13)
  {
    char v20 = [(CPSMapTemplateViewController *)v22 panContainerView];
    char v19 = 1;
    int v14 = ![(UIView *)v20 isHidden];
  }
  if (v19) {

  }
  if (v14)
  {
    char v12 = [(CPSMapTemplateViewController *)v22 panViewController];
    objc_msgSend(v21[0], "addObject:");
  }
  id v10 = [(CPSMapTemplateViewController *)v22 navigationAlertQueue];
  int v11 = [(CPSNavigationAlertQueue *)v10 currentAlertView];

  if (v11)
  {
    BOOL v9 = [(CPSMapTemplateViewController *)v22 navigationAlertQueue];
    id v8 = [(CPSNavigationAlertQueue *)v9 currentAlertView];
    objc_msgSend(v21[0], "addObject:");
  }
  id v6 = (id)[(CPSMapTemplateViewController *)v22 navigationController];
  id v7 = (id)[v6 navigationBar];

  if (v7)
  {
    id v5 = (id)[(CPSMapTemplateViewController *)v22 navigationController];
    id v4 = (id)[v5 navigationBar];
    objc_msgSend(v21[0], "addObject:");
  }
  id v3 = (id)[v21[0] copy];
  objc_storeStrong(v21, 0);

  return v3;
}

- (id)_linearFocusItems
{
  char v63 = self;
  v62[1] = (id)a2;
  v62[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  id location = objc_alloc_init(MEMORY[0x263EFF980]);
  int v53 = [(CPSMapTemplateViewController *)v63 mapButtons];
  BOOL v54 = [(NSMutableArray *)v53 count] == 0;

  if (!v54)
  {
    SEL v52 = [(CPSMapTemplateViewController *)v63 mapButtons];
    uint64_t v55 = MEMORY[0x263EF8330];
    int v56 = -1073741824;
    int v57 = 0;
    id v58 = __49__CPSMapTemplateViewController__linearFocusItems__block_invoke;
    id v59 = &unk_2648A5B80;
    id v60 = location;
    [(NSMutableArray *)v52 enumerateObjectsUsingBlock:&v55];

    objc_storeStrong(&v60, 0);
  }
  BOOL v50 = [(CPSMapTemplateViewController *)v63 panContainerView];
  BOOL v51 = [(UIView *)v50 isHidden];

  if (v51)
  {
    if ([(CPSMapTemplateViewController *)v63 rightHandDrive])
    {
      [v62[0] addObjectsFromArray:location];
      id v49 = [(CPSMapTemplateViewController *)v63 previewsView];

      if (v49)
      {
        id v46 = v62[0];
        id v48 = [(CPSMapTemplateViewController *)v63 previewsView];
        id v47 = [(CPSTripPreviewsCardView *)v48 _linearFocusItems];
        objc_msgSend(v46, "addObjectsFromArray:");
      }
      int v44 = [(CPSMapTemplateViewController *)v63 navigationAlertQueue];
      int v45 = [(CPSNavigationAlertQueue *)v44 currentAlertView];

      if (v45)
      {
        id v40 = v62[0];
        uint64_t v43 = [(CPSMapTemplateViewController *)v63 navigationAlertQueue];
        id v42 = [(CPSNavigationAlertQueue *)v43 currentAlertView];
        id v41 = [(CPSNavigationAlertView *)v42 _linearFocusItems];
        objc_msgSend(v40, "addObjectsFromArray:");
      }
    }
    else
    {
      long long v39 = [(CPSMapTemplateViewController *)v63 previewsView];

      if (v39)
      {
        id v36 = v62[0];
        int v38 = [(CPSMapTemplateViewController *)v63 previewsView];
        id v37 = [(CPSTripPreviewsCardView *)v38 _linearFocusItems];
        objc_msgSend(v36, "addObjectsFromArray:");
      }
      int v34 = [(CPSMapTemplateViewController *)v63 navigationAlertQueue];
      int v35 = [(CPSNavigationAlertQueue *)v34 currentAlertView];

      if (v35)
      {
        id v30 = v62[0];
        double v33 = [(CPSMapTemplateViewController *)v63 navigationAlertQueue];
        uint64_t v32 = [(CPSNavigationAlertQueue *)v33 currentAlertView];
        id v31 = [(CPSNavigationAlertView *)v32 _linearFocusItems];
        objc_msgSend(v30, "addObjectsFromArray:");
      }
      [v62[0] addObjectsFromArray:location];
    }
  }
  else if ([(CPSMapTemplateViewController *)v63 rightHandDrive])
  {
    id v25 = v62[0];
    char v27 = [(CPSMapTemplateViewController *)v63 panViewController];
    id v26 = [(CPSPanViewController *)v27 _linearFocusItemsWithPresentedMapButtons:location];
    objc_msgSend(v25, "addObjectsFromArray:");

    long long v28 = [(CPSMapTemplateViewController *)v63 navigationAlertQueue];
    long long v29 = [(CPSNavigationAlertQueue *)v28 currentAlertView];

    if (v29)
    {
      id v21 = v62[0];
      char v24 = [(CPSMapTemplateViewController *)v63 navigationAlertQueue];
      id v23 = [(CPSNavigationAlertQueue *)v24 currentAlertView];
      id v22 = [(CPSNavigationAlertView *)v23 _linearFocusItems];
      objc_msgSend(v21, "addObjectsFromArray:");
    }
    char v20 = [(CPSMapTemplateViewController *)v63 previewsView];

    if (v20)
    {
      id v17 = v62[0];
      char v19 = [(CPSMapTemplateViewController *)v63 previewsView];
      id v18 = [(CPSTripPreviewsCardView *)v19 _linearFocusItems];
      objc_msgSend(v17, "addObjectsFromArray:");
    }
  }
  else
  {
    char v16 = [(CPSMapTemplateViewController *)v63 previewsView];

    if (v16)
    {
      id v13 = v62[0];
      char v15 = [(CPSMapTemplateViewController *)v63 previewsView];
      id v14 = [(CPSTripPreviewsCardView *)v15 _linearFocusItems];
      objc_msgSend(v13, "addObjectsFromArray:");
    }
    int v11 = [(CPSMapTemplateViewController *)v63 navigationAlertQueue];
    char v12 = [(CPSNavigationAlertQueue *)v11 currentAlertView];

    if (v12)
    {
      id v7 = v62[0];
      id v10 = [(CPSMapTemplateViewController *)v63 navigationAlertQueue];
      BOOL v9 = [(CPSNavigationAlertQueue *)v10 currentAlertView];
      id v8 = [(CPSNavigationAlertView *)v9 _linearFocusItems];
      objc_msgSend(v7, "addObjectsFromArray:");
    }
    id v4 = v62[0];
    id v6 = [(CPSMapTemplateViewController *)v63 panViewController];
    id v5 = [(CPSPanViewController *)v6 _linearFocusItemsWithPresentedMapButtons:location];
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  id v3 = v62[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v62, 0);

  return v3;
}

void __49__CPSMapTemplateViewController__linearFocusItems__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (([location[0] isHidden] & 1) == 0) {
    [a1[4] addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)shouldForwardEventForWindow:(id)a3 eventType:(int64_t)a4
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v24 = a4;
  char v23 = 1;
  if (a4 == 7)
  {
    id v12 = (id)[(CPSMapTemplateViewController *)v26 navigationController];
    char v23 = ([v12 isNavigationBarHidden] ^ 1) & 1;

    id v22 = CarPlaySupportGeneralLogging();
    char v21 = 2;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      log = v22;
      os_log_type_t type = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_debug_impl(&dword_22B689000, log, type, "Showing navigation bar with reason: wheel event", v20, 2u);
    }
    objc_storeStrong(&v22, 0);
    [(CPSMapTemplateViewController *)v26 _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:0];
  }
  else if (!v24)
  {
    id v8 = [(CPSMapTemplateViewController *)v26 navigationAlertQueue];
    id v19 = [(CPSNavigationAlertQueue *)v8 currentAlertView];

    char v17 = 0;
    LOBYTE(v9) = 1;
    if (v19)
    {
      id v18 = [(CPSMapTemplateViewController *)v26 lastFocusedItem];
      char v17 = 1;
      int v9 = objc_msgSend(v19, "containsView:") ^ 1;
    }
    if (v17) {

    }
    if (v9)
    {
      id v16 = CarPlaySupportGeneralLogging();
      char v15 = 2;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
      {
        id v6 = v16;
        os_log_type_t v7 = v15;
        __os_log_helper_16_0_0(v14);
        _os_log_debug_impl(&dword_22B689000, v6, v7, "Showing navigation bar with reason: touchpad touch", v14, 2u);
      }
      objc_storeStrong(&v16, 0);
      [(CPSMapTemplateViewController *)v26 _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:1];
    }
    objc_storeStrong(&v19, 0);
  }
  char v5 = v23;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4
{
  char v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __72__CPSMapTemplateViewController_applicationStateMonitor_didBecomeActive___block_invoke;
  id v10 = &unk_2648A4748;
  int v11 = v15;
  BOOL v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

uint64_t __72__CPSMapTemplateViewController_applicationStateMonitor_didBecomeActive___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  [*(id *)(a1 + 32) setApplicationIsFrontmost:*(unsigned char *)(a1 + 40) & 1];
  uint64_t result = a1;
  if (*(unsigned char *)(a1 + 40))
  {
    location[0] = CarPlaySupportGeneralLogging();
    char v6 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      os_log_type_t type = v6;
      __os_log_helper_16_0_0(v5);
      _os_log_debug_impl(&dword_22B689000, log, type, "Showing navigation bar with reason: app coming frontmost", v5, 2u);
    }
    objc_storeStrong(location, 0);
    return [*(id *)(a1 + 32) _resetAutoHideTimerAndShowBarAnimated:0 allowFocusDeferral:1];
  }
  return result;
}

- (void)didChangeLayout:(id)a3
{
  int v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v6 = (CPSLayoutHelperView *)location[0];
  id v3 = [(CPSMapTemplateViewController *)v9 navigationCardViewLayoutHelperView];
  BOOL v7 = v6 != v3;

  if (!v7)
  {
    char v5 = [(CPSMapTemplateViewController *)v9 navigationCardViewController];
    [location[0] frame];
    [(CPSNavigationCardViewController *)v5 availableHeightChangedTo:v4];
  }
  [(CPSMapTemplateViewController *)v9 _checkNavigationCardHelperViewForETAFit];
  objc_storeStrong(location, 0);
}

- (void)_checkNavigationCardHelperViewForETAFit
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  char v65 = self;
  SEL v64 = a2;
  id v32 = (id)[(CPSMapTemplateViewController *)self view];
  id v31 = [(CPSMapTemplateViewController *)v65 navigationCardViewController];
  id v30 = [(CPSNavigationCardViewController *)v31 layoutHelperView];
  [(CPSLayoutHelperView *)v30 bounds];
  double v56 = v2;
  double v57 = v3;
  double v58 = v4;
  double v59 = v5;
  long long v29 = [(CPSMapTemplateViewController *)v65 navigationCardViewController];
  long long v28 = [(CPSNavigationCardViewController *)v29 layoutHelperView];
  objc_msgSend(v32, "convertRect:fromView:", v56, v57, v58, v59);
  double v60 = v6;
  double v61 = v7;
  double v62 = v8;
  double v63 = v9;

  *(double *)&uint64_t v55 = UIRectGetMaxY_0(v60, v61, v62, v63);
  id v36 = (id)[(CPSMapTemplateViewController *)v65 view];
  id v35 = (id)[v36 safeAreaLayoutGuide];
  [v35 layoutFrame];
  v53[5] = v10;
  v53[6] = v11;
  v53[7] = v12;
  v53[8] = v13;
  double MaxY_0 = UIRectGetMaxY_0(*(double *)&v10, *(double *)&v11, *(double *)&v12, *(double *)&v13);
  double v33 = [(CPSMapTemplateViewController *)v65 navigationETAView];
  [(CPSNavigationETAView *)v33 frame];
  v53[1] = v14;
  v53[2] = v15;
  v53[3] = v16;
  v53[4] = v17;
  double v37 = MaxY_0 - *(double *)&v17 - 8.0;

  double v54 = v37;
  v53[0] = CarPlaySupportGeneralLogging();
  char v52 = 1;
  if (os_log_type_enabled((os_log_t)v53[0], OS_LOG_TYPE_INFO))
  {
    log = v53[0];
    os_log_type_t type = v52;
    id v27 = (id)[(CPSMapTemplateViewController *)v65 view];
    [v27 bounds];
    CGRect rect = v68;
    id v26 = NSStringFromCGRect(v68);
    BOOL v50 = v26;
    __os_log_helper_16_2_3_8_0_8_0_8_64((uint64_t)v66, v55, *(uint64_t *)&v54, (uint64_t)v50);
    _os_log_impl(&dword_22B689000, log, type, "Navigation card max Y: %f, eta min Y: %f, view size: %@", v66, 0x20u);

    objc_storeStrong((id *)&v50, 0);
  }
  objc_storeStrong(v53, 0);
  if (*(double *)&v55 >= v54)
  {
    os_log_t v46 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v45 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      char v20 = v46;
      os_log_type_t v21 = v45;
      __os_log_helper_16_0_0(v44);
      _os_log_impl(&dword_22B689000, v20, v21, "Hiding ETA view if necessary", v44, 2u);
    }
    objc_storeStrong((id *)&v46, 0);
    [(CPSMapTemplateViewController *)v65 _setETAViewHidden:1 forRequester:@"ManeuversCardRequester" animated:0];
  }
  else
  {
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v48 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      id v22 = oslog;
      os_log_type_t v23 = v48;
      __os_log_helper_16_0_0(v47);
      _os_log_impl(&dword_22B689000, v22, v23, "Showing ETA view if necessary", v47, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(CPSMapTemplateViewController *)v65 _setETAViewHidden:0 forRequester:@"ManeuversCardRequester" animated:0];
  }
  id v19 = (void *)MEMORY[0x263F1CB60];
  double v18 = *MEMORY[0x263F1D4D8];
  uint64_t v38 = MEMORY[0x263EF8330];
  int v39 = -1073741824;
  int v40 = 0;
  id v41 = __71__CPSMapTemplateViewController__checkNavigationCardHelperViewForETAFit__block_invoke;
  id v42 = &unk_2648A3BE0;
  uint64_t v43 = v65;
  [v19 animateWithDuration:0 delay:&v38 options:&__block_literal_global_261 animations:v18 completion:0.0];
  objc_storeStrong((id *)&v43, 0);
}

void __71__CPSMapTemplateViewController__checkNavigationCardHelperViewForETAFit__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] canReceiveEvents])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    double v7 = __64__CPSMapTemplateViewController_observerDeliveryPolicyDidChange___block_invoke;
    double v8 = &unk_2648A3BE0;
    double v9 = v11;
    dispatch_async(queue, &v4);

    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __64__CPSMapTemplateViewController_observerDeliveryPolicyDidChange___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = CarPlaySupportGeneralLogging();
  char v6 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    os_log_type_t type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_debug_impl(&dword_22B689000, log, type, "Showing navigation bar with reason: event delivery policy changed", v5, 2u);
  }
  objc_storeStrong(location, 0);
  return [a1[4] _resetAutoHideTimerAndShowBarAnimated:1 allowFocusDeferral:0];
}

- (void)_setETAViewHidden:(BOOL)a3 forRequester:(id)a4 animated:(BOOL)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v31 = self;
  SEL v30 = a2;
  BOOL v29 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v27 = a5;
  if (v29)
  {
    if (!v31->_etaViewHiddenRequesters)
    {
      int v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      etaViewHiddenRequesters = v31->_etaViewHiddenRequesters;
      v31->_etaViewHiddenRequesters = v5;
    }
    id v26 = CarPlaySupportGeneralLogging();
    os_log_type_t v25 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)location);
      _os_log_impl(&dword_22B689000, (os_log_t)v26, v25, "Adding ETA hidden requester: %@", v33, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    double v9 = [(CPSMapTemplateViewController *)v31 etaViewHiddenRequesters];
    [(NSMutableSet *)v9 addObject:location];
  }
  else
  {
    id v24 = CarPlaySupportGeneralLogging();
    os_log_type_t v23 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)location);
      _os_log_impl(&dword_22B689000, (os_log_t)v24, v23, "Removing ETA hidden requester: %@", v32, 0xCu);
    }
    objc_storeStrong(&v24, 0);
    double v8 = [(CPSMapTemplateViewController *)v31 etaViewHiddenRequesters];
    [(NSMutableSet *)v8 removeObject:location];
  }
  [(CPSMapTemplateViewController *)v31 _updateETAViewHidden];
  if (v27)
  {
    double v7 = (void *)MEMORY[0x263F1CB60];
    uint64_t v17 = MEMORY[0x263EF8330];
    int v18 = -1073741824;
    int v19 = 0;
    char v20 = __72__CPSMapTemplateViewController__setETAViewHidden_forRequester_animated___block_invoke;
    os_log_type_t v21 = &unk_2648A3BE0;
    id v22 = v31;
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = __72__CPSMapTemplateViewController__setETAViewHidden_forRequester_animated___block_invoke_2;
    char v15 = &unk_2648A3B90;
    id v16 = v31;
    objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v17, &v11, 0.4, 0.0, 10.0);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong((id *)&v22, 0);
  }
  objc_storeStrong(&location, 0);
}

void __72__CPSMapTemplateViewController__setETAViewHidden_forRequester_animated___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

uint64_t __72__CPSMapTemplateViewController__setETAViewHidden_forRequester_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSafeArea];
}

- (void)_updateETAViewHidden
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v14 = self;
  location[1] = (id)a2;
  double v7 = [(CPSMapTemplateViewController *)self etaViewHiddenRequesters];
  BOOL v8 = [(NSMutableSet *)v7 count] == 0;

  if (v8)
  {
    if ([(CPSMapTemplateViewController *)v14 etaViewHidden])
    {
      v11[0] = CarPlaySupportGeneralLogging();
      char v10 = 1;
      if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_INFO))
      {
        double v3 = v11[0];
        os_log_type_t v4 = v10;
        __os_log_helper_16_0_0(v9);
        _os_log_impl(&dword_22B689000, v3, v4, "Showing ETA view", v9, 2u);
      }
      objc_storeStrong(v11, 0);
      [(CPSMapTemplateViewController *)v14 setEtaViewHidden:0];
      double v2 = [(CPSMapTemplateViewController *)v14 navigationETAViewBottomConstraint];
      [(NSLayoutConstraint *)v2 setConstant:-8.0];
    }
  }
  else if (![(CPSMapTemplateViewController *)v14 etaViewHidden])
  {
    location[0] = CarPlaySupportGeneralLogging();
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
    {
      char v6 = [(CPSMapTemplateViewController *)v14 etaViewHiddenRequesters];
      __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)v6);
      _os_log_impl(&dword_22B689000, (os_log_t)location[0], v12, "Hiding ETA view for requesters: %@", v15, 0xCu);
    }
    objc_storeStrong(location, 0);
    [(CPSMapTemplateViewController *)v14 setEtaViewHidden:1];
    v11[1] = (id)0x4046000000000000;
    int v5 = [(CPSMapTemplateViewController *)v14 navigationETAViewBottomConstraint];
    [(NSLayoutConstraint *)v5 setConstant:44.0];
  }
}

- (void)_createNavigationCardViewController
{
  v68[4] = *MEMORY[0x263EF8340];
  uint64_t v67 = self;
  v66[1] = (id)a2;
  v66[0] = objc_alloc_init(CPSNavigationCardViewController);
  [v66[0] setGuidanceBackgroundColor:v67->_guidanceBackgroundColor];
  [(CPSMapTemplateViewController *)v67 setNavigationCardViewController:v66[0]];
  id v31 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  [(CPSNavigationCardViewController *)v31 willMoveToParentViewController:v67];

  id v32 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  -[CPSMapTemplateViewController addChildViewController:](v67, "addChildViewController:");

  id v35 = (id)[(CPSMapTemplateViewController *)v67 view];
  uint64_t v34 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  id v33 = (id)[(CPSNavigationCardViewController *)v34 view];
  objc_msgSend(v35, "addSubview:");

  double v37 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  id v36 = (id)[(CPSNavigationCardViewController *)v37 view];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

  char v63 = 0;
  char v61 = 0;
  char v59 = 0;
  char v57 = 0;
  char v55 = 0;
  char v53 = 0;
  if ([(CPSMapTemplateViewController *)v67 rightHandDrive])
  {
    id v64 = (id)[(CPSMapTemplateViewController *)v67 view];
    char v63 = 1;
    id v62 = (id)[v64 safeAreaLayoutGuide];
    char v61 = 1;
    id v60 = (id)[v62 rightAnchor];
    char v59 = 1;
    id v2 = v60;
  }
  else
  {
    id v58 = (id)[(CPSMapTemplateViewController *)v67 view];
    char v57 = 1;
    id v56 = (id)[v58 safeAreaLayoutGuide];
    char v55 = 1;
    id v54 = (id)[v56 leftAnchor];
    char v53 = 1;
    id v2 = v54;
  }
  id v65 = v2;
  if (v53) {

  }
  if (v55) {
  if (v57)
  }

  if (v59) {
  if (v61)
  }

  if (v63) {
  char v50 = 0;
  }
  char v48 = 0;
  char v46 = 0;
  char v44 = 0;
  char v42 = 0;
  char v40 = 0;
  if ([(CPSMapTemplateViewController *)v67 rightHandDrive])
  {
    BOOL v51 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
    char v50 = 1;
    id v49 = (id)[(CPSNavigationCardViewController *)v51 view];
    char v48 = 1;
    id v47 = (id)[v49 rightAnchor];
    char v46 = 1;
    id v3 = v47;
  }
  else
  {
    os_log_type_t v45 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
    char v44 = 1;
    id v43 = (id)[(CPSNavigationCardViewController *)v45 view];
    char v42 = 1;
    id v41 = (id)[v43 leftAnchor];
    char v40 = 1;
    id v3 = v41;
  }
  id v52 = v3;
  if (v40) {

  }
  if (v42) {
  if (v44)
  }

  if (v46) {
  if (v48)
  }

  if (v50) {
  double v39 = 0.0;
  }
  BOOL v4 = [(CPSMapTemplateViewController *)v67 rightHandDrive];
  double v5 = -8.0;
  if (!v4) {
    double v5 = 8.0;
  }
  double v39 = v5;
  double v9 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  id v8 = (id)[(CPSNavigationCardViewController *)v9 view];
  id v7 = (id)[v8 widthAnchor];
  id v38 = (id)[v7 constraintEqualToConstant:0.0];

  LODWORD(v6) = 1148846080;
  [v38 setPriority:v6];
  [(CPSMapTemplateViewController *)v67 setCardWidthConstraint:v38];
  [(CPSMapTemplateViewController *)v67 _calculateAndUpdateCardWidthConstraint];
  char v10 = (void *)MEMORY[0x263F08938];
  id v26 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  id v25 = (id)[(CPSNavigationCardViewController *)v26 view];
  id v24 = (id)[v25 topAnchor];
  id v23 = (id)[(CPSMapTemplateViewController *)v67 view];
  id v22 = (id)[v23 safeAreaLayoutGuide];
  id v21 = (id)[v22 topAnchor];
  id v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:", 8.0);
  v68[0] = v20;
  id v19 = (id)[v52 constraintEqualToAnchor:v65 constant:v39];
  v68[1] = v19;
  v68[2] = v38;
  int v18 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  id v17 = (id)[(CPSNavigationCardViewController *)v18 view];
  id v16 = (id)[v17 bottomAnchor];
  id v15 = (id)[(CPSMapTemplateViewController *)v67 view];
  id v14 = (id)[v15 safeAreaLayoutGuide];
  id v13 = (id)[v14 bottomAnchor];
  id v12 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", -8.0);
  v68[3] = v12;
  id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:4];
  objc_msgSend(v10, "activateConstraints:");

  BOOL v27 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  [(CPSNavigationCardViewController *)v27 didMoveToParentViewController:v67];

  BOOL v29 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  long long v28 = [(CPSNavigationCardViewController *)v29 layoutHelperView];
  [(CPSLayoutHelperView *)v28 setLayoutDelegate:v67];

  SEL v30 = [(CPSMapTemplateViewController *)v67 navigationCardViewController];
  -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v30, "setNavigationCardHidden:forRequester:animated:completion:", 1, @"TripEndedRequester", 0);

  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(v66, 0);
}

- (void)_calculateAndUpdateCardWidthConstraint
{
  id v5 = (id)[(CPSMapTemplateViewController *)self view];
  id v4 = (id)[v5 safeAreaLayoutGuide];
  [v4 layoutFrame];
  double v6 = v2 * 0.4;

  double v7 = v6;
  if (v6 >= 140.0)
  {
    if (v6 > 213.0) {
      double v7 = 213.0;
    }
  }
  else
  {
    double v7 = 140.0;
  }
  id v3 = [(CPSMapTemplateViewController *)self cardWidthConstraint];
  [(NSLayoutConstraint *)v3 setConstant:v7];
}

- (void)_createNavigationCardViewLayoutHelperView
{
  v20[3] = *MEMORY[0x263EF8340];
  id v19 = self;
  v18[1] = (id)a2;
  v18[0] = objc_alloc_init(CPSLayoutHelperView);
  [v18[0] setLayoutDelegate:v19];
  id v2 = (id)[(CPSMapTemplateViewController *)v19 view];
  [v2 addSubview:v18[0]];

  [(CPSMapTemplateViewController *)v19 setNavigationCardViewLayoutHelperView:v18[0]];
  id v7 = (id)[v18[0] bottomAnchor];
  id v6 = (id)[(CPSMapTemplateViewController *)v19 view];
  id v5 = (id)[v6 safeAreaLayoutGuide];
  id v4 = (id)[v5 bottomAnchor];
  id v3 = (id)objc_msgSend(v7, "constraintEqualToAnchor:constant:", -8.0);
  [(CPSMapTemplateViewController *)v19 setNavigationCardViewLayoutViewBottomConstraint:"setNavigationCardViewLayoutViewBottomConstraint:"];

  id v8 = (void *)MEMORY[0x263F08938];
  id v17 = [(CPSMapTemplateViewController *)v19 navigationCardViewLayoutViewBottomConstraint];
  v20[0] = v17;
  id v16 = (id)[v18[0] topAnchor];
  id v15 = (id)[(CPSMapTemplateViewController *)v19 view];
  id v14 = (id)[v15 safeAreaLayoutGuide];
  id v13 = (id)[v14 topAnchor];
  id v12 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", 8.0);
  v20[1] = v12;
  id v11 = (id)[v18[0] widthAnchor];
  id v10 = (id)[v11 constraintEqualToConstant:1.0];
  void v20[2] = v10;
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  objc_msgSend(v8, "activateConstraints:");

  objc_storeStrong(v18, 0);
}

- (CPSNavigatorObserving)navigatorObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigatorObserver);

  return (CPSNavigatorObserving *)WeakRetained;
}

- (void)setNavigatorObserver:(id)a3
{
}

- (UIStackView)trailingBottomStackView
{
  return self->_trailingBottomStackView;
}

- (void)setTrailingBottomStackView:(id)a3
{
}

- (unint64_t)maximumMapButtonCount
{
  return self->_maximumMapButtonCount;
}

- (void)setMaximumMapButtonCount:(unint64_t)a3
{
  self->_maximumMapButtonCount = a3;
}

- (NSMutableArray)mapButtons
{
  return self->_mapButtons;
}

- (void)setMapButtons:(id)a3
{
}

- (CPSLayoutHelperView)navigationCardViewLayoutHelperView
{
  return self->_navigationCardViewLayoutHelperView;
}

- (void)setNavigationCardViewLayoutHelperView:(id)a3
{
}

- (NSLayoutConstraint)navigationCardViewLayoutViewBottomConstraint
{
  return self->_navigationCardViewLayoutViewBottomConstraint;
}

- (void)setNavigationCardViewLayoutViewBottomConstraint:(id)a3
{
}

- (CPSTripPreviewsCardView)previewsView
{
  return self->_previewsView;
}

- (BOOL)previewOnlyRouteChoices
{
  return self->_previewOnlyRouteChoices;
}

- (void)setPreviewOnlyRouteChoices:(BOOL)a3
{
  self->_previewOnlyRouteChoices = a3;
}

- (unint64_t)previewSelectedIndex
{
  return self->_previewSelectedIndex;
}

- (void)setPreviewSelectedIndex:(unint64_t)a3
{
  self->_previewSelectedIndex = a3;
}

- (CPSNavigator)navigator
{
  return self->_navigator;
}

- (void)setNavigator:(id)a3
{
}

- (UITapGestureRecognizer)hideTapGestureRecognizer
{
  return self->_hideTapGestureRecognizer;
}

- (void)setHideTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)navBarHideTapGestureRecognizer
{
  return self->_navBarHideTapGestureRecognizer;
}

- (void)setNavBarHideTapGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (NSTimer)autoHideTimer
{
  return self->_autoHideTimer;
}

- (void)setAutoHideTimer:(id)a3
{
}

- (BOOL)autoHidesNavigationBar
{
  return self->_autoHidesNavigationBar;
}

- (void)setAutoHidesNavigationBar:(BOOL)a3
{
  self->_autoHidesNavigationBar = a3;
}

- (BOOL)hidesButtonsWithNavigationBar
{
  return self->_hidesButtonsWithNavigationBar;
}

- (void)setHidesButtonsWithNavigationBar:(BOOL)a3
{
  self->_hidesButtonsWithNavigationBar = a3;
}

- (NSMutableSet)autoHideDisabledReasons
{
  return self->_autoHideDisabledReasons;
}

- (void)setAutoHideDisabledReasons:(id)a3
{
}

- (NSArray)tripPreviews
{
  return self->_tripPreviews;
}

- (void)setTripPreviews:(id)a3
{
}

- (CPTripPreviewTextConfiguration)tripPreviewTextConfiguration
{
  return self->_tripPreviewTextConfiguration;
}

- (void)setTripPreviewTextConfiguration:(id)a3
{
}

- (CPSPanViewController)panViewController
{
  return self->_panViewController;
}

- (void)setPanViewController:(id)a3
{
}

- (UIView)panContainerView
{
  return self->_panContainerView;
}

- (void)setPanContainerView:(id)a3
{
}

- (NSLayoutConstraint)panContainerLeftConstraint
{
  return self->_panContainerLeftConstraint;
}

- (void)setPanContainerLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)panContainerRightConstraint
{
  return self->_panContainerRightConstraint;
}

- (void)setPanContainerRightConstraint:(id)a3
{
}

- (BOOL)demoAutoHideTimerDisabled
{
  return self->_demoAutoHideTimerDisabled;
}

- (void)setDemoAutoHideTimerDisabled:(BOOL)a3
{
  self->_demoAutoHideTimerDisabled = a3;
}

- (CPSNavigationAlertQueue)navigationAlertQueue
{
  return self->_navigationAlertQueue;
}

- (void)setNavigationAlertQueue:(id)a3
{
}

- (NSLayoutConstraint)navigationAlertBottomConstraint
{
  return self->_navigationAlertBottomConstraint;
}

- (void)setNavigationAlertBottomConstraint:(id)a3
{
}

- (BOOL)applicationIsFrontmost
{
  return self->_applicationIsFrontmost;
}

- (void)setApplicationIsFrontmost:(BOOL)a3
{
  self->_applicationIsFrontmost = a3;
}

- (CPSApplicationStateMonitor)applicationStateMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationStateMonitor);

  return (CPSApplicationStateMonitor *)WeakRetained;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (CPSNavigationETAView)navigationETAView
{
  return self->_navigationETAView;
}

- (void)setNavigationETAView:(id)a3
{
}

- (NSLayoutConstraint)navigationETAViewBottomConstraint
{
  return self->_navigationETAViewBottomConstraint;
}

- (void)setNavigationETAViewBottomConstraint:(id)a3
{
}

- (NSMutableDictionary)lastTravelEstimatesByTrip
{
  return self->_lastTravelEstimatesByTrip;
}

- (void)setLastTravelEstimatesByTrip:(id)a3
{
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (void)setRightHandDrive:(BOOL)a3
{
  self->_rightHandDrive = a3;
}

- (CPSSafeAreaDelegate)safeAreaDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeAreaDelegate);

  return (CPSSafeAreaDelegate *)WeakRetained;
}

- (void)setSafeAreaDelegate:(id)a3
{
}

- (UIFocusItem)lastFocusedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedItem);

  return (UIFocusItem *)WeakRetained;
}

- (void)setLastFocusedItem:(id)a3
{
}

- (UIFocusItem)itemFocusedBeforeNavAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemFocusedBeforeNavAlert);

  return (UIFocusItem *)WeakRetained;
}

- (void)setItemFocusedBeforeNavAlert:(id)a3
{
}

- (CGPoint)lastPanGesturePoint
{
  double y = self->_lastPanGesturePoint.y;
  double x = self->_lastPanGesturePoint.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastPanGesturePoint:(CGPoint)a3
{
  self->_lastPanGesturePoint = a3;
}

- (UIColor)guidanceBackgroundColor
{
  return self->_guidanceBackgroundColor;
}

- (unint64_t)tripEstimateStyle
{
  return self->_tripEstimateStyle;
}

- (BOOL)hasSetTripEstimateStyle
{
  return self->_hasSetTripEstimateStyle;
}

- (void)setHasSetTripEstimateStyle:(BOOL)a3
{
  self->_hasSetTripEstimateStyle = a3;
}

- (_CPSFocusHoldingButton)focusHoldingButton
{
  return self->_focusHoldingButton;
}

- (void)setFocusHoldingButton:(id)a3
{
}

- (UIFocusGuide)focusHolderLeftFocusGuide
{
  return self->_focusHolderLeftFocusGuide;
}

- (void)setFocusHolderLeftFocusGuide:(id)a3
{
}

- (UIFocusGuide)focusHolderRightFocusGuide
{
  return self->_focusHolderRightFocusGuide;
}

- (void)setFocusHolderRightFocusGuide:(id)a3
{
}

- (BOOL)shouldRestoreFocusToNavigationBar
{
  return self->_shouldRestoreFocusToNavigationBar;
}

- (void)setShouldRestoreFocusToNavigationBar:(BOOL)a3
{
  self->_shouldRestoreFocusToNavigationBar = a3;
}

- (BKSHIDEventDeliveryPolicyObserver)eventDeliveryPolicyObserver
{
  return self->_eventDeliveryPolicyObserver;
}

- (void)setEventDeliveryPolicyObserver:(id)a3
{
}

- (CPSNavigationCardViewController)navigationCardViewController
{
  return self->_navigationCardViewController;
}

- (void)setNavigationCardViewController:(id)a3
{
}

- (NSMutableSet)etaViewHiddenRequesters
{
  return self->_etaViewHiddenRequesters;
}

- (void)setEtaViewHiddenRequesters:(id)a3
{
}

- (BOOL)etaViewHidden
{
  return self->_etaViewHidden;
}

- (void)setEtaViewHidden:(BOOL)a3
{
  self->_etaViewHidden = a3;
}

- (NSLayoutConstraint)cardWidthConstraint
{
  return self->_cardWidthConstraint;
}

- (void)setCardWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end