@interface ACCCommunicationsCenter
- (ACCCommunicationsCenter)init;
- (ACCCommunicationsCenter)initWithCallStateDelegate:(id)a3 andCommunicationsDelegate:(id)a4 andCallControlsDelegate:(id)a5 andListUpdatesDelegate:(id)a6;
- (ACCCommunicationsCenterCallControlsDelegate)callControlsDelegate;
- (ACCCommunicationsCenterCallStateDelegate)callStateDelegate;
- (ACCCommunicationsCenterCommunicationsDelegate)communicationsDelegate;
- (ACCCommunicationsCenterListUpdatesDelegate)listUpdatesDelegate;
- (ACCCommunicationsXPCServerProtocol)remoteObject;
- (NSMutableDictionary)cachedCommStatus;
- (NSMutableDictionary)callStateCache;
- (NSSet)subscriberList;
- (NSXPCConnection)serverConnection;
- (unint64_t)maxFavoritesListEntries;
- (unint64_t)maxRecentsListEntries;
- (void)acceptCallWithAction:(int)a3 callUUID:(id)a4;
- (void)callStateDidChange:(id)a3;
- (void)commStatusDidChange:(id)a3;
- (void)connectToServer;
- (void)dealloc;
- (void)endAllCalls;
- (void)endCallWithAction:(int)a3 callUUID:(id)a4;
- (void)favoritesListDidChange;
- (void)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5;
- (void)initiateCallToVoicemail;
- (void)initiateRedial;
- (void)mergeCalls;
- (void)recentsListDidChange;
- (void)sendDTMF:(int)a3 forCallWithUUID:(id)a4;
- (void)setCachedCommStatus:(id)a3;
- (void)setCallControlsDelegate:(id)a3;
- (void)setCallStateCache:(id)a3;
- (void)setCallStateDelegate:(id)a3;
- (void)setCommunicationsDelegate:(id)a3;
- (void)setListUpdatesDelegate:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)setSubscriberList:(id)a3;
- (void)swapCalls;
- (void)triggerCallStateUpdatesWithReply:(id)a3;
- (void)triggerCommunicationsUpdateWithReply:(id)a3;
- (void)triggerUpdateForListType:(int)a3 coalesce:(BOOL)a4 withReply:(id)a5;
- (void)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4;
- (void)updateMuteStatus:(BOOL)a3;
- (void)updateSubscriberList:(id)a3 withReply:(id)a4;
@end

@implementation ACCCommunicationsCenter

- (ACCCommunicationsCenter)init
{
  return 0;
}

- (ACCCommunicationsCenter)initWithCallStateDelegate:(id)a3 andCommunicationsDelegate:(id)a4 andCallControlsDelegate:(id)a5 andListUpdatesDelegate:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  init_logging();
  v33.receiver = self;
  v33.super_class = (Class)ACCCommunicationsCenter;
  v14 = [(ACCCommunicationsCenter *)&v33 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_callStateDelegate, v10);
    objc_storeWeak((id *)&v15->_communicationsDelegate, v11);
    objc_storeWeak((id *)&v15->_callControlsDelegate, v12);
    objc_storeWeak((id *)&v15->_listUpdatesDelegate, v13);
    *(int64x2_t *)&v15->_maxRecentsListEntries = vdupq_n_s64(0x32uLL);
    serverConnection = v15->_serverConnection;
    v15->_serverConnection = 0;

    remoteObject = v15->_remoteObject;
    v15->_remoteObject = 0;

    subscriberList = v15->_subscriberList;
    v15->_subscriberList = 0;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    callStateCache = v15->_callStateCache;
    v15->_callStateCache = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    cachedCommStatus = v15->_cachedCommStatus;
    v15->_cachedCommStatus = (NSMutableDictionary *)v21;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v15);
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __126__ACCCommunicationsCenter_initWithCallStateDelegate_andCommunicationsDelegate_andCallControlsDelegate_andListUpdatesDelegate___block_invoke;
    v30 = &unk_264713E48;
    objc_copyWeak(&v31, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.communications.availability-changed", &v27);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v23 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v23 = &_os_log_internal;
      id v24 = &_os_log_internal;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int isServerAvailable = accessoryServer_isServerAvailable();
      *(_DWORD *)buf = 67109120;
      int v35 = isServerAvailable;
      _os_log_impl(&dword_224FF9000, v23, OS_LOG_TYPE_DEFAULT, "Server available: %d", buf, 8u);
    }

    [(ACCCommunicationsCenter *)v15 connectToServer];
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __126__ACCCommunicationsCenter_initWithCallStateDelegate_andCommunicationsDelegate_andCallControlsDelegate_andListUpdatesDelegate___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_224FF9000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_224FF9000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  v3 = [(ACCCommunicationsCenter *)self serverConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ACCCommunicationsCenter;
  [(ACCCommunicationsCenter *)&v4 dealloc];
}

