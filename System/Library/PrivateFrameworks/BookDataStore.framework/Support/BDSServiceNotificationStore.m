@interface BDSServiceNotificationStore
- (BDSServiceNotificationStore)init;
- (BDSServiceNotificationStoreDataFile)dataFile;
- (NSMutableDictionary)notificationInfosByName;
- (int64_t)currentChangeToken;
- (void)_q_save:(id)a3;
- (void)enqueueNotificationName:(id)a3 withCompletion:(id)a4;
- (void)fetchNotificationNamesAfterToken:(id)a3 withCompletion:(id)a4;
- (void)q_enqueueNotificationName:(id)a3 withCompletion:(id)a4;
- (void)q_fetchNotificationNamesAfterToken:(id)a3 withCompletion:(id)a4;
- (void)q_load;
- (void)q_save;
- (void)q_updateNotificationInfoWithName:(id)a3 changeToken:(int64_t)a4;
- (void)setCurrentChangeToken:(int64_t)a3;
- (void)setDataFile:(id)a3;
- (void)setNotificationInfosByName:(id)a3;
@end

@implementation BDSServiceNotificationStore

- (void)q_fetchNotificationNamesAfterToken:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6)
  {
    id v20 = v7;
    id v8 = [v6 integerValue];
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = [(BDSServiceNotificationStore *)self notificationInfosByName];
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v14);
          v16 = [(BDSServiceNotificationStore *)self notificationInfosByName];
          v17 = [v16 objectForKeyedSubscript:v15];

          if ((uint64_t)[v17 changeToken] > (uint64_t)v8) {
            [v9 addObject:v17];
          }

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    [v9 sortUsingComparator:&stru_100261A28];
    id v18 = [v9 valueForKey:@"name"];

    id v7 = v20;
  }
  else
  {
    id v18 = objc_alloc_init((Class)NSArray);
  }
  v19 = (void (**)(id, id, int64_t))objc_retainBlock(v7);
  if (v19) {
    v19[2](v19, v18, [(BDSServiceNotificationStore *)self currentChangeToken]);
  }
}

- (void)fetchNotificationNamesAfterToken:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100006CE0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "fetchNotificationNamesAfterToken: %{public}@", buf, 0xCu);
  }

  id v9 = [[BDSOSTransaction alloc] initWithTransactionName:"BDSServiceNotificationStoreFetchNotificationNamesAfterToken"];
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004AFC;
  v14[3] = &unk_1002619C0;
  v14[4] = self;
  id v15 = v6;
  v16 = v9;
  id v17 = v7;
  id v11 = v9;
  id v12 = v7;
  id v13 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, v14);
}

- (int64_t)currentChangeToken
{
  return self->_currentChangeToken;
}

- (BDSServiceNotificationStore)init
{
  v14.receiver = self;
  v14.super_class = (Class)BDSServiceNotificationStore;
  v2 = [(BDSServiceNotificationStore *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BDSServiceNotificationStore.dispatchQueue", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_currentChangeToken = 0;
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    notificationInfosByName = v2->_notificationInfosByName;
    v2->_notificationInfosByName = v6;

    if (sub_10000C008())
    {
      uint64_t v8 = +[BDSServiceNotificationStoreDataFile sharedInstance];
      dataFile = v2->_dataFile;
      v2->_dataFile = (BDSServiceNotificationStoreDataFile *)v8;
    }
    v10 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005DC04;
    block[3] = &unk_10025F700;
    id v13 = v2;
    dispatch_async(v10, block);
  }
  return v2;
}

- (void)enqueueNotificationName:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100006CE0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "enqueueNotificationName: %{public}@", buf, 0xCu);
  }

  id v9 = [[BDSOSTransaction alloc] initWithTransactionName:"BDSServiceNotificationStoreEnqueueNotificationName"];
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005DD7C;
  v14[3] = &unk_1002619C0;
  v14[4] = self;
  id v15 = v6;
  v16 = v9;
  id v17 = v7;
  id v11 = v9;
  id v12 = v7;
  id v13 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, v14);
}

- (void)q_enqueueNotificationName:(id)a3 withCompletion:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  id v9 = (char *)[(BDSServiceNotificationStore *)self currentChangeToken] + 1;
  [(BDSServiceNotificationStore *)self setCurrentChangeToken:v9];
  [(BDSServiceNotificationStore *)self q_updateNotificationInfoWithName:v8 changeToken:v9];

  [(BDSServiceNotificationStore *)self q_save];
  id v11 = objc_retainBlock(v7);

  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, char *))v11 + 2))(v11, v9);
    v10 = v11;
  }
}

- (void)q_updateNotificationInfoWithName:(id)a3 changeToken:(int64_t)a4
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = [(BDSServiceNotificationStore *)self notificationInfosByName];
  id v7 = [v6 objectForKeyedSubscript:v9];

  if (v7)
  {
    [(BDSServiceNotificationInfo *)v7 setChangeToken:a4];
  }
  else
  {
    id v7 = [[BDSServiceNotificationInfo alloc] initWithName:v9 changeToken:a4];
    id v8 = [(BDSServiceNotificationStore *)self notificationInfosByName];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
}

- (void)q_load
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = [(BDSServiceNotificationStore *)self dataFile];
  dispatch_queue_t v4 = [v3 load];

  if (v4)
  {
    -[BDSServiceNotificationStore setCurrentChangeToken:](self, "setCurrentChangeToken:", [v4 changeToken]);
    v5 = [(BDSServiceNotificationStore *)self notificationInfosByName];
    [v5 removeAllObjects];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = objc_msgSend(v4, "notificationInfos", 0);
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
          id v12 = [(BDSServiceNotificationStore *)self notificationInfosByName];
          id v13 = [v11 name];
          [v12 setObject:v11 forKeyedSubscript:v13];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)q_save
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = [(BDSServiceNotificationStore *)self dataFile];

  if (v3)
  {
    id v4 = [(BDSServiceNotificationStore *)self dataFile];
    [(BDSServiceNotificationStore *)self _q_save:v4];
  }
}

- (void)_q_save:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  int64_t v6 = [(BDSServiceNotificationStore *)self currentChangeToken];
  id v7 = [(BDSServiceNotificationStore *)self notificationInfosByName];
  id v9 = [v7 allValues];

  id v8 = [[BDSServiceNotificationStoreData alloc] initWithNotificationInfos:v9 changeToken:v6];
  [v5 save:v8];
}

- (BDSServiceNotificationStoreDataFile)dataFile
{
  return self->_dataFile;
}

- (void)setDataFile:(id)a3
{
}

- (NSMutableDictionary)notificationInfosByName
{
  return self->_notificationInfosByName;
}

- (void)setNotificationInfosByName:(id)a3
{
}

- (void)setCurrentChangeToken:(int64_t)a3
{
  self->_currentChangeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationInfosByName, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end