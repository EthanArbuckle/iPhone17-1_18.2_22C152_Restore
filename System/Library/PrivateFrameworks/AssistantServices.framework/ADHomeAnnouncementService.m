@interface ADHomeAnnouncementService
+ (id)sharedService;
- (ADHomeAnnouncementService)initWithInstanceContext:(id)a3;
- (BOOL)_shouldStopPlaybackWhenRequestBegins;
- (void)_stopPlayback;
- (void)_stopPlaybackIfNeeded;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)stopPlayback;
@end

@implementation ADHomeAnnouncementService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)_shouldStopPlaybackWhenRequestBegins
{
  id v2 = off_1005842F0();
  return _[v2 shouldStopPlaybackOnSiriActivation];
}

- (void)_stopPlayback
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADHomeAnnouncementService _stopPlayback]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Asking Announce to stop playing...", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10030C2F0;
  v10 = sub_10030C300;
  id v11 = 0;
  id v3 = objc_alloc_init((Class)off_1005842E8());
  v4 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v3;

  v5 = *(void **)(*((void *)&buf + 1) + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10030C308;
  v6[3] = &unk_10050BDC8;
  v6[4] = &buf;
  [v5 stopPlayingAnnouncementsWithCompletionHandler:v6];
  _Block_object_dispose(&buf, 8);
}

- (void)_stopPlaybackIfNeeded
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v7 = "-[ADHomeAnnouncementService _stopPlaybackIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Checking Announce state...", buf, 0xCu);
  }
  notifyObserver = self->_notifyObserver;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10030C5F0;
  v5[3] = &unk_10050C458;
  v5[4] = self;
  [(AFNotifyObserver *)notifyObserver getStateWithCompletion:v5];
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030C740;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ADHomeAnnouncementService)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ADHomeAnnouncementService;
  v5 = [(ADHomeAnnouncementService *)&v18 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.home-announcement-service", v6);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      v9 = (AFInstanceContext *)v4;
    }
    else
    {
      v9 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;

    id v11 = off_1005842E0();
    if (v11)
    {
      v12 = (AFNotifyObserver *)[objc_alloc((Class)AFNotifyObserver) initWithName:v11 options:1 queue:v5->_queue delegate:0];
      notifyObserver = v5->_notifyObserver;
      v5->_notifyObserver = v12;
    }
    else
    {
      v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v17 = v5->_instanceContext;
        *(_DWORD *)long long buf = 136315394;
        v20 = "-[ADHomeAnnouncementService initWithInstanceContext:]";
        __int16 v21 = 2112;
        v22 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Unable to get the notification name for Announce state. (instanceContext = %@)", buf, 0x16u);
      }
    }
    v15 = +[ADRequestLifecycleObserver sharedObserver];
    [v15 addListener:v5];
  }
  return v5;
}

- (void)stopPlayback
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030CABC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

+ (id)sharedService
{
  if (qword_100586320 != -1) {
    dispatch_once(&qword_100586320, &stru_10050BDA0);
  }
  id v2 = (void *)qword_100586328;
  return v2;
}

@end