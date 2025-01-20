@interface AKPushMessageNotificationPresenter
+ (__CFUserNotification)createUserNotificationWithTitle:(id)a3 body:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 makeNoise:(BOOL)a7;
+ (__CFUserNotification)createUserNotificationWithTitle:(id)a3 body:(id)a4 lockScreenTitle:(id)a5 lockScreenBody:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8 makeNoise:(BOOL)a9;
+ (id)_presenterQueue;
+ (id)createUserNotificationOptionsWithTitle:(id)a3 body:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 makeNoise:(BOOL)a7;
+ (id)createUserNotificationOptionsWithTitle:(id)a3 body:(id)a4 lockScreenTitle:(id)a5 lockScreenBody:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8 makeNoise:(BOOL)a9;
+ (void)populateNotificationOptionsWithCommonKeys:(id)a3 makeNoise:(BOOL)a4;
- (AKPushMessageNotificationPresenter)initWithMessage:(id)a3;
- (BOOL)_isPasswordPromptNecessaryForCommand:(unint64_t)a3;
- (__CFUserNotification)_loginAlertForAccount:(id)a3 latitude:(id)a4 longitude:(id)a5 message:(id)a6 resolvedBody:(id)a7;
- (id)_loginAlertOptionsForAccount:(id)a3 latitude:(id)a4 longitude:(id)a5 message:(id)a6 resolvedBody:(id)a7;
- (id)_loginNotificationOptionsWithContext:(id)a3 isSilent:(BOOL)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6;
- (unint64_t)_notificationResultFromButtonPressed:(unint64_t)a3;
- (void)_handleResult:(unint64_t)a3 forAccount:(id)a4;
- (void)_locationNameWithLatitude:(id)a3 longitude:(id)a4 completion:(id)a5;
- (void)_promptForAuthenticationPasswordForAccount:(id)a3 completion:(id)a4;
- (void)_promptForChangePasswordForAccount:(id)a3;
- (void)_receiveResponseFromNotification:(__CFUserNotification *)a3 handler:(id)a4;
- (void)_showCode:(id)a3 body:(id)a4 title:(id)a5 footer:(id)a6 completion:(id)a7;
- (void)_startChangePasswordFlowForAccount:(id)a3;
- (void)_waitForNotificationResponse:(__CFUserNotification *)a3 withIdentifier:(id)a4 responseHandler:(id)a5;
- (void)presentLoginNotificationWithCode:(id)a3 piggy:(BOOL)a4 completionHandler:(id)a5;
- (void)presentMessageWithAccount:(id)a3 completionHandler:(id)a4;
- (void)tearDown;
@end

@implementation AKPushMessageNotificationPresenter