- (void)connectToServer
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_224FF9000, log, OS_LOG_TYPE_DEBUG, "Getting remote object...", v1, 2u);
}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setRemoteObject:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_224FF9000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v8, 2u);
  }
}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke_87(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRemoteObject:0];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 serverConnection];
  [v4 invalidate];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_224FF9000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }
}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke_88(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __42__ACCCommunicationsCenter_connectToServer__block_invoke_88_cold_1();
  }
}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke_90(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_224FF9000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = [WeakRetained serverConnection];
    [v8 invalidate];
  }
}

- (void)callStateDidChange:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACCCommunicationsCenter *)self subscriberList];
  int v6 = [v5 containsObject:@"CallStateUpdates"];
  if (v4 && v6)
  {
    uint64_t v7 = [v4 count];

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        id v8 = &_os_log_internal;
        id v9 = &_os_log_internal;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [v4 objectForKeyedSubscript:@"CallUUID"];
        int v36 = 138412290;
        v37 = v10;
        _os_log_impl(&dword_224FF9000, v8, OS_LOG_TYPE_INFO, "Received call state update for callUUID: %@!", (uint8_t *)&v36, 0xCu);
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        uint64_t v11 = &_os_log_internal;
        id v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ACCCommunicationsCenter callStateDidChange:]0();
      }

      id v13 = [v4 objectForKeyedSubscript:@"CallUUID"];

      if (!v13) {
        goto LABEL_67;
      }
      v14 = [(ACCCommunicationsCenter *)self callStateCache];
      v15 = [v4 objectForKeyedSubscript:@"CallUUID"];
      v16 = [v14 objectForKey:v15];

      if (!gLogObjects) {
        goto LABEL_77;
      }
      if (gNumLogObjects >= 1)
      {
        v17 = *(id *)gLogObjects;
      }
      else
      {
LABEL_77:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        v17 = &_os_log_internal;
        id v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ACCCommunicationsCenter callStateDidChange:].cold.8();
      }

      char v19 = [v4 isEqual:v16];
      if ((v19 & 1) == 0)
      {
        if (gLogObjects) {
          BOOL v20 = gNumLogObjects <= 0;
        }
        else {
          BOOL v20 = 1;
        }
        int v21 = !v20;
        if (v16)
        {
          if (v21)
          {
            v22 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
            }
            v22 = &_os_log_internal;
            id v23 = &_os_log_internal;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            -[ACCCommunicationsCenter callStateDidChange:].cold.6(v4, @"CallUUID");
          }
        }
        else
        {
          if (v21)
          {
            v22 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
            }
            v22 = &_os_log_internal;
            id v24 = &_os_log_internal;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            -[ACCCommunicationsCenter callStateDidChange:].cold.4(v4, @"CallUUID");
          }
        }

        v25 = [(ACCCommunicationsCenter *)self callStateCache];
        v26 = [v4 objectForKeyedSubscript:@"CallUUID"];
        [v25 setObject:v4 forKey:v26];
      }
      uint64_t v27 = [v4 objectForKeyedSubscript:@"Status"];
      int v28 = [v27 isEqual:&unk_26D865AB0];

      if (v28)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v29 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
          }
          v29 = &_os_log_internal;
          id v30 = &_os_log_internal;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[ACCCommunicationsCenter callStateDidChange:](v4, @"CallUUID");
        }

        id v31 = [(ACCCommunicationsCenter *)self callStateCache];
        v32 = [v4 objectForKeyedSubscript:@"CallUUID"];
        [v31 removeObjectForKey:v32];
      }
      if (v19)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          objc_super v33 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
          }
          objc_super v33 = &_os_log_internal;
          id v34 = &_os_log_internal;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = [v4 objectForKeyedSubscript:@"CallUUID"];
          int v36 = 138412290;
          v37 = v35;
          _os_log_impl(&dword_224FF9000, v33, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate call state update for callUUID: %@!", (uint8_t *)&v36, 0xCu);
        }
      }
      else
      {
LABEL_67:
        objc_super v33 = [(ACCCommunicationsCenter *)self remoteObject];
        [v33 callStateDidChange:v4];
      }
    }
  }
  else
  {
  }
}

