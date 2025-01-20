@interface APSCourier
- (APSCourier)initWithEnvironment:(id)a3 defaultUser:(id)a4 userDependencies:(id)a5 delegate:(id)a6;
- (APSCourierConnectionManager)connectionManager;
- (APSCourierDelegate)delegate;
- (APSEnvironment)environment;
- (APSIDSProxyManager)proxyManager;
- (APSProxyAgent)proxyAgent;
- (APSUserCourier)mainCourier;
- (BOOL)courierConnectionManagerClientsCanConnectRightNow;
- (BOOL)courierConnectionManagerClientsHaveEagerMessages;
- (BOOL)courierConnectionManagerClientsHaveInteractivePushDuringSleepEnabled;
- (BOOL)courierConnectionManagerClientsWantsCriticalReliability;
- (BOOL)courierConnectionManagerClientsWillBeAbleToConnect;
- (BOOL)hasIdentity;
- (BOOL)isConnectedToService;
- (BOOL)isIdle;
- (BOOL)isInteractivePushDuringSleepEnabled;
- (BOOL)isKeepAliveProxyConfigured;
- (BOOL)shouldUseInternet;
- (NSMutableArray)orderedListOfNonMainCouriers;
- (NSMutableDictionary)courierByUser;
- (NSString)debugDescription;
- (NSString)description;
- (double)currentKeepAliveInterval;
- (id)JSONDebugState;
- (id)allRegisteredChannelsForTopic:(id)a3 user:(id)a4;
- (id)aps_prettyDescription;
- (id)connectionForConnectionPortName:(id)a3 user:(id)a4;
- (id)connectionServerDelegateForUser:(id)a3 dependencies:(id)a4;
- (id)connectionServersForUser:(id)a3;
- (id)daemonUserIDs;
- (id)ifname;
- (id)latestGeoRegion;
- (id)publicTokenForUser:(id)a3;
- (unint64_t)getNextTaskMessageId;
- (unint64_t)serverTimeInNanoSeconds;
- (void)_addProtocolConnectionsToUserCourier:(id)a3;
- (void)addConnection:(id)a3 forUser:(id)a4 dependencies:(id)a5;
- (void)addTaskServer:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)canUseProxyChanged;
- (void)courierConnectionManager:(id)a3 openedNewProtocolConnection:(id)a4;
- (void)courierConnectionManager:(id)a3 receivedServerBag:(id)a4;
- (void)courierConnectionStatusDidChange:(id)a3;
- (void)courierFilterChanged:(id)a3;
- (void)courierHasNoConnections:(id)a3;
- (void)courierIdentityBecameAvailable:(id)a3;
- (void)courierIsIdle:(id)a3;
- (void)courierShouldRollBAAEnvironmentTokens:(id)a3;
- (void)didConnectOrDisconnectTokenForCourier:(id)a3 onProtocolConnection:(id)a4;
- (void)fetchUserCourierIdentityWithCompletion:(id)a3;
- (void)flushUser:(id)a3;
- (void)forceBAAIdentityRefreshWithCompletion:(id)a3;
- (void)incomingPresenceWithGuid:(id)a3 token:(id)a4 hwVersion:(id)a5 swVersion:(id)a6 swBuild:(id)a7 certificate:(id)a8 nonce:(id)a9 signature:(id)a10;
- (void)invalidateDeviceIdentity;
- (void)kickstartProxyConnection;
- (void)logoutUser:(id)a3;
- (void)performKeepAlive;
- (void)periodicSignalFired;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)prepareForSleep;
- (void)proxyAgent:(id)a3 openedNewProtocolConnection:(id)a4;
- (void)removeConnectionForConnectionPortName:(id)a3 user:(id)a4;
- (void)removeTaskServer:(id)a3;
- (void)requestConnectionIfNeeded;
- (void)rollTokenAndReconnect;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4;
- (void)setConnectionManager:(id)a3;
- (void)setCourierByUser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setMainCourier:(id)a3;
- (void)setOrderedListOfNonMainCouriers:(id)a3;
- (void)setProxyAgent:(id)a3;
- (void)setupForUser:(id)a3 dependencies:(id)a4;
- (void)shouldUseInternetDidChange:(id)a3;
- (void)updateKeepAliveInterval:(double)a3;
- (void)userCourier:(id)a3 hasReasonToConnectChangedTo:(BOOL)a4;
@end

