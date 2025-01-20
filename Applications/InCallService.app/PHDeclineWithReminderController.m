@interface PHDeclineWithReminderController
+ (void)configureButton:(id)a3 forIncomingCall:(id)a4 presenter:(id)a5;
- (CLLocationManager)locationManager;
- (PHDeclineWithReminderController)initWithCall:(id)a3 presenter:(id)a4;
- (PHMeCardGeocoder)meCardGeocoder;
- (TUCall)call;
- (UIViewController)presenter;
- (id)destinationID;
- (id)displayName;
- (id)locationAuthorizationStatusCallback;
- (id)menuActions;
- (id)numberForReminder;
- (id)reminderAction;
- (id)reminderActivity;
- (id)reminderText;
- (void)createReminderForLocation:(id)a3;
- (void)createReminderForWhenILeave;
- (void)createReminderWithDurationInMinutes:(int)a3;
- (void)declineCall;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)performLocationReminderAction:(id)a3 ifAuthorizedForStatus:(int)a4;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4;
- (void)setCall:(id)a3;
- (void)setLocationAuthorizationStatusCallback:(id)a3;
- (void)setLocationManager:(id)a3;
@end

@implementation PHDeclineWithReminderController

+ (void)configureButton:(id)a3 forIncomingCall:(id)a4 presenter:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 setContextMenuInteractionEnabled:1];
  [v7 setShowsMenuAsPrimaryAction:1];
  objc_initWeak(&location, v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008E340;
  v11[3] = &unk_1002CF678;
  id v10 = v8;
  id v12 = v10;
  objc_copyWeak(&v13, &location);
  [v7 _setMenuProvider:v11];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (PHDeclineWithReminderController)initWithCall:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PHDeclineWithReminderController *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_call, a3);
    v11 = [[PHMeCardGeocoder alloc] initWithCall:v7];
    meCardGeocoder = v10->_meCardGeocoder;
    v10->_meCardGeocoder = v11;

    objc_storeWeak((id *)&v10->_presenter, v8);
  }

  return v10;
}

- (void)declineCall
{
  id v4 = +[TUCallCenter sharedInstance];
  v3 = [(PHDeclineWithReminderController *)self call];
  [v4 disconnectCall:v3 withReason:4];
}

