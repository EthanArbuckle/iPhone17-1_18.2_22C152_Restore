@interface ACCMediaLibraryProvider
- (ACCMediaLibraryProvider)initWithDelegate:(id)a3 queue:(id)a4;
- (ACCMediaLibraryProviderDelegateProtocol)delegate;
- (ACCMediaLibraryXPCServerProtocol)remoteObject;
- (NSMutableDictionary)accessories;
- (NSMutableDictionary)libraries;
- (NSString)providerUID;
- (NSXPCConnection)serverConnection;
- (OS_dispatch_queue)delegateQ;
- (OS_dispatch_queue)processingQueue;
- (id)description;
- (int)lastUpdateType;
- (int64_t)update:(id)a3 revision:(id)a4 content:(id)a5 accessory:(id)a6;
- (int64_t)update:(id)a3 revision:(id)a4 deleteItem:(unint64_t)a5 progress:(unsigned __int8)a6 accessory:(id)a7;
- (int64_t)update:(id)a3 revision:(id)a4 deletePlaylist:(unint64_t)a5 progress:(unsigned __int8)a6 accessory:(id)a7;
- (int64_t)update:(id)a3 revision:(id)a4 item:(id)a5 progress:(unsigned __int8)a6 accessory:(id)a7;
- (int64_t)update:(id)a3 revision:(id)a4 persistentID:(unint64_t)a5 type:(int)a6 updateInfo:(id)a7 progress:(unsigned __int8)a8 accessory:(id)a9;
- (int64_t)update:(id)a3 revision:(id)a4 playlist:(id)a5 progress:(unsigned __int8)a6 accessory:(id)a7;
- (int64_t)update:(id)a3 revision:(id)a4 progress:(unsigned __int8)a5 accessory:(id)a6;
- (void)_checkPlaylistContentToSend:(id)a3 accessory:(id)a4;
- (void)_notifyRemoteOfAvailableLibraries;
- (void)accessoryMediaLibraryAllDetached;
- (void)accessoryMediaLibraryAttached:(id)a3 windowPerLibrary:(unsigned int)a4;
- (void)accessoryMediaLibraryDetached:(id)a3;
- (void)accessoryMediaLibraryUpdate:(id)a3 windowPerLibrary:(unsigned int)a4;
- (void)confirmPlaylistContentUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5;
- (void)confirmUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 updateCount:(unsigned int)a6;
- (void)connectToServer;
- (void)dealloc;
- (void)flushUpdates:(id)a3 accessory:(id)a4;
- (void)notify:(id)a3 stateChange:(int)a4 enabled:(BOOL)a5;
- (void)notifyAvailableLibraries:(id)a3;
- (void)playAllSongs:(id)a3 library:(id)a4 startItem:(unint64_t)a5;
- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startIndex:(unsigned int)a7;
- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startItem:(unint64_t)a7;
- (void)playCurrentSelection:(id)a3 library:(id)a4;
- (void)playItems:(id)a3 library:(id)a4 itemList:(id)a5 startIndex:(unsigned int)a6;
- (void)resetUpdate:(id)a3 accessory:(id)a4;
- (void)setAccessories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQ:(id)a3;
- (void)setLastUpdateType:(int)a3;
- (void)setLibraries:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)startMediaLibraryUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 mediaItemProperties:(unint64_t)a6 playlistProperties:(unint64_t)a7 playlistContentStyle:(int)a8 playlistContentProperties:(unint64_t)a9 reqOptions:(unint64_t)a10;
- (void)stopAllMediaLibraryUpdate:(id)a3;
- (void)stopMediaLibraryUpdate:(id)a3 library:(id)a4;
@end

@implementation ACCMediaLibraryProvider

- (ACCMediaLibraryProvider)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  init_logging();
  v27.receiver = self;
  v27.super_class = (Class)ACCMediaLibraryProvider;
  v8 = [(ACCMediaLibraryProvider *)&v27 init];
  if (v8)
  {
    v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v9 UUIDString];
    providerUID = v8->_providerUID;
    v8->_providerUID = (NSString *)v10;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v8->_delegateQ, v7);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v12 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
      v15 = v8->_providerUID;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = WeakRetained;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_22669E000, v12, OS_LOG_TYPE_DEFAULT, "initWithDelegate: delegate=%@ providerUID=%@", buf, 0x16u);
    }
    serverConnection = v8->_serverConnection;
    v8->_serverConnection = 0;

    remoteObject = v8->_remoteObject;
    v8->_remoteObject = 0;

    v8->_lastUpdateType = 5;
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessories = v8->_accessories;
    v8->_accessories = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    libraries = v8->_libraries;
    v8->_libraries = v20;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.acc.mediaLibrary.provider", 0);
    processingQueue = v8->_processingQueue;
    v8->_processingQueue = (OS_dispatch_queue *)v22;

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v8);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __50__ACCMediaLibraryProvider_initWithDelegate_queue___block_invoke;
    v25[3] = &unk_2647ABAE0;
    objc_copyWeak(&v26, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.medialibrary.availability-changed", v25);
    [(ACCMediaLibraryProvider *)v8 connectToServer];
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

void __50__ACCMediaLibraryProvider_initWithDelegate_queue___block_invoke(uint64_t a1, int a2)
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
    id v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_22669E000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412546;
    id v17 = WeakRetained;
    __int16 v18 = 2112;
    v19 = providerUID;
    _os_log_impl(&dword_22669E000, v5, OS_LOG_TYPE_DEFAULT, "dealloc: delegate=%@ providerUID=%@", buf, 0x16u);
  }
  accessoryServer_unregisterAvailabilityChangedHandler();
  dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global);
  processingQueue = self->_processingQueue;
  self->_processingQueue = 0;

  serverConnection = self->_serverConnection;
  self->_serverConnection = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  libraries = self->_libraries;
  self->_libraries = 0;

  id v13 = self->_providerUID;
  self->_providerUID = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_delegateQ, 0);
  v14 = [(ACCMediaLibraryProvider *)self serverConnection];
  [v14 invalidate];

  v15.receiver = self;
  v15.super_class = (Class)ACCMediaLibraryProvider;
  [(ACCMediaLibraryProvider *)&v15 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCMediaLibraryProvider>[%@]", self->_providerUID];
}

