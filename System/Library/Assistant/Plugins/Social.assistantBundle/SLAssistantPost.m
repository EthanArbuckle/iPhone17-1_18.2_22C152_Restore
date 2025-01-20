@interface SLAssistantPost
+ (id)locationPermissionBundleForSiri;
- (BOOL)_shouldInitializeLocationSearch;
- (SLAssistantPostDelegate)delegate;
- (id)account;
- (id)accountStore;
- (void)_attemptPostRequest:(id)a3 withCompletionBlock:(id)a4;
- (void)_callLocationAcquiredHandler;
- (void)_checkAccountCredentialsWithCompletionHandler:(id)a3;
- (void)_checkAccountGeoTagStatusWithCompletionHandler:(id)a3;
- (void)_checkLocationAndAccountsForObject:(id)a3 completion:(id)a4;
- (void)_cleanupLocationServices;
- (void)_createAndExecutePostRequestWithStatus:(id)a3 account:(id)a4 completion:(id)a5;
- (void)_finishedPostRequest:(id)a3 withCompletionBlock:(id)a4 responseData:(id)a5 urlResponse:(id)a6 error:(id)a7;
- (void)_makeLocationSwitchVisible;
- (void)_processResponseFromServiceWithHandler:(id)a3;
- (void)_setLocationWithLatitude:(float)a3 longitude:(float)a4;
- (void)_stopRetrying;
- (void)_stopUpdatingLocation;
- (void)dealloc;
- (void)initializeLocationSearch;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateToLocation:(id)a4 fromLocation:(id)a5;
- (void)performCreateWithObject:(id)a3 completion:(id)a4;
- (void)performPostRequestWithObject:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)waitUntilLocationAcquiredOrTimeElapsed:(float)a3 andExecute:(id)a4;
@end

@implementation SLAssistantPost

- (void)dealloc
{
  [(SLAssistantPost *)self _cleanupLocationServices];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_stopRetrying" object:0];
  self->_delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)SLAssistantPost;
  [(SLAssistantPost *)&v3 dealloc];
}

- (id)accountStore
{
  id result = self->_accountStore;
  if (!result)
  {
    id result = objc_alloc_init((Class)ACAccountStore);
    self->_accountStore = (ACAccountStore *)result;
  }
  return result;
}

- (id)account
{
  if (!self->_account && !self->_checkedForAccount)
  {
    self->_checkedForAccount = 1;
    id v3 = [(SLAssistantPost *)self accountStore];
    id v4 = objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", -[SLAssistantPostDelegate accountTypeIdentifier](self->_delegate, "accountTypeIdentifier"));
    id v5 = [(SLAssistantPostDelegate *)self->_delegate lastAccountIdentifier];
    if (v5)
    {
      v6 = (ACAccount *)[v3 accountWithIdentifier:v5];
      self->_account = v6;
      if (v6) {
        return self->_account;
      }
    }
    else if (self->_account)
    {
      return self->_account;
    }
    id v7 = [v3 accountsWithAccountType:v4];
    if ([v7 count])
    {
      v8 = (ACAccount *)[v7 objectAtIndex:0];
      self->_account = v8;
      [(SLAssistantPostDelegate *)self->_delegate setLastAccountIdentifier:[(ACAccount *)v8 identifier]];
    }
  }
  return self->_account;
}

- (void)_attemptPostRequest:(id)a3 withCompletionBlock:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3FA0;
  v4[3] = &unk_81E8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [a3 performRequestWithHandler:v4];
}

