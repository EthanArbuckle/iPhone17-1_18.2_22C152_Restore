@interface FSModuleVolume
+ (id)volumeWithName:(id)a3 resource:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)reportAsLocal;
- (BOOL)spotlightIsEnabled;
- (BOOL)supportsAccessOps;
- (BOOL)supportsCloneOps;
- (BOOL)supportsKOIOOps;
- (BOOL)supportsLimitedXattrOps;
- (BOOL)supportsOpenCloseOps;
- (BOOL)supportsOpenUnlink;
- (BOOL)supportsPreallocateOps;
- (BOOL)supportsReadWriteOps;
- (BOOL)supportsVolumeRenameOps;
- (BOOL)supportsXattrOps;
- (FSItem)rootFSItem;
- (FSModuleExtension)ourExtension;
- (FSModuleVolume)initWithVolume:(id)a3 resource:(id)a4;
- (FSResource)resource;
- (FSVolumeOperations)volume;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)fileHandleToItemTable;
- (NSXPCListener)listener;
- (OS_dispatch_queue)fileHandleQueue;
- (id)getAndRemoveItemForFH:(id)a3;
- (id)getItemForFH:(id)a3;
- (id)stopUsingVolume;
- (int64_t)getMaxFileSizeInBits;
- (int64_t)getMaxXattrSizeInBits;
- (unsigned)newConnectionID:(id)a3;
- (void)fetchAndSetTypeForItem:(id)a3;
- (void)getMaxFileSizeInBits;
- (void)getMaxXattrSizeInBits;
- (void)insertIntoFHCache:(id)a3;
- (void)removeConnectionByID:(unsigned __int8)a3;
- (void)removeFromFHCache:(id)a3;
- (void)setFileHandleQueue:(id)a3;
- (void)setFileHandleToItemTable:(id)a3;
- (void)setOurExtension:(id)a3;
- (void)setResource:(id)a3;
- (void)setRootFSItem:(id)a3;
- (void)setVolume:(id)a3;
- (void)updateRootItem:(id)a3;
@end

@implementation FSModuleVolume

