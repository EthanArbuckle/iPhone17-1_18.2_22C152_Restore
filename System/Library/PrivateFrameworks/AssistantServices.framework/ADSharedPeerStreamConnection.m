@interface ADSharedPeerStreamConnection
+ (id)_deviceConnectionClosedErrorWithUnderlyingError:(id)a3;
+ (id)_errorWithCode:(int64_t)a3 underylingError:(id)a4;
+ (id)_noDeviceError;
+ (id)_noNearbyPeerError;
+ (id)_streamPairInterruptedError;
+ (id)sharedPeerStreamConnectionWithServiceIdentifier:(id)a3 listener:(BOOL)a4;
- (BOOL)deviceIsNearby;
- (BOOL)hasNearbyPeer;
- (BOOL)peerSupportsExtendedHeader;
- (id)_account;
- (id)_destination;
- (id)_failureMetricsContextDictionary;
- (id)_initWithServiceIdentifier:(id)a3 listener:(BOOL)a4;
- (id)_pairedDevice;
- (id)_service;
- (void)_close;
- (void)_establishEagerStreamPair;
- (void)_getSocketFromDevice;
- (void)_getSocketFromDeviceForStreamIdentifier:(id)a3;
- (void)_handleGetMetricsMessage:(id)a3 context:(id)a4;
- (void)_handleReestablishMessage:(id)a3 context:(id)a4;
- (void)_handleResponseProtobuf:(id)a3 forIdentifier:(id)a4;
- (void)_handleWakeUpMessage:(id)a3 context:(id)a4;
- (void)_initiateOptimisticEagerStreamFetchRetry;
- (void)_invokeMetricsCompletionWithMetrics:(id)a3 forIdentifier:(id)a4;
- (void)_invokeSocketCompletionWithCurrentSocketOrError:(id)a3;
- (void)_preheat;
- (void)_requestStreamEstablishment;
- (void)_setPreferBTClassic:(BOOL)a3;
- (void)_updatePairedDeviceInfo;
- (void)addDelegate:(id)a3;
- (void)closeForConnection:(id)a3;
- (void)getAWDMetrics:(id)a3 completion:(id)a4;
- (void)getMetricsContext:(id)a3;
- (void)getRemoteMetrics:(id)a3;
- (void)getSocketForConnection:(id)a3 completion:(id)a4;
- (void)preheat;
- (void)removeDelegate:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setPreferBTClassic:(BOOL)a3;
@end

