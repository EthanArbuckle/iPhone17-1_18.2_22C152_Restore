@interface ACCMediaLibraryFeaturePlugin
- (ACCMediaLibraryProvider)mediaLibraryProvider;
- (ACCMediaLibraryProvider)provider;
- (BOOL)isRunning;
- (NSMutableDictionary)mediaLibraryShimList;
- (NSString)description;
- (NSString)pluginName;
- (OS_dispatch_queue)mediaLibraryCBProcessQ;
- (void)initPlugin;
- (void)mediaLibrary:(id)a3 accessoryArrived:(id)a4 windowPerLibrary:(unsigned int)a5;
- (void)mediaLibrary:(id)a3 accessoryLeft:(id)a4;
- (void)mediaLibrary:(id)a3 accessoryUpdate:(id)a4 windowPerLibrary:(unsigned int)a5;
- (void)mediaLibrary:(id)a3 confirmPlaylistContentUpdate:(id)a4 lastRevision:(id)a5 accessory:(id)a6;
- (void)mediaLibrary:(id)a3 confirmUpdate:(id)a4 lastRevision:(id)a5 updateCount:(unsigned int)a6 accessory:(id)a7;
- (void)mediaLibrary:(id)a3 play:(id)a4 collection:(unint64_t)a5 type:(int)a6 firstItemIndex:(unint64_t)a7 accessory:(id)a8;
- (void)mediaLibrary:(id)a3 play:(id)a4 collection:(unint64_t)a5 type:(int)a6 firstItemPersistentID:(unint64_t)a7 accessory:(id)a8;
- (void)mediaLibrary:(id)a3 play:(id)a4 itemList:(id)a5 firstItemIndex:(unint64_t)a6 accessory:(id)a7;
- (void)mediaLibrary:(id)a3 playAllSongs:(id)a4 accessory:(id)a5;
- (void)mediaLibrary:(id)a3 playAllSongs:(id)a4 firstItemPersistentID:(unint64_t)a5 accessory:(id)a6;
- (void)mediaLibrary:(id)a3 playCurrentSelection:(id)a4 accessory:(id)a5;
- (void)mediaLibrary:(id)a3 startUpdate:(id)a4 lastRevision:(id)a5 requestedInfo:(id)a6 accessory:(id)a7;
- (void)mediaLibrary:(id)a3 stopAllUpdate:(id)a4;
- (void)mediaLibrary:(id)a3 stopUpdate:(id)a4 accessory:(id)a5;
- (void)notify:(id)a3 stateChange:(int)a4 enabled:(BOOL)a5;
- (void)notifyAvailableLibraries:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setMediaLibraryCBProcessQ:(id)a3;
- (void)setMediaLibraryProvider:(id)a3;
- (void)setMediaLibraryShimList:(id)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation ACCMediaLibraryFeaturePlugin

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(ACCMediaLibraryFeaturePlugin *)self pluginName];
  uint64_t v5 = obfuscatedPointer((uint64_t)self);
  BOOL v6 = [(ACCMediaLibraryFeaturePlugin *)self isRunning];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p> isRunning: %s", v4, v5, v7];

  return (NSString *)v8;
}

- (void)initPlugin
{
  init_logging();
  mediaLibraryProvider = self->_mediaLibraryProvider;
  self->_mediaLibraryProvider = 0;

  [(ACCMediaLibraryFeaturePlugin *)self setIsRunning:0];
}

- (void)startPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "Starting Media Library feature plugin...", v12, 2u);
  }

  BOOL v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mlPlugin.mediaLibraryCBProcessQ", 0);
  mediaLibraryCBProcessQ = self->_mediaLibraryCBProcessQ;
  self->_mediaLibraryCBProcessQ = v6;

  v8 = (ACCMediaLibraryProvider *)[objc_alloc(MEMORY[0x263F22E50]) initWithDelegate:self queue:self->_mediaLibraryCBProcessQ];
  mediaLibraryProvider = self->_mediaLibraryProvider;
  self->_mediaLibraryProvider = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mediaLibraryShimList = self->_mediaLibraryShimList;
  self->_mediaLibraryShimList = v10;

  [(ACCMediaLibraryFeaturePlugin *)self setIsRunning:1];
}

