@interface AK2FAMapView
- (AK2FAMapView)initWithCoordinate:(CLLocationCoordinate2D)a3 size:(CGSize)a4;
- (CGSize)size;
- (CLLocationCoordinate2D)coordinate;
- (UIActivityIndicatorView)spinner;
- (UIImageView)mapView;
- (void)_onqueue_setImageForSnapshot:(id)a3;
- (void)_setImageForSnapshot:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setMapView:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSpinner:(id)a3;
- (void)startLoadingImage;
- (void)viewDidLoad;
@end

@implementation AK2FAMapView

- (AK2FAMapView)initWithCoordinate:(CLLocationCoordinate2D)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  v9.receiver = self;
  v9.super_class = (Class)AK2FAMapView;
  result = [(AK2FAMapView *)&v9 init];
  if (result)
  {
    result->_coordinate.CLLocationDegrees latitude = latitude;
    result->_coordinate.CLLocationDegrees longitude = longitude;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)AK2FAMapView;
  [(AK2FAMapView *)&v36 viewDidLoad];
  v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  mapView = self->_mapView;
  self->_mapView = v3;

  [(UIImageView *)self->_mapView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v5;

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_mapView center];
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:");
  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  [(UIImageView *)self->_mapView addSubview:self->_spinner];
  v34 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v32 = [(UIImageView *)self->_mapView centerXAnchor];
  v30 = [v34 constraintEqualToAnchor:v32];
  v38[0] = v30;
  v7 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
  v8 = [(UIImageView *)self->_mapView centerYAnchor];
  objc_super v9 = [v7 constraintEqualToAnchor:v8];
  v38[1] = v9;
  v10 = [(UIActivityIndicatorView *)self->_spinner heightAnchor];
  v11 = [v10 constraintEqualToConstant:32.0];
  v38[2] = v11;
  v12 = [(UIActivityIndicatorView *)self->_spinner widthAnchor];
  v13 = [v12 constraintEqualToConstant:32.0];
  v38[3] = v13;
  v14 = +[NSArray arrayWithObjects:v38 count:4];
  +[NSLayoutConstraint activateConstraints:v14];

  v15 = [(AK2FAMapView *)self view];
  [v15 addSubview:self->_mapView];

  v33 = [(UIImageView *)self->_mapView topAnchor];
  v35 = [(AK2FAMapView *)self view];
  v31 = [v35 topAnchor];
  v29 = [v33 constraintEqualToAnchor:v31];
  v37[0] = v29;
  v27 = [(UIImageView *)self->_mapView leadingAnchor];
  v28 = [(AK2FAMapView *)self view];
  v26 = [v28 leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v37[1] = v25;
  v16 = [(UIImageView *)self->_mapView trailingAnchor];
  v17 = [(AK2FAMapView *)self view];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v37[2] = v19;
  v20 = [(UIImageView *)self->_mapView bottomAnchor];
  v21 = [(AK2FAMapView *)self view];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v37[3] = v23;
  v24 = +[NSArray arrayWithObjects:v37 count:4];
  +[NSLayoutConstraint activateConstraints:v24];

  [(AK2FAMapView *)self startLoadingImage];
}

- (void)startLoadingImage
{
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  id v3 = objc_alloc_init((Class)MKMapSnapshotOptions);
  objc_msgSend(v3, "setSize:", self->_size.width, self->_size.height);
  [v3 setMapType:0];
  objc_msgSend(v3, "setRegion:", self->_coordinate.latitude, self->_coordinate.longitude, 0.4, 0.4);
  v4 = [(AK2FAMapView *)self view];
  v5 = [v4 traitCollection];
  [v3 setTraitCollection:v5];

  id v6 = [objc_alloc((Class)MKMapSnapshotter) initWithOptions:v3];
  objc_initWeak(&location, self);
  v7 = dispatch_get_global_queue(25, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004E14;
  v9[3] = &unk_1000083C0;
  id v10 = v6;
  id v8 = v6;
  objc_copyWeak(&v12, &location);
  v11 = self;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_setImageForSnapshot:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting image for snapshot %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000050D0;
  v7[3] = &unk_1000083E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_onqueue_setImageForSnapshot:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[main queue] Setting image for snapshot %@", (uint8_t *)&v10, 0xCu);
  }

  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  id v6 = [v4 image];
  [(UIImageView *)self->_mapView setImage:v6];

  v7 = objc_opt_new();
  [(UIImageView *)self->_mapView bounds];
  objc_msgSend(v7, "setFrame:");
  [(UIImageView *)self->_mapView bounds];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  id v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPath:", objc_msgSend(v8, "CGPath"));
  objc_super v9 = [(UIImageView *)self->_mapView layer];
  [v9 setMask:v7];
}

- (UIImageView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end