@interface ADLocalContextStore
- (ADLocalContextStore)initWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5 delegate:(id)a6;
- (id)_builtInProviders;
- (id)_contextLinkMessageOptions;
- (id)_deviceContextToVendForPrivacyClass:(int64_t)a3;
- (id)_initWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5 delegate:(id)a6 deviceCircleManager:(id)a7;
- (id)_localContextWithPrivacyClass:(int64_t)a3;
- (id)localContextWithPrivacyClass:(int64_t)a3;
- (void)_didUpdateContext;
- (void)_initializeBuiltInContextProviders;
- (void)_pushContextToCollector:(id)a3 forReason:(id)a4 includingKeys:(id)a5 excludingMandatoryKeys:(id)a6 includingKeysInResponse:(id)a7 excludingMandatoryKeysInResponse:(id)a8 completion:(id)a9;
- (void)_pushContextToCollectorsForReason:(id)a3 completion:(id)a4;
- (void)_updateLocalPeerInfo:(id)a3;
- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4;
- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5;
- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7;
- (void)getLocalContextWithPrivacyClass:(int64_t)a3 completion:(id)a4;
- (void)localPeerInfoUpdatedFrom:(id)a3 to:(id)a4;
- (void)pushContextToContextCollectorIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 expectingResponseIncludingKeys:(id)a5 excludingMandatoryKeys:(id)a6 completion:(id)a7;
- (void)registerContextTransformer:(id)a3 forType:(id)a4;
- (void)setMyriadAdvertisementContext:(id)a3 completion:(id)a4;
- (void)updateRapportLink:(id)a3;
@end

@implementation ADLocalContextStore

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceCircleManager, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rapportLink, 0);
  objc_storeStrong((id *)&self->_builtInProviders, 0);
  objc_storeStrong((id *)&self->_contextTransformersByType, 0);
  objc_storeStrong((id *)&self->_redactedContextByPrivacyClass, 0);
  objc_storeStrong((id *)&self->_localContext, 0);
}

- (id)_builtInProviders
{
  return self->_builtInProviders;
}

- (void)localPeerInfoUpdatedFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100196E08;
  block[3] = &unk_10050DCB8;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100196FDC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)donateSerializedContextMapByPrivacyClass:(id)a3 withMetadataMap:(id)a4 forType:(id)a5 pushToRemote:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[ADLocalContextStore donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:completion:]";
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s #hal %@", buf, 0x16u);
    if (!v14) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v14)
  {
LABEL_3:
    queue = self->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10019741C;
    v18[3] = &unk_1005065D0;
    id v19 = v14;
    id v20 = v12;
    v21 = self;
    id v22 = v13;
    BOOL v24 = a6;
    id v23 = v15;
    dispatch_async(queue, v18);
  }
LABEL_4:
}

- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315651;
    id v20 = "-[ADLocalContextStore donateContext:withMetadata:pushToRemote:]";
    __int16 v21 = 2113;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal %{private}@ %@", buf, 0x20u);
  }
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100197768;
  v14[3] = &unk_10050CAD0;
  id v15 = v9;
  id v16 = v8;
  v17 = self;
  BOOL v18 = a5;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (void)registerContextTransformer:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100197C8C;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_deviceContextToVendForPrivacyClass:(int64_t)a3
{
  if (!a3 || a3 == 50)
  {
    v5 = [(NSMutableDictionary *)self->_redactedContextByPrivacyClass objectForKey:&off_100523768];
    id v4 = [v5 mutableCopy];
  }
  else if (a3 == 10)
  {
    id v4 = [(AFMutableDeviceContext *)self->_localContext mutableCopy];
  }
  else
  {
    id v4 = 0;
  }
  id v6 = +[NSUUID UUID];
  [v4 setIdentifier:v6];

  [v4 setPrivacyClass:a3];
  id v7 = [v4 copy];

  return v7;
}

- (void)_pushContextToCollector:(id)a3 forReason:(id)a4 includingKeys:(id)a5 excludingMandatoryKeys:(id)a6 includingKeysInResponse:(id)a7 excludingMandatoryKeysInResponse:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  __int16 v21 = (void (**)(id, void, id))a9;
  if ((AFSupportsHALContextDonation() & 1) == 0)
  {
    v29 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ADLocalContextStore _pushContextToCollector:forReason:includingKeys:excludingMandatoryKeys:includingKeysIn"
            "Response:excludingMandatoryKeysInResponse:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s #hal context donation not supported on this platform", buf, 0xCu);
      if (!v21) {
        goto LABEL_23;
      }
    }
    else if (!v21)
    {
      goto LABEL_23;
    }
    uint64_t v30 = 13;
