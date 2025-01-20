@interface ACCMediaLibraryServer
+ (id)sharedServer;
- (ACCMediaLibraryServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)_isDifferentLibraryList:(id)a3 otherList:(id)a4;
- (BOOL)findMediaLibraryInfoSync:(id)a3 block:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)nexUpdateStartFull:(id)a3 accessory:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableDictionary)mediaLibraryProviderInfoList;
- (NSMutableDictionary)mediaLibraryProviderInfoListByProviderUID;
- (NSMutableDictionary)registeredAccessoryConnections;
- (void)accessoryMediaLibraryAttached:(id)a3 windowPerLibrary:(unsigned int)a4;
- (void)accessoryMediaLibraryDetached:(id)a3;
- (void)accessoryMediaLibraryUpdate:(id)a3 windowPerLibrary:(unsigned int)a4;
- (void)confirmPlaylistContentUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5;
- (void)confirmUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 updateCount:(unsigned int)a6;
- (void)dealloc;
- (void)handleMediaLibraryList:(id)a3 provider:(id)a4 xpcConn:(id)a5;
- (void)iterateAttachedConnectionsSync:(id)a3;
- (void)iterateMediaLibraryProviderListSync:(id)a3;
- (void)playAllSongs:(id)a3 library:(id)a4 startItem:(unint64_t)a5;
- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startIndex:(unsigned int)a7;
- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startItem:(unint64_t)a7;
- (void)playCurrentSelection:(id)a3 library:(id)a4;
- (void)playItems:(id)a3 library:(id)a4 itemList:(id)a5 startIndex:(unsigned int)a6;
- (void)requestMediaLibraryUpdate:(id)a3;
- (void)resetUpdate:(id)a3 accessory:(id)a4;
- (void)sendAvailableLibrariesToAccessory:(id)a3;
- (void)startMediaLibraryUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 mediaItemProperties:(unint64_t)a6 playlistProperties:(unint64_t)a7 playlistContentStyle:(int)a8 playlistContentProperties:(unint64_t)a9 reqOptions:(unint64_t)a10;
- (void)stopAllMediaLibraryUpdate:(id)a3;
- (void)stopMediaLibraryUpdate:(id)a3 library:(id)a4;
@end

@implementation ACCMediaLibraryServer

- (ACCMediaLibraryServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACCMediaLibraryServer;
  v7 = [(ACCFeatureServer *)&v18 initWithXPCServiceName:v6 andFeatureNotification:a4];
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v6;
    __int16 v21 = 2080;
    v22 = a4;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "initWithXPCServiceName: serviceName='%@' notification='%s' self=%@", buf, 0x20u);
  }

  if (v7)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mediaLibraryProviderInfoList = v7->_mediaLibraryProviderInfoList;
    v7->_mediaLibraryProviderInfoList = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mediaLibraryProviderInfoListByProviderUID = v7->_mediaLibraryProviderInfoListByProviderUID;
    v7->_mediaLibraryProviderInfoListByProviderUID = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registeredAccessoryConnections = v7->_registeredAccessoryConnections;
    v7->_registeredAccessoryConnections = v15;
  }
  return v7;
}

- (void)dealloc
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 5;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    v5 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc: self=%@", buf, 0xCu);
  }

  mediaLibraryProviderInfoList = self->_mediaLibraryProviderInfoList;
  self->_mediaLibraryProviderInfoList = 0;

  mediaLibraryProviderInfoListByProviderUID = self->_mediaLibraryProviderInfoListByProviderUID;
  self->_mediaLibraryProviderInfoListByProviderUID = 0;

  registeredAccessoryConnections = self->_registeredAccessoryConnections;
  self->_registeredAccessoryConnections = 0;

  v9.receiver = self;
  v9.super_class = (Class)ACCMediaLibraryServer;
  [(ACCFeatureServer *)&v9 dealloc];
}

