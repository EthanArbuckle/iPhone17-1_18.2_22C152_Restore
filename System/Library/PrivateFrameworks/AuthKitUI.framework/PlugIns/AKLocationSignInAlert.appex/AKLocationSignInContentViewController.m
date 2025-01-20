@interface AKLocationSignInContentViewController
+ (void)initialize;
- (AKAppleIDAuthenticationContext)authenticationContext;
- (AKBasicLoginContentViewController)titleHeaderViewController;
- (BOOL)_hasLocationInformation;
- (CLLocationCoordinate2D)_deviceLocation;
- (MKMapSnapshotter)mapSnapshotter;
- (UIActivityIndicatorView)spinnerView;
- (UIImageView)mapView;
- (void)_configureMapView;
- (void)_configureTitleHeaderView;
- (void)_snapshotMapLocation;
- (void)loadView;
- (void)setAuthenticationContext:(id)a3;
- (void)setMapSnapshotter:(id)a3;
- (void)setMapView:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setTitleHeaderViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation AKLocationSignInContentViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sub_100003864();
  }
}

- (CLLocationCoordinate2D)_deviceLocation
{
  v3 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext latitude];
  [v3 doubleValue];
  double v5 = v4;
  v6 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext longitude];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (BOOL)_hasLocationInformation
{
  v3 = [(AKLocationSignInContentViewController *)self authenticationContext];
  double v4 = [v3 latitude];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(AKLocationSignInContentViewController *)self authenticationContext];
    double v7 = [v6 longitude];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (void)_configureTitleHeaderView
{
  v3 = (AKBasicLoginContentViewController *)[objc_alloc((Class)sub_1000039A0()) initWithNibName:0 bundle:0];
  titleHeaderViewController = self->_titleHeaderViewController;
  self->_titleHeaderViewController = v3;

  BOOL v5 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext _message];
  v6 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext username];
  double v7 = +[AKUsernameFormatter formattedUsernameFromUsername:v6];
  double v8 = +[NSString stringWithFormat:@"%@\n%@", v5, v7];
  double v9 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  [v9 setTitleText:v8];

  double v10 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext _interpolatedReason];
  v11 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  [v11 setMessageText:v10];

  [(AKLocationSignInContentViewController *)self addChildViewController:self->_titleHeaderViewController];
  id v19 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(AKLocationSignInContentViewController *)self view];
  [v12 addSubview:v19];

  v13 = [(AKLocationSignInContentViewController *)self view];
  v14 = +[NSLayoutConstraint constraintWithItem:v19 attribute:7 relatedBy:0 toItem:v13 attribute:7 multiplier:1.0 constant:0.0];
  [v14 setActive:1];

  v15 = [(AKLocationSignInContentViewController *)self view];
  v16 = +[NSLayoutConstraint constraintWithItem:v19 attribute:3 relatedBy:0 toItem:v15 attribute:3 multiplier:1.0 constant:0.0];
  [v16 setActive:1];

  if (![(AKLocationSignInContentViewController *)self _hasLocationInformation])
  {
    v17 = [(AKLocationSignInContentViewController *)self view];
    v18 = +[NSLayoutConstraint constraintWithItem:v17 attribute:4 relatedBy:1 toItem:v19 attribute:4 multiplier:1.0 constant:0.0];
    [v18 setActive:1];
  }
}