- (void)stopPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "Stopping Media Library feature plugin...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    BOOL v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2269CB000, v6, OS_LOG_TYPE_INFO, "Removing all observers...", v12, 2u);
  }

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self];

  mediaLibraryProvider = self->_mediaLibraryProvider;
  self->_mediaLibraryProvider = 0;

  mediaLibraryShimList = self->_mediaLibraryShimList;
  self->_mediaLibraryShimList = 0;

  mediaLibraryCBProcessQ = self->_mediaLibraryCBProcessQ;
  self->_mediaLibraryCBProcessQ = 0;
}

- (ACCMediaLibraryProvider)provider
{
  return self->_mediaLibraryProvider;
}

- (void)notifyAvailableLibraries:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_INFO, "notifyAvailableLibraries: %@", (uint8_t *)&v8, 0xCu);
  }

  [(ACCMediaLibraryProvider *)self->_mediaLibraryProvider notifyAvailableLibraries:v4];
}

- (void)notify:(id)a3 stateChange:(int)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v5;
    _os_log_impl(&dword_2269CB000, v11, OS_LOG_TYPE_INFO, "notifyStateChange: %@  type=%d enabled=%d", (uint8_t *)&v12, 0x18u);
  }

  [(ACCMediaLibraryProvider *)self->_mediaLibraryProvider notify:v8 stateChange:v6 enabled:v5];
}

- (void)mediaLibrary:(id)a3 accessoryArrived:(id)a4 windowPerLibrary:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  BOOL v9 = [v7 accessoryUID];
  id v10 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v9];

  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412802;
    id v17 = v7;
    __int16 v18 = 1024;
    int v19 = v5;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_INFO, "mediaLibraryAccessoryArrived: accessory=%@  windowPerLibrary=%d, shim=%@", (uint8_t *)&v16, 0x1Cu);
  }

  if (!v10)
  {
    id v10 = [[ACCMediaLibraryShim alloc] initWithAccessory:v7 windowPerLibrary:v5 delegate:self];
    __int16 v14 = self->_mediaLibraryShimList;
    int v15 = [v7 accessoryUID];
    [(NSMutableDictionary *)v14 setObject:v10 forKey:v15];

    [(ACCMediaLibraryShim *)v10 startShimForAccessoryAttach:v7];
    [(ACCMediaLibraryShim *)v10 startSendingMediaLibraryInfomationUpdates];
  }
}

- (void)mediaLibrary:(id)a3 accessoryLeft:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  id v7 = [v5 accessoryUID];
  id v8 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v7];

  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    BOOL v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_2269CB000, v11, OS_LOG_TYPE_INFO, "mediaLibraryAccessoryLeft: %@  shim=%@", (uint8_t *)&v14, 0x16u);
  }

  if (v8)
  {
    [v8 shuttingDown];
    id v12 = self->_mediaLibraryShimList;
    id v13 = [v5 accessoryUID];
    [(NSMutableDictionary *)v12 removeObjectForKey:v13];
  }
}

- (void)mediaLibrary:(id)a3 accessoryUpdate:(id)a4 windowPerLibrary:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  BOOL v9 = [v7 accessoryUID];
  id v10 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v9];

  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412802;
    id v15 = v7;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 2112;
    int v19 = v10;
    _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_INFO, "mediaLibraryAccessoryUpdate: %@  windowPerLibrary=%d, shim=%@", (uint8_t *)&v14, 0x1Cu);
  }

  if (v10) {
    [v10 setWindowPerLibrary:v5];
  }
}

- (void)mediaLibrary:(id)a3 startUpdate:(id)a4 lastRevision:(id)a5 requestedInfo:(id)a6 accessory:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  __int16 v16 = [v14 accessoryUID];
  int v17 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v16];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    __int16 v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    __int16 v18 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = ACCMediaLibraryFeatureRequestedInfoDesc(v13);
    int v21 = 138413314;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    v28 = v20;
    __int16 v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_2269CB000, v18, OS_LOG_TYPE_INFO, "mediaLibraryStartUpdate: %@ libUID=%@ lastRevision=%@ requestedInfo=%@ shim=%@", (uint8_t *)&v21, 0x34u);
  }
  if (v17) {
    [v17 startMediaLibraryUpdate:v11 lastRevision:v12 requestedInfo:v13];
  }
}

