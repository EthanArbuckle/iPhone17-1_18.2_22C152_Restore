@interface ContinuityCaptureShieldUIBackgroundActivityManager
+ (id)sharedInstance;
- (ContinuityCaptureShieldUIBackgroundActivityManager)init;
- (NSDictionary)backgroundActivityControllers;
- (id)_currentBackgroundActivityIdentifier;
- (void)setBackgroundActivityControllers:(id)a3;
- (void)updateState:(int64_t)a3;
- (void)updateState:(int64_t)a3 withUserInteractionHandler:(id)a4;
@end

@implementation ContinuityCaptureShieldUIBackgroundActivityManager

+ (id)sharedInstance
{
  if (qword_1000240A0 != -1) {
    dispatch_once(&qword_1000240A0, &stru_10001C850);
  }
  v2 = (void *)qword_100024098;

  return v2;
}

- (ContinuityCaptureShieldUIBackgroundActivityManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ContinuityCaptureShieldUIBackgroundActivityManager;
  v2 = [(ContinuityCaptureShieldUIBackgroundActivityManager *)&v9 init];
  if (v2)
  {
    v3 = [[ContinuityCaptureShieldUIBackgroundActivityController alloc] initWithBackgroundActivityIdentifier:@"com.apple.systemstatus.background-activity.continuitycapture.streaming-video"];
    v4 = [[ContinuityCaptureShieldUIBackgroundActivityController alloc] initWithBackgroundActivityIdentifier:@"com.apple.systemstatus.background-activity.continuitycapture.streaming-audio"];
    v5 = [[ContinuityCaptureShieldUIBackgroundActivityController alloc] initWithBackgroundActivityIdentifier:@"com.apple.systemstatus.background-activity.continuitycapture.streaming-none"];
    v10[0] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-video";
    v10[1] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-audio";
    v11[0] = v3;
    v11[1] = v4;
    v10[2] = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-none";
    v11[2] = v5;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
    backgroundActivityControllers = v2->_backgroundActivityControllers;
    v2->_backgroundActivityControllers = (NSDictionary *)v6;
  }
  return v2;
}

- (void)updateState:(int64_t)a3
{
}

- (void)updateState:(int64_t)a3 withUserInteractionHandler:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ((v4 & 0x30) == 0x10)
  {
    v7 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ removing background activity", (uint8_t *)&v21, 0xCu);
    }

    v8 = [(ContinuityCaptureShieldUIBackgroundActivityManager *)self backgroundActivityControllers];
    [v8 enumerateKeysAndObjectsUsingBlock:&stru_10001C890];
  }
  else
  {
    if (v4)
    {
      objc_super v9 = [(ContinuityCaptureShieldUIBackgroundActivityManager *)self backgroundActivityControllers];
      v10 = v9;
      CFStringRef v11 = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-none";
    }
    else
    {
      objc_super v9 = [(ContinuityCaptureShieldUIBackgroundActivityManager *)self backgroundActivityControllers];
      v10 = v9;
      if ((v4 & 6) == 2)
      {
        CFStringRef v11 = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-audio";
      }
      else if ((v4 & 4) != 0)
      {
        CFStringRef v11 = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-video";
      }
      else
      {
        CFStringRef v11 = @"com.apple.systemstatus.background-activity.continuitycapture.streaming-none";
      }
    }
    v8 = [v9 objectForKey:v11];

    v12 = [(ContinuityCaptureShieldUIBackgroundActivityManager *)self _currentBackgroundActivityIdentifier];
    v13 = [v8 backgroundActivityIdentifier];
    unsigned __int8 v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      if (v12)
      {
        v15 = [(ContinuityCaptureShieldUIBackgroundActivityManager *)self backgroundActivityControllers];
        v16 = [v15 objectForKey:v12];

        [v16 deactivateBackgroundActivity];
      }
      v17 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v8 backgroundActivityIdentifier];
        int v21 = 138412802;
        v22 = self;
        __int16 v23 = 2112;
        v24 = v12;
        __int16 v25 = 2112;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ updating backgroundActivity %@ -> %@", (uint8_t *)&v21, 0x20u);
      }
      [v8 activateBackgroundActivityWithUserInteractionHandler:v6];
      v19 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v8 backgroundActivityIdentifier];
        int v21 = 138412802;
        v22 = self;
        __int16 v23 = 2112;
        v24 = v12;
        __int16 v25 = 2112;
        v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ updated backgroundActivity %@ -> %@", (uint8_t *)&v21, 0x20u);
      }
    }
  }
}

- (id)_currentBackgroundActivityIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = sub_10000F7DC;
  v10 = sub_10000F7EC;
  id v11 = 0;
  v2 = [(ContinuityCaptureShieldUIBackgroundActivityManager *)self backgroundActivityControllers];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F7F4;
  v5[3] = &unk_10001C8B8;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSDictionary)backgroundActivityControllers
{
  return self->_backgroundActivityControllers;
}

- (void)setBackgroundActivityControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end