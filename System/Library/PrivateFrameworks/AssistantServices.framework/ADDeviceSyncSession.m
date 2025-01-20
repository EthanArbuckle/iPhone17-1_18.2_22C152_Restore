@interface ADDeviceSyncSession
- (ADDeviceSyncSession)initWithQueue:(id)a3 deviceIdentifier:(id)a4 dataConsumersByType:(id)a5 dataProvidersByType:(id)a6 messageSenders:(id)a7;
- (BOOL)_handlePulledDeltaWithIncrementalChanges:(id)a3 forDataType:(id)a4;
- (BOOL)_handlePulledSnapshot:(id)a3 forDataType:(id)a4;
- (BOOL)_handlePushedOrPulledGeneration:(unint64_t)a3 forDataType:(id)a4;
- (NSString)deviceIdentifier;
- (void)_handlePingWithCompletion:(id)a3;
- (void)_handlePullDeltaForDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)_handlePullGenerationsForDataTypes:(id)a3 completion:(id)a4;
- (void)_handlePullSnapshotForDataType:(id)a3 completion:(id)a4;
- (void)_handlePushGenerationsByDataType:(id)a3 completion:(id)a4;
- (void)_invalidate;
- (void)_pingWithCompletion:(id)a3;
- (void)_pullDeltaForDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)_pullGenerationsForDataTypes:(id)a3 completion:(id)a4;
- (void)_pullSnapshotForDataType:(id)a3 completion:(id)a4;
- (void)_pushGenerationsByDataType:(id)a3 completion:(id)a4;
- (void)_receiveMessage:(id)a3 completion:(id)a4;
- (void)_sendMessage:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)pushGenerationsByDataTypes:(id)a3;
- (void)receiveMessage:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
@end

@implementation ADDeviceSyncSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_dataProvidersByType, 0);
  objc_storeStrong((id *)&self->_dataConsumersByType, 0);
  objc_storeStrong((id *)&self->_messageSenders, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)_pullSnapshotForDataType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[ADDeviceSyncSession _pullSnapshotForDataType:completion:]";
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s dataType = %@", buf, 0x16u);
  }
  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100131A24;
  v19[3] = &unk_100503360;
  id v20 = v6;
  unint64_t v21 = outgoingSequence;
  id v10 = v6;
  id v11 = +[ADDeviceSyncMessage newWithBuilder:v19];
  v12 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100131AB0;
  v15[3] = &unk_100503338;
  v16 = v12;
  id v17 = v7;
  unint64_t v18 = outgoingSequence;
  v13 = v12;
  id v14 = v7;
  [(ADDeviceSyncSession *)self _sendMessage:v11 completion:v15];
}

- (void)_pullDeltaForDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v29 = "-[ADDeviceSyncSession _pullDeltaForDataType:generation:limit:completion:]";
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 2048;
    unint64_t v33 = a4;
    __int16 v34 = 2048;
    unint64_t v35 = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s dataType = %@, generation = %llu, limit = %llu", buf, 0x2Au);
  }
  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001321E0;
  v23[3] = &unk_1005033D8;
  id v24 = v10;
  unint64_t v25 = outgoingSequence;
  unint64_t v26 = a4;
  unint64_t v27 = a5;
  id v14 = v10;
  id v15 = +[ADDeviceSyncMessage newWithBuilder:v23];
  v16 = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100132270;
  v19[3] = &unk_100503338;
  id v20 = v16;
  id v21 = v11;
  unint64_t v22 = outgoingSequence;
  id v17 = v16;
  id v18 = v11;
  [(ADDeviceSyncSession *)self _sendMessage:v15 completion:v19];
}

- (void)_pullGenerationsForDataTypes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[ADDeviceSyncSession _pullGenerationsForDataTypes:completion:]";
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s dataTypes = %@", buf, 0x16u);
  }
  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100132974;
  v19[3] = &unk_100503360;
  id v20 = v6;
  unint64_t v21 = outgoingSequence;
  id v10 = v6;
  id v11 = +[ADDeviceSyncMessage newWithBuilder:v19];
  v12 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100132A00;
  v15[3] = &unk_100503338;
  v16 = v12;
  id v17 = v7;
  unint64_t v18 = outgoingSequence;
  v13 = v12;
  id v14 = v7;
  [(ADDeviceSyncSession *)self _sendMessage:v11 completion:v15];
}