- (id)numberForReminder
{
  v2 = [(PHDeclineWithReminderController *)self destinationID];
  if ([v2 destinationIdIsPhoneNumber])
  {
    v3 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage();
    if (!v3)
    {
      v3 = TUActiveCountryCode();
    }
    id v4 = TUNetworkCountryCode();
    TUNumberToDial();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

- (id)displayName
{
  v2 = [(PHDeclineWithReminderController *)self call];
  v3 = [v2 displayName];

  return v3;
}

- (id)destinationID
{
  v2 = [(PHDeclineWithReminderController *)self call];
  v3 = [v2 handle];
  id v4 = [v3 value];

  return v4;
}

- (id)menuActions
{
  v3 = +[NSMutableArray array];
  id v4 = &_ss4Int8VN_ptr;
  id v5 = +[NSBundle bundleWithPath:@"/System/Library/LocationBundles/RemindersAlerts.bundle"];
  unsigned int v6 = +[CLLocationManager authorizationStatusForBundle:v5];

  id v7 = +[UIImage systemImageNamed:@"location"];
  id v8 = +[UIImage systemImageNamed:@"clock"];
  if (+[EKAlarm areLocationsAllowed]) {
    BOOL v9 = v6 == 2;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if (v6 - 5 > 0xFFFFFFFD
      || (+[PHInCallUIUtilities sharedInstance],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v11 = [v10 isSpringBoardLocked],
          v10,
          (v11 & 1) == 0))
    {
      v39 = v8;
      id v12 = +[NSBundle mainBundle];
      id v13 = [v12 localizedStringForKey:@"WHEN_I_LEAVE" value:&stru_1002D6110 table:@"InCallService"];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10008EB98;
      v47[3] = &unk_1002CF6A0;
      v47[4] = self;
      unsigned int v48 = v6;
      v14 = v7;
      v15 = +[UIAction actionWithTitle:v13 image:v7 identifier:0 handler:v47];
      v16 = v3;
      [v3 addObject:v15];

      v17 = [(PHDeclineWithReminderController *)self meCardGeocoder];
      v37 = v17;
      if (v17)
      {
        v18 = v17;
        v19 = [v17 currentValidLocations];
        [v18 setActivelyUsing:1];
      }
      else
      {
        v19 = 0;
      }
      v40 = self;
      id v20 = [v19 count:v37];
      if ((unint64_t)v20 >= 2) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = (uint64_t)v20;
      }
      v41 = v16;
      v22 = &_ss4Int8VN_ptr;
      if (v19 && v21)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          v24 = [v19 objectAtIndex:i];
          v25 = [v24 valueForKey:@"Name"];

          LODWORD(v24) = [v25 isEqualToString:CNLabelHome];
          v26 = [v22[228] mainBundle];
          v27 = v22;
          v28 = v26;
          if (v24) {
            CFStringRef v29 = @"WHEN_I_GET_HOME";
          }
          else {
            CFStringRef v29 = @"WHEN_I_GET_TO_WORK";
          }
          v30 = [v26 localizedStringForKey:v29 value:&stru_1002D6110 table:@"InCallService"];

          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10008EC4C;
          v43[3] = &unk_1002CF6C8;
          v43[4] = v40;
          id v44 = v19;
          uint64_t v45 = i;
          unsigned int v46 = v6;
          v31 = +[UIAction actionWithTitle:v30 image:v14 identifier:0 handler:v43];
          [v41 addObject:v31];

          v22 = v27;
        }
      }

      id v7 = v14;
      v3 = v41;
      self = v40;
      id v8 = v39;
      id v4 = v22;
    }
  }
  v32 = [v4[228] mainBundle];
  v33 = [v32 localizedStringForKey:@"IN_1_HOUR" value:&stru_1002D6110 table:@"InCallService"];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10008ED48;
  v42[3] = &unk_1002CF6F0;
  v42[4] = self;
  v34 = +[UIAction actionWithTitle:v33 image:v8 identifier:0 handler:v42];
  [v3 addObject:v34];

  v35 = +[NSArray arrayWithArray:v3];

  return v35;
}

- (void)performLocationReminderAction:(id)a3 ifAuthorizedForStatus:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    if ((a4 - 3) <= 1) {
      (*((void (**)(id))v6 + 2))(v6);
    }
  }
  else
  {
    id v8 = [(PHDeclineWithReminderController *)self locationAuthorizationStatusCallback];

    if (!v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10008EE7C;
      v10[3] = &unk_1002CF718;
      id v11 = v7;
      [(PHDeclineWithReminderController *)self setLocationAuthorizationStatusCallback:v10];
    }
    BOOL v9 = [(PHDeclineWithReminderController *)self locationManager];
    [v9 startUpdatingLocationWithPrompt];
  }
}

- (CLLocationManager)locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    id v4 = objc_alloc((Class)CLLocationManager);
    id v5 = +[NSBundle bundleWithPath:@"/System/Library/LocationBundles/RemindersAlerts.bundle"];
    id v6 = (CLLocationManager *)[v4 initWithEffectiveBundle:v5];
    id v7 = self->_locationManager;
    self->_locationManager = v6;

    [(CLLocationManager *)self->_locationManager setDelegate:self];
    locationManager = self->_locationManager;
  }

  return locationManager;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  id v6 = [(PHDeclineWithReminderController *)self locationAuthorizationStatusCallback];

  if (v6)
  {
    id v7 = [(PHDeclineWithReminderController *)self locationAuthorizationStatusCallback];
    ((void (**)(void, id, uint64_t))v7)[2](v7, v8, v4);

    if (v4) {
      [(PHDeclineWithReminderController *)self setLocationAuthorizationStatusCallback:0];
    }
  }
}

