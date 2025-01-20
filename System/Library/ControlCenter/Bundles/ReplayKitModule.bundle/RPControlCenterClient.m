@interface RPControlCenterClient
+ (RPControlCenterClient)sharedInstance;
+ (void)getSystemBroadcastExtensionInfo:(id)a3;
- (BOOL)broadcastMode;
- (BOOL)cameraOn;
- (BOOL)isAvailableAndInitialized;
- (BOOL)isCountingDown;
- (BOOL)isInitialized;
- (BOOL)lockUIControls;
- (BOOL)microphoneOn;
- (BOOL)recordingOn;
- (BOOL)screenRecordingSupportedOnDevice;
- (BOOL)shouldShowMicButton;
- (NSString)currentTimerString;
- (NSString)extensionBundleID;
- (NSString)preferredExtension;
- (RPControlCenterClient)init;
- (id)imageForBundleID:(id)a3 extensionInfo:(id)a4;
- (void)addDegate:(id)a3;
- (void)broadcastController:(id)a3 didFinishWithError:(id)a4;
- (void)broadcastController:(id)a3 didUpdateBroadcastURL:(id)a4;
- (void)broadcastController:(id)a3 didUpdateServiceInfo:(id)a4;
- (void)callDelegate:(id)a3;
- (void)cancelRecordingCountdown;
- (void)countdownInterruptWithStatus:(id)a3;
- (void)dealloc;
- (void)extensionWithBundleIDExists:(id)a3 handler:(id)a4;
- (void)getSystemBroadcastPickerInfo;
- (void)loadAvailableExtensionsWithHandler:(id)a3;
- (void)notifyClientDelegatesStart:(BOOL)a3;
- (void)recordingTimerDidUpdate:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)replayKitAngelDisconnected;
- (void)resetBroadcastPickerPreferredExt;
- (void)screenRecorder:(id)a3 didStopRecordingWithPreviewViewController:(id)a4 error:(id)a5;
- (void)screenRecorderDidChangeAvailability:(id)a3;
- (void)screenRecorderDidUpdateState:(id)a3;
- (void)setBroadcastMode:(BOOL)a3;
- (void)setCameraOn:(BOOL)a3;
- (void)setCountdown:(id)a3;
- (void)setCurrentTimerString:(id)a3;
- (void)setExtensionBundleID:(id)a3;
- (void)setMicrophoneOn:(BOOL)a3;
- (void)setPreferredExtension:(id)a3;
- (void)setUpFrontBoardServices;
- (void)showRecordingBanner;
- (void)startBroadcastWithBroadcastController:(id)a3 handler:(id)a4;
- (void)startBroadcastWithExtensionBundleID:(id)a3 handler:(id)a4;
- (void)startBroadcastWithHandler:(id)a3;
- (void)startRecordingCountdown;
- (void)startRecordingWithHandler:(id)a3;
- (void)stopCurrentSession;
- (void)stopCurrentSession:(id)a3;
- (void)stopRecordingCalled;
- (void)stopSystemRecordingWithHandler:(id)a3;
- (void)terminateAngelRecordingSession;
- (void)updateClientState;
- (void)updateStatusIsCountingDown:(BOOL)a3 IsRecording:(BOOL)a4;
@end

@implementation RPControlCenterClient

+ (RPControlCenterClient)sharedInstance
{
  if (qword_23F18 != -1) {
    dispatch_once(&qword_23F18, &stru_1C448);
  }
  v2 = (void *)qword_23F10;

  return (RPControlCenterClient *)v2;
}