- (void)commStatusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCCommunicationsCenter *)self subscriberList];
  int v6 = [v5 containsObject:@"CommunicationsUpdates"];
  if (!v4 || !v6)
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v7 = [v4 count];

  if (v7)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v8 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_224FF9000, v8, OS_LOG_TYPE_INFO, "Received comm status update!", v18, 2u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      uint64_t v10 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACCCommunicationsCenter commStatusDidChange:]();
    }

    id v12 = NSDictionary;
    id v13 = [(ACCCommunicationsCenter *)self cachedCommStatus];
    id v5 = [v12 dictionaryOfChangesBetween:v13 and:v4];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v14 = &_os_log_internal;
      id v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ACCCommunicationsCenter commStatusDidChange:]();
    }

    v16 = [(ACCCommunicationsCenter *)self cachedCommStatus];
    [v16 addEntriesFromDictionary:v5];

    if ([v5 count])
    {
      v17 = [(ACCCommunicationsCenter *)self remoteObject];
      [v17 commStatusDidChange:v5];
    }
    goto LABEL_30;
  }
LABEL_31:
}

- (void)recentsListDidChange
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_224FF9000, v1, v2, "recentsList.count: %lu", v3, v4, v5, v6, v7);
}

- (void)favoritesListDidChange
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_224FF9000, v1, v2, "favoritesList.count: %lu", v3, v4, v5, v6, v7);
}

- (void)updateSubscriberList:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  uint8_t v7 = (void (**)(id, uint64_t))a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint64_t v10 = &_os_log_internal;
    id v9 = &_os_log_internal;
  }
  else
  {
    uint64_t v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCCommunicationsCenter updateSubscriberList:withReply:]();
  }

  if (v6)
  {
    id v11 = [MEMORY[0x263EFFA08] setWithArray:v6];
    [(ACCCommunicationsCenter *)self setSubscriberList:v11];
  }
  if (v7) {
    v7[2](v7, 1);
  }
}

- (void)triggerCallStateUpdatesWithReply:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint8_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint8_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224FF9000, v7, OS_LOG_TYPE_INFO, "Triggering call state updates for current calls...", buf, 2u);
  }

  uint64_t v8 = [(ACCCommunicationsCenter *)self callStateDelegate];
  if (v8
    && (id v9 = (void *)v8,
        [(ACCCommunicationsCenter *)self callStateDelegate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    id v12 = [(ACCCommunicationsCenter *)self callStateDelegate];
    id v13 = [v12 currentCallStates];

    if (v13 && [v13 count])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v13;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            char v19 = [(ACCCommunicationsCenter *)self remoteObject];
            [v19 callStateDidChange:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
        }
        while (v15);
      }

      uint64_t v20 = 1;
    }
    else
    {
      v29 = @"Status";
      id v30 = &unk_26D865AB0;
      uint64_t v20 = 1;
      v22 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v23 = [(ACCCommunicationsCenter *)self remoteObject];
      [v23 callStateDidChange:v22];
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v13 = &_os_log_internal;
      id v21 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224FF9000, v13, OS_LOG_TYPE_INFO, "This client doesn't handle call state updates!", buf, 2u);
    }
    uint64_t v20 = 0;
  }

  if (v4) {
    v4[2](v4, v20);
  }
}

- (void)triggerCommunicationsUpdateWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint8_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint8_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224FF9000, v7, OS_LOG_TYPE_INFO, "Triggering communications update...", buf, 2u);
  }

  uint64_t v8 = [(ACCCommunicationsCenter *)self communicationsDelegate];
  if (v8
    && (id v9 = (void *)v8,
        [(ACCCommunicationsCenter *)self communicationsDelegate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    id v12 = [(ACCCommunicationsCenter *)self communicationsDelegate];
    id v13 = [v12 currentCommunicationsStatus];

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v13];
    [v14 setObject:MEMORY[0x263EFFA80] forKey:@"TTYStatus"];
    uint64_t v15 = [v14 copy];

    if (v15)
    {
      uint64_t v16 = [(ACCCommunicationsCenter *)self cachedCommStatus];
      [v16 addEntriesFromDictionary:v15];
    }
    v17 = [(ACCCommunicationsCenter *)self remoteObject];
    [v17 commStatusDidChange:v15];

    uint64_t v18 = 1;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      uint64_t v15 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_224FF9000, v15, OS_LOG_TYPE_INFO, "This client doesn't handle call state updates!", v20, 2u);
    }
    uint64_t v18 = 0;
  }

  if (v4) {
    v4[2](v4, v18);
  }
}

- (void)triggerUpdateForListType:(int)a3 coalesce:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    char v11 = &_os_log_internal;
    id v10 = &_os_log_internal;
  }
  else
  {
    char v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = "NO";
    if (v5) {
      id v12 = "YES";
    }
    int v30 = 67109378;
    int v31 = v6;
    __int16 v32 = 2080;
    objc_super v33 = v12;
    _os_log_impl(&dword_224FF9000, v11, OS_LOG_TYPE_INFO, "Triggering list update... (listType: %{coreacc:ACCCommunications_ListUpdate_Type_t}d, coalesce: %s)", (uint8_t *)&v30, 0x12u);
  }

  if (v6 == 1)
  {
    uint64_t v20 = [(ACCCommunicationsCenter *)self listUpdatesDelegate];
    if (v20)
    {
      id v21 = (void *)v20;
      v22 = [(ACCCommunicationsCenter *)self listUpdatesDelegate];
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        v17 = [(ACCCommunicationsCenter *)self listUpdatesDelegate];
        uint64_t v18 = [v17 currentFavoritesListWithLimit:50];
        unint64_t v19 = [(ACCCommunicationsCenter *)self maxFavoritesListEntries];
        goto LABEL_21;
      }
    }
  }
  else if (!v6)
  {
    uint64_t v13 = [(ACCCommunicationsCenter *)self listUpdatesDelegate];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      uint64_t v15 = [(ACCCommunicationsCenter *)self listUpdatesDelegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        v17 = [(ACCCommunicationsCenter *)self listUpdatesDelegate];
        uint64_t v18 = [v17 currentRecentsListWithCoalescing:v5 limit:50];
        unint64_t v19 = [(ACCCommunicationsCenter *)self maxRecentsListEntries];
LABEL_21:
        long long v24 = [v18 truncatedArray:v19];

        if (!v24)
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            long long v25 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
            }
            long long v25 = &_os_log_internal;
            id v28 = &_os_log_internal;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            int v30 = 67109120;
            int v31 = v6;
            _os_log_impl(&dword_224FF9000, v25, OS_LOG_TYPE_INFO, "List unavailable! (listType: %{coreacc:ACCCommunications_ListUpdate_Type_t}d)", (uint8_t *)&v30, 8u);
          }
        }
        v29 = [(ACCCommunicationsCenter *)self remoteObject];
        [v29 listUpdate:v24 forType:v6 coalesced:v5];

        uint64_t v27 = 1;
        goto LABEL_41;
      }
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    long long v24 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    long long v24 = &_os_log_internal;
    id v26 = &_os_log_internal;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v30 = 67109120;
    int v31 = v6;
    _os_log_impl(&dword_224FF9000, v24, OS_LOG_TYPE_INFO, "This client doesn't handle %{coreacc:ACCCommunications_ListUpdate_Type_t}d list updates!", (uint8_t *)&v30, 8u);
  }
  uint64_t v27 = 0;
