@interface ADQueueMonitor
+ (id)sharedMonitor;
- (ADQueueMonitor)init;
- (void)_addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)_beginMonitoring;
- (void)_endMonitoring;
- (void)_removeQueue:(id)a3;
- (void)addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)beginMonitoring;
- (void)endMonitoring;
- (void)removeQueue:(id)a3;
@end

@implementation ADQueueMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_endMonitoring
{
  int64_t numberOfTransactions = self->_numberOfTransactions;
  if (numberOfTransactions == 1)
  {
    v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[ADQueueMonitor _endMonitoring]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(NSMutableDictionary *)self->_observersByIdentifier allValues];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) stop];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    int64_t numberOfTransactions = self->_numberOfTransactions;
  }
  self->_int64_t numberOfTransactions = numberOfTransactions - 1;
}

- (void)_beginMonitoring
{
  int64_t numberOfTransactions = self->_numberOfTransactions;
  if (!numberOfTransactions)
  {
    v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[ADQueueMonitor _beginMonitoring]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(NSMutableDictionary *)self->_observersByIdentifier allValues];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) startWithQueue:self->_queue];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    int64_t numberOfTransactions = self->_numberOfTransactions;
  }
  self->_int64_t numberOfTransactions = numberOfTransactions + 1;
}

- (void)_removeQueue:(id)a3
{
  v4 = a3;
  id v5 = objc_alloc((Class)NSString);
  label = dispatch_queue_get_label(v4);

  id v8 = [v5 initWithUTF8String:label];
  id v7 = -[NSMutableDictionary objectForKey:](self->_observersByIdentifier, "objectForKey:");
  if (v7)
  {
    [(NSMutableDictionary *)self->_observersByIdentifier removeObjectForKey:v8];
    [v7 stop];
  }
}

- (void)_addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  long long v10 = a3;
  id v11 = a6;
  id v12 = [objc_alloc((Class)NSString) initWithUTF8String:dispatch_queue_get_label(v10)];
  long long v13 = [(NSMutableDictionary *)self->_observersByIdentifier objectForKey:v12];

  if (v13)
  {
    v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      v17 = "-[ADQueueMonitor _addQueue:heartBeatInterval:timeoutInterval:timeoutHandler:]";
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Queue %@ is already being observed.", (uint8_t *)&v16, 0x16u);
    }
  }
  [(ADQueueMonitor *)self _removeQueue:v10];
  v15 = [[_ADQueueObserver alloc] initWithQueue:v10 heartBeatInterval:v11 timeoutInterval:a4 timeoutHandler:a5];

  [(NSMutableDictionary *)self->_observersByIdentifier setObject:v15 forKey:v12];
  if (self->_numberOfTransactions >= 1) {
    [(_ADQueueObserver *)v15 startWithQueue:self->_queue];
  }
}

- (void)endMonitoring
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADQueueMonitor endMonitoring]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003080AC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)beginMonitoring
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADQueueMonitor beginMonitoring]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003081B8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeQueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100308258;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030833C;
  block[3] = &unk_10050BC30;
  block[4] = self;
  id v16 = v10;
  double v18 = a4;
  double v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

- (ADQueueMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)ADQueueMonitor;
  v2 = [(ADQueueMonitor *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.queue-monitor", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    observersByIdentifier = v2->_observersByIdentifier;
    v2->_observersByIdentifier = v7;
  }
  return v2;
}

+ (id)sharedMonitor
{
  if (qword_1005862E0 != -1) {
    dispatch_once(&qword_1005862E0, &stru_10050BC08);
  }
  v2 = (void *)qword_1005862E8;
  return v2;
}

@end