- (RPControlCenterClient)init
{
  v20.receiver = self;
  v20.super_class = (Class)RPControlCenterClient;
  v2 = [(RPControlCenterClient *)&v20 init];
  if (v2)
  {
    uint64_t v3 = +[NSPointerArray weakObjectsPointerArray];
    delegates = v2->_delegates;
    v2->_delegates = (NSPointerArray *)v3;

    currentTimerString = v2->_currentTimerString;
    v2->_currentTimerString = 0;

    v2->_isInitialized = 0;
    uint64_t v6 = +[RPScreenRecorder sharedRecorder];
    screenRecorder = v2->_screenRecorder;
    v2->_screenRecorder = (RPScreenRecorder *)v6;

    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v2->_screenRecorder;
      *(_DWORD *)buf = 136446978;
      v22 = "-[RPControlCenterClient init]";
      __int16 v23 = 1024;
      int v24 = 70;
      __int16 v25 = 2048;
      v26 = v2;
      __int16 v27 = 2048;
      v28 = v8;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPControlCenterClient=%p RPScreenRecorder=%p", buf, 0x26u);
    }
    [(RPScreenRecorder *)v2->_screenRecorder setDelegate:v2];
    [(RPScreenRecorder *)v2->_screenRecorder setPrivateDelegate:v2];
    [(RPScreenRecorder *)v2->_screenRecorder setSystemRecording:1];
    v9 = (RPBroadcastController *)[objc_alloc((Class)RPBroadcastController) initWithCurrentSession];
    broadcastController = v2->_broadcastController;
    v2->_broadcastController = v9;

    [(RPBroadcastController *)v2->_broadcastController setDelegate:v2];
    v2->_microphoneOn = [(RPScreenRecorder *)v2->_screenRecorder isMicrophoneEnabled];
    extensionBundleID = v2->_extensionBundleID;
    v2->_extensionBundleID = (NSString *)@"com.apple.replaykit.recordToCameraRoll";

    v2->_broadcastMode = 0;
    [(RPControlCenterClient *)v2 updateStatusIsCountingDown:0 IsRecording:[(RPScreenRecorder *)v2->_screenRecorder isRecording]];
    uint64_t v12 = +[NSDate distantPast];
    pickerInfoCacheTime = v2->_pickerInfoCacheTime;
    v2->_pickerInfoCacheTime = (NSDate *)v12;

    uint64_t v14 = +[NSDate distantPast];
    extensionCacheTime = v2->_extensionCacheTime;
    v2->_extensionCacheTime = (NSDate *)v14;

    uint64_t v16 = objc_opt_new();
    iconImageCache = v2->_iconImageCache;
    v2->_iconImageCache = (NSDictionary *)v16;

    v2->_countdownPaused = 0;
    countdownState = v2->_countdownState;
    v2->_countdownState = (NSString *)@"Countdown3";

    [(RPControlCenterClient *)v2 setUpFrontBoardServices];
  }
  return v2;
}

- (void)dealloc
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "-[RPControlCenterClient dealloc]";
    __int16 v10 = 1024;
    int v11 = 94;
    __int16 v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  delegates = self->_delegates;
  self->_delegates = 0;

  broadcastController = self->_broadcastController;
  self->_broadcastController = 0;

  [(RPScreenRecorder *)self->_screenRecorder setDelegate:0];
  [(RPScreenRecorder *)self->_screenRecorder setPrivateDelegate:0];
  screenRecorder = self->_screenRecorder;
  self->_screenRecorder = 0;

  layoutMonitor = self->_layoutMonitor;
  if (layoutMonitor) {
    [(FBSDisplayLayoutMonitor *)layoutMonitor invalidate];
  }
  v7.receiver = self;
  v7.super_class = (Class)RPControlCenterClient;
  [(RPControlCenterClient *)&v7 dealloc];
}

- (void)addDegate:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446978;
    uint64_t v6 = "-[RPControlCenterClient addDegate:]";
    __int16 v7 = 1024;
    int v8 = 108;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2048;
    id v12 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p delegate=%p", (uint8_t *)&v5, 0x26u);
  }
  [(NSPointerArray *)self->_delegates addPointer:v4];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446978;
    __int16 v9 = "-[RPControlCenterClient removeDelegate:]";
    __int16 v10 = 1024;
    int v11 = 113;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2048;
    id v15 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p delegate=%p", (uint8_t *)&v8, 0x26u);
  }
  NSUInteger v5 = [(NSPointerArray *)self->_delegates count];
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = 0;
    while ([(NSPointerArray *)self->_delegates pointerAtIndex:v7] != v4)
    {
      if (v6 == ++v7) {
        goto LABEL_10;
      }
    }
    [(NSPointerArray *)self->_delegates removePointerAtIndex:v7];
  }
