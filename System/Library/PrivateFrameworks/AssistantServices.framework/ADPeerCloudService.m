@interface ADPeerCloudService
+ (id)_pointerToBlockMap;
+ (id)_timedOutError;
+ (id)_unexpectedMessageError;
+ (id)_wrappedSendFailureError:(id)a3;
+ (id)sharedInstance;
- (BOOL)_handleRemoteExecution:(id)a3 peer:(id)a4 completion:(id)a5;
- (BOOL)hasActiveAccount;
- (id)_cachedSharedDataForUniqueId:(id)a3;
- (id)_companionPeer;
- (id)_destinationsForPeers:(id)a3;
- (id)_init;
- (id)_peerInfoForAssistantId:(id)a3 allowNonPeers:(BOOL)a4;
- (id)_peerInfoForIDSDeviceUniqueIdentifier:(id)a3 allowNonPeers:(BOOL)a4;
- (id)_peers;
- (id)_service;
- (id)_uniqueIdentifierForPeer:(id)a3;
- (id)cachedSharedDataForUniqueId:(id)a3;
- (id)companionPeer;
- (id)companionPeerUniqueIdentifier;
- (id)localPeerIDSDeviceUniqueIdentifier;
- (id)peerInfoForAssistantId:(id)a3 allowNonPeers:(BOOL)a4;
- (id)peerInfoForIDSDeviceUniqueIdentifier:(id)a3 allowNonPeers:(BOOL)a4;
- (id)peers;
- (id)uniqueIdentifierForPeer:(id)a3;
- (void)_airplayRouteDidChange:(id)a3;
- (void)_companionIdentifierDidChangeNotification:(id)a3;
- (void)_handleMessageResponse:(id)a3 ofType:(unsigned __int16)a4 orError:(id)a5 fromID:(id)a6 handler:(id)a7;
- (void)_notifyObserversOfRequestInfo:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_notifyObserversOfSharedData:(id)a3 fromPeer:(id)a4;
- (void)_notifyObserversOfSharedDataRequestFromPeer:(id)a3 completion:(id)a4;
- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 originalRequestId:(id)a5 toPeers:(id)a6 responseType:(unsigned __int16)a7 completion:(id)a8;
- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 toPeers:(id)a5;
- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 toPeers:(id)a5 responseType:(unsigned __int16)a6 completion:(id)a7;
- (void)_setCachedSharedData:(id)a3 forUniqueId:(id)a4;
- (void)_startRemoteRequest:(id)a3 onPeers:(id)a4 completion:(id)a5;
- (void)_updateActiveAccountState;
- (void)_updateAirPlayRouteIdentifierWithCompletion:(id)a3;
- (void)getSharedDataFromPeers:(id)a3 completion:(id)a4;
- (void)sendSharedData:(id)a3 toPeers:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setRemoteRequestObserver:(id)a3 withHandle:(void *)a4;
- (void)setSharedDataObserver:(id)a3 withHandle:(void *)a4;
- (void)setSharedDataRequestObserver:(id)a3 withHandler:(void *)a4;
- (void)startListeningForRemote;
- (void)startRemoteExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8;
- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)startRemoteSerialzedCommandExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8;
@end

@implementation ADPeerCloudService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerSharedData, 0);
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_airPlayRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_companionIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteRequestObservers, 0);
  objc_storeStrong((id *)&self->_sharedDataRequestObservers, 0);
  objc_storeStrong((id *)&self->_sharedDataObservers, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    *(_DWORD *)buf = 136315394;
    v15 = "-[ADPeerCloudService service:devicesChanged:]";
    __int16 v16 = 2048;
    id v17 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %lu devices", buf, 0x16u);
  }
  if (AFIsHorseman())
  {
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100177764;
    v11[3] = &unk_10050E160;
    id v12 = v7;
    v13 = self;
    dispatch_async(queue, v11);
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    int v8 = 136315394;
    v9 = "-[ADPeerCloudService service:activeAccountsChanged:]";
    __int16 v10 = 2048;
    id v11 = [a4 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %lu accounts", (uint8_t *)&v8, 0x16u);
  }
  [(ADPeerCloudService *)self _updateActiveAccountState];
}