@implementation APSCourier

- (APSCourier)initWithEnvironment:(id)a3 defaultUser:(id)a4 userDependencies:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)APSCourier;
  v15 = [(APSCourier *)&v34 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_environment, a3);
    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    courierByUser = v16->_courierByUser;
    v16->_courierByUser = v17;

    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    orderedListOfNonMainCouriers = v16->_orderedListOfNonMainCouriers;
    v16->_orderedListOfNonMainCouriers = v19;

    objc_storeWeak((id *)&v16->_delegate, v14);
    v21 = [[APSCourierConnectionManager alloc] initWithEnvironment:v11 delegate:v16];
    connectionManager = v16->_connectionManager;
    v16->_connectionManager = v21;

    v23 = [APSUserCourier alloc];
    v24 = [v13 userPreferences];
    v25 = [v13 clientIdentityProvider];
    v26 = [v13 userAppIDManager];
    v27 = [v13 systemTokenStorage];
    v28 = [(APSUserCourier *)v23 initWithEnvironment:v11 courierUser:v12 userPreferences:v24 clientIdentityProvider:v25 userAppIDManager:v26 systemTokenStorage:v27 delegate:v16 withConnectionEstablisher:v16->_connectionManager];
    mainCourier = v16->_mainCourier;
    v16->_mainCourier = v28;

    v30 = v16->_courierByUser;
    v31 = v16->_mainCourier;
    v32 = [v12 name];
    [(NSMutableDictionary *)v30 setObject:v31 forKey:v32];
  }
  return v16;
}

- (void)courierHasNoConnections:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self delegate];
  [v5 courierHasNoConnections:v4];
}

- (void)courierConnectionStatusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self delegate];
  [v5 courierConnectionStatusDidChange:v4];
}

- (void)courierFilterChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self delegate];
  [v5 courierFilterChanged:v4];
}

- (void)userCourier:(id)a3 hasReasonToConnectChangedTo:(BOOL)a4
{
  if (a4) {
    [(APSProxyAgent *)self->_proxyAgent setEnabled:1];
  }
}

- (void)courierIsIdle:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self delegate];
  [v5 courierIsIdle:v4];
}

- (void)shouldUseInternetDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self delegate];
  [v5 shouldUseInternetDidChange:v4];
}

- (void)courierIdentityBecameAvailable:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(APSCourier *)self proxyAgent];
  id v5 = [v4 activeProtocolConnections];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138412802;
    long long v15 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v10);
        id v12 = +[APSLog courier];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [(APSCourier *)self mainCourier];
          *(_DWORD *)buf = v15;
          v21 = self;
          __int16 v22 = 2112;
          v23 = v13;
          __int16 v24 = 2112;
          uint64_t v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Proxy was available adding since courier now has an identity {mainCourier: %@, protocolConnection: %@}", buf, 0x20u);
        }
        id v14 = [(APSCourier *)self mainCourier];
        [v14 beginTrackingProtocolConnection:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v8);
  }
}

- (void)kickstartProxyConnection
{
  id v2 = [(APSCourier *)self proxyAgent];
  [v2 kickstartProxyConnection];
}

- (APSIDSProxyManager)proxyManager
{
  id v2 = [(APSCourier *)self delegate];
  v3 = [v2 proxyManager];

  return (APSIDSProxyManager *)v3;
}

- (void)didConnectOrDisconnectTokenForCourier:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = (APSUserCourier *)a3;
  id v7 = a4;
  if (self->_mainCourier == v6) {
    id v8 = 0;
  }
  else {
    id v8 = (char *)[(NSMutableArray *)self->_orderedListOfNonMainCouriers indexOfObject:v6] + 1;
  }
  if ([(NSMutableArray *)self->_orderedListOfNonMainCouriers count] > v8)
  {
    uint64_t v9 = [(NSMutableArray *)self->_orderedListOfNonMainCouriers objectAtIndexedSubscript:v8];
    v10 = +[APSLog courier];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Trying to connect/disconnect for courier %@", (uint8_t *)&v11, 0x16u);
    }

    [v9 beginTrackingProtocolConnection:v7];
  }
}

- (void)courierShouldRollBAAEnvironmentTokens:(id)a3
{
  id v4 = [(APSCourier *)self delegate];
  [v4 rollTokensForAllBAAEnvironments:self];
}

