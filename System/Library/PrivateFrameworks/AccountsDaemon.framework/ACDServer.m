@interface ACDServer
- (ACDAccessPluginManager)accessPluginManager;
- (ACDAccountNotifier)accountNotifier;
- (ACDAuthenticationDialogManager)authenticationDialogManager;
- (ACDAuthenticationPluginManager)authenticationPluginManager;
- (ACDClientProviderProtocol)clientProvider;
- (ACDDatabaseBackupActivity)databaseBackupActivity;
- (ACDDatabaseProtocol)database;
- (ACDDataclassOwnersManager)dataclassOwnersManager;
- (ACDServer)init;
- (ACDServer)initWithAccountStoreListener:(id)a3 oauthSignerListener:(id)a4 authenticationDialogListener:(id)a5;
- (ACRemoteDeviceProxy)remoteDeviceProxy;
- (BOOL)_isHomePod;
- (BOOL)_shouldSendDidSaveNotificationForAccount:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)accountStoreListener;
- (NSXPCListener)authenticationDialogListener;
- (NSXPCListener)oauthSignerListener;
- (id)_keyForConnection:(id)a3;
- (id)_newDaemonAccountStoreFilterForClient:(id)a3;
- (id)_newOAuthSignerForClient:(id)a3;
- (id)clientForConnection:(id)a3;
- (id)createClientForConnection:(id)a3;
- (id)createDatabaseConnection;
- (void)_beginObservingIDSProxyNotifications;
- (void)_beginObservingLanguageChangeNotfication;
- (void)_endObservingLanguageChangeNotification;
- (void)_handleLanguageChangedDarwinNotification;
- (void)_notify_accountStore:(id)a3 didSaveAccount:(id)a4 changeType:(int)a5;
- (void)accountStore:(id)a3 didSaveAccount:(id)a4 changeType:(int)a5;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)credentialsDidChangeForAccount:(id)a3;
- (void)dealloc;
- (void)setAccessPluginManager:(id)a3;
- (void)setAccountNotifier:(id)a3;
- (void)setAuthenticationDialogManager:(id)a3;
- (void)setAuthenticationPluginManager:(id)a3;
- (void)setClientProvider:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDatabaseBackupActivity:(id)a3;
- (void)setDataclassOwnersManager:(id)a3;
- (void)setRemoteDeviceProxy:(id)a3;
- (void)shutdown;
- (void)start;
@end

@implementation ACDServer

- (id)_newDaemonAccountStoreFilterForClient:(id)a3
{
  id v4 = a3;
  v5 = [(ACDServer *)self createDatabaseConnection];
  v6 = [[ACDAccountStore alloc] initWithClient:v4 databaseConnection:v5];

  v7 = [(ACDServer *)self accessPluginManager];
  [(ACDAccountStore *)v6 setAccessPluginManager:v7];

  v8 = [(ACDServer *)self accountNotifier];
  [(ACDAccountStore *)v6 setAccountNotifier:v8];

  v9 = [(ACDServer *)self authenticationDialogManager];
  [(ACDAccountStore *)v6 setAuthenticationDialogManager:v9];

  v10 = [(ACDServer *)self authenticationPluginManager];
  [(ACDAccountStore *)v6 setAuthenticationPluginManager:v10];

  v11 = [(ACDServer *)self databaseBackupActivity];
  [(ACDAccountStore *)v6 setDatabaseBackupActivity:v11];

  v12 = [(ACDServer *)self dataclassOwnersManager];
  [(ACDAccountStore *)v6 setDataclassOwnersManager:v12];

  [(ACDAccountStore *)v6 setDelegate:self];
  v13 = [(ACDServer *)self remoteDeviceProxy];
  [(ACDAccountStore *)v6 setRemoteDeviceProxy:v13];

  v14 = [[ACDAccountStoreFilter alloc] initWithBackingAccountStore:v6];
  return v14;
}

id __40__ACDServer_authenticationPluginManager__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 88);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDAuthenticationPluginManager);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 88);
  }

  return v2;
}