- (void)iterateAttachedConnectionsSync:(id)a3
{
  id v4 = (void (**)(id, void *, char *))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSMutableDictionary *)self->_registeredAccessoryConnections allValues];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      char v12 = 1;
      v11 = [v10 accessoryUID];
      v4[2](v4, v11, &v12);

      if (!v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)iterateMediaLibraryProviderListSync:(id)a3
{
  id v4 = (void (**)(id, void, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(NSMutableDictionary *)self->_mediaLibraryProviderInfoList allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 1;
      v4[2](v4, v10, &v11);
      if (!v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)findMediaLibraryInfoSync:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __56__ACCMediaLibraryServer_findMediaLibraryInfoSync_block___block_invoke;
  v11[3] = &unk_100219898;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  long long v14 = &v15;
  [(ACCMediaLibraryServer *)self iterateMediaLibraryProviderListSync:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __56__ACCMediaLibraryServer_findMediaLibraryInfoSync_block___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  *a3 = 1;
  id v8 = v5;
  id v6 = [v5 mediaLibraryList];
  id v7 = [v6 objectForKey:a1[4]];

  if (v7)
  {
    (*(void (**)(void))(a1[5] + 16))();
    *a3 = 0;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (void)sendAvailableLibrariesToAccessory:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sendAvailableLibrariesToAccessory: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __59__ACCMediaLibraryServer_sendAvailableLibrariesToAccessory___block_invoke;
  v31[3] = &unk_1002198C0;
  p_long long buf = &buf;
  id v8 = v4;
  id v32 = v8;
  [(ACCMediaLibraryServer *)self iterateMediaLibraryProviderListSync:v31];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v9 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*((void *)&buf + 1) + 24);
    mediaLibraryProviderInfoList = self->_mediaLibraryProviderInfoList;
    *(_DWORD *)v40 = 138412802;
    *(void *)&v40[4] = v8;
    *(_WORD *)&v40[12] = 2048;
    *(void *)&v40[14] = v11;
    *(_WORD *)&v40[22] = 2112;
    v41 = mediaLibraryProviderInfoList;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sendAvailableLibrariesToAccessory: %@ count=%zu _mediaLibraryProviderInfoList=%@", v40, 0x20u);
  }

  id v13 = objc_alloc_init((Class)NSMutableArray);
  *(void *)v40 = 0;
  *(void *)&v40[8] = v40;
  *(void *)&v40[16] = 0x2020000000;
  LODWORD(v41) = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __59__ACCMediaLibraryServer_sendAvailableLibrariesToAccessory___block_invoke_75;
  v26[3] = &unk_1002198E8;
  id v14 = v8;
  id v27 = v14;
  v29 = v40;
  v30 = &buf;
  id v15 = v13;
  id v28 = v15;
  [(ACCMediaLibraryServer *)self iterateMediaLibraryProviderListSync:v26];
  long long v16 = +[ACCMediaLibraryServer sharedServer];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    uint64_t v17 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v17 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = *(void *)(*((void *)&buf + 1) + 24);
    registeredAccessoryConnections = self->_registeredAccessoryConnections;
    *(_DWORD *)v34 = 138412802;
    id v35 = v14;
    __int16 v36 = 2048;
    uint64_t v37 = v19;
    __int16 v38 = 2112;
    v39 = registeredAccessoryConnections;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "sendAvailableLibrariesToAccessory: %@ count=%zu _registeredAccessoryConnections=%@", v34, 0x20u);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __59__ACCMediaLibraryServer_sendAvailableLibrariesToAccessory___block_invoke_77;
  v23[3] = &unk_100219910;
  id v21 = v14;
  id v24 = v21;
  id v22 = v15;
  id v25 = v22;
  [v16 iterateAttachedConnectionsSync:v23];

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&buf, 8);
}

void __59__ACCMediaLibraryServer_sendAvailableLibrariesToAccessory___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  *a3 = 1;
  id v6 = [v5 mediaLibraryList];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v6 count];

  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v12 = [v5 mediaLibraryList];
    int v13 = 138412802;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sendAvailableLibrariesToAccessory: %@ count=%zu mlInfo=%@", (uint8_t *)&v13, 0x20u);
  }
}