- (void)_finishedPostRequest:(id)a3 withCompletionBlock:(id)a4 responseData:(id)a5 urlResponse:(id)a6 error:(id)a7
{
  if (a7)
  {
    v12 = (NSString *)[a7 localizedDescription];
  }
  else
  {
    v13 = (char *)[a6 statusCode];
    if ((unint64_t)(v13 - 400) > 0xFFFFFFFFFFFFFE70) {
      goto LABEL_8;
    }
    v12 = +[NSHTTPURLResponse localizedStringForStatusCode:v13];
  }
  v14 = v12;
  if (!v12)
  {
LABEL_8:
    v16 = (SACommandFailed *)+[SADomainObjectCommitCompleted domainObjectCommitCompleted];
    -[SACommandFailed setIdentifier:](v16, "setIdentifier:", objc_msgSend(-[SADomainObjectCommit identifier](self->_object, "identifier"), "identifier"));
    self->_shouldRetry = 0;
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_stopRetrying" object:0];
    [(SLAssistantPostDelegate *)self->_delegate playPostSound];
    if (!v16) {
      return;
    }
LABEL_9:
    id v17 = [(SACommandFailed *)v16 dictionary];
    v18 = (void (*)(id, id))*((void *)a4 + 2);
    v18(a4, v17);
    return;
  }
  if ([(SLAssistantPostDelegate *)self->_delegate responseDataIndicatesDuplicatePost:a5 urlResponse:a6])
  {
    v15 = +[SACommandFailed commandFailedWithErrorCode:SAMicroblogMicroblogDupliatePostingErrorCode];
    goto LABEL_21;
  }
  if (!self->_shouldRetry
    || (int64_t remainingRetryCount = self->_remainingRetryCount,
        BOOL v20 = remainingRetryCount < 1,
        int64_t v21 = remainingRetryCount - 1,
        v20))
  {
    id v22 = [(SLAssistantPostDelegate *)self->_delegate extractErrorDetailsFromResponseData:a5 urlResponse:a6];
    if (v22) {
      v23 = +[NSString stringWithFormat:@"%@ (%@)", v14, v22];
    }
    else {
      v23 = v14;
    }
    v15 = +[SACommandFailed commandFailedWithReason:v23];
LABEL_21:
    v16 = v15;
    if (!v15) {
      return;
    }
    goto LABEL_9;
  }
  self->_int64_t remainingRetryCount = v21;

  [(SLAssistantPost *)self _attemptPostRequest:a3 withCompletionBlock:a4];
}

- (void)_stopRetrying
{
  self->_shouldRetry = 0;
}

- (void)performCreateWithObject:(id)a3 completion:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_42B8;
  v4[3] = &unk_8210;
  v4[4] = a4;
  -[SLAssistantPost _checkLocationAndAccountsForObject:completion:](self, "_checkLocationAndAccountsForObject:completion:", [a3 object], v4);
}

- (void)performPostRequestWithObject:(id)a3 completion:(id)a4
{
  object = self->_object;
  if (object) {

  }
  v8 = (SADomainObjectCommit *)a3;
  self->_object = v8;
  id v9 = [(SADomainObjectCommit *)v8 identifier];
  id v10 = [v9 content];
  if (!v10)
  {
    v15 = +[SACommandFailed commandFailedWithReason:@"No string to send."];
    if (v15) {
      goto LABEL_25;
    }
  }
  id v11 = [(SLAssistantPost *)self account];
  if (v11)
  {
    id v12 = v11;
    if (![v9 useLocation] || !objc_msgSend(objc_msgSend(v9, "useLocation"), "intValue"))
    {
      int v16 = 0;
      goto LABEL_16;
    }
    if (+[CLLocationManager locationServicesEnabled]
      && +[CLLocationManager authorizationStatusForBundle:](CLLocationManager, "authorizationStatusForBundle:", +[SLAssistantPost locationPermissionBundleForSiri]) == 3)
    {
      unsigned int v13 = +[CLLocationManager authorizationStatusForBundle:[(SLAssistantPostDelegate *)self->_delegate locationPermissionBundle]];
      if (v13 != 3)
      {
        if (!v13) {
          [(SLAssistantPost *)self _makeLocationSwitchVisible];
        }
        v14 = &SAMicroblogMicroblogLocationSettingDisabledErrorCode;
        goto LABEL_24;
      }
      int v16 = 1;
LABEL_16:
      int v17 = 0;
      if ([v9 location])
      {
        id v18 = objc_msgSend(objc_msgSend(v9, "location"), "latitude");
        id v19 = objc_msgSend(objc_msgSend(v9, "location"), "longitude");
        char v20 = 0;
        if (v18)
        {
          int64_t v21 = v19;
          int v22 = 0;
          if (v19)
          {
            objc_msgSend(v18, "floatValue", 0.0);
            int v17 = v23;
            [v21 floatValue];
            char v20 = 1;
          }
          if (v16) {
            goto LABEL_21;
          }
          goto LABEL_30;
        }
      }
      else
      {
        char v20 = 0;
      }
      int v22 = 0;
      if (v16)
      {
LABEL_21:
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_45D8;
        v27[3] = &unk_8260;
        char v30 = v20;
        int v28 = v17;
        int v29 = v22;
        v27[4] = self;
        v27[5] = v10;
        v27[6] = v12;
        v27[7] = a4;
        [(SLAssistantPost *)self _checkAccountGeoTagStatusWithCompletionHandler:v27];
        return;
      }
LABEL_30:
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_470C;
      v26[3] = &unk_8288;
      v26[4] = self;
      v26[5] = v10;
      v26[6] = v12;
      v26[7] = a4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);
      return;
    }
    v14 = &SAMicroblogSiriLocationSettingDisabledErrorCode;
  }
  else
  {
    v14 = &SAMicroblogMicroblogNoAccountErrorCode;
  }
