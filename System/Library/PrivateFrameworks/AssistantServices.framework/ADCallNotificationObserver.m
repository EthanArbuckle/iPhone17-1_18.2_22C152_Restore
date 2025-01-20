@interface ADCallNotificationObserver
- (ADCallNotificationObserver)init;
- (BOOL)_answerAndHangUpIntentsSupportedByBundleID:(id)a3;
- (BOOL)hasIncomingCallNotification;
- (id)callNotificationsIdentifiers;
- (void)_cancelCallNotificationTimer;
- (void)_invokeRingtoneTimeout;
- (void)_resetCallNotificationTimer;
- (void)notificationManager:(id)a3 didAddBulletin:(id)a4;
- (void)notificationManager:(id)a3 didRemoveBulletin:(id)a4;
@end

@implementation ADCallNotificationObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callNotificationTimer, 0);
  objc_storeStrong((id *)&self->_callNotificationsIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_resetCallNotificationTimer
{
  [(ADCallNotificationObserver *)self _cancelCallNotificationTimer];
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_10023D03C;
  v10 = &unk_10050B790;
  objc_copyWeak(&v11, &location);
  v5 = (AFWatchdogTimer *)[v3 initWithTimeoutInterval:queue onQueue:&v7 timeoutHandler:30.0];
  callNotificationTimer = self->_callNotificationTimer;
  self->_callNotificationTimer = v5;

  [(AFWatchdogTimer *)self->_callNotificationTimer start];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_cancelCallNotificationTimer
{
  callNotificationTimer = self->_callNotificationTimer;
  if (callNotificationTimer)
  {
    [(AFWatchdogTimer *)callNotificationTimer cancel];
    v4 = self->_callNotificationTimer;
    self->_callNotificationTimer = 0;
  }
}

- (BOOL)_answerAndHangUpIntentsSupportedByBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v4 = (void *)qword_100585FA8;
  uint64_t v30 = qword_100585FA8;
  if (!qword_100585FA8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10023D664;
    v32 = &unk_10050E318;
    v33 = &v27;
    sub_10023D664((uint64_t)buf);
    v4 = (void *)v28[3];
  }
  v5 = v4;
  _Block_object_dispose(&v27, 8);
  id v26 = 0;
  id v6 = [[v5 alloc] initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v26];
  id v7 = v26;
  if (!v7)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v10 = (void *)qword_100585FB8;
    uint64_t v30 = qword_100585FB8;
    if (!qword_100585FB8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10023D850;
      v32 = &unk_10050E318;
      v33 = &v27;
      sub_10023D850((uint64_t)buf);
      v10 = (void *)v28[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v27, 8);
    v12 = [v11 appInfoWithApplicationRecord:v6];
    v13 = [v12 supportedIntents];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    v14 = (id *)qword_100585FC8;
    uint64_t v30 = qword_100585FC8;
    if (!qword_100585FC8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10023D918;
      v32 = &unk_10050E318;
      v33 = &v27;
      v15 = sub_10023D968();
      v16 = dlsym(v15, "INAnswerCallIntentIdentifier");
      *(void *)(v33[1] + 24) = v16;
      qword_100585FC8 = *(void *)(v33[1] + 24);
      v14 = (id *)v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (v14)
    {
      id v17 = *v14;
      if (![v13 containsObject:v17])
      {
        unsigned __int8 v9 = 0;
        goto LABEL_18;
      }
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      v18 = (void *)qword_100585FD0;
      uint64_t v30 = qword_100585FD0;
      if (!qword_100585FD0)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_10023DABC;
        v32 = &unk_10050E318;
        v33 = &v27;
        v19 = sub_10023D968();
        v20 = dlsym(v19, "INHangUpCallIntentIdentifier");
        *(void *)(v33[1] + 24) = v20;
        qword_100585FD0 = *(void *)(v33[1] + 24);
        v18 = (void *)v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (v18)
      {
        unsigned __int8 v9 = [v13 containsObject:*v18];
LABEL_18:

        goto LABEL_19;
      }
      v24 = +[NSAssertionHandler currentHandler];
      v25 = +[NSString stringWithUTF8String:"NSString *getINHangUpCallIntentIdentifier(void)"];
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"ADCallNotificationObserver.m", 39, @"%s", dlerror());
    }
    else
    {
      v22 = +[NSAssertionHandler currentHandler];
      v23 = +[NSString stringWithUTF8String:"NSString *getINAnswerCallIntentIdentifier(void)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"ADCallNotificationObserver.m", 38, @"%s", dlerror());
    }
    __break(1u);
  }
  uint64_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[ADCallNotificationObserver _answerAndHangUpIntentsSupportedByBundleID:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2112;
    v32 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unable to retrieve LSApplicationRecord for bundle identifier %@: %@", buf, 0x20u);
  }
  unsigned __int8 v9 = 0;
LABEL_19:

  return v9;
}

- (void)notificationManager:(id)a3 didRemoveBulletin:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023DC8C;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)notificationManager:(id)a3 didAddBulletin:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023DE54;
  v8[3] = &unk_10050E160;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (BOOL)hasIncomingCallNotification
{
  return [(NSMutableSet *)self->_callNotificationsIdentifiers count] != 0;
}

- (id)callNotificationsIdentifiers
{
  id v2 = [(NSMutableSet *)self->_callNotificationsIdentifiers copy];
  return v2;
}

- (void)_invokeRingtoneTimeout
{
}

- (ADCallNotificationObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADCallNotificationObserver;
  id v2 = [(ADCallNotificationObserver *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create(0, v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    callNotificationsIdentifiers = v2->_callNotificationsIdentifiers;
    v2->_callNotificationsIdentifiers = v6;
  }
  return v2;
}

@end