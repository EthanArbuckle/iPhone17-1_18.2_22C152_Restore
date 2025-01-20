@interface MapViewCell
- (MapViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)updateLastLocationSent;
- (void)updateLastLocationSentWithLocation:(id)a3;
- (void)updateMap;
@end

@implementation MapViewCell

- (MapViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v26.receiver = self;
  v26.super_class = (Class)MapViewCell;
  v5 = [(MapViewCell *)&v26 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    id v6 = objc_alloc((Class)MKMapView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = (MKMapView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    mapView = v5->_mapView;
    v5->_mapView = v10;

    [(MKMapView *)v5->_mapView setUserInteractionEnabled:1];
    [(MKMapView *)v5->_mapView setDelegate:v5];
    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    locationNotAvailableLabel = v5->_locationNotAvailableLabel;
    v5->_locationNotAvailableLabel = v12;

    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v5->_locationNotAvailableLabel setFont:v14];

    v15 = +[UIColor grayColor];
    [(UILabel *)v5->_locationNotAvailableLabel setTextColor:v15];

    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"LOCATION_NOT_AVAILABLE" value:&stru_18F90 table:@"SOSSettings"];
    [(UILabel *)v5->_locationNotAvailableLabel setText:v17];

    [(UILabel *)v5->_locationNotAvailableLabel setAlpha:0.0];
    [(UILabel *)v5->_locationNotAvailableLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_locationNotAvailableLabel sizeToFit];
    [(MapViewCell *)v5 addSubview:v5->_locationNotAvailableLabel];
    v18 = [(UILabel *)v5->_locationNotAvailableLabel centerXAnchor];
    v19 = [(MapViewCell *)v5 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(UILabel *)v5->_locationNotAvailableLabel centerYAnchor];
    v22 = [(MapViewCell *)v5 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_481C, @"SOSMostRecentLocationSentChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(MapViewCell *)v5 updateLastLocationSent];
    [(MapViewCell *)v5 setBackgroundView:v5->_mapView];
    [(MapViewCell *)v5 setUserInteractionEnabled:1];
  }
  return v5;
}

- (void)updateLastLocationSent
{
  v3 = +[SOSManager sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_48B4;
  v4[3] = &unk_18950;
  v4[4] = self;
  [v3 mostRecentLocationSentWithCompletion:v4];
}

- (void)updateLastLocationSentWithLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationSent, a3);

  [(MapViewCell *)self updateMap];
}

- (void)updateMap
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_497C;
  block[3] = &unk_188D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNotAvailableLabel, 0);
  objc_storeStrong((id *)&self->_lastLocationSent, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end