- (void)connectToServer
{
  v2 = self;
  objc_sync_enter(v2);
  if (accessoryServer_isServerAvailable())
  {
    BOOL v3 = [(ACCMediaLibraryProvider *)v2 serverConnection];

    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v4 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        id v4 = &_os_log_internal;
        id v5 = &_os_log_internal;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22669E000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to XPC server...", buf, 2u);
      }

      id v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.accessories.medialibrary" options:4096];
      [(ACCMediaLibraryProvider *)v2 setServerConnection:v6];

      id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA447C0];
      id v8 = [(ACCMediaLibraryProvider *)v2 serverConnection];
      [v8 setRemoteObjectInterface:v7];

      v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA44820];
      uint64_t v10 = [(ACCMediaLibraryProvider *)v2 serverConnection];
      [v10 setExportedInterface:v9];

      uint64_t v11 = [(ACCMediaLibraryProvider *)v2 serverConnection];
      [v11 setExportedObject:v2];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke;
      v25[3] = &unk_2647ABB28;
      objc_copyWeak(&v26, (id *)buf);
      v12 = [(ACCMediaLibraryProvider *)v2 serverConnection];
      [v12 setInvalidationHandler:v25];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke_102;
      v23[3] = &unk_2647ABB28;
      objc_copyWeak(&v24, (id *)buf);
      id v13 = [(ACCMediaLibraryProvider *)v2 serverConnection];
      [v13 setInterruptionHandler:v23];

      v14 = [(ACCMediaLibraryProvider *)v2 serverConnection];
      [v14 resume];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    objc_super v15 = [(ACCMediaLibraryProvider *)v2 remoteObject];

    if (!v15)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        v16 = &_os_log_internal;
        id v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22669E000, v16, OS_LOG_TYPE_DEFAULT, "Getting remote object...", buf, 2u);
      }

      __int16 v18 = [(ACCMediaLibraryProvider *)v2 serverConnection];
      v19 = [v18 remoteObjectProxyWithErrorHandler:&__block_literal_global_107];
      [(ACCMediaLibraryProvider *)v2 setRemoteObject:v19];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      uint64_t v20 = [(ACCMediaLibraryProvider *)v2 remoteObject];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke_108;
      v21[3] = &unk_2647ABB98;
      objc_copyWeak(&v22, (id *)buf);
      v21[4] = v2;
      [v20 initConnection:v21];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
  objc_sync_exit(v2);
}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setRemoteObject:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22669E000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v9, 2u);
  }

  id v8 = objc_loadWeakRetained(v1);
  [v8 accessoryMediaLibraryAllDetached];
}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke_102(uint64_t a1)
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
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22669E000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", buf, 2u);
  }

  id v8 = objc_loadWeakRetained(v1);
  v9 = [v8 processingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke_103;
  block[3] = &unk_2647ABB28;
  objc_copyWeak(&v11, v1);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke_103(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v4 = &_os_log_internal;
    id v3 = &_os_log_internal;
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = [WeakRetained providerUID];
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_22669E000, v4, OS_LOG_TYPE_DEFAULT, "XPC connection interupted: providerUID:%@, notify of detach", (uint8_t *)&v8, 0xCu);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  [v7 accessoryMediaLibraryAllDetached];
}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_22669E000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v6 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl(&dword_22669E000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

void __42__ACCMediaLibraryProvider_connectToServer__block_invoke_108(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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
    id v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = a2;
    _os_log_impl(&dword_22669E000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", buf, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (a2)
  {
    id v9 = [WeakRetained processingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__ACCMediaLibraryProvider_connectToServer__block_invoke_109;
    block[3] = &unk_2647ABB70;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v10 = [WeakRetained serverConnection];
    [v10 invalidate];
  }
}

uint64_t __42__ACCMediaLibraryProvider_connectToServer__block_invoke_109(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v4 = &_os_log_internal;
    id v3 = &_os_log_internal;
  }
  else
  {
    BOOL v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_22669E000, v4, OS_LOG_TYPE_DEFAULT, "notifyRemoteOfAvailableLibraries: providerUID:%@", (uint8_t *)&v7, 0xCu);
  }

  return [*(id *)(a1 + 32) _notifyRemoteOfAvailableLibraries];
}

- (void)accessoryMediaLibraryAttached:(id)a3 windowPerLibrary:(unsigned int)a4
{
  id v6 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ACCMediaLibraryProvider_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke;
  block[3] = &unk_2647ABBC0;
  void block[4] = self;
  id v10 = v6;
  unsigned int v11 = a4;
  id v8 = v6;
  dispatch_async(processingQueue, block);
}

void __74__ACCMediaLibraryProvider_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = (ACCMediaLibraryAccessory *)v2;
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
      unsigned int v11 = &_os_log_internal;
      id v5 = &_os_log_internal;
    }
    else
    {
      unsigned int v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      v30 = v3;
      _os_log_impl(&dword_22669E000, v11, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAttached: accessory %@ (%@) already exists!", buf, 0x16u);
    }
  }
  else
  {
    id v3 = [[ACCMediaLibraryAccessory alloc] initWithUID:*(void *)(a1 + 40) windowPerLibrary:*(unsigned int *)(a1 + 48) provider:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v3 forKey:*(void *)(a1 + 40)];
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    if (v6
      && (int v7 = (void *)v6,
          [*(id *)(a1 + 32) delegate],
          id v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = objc_opt_respondsToSelector(),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        id v10 = &_os_log_internal;
        id v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        int v19 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = v18;
        __int16 v29 = 2112;
        v30 = v3;
        __int16 v31 = 1024;
        LODWORD(v32) = v19;
        _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAttached: accessory %@, accessory=%@, Call delegate accessoryArrived:windowPerLibrary:, windowPerLibrary=%u", buf, 0x1Cu);
      }

      uint64_t v20 = [*(id *)(a1 + 32) delegateQ];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__ACCMediaLibraryProvider_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke_113;
      block[3] = &unk_2647ABBC0;
      void block[4] = *(void *)(a1 + 32);
      v25 = v3;
      int v26 = *(_DWORD *)(a1 + 48);
      dispatch_async(v20, block);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        int v13 = &_os_log_internal;
        id v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        v16 = [*(id *)(a1 + 32) delegate];
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        v30 = v3;
        __int16 v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_22669E000, v13, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAttached: accessory %@ (%@) delegate does not respond to selector %@", buf, 0x20u);
      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v21 = &_os_log_internal;
      id v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v23;
      _os_log_impl(&dword_22669E000, v21, OS_LOG_TYPE_DEFAULT, "Call notifyRemoteOfAvailableLibraries, providerUID:%@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _notifyRemoteOfAvailableLibraries];
  }
}

void __74__ACCMediaLibraryProvider_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke_113(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) accessoryArrived:*(void *)(a1 + 40) windowPerLibrary:*(unsigned int *)(a1 + 48)];
}

- (void)accessoryMediaLibraryDetached:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ACCMediaLibraryProvider_accessoryMediaLibraryDetached___block_invoke;
  v7[3] = &unk_2647ABA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, v7);
}

void __57__ACCMediaLibraryProvider_accessoryMediaLibraryDetached___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  id v3 = (void *)v2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (v2)
  {
    if (v5)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v6 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      v30 = v3;
      _os_log_impl(&dword_22669E000, v6, OS_LOG_TYPE_INFO, "accessoryMediaLibraryDetached: accessory %@, accessory=%@, Call delegate accessoryLeft:", buf, 0x16u);
    }

    uint64_t v10 = [*(id *)(a1 + 32) delegate];
    if (v10
      && (unsigned int v11 = (void *)v10,
          [*(id *)(a1 + 32) delegate],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = objc_opt_respondsToSelector(),
          v12,
          v11,
          (v13 & 1) != 0))
    {
      id v14 = [*(id *)(a1 + 32) delegateQ];
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      uint64_t v23 = __57__ACCMediaLibraryProvider_accessoryMediaLibraryDetached___block_invoke_116;
      id v24 = &unk_2647ABA70;
      uint64_t v25 = *(void *)(a1 + 32);
      id v26 = v3;
      dispatch_async(v14, &v21);
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
        id v16 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = [*(id *)(a1 + 32) delegate];
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        v30 = v3;
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_22669E000, v15, OS_LOG_TYPE_INFO, "accessoryMediaLibraryDetached: accessory %@ (%@) delegate does not respond to selector %@", buf, 0x20u);
      }
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "removeObjectForKey:", *(void *)(a1 + 40), v21, v22, v23, v24, v25);
  }
  else
  {
    if (v5)
    {
      int v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      int v7 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      v30 = 0;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "accessoryMediaLibraryDetached: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
  }
}

void __57__ACCMediaLibraryProvider_accessoryMediaLibraryDetached___block_invoke_116(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) accessoryLeft:*(void *)(a1 + 40)];
}

- (void)accessoryMediaLibraryAllDetached
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ACCMediaLibraryProvider_accessoryMediaLibraryAllDetached__block_invoke;
  block[3] = &unk_2647ABB70;
  void block[4] = self;
  dispatch_async(processingQueue, block);
}

void __59__ACCMediaLibraryProvider_accessoryMediaLibraryAllDetached__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v31;
    int v5 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v8 = gLogObjects;
        int v9 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v10 = gNumLogObjects < 1;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v35 = v8;
            __int16 v36 = 1024;
            LODWORD(v37) = v9;
            _os_log_error_impl(&dword_22669E000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          unsigned int v11 = v5;
          uint64_t v12 = v5;
        }
        else
        {
          uint64_t v12 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = v7;
          _os_log_impl(&dword_22669E000, v12, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAllDetached: accessory %@, Call delegate accessoryLeft:", buf, 0xCu);
        }

        uint64_t v13 = [*(id *)(a1 + 32) delegate];
        if (v13
          && (id v14 = (void *)v13,
              [*(id *)(a1 + 32) delegate],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              char v16 = objc_opt_respondsToSelector(),
              v15,
              v14,
              (v16 & 1) != 0))
        {
          uint64_t v17 = [*(id *)(a1 + 32) delegateQ];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __59__ACCMediaLibraryProvider_accessoryMediaLibraryAllDetached__block_invoke_117;
          block[3] = &unk_2647ABA70;
          void block[4] = *(void *)(a1 + 32);
          void block[5] = v7;
          dispatch_async(v17, block);
        }
        else
        {
          uint64_t v18 = gLogObjects;
          int v19 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v20 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v35 = v18;
              __int16 v36 = 1024;
              LODWORD(v37) = v19;
              _os_log_error_impl(&dword_22669E000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v21 = v5;
            uint64_t v20 = v5;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = [*(id *)(a1 + 32) delegate];
            *(_DWORD *)buf = 138412546;
            uint64_t v35 = v7;
            __int16 v36 = 2112;
            v37 = v22;
            _os_log_impl(&dword_22669E000, v20, OS_LOG_TYPE_INFO, "accessoryMediaLibraryAllDetached: accessory %@ delegate does not respond to selector %@", buf, 0x16u);
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v3);
  }

  uint64_t v23 = *(void *)(a1 + 32);
  id v24 = *(void **)(v23 + 56);
  *(void *)(v23 + 56) = 0;

  id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v26 = *(void *)(a1 + 32);
  objc_super v27 = *(void **)(v26 + 56);
  *(void *)(v26 + 56) = v25;
}

void __59__ACCMediaLibraryProvider_accessoryMediaLibraryAllDetached__block_invoke_117(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) accessoryLeft:*(void *)(a1 + 40)];
}

- (void)accessoryMediaLibraryUpdate:(id)a3 windowPerLibrary:(unsigned int)a4
{
  id v6 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ACCMediaLibraryProvider_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke;
  block[3] = &unk_2647ABBC0;
  void block[4] = self;
  id v10 = v6;
  unsigned int v11 = a4;
  id v8 = v6;
  dispatch_async(processingQueue, block);
}