- (void)_handleMessageResponse:(id)a3 ofType:(unsigned __int16)a4 orError:(id)a5 fromID:(id)a6 handler:(id)a7
{
  int v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v15) {
    goto LABEL_7;
  }
  id v16 = v13;
  if (v16) {
    goto LABEL_3;
  }
  if ([v15 responseType] != v10)
  {
    v26 = (void *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      v39 = v26;
      int v40 = 136315650;
      v41 = "-[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]";
      __int16 v42 = 1024;
      *(_DWORD *)v43 = [v15 responseType];
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s Response class is %d doesn't match %d", (uint8_t *)&v40, 0x18u);
    }
    id v16 = +[ADPeerCloudService _unexpectedMessageError];
    if (v16)
    {
LABEL_3:
      [v15 outstandingResponses];
LABEL_4:
      id v17 = AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        int v40 = 136315138;
        v41 = "-[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Completing request", (uint8_t *)&v40, 0xCu);
      }
      id v18 = objc_alloc((Class)NSSet);
      v19 = [v15 responses];
      v20 = [v19 allValues];
      id v21 = [v18 initWithArray:v20];

      v22 = [v15 completion];
      ((void (**)(void, id, id))v22)[2](v22, v21, v16);

      v23 = [v15 timeoutTimer];
      [v23 cancelIfNotAlreadyCanceled];

      completions = self->_completions;
      v25 = [v15 identifier];
      [(NSMutableDictionary *)completions removeObjectForKey:v25];

      goto LABEL_7;
    }
  }
  v27 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v40 = 136315394;
    v41 = "-[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]";
    __int16 v42 = 1024;
    *(_DWORD *)v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Handling response of type %d", (uint8_t *)&v40, 0x12u);
  }
  v28 = objc_alloc_init(ADPeerResponse);
  v29 = [[ADPeerInfo alloc] initWithIDSIdentifer:v14];
  [(ADPeerResponse *)v28 setPeer:v29];
  id v30 = objc_alloc((Class)sub_100177F50(v10));
  v31 = [v12 data];
  id v32 = [v30 initWithData:v31];

  [(ADPeerResponse *)v28 setProto:v32];
  v33 = [v15 responses];
  v34 = v33;
  if (v14)
  {
    [v33 setObject:v28 forKey:v14];
  }
  else
  {
    v35 = +[NSNull null];
    [v34 setObject:v28 forKey:v35];
  }
  objc_msgSend(v15, "setOutstandingResponses:", (char *)objc_msgSend(v15, "outstandingResponses") - 1);

  id v36 = [v15 outstandingResponses];
  if ((uint64_t)v36 <= 0)
  {
    id v16 = 0;
    goto LABEL_4;
  }
  id v37 = v36;
  v38 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v40 = 136315394;
    v41 = "-[ADPeerCloudService _handleMessageResponse:ofType:orError:fromID:handler:]";
    __int16 v42 = 2048;
    *(void *)v43 = v37;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s %ld responses remaining", (uint8_t *)&v40, 0x16u);
  }
