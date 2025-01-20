@interface PHLocationFinder
+ (void)findLocationWithBundle:(id)a3 completion:(id)a4;
- (PHLocationFinder)initWithBundle:(id)a3;
- (void)_timerFired;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PHLocationFinder

- (PHLocationFinder)initWithBundle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHLocationFinder;
  v5 = [(PHLocationFinder *)&v9 init];
  if (v5)
  {
    v6 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundle:v4];
    locationManager = v5->_locationManager;
    v5->_locationManager = v6;

    [(CLLocationManager *)v5->_locationManager setDelegate:v5];
    [(CLLocationManager *)v5->_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
  }

  return v5;
}

- (void)dealloc
{
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  [(PCPersistentTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHLocationFinder;
  [(PHLocationFinder *)&v3 dealloc];
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = a3;
  id completionHandler = self->_completionHandler;
  id v8 = v4;
  if (completionHandler)
  {
    self->_id completionHandler = 0;

    id v4 = v8;
  }
  if (v4)
  {
    id v6 = [v8 copy];
    id v7 = self->_completionHandler;
    self->_id completionHandler = v6;

    id v4 = v8;
  }
}

- (void)start
{
  if ([(CLLocationManager *)self->_locationManager locationServicesAvailable])
  {
    [(CLLocationManager *)self->_locationManager startUpdatingLocationWithPrompt];
    [(PCPersistentTimer *)self->_timer invalidate];
    objc_super v3 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"com.apple.TelephonyUtilities.PHLocationFinder" serviceIdentifier:self target:"_timerFired" selector:0 userInfo:10.0];
    timer = self->_timer;
    self->_timer = v3;

    v5 = +[NSRunLoop currentRunLoop];

    id v6 = self->_timer;
    if (v5) {
      +[NSRunLoop currentRunLoop];
    }
    else {
    id v8 = +[NSRunLoop mainRunLoop];
    }
    [(PCPersistentTimer *)v6 scheduleInRunLoop:v8];
  }
  else
  {
    id v7 = (void (*)(void))*((void *)self->_completionHandler + 2);
    v7();
  }
}

- (void)stop
{
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  [(PCPersistentTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_timerFired
{
  id v3 = [(CLLocationManager *)self->_locationManager location];
  (*((void (**)(void))self->_completionHandler + 2))();
  [(PHLocationFinder *)self stop];
}

+ (void)findLocationWithBundle:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100325E70 != -1) {
    dispatch_once(&qword_100325E70, &stru_1002CE320);
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1000497CC;
  v19 = sub_1000497DC;
  v20 = [[PHLocationFinder alloc] initWithBundle:v5];
  [(id)qword_100325E78 addObject:v16[5]];
  objc_super v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1000497E4;
  v12 = &unk_1002CE348;
  id v7 = v6;
  id v13 = v7;
  v14 = &v15;
  id v8 = objc_retainBlock(&v9);
  [v16[5] setCompletionHandler:v8, v9, v10, v11, v12];
  [(id)v16[5] start];

  _Block_object_dispose(&v15, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end