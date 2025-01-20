@interface APSProxyClient
- (APSEnvironment)environment;
- (APSFilterVersionStateMachine)filterVersionStateMachine;
- (APSIDSProxyManager)proxyManager;
- (APSProxyClient)initWithEnvironment:(id)a3 guid:(id)a4;
- (APSProxyClientDelegate)delegate;
- (APSRateLimiter)connectedNotesSentLimiter;
- (APSTopicGroup)topics;
- (APSTopicManager)topicManager;
- (BOOL)_setToken:(id)a3;
- (BOOL)isActive;
- (BOOL)isConnected;
- (BOOL)isConnectedOnInterface:(id)a3;
- (BOOL)isInvalid;
- (BOOL)needsToConnect;
- (BOOL)needsToConnectOnInterface:(id)a3;
- (BOOL)needsToDisconnect;
- (BOOL)needsToDisconnectOnInterface:(id)a3;
- (BOOL)shouldOnlySendFilterOnPreferredInterface;
- (NSData)certificate;
- (NSData)nonce;
- (NSData)publicToken;
- (NSData)signature;
- (NSDate)lastPresence;
- (NSMutableDictionary)filterModeByInterfaceIdentifier;
- (NSMutableDictionary)stateByInterfaceIdentifier;
- (NSMutableSet)pendingMessageGUIDs;
- (NSString)guid;
- (NSString)hwVersion;
- (NSString)swBuild;
- (NSString)swVersion;
- (id)_createRequestForPubSubData:(id)a3 messageID:(unsigned int)a4 connectionType:(int64_t)a5 environment:(id)a6;
- (id)aps_prettyDescription;
- (id)tokenName;
- (unint64_t)filterModeOnInterface:(id)a3;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (unint64_t)stateOnInterface:(id)a3;
- (void)_adjustConnectedStateWithInterfaceHint:(BOOL)a3;
- (void)dealloc;
- (void)handleAppTokenGenerateResponse:(id)a3 error:(id)a4;
- (void)handleExpiredNonceWithServerTime:(id)a3 shouldRollToken:(BOOL)a4;
- (void)handleResult:(id)a3 forSendingOutgoingMessage:(id)a4;
- (void)incomingPresenceWithCertificate:(id)a3 nonce:(id)a4 signature:(id)a5 token:(id)a6 hwVersion:(id)a7 swVersion:(id)a8 swBuild:(id)a9;
- (void)invalidate;
- (void)noteIsConnected;
- (void)proxyManager:(id)a3 inactiveReceivedForGuid:(id)a4 environmentName:(id)a5;
- (void)proxyManager:(id)a3 incomingFilterForGuid:(id)a4 environmentName:(id)a5 enabledTopics:(id)a6 ignoredTopics:(id)a7 opportunisticTopics:(id)a8 nonWakingTopics:(id)a9 topicSalts:(id)a10;
- (void)proxyManager:(id)a3 isNearbyChanged:(BOOL)a4;
- (void)proxyManager:(id)a3 messageTracingWithStatus:(int)a4 topic:(id)a5 tracingUUID:(id)a6 token:(id)a7 guid:(id)a8 environmentName:(id)a9;
- (void)proxyManager:(id)a3 receivedPushAckResponse:(id)a4 messageId:(id)a5 token:(id)a6 connectionType:(id)a7 generation:(id)a8 guid:(id)a9 environmentName:(id)a10;
- (void)proxyManager:(id)a3 sendPubSubChannelList:(id)a4 messageID:(unsigned int)a5 token:(id)a6 connectionType:(int64_t)a7 environmentName:(id)a8 guid:(id)a9;
- (void)proxyManager:(id)a3 sendReversePush:(id)a4 guid:(id)a5 environmentName:(id)a6;
- (void)proxyManager:(id)a3 tokenGenerateWithTopicHash:(id)a4 baseToken:(id)a5 appId:(id)a6 expirationTTL:(id)a7 vapidPublicKeyHash:(id)a8 type:(id)a9 guid:(id)a10 environmentName:(id)a11;
- (void)receivedPush:(id)a3 onConnectionType:(int64_t)a4 withGeneration:(unint64_t)a5;
- (void)sendPubSubChannelListRequestForConnectionType:(int64_t)a3;
- (void)sendPubSubChannelListResponse:(id)a3;
- (void)sendPubSubUpdateMessage:(id)a3 forConnectionType:(int64_t)a4;
- (void)setActive:(BOOL)a3;
- (void)setCertificate:(id)a3;
- (void)setConnectedNotesSentLimiter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setFilterMode:(unint64_t)a3 onInterface:(id)a4;
- (void)setFilterModeByInterfaceIdentifier:(id)a3;
- (void)setFilterVersionStateMachine:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHwVersion:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setNonce:(id)a3;
- (void)setPendingMessageGUIDs:(id)a3;
- (void)setProxyManager:(id)a3;
- (void)setPublicToken:(id)a3;
- (void)setSignature:(id)a3;
- (void)setState:(unint64_t)a3 onInterface:(id)a4;
- (void)setStateByInterfaceIdentifier:(id)a3;
- (void)setSwBuild:(id)a3;
- (void)setSwVersion:(id)a3;
- (void)setTopicManager:(id)a3;
@end

