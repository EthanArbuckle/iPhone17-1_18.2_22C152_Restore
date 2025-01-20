@interface MSPSharedTripServer
+ (void)migrateIfNeeded;
- (BOOL)_connectionCanControlReceiving:(id)a3;
- (BOOL)_connectionCanControlSharing:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MSPSharedTripServer)init;
- (id)_subscribedConnectionsForTripID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)connections;
- (void)_purgeSubscriptionsForConnection:(id)a3;
- (void)_setNotificationCenter:(id)a3;
- (void)blockSharedTrip:(id)a3;
- (void)checkinWithCompletion:(id)a3;
- (void)cleanConnections;
- (void)clearBlockedTripIdentifiers;
- (void)createControllers;
- (void)createXPCListener;
- (void)dealloc;
- (void)etaController:(id)a3 didUpdateDestinationForSharedTrip:(id)a4;
- (void)etaController:(id)a3 didUpdateETAForSharedTrip:(id)a4;
- (void)etaController:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4;
- (void)etaController:(id)a3 didUpdateRouteForSharedTrip:(id)a4;
- (void)etaController:(id)a3 sharedTripDidBecomeAvailable:(id)a4;
- (void)etaController:(id)a3 sharedTripDidBecomeUnavailable:(id)a4;
- (void)etaController:(id)a3 sharedTripDidClose:(id)a4;
- (void)fetchActiveHandlesWithCompletion:(id)a3;
- (void)fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3;
- (void)fetchSharedTripsWithCompletion:(id)a3;
- (void)fetchSharingIdentityWithCompletion:(id)a3;
- (void)invalidateActiveHandlesForSenderController:(id)a3;
- (void)purgeExpiredBlockedTripIdentifiers;
- (void)relay:(id)a3 accountStatusChanged:(BOOL)a4;
- (void)reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4;
- (void)senderController:(id)a3 didInvalidateSharedTripWithError:(id)a4;
- (void)senderController:(id)a3 didStartSharingWithGroupIdentifier:(id)a4;
- (void)startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5 completion:(id)a6;
- (void)startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4;
- (void)stopSharingTripWithCompletion:(id)a3;
- (void)stopSharingTripWithContacts:(id)a3 completion:(id)a4;
- (void)stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)stopSharingTripWithMessagesGroup:(id)a3 completion:(id)a4;
- (void)stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4;
- (void)subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4;
- (void)unsubscribeFromSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation MSPSharedTripServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  v7 = [[MSPSharedTripXPCPeer alloc] initWithConnection:v6];
  if ([(MSPSharedTripXPCPeer *)v7 canControlSharing]
    || [(MSPSharedTripXPCPeer *)v7 canControlReceiving])
  {
    [(NSMapTable *)self->_peersByConnection setObject:v7 forKey:v6];
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F12097C0];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0, v19);
    [v8 setClasses:v11 forSelector:sel_fetchSharedTripsWithCompletion_ argumentIndex:0 ofReply:1];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    [v8 setClasses:v14 forSelector:sel_checkinWithCompletion_ argumentIndex:3 ofReply:1];

    [v6 setExportedInterface:v8];
    [v6 setExportedObject:self];
    v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1218670];
    [v6 setRemoteObjectInterface:v15];

    [v6 _setQueue:MEMORY[0x1E4F14428]];
    v16 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = v6;
      __int16 v29 = 1024;
      BOOL v30 = [(MSPSharedTripXPCPeer *)v7 canControlSharing];
      __int16 v31 = 1024;
      BOOL v32 = [(MSPSharedTripXPCPeer *)v7 canControlReceiving];
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_DEBUG, "[Server] Accepting new connection: %@, can share: %d, can receive: %d", buf, 0x18u);
    }

    objc_initWeak((id *)buf, v6);
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__MSPSharedTripServer_listener_shouldAcceptNewConnection___block_invoke;
    v23[3] = &unk_1E617C4C0;
    objc_copyWeak(&v24, (id *)buf);
    objc_copyWeak(&v25, &location);
    [v6 setInvalidationHandler:v23];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__MSPSharedTripServer_listener_shouldAcceptNewConnection___block_invoke_113;
    v20[3] = &unk_1E617C4C0;
    objc_copyWeak(&v21, (id *)buf);
    objc_copyWeak(&v22, &location);
    [v6 setInterruptionHandler:v20];
    [(NSMutableSet *)self->_connections addObject:v6];
    [v6 resume];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
    BOOL v17 = 1;
  }
  else
  {
    v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_ERROR, "[Server] will not accept connection due to missing entitlements: %@", buf, 0xCu);
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (void)checkinWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *, void *, void *, uint64_t))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [MEMORY[0x1E4F29268] currentConnection];
  id v6 = [(MSPSharedTripRelay *)self->_idsRelay sharingIdentity];
  v7 = [(NSMapTable *)self->_peersByConnection objectForKey:v5];
  if ([v7 canControlSharing])
  {
    v8 = [(MSPSenderETAController *)self->_sendingController activeHandles];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([v7 canControlSharing])
  {
    v9 = [(MSPSenderETAController *)self->_sendingController serviceNamesByActiveHandle];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  if ([v7 canControlReceiving])
  {
    uint64_t v10 = [(MSPReceiverETAController *)self->_receivingController allTrips];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v11 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ([v7 canControlSharing]) {
      v12 = "";
    }
    else {
      v12 = " (not entitled)";
    }
    uint64_t v13 = [v10 count];
    int v14 = [v7 canControlReceiving];
    int v18 = 138413571;
    v15 = "";
    if (!v14) {
      v15 = " (not entitled)";
    }
    id v19 = v5;
    __int16 v20 = 2113;
    id v21 = v6;
    __int16 v22 = 2113;
    v23 = v8;
    __int16 v24 = 2080;
    id v25 = v12;
    __int16 v26 = 2048;
    uint64_t v27 = v13;
    __int16 v28 = 2080;
    __int16 v29 = v15;
    _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[Server] Checking in on %@ (identity: %{private}@, %{private}@%s, %lu%s trips", (uint8_t *)&v18, 0x3Eu);
  }

  uint64_t v16 = [v7 canControlSharing];
  if ([v7 canControlReceiving]) {
    uint64_t v17 = v16 | 2;
  }
  else {
    uint64_t v17 = v16;
  }
  v4[2](v4, v6, v8, v9, v10, v17);
}

- (MSPSharedTripServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSPSharedTripServer;
  v2 = [(MSPSharedTripServer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MSPSharedTripServer *)v2 createControllers];
    [(MSPSharedTripServer *)v3 createXPCListener];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(MSPSharedTripServer *)self cleanConnections];
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    id v6 = "-[MSPSharedTripServer dealloc]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSharedTripServer;
  [(MSPSharedTripServer *)&v4 dealloc];
}

- (void)cleanConnections
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    uint64_t v16 = "-[MSPSharedTripServer cleanConnections]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = self->_connections;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "invalidate", (void)v10);
        [v9 setExportedObject:0];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(MSPReceiverETAController *)self->_receivingController cleanTimer];
  [(NSXPCListener *)self->_listener invalidate];
}