LABEL_7:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v19 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315138;
    v22 = "-[ADPeerCloudService service:account:identifier:didSendWithSuccess:error:context:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v21, 0xCu);
  }
  if (!a6)
  {
    v20 = [(NSMutableDictionary *)self->_completions objectForKey:v16];
    if (v20) {
      [(ADPeerCloudService *)self _handleMessageResponse:0 ofType:0xFFFFLL orError:v17 fromID:0 handler:v20];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[ADPeerCloudService service:account:incomingUnhandledProtobuf:fromID:context:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v18 = +[ADFMDMonitor sharedManager];
  unsigned int v19 = [v18 isLostModeActive];

  if (v19)
  {
    v20 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[ADPeerCloudService service:account:incomingUnhandledProtobuf:fromID:context:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Dropping incoming message because Lost Mode is active", buf, 0xCu);
    }
  }
  else
  {
    int v21 = [(ADPeerCloudService *)self _service];
    v22 = [v21 deviceForFromID:v15];

    if (v22)
    {
      unsigned int v43 = [v14 type];
      uint64_t v23 = [v16 incomingResponseIdentifier];
      v44 = [v16 outgoingResponseIdentifier];
      unsigned int v40 = [v16 expectsPeerResponse];
      v24 = AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316418;
        v48 = "-[ADPeerCloudService service:account:incomingUnhandledProtobuf:fromID:context:]";
        __int16 v49 = 1024;
        unsigned int v50 = v43;
        __int16 v51 = 2112;
        id v52 = v15;
        __int16 v53 = 2112;
        uint64_t v54 = v23;
        __int16 v55 = 2112;
        v56 = v44;
        __int16 v57 = 1024;
        unsigned int v58 = v40;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Type %d from %@. Incoming %@ Outgoing %@ Expects Response %d", buf, 0x36u);
      }
      __int16 v42 = (void *)v23;
      v25 = [(NSMutableDictionary *)self->_completions objectForKey:v23];
      if (v25)
      {
        [(ADPeerCloudService *)self _handleMessageResponse:v14 ofType:v43 orError:0 fromID:v15 handler:v25];
      }
      else
      {
        id v38 = v13;
        id v39 = v12;
        id v37 = [ADPeerInfo alloc];
        id v36 = (void *)IDSCopyIDForDevice();
        v27 = [v22 modelIdentifier];
        v28 = [v22 productBuildVersion];
        v29 = [v22 name];
        id v30 = [(ADPeerInfo *)v37 initWithIDSIdentifer:v36 productType:v27 buildVersion:v28 name:v29];

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_1001785AC;
        v45[3] = &unk_100504548;
        char v46 = v40;
        v45[4] = self;
        v45[5] = v44;
        v41 = v30;
        v45[6] = v30;
        v31 = objc_retainBlock(v45);
        id v32 = (objc_class *)sub_100177F50(v43);
        if (v32)
        {
          id v33 = [v32 alloc];
          v34 = [v14 data];
          id v35 = [v33 initWithData:v34];

          id v30 = v41;
          objc_msgSend(v35, "_ad_performWithCloudService:fromPeer:completion:", self, v41, v31);
        }
        else
        {
          id v35 = +[ADPeerCloudService _unexpectedMessageError];
          ((void (*)(void *, void, uint64_t, id))v31[2])(v31, 0, 0xFFFFLL, v35);
        }
        id v13 = v38;

        id v12 = v39;
      }
    }
    else
    {
      v26 = AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[ADPeerCloudService service:account:incomingUnhandledProtobuf:fromID:context:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Dropping incoming message with unknown sender", buf, 0xCu);
      }
    }
  }
}

- (BOOL)_handleRemoteExecution:(id)a3 peer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[ADPeerCloudService _handleRemoteExecution:peer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unsigned int v12 = [v8 hasContent];
  if (v12)
  {
    id v13 = [v8 sourceIDSFirstRoutableDestination];
    [v9 setIdsFirstRoutableDestination:v13];

    id v14 = [v8 assistantId];
    if (v14)
    {
      id v15 = +[ADDeviceCircleManager sharedInstance];
      id v16 = [(ADPeerCloudService *)self _uniqueIdentifierForPeer:v9];
      [v15 _setAssistantId:v14 forDeviceWithIdsDeviceUniqueIdentifier:v16];
    }
    id v17 = [v8 content];
    id v18 = +[NSDictionary dictionaryWithPlistData:v17];

    unsigned int v19 = (void *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = AceObjectClassPListKey;
      int v21 = v19;
      v22 = [v18 objectForKeyedSubscript:v20];
      *(_DWORD *)buf = 136315650;
      v28 = "-[ADPeerCloudService _handleRemoteExecution:peer:completion:]";
      __int16 v29 = 2112;
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s got remote execution command: %@ -> %@", buf, 0x20u);
    }
    uint64_t v23 = +[ADCommandCenter sharedCommandCenter];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100178934;
    v25[3] = &unk_10050D058;
    id v26 = v10;
    [v23 executeCommand:v18 fromPeer:v9 remoteExecutionInfo:0 reply:v25];
  }
  return v12;
}

- (void)_notifyObserversOfRequestInfo:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v22 = a3;
  id v21 = a4;
  id v19 = a5;
  id v8 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v35 = "-[ADPeerCloudService _notifyObserversOfRequestInfo:fromPeer:completion:]";
    __int16 v36 = 2112;
    id v37 = v22;
    __int16 v38 = 2112;
    id v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  id v10 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(NSMapTable *)self->_remoteRequestObservers objectEnumerator];
  id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v14);
        dispatch_group_enter(v10);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100178DD4;
        v26[3] = &unk_10050BD80;
        v26[4] = self;
        id v27 = v9;
        v28 = v10;
        (*(void (**)(uint64_t, id, id, void *))(v15 + 16))(v15, v22, v21, v26);

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100178E8C;
  block[3] = &unk_10050E188;
  id v24 = v9;
  id v25 = v19;
  id v17 = v19;
  id v18 = v9;
  dispatch_group_notify(v10, queue, block);
}