LABEL_21:
    id v28 = +[AFError errorWithCode:v30];
    v21[2](v21, 0, v28);
LABEL_22:

    goto LABEL_23;
  }
  id v22 = +[AFPreferences sharedPreferences];
  unsigned __int8 v23 = [v22 assistantIsEnabled];

  if (v23)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v24 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[ADLocalContextStore _pushContextToCollector:forReason:includingKeys:excludingMandatoryKeys:includingKeysIn"
            "Response:excludingMandatoryKeysInResponse:completion:]";
      __int16 v37 = 2112;
      id v38 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s #hal reason: %@", buf, 0x16u);
    }
    id v25 = objc_alloc_init((Class)NSMutableDictionary);
    v26 = v25;
    if (v15) {
      [v25 addEntriesFromDictionary:v15];
    }
    [v26 setObject:v17 forKey:@"included_context_types_in_request"];
    if ([v18 count]) {
      [v26 setObject:v18 forKey:@"excluded_context_keys_in_request"];
    }
    if ([v19 count]) {
      [v26 setObject:v19 forKey:@"included_context_types_in_response"];
    }
    if ([v20 count]) {
      [v26 setObject:v20 forKey:@"excluded_context_keys_in_response"];
    }
    [v26 setObject:&__kCFBooleanTrue forKey:@"prefers_assistant_identifiers"];
    deviceCircleManager = self->_deviceCircleManager;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100198114;
    v32[3] = &unk_100504CD0;
    id v33 = v26;
    v34 = v21;
    v32[4] = self;
    id v28 = v26;
    [(ADDeviceCircleManager *)deviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:v32];

    goto LABEL_22;
  }
  v31 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ADLocalContextStore _pushContextToCollector:forReason:includingKeys:excludingMandatoryKeys:includingKeysInRe"
          "sponse:excludingMandatoryKeysInResponse:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s #hal skip pushing context to remote because Siri is disabled on this device", buf, 0xCu);
  }
  if (v21)
  {
    uint64_t v30 = 18;
    goto LABEL_21;
  }
LABEL_23:
}

- (id)_contextLinkMessageOptions
{
  uint64_t v4 = RPOptionStatusFlags;
  v5 = &off_100523780;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (void)_didUpdateContext
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(ADLocalContextStore *)self _localContextWithPrivacyClass:10];
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 localContextStore:self didUpdateDeviceContext:v7];
  }
}

- (void)_pushContextToCollectorsForReason:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ADLocalContextStore *)self _deviceContextToVendForPrivacyClass:50];
  id v9 = [v8 serializedBackingStore];
  uint64_t v11 = AFDeviceContextKeyAll;
  id v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [(ADLocalContextStore *)self _pushContextToCollector:v9 forReason:v7 includingKeys:v10 excludingMandatoryKeys:0 includingKeysInResponse:0 excludingMandatoryKeysInResponse:0 completion:v6];
}

- (void)_updateLocalPeerInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADLocalContextStore _updateLocalPeerInfo:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  [(AFMutableDeviceContext *)self->_localContext setDeviceInfo:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(NSMutableDictionary *)self->_redactedContextByPrivacyClass allValues];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setDeviceInfo:v4];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(ADLocalContextStore *)self _didUpdateContext];
}