- (void)createXPCListener
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_listener)
  {
    v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136380675;
      long long v13 = "-[MSPSharedTripServer createXPCListener]";
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", (uint8_t *)&v12, 0xCu);
    }

    objc_super v4 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
    connections = self->_connections;
    self->_connections = v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    peersByConnection = self->_peersByConnection;
    self->_peersByConnection = v6;

    v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    connectionSubscriptionsByTripID = self->_connectionSubscriptionsByTripID;
    self->_connectionSubscriptionsByTripID = v8;

    long long v10 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.Maps.xpc.SharedTrip"];
    listener = self->_listener;
    self->_listener = v10;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener _setQueue:MEMORY[0x1E4F14428]];
    [(NSXPCListener *)self->_listener resume];
    notify_post(MSPSharedTripServerStartDarwinNotification);
  }
}

void __58__MSPSharedTripServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_ERROR, "[Server] Connection invalidated: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_super v4 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = v4;
  if (v4)
  {
    [v4[6] removeObject:WeakRetained];
    [v5[8] removeObjectForKey:WeakRetained];
    [v5 _purgeSubscriptionsForConnection:WeakRetained];
  }
}

void __58__MSPSharedTripServer_listener_shouldAcceptNewConnection___block_invoke_113(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_ERROR, "[Server] Connection interrupted: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_super v4 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = v4;
  if (v4)
  {
    [v4[6] removeObject:WeakRetained];
    [v5[8] removeObjectForKey:WeakRetained];
    [v5 _purgeSubscriptionsForConnection:WeakRetained];
  }
}

