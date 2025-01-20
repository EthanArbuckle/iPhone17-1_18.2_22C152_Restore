@interface ACCMediaLibraryAccessory
- (ACCMediaLibraryAccessory)initWithUID:(id)a3 windowPerLibrary:(unsigned int)a4 provider:(id)a5;
- (ACCMediaLibraryProvider)provider;
- (BOOL)_pendingUpdatesAndWaitingConfirmFullForLibrary:(id)a3;
- (BOOL)addPlaylistContentUpdate:(id)a3 library:(id)a4;
- (BOOL)addUpdate:(id)a3 library:(id)a4;
- (BOOL)pendingUpdatesAndWaitingConfirmFullForLibrary:(id)a3;
- (NSMutableDictionary)confirmedRevisionList;
- (NSMutableDictionary)libraries;
- (NSMutableDictionary)pendingPlaylistContentUpdates;
- (NSMutableDictionary)pendingUpdates;
- (NSMutableDictionary)waitingConfirm;
- (NSString)accessoryUID;
- (OS_dispatch_queue)listQueue;
- (id)_confirmedRevisionListForLibrary:(id)a3 createIfNotExist:(BOOL)a4;
- (id)_pendingPlaylistContentUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4;
- (id)_pendingUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4;
- (id)_waitingUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4;
- (id)confirmUpdates:(id)a3 revision:(id)a4 count:(unsigned int)a5;
- (id)copyPendingNonContentUpdatesToSendForLibrary:(id)a3;
- (id)copyPendingPlaylistContentUpdatesToSendForLibrary:(id)a3;
- (id)description;
- (unint64_t)_pendingAndWaitingConfirmUpdatesCountForLibrary:(id)a3;
- (unint64_t)_pendingPlaylistContentUpdatesCountForLibrary:(id)a3;
- (unint64_t)pendingAndWaitingConfirmUpdatesCountForLibrary:(id)a3;
- (unint64_t)pendingPlaylistContentUpdatesCountForLibrary:(id)a3;
- (unsigned)windowPerLibrary;
- (void)_addConfirmedRevisionForLibrary:(id)a3 revision:(id)a4;
- (void)_addConfirmedRevisionForLibrary:(id)a3 revisionsToAdd:(id)a4;
- (void)_addToWaitlistForLibrary:(id)a3 item:(id)a4;
- (void)_addToWaitlistForLibrary:(id)a3 list:(id)a4;
- (void)_confirmedRevisionListRemoveLibraryIfEmpty:(id)a3;
- (void)_pendingPlaylistContentUpdatesRemoveLibraryIfEmpty:(id)a3;
- (void)_pendingUpdatesRemoveLibraryIfEmpty:(id)a3;
- (void)_waitingUpdatesRemoveLibraryIfEmpty:(id)a3;
- (void)addLibraryInfo:(id)a3;
- (void)clearAllUpdates;
- (void)clearAllUpdatesForLibrary:(id)a3;
- (void)confirmPlaylistContentUpdates:(id)a3 revision:(id)a4;
- (void)dealloc;
- (void)setConfirmedRevisionList:(id)a3;
- (void)setPendingPlaylistContentUpdates:(id)a3;
- (void)setPendingUpdates:(id)a3;
- (void)setWaitingConfirm:(id)a3;
- (void)setWindowPerLibrary:(unsigned int)a3;
@end

@implementation ACCMediaLibraryAccessory

- (ACCMediaLibraryAccessory)initWithUID:(id)a3 windowPerLibrary:(unsigned int)a4 provider:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)ACCMediaLibraryAccessory;
  v11 = [(ACCMediaLibraryAccessory *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessoryUID, a3);
    objc_storeWeak((id *)&v12->_provider, v10);
    v12->_windowPerLibrary = a4;
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.accMediaLibraryAccessory.listQueue", 0);
    listQueue = v12->_listQueue;
    v12->_listQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingUpdates = v12->_pendingUpdates;
    v12->_pendingUpdates = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    waitingConfirm = v12->_waitingConfirm;
    v12->_waitingConfirm = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingPlaylistContentUpdates = v12->_pendingPlaylistContentUpdates;
    v12->_pendingPlaylistContentUpdates = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    libraries = v12->_libraries;
    v12->_libraries = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    confirmedRevisionList = v12->_confirmedRevisionList;
    v12->_confirmedRevisionList = v23;
  }
  return v12;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  objc_storeWeak((id *)&self->_provider, 0);
  listQueue = self->_listQueue;
  self->_listQueue = 0;

  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  waitingConfirm = self->_waitingConfirm;
  self->_waitingConfirm = 0;

  pendingPlaylistContentUpdates = self->_pendingPlaylistContentUpdates;
  self->_pendingPlaylistContentUpdates = 0;

  libraries = self->_libraries;
  self->_libraries = 0;

  confirmedRevisionList = self->_confirmedRevisionList;
  self->_confirmedRevisionList = 0;

  v10.receiver = self;
  v10.super_class = (Class)ACCMediaLibraryAccessory;
  [(ACCMediaLibraryAccessory *)&v10 dealloc];
}