@implementation ADSharedPeerStreamConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastIDSMetricsContext, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong(&self->_socketCompletion, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
  objc_storeStrong((id *)&self->_currentStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsResponses, 0);
  objc_destroyWeak((id *)&self->_currentPeerStreamConnection);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

- (BOOL)deviceIsNearby
{
  v2 = [(ADSharedPeerStreamConnection *)self _pairedDevice];
  unsigned __int8 v3 = [v2 isNearby];

  return v3;
}

- (void)preheat
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073EB8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_preheat
{
  unsigned __int8 v3 = [(ADSharedPeerStreamConnection *)self _pairedDevice];
  unsigned int v4 = [v3 isNearby];

  if (v4)
  {
    [(ADSharedPeerStreamConnection *)self _establishEagerStreamPair];
  }
}

- (BOOL)peerSupportsExtendedHeader
{
  return self->_peerSupportsExtendedHeader;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  v6 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "-[ADSharedPeerStreamConnection service:devicesChanged:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  [(ADSharedPeerStreamConnection *)self _updatePairedDeviceInfo];
  [(ADSharedPeerStreamConnection *)self _preheat];
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = v8;
    *(_DWORD *)buf = 136315394;
    v34 = "-[ADSharedPeerStreamConnection service:nearbyDevicesChanged:]";
    __int16 v35 = 2048;
    id v36 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %lu", buf, 0x16u);
  }
  if ([v7 count])
  {
    [(ADSharedPeerStreamConnection *)self _establishEagerStreamPair];
    if (!self->_nearbyDeviceIdentifiers)
    {
      id v10 = (NSMutableSet *)objc_opt_new();
      nearbyDeviceIdentifiers = self->_nearbyDeviceIdentifiers;
      self->_nearbyDeviceIdentifiers = v10;
    }
    v12 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v13);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "uniqueIDOverride", (void)v28);
          if (v19)
          {
            if (([(NSMutableSet *)self->_nearbyDeviceIdentifiers containsObject:v19] & 1) == 0)
            {
              [(NSMutableSet *)self->_nearbyDeviceIdentifiers addObject:v19];
              char v16 = 1;
            }
            [v12 addObject:v19];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);

      [(NSMutableSet *)self->_nearbyDeviceIdentifiers intersectSet:v12];
      if ((v16 & 1) != 0 && ((AFIsNano() & 1) != 0 || AFSupportsPairedDevice()))
      {
        v20 = +[NSProcessInfo processInfo];
        [v20 systemUptime];
        double v22 = v21;

        if (vabdd_f64(v22, self->_lastSharedDataUpdateTimestamp) > 3600.0)
        {
          self->_lastSharedDataUpdateTimestamp = v22;
          v23 = +[ADCommandCenter sharedCommandCenter];
          [v23 updateSharedDataFromPeerUseCache:0 allowCloudMessaging:0 completion:0];
        }
      }
    }
    else
    {

      -[NSMutableSet intersectSet:](self->_nearbyDeviceIdentifiers, "intersectSet:", v12, (void)v28);
    }
  }
  else
  {
    v24 = self->_nearbyDeviceIdentifiers;
    self->_nearbyDeviceIdentifiers = 0;

    if (self->_sockfd != -1)
    {
      v25 = AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[ADSharedPeerStreamConnection service:nearbyDevicesChanged:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Nearby device disappeared, closing cached streams", buf, 0xCu);
      }
      [(ADSharedPeerStreamConnection *)self _close];
    }
  }
  v26 = +[NSProcessInfo processInfo];
  [v26 systemUptime];
  self->_lastNearbyDevicesChangedTimestamp = v27;
}

- (void)_establishEagerStreamPair
{
  if (!self->_gettingDeviceSocket && self->_sockfd == -1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPeerStreamConnection);

    if (!WeakRetained)
    {
      unsigned int v4 = AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        int v5 = 136315138;
        id v6 = "-[ADSharedPeerStreamConnection _establishEagerStreamPair]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Eagerly getting device socket", (uint8_t *)&v5, 0xCu);
      }
      [(ADSharedPeerStreamConnection *)self _getSocketFromDevice];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!a6)
  {
    v19 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      long long v31 = "-[ADSharedPeerStreamConnection service:account:identifier:didSendWithSuccess:error:context:]";
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2114;
      id v35 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Message send with identifier %@ failed %{public}@", buf, 0x20u);
    }
    [(ADSharedPeerStreamConnection *)self _invokeMetricsCompletionWithMetrics:0 forIdentifier:v16];
  }
  v20 = +[NSProcessInfo processInfo];
  [v20 systemUptime];
  self->_lastIDSMessageSentTimestamp = v21;

  objc_msgSend(v18, "averageLocalRTT", @"average_local_RTT");
  double v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v29[0] = v22;
  v28[1] = @"local_message_state";
  id v23 = [v18 localMessageState];
  if ((unint64_t)v23 > 3) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = (uint64_t)*(&off_1004FFC20 + (void)v23);
  }
  v29[1] = v24;
  v28[2] = @"device_blacked_out";
  v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 deviceBlackedOut]);
  v29[2] = v25;
  v26 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  lastIDSMetricsContext = self->_lastIDSMetricsContext;
  self->_lastIDSMetricsContext = v26;

  self->_lastIDSMessageSuccess = a6;
}