- (void)createReminderWithDurationInMinutes:(int)a3
{
  id v5 = objc_alloc_init((Class)EKEventStore);
  id v6 = +[EKReminder reminderWithEventStore:v5];
  id v7 = [(PHDeclineWithReminderController *)self reminderText];
  [v6 setTitle:v7];

  id v8 = [v5 defaultCalendarForNewReminders];
  [v6 setCalendar:v8];

  BOOL v9 = [v6 calendar];

  if (!v9)
  {
LABEL_12:
    v27 = +[NSBundle mainBundle];
    v35 = [v27 localizedStringForKey:@"ERROR" value:&stru_1002D6110 table:@"InCallService"];
    v36 = +[NSBundle mainBundle];
    v37 = [v36 localizedStringForKey:@"REMINDER_FAILED_TRY_LATER" value:&stru_1002D6110 table:@"InCallService"];
    [(PHDeclineWithReminderController *)self presentAlertWithTitle:v35 message:v37];

    goto LABEL_13;
  }
  id v10 = [(PHDeclineWithReminderController *)self call];
  id v11 = [v10 provider];
  unsigned int v12 = [v11 isSystemProvider];

  if (v12)
  {
    id v13 = [v6 calendar];
    v14 = [v13 source];
    v15 = [v14 constraints];
    unsigned int v16 = [v15 supportsReminderActions];

    if (!v16) {
      goto LABEL_7;
    }
    v17 = [(PHDeclineWithReminderController *)self reminderAction];
    [v6 setAction:v17];
  }
  else
  {
    v17 = [(PHDeclineWithReminderController *)self reminderActivity];
    [v6 setAppLink:v17];
  }

LABEL_7:
  v18 = +[NSDate dateWithTimeIntervalSinceNow:(double)(60 * a3)];
  v19 = +[EKAlarm alarmWithAbsoluteDate:v18];
  id v20 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  uint64_t v21 = +[NSTimeZone localTimeZone];
  [v20 setTimeZone:v21];

  v22 = [v20 components:1048830 fromDate:v18];
  [v6 setDueDateComponents:v22];

  v23 = +[NSArray arrayWithObject:v19];
  [v6 setAlarms:v23];

  id v38 = 0;
  unsigned __int8 v24 = [v5 saveReminder:v6 commit:1 error:&v38];
  id v25 = v38;
  v26 = v25;
  if ((v24 & 1) == 0)
  {
    v28 = sub_1000D5130();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1001EB228((uint64_t)v26, v28, v29, v30, v31, v32, v33, v34);
    }

    goto LABEL_12;
  }

  v27 = [(PHDeclineWithReminderController *)self displayName];
  TUNotifyOfRemindMeLater();
LABEL_13:
}

- (void)createReminderForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"Address"];
  id v6 = [v4 objectForKey:@"CLLocation"];
  id v7 = [v4 objectForKey:@"Radius"];
  [v7 doubleValue];
  double v9 = v8;

  v54 = (void *)v5;
  id v10 = +[EKStructuredLocation locationWithTitle:v5];
  [v10 setGeoLocation:v6];
  [v10 setRadius:v9];
  id v11 = objc_alloc_init((Class)EKEventStore);
  unsigned int v12 = +[EKReminder reminderWithEventStore:v11];
  id v13 = [(PHDeclineWithReminderController *)self reminderText];
  [v12 setTitle:v13];

  v14 = [v11 defaultCalendarForNewReminders];
  [v12 setCalendar:v14];

  v15 = [v12 calendar];

  unsigned int v16 = &_ss4Int8VN_ptr;
  if (!v15) {
    goto LABEL_22;
  }
  v17 = [v12 calendar];
  v18 = [v17 source];
  v19 = [v18 constraints];
  unsigned int v20 = [v19 supportsReminderLocations];

  if (!v20)
  {
    uint64_t v29 = sub_1000D5130();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Reminder failed because calendar doesn't support location-based reminders", buf, 2u);
    }

    unsigned int v16 = &_ss4Int8VN_ptr;
    uint64_t v30 = +[NSBundle mainBundle];
    uint64_t v31 = [v30 localizedStringForKey:@"REMINDER_FAILED_NO_LOCATION_BASED_REMINDERS" value:&stru_1002D6110 table:@"InCallService"];

    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = v32;
LABEL_23:
      id v44 = [v16[228] mainBundle];
      v53 = [v44 localizedStringForKey:@"ERROR" value:&stru_1002D6110 table:@"InCallService"];
      [(PHDeclineWithReminderController *)self presentAlertWithTitle:v53 message:v32];

      goto LABEL_24;
    }