void __59__ACCMediaLibraryServer_sendAvailableLibrariesToAccessory___block_invoke_75(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  *a3 = 1;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v39 = v9;
    __int16 v40 = 2112;
    *(void *)v41 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sendAvailableLibrariesToAccessory: %@ mlInfo=%@", buf, 0x16u);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v33 = v5;
  uint64_t v10 = [v5 mediaLibraryList];
  uint64_t v11 = [v10 allValues];

  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v17 = gLogObjects;
        int v18 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v19 = gNumLogObjects <= 4;
        }
        else {
          BOOL v19 = 1;
        }
        int v20 = !v19;
        if (*(void *)(*(void *)(a1[7] + 8) + 24) <= (unint64_t)*(int *)(*(void *)(a1[6] + 8) + 24))
        {
          if (v20)
          {
            id v28 = *(id *)(gLogObjects + 32);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            id v28 = &_os_log_default;
            id v29 = &_os_log_default;
          }
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = a1[4];
            int v31 = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
            uint64_t v32 = *(void *)(*(void *)(a1[7] + 8) + 24);
            *(_DWORD *)long long buf = 138413058;
            uint64_t v39 = v30;
            __int16 v40 = 1024;
            *(_DWORD *)v41 = v31;
            *(_WORD *)&v41[4] = 2048;
            *(void *)&v41[6] = v32;
            __int16 v42 = 2112;
            uint64_t v43 = v16;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "sendAvailableLibrariesToAccessory: %@ index beyond count! %d/%zu libInfo=%@", buf, 0x26u);
          }

          goto LABEL_41;
        }
        if (v20)
        {
          id v21 = *(id *)(gLogObjects + 32);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134218240;
            uint64_t v39 = v17;
            __int16 v40 = 1024;
            *(_DWORD *)v41 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v22 = &_os_log_default;
          id v21 = &_os_log_default;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = a1[4];
          int v24 = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
          uint64_t v25 = *(void *)(*(void *)(a1[7] + 8) + 24);
          *(_DWORD *)long long buf = 138413058;
          uint64_t v39 = v23;
          __int16 v40 = 1024;
          *(_DWORD *)v41 = v24;
          *(_WORD *)&v41[4] = 2048;
          *(void *)&v41[6] = v25;
          __int16 v42 = 2112;
          uint64_t v43 = v16;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "sendAvailableLibrariesToAccessory: %@ index=%d/%zu libInfo=%@", buf, 0x26u);
        }

        v26 = (void *)a1[5];
        id v27 = [v16 copyDict];
        [v26 addObject:v27];

        ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
      }
      id v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_41:
}

uint64_t __59__ACCMediaLibraryServer_sendAvailableLibrariesToAccessory___block_invoke_77(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  BOOL v6 = v5;
  *a3 = 1;
  id v9 = v5;
  if (!*(void *)(a1 + 32) || (v7 = objc_msgSend(v5, "isEqualToString:"), BOOL v6 = v9, v7)) {
    platform_mediaLibrary_infoUpdateHandler(v6, *(void **)(a1 + 40));
  }

  return _objc_release_x3();
}

- (void)handleMediaLibraryList:(id)a3 provider:(id)a4 xpcConn:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 5;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v44 = v8;
    __int16 v45 = 2112;
    id v46 = v9;
    __int16 v47 = 2048;
    id v48 = [v10 hash];
    __int16 v49 = 2048;
    id v50 = [v10 hash];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "handleMediaLibraryList: libraryList=%@ providerUID=%@ xpcConn.hash=%lu(%lxh)", buf, 0x2Au);
  }

  uint64_t v14 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v10 hash]);
  __int16 v15 = [(NSMutableDictionary *)self->_mediaLibraryProviderInfoList objectForKey:v14];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    uint64_t v16 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v16 = &_os_log_default;
    id v17 = &_os_log_default;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v18 = [v10 hash];
    id v19 = [v10 hash];
    *(_DWORD *)long long buf = 138413058;
    id v44 = v9;
    __int16 v45 = 2048;
    id v46 = v18;
    __int16 v47 = 2048;
    id v48 = v19;
    __int16 v49 = 2112;
    id v50 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "handleMediaLibraryList: providerUID=%@ xpcConn.hash=%lu(%lxh) mlInfo=%@", buf, 0x2Au);
  }

  if (v15)
  {
    [v15 setProviderUID:v9];
    int v20 = [v15 mediaLibraryList];
    id v21 = [v20 allValues];
    unsigned int v22 = [(ACCMediaLibraryServer *)self _isDifferentLibraryList:v21 otherList:v8];

    if (v22)
    {
      long long v37 = v14;
      long long v35 = self;
      [v15 setMediaLibraryList:0];
      id v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
      [v15 setMediaLibraryList:v23];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v36 = v8;
      id v24 = v8;
      id v25 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v39;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            uint64_t v30 = [v15 mediaLibraryList];
            int v31 = [v29 mediaLibraryUID];
            [v30 setObject:v29 forKey:v31];
          }
          id v26 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v26);
      }

      if (gLogObjects && gNumLogObjects >= 5)
      {
        uint64_t v32 = *(id *)(gLogObjects + 32);
        p_isa = (id *)&v35->super.super.isa;
        id v8 = v36;
      }
      else
      {
        p_isa = (id *)&v35->super.super.isa;
        id v8 = v36;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v32 = &_os_log_default;
        id v34 = &_os_log_default;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v44 = v9;
        __int16 v45 = 2112;
        id v46 = v15;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "handleMediaLibraryList: providerUID=%@ mlInfo=%@", buf, 0x16u);
      }

      [p_isa[8] setObject:v15 forKey:v9];
      [p_isa sendAvailableLibrariesToAccessory:0];
      uint64_t v14 = v37;
    }
  }
}

