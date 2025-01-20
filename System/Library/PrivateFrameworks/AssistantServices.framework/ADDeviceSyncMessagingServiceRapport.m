@interface ADDeviceSyncMessagingServiceRapport
- (ADDeviceSyncMessagingServiceRapport)initWithMode:(int64_t)a3 delegate:(id)a4;
- (NSString)channel;
- (void)_handleCompanionServiceActiveDevicesDidChange;
- (void)_handleCompanionServiceReadyStateDidChange;
- (void)_handleCompanionServiceStereoConfigurationDidChange;
- (void)_handleIncomingDictionary:(id)a3 fromDeviceWithIdentifier:(id)a4 completion:(id)a5;
- (void)_handleOutgoingMessage:(id)a3 toDeviceWithIdentifier:(id)a4 completion:(id)a5;
- (void)_invalidate;
- (void)_setDeviceIdentifiers:(id)a3;
- (void)_setIsReady:(BOOL)a3;
- (void)_setStereoPartnerDeviceIdentifier:(id)a3;
- (void)companionServiceActiveDevicesDidChange:(id)a3;
- (void)companionServiceReadyStateDidChange:(id)a3;
- (void)companionServiceStereoConfigurationDidChange:(id)a3;
- (void)dealloc;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)invalidate;
- (void)sendMessage:(id)a3 toDeviceWithIdentifier:(id)a4 completion:(id)a5;
@end

@implementation ADDeviceSyncMessagingServiceRapport

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stereoPartnerDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_companionService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_setStereoPartnerDeviceIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  v5 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[ADDeviceSyncMessagingServiceRapport _setStereoPartnerDeviceIdentifier:]";
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s stereoPartnerDeviceIdentifier = %@", (uint8_t *)&v13, 0x16u);
  }
  stereoPartnerDeviceIdentifier = self->_stereoPartnerDeviceIdentifier;
  if (stereoPartnerDeviceIdentifier != v4
    && ![(NSString *)stereoPartnerDeviceIdentifier isEqualToString:v4])
  {
    v7 = AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      v8 = self->_stereoPartnerDeviceIdentifier;
      int v13 = 136315650;
      v14 = "-[ADDeviceSyncMessagingServiceRapport _setStereoPartnerDeviceIdentifier:]";
      __int16 v15 = 2112;
      v16 = v8;
      __int16 v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s stereoPartnerDeviceIdentifier: %@ -> %@", (uint8_t *)&v13, 0x20u);
    }
    if (self->_stereoPartnerDeviceIdentifier)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained deviceSyncMessageService:self didLostDeviceWithIdentifier:self->_stereoPartnerDeviceIdentifier];
    }
    v10 = (NSString *)[(NSString *)v4 copy];
    v11 = self->_stereoPartnerDeviceIdentifier;
    self->_stereoPartnerDeviceIdentifier = v10;

    if (self->_stereoPartnerDeviceIdentifier)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 deviceSyncMessageService:self didFoundDeviceWithIdentifier:self->_stereoPartnerDeviceIdentifier];
    }
  }
}

