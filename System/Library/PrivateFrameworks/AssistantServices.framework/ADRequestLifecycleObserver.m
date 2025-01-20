@interface ADRequestLifecycleObserver
+ (id)sharedObserver;
- (ADRequestLifecycleObserver)init;
- (void)_addListener:(id)a3;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)_removeListener:(id)a3;
- (void)addListener:(id)a3;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)removeListener:(id)a3;
- (void)requestDidEndWithInfo:(id)a3 fromOrigin:(int64_t)a4 client:(id)a5;
- (void)requestWasCancelledWithInfo:(id)a3 forReason:(int64_t)a4 origin:(int64_t)a5 client:(id)a6 successorInfo:(id)a7;
- (void)requestWillBeginWithInfo:(id)a3 fromOrigin:(int64_t)a4 client:(id)a5;
@end

@implementation ADRequestLifecycleObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_listenersLock = &self->_listenersLock;
    os_unfair_lock_lock(&self->_listenersLock);
    v6 = [(NSHashTable *)self->_listeners setRepresentation];
    os_unfair_lock_unlock(p_listenersLock);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002108BC;
    v7[3] = &unk_100506EE0;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (void)_removeListener:(id)a3
{
  if (a3)
  {
    p_listenersLock = &self->_listenersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_listenersLock);
    [(NSHashTable *)self->_listeners removeObject:v5];

    os_unfair_lock_unlock(p_listenersLock);
  }
}

- (void)_addListener:(id)a3
{
  p_listenersLock = &self->_listenersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_listenersLock);
  [(NSHashTable *)self->_listeners addObject:v5];

  os_unfair_lock_unlock(p_listenersLock);
}

- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, uint64_t))a6;
  v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    v19 = "-[ADRequestLifecycleObserver _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, messageType = %@", (uint8_t *)&v18, 0x20u);
  }
  if ([v11 isEqualToString:@"requestlifecycle"])
  {
    v15 = [v10 objectForKey:@"event"];
    if ([v15 isEqualToString:@"requestWillBegin"])
    {
      [(ADRequestLifecycleObserver *)self requestWillBeginWithInfo:0 fromOrigin:7 client:0];
    }
    else if ([v15 isEqualToString:@"requestDidEnd"])
    {
      [(ADRequestLifecycleObserver *)self requestDidEndWithInfo:0 fromOrigin:7 client:0];
    }
    else if ([v15 isEqualToString:@"requestWasCancelled"])
    {
      [(ADRequestLifecycleObserver *)self requestWasCancelledWithInfo:0 forReason:0 origin:7 client:0 successorInfo:0];
    }
    if (!v13) {
      goto LABEL_16;
    }
    uint64_t v17 = 0;
LABEL_15:
    v13[2](v13, 0, v17);
LABEL_16:

    goto LABEL_17;
  }
  v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315394;
    v19 = "-[ADRequestLifecycleObserver _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Received message from unknown message type: %@", (uint8_t *)&v18, 0x16u);
    if (!v13) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  if (v13)
  {
LABEL_8:
    uint64_t v17 = +[AFError errorWithCode:1004];
    v15 = (void *)v17;
    goto LABEL_15;
  }
LABEL_17:
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100210D10;
  block[3] = &unk_10050D3F0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)requestDidEndWithInfo:(id)a3 fromOrigin:(int64_t)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[ADRequestLifecycleObserver requestDidEndWithInfo:fromOrigin:client:]";
    __int16 v27 = 2048;
    int64_t v28 = a4;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s origin = %ld client = %@ requestInfo = %@", buf, 0x2Au);
  }
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_100210F14;
  id v18 = &unk_100506E10;
  v19 = self;
  id v11 = v8;
  id v20 = v11;
  int64_t v22 = a4;
  id v12 = v9;
  id v21 = v12;
  [(ADRequestLifecycleObserver *)self _enumerateListenersUsingBlock:&v15];
  if (a4 == 5)
  {
    id v13 = +[ADCompanionService sharedInstance];
    CFStringRef v23 = @"event";
    CFStringRef v24 = @"requestDidEnd";
    v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v13 sendStereoPartnerMessage:v14 messageType:@"requestlifecycle" completion:&stru_100506EB8];
  }
}

- (void)requestWasCancelledWithInfo:(id)a3 forReason:(int64_t)a4 origin:(int64_t)a5 client:(id)a6 successorInfo:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v34 = "-[ADRequestLifecycleObserver requestWasCancelledWithInfo:forReason:origin:client:successorInfo:]";
    __int16 v35 = 2048;
    int64_t v36 = a5;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2112;
    id v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s origin = %ld client = %@ requestInfo = %@", buf, 0x2Au);
  }
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  CFStringRef v23 = sub_10021119C;
  CFStringRef v24 = &unk_100506E78;
  v25 = self;
  id v16 = v12;
  id v26 = v16;
  int64_t v29 = a4;
  int64_t v30 = a5;
  id v17 = v13;
  id v27 = v17;
  id v18 = v14;
  id v28 = v18;
  [(ADRequestLifecycleObserver *)self _enumerateListenersUsingBlock:&v21];
  if (a5 == 5)
  {
    v19 = +[ADCompanionService sharedInstance];
    CFStringRef v31 = @"event";
    CFStringRef v32 = @"requestWasCancelled";
    id v20 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v19 sendStereoPartnerMessage:v20 messageType:@"requestlifecycle" completion:&stru_100506E98];
  }
}

- (void)requestWillBeginWithInfo:(id)a3 fromOrigin:(int64_t)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v26 = "-[ADRequestLifecycleObserver requestWillBeginWithInfo:fromOrigin:client:]";
    __int16 v27 = 2048;
    int64_t v28 = a4;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s origin = %ld client = %@ requestInfo = %@", buf, 0x2Au);
  }
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1002113F8;
  id v18 = &unk_100506E10;
  v19 = self;
  id v11 = v8;
  id v20 = v11;
  int64_t v22 = a4;
  id v12 = v9;
  id v21 = v12;
  [(ADRequestLifecycleObserver *)self _enumerateListenersUsingBlock:&v15];
  if (a4 == 5)
  {
    id v13 = +[ADCompanionService sharedInstance];
    CFStringRef v23 = @"event";
    CFStringRef v24 = @"requestWillBegin";
    id v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v13 sendStereoPartnerMessage:v14 messageType:@"requestlifecycle" completion:&stru_100506E50];
  }
}

- (void)removeListener:(id)a3
{
}

- (void)addListener:(id)a3
{
}

- (ADRequestLifecycleObserver)init
{
  v11.receiver = self;
  v11.super_class = (Class)ADRequestLifecycleObserver;
  v2 = [(ADRequestLifecycleObserver *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.request-lifecycle-observer", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_listenersLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v7;

    id v9 = +[ADCompanionService sharedInstance];
    [v9 setMessageHandler:v2 forMessageType:@"requestlifecycle"];
  }
  return v2;
}

+ (id)sharedObserver
{
  if (qword_100585ED8 != -1) {
    dispatch_once(&qword_100585ED8, &stru_100506DE8);
  }
  v2 = (void *)qword_100585EE0;
  return v2;
}

@end