@interface MAListSnippetViewController
- (BOOL)_canShowWhileLocked;
- (Class)headerViewClass;
- (double)desiredHeightForWidth:(double)a3;
- (id)_headerLocationForSearchCenter:(id)a3 location:(CLLocationCoordinate2D)a4 forMapItem:(id)a5;
- (id)_listSnippetView;
- (id)_nearCityString:(id)a3;
- (id)_titleForList:(id)a3;
- (int)analyticsUITarget;
- (void)_updateTitleAndSubtitleWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)listView:(id)a3 didChooseMapItem:(id)a4 accessoryButtonTapped:(BOOL)a5;
- (void)loadView;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MAListSnippetViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  if ([(MAListSnippetViewController *)self isViewLoaded])
  {
    v3 = [(MAListSnippetViewController *)self _listSnippetView];
    [v3 setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)MAListSnippetViewController;
  [(MABaseSnippetViewController *)&v4 dealloc];
}

- (id)_titleForList:(id)a3
{
  v3 = +[NSNumberFormatter _ma_localizedStringFromInteger:](NSNumberFormatter, "_ma_localizedStringFromInteger:", [a3 count]);
  objc_super v4 = +[NSBundle _ma_bundle];
  v5 = [v4 siriUILocalizedStringForKey:@"%@ Results"];

  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (id)_nearCityString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_super v4 = +[NSBundle _ma_bundle];
    v5 = [v4 siriUILocalizedStringForKey:@"Near %@"];

    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_headerLocationForSearchCenter:(id)a3 location:(CLLocationCoordinate2D)a4 forMapItem:(id)a5
{
  id v7 = a5;
  v8 = [a3 city];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v11 = [v7 location];
    id v10 = [v11 city];
  }
  if (a3) {
    goto LABEL_7;
  }
  v12 = [v7 location];
  v13 = [v12 latitude];
  [v13 doubleValue];
  CLLocationDegrees v15 = v14;
  v16 = [v7 location];
  v17 = [v16 longitude];
  [v17 doubleValue];
  CLLocationCoordinate2D v19 = CLLocationCoordinate2DMake(v15, v18);
  CLLocationCoordinate2D v24 = v19;

  CLLocationCoordinate2DGetDistanceFrom();
  if (v20 >= 5000.0)
  {
LABEL_7:
    v22 = -[MAListSnippetViewController _nearCityString:](self, "_nearCityString:", v10, v24, *(void *)&a4.latitude, *(void *)&a4.longitude);
  }
  else
  {
    v21 = +[NSBundle _ma_bundle];
    v22 = [v21 siriUILocalizedStringForKey:@"Nearby"];
  }

  return v22;
}

- (Class)headerViewClass
{
  return 0;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)MAListSnippetViewController;
  [(MAListSnippetViewController *)&v8 loadView];
  id v3 = [(MABaseSnippetViewController *)self mapItemSnippet];
  objc_super v4 = [v3 items];

  v5 = -[MAListSnippetView initWithFrame:mapItems:]([MAListSnippetView alloc], "initWithFrame:mapItems:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = [(MABaseSnippetViewController *)self mapItemSnippet];
  -[MAListSnippetView setDisplayForSAR:](v5, "setDisplayForSAR:", [v6 searchAlongRoute]);

  id v7 = [(MABaseSnippetViewController *)self mapItemSnippet];
  -[MAListSnippetView setShouldDisplayLocationDetail:](v5, "setShouldDisplayLocationDetail:", [v7 chainResultSet]);

  [(MAListSnippetView *)v5 setDelegate:self];
  [(MAListSnippetView *)v5 _ma_updateSemanticContentAttribute];
  [(MAListSnippetView *)v5 _mapkit_setNeedsLayout];
  [(MAListSnippetViewController *)self setView:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MAListSnippetViewController;
  [(MABaseSnippetViewController *)&v4 viewDidAppear:a3];
  [(MABaseSnippetViewController *)self captureUserAction:2015];
}

- (void)_updateTitleAndSubtitleWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MABaseSnippetViewController *)self mapItemSnippet];
  v6 = [v5 items];
  id v7 = [(MAListSnippetViewController *)self _titleForList:v6];
  [(MAListSnippetViewController *)self setTitle:v7];

  objc_super v8 = +[MKLocationManager sharedLocationManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7CCC;
  v12[3] = &unk_2C6A8;
  v12[4] = self;
  id v13 = v5;
  id v14 = v4;
  id v9 = v4;
  id v10 = v5;
  v11 = [v8 singleLocationUpdateWithDesiredAccuracy:v12 handler:kCLLocationAccuracyHundredMeters timeout:1.0];
  [v11 start];
}

- (int)analyticsUITarget
{
  return 803;
}

- (void)listView:(id)a3 didChooseMapItem:(id)a4 accessoryButtonTapped:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 mapItems];
  id v10 = [v9 indexOfObject:v8];

  if (v5)
  {
    v11 = [(MABaseSnippetViewController *)self mapItemSnippet];
    unsigned int v12 = [v11 searchAlongRoute];
  }
  else
  {
    unsigned int v12 = 0;
  }
  id v13 = +[MKMapItem mapItemWithLocalSearchMapItem:v8];
  id v14 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v13 timestamp:v10 resultIndex:0.0];

  if (v12) {
    uint64_t v15 = 3001;
  }
  else {
    uint64_t v15 = 2007;
  }
  v16 = [v8 placeData2];
  [(MABaseSnippetViewController *)self captureUserAction:v15 details:v14 resultIndex:v10 mapItemPlaceData:v16];

  v17 = [(MAListSnippetViewController *)self delegate];
  CLLocationDegrees v18 = [v8 commands];
  [v17 siriViewController:self performAceCommands:v18];

  if (v12)
  {
    [(MABaseSnippetViewController *)self setSelectedMapItemIndex:v10];
    [(MABaseSnippetViewController *)self openURLWithSnippetMapItemsAndSelectedMapItem];
  }
  else
  {
    CLLocationCoordinate2D v19 = [(MABaseSnippetViewController *)self mapItemSnippet];
    [v19 setSelectedItemIndex:v10];
    double v20 = [(MAListSnippetViewController *)self delegate];
    v22 = v19;
    v21 = +[NSArray arrayWithObjects:&v22 count:1];
    [v20 siriSnippetViewController:self pushSirilandSnippets:v21];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  objc_msgSend(a4, "lastObject", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [(MAListSnippetViewController *)self _listSnippetView];
  [v5 setUserLocation:v6];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MAListSnippetViewController;
  id v4 = a3;
  [(MABaseSnippetViewController *)&v7 locationManagerDidChangeAuthorization:v4];
  unsigned int v5 = objc_msgSend(v4, "authorizationStatus", v7.receiver, v7.super_class);

  if (v5 == 2)
  {
    id v6 = [(MAListSnippetViewController *)self _listSnippetView];
    [v6 setUserLocation:0];
  }
}

- (double)desiredHeightForWidth:(double)a3
{
  id v3 = [(MAListSnippetViewController *)self _listSnippetView];
  [v3 desiredHeight];
  double v5 = v4;

  return v5;
}

- (id)_listSnippetView
{
  id v3 = [(MAListSnippetViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [(MAListSnippetViewController *)self view];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

@end