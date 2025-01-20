@interface ADDeviceSyncCoordinator
- (ADDeviceSyncCoordinator)init;
- (id)_sessionWithDeviceIdentifier:(id)a3;
- (void)_getGenerationsForDataTypes:(id)a3 andPushToDeviceWithIdentifier:(id)a4;
- (void)deviceSyncDataProviderDidUpdate:(id)a3;
- (void)deviceSyncMessageService:(id)a3 didFoundDeviceWithIdentifier:(id)a4;
- (void)deviceSyncMessageService:(id)a3 didLostDeviceWithIdentifier:(id)a4;
- (void)deviceSyncMessageService:(id)a3 didReceiveMessage:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
@end

@implementation ADDeviceSyncCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionsByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_dataProvidersByType, 0);
  objc_storeStrong((id *)&self->_dataConsumersByType, 0);
  objc_storeStrong((id *)&self->_messagingServicesByChannel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_getGenerationsForDataTypes:(id)a3 andPushToDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v19 = a4;
  queue = self->_queue;
  v7 = dispatch_group_create();
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  if (v6)
  {
    id v9 = v6;
  }
  else
  {
    id v9 = [(NSDictionary *)self->_dataProvidersByType allKeys];
  }
  v10 = v9;
  v21 = v6;
  id v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16, v19);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v16 = [(NSDictionary *)self->_dataProvidersByType objectForKey:v15];
        if (v16)
        {
          dispatch_group_enter(v7);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10012BB3C;
          v27[3] = &unk_1005032A0;
          v28 = queue;
          id v29 = v8;
          uint64_t v30 = v15;
          v31 = v7;
          [v16 getGenerationWithCompletion:v27];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012BBEC;
  block[3] = &unk_10050DCB8;
  id v24 = v20;
  v25 = self;
  id v26 = v8;
  id v17 = v8;
  id v18 = v20;
  dispatch_group_notify(v7, (dispatch_queue_t)queue, block);
}

- (id)_sessionWithDeviceIdentifier:(id)a3
{
  v4 = (ADDeviceSyncSession *)a3;
  v5 = [(NSMutableDictionary *)self->_sessionsByDeviceIdentifier objectForKey:v4];
  if (!v5)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADDeviceSyncCoordinator _sessionWithDeviceIdentifier:]";
      __int16 v24 = 2112;
      v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Creating session for device with identifier %@...", buf, 0x16u);
    }
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSDictionary count](self->_messagingServicesByChannel, "count"));
    messagingServicesByChannel = self->_messagingServicesByChannel;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10012C000;
    v19[3] = &unk_100502E58;
    id v9 = v7;
    id v20 = v9;
    v10 = v4;
    v21 = v10;
    [(NSDictionary *)messagingServicesByChannel enumerateKeysAndObjectsUsingBlock:v19];
    id v11 = [ADDeviceSyncSession alloc];
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.assistant.device-sync.session.%@", v10];
    uint64_t v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v16 = dispatch_queue_create(v13, v15);
    v5 = [(ADDeviceSyncSession *)v11 initWithQueue:v16 deviceIdentifier:v10 dataConsumersByType:self->_dataConsumersByType dataProvidersByType:self->_dataProvidersByType messageSenders:v9];

    [(NSMutableDictionary *)self->_sessionsByDeviceIdentifier setObject:v5 forKey:v10];
    id v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "-[ADDeviceSyncCoordinator _sessionWithDeviceIdentifier:]";
      __int16 v24 = 2112;
      v25 = v5;
      __int16 v26 = 2112;
      v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Created session %@ for device with identifier %@.", buf, 0x20u);
    }
  }
  return v5;
}

- (void)deviceSyncDataProviderDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADDeviceSyncCoordinator deviceSyncDataProviderDidUpdate:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s deviceSyncDataProvider = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012C1B8;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)deviceSyncMessageService:(id)a3 didReceiveMessage:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "-[ADDeviceSyncCoordinator deviceSyncMessageService:didReceiveMessage:fromDeviceWithIdentifier:completion:]";
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s deviceSyncMessageService = %@, deviceIdentifier = %@, incomingMessage = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10012C3FC;
  v19[3] = &unk_10050E228;
  void v19[4] = self;
  id v20 = v12;
  id v21 = v11;
  id v22 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  dispatch_async(queue, v19);
}

- (void)deviceSyncMessageService:(id)a3 didLostDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[ADDeviceSyncCoordinator deviceSyncMessageService:didLostDeviceWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s deviceSyncMessageService = %@, deviceIdentifier = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012C5B4;
  v11[3] = &unk_10050E160;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void)deviceSyncMessageService:(id)a3 didFoundDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[ADDeviceSyncCoordinator deviceSyncMessageService:didFoundDeviceWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s deviceSyncMessageService = %@, deviceIdentifier = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012C7D4;
  v11[3] = &unk_10050E160;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (ADDeviceSyncCoordinator)init
{
  v46.receiver = self;
  v46.super_class = (Class)ADDeviceSyncCoordinator;
  v2 = [(ADDeviceSyncCoordinator *)&v46 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.device-sync.coordinator", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = objc_alloc_init((Class)NSMutableArray);
    id v8 = objc_alloc_init((Class)NSMutableArray);
    if (AFIsHorseman())
    {
      id v9 = objc_alloc_init(ADDeviceSyncTimerConsumer);
      [v7 addObject:v9];

      id v10 = [[ADDeviceSyncTimerProvider alloc] initWithDelegate:v2];
      [v8 addObject:v10];
    }
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v12 = v7;
    id v13 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v43;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v43 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v18 = [v17 type];
          [v11 setObject:v17 forKey:v18];
        }
        id v14 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v14);
    }

    id v19 = (NSDictionary *)[v11 copy];
    dataConsumersByType = v2->_dataConsumersByType;
    v2->_dataConsumersByType = v19;

    id v21 = objc_alloc_init((Class)NSMutableDictionary);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v8;
    id v23 = [v22 countByEnumeratingWithState:&v38 objects:v49 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          __int16 v27 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
          id v28 = objc_msgSend(v27, "type", (void)v38);
          [v21 setObject:v27 forKey:v28];
        }
        id v24 = [v22 countByEnumeratingWithState:&v38 objects:v49 count:16];
      }
      while (v24);
    }

    __int16 v29 = (NSDictionary *)[v21 copy];
    dataProvidersByType = v2->_dataProvidersByType;
    v2->_dataProvidersByType = v29;

    v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionsByDeviceIdentifier = v2->_sessionsByDeviceIdentifier;
    v2->_sessionsByDeviceIdentifier = v31;

    long long v33 = [[ADDeviceSyncMessagingServiceRapport alloc] initWithMode:1 delegate:v2];
    long long v34 = [(ADDeviceSyncMessagingServiceRapport *)v33 channel];
    v47 = v34;
    v48 = v33;
    uint64_t v35 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    messagingServicesByChannel = v2->_messagingServicesByChannel;
    v2->_messagingServicesByChannel = (NSDictionary *)v35;
  }
  return v2;
}

@end