- (void)proxyAgent:(id)a3 openedNewProtocolConnection:(id)a4
{
  id v5 = a4;
  id v6 = [(APSCourier *)self mainCourier];
  unsigned __int8 v7 = [v6 hasIdentity];

  if (v7)
  {
    id v8 = [(APSCourier *)self mainCourier];
    unsigned __int8 v9 = [v8 hasReasonToConnect];

    if (v9)
    {
      v10 = [(APSCourier *)self mainCourier];
      [v10 beginTrackingProtocolConnection:v5];
    }
    else
    {
      __int16 v13 = +[APSLog courier];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(APSCourier *)self mainCourier];
        int v15 = 138412802;
        long long v16 = self;
        __int16 v17 = 2112;
        long long v18 = v14;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Proxy available but courier does not have any active topics, waiting {mainCourier: %@, protocolConnection: %@}", (uint8_t *)&v15, 0x20u);
      }
      [(APSProxyAgent *)self->_proxyAgent setEnabled:0];
    }
  }
  else
  {
    int v11 = +[APSLog courier];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(APSCourier *)self mainCourier];
      int v15 = 138412802;
      long long v16 = self;
      __int16 v17 = 2112;
      long long v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Proxy available but courier does not have an identity yet, waiting {mainCourier: %@, protocolConnection: %@}", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)updateKeepAliveInterval:(double)a3
{
  id v4 = [(APSCourier *)self connectionManager];
  [v4 updateKeepAliveInterval:a3];
}

- (void)courierConnectionManager:(id)a3 openedNewProtocolConnection:(id)a4
{
  id v5 = a4;
  id v6 = [(APSCourier *)self mainCourier];
  [v6 beginTrackingProtocolConnection:v5];
}

- (void)courierConnectionManager:(id)a3 receivedServerBag:(id)a4
{
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) updateForReceivedConfig:v5];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)courierConnectionManagerClientsWillBeAbleToConnect
{
  id v2 = [(APSCourier *)self mainCourier];
  unsigned __int8 v3 = [v2 willBeAbleToConnect];

  return v3;
}

- (BOOL)courierConnectionManagerClientsCanConnectRightNow
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isConnectableRightNow])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)courierConnectionManagerClientsHaveEagerMessages
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasEagerMessages])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)courierConnectionManagerClientsWantsCriticalReliability
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) wantsCriticalReliability])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)courierConnectionManagerClientsHaveInteractivePushDuringSleepEnabled
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isInteractivePushDuringSleepEnabled])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)_addProtocolConnectionsToUserCourier:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(APSCourier *)self connectionManager];
    long long v7 = [v6 activeProtocolConnections];
    long long v8 = [(APSCourier *)self proxyAgent];
    long long v9 = [v8 activeProtocolConnections];
    *(_DWORD *)buf = 138413058;
    v33 = self;
    __int16 v34 = 2112;
    id v35 = v4;
    __int16 v36 = 2112;
    v37 = v7;
    __int16 v38 = 2112;
    v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Adding protocol connections to userCourier %@ {connectionManager.activeProtocolConnections: %@, proxyAgent.activeProtocolConnections: %@}", buf, 0x2Au);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v10 = [(APSCourier *)self connectionManager];
  long long v11 = [v10 activeProtocolConnections];

  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      int v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        [v4 beginTrackingProtocolConnection:*(void *)(*((void *)&v26 + 1) + 8 * (void)v15)];
        int v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v13);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v16 = [(APSCourier *)self proxyAgent];
  __int16 v17 = [v16 activeProtocolConnections];

  id v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [v4 beginTrackingProtocolConnection:*(void *)(*((void *)&v22 + 1) + 8 * (void)v21)];
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (id)daemonUserIDs
{
  id v3 = [(APSCourier *)self courierByUser];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_courierByUser;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = +[APSSystemUser systemUserWithUserID:](APSSystemUser, "systemUserWithUserID:", v10, (void)v14);
        unsigned int v12 = [v11 isDaemonUser];

        if (v12) {
          [v4 addObject:v10];
        }
      }
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)setupForUser:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  courierByUser = self->_courierByUser;
  long long v9 = [v6 name];
  uint64_t v10 = [(NSMutableDictionary *)courierByUser objectForKey:v9];

  if (!v10)
  {
    long long v11 = +[APSLog courier];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [v6 name];
      *(_DWORD *)buf = 138412546;
      long long v24 = self;
      __int16 v25 = 2112;
      long long v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Login user %@", buf, 0x16u);
    }
    id v13 = [APSUserCourier alloc];
    long long v14 = [(APSCourier *)self environment];
    long long v15 = [v7 userPreferences];
    long long v16 = [v7 clientIdentityProvider];
    long long v17 = [v7 userAppIDManager];
    id v18 = [v7 systemTokenStorage];
    id v19 = [(APSUserCourier *)v13 initWithEnvironment:v14 courierUser:v6 userPreferences:v15 clientIdentityProvider:v16 userAppIDManager:v17 systemTokenStorage:v18 delegate:self withConnectionEstablisher:self->_connectionManager];

    uint64_t v20 = self->_courierByUser;
    v21 = [v6 name];
    [(NSMutableDictionary *)v20 setObject:v19 forKey:v21];

    [(NSMutableArray *)self->_orderedListOfNonMainCouriers addObject:v19];
    long long v22 = [(APSCourier *)self mainCourier];
    -[APSUserCourier setEnabled:](v19, "setEnabled:", [v22 enabled]);

    [(APSCourier *)self _addProtocolConnectionsToUserCourier:v19];
  }
}