- (void)requestMediaLibraryUpdate:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned int v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    unsigned int v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "requestMediaLibraryUpdate: accessoryUID=%@", buf, 0xCu);
  }

  id v8 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __51__ACCMediaLibraryServer_requestMediaLibraryUpdate___block_invoke;
  v10[3] = &unk_100215968;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

id __51__ACCMediaLibraryServer_requestMediaLibraryUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendAvailableLibrariesToAccessory:*(void *)(a1 + 40)];
}

- (void)resetUpdate:(id)a3 accessory:(id)a4
{
  id v11 = a3;
  id v6 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:a4];
  unsigned int v7 = v6;
  if (v6)
  {
    id v8 = [v6 nextUpdateStartFull];
    unsigned __int8 v9 = [v8 containsObject:v11];

    if ((v9 & 1) == 0)
    {
      id v10 = [v7 nextUpdateStartFull];
      [v10 addObject:v11];
    }
  }
}

- (BOOL)nexUpdateStartFull:(id)a3 accessory:(id)a4
{
  id v6 = a3;
  unsigned int v7 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:a4];
  id v8 = v7;
  if (v7)
  {
    unsigned __int8 v9 = [v7 nextUpdateStartFull];
    unsigned __int8 v10 = [v9 containsObject:v6];

    id v11 = [v8 nextUpdateStartFull];
    [v11 removeObject:v6];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned __int8 v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    unsigned __int8 v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    xpcServiceName = self->super._xpcServiceName;
    *(_DWORD *)long long buf = 138412290;
    uint64_t v30 = xpcServiceName;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New XPC connection for: %@", buf, 0xCu);
  }

  id v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCMediaLibraryXPCServerProtocol];
  [v6 setExportedInterface:v11];

  id v12 = [[ACCMediaLibraryServerRemote alloc] initWithXPCConnection:v6];
  [v6 setExportedObject:v12];
  id v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCMediaLibraryXPCClientProtocol];
  [v6 setRemoteObjectInterface:v13];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v6);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __60__ACCMediaLibraryServer_listener_shouldAcceptNewConnection___block_invoke;
  v24[3] = &unk_100217420;
  objc_copyWeak(&v25, &from);
  objc_copyWeak(&v26, &location);
  [v6 setInvalidationHandler:v24];
  uint64_t v14 = objc_alloc_init(_ACCMediaLibraryProviderInfo);
  [(_ACCMediaLibraryProviderInfo *)v14 setConnection:v6];
  [(_ACCMediaLibraryProviderInfo *)v14 setServerRemote:v12];
  __int16 v15 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_32];
  [(_ACCMediaLibraryProviderInfo *)v14 setRemoteObject:v15];

  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 hash]);
  [(NSMutableDictionary *)self->_mediaLibraryProviderInfoList setObject:v14 forKey:v16];
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v17 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v17 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = (NSString *)[(NSMutableDictionary *)self->_mediaLibraryProviderInfoList count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "There are now %lu MediaLibraryProvider(s).", buf, 0xCu);
  }

  [v6 resume];
  int v20 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__ACCMediaLibraryServer_listener_shouldAcceptNewConnection___block_invoke_174;
  block[3] = &unk_1002158C8;
  block[4] = self;
  dispatch_async(v20, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __60__ACCMediaLibraryServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v17 = 138412290;
    id v18 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated! %@", (uint8_t *)&v17, 0xCu);
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 setInvalidationHandler:0];

  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 hash]);

  unsigned __int8 v9 = (id *)(a1 + 40);
  id v10 = objc_loadWeakRetained(v9);
  id v11 = [v10 mediaLibraryProviderInfoList];
  [v11 removeObjectForKey:v8];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v12 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_loadWeakRetained(v9);
    __int16 v15 = [v14 mediaLibraryProviderInfoList];
    id v16 = [v15 count];
    int v17 = 134217984;
    id v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There are now %lu MediaLibraryProvider(s).", (uint8_t *)&v17, 0xCu);
  }
}