void __72__ACCMediaLibraryProvider_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)v2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (!v2)
  {
    if (v5)
    {
      uint64_t v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      uint64_t v7 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      objc_super v27 = 0;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "accessoryMediaLibraryUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
    goto LABEL_33;
  }
  if (v5)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v6 = &_os_log_internal;
    id v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    objc_super v27 = v3;
    __int16 v28 = 1024;
    LODWORD(v29) = v10;
    _os_log_impl(&dword_22669E000, v6, OS_LOG_TYPE_INFO, "accessoryMediaLibraryUpdate: accessory %@, accessory=%@, Call delegate accessoryUpdate:windowPerLibrary:, windowPerLibrary=%u", buf, 0x1Cu);
  }

  [v3 setWindowPerLibrary:*(unsigned int *)(a1 + 48)];
  uint64_t v11 = [*(id *)(a1 + 32) delegate];
  if (!v11
    || (uint64_t v12 = (void *)v11,
        [*(id *)(a1 + 32) delegate],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = objc_opt_respondsToSelector(),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      uint64_t v7 = &_os_log_internal;
      id v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      objc_super v27 = v3;
      __int16 v28 = 2112;
      __int16 v29 = v18;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "accessoryMediaLibraryUpdate: accessory %@ (%@) delegate does not respond to selector %@", buf, 0x20u);
    }
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v15 = [*(id *)(a1 + 32) delegateQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ACCMediaLibraryProvider_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke_120;
  block[3] = &unk_2647ABBC0;
  void block[4] = *(void *)(a1 + 32);
  id v22 = v3;
  int v23 = *(_DWORD *)(a1 + 48);
  dispatch_async(v15, block);

LABEL_34:
}

void __72__ACCMediaLibraryProvider_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke_120(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) accessoryUpdate:*(void *)(a1 + 40) windowPerLibrary:*(unsigned int *)(a1 + 48)];
}

- (void)startMediaLibraryUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 mediaItemProperties:(unint64_t)a6 playlistProperties:(unint64_t)a7 playlistContentStyle:(int)a8 playlistContentProperties:(unint64_t)a9 reqOptions:(unint64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __169__ACCMediaLibraryProvider_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke;
  block[3] = &unk_2647ABC10;
  void block[4] = self;
  id v24 = v16;
  unint64_t v27 = a6;
  unint64_t v28 = a7;
  id v25 = v17;
  id v26 = v18;
  int v31 = a8;
  unint64_t v29 = a9;
  unint64_t v30 = a10;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  dispatch_async(processingQueue, block);
}

void __169__ACCMediaLibraryProvider_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3) {
    goto LABEL_7;
  }
  BOOL v4 = (void *)v3;
  int v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
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
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(void **)(a1 + 48);
      id v17 = *(void **)(a1 + 72);
      uint64_t v18 = *(void *)(a1 + 80);
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v19 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138413826;
      uint64_t v56 = v15;
      __int16 v57 = 2112;
      v58 = v16;
      __int16 v59 = 2112;
      v60 = v2;
      __int16 v61 = 2048;
      uint64_t v62 = v19;
      __int16 v63 = 2048;
      id v64 = v17;
      __int16 v65 = 2048;
      uint64_t v66 = v18;
      __int16 v67 = 2112;
      uint64_t v68 = v20;
      _os_log_impl(&dword_22669E000, v8, OS_LOG_TYPE_INFO, "startMediaLibraryUpdate: accessory %@, library %@, accessory=%@, fill in infoDictionary, mediaItemProperties=%llxh playlistProperties=%llxh playlistContentProperties=%llxh, lastRevision=%@", buf, 0x48u);
    }

    if (*(void *)(a1 + 64))
    {
      id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v22 = 0;
      int v23 = 1;
      do
      {
        if ((*(void *)(a1 + 64) & v23) != 0)
        {
          id v24 = [NSNumber numberWithInt:v22];
          [v21 addObject:v24];
        }
        uint64_t v22 = (v22 + 1);
        v23 *= 2;
      }
      while (v22 != 28);
      [v7 setObject:v21 forKey:@"ACCMediaLibraryUpdateItemDictionary"];
    }
    if (*(void *)(a1 + 72))
    {
      id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v26 = 0;
      int v27 = 1;
      do
      {
        if ((*(void *)(a1 + 72) & v27) != 0)
        {
          unint64_t v28 = [NSNumber numberWithInt:v26];
          [v25 addObject:v28];
        }
        uint64_t v26 = (v26 + 1);
        v27 *= 2;
      }
      while (v26 != 10);
      [v7 setObject:v25 forKey:@"ACCMediaLibraryUpdatePlaylistDictionary"];
    }
    if (*(void *)(a1 + 80))
    {
      id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v30 = 0;
      int v31 = 1;
      do
      {
        if ((*(void *)(a1 + 80) & v31) != 0)
        {
          long long v32 = [NSNumber numberWithInt:v30];
          [v29 addObject:v32];
        }
        uint64_t v30 = (v30 + 1);
        v31 *= 2;
      }
      while (v30 != 28);
      [v7 setObject:v29 forKey:@"ACCMediaLibraryUpdatePlaylistItemDictionary"];
    }
    if (*(_DWORD *)(a1 + 96))
    {
      long long v33 = objc_msgSend(NSNumber, "numberWithInt:");
      [v7 setObject:v33 forKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];
    }
    if (*(void *)(a1 + 88))
    {
      int v34 = 0;
      v49 = @"ACCMediaLibraryUpdatePlaylistItemDictionary";
      int v35 = 1;
      do
      {
        if ((*(void *)(a1 + 88) & v35) != 0)
        {
          switch(v34)
          {
            case 0:
              __int16 v36 = [NSNumber numberWithBool:1];
              v37 = v7;
              v38 = v36;
              uint64_t v39 = @"ACCMediaLibraryUpdateHidingRemoteItems";
LABEL_51:
              objc_msgSend(v37, "setObject:forKey:", v38, v39, v49);

              break;
            case 1:
              __int16 v36 = [NSNumber numberWithBool:1];
              v37 = v7;
              v38 = v36;
              uint64_t v39 = @"ACCMediaLibraryUpdatePlayAllSongsCapable";
              goto LABEL_51;
            case 2:
              if (!*(void *)(a1 + 80))
              {
                id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
                v48 = [NSNumber numberWithInt:0];
                [v47 addObject:v48];

                [v7 setObject:v47 forKey:v49];
              }
              goto LABEL_53;
          }
        }
        ++v34;
        v35 *= 2;
      }
      while (v34 != 3);
    }
LABEL_53:
    if (gLogObjects) {
      BOOL v40 = gNumLogObjects < 1;
    }
    else {
      BOOL v40 = 1;
    }
    if (v40)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v42 = &_os_log_internal;
      id v41 = &_os_log_internal;
    }
    else
    {
      v42 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      uint64_t v43 = *(void *)(a1 + 40);
      v44 = *(void **)(a1 + 48);
      uint64_t v45 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413314;
      uint64_t v56 = v43;
      __int16 v57 = 2112;
      v58 = v44;
      __int16 v59 = 2112;
      v60 = v2;
      __int16 v61 = 2112;
      uint64_t v62 = v45;
      __int16 v63 = 2112;
      id v64 = v7;
      _os_log_impl(&dword_22669E000, v42, OS_LOG_TYPE_INFO, "startMediaLibraryUpdate: accessory %@, library %@, accessory=%@, Call delegate startUpdate:lastRevision:requestedInfo:, lastRevision=%@ infoDictionary=%@", buf, 0x34u);
    }

    v46 = [*(id *)(a1 + 32) delegateQ];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __169__ACCMediaLibraryProvider_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke_125;
    block[3] = &unk_2647ABBE8;
    void block[4] = *(void *)(a1 + 32);
    id v51 = *(id *)(a1 + 48);
    id v52 = *(id *)(a1 + 56);
    id v53 = v7;
    id v54 = v2;
    uint64_t v11 = v7;
    dispatch_async(v46, block);
  }
  else
  {
LABEL_7:
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
      uint64_t v11 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    else
    {
      uint64_t v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v56 = v12;
      __int16 v57 = 2112;
      v58 = v2;
      __int16 v59 = 2112;
      v60 = v13;
      _os_log_impl(&dword_22669E000, v11, OS_LOG_TYPE_INFO, "startMediaLibraryUpdate: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);
    }
  }
}

void __169__ACCMediaLibraryProvider_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke_125(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) startUpdate:*(void *)(a1 + 40) lastRevision:*(void *)(a1 + 48) requestedInfo:*(void *)(a1 + 56) accessory:*(void *)(a1 + 64)];
}

- (void)stopMediaLibraryUpdate:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ACCMediaLibraryProvider_stopMediaLibraryUpdate_library___block_invoke;
  block[3] = &unk_2647ABA48;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(processingQueue, block);
}

void __58__ACCMediaLibraryProvider_stopMediaLibraryUpdate_library___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3) {
    goto LABEL_7;
  }
  BOOL v4 = (void *)v3;
  int v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v7 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v2;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "stopMediaLibraryUpdate: accessory %@, accessory=%@, Call delegate stopUpdate:", buf, 0x16u);
    }

    uint64_t v15 = [*(id *)(a1 + 32) delegateQ];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__ACCMediaLibraryProvider_stopMediaLibraryUpdate_library___block_invoke_128;
    block[3] = &unk_2647ABA48;
    void block[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    id v18 = v2;
    dispatch_async(v15, block);
  }
  else
  {
LABEL_7:
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
      id v10 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v2;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "stopAllMediaLibraryUpdate: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);
    }
  }
}

void __58__ACCMediaLibraryProvider_stopMediaLibraryUpdate_library___block_invoke_128(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) stopUpdate:*(void *)(a1 + 40) accessory:*(void *)(a1 + 48)];
}

- (void)stopAllMediaLibraryUpdate:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ACCMediaLibraryProvider_stopAllMediaLibraryUpdate___block_invoke;
  v7[3] = &unk_2647ABA70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, v7);
}