@implementation APSProxyClient

- (APSProxyClient)initWithEnvironment:(id)a3 guid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)APSProxyClient;
  v9 = [(APSProxyClient *)&v21 init];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    guid = v9->_guid;
    v9->_guid = v10;

    objc_storeStrong((id *)&v9->_environment, a3);
    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    stateByInterfaceIdentifier = v9->_stateByInterfaceIdentifier;
    v9->_stateByInterfaceIdentifier = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    filterModeByInterfaceIdentifier = v9->_filterModeByInterfaceIdentifier;
    v9->_filterModeByInterfaceIdentifier = v14;

    v16 = objc_alloc_init(APSFilterVersionStateMachine);
    filterVersionStateMachine = v9->_filterVersionStateMachine;
    v9->_filterVersionStateMachine = v16;

    v18 = [[APSRateLimiter alloc] initWithLimit:10 timeLimit:1800.0];
    connectedNotesSentLimiter = v9->_connectedNotesSentLimiter;
    v9->_connectedNotesSentLimiter = v18;
  }
  return v9;
}

- (void)dealloc
{
  [(APSIDSProxyManager *)self->_proxyManager removeListener:self environment:self->_environment];
  v3.receiver = self;
  v3.super_class = (Class)APSProxyClient;
  [(APSProxyClient *)&v3 dealloc];
}

- (id)aps_prettyDescription
{
  guid = self->_guid;
  if (self->_active) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  if (self->_invalid) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  CFStringRef v19 = v4;
  CFStringRef v20 = v3;
  v17 = APSPrettyPrintCollection();
  v15 = APSPrettyPrintCollection();
  v23 = [(APSTopicManager *)self->_topicManager group];
  v22 = [v23 enabledTopics];
  v5 = APSPrettyPrintCollection();
  v18 = [(APSTopicManager *)self->_topicManager group];
  v16 = [v18 ignoredTopics];
  v6 = APSPrettyPrintCollection();
  id v7 = [(APSTopicManager *)self->_topicManager group];
  id v8 = [v7 opportunisticTopics];
  v9 = APSPrettyPrintCollection();
  v10 = [(APSTopicManager *)self->_topicManager group];
  v11 = [v10 nonWakingTopics];
  v12 = APSPrettyPrintCollection();
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%p guid: %@; isActive: %@; invalid: %@ stateByInterfaceIdentifier: %@; filterModeByInterfaceIdentifier: %@; enabledTopics: %@, ignoredTopics: %@, opportunisticTopics: %@, nonWakingTopics: %@>",
    self,
    guid,
    v20,
    v19,
    v17,
    v15,
    v5,
    v6,
    v9,
  v13 = v12);

  return v13;
}

- (void)setProxyManager:(id)a3
{
  v5 = (APSIDSProxyManager *)a3;
  proxyManager = self->_proxyManager;
  if (proxyManager != v5)
  {
    id v7 = v5;
    [(APSIDSProxyManager *)proxyManager removeListener:self environment:self->_environment];
    objc_storeStrong((id *)&self->_proxyManager, a3);
    proxyManager = (APSIDSProxyManager *)[(APSIDSProxyManager *)self->_proxyManager setListener:self environment:self->_environment];
    v5 = v7;
  }
  _objc_release_x1(proxyManager, v5);
}

- (void)incomingPresenceWithCertificate:(id)a3 nonce:(id)a4 signature:(id)a5 token:(id)a6 hwVersion:(id)a7 swVersion:(id)a8 swBuild:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = +[APSLog proxy];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138413058;
    v26 = self;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2112;
    id v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ incomingPresence {hwVersion: %@, swVersion: %@, swBuild: %@}", (uint8_t *)&v25, 0x2Au);
  }

  [(APSProxyClient *)self setCertificate:v21];
  [(APSProxyClient *)self setNonce:v20];

  [(APSProxyClient *)self setSignature:v19];
  [(APSProxyClient *)self setHwVersion:v15];
  [(APSProxyClient *)self _setToken:v18];

  [(APSProxyClient *)self setSwVersion:v16];
  [(APSProxyClient *)self setSwBuild:v17];
  v23 = (NSDate *)objc_alloc_init((Class)NSDate);
  lastPresence = self->_lastPresence;
  self->_lastPresence = v23;

  [(APSProxyClient *)self setActive:1];
}