- (AKPushMessageNotificationPresenter)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKPushMessageNotificationPresenter;
  v6 = [(AKPushMessageNotificationPresenter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

+ (id)_presenterQueue
{
  if (qword_1002724D8 != -1) {
    dispatch_once(&qword_1002724D8, &stru_100229BB8);
  }
  v2 = (void *)qword_1002724D0;

  return v2;
}

- (void)presentMessageWithAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = v7;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100086B3C;
  v57[3] = &unk_100229BE0;
  v57[4] = v8;
  id v10 = v6;
  id v58 = v10;
  id v43 = v9;
  id v59 = v43;
  v11 = objc_retainBlock(v57);
  v12 = v8->_message;
  v13 = [(AKPushMessage *)v12 latitude];
  v14 = [(AKPushMessage *)v12 longitude];
  id v15 = [(AKPushMessage *)v12 command];
  BOOL v18 = v15 != (id)700 && v15 != (id)100 || v13 == 0 || v14 == 0;
  v42 = v15;
  if (v18)
  {
    v39 = v14;
    v40 = v13;
    v41 = v11;
    if (v15 == (id)1600)
    {
      v19 = [(AKPushMessage *)v12 alertTitle];
      v20 = [v10 username];
      v21 = +[AKUsernameFormatter formattedUsernameFromUsername:v20];
      v22 = +[NSString stringWithFormat:@"%@\n%@", v19, v21];
      [(AKPushMessage *)v12 setAlertTitle:v22];
    }
    v23 = objc_opt_class();
    v24 = [(AKPushMessage *)v12 alertTitle];
    v25 = [(AKPushMessage *)v12 alertBody];
    [(AKPushMessage *)v12 lockScreenTitle];
    v26 = v38 = v8;
    [(AKPushMessage *)v12 lockScreenBody];
    v28 = id v27 = v10;
    v29 = [(AKPushMessage *)v12 defaultButtonTitle];
    v30 = [(AKPushMessage *)v12 alternateButtonTitle];
    LOBYTE(v37) = ![(AKPushMessage *)v12 isSilent];
    v31 = (__CFUserNotification *)[v23 createUserNotificationWithTitle:v24 body:v25 lockScreenTitle:v26 lockScreenBody:v28 defaultButtonTitle:v29 alternateButtonTitle:v30 makeNoise:v37];

    id v10 = v27;
    v8 = v38;

    v32 = 0;
    v13 = v40;
    v11 = v41;
    v14 = v39;
    if (!v31) {
      goto LABEL_20;
    }
LABEL_15:
    objc_initWeak(&location, v8);
    v33 = [(AKPushMessage *)v12 messageId];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100086C00;
    v44[3] = &unk_100229C30;
    objc_copyWeak(v47, &location);
    v47[1] = v31;
    v47[2] = v42;
    id v45 = v10;
    v46 = v11;
    [(AKPushMessageNotificationPresenter *)v8 _waitForNotificationResponse:v31 withIdentifier:v33 responseHandler:v44];

    objc_destroyWeak(v47);
    objc_destroyWeak(&location);
    goto LABEL_23;
  }
  id location = 0;
  p_id location = &location;
  uint64_t v53 = 0x3032000000;
  v54 = sub_10000F930;
  v55 = sub_10000F7E8;
  id v56 = 0;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100086BA0;
  v48[3] = &unk_100229C08;
  v50 = &location;
  v34 = dispatch_semaphore_create(0);
  v49 = v34;
  [(AKPushMessageNotificationPresenter *)v8 _locationNameWithLatitude:v13 longitude:v14 completion:v48];
  dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
  if (p_location[5])
  {
    v35 = [(AKPushMessage *)v12 alertBody];
    v32 = [v35 stringByReplacingOccurrencesOfString:@"%loc%" withString:p_location[5]];
  }
  else
  {
    v32 = 0;
  }

  _Block_object_dispose(&location, 8);
  v31 = [(AKPushMessageNotificationPresenter *)v8 _loginAlertForAccount:v10 latitude:v13 longitude:v14 message:v12 resolvedBody:v32];
  if (v31) {
    goto LABEL_15;
  }
LABEL_20:
  v36 = _AKLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_100189B3C();
  }

  ((void (*)(void *, void))v11[2])(v11, 0);
LABEL_23:
}

- (void)_handleResult:(unint64_t)a3 forAccount:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!a3)
  {
    id v8 = v6;
    if ((id)[(AKPushMessage *)self->_message command] == (id)100
      || (id v6 = [(AKPushMessage *)self->_message command], v7 = v8, v6 == (id)700))
    {
      id v6 = [(AKPushMessage *)self->_message piggybackingContext];
      id v7 = v8;
      if (v6 != (id)1)
      {
        id v6 = [(AKPushMessageNotificationPresenter *)self _promptForChangePasswordForAccount:v8];
        id v7 = v8;
      }
    }
  }

  _objc_release_x1(v6, v7);
}