- (void)mediaLibrary:(id)a3 confirmUpdate:(id)a4 lastRevision:(id)a5 updateCount:(unsigned int)a6 accessory:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  id v15 = [v13 accessoryUID];
  __int16 v16 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v15];

  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 1;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v19 = MEMORY[0x263EF8438];
    id v18 = MEMORY[0x263EF8438];
  }
  else
  {
    id v19 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v20 = 138413314;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 1024;
    int v27 = v8;
    __int16 v28 = 2112;
    __int16 v29 = v16;
    _os_log_impl(&dword_2269CB000, v19, OS_LOG_TYPE_INFO, "mediaLibraryConfirmUpdate: %@ libUID=%@ lastRevision=%@ count=%d shim=%@", (uint8_t *)&v20, 0x30u);
  }

  if (v16) {
    [v16 confirmMediaLibraryUpdate:v11 lastRevision:v12 updateCount:v8];
  }
}

- (void)mediaLibrary:(id)a3 confirmPlaylistContentUpdate:(id)a4 lastRevision:(id)a5 accessory:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  id v13 = [v11 accessoryUID];
  id v14 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v13];

  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    BOOL v17 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = 138413058;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v14;
    _os_log_impl(&dword_2269CB000, v17, OS_LOG_TYPE_INFO, "mediaLibraryConfirmUpdate: %@ libUID=%@ lastRevision=%@ shim=%@", (uint8_t *)&v18, 0x2Au);
  }

  if (v14) {
    [v14 confirmMediaLibraryPlaylistContentUpdate:v9 lastRevision:v10];
  }
}

- (void)mediaLibrary:(id)a3 stopUpdate:(id)a4 accessory:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  id v10 = [v8 accessoryUID];
  id v11 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v10];

  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 1;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v14 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  else
  {
    id v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    __int16 v20 = v11;
    _os_log_impl(&dword_2269CB000, v14, OS_LOG_TYPE_INFO, "mediaLibraryStopUpdate: %@ libUID=%@ shim=%@", (uint8_t *)&v15, 0x20u);
  }

  if (v11) {
    [v11 stopMediaLibraryUpdate:v7];
  }
}

- (void)mediaLibrary:(id)a3 stopAllUpdate:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  id v7 = [v5 accessoryUID];
  id v8 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v7];

  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    id v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    int v15 = v8;
    _os_log_impl(&dword_2269CB000, v11, OS_LOG_TYPE_INFO, "mediaLibraryStopAllUpdate: %@ shim=%@", (uint8_t *)&v12, 0x16u);
  }

  if (v8) {
    [v8 stopAllMediaLibraryUpdate];
  }
}

- (void)mediaLibrary:(id)a3 play:(id)a4 itemList:(id)a5 firstItemIndex:(unint64_t)a6 accessory:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  int v15 = [v13 accessoryUID];
  uint64_t v16 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v15];

  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 1;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    __int16 v19 = MEMORY[0x263EF8438];
    id v18 = MEMORY[0x263EF8438];
  }
  else
  {
    __int16 v19 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v20 = 138413314;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2048;
    unint64_t v25 = a6;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    __int16 v29 = v16;
    _os_log_impl(&dword_2269CB000, v19, OS_LOG_TYPE_INFO, "mediaLibraryStopUpdate: %@ libUID=%@ firstItemIndex=%lu itemList=%@ shim=%@", (uint8_t *)&v20, 0x34u);
  }

  if (v16) {
    [v16 playMediaLibraryItems:v11 itemList:v12 firstItemIndex:a6];
  }
}

