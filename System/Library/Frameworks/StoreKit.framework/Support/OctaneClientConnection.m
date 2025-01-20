@interface OctaneClientConnection
+ (id)_connectionForUUID:(id)a3;
+ (id)addConnectionWithBundleID:(id)a3 connection:(id)a4 type:(int64_t)a5;
+ (id)connectionsForBundleID:(id)a3;
+ (unint64_t)observerCountForEventIdentifier:(id)a3;
+ (void)_enumerateAllConnectionsWithBlock:(id)a3;
+ (void)initialize;
+ (void)receiveEventOfType:(int64_t)a3 withData:(id)a4 onAllObserversWithID:(id)a5;
+ (void)removeConnectionWithUUID:(id)a3;
- (OctaneClientConnection)initWithBundleID:(id)a3 connection:(id)a4 type:(int64_t)a5;
- (void)dealloc;
- (void)receiveEventOfType:(int64_t)a3 eventData:(id)a4 identifier:(id)a5;
- (void)registerObservationID:(id)a3;
- (void)transactionDeleted:(unint64_t)a3 forBundleID:(id)a4;
- (void)transactionUpdated:(id)a3 forBundleID:(id)a4;
- (void)unregisterObservationID:(id)a3;
@end

@implementation OctaneClientConnection

+ (void)initialize
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)qword_1003A0118;
  qword_1003A0118 = v2;

  qword_1003A0120 = objc_opt_new();

  _objc_release_x1();
}

+ (id)addConnectionWithBundleID:(id)a3 connection:(id)a4 type:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[OctaneClientConnection alloc] initWithBundleID:v7 connection:v8 type:a5];

  v10 = (void *)qword_1003A0120;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007D1D8;
  v16[3] = &unk_1003580D0;
  id v17 = v7;
  v11 = v9;
  v18 = v11;
  id v12 = v7;
  sub_10006B9F0(v10, v16);
  v13 = v18;
  v14 = v11;

  return v14;
}

+ (id)connectionsForBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10007D380;
  v18 = sub_10007D390;
  id v19 = 0;
  v4 = (void *)qword_1003A0120;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_10007D398;
  v11 = &unk_1003571D0;
  v13 = &v14;
  id v5 = v3;
  id v12 = v5;
  sub_10006B9F0(v4, &v8);
  v6 = objc_msgSend((id)v15[5], "allObjects", v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);

  return v6;
}

+ (void)removeConnectionWithUUID:(id)a3
{
  v4 = [a1 _connectionForUUID:a3];
  id v5 = v4;
  if (v4)
  {
    v6 = (void *)qword_1003A0120;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10007D63C;
    v23[3] = &unk_100358170;
    id v7 = v4;
    v24 = v7;
    sub_10006B9F0(v6, v23);
    if (v7[5] == (id)1)
    {
      id v8 = [v7[4] mutableCopy];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10007D69C;
      v21[3] = &unk_100359C58;
      id v9 = v8;
      id v22 = v9;
      [a1 _enumerateAllConnectionsWithBlock:v21];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v14);
            uint64_t v16 = +[OctaneManager sharedInstance];
            [v16 unregisterForEventWithIdentifier:v15];

            uint64_t v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }
        while (v12);
      }
    }
  }
}

+ (unint64_t)observerCountForEventIdentifier:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007D7E0;
  v7[3] = &unk_100359C80;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [a1 _enumerateAllConnectionsWithBlock:v7];
  unint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (void)receiveEventOfType:(int64_t)a3 withData:(id)a4 onAllObserversWithID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10007D380;
  v26 = sub_10007D390;
  id v27 = (id)objc_opt_new();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007DA40;
  v19[3] = &unk_100359C80;
  id v10 = v9;
  id v20 = v10;
  v21 = &v22;
  [a1 _enumerateAllConnectionsWithBlock:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = (id)v23[5];
  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v14), "receiveEventOfType:eventData:identifier:", a3, v8, v10, (void)v15);
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v22, 8);
}

+ (void)_enumerateAllConnectionsWithBlock:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = objc_opt_new();
  unint64_t v5 = (void *)qword_1003A0120;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007DC64;
  v16[3] = &unk_100358170;
  id v6 = v4;
  id v17 = v6;
  sub_10006B9F0(v5, v16);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v12 + 1) + 8 * (void)v10);
        objc_sync_enter(v11);
        v3[2](v3, v11);
        objc_sync_exit(v11);

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (id)_connectionForUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_10007D380;
  long long v15 = sub_10007D390;
  id v16 = 0;
  id v4 = (void *)qword_1003A0120;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007DF44;
  v8[3] = &unk_100358058;
  id v5 = v3;
  id v9 = v5;
  id v10 = &v11;
  sub_10006B9F0(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (OctaneClientConnection)initWithBundleID:(id)a3 connection:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)OctaneClientConnection;
  id v10 = [(OctaneClientConnection *)&v24 init];
  if (v10)
  {
    uint64_t v11 = [v9 userInfo];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v11 objectForKeyedSubscript:@"octaneClientUUID"],
          long long v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      uint64_t v13 = (NSString *)[v8 copy];
      bundleID = v10->_bundleID;
      v10->_bundleID = v13;

      uint64_t v15 = [v9 remoteObjectProxy];
      remoteObject = v10->_remoteObject;
      v10->_remoteObject = (ASDOctaneClientProtocol *)v15;

      id v17 = [v11 objectForKeyedSubscript:@"octaneClientUUID"];
      long long v18 = (NSString *)[v17 copy];
      uuid = v10->_uuid;
      v10->_uuid = v18;

      v10->_type = a5;
      if (a5 != 1)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v20 = objc_opt_new();
      eventObservations = v10->_eventObservations;
      v10->_eventObservations = (NSMutableSet *)v20;
    }
    else
    {
      if (qword_1003A0170 != -1) {
        dispatch_once(&qword_1003A0170, &stru_100359CA8);
      }
      uint64_t v22 = qword_1003A0160;
      if (os_log_type_enabled((os_log_t)qword_1003A0160, OS_LOG_TYPE_ERROR)) {
        sub_1002C91D8((uint64_t)v9, v22);
      }
      eventObservations = v10;
      id v10 = 0;
    }

    goto LABEL_12;
  }
LABEL_13:

  return v10;
}

- (void)dealloc
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007E348;
  v4[3] = &unk_100358170;
  v4[4] = self;
  sub_10006B9F0((void *)qword_1003A0120, v4);
  v3.receiver = self;
  v3.super_class = (Class)OctaneClientConnection;
  [(OctaneClientConnection *)&v3 dealloc];
}

- (void)registerObservationID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_eventObservations addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterObservationID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_eventObservations removeObject:v5];
  objc_sync_exit(v4);
}

- (void)transactionDeleted:(unint64_t)a3 forBundleID:(id)a4
{
  if (!self->_type) {
    [(ASDOctaneClientProtocol *)self->_remoteObject transactionDeleted:a3 forBundleID:a4];
  }
}

- (void)transactionUpdated:(id)a3 forBundleID:(id)a4
{
  if (!self->_type) {
    [(ASDOctaneClientProtocol *)self->_remoteObject transactionUpdated:a3 forBundleID:a4];
  }
}

- (void)receiveEventOfType:(int64_t)a3 eventData:(id)a4 identifier:(id)a5
{
  if (self->_type == 1) {
    [(ASDOctaneClientProtocol *)self->_remoteObject receiveEventOfType:a3 eventData:a4 identifier:a5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventObservations, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end