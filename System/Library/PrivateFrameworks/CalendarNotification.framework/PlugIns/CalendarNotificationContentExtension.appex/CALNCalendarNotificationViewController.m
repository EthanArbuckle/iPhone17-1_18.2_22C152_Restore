@interface CALNCalendarNotificationViewController
- (BOOL)_isEventInvitationNotificationCategoryIdentifier:(id)a3;
- (CGSize)preferredContentSize;
- (id)addLongLookView:(id)a3;
- (id)dayPreviewViewForEvent:(id)a3 withStatusOverride:(int64_t)a4;
- (id)viewForAlertNotificationForEvent:(id)a3;
- (id)viewForEventInvitation:(id)a3;
- (id)viewForLocation:(id)a3;
- (void)didReceiveNotification:(id)a3;
@end

@implementation CALNCalendarNotificationViewController

- (CGSize)preferredContentSize
{
  double v2 = 400.0;
  double v3 = 200.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 request];
    v7 = [v6 identifier];
    int v28 = 138543618;
    v29 = v7;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Did receive notification. identifier = %{public}@, notification = %@", (uint8_t *)&v28, 0x16u);
  }
  v8 = [v4 request];
  v9 = [v8 content];
  v10 = [v9 userInfo];
  v11 = [v10 objectForKeyedSubscript:kCALNEventEntityIDUserInfoKey];
  if (v11)
  {
    v12 = +[NSURL URLWithString:v11];
    entityID = self->_entityID;
    self->_entityID = v12;

    eventStore = self->_eventStore;
    if (!eventStore)
    {
      v15 = (EKEventStore *)objc_alloc_init((Class)EKEventStore);
      v16 = self->_eventStore;
      self->_eventStore = v15;

      eventStore = self->_eventStore;
    }
    v17 = [(EKEventStore *)eventStore _eventWithURI:self->_entityID checkValid:1];
    v18 = [v4 request];
    v19 = [v18 content];
    v20 = [v19 categoryIdentifier];

    if ([v20 hasPrefix:kCALNTriggeredEventNotificationCategoryIdentifierPrefix])
    {
      v21 = [(CALNCalendarNotificationViewController *)self viewForAlertNotificationForEvent:v17];
    }
    else
    {
      if (![(CALNCalendarNotificationViewController *)self _isEventInvitationNotificationCategoryIdentifier:v20])
      {
LABEL_13:
        id v24 = objc_alloc((Class)UIView);
        [(UIView *)self->_longLookView frame];
        id v25 = objc_msgSend(v24, "initWithFrame:");
        [(CALNCalendarNotificationViewController *)self setView:v25];
        v26 = [(CALNCalendarNotificationViewController *)self addLongLookView:self->_longLookView];
        longLookConstraints = self->_longLookConstraints;
        self->_longLookConstraints = v26;

        goto LABEL_14;
      }
      v21 = [(CALNCalendarNotificationViewController *)self viewForEventInvitation:v17];
    }
    longLookView = self->_longLookView;
    self->_longLookView = v21;

    goto LABEL_13;
  }
  v22 = [v4 request];
  v17 = [v22 identifier];

  v20 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_100002918((uint64_t)v17, (uint64_t)v4, v20);
  }
LABEL_14:
}

- (BOOL)_isEventInvitationNotificationCategoryIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kCALNEventInvitationNotificationDefaultCategoryIdentifier]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:kCALNEventInvitationNotificationCouldBeJunkCategoryIdentifier];
  }

  return v4;
}

- (id)addLongLookView:(id)a3
{
  id v4 = a3;
  v5 = [(CALNCalendarNotificationViewController *)self view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:v4];
  v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:5 relatedBy:0 toItem:v5 attribute:5 multiplier:1.0 constant:0.0];
  v12[0] = v6;
  v7 = +[NSLayoutConstraint constraintWithItem:v4 attribute:3 relatedBy:0 toItem:v5 attribute:3 multiplier:1.0 constant:0.0];
  v12[1] = v7;
  v8 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:0 toItem:v5 attribute:7 multiplier:1.0 constant:0.0];
  v12[2] = v8;
  v9 = +[NSLayoutConstraint constraintWithItem:v4 attribute:8 relatedBy:0 toItem:v5 attribute:8 multiplier:1.0 constant:0.0];

  v12[3] = v9;
  v10 = +[NSArray arrayWithObjects:v12 count:4];

  [v5 addConstraints:v10];
  return v10;
}