- (void)_handleCompanionServiceStereoConfigurationDidChange
{
  if (self->_mode == 1)
  {
    v3 = AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[ADDeviceSyncMessagingServiceRapport _handleCompanionServiceStereoConfigurationDidChange]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    companionService = self->_companionService;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000ADD1C;
    v5[3] = &unk_100500A40;
    objc_copyWeak(&v6, (id *)buf);
    [(ADCompanionService *)companionService getStereoPartnerIdentifierWithCompletion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_setDeviceIdentifiers:(id)a3
{
  v4 = (NSSet *)a3;
  v5 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[ADDeviceSyncMessagingServiceRapport _setDeviceIdentifiers:]";
    __int16 v43 = 2112;
    v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s deviceIdentifiers = %@", buf, 0x16u);
  }
  deviceIdentifiers = self->_deviceIdentifiers;
  if (deviceIdentifiers != v4 && ![(NSSet *)deviceIdentifiers isEqualToSet:v4])
  {
    if ([(NSSet *)v4 count])
    {
      if ([(NSSet *)self->_deviceIdentifiers count])
      {
        v7 = (NSSet *)[(NSSet *)v4 mutableCopy];
        [(NSSet *)v7 minusSet:self->_deviceIdentifiers];
      }
      else
      {
        v7 = v4;
      }
    }
    else
    {
      v7 = 0;
    }
    if ([(NSSet *)v7 count])
    {
      v8 = AFSiriLogContextDeviceSync;
      if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[ADDeviceSyncMessagingServiceRapport _setDeviceIdentifiers:]";
        __int16 v43 = 2112;
        v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s deviceIdentifiers: + %@", buf, 0x16u);
      }
    }
    if ([(NSSet *)self->_deviceIdentifiers count])
    {
      NSUInteger v9 = [(NSSet *)v4 count];
      v10 = self->_deviceIdentifiers;
      if (v9)
      {
        v11 = (NSSet *)[(NSSet *)v10 mutableCopy];
        [(NSSet *)v11 minusSet:v4];
      }
      else
      {
        v11 = v10;
      }
    }
    else
    {
      v11 = 0;
    }
    NSUInteger v12 = [(NSSet *)v11 count];
    int v13 = AFSiriLogContextDeviceSync;
    if (v12 && os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[ADDeviceSyncMessagingServiceRapport _setDeviceIdentifiers:]";
      __int16 v43 = 2112;
      v44 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s deviceIdentifiers: - %@", buf, 0x16u);
      int v13 = AFSiriLogContextDeviceSync;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = self->_deviceIdentifiers;
      *(_DWORD *)buf = 136315650;
      v42 = "-[ADDeviceSyncMessagingServiceRapport _setDeviceIdentifiers:]";
      __int16 v43 = 2112;
      v44 = v14;
      __int16 v45 = 2112;
      v46 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s deviceIdentifiers: %@ -> %@", buf, 0x20u);
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    __int16 v15 = v11;
    id v16 = [(NSSet *)v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained deviceSyncMessageService:self didLostDeviceWithIdentifier:v20];
        }
        id v17 = [(NSSet *)v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v17);
    }

    v22 = (NSSet *)[(NSSet *)v4 copy];
    v23 = self->_deviceIdentifiers;
    self->_deviceIdentifiers = v22;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v24 = v7;
    id v25 = [(NSSet *)v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
          id v30 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v30, "deviceSyncMessageService:didFoundDeviceWithIdentifier:", self, v29, (void)v31);
        }
        id v26 = [(NSSet *)v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v26);
    }
  }
}

- (void)_handleCompanionServiceActiveDevicesDidChange
{
  if (!self->_mode)
  {
    v3 = AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[ADDeviceSyncMessagingServiceRapport _handleCompanionServiceActiveDevicesDidChange]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    companionService = self->_companionService;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000AE358;
    v5[3] = &unk_100500A18;
    objc_copyWeak(&v6, (id *)buf);
    [(ADCompanionService *)companionService getDeviceIdentifiersWithCompletion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_setIsReady:(BOOL)a3
{
  int v3 = a3;
  v5 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    NSUInteger v9 = "-[ADDeviceSyncMessagingServiceRapport _setIsReady:]";
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s int isReady = %d", (uint8_t *)&v8, 0x12u);
  }
  int isReady = self->_isReady;
  if (isReady != v3)
  {
    v7 = AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      NSUInteger v9 = "-[ADDeviceSyncMessagingServiceRapport _setIsReady:]";
      __int16 v10 = 1024;
      int v11 = isReady;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s isReady: %d -> %d", (uint8_t *)&v8, 0x18u);
    }
    self->_int isReady = v3;
  }
}

- (void)_handleCompanionServiceReadyStateDidChange
{
  int v3 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[ADDeviceSyncMessagingServiceRapport _handleCompanionServiceReadyStateDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADDeviceSyncMessagingServiceRapport *)self _setIsReady:[(ADCompanionService *)self->_companionService isReady]];
}

- (void)_handleIncomingDictionary:(id)a3 fromDeviceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[ADDeviceSyncMessagingServiceRapport _handleIncomingDictionary:fromDeviceWithIdentifier:completion:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, incomingDictionary = %@", buf, 0x20u);
  }
  id v20 = 0;
  __int16 v12 = sub_1002E2BAC(v8, &v20);
  id v13 = v20;
  if (!v13)
  {
    v14 = AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[ADDeviceSyncMessagingServiceRapport _handleIncomingDictionary:fromDeviceWithIdentifier:completion:]";
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, incomingMessage = %@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000AE914;
      v17[3] = &unk_1005009F0;
      id v18 = v9;
      id v19 = v10;
      [WeakRetained deviceSyncMessageService:self didReceiveMessage:v12 fromDeviceWithIdentifier:v18 completion:v17];

      id v16 = v18;
    }
    else
    {
      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v16 = +[AFError errorWithCode:2404 description:@"No messaging service delegate to handle incoming message." underlyingError:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
    }

    goto LABEL_13;
  }
  if (v10) {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
LABEL_14:
}

