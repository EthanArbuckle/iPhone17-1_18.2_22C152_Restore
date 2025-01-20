@interface PHNetworkFetcher
- (NSArray)networks;
- (NSMutableArray)mutableNetworks;
- (PHNetworkFetcher)init;
- (__CTServerConnection)server;
- (id)networkNotificationHandler;
- (unint64_t)state;
- (void)dealloc;
- (void)fetchNetworkList;
- (void)selectNetwork:(id)a3;
- (void)setMutableNetworks:(id)a3;
- (void)setNetworkNotificationHandler:(id)a3;
- (void)setServer:(__CTServerConnection *)a3;
- (void)setState:(unint64_t)a3;
- (void)updateNetworkSelectionStatus;
@end

@implementation PHNetworkFetcher

- (PHNetworkFetcher)init
{
  v13.receiver = self;
  v13.super_class = (Class)PHNetworkFetcher;
  v2 = [(PHNetworkFetcher *)&v13 init];
  if (v2)
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher initialized", (uint8_t *)buf, 2u);
    }

    uint64_t v4 = [MEMORY[0x263EFF980] array];
    mutableNetworks = v2->_mutableNetworks;
    v2->_mutableNetworks = (NSMutableArray *)v4;

    v2->_state = 1;
    objc_initWeak(buf, v2);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __24__PHNetworkFetcher_init__block_invoke;
    v10[3] = &unk_264910570;
    objc_copyWeak(&v11, buf);
    uint64_t v6 = MEMORY[0x230F5F970](v10);
    id networkNotificationHandler = v2->_networkNotificationHandler;
    v2->_id networkNotificationHandler = (id)v6;

    id v8 = MEMORY[0x263EF83A0];
    v2->_server = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    _CTServerConnectionRegisterForNotification();
    _CTServerConnectionRegisterForNotification();
    _CTServerConnectionRegisterForNotification();
    _CTServerConnectionRegisterForNotification();
    _CTServerConnectionRegisterForNotification();
    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __24__PHNetworkFetcher_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = a2;
    __int16 v41 = 2112;
    v42 = a3;
    _os_log_impl(&dword_22C120000, v6, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher got notification %@: %@", buf, 0x16u);
  }

  if ([a2 isEqualToString:*MEMORY[0x263F02F48]])
  {
    v33 = a2;
    v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C120000, v7, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher handling network list update notification", buf, 2u);
    }

    id v8 = [MEMORY[0x263EFF980] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v9 = [a3 objectForKey:*MEMORY[0x263F02F40]];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v15 = +[PHNetwork networkFromDictionary:v14];
          if (v15)
          {
            [v8 addObject:v15];
            v16 = PHDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v40 = v15;
              __int16 v41 = 2112;
              v42 = v14;
              _os_log_impl(&dword_22C120000, v16, OS_LOG_TYPE_DEFAULT, "Added a new network to new list: %@ from dictionary: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v11);
    }

    v17 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v19 = [WeakRetained mutableNetworks];
    char v20 = [v8 isEqualToArray:v19];

    a2 = v33;
    if ((v20 & 1) == 0)
    {
      id v21 = objc_loadWeakRetained(v17);
      [v21 setMutableNetworks:v8];

      v22 = PHDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C120000, v22, OS_LOG_TYPE_DEFAULT, "The networks list has changed, and we will notify", buf, 2u);
      }

      v23 = [MEMORY[0x263F08A00] defaultCenter];
      id v24 = objc_loadWeakRetained(v17);
      [v23 postNotificationName:@"PHNetworkFetcherNetworksChangedNotification" object:v24];
    }
    v25 = [a3 objectForKey:*MEMORY[0x263F02F50]];
    if ([v25 BOOLValue]) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 2;
    }
    id v27 = objc_loadWeakRetained(v17);
    [v27 setState:v26];
  }
  v28 = PHDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C120000, v28, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher will update selection status of networks in response to notification", buf, 2u);
  }

  id v29 = objc_loadWeakRetained((id *)(a1 + 32));
  [v29 updateNetworkSelectionStatus];

  if ([a2 isEqualToString:*MEMORY[0x263F02F58]])
  {
    v30 = PHDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C120000, v30, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher handling network list failure notification", buf, 2u);
    }

    v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 postNotificationName:@"PHNetworkFetcherErrorNotification" object:0];

    id v32 = objc_loadWeakRetained((id *)(a1 + 32));
    [v32 setState:1];
  }
}

- (NSArray)networks
{
  v2 = [(PHNetworkFetcher *)self mutableNetworks];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)fetchNetworkList
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher beginning list fetch", v5, 2u);
  }

  if ([(PHNetworkFetcher *)self state] == 1)
  {
    [(NSMutableArray *)self->_mutableNetworks removeAllObjects];
    [(PHNetworkFetcher *)self setState:2];
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"PHNetworkFetcherNetworksChangedNotification" object:self];

    _CTServerConnectionFetchNetworkList();
  }
}

- (void)updateNetworkSelectionStatus
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "PHNetworkFetcher updating network selection status", buf, 2u);
  }

  uint64_t v23 = 0;
  [(PHNetworkFetcher *)self server];
  _CTServerConnectionCopyManualNetworkSelection();
  id v4 = 0;
  v5 = [v4 valueForKey:*MEMORY[0x263F02F38]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [(PHNetworkFetcher *)self mutableNetworks];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v18 = v4;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x263F02F98];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_super v13 = [v12 code];
        int v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          *(void *)buf = 0;
          _CTServerConnectionGetNetworkSelectionState();
          if ([*(id *)buf isEqualToString:v10]) {
            uint64_t v15 = 2;
          }
          else {
            uint64_t v15 = 3;
          }
          v16 = v12;
        }
        else
        {
          v16 = v12;
          uint64_t v15 = 1;
        }
        [v16 setState:v15];
        v17 = PHDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_impl(&dword_22C120000, v17, OS_LOG_TYPE_DEFAULT, "... updated network object: %@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);

    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"PHNetworkFetcherNetworkSelectionChangedNotification" object:0];
    id v4 = v18;
  }
}

- (void)setState:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "PHNetworkFetcher state changed to %lu", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"PHNetworkFetcherStateChangedNotification" object:self];
  }
}

- (void)selectNetwork:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "PHNetworkFetcher asked to select network %@", (uint8_t *)&v7, 0xCu);
  }

  [(PHNetworkFetcher *)self server];
  uint64_t v6 = [v4 dictionaryRepresentation];
  _CTServerConnectionSelectNetwork();

  [(PHNetworkFetcher *)self updateNetworkSelectionStatus];
}

- (void)dealloc
{
  _CTServerConnectionUnregisterForAllNotifications();
  v3.receiver = self;
  v3.super_class = (Class)PHNetworkFetcher;
  [(PHNetworkFetcher *)&v3 dealloc];
}

- (unint64_t)state
{
  return self->_state;
}

- (__CTServerConnection)server
{
  return self->_server;
}

- (void)setServer:(__CTServerConnection *)a3
{
  self->_server = a3;
}

- (NSMutableArray)mutableNetworks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMutableNetworks:(id)a3
{
}

- (id)networkNotificationHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setNetworkNotificationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_networkNotificationHandler, 0);

  objc_storeStrong((id *)&self->_mutableNetworks, 0);
}

@end