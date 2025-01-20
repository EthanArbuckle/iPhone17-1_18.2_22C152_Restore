@interface MABaseSnippetViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)appearing;
- (BOOL)needsLocationManager;
- (CLLocationManager)locManager;
- (MABaseSnippetViewController)initWithMapItemSnippet:(id)a3;
- (MABaseSnippetViewController)initWithSnippet:(id)a3;
- (SALocalSearchMapItem)selectedLocalSearchMapItem;
- (SALocalSearchMapItemSnippet)mapItemSnippet;
- (double)desiredHeightForWidth:(double)a3;
- (id)generateURLWithSession:(id)a3;
- (int)analyticsUITarget;
- (unint64_t)selectedMapItemIndex;
- (void)_updateTitleAndSubtitleWithCompletionHandler:(id)a3;
- (void)captureUserAction:(int)a3;
- (void)captureUserAction:(int)a3 details:(id)a4;
- (void)captureUserAction:(int)a3 details:(id)a4 resultIndex:(int)a5 mapItemPlaceData:(id)a6;
- (void)captureUserAction:(int)a3 mapItemPlaceData:(id)a4;
- (void)captureUserAction:(int)a3 resultIndex:(int)a4 mapItemPlaceData:(id)a5;
- (void)dealloc;
- (void)donateLocationForMapItem:(id)a3;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)makeReservationAtSelectedRestaurantForSelectedTimeIndex:(unint64_t)a3;
- (void)openURL:(id)a3 completion:(id)a4;
- (void)openURLWithDirectionsFromPlace:(id)a3 toPlace:(id)a4;
- (void)openURLWithDirectionsFromPlace:(id)a3 toPlace:(id)a4 transportType:(unint64_t)a5;
- (void)openURLWithMapItem:(id)a3;
- (void)openURLWithSnippetMapItemsAndSelectedMapItem;
- (void)setDelegate:(id)a3;
- (void)setSelectedMapItemIndex:(unint64_t)a3;
- (void)siriDidScrollVisible:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MABaseSnippetViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MABaseSnippetViewController)initWithSnippet:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MABaseSnippetViewController;
  v5 = [(MABaseSnippetViewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MABaseSnippetViewController *)v5 setSnippet:v4];
    -[MABaseSnippetViewController setDefaultViewInsets:](v6, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(MABaseSnippetViewController *)v6 setLoading:1];
  }

  return v6;
}

- (MABaseSnippetViewController)initWithMapItemSnippet:(id)a3
{
  id v4 = a3;
  v5 = [(MABaseSnippetViewController *)self initWithSnippet:v4];
  if (v5)
  {
    -[MABaseSnippetViewController setSelectedMapItemIndex:](v5, "setSelectedMapItemIndex:", [v4 selectedItemIndex]);
    [v4 setSelectedItemIndex:0x7FFFFFFFFFFFFFFFLL];
  }

  return v5;
}