- (void)handleExpiredNonceWithServerTime:(id)a3 shouldRollToken:(BOOL)a4
{
  BOOL v4 = a4;
  proxyManager = self->_proxyManager;
  guid = self->_guid;
  environment = self->_environment;
  id v8 = a3;
  id v9 = [(APSEnvironment *)environment name];
  [(APSIDSProxyManager *)proxyManager sendExpiredNonceWithServerTime:v8 shouldRollToken:v4 guid:guid environmentName:v9];
}

- (void)receivedPush:(id)a3 onConnectionType:(int64_t)a4 withGeneration:(unint64_t)a5
{
  proxyManager = self->_proxyManager;
  guid = self->_guid;
  environment = self->_environment;
  id v10 = a3;
  id v11 = [(APSEnvironment *)environment name];
  [(APSIDSProxyManager *)proxyManager sendReceivedPush:v10 forConnectionType:a4 generation:a5 guid:guid environmentName:v11];
}

- (BOOL)needsToConnectOnInterface:(id)a3
{
  BOOL v4 = [(NSMutableDictionary *)self->_stateByInterfaceIdentifier objectForKeyedSubscript:a3];
  v5 = (char *)[v4 unsignedIntegerValue];

  BOOL v6 = !self->_active || (unint64_t)(v5 - 3) >= 0xFFFFFFFFFFFFFFFELL;
  return !v6;
}

- (BOOL)needsToDisconnectOnInterface:(id)a3
{
  BOOL v4 = [(NSMutableDictionary *)self->_stateByInterfaceIdentifier objectForKeyedSubscript:a3];
  id v5 = [v4 unsignedIntegerValue];

  if (self->_active) {
    return 0;
  }
  return v5 != (id)3 && v5 != 0;
}

- (BOOL)needsToDisconnect
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  CFStringRef v3 = [(APSProxyClient *)self stateByInterfaceIdentifier];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([(APSProxyClient *)self needsToDisconnectOnInterface:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isConnectedOnInterface:(id)a3
{
  CFStringRef v3 = [(NSMutableDictionary *)self->_stateByInterfaceIdentifier objectForKeyedSubscript:a3];
  id v4 = [v3 unsignedIntegerValue];

  return v4 == (id)2;
}

- (void)_adjustConnectedStateWithInterfaceHint:(BOOL)a3
{
  BOOL v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(APSProxyClient *)self stateByInterfaceIdentifier];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) unsignedIntegerValue] == (id)2)
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  int isConnected = self->_isConnected;
  if (isConnected != v7 || v3)
  {
    self->_int isConnected = v7;
    long long v11 = +[APSLog proxy];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v12 = @"connected";
      if (!self->_isConnected) {
        CFStringRef v12 = @"disconnected";
      }
      *(_DWORD *)buf = 138412546;
      id v21 = self;
      __int16 v22 = 2112;
      CFStringRef v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ broadcasting to client device it's now %@", buf, 0x16u);
    }

    proxyManager = self->_proxyManager;
    guid = self->_guid;
    id v15 = [(APSEnvironment *)self->_environment name];
    [(APSIDSProxyManager *)proxyManager sendProxyIsConnected:v7 guid:guid environmentName:v15];
  }
  if (isConnected != v7) {
    [(APSRateLimiter *)self->_connectedNotesSentLimiter clear];
  }
}

- (void)noteIsConnected
{
  if ([(APSRateLimiter *)self->_connectedNotesSentLimiter isUnderLimit])
  {
    [(APSRateLimiter *)self->_connectedNotesSentLimiter note];
    [(APSProxyClient *)self _adjustConnectedStateWithInterfaceHint:1];
  }
  else
  {
    BOOL v3 = +[APSLog proxy];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      connectedNotesSentLimiter = self->_connectedNotesSentLimiter;
      int v5 = 138412546;
      uint64_t v6 = self;
      __int16 v7 = 2112;
      uint64_t v8 = connectedNotesSentLimiter;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ noted connections too many times, likely in a loop -- stopping {connectedNotesSentLimiter: %@}", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)setState:(unint64_t)a3 onInterface:(id)a4
{
  id v6 = a4;
  __int16 v7 = [(APSProxyClient *)self stateByInterfaceIdentifier];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  unint64_t v9 = (unint64_t)[v8 unsignedIntegerValue];

  long long v10 = +[APSLog proxy];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 > 3) {
      CFStringRef v11 = @"unknown";
    }
    else {
      CFStringRef v11 = off_10012B680[v9];
    }
    if (a3 > 3) {
      CFStringRef v12 = @"unknown";
    }
    else {
      CFStringRef v12 = off_10012B680[a3];
    }
    int v17 = 138413058;
    long long v18 = self;
    __int16 v19 = 2112;
    CFStringRef v20 = v11;
    __int16 v21 = 2112;
    CFStringRef v22 = v12;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ setting state from %@ to %@ onInterface %@", (uint8_t *)&v17, 0x2Au);
  }

  long long v13 = +[NSNumber numberWithUnsignedInteger:a3];
  v14 = [(APSProxyClient *)self stateByInterfaceIdentifier];
  [v14 setObject:v13 forKeyedSubscript:v6];

  BOOL v16 = a3 == 2 && v9 != 2;
  [(APSProxyClient *)self _adjustConnectedStateWithInterfaceHint:v16];
}