LABEL_41:

  if (v8) {
    v8[2](v8, v27);
  }
}

- (void)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v12 = &_os_log_internal;
    id v11 = &_os_log_internal;
  }
  else
  {
    id v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v18 = 138478339;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_224FF9000, v12, OS_LOG_TYPE_INFO, "Initiating call to destinationID: %{private}@, withService: %{coreacc:ACCCommunications_CallService_t}d, addressBookID: %@...", (uint8_t *)&v18, 0x1Cu);
  }

  uint64_t v13 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v17 initiateCallToDestination:v8 withService:v6 addressBookID:v9];
    }
  }
}

- (void)initiateCallToVoicemail
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_224FF9000, v5, OS_LOG_TYPE_INFO, "Initiating call to voicemail...", v11, 2u);
  }

  uint64_t v6 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v6)
  {
    uint8_t v7 = (void *)v6;
    id v8 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      BOOL v10 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v10 initiateCallToVoicemail];
    }
  }
}

- (void)initiateRedial
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_224FF9000, v5, OS_LOG_TYPE_INFO, "Initiating redial...", v11, 2u);
  }

  uint64_t v6 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v6)
  {
    uint8_t v7 = (void *)v6;
    id v8 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      BOOL v10 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v10 initiateRedial];
    }
  }
}

- (void)acceptCallWithAction:(int)a3 callUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    char v9 = &_os_log_internal;
    id v8 = &_os_log_internal;
  }
  else
  {
    char v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_224FF9000, v9, OS_LOG_TYPE_INFO, "Accepting call with acceptAction: %{coreacc:ACCCommunications_CallControls_AcceptAction_t}d, callUUID: %@", (uint8_t *)v15, 0x12u);
  }

  uint64_t v10 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v14 acceptCallWithAction:v4 callUUID:v6];
    }
  }
}

- (void)endCallWithAction:(int)a3 callUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    char v9 = &_os_log_internal;
    id v8 = &_os_log_internal;
  }
  else
  {
    char v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_224FF9000, v9, OS_LOG_TYPE_INFO, "Ending call with endAction: %{coreacc:ACCCommunications_CallControls_EndAction_t}d, callUUID: %@", (uint8_t *)v15, 0x12u);
  }

  uint64_t v10 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v14 endCallWithAction:v4 callUUID:v6];
    }
  }
}

- (void)endAllCalls
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_224FF9000, v5, OS_LOG_TYPE_INFO, "Ending all calls...", v11, 2u);
  }

  uint64_t v6 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    id v8 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v10 endAllCalls];
    }
  }
}

- (void)swapCalls
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_224FF9000, v5, OS_LOG_TYPE_INFO, "Swapping calls...", v11, 2u);
  }

  uint64_t v6 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    id v8 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v10 swapCalls];
    }
  }
}

- (void)mergeCalls
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_224FF9000, v5, OS_LOG_TYPE_INFO, "Merging calls...", v11, 2u);
  }

  uint64_t v6 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    id v8 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v10 mergeCalls];
    }
  }
}

- (void)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    char v9 = &_os_log_internal;
    id v8 = &_os_log_internal;
  }
  else
  {
    char v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = "NO";
    if (v4) {
      uint64_t v10 = "YES";
    }
    int v16 = 136315394;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_224FF9000, v9, OS_LOG_TYPE_INFO, "Updating hold status to: %s for callUUID: %@...", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v11 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v11)
  {
    id v12 = (void *)v11;
    char v13 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      uint64_t v15 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v15 updateHoldStatus:v4 forCallWithUUID:v6];
    }
  }
}

- (void)updateMuteStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = "NO";
    if (v3) {
      id v8 = "YES";
    }
    int v14 = 136315138;
    uint64_t v15 = v8;
    _os_log_impl(&dword_224FF9000, v7, OS_LOG_TYPE_INFO, "Updating mute status to: %s...", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v9 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      char v13 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v13 updateMuteStatus:v3];
    }
  }
}