- (void)setRemoteRequestObserver:(id)a3 withHandle:(void *)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100179028;
  block[3] = &unk_10050C148;
  void block[4] = self;
  id v10 = v6;
  id v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)startListeningForRemote
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[ADPeerCloudService startListeningForRemote]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADPeerCloudService *)self setRemoteRequestObserver:&stru_100504520 withHandle:&unk_100585D20];
}

- (void)startRemoteSerialzedCommandExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = (void (**)(id, void, id))a8;
  id v16 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v34 = "-[ADPeerCloudService startRemoteSerialzedCommandExecution:onPeer:allowsRelay:allowFallbackOnAWDL:executionCont"
          "ext:completion:]";
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  if (!v12)
  {
    id v25 = +[ADPeerCloudService _unexpectedMessageError];
LABEL_10:
    id v24 = v25;
    v15[2](v15, 0, v25);
    goto LABEL_11;
  }
  if (!v13)
  {
    id v25 = [objc_alloc((Class)NSError) initWithDomain:@"ADRemoteConnectionErrorDomain" code:5 userInfo:0];
    goto LABEL_10;
  }
  id v17 = +[NSUUID UUID];
  id v18 = [v17 UUIDString];
  id v19 = [v18 componentsSeparatedByString:@"-"];
  uint64_t v20 = [v19 firstObject];

  id v21 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v34 = "-[ADPeerCloudService startRemoteSerialzedCommandExecution:onPeer:allowsRelay:allowFallbackOnAWDL:executionCont"
          "ext:completion:]";
    __int16 v35 = 2112;
    id v36 = v20;
    __int16 v37 = 2112;
    id v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s #hal1 (%@) send command to peer: %@", buf, 0x20u);
  }
  mach_absolute_time();
  uint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds();
  queue = self->_queue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001796A8;
  v26[3] = &unk_1005044E0;
  id v27 = v12;
  v28 = self;
  uint64_t v32 = Milliseconds;
  id v29 = v13;
  id v30 = v20;
  long long v31 = v15;
  id v24 = v20;
  dispatch_async(queue, v26);

LABEL_11:
}

- (void)startRemoteExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8
{
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315650;
    id v21 = "-[ADPeerCloudService startRemoteExecution:onPeer:allowsRelay:throughProxyDevice:executionContext:completion:]";
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v20, 0x20u);
  }
  id v18 = [v13 dictionary];
  id v19 = [v18 plistData];
  [(ADPeerCloudService *)self startRemoteSerialzedCommandExecution:v19 onPeer:v14 allowsRelay:v10 allowFallbackOnAWDL:0 executionContext:v15 completion:v16];
}

- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    id v12 = +[NSSet setWithObject:v9];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100179EFC;
    v13[3] = &unk_10050D080;
    id v14 = v11;
    [(ADPeerCloudService *)self _startRemoteRequest:v8 onPeers:v12 completion:v13];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)_startRemoteRequest:(id)a3 onPeers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v30 = "-[ADPeerCloudService _startRemoteRequest:onPeers:completion:]";
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  if (v8)
  {
    queue = self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10017A1E4;
    v19[3] = &unk_10050E228;
    id v20 = v8;
    id v21 = self;
    id v22 = v9;
    id v23 = v10;
    dispatch_async(queue, v19);

    id v13 = v20;
LABEL_14:

    goto LABEL_15;
  }
  if (v10)
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v9;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          [v13 setObject:&__kCFBooleanFalse forKey:*(void *)(*((void *)&v24 + 1) + 8 * (void)v18)];
          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    (*((void (**)(id, id))v10 + 2))(v10, v13);
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_notifyObserversOfSharedDataRequestFromPeer:(id)a3 completion:(id)a4
{
  id v19 = a3;
  id v17 = a4;
  id v6 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v32 = "-[ADPeerCloudService _notifyObserversOfSharedDataRequestFromPeer:completion:]";
    __int16 v33 = 2112;
    id v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  id v8 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(NSMapTable *)self->_sharedDataRequestObservers objectEnumerator];
  id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v12);
        dispatch_group_enter(v8);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10017A7A0;
        v23[3] = &unk_100504440;
        v23[4] = self;
        id v24 = v7;
        long long v25 = v8;
        (*(void (**)(uint64_t, id, void *))(v13 + 16))(v13, v19, v23);

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017A86C;
  block[3] = &unk_10050E188;
  id v21 = v7;
  id v22 = v17;
  id v15 = v17;
  id v16 = v7;
  dispatch_group_notify(v8, queue, block);
}