LABEL_22:
    v52 = [v16[228] mainBundle];
    id v32 = [v52 localizedStringForKey:@"REMINDER_FAILED_TRY_LATER" value:&stru_1002D6110 table:@"InCallService"];

    uint64_t v33 = 0;
    goto LABEL_23;
  }
  uint64_t v21 = [(PHDeclineWithReminderController *)self call];
  v22 = [v21 provider];
  unsigned int v23 = [v22 isSystemProvider];

  if (v23)
  {
    unsigned __int8 v24 = [v12 calendar];
    id v25 = [v24 source];
    v26 = [v25 constraints];
    unsigned int v27 = [v26 supportsReminderActions];

    if (!v27) {
      goto LABEL_12;
    }
    v28 = [(PHDeclineWithReminderController *)self reminderAction];
    [v12 setAction:v28];
  }
  else
  {
    v28 = [(PHDeclineWithReminderController *)self reminderActivity];
    [v12 setAppLink:v28];
  }

LABEL_12:
  uint64_t v34 = +[EKAlarm alarmWithRelativeOffset:0.0];
  [v34 setProximity:1];
  [v34 setStructuredLocation:v10];
  [v12 setStructuredLocation:v10];
  v35 = +[NSArray arrayWithObject:v34];
  [v12 setAlarms:v35];

  v36 = sub_1000D5130();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v6;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "About to save a reminder for CLLocation %@", buf, 0xCu);
  }

  id v55 = 0;
  unsigned __int8 v37 = [v11 saveReminder:v12 commit:1 error:&v55];
  id v38 = v55;
  v39 = v38;
  if ((v37 & 1) == 0)
  {
    uint64_t v45 = sub_1000D5130();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_1001EB228((uint64_t)v39, v45, v46, v47, v48, v49, v50, v51);
    }

    unsigned int v16 = &_ss4Int8VN_ptr;
    goto LABEL_22;
  }

  uint64_t v33 = [v4 valueForKey:@"Name"];
  unsigned int v40 = [v33 isEqualToString:CNLabelHome];
  v41 = +[NSBundle mainBundle];
  v42 = v41;
  if (v40) {
    CFStringRef v43 = @"WHEN_I_GET_HOME";
  }
  else {
    CFStringRef v43 = @"WHEN_I_GET_TO_WORK";
  }
  id v32 = [v41 localizedStringForKey:v43 value:&stru_1002D6110 table:@"InCallService"];

  id v44 = [(PHDeclineWithReminderController *)self displayName];
  TUNotifyOfRemindMeLater();
LABEL_24:
}

- (void)createReminderForWhenILeave
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHDeclineWithReminderController.createReminderForWhenILeave beginBackgroundTaskWithExpirationHandler", buf, 2u);
  }

  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 beginBackgroundTaskWithExpirationHandler:&stru_1002CF738];

  id v6 = +[NSBundle bundleWithPath:@"/System/Library/LocationBundles/RemindersAlerts.bundle"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008FAA4;
  v11[3] = &unk_1002CF788;
  void v11[4] = self;
  v11[5] = v5;
  +[PHLocationFinder findLocationWithBundle:v6 completion:v11];

  id v7 = [(PHDeclineWithReminderController *)self displayName];
  double v8 = [(PHDeclineWithReminderController *)self reminderText];
  double v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"WHEN_I_LEAVE" value:&stru_1002D6110 table:@"InCallService"];
  TUNotifyOfRemindMeLaterWhenILeave();
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4
{
  id v5 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"OK" value:&stru_1002D6110 table:@"InCallService"];
  double v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:&stru_1002CF7C8];

  [v5 addAction:v8];
  double v9 = [(PHDeclineWithReminderController *)self presenter];

  if (v9)
  {
    id v10 = [(PHDeclineWithReminderController *)self presenter];
    [v10 presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    id v11 = sub_1000D5130();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHDeclineWithReminderController: presenter for alert deallocated so falling back to UIWindow._applicationKeyWindow.rootViewController", v13, 2u);
    }

    id v10 = +[UIWindow _applicationKeyWindow];
    unsigned int v12 = [v10 rootViewController];
    [v12 presentViewController:v5 animated:1 completion:&stru_1002CF7E8];
  }
}