id __40__ACDServer_authenticationDialogManager__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 112);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDAuthenticationDialogManager);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 112);
  }

  return v2;
}

id __35__ACDServer_dataclassOwnersManager__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDDataclassOwnersManager);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 104);
  }

  return v2;
}

id __32__ACDServer_accessPluginManager__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDAccessPluginManager);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 96);
  }

  return v2;
}

id __28__ACDServer_accountNotifier__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDAccountNotifier);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 120);
  }

  return v2;
}

- (ACRemoteDeviceProxy)remoteDeviceProxy
{
  return self->_remoteDeviceProxy;
}

- (ACDDataclassOwnersManager)dataclassOwnersManager
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__ACDServer_dataclassOwnersManager__block_invoke;
  v4[3] = &unk_264321930;
  v4[4] = self;
  v2 = ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v4);

  return (ACDDataclassOwnersManager *)v2;
}

- (ACDDatabaseBackupActivity)databaseBackupActivity
{
  return self->_databaseBackupActivity;
}

- (id)createDatabaseConnection
{
  uint64_t v4 = [(ACDServer *)self database];

  if (!v4)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ACDServer.m" lineNumber:259 description:@"Attempt to create ACDDatabase without a configured database!"];
  }
  v5 = [(ACDServer *)self database];
  v6 = [v5 createConnection];

  return v6;
}

- (ACDDatabaseProtocol)database
{
  return self->_database;
}

- (ACDAuthenticationPluginManager)authenticationPluginManager
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__ACDServer_authenticationPluginManager__block_invoke;
  v4[3] = &unk_264321908;
  v4[4] = self;
  v2 = ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v4);

  return (ACDAuthenticationPluginManager *)v2;
}

- (ACDAuthenticationDialogManager)authenticationDialogManager
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__ACDServer_authenticationDialogManager__block_invoke;
  v4[3] = &unk_2643218E0;
  v4[4] = self;
  v2 = ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v4);

  return (ACDAuthenticationDialogManager *)v2;
}

- (ACDAccountNotifier)accountNotifier
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__ACDServer_accountNotifier__block_invoke;
  v4[3] = &unk_2643218B8;
  v4[4] = self;
  v2 = ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v4);

  return (ACDAccountNotifier *)v2;
}

