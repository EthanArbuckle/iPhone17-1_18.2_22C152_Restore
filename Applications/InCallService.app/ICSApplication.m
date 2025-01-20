@interface ICSApplication
+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch;
- (BOOL)_supportsAlwaysOnDisplay;
- (BOOL)currentTestIsFaceTime;
- (BOOL)runEndCallTestWithOptions:(id)a3;
- (BOOL)runIncomingCallTestWithOptions:(id)a3;
- (BOOL)runOutgoingCallTestWithOptions:(id)a3;
- (BOOL)runSwapCameraTestWithOptions:(id)a3;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (id)pptOutgoingDialRequestWithDestinationID:(id)a3;
- (unint64_t)beginBackgroundTaskWithExpirationHandler:(id)a3;
- (unint64_t)beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)endBackgroundTask:(unint64_t)a3;
- (void)handleCallStatusChangedNotification:(id)a3;
- (void)sendEvent:(id)a3;
- (void)setUpTestNamed:(id)a3;
@end

@implementation ICSApplication

+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch
{
  return 0;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICSApplication;
  [(ICSApplication *)&v6 sendEvent:v4];
  if (![v4 type])
  {
    v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
}

- (BOOL)_supportsAlwaysOnDisplay
{
  return 1;
}

- (unint64_t)beginBackgroundTaskWithExpirationHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ beginBackgroundTaskWithExpirationHandler", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)ICSApplication;
  id v6 = [(ICSApplication *)&v8 beginBackgroundTaskWithExpirationHandler:v4];

  return (unint64_t)v6;
}

- (unint64_t)beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ beginBackgroundTaskWithName:expirationHandler %{public}@", buf, 0x16u);
  }

  v11.receiver = self;
  v11.super_class = (Class)ICSApplication;
  id v9 = [(ICSApplication *)&v11 beginBackgroundTaskWithName:v6 expirationHandler:v7];

  return (unint64_t)v9;
}

- (void)endBackgroundTask:(unint64_t)a3
{
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ endBackgroundTask %lu", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ICSApplication;
  [(ICSApplication *)&v6 endBackgroundTask:a3];
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to run testName: %@ with options: %@", buf, 0x16u);
  }

  [(ICSApplication *)self setUpTestNamed:v6];
  if (([v6 isEqualToString:@"PlaceOutgoingCall"] & 1) != 0
    || [v6 isEqualToString:@"FaceTimePlaceOutgoingCall"])
  {
    unsigned __int8 v9 = [(ICSApplication *)self runOutgoingCallTestWithOptions:v7];
  }
  else if (([v6 isEqualToString:@"AnswerIncomingCall"] & 1) != 0 {
         || [v6 isEqualToString:@"FaceTimeAnswerIncomingCall"])
  }
  {
    unsigned __int8 v9 = [(ICSApplication *)self runIncomingCallTestWithOptions:v7];
  }
  else if (([v6 isEqualToString:@"FaceTimeEndActiveCall"] & 1) != 0 {
         || [v6 isEqualToString:@"EndActiveCall"])
  }
  {
    unsigned __int8 v9 = [(ICSApplication *)self runEndCallTestWithOptions:v7];
  }
  else if ([v6 isEqualToString:@"FaceTimeSwapCamera"])
  {
    unsigned __int8 v9 = [(ICSApplication *)self runSwapCameraTestWithOptions:v7];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ICSApplication;
    unsigned __int8 v9 = [(ICSApplication *)&v12 runTest:v6 options:v7];
  }
  BOOL v10 = v9;

  return v10;
}

- (void)setUpTestNamed:(id)a3
{
  objc_storeStrong((id *)&qword_10032CBD0, a3);
  id v5 = a3;
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"handleCallStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
}

- (void)handleCallStatusChangedNotification:(id)a3
{
  if (qword_10032CBD8)
  {
    id v3 = [a3 object];
    (*(void (**)(uint64_t, id))(qword_10032CBD8 + 16))(qword_10032CBD8, v3);
  }
}

- (BOOL)currentTestIsFaceTime
{
  return [(id)qword_10032CBD0 hasPrefix:@"FaceTime"];
}