- (void)_handleResponseProtobuf:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    id v14 = "-[ADSharedPeerStreamConnection _handleResponseProtobuf:forIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v13, 0x20u);
  }
  __int16 v9 = [_ADPBProxyGetMetricsResponse alloc];
  id v10 = [v6 data];
  v11 = [(_ADPBProxyGetMetricsResponse *)v9 initWithData:v10];

  v12 = [(_ADPBProxyGetMetricsResponse *)v11 _ad_metrics];
  [(ADSharedPeerStreamConnection *)self _invokeMetricsCompletionWithMetrics:v12 forIdentifier:v7];
}

- (void)_handleReestablishMessage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    currentStreamIdentifier = self->_currentStreamIdentifier;
    id v10 = v8;
    v11 = [v6 lastKnownStreamId];
    int v14 = 136315650;
    __int16 v15 = "-[ADSharedPeerStreamConnection _handleReestablishMessage:context:]";
    __int16 v16 = 2112;
    __int16 v17 = currentStreamIdentifier;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Current Stream Identifier %@ Remote Stream Identifier %@", (uint8_t *)&v14, 0x20u);
  }
  if (self->_sockfd != -1)
  {
    v12 = self->_currentStreamIdentifier;
    int v13 = [v6 lastKnownStreamId];
    LODWORD(v12) = [(NSString *)v12 isEqualToString:v13];

    if (v12)
    {
      [(ADSharedPeerStreamConnection *)self _close];
      [(ADSharedPeerStreamConnection *)self _getSocketFromDevice];
    }
  }
}

- (void)_handleGetMetricsMessage:(id)a3 context:(id)a4
{
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_delegates;
  id v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPeerStreamConnection);
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100074AA0;
          v13[3] = &unk_1004FFBD8;
          id v14 = v5;
          __int16 v15 = self;
          [v11 peerStreamConnection:WeakRetained requestMetrics:v13];

          goto LABEL_11;
        }
      }
      id v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_handleWakeUpMessage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  if (self->_peerSupportsNamedStreams)
  {
    if (self->_socketForConnectionHasBeenVended)
    {
      id v24 = v6;
      v25 = self;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v7 = self->_delegates;
      id v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v32;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v32 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            id WeakRetained = objc_loadWeakRetained((id *)&v25->_currentPeerStreamConnection);
            id v14 = +[NSError errorWithDomain:@"ADPeerStreamConnectionErrorDomain" code:4 userInfo:0];
            [v12 peerStreamConnection:WeakRetained failedWithError:v14];
          }
          id v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v9);
      }

      id v6 = v24;
      self = v25;
    }
    __int16 v15 = [v6 streamId];
    [(ADSharedPeerStreamConnection *)self _getSocketFromDeviceForStreamIdentifier:v15];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v16 = self->_delegates;
  id v17 = [(NSHashTable *)v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    p_currentPeerStreamConnection = &self->_currentPeerStreamConnection;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        double v22 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
        if (objc_opt_respondsToSelector())
        {
          id v23 = objc_loadWeakRetained((id *)p_currentPeerStreamConnection);
          [v22 peerStreamConnectionHasIncomingPeer:v23];
        }
      }
      id v18 = [(NSHashTable *)v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a7;
  unsigned int v11 = [v9 type];
  v12 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "-[ADSharedPeerStreamConnection service:account:incomingUnhandledProtobuf:fromID:context:]";
    __int16 v21 = 1024;
    unsigned int v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s type = %d", (uint8_t *)&v19, 0x12u);
  }
  int v13 = [v10 incomingResponseIdentifier];
  if (v13)
  {
    [(ADSharedPeerStreamConnection *)self _handleResponseProtobuf:v9 forIdentifier:v13];
  }
  else
  {
    if (v11 > 2) {
      id v14 = 0;
    }
    else {
      id v14 = objc_opt_class();
    }
    id v15 = objc_alloc((Class)v14);
    long long v16 = [v9 data];
    id v17 = [v15 initWithData:v16];

    objc_msgSend(v17, "_ad_performWithPeerStreamConnection:context:", self, v10);
    if (!v17)
    {
      id v18 = AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        int v19 = 136315394;
        v20 = "-[ADSharedPeerStreamConnection service:account:incomingUnhandledProtobuf:fromID:context:]";
        __int16 v21 = 1024;
        unsigned int v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Don't know how to make request for %d", (uint8_t *)&v19, 0x12u);
      }
    }
  }
}

