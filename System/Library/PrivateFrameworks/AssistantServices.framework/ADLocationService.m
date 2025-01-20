@interface ADLocationService
+ (id)sharedService;
- (ADLocationManager)locationManager;
- (ADLocationService)initWithDispatchQueue:(id)a3;
- (ADLocationService)initWithDispatchQueue:(id)a3 locationManager:(id)a4 isSiriLocationServicesPromptingEnabled:(BOOL)a5;
- (OS_dispatch_queue)dispatchQueue;
- (void)currentAuthorizationStyle:(id)a3;
- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5;
- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4;
- (void)dismissTCCDialogIfNeeded;
- (void)dismissTCCDialogIfNeeded:(id)a3;
- (void)drainRequestsWithErrorCode:(int64_t)a3 clearLocationCache:(BOOL)a4 dismissDialog:(BOOL)a5;
- (void)locationManager:(id)a3 wantsToSetRequestOrigin:(id)a4;
- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation ADLocationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (ADLocationManager)locationManager
{
  return self->_locationManager;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)locationManager:(id)a3 wantsToSetRequestOrigin:(id)a4
{
  id v8 = a4;
  v4 = +[ADCommandCenter sharedCommandCenter];
  v5 = [v4 _currentRequest];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 currentRequestId];
    [v8 setRefId:v7];
  }
  [v4 _sendCommandToServer:v8];
}

- (void)dismissTCCDialogIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = [(ADLocationService *)self locationManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100223298;
  v7[3] = &unk_10050D0D0;
  id v8 = v4;
  id v6 = v4;
  [v5 dismissTCCDialogIfNeeded:v7];
}

- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ADLocationService *)self locationManager];
  [v8 currentLocationWithFetchRequest:v7 completion:v6];
}

- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(ADLocationService *)self locationManager];
  [v9 currentLocationWithAccuracy:v8 timeout:a3 completion:a4];
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    BOOL v6 = a3;
    id v8 = a5;
    id v10 = [(ADLocationService *)self locationManager];
    [v10 updateTemporaryAuthorizationForAccurateLocation:v6 timeout:v8 completion:a4];
  }
  else
  {
    id v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    BOOL v4 = a3;
    id v6 = a4;
    id v8 = [(ADLocationService *)self locationManager];
    [v8 updateTemporaryAuthorizationForAccurateLocation:v4 completion:v6];
  }
  else
  {
    id v7 = (void (*)(void))*((void *)a4 + 2);
    id v8 = a4;
    v7();
  }
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v8 = a5;
    id v10 = [(ADLocationService *)self locationManager];
    [v10 updateAuthorizationStyleWithUserSelection:a3 timeout:v8 completion:a4];
  }
  else
  {
    id v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v6 = a4;
    id v8 = [(ADLocationService *)self locationManager];
    [v8 updateAuthorizationStyleWithUserSelection:a3 completion:v6];
  }
  else
  {
    id v7 = (void (*)(void))*((void *)a4 + 2);
    id v8 = a4;
    v7();
  }
}

- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v8 = a5;
    id v10 = [(ADLocationService *)self locationManager];
    [v10 requestTemporaryAccuracyAuthorizationWithStyle:a3 timeout:v8 completion:a4];
  }
  else
  {
    id v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v8 = a5;
    id v10 = [(ADLocationService *)self locationManager];
    [v10 requestAuthorizationWithStyle:a3 timeout:v8 completion:a4];
  }
  else
  {
    id v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)currentAuthorizationStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(ADLocationService *)self locationManager];
  [v5 currentAuthorizationStyle:v4];
}

- (void)dismissTCCDialogIfNeeded
{
  id v2 = [(ADLocationService *)self locationManager];
  [v2 dismissTCCDialogIfNeeded:0];
}

- (void)drainRequestsWithErrorCode:(int64_t)a3 clearLocationCache:(BOOL)a4 dismissDialog:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [(ADLocationService *)self locationManager];
  [v8 drainRequestsWithErrorCode:a3 clearLocationCache:v6 dismissDialog:v5];
}

- (ADLocationService)initWithDispatchQueue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[ADLocationManager alloc] initWithSerialQueue:v4];
  BOOL v6 = [(ADLocationService *)self initWithDispatchQueue:v4 locationManager:v5 isSiriLocationServicesPromptingEnabled:+[AFFeatureFlags isSiriLocationServicesPromptingEnabled]];

  return v6;
}

- (ADLocationService)initWithDispatchQueue:(id)a3 locationManager:(id)a4 isSiriLocationServicesPromptingEnabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ADLocationService;
  v11 = [(ADLocationService *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_isSiriLocationServicesPromptingEnabled = a5;
    objc_storeStrong((id *)&v11->_dispatchQueue, a3);
    objc_storeStrong((id *)&v12->_locationManager, a4);
    [(ADLocationManager *)v12->_locationManager setDelegate:v12];
  }

  return v12;
}

+ (id)sharedService
{
  if (qword_100585F38 != -1) {
    dispatch_once(&qword_100585F38, &stru_100507568);
  }
  id v2 = (void *)qword_100585F40;
  return v2;
}

@end