void __60__ACCMediaLibraryServer_listener_shouldAcceptNewConnection___block_invoke_172(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 5;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v6 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    unsigned __int8 v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

void __60__ACCMediaLibraryServer_listener_shouldAcceptNewConnection___block_invoke_174(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        int v8 = *(void **)(a1 + 32);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = __60__ACCMediaLibraryServer_listener_shouldAcceptNewConnection___block_invoke_2;
        v9[3] = &unk_100219958;
        v9[4] = v7;
        [v8 iterateMediaLibraryProviderListSync:v9];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __60__ACCMediaLibraryServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 remoteObject];
  id v6 = [*(id *)(a1 + 32) accessoryUID];
  objc_msgSend(v5, "accessoryMediaLibraryAttached:windowPerLibrary:", v6, objc_msgSend(*(id *)(a1 + 32), "windowPerLibrary"));

  *a3 = 1;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (void)accessoryMediaLibraryAttached:(id)a3 windowPerLibrary:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned __int8 v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    unsigned __int8 v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v17 = v6;
    __int16 v18 = 1024;
    int v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MediaLibrary server, accessoryMediaLibraryAttached: connection %@, windowPerLibrary %d", buf, 0x12u);
  }

  long long v10 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v6];

  if (!v10)
  {
    long long v11 = [[_ACCMediaLibraryAccessoryInfo alloc] initWithUID:v6 windowPerLibrary:v4];
    [(NSMutableDictionary *)self->_registeredAccessoryConnections setObject:v11 forKey:v6];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __72__ACCMediaLibraryServer_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke;
  v13[3] = &unk_100219980;
  id v14 = v6;
  int v15 = v4;
  id v12 = v6;
  [(ACCMediaLibraryServer *)self iterateMediaLibraryProviderListSync:v13];
}

void __72__ACCMediaLibraryServer_accessoryMediaLibraryAttached_windowPerLibrary___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 remoteObject];
  [v5 accessoryMediaLibraryAttached:*(void *)(a1 + 32) windowPerLibrary:*(unsigned int *)(a1 + 40)];

  *a3 = 1;
}

- (void)accessoryMediaLibraryDetached:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "MediaLibrary server, accessoryMediaLibraryDetached: connection %@", buf, 0xCu);
  }

  id v8 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v4];

  if (v8) {
    [(NSMutableDictionary *)self->_registeredAccessoryConnections removeObjectForKey:v4];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __55__ACCMediaLibraryServer_accessoryMediaLibraryDetached___block_invoke;
  v10[3] = &unk_100219958;
  id v11 = v4;
  id v9 = v4;
  [(ACCMediaLibraryServer *)self iterateMediaLibraryProviderListSync:v10];
}

void __55__ACCMediaLibraryServer_accessoryMediaLibraryDetached___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL v5 = [a2 remoteObject];
  [v5 accessoryMediaLibraryDetached:*(void *)(a1 + 32)];

  *a3 = 1;
}

- (void)accessoryMediaLibraryUpdate:(id)a3 windowPerLibrary:(unsigned int)a4
{
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v15 = v6;
    __int16 v16 = 1024;
    unsigned int v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MediaLibrary server, accessoryMediaLibraryUpdate: connection %@, windowPerLibrary %d", buf, 0x12u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __70__ACCMediaLibraryServer_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke;
  v11[3] = &unk_100219980;
  id v12 = v6;
  unsigned int v13 = a4;
  id v10 = v6;
  [(ACCMediaLibraryServer *)self iterateMediaLibraryProviderListSync:v11];
}

void __70__ACCMediaLibraryServer_accessoryMediaLibraryUpdate_windowPerLibrary___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL v5 = [a2 remoteObject];
  [v5 accessoryMediaLibraryUpdate:*(void *)(a1 + 32) windowPerLibrary:*(unsigned int *)(a1 + 40)];

  *a3 = 1;
}

- (void)startMediaLibraryUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 mediaItemProperties:(unint64_t)a6 playlistProperties:(unint64_t)a7 playlistContentStyle:(int)a8 playlistContentProperties:(unint64_t)a9 reqOptions:(unint64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  if (gLogObjects) {
    BOOL v19 = gNumLogObjects < 5;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v21 = &_os_log_default;
    id v20 = &_os_log_default;
  }
  else
  {
    id v21 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138413570;
    id v38 = v16;
    __int16 v39 = 2112;
    id v40 = v17;
    __int16 v41 = 2048;
    unint64_t v42 = a6;
    __int16 v43 = 2048;
    unint64_t v44 = a7;
    __int16 v45 = 2048;
    unint64_t v46 = a9;
    __int16 v47 = 2112;
    id v48 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "MediaLibrary server, startMediaLibraryUpdate: connection %@, library %@, mediaItemProperties=%llxh playlistProperties=%llxh playlistContentProperties=%llxh, lastRevision %@", buf, 0x3Eu);
  }

  id v22 = [(NSMutableDictionary *)self->_registeredAccessoryConnections objectForKey:v16];

  if (v22)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __167__ACCMediaLibraryServer_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke;
    v28[3] = &unk_1002199A8;
    id v29 = v16;
    id v23 = v17;
    id v30 = v23;
    id v31 = v18;
    unint64_t v32 = a6;
    int v36 = a8;
    unint64_t v33 = a7;
    unint64_t v34 = a9;
    unint64_t v35 = a10;
    if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v23 block:v28])
    {
      if (gLogObjects && gNumLogObjects >= 5)
      {
        id v24 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v24 = &_os_log_default;
        id v27 = &_os_log_default;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v38 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
      }
    }
    id v25 = v29;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v25 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v25 = &_os_log_default;
      id v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "accessory %@ not registered", buf, 0xCu);
    }
  }
}

