@interface ADHomeAnnouncementContextAdaptor
- (ADHomeAnnouncementContextAdaptor)initWithInstanceContext:(id)a3;
- (void)_invalidate;
- (void)_processAndEvaluateSnapshot:(id)a3;
- (void)_setSnapshot:(id)a3;
- (void)getSnapshotWithCompletion:(id)a3;
- (void)homeAnnouncementObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5;
- (void)invalidate;
- (void)registerSnapshotUpdater:(id)a3;
- (void)unregisterSnapshotUpdater;
@end

@implementation ADHomeAnnouncementContextAdaptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong(&self->_snapshotUpdater, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_setSnapshot:(id)a3
{
  v4 = (AFHomeAnnouncementSnapshot *)a3;
  snapshot = self->_snapshot;
  if (snapshot != v4 && ([(AFHomeAnnouncementSnapshot *)snapshot isEqual:v4] & 1) == 0)
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v7 = self->_snapshot;
      int v11 = 136315906;
      v12 = "-[ADHomeAnnouncementContextAdaptor _setSnapshot:]";
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2112;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %p %@ -> %@", (uint8_t *)&v11, 0x2Au);
    }
    v8 = (AFHomeAnnouncementSnapshot *)[(AFHomeAnnouncementSnapshot *)v4 copy];
    v9 = self->_snapshot;
    self->_snapshot = v8;

    snapshotUpdater = (void (**)(id, AFHomeAnnouncementSnapshot *))self->_snapshotUpdater;
    if (snapshotUpdater) {
      snapshotUpdater[2](snapshotUpdater, self->_snapshot);
    }
  }
}

- (void)_processAndEvaluateSnapshot:(id)a3
{
  v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[ADHomeAnnouncementContextAdaptor _processAndEvaluateSnapshot:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    v45 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %p snapshot = %@", buf, 0x20u);
  }
  v6 = [v4 lastPlayedAnnouncement];
  double expirationDuration = self->_expirationDuration;
  id v8 = v6;
  v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    v45 = *(uint64_t (**)(uint64_t, uint64_t))&expirationDuration;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s announcement = %@, double expirationDuration = %f", buf, 0x20u);
  }
  if (!v8)
  {
    v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
      v20 = "%s announcement is nil";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
    }
LABEL_19:

    goto LABEL_20;
  }
  v10 = [v8 identifier];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
      v20 = "%s announcement identifier is nil";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = +[NSDate date];
  __int16 v13 = [v8 finishedDate];
  if (v13)
  {
    [v12 timeIntervalSinceDate:v13];
    double v15 = v14;
    v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s timeIntervalSinceAnnouncementFinishedDate = %f", buf, 0x16u);
    }
    if (v15 < expirationDuration)
    {
      double v17 = expirationDuration - v15;
      v18 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s timeIntervalUntilExpiration = %f", buf, 0x16u);
      }

LABEL_36:
      v31 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[ADHomeAnnouncementContextAdaptor _processAndEvaluateSnapshot:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2048;
        v45 = *(uint64_t (**)(uint64_t, uint64_t))&v17;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%s lastPlayedAnnouncement %@ is valid with %f seconds until expiration.", buf, 0x20u);
      }
      [(ADHomeAnnouncementContextAdaptor *)self _setSnapshot:v4];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v45 = sub_1002B2DE8;
      v46 = sub_1002B2DF8;
      id v47 = 0;
      objc_initWeak(&location, self);
      id v32 = objc_alloc((Class)AFWatchdogTimer);
      queue = self->_queue;
      v36 = _NSConcreteStackBlock;
      uint64_t v37 = 3221225472;
      v38 = sub_1002B2E00;
      v39 = &unk_10050A830;
      objc_copyWeak(&v42, &location);
      v40 = v4;
      v41 = buf;
      id v34 = [v32 initWithTimeoutInterval:queue onQueue:&v36 timeoutHandler:v17 + 0.005];
      v35 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v34;

      objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "start", v36, v37, v38, v39);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_39;
    }
  }
  else
  {
    v23 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s announcement finishedDate is nil", buf, 0xCu);
    }
  }
  v24 = [v8 startedDate];
  if (v24)
  {
    [v12 timeIntervalSinceDate:v24];
    double v26 = v25;
    v27 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s timeIntervalSinceAnnouncementStartedDate = %f", buf, 0x16u);
    }
    if (v26 < expirationDuration)
    {
      double v17 = expirationDuration - v26;
      v30 = AFSiriLogContextDaemon;
      int v28 = 1;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v17;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s timeIntervalUntilExpiration = %f", buf, 0x16u);
      }
    }
    else
    {
      int v28 = 0;
      double v17 = 0.0;
    }
  }
  else
  {
    v29 = AFSiriLogContextDaemon;
    double v17 = 0.0;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "ADHomeAnnouncementGetIsValid";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s announcement startedDate is nil", buf, 0xCu);
    }
    int v28 = 0;
  }

  if (v28) {
    goto LABEL_36;
  }
LABEL_20:
  v21 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[ADHomeAnnouncementContextAdaptor _processAndEvaluateSnapshot:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s lastPlayedAnnouncement %@ is invalid.", buf, 0x16u);
  }
  v22 = [v4 mutatedCopyWithMutator:&stru_100509F38];
  [(ADHomeAnnouncementContextAdaptor *)self _setSnapshot:v22];

LABEL_39:
}

- (void)_invalidate
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[ADHomeAnnouncementContextAdaptor _invalidate]";
    __int16 v9 = 2048;
    v10 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v7, 0x16u);
  }
  [(AFHomeAnnouncementObserver *)self->_observer removeListener:self];
  observer = self->_observer;
  self->_observer = 0;

  id snapshotUpdater = self->_snapshotUpdater;
  self->_id snapshotUpdater = 0;

  snapshot = self->_snapshot;
  self->_snapshot = 0;
}

- (void)homeAnnouncementObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002B30C0;
  v9[3] = &unk_10050E160;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B3144;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    group = self->_group;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002B31F8;
    v8[3] = &unk_10050E188;
    v8[4] = self;
    id v9 = v4;
    dispatch_group_notify(group, queue, v8);
  }
}

- (void)unregisterSnapshotUpdater
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    int v7 = "-[ADHomeAnnouncementContextAdaptor unregisterSnapshotUpdater]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }
  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B3428;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerSnapshotUpdater:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v11 = "-[ADHomeAnnouncementContextAdaptor registerSnapshotUpdater:]";
    __int16 v12 = 2048;
    __int16 v13 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }
  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002B35CC;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (ADHomeAnnouncementContextAdaptor)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ADHomeAnnouncementContextAdaptor;
  v5 = [(ADHomeAnnouncementContextAdaptor *)&v19 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = (AFInstanceContext *)v4;
    }
    else
    {
      id v6 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v6;

    __int16 v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v18 = v5->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v21 = "-[ADHomeAnnouncementContextAdaptor initWithInstanceContext:]";
      __int16 v22 = 2048;
      v23 = v5;
      __int16 v24 = 2112;
      double v25 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
    }
    v5->_double expirationDuration = 60.0;
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.assistant.home-announcement-adaptor", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    dispatch_group_t v13 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v13;

    double v15 = (AFHomeAnnouncementObserver *)[objc_alloc((Class)AFHomeAnnouncementObserver) initWithInstanceContext:v5->_instanceContext];
    observer = v5->_observer;
    v5->_observer = v15;
  }
  return v5;
}

@end