- (void)logoutUser:(id)a3
{
  id v4 = a3;
  courierByUser = self->_courierByUser;
  id v6 = [v4 name];
  id v7 = [(NSMutableDictionary *)courierByUser objectForKey:v6];

  uint64_t v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    long long v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Logging out user %@ on %@", (uint8_t *)&v9, 0x20u);
  }

  [v7 logout];
}

- (void)flushUser:(id)a3
{
  id v4 = a3;
  courierByUser = self->_courierByUser;
  id v6 = [v4 name];
  id v7 = [(NSMutableDictionary *)courierByUser objectForKey:v6];

  uint64_t v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    long long v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Flushing user %@ on %@", (uint8_t *)&v9, 0x20u);
  }

  [v7 flush];
}

- (BOOL)isIdle
{
  id v2 = [(APSCourier *)self mainCourier];
  unsigned __int8 v3 = [v2 isIdle];

  return v3;
}

- (id)connectionServersForUser:(id)a3
{
  courierByUser = self->_courierByUser;
  id v4 = [a3 name];
  id v5 = [(NSMutableDictionary *)courierByUser objectForKey:v4];
  id v6 = [v5 connectionServers];

  return v6;
}

- (void)addConnection:(id)a3 forUser:(id)a4 dependencies:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  courierByUser = self->_courierByUser;
  __int16 v11 = [v8 name];
  id v12 = [(NSMutableDictionary *)courierByUser objectForKey:v11];

  if (v12)
  {
    [v12 addConnection:v23];
  }
  else
  {
    __int16 v13 = [APSUserCourier alloc];
    long long v14 = [(APSCourier *)self environment];
    long long v15 = [v9 userPreferences];
    long long v16 = [v9 clientIdentityProvider];
    long long v17 = [v9 userAppIDManager];
    id v18 = [v9 systemTokenStorage];
    id v19 = [(APSUserCourier *)v13 initWithEnvironment:v14 courierUser:v8 userPreferences:v15 clientIdentityProvider:v16 userAppIDManager:v17 systemTokenStorage:v18 delegate:self withConnectionEstablisher:self->_connectionManager];

    uint64_t v20 = self->_courierByUser;
    v21 = [v8 name];
    [(NSMutableDictionary *)v20 setObject:v19 forKey:v21];

    [(NSMutableArray *)self->_orderedListOfNonMainCouriers addObject:v19];
    long long v22 = [(APSCourier *)self mainCourier];
    -[APSUserCourier setEnabled:](v19, "setEnabled:", [v22 enabled]);

    [(APSUserCourier *)v19 addConnection:v23];
    [(APSCourier *)self _addProtocolConnectionsToUserCourier:v19];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[APSCourierConnectionManager setEnabled:](self->_connectionManager, "setEnabled:");
  [(APSProxyAgent *)self->_proxyAgent setEnabled:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setEnabled:v3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isInteractivePushDuringSleepEnabled
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isInteractivePushDuringSleepEnabled])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isKeepAliveProxyConfigured
{
  id v2 = [(APSCourier *)self mainCourier];
  unsigned __int8 v3 = [v2 isKeepAliveProxyConfigured];

  return v3;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self connectionManager];
  [v5 appendPrettyStatusToStatusPrinter:v4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) appendPrettyStatusToStatusPrinter:v4];
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)JSONDebugState
{
  id v3 = [&__NSDictionary0__struct mutableCopy];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_courierByUser;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_courierByUser, "objectForKeyedSubscript:", v10, (void)v15);
        long long v12 = [v11 JSONDebugState];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"users"];
  long long v13 = [(APSCourierConnectionManager *)self->_connectionManager JSONDebugState];
  [v3 setObject:v13 forKeyedSubscript:@"connection"];

  return v3;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(APSCourier *)self environment];
  id v5 = [v4 name];
  id v6 = [(APSCourier *)self courierByUser];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p %@ numCouriers: %d>", v3, self, v5, [v6 count]);

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  uint64_t v3 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v4 = APSPrettyPrintCollection();

  uint64_t v5 = objc_opt_class();
  id v6 = [(APSCourier *)self environment];
  id v7 = [v6 name];
  uint64_t v8 = [(APSCourierConnectionManager *)self->_connectionManager debugDescription];
  uint64_t v9 = +[NSString stringWithFormat:@"<%@ %p, %@, couriers=%@, connectionManager=%@>", v5, self, v7, v4, v8];

  return (NSString *)v9;
}

