@interface ACCMediaLibraryServerRemote
- (ACCMediaLibraryServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)initConnection:(id)a3;
- (void)notify:(id)a3 stateChange:(int)a4 enabled:(BOOL)a5;
- (void)notifyAvailableLibraries:(id)a3 provider:(id)a4;
- (void)resetUpdate:(id)a3 accessory:(id)a4;
- (void)update:(id)a3 revision:(id)a4 content:(id)a5 accessory:(id)a6;
- (void)update:(id)a3 updates:(id)a4 accessory:(id)a5;
@end

@implementation ACCMediaLibraryServerRemote

- (ACCMediaLibraryServerRemote)initWithXPCConnection:(id)a3
{
  id v5 = a3;
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
    v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    v8 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = [v5 hash];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "initWithXPCConnection: XPCConnection=%lu", buf, 0xCu);
  }

  v12.receiver = self;
  v12.super_class = (Class)ACCMediaLibraryServerRemote;
  v9 = [(ACCMediaLibraryServerRemote *)&v12 init];
  v10 = v9;
  if (v9)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v9->_XPCConnection, a3);
    }
    else
    {

      v10 = 0;
    }
  }

  return v10;
}

- (void)initConnection:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  id v5 = +[ACCMediaLibraryServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(ACCMediaLibraryServerRemote *)self XPCConnection];
    BOOL v7 = [v5 performSelector:"shouldAcceptXPCConnection:" withObject:v6] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
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
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client has called initConnection method!", (uint8_t *)v14, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v11 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v14, 8u);
  }

  if (v7)
  {
    v13 = +[ACCMediaLibraryServer sharedServer];
    [v13 sendUpdatedSubscriberList];
  }
  v4[2](v4, v7);
}

- (void)notifyAvailableLibraries:(id)a3 provider:(id)a4
{
  id v5 = a3;
  id v25 = a4;
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
    BOOL v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    BOOL v8 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received notifyAvailableLibrarie mediaLibraries: %@", buf, 0xCu);
  }

  v26 = (char *)[v5 count];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v5;
  id v12 = (char *)[v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v28;
LABEL_13:
    v16 = 0;
    int v23 = v14;
    BOOL v17 = (unint64_t)v26 >= v14;
    v18 = &v26[-v14];
    if (v17) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    while (1)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(v11);
      }
      if (v19 == v16) {
        break;
      }
      v20 = [[ACCMediaLibraryUpdateLibraryInfo alloc] initWithDict:*(void *)(*((void *)&v27 + 1) + 8 * (void)v16)];
      [v9 addObject:v20];
      id v21 = [(ACCMediaLibraryUpdateLibraryInfo *)v20 copyDict];
      [v10 addObject:v21];

      if (v13 == ++v16)
      {
        v13 = (char *)[v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        int v14 = v23 + v16;
        if (v13) {
          goto LABEL_13;
        }
        break;
      }
    }
  }

  v22 = +[ACCMediaLibraryServer sharedServer];
  [v22 handleMediaLibraryList:v9 provider:v25 xpcConn:self->_XPCConnection];
}

- (void)notify:(id)a3 stateChange:(int)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v18 = a4;
    __int16 v19 = 1024;
    BOOL v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received notifyStateChange: statechange: %ld : %d", buf, 0x12u);
  }

  id v11 = +[ACCMediaLibraryServer sharedServer];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __58__ACCMediaLibraryServerRemote_notify_stateChange_enabled___block_invoke;
  v13[3] = &unk_100219260;
  id v14 = v7;
  int v15 = a4;
  BOOL v16 = v5;
  id v12 = v7;
  [v11 iterateAttachedConnectionsSync:v13];
}

uint64_t __58__ACCMediaLibraryServerRemote_notify_stateChange_enabled___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = platform_mediaLibrary_libraryStateUpdateHandler(a2, *(void **)(a1 + 32), *(_DWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
  *a3 = 1;
  return result;
}

- (void)update:(id)a3 updates:(id)a4 accessory:(id)a5
{
  id v25 = a3;
  id v7 = a4;
  id v24 = a5;
  int v23 = (char *)[v7 count];
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = (uint64_t)v24;
    __int16 v33 = 2112;
    id v34 = v25;
    __int16 v35 = 2048;
    v36 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MediaLibrary server remote update:updates:accessory: accessoryUID %@, library %@, count=%zu", buf, 0x20u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v26 = 0;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v17 = gLogObjects;
        int v18 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v19 = gNumLogObjects < 5;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v32 = v17;
            __int16 v33 = 1024;
            LODWORD(v34) = v18;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v20 = &_os_log_default;
          id v21 = &_os_log_default;
        }
        else
        {
          id v21 = *(id *)(gLogObjects + 32);
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413314;
          uint64_t v32 = (uint64_t)v24;
          __int16 v33 = 2112;
          id v34 = v25;
          __int16 v35 = 2048;
          v36 = (char *)i + v26;
          __int16 v37 = 2048;
          v38 = v23;
          __int16 v39 = 2112;
          uint64_t v40 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "MediaLibrary server remote update:updates:accessory: accessoryUID %@, library %@, index=%zu / count=%zu info=%@", buf, 0x34u);
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v27 objects:v41 count:16];
      v26 += (uint64_t)i;
    }
    while (v13);
  }

  v22 = +[ACCMediaLibraryServer sharedServer];
  platform_mediaLibrary_updateHandler(v24, v25, (int)[v22 nexUpdateStartFull:v25 accessory:v24], v11);
}

- (void)update:(id)a3 revision:(id)a4 content:(id)a5 accessory:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
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
    int v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    int v15 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 138413058;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MediaLibrary server remote update:revision:content:accessory: accessory=%@ library=%@ revision=%@ infoDict=%@", (uint8_t *)&v21, 0x2Au);
  }

  uint64_t v16 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];
  int v17 = [v16 unsignedCharValue];

  int v18 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"];
  id v19 = [v18 unsignedLongLongValue];

  id v20 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistItemList"];
  platform_mediaLibrary_updatePlaylistContentHandler(v12, v9, v10, (uint64_t)v19, v17, v20);
}

- (void)resetUpdate:(id)a3 accessory:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ACCMediaLibraryServer sharedServer];
  [v7 resetUpdate:v6 accessory:v5];
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
}

@end