- (void)_initializeBuiltInContextProviders
{
  if (!self->_builtInProviders)
  {
    long long v12 = [[ADAlarmContextProvider alloc] initWithDonationService:self instanceContext:self->_instanceContext];
    v3 = [[ADTimerContextProvider alloc] initWithDonationService:self instanceContext:self->_instanceContext];
    id v4 = [[ADMediaPlaybackContextProvider alloc] initWithDonationService:self instanceContext:self->_instanceContext queue:self->_queue];
    char v5 = [[ADHomeAnnouncementContextProvider alloc] initWithDonationService:self instanceContext:self->_instanceContext];
    id v6 = [[ADMultiUserStateContextProvider alloc] initWithDonationService:self instanceContext:self->_instanceContext];
    id v7 = [[ADCallStateContextProvider alloc] initWithDonationService:self instanceContext:self->_instanceContext];
    id v8 = [[ADSiriClientStateContextProvider alloc] initWithDonationService:self instanceContext:self->_instanceContext queue:self->_queue];
    +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v12, v3, v4, v5, v6, v7, v8, 0);
    uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (AFIsATV())
    {
      id v10 = [[ADSystemStateContextProvider alloc] initWithDonationService:self];
      [(NSArray *)v9 addObject:v10];
    }
    builtInProviders = self->_builtInProviders;
    self->_builtInProviders = v9;
  }
}

- (void)pushContextToContextCollectorIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 expectingResponseIncludingKeys:(id)a5 excludingMandatoryKeys:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100199238;
  v23[3] = &unk_100508278;
  id v24 = v12;
  id v25 = self;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)updateRapportLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001994A4;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_localContextWithPrivacyClass:(int64_t)a3
{
  char v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v5;
    id v10 = AFDeviceContextPrivacyClassGetStringDescription();
    int v11 = 136315394;
    id v12 = "-[ADLocalContextStore _localContextWithPrivacyClass:]";
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v11, 0x16u);
  }
  id v6 = [(ADLocalContextStore *)self _deviceContextToVendForPrivacyClass:a3];
  if (([v6 isValid] & 1) == 0)
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "-[ADLocalContextStore _localContextWithPrivacyClass:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s #hal Invalid local device context %@", (uint8_t *)&v11, 0x16u);
    }

    id v6 = 0;
  }
  return v6;
}

- (id)localContextWithPrivacyClass:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001985D0;
  int v11 = sub_1001985E0;
  id v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100199770;
  block[3] = &unk_100504C30;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)getLocalContextWithPrivacyClass:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019986C;
    block[3] = &unk_10050C148;
    void block[4] = self;
    id v10 = v6;
    int64_t v11 = a3;
    dispatch_async(queue, block);
  }
}

- (id)_initWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5 delegate:(id)a6 deviceCircleManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v37.receiver = self;
  v37.super_class = (Class)ADLocalContextStore;
  id v17 = [(ADLocalContextStore *)&v37 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a5);
    if (v12)
    {
      id v19 = (AFInstanceContext *)v12;
    }
    else
    {
      id v19 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v18->_instanceContext;
    v18->_instanceContext = v19;

    objc_storeWeak((id *)&v18->_delegate, v15);
    objc_storeStrong((id *)&v18->_deviceCircleManager, a7);
    id v21 = objc_alloc_init(AFMutableDeviceContext);
    localContext = v18->_localContext;
    v18->_localContext = v21;

    [(AFMutableDeviceContext *)v18->_localContext setFromLocalDevice:1];
    unsigned __int8 v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    redactedContextByPrivacyClass = v18->_redactedContextByPrivacyClass;
    v18->_redactedContextByPrivacyClass = v23;

    id v25 = v18->_redactedContextByPrivacyClass;
    id v26 = objc_alloc_init(AFMutableDeviceContext);
    [(NSMutableDictionary *)v25 setObject:v26 forKey:&off_100523768];

    uint64_t v27 = +[NSMapTable strongToWeakObjectsMapTable];
    contextTransformersByType = v18->_contextTransformersByType;
    v18->_contextTransformersByType = (NSMapTable *)v27;

    queue = v18->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100199B40;
    block[3] = &unk_10050E138;
    uint64_t v30 = v18;
    v36 = v30;
    dispatch_async(queue, block);
    objc_storeStrong(v30 + 5, a4);
    [v30[5] addListener:v30];
    [(ADDeviceCircleManager *)v18->_deviceCircleManager addListener:v30];
    v31 = v18->_queue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100199B9C;
    v33[3] = &unk_10050E138;
    v34 = v30;
    dispatch_async(v31, v33);
  }
  return v18;
}

- (ADLocalContextStore)initWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[ADDeviceCircleManager sharedInstance];
  id v15 = [(ADLocalContextStore *)self _initWithInstanceContext:v13 rapportLink:v12 queue:v11 delegate:v10 deviceCircleManager:v14];

  return v15;
}

- (void)setMyriadAdvertisementContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100199D9C;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

@end