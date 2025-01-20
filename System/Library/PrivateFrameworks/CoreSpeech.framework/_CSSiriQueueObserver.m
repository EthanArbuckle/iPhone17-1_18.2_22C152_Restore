@interface _CSSiriQueueObserver
- (_CSSiriQueueObserver)initWithQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)heartBeatFiredWithQueue:(id)a3;
- (void)startWithQueue:(id)a3;
- (void)stop;
- (void)timeoutDetected;
@end

@implementation _CSSiriQueueObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heartBeat, 0);
}

- (void)timeoutDetected
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->_numberOfOccurrences + 1;
  self->_numberOfOccurrences = v3;
  v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
  {
    queue = self->_queue;
    int v7 = 136315650;
    v8 = "-[_CSSiriQueueObserver timeoutDetected]";
    __int16 v9 = 2112;
    v10 = queue;
    __int16 v11 = 2048;
    unint64_t v12 = v3;
    _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s queue = %@, numberOfOccurrences = %tu", (uint8_t *)&v7, 0x20u);
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
  v26 = __Block_byref_object_copy__20159;
  v27 = __Block_byref_object_dispose__20160;
  id v28 = 0;
  id v5 = objc_alloc(MEMORY[0x1E4F4E558]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke;
  v21[3] = &unk_1E658BAB8;
  objc_copyWeak(&v22, &location);
  v6 = (void *)[v5 initWithBlock:v21];
  id v7 = objc_alloc(MEMORY[0x1E4F4E688]);
  double timeoutInterval = self->_timeoutInterval;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_2;
  v19[3] = &unk_1E658D4D8;
  id v9 = v6;
  id v20 = v9;
  uint64_t v10 = [v7 initWithTimeoutInterval:v4 onQueue:v19 timeoutHandler:timeoutInterval];
  __int16 v11 = (void *)v24[5];
  v24[5] = v10;

  [(id)v24[5] start];
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_3;
  v15[3] = &unk_1E658BD60;
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
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  heartBeat = self->_heartBeat;
  if (heartBeat)
  {
    id v4 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_DEBUG))
    {
      queue = self->_queue;
      int v7 = 136315394;
      v8 = "-[_CSSiriQueueObserver stop]";
      __int16 v9 = 2112;
      uint64_t v10 = queue;
      _os_log_debug_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEBUG, "%s queue = %@", (uint8_t *)&v7, 0x16u);
      heartBeat = self->_heartBeat;
    }
    [(AFHeartBeat *)heartBeat invalidate];
    id v5 = self->_heartBeat;
    self->_heartBeat = 0;
  }
}

- (void)startWithQueue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_heartBeat)
  {
    id v5 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_DEBUG))
    {
      queue = self->_queue;
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[_CSSiriQueueObserver startWithQueue:]";
      __int16 v16 = 2112;
      id v17 = queue;
      _os_log_debug_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEBUG, "%s queue = %@", location, 0x16u);
    }
    v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.assistant.queue-observer.%s", dispatch_queue_get_label((dispatch_queue_t)self->_queue));
    objc_initWeak((id *)location, self);
    id v7 = objc_alloc(MEMORY[0x1E4F4E490]);
    double heartBeatInterval = self->_heartBeatInterval;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39___CSSiriQueueObserver_startWithQueue___block_invoke;
    v12[3] = &unk_1E658BA90;
    objc_copyWeak(&v14, (id *)location);
    id v13 = v4;
    __int16 v9 = (AFHeartBeat *)[v7 initWithIdentifier:v6 queue:v13 effectiveDate:0 expirationDuration:v12 heartBeatInterval:0 heartBeatHandler:0.0 invalidationHandler:heartBeatInterval];
    heartBeat = self->_heartBeat;
    self->_heartBeat = v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
}

- (_CSSiriQueueObserver)initWithQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_CSSiriQueueObserver;
  id v13 = [(_CSSiriQueueObserver *)&v18 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    v14->_double heartBeatInterval = a4;
    v14->_double timeoutInterval = a5;
    uint64_t v15 = [v12 copy];
    id timeoutHandler = v14->_timeoutHandler;
    v14->_id timeoutHandler = (id)v15;
  }
  return v14;
}

@end