- (void)_pushGenerationsByDataType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[ADDeviceSyncSession _pushGenerationsByDataType:completion:]";
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s generationsByDataType = %@", buf, 0x16u);
  }
  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100133104;
  v19[3] = &unk_100503360;
  id v20 = v6;
  unint64_t v21 = outgoingSequence;
  id v10 = v6;
  id v11 = +[ADDeviceSyncMessage newWithBuilder:v19];
  v12 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100133190;
  v15[3] = &unk_100503338;
  v16 = v12;
  id v17 = v7;
  unint64_t v18 = outgoingSequence;
  v13 = v12;
  id v14 = v7;
  [(ADDeviceSyncSession *)self _sendMessage:v11 completion:v15];
}

- (void)_pingWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[ADDeviceSyncSession _pingWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t outgoingSequence = self->_outgoingSequence;
  self->_unint64_t outgoingSequence = outgoingSequence + 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100133778;
  v15[3] = &unk_100503310;
  void v15[4] = outgoingSequence;
  id v7 = +[ADDeviceSyncMessage newWithBuilder:v15];
  v8 = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001337D0;
  v11[3] = &unk_100503338;
  v12 = v8;
  id v13 = v4;
  unint64_t v14 = outgoingSequence;
  v9 = v8;
  id v10 = v4;
  [(ADDeviceSyncSession *)self _sendMessage:v7 completion:v11];
}

- (void)_sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    deviceIdentifier = self->_deviceIdentifier;
    *(_DWORD *)buf = 136315650;
    v37 = "-[ADDeviceSyncSession _sendMessage:completion:]";
    __int16 v38 = 2112;
    v39 = deviceIdentifier;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, outgoingMessage = %@", buf, 0x20u);
  }
  unint64_t v22 = v7;
  id v10 = [[ADDeviceSyncMessageSendingContext alloc] initWithQueue:self->_queue deviceIdentifier:self->_deviceIdentifier timeoutDuration:v7 completion:16.0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = self->_messageSenders;
  id v12 = [(NSSet *)v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        [(ADDeviceSyncMessageSendingContext *)v10 beginSendingWithMessageSender:*(void *)(*((void *)&v30 + 1) + 8 * (void)v15)];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSSet *)v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v13);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v16 = self->_messageSenders;
  id v17 = [(NSSet *)v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        unint64_t v21 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v20);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100133EBC;
        v23[3] = &unk_1005032F0;
        __int16 v24 = v10;
        id v25 = v21;
        [v21 sendMessage:v6 completion:v23];

        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSSet *)v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }
}

- (void)_handlePullSnapshotForDataType:(id)a3 completion:(id)a4
{
  id v6 = (OS_dispatch_queue *)a3;
  id v7 = a4;
  v8 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[ADDeviceSyncSession _handlePullSnapshotForDataType:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s dataType = %@", buf, 0x16u);
  }
  if (v7)
  {
    v9 = [(NSDictionary *)self->_dataProvidersByType objectForKey:v6];
    if (v9)
    {
      id v10 = self->_queue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10013411C;
      v14[3] = &unk_1005032C8;
      id v15 = v10;
      id v16 = v7;
      id v11 = v10;
      [v9 getSnapshotWithCompletion:v14];
    }
    else
    {
      id v12 = [objc_alloc((Class)NSString) initWithFormat:@"No data provider for data type %@.", v6];
      id v11 = +[AFError errorWithCode:2410 description:v12 underlyingError:0];

      id v13 = AFSiriLogContextDeviceSync;
      if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v18 = "-[ADDeviceSyncSession _handlePullSnapshotForDataType:completion:]";
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      }
      (*((void (**)(id, void, OS_dispatch_queue *))v7 + 2))(v7, 0, v11);
    }
  }
}

- (void)_handlePullDeltaForDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10 = (OS_dispatch_queue *)a3;
  id v11 = a6;
  id v12 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v22 = "-[ADDeviceSyncSession _handlePullDeltaForDataType:generation:limit:completion:]";
    __int16 v23 = 2112;
    __int16 v24 = v10;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    __int16 v27 = 2048;
    unint64_t v28 = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s dataType = %@, generation = %llu, limit = %llu", buf, 0x2Au);
  }
  if (v11)
  {
    id v13 = [(NSDictionary *)self->_dataProvidersByType objectForKey:v10];
    if (v13)
    {
      uint64_t v14 = self->_queue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001345B4;
      v18[3] = &unk_10050DF10;
      __int16 v19 = v14;
      id v20 = v11;
      id v15 = v14;
      [v13 getIncrementalChangesAfterGeneration:a4 limit:a5 completion:v18];
    }
    else
    {
      id v16 = [objc_alloc((Class)NSString) initWithFormat:@"No data provider for data type %@.", v10];
      id v15 = +[AFError errorWithCode:2410 description:v16 underlyingError:0];

      id v17 = AFSiriLogContextDeviceSync;
      if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unint64_t v22 = "-[ADDeviceSyncSession _handlePullDeltaForDataType:generation:limit:completion:]";
        __int16 v23 = 2112;
        __int16 v24 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      }
      (*((void (**)(id, void, OS_dispatch_queue *))v11 + 2))(v11, 0, v15);
    }
  }
}