- (ACDAccessPluginManager)accessPluginManager
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__ACDServer_accessPluginManager__block_invoke;
  v4[3] = &unk_264321890;
  v4[4] = self;
  v2 = ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v4);

  return (ACDAccessPluginManager *)v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  v46 = (NSXPCListener *)a3;
  id val = a4;
  -[ACDServer createClientForConnection:](self, "createClientForConnection:");
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  v6 = _ACDConnectionLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACDServer listener:shouldAcceptNewConnection:].cold.5();
  }

  v47 = [(ACDServer *)self _keyForConnection:val];
  v7 = self;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7->_clientsByConnection setObject:v49 forKey:v47];
  objc_sync_exit(v7);
  v48 = v7;

  objc_initWeak(&location, val);
  objc_initWeak(&from, v49);
  v8 = v7;
  v9 = v46;
  BOOL v45 = v7->_accountStoreListener == v46;
  if (v7->_accountStoreListener == v46)
  {
    if (listener_shouldAcceptNewConnection__onceToken != -1) {
      dispatch_once(&listener_shouldAcceptNewConnection__onceToken, &__block_literal_global_6);
    }
    v10 = _ACLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v86 = val;
      __int16 v87 = 2112;
      id v88 = v49;
      _os_log_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEFAULT, "\"%@ (%@) received\"", buf, 0x16u);
    }

    id v44 = [(ACDServer *)v7 _newDaemonAccountStoreFilterForClient:v49];
    [v49 setFilter:v44];
    [val setRemoteObjectInterface:listener_shouldAcceptNewConnection__remoteObjectInterface];
    v11 = [MEMORY[0x263EFB278] XPCInterface];
    [val setExportedInterface:v11];

    [val setExportedObject:v44];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_94;
    v78[3] = &unk_264321958;
    objc_copyWeak(&v80, &from);
    objc_copyWeak(&v81, &location);
    v78[4] = v7;
    id v12 = v47;
    id v79 = v12;
    [val setInvalidationHandler:v78];
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_95;
    v74[3] = &unk_264321958;
    objc_copyWeak(&v76, &from);
    objc_copyWeak(&v77, &location);
    v74[4] = v7;
    id v75 = v12;
    [val setInterruptionHandler:v74];
    v13 = v7;
    objc_sync_enter(v13);
    [(NSMutableArray *)v13->_accountStoreClients addObject:v49];
    if ([(NSMutableArray *)v13->_accountStoreClients count] > (unint64_t)v13->_clientCountMaximum)
    {
      p_clientCountMaximum = &v13->_clientCountMaximum;
      v43 = v13;
      v14 = objc_opt_new();
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v15 = v13->_accountStoreClients;
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v70 objects:v84 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v71 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            v20 = [v19 name];
            v21 = [v14 objectForKeyedSubscript:v20];
            unsigned int v22 = [v21 unsignedIntValue];

            v23 = [NSNumber numberWithUnsignedInteger:v22 + 1];
            v24 = [v19 name];
            [v14 setObject:v23 forKeyedSubscript:v24];
          }
          uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v70 objects:v84 count:16];
        }
        while (v16);
      }

      if (_os_feature_enabled_impl())
      {
        v25 = _ACLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[ACDServer listener:shouldAcceptNewConnection:]();
        }
      }
      else
      {
        v25 = _ACLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[ACDServer listener:shouldAcceptNewConnection:].cold.4();
        }
      }

      LODWORD(v26) = *p_clientCountMaximum;
      unsigned int *p_clientCountMaximum = ((double)v26 * 1.2);

      v13 = v43;
    }
    v27 = v13->_performMigrationQueue;
    objc_sync_exit(v13);

    if (v27)
    {
      if ([v49 hasEntitlement:*MEMORY[0x263EFB2E8]])
      {
        v28 = _ACLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v49;
          _os_log_impl(&dword_2183AD000, v28, OS_LOG_TYPE_DEFAULT, "\"Setting migrationInProgress to YES for the ACDAccountStore of %@\"", buf, 0xCu);
        }

        v29 = [v44 backingAccountStore];
        [v29 setMigrationInProgress:1];

        v30 = _ACLogSystem();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v49;
          _os_log_impl(&dword_2183AD000, v30, OS_LOG_TYPE_DEFAULT, "\"Queuing setMigrationInProgress to NO for the ACDAccountStore of %@\"", buf, 0xCu);
        }

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_99;
        block[3] = &unk_264321980;
        objc_copyWeak(&v68, &location);
        objc_copyWeak(&v69, &from);
        dispatch_async(v27, block);
        objc_destroyWeak(&v69);
        objc_destroyWeak(&v68);
      }
      else
      {
        [val setDelegate:v13];
      }
    }
    [val resume];

    objc_destroyWeak(&v77);
    objc_destroyWeak(&v76);

    objc_destroyWeak(&v81);
    objc_destroyWeak(&v80);

    v9 = v46;
    v8 = v48;
  }
  if (v8->_oauthSignerListener == v9)
  {
    v31 = _ACLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[ACDServer listener:shouldAcceptNewConnection:]();
    }

    id v32 = [(ACDServer *)v48 _newOAuthSignerForClient:v49];
    v33 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9A1968];
    [val setExportedInterface:v33];

    [val setExportedObject:v32];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_111;
    v63[3] = &unk_264321958;
    objc_copyWeak(&v65, &from);
    objc_copyWeak(&v66, &location);
    v63[4] = v48;
    id v34 = v47;
    id v64 = v34;
    [val setInvalidationHandler:v63];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_112;
    v59[3] = &unk_264321958;
    objc_copyWeak(&v61, &from);
    objc_copyWeak(&v62, &location);
    v59[4] = v48;
    id v60 = v34;
    [val setInterruptionHandler:v59];
    v35 = v48;
    objc_sync_enter(v35);
    [v35[3] addObject:v49];
    objc_sync_exit(v35);

    [val resume];
    objc_destroyWeak(&v62);
    objc_destroyWeak(&v61);

    objc_destroyWeak(&v66);
    objc_destroyWeak(&v65);

    BOOL v45 = 1;
    v9 = v46;
    v8 = v48;
  }
  if (v8->_authenticationDialogListener == v9
    && [v49 hasEntitlement:*MEMORY[0x263EFB2D8]])
  {
    v36 = _ACLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[ACDServer listener:shouldAcceptNewConnection:]();
    }

    v37 = [(ACDServer *)v48 authenticationDialogManager];
    [val setExportedObject:v37];

    v38 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9A3D20];
    [val setExportedInterface:v38];

    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_120;
    v55[3] = &unk_264321958;
    objc_copyWeak(&v57, &from);
    objc_copyWeak(&v58, &location);
    v55[4] = v48;
    id v39 = v47;
    id v56 = v39;
    [val setInvalidationHandler:v55];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_121;
    v51[3] = &unk_264321958;
    objc_copyWeak(&v53, &from);
    objc_copyWeak(&v54, &location);
    v51[4] = v48;
    id v52 = v39;
    [val setInterruptionHandler:v51];
    v40 = v48;
    objc_sync_enter(v40);
    [v40[4] addObject:v49];
    objc_sync_exit(v40);

    [val resume];
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v53);

    objc_destroyWeak(&v58);
    objc_destroyWeak(&v57);
    BOOL v45 = 1;
  }
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v45;
}