void __53__ACCMediaLibraryProvider_stopAllMediaLibraryUpdate___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  int v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v7 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      __int16 v21 = v2;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "stopAllMediaLibraryUpdate: accessory %@, accessory=%@, Call delegate stopAllUpdate:", buf, 0x16u);
    }

    uint64_t v15 = [*(id *)(a1 + 32) delegateQ];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__ACCMediaLibraryProvider_stopAllMediaLibraryUpdate___block_invoke_131;
    v16[3] = &unk_2647ABA70;
    v16[4] = *(void *)(a1 + 32);
    id v17 = v2;
    dispatch_async(v15, v16);
  }
  else
  {
LABEL_7:
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
      id v10 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v2;
      __int16 v22 = 2112;
      __int16 v23 = v12;
      _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "stopAllMediaLibraryUpdate: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);
    }
  }
}

void __53__ACCMediaLibraryProvider_stopAllMediaLibraryUpdate___block_invoke_131(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) stopAllUpdate:*(void *)(a1 + 40)];
}

- (void)confirmUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 updateCount:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ACCMediaLibraryProvider_confirmUpdate_library_lastRevision_updateCount___block_invoke;
  block[3] = &unk_2647ABC38;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  unsigned int v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(processingQueue, block);
}

void __74__ACCMediaLibraryProvider_confirmUpdate_library_lastRevision_updateCount___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 confirmUpdates:*(void *)(a1 + 48) revision:*(void *)(a1 + 56) count:*(unsigned int *)(a1 + 64)];
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    if (v5
      && (char v6 = (void *)v5,
          [*(id *)(a1 + 32) delegate],
          id v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = objc_opt_respondsToSelector(),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        id v9 = &_os_log_internal;
        id v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = *(void *)(a1 + 40);
        int v27 = *(void **)(a1 + 48);
        unint64_t v28 = *(void **)(a1 + 56);
        int v29 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 138413314;
        uint64_t v36 = v26;
        __int16 v37 = 2112;
        v38 = v27;
        __int16 v39 = 2112;
        BOOL v40 = v28;
        __int16 v41 = 1024;
        int v42 = v29;
        __int16 v43 = 2112;
        v44 = v3;
        _os_log_debug_impl(&dword_22669E000, v9, OS_LOG_TYPE_DEBUG, "confirmUpdate: %@, library %@, lastRevision %@, updateCount %u, accessory=%@, Call delegate confirmUpdate", buf, 0x30u);
      }

      id v18 = [*(id *)(a1 + 32) delegateQ];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__ACCMediaLibraryProvider_confirmUpdate_library_lastRevision_updateCount___block_invoke_134;
      block[3] = &unk_2647ABC38;
      void block[4] = *(void *)(a1 + 32);
      id v31 = *(id *)(a1 + 48);
      id v32 = *(id *)(a1 + 56);
      int v34 = *(_DWORD *)(a1 + 64);
      id v33 = v3;
      dispatch_async(v18, block);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        id v10 = &_os_log_internal;
        id v13 = &_os_log_internal;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        id v15 = [*(id *)(a1 + 32) delegate];
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = v14;
        __int16 v37 = 2112;
        v38 = v3;
        __int16 v39 = 2112;
        BOOL v40 = v15;
        _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "confirmUpdate: accessory %@ (%@), delegate does not respond to selector %@", buf, 0x20u);
      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v19 = &_os_log_internal;
      id v20 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      __int16 v22 = *(void **)(a1 + 48);
      __int16 v23 = *(void **)(a1 + 56);
      int v24 = *(_DWORD *)(a1 + 64);
      uint64_t v25 = [v4 count];
      *(_DWORD *)buf = 138413826;
      uint64_t v36 = v21;
      __int16 v37 = 2112;
      v38 = v22;
      __int16 v39 = 2112;
      BOOL v40 = v23;
      __int16 v41 = 1024;
      int v42 = v24;
      __int16 v43 = 2112;
      v44 = v3;
      __int16 v45 = 2048;
      uint64_t v46 = v25;
      __int16 v47 = 2112;
      v48 = v4;
      _os_log_debug_impl(&dword_22669E000, v19, OS_LOG_TYPE_DEBUG, "confirmUpdate: %@, library %@, lastRevision %@, updateCount %u, accessory=%@, removedList=(%lu)%@", buf, 0x44u);
    }

    [*(id *)(a1 + 32) _checkPlaylistContentToSend:*(void *)(a1 + 48) accessory:v3];
  }
  else
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 1;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v4 = &_os_log_internal;
      id v12 = &_os_log_internal;
    }
    else
    {
      id v4 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v16;
      __int16 v37 = 2112;
      v38 = 0;
      _os_log_impl(&dword_22669E000, v4, OS_LOG_TYPE_INFO, "confirmUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
  }
}

void __74__ACCMediaLibraryProvider_confirmUpdate_library_lastRevision_updateCount___block_invoke_134(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) confirmUpdate:*(void *)(a1 + 40) lastRevision:*(void *)(a1 + 48) updateCount:*(unsigned int *)(a1 + 64) accessory:*(void *)(a1 + 56)];
}

- (void)confirmPlaylistContentUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  processingQueue = self->_processingQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__ACCMediaLibraryProvider_confirmPlaylistContentUpdate_library_lastRevision___block_invoke;
  v15[3] = &unk_2647ABC60;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(processingQueue, v15);
}

void __77__ACCMediaLibraryProvider_confirmPlaylistContentUpdate_library_lastRevision___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
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
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      unint64_t v28 = 0;
      _os_log_impl(&dword_22669E000, v12, OS_LOG_TYPE_INFO, "confirmPlaylistContentUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }
    goto LABEL_27;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3
    || (id v4 = (void *)v3,
        [*(id *)(a1 + 32) delegate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) == 0))
  {
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
      id v12 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      unint64_t v28 = v2;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      _os_log_impl(&dword_22669E000, v12, OS_LOG_TYPE_INFO, "confirmPlaylistContentUpdate: accessory %@ (%@), delegate does not respond to selector %@", buf, 0x20u);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v7 = &_os_log_internal;
    id v16 = &_os_log_internal;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = *(void **)(a1 + 48);
    id v20 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    uint64_t v26 = v18;
    __int16 v27 = 2112;
    unint64_t v28 = v19;
    __int16 v29 = 2112;
    uint64_t v30 = v20;
    __int16 v31 = 2112;
    id v32 = v2;
    _os_log_debug_impl(&dword_22669E000, v7, OS_LOG_TYPE_DEBUG, "confirmPlaylistContentUpdate: %@, library %@, lastRevision %@, accessory=%@, Call delegate confirmPlaylistContentUpdate:", buf, 0x2Au);
  }

  id v17 = [*(id *)(a1 + 32) delegateQ];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__ACCMediaLibraryProvider_confirmPlaylistContentUpdate_library_lastRevision___block_invoke_135;
  v21[3] = &unk_2647ABC60;
  v21[4] = *(void *)(a1 + 32);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v24 = v2;
  dispatch_async(v17, v21);

LABEL_28:
}

void __77__ACCMediaLibraryProvider_confirmPlaylistContentUpdate_library_lastRevision___block_invoke_135(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) confirmPlaylistContentUpdate:*(void *)(a1 + 40) lastRevision:*(void *)(a1 + 48) accessory:*(void *)(a1 + 56)];
}

- (void)playCurrentSelection:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ACCMediaLibraryProvider_playCurrentSelection_library___block_invoke;
  block[3] = &unk_2647ABA48;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(processingQueue, block);
}

void __56__ACCMediaLibraryProvider_playCurrentSelection_library___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v7 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v2;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "playCurrentSelection: %@, library %@, accessory=%@, Call delegate playCurrentSelection:", buf, 0x20u);
    }

    id v16 = [*(id *)(a1 + 32) delegateQ];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ACCMediaLibraryProvider_playCurrentSelection_library___block_invoke_138;
    block[3] = &unk_2647ABA48;
    void block[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    id v19 = v2;
    dispatch_async(v16, block);
  }
  else
  {
LABEL_7:
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
      id v10 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      id v23 = v2;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "playCurrentSelection: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);
    }
  }
}

void __56__ACCMediaLibraryProvider_playCurrentSelection_library___block_invoke_138(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) playCurrentSelection:*(void *)(a1 + 40) accessory:*(void *)(a1 + 48)];
}

- (void)playItems:(id)a3 library:(id)a4 itemList:(id)a5 startIndex:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ACCMediaLibraryProvider_playItems_library_itemList_startIndex___block_invoke;
  block[3] = &unk_2647ABC38;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  unsigned int v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(processingQueue, block);
}

void __65__ACCMediaLibraryProvider_playItems_library_itemList_startIndex___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v7 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = *(void **)(a1 + 48);
      uint64_t v16 = [*(id *)(a1 + 56) count];
      int v17 = *(_DWORD *)(a1 + 64);
      *(_DWORD *)buf = 138413314;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      __int16 v27 = v15;
      __int16 v28 = 2112;
      __int16 v29 = v2;
      __int16 v30 = 2048;
      uint64_t v31 = v16;
      __int16 v32 = 1024;
      int v33 = v17;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "playItems: %@, library %@, accessory=%@, Call delegate play:itemList:firstItemIndex:, itemList.count=%lu startIndex=%u", buf, 0x30u);
    }

    id v18 = [*(id *)(a1 + 32) delegateQ];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__ACCMediaLibraryProvider_playItems_library_itemList_startIndex___block_invoke_141;
    block[3] = &unk_2647ABC38;
    void block[4] = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    int v23 = *(_DWORD *)(a1 + 64);
    id v22 = v2;
    dispatch_async(v18, block);
  }
  else
  {
LABEL_7:
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
      id v10 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      __int16 v27 = v2;
      __int16 v28 = 2112;
      __int16 v29 = v12;
      _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "playItems: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);
    }
  }
}

