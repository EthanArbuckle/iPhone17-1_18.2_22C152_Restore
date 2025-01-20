@interface APSTTLCollection
+ (id)suppressedTTRTopics;
- (APSTTLCollection)initWithQueue:(id)a3 ttlInSeconds:(double)a4;
- (APSTTLCollectionDelegate)delegate;
- (double)ttlInSeconds;
- (void)_performEvictionSweep;
- (void)_startEvictionTimerIfNeeded;
- (void)_stopEvictionTimer;
- (void)_stopEvictionTimerIfEmpty;
- (void)addItem:(id)a3;
- (void)addItem:(id)a3 withInitialState:(unsigned int)a4;
- (void)addItem:(id)a3 withInitialState:(unsigned int)a4 withTopic:(id)a5;
- (void)dealloc;
- (void)removeItem:(id)a3;
- (void)removeItem:(id)a3 withFlag:(unsigned int)a4;
- (void)setDelegate:(id)a3;
@end

@implementation APSTTLCollection

+ (id)suppressedTTRTopics
{
  if (qword_10015A828 != -1) {
    dispatch_once(&qword_10015A828, &stru_10012A5B8);
  }
  v2 = (void *)qword_10015A820;
  return v2;
}

- (APSTTLCollection)initWithQueue:(id)a3 ttlInSeconds:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APSTTLCollection;
  v8 = [(APSTTLCollection *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    backingStore = v9->_backingStore;
    v9->_backingStore = v10;

    v9->_ttlInSeconds = a4;
  }

  return v9;
}

- (void)addItem:(id)a3
{
  if (a3) {
    -[APSTTLCollection addItem:withInitialState:](self, "addItem:withInitialState:");
  }
}

- (void)addItem:(id)a3 withInitialState:(unsigned int)a4
{
  if (a3) {
    [(APSTTLCollection *)self addItem:a3 withInitialState:*(void *)&a4 withTopic:0];
  }
}

- (void)addItem:(id)a3 withInitialState:(unsigned int)a4 withTopic:(id)a5
{
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    id v8 = a5;
    id v9 = a3;
    v10 = [[APSTTLCollectionItemInfo alloc] initWithTTLInSeconds:v5 state:v8 withTopic:self->_ttlInSeconds];

    [(NSMutableDictionary *)self->_backingStore setObject:v10 forKey:v9];
    [(APSTTLCollection *)self _startEvictionTimerIfNeeded];
  }
}

- (void)removeItem:(id)a3
{
}

- (void)removeItem:(id)a3 withFlag:(unsigned int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    id v7 = [(NSMutableDictionary *)self->_backingStore objectForKey:v6];
    LODWORD(v8) = [v7 itemState];

    if ((v8 & a4) != 0)
    {
      uint64_t v8 = v8 ^ a4;
      id v9 = [(NSMutableDictionary *)self->_backingStore objectForKey:v10];
      [v9 setItemState:v8];
    }
    if (!v8)
    {
      [(NSMutableDictionary *)self->_backingStore removeObjectForKey:v10];
      [(APSTTLCollection *)self _stopEvictionTimerIfEmpty];
    }
  }
  _objc_release_x1();
}

- (void)dealloc
{
  [(APSTTLCollection *)self _stopEvictionTimer];
  v3.receiver = self;
  v3.super_class = (Class)APSTTLCollection;
  [(APSTTLCollection *)&v3 dealloc];
}

- (void)_startEvictionTimerIfNeeded
{
  if ([(NSMutableDictionary *)self->_backingStore count])
  {
    if (!self->_evictionTimer)
    {
      double ttlInSeconds = self->_ttlInSeconds;
      double v4 = ttlInSeconds * 1.2;
      double v5 = ttlInSeconds * 0.1;
      id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
      evictionTimer = self->_evictionTimer;
      self->_evictionTimer = v6;

      dispatch_source_set_timer((dispatch_source_t)self->_evictionTimer, 0, (unint64_t)(v4 * 1000000000.0), (unint64_t)(v5 * 1000000000.0));
      uint64_t v8 = +[CUTWeakReference weakRefWithObject:self];
      id v9 = self->_evictionTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100022714;
      handler[3] = &unk_10012A5E0;
      id v12 = v8;
      id v10 = v8;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume((dispatch_object_t)self->_evictionTimer);
    }
  }
}

- (void)_stopEvictionTimer
{
  evictionTimer = self->_evictionTimer;
  if (evictionTimer)
  {
    dispatch_source_cancel(evictionTimer);
    double v4 = self->_evictionTimer;
    self->_evictionTimer = 0;
  }
}

- (void)_stopEvictionTimerIfEmpty
{
  if (![(NSMutableDictionary *)self->_backingStore count])
  {
    [(APSTTLCollection *)self _stopEvictionTimer];
  }
}

- (void)_performEvictionSweep
{
  objc_super v3 = +[NSDate date];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  backingStore = self->_backingStore;
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_100022AEC;
  v23 = &unk_10012A608;
  id v8 = v3;
  id v24 = v8;
  id v9 = v6;
  id v25 = v9;
  id v10 = v4;
  id v26 = v10;
  id v11 = v5;
  id v27 = v11;
  [(NSMutableDictionary *)backingStore enumerateKeysAndObjectsUsingBlock:&v20];
  if (objc_msgSend(v10, "count", v20, v21, v22, v23))
  {
    id v12 = +[APSLog ttlCollection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v29 = self;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Timed out waiting for tracing enabled acks. Invoking TTR. {ttlCollection:%@; Guids:%@; States:%@}",
        buf,
        0x20u);
    }

    [(NSMutableDictionary *)self->_backingStore removeObjectsForKeys:v10];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 ttlCollection:self itemsDidExpire:v10];
    }
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 ttlCollection:self itemsDidExpire:v10 withStates:v11];
    }
  }
  if ([v9 count])
  {
    v19 = +[APSLog ttlCollection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Timed out waiting for tracing enabled. {ttlCollection:%@; suppressedTopicItems:%@}",
        buf,
        0x16u);
    }

    [(NSMutableDictionary *)self->_backingStore removeObjectsForKeys:v9];
  }
  [(APSTTLCollection *)self _stopEvictionTimerIfEmpty];
  [(APSTTLCollection *)self _startEvictionTimerIfNeeded];
}

- (APSTTLCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSTTLCollectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)ttlInSeconds
{
  return self->_ttlInSeconds;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_evictionTimer, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

@end