- (id)_keyForConnection:(id)a3
{
  return (id)[MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
}

- (id)createClientForConnection:(id)a3
{
  id v5 = a3;
  v6 = [(ACDServer *)self clientProvider];

  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"ACDServer.m" lineNumber:254 description:@"Attempt to create ACDClient without a configured clientProvider!"];
  }
  v7 = [(ACDServer *)self clientProvider];
  v8 = [v7 createClientForConnection:v5];

  return v8;
}

- (ACDClientProviderProtocol)clientProvider
{
  return self->_clientProvider;
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_94_cold_1();
  }

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:WeakRetained];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(v4);
}

- (ACDServer)init
{
  v3 = [MEMORY[0x263F08D88] anonymousListener];
  id v4 = [MEMORY[0x263F08D88] anonymousListener];
  id v5 = [MEMORY[0x263F08D88] anonymousListener];
  v6 = [(ACDServer *)self initWithAccountStoreListener:v3 oauthSignerListener:v4 authenticationDialogListener:v5];

  return v6;
}

- (ACDServer)initWithAccountStoreListener:(id)a3 oauthSignerListener:(id)a4 authenticationDialogListener:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_14:
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"ACDServer.m", 86, @"Invalid parameter not satisfying: %@", @"oauthSignerListener" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  id v34 = [MEMORY[0x263F08690] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"ACDServer.m", 85, @"Invalid parameter not satisfying: %@", @"accountStoreListener" object file lineNumber description];

  if (!v11) {
    goto LABEL_14;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_15:
  v36 = [MEMORY[0x263F08690] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"ACDServer.m", 87, @"Invalid parameter not satisfying: %@", @"authenticationDialogListener" object file lineNumber description];

LABEL_4:
  v40.receiver = self;
  v40.super_class = (Class)ACDServer;
  v13 = [(ACDServer *)&v40 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accountStoreListener, a3);
    objc_storeStrong((id *)&v14->_oauthSignerListener, a4);
    objc_storeStrong((id *)&v14->_authenticationDialogListener, a5);
    v15 = objc_alloc_init(ACDClientProvider);
    clientProvider = v14->_clientProvider;
    v14->_clientProvider = (ACDClientProviderProtocol *)v15;

    v14->_propertyLock._os_unfair_lock_opaque = 0;
    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    accountStoreClients = v14->_accountStoreClients;
    v14->_accountStoreClients = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    oauthSignerClients = v14->_oauthSignerClients;
    v14->_oauthSignerClients = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    authenticationDialogManagerClients = v14->_authenticationDialogManagerClients;
    v14->_authenticationDialogManagerClients = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clientsByConnection = v14->_clientsByConnection;
    v14->_clientsByConnection = v23;

    v14->_clientCountMaximum = 50;
    performMigrationQueue = v14->_performMigrationQueue;
    v14->_performMigrationQueue = 0;

    int v26 = [MEMORY[0x263EFB208] isMigrationFinished];
    v27 = _ACLogSystem();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2183AD000, v27, OS_LOG_TYPE_DEFAULT, "\"Account migration has already occurred. No need to block non-migration connections.\"", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      if (v28)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2183AD000, v27, OS_LOG_TYPE_DEFAULT, "\"Account migration has not occurred.\"", (uint8_t *)buf, 2u);
      }

      v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v30 = dispatch_queue_create("com.apple.accounts.performMigrationQueue", v29);
      v31 = v14->_performMigrationQueue;
      v14->_performMigrationQueue = (OS_dispatch_queue *)v30;

      objc_initWeak(buf, v14);
      id v32 = v14->_performMigrationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __91__ACDServer_initWithAccountStoreListener_oauthSignerListener_authenticationDialogListener___block_invoke;
      block[3] = &unk_264321868;
      objc_copyWeak(&v38, buf);
      dispatch_async(v32, block);
      objc_destroyWeak(&v38);
      objc_destroyWeak(buf);
    }
  }

  return v14;
}

