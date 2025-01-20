@interface ADRemoteContextStore
- (ADRemoteContextStore)initWithRapportLink:(id)a3 queue:(id)a4;
- (id)_contextLinkMessageOptions;
- (id)_initWithRapportLink:(id)a3 queue:(id)a4 deviceCircleManager:(id)a5;
- (void)_activateOnDemandRapportConnectionAndFetchContext:(id)a3;
- (void)_dumpStateForReason:(id)a3;
- (void)_enumerateDeviceContextsUsingBlock:(id)a3;
- (void)_fetchContextFromCollectorAndForceFetchingFromDevicesWithPeerInfo:(id)a3 completion:(id)a4;
- (void)_fetchContextFromCollectorThroughOnDemandConnection:(id)a3;
- (void)_fetchContextFromDeviceWithPeerInfo:(id)a3 completion:(id)a4;
- (void)_setContextCollectionAllowed:(BOOL)a3;
- (void)fetchContextSnapshotFromAllDevicesWithCompletion:(id)a3;
- (void)fetchContextSnapshotFromDevicesWithPeerInfo:(id)a3 completion:(id)a4;
- (void)getContextSnapshotIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 completion:(id)a5;
- (void)getSerializedDeviceContextSnapshotIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 completion:(id)a5;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)setDeviceContext:(id)a3 includedKeys:(id)a4 excludedKeys:(id)a5 forDeviceWithPeerInfo:(id)a6 completion:(id)a7;
- (void)setDeviceContext:(id)a3 withIncludedKeys:(id)a4 excludedKeys:(id)a5 forDeviceWithIDSDeviceUniqueIdentifier:(id)a6 withCompletion:(id)a7;
- (void)startCollectingContext;
- (void)stopCollectingContext;
- (void)updateRapportLink:(id)a3;
@end

@implementation ADRemoteContextStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceContextMap, 0);
  objc_storeStrong((id *)&self->_deviceCircleManager, 0);
  objc_storeStrong((id *)&self->_rapportLink, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_dumpStateForReason:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10015F468;
  v5[3] = &unk_100503D20;
  id v6 = a3;
  id v4 = v6;
  [(ADRemoteContextStore *)self _enumerateDeviceContextsUsingBlock:v5];
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015F5E0;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)getSerializedDeviceContextSnapshotIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10015F82C;
    v12[3] = &unk_10050E228;
    id v13 = v8;
    id v16 = v10;
    v14 = self;
    id v15 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)setDeviceContext:(id)a3 includedKeys:(id)a4 excludedKeys:(id)a5 forDeviceWithPeerInfo:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  if (v15)
  {
    queue = self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10015FCEC;
    v19[3] = &unk_100508278;
    id v20 = v12;
    id v21 = v15;
    id v22 = v13;
    id v23 = v14;
    v24 = self;
    id v25 = v17;
    dispatch_async(queue, v19);
  }
  else if (v16)
  {
    (*((void (**)(id))v16 + 2))(v16);
  }
}

- (void)setDeviceContext:(id)a3 withIncludedKeys:(id)a4 excludedKeys:(id)a5 forDeviceWithIDSDeviceUniqueIdentifier:(id)a6 withCompletion:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  if (v14)
  {
    v17 = sub_10016A850(v14);
    [(ADRemoteContextStore *)self setDeviceContext:v18 includedKeys:v12 excludedKeys:v13 forDeviceWithPeerInfo:v17 completion:v16];
  }
  else if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
  }
}

- (void)updateRapportLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001600E8;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_fetchContextFromCollectorAndForceFetchingFromDevicesWithPeerInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ADRemoteContextStore _fetchContextFromCollectorAndForceFetchingFromDevicesWithPeerInfo:completion:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #hal Force fetching from devices through collector: %@", buf, 0x16u);
    }
    deviceCircleManager = self->_deviceCircleManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100160290;
    v10[3] = &unk_100504CD0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(ADDeviceCircleManager *)deviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:v10];
  }
}

- (void)_fetchContextFromDeviceWithPeerInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[ADRemoteContextStore _fetchContextFromDeviceWithPeerInfo:completion:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal Force fetching context directly from %@", buf, 0x16u);
  }
  rapportLink = self->_rapportLink;
  CFStringRef v21 = @"prefers_assistant_identifiers";
  id v22 = &__kCFBooleanTrue;
  id v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v11 = [(ADRemoteContextStore *)self _contextLinkMessageOptions];
  __int16 v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100160E5C;
  id v18 = &unk_100504BB8;
  id v19 = v6;
  id v20 = v7;
  id v12 = v7;
  id v13 = v6;
  [(ADRapportLink *)rapportLink sendRequestID:@"com.apple.siri.rapport-link.request.generic" messageType:@"agg_context_fetch" messagePayload:v10 toPeer:v13 options:v11 completion:&v15];

  id v14 = +[AFAnalytics sharedAnalytics];
  [v14 logEventWithType:4585 context:0];
}