- (unint64_t)stateOnInterface:(id)a3
{
  id v4 = a3;
  int v5 = [(APSProxyClient *)self stateByInterfaceIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 unsignedIntegerValue];
  return (unint64_t)v7;
}

- (void)setFilterMode:(unint64_t)a3 onInterface:(id)a4
{
  id v6 = a4;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v7 = [(APSProxyClient *)self filterModeByInterfaceIdentifier];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (unint64_t)filterModeOnInterface:(id)a3
{
  id v4 = a3;
  int v5 = [(APSProxyClient *)self filterModeByInterfaceIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 unsignedIntegerValue];
  return (unint64_t)v7;
}

- (BOOL)shouldOnlySendFilterOnPreferredInterface
{
  BOOL v3 = [(APSProxyClient *)self filterModeByInterfaceIdentifier];
  if ((unint64_t)[v3 count] < 2)
  {

    return 0;
  }
  char v4 = _os_feature_enabled_impl();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  int v5 = [(APSProxyClient *)self filterModeByInterfaceIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000648BC;
  v8[3] = &unk_10012B5A8;
  v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)_setToken:(id)a3
{
  char v4 = (NSData *)a3;
  BOOL v5 = 0;
  if (v4)
  {
    publicToken = self->_publicToken;
    if (publicToken != v4)
    {
      if ([(NSData *)publicToken isEqualToData:v4])
      {
        BOOL v5 = 0;
      }
      else
      {
        id v7 = self->_publicToken;
        id v8 = (NSData *)[(NSData *)v4 copy];
        uint64_t v9 = self->_publicToken;
        self->_publicToken = v8;

        if (v7)
        {
          long long v10 = +[APSLog proxy];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 138412290;
            v14 = self;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ had a token but got a different one - any previously sent presence is now wrong", (uint8_t *)&v13, 0xCu);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained pushTokenBecameInvalidForClient:self];
        }
        BOOL v5 = 1;
      }
    }
  }

  return v5;
}

- (void)setPublicToken:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[APSLog proxy];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    publicToken = self->_publicToken;
    int v10 = 138412802;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = publicToken;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ got a token %@ (had %@)", (uint8_t *)&v10, 0x20u);
  }

  if ([(APSProxyClient *)self _setToken:v4])
  {
    proxyManager = self->_proxyManager;
    guid = self->_guid;
    uint64_t v9 = [(APSEnvironment *)self->_environment name];
    [(APSIDSProxyManager *)proxyManager sendPushToken:v4 guid:guid environmentName:v9];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    if (a3)
    {
      if (self->_invalid)
      {
        id v4 = +[APSLog proxy];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          publicToken = self->_publicToken;
          *(_DWORD *)buf = 138412546;
          int v10 = self;
          __int16 v11 = 2112;
          __int16 v12 = publicToken;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ has been activated while invalidated (%@)", buf, 0x16u);
        }
      }
      else
      {
        self->_active = a3;
        proxyManager = self->_proxyManager;
        environment = self->_environment;
        [(APSIDSProxyManager *)proxyManager setListener:self environment:environment];
      }
    }
    else
    {
      self->_active = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained clientBecameInactive:self];
    }
  }
}

- (void)invalidate
{
  BOOL v3 = +[APSLog proxy];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    publicToken = self->_publicToken;
    int v5 = 138412546;
    BOOL v6 = self;
    __int16 v7 = 2112;
    id v8 = publicToken;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ has been invalidated %@", (uint8_t *)&v5, 0x16u);
  }

  self->_invalid = 1;
  [(APSProxyClient *)self setActive:0];
}

- (void)setLargeMessageSize:(unint64_t)a3
{
  if (self->_largeMessageSize == a3)
  {
    id v4 = +[APSLog proxy];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Large Message Size did not change, not sending to client device.", buf, 0xCu);
    }
  }
  else
  {
    self->_largeMessageSize = a3;
    proxyManager = self->_proxyManager;
    guid = self->_guid;
    id v8 = [(APSEnvironment *)self->_environment name];
    -[APSIDSProxyManager sendLargeMessageSize:guid:environmentName:](proxyManager, "sendLargeMessageSize:guid:environmentName:", a3, guid);
  }
}