void __91__ACDServer_initWithAccountStoreListener_oauthSignerListener_authenticationDialogListener___block_invoke(uint64_t a1)
{
  v2 = _ACLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v2, OS_LOG_TYPE_DEFAULT, "\"calling DMPerformMigrationReturningAfterPlugin\"", buf, 2u);
  }

  DMPerformMigrationReturningAfterPlugin();
  v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"DMPerformMigrationReturningAfterPlugin completed\"", v8, 2u);
  }

  [MEMORY[0x263EFB208] writeMigrationVersionPref];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_sync_enter(v6);
    v7 = (void *)v6[7];
    v6[7] = 0;

    objc_sync_exit(v6);
  }
}

- (void)dealloc
{
  [(NSXPCListener *)self->_accountStoreListener invalidate];
  [(NSXPCListener *)self->_authenticationDialogListener invalidate];
  [(NSXPCListener *)self->_oauthSignerListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ACDServer;
  [(ACDServer *)&v3 dealloc];
}

- (void)start
{
  [(ACDServer *)self _beginObservingIDSProxyNotifications];
  [(ACDServer *)self _beginObservingLanguageChangeNotfication];
  +[ACDXPCEventPublisherWrapper registerSubscriberListener];
  [MEMORY[0x263F08D88] enableTransactions];
  [(NSXPCListener *)self->_accountStoreListener setDelegate:self];
  [(NSXPCListener *)self->_accountStoreListener resume];
  [(NSXPCListener *)self->_authenticationDialogListener setDelegate:self];
  [(NSXPCListener *)self->_authenticationDialogListener resume];
  [(NSXPCListener *)self->_oauthSignerListener setDelegate:self];
  [(NSXPCListener *)self->_oauthSignerListener resume];
  +[ACDKeychainManager setServer:self];
  id v3 = +[ACDKeychainCleanupActivity sharedActivity];
  [v3 checkInIfNecessary];
}

- (void)shutdown
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(ACDServer *)self _endObservingLanguageChangeNotification];
  [(NSXPCListener *)self->_accountStoreListener setDelegate:0];
  [(NSXPCListener *)self->_accountStoreListener suspend];
  [(NSXPCListener *)self->_authenticationDialogListener setDelegate:0];
  [(NSXPCListener *)self->_authenticationDialogListener suspend];
  [(NSXPCListener *)self->_oauthSignerListener setDelegate:0];
  [(NSXPCListener *)self->_oauthSignerListener suspend];
  id v3 = self;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableArray *)v3->_accountStoreClients copy];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [*(id *)(*((void *)&v30 + 1) + 8 * v8) connection];
        [v9 invalidate];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[(NSMutableArray *)v3->_oauthSignerClients copy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = [*(id *)(*((void *)&v26 + 1) + 8 * v14) connection];
        [v15 invalidate];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }

  uint64_t v16 = (void *)[(NSMutableArray *)v3->_authenticationDialogManagerClients copy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v20), "connection", (void)v22);
        [v21 invalidate];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }

  [(NSMutableArray *)v3->_accountStoreClients removeAllObjects];
  [(NSMutableArray *)v3->_oauthSignerClients removeAllObjects];
  [(NSMutableArray *)v3->_authenticationDialogManagerClients removeAllObjects];
  [(NSMutableDictionary *)v3->_clientsByConnection removeAllObjects];

  objc_sync_exit(v3);
}