- (void)sendDTMF:(int)a3 forCallWithUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint64_t v9 = &_os_log_internal;
    id v8 = &_os_log_internal;
  }
  else
  {
    uint64_t v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_224FF9000, v9, OS_LOG_TYPE_INFO, "Sending DTMF tone: %{coreacc:ACCCommunications_CallControls_DTMFTone_t}d for callUUID: %@", (uint8_t *)v15, 0x12u);
  }

  uint64_t v10 = [(ACCCommunicationsCenter *)self callControlsDelegate];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    char v12 = [(ACCCommunicationsCenter *)self callControlsDelegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      int v14 = [(ACCCommunicationsCenter *)self callControlsDelegate];
      [v14 sendDTMF:v4 forCallWithUUID:v6];
    }
  }
}

- (ACCCommunicationsCenterCallStateDelegate)callStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callStateDelegate);

  return (ACCCommunicationsCenterCallStateDelegate *)WeakRetained;
}

- (void)setCallStateDelegate:(id)a3
{
}

- (ACCCommunicationsCenterCommunicationsDelegate)communicationsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_communicationsDelegate);

  return (ACCCommunicationsCenterCommunicationsDelegate *)WeakRetained;
}

- (void)setCommunicationsDelegate:(id)a3
{
}

- (ACCCommunicationsCenterCallControlsDelegate)callControlsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callControlsDelegate);

  return (ACCCommunicationsCenterCallControlsDelegate *)WeakRetained;
}

- (void)setCallControlsDelegate:(id)a3
{
}

- (ACCCommunicationsCenterListUpdatesDelegate)listUpdatesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listUpdatesDelegate);

  return (ACCCommunicationsCenterListUpdatesDelegate *)WeakRetained;
}

- (void)setListUpdatesDelegate:(id)a3
{
}

- (unint64_t)maxRecentsListEntries
{
  return self->_maxRecentsListEntries;
}

- (unint64_t)maxFavoritesListEntries
{
  return self->_maxFavoritesListEntries;
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (ACCCommunicationsXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSSet)subscriberList
{
  return self->_subscriberList;
}

- (void)setSubscriberList:(id)a3
{
}

- (NSMutableDictionary)callStateCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCallStateCache:(id)a3
{
}

- (NSMutableDictionary)cachedCommStatus
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCachedCommStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCommStatus, 0);
  objc_storeStrong((id *)&self->_callStateCache, 0);
  objc_storeStrong((id *)&self->_subscriberList, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_listUpdatesDelegate);
  objc_destroyWeak((id *)&self->_callControlsDelegate);
  objc_destroyWeak((id *)&self->_communicationsDelegate);

  objc_destroyWeak((id *)&self->_callStateDelegate);
}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke_88_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_224FF9000, v0, OS_LOG_TYPE_ERROR, "XPC connection error: %@", v1, 0xCu);
}

- (void)callStateDidChange:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_224FF9000, v3, v4, "Removing call state from cache (callUUID: %@)...", v5, v6, v7, v8, v9);
}

- (void)callStateDidChange:(void *)a1 .cold.4(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_224FF9000, v3, v4, "Adding call state to cache (callUUID: %@)...", v5, v6, v7, v8, v9);
}

- (void)callStateDidChange:(void *)a1 .cold.6(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_224FF9000, v3, v4, "Updating call state to cache (callUUID: %@)...", v5, v6, v7, v8, v9);
}

- (void)callStateDidChange:.cold.8()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224FF9000, v0, v1, "cachedCallState: %@", v2);
}

- (void)callStateDidChange:.cold.10()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224FF9000, v0, v1, "callState: %@", v2);
}

- (void)commStatusDidChange:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224FF9000, v0, v1, "filteredCommStatus: %@", v2);
}

- (void)commStatusDidChange:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224FF9000, v0, v1, "commStatus: %@", v2);
}

- (void)updateSubscriberList:withReply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224FF9000, v0, v1, "Received subscriberList update: %@", v2);
}

@end