- (void)_handlePullGenerationsForDataTypes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v38 = "-[ADDeviceSyncSession _handlePullGenerationsForDataTypes:completion:]";
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s dataTypes = %@", buf, 0x16u);
  }
  if (v7)
  {
    queue = self->_queue;
    v9 = dispatch_group_create();
    id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    unint64_t v21 = v6;
    if (v6)
    {
      id v11 = v6;
    }
    else
    {
      id v11 = [(NSDictionary *)self->_dataProvidersByType allKeys];
    }
    id v12 = v11;
    id v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16, v7);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v18 = [(NSDictionary *)self->_dataProvidersByType objectForKey:v17];
          if (v18)
          {
            dispatch_group_enter(v9);
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_100134B00;
            v27[3] = &unk_1005032A0;
            unint64_t v28 = queue;
            id v29 = v10;
            uint64_t v30 = v17;
            long long v31 = v9;
            [v18 getGenerationWithCompletion:v27];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100134BB0;
    block[3] = &unk_10050E1D8;
    id v24 = v10;
    id v6 = v21;
    id v25 = v21;
    id v7 = v20;
    id v26 = v20;
    id v19 = v10;
    dispatch_group_notify(v9, (dispatch_queue_t)queue, block);
  }
}

- (void)_handlePushGenerationsByDataType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  v8 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADDeviceSyncSession _handlePushGenerationsByDataType:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s generationsByDataType = %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10013505C;
  v14[3] = &unk_100503278;
  void v14[4] = self;
  v14[5] = buf;
  [v6 enumerateKeysAndObjectsUsingBlock:v14];
  if (v7)
  {
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v9 = 0;
    }
    else
    {
      id v10 = objc_alloc((Class)NSString);
      id v11 = [v6 allKeys];
      id v12 = [v10 initWithFormat:@"No data consumer for data types %@.", v11];
      v9 = +[AFError errorWithCode:2411 description:v12 underlyingError:0];

      if (v9)
      {
        id v13 = AFSiriLogContextDeviceSync;
        if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v15 = 136315394;
          id v16 = "-[ADDeviceSyncSession _handlePushGenerationsByDataType:completion:]";
          __int16 v17 = 2112;
          id v18 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s error = %@", v15, 0x16u);
        }
      }
    }
    v7[2](v7, v9);
  }
  _Block_object_dispose(buf, 8);
}

- (void)_handlePingWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  id v4 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADDeviceSyncSession _handlePingWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)_receiveMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    deviceIdentifier = self->_deviceIdentifier;
    *(_DWORD *)buf = 136315650;
    v60 = "-[ADDeviceSyncSession _receiveMessage:completion:]";
    __int16 v61 = 2112;
    v62 = deviceIdentifier;
    __int16 v63 = 2112;
    id v64 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, incomingMessage = %@", buf, 0x20u);
  }
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v54 = sub_100135698;
  v55 = &unk_10050E1D8;
  v56 = self;
  id v10 = v7;
  id v58 = v10;
  id v11 = v6;
  id v57 = v11;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v48 = sub_10013573C;
  v49 = &unk_1005031B0;
  v50 = self;
  id v12 = v10;
  id v52 = v12;
  id v13 = v11;
  id v51 = v13;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v42 = sub_100135800;
  v43 = &unk_100503200;
  v44 = self;
  id v14 = v12;
  id v46 = v14;
  id v15 = v13;
  id v45 = v15;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v36 = sub_1001358C4;
  v37 = &unk_100503228;
  __int16 v38 = self;
  id v16 = v14;
  id v40 = v16;
  id v17 = v15;
  id v39 = v17;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  uint64_t v30 = sub_1001359B8;
  long long v31 = &unk_100503250;
  long long v32 = self;
  id v18 = v16;
  id v34 = v18;
  id v33 = v17;
  id v19 = v33;
  char v20 = v53;
  unint64_t v21 = v47;
  unint64_t v22 = v41;
  __int16 v23 = v35;
  id v24 = v29;
  BOOL v25 = 0;
  switch((unint64_t)[v19 type])
  {
    case 1uLL:
      v54((uint64_t)v20);
      BOOL v25 = 1;
      break;
    case 3uLL:
      id v26 = v23;
      __int16 v27 = [v19 commandPushGenerationsRequest];
      BOOL v25 = v27 != 0;
      if (v27) {
        v48((uint64_t)v21, v27);
      }
      goto LABEL_14;
    case 5uLL:
      id v26 = v23;
      __int16 v27 = [v19 commandPullGenerationsRequest];
      BOOL v25 = v27 != 0;
      if (v27) {
        v42((uint64_t)v22, v27);
      }
      goto LABEL_14;
    case 7uLL:
      id v26 = v23;
      __int16 v27 = [v19 commandPullDeltaRequest];
      BOOL v25 = v27 != 0;
      if (v27) {
        v36((uint64_t)v26, v27);
      }
      goto LABEL_14;
    case 9uLL:
      id v26 = v23;
      __int16 v27 = [v19 commandPullSnapshotRequest];
      BOOL v25 = v27 != 0;
      if (v27) {
        v30((uint64_t)v24, v27);
      }
LABEL_14:

      __int16 v23 = v26;
      break;
    default:
      break;
  }

  if (v18 && !v25)
  {
    unint64_t v28 = +[AFError errorWithCode:2408 description:@"There's no supported request in incoming message." underlyingError:0];
    (*((void (**)(id, void, void *))v18 + 2))(v18, 0, v28);
  }
}