- (BOOL)_connectionCanControlSharing:(id)a3
{
  v3 = [(NSMapTable *)self->_peersByConnection objectForKey:a3];
  char v4 = [v3 canControlSharing];

  return v4;
}

- (BOOL)_connectionCanControlReceiving:(id)a3
{
  v3 = [(NSMapTable *)self->_peersByConnection objectForKey:a3];
  char v4 = [v3 canControlReceiving];

  return v4;
}

- (id)connections
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = (void *)[(NSMutableSet *)self->_connections copy];

  return v3;
}

- (id)_subscribedConnectionsForTripID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_connectionSubscriptionsByTripID objectForKeyedSubscript:v6];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !v4;
    }
    if (!v8)
    {
      v9 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEBUG, "[Server] Initialising subscriptions for trip %@", (uint8_t *)&v11, 0xCu);
      }

      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [(NSMutableDictionary *)self->_connectionSubscriptionsByTripID setObject:v7 forKeyedSubscript:v6];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_purgeSubscriptionsForConnection:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Server] Purging subscriptions for %@", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  connectionSubscriptionsByTripID = self->_connectionSubscriptionsByTripID;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__MSPSharedTripServer__purgeSubscriptionsForConnection___block_invoke;
  v26[3] = &unk_1E617C4E8;
  id v20 = v4;
  id v27 = v20;
  id v8 = v6;
  id v28 = v8;
  [(NSMutableDictionary *)connectionSubscriptionsByTripID enumerateKeysAndObjectsUsingBlock:v26];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v15 = [(MSPSharedTripServer *)self _subscribedConnectionsForTripID:v14 createIfNeeded:0];
        if (![v15 count])
        {
          uint64_t v16 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v14;
            _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_DEFAULT, "[Server] Unsubscribing from trip %@, no more connections", buf, 0xCu);
          }

          [(NSMutableDictionary *)self->_connectionSubscriptionsByTripID setObject:0 forKeyedSubscript:v14];
          receivingController = self->_receivingController;
          id v21 = 0;
          [(MSPReceiverETAController *)receivingController unsubscribeFromUpdatesToSharedTrip:v14 error:&v21];
          id v18 = v21;
          if (v18)
          {
            id v19 = MSPGetSharedTripLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v30 = v14;
              __int16 v31 = 2112;
              id v32 = v18;
              _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_ERROR, "[Server] Error unsubscribing from trip %@ for purged connection: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v33 count:16];
    }
    while (v11);
  }
}

void __56__MSPSharedTripServer__purgeSubscriptionsForConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 containsObject:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 40) addObject:v6];
    [v5 removeObject:*(void *)(a1 + 32)];
  }
}