LABEL_10:
}

- (void)callDelegate:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  NSUInteger v5 = [(NSPointerArray *)self->_delegates allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      __int16 v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_4368;
        v12[3] = &unk_1C470;
        id v11 = v4;
        v12[4] = v10;
        id v13 = v11;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

        __int16 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)setUpFrontBoardServices
{
  uint64_t v3 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v4 = [v3 alwaysOnDisplayEnabled];

  if (v4)
  {
    NSUInteger v5 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    [v5 setNeedsUserInteractivePriority:1];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4464;
    v8[3] = &unk_1C4C0;
    v8[4] = self;
    [v5 setTransitionHandler:v8];
    id v6 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v5];
    layoutMonitor = self->_layoutMonitor;
    self->_layoutMonitor = v6;
  }
}

- (void)loadAvailableExtensionsWithHandler:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v9 = "-[RPControlCenterClient loadAvailableExtensionsWithHandler:]";
    __int16 v10 = 1024;
    int v11 = 159;
    __int16 v12 = 2048;
    id v13 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_47D8;
  v6[3] = &unk_1C510;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)getSystemBroadcastPickerInfo
{
  [(NSDate *)self->_pickerInfoCacheTime timeIntervalSinceNow];
  double v4 = v3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v10 = "-[RPControlCenterClient getSystemBroadcastPickerInfo]";
    __int16 v11 = 1024;
    int v12 = 181;
    __int16 v13 = 2048;
    long long v14 = *(RPControlCenterClient **)&v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d time since cache = %f", buf, 0x1Cu);
  }
  if (v4 >= -0.5)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v10 = "-[RPControlCenterClient getSystemBroadcastPickerInfo]";
      __int16 v11 = 1024;
      int v12 = 192;
      __int16 v13 = 2048;
      long long v14 = self;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p get cached _preferredExtension and _shouldShowMicButton", buf, 0x1Cu);
    }
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v10 = "-[RPControlCenterClient getSystemBroadcastPickerInfo]";
      __int16 v11 = 1024;
      int v12 = 184;
      __int16 v13 = 2048;
      long long v14 = self;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p fetching new copy of system broadcast picker info", buf, 0x1Cu);
    }
    id v5 = +[NSDate now];
    pickerInfoCacheTime = self->_pickerInfoCacheTime;
    self->_pickerInfoCacheTime = v5;

    id v7 = +[RPDaemonProxy daemonProxy];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4E28;
    v8[3] = &unk_1C538;
    v8[4] = self;
    [v7 getSystemBroadcastPickerInfo:v8];
  }
}

+ (void)getSystemBroadcastExtensionInfo:(id)a3
{
  id v3 = a3;
  double v4 = +[RPDaemonProxy daemonProxy];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4FFC;
  v6[3] = &unk_1C560;
  id v7 = v3;
  id v5 = v3;
  [v4 getSystemBroadcastExtensionInfo:v6];
}

- (void)resetBroadcastPickerPreferredExt
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    double v4 = "-[RPControlCenterClient resetBroadcastPickerPreferredExt]";
    __int16 v5 = 1024;
    int v6 = 203;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  v2 = +[RPDaemonProxy daemonProxy];
  [v2 setBroadcastPickerPreferredExt:0 showsMicButton:1];
}