- (FSModuleVolume)initWithVolume:(id)a3 resource:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)FSModuleVolume;
  v9 = [(FSModuleVolume *)&v29 init];
  if (!v9) {
    goto LABEL_38;
  }
  uint64_t v10 = [MEMORY[0x263F08D88] anonymousListener];
  listener = v9->_listener;
  v9->_listener = (NSXPCListener *)v10;

  [(NSXPCListener *)v9->_listener setDelegate:v9];
  [(NSXPCListener *)v9->_listener resume];
  v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v9->_listener;
    *(_DWORD *)buf = 138412290;
    v31 = v13;
    _os_log_impl(&dword_24DDB2000, v12, OS_LOG_TYPE_DEFAULT, "Built listener %@", buf, 0xCu);
  }

  objc_storeStrong((id *)&v9->_volume, a3);
  objc_storeStrong((id *)&v9->_resource, a4);
  uint64_t v14 = objc_opt_new();
  connections = v9->_connections;
  v9->_connections = (NSMutableDictionary *)v14;

  uint64_t v16 = objc_opt_new();
  fileHandleToItemTable = v9->_fileHandleToItemTable;
  v9->_fileHandleToItemTable = (NSMutableDictionary *)v16;

  rootFSItem = v9->_rootFSItem;
  v9->_rootFSItem = 0;

  v9->connectionCount = 0;
  *(_WORD *)&v9->validConnections = 256;
  v9->_supportsKOIOOps = [v7 conformsToProtocol:&unk_270006550];
  v9->_supportsReadWriteOps = [v7 conformsToProtocol:&unk_2700065B0];
  v9->_supportsCloneOps = [v7 conformsToProtocol:&unk_270006610];
  int v19 = [v7 conformsToProtocol:&unk_270006670];
  char v20 = 0;
  if (v19)
  {
    if (objc_opt_respondsToSelector())
    {
      if (objc_opt_respondsToSelector()) {
        char v20 = [v7 areXattrOperationsInhibited] ^ 1;
      }
      else {
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 1;
    }
  }
  v9->_supportsXattrOps = v20;
  if (![v7 conformsToProtocol:&unk_2700066D0]) {
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v21 = 1;
    goto LABEL_16;
  }
  if (objc_opt_respondsToSelector()) {
    char v21 = [v7 isOpenCloseInhibited] ^ 1;
  }
  else {
LABEL_14:
  }
    char v21 = 0;
LABEL_16:
  v9->_supportsOpenCloseOps = v21;
  if (![v7 conformsToProtocol:&unk_270006730]) {
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v22 = 1;
    goto LABEL_22;
  }
  if (objc_opt_respondsToSelector()) {
    char v22 = [v7 isAccessCheckInhibited] ^ 1;
  }
  else {
LABEL_20:
  }
    char v22 = 0;
LABEL_22:
  v9->_supportsAccessOps = v22;
  if (![v7 conformsToProtocol:&unk_270006790]) {
    goto LABEL_26;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v23 = 1;
    goto LABEL_28;
  }
  if (objc_opt_respondsToSelector()) {
    char v23 = [v7 isVolumeRenameInhibited] ^ 1;
  }
  else {
LABEL_26:
  }
    char v23 = 0;
LABEL_28:
  v9->_supportsVolumeRenameOps = v23;
  if (![v7 conformsToProtocol:&unk_2700067F0]) {
    goto LABEL_32;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v24 = 1;
    goto LABEL_34;
  }
  if (objc_opt_respondsToSelector()) {
    char v24 = [v7 isPreallocateInhibited] ^ 1;
  }
  else {
LABEL_32:
  }
    char v24 = 0;
LABEL_34:
  v9->_supportsPreallocateOps = v24;
  if (v9->_supportsXattrOps) {
    char v25 = objc_opt_respondsToSelector();
  }
  else {
    char v25 = 0;
  }
  v9->_supportsLimitedXattrOps = v25 & 1;
  v9->_supportsOpenUnlink = 1;
  v9->_reportAsLocal = [v8 kind] != 3;
  dispatch_queue_t v26 = dispatch_queue_create("FSModuleVolumeFileHandleQueue", 0);
  fileHandleQueue = v9->_fileHandleQueue;
  v9->_fileHandleQueue = (OS_dispatch_queue *)v26;

LABEL_38:
  return v9;
}

+ (id)volumeWithName:(id)a3 resource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithVolume:v7 resource:v6];

  return v8;
}

- (void)updateRootItem:(id)a3
{
  v4 = (FSItem *)a3;
  uint64_t v5 = [(FSModuleVolume *)self resource];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(FSModuleVolume *)self resource];
    uint64_t v8 = [v7 kind];

    if (v8 == 1)
    {
      v9 = [(FSModuleVolume *)self resource];
      uint64_t v10 = +[FSResource dynamicCast:v9];

      v11 = [v10 startUsingResource:@"activateVolume"];
      if (v11) {
        self->_supportsKOIOOps = 0;
      }
    }
  }
  rootFSItem = self->_rootFSItem;
  self->_rootFSItem = v4;
  v13 = v4;

  [(FSModuleVolume *)self fetchAndSetTypeForItem:self->_rootFSItem];
  [(FSModuleVolume *)self insertIntoFHCache:self->_rootFSItem];
}