- (void)createControllers
{
  v3 = objc_alloc_init(MSPSharedTripRelay);
  idsRelay = self->_idsRelay;
  self->_idsRelay = v3;

  [(MSPSharedTripRelay *)self->_idsRelay setAvailabilityDelegate:self];
  id v5 = [[MSPSenderETAController alloc] initWithRelay:self->_idsRelay];
  sendingController = self->_sendingController;
  self->_sendingController = v5;

  [(MSPSenderETAController *)self->_sendingController setDelegate:self];
  id v7 = [[MSPReceiverETAController alloc] initWithRelay:self->_idsRelay];
  receivingController = self->_receivingController;
  self->_receivingController = v7;

  [(MSPReceiverETAController *)self->_receivingController setDelegate:self];
  self->_capabilityFetchingServer = objc_alloc_init(MSPSharedTripCapabilityFetchingServer);

  MEMORY[0x1F41817F8]();
}

- (void)_setNotificationCenter:(id)a3
{
}

- (void)etaController:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    id v19 = "-[MSPSharedTripServer etaController:didUpdateDestinationForSharedTrip:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 destinationDidUpdateForSharedTrip:v5];
        }
        else
        {
          uint64_t v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "-[MSPSharedTripServer etaController:didUpdateDestinationForSharedTrip:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)etaController:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    id v19 = "-[MSPSharedTripServer etaController:didUpdateReachedDestinationForSharedTrip:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 destinationReachedDidUpdateForSharedTrip:v5];
        }
        else
        {
          uint64_t v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "-[MSPSharedTripServer etaController:didUpdateReachedDestinationForSharedTrip:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)etaController:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    id v19 = "-[MSPSharedTripServer etaController:didUpdateETAForSharedTrip:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 etaDidUpdateForSharedTrip:v5];
        }
        else
        {
          uint64_t v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "-[MSPSharedTripServer etaController:didUpdateETAForSharedTrip:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)etaController:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    id v19 = "-[MSPSharedTripServer etaController:didUpdateRouteForSharedTrip:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 routeDidUpdateForSharedTrip:v5];
        }
        else
        {
          uint64_t v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "-[MSPSharedTripServer etaController:didUpdateRouteForSharedTrip:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)etaController:(id)a3 sharedTripDidBecomeAvailable:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    id v19 = "-[MSPSharedTripServer etaController:sharedTripDidBecomeAvailable:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 sharedTripDidBecomeAvailable:v5];
        }
        else
        {
          uint64_t v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "-[MSPSharedTripServer etaController:sharedTripDidBecomeAvailable:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)etaController:(id)a3 sharedTripDidBecomeUnavailable:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    id v19 = "-[MSPSharedTripServer etaController:sharedTripDidBecomeUnavailable:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 sharedTripDidBecomeUnavailable:v5];
        }
        else
        {
          uint64_t v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "-[MSPSharedTripServer etaController:sharedTripDidBecomeUnavailable:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)etaController:(id)a3 sharedTripDidClose:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    id v19 = "-[MSPSharedTripServer etaController:sharedTripDidClose:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 sharedTripDidClose:v5];
        }
        else
        {
          uint64_t v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "-[MSPSharedTripServer etaController:sharedTripDidClose:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)fetchSharingIdentityWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  if (v5 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v5])
  {

    id v5 = [(MSPSharedTripRelay *)self->_idsRelay sharingIdentity];
    id v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138477827;
      uint64_t v9 = (const char *)v5;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[Server] fetchSendingIdentity: %{private}@)", (uint8_t *)&v8, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    id v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[MSPSharedTripServer fetchSharingIdentityWithCompletion:]";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  if (v5 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v5])
  {

    id v6 = +[MSPMapsDefaultsAccessor get:@"MapsSharedETADefaultSender"];
    id v7 = [(MSPSharedTripRelay *)self->_idsRelay sharingIdentity];
    int v8 = [v7 handle];

    if (v8)
    {
      id v5 = 0;
    }
    else
    {
      v18[0] = *MEMORY[0x1E4F28228];
      *(void *)uint64_t v13 = @"Invalid account for sharing";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v18 count:1];
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:5 userInfo:v9];

      if (v5) {
        goto LABEL_10;
      }
    }
    if (v6)
    {
      uint64_t v10 = [v6 isEqual:v8] ^ 1;
      goto LABEL_15;
    }