- (void)_handleOutgoingMessage:(id)a3 toDeviceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  int v11 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[ADDeviceSyncMessagingServiceRapport _handleOutgoingMessage:toDeviceWithIdentifier:completion:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, outgoingMessage = %@", buf, 0x20u);
  }
  id v20 = 0;
  __int16 v12 = sub_1002E29E8(v8, &v20);
  id v13 = v20;
  if (v13)
  {
    if (v10) {
      v10[2](v10, 0, v13);
    }
  }
  else
  {
    v14 = AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[ADDeviceSyncMessagingServiceRapport _handleOutgoingMessage:toDeviceWithIdentifier:completion:]";
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, outgoingDictionary = %@", buf, 0x20u);
    }
    companionService = self->_companionService;
    if (companionService)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000AED88;
      v17[3] = &unk_1005072C8;
      void v17[4] = self;
      id v18 = v9;
      id v19 = v10;
      [(ADCompanionService *)companionService sendMessage:v12 messageType:@"devicesync" toDeviceWithIDSIdentifier:v18 completion:v17];
    }
    else if (v10)
    {
      id v16 = +[AFError errorWithCode:2413 description:@"Rapport messaging channel is nil." underlyingError:0];
      v10[2](v10, 0, v16);
    }
  }
}

- (void)_invalidate
{
  int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(ADCompanionService *)self->_companionService removeMessageHandler:self forMessageType:@"devicesync"];
  companionService = self->_companionService;
  self->_companionService = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)sendMessage:(id)a3 toDeviceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[ADDeviceSyncMessagingServiceRapport sendMessage:toDeviceWithIdentifier:completion:]";
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, outgoingMessage = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000AF23C;
  v16[3] = &unk_10050E228;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

- (NSString)channel
{
  v2 = @"com.apple.assistant.device-sync.messaging-channel.rapport";
  return (NSString *)@"com.apple.assistant.device-sync.messaging-channel.rapport";
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([a4 isEqualToString:@"devicesync"])
  {
    queue = self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000AF3BC;
    v15[3] = &unk_10050E228;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    dispatch_async(queue, v15);
  }
  else if (v12)
  {
    id v14 = +[AFError errorWithCode:1004];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF440;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)companionServiceStereoConfigurationDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF4BC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)companionServiceActiveDevicesDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF538;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)companionServiceReadyStateDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF5B4;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  [(ADDeviceSyncMessagingServiceRapport *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ADDeviceSyncMessagingServiceRapport;
  [(ADDeviceSyncMessagingServiceRapport *)&v3 dealloc];
}

- (ADDeviceSyncMessagingServiceRapport)initWithMode:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ADDeviceSyncMessagingServiceRapport;
  v7 = [(ADDeviceSyncMessagingServiceRapport *)&v21 init];
  if (v7)
  {
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assistant.device-sync.messaging-service.rapport", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v7->_mode = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v12 = +[ADCompanionService sharedInstance];
    companionService = v7->_companionService;
    v7->_companionService = (ADCompanionService *)v12;

    [(ADCompanionService *)v7->_companionService setMessageHandler:v7 forMessageType:@"devicesync"];
    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"companionServiceReadyStateDidChange:" name:@"ADCompanionServiceReadyStateDidChangeNotification" object:0];

    id v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v7 selector:"companionServiceActiveDevicesDidChange:" name:@"ADCompanionServiceActiveDevicesDidChangeNotification" object:0];

    id v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v7 selector:"companionServiceStereoConfigurationDidChange:" name:@"ADCompanionServiceStereoConfigurationDidChangeNotification" object:0];

    id v17 = v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AF7FC;
    block[3] = &unk_10050E138;
    id v20 = v7;
    dispatch_async(v17, block);
  }
  return v7;
}

@end