@interface MapsSiriIPCInterface
+ (id)sharedInterface;
- (BOOL)isMapsBackgroundTaskSuspended;
- (void)_configureIncomingConnection:(id)a3;
- (void)_startMapsAppStateMonitor;
- (void)endNavigationWithCompletion:(id)a3;
- (void)establishConnection;
- (void)getGuidanceState:(id)a3 completion:(id)a4;
- (void)handleTrafficeReroute:(id)a3 completion:(id)a4;
- (void)repeatLastGuidanceInstructionWithCompletion:(id)a3;
- (void)repeatLastReroutePromptWithCompletion:(id)a3;
- (void)setNavigationMuted:(id)a3 completion:(id)a4;
- (void)setNavigationVoiceVolume:(id)a3 completion:(id)a4;
@end

@implementation MapsSiriIPCInterface

+ (id)sharedInterface
{
  if (qword_55CF8 != -1) {
    dispatch_once(&qword_55CF8, &stru_30C18);
  }
  v2 = (void *)qword_55CF0;

  return v2;
}

- (void)_configureIncomingConnection:(id)a3
{
  id v4 = a3;
  [v4 setExportedObject:self];
  v5 = +[NSXPCInterface _maps_mapsSiriXPCClientInterface];
  [v4 setExportedInterface:v5];

  id v6 = +[NSXPCInterface _maps_mapsSiriXPCInterface];
  [v4 setRemoteObjectInterface:v6];
}

- (void)handleTrafficeReroute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messagingQueue = self->super.super._messagingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9E9C;
  block[3] = &unk_30C40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)messagingQueue, block);
}

- (void)endNavigationWithCompletion:(id)a3
{
  id v4 = a3;
  messagingQueue = self->super.super._messagingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9F98;
  v7[3] = &unk_30BA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)messagingQueue, v7);
}

- (void)getGuidanceState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messagingQueue = self->super.super._messagingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A0C0;
  block[3] = &unk_30C40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)messagingQueue, block);
}

- (void)repeatLastReroutePromptWithCompletion:(id)a3
{
  id v4 = a3;
  messagingQueue = self->super.super._messagingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A1BC;
  v7[3] = &unk_30BA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)messagingQueue, v7);
}

- (void)repeatLastGuidanceInstructionWithCompletion:(id)a3
{
  id v4 = a3;
  messagingQueue = self->super.super._messagingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A2B8;
  v7[3] = &unk_30BA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)messagingQueue, v7);
}

- (void)setNavigationMuted:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messagingQueue = self->super.super._messagingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A3E0;
  block[3] = &unk_30C40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)messagingQueue, block);
}

- (void)setNavigationVoiceVolume:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messagingQueue = self->super.super._messagingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A57C;
  block[3] = &unk_30C40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)messagingQueue, block);
}

- (void)_startMapsAppStateMonitor
{
  id v3 = objc_alloc((Class)BKSApplicationStateMonitor);
  uint64_t v7 = MapsAppBundleId;
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = (BKSApplicationStateMonitor *)[v3 initWithBundleIDs:v4 states:BKSApplicationStateAll];
  applicationStateMonitor = self->_applicationStateMonitor;
  self->_applicationStateMonitor = v5;
}

- (BOOL)isMapsBackgroundTaskSuspended
{
  return [(BKSApplicationStateMonitor *)self->_applicationStateMonitor applicationStateForApplication:@"com.apple.Maps"] == 2;
}

- (void)establishConnection
{
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"[MapsSiriIPCInterface]: Received establish connection message.", v2, v3, v4, v5, v6, v7, v8);
}

- (void).cxx_destruct
{
}

@end