void __167__ACCMediaLibraryServer_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObject];
  [v3 startMediaLibraryUpdate:*(void *)(a1 + 32) library:*(void *)(a1 + 40) lastRevision:*(void *)(a1 + 48) mediaItemProperties:*(void *)(a1 + 56) playlistProperties:*(void *)(a1 + 64) playlistContentStyle:*(unsigned int *)(a1 + 88) playlistContentProperties:*(void *)(a1 + 72) reqOptions:*(void *)(a1 + 80)];
}

- (void)stopMediaLibraryUpdate:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "MediaLibrary server, stopMediaLibraryUpdate: connection %@, library %@", buf, 0x16u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __56__ACCMediaLibraryServer_stopMediaLibraryUpdate_library___block_invoke;
  v15[3] = &unk_1002199D0;
  id v11 = v6;
  id v16 = v11;
  id v12 = v7;
  id v17 = v12;
  if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v12 block:v15])
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      unsigned int v13 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v13 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
    }
  }
}

void __56__ACCMediaLibraryServer_stopMediaLibraryUpdate_library___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObject];
  [v3 stopMediaLibraryUpdate:*(void *)(a1 + 32) library:*(void *)(a1 + 40)];
}

- (void)stopAllMediaLibraryUpdate:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCMediaLibraryServer stopAllMediaLibraryUpdate:]((uint64_t)v4, v7);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __51__ACCMediaLibraryServer_stopAllMediaLibraryUpdate___block_invoke;
  v9[3] = &unk_100219958;
  id v10 = v4;
  id v8 = v4;
  [(ACCMediaLibraryServer *)self iterateMediaLibraryProviderListSync:v9];
}

void __51__ACCMediaLibraryServer_stopAllMediaLibraryUpdate___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL v5 = [a2 remoteObject];
  [v5 stopAllMediaLibraryUpdate:*(void *)(a1 + 32)];

  *a3 = 1;
}

- (void)confirmUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5 updateCount:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 5;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    id v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138413058;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 1024;
    unsigned int v33 = a6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "MediaLibrary server, confirmUpdate: accessoryUID %@, library %@, lastRevision %@, count %d", buf, 0x26u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __72__ACCMediaLibraryServer_confirmUpdate_library_lastRevision_updateCount___block_invoke;
  v21[3] = &unk_1002199F8;
  id v16 = v10;
  id v22 = v16;
  id v17 = v11;
  id v23 = v17;
  id v18 = v12;
  id v24 = v18;
  unsigned int v25 = a6;
  if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v17 block:v21])
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v19 = &_os_log_default;
      id v20 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
    }
  }
}

void __72__ACCMediaLibraryServer_confirmUpdate_library_lastRevision_updateCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 5;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = *(_DWORD *)(a1 + 56);
    int v12 = 138413058;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MediaLibrary server, confirmUpdate: accessoryUID %@, library %@, lastRevision %@, count %d", (uint8_t *)&v12, 0x26u);
  }

  id v11 = [v3 remoteObject];
  [v11 confirmUpdate:*(void *)(a1 + 32) library:*(void *)(a1 + 40) lastRevision:*(void *)(a1 + 48) updateCount:*(unsigned int *)(a1 + 56)];
}

- (void)confirmPlaylistContentUpdate:(id)a3 library:(id)a4 lastRevision:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 5;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    uint64_t v13 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412802;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "MediaLibrary server, confirmPlaylistContentUpdate: accessoryUID %@, library %@, lastRevision %@", buf, 0x20u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __75__ACCMediaLibraryServer_confirmPlaylistContentUpdate_library_lastRevision___block_invoke;
  v19[3] = &unk_100219A20;
  id v14 = v8;
  id v20 = v14;
  id v15 = v9;
  id v21 = v15;
  id v16 = v10;
  id v22 = v16;
  if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v15 block:v19])
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      uint64_t v17 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v17 = &_os_log_default;
      id v18 = &_os_log_default;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
    }
  }
}