- (id)description
{
  v2 = NSString;
  accessoryUID = self->_accessoryUID;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v5 = [v2 stringWithFormat:@"<ACCMediaLibraryAccessory>[%@ provider=%@]", accessoryUID, WeakRetained];

  return v5;
}

- (void)addLibraryInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = [v4 libraryUID];

    id v4 = v8;
    if (v5)
    {
      libraries = self->_libraries;
      v7 = [v8 libraryUID];
      [(NSMutableDictionary *)libraries setObject:v8 forKey:v7];

      id v4 = v8;
    }
  }
}

- (unint64_t)_pendingAndWaitingConfirmUpdatesCountForLibrary:(id)a3
{
  id v4 = a3;
  v5 = [(ACCMediaLibraryAccessory *)self _pendingUpdatesForLibrary:v4 createIfNotExist:0];
  v6 = [(NSMutableDictionary *)self->_waitingConfirm objectForKey:v4];

  uint64_t v7 = [v5 count];
  unint64_t v8 = [v6 count] + v7;

  return v8;
}

- (unint64_t)pendingAndWaitingConfirmUpdatesCountForLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_queue_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__ACCMediaLibraryAccessory_pendingAndWaitingConfirmUpdatesCountForLibrary___block_invoke;
  block[3] = &unk_2647AB9F8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(listQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __75__ACCMediaLibraryAccessory_pendingAndWaitingConfirmUpdatesCountForLibrary___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _pendingAndWaitingConfirmUpdatesCountForLibrary:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)_pendingPlaylistContentUpdatesCountForLibrary:(id)a3
{
  v3 = [(ACCMediaLibraryAccessory *)self _pendingPlaylistContentUpdatesForLibrary:a3 createIfNotExist:0];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)pendingPlaylistContentUpdatesCountForLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_queue_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ACCMediaLibraryAccessory_pendingPlaylistContentUpdatesCountForLibrary___block_invoke;
  block[3] = &unk_2647AB9F8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(listQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __73__ACCMediaLibraryAccessory_pendingPlaylistContentUpdatesCountForLibrary___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _pendingPlaylistContentUpdatesCountForLibrary:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_pendingUpdatesAndWaitingConfirmFullForLibrary:(id)a3
{
  return [(ACCMediaLibraryAccessory *)self _pendingAndWaitingConfirmUpdatesCountForLibrary:a3] >= self->_windowPerLibrary;
}

- (BOOL)pendingUpdatesAndWaitingConfirmFullForLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ACCMediaLibraryAccessory_pendingUpdatesAndWaitingConfirmFullForLibrary___block_invoke;
  block[3] = &unk_2647AB9F8;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(listQueue, block);
  LOBYTE(listQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)listQueue;
}

uint64_t __74__ACCMediaLibraryAccessory_pendingUpdatesAndWaitingConfirmFullForLibrary___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _pendingUpdatesAndWaitingConfirmFullForLibrary:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_pendingUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_pendingUpdates objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(NSMutableDictionary *)self->_pendingUpdates setObject:v7 forKey:v6];
  }

  return v7;
}

- (id)_waitingUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_waitingConfirm objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(NSMutableDictionary *)self->_waitingConfirm setObject:v7 forKey:v6];
  }

  return v7;
}

- (id)_pendingPlaylistContentUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_pendingPlaylistContentUpdates objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(NSMutableDictionary *)self->_pendingPlaylistContentUpdates setObject:v7 forKey:v6];
  }

  return v7;
}

- (id)_confirmedRevisionListForLibrary:(id)a3 createIfNotExist:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_confirmedRevisionList objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(NSMutableDictionary *)self->_confirmedRevisionList setObject:v7 forKey:v6];
  }

  return v7;
}

- (void)_pendingUpdatesRemoveLibraryIfEmpty:(id)a3
{
  id v5 = a3;
  BOOL v4 = -[NSMutableDictionary objectForKey:](self->_pendingUpdates, "objectForKey:");
  if (!v4 && ![0 count]) {
    [(NSMutableDictionary *)self->_pendingUpdates removeObjectForKey:v5];
  }
}

- (void)_waitingUpdatesRemoveLibraryIfEmpty:(id)a3
{
  id v5 = a3;
  BOOL v4 = -[NSMutableDictionary objectForKey:](self->_waitingConfirm, "objectForKey:");
  if (!v4 && ![0 count]) {
    [(NSMutableDictionary *)self->_waitingConfirm removeObjectForKey:v5];
  }
}

