@interface ADPushContextReceiver
- (ADPushContextReceiver)initWithCollector:(id)a3 pid:(int)a4 connection:(id)a5;
- (void)sendContext:(id)a3;
@end

@implementation ADPushContextReceiver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_collector);
}

- (void)sendContext:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int pid = self->_pid;
    int v9 = 136315394;
    v10 = "-[ADPushContextReceiver sendContext:]";
    __int16 v11 = 1024;
    int v12 = pid;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Got context for pid %d", (uint8_t *)&v9, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collector);
  [WeakRetained _setContext:v4 forPID:self->_pid];

  id v8 = objc_loadWeakRetained((id *)&self->_connection);
  [v8 invalidate];
}

- (ADPushContextReceiver)initWithCollector:(id)a3 pid:(int)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ADPushContextReceiver;
  v10 = [(ADPushContextReceiver *)&v13 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_collector, v8);
    v11->_int pid = a4;
    objc_storeWeak((id *)&v11->_connection, v9);
  }

  return v11;
}

@end