LABEL_10:
    if (v5)
    {
      uint64_t v11 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v13 = 138412290;
        *(void *)&v13[4] = v5;
        _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "[Server] fetchRequiresUserConfirmationOfSharingIdentity failed with error: %@", v13, 0xCu);
      }
      uint64_t v10 = 1;
      goto LABEL_19;
    }
    uint64_t v10 = 1;
LABEL_15:
    uint64_t v11 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = "NO";
      *(_DWORD *)uint64_t v13 = 136315651;
      if (v10) {
        uint64_t v12 = "YES";
      }
      *(void *)&v13[4] = v12;
      __int16 v14 = 2113;
      long long v15 = v8;
      __int16 v16 = 2113;
      long long v17 = v6;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[Server] fetchRequiresUserConfirmationOfSharingIdentity: %s, handle: %{private}@, last confirmed: %{private}@", v13, 0x20u);
    }
LABEL_19:

    v4[2](v4, v10, v8, v5);
    goto LABEL_20;
  }
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)&v13[4] = "-[MSPSharedTripServer fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:]";
    __int16 v14 = 2112;
    long long v15 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", v13, 0x16u);
  }
LABEL_20:
}

- (void)reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int v8 = [MEMORY[0x1E4F29268] currentConnection];
  if (v8 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v8])
  {

    uint64_t v9 = [(MSPSharedTripRelay *)self->_idsRelay sharingIdentity];
    uint64_t v10 = [v9 handle];

    if ([v10 isEqualToString:v6])
    {
      +[MSPMapsDefaultsAccessor set:@"MapsSharedETADefaultSender" value:v6];
      +[MSPMapsDefaultsAccessor synchronize];
      uint64_t v11 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v13 = 138477827;
        *(void *)&v13[4] = v6;
        _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[Server] reportUserConfirmationOfSharingIdentity: set user-confirmed handle: %{private}@", v13, 0xCu);
      }
      int v8 = 0;
    }
    else
    {
      v16[0] = *MEMORY[0x1E4F28228];
      *(void *)uint64_t v13 = @"The provided sharing handle does not match the current sharing identity";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v16 count:1];
      int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:6 userInfo:v12];

      uint64_t v11 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v13 = 138412290;
        *(void *)&v13[4] = v8;
        _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "[Server] reportUserConfirmationOfSharingIdentity failed with error: %@", v13, 0xCu);
      }
    }

    v7[2](v7, v8);
  }
  else
  {
    uint64_t v10 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)&v13[4] = "-[MSPSharedTripServer reportUserConfirmationOfSharingIdentity:completion:]";
      __int16 v14 = 2112;
      long long v15 = v8;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", v13, 0x16u);
    }
  }
}

- (void)startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (char *)a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, id))a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v13 = [MEMORY[0x1E4F29268] currentConnection];
  if (v13 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v13])
  {

    __int16 v14 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEFAULT, "[Server] Start sharing with contacts: %@", buf, 0xCu);
    }

    sendingController = self->_sendingController;
    id v17 = 0;
    [(MSPSenderETAController *)sendingController startSharingWith:v10 capabilityType:a4 serviceName:v11 error:&v17];
    id v13 = v17;
    v12[2](v12, v13);
  }
  else
  {
    __int16 v16 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[MSPSharedTripServer startSharingTripWithContacts:capabilityType:serviceName:completion:]";
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
  }
}

- (void)startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  if (v8 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v8])
  {

    uint64_t v9 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v14 = v6;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEFAULT, "[Service] Start sharing trip with group: %@", buf, 0xCu);
    }

    sendingController = self->_sendingController;
    id v12 = 0;
    [(MSPSenderETAController *)sendingController startSharingWithGroup:v6 error:&v12];
    id v8 = v12;
    v7[2](v7, v8);
  }
  else
  {
    id v11 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[MSPSharedTripServer startSharingTripWithMessagesGroup:completion:]";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
  }
}

- (void)stopSharingTripWithContacts:(id)a3 completion:(id)a4
{
}