- (id)stopUsingVolume
{
  uint64_t v3 = [(FSModuleVolume *)self resource];
  if (v3
    && (v4 = (void *)v3,
        [(FSModuleVolume *)self resource],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 kind],
        v5,
        v4,
        v6 == 1))
  {
    id v7 = [(FSModuleVolume *)self resource];
    uint64_t v8 = +[FSResource dynamicCast:v7];

    v9 = [v8 stopUsingResource:@"activateVolume"];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unsigned)newConnectionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  int connectionCount = v5->connectionCount;
  if (connectionCount <= 7)
  {
    int v8 = 0;
    v5->int connectionCount = connectionCount + 1;
    int validConnections = v5->validConnections;
    do
    {
      int v7 = 1 << v8;
      BOOL v10 = ((1 << v8) & validConnections) == 0 || v8 == 7;
      ++v8;
    }
    while (!v10);
    v5->int validConnections = validConnections | v7;
    connections = v5->_connections;
    v12 = [NSNumber numberWithUnsignedLongLong:v7];
    [(NSMutableDictionary *)connections setObject:v4 forKey:v12];
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)removeConnectionByID:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->validConnections &= ~(_BYTE)v3;
  connections = obj->_connections;
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:v3];
  [(NSMutableDictionary *)connections removeObjectForKey:v5];

  --obj->connectionCount;
  objc_sync_exit(obj);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = fskit_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[FSModuleVolume listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_24DDB2000, v6, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  int v7 = [(FSModuleVolume *)self newConnectionID:v5];
  if (v7)
  {
    int v8 = +[FSKitConstants FSVolumeXPCProtocol];
    [v5 setExportedInterface:v8];

    v9 = +[FSVolumeConnector volumeConnectorModuleVolume:self connection:v5];
    [v5 setExportedObject:v9];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__FSModuleVolume_listener_shouldAcceptNewConnection___block_invoke;
    v14[3] = &unk_26530B9E0;
    v14[4] = self;
    char v15 = v7;
    BOOL v10 = _Block_copy(v14);
    [v5 setInvalidationHandler:v10];
    [v5 setInterruptionHandler:v10];
    [v5 resume];
    v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[FSModuleVolume listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_24DDB2000, v11, OS_LOG_TYPE_DEFAULT, "%s:accepted", buf, 0xCu);
    }
  }
  else
  {
    v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[FSModuleVolume listener:shouldAcceptNewConnection:](v12);
    }

    [v5 invalidate];
  }

  return v7 != 0;
}

uint64_t __53__FSModuleVolume_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeConnectionByID:*(unsigned __int8 *)(a1 + 40)];
}

- (id)getItemForFH:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  fileHandleQueue = self->_fileHandleQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__FSModuleVolume_getItemForFH___block_invoke;
  block[3] = &unk_26530BA08;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(fileHandleQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __31__FSModuleVolume_getItemForFH___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)insertIntoFHCache:(id)a3
{
  id v4 = a3;
  fileHandleQueue = self->_fileHandleQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__FSModuleVolume_insertIntoFHCache___block_invoke;
  v7[3] = &unk_26530BA30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(fileHandleQueue, v7);
}

void __36__FSModuleVolume_insertIntoFHCache___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = [v1 fileHandle];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

- (void)removeFromFHCache:(id)a3
{
  id v4 = a3;
  fileHandleQueue = self->_fileHandleQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__FSModuleVolume_removeFromFHCache___block_invoke;
  v7[3] = &unk_26530BA30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(fileHandleQueue, v7);
}

void __36__FSModuleVolume_removeFromFHCache___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 56);
  id v2 = [*(id *)(a1 + 40) fileHandle];
  [v1 removeObjectForKey:v2];
}

- (id)getAndRemoveItemForFH:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  fileHandleQueue = self->_fileHandleQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__FSModuleVolume_getAndRemoveItemForFH___block_invoke;
  block[3] = &unk_26530BA08;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(fileHandleQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __40__FSModuleVolume_getAndRemoveItemForFH___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 56);
  return [v6 removeObjectForKey:v5];
}

- (int64_t)getMaxFileSizeInBits
{
  char v3 = objc_opt_respondsToSelector();
  volume = self->_volume;
  if (v3)
  {
    return [(FSVolumeOperations *)volume maximumFileSizeInBits];
  }
  else if (objc_opt_respondsToSelector())
  {
    return (uint64_t)(ceil(log2((double)([(FSVolumeOperations *)self->_volume maximumFileSize] + 1)))
                   + 1.0);
  }
  else
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(FSModuleVolume *)v6 getMaxFileSizeInBits];
    }

    return 0;
  }
}