- (void)_updatePairedDeviceInfo
{
  unsigned __int8 v3 = [(ADSharedPeerStreamConnection *)self _pairedDevice];
  unsigned int v4 = [v3 modelIdentifier];
  id v5 = (NSString *)[v4 copy];
  productType = self->_productType;
  self->_productType = v5;

  id v7 = [v3 productBuildVersion];
  id v8 = (NSString *)[v7 copy];
  buildVersion = self->_buildVersion;
  self->_buildVersion = v8;

  id v10 = [v3 productName];
  unsigned int v11 = [v3 productVersion];
  v12 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    int v13 = self->_productType;
    id v14 = self->_buildVersion;
    int v16 = 136316162;
    id v17 = "-[ADSharedPeerStreamConnection _updatePairedDeviceInfo]";
    __int16 v18 = 2112;
    int v19 = v13;
    __int16 v20 = 2112;
    __int16 v21 = v14;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ %@ %@ %@", (uint8_t *)&v16, 0x34u);
  }
  AFWatchOSVersion();
  self->_peerSupportsNamedStreams = AFWatchOSVersionIsGreaterThanOrEqual();
  self->_peerSupportsExtendedHeader = AFWatchOSVersionIsGreaterThanOrEqual();
  id v15 = [v3 uniqueIDOverride];
  +[ADPeerInfo updateSharedInfoWithIdentifier:v15 productType:self->_productType buildVersion:self->_buildVersion];
}

- (void)getMetricsContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100075348;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_failureMetricsContextDictionary
{
  unsigned __int8 v3 = [(ADSharedPeerStreamConnection *)self _pairedDevice];
  id v4 = [v3 isNearby];
  id v5 = [v3 isConnected];
  id v6 = [v3 isCloudConnected];
  id v7 = +[NSProcessInfo processInfo];
  [v7 systemUptime];
  double v9 = v8;

  double v10 = v9 - self->_lastNearbyDevicesChangedTimestamp;
  id v26 = objc_alloc((Class)NSMutableDictionary);
  v28[0] = @"has_device";
  v25 = +[NSNumber numberWithBool:v3 != 0];
  v29[0] = v25;
  v28[1] = @"nearby";
  unsigned int v11 = +[NSNumber numberWithBool:v4];
  v29[1] = v11;
  v28[2] = @"connected";
  v12 = +[NSNumber numberWithBool:v5];
  v29[2] = v12;
  void v28[3] = @"cloud_connected";
  int v13 = +[NSNumber numberWithBool:v6];
  void v29[3] = v13;
  v28[4] = @"last_nearby_status_change";
  id v14 = +[NSNumber numberWithDouble:v10];
  v29[4] = v14;
  v28[5] = @"preferring_bt_classic";
  id v15 = +[NSNumber numberWithBool:self->_prefersBTClassic];
  v29[5] = v15;
  v29[6] = &off_1005234E0;
  v28[6] = @"last_wakeup_duration";
  v28[7] = @"last_stream_open_duration";
  int v16 = +[NSNumber numberWithDouble:self->_lastStreamEstablishmentDuration];
  v29[7] = v16;
  v28[8] = @"last_stream_open_error";
  id v17 = +[NSNumber numberWithUnsignedInteger:self->_lastOpenErrorCode];
  v29[8] = v17;
  __int16 v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:9];
  id v27 = [v26 initWithDictionary:v18];

  double lastIDSMessageSentTimestamp = self->_lastIDSMessageSentTimestamp;
  if (lastIDSMessageSentTimestamp != 0.0 && self->_lastIDSMetricsContext)
  {
    double v20 = v9 - lastIDSMessageSentTimestamp;
    id v21 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    __int16 v22 = +[NSNumber numberWithDouble:v20];
    [v21 setObject:v22 forKey:@"time_since"];

    id v23 = +[NSNumber numberWithBool:self->_lastIDSMessageSuccess];
    [v21 setObject:v23 forKey:@"success"];

    [v21 addEntriesFromDictionary:self->_lastIDSMetricsContext];
    [v27 setObject:v21 forKey:@"last_ids_message_info"];
  }
  return v27;
}

