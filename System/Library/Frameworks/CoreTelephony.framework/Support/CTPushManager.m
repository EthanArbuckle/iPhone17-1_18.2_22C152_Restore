@interface CTPushManager
- (CTPushManager)initWithPushController:(shared_ptr<push:(dispatch_queue_s *)a4 :PushController>)a3 andQueue:;
- (id).cxx_construct;
- (void)_connect;
- (void)_disconnect;
- (void)_reconnect;
- (void)_setEnabledTopics_sync:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)setEnabledTopics:(__CFArray *)a3;
- (void)startConnection;
- (void)useDevelopmentEnvironment:(BOOL)a3;
@end

@implementation CTPushManager

- (CTPushManager)initWithPushController:(shared_ptr<push:(dispatch_queue_s *)a4 :PushController>)a3 andQueue:
{
  var1 = a3.var1;
  var0 = a3.var0;
  v11.receiver = self;
  v11.super_class = (Class)CTPushManager;
  v6 = [(CTPushManager *)&v11 init];
  if (v6)
  {
    dispatch_retain((dispatch_object_t)var1);
    v6->_queue = (dispatch_queue_s *)var1;
    v6->_connection = 0;
    v6->_currentTopics = 0;
    v8 = *(PushController **)var0;
    uint64_t v7 = *((void *)var0 + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v6->_controller.__cntrl_;
    v6->_controller.__ptr_ = v8;
    v6->_controller.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v6->_environment = (NSString *)APSEnvironmentProduction;
  }
  return v6;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)CTPushManager;
  [(CTPushManager *)&v4 dealloc];
}

- (void)_connect
{
  if (!self->_connection)
  {
    pthread_mutex_lock(&stru_101B09E48);
    uint64_t v3 = off_101B09E88;
    if (!off_101B09E88) {
      sub_1012D6D0C(&v8);
    }
    objc_super v4 = (std::__shared_weak_count *)*(&off_101B09E88 + 1);
    if (*(&off_101B09E88 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_101B09E88 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&stru_101B09E48);
    v5 = *(NSObject **)(v3 + 32);
    if (v4) {
      sub_10004D2C8(v4);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [[(NSString *)self->_environment description] UTF8String];
      int v8 = 136315138;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Starting connection to apsd environment:%s", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = (APSConnection *)[objc_alloc((Class)APSConnection) initWithEnvironmentName:self->_environment namedDelegatePort:@"com.apple.aps.CommCenter" queue:self->_queue];
    self->_connection = v7;
    [(APSConnection *)v7 setDelegate:self];
  }
}

- (void)_disconnect
{
  pthread_mutex_lock(&stru_101B09E48);
  uint64_t v3 = off_101B09E88;
  if (!off_101B09E88) {
    sub_1012D6D0C(&v6);
  }
  objc_super v4 = (std::__shared_weak_count *)*(&off_101B09E88 + 1);
  if (*(&off_101B09E88 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_101B09E88 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_101B09E48);
  v5 = *(NSObject **)(v3 + 32);
  if (v4) {
    sub_10004D2C8(v4);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Stopping connection to apsd", (uint8_t *)&v6, 2u);
  }

  self->_connection = 0;
}

- (void)startConnection
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1012D3DC0;
  block[3] = &unk_1019B3470;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setEnabledTopics_sync:(id)a3
{
  if (!self->_connection) {
    [(CTPushManager *)self _connect];
  }
  currentTopics = self->_currentTopics;
  if (currentTopics)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v5 = [(NSArray *)currentTopics countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v39;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v39 != v6) {
            objc_enumerationMutation(currentTopics);
          }
          [(APSConnection *)self->_connection invalidateTokenForTopic:*(void *)(*((void *)&v38 + 1) + 8 * i) identifier:0];
        }
        id v5 = [(NSArray *)currentTopics countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v5);
    }

    self->_currentTopics = 0;
  }
  if (a3 && [a3 count])
  {
    pthread_mutex_lock(&stru_101B09E48);
    uint64_t v8 = off_101B09E88;
    if (!off_101B09E88) {
      sub_1012D6D0C(buf);
    }
    v9 = (std::__shared_weak_count *)*(&off_101B09E88 + 1);
    if (*(&off_101B09E88 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_101B09E88 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&stru_101B09E48);
    v10 = *(NSObject **)(v8 + 32);
    if (v9) {
      sub_10004D2C8(v9);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [a3 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I setting %zu topics: ", buf, 0xCu);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = [a3 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v35;
      *(void *)&long long v13 = 136315138;
      long long v28 = v13;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(a3);
          }
          v16 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
          pthread_mutex_lock(&stru_101B09E48);
          uint64_t v17 = off_101B09E88;
          if (!off_101B09E88) {
            sub_1012D6D0C(buf);
          }
          v18 = (std::__shared_weak_count *)*(&off_101B09E88 + 1);
          if (*(&off_101B09E88 + 1)) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_101B09E88 + 1) + 8), 1uLL, memory_order_relaxed);
          }
          pthread_mutex_unlock(&stru_101B09E48);
          v19 = *(NSObject **)(v17 + 32);
          if (v18) {
            sub_10004D2C8(v18);
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [v16 UTF8String];
            *(_DWORD *)buf = v28;
            *(void *)&buf[4] = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I \t%s", buf, 0xCu);
          }
        }
        id v12 = [a3 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v12);
    }
    v21 = (NSArray *)a3;
    self->_currentTopics = v21;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v22 = [(NSArray *)v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v31;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v21);
          }
          -[APSConnection requestTokenForTopic:identifier:](self->_connection, "requestTokenForTopic:identifier:", *(void *)(*((void *)&v30 + 1) + 8 * (void)k), 0, v28);
        }
        id v22 = [(NSArray *)v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v22);
    }
    -[APSConnection setEnabledTopics:](self->_connection, "setEnabledTopics:", a3, v28);
  }
  else
  {
    pthread_mutex_lock(&stru_101B09E48);
    uint64_t v25 = off_101B09E88;
    if (!off_101B09E88) {
      sub_1012D6D0C(buf);
    }
    v26 = (std::__shared_weak_count *)*(&off_101B09E88 + 1);
    if (*(&off_101B09E88 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_101B09E88 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&stru_101B09E48);
    v27 = *(NSObject **)(v25 + 32);
    if (v26) {
      sub_10004D2C8(v26);
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I no topics to listen to", buf, 2u);
    }
    [(CTPushManager *)self _disconnect];
  }
}