- (void)presentLoginNotificationWithCode:(id)a3 piggy:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(AKPushMessage *)self->_message secondaryTitle];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    v14 = @"LOGIN_CODE_ALERT_TITLE_DEFAULT";
    unsigned __int8 v15 = [@"LOGIN_CODE_ALERT_TITLE_DEFAULT" containsString:@"REBRAND"];
    if (v15)
    {
      int v16 = 0;
    }
    else
    {
      v34 = +[AKFeatureManager sharedManager];
      if ([v34 isAABrandingEnabled])
      {
        v14 = [@"LOGIN_CODE_ALERT_TITLE_DEFAULT" stringByAppendingString:@"_REBRAND"];
        int v16 = 1;
      }
      else
      {
        int v16 = 0;
      }
    }
    id v12 = [v13 localizedStringForKey:v14 value:&stru_100233250 table:@"Localizable"];
    if (v16) {

    }
    if ((v15 & 1) == 0) {
  }
    }

  v17 = [(AKPushMessage *)self->_message secondaryBody];
  BOOL v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    v20 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v19 = [v20 localizedStringForKey:@"LOGIN_CODE_ALERT_IOS_MESSAGE_DEFAULT" value:&stru_100233250 table:@"Localizable"];
  }
  v21 = [(AKPushMessage *)self->_message secondaryFooter];
  if (+[AKCDPFactory isEligibleToArmDeviceForPCSAuth])
  {
    uint64_t v22 = [(AKPushMessage *)self->_message secondaryTitleCDP];
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = v12;
    }
    id v25 = v24;

    uint64_t v26 = [(AKPushMessage *)self->_message secondaryBodyCDP];
    id v27 = (void *)v26;
    if (v26) {
      v28 = (void *)v26;
    }
    else {
      v28 = v19;
    }
    id v29 = v28;

    id v19 = v29;
    id v12 = v25;
  }
  if (v6)
  {
    v30 = +[AKDevice currentDevice];
    if ([v30 isInternalBuild])
    {
      id v31 = [v12 stringByAppendingString:@"\n(internal:piggy)"];
    }
    else
    {
      id v31 = v12;
    }
    id v32 = v31;
  }
  else
  {
    id v32 = v12;
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10008706C;
  v35[3] = &unk_100229C58;
  v35[4] = self;
  id v36 = v9;
  id v33 = v9;
  [(AKPushMessageNotificationPresenter *)self _showCode:v8 body:v19 title:v32 footer:v21 completion:v35];
}

- (void)_showCode:(id)a3 body:(id)a4 title:(id)a5 footer:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = +[AKLoginCodeNotificationBuilder buildLoginCodeNotificationWithTitle:a5 body:a4 footer:a6 loginCode:a3];
  if (v13)
  {
    id v14 = v13;
    unsigned __int8 v15 = [(AKPushMessage *)self->_message messageId];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100087198;
    v17[3] = &unk_100229C80;
    BOOL v18 = v12;
    id v19 = v14;
    [(AKPushMessageNotificationPresenter *)self _waitForNotificationResponse:v14 withIdentifier:v15 responseHandler:v17];

    int v16 = v18;
  }
  else
  {
    int v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100189B70();
    }
  }
}

- (void)_waitForNotificationResponse:(__CFUserNotification *)a3 withIdentifier:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to show notification with identifier: %@", buf, 0xCu);
  }

  v11 = [(id)objc_opt_class() _presenterQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000873F8;
  block[3] = &unk_100229CA8;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(v11, block);

  id v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotificationName:@"AKNotificationNamePresented" object:v8];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100087404;
  v14[3] = &unk_100229CD0;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [(AKPushMessageNotificationPresenter *)self _receiveResponseFromNotification:a3 handler:v14];
}

- (id)_loginAlertOptionsForAccount:(id)a3 latitude:(id)a4 longitude:(id)a5 message:(id)a6 resolvedBody:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  uint64_t v18 = [v16 username];

  [v17 setUsername:v18];
  [v17 setLatitude:v15];

  [v17 setLongitude:v14];
  id v19 = [v12 alertTitle];
  if (v19)
  {
    [v17 _setMessage:v19];
  }
  else
  {
    v20 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    v21 = @"APPLE_ID_SIGN_IN_HEADER";
    uint64_t v18 = (uint64_t)[@"APPLE_ID_SIGN_IN_HEADER" containsString:@"REBRAND"];
    if (v18)
    {
      uint64_t v22 = self;
      int v23 = 0;
    }
    else
    {
      v38 = +[AKFeatureManager sharedManager];
      uint64_t v22 = self;
      if ([v38 isAABrandingEnabled])
      {
        v21 = [@"APPLE_ID_SIGN_IN_HEADER" stringByAppendingString:@"_REBRAND"];
        int v23 = 1;
      }
      else
      {
        int v23 = 0;
      }
    }
    v24 = [v20 localizedStringForKey:v21 value:&stru_100233250 table:@"Localizable"];
    [v17 _setMessage:v24];

    if (v23) {
    self = v22;
    }
    if ((v18 & 1) == 0) {
  }
    }
  if (v13)
  {
    [v17 setReason:v13];
  }
  else
  {
    id v25 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    uint64_t v26 = @"APPLE_ID_UNABLE_TO_RESOLVE_LOCATION_FOR_REASON";
    unsigned __int8 v27 = [@"APPLE_ID_UNABLE_TO_RESOLVE_LOCATION_FOR_REASON" containsString:@"REBRAND"];
    if (v27)
    {
      int v28 = 0;
    }
    else
    {
      uint64_t v18 = +[AKFeatureManager sharedManager];
      if ([(id)v18 isAABrandingEnabled])
      {
        uint64_t v26 = [@"APPLE_ID_UNABLE_TO_RESOLVE_LOCATION_FOR_REASON" stringByAppendingString:@"_REBRAND"];
        int v28 = 1;
      }
      else
      {
        int v28 = 0;
      }
    }
    id v29 = [v25 localizedStringForKey:v26 value:&stru_100233250 table:@"Localizable"];
    [v17 setReason:v29];

    if (v28) {
    if ((v27 & 1) == 0)
    }
  }
  v30 = [v12 deviceClass];
  [v17 setDeviceClass:v30];

  id v31 = [v12 deviceColor];
  [v17 setDeviceColor:v31];

  id v32 = [v12 deviceEnclosureColor];
  [v17 setDeviceEnclosureColor:v32];

  id v33 = [v12 isSilent];
  v34 = [v12 defaultButtonTitle];
  v35 = [v12 alternateButtonTitle];
  id v36 = [(AKPushMessageNotificationPresenter *)self _loginNotificationOptionsWithContext:v17 isSilent:v33 defaultButtonTitle:v34 alternateButtonTitle:v35];

  return v36;
}

