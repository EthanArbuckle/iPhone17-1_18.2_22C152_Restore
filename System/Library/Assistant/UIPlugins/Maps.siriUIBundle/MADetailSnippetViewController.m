@interface MADetailSnippetViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isMemoryIntensive;
- (BOOL)needsLocationManager;
- (BOOL)placeViewController:(id)a3 shouldOpenHomePage:(id)a4;
- (BOOL)useModernPlacecard;
- (MADetailSnippetViewController)initWithMapItemSnippet:(id)a3;
- (_MKPlaceCardConforming)placeViewController;
- (double)desiredHeightForWidth:(double)a3;
- (id)_placeItemFromMapItem:(id)a3 isIntermediate:(BOOL)a4;
- (id)_placeViewControllerWithPlaceItem:(id)a3;
- (int)analyticsUITarget;
- (void)_registerURLDelegate;
- (void)_unregisterURLDelegate;
- (void)_updateTitleAndSubtitleWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)openURL:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)placeViewController:(id)a3 didSelectActivityOfType:(id)a4 completed:(BOOL)a5;
- (void)placeViewController:(id)a3 didSelectParent:(id)a4;
- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithMode:(unint64_t)a4;
- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithTransportTypePreference:(id)a4;
- (void)placeViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4;
- (void)placeViewControllerDidCloseFullscreenPhotos:(id)a3;
- (void)placeViewControllerDidOpenFullscreenPhotos:(id)a3;
- (void)placeViewControllerDidSelectShareLocation:(id)a3;
- (void)placeViewControllerDidUpdateHeight:(id)a3;
- (void)reservationInfo:(id)a3 makeReservationForSelectedTimeAtIndex:(unint64_t)a4;
- (void)setPlaceViewController:(id)a3;
- (void)updatePlaceItem;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MADetailSnippetViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)needsLocationManager
{
  return 1;
}

- (BOOL)useModernPlacecard
{
  return 1;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v9 = objc_msgSend(a4, "lastObject", a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  placeViewController = self->_placeViewController;
  if (isKindOfClass)
  {
    uint64_t v7 = v9;
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();
    uint64_t v7 = v9;
    if ((v8 & 1) == 0) {
      goto LABEL_6;
    }
    placeViewController = self->_placeViewController;
  }
  [(_MKPlaceCardConforming *)placeViewController setLocation:v7];
LABEL_6:

  _objc_release_x1();
}

- (MADetailSnippetViewController)initWithMapItemSnippet:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MADetailSnippetViewController;
  v3 = [(MABaseSnippetViewController *)&v9 initWithMapItemSnippet:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(MABaseSnippetViewController *)v3 selectedLocalSearchMapItem];
    v6 = (void *)v5;
    if (v5)
    {
      uint64_t v10 = v5;
      uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
      [(MADetailSnippetViewController *)v4 setRequestContext:v7];
    }
  }
  return v4;
}

- (id)_placeItemFromMapItem:(id)a3 isIntermediate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = +[_MKMapItemPlaceItem placeItemWithMapItem:options:isIntermediateMapItem:](_MKMapItemPlaceItem, "placeItemWithMapItem:options:isIntermediateMapItem:", v5, [v5 isCurrentLocation], v4);

  return v6;
}

- (_MKPlaceCardConforming)placeViewController
{
  placeViewController = self->_placeViewController;
  if (!placeViewController)
  {
    BOOL v4 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
    id v5 = +[MKMapItem mapItemWithLocalSearchMapItem:v4 reservationDelegate:self];

    v6 = [(MADetailSnippetViewController *)self _placeItemFromMapItem:v5 isIntermediate:1];
    placeItem = self->_placeItem;
    self->_placeItem = v6;

    char v8 = [(MADetailSnippetViewController *)self _placeViewControllerWithPlaceItem:self->_placeItem];
    objc_super v9 = self->_placeViewController;
    self->_placeViewController = v8;

    placeViewController = self->_placeViewController;
  }

  return placeViewController;
}