LABEL_24:
  v15 = +[SACommandFailed commandFailedWithErrorCode:*v14];
LABEL_25:
  id v24 = [(SACommandFailed *)v15 dictionary];
  v25 = (void (*)(id, id))*((void *)a4 + 2);

  v25(a4, v24);
}

- (void)_createAndExecutePostRequestWithStatus:(id)a3 account:(id)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4790;
  v5[3] = &unk_82B0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  [(SLAssistantPost *)self waitUntilLocationAcquiredOrTimeElapsed:v5 andExecute:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(3.0))];
}

- (void)_checkAccountCredentialsWithCompletionHandler:(id)a3
{
  id v5 = [(SLAssistantPost *)self account];
  if (!v5) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
  delegate = self->_delegate;

  [(SLAssistantPostDelegate *)delegate verifyCredentialsForAccount:v5 completion:a3];
}

- (void)_checkAccountGeoTagStatusWithCompletionHandler:(id)a3
{
  id v5 = [(SLAssistantPost *)self account];
  if (v5)
  {
    id v6 = v5;
    delegate = self->_delegate;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_499C;
    v9[3] = &unk_8300;
    v9[4] = a3;
    [(SLAssistantPostDelegate *)delegate verifyGeotagSettingsForAccount:v6 defaultSetting:1 completion:v9];
  }
  else
  {
    v8 = (void (*)(id, uint64_t))*((void *)a3 + 2);
    v8(a3, 1);
  }
}

- (void)_checkLocationAndAccountsForObject:(id)a3 completion:(id)a4
{
  if (+[ACAccountStore accountsWithAccountTypeIdentifierExist:[(SLAssistantPostDelegate *)self->_delegate accountTypeIdentifier]] != 1)
  {
    id v7 = +[SACommandFailed commandFailedWithErrorCode:SAMicroblogMicroblogNoAccountErrorCode];
    if (v7) {
      goto LABEL_24;
    }
  }
  if ([a3 useLocation]) {
    int v8 = objc_msgSend(objc_msgSend(a3, "useLocation"), "intValue") != 0;
  }
  else {
    int v8 = 0;
  }
  id v7 = 0;
  if (!+[CLLocationManager locationServicesEnabled] && v8) {
    id v7 = +[SACommandFailed commandFailedWithErrorCode:SAMicroblogSiriLocationSettingDisabledErrorCode];
  }
  if (v7) {
    char v9 = 1;
  }
  else {
    char v9 = v8 ^ 1;
  }
  if ((v9 & 1) == 0)
  {
    if (+[CLLocationManager authorizationStatusForBundle:](CLLocationManager, "authorizationStatusForBundle:", +[SLAssistantPost locationPermissionBundleForSiri]) == 3)id v7 = 0; {
    else
    }
      id v7 = +[SACommandFailed commandFailedWithErrorCode:SAMicroblogSiriLocationSettingDisabledErrorCode];
  }
  if (v7) {
    char v10 = 1;
  }
  else {
    char v10 = v8 ^ 1;
  }
  if ((v10 & 1) == 0)
  {
    unsigned int v11 = +[CLLocationManager authorizationStatusForBundle:[(SLAssistantPostDelegate *)self->_delegate locationPermissionBundle]];
    if (v11 == 3)
    {
      int v8 = 1;
      self->_awaitingAccountCredentialVerification = 1;
      goto LABEL_29;
    }
    unsigned int v12 = v11;
    id v7 = +[SACommandFailed commandFailedWithErrorCode:SAMicroblogMicroblogLocationSettingDisabledErrorCode];
    if (!v12)
    {
      [(SLAssistantPost *)self _makeLocationSwitchVisible];
      if (v7) {
        goto LABEL_24;
      }
LABEL_28:
      self->_awaitingAccountCredentialVerification = 1;
LABEL_29:
      self->_assistantWantsLocation = v8;
      self->_awaitingLocationSettingStatus = v8;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_4CC4;
      v15[3] = &unk_8350;
      v15[4] = self;
      v15[5] = a4;
      [(SLAssistantPost *)self _checkAccountCredentialsWithCompletionHandler:v15];
      if (v8)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_4D60;
        v14[3] = &unk_8350;
        v14[4] = self;
        v14[5] = a4;
        [(SLAssistantPost *)self _checkAccountGeoTagStatusWithCompletionHandler:v14];
      }
      return;
    }
  }
  if (!v7) {
    goto LABEL_28;
  }
