@interface ADRemoteTimerManager
- (ADRemoteTimerManager)init;
- (id)_storageForDeviceWithIdentifier:(id)a3;
- (void)_invalidateStorageForDeviceWithIdentifier:(id)a3;
- (void)_sendStereoPartnerAction:(id)a3 timerID:(id)a4 changes:(id)a5 completion:(id)a6;
- (void)accessStorageForDeviceWithIdentifier:(id)a3 usingBlock:(id)a4;
- (void)clockItemStorageDidUpdate:(id)a3 insertedItemIDs:(id)a4 updatedItemIDs:(id)a5 deletedItemIDs:(id)a6;
- (void)finalizeStorageForDeviceWithIdentifier:(id)a3;
- (void)getSnapshotForDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)getSnapshotsByDeviceIdentifierWithCompletion:(id)a3;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)prepareStorageForDeviceWithIdentifier:(id)a3;
- (void)removeTimerWithID:(id)a3 completion:(id)a4;
- (void)updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5;
@end

@implementation ADRemoteTimerManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storagesByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_sendStereoPartnerAction:(id)a3 timerID:(id)a4 changes:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (AFIsHorseman())
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    [v14 setObject:v10 forKey:@"action"];
    if (v11)
    {
      v15 = [v11 UUIDString];
      [v14 setObject:v15 forKey:@"timer-id-string"];
    }
    if (v12) {
      [v14 setObject:v12 forKey:@"timer-changes"];
    }
    v16 = self->_queue;
    v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[ADRemoteTimerManager _sendStereoPartnerAction:timerID:changes:completion:]";
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Sending stereo partner message %@...", buf, 0x16u);
    }
    v18 = +[ADCompanionService sharedInstance];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10007B874;
    v20[3] = &unk_100504BB8;
    v21 = v16;
    id v22 = v13;
    v19 = v16;
    [v18 sendStereoPartnerMessage:v14 messageType:@"clocktimer" completion:v20];

    goto LABEL_11;
  }
  if (v13)
  {
    id v14 = +[AFError errorWithCode:2114];
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v14);
LABEL_11:
  }
}

- (void)_invalidateStorageForDeviceWithIdentifier:(id)a3
{
  id v6 = a3;
  v4 = -[NSMutableDictionary objectForKey:](self->_storagesByDeviceIdentifier, "objectForKey:");
  v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMutableDictionary *)self->_storagesByDeviceIdentifier removeObjectForKey:v6];
  }
}

- (id)_storageForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_storagesByDeviceIdentifier objectForKey:v4];
  if (!v5)
  {
    id v5 = [objc_alloc((Class)AFClockItemStorage) initWithIdentifier:v4 delegate:self];
    [(NSMutableDictionary *)self->_storagesByDeviceIdentifier setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[ADRemoteTimerManager handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, messageType = %@", buf, 0x20u);
  }
  if (AFIsHorseman())
  {
    if ([v10 isEqualToString:@"clocktimer"])
    {
      id v14 = [v9 objectForKey:@"action"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v14 = 0;
      }
      v15 = [v9 objectForKey:@"timer-id-string"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
      }
      else {
        id v16 = 0;
      }
      v19 = [v9 objectForKey:@"timer-changes"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v19 = 0;
      }
      v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v29 = "-[ADRemoteTimerManager handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        id v33 = v16;
        __int16 v34 = 2112;
        v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s action = %@, timerID = %@, changes = %@", buf, 0x2Au);
      }
      if ([v14 isEqualToString:@"update-timer"])
      {
        if (v16 && v19)
        {
          v21 = +[ADClockService sharedService];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10007C320;
          v26[3] = &unk_1004FFE50;
          id v27 = v12;
          [v21 updateTimerWithID:v16 changes:v19 completion:v26];

          id v22 = v27;
          goto LABEL_29;
        }
      }
      else if ([v14 isEqualToString:@"remove-timer"] && v16)
      {
        v23 = +[ADClockService sharedService];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10007C518;
        v24[3] = &unk_1004FFE50;
        id v25 = v12;
        [v23 removeTimerWithID:v16 completion:v24];

        id v22 = v25;
        goto LABEL_29;
      }
      if (!v12)
      {
LABEL_30:

        goto LABEL_31;
      }
      id v22 = +[AFError errorWithCode:2114];
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v22);
LABEL_29:

      goto LABEL_30;
    }
    v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[ADRemoteTimerManager handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Received message from unknown message type: %@", buf, 0x16u);
      if (!v12) {
        goto LABEL_32;
      }
      goto LABEL_13;
    }
    if (v12)
    {
LABEL_13:
      uint64_t v17 = 1004;
      goto LABEL_14;
    }
  }
  else if (v12)
  {
    uint64_t v17 = 2114;
LABEL_14:
    id v14 = +[AFError errorWithCode:v17];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
LABEL_31:
  }
LABEL_32:
}

- (void)clockItemStorageDidUpdate:(id)a3 insertedItemIDs:(id)a4 updatedItemIDs:(id)a5 deletedItemIDs:(id)a6
{
  id v6 = +[ADCommandCenter sharedCommandCenter];
  [v6 setAlertContextDirty];
}

- (void)removeTimerWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007C81C;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007C9B4;
  v15[3] = &unk_10050E228;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)accessStorageForDeviceWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007CB38;
    block[3] = &unk_10050E1D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

- (void)finalizeStorageForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007CC44;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)prepareStorageForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007CCE8;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getSnapshotsByDeviceIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007CDD4;
    v8[3] = &unk_10050E188;
    v8[4] = self;
    id v9 = v4;
    dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
    dispatch_async(queue, v7);
  }
}

- (void)getSnapshotForDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007D0FC;
    block[3] = &unk_10050E1D8;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(queue, v9);
  }
}

- (ADRemoteTimerManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)ADRemoteTimerManager;
  v2 = [(ADRemoteTimerManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.assistant.remote-timer-manager", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    storagesByDeviceIdentifier = v2->_storagesByDeviceIdentifier;
    v2->_storagesByDeviceIdentifier = v6;

    if (AFIsHorseman())
    {
      id v8 = +[ADCompanionService sharedInstance];
      [v8 setMessageHandler:v2 forMessageType:@"clocktimer"];
    }
    else
    {
      dispatch_block_t v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v13 = "-[ADRemoteTimerManager init]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s This platform does not support stereo partner timers", buf, 0xCu);
      }
    }
  }
  return v2;
}

@end