- (id)clientForConnection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  clientsByConnection = v5->_clientsByConnection;
  uint64_t v7 = [(ACDServer *)v5 _keyForConnection:v4];
  uint64_t v8 = [(NSMutableDictionary *)clientsByConnection objectForKeyedSubscript:v7];

  objc_sync_exit(v5);

  return v8;
}

- (id)_newOAuthSignerForClient:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDServer *)self createDatabaseConnection];
  uint64_t v6 = [[ACDOAuthSigner alloc] initWithClient:v4 databaseConnection:v5];

  return v6;
}

uint64_t __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke()
{
  listener_shouldAcceptNewConnection__remoteObjectInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9A8EC0];

  return MEMORY[0x270F9A758]();
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_95(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_95_cold_1();
  }

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:WeakRetained];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(v4);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_99(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    id v5 = _ACLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"Setting migrationInProgress to NO for the ACDAccountStore of %@\"", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = [WeakRetained exportedObject];
    uint64_t v7 = [v6 backingAccountStore];
    [v7 setMigrationInProgress:0];
  }
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_111(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_111_cold_1();
  }

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:WeakRetained];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(v4);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_112(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_112_cold_1();
  }

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:WeakRetained];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(v4);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_120(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_120_cold_1();
  }

  id v4 = [*(id *)(a1 + 32) authenticationDialogManager];
  [v4 authenticationDialogCrashed];

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(v5);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_121(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_121_cold_1();
  }

  id v4 = [*(id *)(a1 + 32) authenticationDialogManager];
  [v4 authenticationDialogCrashed];

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(v5);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a5)
  {
    [v9 invoke];
  }
  else
  {
    id v11 = self;
    objc_sync_enter(v11);
    uint64_t v12 = v11->_performMigrationQueue;
    objc_sync_exit(v11);

    if (v12)
    {
      uint64_t v13 = [(ACDServer *)v11 clientForConnection:v8];
      uint64_t v14 = _ACLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v13;
        _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"Blocking invocations for %@\"", buf, 0xCu);
      }

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __49__ACDServer_connection_handleInvocation_isReply___block_invoke;
      v16[3] = &unk_264320D40;
      id v17 = v13;
      id v18 = v10;
      id v15 = v13;
      dispatch_sync(v12, v16);
    }
    else
    {
      [v8 setDelegate:0];
      [v10 invoke];
    }
  }
}

uint64_t __49__ACDServer_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _ACLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2183AD000, v2, OS_LOG_TYPE_DEFAULT, "\"Resuming invocations for %@\"", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) invoke];
}

- (void)_beginObservingLanguageChangeNotfication
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__HandleLanguageChangeNotification, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_endObservingLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.language.changed", 0);
}

- (BOOL)_isHomePod
{
  if (_isHomePod_onceToken != -1) {
    dispatch_once(&_isHomePod_onceToken, &__block_literal_global_126);
  }
  return _isHomePod_result;
}