void __75__ACCMediaLibraryServer_confirmPlaylistContentUpdate_library_lastRevision___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 5;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[6];
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MediaLibrary server, confirmPlaylistContentUpdate: accessoryUID %@, library %@, lastRevision %@", (uint8_t *)&v11, 0x20u);
  }

  id v10 = [v3 remoteObject];
  [v10 confirmPlaylistContentUpdate:a1[4] library:a1[5] lastRevision:a1[6]];
}

- (void)playCurrentSelection:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCMediaLibraryServer playCurrentSelection:library:]();
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __54__ACCMediaLibraryServer_playCurrentSelection_library___block_invoke;
  v15[3] = &unk_1002199D0;
  id v11 = v6;
  id v16 = v11;
  id v12 = v7;
  id v17 = v12;
  if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v12 block:v15])
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      __int16 v13 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v13 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
    }
  }
}

void __54__ACCMediaLibraryServer_playCurrentSelection_library___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObject];
  [v3 playCurrentSelection:*(void *)(a1 + 32) library:*(void *)(a1 + 40)];
}

- (void)playItems:(id)a3 library:(id)a4 itemList:(id)a5 startIndex:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 5;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    __int16 v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138413058;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2048;
    id v31 = [v12 count];
    __int16 v32 = 1024;
    unsigned int v33 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MediaLibrary server, playItems: accessoryUID %@, library %@, count %lu, startIndex %d", buf, 0x26u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __63__ACCMediaLibraryServer_playItems_library_itemList_startIndex___block_invoke;
  v21[3] = &unk_1002199F8;
  id v16 = v10;
  id v22 = v16;
  id v17 = v11;
  id v23 = v17;
  id v18 = v12;
  id v24 = v18;
  unsigned int v25 = a6;
  if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v17 block:v21])
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v19 = &_os_log_default;
      id v20 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
    }
  }
}

void __63__ACCMediaLibraryServer_playItems_library_itemList_startIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObject];
  [v3 playItems:*(void *)(a1 + 32) library:*(void *)(a1 + 40) itemList:*(void *)(a1 + 48) startIndex:*(unsigned int *)(a1 + 56)];
}

- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startItem:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 5;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v16 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  else
  {
    id v16 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138413314;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2048;
    unint64_t v32 = a5;
    __int16 v33 = 2048;
    uint64_t v34 = a6;
    __int16 v35 = 2048;
    unint64_t v36 = a7;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "MediaLibrary server, playCollection with startItem: accessoryUID %@, library %@, collection %llu, type %ld, startItem %llu", buf, 0x34u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __74__ACCMediaLibraryServer_playCollection_library_collection_type_startItem___block_invoke;
  v21[3] = &unk_100219A48;
  id v17 = v12;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  unint64_t v24 = a5;
  int v26 = a6;
  unint64_t v25 = a7;
  if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v18 block:v21])
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v19 = &_os_log_default;
      id v20 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
    }
  }
}

void __74__ACCMediaLibraryServer_playCollection_library_collection_type_startItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObject];
  [v3 playCollection:*(void *)(a1 + 32) library:*(void *)(a1 + 40) collection:*(void *)(a1 + 48) type:*(unsigned int *)(a1 + 64) startItem:*(void *)(a1 + 56)];
}

- (void)playCollection:(id)a3 library:(id)a4 collection:(unint64_t)a5 type:(int)a6 startIndex:(unsigned int)a7
{
  id v12 = a3;
  id v13 = a4;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 5;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v16 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  else
  {
    id v16 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138413314;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2048;
    unint64_t v32 = a5;
    __int16 v33 = 2048;
    uint64_t v34 = a6;
    __int16 v35 = 1024;
    unsigned int v36 = a7;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "MediaLibrary server, playCollection with startIndex: accessoryUID %@, library %@, collection %llu, type %ld, startIndex %u", buf, 0x30u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __75__ACCMediaLibraryServer_playCollection_library_collection_type_startIndex___block_invoke;
  v21[3] = &unk_100219A70;
  id v17 = v12;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  unint64_t v24 = a5;
  int v25 = a6;
  unsigned int v26 = a7;
  if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v18 block:v21])
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v19 = &_os_log_default;
      id v20 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
    }
  }
}

void __75__ACCMediaLibraryServer_playCollection_library_collection_type_startIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObject];
  [v3 playCollection:*(void *)(a1 + 32) library:*(void *)(a1 + 40) collection:*(void *)(a1 + 48) type:*(unsigned int *)(a1 + 56) startIndex:*(unsigned int *)(a1 + 60)];
}