- (void)startBroadcastWithBroadcastController:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    long long v14 = "-[RPControlCenterClient startBroadcastWithBroadcastController:handler:]";
    __int16 v15 = 1024;
    int v16 = 208;
    __int16 v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  objc_storeStrong((id *)&self->_broadcastController, a3);
  if (v7)
  {
    [(RPBroadcastController *)self->_broadcastController setDelegate:self];
    broadcastController = self->_broadcastController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_52B4;
    v11[3] = &unk_1C588;
    id v12 = v8;
    [(RPBroadcastController *)broadcastController startSystemBroadcastWithHandler:v11];
    __int16 v10 = v12;
LABEL_8:

    goto LABEL_9;
  }
  if (v8)
  {
    __int16 v10 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v10);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)startBroadcastWithExtensionBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v15 = "-[RPControlCenterClient startBroadcastWithExtensionBundleID:handler:]";
    __int16 v16 = 1024;
    int v17 = 225;
    __int16 v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  if ([(RPScreenRecorder *)self->_screenRecorder isAvailable])
  {
    screenRecorder = self->_screenRecorder;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_549C;
    v10[3] = &unk_1C5B0;
    id v11 = v6;
    id v12 = self;
    id v13 = v7;
    [(RPScreenRecorder *)screenRecorder setupSystemBroadcastWithExtension:v11 handler:v10];

    __int16 v9 = v11;
LABEL_8:

    goto LABEL_9;
  }
  if (v7)
  {
    __int16 v9 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)extensionWithBundleIDExists:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v15 = "-[RPControlCenterClient extensionWithBundleIDExists:handler:]";
    __int16 v16 = 1024;
    int v17 = 245;
    __int16 v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  id v8 = objc_opt_class();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5684;
  v11[3] = &unk_1C4E8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getSystemBroadcastExtensionInfo:v11];
}

- (void)updateStatusIsCountingDown:(BOOL)a3 IsRecording:(BOOL)a4
{
  self->_BOOL isCountingDown = a3;
  self->_BOOL recordingOn = a4;
  self->_BOOL lockUIControls = a3 || a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCountingDown = self->_isCountingDown;
    BOOL recordingOn = self->_recordingOn;
    BOOL lockUIControls = self->_lockUIControls;
    int v10 = 136447490;
    id v11 = "-[RPControlCenterClient updateStatusIsCountingDown:IsRecording:]";
    __int16 v12 = 1024;
    int v13 = 262;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 1024;
    BOOL v17 = isCountingDown;
    __int16 v18 = 1024;
    BOOL v19 = recordingOn;
    __int16 v20 = 1024;
    BOOL v21 = lockUIControls;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p isCountingDown=%d recordingOn=%d lockUIControls=%d", (uint8_t *)&v10, 0x2Eu);
  }
  if (!a3)
  {
    self->_countdownPaused = 0;
    countdownState = self->_countdownState;
    self->_countdownState = (NSString *)@"Countdown3";
  }
}

- (void)notifyClientDelegatesStart:(BOOL)a3
{
  if (a3)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      int v10 = "-[RPControlCenterClient notifyClientDelegatesStart:]";
      __int16 v11 = 1024;
      int v12 = 273;
      __int16 v13 = 2048;
      __int16 v14 = self;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p is starting", buf, 0x1Cu);
    }
    double v4 = (void ***)v8;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    __int16 v5 = sub_5AE0;
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      int v10 = "-[RPControlCenterClient notifyClientDelegatesStart:]";
      __int16 v11 = 1024;
      int v12 = 280;
      __int16 v13 = 2048;
      __int16 v14 = self;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p failed to start", buf, 0x1Cu);
    }
    double v4 = &v6;
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    __int16 v5 = sub_5C0C;
  }
  v4[2] = (void **)v5;
  v4[3] = (void **)&unk_1C5D8;
  v4[4] = (void **)&self->super.isa;
  -[RPControlCenterClient callDelegate:](self, "callDelegate:", v6, v7);
}

