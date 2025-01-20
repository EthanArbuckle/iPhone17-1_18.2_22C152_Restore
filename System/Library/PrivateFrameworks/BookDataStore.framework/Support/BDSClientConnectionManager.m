@interface BDSClientConnectionManager
- (BDSClientConnectionManager)init;
- (BDSServiceNotificationStore)notificationStore;
- (NSMutableArray)clients;
- (NSMutableDictionary)clientsByConnection;
- (id)_keyForConnection:(id)a3;
- (void)_handleFetchNotificationNames:(id)a3 latestChangeToken:(int64_t)a4 forClient:(id)a5 completion:(id)a6;
- (void)_handleServiceNotification:(id)a3;
- (void)_postServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4;
- (void)_postServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4 forClients:(id)a5;
- (void)addClient:(id)a3;
- (void)cq_postServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4 forClients:(id)a5;
- (void)dealloc;
- (void)monitorServiceNotificationsWithConnection:(id)a3 changeToken:(id)a4 completion:(id)a5;
- (void)removeClient:(id)a3 reason:(id)a4;
- (void)setClients:(id)a3;
- (void)setClientsByConnection:(id)a3;
- (void)setNotificationStore:(id)a3;
@end

@implementation BDSClientConnectionManager

- (void)cq_postServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4 forClients:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callQueue);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v16 = sub_100006CE0();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v24 = v8;
          __int16 v25 = 2114;
          v26 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending notifications %{public}@ to client %{public}@", buf, 0x16u);
        }

        v17 = [v15 connection];
        v18 = [v17 remoteObjectProxy];

        [v18 handleServiceNotificationNames:v8 latestChangeToken:a4];
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }
}

- (void)monitorServiceNotificationsWithConnection:(id)a3 changeToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BDSClientConnectionManager *)self _keyForConnection:v8];
  os_unfair_lock_lock(&self->_stateLock);
  id v12 = [(BDSClientConnectionManager *)self clientsByConnection];
  uint64_t v13 = [v12 objectForKeyedSubscript:v11];

  os_unfair_lock_unlock(&self->_stateLock);
  v14 = sub_100006CE0();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v13;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "monitorServiceNotifications: %{public}@, changeToken: %{public}@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v16 = [(BDSClientConnectionManager *)self notificationStore];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100004A88;
    v20[3] = &unk_100260C20;
    objc_copyWeak(&v23, (id *)buf);
    id v21 = v13;
    id v22 = v10;
    [v16 fetchNotificationNamesAfterToken:v9 withCompletion:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001E62B8((uint64_t)v11, v15);
    }

    v17 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1000 userInfo:0];
    id v18 = objc_retainBlock(v10);
    long long v19 = v18;
    if (v18) {
      (*((void (**)(id, void *))v18 + 2))(v18, v17);
    }
  }
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 connection];
  v6 = [(BDSClientConnectionManager *)self _keyForConnection:v5];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v8 = [(BDSClientConnectionManager *)self clients];
  [v8 addObject:v4];

  id v9 = [(BDSClientConnectionManager *)self clientsByConnection];
  [v9 setObject:v4 forKey:v6];

  id v10 = sub_100006CE0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(BDSClientConnectionManager *)self clients];
    id v12 = [v11 count];
    uint64_t v13 = [(BDSClientConnectionManager *)self clientsByConnection];
    int v14 = 138543874;
    id v15 = v4;
    __int16 v16 = 2048;
    id v17 = v12;
    __int16 v18 = 2048;
    id v19 = [v13 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Added client %{public}@, count = %lu, %lu", (uint8_t *)&v14, 0x20u);
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (NSMutableDictionary)clientsByConnection
{
  return self->_clientsByConnection;
}

- (id)_keyForConnection:(id)a3
{
  return +[NSValue valueWithNonretainedObject:a3];
}

- (BDSServiceNotificationStore)notificationStore
{
  return self->_notificationStore;
}

- (void)_postServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4 forClients:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [[BDSOSTransaction alloc] initWithTransactionName:"BDSClientConnectionManagerPostServiceNotificationNames"];
  id v11 = sub_100006CE0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "About to dispatch notifications %{public}@", buf, 0xCu);
  }

  callQueue = self->_callQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A32C;
  block[3] = &unk_100260C70;
  block[4] = self;
  id v17 = v8;
  id v19 = v10;
  int64_t v20 = a4;
  id v18 = v9;
  uint64_t v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async((dispatch_queue_t)callQueue, block);
}

