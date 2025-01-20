@interface _UIScreenRouteArrayController
- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4;
- (_UIScreenRouteArrayController)initWithDelegate:(id)a3;
- (int)pid;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_teardownBlockDidFireWithBackgroundTask:(unint64_t)a3;
- (void)armTimer;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleTeardownEndingBackgroundTask:(unint64_t)a3;
- (void)selectRoute:(id)a3;
- (void)setPid:(int)a3;
- (void)updateDevices;
@end

@implementation _UIScreenRouteArrayController

- (_UIScreenRouteArrayController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UIScreenRouteArrayController;
  id v5 = [(_UIScreenRouteArrayController *)&v24 initWithDelegate:v4];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("screen route update queue", 0);
    v7 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v6;

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v5 + 5));
    v9 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v8;

    objc_initWeak(&location, v5);
    v10 = *((void *)v5 + 4);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003974;
    handler[3] = &unk_100008278;
    v11 = (id *)v5;
    v21 = v11;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v10, handler);
    v12 = +[NSSortDescriptor sortDescriptorWithKey:@"sortTitle" ascending:1 comparator:&stru_1000082B8];
    v25 = v12;
    v13 = +[NSArray arrayWithObjects:&v25 count:1];
    [v11 setSortDescriptors:v13];

    v14 = +[NSNotificationCenter defaultCenter];
    id v15 = [objc_alloc((Class)AVOutputDeviceDiscoverySession) initWithDeviceFeatures:2];
    id v16 = v11[1];
    v11[1] = v15;

    [v11[1] setDiscoveryMode:2];
    uint64_t v17 = +[AVOutputContext outputContext];
    id v18 = v11[2];
    v11[2] = (id)v17;

    [v14 addObserver:v11 selector:"availableOutputDevicesDidChange:" name:AVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification object:v11[1]];
    [v11 armTimer];
    [v14 addObserver:v11 selector:"_applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];
    [v14 addObserver:v11 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return (_UIScreenRouteArrayController *)v5;
}

- (void)_applicationWillResignActive:(id)a3
{
}

- (void)_applicationDidBecomeActive:(id)a3
{
}

- (void)invalidate
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [UIApp _beginBackgroundTaskWithName:@"discovery invalidation" expirationHandler:0];

  [(_UIScreenRouteArrayController *)self scheduleTeardownEndingBackgroundTask:v4];
}

- (void)_teardownBlockDidFireWithBackgroundTask:(unint64_t)a3
{
  id v5 = +[NSDate date];
  id v6 = [v5 compare:self->_discoveryShutdownDate];

  discoveryShutdownDate = self->_discoveryShutdownDate;
  if (v6 == (id)-1)
  {
    [(NSDate *)discoveryShutdownDate timeIntervalSinceNow];
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)((v9 + 0.1) * 1000000000.0));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003C44;
    v11[3] = &unk_1000082E0;
    v11[4] = self;
    v11[5] = a3;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
  else
  {
    self->_discoveryShutdownDate = 0;

    [(AVOutputDeviceDiscoverySession *)self->_outputDevices setDiscoveryMode:0];
    dispatch_source_t v8 = (void *)UIApp;
    [v8 endBackgroundTask:a3];
  }
}

- (void)scheduleTeardownEndingBackgroundTask:(unint64_t)a3
{
  id v5 = self->_discoveryShutdownDate;
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:10.0];
  discoveryShutdownDate = self->_discoveryShutdownDate;
  self->_discoveryShutdownDate = v6;

  if (v5)
  {
    [UIApp endBackgroundTask:a3];
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, 10100000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003D44;
    v9[3] = &unk_1000082E0;
    v9[4] = self;
    v9[5] = a3;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
  }
}

- (void)setPid:(int)a3
{
}

- (int)pid
{
  return [(AVOutputContext *)self->_outputContext applicationProcessID];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(AVOutputDeviceDiscoverySession *)self->_outputDevices setDiscoveryMode:0];
  dispatch_source_cancel((dispatch_source_t)self->_updateSource);
  v4.receiver = self;
  v4.super_class = (Class)_UIScreenRouteArrayController;
  [(_UIScreenRouteArrayController *)&v4 dealloc];
}

- (void)armTimer
{
  updateQueue = self->_updateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003E78;
  block[3] = &unk_100008308;
  block[4] = self;
  dispatch_async((dispatch_queue_t)updateQueue, block);
}

- (void)updateDevices
{
  v3 = +[NSMutableArray array];
  objc_super v4 = [(AVOutputContext *)self->_outputContext outputDevice];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(AVOutputDeviceDiscoverySession *)self->_outputDevices availableOutputDevices];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        if (v4
          || ([*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) ID],
              v11 = objc_claimAutoreleasedReturnValue(),
              v11,
              v11))
        {
          v12 = [[_UIScreenRoute alloc] initWithDevice:v10];
          if ([v4 isEqual:v10]) {
            [(_UIScreenRoute *)v12 setSelected:1];
          }
          [v3 addObject:v12];
        }
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(_UIScreenRouteArrayController *)self processUpdate:v3 changedObjects:0];
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastUpdate = v13;
}

- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 sortTitle];
  uint64_t v8 = [v6 sortTitle];
  if ([v7 isEqual:v8])
  {
    unsigned int v9 = [v5 isSelected];
    unsigned int v10 = v9 ^ [v6 isSelected];
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)selectRoute:(id)a3
{
  id v4 = a3;
  id v5 = [UIApp _beginBackgroundTaskWithName:@"route selection" expirationHandler:0];
  id v6 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000042B8;
  block[3] = &unk_100008358;
  block[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v7 = v4;
  dispatch_async(v6, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryShutdownDate, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_updateSource, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);

  objc_storeStrong((id *)&self->_outputDevices, 0);
}

@end