- (void)_pendingPlaylistContentUpdatesRemoveLibraryIfEmpty:(id)a3
{
  id v5 = a3;
  BOOL v4 = -[NSMutableDictionary objectForKey:](self->_pendingPlaylistContentUpdates, "objectForKey:");
  if (!v4 && ![0 count]) {
    [(NSMutableDictionary *)self->_pendingPlaylistContentUpdates removeObjectForKey:v5];
  }
}

- (void)_confirmedRevisionListRemoveLibraryIfEmpty:(id)a3
{
  id v5 = a3;
  BOOL v4 = -[NSMutableDictionary objectForKey:](self->_confirmedRevisionList, "objectForKey:");
  if (!v4 && ![0 count]) {
    [(NSMutableDictionary *)self->_confirmedRevisionList removeObjectForKey:v5];
  }
}

- (void)_addToWaitlistForLibrary:(id)a3 item:(id)a4
{
  id v6 = a4;
  id v7 = [(ACCMediaLibraryAccessory *)self _waitingUpdatesForLibrary:a3 createIfNotExist:1];
  [v7 addObject:v6];
}

- (void)_addToWaitlistForLibrary:(id)a3 list:(id)a4
{
  id v6 = a4;
  id v7 = [(ACCMediaLibraryAccessory *)self _waitingUpdatesForLibrary:a3 createIfNotExist:1];
  [v7 addObjectsFromArray:v6];
}

- (void)_addConfirmedRevisionForLibrary:(id)a3 revision:(id)a4
{
  id v6 = a4;
  id v7 = [(ACCMediaLibraryAccessory *)self _confirmedRevisionListForLibrary:a3 createIfNotExist:1];
  [v7 addObject:v6];
}

- (void)_addConfirmedRevisionForLibrary:(id)a3 revisionsToAdd:(id)a4
{
  id v6 = a4;
  id v7 = [(ACCMediaLibraryAccessory *)self _confirmedRevisionListForLibrary:a3 createIfNotExist:1];
  [v7 unionSet:v6];
}

- (id)copyPendingNonContentUpdatesToSendForLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ACCMediaLibraryAccessory_copyPendingNonContentUpdatesToSendForLibrary___block_invoke;
  block[3] = &unk_2647ABA20;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(listQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __73__ACCMediaLibraryAccessory_copyPendingNonContentUpdatesToSendForLibrary___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _pendingUpdatesForLibrary:*(void *)(a1 + 40) createIfNotExist:0];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "item", (void)v13);
          [v11 addObject:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [*(id *)(a1 + 32) _addToWaitlistForLibrary:*(void *)(a1 + 40) list:v6];
    [v6 removeAllObjects];
    [*(id *)(a1 + 32) _pendingUpdatesRemoveLibraryIfEmpty:*(void *)(a1 + 40)];
  }
}