- (void)_setPreferBTClassic:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADSharedPeerStreamConnection _setPreferBTClassic:]";
    __int16 v18 = 2112;
    CFStringRef v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (!self->_prefersBTClassic && v3)
  {
    idsService = self->_idsService;
    uint64_t v14 = IDSLinkPreferenceOptionPacketsPerSecondKey;
    id v15 = &off_1005234C8;
    BOOL v10 = 1;
    unsigned int v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [(IDSService *)idsService setLinkPreferences:v11];
LABEL_13:

    self->_prefersBTClassic = v10;
    return;
  }
  if (self->_prefersBTClassic && !v3)
  {
    double v8 = self->_idsService;
    uint64_t v12 = IDSLinkPreferenceOptionPacketsPerSecondKey;
    int v13 = &off_1005234E0;
    unsigned int v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(IDSService *)v8 setLinkPreferences:v11];
    BOOL v10 = 0;
    goto LABEL_13;
  }
}

- (void)setPreferBTClassic:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100075900;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (BOOL)hasNearbyPeer
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000759BC;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_requestStreamEstablishment
{
  if (self->_listener && self->_peerSupportsNamedStreams)
  {
    char v3 = +[ADPreferences sharedPreferences];
    id v4 = [v3 lastKnownProxyStreamId];

    BOOL v5 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[ADSharedPeerStreamConnection _requestStreamEstablishment]";
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    if (v4)
    {
      uint64_t v6 = objc_alloc_init(_ADPBProxyReestablishRequest);
      [(_ADPBProxyReestablishRequest *)v6 setLastKnownStreamId:v4];
      id v7 = objc_alloc((Class)IDSProtobuf);
      uint64_t v8 = [(_ADPBProxyReestablishRequest *)v6 data];
      id v9 = objc_msgSend(v7, "initWithProtobufData:type:isResponse:", v8, objc_msgSend((id)objc_opt_class(), "_ADPBProxyRequestType"), 0);

      BOOL v10 = [(ADSharedPeerStreamConnection *)self _service];
      unsigned int v11 = [(ADSharedPeerStreamConnection *)self _destination];
      v19[0] = IDSSendMessageOptionTimeoutKey;
      v19[1] = IDSSendMessageOptionForceLocalDeliveryKey;
      v20[0] = &off_1005234B0;
      v20[1] = &__kCFBooleanTrue;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      id v17 = 0;
      id v18 = 0;
      unsigned __int8 v13 = [v10 sendProtobuf:v9 toDestinations:v11 priority:300 options:v12 identifier:&v18 error:&v17];
      id v14 = v18;
      id v15 = v17;

      if ((v13 & 1) == 0)
      {
        int v16 = AFSiriLogContextIDS;
        if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v22 = "-[ADSharedPeerStreamConnection _requestStreamEstablishment]";
          __int16 v23 = 2114;
          id v24 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Reestablish message failed %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)_invokeMetricsCompletionWithMetrics:(id)a3 forIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_metricsResponses objectForKey:v6];
  uint64_t v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }
  [(NSMutableDictionary *)self->_metricsResponses removeObjectForKey:v6];
}

- (void)getAWDMetrics:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075E18;
    block[3] = &unk_10050E1D8;
    id v10 = v6;
    unsigned int v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)getRemoteMetrics:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100075F14;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_close
{
  if (self->_deviceConnection)
  {
    char v3 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[ADSharedPeerStreamConnection _close]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
    }
    int sockfd = self->_sockfd;
    if (sockfd != -1)
    {
      close(sockfd);
      self->_int sockfd = -1;
    }
    self->_gettingDeviceSocket = 0;
    [(IDSDeviceConnection *)self->_deviceConnection close];
    deviceConnection = self->_deviceConnection;
    self->_deviceConnection = 0;
  }
}