- (id)reminderAction
{
  v2 = [(PHDeclineWithReminderController *)self call];
  v3 = [v2 dialRequestForRedial];
  id v4 = [v3 URL];

  return v4;
}

- (id)reminderActivity
{
  v2 = [(PHDeclineWithReminderController *)self call];
  v3 = [v2 dialRequestForRedial];
  id v4 = [v3 userActivity];

  return v4;
}

- (id)reminderText
{
  v3 = [(PHDeclineWithReminderController *)self call];
  id v4 = [v3 provider];
  unsigned int v5 = [v4 isFaceTimeProvider];

  id v6 = [(PHDeclineWithReminderController *)self call];
  id v7 = v6;
  if (v5)
  {
    unsigned int v8 = [v6 isVideo];
    double v9 = +[NSBundle mainBundle];
    id v10 = v9;
    if (v8) {
      CFStringRef v11 = @"FACETIME_%@";
    }
    else {
      CFStringRef v11 = @"FACETIME_AUDIO_%@";
    }
    unsigned int v12 = [v9 localizedStringForKey:v11 value:&stru_1002D6110 table:@"InCallService"];

    id v13 = [(PHDeclineWithReminderController *)self displayName];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13);
    goto LABEL_18;
  }
  v15 = [v6 provider];
  unsigned int v16 = [v15 isTelephonyProvider];

  v17 = [(PHDeclineWithReminderController *)self call];
  v18 = v17;
  if (!v16)
  {
    unsigned int v27 = [v17 isVideo];
    v28 = +[NSBundle mainBundle];
    uint64_t v29 = v28;
    if (v27) {
      CFStringRef v30 = @"VOIP_%@_VIDEO_%@";
    }
    else {
      CFStringRef v30 = @"VOIP_%@_AUDIO_%@";
    }
    unsigned int v12 = [v28 localizedStringForKey:v30 value:&stru_1002D6110 table:@"InCallService"];

    id v13 = [(PHDeclineWithReminderController *)self call];
    unsigned int v23 = [v13 provider];
    unsigned __int8 v24 = [v23 localizedName];
    id v25 = [(PHDeclineWithReminderController *)self displayName];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v24, v25);
    goto LABEL_14;
  }
  v19 = [v17 provider];
  unsigned int v20 = [v19 prioritizedSenderIdentities];
  if ((unint64_t)[v20 count] <= 1)
  {

    goto LABEL_16;
  }
  uint64_t v21 = [(PHDeclineWithReminderController *)self call];
  v22 = [v21 localSenderIdentity];

  if (!v22)
  {
LABEL_16:
    unsigned int v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"CALL_BACK_%@" value:&stru_1002D6110 table:@"InCallService"];
    unsigned int v23 = [(PHDeclineWithReminderController *)self displayName];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v23);
    goto LABEL_17;
  }
  unsigned int v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"CALL_BACK_%@_WITH_SENDER_IDENTITY_%@" value:&stru_1002D6110 table:@"InCallService"];
  unsigned int v23 = [(PHDeclineWithReminderController *)self displayName];
  unsigned __int8 v24 = [(PHDeclineWithReminderController *)self call];
  id v25 = [v24 localSenderIdentity];
  v26 = [v25 localizedName];
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v23, v26);

LABEL_14:
LABEL_17:

LABEL_18:

  return v14;
}

- (TUCall)call
{
  return (TUCall *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCall:(id)a3
{
}

- (PHMeCardGeocoder)meCardGeocoder
{
  return self->_meCardGeocoder;
}

- (id)locationAuthorizationStatusCallback
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setLocationAuthorizationStatusCallback:(id)a3
{
}

- (void)setLocationManager:(id)a3
{
}

- (UIViewController)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong(&self->_locationAuthorizationStatusCallback, 0);
  objc_storeStrong((id *)&self->_meCardGeocoder, 0);

  objc_storeStrong((id *)&self->_call, 0);
}

@end