- (void)mediaLibrary:(id)a3 play:(id)a4 collection:(unint64_t)a5 type:(int)a6 firstItemIndex:(unint64_t)a7 accessory:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a8;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  uint64_t v16 = [v14 accessoryUID];
  BOOL v17 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v16];

  if (gLogObjects) {
    BOOL v18 = gNumLogObjects < 1;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    int v20 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  else
  {
    int v20 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v21 = 138413570;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2048;
    unint64_t v26 = a5;
    __int16 v27 = 1024;
    int v28 = v10;
    __int16 v29 = 2048;
    unint64_t v30 = a7;
    __int16 v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_2269CB000, v20, OS_LOG_TYPE_INFO, "mediaLibraryStopUpdate: %@ libUID=%@ collection=%llu type=%d firstItemIndex=%lu shim=%@", (uint8_t *)&v21, 0x3Au);
  }

  if (v17) {
    [v17 playMediaLibraryCollection:v13 collection:a5 type:v10 firstItemIndex:a7];
  }
}

- (void)mediaLibrary:(id)a3 play:(id)a4 collection:(unint64_t)a5 type:(int)a6 firstItemPersistentID:(unint64_t)a7 accessory:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a8;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  uint64_t v16 = [v14 accessoryUID];
  BOOL v17 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v16];

  if (gLogObjects) {
    BOOL v18 = gNumLogObjects < 1;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    int v20 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  else
  {
    int v20 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v21 = 138413570;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2048;
    unint64_t v26 = a5;
    __int16 v27 = 1024;
    int v28 = v10;
    __int16 v29 = 2048;
    unint64_t v30 = a7;
    __int16 v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_2269CB000, v20, OS_LOG_TYPE_INFO, "mediaLibraryStopUpdate: %@ libUID=%@ collection=%llu type=%d firstItemPersistentID=%llu shim=%@", (uint8_t *)&v21, 0x3Au);
  }

  if (v17) {
    [v17 playMediaLibraryCollection:v13 collection:a5 type:v10 firstItemPersistentID:a7];
  }
}

- (void)mediaLibrary:(id)a3 playCurrentSelection:(id)a4 accessory:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  uint64_t v10 = [v8 accessoryUID];
  id v11 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v10];

  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 1;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v14 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  else
  {
    id v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    int v20 = v11;
    _os_log_impl(&dword_2269CB000, v14, OS_LOG_TYPE_INFO, "mediaLibraryplayCurrentSelection: %@ libUID=%@ shim=%@", (uint8_t *)&v15, 0x20u);
  }

  if (v11) {
    [v11 playMediaLibraryCurrentSelection:v7];
  }
}

- (void)mediaLibrary:(id)a3 playAllSongs:(id)a4 accessory:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  uint64_t v10 = [v8 accessoryUID];
  id v11 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v10];

  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 1;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v14 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  else
  {
    id v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    int v20 = v11;
    _os_log_impl(&dword_2269CB000, v14, OS_LOG_TYPE_INFO, "mediaLibraryplayAllSongs: %@ libUID=%@ shim=%@", (uint8_t *)&v15, 0x20u);
  }

  if (v11) {
    [v11 playAllSongs:v7];
  }
}

- (void)mediaLibrary:(id)a3 playAllSongs:(id)a4 firstItemPersistentID:(unint64_t)a5 accessory:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  BOOL v12 = [v10 accessoryUID];
  id v13 = [(NSMutableDictionary *)mediaLibraryShimList objectForKey:v12];

  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v16 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  else
  {
    id v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = 138413058;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl(&dword_2269CB000, v16, OS_LOG_TYPE_INFO, "mediaLibraryplayAllSongs: %@ libUID=%@ firstItemPersistentID=%llu shim=%@", (uint8_t *)&v17, 0x2Au);
  }

  if (v13) {
    [v13 playAllSongs:v9 firstItemPersistentID:a5];
  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCMediaLibraryProvider)mediaLibraryProvider
{
  return (ACCMediaLibraryProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaLibraryProvider:(id)a3
{
}

- (NSMutableDictionary)mediaLibraryShimList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMediaLibraryShimList:(id)a3
{
}

- (OS_dispatch_queue)mediaLibraryCBProcessQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMediaLibraryCBProcessQ:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryCBProcessQ, 0);
  objc_storeStrong((id *)&self->_mediaLibraryShimList, 0);
  objc_storeStrong((id *)&self->_mediaLibraryProvider, 0);
}

@end