- (void)setSharedDataRequestObserver:(id)a3 withHandler:(void *)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017AA1C;
  block[3] = &unk_10050C148;
  void block[4] = self;
  id v10 = v6;
  uint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)getSharedDataFromPeers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ADPeerCloudService getSharedDataFromPeers:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017AC10;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)_notifyObserversOfSharedData:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v24 = "-[ADPeerCloudService _notifyObserversOfSharedData:fromPeer:]";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  id v9 = [(ADPeerCloudService *)self _uniqueIdentifierForPeer:v7];
  id v10 = [v6 assistantId];
  if (v10)
  {
    id v11 = +[ADDeviceCircleManager sharedInstance];
    [v11 _setAssistantId:v10 forDeviceWithIdsDeviceUniqueIdentifier:v9];
  }
  int v12 = AFIsHorseman();
  if (v6 && v12) {
    [(ADPeerCloudService *)self _setCachedSharedData:v6 forUniqueId:v9];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = [(NSMapTable *)self->_sharedDataObservers objectEnumerator];
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      __int16 v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * (void)v17) + 16))();
        __int16 v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)setSharedDataObserver:(id)a3 withHandle:(void *)a4
{
  id v6 = a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[ADPeerCloudService setSharedDataObserver:withHandle:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017B2B4;
  block[3] = &unk_10050C148;
  void block[4] = self;
  id v11 = v6;
  int v12 = a4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)sendSharedData:(id)a3 toPeers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADPeerCloudService sendSharedData:toPeers:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017B4A4;
    block[3] = &unk_10050DCB8;
    id v11 = v6;
    int v12 = self;
    id v13 = v7;
    dispatch_async(queue, block);
  }
}

- (void)_updateAirPlayRouteIdentifierWithCompletion:(id)a3
{
  int v4 = (void (**)(void))a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[ADPeerCloudService _updateAirPlayRouteIdentifierWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (AFSupportsAirPlayEndpointRoute())
  {
    id v6 = +[AFMediaRemoteDeviceInfo currentDevice];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10017B66C;
    v7[3] = &unk_10050D818;
    v7[4] = self;
    id v8 = v4;
    [v6 getRouteIdentifierWithCompletion:v7];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)_airplayRouteDidChange:(id)a3
{
  int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADPeerCloudService _airplayRouteDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017B924;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_companionIdentifierDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADPeerCloudService _companionIdentifierDidChangeNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (AFIsHorseman())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017BA4C;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_updateActiveAccountState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(IDSService *)self->_service accounts];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isActive])
        {
          LODWORD(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (self->_hasActiveAccount != v4)
  {
    self->_hasActiveAccount = (char)v4;
    id v7 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ADPeerCloudService _updateActiveAccountState]";
      __int16 v15 = 1024;
      int v16 = (int)v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Has active account: %d", buf, 0x12u);
    }
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"ADPeerCloudServiceActiveAccountStatusDidChangeNotification" object:0];
  }
}

- (void)_setCachedSharedData:(id)a3 forUniqueId:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    peerSharedData = self->_peerSharedData;
    id v8 = v11;
    if (v11)
    {
      if (!peerSharedData)
      {
        long long v9 = (NSMutableDictionary *)objc_opt_new();
        long long v10 = self->_peerSharedData;
        self->_peerSharedData = v9;

        id v8 = v11;
        peerSharedData = self->_peerSharedData;
      }
      [(NSMutableDictionary *)peerSharedData setObject:v8 forKey:v6];
    }
    else
    {
      [(NSMutableDictionary *)peerSharedData removeObjectForKey:v6];
    }
  }
}