- (void)setMessageSize:(unint64_t)a3
{
  if (self->_messageSize == a3)
  {
    id v4 = +[APSLog proxy];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Message Size did not change, not sending to client device.", buf, 0xCu);
    }
  }
  else
  {
    self->_messageSize = a3;
    proxyManager = self->_proxyManager;
    guid = self->_guid;
    id v8 = [(APSEnvironment *)self->_environment name];
    -[APSIDSProxyManager sendMessageSize:guid:environmentName:](proxyManager, "sendMessageSize:guid:environmentName:", a3, guid);
  }
}

- (APSTopicGroup)topics
{
  return [(APSTopicManager *)self->_topicManager group];
}

- (void)proxyManager:(id)a3 isNearbyChanged:(BOOL)a4
{
  if (!a4 && self->_active)
  {
    int v5 = +[APSLog proxy];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      __int16 v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ isNearby became NO, deactivating", (uint8_t *)&v6, 0xCu);
    }

    [(APSProxyClient *)self setActive:0];
  }
}

- (void)proxyManager:(id)a3 incomingFilterForGuid:(id)a4 environmentName:(id)a5 enabledTopics:(id)a6 ignoredTopics:(id)a7 opportunisticTopics:(id)a8 nonWakingTopics:(id)a9 topicSalts:(id)a10
{
  id v16 = a3;
  id v72 = a4;
  id v17 = a5;
  id v18 = a6;
  id v71 = a7;
  id v70 = a8;
  id v69 = a9;
  id v19 = a10;
  CFStringRef v20 = +[APSLog proxy];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v19;
    id v22 = v18;
    guid = self->_guid;
    id v24 = [(APSEnvironment *)self->_environment name];
    *(_DWORD *)buf = 138413314;
    v89 = self;
    __int16 v90 = 2112;
    id v91 = v72;
    __int16 v92 = 2112;
    v93 = guid;
    id v18 = v22;
    id v19 = v21;
    __int16 v94 = 2112;
    id v95 = v17;
    __int16 v96 = 2112;
    v97 = v24;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ incomingFilterForGuid guid %@ myGuid %@  envName %@  myEnvName %@", buf, 0x34u);
  }
  if ([v72 isEqualToString:self->_guid])
  {
    int v25 = [(APSEnvironment *)self->_environment name];
    unsigned int v26 = [v17 isEqualToString:v25];

    if (v26)
    {
      id v61 = v17;
      id v62 = v16;
      if (!self->_topicManager)
      {
        __int16 v27 = [[APSDictionaryTopicSaltStore alloc] initWithDictionary:v19];
        id v28 = [[APSTopicHasher alloc] initWithTopicSaltStore:v27];
        __int16 v29 = [[APSTopicManager alloc] initWithEnvironment:self->_environment topicHasher:v28 user:0 userPreferences:0 ultraConstrainedProvider:0 delegate:0];
        topicManager = self->_topicManager;
        self->_topicManager = v29;
      }
      id v59 = v19;
      id v60 = v18;
      v68 = +[NSSet setWithArray:v18];
      v67 = +[NSSet setWithArray:v71];
      v65 = +[NSSet setWithArray:v70];
      v66 = +[NSSet setWithArray:v69];
      id v31 = objc_alloc_init((Class)NSMutableSet);
      id v32 = objc_alloc_init((Class)NSMutableSet);
      id v33 = objc_alloc_init((Class)NSMutableSet);
      id v56 = objc_alloc_init((Class)NSMutableSet);
      id v34 = [v68 mutableCopy];
      id v63 = [v67 mutableCopy];
      id v35 = [v65 mutableCopy];
      id v54 = [v66 mutableCopy];
      v36 = self->_topicManager;
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_100065834;
      v82[3] = &unk_10012B610;
      v87 = &stru_10012B5E8;
      id v37 = v31;
      id v83 = v37;
      id v38 = v32;
      id v84 = v38;
      id v39 = v33;
      id v85 = v39;
      id v40 = v56;
      id v86 = v40;
      [(APSTopicManager *)v36 performFilterBlock:v82];
      v41 = v34;
      [v34 minusSet:v37];
      [v63 minusSet:v38];
      [v35 minusSet:v39];
      [v54 minusSet:v40];
      [v37 minusSet:v68];
      [v38 minusSet:v67];
      [v39 minusSet:v65];
      [v40 minusSet:v66];
      v42 = self->_topicManager;
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100065918;
      v73[3] = &unk_10012B660;
      id v43 = v37;
      id v74 = v43;
      id v44 = v38;
      id v75 = v44;
      id v45 = v39;
      id v76 = v45;
      id v46 = v40;
      id v77 = v46;
      id v47 = v41;
      id v78 = v47;
      id v48 = v63;
      id v79 = v48;
      id v64 = v35;
      id v80 = v64;
      id v49 = v54;
      id v81 = v49;
      [(APSTopicManager *)v42 performTransactionBlock:v73];
      v57 = v48;
      if ([v47 count])
      {
        int v55 = 1;
        id v19 = v59;
        id v18 = v60;
      }
      else
      {
        id v50 = [v48 count];
        id v19 = v59;
        id v18 = v60;
        if (!v50 && ![v64 count])
        {
          v51 = v45;
          BOOL v53 = [v49 count]
             || [v43 count]
             || [v44 count]
             || [v45 count]
             || [v46 count] != 0;
          int v55 = v53;
          goto LABEL_13;
        }
        int v55 = 1;
      }
      v51 = v45;
LABEL_13:

      id v17 = v61;
      id v16 = v62;
      if (v55 && [(APSProxyClient *)self isConnected])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained requestFilterForClient:self];
      }
    }
  }
}