void __65__ACCMediaLibraryProvider_playItems_library_itemList_startIndex___block_invoke_141(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) play:*(void *)(a1 + 40) itemList:*(void *)(a1 + 48) firstItemIndex:*(unsigned int *)(a1 + 64) accessory:*(void *)(a1 + 56)];
}

- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startItem:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  processingQueue = self->_processingQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__ACCMediaLibraryProvider_playCollection_library_collection_type_startItem___block_invoke;
  v17[3] = &unk_2647ABC88;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  unint64_t v20 = a5;
  int v22 = a6;
  unint64_t v21 = a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(processingQueue, v17);
}

void __76__ACCMediaLibraryProvider_playCollection_library_collection_type_startItem___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v7 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = *(void **)(a1 + 48);
      int v16 = *(_DWORD *)(a1 + 72);
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138413570;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      __int16 v28 = v15;
      __int16 v29 = 2112;
      __int16 v30 = v2;
      __int16 v31 = 2048;
      uint64_t v32 = v17;
      __int16 v33 = 1024;
      int v34 = v16;
      __int16 v35 = 2048;
      uint64_t v36 = v18;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "playCollection: %@, library %@, accessory=%@, Call delegate play:collection:type:firstItemPersistentID:, collection=%llu type=%u startItem=%llu", buf, 0x3Au);
    }

    id v19 = [*(id *)(a1 + 32) delegateQ];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __76__ACCMediaLibraryProvider_playCollection_library_collection_type_startItem___block_invoke_144;
    v20[3] = &unk_2647ABC88;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    int v24 = *(_DWORD *)(a1 + 72);
    long long v23 = *(_OWORD *)(a1 + 56);
    id v22 = v2;
    dispatch_async(v19, v20);
  }
  else
  {
LABEL_7:
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
      id v10 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      __int16 v28 = v2;
      __int16 v29 = 2112;
      __int16 v30 = v12;
      _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "playCollection: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);
    }
  }
}

void __76__ACCMediaLibraryProvider_playCollection_library_collection_type_startItem___block_invoke_144(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) play:*(void *)(a1 + 40) collection:*(void *)(a1 + 56) type:*(unsigned int *)(a1 + 72) firstItemPersistentID:*(void *)(a1 + 64) accessory:*(void *)(a1 + 48)];
}

- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startIndex:(unsigned int)a7
{
  id v12 = a3;
  id v13 = a4;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__ACCMediaLibraryProvider_playCollection_library_collection_type_startIndex___block_invoke;
  block[3] = &unk_2647ABCB0;
  void block[4] = self;
  id v18 = v12;
  id v19 = v13;
  unint64_t v20 = a5;
  int v21 = a6;
  unsigned int v22 = a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(processingQueue, block);
}

void __77__ACCMediaLibraryProvider_playCollection_library_collection_type_startIndex___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v7 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = *(void **)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      int v17 = *(_DWORD *)(a1 + 64);
      int v18 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138413570;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      __int16 v30 = v15;
      __int16 v31 = 2112;
      uint64_t v32 = v2;
      __int16 v33 = 2048;
      uint64_t v34 = v16;
      __int16 v35 = 1024;
      int v36 = v17;
      __int16 v37 = 1024;
      int v38 = v18;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "playCollection: %@, library %@, accessory=%@, Call delegate play:collection:type:firstItemIndex:, collection=%llu type=%u startIndex=%u", buf, 0x36u);
    }

    id v19 = [*(id *)(a1 + 32) delegateQ];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__ACCMediaLibraryProvider_playCollection_library_collection_type_startIndex___block_invoke_147;
    block[3] = &unk_2647ABCB0;
    void block[4] = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 56);
    id v23 = v20;
    uint64_t v25 = v21;
    uint64_t v26 = *(void *)(a1 + 64);
    id v24 = v2;
    dispatch_async(v19, block);
  }
  else
  {
LABEL_7:
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
      id v10 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      __int16 v30 = v2;
      __int16 v31 = 2112;
      uint64_t v32 = v12;
      _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "playCollection: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);
    }
  }
}

void __77__ACCMediaLibraryProvider_playCollection_library_collection_type_startIndex___block_invoke_147(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) play:*(void *)(a1 + 40) collection:*(void *)(a1 + 56) type:*(unsigned int *)(a1 + 64) firstItemIndex:*(unsigned int *)(a1 + 68) accessory:*(void *)(a1 + 48)];
}

- (void)playAllSongs:(id)a3 library:(id)a4 startItem:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  processingQueue = self->_processingQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__ACCMediaLibraryProvider_playAllSongs_library_startItem___block_invoke;
  v13[3] = &unk_2647ABCD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(processingQueue, v13);
}

void __58__ACCMediaLibraryProvider_playAllSongs_library_startItem___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v7 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = *(void **)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      __int16 v27 = v15;
      __int16 v28 = 2112;
      __int16 v29 = v2;
      __int16 v30 = 2048;
      uint64_t v31 = v16;
      _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "playAllSongs: %@, library %@, accessory=%@, Call delegate playAllSongs:firstItemPersistentID:, startIitem=%llu", buf, 0x2Au);
    }

    int v17 = [*(id *)(a1 + 32) delegateQ];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __58__ACCMediaLibraryProvider_playAllSongs_library_startItem___block_invoke_150;
    v20[3] = &unk_2647ABCD8;
    v20[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 56);
    id v21 = v18;
    uint64_t v23 = v19;
    id v22 = v2;
    dispatch_async(v17, v20);
  }
  else
  {
LABEL_7:
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
      id v10 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) delegate];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      __int16 v27 = v2;
      __int16 v28 = 2112;
      __int16 v29 = v12;
      _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "playAllSongs: accessory %@ (%@) does not exist! or delegate does not respond to selector %@", buf, 0x20u);
    }
  }
}

void __58__ACCMediaLibraryProvider_playAllSongs_library_startItem___block_invoke_150(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaLibrary:*(void *)(a1 + 32) playAllSongs:*(void *)(a1 + 40) firstItemPersistentID:*(void *)(a1 + 56) accessory:*(void *)(a1 + 48)];
}

- (void)_notifyRemoteOfAvailableLibraries
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(NSMutableDictionary *)self->_libraries allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) info];
        id v10 = (void *)[v9 copyDict];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v6);
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
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412546;
    id v20 = v3;
    __int16 v21 = 2112;
    id v22 = providerUID;
    _os_log_impl(&dword_22669E000, v11, OS_LOG_TYPE_INFO, "_notifyRemoteOfAvailableLibraries:%@ providerUID:%@", buf, 0x16u);
  }

  uint64_t v14 = [(ACCMediaLibraryProvider *)self remoteObject];
  [v14 notifyAvailableLibraries:v3 provider:self->_providerUID];
}

- (void)notifyAvailableLibraries:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__ACCMediaLibraryProvider_notifyAvailableLibraries___block_invoke;
  v7[3] = &unk_2647ABA70;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(processingQueue, v7);
}

void __52__ACCMediaLibraryProvider_notifyAvailableLibraries___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v30 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v10 = [[ACCMediaLibraryInfo alloc] initWithInfo:v9];
        uint64_t v11 = [v9 mediaLibraryUID];
        [v2 setObject:v10 forKey:v11];

        id v12 = *(void **)(*(void *)(v30 + 40) + 64);
        id v13 = [v9 mediaLibraryUID];
        uint64_t v14 = [v12 objectForKey:v13];
        LOBYTE(v12) = v14 == 0;

        v6 |= v12;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v15 = [*(id *)(*(void *)(v30 + 40) + 64) allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [v2 objectForKey:*(void *)(*((void *)&v31 + 1) + 8 * j)];
        BOOL v21 = v20 == 0;

        v6 |= v21;
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v45 count:16];
    }
    while (v17);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v22 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v22 = &_os_log_internal;
    id v23 = &_os_log_internal;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = *(void *)(v30 + 40);
    uint64_t v25 = *(void *)(v24 + 32);
    uint64_t v26 = *(void *)(v24 + 64);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)BOOL v40 = v6 & 1;
    *(_WORD *)&v40[4] = 2112;
    *(void *)&v40[6] = v25;
    __int16 v41 = 2112;
    uint64_t v42 = v26;
    __int16 v43 = 2112;
    id v44 = v2;
    _os_log_impl(&dword_22669E000, v22, OS_LOG_TYPE_INFO, "foundDeletionOrAdd=%d providerUID:%@ _libraries= %@ -> %@", buf, 0x26u);
  }

  objc_storeStrong((id *)(*(void *)(v30 + 40) + 64), v2);
  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      __int16 v27 = &_os_log_internal;
      id v28 = &_os_log_internal;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = *(void *)(*(void *)(v30 + 40) + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)BOOL v40 = v29;
      _os_log_impl(&dword_22669E000, v27, OS_LOG_TYPE_INFO, "foundDeletionOrAdd, notifyRemoteOfAvailableLibraries: providerUID:%@", buf, 0xCu);
    }

    [*(id *)(v30 + 40) _notifyRemoteOfAvailableLibraries];
  }
}