- (__CFUserNotification)_loginAlertForAccount:(id)a3 latitude:(id)a4 longitude:(id)a5 message:(id)a6 resolvedBody:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (+[AAFDeviceInfo deviceIsAudioAccessory])
  {
    id v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100189BA4();
    }

    uint64_t v18 = 0;
  }
  else
  {
    id v19 = [(AKPushMessageNotificationPresenter *)self _loginAlertOptionsForAccount:v12 latitude:v13 longitude:v14 message:v15 resolvedBody:v16];
    uint64_t v18 = (__CFUserNotification *)AKUserNotificationCreate();
  }
  return v18;
}

- (void)_locationNameWithLatitude:(id)a3 longitude:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (objc_class *)sub_10008605C();
  if (v10) {
    id v10 = (objc_class *)sub_100086270();
  }
  id v11 = objc_alloc_init(v10);
  id v12 = (objc_class *)sub_10008605C();
  if (v12) {
    id v12 = (objc_class *)sub_1000863AC();
  }
  id v13 = [v12 alloc];
  [v9 doubleValue];
  double v15 = v14;

  [v8 doubleValue];
  double v17 = v16;

  id v18 = [v13 initWithLatitude:v15 longitude:v17];
  id v19 = _AKLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100189BD8();
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100087AD0;
  v21[3] = &unk_100229CF8;
  id v22 = v7;
  id v20 = v7;
  [v11 reverseGeocodeLocation:v18 completionHandler:v21];
}

