@interface SRBackgroundTaskManager
- (SRBackgroundTaskManager)init;
- (void)_endBackgroundTask;
- (void)dealloc;
@end

@implementation SRBackgroundTaskManager

- (SRBackgroundTaskManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)SRBackgroundTaskManager;
  v2 = [(SRBackgroundTaskManager *)&v13 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[UIApplication sharedApplication];
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_100074688;
    v10 = &unk_100143410;
    objc_copyWeak(&v11, &location);
    v2->_taskIdentifier = (unint64_t)[v3 beginBackgroundTaskWithExpirationHandler:&v7];

    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v2->_taskIdentifier, v7, v8, v9, v10);
      *(_DWORD *)buf = 136315650;
      v15 = "-[SRBackgroundTaskManager init]";
      __int16 v16 = 2112;
      v17 = v2;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s %@ - background task identifier: %@", buf, 0x20u);
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SRBackgroundTaskManager dealloc]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  [(SRBackgroundTaskManager *)self _endBackgroundTask];
  v4.receiver = self;
  v4.super_class = (Class)SRBackgroundTaskManager;
  [(SRBackgroundTaskManager *)&v4 dealloc];
}

- (void)_endBackgroundTask
{
  if (self->_taskIdentifier != UIBackgroundTaskInvalid)
  {
    v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t taskIdentifier = self->_taskIdentifier;
      v5 = v3;
      v6 = +[NSNumber numberWithUnsignedInteger:taskIdentifier];
      int v8 = 136315650;
      v9 = "-[SRBackgroundTaskManager _endBackgroundTask]";
      __int16 v10 = 2112;
      id v11 = self;
      __int16 v12 = 2112;
      objc_super v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@ - ending background task with id: %@", (uint8_t *)&v8, 0x20u);
    }
    __int16 v7 = +[UIApplication sharedApplication];
    [v7 endBackgroundTask:self->_taskIdentifier];

    self->_unint64_t taskIdentifier = UIBackgroundTaskInvalid;
  }
}

@end