@interface HSAppDelegate
- (BSInvalidatable)idleTimerAssertion;
- (HSAppDelegate)init;
- (unint64_t)backgroundTaskIdentifier;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)makeIdleTimerAssertion;
- (void)releaseIdleTimerAssertion;
- (void)setBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setIdleTimerAssertion:(id)a3;
- (void)startBackgroundTask;
@end

@implementation HSAppDelegate

- (HSAppDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)HSAppDelegate;
  v2 = [(HSAppDelegate *)&v6 init];
  if (v2)
  {
    v3 = +[UIApplication sharedApplication];
    [v3 setDelegate:v2];

    v2->_backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    idleTimerAssertion = v2->_idleTimerAssertion;
    v2->_idleTimerAssertion = 0;
  }
  return v2;
}

- (void)applicationDidFinishLaunching:(id)a3
{
}

- (void)applicationWillEnterForeground:(id)a3
{
}

- (void)dealloc
{
  [(HSAppDelegate *)self releaseIdleTimerAssertion];
  v3.receiver = self;
  v3.super_class = (Class)HSAppDelegate;
  [(HSAppDelegate *)&v3 dealloc];
}

- (void)startBackgroundTask
{
  unint64_t v3 = [(HSAppDelegate *)self backgroundTaskIdentifier];
  v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == UIBackgroundTaskInvalid)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating background task to prevent HomeUIService from going into backgroundSuspended state", buf, 2u);
    }

    objc_super v6 = +[UIApplication sharedApplication];
    -[HSAppDelegate setBackgroundTaskIdentifier:](self, "setBackgroundTaskIdentifier:", [v6 beginBackgroundTaskWithName:@"startBackgroundTask" expirationHandler:&stru_1000AAC20]);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100042D8C;
    v8[3] = &unk_1000AAC48;
    v8[4] = self;
    id v7 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v8 block:0.25];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ignoring startBackgroundTask call since already running", buf, 2u);
    }
  }
}

- (void)makeIdleTimerAssertion
{
  unint64_t v3 = [(HSAppDelegate *)self idleTimerAssertion];

  if (!v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      CFStringRef v8 = @"HomeUIService-Pairing";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "HomeUIService creating new assertion to disable idle timer with reason: %@", (uint8_t *)&v7, 0xCu);
    }

    BOOL v5 = +[ITIdleTimerState sharedInstance];
    id v6 = [v5 newAssertionToDisableIdleTimerForReason:@"HomeUIService-Pairing"];
    [(HSAppDelegate *)self setIdleTimerAssertion:v6];
  }
}

- (void)releaseIdleTimerAssertion
{
  unint64_t v3 = [(HSAppDelegate *)self idleTimerAssertion];

  if (v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "HomeUIService invalidation idle timer assertion", v6, 2u);
    }

    BOOL v5 = [(HSAppDelegate *)self idleTimerAssertion];
    [v5 invalidate];

    [(HSAppDelegate *)self setIdleTimerAssertion:0];
  }
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (BSInvalidatable)idleTimerAssertion
{
  return self->_idleTimerAssertion;
}

- (void)setIdleTimerAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end