- (void)proxyManager:(id)a3 inactiveReceivedForGuid:(id)a4 environmentName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = +[APSLog proxy];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    __int16 v11 = [(APSEnvironment *)self->_environment name];
    int v15 = 138413314;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    CFStringRef v20 = guid;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ inactiveReceivedForGuid guid %@ myGuid %@  envName %@  myEnvName %@", (uint8_t *)&v15, 0x34u);
  }
  if ([v7 isEqualToString:self->_guid])
  {
    __int16 v12 = [(APSEnvironment *)self->_environment name];
    unsigned int v13 = [v8 isEqualToString:v12];

    if (v13)
    {
      __int16 v14 = +[APSLog proxy];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ client told us that we should no longer be active.", (uint8_t *)&v15, 0xCu);
      }

      [(APSProxyClient *)self setActive:0];
    }
  }
}

- (void)proxyManager:(id)a3 receivedPushAckResponse:(id)a4 messageId:(id)a5 token:(id)a6 connectionType:(id)a7 generation:(id)a8 guid:(id)a9 environmentName:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = +[APSLog proxy];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = v21;
    id v23 = v19;
    id v24 = v18;
    id v25 = v17;
    id v26 = v16;
    id v27 = v15;
    guid = self->_guid;
    __int16 v29 = [(APSEnvironment *)self->_environment name];
    *(_DWORD *)buf = 138413314;
    id v35 = self;
    __int16 v36 = 2112;
    id v37 = v20;
    __int16 v38 = 2112;
    id v39 = guid;
    id v15 = v27;
    id v16 = v26;
    id v17 = v25;
    id v18 = v24;
    id v19 = v23;
    id v21 = v33;
    __int16 v40 = 2112;
    id v41 = v33;
    __int16 v42 = 2112;
    id v43 = v29;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ receivedPushAckResponse guid %@ myGuid %@  envName %@  myEnvName %@", buf, 0x34u);
  }
  if ([v20 isEqualToString:self->_guid])
  {
    id v30 = [(APSEnvironment *)self->_environment name];
    unsigned int v31 = [v21 isEqualToString:v30];

    if (v31)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained client:self requestPushAckResponse:v15 messageId:v16 token:v17 connectionType:v18 generation:v19];
    }
  }
}

- (void)proxyManager:(id)a3 sendReversePush:(id)a4 guid:(id)a5 environmentName:(id)a6
{
  id v7 = a4;
  pendingMessageGUIDs = self->_pendingMessageGUIDs;
  id v13 = v7;
  if (!pendingMessageGUIDs)
  {
    uint64_t v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    int v10 = self->_pendingMessageGUIDs;
    self->_pendingMessageGUIDs = v9;

    id v7 = v13;
    pendingMessageGUIDs = self->_pendingMessageGUIDs;
  }
  __int16 v11 = [v7 guid];
  [(NSMutableSet *)pendingMessageGUIDs addObject:v11];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained client:self requestSendOutgoingMessage:v13];
}

