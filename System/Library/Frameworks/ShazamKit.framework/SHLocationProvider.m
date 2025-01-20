@interface SHLocationProvider
+ (BOOL)isClientAuthorizedToRequestLocation:(id)a3 clientType:(int64_t)a4 authorizationStatus:(int)a5;
+ (NSMapTable)activeLocationProviders;
+ (OS_dispatch_queue)locationQueue;
+ (id)anonymizeCoordinatesPayloadForLocation:(id)a3 truncatingToDecimalPlaces:(signed __int16)a4;
+ (id)locationProviderForRequestIdentifier:(id)a3 clientType:(int64_t)a4;
- (CLLocation)location;
- (CLLocationManager)locationManager;
- (NSString)requestIdentifier;
- (NSUUID)taskID;
- (NSUUID)workerID;
- (SHLocationProvider)initWithRequestIdentifier:(id)a3;
- (SHWorkerDelegate)workerDelegate;
- (int64_t)executionScope;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setWorkerDelegate:(id)a3;
- (void)shutdownWorker;
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;
@end

@implementation SHLocationProvider

+ (OS_dispatch_queue)locationQueue
{
  if (qword_100090A88 != -1) {
    dispatch_once(&qword_100090A88, &stru_1000758F0);
  }
  v2 = (void *)qword_100090A80;

  return (OS_dispatch_queue *)v2;
}

+ (NSMapTable)activeLocationProviders
{
  if (qword_100090A98 != -1) {
    dispatch_once(&qword_100090A98, &stru_100075910);
  }
  v2 = (void *)qword_100090A90;

  return (NSMapTable *)v2;
}

+ (id)locationProviderForRequestIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10002C87C;
  v22 = sub_10002C88C;
  id v23 = 0;
  v6 = +[SHLocationProvider locationQueue];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10002C894;
  v15 = &unk_100074C58;
  v17 = &v18;
  id v7 = v5;
  id v16 = v7;
  dispatch_sync(v6, &v12);

  v8 = (void *)v19[5];
  if (v8)
  {
    v9 = v8;
LABEL_5:
    v10 = v9;
    goto LABEL_6;
  }
  if (+[SHLocationProvider isClientAuthorizedToRequestLocation:clientType:authorizationStatus:](SHLocationProvider, "isClientAuthorizedToRequestLocation:clientType:authorizationStatus:", @"com.apple.musicrecognition", a4, +[CLLocationManager authorizationStatusForBundleIdentifier:@"com.apple.musicrecognition", v12, v13, v14, v15]))
  {
    v9 = [[SHLocationProvider alloc] initWithRequestIdentifier:v7];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_6:

  _Block_object_dispose(&v18, 8);

  return v10;
}

- (SHLocationProvider)initWithRequestIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHLocationProvider;
  v6 = [(SHLocationProvider *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestIdentifier, a3);
    v8 = +[SHLocationProvider locationQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002CA00;
    v10[3] = &unk_100074FC0;
    v11 = v7;
    id v12 = v5;
    dispatch_sync(v8, v10);
  }
  return v7;
}

+ (BOOL)isClientAuthorizedToRequestLocation:(id)a3 clientType:(int64_t)a4 authorizationStatus:(int)a5
{
  return a4 == 1 && a5 > 2;
}

- (void)startUpdatingLocation
{
  v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(SHLocationProvider *)self requestIdentifier];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Fetching location for request %@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(SHLocationProvider *)self locationManager];
  [v5 startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
  v3 = [(SHLocationProvider *)self locationManager];
  [v3 stopUpdatingLocation];

  v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [(SHLocationProvider *)self requestIdentifier];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Stopped fetching location for request %@", (uint8_t *)&v6, 0xCu);
  }
}

- (CLLocation)location
{
  v2 = [(SHLocationProvider *)self locationManager];
  v3 = [v2 location];

  return (CLLocation *)v3;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a3;
  int v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(SHLocationProvider *)self requestIdentifier];
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "locationManager %@ didUpdateLocations for request %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sh_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [(SHLocationProvider *)self requestIdentifier];
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    objc_super v13 = v9;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Location manager %@ failed to update for request %@ with error %@", (uint8_t *)&v10, 0x20u);
  }
}

+ (id)anonymizeCoordinatesPayloadForLocation:(id)a3 truncatingToDecimalPlaces:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc((Class)NSDecimalNumber);
  [v5 coordinate];
  id v7 = objc_msgSend(v6, "initWithDouble:");
  id v8 = objc_alloc((Class)NSDecimalNumber);
  [v5 coordinate];
  double v10 = v9;

  id v11 = [v8 initWithDouble:v10];
  __int16 v12 = +[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:0 scale:v4 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  v17[0] = @"latitude";
  objc_super v13 = [v7 decimalNumberByRoundingAccordingToBehavior:v12];
  v17[1] = @"longitude";
  v18[0] = v13;
  __int16 v14 = [v11 decimalNumberByRoundingAccordingToBehavior:v12];
  v18[1] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v15;
}

- (int64_t)executionScope
{
  return 0;
}

- (NSUUID)workerID
{
  workerID = self->_workerID;
  if (!workerID)
  {
    uint64_t v4 = +[NSUUID UUID];
    id v5 = self->_workerID;
    self->_workerID = v4;

    workerID = self->_workerID;
  }

  return workerID;
}

- (NSUUID)taskID
{
  taskID = self->_taskID;
  if (!taskID)
  {
    uint64_t v4 = +[NSUUID UUID];
    id v5 = self->_taskID;
    self->_taskID = v4;

    taskID = self->_taskID;
  }

  return taskID;
}

- (void)shutdownWorker
{
  [(SHLocationProvider *)self stopUpdatingLocation];
  id v3 = [(SHLocationProvider *)self workerDelegate];
  [v3 finishedWorker:self];
}

- (SHWorkerDelegate)workerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workerDelegate);

  return (SHWorkerDelegate *)WeakRetained;
}

- (void)setWorkerDelegate:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_workerID, 0);

  objc_destroyWeak((id *)&self->_workerDelegate);
}

@end