- (void)dealloc
{
  [(CLLocationManager *)self->_locManager stopUpdatingLocation];
  [(CLLocationManager *)self->_locManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MABaseSnippetViewController;
  [(MABaseSnippetViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MABaseSnippetViewController;
  [(MABaseSnippetViewController *)&v4 viewWillAppear:a3];
  self->_appearing = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MABaseSnippetViewController;
  [(MABaseSnippetViewController *)&v5 viewDidAppear:a3];
  self->_appearing = 0;
  objc_super v4 = [(MABaseSnippetViewController *)self locManager];
  [v4 startUpdatingLocation];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MABaseSnippetViewController;
  [(MABaseSnippetViewController *)&v4 viewWillDisappear:a3];
  [(CLLocationManager *)self->_locManager stopUpdatingLocation];
}

- (BOOL)needsLocationManager
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MABaseSnippetViewController;
  -[MABaseSnippetViewController setDelegate:](&v9, "setDelegate:");
  if (a3)
  {
    if (!self->_hasEverStartedLoading)
    {
      self->_hasEverStartedLoading = 1;
      objc_super v5 = [(MABaseSnippetViewController *)self delegate];
      v6 = [v5 siriViewControllerEffectiveBundleForCoreLocation:self];

      v7 = +[MKLocationManager sharedLocationManager];
      [v7 setEffectiveBundle:v6];

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_11E80;
      v8[3] = &unk_3D0D0;
      v8[4] = self;
      [(MABaseSnippetViewController *)self _updateTitleAndSubtitleWithCompletionHandler:v8];
    }
  }
}

- (CLLocationManager)locManager
{
  if (!self->_locManager)
  {
    objc_super v3 = [(MABaseSnippetViewController *)self mapItemSnippet];
    if ([v3 usesFixedLocation])
    {
      unsigned int v4 = [(MABaseSnippetViewController *)self needsLocationManager];

      if (!v4) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    objc_super v5 = [(MABaseSnippetViewController *)self delegate];
    v6 = [v5 siriViewControllerEffectiveBundleForCoreLocation:self];

    id v7 = objc_alloc((Class)CLLocationManager);
    objc_super v8 = [v6 bundlePath];
    objc_super v9 = (CLLocationManager *)[v7 initWithEffectiveBundlePath:v8 delegate:self onQueue:&_dispatch_main_q];
    locManager = self->_locManager;
    self->_locManager = v9;

    [(CLLocationManager *)self->_locManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [(CLLocationManager *)self->_locManager setDistanceFilter:100.0];
  }
LABEL_7:
  v11 = self->_locManager;

  return v11;
}

- (SALocalSearchMapItemSnippet)mapItemSnippet
{
  objc_super v3 = [(MABaseSnippetViewController *)self snippet];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [(MABaseSnippetViewController *)self snippet];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return (SALocalSearchMapItemSnippet *)v4;
}

- (void)setSelectedMapItemIndex:(unint64_t)a3
{
  objc_super v5 = [(MABaseSnippetViewController *)self mapItemSnippet];
  v6 = [v5 items];
  id v7 = [v6 count];

  if ((unint64_t)v7 > a3) {
    self->_selectedMapItemIndex = a3;
  }
}

- (SALocalSearchMapItem)selectedLocalSearchMapItem
{
  objc_super v3 = [(MABaseSnippetViewController *)self mapItemSnippet];
  unsigned int v4 = [v3 items];
  objc_super v5 = objc_msgSend(v4, "objectAtIndex:", -[MABaseSnippetViewController selectedMapItemIndex](self, "selectedMapItemIndex"));

  return (SALocalSearchMapItem *)v5;
}

- (void)donateLocationForMapItem:(id)a3
{
  id v4 = a3;
  if (([v4 isCurrentLocation] & 1) == 0
    && ([v4 isParkingLocation] & 1) == 0)
  {
    objc_super v5 = [v4 donateActivityCommand];
    if (v5)
    {
      v6 = [(MABaseSnippetViewController *)self delegate];
      objc_super v8 = v5;
      id v7 = +[NSArray arrayWithObjects:&v8 count:1];
      [v6 siriViewController:self performAceCommands:v7];
    }
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  unsigned int v3 = [v4 authorizationStatus];
  if (v3 == 2)
  {
    [v4 stopUpdatingLocation];
  }
  else if (v3 == 3)
  {
    [v4 startUpdatingLocation];
  }
}

- (double)desiredHeightForWidth:(double)a3
{
  return 0.0;
}

- (void)siriDidScrollVisible:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 8;
  }
  [(MABaseSnippetViewController *)self captureUserAction:v3];
}

- (void)makeReservationAtSelectedRestaurantForSelectedTimeIndex:(unint64_t)a3
{
  objc_super v5 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
  v6 = [v5 restaurantInfo];

  id v7 = objc_msgSend(v6, "_ma_makeReservationPunchOutForSelectedOpeningIndex:", a3);
  if (v7)
  {
    objc_super v8 = [(MABaseSnippetViewController *)self delegate];
    v10 = v7;
    objc_super v9 = +[NSArray arrayWithObjects:&v10 count:1];
    [v8 siriViewController:self performAceCommands:v9];
  }
}

- (void)openURL:(id)a3 completion:(id)a4
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(MABaseSnippetViewController *)self delegate];
    [v6 siriViewController:self openURL:v5 completion:0];
  }
}