- (int64_t)getMaxXattrSizeInBits
{
  char v3 = objc_opt_respondsToSelector();
  volume = self->_volume;
  if (v3)
  {
    return [(FSVolumeOperations *)volume maximumXattrSizeInBits];
  }
  else if (objc_opt_respondsToSelector())
  {
    return (uint64_t)(ceil(log2((double)([(FSVolumeOperations *)self->_volume maximumXattrSize] + 1)))
                   + 1.0);
  }
  else
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(FSModuleVolume *)v6 getMaxXattrSizeInBits];
    }

    return 0;
  }
}

- (void)fetchAndSetTypeForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  volume = self->_volume;
  uint64_t v7 = [[FSItemGetAttributesRequest alloc] initWithWantedLIAttributes:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__FSModuleVolume_fetchAndSetTypeForItem___block_invoke;
  v10[3] = &unk_26530BA58;
  id v11 = v4;
  uint64_t v12 = v5;
  uint64_t v8 = v5;
  id v9 = v4;
  [(FSVolumeOperations *)volume getAttributes:v7 ofItem:v9 replyHandler:v10];

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

void __41__FSModuleVolume_fetchAndSetTypeForItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__FSModuleVolume_fetchAndSetTypeForItem___block_invoke_cold_1(v5);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setType:", objc_msgSend(a2, "type"));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (FSModuleExtension)ourExtension
{
  return (FSModuleExtension *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOurExtension:(id)a3
{
}

- (FSVolumeOperations)volume
{
  return (FSVolumeOperations *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVolume:(id)a3
{
}

- (FSItem)rootFSItem
{
  return (FSItem *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRootFSItem:(id)a3
{
}

- (NSMutableDictionary)fileHandleToItemTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFileHandleToItemTable:(id)a3
{
}

- (OS_dispatch_queue)fileHandleQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFileHandleQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 72, 1);
}

- (FSResource)resource
{
  return (FSResource *)objc_getProperty(self, a2, 80, 1);
}

- (void)setResource:(id)a3
{
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)spotlightIsEnabled
{
  return self->_spotlightIsEnabled;
}

- (BOOL)supportsKOIOOps
{
  return self->_supportsKOIOOps;
}

- (BOOL)supportsAccessOps
{
  return self->_supportsAccessOps;
}

- (BOOL)supportsOpenCloseOps
{
  return self->_supportsOpenCloseOps;
}

- (BOOL)supportsReadWriteOps
{
  return self->_supportsReadWriteOps;
}

- (BOOL)supportsXattrOps
{
  return self->_supportsXattrOps;
}

- (BOOL)supportsLimitedXattrOps
{
  return self->_supportsLimitedXattrOps;
}

- (BOOL)supportsCloneOps
{
  return self->_supportsCloneOps;
}

- (BOOL)supportsPreallocateOps
{
  return self->_supportsPreallocateOps;
}

- (BOOL)supportsVolumeRenameOps
{
  return self->_supportsVolumeRenameOps;
}

- (BOOL)supportsOpenUnlink
{
  return self->_supportsOpenUnlink;
}

- (BOOL)reportAsLocal
{
  return self->_reportAsLocal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_fileHandleQueue, 0);
  objc_storeStrong((id *)&self->_fileHandleToItemTable, 0);
  objc_storeStrong((id *)&self->_rootFSItem, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_ourExtension, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[FSModuleVolume listener:shouldAcceptNewConnection:]";
  _os_log_fault_impl(&dword_24DDB2000, log, OS_LOG_TYPE_FAULT, "%s: rejected, can't add new connection to volume (too many clients)", (uint8_t *)&v1, 0xCu);
}

- (void)getMaxFileSizeInBits
{
}

- (void)getMaxXattrSizeInBits
{
}

void __41__FSModuleVolume_fetchAndSetTypeForItem___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13_0(&dword_24DDB2000, v1, v2, "%s:reply:error:%d", v3, v4, v5, v6, 2u);
}

@end