- (void)_updateTitleAndSubtitleWithCompletionHandler:(id)a3
{
  id v9 = a3;
  BOOL v4 = +[NSBundle _ma_bundle];
  id v5 = [v4 siriUILocalizedStringForKey:@"Details"];

  [(MADetailSnippetViewController *)self setNavigationTitle:v5];
  v6 = [(MADetailSnippetViewController *)self placeViewController];
  uint64_t v7 = [v6 title];
  [(MADetailSnippetViewController *)self setTitle:v7];

  char v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    char v8 = v9;
  }
}

- (int)analyticsUITarget
{
  return 201;
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)MADetailSnippetViewController;
  [(MADetailSnippetViewController *)&v37 viewDidLoad];
  v3 = [(MADetailSnippetViewController *)self placeViewController];
  BOOL v4 = [v3 view];

  id v5 = [(MADetailSnippetViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  [v4 setPreservesSuperviewLayoutMargins:0];
  v6 = [(MADetailSnippetViewController *)self placeViewController];
  [v6 setIgnoresParentMargins:1];

  double v7 = 16.0;
  if (objc_opt_respondsToSelector())
  {
    char v8 = [(MADetailSnippetViewController *)self view];
    +[UIViewController _horizontalContentMarginForView:v8];
    double v7 = v9;
  }
  objc_msgSend(v4, "setLayoutMargins:", 8.0, v7, 8.0, v7);
  uint64_t v10 = [(MADetailSnippetViewController *)self placeViewController];
  [v10 willMoveToParentViewController:self];

  v11 = [(MADetailSnippetViewController *)self placeViewController];
  [(MADetailSnippetViewController *)self addChildViewController:v11];

  v12 = [(MADetailSnippetViewController *)self placeViewController];
  [v12 didMoveToParentViewController:self];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(MADetailSnippetViewController *)self view];
  [v13 addSubview:v4];

  v14 = [(MADetailSnippetViewController *)self view];
  objc_msgSend(v14, "_ma_updateSemanticContentAttribute");

  v15 = [v4 widthAnchor];
  v16 = [(MADetailSnippetViewController *)self view];
  [v16 bounds];
  v17 = [v15 constraintEqualToConstant:CGRectGetWidth(v39)];
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v17;

  v36 = [(MADetailSnippetViewController *)self view];
  v35 = [v36 leftAnchor];
  v34 = [v4 leftAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v38[0] = v33;
  v32 = [(MADetailSnippetViewController *)self view];
  v31 = [v32 rightAnchor];
  v30 = [v4 rightAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v38[1] = v29;
  v28 = [(MADetailSnippetViewController *)self view];
  v19 = [v28 topAnchor];
  v20 = [v4 topAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v38[2] = v21;
  v22 = [(MADetailSnippetViewController *)self view];
  v23 = [v22 bottomAnchor];
  v24 = [v4 bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v26 = self->_widthConstraint;
  v38[3] = v25;
  v38[4] = v26;
  v27 = +[NSArray arrayWithObjects:v38 count:5];
  +[NSLayoutConstraint activateConstraints:v27];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADetailSnippetViewController;
  -[MABaseSnippetViewController viewWillAppear:](&v5, "viewWillAppear:");
  [(_MKPlaceCardConforming *)self->_placeViewController viewWillAppear:v3];
  [(MADetailSnippetViewController *)self _registerURLDelegate];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MADetailSnippetViewController;
  [(MABaseSnippetViewController *)&v4 viewDidAppear:a3];
  [(MADetailSnippetViewController *)self updatePlaceItem];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MADetailSnippetViewController;
  [(MABaseSnippetViewController *)&v6 viewWillDisappear:a3];
  [(MADetailSnippetViewController *)self _unregisterURLDelegate];
  objc_super v4 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
  objc_super v5 = [v4 placeData2];
  [(MABaseSnippetViewController *)self captureUserAction:4 mapItemPlaceData:v5];
}

- (void)_registerURLDelegate
{
  id v3 = +[MKSystemController sharedInstance];
  [v3 setOpenURLDelegate:self];
}

- (void)_unregisterURLDelegate
{
  id v3 = +[MKSystemController sharedInstance];
  objc_super v4 = [v3 openURLDelegate];

  if (v4 == self)
  {
    id v5 = +[MKSystemController sharedInstance];
    [v5 setOpenURLDelegate:0];
  }
}

- (void)updatePlaceItem
{
  id v3 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
  [(MABaseSnippetViewController *)self donateLocationForMapItem:v3];

  if ([(_MKPlaceItem *)self->_placeItem isIntermediateMapItem])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E2E8;
    block[3] = &unk_3D0D0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)dealloc
{
  [(MADetailSnippetViewController *)self useModernPlacecard];
  [(_MKPlaceCardConforming *)self->_placeViewController setPlaceViewControllerDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MADetailSnippetViewController;
  [(MABaseSnippetViewController *)&v3 dealloc];
}

- (void)placeViewControllerDidUpdateHeight:(id)a3
{
  id v4 = [(MADetailSnippetViewController *)self delegate];
  [v4 siriViewControllerHeightDidChange:self pinTopOfSnippet:1];
}

- (void)placeViewControllerDidSelectShareLocation:(id)a3
{
  id v4 = [(MADetailSnippetViewController *)self delegate];
  [v4 siriSnippetViewController:self setStatusViewHidden:1];
}

- (void)placeViewController:(id)a3 didSelectActivityOfType:(id)a4 completed:(BOOL)a5
{
  id v6 = [(MADetailSnippetViewController *)self delegate];
  [v6 siriSnippetViewController:self setStatusViewHidden:0];
}

- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithMode:(unint64_t)a4
{
  id v10 = a3;
  id v6 = [(MABaseSnippetViewController *)self mapItemSnippet];
  unsigned int v7 = [v6 searchAlongRoute];

  if (v7)
  {
    [(MABaseSnippetViewController *)self openURLWithSnippetMapItemsAndSelectedMapItem];
  }
  else
  {
    char v8 = +[MKMapItem mapItemForCurrentLocation];
    double v9 = [v10 mapItem];
    [(MABaseSnippetViewController *)self openURLWithDirectionsFromPlace:v8 toPlace:v9 transportType:a4];
  }
}

- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithTransportTypePreference:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  unsigned int v7 = [(MABaseSnippetViewController *)self mapItemSnippet];
  unsigned int v8 = [v7 searchAlongRoute];

  if (v8)
  {
    [(MABaseSnippetViewController *)self openURLWithSnippetMapItemsAndSelectedMapItem];
  }
  else
  {
    if (v6)
    {
      unint64_t v9 = (int)[v6 intValue] - 1;
      if (v9 > 3) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = qword_19F40[v9];
      }
    }
    else
    {
      uint64_t v10 = 0xFFFFFFFLL;
    }
    v11 = +[MKMapItem mapItemForCurrentLocation];
    v12 = [v13 mapItem];
    [(MABaseSnippetViewController *)self openURLWithDirectionsFromPlace:v11 toPlace:v12 transportType:v10];
  }
}

- (void)placeViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [(MADetailSnippetViewController *)self delegate];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_E784;
    v7[3] = &unk_3D128;
    id v8 = v5;
    [v6 siriSnippetViewController:self requestPasscodeUnlockWithCompletion:v7];
  }
}

- (void)placeViewControllerDidOpenFullscreenPhotos:(id)a3
{
  id v4 = [(MADetailSnippetViewController *)self delegate];
  [v4 siriSnippetViewController:self setStatusViewHidden:1];
}

- (void)placeViewControllerDidCloseFullscreenPhotos:(id)a3
{
  id v4 = [(MADetailSnippetViewController *)self delegate];
  [v4 siriSnippetViewController:self setStatusViewHidden:0];
}

- (BOOL)placeViewController:(id)a3 shouldOpenHomePage:(id)a4
{
  return 1;
}

- (void)reservationInfo:(id)a3 makeReservationForSelectedTimeAtIndex:(unint64_t)a4
{
}

- (void)openURL:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = (void (**)(id, uint64_t))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)SAUIAppPunchOut);
  [v11 setAppAvailableInStorefront:1];
  [v11 setBundleId:v9];

  [v11 setPunchOutUri:v10];
  v12 = [(MADetailSnippetViewController *)self delegate];
  id v14 = v11;
  id v13 = +[NSArray arrayWithObjects:&v14 count:1];
  [v12 siriViewController:self performAceCommands:v13];

  if (v8) {
    v8[2](v8, 1);
  }
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MADetailSnippetViewController *)self delegate];
  [v8 siriViewController:self openURL:v7 completion:v6];
}