- (void)stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a3;
  uint64_t v9 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v10 = [MEMORY[0x1E4F29268] currentConnection];
  if (v10 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v10])
  {

    id v11 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[Service] stop sharing trip with Maps/Messages contacts: %@", buf, 0xCu);
    }

    sendingController = self->_sendingController;
    id v14 = 0;
    [(MSPSenderETAController *)sendingController stopSharingWith:v8 reason:a4 error:&v14];
    id v10 = v14;
    [MEMORY[0x1E4F63E30] captureUserAction:105 target:0 value:0];
    v9[2](v9, v10);
  }
  else
  {
    id v13 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[MSPSharedTripServer stopSharingTripWithContacts:reason:completion:]";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
  }
}

- (void)stopSharingTripWithMessagesGroup:(id)a3 completion:(id)a4
{
}

- (void)stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a3;
  uint64_t v9 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v10 = [MEMORY[0x1E4F29268] currentConnection];
  if (v10 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v10])
  {

    id v11 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[Service] stop sharing trip with group: %@", buf, 0xCu);
    }

    sendingController = self->_sendingController;
    id v14 = 0;
    [(MSPSenderETAController *)sendingController stopSharingWithGroup:v8 reason:a4 error:&v14];
    id v10 = v14;
    v9[2](v9, v10);
  }
  else
  {
    id v13 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[MSPSharedTripServer stopSharingTripWithMessagesGroup:reason:completion:]";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
  }
}

- (void)stopSharingTripWithCompletion:(id)a3
{
}

- (void)stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v7 = [MEMORY[0x1E4F29268] currentConnection];
  if (v7 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v7])
  {

    id v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[Server] Stop sharing", buf, 2u);
    }

    sendingController = self->_sendingController;
    id v13 = 0;
    [(MSPSenderETAController *)sendingController stopSharingWithReason:a3 error:&v13];
    id v7 = v13;
    id v10 = [[MSPSenderETAController alloc] initWithRelay:self->_idsRelay];
    id v11 = self->_sendingController;
    self->_sendingController = v10;

    [(MSPSenderETAController *)self->_sendingController setDelegate:self];
    v6[2](v6, v7);
  }
  else
  {
    id v12 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "-[MSPSharedTripServer stopSharingTripWithReason:completion:]";
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
  }
}

- (void)fetchActiveHandlesWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, NSObject *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  if (v5 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v5])
  {

    id v5 = [(MSPSenderETAController *)self->_sendingController activeHandles];
    id v6 = [(MSPSenderETAController *)self->_sendingController serviceNamesByActiveHandle];
    id v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = (const char *)v5;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "[Server] Fetch active handles: %@", (uint8_t *)&v8, 0xCu);
    }

    v4[2](v4, v5, v6);
  }
  else
  {
    id v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[MSPSharedTripServer fetchActiveHandlesWithCompletion:]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  if (v8 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v8])
  {

    uint64_t v9 = [(MSPSharedTripServer *)self _subscribedConnectionsForTripID:v6 createIfNeeded:1];
    uint64_t v10 = [v9 count];
    [v9 addObject:v8];
    uint64_t v11 = [v9 count];
    uint64_t v12 = MSPGetSharedTripLog();
    id v13 = v12;
    if (v10 == v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v20 = (const char *)v8;
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_INFO, "[Server] %@ already subscribed to trip %@", buf, 0x16u);
      }

      v7[2](v7, 0);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v20 = (const char *)v8;
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        __int16 v23 = 2048;
        uint64_t v24 = [v9 count];
        _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEFAULT, "[Server] Added %@ to subscriptions for trip %@ (%lu subscriptions)", buf, 0x20u);
      }

      __int16 v15 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v20 = v6;
        _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_DEFAULT, "[Server] Subscribe to trip: %@", buf, 0xCu);
      }

      receivingController = self->_receivingController;
      id v18 = 0;
      [(MSPReceiverETAController *)receivingController subscribeToUpdatesToSharedTrip:v6 error:&v18];
      id v17 = v18;
      ((void (**)(id, id))v7)[2](v7, v17);
    }
  }
  else
  {
    id v14 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "-[MSPSharedTripServer subscribeToSharedTripUpdatesWithIdentifier:completion:]";
      __int16 v21 = 2112;
      uint64_t v22 = (char *)v8;
      _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }

    uint64_t v9 = v8;
  }
}