- (void)startRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v10 = "-[RPControlCenterClient startRecordingWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 290;
    __int16 v13 = 2048;
    __int16 v14 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  self->_broadcastMode = 0;
  if (!self->_recordingOn)
  {
    screenRecorder = self->_screenRecorder;
    BOOL v6 = [(RPScreenRecorder *)screenRecorder isMicrophoneEnabled];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_5EA8;
    v7[3] = &unk_1C628;
    v7[4] = self;
    id v8 = v4;
    [(RPScreenRecorder *)screenRecorder startSystemRecordingWithMicrophoneEnabled:v6 handler:v7];
  }
}

- (void)startBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v12 = "-[RPControlCenterClient startBroadcastWithHandler:]";
    __int16 v13 = 1024;
    int v14 = 325;
    __int16 v15 = 2048;
    __int16 v16 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  self->_broadcastMode = 0;
  if (![(NSString *)self->_extensionBundleID isEqualToString:@"com.apple.replaykit.recordToCameraRoll"])
  {
    extensionBundleID = self->_extensionBundleID;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_6424;
    v10[3] = &unk_1C650;
    void v10[4] = self;
    [(RPControlCenterClient *)self extensionWithBundleIDExists:extensionBundleID handler:v10];
  }
  BOOL v6 = self->_extensionBundleID;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6484;
  v8[3] = &unk_1C678;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(RPControlCenterClient *)self startBroadcastWithExtensionBundleID:v6 handler:v8];
}

- (void)stopCurrentSession:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v12 = "-[RPControlCenterClient stopCurrentSession:]";
    __int16 v13 = 1024;
    int v14 = 366;
    __int16 v15 = 2048;
    __int16 v16 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  if (self->_broadcastMode)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      int v12 = "-[RPControlCenterClient stopCurrentSession:]";
      __int16 v13 = 1024;
      int v14 = 386;
      __int16 v15 = 2048;
      __int16 v16 = self;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p Stopping system broadcast", buf, 0x1Cu);
    }
    broadcastController = self->_broadcastController;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_6C38;
    v7[3] = &unk_1C628;
    v7[4] = self;
    id v8 = v4;
    [(RPBroadcastController *)broadcastController finishSystemBroadcastWithHandler:v7];
    BOOL v6 = v8;
    goto LABEL_15;
  }
  if (![(RPScreenRecorder *)self->_screenRecorder isRecording])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6B14;
    block[3] = &unk_1C510;
    block[4] = self;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    BOOL v6 = v10;
LABEL_15:

    goto LABEL_16;
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v12 = "-[RPControlCenterClient stopCurrentSession:]";
    __int16 v13 = 1024;
    int v14 = 371;
    __int16 v15 = 2048;
    __int16 v16 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p Stopping system recording", buf, 0x1Cu);
  }
  [(RPControlCenterClient *)self stopRecordingCalled];
  [(RPControlCenterClient *)self stopSystemRecordingWithHandler:v4];
LABEL_16:
}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v10 = "-[RPControlCenterClient stopSystemRecordingWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 403;
    __int16 v13 = 2048;
    int v14 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  screenRecorder = self->_screenRecorder;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6FB8;
  v7[3] = &unk_1C628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPScreenRecorder *)screenRecorder stopSystemRecording:v7];
}

- (void)setMicrophoneOn:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446978;
    id v6 = "-[RPControlCenterClient setMicrophoneOn:]";
    __int16 v7 = 1024;
    int v8 = 424;
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p microphoneOn=%d", (uint8_t *)&v5, 0x22u);
  }
  self->_microphoneOn = v3;
  [(RPScreenRecorder *)self->_screenRecorder setMicrophoneEnabled:v3];
}

- (void)setCameraOn:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446978;
    id v6 = "-[RPControlCenterClient setCameraOn:]";
    __int16 v7 = 1024;
    int v8 = 430;
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p cameraOn=%d", (uint8_t *)&v5, 0x22u);
  }
  self->_cameraOn = v3;
  [(RPScreenRecorder *)self->_screenRecorder setCameraEnabled:v3];
}

