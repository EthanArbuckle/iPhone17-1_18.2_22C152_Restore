@interface _ADQueueObserver
- (_ADQueueObserver)initWithQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)heartBeatFiredWithQueue:(id)a3;
- (void)startWithQueue:(id)a3;
- (void)stop;
- (void)timeoutDetected;
@end

@implementation _ADQueueObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heartBeat, 0);
}

- (void)timeoutDetected
{
  unint64_t v3 = self->_numberOfOccurrences + 1;
  self->_numberOfOccurrences = v3;
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    queue = self->_queue;
    int v7 = 136315650;
    v8 = "-[_ADQueueObserver timeoutDetected]";
    __int16 v9 = 2112;
    v10 = queue;
    __int16 v11 = 2048;
    unint64_t v12 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s queue = %@, numberOfOccurrences = %tu", (uint8_t *)&v7, 0x20u);
  }
  timeoutHandler = (void (**)(id, unint64_t))self->_timeoutHandler;
  if (timeoutHandler) {
    timeoutHandler[2](timeoutHandler, self->_numberOfOccurrences);
  }
}

- (void)heartBeatFiredWithQueue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100307AAC;
  v27 = sub_100307ABC;
  id v28 = 0;
  id v5 = objc_alloc((Class)AFSafetyBlock);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100307AC4;
  v21[3] = &unk_10050BC80;
  objc_copyWeak(&v22, &location);
  id v6 = [v5 initWithBlock:v21];
  id v7 = objc_alloc((Class)AFWatchdogTimer);
  double timeoutInterval = self->_timeoutInterval;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100307B10;
  v19[3] = &unk_10050E138;
  id v9 = v6;
  id v20 = v9;
  id v10 = [v7 initWithTimeoutInterval:v4 onQueue:v19 timeoutHandler:timeoutInterval];
  __int16 v11 = (void *)v24[5];
  v24[5] = (uint64_t)v10;

  [(id)v24[5] start];
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100307B1C;
  v15[3] = &unk_10050C700;
  id v16 = v9;
  id v17 = v4;
  v18 = &v23;
  id v13 = v4;
  id v14 = v9;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v22);
  _Block_object_dispose(&v23, 8);

  objc_destroyWeak(&location);
}

- (void)stop
{
  heartBeat = self->_heartBeat;
  if (heartBeat)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      queue = self->_queue;
      int v7 = 136315394;
      v8 = "-[_ADQueueObserver stop]";
      __int16 v9 = 2112;
      id v10 = queue;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s queue = %@", (uint8_t *)&v7, 0x16u);
      heartBeat = self->_heartBeat;
    }
    [(AFHeartBeat *)heartBeat invalidate];
    id v5 = self->_heartBeat;
    self->_heartBeat = 0;
  }
}

- (void)startWithQueue:(id)a3
{
  id v4 = a3;
  if (!self->_heartBeat)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      queue = self->_queue;
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[_ADQueueObserver startWithQueue:]";
      __int16 v16 = 2112;
      id v17 = queue;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s queue = %@", location, 0x16u);
    }
    id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"com.apple.assistant.queue-observer.%s", dispatch_queue_get_label((dispatch_queue_t)self->_queue));
    objc_initWeak((id *)location, self);
    id v7 = objc_alloc((Class)AFHeartBeat);
    double heartBeatInterval = self->_heartBeatInterval;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100307EAC;
    v12[3] = &unk_10050BC58;
    objc_copyWeak(&v14, (id *)location);
    id v13 = v4;
    __int16 v9 = (AFHeartBeat *)[v7 initWithIdentifier:v6 queue:v13 effectiveDate:0 expirationDuration:v12 heartBeatInterval:0 heartBeatHandler:0.0 invalidationHandler:heartBeatInterval];
    heartBeat = self->_heartBeat;
    self->_heartBeat = v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
}

- (_ADQueueObserver)initWithQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_ADQueueObserver;
  id v13 = [(_ADQueueObserver *)&v18 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    v14->_double heartBeatInterval = a4;
    v14->_double timeoutInterval = a5;
    id v15 = [v12 copy];
    id timeoutHandler = v14->_timeoutHandler;
    v14->_id timeoutHandler = v15;
  }
  return v14;
}

@end