- (id)copyPendingPlaylistContentUpdatesToSendForLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__ACCMediaLibraryAccessory_copyPendingPlaylistContentUpdatesToSendForLibrary___block_invoke;
  block[3] = &unk_2647ABA20;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = &v13;
  dispatch_sync(listQueue, block);
  uint64_t v7 = (void *)v14[5];
  if (v7)
  {
    uint64_t v8 = [v7 item];
  }
  else
  {
    uint64_t v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __78__ACCMediaLibraryAccessory_copyPendingPlaylistContentUpdatesToSendForLibrary___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _pendingPlaylistContentUpdatesForLibrary:*(void *)(a1 + 40) createIfNotExist:0];
  uint64_t v49 = a1;
  id v3 = [*(id *)(a1 + 32) _confirmedRevisionListForLibrary:*(void *)(a1 + 40) createIfNotExist:0];
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v36 = *(void *)(a1 + 40);
    uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412802;
    uint64_t v63 = v37;
    __int16 v64 = 2112;
    uint64_t v65 = v36;
    __int16 v66 = 2112;
    v67 = v2;
    _os_log_debug_impl(&dword_22669E000, v6, OS_LOG_TYPE_DEBUG, "copyPendingPlaylistContentUpdatesToSendForLibrary: %@, library %@, pendlist=%@", buf, 0x20u);
  }

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
    id v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v38 = *(void *)(a1 + 40);
    uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412802;
    uint64_t v63 = v39;
    __int16 v64 = 2112;
    uint64_t v65 = v38;
    __int16 v66 = 2112;
    v67 = v3;
    _os_log_debug_impl(&dword_22669E000, v7, OS_LOG_TYPE_DEBUG, "copyPendingPlaylistContentUpdatesToSendForLibrary: %@, library %@, revisionList=%@", buf, 0x20u);
  }

  if (v2 && v3)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v44 = v3;
    id obj = v3;
    uint64_t v48 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v48)
    {
      uint64_t v10 = 0;
      uint64_t v47 = *(void *)v57;
      id v11 = &_os_log_internal;
      *(void *)&long long v9 = 134218240;
      long long v43 = v9;
      v46 = v2;
LABEL_23:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v57 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
        uint64_t v14 = gLogObjects;
        int v15 = gNumLogObjects;
        if (!gLogObjects || gNumLogObjects < 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v43;
            uint64_t v63 = v14;
            __int16 v64 = 1024;
            LODWORD(v65) = v15;
            _os_log_error_impl(&dword_22669E000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v17 = v11;
          id v18 = v11;
        }
        else
        {
          id v18 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v31 = *(void *)(v49 + 40);
          uint64_t v32 = *(void *)(*(void *)(v49 + 32) + 16);
          *(_DWORD *)buf = 138412802;
          uint64_t v63 = v32;
          __int16 v64 = 2112;
          uint64_t v65 = v31;
          __int16 v66 = 2112;
          v67 = v13;
          _os_log_debug_impl(&dword_22669E000, v18, OS_LOG_TYPE_DEBUG, "copyPendingPlaylistContentUpdatesToSendForLibrary: %@, library %@, check for revision %@", buf, 0x20u);
        }

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v19 = v2;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          v50 = v10;
          unint64_t v22 = 0;
          uint64_t v23 = *(void *)v53;
          while (2)
          {
            uint64_t v24 = 0;
            unint64_t v51 = v22 + v21;
            do
            {
              if (*(void *)v53 != v23) {
                objc_enumerationMutation(v19);
              }
              v25 = *(void **)(*((void *)&v52 + 1) + 8 * v24);
              objc_super v26 = objc_msgSend(v25, "revision", v43);
              int v27 = [v26 isEqualToString:v13];

              if (v27)
              {
                uint64_t v28 = v49;
                objc_storeStrong((id *)(*(void *)(*(void *)(v49 + 48) + 8) + 40), v25);
                id v30 = v13;

                unint64_t v29 = v22 + v24;
                uint64_t v10 = v30;
                v2 = v46;
                id v11 = &_os_log_internal;
                goto LABEL_47;
              }
              ++v24;
            }
            while (v21 != v24);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v60 count:16];
            unint64_t v22 = v51;
            if (v21) {
              continue;
            }
            break;
          }
          v2 = v46;
          uint64_t v28 = v49;
          uint64_t v10 = v50;
          id v11 = &_os_log_internal;
          unint64_t v29 = v51;
        }
        else
        {
          unint64_t v29 = 0;
          uint64_t v28 = v49;
        }
LABEL_47:

        if (*(void *)(*(void *)(*(void *)(v28 + 48) + 8) + 40)) {
          break;
        }
        if (++v12 == v48)
        {
          uint64_t v48 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
          if (v48) {
            goto LABEL_23;
          }
          break;
        }
      }
    }
    else
    {
      unint64_t v29 = 0;
      uint64_t v10 = 0;
      uint64_t v28 = a1;
    }

    uint64_t v33 = *(void *)(*(void *)(*(void *)(v28 + 48) + 8) + 40);
    id v3 = v44;
    if (v33)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v34 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        v34 = &_os_log_internal;
        id v35 = &_os_log_internal;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v40 = *(void *)(v49 + 40);
        uint64_t v41 = *(void *)(*(void *)(v49 + 32) + 16);
        v42 = *(void **)(*(void *)(*(void *)(v49 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v63 = v41;
        __int16 v64 = 2112;
        uint64_t v65 = v40;
        __int16 v66 = 2112;
        v67 = v42;
        _os_log_debug_impl(&dword_22669E000, v34, OS_LOG_TYPE_DEBUG, "copyPendingPlaylistContentUpdatesToSendForLibrary: %@, library %@, found %@", buf, 0x20u);
      }

      if (v29 < [v2 count]) {
        [v2 removeObjectAtIndex:v29];
      }
      if (v10) {
        [obj removeObject:v10];
      }
      objc_msgSend(*(id *)(v49 + 32), "_pendingPlaylistContentUpdatesRemoveLibraryIfEmpty:", *(void *)(v49 + 40), v43);
      [*(id *)(v49 + 32) _confirmedRevisionListRemoveLibraryIfEmpty:*(void *)(v49 + 40)];
    }
  }
}