- (void)unsubscribeFromSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = (void (**)(id, NSObject *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  if (v8 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v8])
  {

    uint64_t v9 = [(MSPSharedTripServer *)self _subscribedConnectionsForTripID:v6 createIfNeeded:0];
    uint64_t v10 = [v9 count];
    [v9 removeObject:v8];
    uint64_t v11 = [v9 count];
    uint64_t v12 = MSPGetSharedTripLog();
    id v13 = v12;
    if (v10 == v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v20 = (const char *)v8;
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Connection %@ was not subscribed to trip: %@", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v20 = (const char *)v8;
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEFAULT, "[Server] Removed connection %@ from subscriptions for trip: %@", buf, 0x16u);
      }

      if ([v9 count])
      {
        id v14 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = [v9 count];
          *(_DWORD *)buf = 134218242;
          __int16 v20 = (const char *)v15;
          __int16 v21 = 2112;
          uint64_t v22 = v6;
          _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEBUG, "[Server] %lu subscribed connections for trip %@", buf, 0x16u);
        }
      }
      __int16 v16 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v20 = v6;
        _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_DEFAULT, "[Server] Unsubscribe from trip: %@", buf, 0xCu);
      }

      receivingController = self->_receivingController;
      id v18 = 0;
      [(MSPReceiverETAController *)receivingController unsubscribeFromUpdatesToSharedTrip:v6 error:&v18];
      id v13 = v18;
      v7[2](v7, v13);
    }
  }
  else
  {
    id v13 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "-[MSPSharedTripServer unsubscribeFromSharedTripUpdatesWithIdentifier:completion:]";
      __int16 v21 = 2112;
      uint64_t v22 = (char *)v8;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
    uint64_t v9 = v8;
  }
}

- (void)fetchSharedTripsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  if (v5 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v5])
  {

    id v5 = [(MSPReceiverETAController *)self->_receivingController allTrips];
    id v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = (const char *)v5;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[Server] Fetching all received trips: %@", (uint8_t *)&v8, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    id v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[MSPSharedTripServer fetchSharedTripsWithCompletion:]";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)blockSharedTrip:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  if (v5 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v5])
  {

    id v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[Service] block sharing trip: %@", (uint8_t *)&v8, 0xCu);
    }

    [(MSPReceiverETAController *)self->_receivingController blockSharedTrip:v4];
  }
  else
  {
    id v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[MSPSharedTripServer blockSharedTrip:]";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)clearBlockedTripIdentifiers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = [MEMORY[0x1E4F29268] currentConnection];
  if (v3 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v3])
  {

    id v4 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[Service] clear blocked trip identifiers", (uint8_t *)&v6, 2u);
    }

    [(MSPReceiverETAController *)self->_receivingController clearBlockedTripIdentifiers];
  }
  else
  {
    id v5 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[MSPSharedTripServer clearBlockedTripIdentifiers]";
      __int16 v8 = 2112;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)purgeExpiredBlockedTripIdentifiers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = [MEMORY[0x1E4F29268] currentConnection];
  if (v3 && [(MSPSharedTripServer *)self _connectionCanControlReceiving:v3])
  {

    id v4 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[Service] purge expired blocked trip identifiers", (uint8_t *)&v6, 2u);
    }

    [(MSPReceiverETAController *)self->_receivingController purgeExpiredBlockedTripIdentifiers];
  }
  else
  {
    id v5 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[MSPSharedTripServer purgeExpiredBlockedTripIdentifiers]";
      __int16 v8 = 2112;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)senderController:(id)a3 didStartSharingWithGroupIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    uint64_t v19 = "-[MSPSharedTripServer senderController:didStartSharingWithGroupIdentifier:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 sharedTripDidStartSharingWithIdentifier:v5];
        }
        else
        {
          id v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v19 = "-[MSPSharedTripServer senderController:didStartSharingWithGroupIdentifier:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)senderController:(id)a3 didInvalidateSharedTripWithError:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    uint64_t v19 = "-[MSPSharedTripServer senderController:didInvalidateSharedTripWithError:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  id v7 = [(MSPSharedTripServer *)self connections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v12])
        {

          id v12 = [v12 remoteObjectProxy];
          [v12 sharedTripInvalidatedWithError:v5];
        }
        else
        {
          id v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v19 = "-[MSPSharedTripServer senderController:didInvalidateSharedTripWithError:]";
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)invalidateActiveHandlesForSenderController:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[MSPSharedTripServer invalidateActiveHandlesForSenderController:]";
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "[Server] %s", buf, 0xCu);
  }

  int v6 = [(MSPSharedTripServer *)self connections];
  id v7 = [v4 activeHandles];
  long long v16 = v4;
  uint64_t v8 = [v4 serviceNamesByActiveHandle];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        if (v14 && [(MSPSharedTripServer *)self _connectionCanControlSharing:v14])
        {

          id v14 = [v14 remoteObjectProxy];
          [v14 sharedTripDidUpdateRecipients:v7 withServices:v8];
        }
        else
        {
          long long v15 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v22 = "-[MSPSharedTripServer invalidateActiveHandlesForSenderController:]";
            __int16 v23 = 2112;
            id v24 = v14;
            _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }
}