- (id)aps_prettyDescription
{
  uint64_t v3 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v4 = APSPrettyPrintCollection();

  uint64_t v5 = [(APSCourier *)self environment];
  id v6 = [v5 name];
  id v7 = APSPrettyPrintObject();
  uint64_t v8 = +[NSString stringWithFormat:@"<%@, couriers=%@, connectionManager=%@>", v6, v4, v7];

  return v8;
}

- (double)currentKeepAliveInterval
{
  id v2 = [(APSCourier *)self connectionManager];
  [v2 currentKeepAliveInterval];
  double v4 = v3;

  return v4;
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)removeConnectionForConnectionPortName:(id)a3 user:(id)a4
{
  courierByUser = self->_courierByUser;
  id v6 = a3;
  id v8 = [a4 name];
  id v7 = [(NSMutableDictionary *)courierByUser objectForKey:v8];
  [v7 removeConnectionForConnectionPortName:v6];
}

- (id)connectionForConnectionPortName:(id)a3 user:(id)a4
{
  courierByUser = self->_courierByUser;
  id v6 = a3;
  id v7 = [a4 name];
  id v8 = [(NSMutableDictionary *)courierByUser objectForKey:v7];
  uint64_t v9 = [v8 connectionForConnectionPortName:v6];

  return v9;
}

- (void)requestConnectionIfNeeded
{
  id v2 = [(APSCourier *)self connectionManager];
  [v2 requestConnectionIfNeeded];
}

- (id)publicTokenForUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APSCourier *)self courierByUser];
  id v6 = [v4 name];

  id v7 = [v5 objectForKey:v6];
  id v8 = [v7 publicToken];

  return v8;
}

- (void)canUseProxyChanged
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) canUseProxyChanged];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)incomingPresenceWithGuid:(id)a3 token:(id)a4 hwVersion:(id)a5 swVersion:(id)a6 swBuild:(id)a7 certificate:(id)a8 nonce:(id)a9 signature:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = [(APSCourier *)self mainCourier];
  [v25 incomingPresenceWithGuid:v24 token:v23 hwVersion:v22 swVersion:v21 swBuild:v20 certificate:v19 nonce:v18 signature:v17];
}

- (BOOL)isConnectedToService
{
  id v2 = [(APSCourier *)self mainCourier];
  unsigned __int8 v3 = [v2 isConnectedToService];

  return v3;
}

- (void)invalidateDeviceIdentity
{
  id v2 = [(APSCourier *)self mainCourier];
  [v2 invalidateDeviceIdentity];
}

- (void)periodicSignalFired
{
  id v2 = [(APSCourier *)self mainCourier];
  [v2 periodicSignalFired];
}