- (void)closeForConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100076520;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_invokeSocketCompletionWithCurrentSocketOrError:(id)a3
{
  id v4 = a3;
  if (self->_socketCompletion)
  {
    BOOL v5 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADSharedPeerStreamConnection _invokeSocketCompletionWithCurrentSocketOrError:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
    }
    if (v4)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = self->_deviceConnection;
      deviceConnection = self->_deviceConnection;
      self->_deviceConnection = 0;

      self->_gettingDeviceSocket = 0;
      self->_int sockfd = -1;
    }
    (*((void (**)(void))self->_socketCompletion + 2))();
    id socketCompletion = self->_socketCompletion;
    self->_id socketCompletion = 0;

    self->_socketForConnectionHasBeenVended = 1;
    self->_optimisticRetriesAreBlocked = 0;
  }
}

- (void)_getSocketFromDeviceForStreamIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADSharedPeerStreamConnection _getSocketFromDeviceForStreamIdentifier:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  [(ADSharedPeerStreamConnection *)self _close];
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  [v6 setObject:&off_100523480 forKey:IDSOpenSocketOptionTransportKey];
  [v6 setObject:&off_100523498 forKey:IDSOpenSocketOptionPriorityKey];
  [v6 setObject:&off_100523480 forKey:IDSOpenSocketOptionScopeKey];
  if (v4) {
    [v6 setObject:v4 forKey:IDSOpenSocketOptionStreamNameKey];
  }
  id v7 = [(ADSharedPeerStreamConnection *)self _pairedDevice];
  id v8 = v7;
  if (v7)
  {
    if (v4 && self->_listener || ([v7 isNearby] & 1) != 0) {
      goto LABEL_17;
    }
    int v9 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADSharedPeerStreamConnection _getSocketFromDeviceForStreamIdentifier:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s no nearby device; returning immediately",
        buf,
        0xCu);
    }
    uint64_t v10 = +[ADSharedPeerStreamConnection _noNearbyPeerError];
  }
  else
  {
    unsigned int v11 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADSharedPeerStreamConnection _getSocketFromDeviceForStreamIdentifier:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s No Paired device returning immediately", buf, 0xCu);
    }
    uint64_t v10 = +[ADSharedPeerStreamConnection _noDeviceError];
  }
  id v12 = (void *)v10;
  if (!v10)
  {
LABEL_17:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v27 = sub_100076BE8;
    long long v28 = sub_100076BF8;
    id v29 = 0;
    self->_gettingDeviceSocket = 1;
    currentStreamIdentifier = self->_currentStreamIdentifier;
    self->_currentStreamIdentifier = 0;

    self->_socketForConnectionHasBeenVended = 0;
    id v14 = +[NSProcessInfo processInfo];
    [v14 systemUptime];
    uint64_t v16 = v15;

    id v17 = objc_alloc((Class)IDSDeviceConnection);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100076C00;
    v21[3] = &unk_1004FFBB0;
    id v22 = v4;
    __int16 v23 = self;
    id v24 = buf;
    uint64_t v25 = v16;
    id v18 = [v17 initSocketWithDevice:v8 options:v6 completionHandler:v21 queue:self->_queue];
    deviceConnection = self->_deviceConnection;
    p_deviceConnection = (id *)&self->_deviceConnection;
    id *p_deviceConnection = v18;

    objc_storeStrong((id *)(*(void *)&buf[8] + 40), *p_deviceConnection);
    _Block_object_dispose(buf, 8);

    goto LABEL_18;
  }
  [(ADSharedPeerStreamConnection *)self _invokeSocketCompletionWithCurrentSocketOrError:v10];
  objc_storeWeak((id *)&self->_currentPeerStreamConnection, 0);

LABEL_18:
}