- (BOOL)addUpdate:(id)a3 library:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    accessoryUID = self->_accessoryUID;
    *(_DWORD *)buf = 138412802;
    unint64_t v22 = accessoryUID;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_debug_impl(&dword_22669E000, v10, OS_LOG_TYPE_DEBUG, "addUpdate: %@, library %@, updateDict=%@", buf, 0x20u);
  }

  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ACCMediaLibraryAccessory_addUpdate_library___block_invoke;
  block[3] = &unk_2647ABA48;
  id v12 = v7;
  id v18 = v12;
  id v19 = self;
  id v20 = v6;
  id v13 = v6;
  dispatch_sync(listQueue, block);
  if (v12) {
    BOOL v14 = [(ACCMediaLibraryAccessory *)self pendingUpdatesAndWaitingConfirmFullForLibrary:v12];
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

void __46__ACCMediaLibraryAccessory_addUpdate_library___block_invoke(uint64_t a1)
{
  v2 = (void *)(a1 + 32);
  if (*(void *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "_pendingUpdatesAndWaitingConfirmFullForLibrary:") & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 48) objectForKey:@"ACCMediaLibraryUpdateRevisionKey"];
    id v6 = [*(id *)(a1 + 40) _pendingUpdatesForLibrary:*(void *)(a1 + 32) createIfNotExist:1];
    id v7 = [[_ACCMediaLibraryAccessoryPendingUpdateItem alloc] initWithLibrary:*(void *)(a1 + 32) revision:v8 type:0 item:*(void *)(a1 + 48)];
    [v6 addObject:v7];
  }
  else
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
      id v5 = &_os_log_internal;
      id v4 = &_os_log_internal;
    }
    else
    {
      id v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ACCMediaLibraryAccessory_addUpdate_library___block_invoke_cold_1(a1, v2, v5);
    }
  }
}

- (BOOL)addPlaylistContentUpdate:(id)a3 library:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    accessoryUID = self->_accessoryUID;
    *(_DWORD *)buf = 138412802;
    id v19 = accessoryUID;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_debug_impl(&dword_22669E000, v10, OS_LOG_TYPE_DEBUG, "addPlaylistContentUpdate: %@, library %@, updateDict=%@", buf, 0x20u);
  }

  listQueue = self->_listQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__ACCMediaLibraryAccessory_addPlaylistContentUpdate_library___block_invoke;
  v15[3] = &unk_2647ABA70;
  id v16 = v6;
  id v17 = self;
  id v12 = v6;
  dispatch_sync(listQueue, v15);

  return 0;
}

void __61__ACCMediaLibraryAccessory_addPlaylistContentUpdate_library___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) objectForKey:@"ACCMediaLibraryUIDKey"];
  v2 = [*(id *)(a1 + 32) objectForKey:@"ACCMediaLibraryUpdateRevisionKey"];
  BOOL v3 = [*(id *)(a1 + 40) _pendingPlaylistContentUpdatesForLibrary:v5 createIfNotExist:1];
  id v4 = [[_ACCMediaLibraryAccessoryPendingUpdateItem alloc] initWithLibrary:v5 revision:v2 type:1 item:*(void *)(a1 + 32)];
  [v3 addObject:v4];
}

- (id)confirmUpdates:(id)a3 revision:(id)a4 count:(unsigned int)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
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
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    accessoryUID = self->_accessoryUID;
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = accessoryUID;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    __int16 v25 = v9;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = a5;
    HIWORD(v26) = 2048;
    id v27 = [(ACCMediaLibraryAccessory *)self pendingAndWaitingConfirmUpdatesCountForLibrary:v8];
    _os_log_debug_impl(&dword_22669E000, v12, OS_LOG_TYPE_DEBUG, "confirmUpdates: %@, library %@, revision %@, updateCount %u, pendingUpdatesCount=%lu", buf, 0x30u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ACCMediaLibraryAccessory_confirmUpdates_revision_count___block_invoke;
  block[3] = &unk_2647ABA98;
  void block[4] = self;
  id v14 = v8;
  id v20 = v14;
  __int16 v22 = buf;
  int v15 = v9;
  id v21 = v15;
  unsigned int v23 = a5;
  dispatch_sync(listQueue, block);
  id v16 = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)&buf[8] + 40)];

  _Block_object_dispose(buf, 8);

  return v16;
}