- (void)_reconnect
{
  [(CTPushManager *)self _disconnect];
  [(CTPushManager *)self _connect];
  currentTopics = self->_currentTopics;
  if (currentTopics)
  {
    id v4 = [(NSArray *)currentTopics copy];
    [(CTPushManager *)self _setEnabledTopics_sync:v4];
  }
}

- (void)setEnabledTopics:(__CFArray *)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1012D43E0;
  v4[3] = &unk_1019B3448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)useDevelopmentEnvironment:(BOOL)a3
{
  if (a3) {
    id v4 = (id *)&APSEnvironmentDevelopment;
  }
  else {
    id v4 = (id *)&APSEnvironmentProduction;
  }
  id v5 = (NSString *)*v4;
  id v6 = [*v4 compare:self->_environment];
  self->_environment = v5;
  if (v6)
  {
    pthread_mutex_lock(&stru_101B09E48);
    uint64_t v7 = off_101B09E88;
    if (!off_101B09E88) {
      sub_1012D6D0C(v11);
    }
    uint64_t v8 = (std::__shared_weak_count *)*(&off_101B09E88 + 1);
    if (*(&off_101B09E88 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_101B09E88 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&stru_101B09E48);
    v9 = *(NSObject **)(v7 + 32);
    if (v8) {
      sub_10004D2C8(v8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [[(NSString *)self->_environment description] UTF8String];
      *(_DWORD *)id v11 = 136315138;
      *(void *)&v11[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I setting apns environment due to change %s", v11, 0xCu);
    }
    [(CTPushManager *)self _reconnect];
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  pthread_mutex_lock(&stru_101B09E48);
  uint64_t v6 = off_101B09E88;
  if (a4)
  {
    if (!off_101B09E88) {
      sub_1012D6D0C(buf);
    }
    uint64_t v7 = (std::__shared_weak_count *)*(&off_101B09E88 + 1);
    if (*(&off_101B09E88 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_101B09E88 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&stru_101B09E48);
    uint64_t v8 = *(NSObject **)(v6 + 32);
    if (v7) {
      sub_10004D2C8(v7);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I received public push token", buf, 2u);
    }
    *(void *)buf = a4;
    CFRetain(a4);
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3321888768;
    v12[2] = sub_1012D47F8;
    v12[3] = &unk_101AAB028;
    v12[4] = self;
    id v13 = a4;
    CFRetain(a4);
    dispatch_async(queue, v12);
    sub_100030068((const void **)&v13);
    sub_100030068((const void **)buf);
  }
  else
  {
    if (!off_101B09E88) {
      sub_1012D6D0C(buf);
    }
    v10 = (std::__shared_weak_count *)*(&off_101B09E88 + 1);
    if (*(&off_101B09E88 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_101B09E88 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&stru_101B09E48);
    id v11 = *(NSObject **)(v6 + 32);
    if (v10) {
      sub_10004D2C8(v10);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E received public token update with missing token", buf, 2u);
    }
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1012D4918;
  block[3] = &unk_101A6B758;
  block[4] = a4;
  void block[5] = a5;
  block[6] = self;
  dispatch_async(queue, block);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1012D4C40;
  v5[3] = &unk_1019B3420;
  v5[4] = a4;
  v5[5] = self;
  dispatch_async(queue, v5);
}

- (void).cxx_destruct
{
  cntrl = self->_controller.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end