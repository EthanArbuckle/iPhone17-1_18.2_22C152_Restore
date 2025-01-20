@interface ADSharedDataService
- (ADSharedDataService)initWithDelegate:(id)a3;
- (BOOL)peerExportsSharedData;
- (BOOL)watchIsNearbyForAssistantId:(id)a3;
- (id)_setDataFromSharedData:(id)a3;
- (id)peerBuildVersion;
- (id)peerType;
- (void)_dataDidUpdate:(id)a3;
- (void)_getDataWithCompletion:(id)a3;
- (void)_getDataWithPBCompletion:(id)a3;
- (void)_handleExecuteRequestOnRemoteWatch:(id)a3 completion:(id)a4;
- (void)_pushSharedDataToPeerFromNotification:(id)a3 completion:(id)a4;
- (void)_requestDataRemotelyAllowingCloudMessaging:(BOOL)a3 completion:(id)a4;
- (void)_sendData:(id)a3;
- (void)_sharedDataDidChange:(id)a3;
- (void)_startRemoteRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deviceIsNearby:(id)a3;
- (void)effectiveSettingsChanged;
- (void)executeRemoteCommand:(id)a3 completion:(id)a4;
- (void)getSharedDataFromPeerUseCache:(BOOL)a3 allowCloudMessaging:(BOOL)a4 completion:(id)a5;
- (void)getSharedDataFromPeerUseCache:(BOOL)a3 completion:(id)a4;
- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5;
- (void)pushSharedDataToPeer:(id)a3;
- (void)startRemoteRequest:(id)a3 completion:(id)a4;
@end

@implementation ADSharedDataService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteData, 0);
  objc_storeStrong((id *)&self->_localData, 0);
  objc_storeStrong((id *)&self->_peerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_handleExecuteRequestOnRemoteWatch:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[ADSharedDataService _handleExecuteRequestOnRemoteWatch:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ([v5 hasContent])
  {
    v8 = [v5 content];
    v9 = +[NSDictionary dictionaryWithPlistData:v8];

    v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = AceObjectClassPListKey;
      v12 = v10;
      v13 = [v9 objectForKeyedSubscript:v11];
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADSharedDataService _handleExecuteRequestOnRemoteWatch:completion:]";
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s got remote execution command: %@ -> %@", buf, 0x20u);
    }
    v14 = +[ADCommandCenter sharedCommandCenter];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000D0210;
    v15[3] = &unk_10050D058;
    id v16 = v6;
    [v14 executeCommand:v9 fromPeer:0 remoteExecutionInfo:0 reply:v15];
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)executeRemoteCommand:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(_ADPBDeviceExecuteOnRemoteRequest);
  [(_ADPBDeviceExecuteOnRemoteRequest *)v8 setContent:v7];

  peerConnection = self->_peerConnection;
  uint64_t v10 = objc_opt_class();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D04BC;
  v12[3] = &unk_1005011E8;
  id v13 = v6;
  id v11 = v6;
  [(ADPeerConnection *)peerConnection sendRequest:v8 responseClass:v10 overrideRequireConnectedPeer:1 allowCloud:0 completion:v12];
}

- (BOOL)watchIsNearbyForAssistantId:(id)a3
{
  id v4 = a3;
  id v5 = [(ADSharedData *)self->_remoteData assistantId];
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[ADSharedDataService watchIsNearbyForAssistantId:]";
    __int16 v11 = 2112;
    v12 = v5;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v9, 0x20u);
  }
  unsigned __int8 v7 = [v5 isEqualToString:v4];

  return v7;
}

- (void)startRemoteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D0774;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_dataDidUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D0980;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_requestDataRemotelyAllowingCloudMessaging:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(_ADPBDeviceGetDataRequest);
  peerConnection = self->_peerConnection;
  uint64_t v9 = objc_opt_class();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D0AC8;
  v11[3] = &unk_100502850;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(ADPeerConnection *)peerConnection sendRequest:v7 responseClass:v9 overrideRequireConnectedPeer:0 allowCloud:v4 completion:v11];
}