void __58__ACCMediaLibraryAccessory_confirmUpdates_revision_count___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v88 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _waitingUpdatesForLibrary:*(void *)(a1 + 40) createIfNotExist:0];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  unint64_t v4 = 0x268141000uLL;
  unint64_t v5 = 0x268141000uLL;
  if (!v2) {
    goto LABEL_58;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = *(void *)(*(void *)(v1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(v1 + 48))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v42 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v42 = &_os_log_internal;
      id v43 = &_os_log_internal;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = *(void *)(v1 + 40);
      v45 = *(id **)(*(void *)(v1 + 32) + 16);
      *(_DWORD *)buf = 138412546;
      v76 = v45;
      __int16 v77 = 2112;
      uint64_t v78 = v44;
      _os_log_impl(&dword_22669E000, v42, OS_LOG_TYPE_DEFAULT, "confirmUpdates: %@, library %@, WARNING!!! no revision specified so using updateCount only!", buf, 0x16u);
    }

    unint64_t v41 = *(unsigned int *)(v1 + 64);
    goto LABEL_46;
  }
  __int16 v64 = v2;
  uint64_t v65 = v3;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v9 = v2;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v71 objects:v87 count:16];
  if (!v10)
  {
    unint64_t v41 = 0;
    goto LABEL_39;
  }
  unint64_t v12 = 0;
  uint64_t v13 = *(void *)v72;
  *(void *)&long long v11 = 134218240;
  long long v61 = v11;
  id v66 = v9;
  while (2)
  {
    uint64_t v14 = 0;
    unint64_t v62 = v12 + v10;
    unint64_t v63 = v12;
    uint64_t v68 = v10;
    do
    {
      if (*(void *)v72 != v13) {
        objc_enumerationMutation(v9);
      }
      int v15 = *(void **)(*((void *)&v71 + 1) + 8 * v14);
      id v16 = *(void **)(*(void *)(*(void *)(v1 + 56) + 8) + 40);
      id v17 = objc_msgSend(v15, "item", v61);
      [v16 addObject:v17];

      id v18 = [v15 item];
      id v19 = [v18 objectForKey:@"ACCMediaLibraryUpdateTypeKey"];

      v70 = v19;
      if ([v19 integerValue] == 2)
      {
        id v20 = [v15 item];
        id v21 = [v20 objectForKey:@"ACCMediaLibraryUpdatePlaylistDictionary"];

        if (v21)
        {
          __int16 v22 = [v21 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];
          unsigned int v23 = &_os_log_internal;
          if (v22)
          {
            v69 = v22;
            if ([v22 integerValue])
            {
              uint64_t v24 = [v15 revision];
              [v65 addObject:v24];
            }
          }
          else
          {
            v69 = 0;
          }
        }
        else
        {
          v69 = 0;
          unsigned int v23 = &_os_log_internal;
        }
      }
      else
      {
        v69 = 0;
        unsigned int v23 = &_os_log_internal;
      }
      __int16 v25 = [v15 revision];
      if ([v25 integerValue])
      {
        uint64_t v26 = [*(id *)(v1 + 48) integerValue];

        if (v26)
        {
          uint64_t v27 = [*(id *)(v1 + 48) integerValue];
          uint64_t v28 = [v15 revision];
          uint64_t v29 = [v28 integerValue];

          if (v27 <= v29) {
            goto LABEL_34;
          }
          goto LABEL_31;
        }
      }
      else
      {
      }
      id v30 = *(id **)(v4 + 928);
      int v31 = *(_DWORD *)(v5 + 936);
      if (v30 && v31 >= 1)
      {
        uint64_t v32 = *v30;
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v61;
          v76 = v30;
          __int16 v77 = 1024;
          LODWORD(v78) = v31;
          _os_log_error_impl(&dword_22669E000, v23, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        uint64_t v33 = v23;
        uint64_t v32 = v23;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = *(void *)(v1 + 40);
        unint64_t v35 = v4;
        unint64_t v36 = v5;
        uint64_t v37 = *(id **)(*(void *)(v1 + 32) + 16);
        v67 = *(void **)(v1 + 48);
        uint64_t v38 = [v15 revision];
        *(_DWORD *)buf = 138413058;
        v76 = v37;
        unint64_t v5 = v36;
        unint64_t v4 = v35;
        __int16 v77 = 2112;
        uint64_t v78 = v34;
        id v9 = v66;
        __int16 v79 = 2112;
        id v80 = v67;
        __int16 v81 = 2112;
        *(void *)v82 = v38;
        _os_log_impl(&dword_22669E000, v32, OS_LOG_TYPE_DEFAULT, "confirmUpdates: %@, library %@, WARNING!!! either revision (%@) or item.revision (%@) were not numbers! using string compare", buf, 0x2Au);
      }
      uint64_t v39 = [v15 revision];
      int v40 = [v39 isEqualToString:*(void *)(v1 + 48)];

      if (v40)
      {
LABEL_34:

        unint64_t v41 = v63 + v14;
        goto LABEL_39;
      }
LABEL_31:

      ++v14;
    }
    while (v68 != v14);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v71 objects:v87 count:16];
    unint64_t v41 = v62;
    unint64_t v12 = v62;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_39:

  v2 = v64;
  id v3 = v65;
LABEL_46:
  v46 = *(id **)(v4 + 928);
  if (v46 && *(int *)(v5 + 936) >= 1)
  {
    uint64_t v47 = *v46;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint64_t v47 = &_os_log_internal;
    id v48 = &_os_log_internal;
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v52 = *(void *)(v1 + 40);
    long long v53 = *(id **)(*(void *)(v1 + 32) + 16);
    unint64_t v54 = v5;
    long long v55 = *(void **)(v1 + 48);
    uint64_t v56 = v1;
    int v57 = *(_DWORD *)(v1 + 64);
    uint64_t v58 = [v2 count];
    *(_DWORD *)buf = 138413826;
    v76 = v53;
    __int16 v77 = 2112;
    uint64_t v78 = v52;
    __int16 v79 = 2112;
    id v80 = v55;
    unint64_t v5 = v54;
    __int16 v81 = 1024;
    *(_DWORD *)v82 = v57;
    uint64_t v1 = v56;
    unint64_t v4 = 0x268141000;
    *(_WORD *)&v82[4] = 2048;
    *(void *)&v82[6] = v41;
    __int16 v83 = 2048;
    uint64_t v84 = v58;
    __int16 v85 = 2112;
    id v86 = v3;
    _os_log_debug_impl(&dword_22669E000, v47, OS_LOG_TYPE_DEBUG, "confirmUpdates: %@, library %@, revision %@, updateCount %u, index=%lu waitlist.count=%lu playlistRevisionToAdd=%@", buf, 0x44u);
  }

  if (v41 >= [v2 count]) {
    [v2 removeAllObjects];
  }
  else {
    objc_msgSend(v2, "removeObjectsInRange:", 0, v41 + 1);
  }
  [*(id *)(v1 + 32) _waitingUpdatesRemoveLibraryIfEmpty:*(void *)(v1 + 40)];
LABEL_58:
  if ([v3 count])
  {
    uint64_t v49 = *(id **)(v4 + 928);
    if (v49 && *(int *)(v5 + 936) >= 1)
    {
      v50 = *v49;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v50 = &_os_log_internal;
      id v51 = &_os_log_internal;
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v59 = *(void *)(v1 + 40);
      v60 = *(id **)(*(void *)(v1 + 32) + 16);
      *(_DWORD *)buf = 138412802;
      v76 = v60;
      __int16 v77 = 2112;
      uint64_t v78 = v59;
      __int16 v79 = 2112;
      id v80 = v3;
      _os_log_debug_impl(&dword_22669E000, v50, OS_LOG_TYPE_DEBUG, "confirmUpdates: %@, library %@, wasPlaylistUpdates, _addConfirmedRevisionForLibrary playlistRevisionToAdd=%@", buf, 0x20u);
    }

    [*(id *)(v1 + 32) _addConfirmedRevisionForLibrary:*(void *)(v1 + 40) revisionsToAdd:v3];
  }
}