- (void)notify:(id)a3 stateChange:(int)a4 enabled:(BOOL)a5
{
  id v8 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ACCMediaLibraryProvider_notify_stateChange_enabled___block_invoke;
  block[3] = &unk_2647ABD00;
  void block[4] = self;
  id v12 = v8;
  int v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(processingQueue, block);
}

uint64_t __54__ACCMediaLibraryProvider_notify_stateChange_enabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    if ([v2 setState:*(unsigned int *)(a1 + 48) value:*(unsigned __int8 *)(a1 + 52)])
    {
      id v3 = [*(id *)(a1 + 32) remoteObject];

      if (v3)
      {
        uint64_t v4 = [*(id *)(a1 + 32) remoteObject];
        [v4 notify:*(void *)(a1 + 40) stateChange:*(unsigned int *)(a1 + 48) enabled:*(unsigned __int8 *)(a1 + 52)];
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (int64_t)update:(id)a3 revision:(id)a4 persistentID:(unint64_t)a5 type:(int)a6 updateInfo:(id)a7 progress:(unsigned __int8)a8 accessory:(id)a9
{
  int v9 = a8;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a9;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 3;
  if (gLogObjects) {
    BOOL v19 = gNumLogObjects < 1;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v21 = &_os_log_internal;
    id v20 = &_os_log_internal;
  }
  else
  {
    BOOL v21 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int lastUpdateType = self->_lastUpdateType;
    *(_DWORD *)buf = 138414082;
    id v48 = v15;
    __int16 v49 = 2112;
    id v50 = v16;
    __int16 v51 = 2048;
    unint64_t v52 = a5;
    __int16 v53 = 1024;
    int v54 = a6;
    __int16 v55 = 1024;
    int v56 = v9;
    __int16 v57 = 2112;
    id v58 = v17;
    __int16 v59 = 2112;
    id v60 = v18;
    __int16 v61 = 1024;
    LODWORD(v62) = lastUpdateType;
    _os_log_impl(&dword_22669E000, v21, OS_LOG_TYPE_INFO, "update:%@ revision=%@ persistentID=%llu updateType=%d progress=%u info=%@ accessory=%@ _lastUpdateType=%d", buf, 0x46u);
  }

  processingQueue = self->_processingQueue;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __91__ACCMediaLibraryProvider_update_revision_persistentID_type_updateInfo_progress_accessory___block_invoke;
  v33[3] = &unk_2647ABD28;
  int v41 = a6;
  id v24 = v17;
  id v34 = v24;
  long long v35 = self;
  uint64_t v39 = &v43;
  unint64_t v40 = a5;
  id v25 = v15;
  id v36 = v25;
  id v26 = v16;
  id v37 = v26;
  char v42 = v9;
  id v27 = v18;
  id v38 = v27;
  dispatch_sync(processingQueue, v33);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v28 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v28 = &_os_log_internal;
    id v29 = &_os_log_internal;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = v44[3];
    *(_DWORD *)buf = 138414082;
    id v48 = v25;
    __int16 v49 = 2112;
    id v50 = v26;
    __int16 v51 = 2048;
    unint64_t v52 = a5;
    __int16 v53 = 1024;
    int v54 = a6;
    __int16 v55 = 1024;
    int v56 = v9;
    __int16 v57 = 2112;
    id v58 = v24;
    __int16 v59 = 2112;
    id v60 = v27;
    __int16 v61 = 2048;
    uint64_t v62 = v30;
    _os_log_impl(&dword_22669E000, v28, OS_LOG_TYPE_INFO, "update:%@ revision=%@ persistentID=%llu updateType=%d progress=%u info=%@ accessory=%@, status=%ld", buf, 0x4Au);
  }

  int64_t v31 = v44[3];
  _Block_object_dispose(&v43, 8);

  return v31;
}

void __91__ACCMediaLibraryProvider_update_revision_persistentID_type_updateInfo_progress_accessory___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  switch(*(_DWORD *)(a1 + 88))
  {
    case 0:
      BOOL v3 = 0;
      goto LABEL_19;
    case 1:
      char v6 = *(void **)(a1 + 32);
      if (!v6) {
        goto LABEL_23;
      }
      BOOL v3 = (*(_DWORD *)(*(void *)(a1 + 40) + 8) - 3) < 2;
      uint64_t v7 = (void *)[v6 copyDict];
      id v8 = &ACCMediaLibraryUpdateItemDictionary;
      goto LABEL_15;
    case 2:
      int v9 = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_23;
      }
      BOOL v3 = (*(_DWORD *)(*(void *)(a1 + 40) + 8) - 3) < 2;
      uint64_t v7 = (void *)[v9 copyDict];
      id v8 = &ACCMediaLibraryUpdatePlaylistDictionary;
LABEL_15:
      [v2 setObject:v7 forKey:*v8];
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;

      break;
    case 3:
      BOOL v3 = (*(_DWORD *)(*(void *)(a1 + 40) + 8) - 1) < 2;
      id v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
      uint64_t v11 = &ACCMediaLibraryUpdateItemDeletePersistentID;
      goto LABEL_18;
    case 4:
      BOOL v3 = (*(_DWORD *)(*(void *)(a1 + 40) + 8) - 1) < 2;
      id v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
      uint64_t v11 = &ACCMediaLibraryUpdatePlaylistDeletePersistentID;
LABEL_18:
      [v2 setObject:v10 forKey:*v11];

LABEL_19:
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      break;
    default:
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
        id v12 = &_os_log_internal;
        id v5 = &_os_log_internal;
      }
      else
      {
        id v12 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 80);
        int v16 = *(_DWORD *)(a1 + 88);
        int v17 = *(unsigned __int8 *)(a1 + 92);
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = *(void *)(a1 + 32);
        int v20 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
        int v74 = 138414082;
        uint64_t v75 = v13;
        __int16 v76 = 2112;
        uint64_t v77 = v14;
        __int16 v78 = 2048;
        *(void *)v79 = v15;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)&v79[10] = v16;
        *(_WORD *)&v79[14] = 1024;
        *(_DWORD *)&v79[16] = v17;
        *(_WORD *)&v79[20] = 2112;
        *(void *)&v79[22] = v19;
        *(_WORD *)&v79[30] = 2112;
        *(void *)&v79[32] = v18;
        *(_WORD *)&v79[40] = 1024;
        int v80 = v20;
        _os_log_impl(&dword_22669E000, v12, OS_LOG_TYPE_INFO, "update:%@ revision=%@ persistentID=%llu updateType=%d progress=%u info=%@ accessory=%@ _lastUpdateType=%d, UNKNOWN TYPE!!!", (uint8_t *)&v74, 0x46u);
      }