- (void)relay:(id)a3 accountStatusChanged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 136380931;
    id v24 = "-[MSPSharedTripServer relay:accountStatusChanged:]";
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s signedIntoiCloud %@", buf, 0x16u);
  }
  uint64_t v8 = [(MSPSharedTripServer *)self connections];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          long long v15 = [v13 remoteObjectProxy];
          *(_DWORD *)buf = 138412546;
          id v24 = (const char *)v13;
          __int16 v25 = 2112;
          uint64_t v26 = v15;
          _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEBUG, "[Server] connection %@ %@", buf, 0x16u);
        }
        long long v16 = [v13 remoteObjectProxy];
        long long v17 = [(MSPSharedTripRelay *)self->_idsRelay sharingIdentity];
        [v16 sharingIdentityDidChange:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peersByConnection, 0);
  objc_storeStrong((id *)&self->_connectionSubscriptionsByTripID, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_idsRelay, 0);
  objc_storeStrong((id *)&self->_capabilityFetchingServer, 0);
  objc_storeStrong((id *)&self->_receivingController, 0);

  objc_storeStrong((id *)&self->_sendingController, 0);
}

+ (void)migrateIfNeeded
{
  id v2 = [MEMORY[0x1E4F64600] sharedObject];
  [v2 runAfterFirstUnlock:MEMORY[0x1E4F14428] block:&__block_literal_global];
}

uint64_t __49__MSPSharedTripServer_Migration__migrateIfNeeded__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (_GEOConfigHasValue())
  {
    int BOOL = GEOConfigGetBOOL();
    v1 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = BOOL;
      _os_log_impl(&dword_1B87E5000, v1, OS_LOG_TYPE_INFO, "Will migrate legacy Share ETA user enabled flag: %d", (uint8_t *)v4, 8u);
    }

    GEOConfigSetBOOL();
    _GEOConfigRemoveValue();
  }
  else
  {
    id v2 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v4[0]) = 0;
      _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEBUG, "No legacy Share ETA user enabled flag to migrate", (uint8_t *)v4, 2u);
    }
  }
  +[MSPSharedTripStorageController removeFilesFromBackupsIfNeeded];
  return +[MSPSharedTripBlocklist migrateFromiCloudKVSIfNeeded];
}

@end