- (BOOL)screenRecordingSupportedOnDevice
{
  return [(RPScreenRecorder *)self->_screenRecorder screenRecordingSupportedOnDevice];
}

- (void)updateClientState
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v5 = "-[RPControlCenterClient updateClientState]";
    __int16 v6 = 1024;
    int v7 = 440;
    __int16 v8 = 2048;
    __int16 v9 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  [(RPControlCenterClient *)self getSystemBroadcastPickerInfo];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_7558;
  v3[3] = &unk_1C708;
  v3[4] = self;
  [(RPControlCenterClient *)self loadAvailableExtensionsWithHandler:v3];
}

- (BOOL)isAvailableAndInitialized
{
  unsigned int v3 = [(RPScreenRecorder *)self->_screenRecorder isAvailable];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isInitialized = self->_isInitialized;
    int v6 = 136446978;
    int v7 = "-[RPControlCenterClient isAvailableAndInitialized]";
    __int16 v8 = 1024;
    int v9 = 454;
    __int16 v10 = 1024;
    unsigned int v11 = v3;
    __int16 v12 = 1024;
    BOOL v13 = isInitialized;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d isAvailable %d isInitialized %d", (uint8_t *)&v6, 0x1Eu);
  }
  return v3 && self->_isInitialized;
}

- (void)setCountdown:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Countdown3"])
  {
    dispatch_time_t v5 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_796C;
    block[3] = &unk_1C498;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_79E8;
    v7[3] = &unk_1C750;
    v7[4] = self;
    id v8 = v4;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)startRecordingCountdown
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446722;
    id v8 = "-[RPControlCenterClient startRecordingCountdown]";
    __int16 v9 = 1024;
    int v10 = 497;
    __int16 v11 = 2048;
    __int16 v12 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v7, 0x1Cu);
  }
  unsigned int v3 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v4 = [v3 systemBannerEnabled];

  if (v4)
  {
    dispatch_time_t v5 = +[RPControlCenterAngelProxy sharedInstance];
    [v5 setDelegate:self];

    dispatch_time_t v6 = +[RPControlCenterAngelProxy sharedInstance];
    [v6 startRecordingCountdown];

    [(RPControlCenterClient *)self setCountdown:@"Countdown3"];
  }
}

- (void)cancelRecordingCountdown
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPControlCenterClient cancelRecordingCountdown]";
    __int16 v8 = 1024;
    int v9 = 508;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v6, 0x1Cu);
  }
  unsigned int v3 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v4 = [v3 systemBannerEnabled];

  if (v4)
  {
    dispatch_time_t v5 = +[RPControlCenterAngelProxy sharedInstance];
    [v5 cancelRecordingCountdown];
  }
}

- (void)showRecordingBanner
{
  v2 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v3 = [v2 systemBannerEnabled];

  if (v3)
  {
    id v4 = +[RPControlCenterAngelProxy sharedInstance];
    [v4 showRecordingBanner];
  }
}

- (void)stopRecordingCalled
{
  v2 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v3 = [v2 systemBannerEnabled];

  if (v3)
  {
    id v4 = +[RPControlCenterAngelProxy sharedInstance];
    [v4 stopRecordingCalled];
  }
}

- (void)terminateAngelRecordingSession
{
  v2 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v3 = [v2 systemBannerEnabled];

  if (v3)
  {
    id v4 = +[RPControlCenterAngelProxy sharedInstance];
    [v4 hideAndStopRecordingBanner];
  }
}