LABEL_24:
  unsigned int v13 = (void (*)(id, SACommandFailed *))*((void *)a4 + 2);

  v13(a4, v7);
}

- (void)_processResponseFromServiceWithHandler:(id)a3
{
  uint64_t v5 = objc_opt_class();
  BOOL accountCredentialsVerified = self->_accountCredentialsVerified;
  BOOL locationSettingAllowed = self->_locationSettingAllowed;
  BOOL awaitingAccountCredentialVerification = self->_awaitingAccountCredentialVerification;
  BOOL awaitingLocationSettingStatus = self->_awaitingLocationSettingStatus;
  uint64_t v9 = v5;
  _SLLog();
  if (self->_awaitingLocationSettingStatus || self->_awaitingAccountCredentialVerification) {
    return;
  }
  if (!self->_accountCredentialsVerified)
  {
    id v7 = &SAMicroblogMicroblogLoginFailedErrorCode;
LABEL_10:
    id v6 = +[SACommandFailed commandFailedWithErrorCode:](SACommandFailed, "commandFailedWithErrorCode:", *v7, v9, awaitingAccountCredentialVerification, awaitingLocationSettingStatus, accountCredentialsVerified, locationSettingAllowed);
    goto LABEL_11;
  }
  if (self->_assistantWantsLocation && !self->_locationSettingAllowed)
  {
    id v7 = &SAMicroblogMicroblogLocationDisabledFromProviderErrorCode;
    goto LABEL_10;
  }
  id v6 = 0;
LABEL_11:
  int v8 = (void (*)(id, SACommandFailed *))*((void *)a3 + 2);

  v8(a3, v6);
}

- (void)_makeLocationSwitchVisible
{
  id v2 = [(SLAssistantPostDelegate *)self->_delegate locationPermissionBundle];

  +[CLLocationManager setAuthorizationStatus:0 forBundle:v2];
}

+ (id)locationPermissionBundleForSiri
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (BOOL)_shouldInitializeLocationSearch
{
  LODWORD(v3) = +[CLLocationManager locationServicesEnabled];
  if (v3)
  {
    id v4 = [(SADomainObjectCommit *)self->_object identifier];
    id v3 = [v4 useLocation];
    if (v3) {
      LOBYTE(v3) = objc_msgSend(objc_msgSend(v4, "useLocation"), "intValue") != 0;
    }
  }
  return (char)v3;
}