- (id)connectionServerDelegateForUser:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  courierByUser = self->_courierByUser;
  long long v9 = [v6 name];
  long long v10 = [(NSMutableDictionary *)courierByUser objectForKey:v9];

  if (!v10) {
    [(APSCourier *)self setupForUser:v6 dependencies:v7];
  }
  long long v11 = self->_courierByUser;
  long long v12 = [v6 name];
  long long v13 = [(NSMutableDictionary *)v11 objectForKey:v12];

  return v13;
}

- (BOOL)hasIdentity
{
  id v2 = [(APSCourier *)self mainCourier];
  unsigned __int8 v3 = [v2 hasIdentity];

  return v3;
}

- (unint64_t)serverTimeInNanoSeconds
{
  id v2 = [(APSCourier *)self connectionManager];
  id v3 = [v2 serverTimeInNanoSeconds];

  return (unint64_t)v3;
}

- (id)latestGeoRegion
{
  id v2 = [(APSCourier *)self mainCourier];
  id v3 = [v2 latestGeoRegion];

  return v3;
}

- (id)allRegisteredChannelsForTopic:(id)a3 user:(id)a4
{
  courierByUser = self->_courierByUser;
  id v6 = a3;
  id v7 = [a4 name];
  long long v8 = [(NSMutableDictionary *)courierByUser objectForKey:v7];
  long long v9 = [v8 allRegisteredChannelsForTopic:v6];

  return v9;
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(APSCourier *)self mainCourier];
  [v7 sendTaskControlMessageWithMetadata:v6 messageId:a4];
}

- (void)addTaskServer:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self mainCourier];
  [v5 addTaskServer:v4];
}

- (void)removeTaskServer:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self mainCourier];
  [v5 removeTaskServer:v4];
}

- (unint64_t)getNextTaskMessageId
{
  id v2 = [(APSCourier *)self mainCourier];
  id v3 = [v2 getNextTaskMessageId];

  return (unint64_t)v3;
}

- (void)performKeepAlive
{
  id v2 = [(APSCourier *)self connectionManager];
  [v2 performKeepAlive];
}

- (BOOL)shouldUseInternet
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableDictionary *)self->_courierByUser allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldUseInternet])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)ifname
{
  id v2 = [(APSCourier *)self connectionManager];
  id v3 = [v2 ifname];

  return v3;
}

- (void)fetchUserCourierIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self mainCourier];
  [v5 getClientIdentityForcingRefresh:0 withCompletion:v4];
}

- (void)rollTokenAndReconnect
{
  id v2 = [(APSCourier *)self mainCourier];
  [v2 rollTokenAndReconnect];
}

- (void)forceBAAIdentityRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(APSCourier *)self mainCourier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000952C;
  v7[3] = &unk_100129D90;
  id v8 = v4;
  id v6 = v4;
  [v5 getClientIdentityForcingRefresh:1 withCompletion:v7];
}

- (void)prepareForDarkWake
{
  id v3 = [(APSCourier *)self mainCourier];
  [v3 prepareForDarkWake];

  id v4 = [(APSCourier *)self connectionManager];
  [v4 prepareForDarkWake];
}

- (void)prepareForFullWake
{
  id v3 = [(APSCourier *)self mainCourier];
  [v3 prepareForFullWake];

  id v4 = [(APSCourier *)self connectionManager];
  [v4 prepareForFullWake];
}

- (void)prepareForSleep
{
  id v3 = [(APSCourier *)self mainCourier];
  [v3 prepareForSleep];

  id v4 = [(APSCourier *)self connectionManager];
  [v4 prepareForSleep];
}

- (APSCourierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSCourierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
}

- (APSUserCourier)mainCourier
{
  return self->_mainCourier;
}

- (void)setMainCourier:(id)a3
{
}

- (APSCourierConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (APSProxyAgent)proxyAgent
{
  return self->_proxyAgent;
}

- (void)setProxyAgent:(id)a3
{
}

- (NSMutableDictionary)courierByUser
{
  return self->_courierByUser;
}

- (void)setCourierByUser:(id)a3
{
}

- (NSMutableArray)orderedListOfNonMainCouriers
{
  return self->_orderedListOfNonMainCouriers;
}

- (void)setOrderedListOfNonMainCouriers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedListOfNonMainCouriers, 0);
  objc_storeStrong((id *)&self->_courierByUser, 0);
  objc_storeStrong((id *)&self->_proxyAgent, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_mainCourier, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end