LABEL_23:
      BOOL v3 = 0;
      break;
  }
  *(_DWORD *)(*(void *)(a1 + 40) + 8) = *(_DWORD *)(a1 + 88);
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 3) {
    goto LABEL_94;
  }
  [v2 setObject:*(void *)(a1 + 48) forKey:@"ACCMediaLibraryUIDKey"];
  BOOL v21 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  [v2 setObject:v21 forKey:@"ACCMediaLibraryUpdateTypeKey"];

  [v2 setObject:*(void *)(a1 + 56) forKey:@"ACCMediaLibraryUpdateRevisionKey"];
  id v22 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 92)];
  [v2 setObject:v22 forKey:@"ACCMediaLibraryUpdateProgressKey"];

  char v23 = [*(id *)(a1 + 64) pendingUpdatesAndWaitingConfirmFullForLibrary:*(void *)(a1 + 48)];
  if (gLogObjects) {
    BOOL v24 = gNumLogObjects <= 0;
  }
  else {
    BOOL v24 = 1;
  }
  int v25 = !v24;
  if (v23)
  {
    if (v25)
    {
      id v26 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v26 = &_os_log_internal;
      id v28 = &_os_log_internal;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = *(void *)(a1 + 48);
      uint64_t v30 = *(void *)(a1 + 56);
      uint64_t v31 = [*(id *)(a1 + 64) pendingAndWaitingConfirmUpdatesCountForLibrary:v29];
      int v32 = [*(id *)(a1 + 64) windowPerLibrary];
      int v74 = 138413058;
      uint64_t v75 = v29;
      __int16 v76 = 2112;
      uint64_t v77 = v30;
      __int16 v78 = 2048;
      *(void *)v79 = v31;
      *(_WORD *)&v79[8] = 1024;
      *(_DWORD *)&v79[10] = v32;
      _os_log_impl(&dword_22669E000, v26, OS_LOG_TYPE_INFO, "update:%@ revision=%@, ALREADY FULL (%lu / %d), update not added!!!", (uint8_t *)&v74, 0x26u);
    }
    uint64_t v33 = 2;
  }
  else
  {
    if (v25)
    {
      id v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v27 = &_os_log_internal;
      id v34 = &_os_log_internal;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = *(void *)(a1 + 48);
      uint64_t v36 = *(void *)(a1 + 56);
      uint64_t v37 = [*(id *)(a1 + 64) pendingAndWaitingConfirmUpdatesCountForLibrary:v35];
      int v38 = [*(id *)(a1 + 64) windowPerLibrary];
      int v74 = 138413314;
      uint64_t v75 = v35;
      __int16 v76 = 2112;
      uint64_t v77 = v36;
      __int16 v78 = 2048;
      *(void *)v79 = v37;
      *(_WORD *)&v79[8] = 1024;
      *(_DWORD *)&v79[10] = v38;
      *(_WORD *)&v79[14] = 2112;
      *(void *)&v79[16] = v2;
      _os_log_impl(&dword_22669E000, v27, OS_LOG_TYPE_INFO, "update:%@ revision=%@, not full (%lu / %d), addUpdate: dict=%@", (uint8_t *)&v74, 0x30u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    if (v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v39 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        uint64_t v39 = &_os_log_internal;
        id v40 = &_os_log_internal;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = *(void *)(a1 + 48);
        int v74 = 138412546;
        uint64_t v75 = v41;
        __int16 v76 = 1024;
        LODWORD(v77) = 1;
        _os_log_impl(&dword_22669E000, v39, OS_LOG_TYPE_INFO, "update:%@ addDeleteChange=%d flushUpdate", (uint8_t *)&v74, 0x12u);
      }

      [*(id *)(a1 + 40) flushUpdates:*(void *)(a1 + 48) accessory:*(void *)(a1 + 64)];
    }
    if (![*(id *)(a1 + 64) addUpdate:v2 library:*(void *)(a1 + 48)]) {
      goto LABEL_67;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v26 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v26 = &_os_log_internal;
      id v42 = &_os_log_internal;
    }
    uint64_t v33 = 1;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v43 = *(void *)(a1 + 48);
      uint64_t v44 = *(void *)(a1 + 56);
      uint64_t v45 = [*(id *)(a1 + 64) pendingAndWaitingConfirmUpdatesCountForLibrary:v43];
      int v46 = [*(id *)(a1 + 64) windowPerLibrary];
      int v74 = 138413058;
      uint64_t v75 = v43;
      __int16 v76 = 2112;
      uint64_t v77 = v44;
      __int16 v78 = 2048;
      *(void *)v79 = v45;
      *(_WORD *)&v79[8] = 1024;
      *(_DWORD *)&v79[10] = v46;
      uint64_t v33 = 1;
      _os_log_impl(&dword_22669E000, v26, OS_LOG_TYPE_INFO, "update:%@ revision=%@, full after addUpdate (%lu / %d)", (uint8_t *)&v74, 0x26u);
    }
  }

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v33;
LABEL_67:
  if (*(unsigned __int8 *)(a1 + 92) <= 0x63u
    && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != 1
    && ![*(id *)(a1 + 64) pendingUpdatesAndWaitingConfirmFullForLibrary:*(void *)(a1 + 48)])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v57 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      __int16 v57 = &_os_log_internal;
      id v66 = &_os_log_internal;
    }
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      uint64_t v67 = *(void *)(a1 + 48);
      uint64_t v68 = *(void *)(a1 + 56);
      int v69 = *(unsigned __int8 *)(a1 + 92);
      uint64_t v70 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      int v71 = [*(id *)(a1 + 64) pendingUpdatesAndWaitingConfirmFullForLibrary:v67];
      uint64_t v72 = [*(id *)(a1 + 64) pendingAndWaitingConfirmUpdatesCountForLibrary:*(void *)(a1 + 48)];
      int v73 = [*(id *)(a1 + 64) windowPerLibrary];
      int v74 = 138414082;
      uint64_t v75 = v67;
      __int16 v76 = 2112;
      uint64_t v77 = v68;
      __int16 v78 = 1024;
      *(_DWORD *)v79 = v69;
      *(_WORD *)&v79[4] = 1024;
      *(_DWORD *)&v79[6] = v3;
      *(_WORD *)&v79[10] = 2048;
      *(void *)&v79[12] = v70;
      *(_WORD *)&v79[20] = 1024;
      *(_DWORD *)&v79[22] = v71;
      *(_WORD *)&v79[26] = 2048;
      *(void *)&v79[28] = v72;
      *(_WORD *)&v79[36] = 1024;
      *(_DWORD *)&v79[38] = v73;
      _os_log_impl(&dword_22669E000, v57, OS_LOG_TYPE_INFO, "update:%@ revision=%@ progress=%u addDeleteChange=%d status=%ld, pendingUpdatesFull=%d (%lu/%d), Skip sending Update!", (uint8_t *)&v74, 0x42u);
    }
    goto LABEL_93;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v47 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint64_t v47 = &_os_log_internal;
    id v48 = &_os_log_internal;
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    uint64_t v49 = *(void *)(a1 + 48);
    uint64_t v50 = *(void *)(a1 + 56);
    int v51 = *(unsigned __int8 *)(a1 + 92);
    uint64_t v52 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    int v53 = [*(id *)(a1 + 64) pendingUpdatesAndWaitingConfirmFullForLibrary:v49];
    uint64_t v54 = [*(id *)(a1 + 64) pendingAndWaitingConfirmUpdatesCountForLibrary:*(void *)(a1 + 48)];
    int v55 = [*(id *)(a1 + 64) windowPerLibrary];
    int v74 = 138413826;
    uint64_t v75 = v49;
    __int16 v76 = 2112;
    uint64_t v77 = v50;
    __int16 v78 = 1024;
    *(_DWORD *)v79 = v51;
    *(_WORD *)&v79[4] = 2048;
    *(void *)&v79[6] = v52;
    *(_WORD *)&v79[14] = 1024;
    *(_DWORD *)&v79[16] = v53;
    *(_WORD *)&v79[20] = 2048;
    *(void *)&v79[22] = v54;
    *(_WORD *)&v79[30] = 1024;
    *(_DWORD *)&v79[32] = v55;
    _os_log_impl(&dword_22669E000, v47, OS_LOG_TYPE_INFO, "update:%@ revision=%@ progress=%u status=%ld, pendingUpdatesFull=%d (%lu/%d), Send Update!", (uint8_t *)&v74, 0x3Cu);
  }

  int v56 = [*(id *)(a1 + 40) remoteObject];

  if (v56)
  {
    __int16 v57 = [*(id *)(a1 + 64) copyPendingNonContentUpdatesToSendForLibrary:*(void *)(a1 + 48)];
    if (v57)
    {
      id v58 = [*(id *)(a1 + 40) remoteObject];
      uint64_t v59 = *(void *)(a1 + 48);
      id v60 = [*(id *)(a1 + 64) accessoryUID];
      [v58 update:v59 updates:v57 accessory:v60];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v58 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        id v58 = &_os_log_internal;
        id v61 = &_os_log_internal;
      }
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        uint64_t v62 = *(void *)(a1 + 48);
        uint64_t v63 = *(void *)(a1 + 56);
        uint64_t v64 = [*(id *)(a1 + 64) pendingAndWaitingConfirmUpdatesCountForLibrary:v62];
        int v65 = [*(id *)(a1 + 64) windowPerLibrary];
        int v74 = 138413058;
        uint64_t v75 = v62;
        __int16 v76 = 2112;
        uint64_t v77 = v63;
        __int16 v78 = 2048;
        *(void *)v79 = v64;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)&v79[10] = v65;
        _os_log_impl(&dword_22669E000, v58, OS_LOG_TYPE_INFO, "update:%@ revision=%@, No Pending Updates (%lu / %d), update not sent!!!", (uint8_t *)&v74, 0x26u);
      }
    }

LABEL_93:
  }
LABEL_94:
}

- (int64_t)update:(id)a3 revision:(id)a4 item:(id)a5 progress:(unsigned __int8)a6 accessory:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects < 1;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint64_t v18 = &_os_log_internal;
    id v17 = &_os_log_internal;
  }
  else
  {
    uint64_t v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 1024;
    int v26 = v8;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    _os_log_impl(&dword_22669E000, v18, OS_LOG_TYPE_INFO, "updateItem:%@ revision=%@ progress=%u item=%@ accessory=%@", buf, 0x30u);
  }

  int64_t v19 = -[ACCMediaLibraryProvider update:revision:persistentID:type:updateInfo:progress:accessory:](self, "update:revision:persistentID:type:updateInfo:progress:accessory:", v12, v13, [v14 persistentID], 1, v14, v8, v15);
  return v19;
}

- (int64_t)update:(id)a3 revision:(id)a4 playlist:(id)a5 progress:(unsigned __int8)a6 accessory:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects < 1;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint64_t v18 = &_os_log_internal;
    id v17 = &_os_log_internal;
  }
  else
  {
    uint64_t v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 1024;
    int v26 = v8;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    _os_log_impl(&dword_22669E000, v18, OS_LOG_TYPE_INFO, "updatePlaylist:%@ revision=%@ progress=%u playlist=%@ accessory=%@", buf, 0x30u);
  }

  int64_t v19 = -[ACCMediaLibraryProvider update:revision:persistentID:type:updateInfo:progress:accessory:](self, "update:revision:persistentID:type:updateInfo:progress:accessory:", v12, v13, [v14 persistentID], 2, v14, v8, v15);
  return v19;
}

- (int64_t)update:(id)a3 revision:(id)a4 deleteItem:(unint64_t)a5 progress:(unsigned __int8)a6 accessory:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v17 = &_os_log_internal;
    id v16 = &_os_log_internal;
  }
  else
  {
    id v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 1024;
    int v25 = v8;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 2112;
    id v29 = v14;
    _os_log_impl(&dword_22669E000, v17, OS_LOG_TYPE_INFO, "updateDeleteItem:%@ revision=%@ progress=%u persistentID=%llu accessory=%@", buf, 0x30u);
  }

  int64_t v18 = [(ACCMediaLibraryProvider *)self update:v12 revision:v13 persistentID:a5 type:3 updateInfo:0 progress:v8 accessory:v14];
  return v18;
}