- (BOOL)_handlePulledSnapshot:(id)a3 forDataType:(id)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_dataConsumersByType objectForKey:a4];
  v8 = v7;
  if (v7) {
    [v7 applySnapshot:v6 fromDeviceWithIdentifier:self->_deviceIdentifier];
  }

  return v8 != 0;
}

- (BOOL)_handlePulledDeltaWithIncrementalChanges:(id)a3 forDataType:(id)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_dataConsumersByType objectForKey:a4];
  v8 = v7;
  if (v7) {
    [v7 applyIncrementalChanges:v6 fromDeviceWithIdentifier:self->_deviceIdentifier];
  }

  return v8 != 0;
}

- (BOOL)_handlePushedOrPulledGeneration:(unint64_t)a3 forDataType:(id)a4
{
  id v6 = a4;
  id v7 = [(NSDictionary *)self->_dataConsumersByType objectForKey:v6];
  if (v7)
  {
    v8 = self->_queue;
    objc_initWeak(&location, self);
    deviceIdentifier = self->_deviceIdentifier;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10013641C;
    v12[3] = &unk_100503160;
    id v13 = v7;
    id v14 = self;
    v17[1] = (id)a3;
    id v10 = v8;
    id v15 = v10;
    objc_copyWeak(v17, &location);
    id v16 = v6;
    [v13 getGenerationForDeviceWithIdentifier:deviceIdentifier completion:v12];

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  return v7 != 0;
}

- (void)_invalidate
{
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = 0;

  dataConsumersByType = self->_dataConsumersByType;
  self->_dataConsumersByType = 0;

  dataProvidersByType = self->_dataProvidersByType;
  self->_dataProvidersByType = 0;

  messageSenders = self->_messageSenders;
  self->_messageSenders = 0;
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013699C;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)receiveMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136A70;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136AF4;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)pushGenerationsByDataTypes:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100136B94;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (ADDeviceSyncSession)initWithQueue:(id)a3 deviceIdentifier:(id)a4 dataConsumersByType:(id)a5 dataProvidersByType:(id)a6 messageSenders:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)ADDeviceSyncSession;
  id v18 = [(ADDeviceSyncSession *)&v31 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    char v20 = (NSString *)[v14 copy];
    deviceIdentifier = v19->_deviceIdentifier;
    v19->_deviceIdentifier = v20;

    unint64_t v22 = (NSDictionary *)[v15 copy];
    dataConsumersByType = v19->_dataConsumersByType;
    v19->_dataConsumersByType = v22;

    id v24 = (NSDictionary *)[v16 copy];
    dataProvidersByType = v19->_dataProvidersByType;
    v19->_dataProvidersByType = v24;

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    void v29[2] = sub_100136D14;
    v29[3] = &unk_1005030E8;
    id v30 = v14;
    uint64_t v26 = [v17 objectsPassingTest:v29];
    messageSenders = v19->_messageSenders;
    v19->_messageSenders = (NSSet *)v26;
  }
  return v19;
}

- (void)dealloc
{
  [(ADDeviceSyncSession *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ADDeviceSyncSession;
  [(ADDeviceSyncSession *)&v3 dealloc];
}

@end