- (void)_getSocketFromDevice
{
  if (self->_listener && !self->_peerSupportsNamedStreams) {
    [(ADSharedPeerStreamConnection *)self _getSocketFromDeviceForStreamIdentifier:0];
  }
}

- (void)getSocketForConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000770E4;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_initiateOptimisticEagerStreamFetchRetry
{
  if (self->_optimisticRetriesAreBlocked)
  {
    self->_optimisticRetriesAreBlocked = 1;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000773CC;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    char v3 = AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[ADSharedPeerStreamConnection _initiateOptimisticEagerStreamFetchRetry]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Denying optimistic retry as we haven't vended socket since the last time.", buf, 0xCu);
    }
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077550;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000775F4;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_destination
{
  v2 = (void *)qword_1005857B0;
  if (!qword_1005857B0)
  {
    uint64_t v3 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v4 = (void *)qword_1005857B0;
    qword_1005857B0 = v3;

    v2 = (void *)qword_1005857B0;
  }
  return v2;
}

- (id)_account
{
  v2 = [(IDSService *)self->_idsService accounts];
  uint64_t v3 = [v2 anyObject];

  return v3;
}

- (id)_pairedDevice
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(ADSharedPeerStreamConnection *)self _service];
  uint64_t v3 = [v2 devices];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isDefaultPairedDevice])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_service
{
  return self->_idsService;
}

- (id)_initWithServiceIdentifier:(id)a3 listener:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2, self, @"ADPeerStreamConnection.m", 130, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)ADSharedPeerStreamConnection;
  id v8 = [(ADSharedPeerStreamConnection *)&v23 init];
  if (v8)
  {
    id v9 = [v7 copy];
    long long v10 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9;

    long long v11 = +[NSProcessInfo processInfo];
    [v11 systemUptime];
    *((double *)v8 + 18) = v12 + -3600.0;

    id v13 = (id)qword_100585E48;
    id v14 = dispatch_queue_attr_make_initially_inactive(0);
    uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    uint64_t v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("ADPeerStreamConnection", v16, v13);
    id v18 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v17;

    id v19 = [objc_alloc((Class)IDSService) initWithService:*((void *)v8 + 3)];
    double v20 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v19;

    [*((id *)v8 + 5) addDelegate:v8 queue:*((void *)v8 + 4)];
    *((unsigned char *)v8 + 8) = a4;
    *((_DWORD *)v8 + 22) = -1;
    [v8 _updatePairedDeviceInfo];
    [v8 _requestStreamEstablishment];
    dispatch_activate(*((dispatch_object_t *)v8 + 4));
  }

  return v8;
}

+ (id)sharedPeerStreamConnectionWithServiceIdentifier:(id)a3 listener:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    if (qword_1005857C8 != -1) {
      dispatch_once(&qword_1005857C8, &stru_1004FFB88);
    }
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = sub_100076BE8;
    dispatch_queue_t v17 = sub_100076BF8;
    id v18 = 0;
    id v6 = qword_1005857B8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100077B60;
    block[3] = &unk_100501278;
    long long v11 = &v13;
    id v10 = v5;
    BOOL v12 = a4;
    dispatch_sync(v6, block);
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_streamPairInterruptedError
{
  return _[a1 _errorWithCode:3 underylingError:0];
}

+ (id)_deviceConnectionClosedErrorWithUnderlyingError:(id)a3
{
  return _[a1 _errorWithCode:1 underylingError:a3];
}

+ (id)_noDeviceError
{
  return _[a1 _errorWithCode:0 underylingError:0];
}

+ (id)_noNearbyPeerError
{
  return _[a1 _errorWithCode:2 underylingError:0];
}

+ (id)_errorWithCode:(int64_t)a3 underylingError:(id)a4
{
  if (a4)
  {
    NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
    id v10 = a4;
    id v5 = a4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v7 = +[NSError errorWithDomain:@"ADPeerStreamConnectionErrorDomain" code:a3 userInfo:v6];
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"ADPeerStreamConnectionErrorDomain" code:a3 userInfo:0];
  }
  return v7;
}

@end