- (id)_contextLinkMessageOptions
{
  uint64_t v4 = RPOptionStatusFlags;
  id v5 = &off_100523690;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (void)_fetchContextFromCollectorThroughOnDemandConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsHALOnDemandRapportConnection())
    {
      queue = self->_queue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100161234;
      v6[3] = &unk_10050E188;
      v6[4] = self;
      id v7 = v4;
      dispatch_async(queue, v6);
    }
    else
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void)_activateOnDemandRapportConnectionAndFetchContext:(id)a3
{
  id v4 = a3;
  if ((AFSupportsHALOnDemandRapportConnection() & 1) == 0)
  {
LABEL_8:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_9;
  }
  id v5 = [(ADRapportLink *)self->_rapportLink configuration];
  id v6 = [v5 connectionOptions];
  id v7 = [v6 usesOnDemandConnection];

  id v8 = AFSiriLogContextDaemon;
  if (v7 != (id)2)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      rapportLink = self->_rapportLink;
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "-[ADRemoteContextStore _activateOnDemandRapportConnectionAndFetchContext:]";
      __int16 v16 = 2112;
      v17 = rapportLink;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s #hal #on-demand rapportLink not set up to use on-demand connection: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = self->_rapportLink;
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADRemoteContextStore _activateOnDemandRapportConnectionAndFetchContext:]";
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #hal #on-demand about to activate link: %@", buf, 0x16u);
  }
  id v10 = self->_rapportLink;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100161A7C;
  v12[3] = &unk_10050DEE8;
  void v12[4] = self;
  id v13 = v4;
  [(ADRapportLink *)v10 activateWithCompletion:v12];

LABEL_9:
}

- (void)fetchContextSnapshotFromAllDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100161D48;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchContextSnapshotFromDevicesWithPeerInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 count])
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100161F78;
      block[3] = &unk_10050E1D8;
      block[4] = self;
      id v10 = v6;
      id v11 = v7;
      dispatch_async(queue, block);
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)getContextSnapshotIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[ADRemoteContextStore getContextSnapshotIncludingKeys:excludingMandatoryKeys:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #hal", buf, 0xCu);
  }
  if (v10)
  {
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100162C28;
    v13[3] = &unk_10050E228;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
}

- (void)_enumerateDeviceContextsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    deviceContextMap = self->_deviceContextMap;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100163120;
    v7[3] = &unk_100503CD0;
    id v8 = v4;
    [(AFPeerMap *)deviceContextMap enumerateObjectsUsingBlock:v7];
  }
}

- (void)_setContextCollectionAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_contextCollectionAllowed != v3)
  {
    self->_contextCollectionAllowed = v3;
    if (v3)
    {
      id v5 = (AFPeerMap *)objc_alloc_init((Class)AFPeerMap);
      deviceContextMap = self->_deviceContextMap;
      self->_deviceContextMap = v5;

      rapportLink = self->_rapportLink;
      [(ADRapportLink *)rapportLink addListener:self];
    }
    else
    {
      id v8 = self->_deviceContextMap;
      self->_deviceContextMap = 0;

      id v9 = self->_rapportLink;
      [(ADRapportLink *)v9 removeListener:self];
    }
  }
}

- (void)stopCollectingContext
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001632C8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startCollectingContext
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001633F4;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_initWithRapportLink:(id)a3 queue:(id)a4 deviceCircleManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ADRemoteContextStore;
  id v12 = [(ADRemoteContextStore *)&v20 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rapportLink, a3);
    if (v10)
    {
      id v14 = (OS_dispatch_queue *)v10;
      queue = v13->_queue;
      v13->_queue = v14;
    }
    else
    {
      id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);

      dispatch_queue_t v18 = dispatch_queue_create("ADRemoteContextStore", v17);
      queue = v13->_queue;
      v13->_queue = (OS_dispatch_queue *)v18;
    }

    objc_storeStrong((id *)&v13->_deviceCircleManager, a5);
  }

  return v13;
}

- (ADRemoteContextStore)initWithRapportLink:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ADDeviceCircleManager sharedInstance];
  id v9 = [(ADRemoteContextStore *)self _initWithRapportLink:v7 queue:v6 deviceCircleManager:v8];

  return v9;
}

@end