- (void)proxyManager:(id)a3 tokenGenerateWithTopicHash:(id)a4 baseToken:(id)a5 appId:(id)a6 expirationTTL:(id)a7 vapidPublicKeyHash:(id)a8 type:(id)a9 guid:(id)a10 environmentName:(id)a11
{
  id v28 = a4;
  id v29 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = +[APSLog proxy];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    id v24 = [(APSEnvironment *)self->_environment name];
    *(_DWORD *)buf = 138413314;
    unsigned int v31 = self;
    __int16 v32 = 2112;
    id v33 = v20;
    __int16 v34 = 2112;
    id v35 = guid;
    __int16 v36 = 2112;
    id v37 = v21;
    __int16 v38 = 2112;
    id v39 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ appTokenGenerate request guid %@ myGuid %@  envName %@  myEnvName %@", buf, 0x34u);
  }
  if ([v20 isEqualToString:self->_guid])
  {
    id v25 = [(APSEnvironment *)self->_environment name];
    unsigned int v26 = [v21 isEqualToString:v25];

    if (v26)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained client:self requestTokenGenerateWithTopicHash:v28 baseToken:v29 appId:v16 expirationTTL:v17 vapidPublicKeyHash:v18 type:v19];
    }
  }
}

- (void)proxyManager:(id)a3 messageTracingWithStatus:(int)a4 topic:(id)a5 tracingUUID:(id)a6 token:(id)a7 guid:(id)a8 environmentName:(id)a9
{
  uint64_t v12 = *(void *)&a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = +[APSLog proxy];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    id v21 = [(APSEnvironment *)self->_environment name];
    int v25 = 138413314;
    unsigned int v26 = self;
    __int16 v27 = 2112;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = guid;
    __int16 v31 = 2112;
    id v32 = v18;
    __int16 v33 = 2112;
    __int16 v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ message tracing guid %@ myGuid %@  envName %@  myEnvName %@", (uint8_t *)&v25, 0x34u);
  }
  if ([v17 isEqualToString:self->_guid])
  {
    id v22 = [(APSEnvironment *)self->_environment name];
    unsigned int v23 = [v18 isEqualToString:v22];

    if (v23)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained client:self messageTracingWithStatus:v12 topic:v14 tracingUUID:v15 token:v16];
    }
  }
}

- (void)proxyManager:(id)a3 sendPubSubChannelList:(id)a4 messageID:(unsigned int)a5 token:(id)a6 connectionType:(int64_t)a7 environmentName:(id)a8 guid:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  id v18 = +[APSLog proxy];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412802;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v17;
    __int16 v27 = 2112;
    id v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ sendPubSubChannelList request guid %@ envName %@", (uint8_t *)&v23, 0x20u);
  }

  if ([v17 isEqualToString:self->_guid])
  {
    id v19 = [(APSEnvironment *)self->_environment name];
    unsigned int v20 = [v16 isEqualToString:v19];

    if (v20)
    {
      id v21 = [(APSProxyClient *)self _createRequestForPubSubData:v14 messageID:v12 connectionType:a7 environment:v16];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained client:self sendPubSubChannelList:v21 token:v15];
    }
  }
}

- (void)sendPubSubChannelListResponse:(id)a3
{
  if (self->_active)
  {
    id v4 = a3;
    int v5 = +[APSLog proxy];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ sending pubsub channel list response to agent device", (uint8_t *)&v8, 0xCu);
    }

    proxyManager = self->_proxyManager;
    id v7 = [(APSEnvironment *)self->_environment name];
    [(APSIDSProxyManager *)proxyManager sendPubSubChannelListResponse:v4 environmentName:v7 guid:self->_guid];
  }
}

- (id)_createRequestForPubSubData:(id)a3 messageID:(unsigned int)a4 connectionType:(int64_t)a5 environment:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  environment = self->_environment;
  id v10 = a3;
  __int16 v11 = +[APSConfiguration configurationForEnvironment:environment connectionType:a5];
  uint64_t v12 = [v11 pubSubRetryAttemptsCount];
  id v13 = [v12 unsignedIntegerValue];
  if (v13) {
    uint64_t v14 = (uint64_t)v13;
  }
  else {
    uint64_t v14 = 3;
  }

  id v15 = [APSPubSubRequest alloc];
  id v16 = +[NSNumber numberWithUnsignedInt:v7];
  uint64_t v17 = PKNonMacTokenName;
  id v18 = [(APSProxyClient *)self publicToken];
  id v19 = [(APSPubSubRequest *)v15 initWithMetadata:v10 messageID:v16 userName:v17 token:v18 subscriptionType:0 connectionType:a5 retryCount:v14];

  return v19;
}

- (void)sendPubSubUpdateMessage:(id)a3 forConnectionType:(int64_t)a4
{
  if (self->_active)
  {
    id v6 = a3;
    uint64_t v7 = +[APSLog proxy];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      __int16 v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ sending pubsub update message to agent device", (uint8_t *)&v10, 0xCu);
    }

    proxyManager = self->_proxyManager;
    uint64_t v9 = [(APSEnvironment *)self->_environment name];
    [(APSIDSProxyManager *)proxyManager sendPubSubUpdateMessage:v6 connectionType:a4 environmentName:v9 guid:self->_guid];
  }
}