uint64_t __23__ACDServer__isHomePod__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _isHomePod_uint64_t result = result == 7;
  return result;
}

- (void)_handleLanguageChangedDarwinNotification
{
}

- (void)accountStore:(id)a3 didSaveAccount:(id)a4 changeType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = a3;
  id v8 = a4;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263EFB060], 0, 0, 1u);
  if (v8
    && (v5 != 2
     || [(ACDServer *)self _shouldSendDidSaveNotificationForAccount:v8]))
  {
    [(ACDServer *)self _notify_accountStore:v10 didSaveAccount:v8 changeType:v5];
  }
}

- (void)_notify_accountStore:(id)a3 didSaveAccount:(id)a4 changeType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F087C8] notificationCenterForType:*MEMORY[0x263F08310]];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = [v6 identifier];
  if (v9)
  {
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263EFAD50]];
    v16[0] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263EFB2A0]];
  }
  id v11 = [v6 accountType];
  uint64_t v12 = [v11 identifier];

  if (v12) {
    [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263EFAF38]];
  }
  uint64_t v13 = *MEMORY[0x263EFB060];
  uint64_t v14 = (void *)[v8 copy];
  [v7 postNotificationName:v13 object:0 userInfo:v14];

  id v15 = (void *)[v6 copy];
  [v15 _clearCachedCredentials];
  [v15 _clearCachedChildAccounts];
  +[ACDXPCEventPublisherWrapper notifySubscribersOfAccountChange:v15 type:v5];
}

- (BOOL)_shouldSendDidSaveNotificationForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountType];
  uint64_t v5 = [v4 identifier];
  if ([v5 isEqualToString:*MEMORY[0x263EFB000]])
  {
  }
  else
  {
    id v6 = [v3 accountType];
    uint64_t v7 = [v6 identifier];
    int v8 = [v7 isEqualToString:*MEMORY[0x263EFB008]];

    if (!v8)
    {
LABEL_14:
      BOOL v15 = 1;
      goto LABEL_15;
    }
  }
  id v9 = [v3 dirtyProperties];
  if ([v9 count] != 1)
  {
LABEL_13:

    goto LABEL_14;
  }
  id v10 = [v3 dirtyDataclassProperties];
  if ([v10 count])
  {
LABEL_12:

    goto LABEL_13;
  }
  id v11 = [v3 dirtyAccountProperties];
  if ([v11 count] != 1)
  {

    goto LABEL_12;
  }
  uint64_t v12 = [v3 dirtyAccountProperties];
  int v13 = [v12 containsObject:@"cookies"];

  if (!v13) {
    goto LABEL_14;
  }
  uint64_t v14 = _ACLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "@\"Will skip notifications for iTunes account: change only modified cookies\"", v17, 2u);
  }

  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (void)credentialsDidChangeForAccount:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v4 = [v24 identifier];
  uint64_t v5 = [v24 accountType];
  id v6 = [v5 identifier];

  uint64_t v7 = self;
  objc_sync_enter(v7);
  obj = v7;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7->_accountStoreClients;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "pid", obj);
        char v15 = [v8 containsObject:v14];

        if ((v15 & 1) == 0)
        {
          uint64_t v16 = [v13 pid];

          if (v16)
          {
            id v17 = [v13 pid];
            [v8 addObject:v17];
          }
          id v18 = [v13 filter];
          int v19 = [v18 isClientEntitledToAccessAccountTypeWithIdentifier:v6];

          uint64_t v20 = [v13 connection];
          uint64_t v21 = [v20 remoteObjectProxy];

          if (v19) {
            [v21 accountCredentialsDidChangeForAccountWithIdentifier:v4];
          }
        }
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  objc_sync_exit(obj);
  long long v22 = _ACLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[ACDServer credentialsDidChangeForAccount:]();
  }
}

