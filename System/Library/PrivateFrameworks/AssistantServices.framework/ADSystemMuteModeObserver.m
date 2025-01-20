@interface ADSystemMuteModeObserver
+ (id)sharedInstance;
- (ADSystemMuteModeObserver)init;
- (int)_ringerStateToken;
- (int64_t)muteMode;
- (void)_registerForRingerMuteStateNotifications;
- (void)_unregisterForRingerMuteStateNotifications;
- (void)_updateRingerMuteState:(int)a3;
- (void)dealloc;
@end

@implementation ADSystemMuteModeObserver

- (void).cxx_destruct
{
}

- (void)_unregisterForRingerMuteStateNotifications
{
  int ringerStateToken = self->_ringerStateToken;
  if (ringerStateToken != -1)
  {
    notify_cancel(ringerStateToken);
    self->_int ringerStateToken = -1;
    self->_muteMode = 0;
  }
}

- (void)_registerForRingerMuteStateNotifications
{
  objc_initWeak(&location, self);
  if (self->_ringerStateToken == -1)
  {
    int out_token = -1;
    queue = self->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100213FB8;
    handler[3] = &unk_100509778;
    objc_copyWeak(&v6, &location);
    if (notify_register_dispatch("com.apple.springboard.ringerstate", &out_token, queue, handler))
    {
      v4 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[ADSystemMuteModeObserver _registerForRingerMuteStateNotifications]";
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Failed to register for ringer switch state change", buf, 0xCu);
      }
    }
    else
    {
      self->_int ringerStateToken = out_token;
    }
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

- (int)_ringerStateToken
{
  p_int ringerStateToken = &self->_ringerStateToken;
  int result = self->_ringerStateToken;
  if (result == -1)
  {
    notify_register_check("com.apple.springboard.ringerstate", p_ringerStateToken);
    return *p_ringerStateToken;
  }
  return result;
}

- (void)_updateRingerMuteState:(int)a3
{
  if (a3 != -1)
  {
    state64[3] = v3;
    state64[4] = v4;
    state64[0] = 0;
    if (!notify_get_state(a3, state64))
    {
      int64_t muteMode = self->_muteMode;
      int64_t v7 = 1;
      if (state64[0]) {
        int64_t v7 = 2;
      }
      self->_int64_t muteMode = v7;
      if (muteMode != v7)
      {
        v8 = +[NSNotificationCenter defaultCenter];
        v9 = +[NSNotification notificationWithName:@"ADMuteModeDidChangeNotification" object:self];
        [v8 postNotification:v9];
      }
    }
  }
}

- (int64_t)muteMode
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002141A4;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  [(ADSystemMuteModeObserver *)self _unregisterForRingerMuteStateNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ADSystemMuteModeObserver;
  [(ADSystemMuteModeObserver *)&v3 dealloc];
}

- (ADSystemMuteModeObserver)init
{
  v11.receiver = self;
  v11.super_class = (Class)ADSystemMuteModeObserver;
  v2 = [(ADSystemMuteModeObserver *)&v11 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_int64_t muteMode = 0;
    v2->_int ringerStateToken = -1;
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("ADSystemMuteModeObserver", v4);

    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    [(ADSystemMuteModeObserver *)v3 _registerForRingerMuteStateNotifications];
    int64_t v7 = v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100214304;
    block[3] = &unk_10050E138;
    v10 = v3;
    dispatch_async(v7, block);
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_100585EF0 != -1) {
    dispatch_once(&qword_100585EF0, &stru_100506F70);
  }
  v2 = (void *)qword_100585EE8;
  return v2;
}

@end