- (void)getSharedDataFromPeerUseCache:(BOOL)a3 allowCloudMessaging:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = (void (**)(id, void))a5;
  if (v8 || v6)
  {
    if (![(ADSharedDataService *)self peerExportsSharedData])
    {
      uint64_t v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v16 = "-[ADSharedDataService getSharedDataFromPeerUseCache:allowCloudMessaging:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Peer does not export shared data.", buf, 0xCu);
      }
      v8[2](v8, 0);
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D0D84;
    block[3] = &unk_10050A028;
    BOOL v13 = v6;
    void block[4] = self;
    id v12 = v8;
    BOOL v14 = a4;
    dispatch_async(queue, block);
  }
}

- (void)getSharedDataFromPeerUseCache:(BOOL)a3 completion:(id)a4
{
}

- (void)deviceIsNearby:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000D0E74;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (BOOL)peerExportsSharedData
{
  v3 = [(ADPeerConnection *)self->_peerConnection peerName];
  id v4 = [(ADPeerConnection *)self->_peerConnection peerVersion];
  AFWatchOSVersion();
  char IsGreaterThanOrEqual = AFWatchOSVersionIsGreaterThanOrEqual();

  return IsGreaterThanOrEqual;
}

- (id)peerBuildVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1000D1084;
  id v10 = sub_1000D1094;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D109C;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)peerType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1000D1084;
  id v10 = sub_1000D1094;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D11DC;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5
{
}

- (void)_startRemoteRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  uint64_t v8 = objc_msgSend(v6, "_ad_requestInfo");

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D131C;
  v10[3] = &unk_10050CF78;
  id v11 = v5;
  id v9 = v5;
  [v7 handleExternalActivationRequest:v8 completion:v10];
}

- (id)_setDataFromSharedData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_ADPBDeviceSetDataRequest);
  [(_ADPBDeviceSetDataRequest *)v5 _ad_setData:v4];

  id v6 = [(ADPeerConnection *)self->_peerConnection peerName];
  uint64_t v7 = [(ADPeerConnection *)self->_peerConnection peerVersion];
  uint64_t v8 = AFPreferencesSupportedLanguagesForRemote();

  id v9 = [(_ADPBDeviceSetDataRequest *)v5 languageCode];
  LOBYTE(v7) = [v8 containsObject:v9];

  if ((v7 & 1) == 0)
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      BOOL v13 = "-[ADSharedDataService _setDataFromSharedData:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Forcing Siri to off because peer does not support language", (uint8_t *)&v12, 0xCu);
    }
    [(_ADPBDeviceSetDataRequest *)v5 setSiriEnabled:0];
  }

  return v5;
}

- (void)_getDataWithPBCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D15E8;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_sharedDataDidChange:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADSharedDataService _sharedDataDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D19AC;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)_getDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[ADCommandCenter sharedCommandCenter];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D1A74;
  v7[3] = &unk_100507EC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getSharedDataForPeer:v7];
}

- (void)_sendData:(id)a3
{
  peerConnection = self->_peerConnection;
  id v4 = [(ADSharedDataService *)self _setDataFromSharedData:a3];
  [(ADPeerConnection *)peerConnection sendRequest:v4 responseClass:0 overrideRequireConnectedPeer:0 allowCloud:1 completion:0];
}

- (void)_pushSharedDataToPeerFromNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(ADPeerConnection *)self->_peerConnection hasPeer] || (sub_1001FB9B4() & 1) != 0)
  {
    [v6 userInfo];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000D1D74;
    v10[3] = &unk_1005080B0;
    void v10[4] = self;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    int v12 = v7;
    id v8 = v11;
    [(ADSharedDataService *)self _getDataWithCompletion:v10];
  }
  else
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v14 = "-[ADSharedDataService _pushSharedDataToPeerFromNotification:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Not pushing shared data because we have no peer", buf, 0xCu);
    }
    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)effectiveSettingsChanged
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D2050;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)pushSharedDataToPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D21C8;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ADSharedDataService;
  [(ADSharedDataService *)&v4 dealloc];
}

- (ADSharedDataService)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADSharedDataService;
  id v5 = [(ADSharedDataService *)&v13 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("ADSharedDataService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    id v9 = [[ADPeerConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.device" forRequests:j__objc_msgSend__ADPBDeviceRequestType];
    peerConnection = v5->_peerConnection;
    v5->_peerConnection = v9;

    [(ADPeerConnection *)v5->_peerConnection setDelegate:v5 forRequestTypes:sub_1000AD950];
    id v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v5 selector:"_sharedDataDidChange:" name:@"ADSharedDataDidChangeNotification" object:0];

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

@end