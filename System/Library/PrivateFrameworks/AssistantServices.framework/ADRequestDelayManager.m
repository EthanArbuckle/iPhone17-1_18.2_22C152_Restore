@interface ADRequestDelayManager
- (ADRequestDelayManager)initWithQueue:(id)a3;
- (ADRequestDelayManagerDelegate)delegate;
- (BOOL)isDelaying;
- (id)_delayedCommandHandlers;
- (id)_delayedcontextCommandHandlers;
- (void)_beginTimerForContextCommands;
- (void)beginTimerForContextCommands;
- (void)dequeueDelayedCommandsAndSend:(BOOL)a3 completion:(id)a4;
- (void)interceptCommand:(id)a3 completion:(id)a4;
- (void)releaseStoredContextCommandsAndSendCommands:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsDelaying:(BOOL)a3;
- (void)startDelaying;
- (void)stopDelayingAndSendCommands:(BOOL)a3 completion:(id)a4;
@end

@implementation ADRequestDelayManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentContextCommandsTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delayedcontextCommandHandlers, 0);
  objc_storeStrong((id *)&self->_delayedCommandHandlers, 0);
}

- (void)setIsDelaying:(BOOL)a3
{
  self->_isDelaying = a3;
}

- (BOOL)isDelaying
{
  return self->_isDelaying;
}

- (void)setDelegate:(id)a3
{
}

- (ADRequestDelayManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADRequestDelayManagerDelegate *)WeakRetained;
}

- (void)interceptCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_100585BA8 != -1) {
    dispatch_once(&qword_100585BA8, &stru_100502710);
  }
  id v8 = (id)qword_100585BA0;
  v9 = [v6 groupIdentifier];
  uint64_t v10 = [v8 objectForKey:v9];
  if (!v10)
  {

    goto LABEL_9;
  }
  v11 = (void *)v10;
  v12 = [v6 groupIdentifier];
  v13 = [v8 objectForKey:v12];
  v14 = [v6 encodedClassName];
  unsigned int v15 = [v13 containsObject:v14];

  if (!v15)
  {
LABEL_9:
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011064C;
    block[3] = &unk_10050E1D8;
    block[4] = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_async(queue, block);

    goto LABEL_10;
  }
  v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[ADRequestDelayManager interceptCommand:completion:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Whitelisted command received, bypassing delay: %@", buf, 0x16u);
  }
  (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
LABEL_10:
}

- (void)_beginTimerForContextCommands
{
  v3 = [(ADRequestDelayManager *)self _delayedcontextCommandHandlers];
  id v4 = [v3 count];

  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc((Class)AFWatchdogTimer);
    queue = self->_queue;
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100110ADC;
    v14 = &unk_10050B790;
    objc_copyWeak(&v15, &location);
    id v7 = (AFWatchdogTimer *)[v5 initWithTimeoutInterval:queue onQueue:&v11 timeoutHandler:60.0];
    currentContextCommandsTimer = self->_currentContextCommandsTimer;
    self->_currentContextCommandsTimer = v7;

    v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[ADRequestDelayManager _beginTimerForContextCommands]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Starting/Resetting context commands timer", buf, 0xCu);
    }
    [(AFWatchdogTimer *)self->_currentContextCommandsTimer reset];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[ADRequestDelayManager _beginTimerForContextCommands]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Context command queue empty, not starting timer", buf, 0xCu);
    }
  }
}

- (void)beginTimerForContextCommands
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110C14;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)releaseStoredContextCommandsAndSendCommands:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [(ADRequestDelayManager *)self _delayedcontextCommandHandlers];
    int v12 = 136315650;
    v13 = "-[ADRequestDelayManager releaseStoredContextCommandsAndSendCommands:]";
    __int16 v14 = 2048;
    id v15 = [v7 count];
    __int16 v16 = 1024;
    BOOL v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Releasing %lu delayed context commands sendCommands: %d", (uint8_t *)&v12, 0x1Cu);
  }
  while (1)
  {
    uint64_t v10 = [(ADRequestDelayManager *)self _delayedcontextCommandHandlers];
    id v11 = [v10 count];

    if (!v11) {
      break;
    }
    id v8 = [(ADRequestDelayManager *)self _delayedcontextCommandHandlers];
    v9 = [v8 dequeueObject];
    v9[2](v9, v3);
  }
}

- (void)dequeueDelayedCommandsAndSend:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  while (1)
  {
    id v6 = [(ADRequestDelayManager *)self _delayedCommandHandlers];
    id v7 = [v6 count];

    if (!v7) {
      break;
    }
    id v8 = [(ADRequestDelayManager *)self _delayedCommandHandlers];
    v9 = [v8 dequeueObject];

    v9[2](v9, v4);
  }
  uint64_t v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    uint64_t v10 = v11;
  }
}

- (void)stopDelayingAndSendCommands:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110ED0;
  block[3] = &unk_10050D378;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)startDelaying
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001110A8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_delayedcontextCommandHandlers
{
  delayedcontextCommandHandlers = self->_delayedcontextCommandHandlers;
  if (!delayedcontextCommandHandlers)
  {
    BOOL v4 = (AFQueue *)objc_alloc_init((Class)AFQueue);
    id v5 = self->_delayedcontextCommandHandlers;
    self->_delayedcontextCommandHandlers = v4;

    delayedcontextCommandHandlers = self->_delayedcontextCommandHandlers;
  }
  return delayedcontextCommandHandlers;
}

- (id)_delayedCommandHandlers
{
  delayedCommandHandlers = self->_delayedCommandHandlers;
  if (!delayedCommandHandlers)
  {
    BOOL v4 = (AFQueue *)objc_alloc_init((Class)AFQueue);
    id v5 = self->_delayedCommandHandlers;
    self->_delayedCommandHandlers = v4;

    delayedCommandHandlers = self->_delayedCommandHandlers;
  }
  return delayedCommandHandlers;
}

- (ADRequestDelayManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADRequestDelayManager;
  id v6 = [(ADRequestDelayManager *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end