- (id)dayPreviewViewForEvent:(id)a3 withStatusOverride:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 startDate];
  id v8 = objc_alloc((Class)EKDayPreviewController);
  v9 = [v6 endDate];
  id v10 = [v8 initWithDate:v7 event:v6 overriddenEventStartDate:v7 overriddenEventEndDate:v9 model:0];

  [v10 setHidesAllDayEvents:1];
  [v10 setHostingViewController:self];
  [v10 setRespectsSelectedCalendarsFilter:1];
  [v10 setStyle:1];
  if (a4) {
    [v10 setOverriddenParticipantStatus:a4];
  }
  v11 = [v10 view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = objc_alloc((Class)UIView);
  v13 = [v10 view];
  [v13 bounds];
  id v14 = objc_msgSend(v12, "initWithFrame:");

  [v14 addSubview:v11];
  v15 = +[NSLayoutConstraint constraintWithItem:v11 attribute:5 relatedBy:0 toItem:v14 attribute:5 multiplier:1.0 constant:0.0];
  [v14 addConstraint:v15];

  v16 = +[NSLayoutConstraint constraintWithItem:v11 attribute:3 relatedBy:0 toItem:v14 attribute:3 multiplier:1.0 constant:0.0];
  [v14 addConstraint:v16];

  v17 = +[NSLayoutConstraint constraintWithItem:v11 attribute:7 relatedBy:0 toItem:v14 attribute:7 multiplier:1.0 constant:0.0];
  [v14 addConstraint:v17];

  [(CALNCalendarNotificationViewController *)self preferredContentSize];
  v18 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 8, 0, 0, 0, 1.0);
  [v14 addConstraint:v18];

  return v14;
}

- (id)viewForAlertNotificationForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 structuredLocation];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  v7 = [v4 structuredLocation];
  id v8 = [v7 geoLocation];

  if (v8)
  {
    v9 = [v4 structuredLocation];
    id v10 = [(CALNCalendarNotificationViewController *)self viewForLocation:v9];
  }
  else
  {
LABEL_4:
    id v10 = [(CALNCalendarNotificationViewController *)self dayPreviewViewForEvent:v4 withStatusOverride:0];
  }

  return v10;
}

- (id)viewForLocation:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isImprecise];
  if (v5) {
    double v6 = 50.0;
  }
  else {
    double v6 = 804.67;
  }
  [v4 radius];
  if (v7 > v6)
  {
    [v4 radius];
    double v6 = v8;
  }
  if (v5) {
    double v9 = 3.0;
  }
  else {
    double v9 = 1.0;
  }
  id v10 = [v4 geoLocation];
  [v10 coordinate];
  double v12 = v11;
  double v14 = v13;

  v15 = [v4 geoLocation];
  [v15 coordinate];
  MKCoordinateRegion v53 = MKCoordinateRegionMakeWithDistance(v52, v9 * v6, v9 * v6);
  double latitude = v53.center.latitude;
  double longitude = v53.center.longitude;
  double latitudeDelta = v53.span.latitudeDelta;
  double longitudeDelta = v53.span.longitudeDelta;

  id v20 = objc_alloc_init((Class)MKMapSnapshotOptions);
  [v20 _setUseSnapshotService:1];
  objc_msgSend(v20, "setRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
  id v21 = objc_msgSend(objc_alloc((Class)MKMapSnapshotFeatureAnnotation), "initWithCoordinate:title:representation:", 0, 2, v12, v14);
  id v50 = v21;
  v22 = +[NSArray arrayWithObjects:&v50 count:1];
  [v20 _setCustomFeatureAnnotations:v22];

  if (objc_opt_respondsToSelector())
  {
    id v23 = [objc_alloc((Class)GEOApplicationAuditToken) initWithProxiedApplicationBundleId:@"com.apple.mobilecal"];
    [v20 _setAuditToken:v23];
  }
  id v24 = [(CALNCalendarNotificationViewController *)self view];
  [v24 bounds];
  double Width = CGRectGetWidth(v54);

  [(CALNCalendarNotificationViewController *)self preferredContentSize];
  [v20 setSize:Width];
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  id v27 = [objc_alloc((Class)MKMapSnapshotter) initWithOptions:v20];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_100002648;
  v48 = sub_100002658;
  id v49 = 0;
  int v28 = dispatch_get_global_queue(0, 0);
  v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472;
  v36 = sub_100002660;
  v37 = &unk_100004248;
  v40 = &v44;
  char v43 = v5;
  double v41 = v12;
  double v42 = v14;
  id v29 = v4;
  id v38 = v29;
  __int16 v30 = v26;
  v39 = v30;
  [v27 startWithQueue:v28 completionHandler:&v34];

  dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
  id v31 = objc_alloc((Class)UIImageView);
  id v32 = objc_msgSend(v31, "initWithImage:", v45[5], v34, v35, v36, v37);
  [v32 setContentMode:9];

  _Block_object_dispose(&v44, 8);
  return v32;
}

- (id)viewForEventInvitation:(id)a3
{
  return [(CALNCalendarNotificationViewController *)self dayPreviewViewForEvent:a3 withStatusOverride:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_longLookConstraints, 0);
  objc_storeStrong((id *)&self->_longLookView, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
}

@end