- (void)_configureMapView
{
  id v22 = [(AKLocationSignInContentViewController *)self view];
  v3 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  mapView = self->_mapView;
  self->_mapView = v3;

  [(UIImageView *)self->_mapView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_mapView setAlpha:0.0];
  [v22 addSubview:self->_mapView];
  BOOL v5 = _NSDictionaryOfVariableBindings(@"_mapView", self->_mapView, 0);
  v6 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[_mapView]|" options:0 metrics:0 views:v5];

  +[NSLayoutConstraint activateConstraints:v6];
  double v7 = self->_mapView;
  double v8 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  double v9 = +[NSLayoutConstraint constraintWithItem:v7 attribute:3 relatedBy:0 toItem:v8 attribute:11 multiplier:1.0 constant:24.0];
  [v9 setActive:1];

  double v10 = +[NSLayoutConstraint constraintWithItem:self->_mapView attribute:4 relatedBy:0 toItem:v22 attribute:4 multiplier:1.0 constant:0.0];
  [v10 setActive:1];

  v11 = +[NSLayoutConstraint constraintWithItem:self->_mapView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:120.0];
  LODWORD(v12) = 1148846080;
  [v11 setPriority:v12];
  [v11 setActive:1];
  v13 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  spinnerView = self->_spinnerView;
  self->_spinnerView = v13;

  v15 = +[UIColor grayColor];
  [(UIActivityIndicatorView *)self->_spinnerView setColor:v15];

  [(UIActivityIndicatorView *)self->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_spinnerView startAnimating];
  [v22 addSubview:self->_spinnerView];
  v16 = _NSDictionaryOfVariableBindings(@"_spinnerView", self->_spinnerView, 0);
  v17 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[_spinnerView]|" options:0 metrics:0 views:v16];

  +[NSLayoutConstraint activateConstraints:v17];
  v18 = self->_spinnerView;
  id v19 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  v20 = +[NSLayoutConstraint constraintWithItem:v18 attribute:3 relatedBy:0 toItem:v19 attribute:11 multiplier:1.0 constant:0.0];
  [v20 setActive:1];

  v21 = +[NSLayoutConstraint constraintWithItem:self->_spinnerView attribute:4 relatedBy:0 toItem:v22 attribute:4 multiplier:1.0 constant:0.0];
  [v21 setActive:1];

  [(AKLocationSignInContentViewController *)self _snapshotMapLocation];
}

- (void)_snapshotMapLocation
{
  id v3 = objc_alloc_init((Class)MKMapSnapshotOptions);
  objc_msgSend(v3, "setSize:", 270.0, 120.0);
  [v3 setMapType:0];
  [(AKLocationSignInContentViewController *)self _deviceLocation];
  objc_msgSend(v3, "setRegion:");
  double v4 = [(AKLocationSignInContentViewController *)self view];
  BOOL v5 = [v4 traitCollection];
  [v3 setTraitCollection:v5];

  v6 = (MKMapSnapshotter *)[objc_alloc((Class)MKMapSnapshotter) initWithOptions:v3];
  mapSnapshotter = self->_mapSnapshotter;
  self->_mapSnapshotter = v6;

  double v8 = self->_mapSnapshotter;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000431C;
  v9[3] = &unk_100008370;
  v9[4] = self;
  [(MKMapSnapshotter *)v8 startWithCompletionHandler:v9];
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)AKLocationSignInContentViewController;
  [(AKLocationSignInContentViewController *)&v10 loadView];
  id v3 = [(AKLocationSignInContentViewController *)self extensionContext];
  double v4 = [v3 inputItems];
  BOOL v5 = [v4 firstObject];

  v6 = objc_msgSend(v5, "ak_context");
  [(AKLocationSignInContentViewController *)self setAuthenticationContext:v6];

  [(AKLocationSignInContentViewController *)self _configureTitleHeaderView];
  if ([(AKLocationSignInContentViewController *)self _hasLocationInformation]) {
    [(AKLocationSignInContentViewController *)self _configureMapView];
  }
  double v7 = [(AKLocationSignInContentViewController *)self view];
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v9 = v8;

  -[AKLocationSignInContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v9);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKLocationSignInContentViewController;
  [(AKLocationSignInContentViewController *)&v5 viewDidDisappear:1];
  [(MKMapSnapshotter *)self->_mapSnapshotter cancel];
  mapSnapshotter = self->_mapSnapshotter;
  self->_mapSnapshotter = 0;
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (UIImageView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (AKBasicLoginContentViewController)titleHeaderViewController
{
  return self->_titleHeaderViewController;
}

- (void)setTitleHeaderViewController:(id)a3
{
}

- (MKMapSnapshotter)mapSnapshotter
{
  return self->_mapSnapshotter;
}

- (void)setMapSnapshotter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnapshotter, 0);
  objc_storeStrong((id *)&self->_titleHeaderViewController, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end