- (id)_cachedSharedDataForUniqueId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_peerSharedData objectForKey:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)cachedSharedDataForUniqueId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    __int16 v15 = sub_10017BEB8;
    int v16 = sub_10017BEC8;
    id v17 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017BED0;
    block[3] = &unk_10050C700;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(queue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_peerInfoForAssistantId:(id)a3 allowNonPeers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[ADDeviceCircleManager sharedInstance];
  id v8 = [v7 idsDeviceUniqueIdentifierForDeviceWithAssistantId:v6];

  if (v8)
  {
    long long v9 = [(ADPeerCloudService *)self _peerInfoForIDSDeviceUniqueIdentifier:v8 allowNonPeers:v4];
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (id)peerInfoForAssistantId:(id)a3 allowNonPeers:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v15 = 0;
    int v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = sub_10017BEB8;
    long long v19 = sub_10017BEC8;
    id v20 = 0;
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10017C0F8;
    v11[3] = &unk_1005043F0;
    id v13 = &v15;
    void v11[4] = self;
    id v12 = v6;
    BOOL v14 = a4;
    dispatch_sync(queue, v11);
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)companionPeerUniqueIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10017BEB8;
  id v10 = sub_10017BEC8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10017C23C;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_companionPeer
{
  id v3 = [(NSString *)self->_companionIdentifier length];
  if (v3)
  {
    id v3 = [(ADPeerCloudService *)self _peerInfoForIDSDeviceUniqueIdentifier:self->_companionIdentifier allowNonPeers:0];
  }
  return v3;
}

- (id)companionPeer
{
  uint64_t v19 = 0;
  id v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10017BEB8;
  id v23 = sub_10017BEC8;
  id v24 = 0;
  if (AFIsHorseman())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017C564;
    block[3] = &unk_10050D5F0;
    void block[4] = self;
    void block[5] = &v19;
    dispatch_sync(queue, block);
  }
  else if (AFIsNano())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v4 = [(ADPeerCloudService *)self peers];
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v9 = [(ADPeerCloudService *)self _service];
          id v10 = [v8 idsIdentifier];
          id v11 = [v9 deviceForFromID:v10];

          if ([v11 isDefaultPairedDevice])
          {
            objc_storeStrong(v20 + 5, v8);

            goto LABEL_14;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v14 objects:v25 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  id v12 = v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (id)localPeerIDSDeviceUniqueIdentifier
{
  v2 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADPeerCloudService localPeerIDSDeviceUniqueIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Fetching IDS device unique identifier for local device...", (uint8_t *)&v6, 0xCu);
  }
  id v3 = (void *)IDSCopyLocalDeviceUniqueID();
  BOOL v4 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADPeerCloudService localPeerIDSDeviceUniqueIdentifier]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Fetched IDS device unique identifier %@ for local device.", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (id)_peerInfoForIDSDeviceUniqueIdentifier:(id)a3 allowNonPeers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)_IDSCopyIDForDeviceUniqueID();
  __int16 v8 = [(ADPeerCloudService *)self _service];
  id v9 = [v8 deviceForFromID:v7];

  if (v9)
  {
    id v10 = [ADPeerInfo alloc];
    id v11 = (void *)IDSCopyIDForDevice();
    id v12 = [v9 modelIdentifier];
    id v13 = [v9 productBuildVersion];
    long long v14 = [v9 name];
    long long v15 = [(ADPeerInfo *)v10 initWithIDSIdentifer:v11 productType:v12 buildVersion:v13 name:v14];

    [(ADPeerInfo *)v15 setIdsDeviceUniqueIdentifier:v6];
  }
  else if (v4 && [v6 length])
  {
    long long v16 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      uint64_t v19 = "-[ADPeerCloudService _peerInfoForIDSDeviceUniqueIdentifier:allowNonPeers:]";
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Unable to find peer, creating faux element for identifier: %@", (uint8_t *)&v18, 0x16u);
    }
    long long v15 = [[ADPeerInfo alloc] initWithUniqueIdentifer:v6];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)peerInfoForIDSDeviceUniqueIdentifier:(id)a3 allowNonPeers:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = sub_10017BEB8;
  uint64_t v19 = sub_10017BEC8;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017C9D4;
  v11[3] = &unk_1005043F0;
  id v12 = v6;
  id v13 = &v15;
  void v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)_uniqueIdentifierForPeer:(id)a3
{
  BOOL v4 = [a3 idsIdentifier];
  id v5 = [(ADPeerCloudService *)self _service];
  id v6 = [v5 deviceForFromID:v4];

  if (v6)
  {
    id v7 = [v6 uniqueIDOverride];
    if (![v7 length])
    {
      uint64_t v8 = [v6 uniqueID];

      id v7 = (void *)v8;
    }
  }
  else if ([v4 hasPrefix:@"device:"])
  {
    id v7 = [v4 _stripFZIDPrefix];
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      id v12 = "-[ADPeerCloudService _uniqueIdentifierForPeer:]";
      __int16 v13 = 2112;
      BOOL v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s retrieved ID from URI: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)uniqueIdentifierForPeer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10017BEB8;
  long long v16 = sub_10017BEC8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017CCAC;
  block[3] = &unk_10050C700;
  id v10 = v4;
  int v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)peers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10017BEB8;
  id v10 = sub_10017BEC8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10017CDEC;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_peers
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(ADPeerCloudService *)self _service];
  id v5 = [v4 devices];

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [ADPeerInfo alloc];
        uint64_t v12 = (void *)IDSCopyIDForDevice();
        __int16 v13 = [v10 modelIdentifier];
        uint64_t v14 = [v10 productBuildVersion];
        uint64_t v15 = [v10 name];
        long long v16 = [(ADPeerInfo *)v11 initWithIDSIdentifer:v12 productType:v13 buildVersion:v14 name:v15];

        [v3 addObject:v16];
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v3;
}