- (void)_beginObservingIDSProxyNotifications
{
  if (getenv("__ACSYNCBUBBLE"))
  {
    id v3 = _ACLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"accountsd is running in the sync bubble, not initalizing ACRemoteDeviceProxy\"", v4, 2u);
    }
  }
  else
  {
    self->_remoteDeviceProxy = objc_alloc_init(ACRemoteDeviceProxy);
    MEMORY[0x270F9A758]();
  }
}

- (NSXPCListener)accountStoreListener
{
  return self->_accountStoreListener;
}

- (NSXPCListener)oauthSignerListener
{
  return self->_oauthSignerListener;
}

- (NSXPCListener)authenticationDialogListener
{
  return self->_authenticationDialogListener;
}

- (void)setAuthenticationPluginManager:(id)a3
{
}

- (void)setAccessPluginManager:(id)a3
{
}

- (void)setDataclassOwnersManager:(id)a3
{
}

- (void)setAuthenticationDialogManager:(id)a3
{
}

- (void)setAccountNotifier:(id)a3
{
}

- (void)setRemoteDeviceProxy:(id)a3
{
}

- (void)setClientProvider:(id)a3
{
}

- (void)setDatabase:(id)a3
{
}

- (void)setDatabaseBackupActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseBackupActivity, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_clientProvider, 0);
  objc_storeStrong((id *)&self->_remoteDeviceProxy, 0);
  objc_storeStrong((id *)&self->_accountNotifier, 0);
  objc_storeStrong((id *)&self->_authenticationDialogManager, 0);
  objc_storeStrong((id *)&self->_dataclassOwnersManager, 0);
  objc_storeStrong((id *)&self->_accessPluginManager, 0);
  objc_storeStrong((id *)&self->_authenticationPluginManager, 0);
  objc_storeStrong((id *)&self->_authenticationDialogListener, 0);
  objc_storeStrong((id *)&self->_oauthSignerListener, 0);
  objc_storeStrong((id *)&self->_accountStoreListener, 0);
  objc_storeStrong((id *)&self->_performMigrationQueue, 0);
  objc_storeStrong((id *)&self->_clientsByConnection, 0);
  objc_storeStrong((id *)&self->_authenticationDialogManagerClients, 0);
  objc_storeStrong((id *)&self->_oauthSignerClients, 0);

  objc_storeStrong((id *)&self->_accountStoreClients, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"New connection to ACDAuthenticationDialogManager initiated by %@\"", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"New connection to ACDOAuthSigner initiated by %@\"", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6_0();
  _os_log_fault_impl(&dword_2183AD000, v0, OS_LOG_TYPE_FAULT, "Total client count exceeded %d: %@", v1, 0x12u);
}

- (void)listener:shouldAcceptNewConnection:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "\"Total client count exceeded %d: %@\"", v1, 0x12u);
}

- (void)listener:shouldAcceptNewConnection:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Connection from %{public}@", v2, v3, v4, v5, v6);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_94_cold_1()
{
  OUTLINED_FUNCTION_23();
  id v1 = OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"Connection %@ for %@ was closed.\"", v4, v5, v6, v7, v8);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_95_cold_1()
{
  OUTLINED_FUNCTION_23();
  id v1 = OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"Connection %@ for %@ was interrupted.\"", v4, v5, v6, v7, v8);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_111_cold_1()
{
  OUTLINED_FUNCTION_23();
  id v1 = OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"Connection %@ for %@ was closed.\"", v4, v5, v6, v7, v8);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_112_cold_1()
{
  OUTLINED_FUNCTION_23();
  id v1 = OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"Connection %@ for %@ was interrupted.\"", v4, v5, v6, v7, v8);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_120_cold_1()
{
  OUTLINED_FUNCTION_23();
  id v1 = OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"Connection %@ for %@ was closed.\"", v4, v5, v6, v7, v8);
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_121_cold_1()
{
  OUTLINED_FUNCTION_23();
  id v1 = OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"Connection %@ for %@ was interrupted.\"", v4, v5, v6, v7, v8);
}

- (void)credentialsDidChangeForAccount:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Notified connected clients of credential changes for account %@.\"", v2, v3, v4, v5, v6);
}

@end