- (void)screenRecorder:(id)a3 didStopRecordingWithPreviewViewController:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446722;
    __int16 v15 = "-[RPControlCenterClient screenRecorder:didStopRecordingWithPreviewViewController:error:]";
    __int16 v16 = 1024;
    int v17 = 543;
    __int16 v18 = 2048;
    BOOL v19 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v14, 0x1Cu);
  }
  [(RPControlCenterClient *)self updateStatusIsCountingDown:0 IsRecording:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCountingDown = self->_isCountingDown;
    BOOL lockUIControls = self->_lockUIControls;
    BOOL recordingOn = self->_recordingOn;
    int v14 = 136447490;
    __int16 v15 = "-[RPControlCenterClient screenRecorder:didStopRecordingWithPreviewViewController:error:]";
    __int16 v16 = 1024;
    int v17 = 545;
    __int16 v18 = 2048;
    BOOL v19 = self;
    __int16 v20 = 1024;
    BOOL v21 = isCountingDown;
    __int16 v22 = 1024;
    BOOL v23 = lockUIControls;
    __int16 v24 = 1024;
    BOOL v25 = recordingOn;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v14, 0x2Eu);
  }
  if (v10)
  {
    if ([v10 code] == (id)-5815) {
      [(RPControlCenterClient *)self notifyClientDelegatesStart:0];
    }
    [(RPControlCenterClient *)self terminateAngelRecordingSession];
  }
  [(RPControlCenterClient *)self callDelegate:&stru_1C770];
}

- (void)screenRecorderDidChangeAvailability:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v9 = "-[RPControlCenterClient screenRecorderDidChangeAvailability:]";
    __int16 v10 = 1024;
    int v11 = 559;
    __int16 v12 = 2048;
    BOOL v13 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_83C0;
  v6[3] = &unk_1C5D8;
  id v7 = v4;
  id v5 = v4;
  [(RPControlCenterClient *)self callDelegate:v6];
}

- (void)screenRecorderDidUpdateState:(id)a3
{
  self->_BOOL recordingOn = [(RPScreenRecorder *)self->_screenRecorder isRecording];
  self->_microphoneOn = [(RPScreenRecorder *)self->_screenRecorder isMicrophoneEnabled];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136447234;
    id v5 = "-[RPControlCenterClient screenRecorderDidUpdateState:]";
    __int16 v6 = 1024;
    int v7 = 568;
    __int16 v8 = 2048;
    id v9 = self;
    __int16 v10 = 1024;
    unsigned int v11 = [(RPControlCenterClient *)self recordingOn];
    __int16 v12 = 1024;
    unsigned int v13 = [(RPControlCenterClient *)self microphoneOn];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p recordingOn:%d microphoneOn:%d", (uint8_t *)&v4, 0x28u);
  }
  [(RPControlCenterClient *)self updateClientState];
}

- (void)broadcastController:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446722;
    __int16 v12 = "-[RPControlCenterClient broadcastController:didFinishWithError:]";
    __int16 v13 = 1024;
    int v14 = 575;
    __int16 v15 = 2048;
    __int16 v16 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v11, 0x1Cu);
  }
  [(RPControlCenterClient *)self updateStatusIsCountingDown:0 IsRecording:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCountingDown = self->_isCountingDown;
    BOOL lockUIControls = self->_lockUIControls;
    BOOL recordingOn = self->_recordingOn;
    int v11 = 136447490;
    __int16 v12 = "-[RPControlCenterClient broadcastController:didFinishWithError:]";
    __int16 v13 = 1024;
    int v14 = 577;
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 1024;
    BOOL v18 = isCountingDown;
    __int16 v19 = 1024;
    BOOL v20 = lockUIControls;
    __int16 v21 = 1024;
    BOOL v22 = recordingOn;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p updated status to isCountingDown:%i lockUIControls:%i, recordingOn:%i", (uint8_t *)&v11, 0x2Eu);
  }
  if (v7)
  {
    if ([v7 code] == (id)-5815) {
      [(RPControlCenterClient *)self notifyClientDelegatesStart:0];
    }
    [(RPControlCenterClient *)self terminateAngelRecordingSession];
  }
  [(RPControlCenterClient *)self callDelegate:&stru_1C790];
}