- (BOOL)hasActiveAccount
{
  return self->_hasActiveAccount;
}

- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 originalRequestId:(id)a5 toPeers:(id)a6 responseType:(unsigned __int16)a7 completion:(id)a8
{
  uint64_t v9 = a7;
  uint64_t v12 = a4;
  id v41 = a3;
  id v14 = a5;
  id v42 = a6;
  uint64_t v15 = (void (**)(id, void, id))a8;
  long long v16 = +[ADFMDMonitor sharedManager];
  LODWORD(a6) = [v16 isLostModeActive];

  if (!a6)
  {
    id v18 = [(ADPeerCloudService *)self _destinationsForPeers:v42];
    id v19 = [v18 count];
    if (!v19)
    {
      __int16 v35 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[ADPeerCloudService _sendProto:ofType:originalRequestId:toPeers:responseType:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s No place to send this", buf, 0xCu);
      }
      if (v15)
      {
        id v40 = [objc_alloc((Class)NSError) initWithDomain:@"ADRemoteConnectionErrorDomain" code:5 userInfo:0];
        v15[2](v15, 0, v40);
      }
      goto LABEL_26;
    }
    id v20 = v19;
    id v21 = objc_alloc((Class)IDSProtobuf);
    long long v22 = [v41 data];
    id v39 = [v21 initWithProtobufData:v22 type:v12 isResponse:v14 != 0];

    id v23 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    [v23 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionAllowCloudDeliveryKey];
    if (v14) {
      [v23 setObject:v14 forKey:IDSSendMessageOptionPeerResponseIdentifierKey];
    }
    if (v15) {
      [v23 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionExpectsPeerResponseKey];
    }
    id v24 = [(ADPeerCloudService *)self _service];
    id v45 = 0;
    id v46 = 0;
    unsigned __int8 v25 = [v24 sendProtobuf:v39 toDestinations:v18 priority:300 options:v23 identifier:&v46 error:&v45];
    id v38 = v46;
    id v37 = v45;

    if (v25)
    {
      if (v15)
      {
        if (v38)
        {
          id v26 = objc_alloc_init(ADCloudResponseHandler);
          [(ADCloudResponseHandler *)v26 setIdentifier:v38];
          -[ADCloudResponseHandler setOutstandingResponses:](v26, "setOutstandingResponses:", [v18 count]);
          [(ADCloudResponseHandler *)v26 setResponseType:v9];
          id v27 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v20];
          [(ADCloudResponseHandler *)v26 setResponses:v27];

          [(ADCloudResponseHandler *)v26 setCompletion:v15];
          objc_initWeak((id *)buf, v26);
          id v28 = objc_alloc((Class)AFWatchdogTimer);
          queue = self->_queue;
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10017D5F0;
          v43[3] = &unk_10050C7C8;
          v43[4] = self;
          objc_copyWeak(&v44, (id *)buf);
          id v30 = [v28 initWithTimeoutInterval:queue onQueue:v43 timeoutHandler:300.0];
          [(ADCloudResponseHandler *)v26 setTimeoutTimer:v30];
          [v30 start];
          completions = self->_completions;
          if (!completions)
          {
            id v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            id v34 = self->_completions;
            p_completions = &self->_completions;
            *p_completions = v32;

            completions = *p_completions;
          }
          [(NSMutableDictionary *)completions setObject:v26 forKey:v38];

          objc_destroyWeak(&v44);
          objc_destroyWeak((id *)buf);
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    else
    {
      id v36 = AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v48 = "-[ADPeerCloudService _sendProto:ofType:originalRequestId:toPeers:responseType:completion:]";
        __int16 v49 = 1024;
        int v50 = v12;
        __int16 v51 = 2114;
        id v52 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s Failed sending message type %d %{public}@", buf, 0x1Cu);
        if (!v15) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      if (v15)
      {
LABEL_23:
        id v26 = +[ADPeerCloudService _wrappedSendFailureError:v37];
        v15[2](v15, 0, v26);
LABEL_24:
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[ADPeerCloudService _sendProto:ofType:originalRequestId:toPeers:responseType:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Lost mode is active, not sending any outbound requests", buf, 0xCu);
  }
  if (v15)
  {
    id v18 = [objc_alloc((Class)NSError) initWithDomain:@"ADRemoteConnectionErrorDomain" code:7 userInfo:0];
    v15[2](v15, 0, v18);
LABEL_26:
  }
}

- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 toPeers:(id)a5 responseType:(unsigned __int16)a6 completion:(id)a7
{
}

- (void)_sendProto:(id)a3 ofType:(unsigned __int16)a4 toPeers:(id)a5
{
}

- (id)_destinationsForPeers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  if (v4)
  {
    long long v37 = 0uLL;
    long long v38 = 0uLL;
    long long v35 = 0uLL;
    long long v36 = 0uLL;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v35 + 1) + 8 * i) idsIdentifier];
          if (v11) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    uint64_t v12 = [(ADPeerCloudService *)self _service];
    id v6 = [v12 devices];

    id v13 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v13)
    {
      id v14 = v13;
      id v26 = v5;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v6);
          }
          id v17 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          id v18 = (void *)IDSCopyIDForDevice();
          if (v18)
          {
            id v19 = [v17 modelIdentifier];
            if (v19)
            {
              long long v29 = 0u;
              long long v30 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              id v20 = +[NSArray arrayWithObjects:@"AudioAccessory", @"AppleTV", 0];
              id v21 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
              if (v21)
              {
                id v22 = v21;
                uint64_t v23 = *(void *)v28;
                while (2)
                {
                  for (k = 0; k != v22; k = (char *)k + 1)
                  {
                    if (*(void *)v28 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    if ([v19 hasPrefix:*(void *)(*((void *)&v27 + 1) + 8 * (void)k)])
                    {

                      [v26 addObject:v18];
                      goto LABEL_29;
                    }
                  }
                  id v22 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
                  if (v22) {
                    continue;
                  }
                  break;
                }
              }
            }
LABEL_29:
          }
        }
        id v14 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v14);
      id v4 = 0;
      id v5 = v26;
    }
  }

  return v5;
}