- (void)confirmPlaylistContentUpdates:(id)a3 revision:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    accessoryUID = self->_accessoryUID;
    *(_DWORD *)buf = 138413058;
    id v19 = accessoryUID;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2048;
    unint64_t v25 = [(ACCMediaLibraryAccessory *)self pendingPlaylistContentUpdatesCountForLibrary:v6];
    _os_log_debug_impl(&dword_22669E000, v10, OS_LOG_TYPE_DEBUG, "confirmPlaylistContentUpdates: %@, library %@, revision %@, pendingUpdatesCount=%lu", buf, 0x2Au);
  }

  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ACCMediaLibraryAccessory_confirmPlaylistContentUpdates_revision___block_invoke;
  block[3] = &unk_2647ABA48;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(listQueue, block);
}

void __67__ACCMediaLibraryAccessory_confirmPlaylistContentUpdates_revision___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _waitingUpdatesForLibrary:*(void *)(a1 + 40) createIfNotExist:0];
  id v3 = v2;
  if (v2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        uint64_t v9 = 0;
        unint64_t v10 = v7 + v6;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "revision", (void)v13);
          char v12 = [v11 isEqualToString:*(void *)(a1 + 48)];

          if (v12)
          {
            unint64_t v10 = v7 + v9;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        unint64_t v7 = v10;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }
LABEL_13:

    if (v10 < [v4 count])
    {
      [v4 removeObjectAtIndex:v10];
      [*(id *)(a1 + 32) _waitingUpdatesRemoveLibraryIfEmpty:*(void *)(a1 + 40)];
    }
  }
}