- (id)pptOutgoingDialRequestWithDestinationID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = +[TUHandle handleWithDestinationID:v4];

    id v6 = +[TUCallCenter sharedInstance];
    id v7 = [v6 providerManager];

    uint64_t v8 = [v7 superboxProvider];
    if ([(ICSApplication *)self currentTestIsFaceTime] || v8)
    {
      id v9 = v8;
    }
    else
    {
      id v9 = [v7 telephonyProvider];
    }
    objc_super v11 = v9;
    if (v9)
    {
      id v10 = [objc_alloc((Class)TUDialRequest) initWithProvider:v9];
      [v10 setHandle:v5];
      [v10 setVideo:[self currentTestIsFaceTime]];
      [v10 setOriginatingUIType:36];
    }
    else
    {
      uint64_t v12 = qword_10032CBD0;
      uint64_t v13 = +[NSString stringWithFormat:@"Could not create a call provider using the call provider manager %@.", v7];
      [(ICSApplication *)self failedTest:v12 withFailure:v13];

      id v10 = 0;
    }
  }
  else
  {
    id v5 = +[NSString stringWithFormat:@"Invalid destination ID: %@.  Did you remember to set the defaults?", v4];

    [(ICSApplication *)self failedTest:qword_10032CBD0 withFailure:v5];
    id v10 = 0;
  }

  return v10;
}

- (BOOL)runOutgoingCallTestWithOptions:(id)a3
{
  unsigned __int8 v4 = [(ICSApplication *)self currentTestIsFaceTime];
  id v5 = +[ICSPreferences sharedPreferences];
  id v6 = v5;
  if (v4) {
    [v5 pptOutgoingFaceTimeCallHandleValue];
  }
  else {
  id v7 = [v5 pptOutgoingCallHandleValue];
  }

  uint64_t v8 = [(ICSApplication *)self pptOutgoingDialRequestWithDestinationID:v7];
  [(ICSApplication *)self startedTest:qword_10032CBD0];
  [(ICSApplication *)self startedSubTest:@"end-to-end" forTest:qword_10032CBD0];
  uint64_t v9 = qword_10032CBD0;
  CFStringRef v13 = @"time";
  id v10 = +[NSArray arrayWithObjects:&v13 count:1];
  [(ICSApplication *)self startedSubTest:@"applicationOpenURL" forTest:v9 withMetrics:v10];

  objc_super v11 = +[TUCallCenter sharedInstance];
  [v11 launchAppForDialRequest:v8 completion:0];

  return 1;
}

- (BOOL)runIncomingCallTestWithOptions:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011310C;
  v8[3] = &unk_1002D0D40;
  v8[4] = self;
  unsigned __int8 v4 = objc_retainBlock(v8);
  id v5 = (void *)qword_10032CBD8;
  qword_10032CBD8 = (uint64_t)v4;

  [(ICSApplication *)self startedTest:qword_10032CBD0];
  [(ICSApplication *)self startedSubTest:@"AwaitIncomingCall" forTest:qword_10032CBD0];
  if ([(ICSApplication *)self currentTestIsFaceTime]) {
    id v6 = "triggerIncomingSuperboxVideoCall";
  }
  else {
    id v6 = "triggerIncomingSuperboxAudioCall";
  }
  notify_post(v6);
  return 1;
}

- (BOOL)runEndCallTestWithOptions:(id)a3
{
  unsigned __int8 v4 = [(ICSApplication *)self currentTestIsFaceTime];
  id v5 = +[ICSPreferences sharedPreferences];
  id v6 = v5;
  if (v4) {
    [v5 pptOutgoingFaceTimeCallHandleValue];
  }
  else {
  id v7 = [v5 pptOutgoingCallHandleValue];
  }

  uint64_t v8 = [(ICSApplication *)self pptOutgoingDialRequestWithDestinationID:v7];
  [(ICSApplication *)self startedTest:qword_10032CBD0];
  uint64_t v9 = +[TUCallCenter sharedInstance];
  [v9 launchAppForDialRequest:v8 completion:0];

  return 1;
}

- (BOOL)runSwapCameraTestWithOptions:(id)a3
{
  unsigned __int8 v4 = +[ICSPreferences sharedPreferences];
  id v5 = [v4 pptOutgoingFaceTimeCallHandleValue];
  id v6 = [(ICSApplication *)self pptOutgoingDialRequestWithDestinationID:v5];

  id v7 = [v6 URL];

  if (v7)
  {
    uint64_t v8 = +[UIApplication sharedApplication];
    uint64_t v9 = [v6 URL];
    [v8 openURL:v9 withCompletionHandler:0];

    [(ICSApplication *)self startedTest:qword_10032CBD0];
  }

  return 1;
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  if ((objc_msgSend(UIApp, "isRunningTest:", @"AnswerIncomingCall", a4) & 1) != 0
    || [UIApp isRunningTest:@"FaceTimeAnswerIncomingCall"])
  {
    uint64_t v5 = qword_10032CBD0;
    [(ICSApplication *)self failedTest:v5 withFailure:@"Connection Error"];
  }
}

@end