- (void)sendPubSubChannelListRequestForConnectionType:(int64_t)a3
{
  if (self->_active)
  {
    int v5 = +[APSLog proxy];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ sending pubsub channel list request message to client device", (uint8_t *)&v8, 0xCu);
    }

    proxyManager = self->_proxyManager;
    uint64_t v7 = [(APSEnvironment *)self->_environment name];
    [(APSIDSProxyManager *)proxyManager sendPubSubChannelListRequest:a3 environmentName:v7 guid:self->_guid];
  }
}

- (void)handleResult:(id)a3 forSendingOutgoingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[APSLog proxy];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412802;
    int v23 = self;
    __int16 v24 = 2112;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ received result %@ for outgoing message %@", (uint8_t *)&v22, 0x20u);
  }

  uint64_t v9 = [v7 guid];
  if (v9)
  {
    int v10 = (void *)v9;
    pendingMessageGUIDs = self->_pendingMessageGUIDs;
    uint64_t v12 = [v7 guid];
    LODWORD(pendingMessageGUIDs) = [(NSMutableSet *)pendingMessageGUIDs containsObject:v12];

    if (pendingMessageGUIDs)
    {
      id v13 = +[APSLog proxy];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        int v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ We have this message, forwarding feedback to proxied device.", (uint8_t *)&v22, 0xCu);
      }

      uint64_t v14 = self->_pendingMessageGUIDs;
      id v15 = [v7 guid];
      [(NSMutableSet *)v14 removeObject:v15];

      id v16 = [v6 code];
      proxyManager = self->_proxyManager;
      id v18 = [v7 guid];
      id v19 = [v7 messageID];
      guid = self->_guid;
      id v21 = [(APSEnvironment *)self->_environment name];
      [(APSIDSProxyManager *)proxyManager sendReversePushResponse:v16 messageGUID:v18 messageId:v19 guid:guid environmentName:v21];
    }
  }
}

- (void)handleAppTokenGenerateResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[APSLog proxy];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ received result AppTokenGenerateResponse %@ error %@", (uint8_t *)&v12, 0x20u);
  }

  proxyManager = self->_proxyManager;
  guid = self->_guid;
  __int16 v11 = [(APSEnvironment *)self->_environment name];
  [(APSIDSProxyManager *)proxyManager sendAppTokenGenerateResponse:v6 error:v7 guid:guid environmentName:v11];
}

- (id)tokenName
{
  return 0;
}

- (APSIDSProxyManager)proxyManager
{
  return self->_proxyManager;
}

- (APSProxyClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSProxyClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)stateByInterfaceIdentifier
{
  return self->_stateByInterfaceIdentifier;
}

- (void)setStateByInterfaceIdentifier:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_int isConnected = a3;
}

- (BOOL)needsToConnect
{
  return self->_needsToConnect;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSString)hwVersion
{
  return self->_hwVersion;
}

- (void)setHwVersion:(id)a3
{
}

- (NSDate)lastPresence
{
  return self->_lastPresence;
}

- (NSString)swVersion
{
  return self->_swVersion;
}

- (void)setSwVersion:(id)a3
{
}

- (NSString)swBuild
{
  return self->_swBuild;
}

- (void)setSwBuild:(id)a3
{
}

- (NSData)publicToken
{
  return self->_publicToken;
}

- (APSFilterVersionStateMachine)filterVersionStateMachine
{
  return self->_filterVersionStateMachine;
}

- (void)setFilterVersionStateMachine:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableDictionary)filterModeByInterfaceIdentifier
{
  return self->_filterModeByInterfaceIdentifier;
}

- (void)setFilterModeByInterfaceIdentifier:(id)a3
{
}

- (APSTopicManager)topicManager
{
  return self->_topicManager;
}

- (void)setTopicManager:(id)a3
{
}

- (NSMutableSet)pendingMessageGUIDs
{
  return self->_pendingMessageGUIDs;
}

- (void)setPendingMessageGUIDs:(id)a3
{
}

- (APSRateLimiter)connectedNotesSentLimiter
{
  return self->_connectedNotesSentLimiter;
}

- (void)setConnectedNotesSentLimiter:(id)a3
{
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)largeMessageSize
{
  return self->_largeMessageSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedNotesSentLimiter, 0);
  objc_storeStrong((id *)&self->_pendingMessageGUIDs, 0);
  objc_storeStrong((id *)&self->_topicManager, 0);
  objc_storeStrong((id *)&self->_filterModeByInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_filterVersionStateMachine, 0);
  objc_storeStrong((id *)&self->_publicToken, 0);
  objc_storeStrong((id *)&self->_swBuild, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_lastPresence, 0);
  objc_storeStrong((id *)&self->_hwVersion, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_stateByInterfaceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyManager, 0);
}

@end