- (void)clearAllUpdates
{
  uint64_t v29 = *MEMORY[0x263EF8340];
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
    uint64_t v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    accessoryUID = self->_accessoryUID;
    uint64_t v7 = [(NSMutableDictionary *)self->_pendingUpdates count];
    uint64_t v8 = [(NSMutableDictionary *)self->_waitingConfirm count];
    uint64_t v9 = [(NSMutableDictionary *)self->_pendingPlaylistContentUpdates count];
    uint64_t v10 = [(NSMutableDictionary *)self->_confirmedRevisionList count];
    int v19 = 138413314;
    __int16 v20 = accessoryUID;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = v8;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v10;
    _os_log_impl(&dword_22669E000, v5, OS_LOG_TYPE_INFO, "clearAllUpdates: %@, pendingUpdates.count=%lu waitingConfirm.count=%lu pendingUpdates.count=%lu waitingConfirm.count=%lu", (uint8_t *)&v19, 0x34u);
  }

  long long v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = v11;

  long long v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  waitingConfirm = self->_waitingConfirm;
  self->_waitingConfirm = v13;

  long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  pendingPlaylistContentUpdates = self->_pendingPlaylistContentUpdates;
  self->_pendingPlaylistContentUpdates = v15;

  id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  confirmedRevisionList = self->_confirmedRevisionList;
  self->_confirmedRevisionList = v17;
}

- (void)clearAllUpdatesForLibrary:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
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
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    accessoryUID = self->_accessoryUID;
    uint64_t v9 = [(NSMutableDictionary *)self->_pendingUpdates count];
    uint64_t v10 = [(NSMutableDictionary *)self->_waitingConfirm count];
    uint64_t v11 = [(NSMutableDictionary *)self->_pendingPlaylistContentUpdates count];
    uint64_t v12 = [(NSMutableDictionary *)self->_confirmedRevisionList count];
    *(_DWORD *)buf = 138413570;
    uint64_t v18 = accessoryUID;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    __int16 v27 = 2048;
    uint64_t v28 = v12;
    _os_log_impl(&dword_22669E000, v7, OS_LOG_TYPE_INFO, "clearAllUpdatesForLibrary: %@, libraryUID %@, pendingUpdates.count=%lu waitingConfirm.count=%lu pendingUpdates.count=%lu waitingConfirm.count=%lu", buf, 0x3Eu);
  }

  listQueue = self->_listQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__ACCMediaLibraryAccessory_clearAllUpdatesForLibrary___block_invoke;
  v15[3] = &unk_2647ABA70;
  void v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_sync(listQueue, v15);
}

void __54__ACCMediaLibraryAccessory_clearAllUpdatesForLibrary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];

  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v3 forKey:*(void *)(a1 + 40)];
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:v5 forKey:*(void *)(a1 + 40)];
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v7 forKey:*(void *)(a1 + 40)];
  }
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v9 forKey:*(void *)(a1 + 40)];
  }
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (ACCMediaLibraryProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (ACCMediaLibraryProvider *)WeakRetained;
}

- (unsigned)windowPerLibrary
{
  return self->_windowPerLibrary;
}

- (void)setWindowPerLibrary:(unsigned int)a3
{
  self->_windowPerLibrary = a3;
}

- (NSMutableDictionary)libraries
{
  return self->_libraries;
}

- (NSMutableDictionary)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
}

- (NSMutableDictionary)waitingConfirm
{
  return self->_waitingConfirm;
}

- (void)setWaitingConfirm:(id)a3
{
}

- (NSMutableDictionary)pendingPlaylistContentUpdates
{
  return self->_pendingPlaylistContentUpdates;
}

- (void)setPendingPlaylistContentUpdates:(id)a3
{
}

- (NSMutableDictionary)confirmedRevisionList
{
  return self->_confirmedRevisionList;
}

- (void)setConfirmedRevisionList:(id)a3
{
}

- (OS_dispatch_queue)listQueue
{
  return self->_listQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listQueue, 0);
  objc_storeStrong((id *)&self->_confirmedRevisionList, 0);
  objc_storeStrong((id *)&self->_pendingPlaylistContentUpdates, 0);
  objc_storeStrong((id *)&self->_waitingConfirm, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
  objc_destroyWeak((id *)&self->_provider);

  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

void __46__ACCMediaLibraryAccessory_addUpdate_library___block_invoke_cold_1(uint64_t a1, void *a2, os_log_t log)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = v5[2];
  uint64_t v7 = *a2;
  if (*a2) {
    int v8 = [v5 _pendingUpdatesAndWaitingConfirmFullForLibrary:*a2] ^ 1;
  }
  else {
    int v8 = -1;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  int v10 = 138413058;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 1024;
  int v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_22669E000, log, OS_LOG_TYPE_ERROR, "addUpdate: %@, pendingUpdatesAndWaitingConfirmFullForLibrary:%@ (%d), unable to addUpdate! updateDict=%@", (uint8_t *)&v10, 0x26u);
}

@end