- (id)_loginNotificationOptionsWithContext:(id)a3 isSilent:(BOOL)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  [(id)objc_opt_class() populateNotificationOptionsWithCommonKeys:v12 makeNoise:!v8];
  if (v10)
  {
    CFStringRef v13 = kCFUserNotificationDefaultButtonTitleKey;
    [v12 setObject:v10 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  }
  else
  {
    double v14 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    double v15 = [v14 localizedStringForKey:@"LOGIN_CODE_ALERT_OK_BUTTON" value:&stru_100233250 table:@"Localizable"];
    CFStringRef v13 = kCFUserNotificationDefaultButtonTitleKey;
    [v12 setObject:v15 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  }
  double v16 = +[NSExtensionItem extensionItemWithAppleIDAuthenticationContext:v9];
  v24 = v16;
  double v17 = +[NSArray arrayWithObjects:&v24 count:1];
  id v18 = +[NSKeyedArchiver archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];

  if (v10)
  {
    [v12 setObject:v10 forKeyedSubscript:v13];
  }
  else
  {
    id v19 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v20 = [v19 localizedStringForKey:@"LOGIN_CODE_ALERT_OK_BUTTON" value:&stru_100233250 table:@"Localizable"];
    [v12 setObject:v20 forKeyedSubscript:v13];
  }
  [v12 setObject:AKExtensionItemLocationSignInAlertKey forKeyedSubscript:SBUserNotificationExtensionIdentifierKey];
  [v12 setObject:v18 forKeyedSubscript:SBUserNotificationExtensionItemsKey];
  v21 = [v9 _message];
  [v12 setObject:v21 forKeyedSubscript:SBUserNotificationLockScreenAlertHeaderKey];

  id v22 = [v9 _interpolatedReason];
  [v12 setObject:v22 forKeyedSubscript:SBUserNotificationLockScreenAlertMessageKey];

  if (v11) {
    [v12 setObject:v11 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  }

  return v12;
}

+ (id)createUserNotificationOptionsWithTitle:(id)a3 body:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 makeNoise:(BOOL)a7
{
  LOBYTE(v8) = a7;
  return [a1 createUserNotificationOptionsWithTitle:a3 body:a4 lockScreenTitle:0 lockScreenBody:0 defaultButtonTitle:a5 alternateButtonTitle:a6 makeNoise:v8];
}

+ (id)createUserNotificationOptionsWithTitle:(id)a3 body:(id)a4 lockScreenTitle:(id)a5 lockScreenBody:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8 makeNoise:(BOOL)a9
{
  BOOL v15 = a9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  int v23 = v22;
  if (v16) {
    [v22 setObject:v16 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  }
  if (v17) {
    [v23 setObject:v17 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  }
  if (v20)
  {
    [v23 setObject:v20 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
    if (!v21) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v25 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  uint64_t v26 = [v25 localizedStringForKey:@"ALERT_DEFAULT_BUTTON" value:&stru_100233250 table:@"Localizable"];
  [v23 setObject:v26 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  BOOL v15 = a9;
  if (v21) {
LABEL_7:
  }
    [v23 setObject:v21 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
LABEL_8:
  if ([v18 length]) {
    [v23 setObject:v18 forKeyedSubscript:SBUserNotificationLockScreenAlertHeaderKey];
  }
  if ([v19 length]) {
    [v23 setObject:v19 forKeyedSubscript:SBUserNotificationLockScreenAlertMessageKey];
  }
  [a1 populateNotificationOptionsWithCommonKeys:v23 makeNoise:v15];

  return v23;
}

+ (__CFUserNotification)createUserNotificationWithTitle:(id)a3 body:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 makeNoise:(BOOL)a7
{
  LOBYTE(v8) = a7;
  return (__CFUserNotification *)[a1 createUserNotificationWithTitle:a3 body:a4 lockScreenTitle:0 lockScreenBody:0 defaultButtonTitle:a5 alternateButtonTitle:a6 makeNoise:v8];
}

+ (__CFUserNotification)createUserNotificationWithTitle:(id)a3 body:(id)a4 lockScreenTitle:(id)a5 lockScreenBody:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8 makeNoise:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  unsigned int v20 = +[AAFDeviceInfo deviceIsAudioAccessory];
  id v21 = _AKLogSystem();
  id v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100189BA4();
    }
    int v23 = 0;
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will display user notification...", buf, 2u);
    }

    LOBYTE(v25) = a9;
    id v22 = [(id)objc_opt_class() createUserNotificationOptionsWithTitle:v14 body:v15 lockScreenTitle:v16 lockScreenBody:v17 defaultButtonTitle:v18 alternateButtonTitle:v19 makeNoise:v25];
    int v23 = (__CFUserNotification *)AKUserNotificationCreate();
  }

  return v23;
}

- (void)tearDown
{
  v3 = [(id)objc_opt_class() _presenterQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008842C;
  block[3] = &unk_100226FB8;
  block[4] = self;
  dispatch_sync(v3, block);
}

+ (void)populateNotificationOptionsWithCommonKeys:(id)a3 makeNoise:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v7 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDismissOnLock];
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  if (v4) {
    [v7 setObject:&off_10023B068 forKeyedSubscript:SBUserNotificationSystemSoundIDKey];
  }
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v6 = [v5 resourceURL];
  [v7 setObject:v6 forKeyedSubscript:kCFUserNotificationLocalizationURLKey];
}

- (void)_receiveResponseFromNotification:(__CFUserNotification *)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008873C;
  block[3] = &unk_100229D20;
  id v10 = v6;
  id v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (unint64_t)_notificationResultFromButtonPressed:(unint64_t)a3
{
  if (a3) {
    return 2 * (a3 == 3);
  }
  else {
    return 1;
  }
}

- (void)_promptForChangePasswordForAccount:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prompting user if if they want to change their password", buf, 2u);
  }

  id v6 = +[AKAccountManager sharedInstance];
  id v7 = [v6 passwordResetTokenForAccount:v4];

  if (v7)
  {
    id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v21 = self;
    if ([@"CHANGE_PASSWORD_ALERT_TITLE" containsString:@"REBRAND"])
    {
      id v9 = [v8 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_TITLE" value:&stru_100233250 table:@"Localizable"];
    }
    else
    {
      id v10 = +[AKFeatureManager sharedManager];
      if ([v10 isAABrandingEnabled])
      {
        id v11 = [@"CHANGE_PASSWORD_ALERT_TITLE" stringByAppendingString:@"_REBRAND"];
        id v9 = [v8 localizedStringForKey:v11 value:&stru_100233250 table:@"Localizable"];
      }
      else
      {
        id v9 = [v8 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_TITLE" value:&stru_100233250 table:@"Localizable"];
      }
    }
    id v12 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    CFStringRef v13 = [v12 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_BODY" value:&stru_100233250 table:@"Localizable"];

    id v14 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v15 = [v14 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_DEF_BTN" value:&stru_100233250 table:@"Localizable"];

    id v16 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v17 = [v16 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_ALT_BTN" value:&stru_100233250 table:@"Localizable"];

    id v18 = +[AKPushMessageNotificationPresenter createUserNotificationWithTitle:v9 body:v13 defaultButtonTitle:v15 alternateButtonTitle:v17 makeNoise:0];
    if (v18)
    {
      id v19 = v18;
      +[NSXPCConnection beginTransaction];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100088BD4;
      v22[3] = &unk_100229D48;
      v24 = v19;
      v22[4] = v21;
      id v23 = v4;
      [(AKPushMessageNotificationPresenter *)v21 _receiveResponseFromNotification:v19 handler:v22];
    }
    else
    {
      unsigned int v20 = _AKLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100189E08();
      }
    }
  }
  else
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100189DD4();
    }
  }
}

- (void)_startChangePasswordFlowForAccount:(id)a3
{
  id v3 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will take user to change password flow in Settings...", buf, 2u);
  }

  id v5 = +[AKAccountManager sharedInstance];
  id v6 = [v5 altDSIDForAccount:v3];

  id v7 = [v5 iCloudAccountForAltDSID:v6];
  if (v7 && ([v5 isPrimaryiCloudAccount:v7] & 1) == 0)
  {
    id v9 = [v7 identifier];
    +[NSString stringWithFormat:@"prefs:root=ACCOUNTS_AND_PASSWORDS&path=%@&aaaction=changePassword", v9];
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = @"prefs:root=APPLE_ACCOUNT&aaaction=changePassword";
  }
  id v10 = +[NSURL URLWithString:v8];
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Using the following URL for change password redirect: %@", buf, 0xCu);
  }

  id v12 = +[LSApplicationWorkspace defaultWorkspace];
  [v12 openSensitiveURL:v10 withOptions:0];
}

- (BOOL)_isPasswordPromptNecessaryForCommand:(unint64_t)a3
{
  if (a3 == 1600)
  {
    id v3 = +[AKDevice currentDevice];
    unsigned int v4 = [v3 isProtectedWithPasscode] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_promptForAuthenticationPasswordForAccount:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  id v8 = [v6 username];

  [v7 setUsername:v8];
  [v7 setShouldPromptForPasswordOnly:1];
  [v7 setAuthenticationType:2];
  [v7 setIsEphemeral:1];
  [v7 setIsUsernameEditable:0];
  [v7 setShouldSkipSettingsLaunchAlert:1];
  [v7 setMaximumLoginAttempts:2];
  objc_msgSend(v7, "set_performUIOutOfProcess:", 1);
  objc_msgSend(v7, "set_forceEligibleForForegroundAuthentication:", 1);
  id v9 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100088FB4;
  v11[3] = &unk_100228318;
  id v12 = v5;
  id v10 = v5;
  [v9 authenticateWithContext:v7 completion:v11];
}

- (void).cxx_destruct
{
}

@end