- (id)generateURLWithSession:(id)a3
{
  if (a3)
  {
    id v4 = (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)openURLWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_12524;
    v7[3] = &unk_3D260;
    id v8 = v4;
    id v6 = [(MABaseSnippetViewController *)self generateURLWithSession:v7];
    [(MABaseSnippetViewController *)self openURL:v6 completion:0];
  }
}

- (void)openURLWithSnippetMapItemsAndSelectedMapItem
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_12668;
  v4[3] = &unk_3D260;
  v4[4] = self;
  uint64_t v3 = [(MABaseSnippetViewController *)self generateURLWithSession:v4];
  if (v3) {
    [(MABaseSnippetViewController *)self openURL:v3 completion:0];
  }
}

- (void)openURLWithDirectionsFromPlace:(id)a3 toPlace:(id)a4 transportType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = MKLaunchOptionsDirectionsModeDriving;
    switch(a5)
    {
      case 2uLL:
        v12 = (id *)&MKLaunchOptionsDirectionsModeWalking;
        break;
      case 8uLL:
        v12 = (id *)&MKLaunchOptionsDirectionsModeCycling;
        break;
      case 4uLL:
        v12 = (id *)&MKLaunchOptionsDirectionsModeTransit;
        break;
      default:
LABEL_10:
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_128C0;
        v16[3] = &unk_3D288;
        id v17 = v8;
        id v18 = v10;
        v19 = v11;
        v14 = v11;
        v15 = [(MABaseSnippetViewController *)self generateURLWithSession:v16];
        [(MABaseSnippetViewController *)self openURL:v15 completion:0];

        goto LABEL_11;
    }
    v13 = (NSString *)*v12;

    v11 = v13;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)openURLWithDirectionsFromPlace:(id)a3 toPlace:(id)a4
{
}

- (void)_updateTitleAndSubtitleWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)appearing
{
  return self->_appearing;
}

- (unint64_t)selectedMapItemIndex
{
  return self->_selectedMapItemIndex;
}

- (void).cxx_destruct
{
}

- (int)analyticsUITarget
{
  return 0;
}

- (void)captureUserAction:(int)a3
{
}

- (void)captureUserAction:(int)a3 details:(id)a4
{
}

- (void)captureUserAction:(int)a3 mapItemPlaceData:(id)a4
{
}

- (void)captureUserAction:(int)a3 resultIndex:(int)a4 mapItemPlaceData:(id)a5
{
}

- (void)captureUserAction:(int)a3 details:(id)a4 resultIndex:(int)a5 mapItemPlaceData:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v16 = a4;
  id v10 = a6;
  if (!v16)
  {
    v11 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];

    if (v11)
    {
      v12 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
      v13 = +[MKMapItem mapItemWithLocalSearchMapItem:v12];
      id v16 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v13 timestamp:[(MABaseSnippetViewController *)self selectedMapItemIndex] resultIndex:0.0];
    }
    else
    {
      id v16 = 0;
    }
  }
  v14 = +[MKMapItem mapItemWithSerializedPlaceData:v10];
  v15 = +[MKMapService sharedService];
  objc_msgSend(v15, "captureUserAction:onTarget:placeActionDetails:mapItem:resultIndex:", v8, -[MABaseSnippetViewController analyticsUITarget](self, "analyticsUITarget"), v16, v14, v7);
}

@end