- (int64_t)update:(id)a3 revision:(id)a4 deletePlaylist:(unint64_t)a5 progress:(unsigned __int8)a6 accessory:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v17 = &_os_log_internal;
    id v16 = &_os_log_internal;
  }
  else
  {
    id v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 1024;
    int v25 = v8;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 2112;
    id v29 = v14;
    _os_log_impl(&dword_22669E000, v17, OS_LOG_TYPE_INFO, "updateDeletePlaylist:%@ revision=%@ progress=%u persistentID=%llu accessory=%@", buf, 0x30u);
  }

  int64_t v18 = [(ACCMediaLibraryProvider *)self update:v12 revision:v13 persistentID:a5 type:4 updateInfo:0 progress:v8 accessory:v14];
  return v18;
}

- (int64_t)update:(id)a3 revision:(id)a4 progress:(unsigned __int8)a5 accessory:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 1;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    BOOL v15 = &_os_log_internal;
    id v14 = &_os_log_internal;
  }
  else
  {
    BOOL v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 1024;
    int v23 = v7;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl(&dword_22669E000, v15, OS_LOG_TYPE_INFO, "updateProgress:%@ revision=%@ progress=%u accessory=%@", buf, 0x26u);
  }

  int64_t v16 = [(ACCMediaLibraryProvider *)self update:v10 revision:v11 persistentID:0 type:0 updateInfo:0 progress:v7 accessory:v12];
  return v16;
}

- (void)flushUpdates:(id)a3 accessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
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
    id v10 = &_os_log_internal;
    id v9 = &_os_log_internal;
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "flushUpdates:%@ accessory=%@", buf, 0x16u);
  }

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ACCMediaLibraryProvider_flushUpdates_accessory___block_invoke;
  block[3] = &unk_2647ABA48;
  void block[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(processingQueue, block);
}

void __50__ACCMediaLibraryProvider_flushUpdates_accessory___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) remoteObject];

  if (v2)
  {
    BOOL v3 = (void *)[*(id *)(a1 + 40) copyPendingNonContentUpdatesToSendForLibrary:*(void *)(a1 + 48)];
    BOOL v4 = v3;
    if (v3 && [v3 count])
    {
      id v5 = [*(id *)(a1 + 32) remoteObject];
      uint64_t v6 = *(void *)(a1 + 48);
      id v7 = [*(id *)(a1 + 40) accessoryUID];
      [v5 update:v6 updates:v4 accessory:v7];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        id v5 = &_os_log_internal;
        id v8 = &_os_log_internal;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = [*(id *)(a1 + 40) pendingAndWaitingConfirmUpdatesCountForLibrary:v9];
        int v11 = [*(id *)(a1 + 40) windowPerLibrary];
        int v12 = 138412802;
        uint64_t v13 = v9;
        __int16 v14 = 2048;
        uint64_t v15 = v10;
        __int16 v16 = 1024;
        int v17 = v11;
        _os_log_impl(&dword_22669E000, v5, OS_LOG_TYPE_INFO, "update:%@, No Pending Updates (%lu / %d), update not sent!!!", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

- (int64_t)update:(id)a3 revision:(id)a4 content:(id)a5 accessory:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 3;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    __int16 v16 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  else
  {
    __int16 v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2112;
    id v42 = v13;
    _os_log_impl(&dword_22669E000, v16, OS_LOG_TYPE_INFO, "updateContent:%@ revision=%@ content=%@ accessory=%@", buf, 0x2Au);
  }

  processingQueue = self->_processingQueue;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __61__ACCMediaLibraryProvider_update_revision_content_accessory___block_invoke;
  v24[3] = &unk_2647ABD50;
  id v25 = v12;
  id v26 = v10;
  id v27 = v11;
  id v28 = v13;
  id v29 = self;
  uint64_t v30 = &v31;
  id v18 = v13;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  dispatch_sync(processingQueue, v24);
  int64_t v22 = v32[3];

  _Block_object_dispose(&v31, 8);
  return v22;
}

void __61__ACCMediaLibraryProvider_update_revision_content_accessory___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = (uint64_t *)(a1 + 32);
  BOOL v3 = (void *)[*(id *)(a1 + 32) copyDict];
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
    uint64_t v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    uint64_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __61__ACCMediaLibraryProvider_update_revision_content_accessory___block_invoke_cold_2((void *)a1, v2, v6);
  }

  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    if ([*(id *)(a1 + 56) addPlaylistContentUpdate:v3 library:*(void *)(a1 + 40)])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        id v7 = &_os_log_internal;
        id v8 = &_os_log_internal;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        uint64_t v11 = [*(id *)(a1 + 56) pendingAndWaitingConfirmUpdatesCountForLibrary:v9];
        int v12 = [*(id *)(a1 + 56) windowPerLibrary];
        int v13 = 138413058;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        __int16 v17 = 2048;
        uint64_t v18 = v11;
        __int16 v19 = 1024;
        int v20 = v12;
        _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "updateContent:%@ revision=%@, full after addPlaylistContentUpdate (%lu / %d)", (uint8_t *)&v13, 0x26u);
      }

      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    [*(id *)(a1 + 64) _checkPlaylistContentToSend:*(void *)(a1 + 40) accessory:*(void *)(a1 + 56)];
  }
}

- (void)resetUpdate:(id)a3 accessory:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_22669E000, v10, OS_LOG_TYPE_INFO, "resetUpdate:%@", buf, 0xCu);
  }

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ACCMediaLibraryProvider_resetUpdate_accessory___block_invoke;
  block[3] = &unk_2647ABA48;
  id v15 = v7;
  uint64_t v16 = self;
  id v17 = v6;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(processingQueue, block);
}

void __49__ACCMediaLibraryProvider_resetUpdate_accessory___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearAllUpdates];
  id v4 = [*(id *)(a1 + 40) remoteObject];
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v3 = [*(id *)(a1 + 32) accessoryUID];
  [v4 resetUpdate:v2 accessory:v3];
}

- (void)_checkPlaylistContentToSend:(id)a3 accessory:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
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
    -[ACCMediaLibraryProvider _checkPlaylistContentToSend:accessory:]((uint64_t)v6, (uint64_t)v7, v10);
  }

  uint64_t v11 = [v7 copyPendingPlaylistContentUpdatesToSendForLibrary:v6];
  if (v11)
  {
    id v13 = (void *)v11;
    uint64_t v14 = &_os_log_internal;
    *(void *)&long long v12 = 134218240;
    long long v27 = v12;
    do
    {
      id v15 = objc_msgSend(v13, "objectForKey:", @"ACCMediaLibraryUpdateRevisionKey", v27);
      uint64_t v16 = gLogObjects;
      int v17 = gNumLogObjects;
      if (gLogObjects) {
        BOOL v18 = gNumLogObjects < 1;
      }
      else {
        BOOL v18 = 1;
      }
      if (v18)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v27;
          uint64_t v29 = v16;
          __int16 v30 = 1024;
          LODWORD(v31) = v17;
          _os_log_error_impl(&dword_22669E000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v19 = v14;
        uint64_t v20 = v14;
      }
      else
      {
        uint64_t v20 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v29 = (uint64_t)v6;
        __int16 v30 = 2112;
        uint64_t v31 = v15;
        __int16 v32 = 2112;
        uint64_t v33 = v13;
        _os_log_debug_impl(&dword_22669E000, v20, OS_LOG_TYPE_DEBUG, "_checkPlaylistContentToSend:%@ itemRevision=%@ item=%@", buf, 0x20u);
      }

      uint64_t v21 = [(ACCMediaLibraryProvider *)self remoteObject];

      if (v21)
      {
        int64_t v22 = [(ACCMediaLibraryProvider *)self remoteObject];
        int v23 = [v7 accessoryUID];
        [v22 update:v6 revision:v15 content:v13 accessory:v23];
      }
      uint64_t v24 = [v7 copyPendingPlaylistContentUpdatesToSendForLibrary:v6];

      id v13 = (void *)v24;
    }
    while (v24);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v25 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      id v25 = &_os_log_internal;
      id v26 = &_os_log_internal;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v6;
      _os_log_impl(&dword_22669E000, v25, OS_LOG_TYPE_INFO, "_checkPlaylistContentToSend:%@ no pending playlistContentUpdates", buf, 0xCu);
    }
  }
}

- (ACCMediaLibraryProviderDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACCMediaLibraryProviderDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
}

- (OS_dispatch_queue)delegateQ
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateQ);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setDelegateQ:(id)a3
{
}

- (ACCMediaLibraryXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (NSMutableDictionary)libraries
{
  return self->_libraries;
}

- (void)setLibraries:(id)a3
{
}

- (int)lastUpdateType
{
  return self->_lastUpdateType;
}

- (void)setLastUpdateType:(int)a3
{
  self->_int lastUpdateType = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_destroyWeak((id *)&self->_delegateQ);
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __61__ACCMediaLibraryProvider_update_revision_content_accessory___block_invoke_cold_2(void *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *a2;
  uint64_t v6 = a1[7];
  int v7 = 138413058;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  _os_log_debug_impl(&dword_22669E000, log, OS_LOG_TYPE_DEBUG, "updateContent:%@ revision=%@ content=%@ accessory=%@", (uint8_t *)&v7, 0x2Au);
}

- (void)_checkPlaylistContentToSend:(os_log_t)log accessory:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_22669E000, log, OS_LOG_TYPE_DEBUG, "_checkPlaylistContentToSend:%@ accessory=%@", (uint8_t *)&v3, 0x16u);
}

@end