- (void)broadcastController:(id)a3 didUpdateServiceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    id v9 = "-[RPControlCenterClient broadcastController:didUpdateServiceInfo:]";
    __int16 v10 = 1024;
    int v11 = 592;
    __int16 v12 = 2048;
    __int16 v13 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)broadcastController:(id)a3 didUpdateBroadcastURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446978;
    id v9 = "-[RPControlCenterClient broadcastController:didUpdateBroadcastURL:]";
    __int16 v10 = 1024;
    int v11 = 597;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p broadcastURL=%@", (uint8_t *)&v8, 0x26u);
  }
}

- (void)recordingTimerDidUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimerString, a3);

  [(RPControlCenterClient *)self callDelegate:&stru_1C7B0];
}

- (void)stopCurrentSession
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    int v4 = "-[RPControlCenterClient stopCurrentSession]";
    __int16 v5 = 1024;
    int v6 = 610;
    __int16 v7 = 2048;
    int v8 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v3, 0x1Cu);
  }
  if ([(RPControlCenterClient *)self isCountingDown]) {
    [(RPControlCenterClient *)self notifyClientDelegatesStart:0];
  }
  else {
    [(RPControlCenterClient *)self stopSystemRecordingWithHandler:0];
  }
}

- (void)replayKitAngelDisconnected
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8AEC;
  block[3] = &unk_1C498;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)countdownInterruptWithStatus:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v10 = "-[RPControlCenterClient countdownInterruptWithStatus:]";
    __int16 v11 = 1024;
    int v12 = 628;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8D38;
  v6[3] = &unk_1C750;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (id)imageForBundleID:(id)a3 extensionInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NSDictionary *)self->_iconImageCache objectForKeyedSubscript:v6];
  if (v8)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446466;
      __int16 v14 = "-[RPControlCenterClient imageForBundleID:extensionInfo:]";
      __int16 v15 = 1024;
      int v16 = 653;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d using cached image for extension", (uint8_t *)&v13, 0x12u);
    }
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446466;
      __int16 v14 = "-[RPControlCenterClient imageForBundleID:extensionInfo:]";
      __int16 v15 = 1024;
      int v16 = 643;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d image not found for extension", (uint8_t *)&v13, 0x12u);
    }
    id v9 = [v7 objectForKey:@"extAppImgData"];
    __int16 v10 = +[UIImage imageWithData:v9];

    v18.width = 29.0;
    v18.height = 29.0;
    UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
    objc_msgSend(v10, "drawInRect:", 0.0, 0.0, 29.0, 29.0);
    __int16 v11 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(NSDictionary *)self->_iconImageCache setValue:v11 forKey:v6];
  }

  return v8;
}

- (BOOL)broadcastMode
{
  return self->_broadcastMode;
}

- (void)setBroadcastMode:(BOOL)a3
{
  self->_broadcastMode = a3;
}

- (BOOL)microphoneOn
{
  return self->_microphoneOn;
}

- (BOOL)cameraOn
{
  return self->_cameraOn;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (BOOL)shouldShowMicButton
{
  return self->_shouldShowMicButton;
}

- (BOOL)lockUIControls
{
  return self->_lockUIControls;
}

- (BOOL)isCountingDown
{
  return self->_isCountingDown;
}

- (BOOL)recordingOn
{
  return self->_recordingOn;
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (void)setExtensionBundleID:(id)a3
{
}

- (NSString)preferredExtension
{
  return self->_preferredExtension;
}

- (void)setPreferredExtension:(id)a3
{
}

- (NSString)currentTimerString
{
  return self->_currentTimerString;
}

- (void)setCurrentTimerString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimerString, 0);
  objc_storeStrong((id *)&self->_preferredExtension, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_countdownState, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_extensionCacheTime, 0);
  objc_storeStrong((id *)&self->_pickerInfoCacheTime, 0);
  objc_storeStrong((id *)&self->_availableExtensions, 0);
  objc_storeStrong((id *)&self->_screenRecorder, 0);
  objc_storeStrong((id *)&self->_broadcastController, 0);

  objc_storeStrong((id *)&self->_delegates, 0);
}

@end