- (void)_handleFetchNotificationNames:(id)a3 latestChangeToken:(int64_t)a4 forClient:(id)a5 completion:(id)a6
{
  p_stateLock = &self->_stateLock;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  os_unfair_lock_lock(p_stateLock);
  [v12 setMonitorsServiceNotifications:1];
  os_unfair_lock_unlock(p_stateLock);
  id v16 = v12;
  id v14 = +[NSArray arrayWithObjects:&v16 count:1];

  [(BDSClientConnectionManager *)self _postServiceNotificationNames:v13 latestChangeToken:a4 forClients:v14];
  id v15 = (void (**)(id, void))objc_retainBlock(v11);

  if (v15) {
    v15[2](v15, 0);
  }
}

- (BDSClientConnectionManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)BDSClientConnectionManager;
  v2 = [(BDSClientConnectionManager *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BDSClientConnectionManager.callQueue", v3);
    callQueue = v2->_callQueue;
    v2->_callQueue = (OS_dispatch_queue *)v4;

    v2->_stateLock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clients = v2->_clients;
    v2->_clients = v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientsByConnection = v2->_clientsByConnection;
    v2->_clientsByConnection = v8;

    id v10 = objc_alloc_init(BDSServiceNotificationStore);
    notificationStore = v2->_notificationStore;
    v2->_notificationStore = v10;

    if (sub_10000C008())
    {
      id v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:v2 selector:"_handleServiceNotification:" name:@"BDSServiceNotificationName" object:0];
    }
  }
  return v2;
}

- (void)dealloc
{
  if (sub_10000C008())
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"BDSServiceNotificationName" object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)BDSClientConnectionManager;
  [(BDSClientConnectionManager *)&v4 dealloc];
}

- (void)removeClient:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 connection];
  id v9 = [(BDSClientConnectionManager *)self _keyForConnection:v8];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v11 = [(BDSClientConnectionManager *)self clients];
  [v11 removeObject:v6];

  id v12 = [(BDSClientConnectionManager *)self clientsByConnection];
  [v12 removeObjectForKey:v9];

  id v13 = sub_100006CE0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v14 = [(BDSClientConnectionManager *)self clients];
    id v15 = [v14 count];
    id v16 = [(BDSClientConnectionManager *)self clientsByConnection];
    int v17 = 138544130;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 2048;
    id v22 = v15;
    __int16 v23 = 2048;
    id v24 = [v16 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ client %{public}@, count = %lu, %lu", (uint8_t *)&v17, 0x2Au);
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)_handleServiceNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"name"];

  if ([v6 length])
  {
    objc_initWeak(&location, self);
    id v7 = [(BDSClientConnectionManager *)self notificationStore];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000313D0;
    v8[3] = &unk_100260C48;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    [v7 enqueueNotificationName:v9 withCompletion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_postServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_lock(&self->_stateLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(BDSClientConnectionManager *)self clients];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v13 monitorsServiceNotifications]) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_stateLock);
  if ([v7 count]) {
    [(BDSClientConnectionManager *)self _postServiceNotificationNames:v6 latestChangeToken:a4 forClients:v7];
  }
}

- (void)setClients:(id)a3
{
}

- (void)setClientsByConnection:(id)a3
{
}

- (void)setNotificationStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationStore, 0);
  objc_storeStrong((id *)&self->_clientsByConnection, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_callQueue, 0);
}

@end