- (void)initializeLocationSearch
{
  if ([(SLAssistantPost *)self _shouldInitializeLocationSearch]
    && !self->_locationManager)
  {
    id v3 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundle:", +[SLAssistantPost locationPermissionBundleForSiri](SLAssistantPost, "locationPermissionBundleForSiri"));
    self->_locationManager = v3;
    [(CLLocationManager *)v3 setDelegate:self];
    [(CLLocationManager *)self->_locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters * 5.0];
    [(CLLocationManager *)self->_locationManager setDistanceFilter:500.0];
    if (!self->_updatingLocation)
    {
      [(CLLocationManager *)self->_locationManager startUpdatingLocationWithPrompt];
      [(SLAssistantPost *)self performSelector:"_stopUpdatingLocation" withObject:0 afterDelay:20.0];
      self->_updatingLocation = 1;
    }
  }
}

- (void)waitUntilLocationAcquiredOrTimeElapsed:(float)a3 andExecute:(id)a4
{
  if (self->_updatingLocation)
  {
    id locationAcquiredHandler = self->_locationAcquiredHandler;
    if (locationAcquiredHandler) {
      _Block_release(locationAcquiredHandler);
    }
    self->_id locationAcquiredHandler = _Block_copy(a4);
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_stopUpdatingLocation" object:0];
    [(SLAssistantPost *)self performSelector:"_stopUpdatingLocation" withObject:0 afterDelay:a3];
  }
  else
  {
    (*((void (**)(id, CLLocation *, float))a4 + 2))(a4, self->_bestLocation, a3);
    id v8 = self->_locationAcquiredHandler;
    if (v8)
    {
      _Block_release(v8);
      self->_id locationAcquiredHandler = 0;
    }
  }
}

- (void)_setLocationWithLatitude:(float)a3 longitude:(float)a4
{
  if (self->_updatingLocation) {
    self->_updatingLocation = 0;
  }
  bestLocation = self->_bestLocation;
  if (bestLocation)
  {

    self->_bestLocation = 0;
  }
  self->_bestLocation = (CLLocation *)[objc_alloc((Class)CLLocation) initWithLatitude:a3 longitude:a4];
}

- (void)_cleanupLocationServices
{
  id locationAcquiredHandler = self->_locationAcquiredHandler;
  if (locationAcquiredHandler)
  {
    _Block_release(locationAcquiredHandler);
    self->_id locationAcquiredHandler = 0;
  }
  [(SLAssistantPost *)self _stopUpdatingLocation];

  bestLocation = self->_bestLocation;
}

- (void)_stopUpdatingLocation
{
  if (self->_updatingLocation)
  {
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_stopUpdatingLocation:" object:0];
    self->_updatingLocation = 0;
    [(SLAssistantPost *)self _callLocationAcquiredHandler];
  }
}

- (void)_callLocationAcquiredHandler
{
  id locationAcquiredHandler = (void (**)(id, CLLocation *))self->_locationAcquiredHandler;
  if (locationAcquiredHandler)
  {
    locationAcquiredHandler[2](locationAcquiredHandler, self->_bestLocation);
    id v4 = self->_locationAcquiredHandler;
    if (v4)
    {
      _Block_release(v4);
      self->_id locationAcquiredHandler = 0;
    }
  }
}

- (void)locationManager:(id)a3 didUpdateToLocation:(id)a4 fromLocation:(id)a5
{
  objc_msgSend(objc_msgSend(a4, "timestamp", a3), "timeIntervalSinceNow");
  if (v7 >= -5.0)
  {
    [a4 horizontalAccuracy];
    if (v8 >= 0.0)
    {
      bestLocation = self->_bestLocation;
      if (bestLocation)
      {
        [(CLLocation *)bestLocation horizontalAccuracy];
        double v11 = v10;
        [a4 horizontalAccuracy];
        if (v11 <= v12) {
          return;
        }
        unsigned int v13 = self->_bestLocation;
      }
      else
      {
        unsigned int v13 = 0;
      }

      self->_bestLocation = (CLLocation *)a4;
      [a4 horizontalAccuracy];
      double v15 = v14;
      [(CLLocationManager *)self->_locationManager desiredAccuracy];
      if (v15 <= v16)
      {
        [(SLAssistantPost *)self _stopUpdatingLocation];
      }
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3))
  {
    [(SLAssistantPost *)self _stopUpdatingLocation];
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if (a4 != 3) {
    [(SLAssistantPost *)self _stopUpdatingLocation];
  }
}

- (SLAssistantPostDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SLAssistantPostDelegate *)a3;
}

@end