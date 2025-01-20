@interface APUIRouteManager
+ (unint64_t)discoveryFeatures:(BOOL)a3;
- (APUIRouteManager)init;
- (void)_addOutputDeviceToSystemMusicContext:(id)a3 authString:(id)a4 completion:(id)a5;
- (void)_createSilentConnectionToDevice:(id)a3 authString:(id)a4 completion:(id)a5;
- (void)_pickRouteWithID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6;
- (void)invalidate;
- (void)pickRouteWithRouteID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6;
- (void)session:(id)a3 didSpotOnLocationComplete:(id)a4;
- (void)startIntelligentRoutingLocationSensing;
@end

@implementation APUIRouteManager

- (APUIRouteManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)APUIRouteManager;
  v2 = [(APUIRouteManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("APUIRouteManager.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("APUIRouteManager.notification", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    if (APSSettingsIsFeatureEnabled())
    {
      dispatch_queue_t v7 = dispatch_queue_create("APUIRouteManager.intelligentRouting", 0);
      irQueue = v2->_irQueue;
      v2->_irQueue = (OS_dispatch_queue *)v7;
    }
  }
  if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v2;
}

- (void)invalidate
{
  [(IRSession *)self->_irSession setDelegate:0];
  irSession = self->_irSession;

  [(IRSession *)irSession invalidate];
}

- (void)_pickRouteWithID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [objc_alloc((Class)AVOutputDeviceDiscoverySession) initWithDeviceFeatures:[objc_opt_class() discoveryFeatures:v7]];
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_100002F54;
  v43 = sub_100002F64;
  id v44 = 0;
  v15 = +[NSNotificationCenter defaultCenter];
  uint64_t v16 = AVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100002F6C;
  v34[3] = &unk_100018520;
  v34[4] = self;
  id v17 = v13;
  id v35 = v17;
  v18 = (__CFString *)v10;
  v36 = v18;
  v38 = &v39;
  v19 = v14;
  v37 = v19;
  v20 = [v15 addObserverForName:v16 object:v17 queue:0 usingBlock:v34];

  [v17 setDiscoveryMode:2];
  dispatch_time_t v21 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v19, v21))
  {
    if (dword_10001E9D8 <= 90 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
    {
      if (v18 && !IsAppleInternalBuild()) {
        CFStringRef v22 = @"#Redacted#";
      }
      else {
        CFStringRef v22 = v18;
      }
      CFStringRef v27 = v22;
      uint64_t v28 = 3;
      v26 = self;
      LogPrintF();
    }
    if (v12)
    {
      notificationQueue = self->_notificationQueue;
      block = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      v31 = sub_1000035B0;
      v32 = &unk_100018548;
      id v33 = v12;
      dispatch_async((dispatch_queue_t)notificationQueue, &block);
    }
  }
  else
  {
    uint64_t v23 = v40[5];
    if (v7) {
      [(APUIRouteManager *)self _createSilentConnectionToDevice:v23 authString:v11 completion:v12];
    }
    else {
      [(APUIRouteManager *)self _addOutputDeviceToSystemMusicContext:v23 authString:v11 completion:v12];
    }
  }
  v25 = +[NSNotificationCenter defaultCenter];
  [v25 removeObserver:v20];

  [v17 setDiscoveryMode:0];
  _Block_object_dispose(&v39, 8);
}

- (void)pickRouteWithRouteID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
  {
    if (v10) {
      IsAppleInternalBuild();
    }
    LogPrintF();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000037B8;
  block[3] = &unk_100018570;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_addOutputDeviceToSystemMusicContext:(id)a3 authString:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSMutableDictionary dictionary];
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:AVOutputContextAddOutputDeviceOptionCancelIfAuthRequired];
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:AVOutputContextAddOutputDeviceOptionAuthorizationToken];
  }
  if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
  {
    id v12 = [v8 deviceID];
    if (v12 && !IsAppleInternalBuild())
    {
      id v16 = self;
      id v17 = @"#Redacted#";
      LogPrintF();
    }
    else
    {
      [v8 deviceID];
      id v16 = self;
      id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }
  id v13 = +[AVOutputContext sharedAudioPresentationOutputContext];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000039E0;
  v18[3] = &unk_1000185C0;
  v18[4] = self;
  id v19 = v8;
  id v20 = v10;
  id v14 = v10;
  id v15 = v8;
  [v13 addOutputDevice:v15 options:v11 completionHandler:v18];
}

- (void)_createSilentConnectionToDevice:(id)a3 authString:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSMutableDictionary dictionary];
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:AVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired];
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:AVOutputContextAddOutputDeviceOptionAuthorizationToken];
  }
  uint64_t v12 = AVOutputDeviceCommunicationChannelDataDestinationFitness;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003E8C;
  v15[3] = &unk_1000185E8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v13 = v10;
  id v14 = v8;
  [v14 openCommunicationChannelToDestination:v12 options:v11 completionHandler:v15];
}

- (void)session:(id)a3 didSpotOnLocationComplete:(id)a4
{
  id v11 = a3;
  v6 = (NSError *)a4;
  if (v6) {
    int v7 = 50;
  }
  else {
    int v7 = 90;
  }
  if (v7 >= dword_10001E9D8 && (dword_10001E9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = self;
  objc_sync_enter(v8);
  spotOnLocationError = v8->_spotOnLocationError;
  v8->_spotOnLocationError = v6;
  id v10 = v6;

  objc_sync_exit(v8);
  dispatch_semaphore_signal((dispatch_semaphore_t)v8->_spotOnLocationSemaphore);
}

- (void)startIntelligentRoutingLocationSensing
{
  if (APSSettingsIsFeatureEnabled())
  {
    uint64_t v3 = +[IRServiceToken serviceTokenForServiceIdentifier:@"com.apple.mediaremoted"];
    if (v3)
    {
      v4 = (void *)v3;
      id v5 = [objc_alloc((Class)IRConfiguration) initWithServiceToken:v3];
      [v5 setMode:0];
      v6 = (IRSession *)objc_alloc_init((Class)IRSession);
      irSession = self->_irSession;
      self->_irSession = v6;

      [(IRSession *)self->_irSession setDelegate:self];
      [(IRSession *)self->_irSession runWithConfiguration:v5];
      id v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      spotOnLocationSemaphore = self->_spotOnLocationSemaphore;
      self->_spotOnLocationSemaphore = v8;

      id v10 = objc_alloc_init((Class)IRSessionSpotOnLocationParameters);
      [v10 setResetAllBrokerDiscoveredCandidates:1];
      if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v12 = self;
        id v13 = self->_irSession;
        LogPrintF();
      }
      -[IRSession setSpotOnLocationWithParameters:](self->_irSession, "setSpotOnLocationWithParameters:", v10, v12, v13);
      irQueue = self->_irQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000045A8;
      block[3] = &unk_100018610;
      block[4] = self;
      dispatch_async((dispatch_queue_t)irQueue, block);

      goto LABEL_14;
    }
    APSLogErrorAt();
    if (dword_10001E9D8 > 90)
    {
      v4 = 0;
      id v5 = 0;
      goto LABEL_18;
    }
    if (dword_10001E9D8 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  id v5 = 0;
  v4 = 0;
LABEL_14:
  if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_18:
}

+ (unint64_t)discoveryFeatures:(BOOL)a3
{
  if (a3) {
    return 8;
  }
  else {
    return 5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irSession, 0);
  objc_storeStrong((id *)&self->_spotOnLocationError, 0);
  objc_storeStrong((id *)&self->_spotOnLocationSemaphore, 0);
  objc_storeStrong((id *)&self->_irQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end