- (void)playAllSongs:(id)a3 library:(id)a4 startItem:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 5;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v12 = &_os_log_default;
    id v11 = &_os_log_default;
  }
  else
  {
    id v12 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACCMediaLibraryServer playAllSongs:library:startItem:]();
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __56__ACCMediaLibraryServer_playAllSongs_library_startItem___block_invoke;
  v17[3] = &unk_100219A98;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  unint64_t v20 = a5;
  if (![(ACCMediaLibraryServer *)self findMediaLibraryInfoSync:v14 block:v17])
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v15 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v15 = &_os_log_default;
      id v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "mediaLibrary %@ not found, did not call remoteObject", buf, 0xCu);
    }
  }
}

void __56__ACCMediaLibraryServer_playAllSongs_library_startItem___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 remoteObject];
  [v3 playAllSongs:a1[4] library:a1[5] startItem:a1[6]];
}

- (BOOL)_isDifferentLibraryList:(id)a3 otherList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    unint64_t v44 = v5;
    __int16 v45 = 2112;
    id v46 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_isDifferentLibraryList: list1=%@ list2=%@", buf, 0x16u);
  }

  if (v5 && v6)
  {
    BOOL v10 = objc_alloc_init((Class)NSMutableSet);
    id v11 = objc_alloc_init((Class)NSMutableSet);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v12 = v5;
    id v13 = [v12 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v39 + 1) + 8 * i) mediaLibraryUID];
          if (v17) {
            [v10 addObject:v17];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v14);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v18 = v6;
    id v19 = [v18 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)j), "mediaLibraryUID", (void)v35);
          if (v23) {
            [v11 addObject:v23];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v20);
    }

    if (gLogObjects && gNumLogObjects >= 5)
    {
      unint64_t v24 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unint64_t v24 = &_os_log_default;
      id v29 = &_os_log_default;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      unsigned int v30 = [v10 isEqual:v11];
      *(_DWORD *)long long buf = 138412802;
      unint64_t v44 = v10;
      __int16 v45 = 2112;
      id v46 = v11;
      __int16 v47 = 1024;
      unsigned int v48 = v30;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "_isDifferentLibraryList: set1=%@ set2=%@ [set1 isEqual:set2]=%d", buf, 0x1Cu);
    }

    unsigned int v31 = [v10 isEqual:v11] ^ 1;
  }
  else
  {
    BOOL v25 = v5 == 0;
    if (!v6) {
      BOOL v25 = 0;
    }
    if (gLogObjects) {
      BOOL v26 = gNumLogObjects <= 4;
    }
    else {
      BOOL v26 = 1;
    }
    int v27 = !v26;
    if (v6) {
      BOOL v28 = 1;
    }
    else {
      BOOL v28 = v5 == 0;
    }
    if (!v28 || v25)
    {
      if (v27)
      {
        BOOL v10 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        BOOL v10 = &_os_log_default;
        id v33 = &_os_log_default;
      }
      LOBYTE(v31) = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_isDifferentLibraryList: return true", buf, 2u);
      }
    }
    else
    {
      if (v27)
      {
        BOOL v10 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        BOOL v10 = &_os_log_default;
        id v32 = &_os_log_default;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_isDifferentLibraryList: return false", buf, 2u);
      }
      LOBYTE(v31) = 0;
    }
  }

  return v31;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __37__ACCMediaLibraryServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_9 != -1) {
    dispatch_once(&sharedServer_once_9, block);
  }
  BOOL v2 = (void *)sharedServer_sharedInstance_9;

  return v2;
}

uint64_t __37__ACCMediaLibraryServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance_9 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.medialibrary" andFeatureNotification:"com.apple.accessories.medialibrary.availability-changed"];

  return _objc_release_x1();
}

- (NSMutableDictionary)mediaLibraryProviderInfoList
{
  return self->_mediaLibraryProviderInfoList;
}

- (NSMutableDictionary)mediaLibraryProviderInfoListByProviderUID
{
  return self->_mediaLibraryProviderInfoListByProviderUID;
}

- (NSMutableDictionary)registeredAccessoryConnections
{
  return self->_registeredAccessoryConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredAccessoryConnections, 0);
  objc_storeStrong((id *)&self->_mediaLibraryProviderInfoListByProviderUID, 0);

  objc_storeStrong((id *)&self->_mediaLibraryProviderInfoList, 0);
}

- (void)stopAllMediaLibraryUpdate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "MediaLibrary server, stopAllMediaLibraryUpdate: connection %@", (uint8_t *)&v2, 0xCu);
}

- (void)playCurrentSelection:library:.cold.2()
{
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "MediaLibrary server, playCurrentSelection: accessoryUID %@, library %@");
}

- (void)playAllSongs:library:startItem:.cold.2()
{
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "MediaLibrary server, playAllSongs: accessoryUID %@, library %@");
}

@end