- (id)_service
{
  return self->_service;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)ADPeerCloudService;
  v2 = [(ADPeerCloudService *)&v10 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADPeerCloudService", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017DA70;
    block[3] = &unk_10050E138;
    uint64_t v9 = v2;
    dispatch_async(v6, block);
  }
  return v2;
}

+ (id)_pointerToBlockMap
{
  id v2 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:1282 valueOptions:0 capacity:1];
  return v2;
}

+ (id)_wrappedSendFailureError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSError);
  id v5 = v4;
  if (v3)
  {
    NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
    id v10 = v3;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v7 = [v5 initWithDomain:@"ADRemoteConnectionErrorDomain" code:3 userInfo:v6];
  }
  else
  {
    id v7 = [v4 initWithDomain:@"ADRemoteConnectionErrorDomain" code:3 userInfo:0];
  }

  return v7;
}

+ (id)_timedOutError
{
  id v2 = [objc_alloc((Class)NSError) initWithDomain:@"ADRemoteConnectionErrorDomain" code:6 userInfo:0];
  return v2;
}

+ (id)_unexpectedMessageError
{
  id v2 = [objc_alloc((Class)NSError) initWithDomain:@"ADRemoteConnectionErrorDomain" code:0 userInfo:0];
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100585D18 != -1) {
    dispatch_once(&qword_100585D18, &stru_1005043C8);
  }
  id v2 = (void *)qword_100585D10;
  return v2;
}

@end