- (double)desiredHeightForWidth:(double)a3
{
  if (self->_desiredWidth != a3)
  {
    if ([(MADetailSnippetViewController *)self useModernPlacecard])
    {
      self->_desiredWidth = a3;
      [(NSLayoutConstraint *)self->_widthConstraint setConstant:a3];
    }
    else
    {
      id v5 = [(MADetailSnippetViewController *)self placeViewController];
      [v5 setWidthConstraintConstant:a3];
    }
  }
  unsigned int v6 = [(MADetailSnippetViewController *)self useModernPlacecard];
  id v7 = [(MADetailSnippetViewController *)self placeViewController];
  id v8 = v7;
  if (v6) {
    objc_msgSend(v7, "_ma_heightForProposedWidth:", a3);
  }
  else {
    [v7 currentHeight];
  }
  double v10 = v9;

  double result = 300.0;
  if (v10 >= 300.0) {
    return v10;
  }
  return result;
}

- (BOOL)isMemoryIntensive
{
  return 1;
}

- (id)_placeViewControllerWithPlaceItem:(id)a3
{
  uint64_t v4 = MKPlaceViewControllerOptionsContextDefault | 0x2000A46;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_ECC8;
  v11[3] = &unk_3D178;
  v11[4] = self;
  id v5 = objc_retainBlock(v11);
  if ([(MADetailSnippetViewController *)self useModernPlacecard])
  {
    id v6 = objc_alloc_init((Class)MUPlaceViewControllerConfiguration);
    [v6 setOptions:v4];
    id v7 = [objc_alloc((Class)MUPlaceViewController) initWithConfiguration:v6];
    [v7 setScrollEnabled:0];
    [v7 setMapsAppDelegate:self];
    [v7 setPlaceViewFeedbackDelegate:self];
    [v7 setPlaceViewControllerDelegate:self];
    [v7 setPlaceViewFeedbackAppLaunchHandler:v5];
    +[MUInfoCardStyle setTintColorProvider:&stru_3D1B8];
  }
  else
  {
    id v7 = objc_alloc_init((Class)_MKPlaceViewController);
    [v7 setShowTitleBar:0];
    [v7 setScrollEnabled:0];
    [v7 setPlaceViewControllerDelegate:self];
    [v7 setPlaceViewFeedbackDelegate:self];
    [v7 setPlaceViewFeedbackAppLaunchHandler:v5];
  }
  [v7 setOptions:v4];
  [v7 setPlaceItem:self->_placeItem updateOriginalContact:0];
  id v8 = +[UIColor clearColor];
  double v9 = [v7 view];
  [v9 setBackgroundColor:v8];

  return v7;
}

- (void)placeViewController:(id)a3 didSelectParent:(id)a4
{
  id v5 = +[MKMapItem urlForMapItem:a4 options:0];
  [(MABaseSnippetViewController *)self openURL:v5 completion:0];
}

- (void)setPlaceViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeViewController, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);

  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end