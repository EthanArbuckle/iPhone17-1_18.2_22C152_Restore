@interface ACCMediaLibraryShimInfo
+ (BOOL)isItemAd:(id)a3;
+ (id)getMediaItemForContentItem:(id)a3 propertyList:(id)a4 playlistContent:(id)a5;
- (ACCMediaLibraryAccessory)accessory;
- (ACCMediaLibraryShim)context;
- (ACCMediaLibraryShimInfo)initWithMediaLibrary:(id)a3 accessory:(id)a4 Context:(id)a5 LibraryType:(int)a6;
- (BOOL)_isVisibleUpdate:(id)a3;
- (BOOL)enableLibraryUpdate;
- (BOOL)isShuttingDown;
- (BOOL)subscribedToAppleMusic;
- (MPMusicPlayerController)mpMusicPlayerControllerHandler;
- (NSArray)stationsGroupList;
- (NSString)UIDString;
- (NSString)anchor;
- (NSString)name;
- (OS_dispatch_queue)libraryUpdateQ;
- (OS_dispatch_queue)mpMusicPlayerControllerQueue;
- (OS_dispatch_semaphore)waitForWindowSem;
- (id)_beginMediaLibraryUpdatesWithAnchor:(id)a3 validity:(id)a4;
- (id)_getMediaItemForPersistentID:(unint64_t)a3;
- (id)_getUIDString;
- (id)_handleMediaLibraryItemUpdate:(id)a3 forLibrary:(id)a4 forProperties:(id)a5 success:(BOOL *)a6 forceDelete:(BOOL)a7;
- (id)_handleMediaLibraryPlaylistUpdate:(id)a3 forLibrary:(id)a4 forProperties:(id)a5 success:(BOOL *)a6;
- (id)_handlePlaylistContentForEntify:(id)a3 style:(int)a4 revision:(id)a5;
- (id)dbUpdateListDesc;
- (id)description;
- (id)getPlaylistItems:(id)a3;
- (id)mpMediaLibrary;
- (int)libraryType;
- (int64_t)_attemptUpdate:(id)a3;
- (int64_t)_checkAndWaitForWindowOk:(int64_t)a3;
- (void)_beginRadioLibraryUpdates;
- (void)_canShowCloudTracksDidChangeNotification:(id)a3;
- (void)_getUIDString;
- (void)_mediaLibraryChanged:(id)a3;
- (void)_radioLibraryChanged:(id)a3;
- (void)_registerForMPNotifications;
- (void)_sendRadioLibraryUpdates;
- (void)_startMLPlaybackOfAllSongsStartItem:(id)a3;
- (void)_startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirst:(id)a5 orIndex:(unsigned int)a6;
- (void)_startPlaybackOfRadioStation:(unint64_t)a3;
- (void)confirmMediaLibraryUpdateLastRevision:(id)a3 updateCount:(unsigned int)a4;
- (void)dealloc;
- (void)playWithQuery:(id)a3 andFirstItem:(id)a4;
- (void)setAnchor:(id)a3;
- (void)setMpMusicPlayerControllerHandler:(id)a3;
- (void)setMpMusicPlayerControllerQueue:(id)a3;
- (void)setStationsGroupList:(id)a3;
- (void)shuttingDown;
- (void)startMLPlaybackOfAllSongs;
- (void)startMLPlaybackOfAllSongsStartPersistentID:(unint64_t)a3;
- (void)startMLPlaybackWithResume:(BOOL)a3;
- (void)startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirst:(unsigned int)a5;
- (void)startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirstPersistentID:(unint64_t)a5;
- (void)startPlaybackOfItems:(id)a3 withFirst:(unsigned int)a4;
- (void)startSendingMediaLibraryUpdates:(id)a3 lastRevision:(id)a4 requestedTransferID:(BOOL)a5 requestedMetaList:(BOOL)a6 requestedMetaProperties:(BOOL)a7;
- (void)stopSendingMediaLibraryUpdates;
@end

@implementation ACCMediaLibraryShimInfo

+ (BOOL)isItemAd:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x22A65DE30]();
  v5 = [v3 valueForProperty:*MEMORY[0x263F113C0]];
  v6 = v5;
  if (v5) {
    int v7 = [v5 isEqualToString:&stru_26DA84CD0] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)getMediaItemForContentItem:(id)a3 propertyList:(id)a4 playlistContent:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = 0;
  if (v7 && v8)
  {
    id v11 = objc_alloc(MEMORY[0x263F22E78]);
    v12 = [v9 mediaLibraryUID];
    id v25 = v9;
    v10 = objc_msgSend(v11, "initWithMediaLibrary:persistentID:playlistPersistentID:", v12, objc_msgSend(v7, "persistentID"), objc_msgSend(v9, "persistentID"));

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v14) {
      goto LABEL_30;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    uint64_t v29 = *MEMORY[0x263F11260];
    uint64_t v28 = *MEMORY[0x263F112A0];
    uint64_t v27 = *MEMORY[0x263F11208];
    uint64_t v17 = *MEMORY[0x263F11238];
    uint64_t v18 = *MEMORY[0x263F11220];
    uint64_t v19 = *MEMORY[0x263F11400];
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        int v21 = [*(id *)(*((void *)&v30 + 1) + 8 * i) unsignedIntValue];
        if (v21 <= 11)
        {
          if (v21)
          {
            if (v21 == 1)
            {
              v22 = [v7 valueForProperty:v19];
              if (v22) {
                [v10 setTitle:v22];
              }
            }
            else
            {
              if (v21 != 6) {
                continue;
              }
              v22 = [v7 valueForProperty:v18];
              if (v22) {
                [v10 setAlbumTitle:v22];
              }
            }
LABEL_27:
          }
          else
          {
            uint64_t v23 = [v7 persistentID];
            if (v23) {
              [v10 setPersistentID:v23];
            }
          }
        }
        else
        {
          switch(v21)
          {
            case 12:
              v22 = [v7 valueForProperty:v17];
              if (v22) {
                [v10 setArtist:v22];
              }
              goto LABEL_27;
            case 14:
              v22 = [v7 valueForProperty:v27];
              if (v22) {
                [v10 setAlbumArtist:v22];
              }
              goto LABEL_27;
            case 16:
              v22 = [v7 valueForProperty:v28];
              if (v22) {
                [v10 setGenre:v22];
              }
              goto LABEL_27;
            case 18:
              v22 = [v7 valueForProperty:v29];
              if (v22) {
                [v10 setComposer:v22];
              }
              goto LABEL_27;
            default:
              continue;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (!v15)
      {
LABEL_30:

        id v9 = v25;
        id v8 = v26;
        break;
      }
    }
  }

  return v10;
}

- (NSString)name
{
  mpMediaLibrary = self->_mpMediaLibrary;
  if (mpMediaLibrary)
  {
    mpMediaLibrary = [mpMediaLibrary name];
  }
  return (NSString *)mpMediaLibrary;
}

- (id)_getUIDString
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int libraryType = self->_libraryType;
  if (libraryType == 2)
  {
    ACCRadioLibraryUIDString();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (libraryType)
  {
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
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = self->_libraryType;
      v10[0] = 67109120;
      v10[1] = v8;
      _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "ACCMediaLibraryShimInfo _getUIDString ERROR: Invalid libraryType(%d)", (uint8_t *)v10, 8u);
    }

    v4 = &stru_26DA84CD0;
  }
  else
  {
    ACCMediaLibraryShimUIDString(self->_mpMediaLibrary, [(ACCMediaLibraryShim *)self->_context subscribedToAppleMusic]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)subscribedToAppleMusic
{
  return [(ACCMediaLibraryShim *)self->_context subscribedToAppleMusic];
}

- (id)getPlaylistItems:(id)a3
{
  v4 = (void *)MEMORY[0x263F11E40];
  id v5 = a3;
  id v6 = [v4 defaultMediaLibrary];
  [MEMORY[0x263F11E40] setDefaultMediaLibrary:self->_mpMediaLibrary];
  id v7 = [NSNumber numberWithInteger:3319];
  int v8 = [MEMORY[0x263F11E60] predicateWithValue:v7 forProperty:*MEMORY[0x263F11358]];
  id v9 = NSNumber;
  uint64_t v10 = [v5 persistentID];

  uint64_t v11 = [v9 numberWithUnsignedLongLong:v10];
  v12 = [MEMORY[0x263F11E60] predicateWithValue:v11 forProperty:*MEMORY[0x263F11478]];
  id v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v12, v8, 0);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F11E68]) initWithFilterPredicates:v13];
  [v14 setGroupingType:6];
  uint64_t v15 = [v14 items];
  uint64_t v16 = [MEMORY[0x263EFF980] arrayWithArray:v15];
  [MEMORY[0x263F11E40] setDefaultMediaLibrary:v6];

  return v16;
}

- (id)_handlePlaylistContentForEntify:(id)a3 style:(int)a4 revision:(id)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v77 = v8;
    __int16 v78 = 1024;
    int v79 = a4;
    __int16 v80 = 2112;
    id v81 = v9;
    _os_log_impl(&dword_2269CB000, v12, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: entify=%@ contentStyle=%d revision=%@", buf, 0x1Cu);
  }

  if (!self->_enableLibraryUpdate)
  {
    uint64_t v15 = 0;
    dispatch_semaphore_t v13 = 0;
    goto LABEL_114;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = v8;
  if (a4 == 1)
  {
    int v57 = 1;
    [0 setContentStyle:1];
LABEL_19:
    int v59 = 0;
    goto LABEL_20;
  }
  if (a4 == 3)
  {
    int v57 = 0;
    goto LABEL_19;
  }
  uint64_t v15 = 0;
  if (a4 == 2)
  {
    int v57 = 0;
    int v59 = 1;
LABEL_20:
    id v60 = v9;
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F22E70]), "initWithMediaLibrary:persistentID:revision:", self->_UIDString, objc_msgSend(v14, "persistentID"), v9);
    uint64_t v16 = [(ACCMediaLibraryShimInfo *)self getPlaylistItems:v14];
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      uint64_t v18 = [(NSMutableDictionary *)self->_dbUpdateList objectForKey:@"PlaylistContentItemProperty"];
      v55 = v13;
      id v56 = v8;
      id v58 = v14;
      if (!v18)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v19 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCMediaLibraryShimInfo _getUIDString]();
          }
          uint64_t v19 = MEMORY[0x263EF8438];
          id v24 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v77 = v58;
          __int16 v78 = 1024;
          int v79 = a4;
          __int16 v80 = 2112;
          id v81 = v60;
          _os_log_impl(&dword_2269CB000, v19, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: entify=%@ contentStyle=%d revision=%@, cannot find ACC_ML_PLAYLIST_CONTENT_ITEM_PROPERTIES", buf, 0x1Cu);
        }
      }
      if (_sendOnlyInLibraryItemsForPlaylist())
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v25 = v17;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v69 objects:v75 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v70;
          while (2)
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v70 != v28) {
                objc_enumerationMutation(v25);
              }
              long long v30 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              if (!objc_msgSend(v30, "persistentID", v55, v56) || !objc_msgSend(v30, "existsInLibrary"))
              {
                int v31 = 1;
                goto LABEL_56;
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v69 objects:v75 count:16];
            int v31 = 0;
            if (v27) {
              continue;
            }
            break;
          }
        }
        else
        {
          int v31 = 0;
        }
LABEL_56:
      }
      else
      {
        int v31 = 0;
      }
      if (gLogObjects) {
        BOOL v32 = gNumLogObjects <= 0;
      }
      else {
        BOOL v32 = 1;
      }
      int v33 = !v32;
      if (v57 | v31 ^ 1) == 1 && ((v59 ^ 1))
      {
        if (v33)
        {
          v34 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCMediaLibraryShimInfo _getUIDString]();
          }
          v34 = MEMORY[0x263EF8438];
          id v43 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v77 = v58;
          __int16 v78 = 1024;
          int v79 = a4;
          __int16 v80 = 2112;
          id v81 = v60;
          _os_log_impl(&dword_2269CB000, v34, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: entify=%@ contentStyle=%d revision=%@, PlaylistContentStylePersistentIDs", buf, 0x1Cu);
        }

        [v15 setContentStyle:1];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v44 = v17;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v62 != v47) {
                objc_enumerationMutation(v44);
              }
              v49 = *(void **)(*((void *)&v61 + 1) + 8 * j);
              if (objc_msgSend(v49, "persistentID", v55, v56)
                && (([v49 existsInLibrary] & 1) != 0 || (_sendOnlyInLibraryItemsForPlaylist() & 1) == 0))
              {
                objc_msgSend(v15, "addContentPersistentID:", objc_msgSend(v49, "persistentID"));
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v61 objects:v73 count:16];
          }
          while (v46);
        }
      }
      else
      {
        if (v33)
        {
          uint64_t v35 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCMediaLibraryShimInfo _getUIDString]();
          }
          uint64_t v35 = MEMORY[0x263EF8438];
          id v36 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v77 = v58;
          __int16 v78 = 1024;
          int v79 = a4;
          __int16 v80 = 2112;
          id v81 = v60;
          _os_log_impl(&dword_2269CB000, v35, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: entify=%@ contentStyle=%d revision=%@, PlaylistContentStyleRecords", buf, 0x1Cu);
        }

        [v15 setContentStyle:2];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v37 = v17;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v66;
          do
          {
            for (uint64_t k = 0; k != v39; ++k)
            {
              if (*(void *)v66 != v40) {
                objc_enumerationMutation(v37);
              }
              v42 = +[ACCMediaLibraryShimInfo getMediaItemForContentItem:propertyList:playlistContent:](ACCMediaLibraryShimInfo, "getMediaItemForContentItem:propertyList:playlistContent:", *(void *)(*((void *)&v65 + 1) + 8 * k), v18, v15, v55, v56);
              [v15 addContentItem:v42];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v65 objects:v74 count:16];
          }
          while (v39);
        }
      }

      dispatch_semaphore_t v13 = v55;
      id v8 = v56;
      id v14 = v58;
    }
    else
    {
      if (gLogObjects) {
        BOOL v20 = gNumLogObjects <= 0;
      }
      else {
        BOOL v20 = 1;
      }
      int v21 = !v20;
      if (v59)
      {
        if (v21)
        {
          v22 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCMediaLibraryShimInfo _getUIDString]();
          }
          v22 = MEMORY[0x263EF8438];
          id v50 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v77 = v14;
          __int16 v78 = 1024;
          int v79 = a4;
          __int16 v80 = 2112;
          id v81 = v60;
          _os_log_impl(&dword_2269CB000, v22, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: EMPTY! entify=%@ contentStyle=%d revision=%@, PlaylistContentStyleRecords", buf, 0x1Cu);
        }

        v51 = v15;
        uint64_t v52 = 2;
      }
      else
      {
        if (v21)
        {
          uint64_t v23 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCMediaLibraryShimInfo _getUIDString]();
          }
          uint64_t v23 = MEMORY[0x263EF8438];
          id v53 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v77 = v14;
          __int16 v78 = 1024;
          int v79 = a4;
          __int16 v80 = 2112;
          id v81 = v60;
          _os_log_impl(&dword_2269CB000, v23, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: EMPTY! entify=%@ contentStyle=%d revision=%@, PlaylistContentStylePersistentIDs", buf, 0x1Cu);
        }

        v51 = v15;
        uint64_t v52 = 1;
      }
      [v51 setContentStyle:v52];
    }
    id v9 = v60;
  }

LABEL_114:
  return v15;
}

- (id)_handleMediaLibraryPlaylistUpdate:(id)a3 forLibrary:(id)a4 forProperties:(id)a5 success:(BOOL *)a6
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!a6) {
    ACCMediaLibraryShimUIDString_cold_1();
  }
  v12 = v11;
  *a6 = 1;
  dispatch_semaphore_t v13 = [v9 entity];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      uint64_t v18 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v72 = v13;
      _os_log_impl(&dword_2269CB000, v18, OS_LOG_TYPE_DEFAULT, "_handleMediaLibraryPlaylistUpdate: NOT playlist entity=%@", buf, 0xCu);
    }

    long long v64 = 0;
    int v21 = 0;
    goto LABEL_26;
  }
  uint64_t v14 = *MEMORY[0x263F11458];
  uint64_t v15 = [v13 valueForProperty:*MEMORY[0x263F11458]];
  if (![v15 BOOLValue])
  {

    goto LABEL_12;
  }
  BOOL v16 = [(ACCMediaLibraryShim *)self->_context isGeniusMixesSupported];

  if (v16)
  {
LABEL_12:
    uint64_t v62 = v14;
    uint64_t v19 = [v13 valueForProperty:v14];
    if ([v19 BOOLValue])
    {
    }
    else
    {
      v22 = [v13 valueForProperty:*MEMORY[0x263F11460]];
      int v23 = [v22 BOOLValue];

      if (v23)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v17 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCMediaLibraryShimInfo _getUIDString]();
          }
          uint64_t v17 = MEMORY[0x263EF8438];
          id v56 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
          goto LABEL_76;
        }
        *(_WORD *)buf = 0;
        v55 = "_handleMediaLibraryPlaylistUpdates: skip, not GeniusMix && isHidden";
        goto LABEL_75;
      }
    }
    if (![v9 deletionType])
    {
      id v28 = objc_alloc(MEMORY[0x263F22E68]);
      UIDString = self->_UIDString;
      uint64_t v30 = [v13 persistentID];
      int v31 = [v9 anchor];
      id v25 = (void *)[v28 initWithMediaLibrary:UIDString persistentID:v30 revision:v31];

      if (self->_requestedTransferID) {
        objc_msgSend(v25, "setContentStyle:", objc_msgSend(v25, "contentStyle") | 1);
      }
      id v59 = v10;
      uint64_t v32 = v62;
      if (self->_requestedMetaList && self->_requestedMetaProperties) {
        objc_msgSend(v25, "setContentStyle:", objc_msgSend(v25, "contentStyle") | 2);
      }
      long long v61 = v9;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v58 = v12;
      id v33 = v12;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v67 objects:v73 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        long long v64 = 0;
        uint64_t v36 = *(void *)v68;
        uint64_t v37 = *MEMORY[0x263F11450];
        uint64_t v66 = *MEMORY[0x263F11470];
        uint64_t v65 = *MEMORY[0x263F11468];
        id v60 = v13;
LABEL_38:
        uint64_t v38 = 0;
        while (2)
        {
          if (*(void *)v68 != v36) {
            objc_enumerationMutation(v33);
          }
          switch([*(id *)(*((void *)&v67 + 1) + 8 * v38) unsignedIntValue])
          {
            case 1u:
              uint64_t v39 = [v13 valueForProperty:v65];
              if (v39) {
                [v25 setName:v39];
              }
              goto LABEL_61;
            case 2u:
              uint64_t v40 = [v13 valueForProperty:v66];
              uint64_t v39 = v40;
              if (v40) {
                objc_msgSend(v25, "setParentPersistentID:", objc_msgSend(v40, "unsignedLongLongValue"));
              }
              goto LABEL_61;
            case 3u:
              v41 = [v13 valueForProperty:v32];
              uint64_t v39 = v41;
              if (v41) {
                objc_msgSend(v25, "setGeniusMix:", objc_msgSend(v41, "intValue") != 0);
              }
              goto LABEL_61;
            case 4u:
              v42 = [v13 valueForProperty:v37];
              uint64_t v39 = v42;
              if (v42) {
                objc_msgSend(v25, "setFolder:", objc_msgSend(v42, "intValue") != 0);
              }
              goto LABEL_61;
            case 5u:
              if (![v25 contentStyle]) {
                goto LABEL_62;
              }
              uint64_t v39 = [v13 valueForProperty:v32];
              uint64_t v43 = v37;
              id v44 = [v13 valueForProperty:v37];
              if ([v39 BOOLValue] & 1) != 0 || (objc_msgSend(v44, "BOOLValue"))
              {
                uint64_t v45 = 0;
              }
              else
              {
                uint64_t v48 = [v25 contentStyle];
                uint64_t v49 = [v61 anchor];
                id v50 = v13;
                v51 = (void *)v49;
                uint64_t v52 = [(ACCMediaLibraryShimInfo *)self _handlePlaylistContentForEntify:v50 style:v48 revision:v49];

                [v25 setContent:v52];
                id v53 = [v25 content];

                if (v53) {
                  uint64_t v45 = [v52 contentStyle];
                }
                else {
                  uint64_t v45 = 0;
                }
                long long v64 = v52;
                uint64_t v32 = v62;
                dispatch_semaphore_t v13 = v60;
              }
              [v25 setContentStyle:v45];

              uint64_t v37 = v43;
LABEL_61:

LABEL_62:
              if (v35 != ++v38) {
                continue;
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v67 objects:v73 count:16];
              if (!v35) {
                goto LABEL_81;
              }
              goto LABEL_38;
            case 8u:
              unint64_t v46 = [v13 playlistAttributes];
              uint64_t v47 = [NSNumber numberWithBool:(v46 >> 1) & 1];
              uint64_t v39 = v47;
              if (v47) {
                objc_msgSend(v25, "setSmartPlaylist:", objc_msgSend(v47, "intValue") != 0);
              }
              goto LABEL_61;
            default:
              goto LABEL_62;
          }
        }
      }
      long long v64 = 0;
LABEL_81:

      int v21 = 0;
      id v9 = v61;
      v12 = v58;
      id v10 = v59;
      goto LABEL_27;
    }
    uint64_t v24 = [v13 persistentID];
    int v21 = [NSNumber numberWithUnsignedLongLong:v24];
    long long v64 = 0;
LABEL_26:
    id v25 = 0;
LABEL_27:
    if (v25) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = v21;
    }
    id v27 = v26;
    goto LABEL_77;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v17 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v17 = MEMORY[0x263EF8438];
    id v54 = MEMORY[0x263EF8438];
  }
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    goto LABEL_76;
  }
  *(_WORD *)buf = 0;
  v55 = "_handleMediaLibraryPlaylistUpdate: skip, GeniusMix but not supported";
LABEL_75:
  _os_log_impl(&dword_2269CB000, v17, OS_LOG_TYPE_INFO, v55, buf, 2u);
LABEL_76:

  long long v64 = 0;
  int v21 = 0;
  id v25 = 0;
  id v27 = 0;
LABEL_77:

  return v27;
}

- (id)_handleMediaLibraryItemUpdate:(id)a3 forLibrary:(id)a4 forProperties:(id)a5 success:(BOOL *)a6 forceDelete:(BOOL)a7
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  dispatch_semaphore_t v13 = [v11 entity];
  *a6 = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      BOOL v16 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v13;
      _os_log_impl(&dword_2269CB000, v16, OS_LOG_TYPE_DEFAULT, "_handleMediaLibraryItemUpdate: NOT mediaItem entity=%@", buf, 0xCu);
    }

    goto LABEL_14;
  }
  if (a7 || [v11 deletionType])
  {
    uint64_t v14 = [v13 persistentID];
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v14];
LABEL_15:
    uint64_t v18 = 0;
    goto LABEL_16;
  }
  v22 = [v13 valueForProperty:*MEMORY[0x263F11358]];
  __int16 v23 = [v22 integerValue];

  __int16 v67 = v23;
  if ((v23 & 0xCF7) == 0)
  {
LABEL_14:
    uint64_t v15 = 0;
    goto LABEL_15;
  }
  id v24 = objc_alloc(MEMORY[0x263F22E58]);
  UIDString = self->_UIDString;
  uint64_t v26 = [v13 persistentID];
  id v27 = [v11 anchor];
  uint64_t v18 = (void *)[v24 initWithMediaLibrary:UIDString persistentID:v26 revision:v27];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v48 = v12;
  id v28 = v12;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v69;
    uint64_t v66 = *MEMORY[0x263F112D8];
    uint64_t v65 = *MEMORY[0x263F112E0];
    uint64_t v64 = *MEMORY[0x263F11260];
    uint64_t v63 = *MEMORY[0x263F11268];
    uint64_t v62 = *MEMORY[0x263F112A0];
    uint64_t v61 = *MEMORY[0x263F112A8];
    uint64_t v60 = *MEMORY[0x263F11208];
    uint64_t v59 = *MEMORY[0x263F11210];
    uint64_t v58 = *MEMORY[0x263F11238];
    uint64_t v57 = *MEMORY[0x263F11240];
    uint64_t v56 = *MEMORY[0x263F11270];
    uint64_t v55 = *MEMORY[0x263F11278];
    uint64_t v54 = *MEMORY[0x263F11228];
    uint64_t v53 = *MEMORY[0x263F11230];
    uint64_t v52 = *MEMORY[0x263F11220];
    uint64_t v51 = *MEMORY[0x263F11218];
    uint64_t v50 = *MEMORY[0x263F11380];
    uint64_t v49 = *MEMORY[0x263F113A0];
    uint64_t v32 = *MEMORY[0x263F11400];
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v69 != v31) {
          objc_enumerationMutation(v28);
        }
        switch([*(id *)(*((void *)&v68 + 1) + 8 * i) unsignedIntValue])
        {
          case 1u:
            uint64_t v34 = [v13 valueForProperty:v32];
            if (v34) {
              [v18 setTitle:v34];
            }
            goto LABEL_71;
          case 2u:
            if ((v67 & 0x801) != 0) {
              [v18 setType:0];
            }
            if ((v67 & 0x402) != 0) {
              [v18 setType:1];
            }
            if ((v67 & 4) != 0) {
              [v18 setType:2];
            }
            continue;
          case 3u:
            uint64_t v35 = [v13 valueForProperty:v49];
            uint64_t v34 = v35;
            if (v35) {
              objc_msgSend(v18, "setRating:", objc_msgSend(v35, "unsignedLongValue"));
            }
            goto LABEL_71;
          case 4u:
            uint64_t v36 = [v13 valueForProperty:v50];
            uint64_t v34 = v36;
            if (v36)
            {
              [v36 doubleValue];
              [v18 setDuration:(v37 * 1000.0)];
            }
            goto LABEL_71;
          case 5u:
            uint64_t v38 = [v13 valueForProperty:v51];
            uint64_t v34 = v38;
            if (v38) {
              objc_msgSend(v18, "setAlbumPersistentID:", objc_msgSend(v38, "unsignedLongLongValue"));
            }
            goto LABEL_71;
          case 6u:
            uint64_t v34 = [v13 valueForProperty:v52];
            if (v34) {
              [v18 setAlbumTitle:v34];
            }
            goto LABEL_71;
          case 7u:
            uint64_t v39 = [v13 valueForProperty:v53];
            uint64_t v34 = v39;
            if (v39) {
              objc_msgSend(v18, "setAlbumTrackNumber:", (unsigned __int16)objc_msgSend(v39, "unsignedIntValue"));
            }
            goto LABEL_71;
          case 8u:
            uint64_t v40 = [v13 valueForProperty:v54];
            uint64_t v34 = v40;
            if (v40) {
              objc_msgSend(v18, "setAlbumTrackCount:", (unsigned __int16)objc_msgSend(v40, "unsignedIntValue"));
            }
            goto LABEL_71;
          case 9u:
            v41 = [v13 valueForProperty:v55];
            uint64_t v34 = v41;
            if (v41) {
              objc_msgSend(v18, "setAlbumDiscNumber:", (unsigned __int16)objc_msgSend(v41, "unsignedIntValue"));
            }
            goto LABEL_71;
          case 0xAu:
            v42 = [v13 valueForProperty:v56];
            uint64_t v34 = v42;
            if (v42) {
              objc_msgSend(v18, "setAlbumDiscCount:", (unsigned __int16)objc_msgSend(v42, "unsignedIntValue"));
            }
            goto LABEL_71;
          case 0xBu:
            uint64_t v43 = [v13 valueForProperty:v57];
            uint64_t v34 = v43;
            if (v43) {
              objc_msgSend(v18, "setArtistPersistentID:", objc_msgSend(v43, "unsignedLongLongValue"));
            }
            goto LABEL_71;
          case 0xCu:
            uint64_t v34 = [v13 valueForProperty:v58];
            if (v34) {
              [v18 setArtist:v34];
            }
            goto LABEL_71;
          case 0xDu:
            id v44 = [v13 valueForProperty:v59];
            uint64_t v34 = v44;
            if (v44) {
              objc_msgSend(v18, "setAlbumArtistPersistentID:", objc_msgSend(v44, "unsignedLongLongValue"));
            }
            goto LABEL_71;
          case 0xEu:
            uint64_t v34 = [v13 valueForProperty:v60];
            if (v34) {
              [v18 setAlbumArtist:v34];
            }
            goto LABEL_71;
          case 0xFu:
            uint64_t v45 = [v13 valueForProperty:v61];
            uint64_t v34 = v45;
            if (v45) {
              objc_msgSend(v18, "setGenrePersistentID:", objc_msgSend(v45, "unsignedLongLongValue"));
            }
            goto LABEL_71;
          case 0x10u:
            uint64_t v34 = [v13 valueForProperty:v62];
            if (v34) {
              [v18 setGenre:v34];
            }
            goto LABEL_71;
          case 0x11u:
            unint64_t v46 = [v13 valueForProperty:v63];
            uint64_t v34 = v46;
            if (v46) {
              objc_msgSend(v18, "setComposerPersistentID:", objc_msgSend(v46, "unsignedLongLongValue"));
            }
            goto LABEL_71;
          case 0x12u:
            uint64_t v34 = [v13 valueForProperty:v64];
            if (v34) {
              [v18 setComposer:v34];
            }
            goto LABEL_71;
          case 0x13u:
            uint64_t v47 = [v13 valueForProperty:v65];
            uint64_t v34 = v47;
            if (v47) {
              objc_msgSend(v18, "setPartOfCompilation:", objc_msgSend(v47, "intValue") != 0);
            }
            goto LABEL_71;
          case 0x19u:
            uint64_t v34 = [v13 valueForProperty:v66];
            objc_msgSend(v18, "setLocal:", objc_msgSend(v34, "BOOLValue"));
            goto LABEL_71;
          case 0x1Bu:
            uint64_t v34 = [v13 chaptersOfType:1];
            objc_msgSend(v18, "setChapterCount:", (unsigned __int16)objc_msgSend(v34, "count"));
LABEL_71:

            break;
          default:
            continue;
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v30);
  }

  uint64_t v15 = 0;
  id v12 = v48;
LABEL_16:
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v15;
  }
  id v20 = v19;

  return v20;
}

- (BOOL)_isVisibleUpdate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 deletionType])
    {
      char v5 = 1;
    }
    else
    {
      id v6 = [v4 entity];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [v6 valueForProperty:*MEMORY[0x263F11458]];
        if ([v7 BOOLValue])
        {

          char v5 = 1;
        }
        else
        {
          id v10 = [v6 valueForProperty:*MEMORY[0x263F11460]];
          char v11 = [v10 BOOLValue];

          char v5 = v11 ^ 1;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v6 valueForProperty:*MEMORY[0x263F11358]];
          __int16 v9 = [v8 integerValue];

          char v5 = (v9 & 0x1CFF) != 0;
        }
        else
        {
          char v5 = 0;
        }
      }
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (int64_t)_checkAndWaitForWindowOk:(int64_t)a3
{
  int64_t v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    waitForWindowSem = self->_waitForWindowSem;
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    intptr_t v7 = dispatch_semaphore_wait(waitForWindowSem, v6);
    if (self->_isShuttingDown || !self->_enableLibraryUpdate)
    {
      if (gLogObjects) {
        BOOL v8 = gNumLogObjects < 1;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v10 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      else
      {
        id v10 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v13 = 134217984;
        uint64_t v14 = 2;
        _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_INFO, "_checkAndWaitForWindowOk: lastUpdateResult=%ld, not _enableLibraryUpdate after waiting on _waitForWindowSem", (uint8_t *)&v13, 0xCu);
      }
      int64_t v3 = 3;
    }
    else
    {
      if (!v7) {
        return 2;
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v10 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v13 = 134217984;
        int64_t v3 = 2;
        uint64_t v14 = 2;
        _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_INFO, "_checkAndWaitForWindowOk: lastUpdateResult=%ld, timeout waiting on _waitForWindowSem", (uint8_t *)&v13, 0xCu);
      }
      else
      {
        int64_t v3 = 2;
      }
    }
  }
  return v3;
}

- (int64_t)_attemptUpdate:(id)a3
{
  v4 = (uint64_t (**)(void))a3;
  if (!self->_isShuttingDown)
  {
    while (self->_enableLibraryUpdate)
    {
      int64_t v7 = [(ACCMediaLibraryShimInfo *)self _checkAndWaitForWindowOk:v4[2](v4)];
      if (self->_isShuttingDown) {
        break;
      }
      int64_t v5 = v7;
      if (!self->_enableLibraryUpdate || v7 != 2)
      {
        if (self->_enableLibraryUpdate) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  int64_t v5 = 3;
LABEL_3:

  return v5;
}

- (id)_beginMediaLibraryUpdatesWithAnchor:(id)a3 validity:(id)a4
{
  uint64_t v367 = *MEMORY[0x263EF8340];
  v280 = (__CFString *)a3;
  id v275 = a4;
  v288 = self;
  obuint64_t j = [self->_mpMediaLibrary _syncValidity];
  BOOL v8 = [(ACCMediaLibraryShim *)self->_context measureMemoryUsage];
  int v9 = [v8 BOOLValue];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v353 = v9 ^ 1;
    *(_WORD *)&v353[4] = 2112;
    *(void *)&v353[6] = v280;
    *(_WORD *)&v353[14] = 2112;
    *(void *)&v353[16] = v275;
    *(_WORD *)&v353[24] = 2112;
    *(void *)&v353[26] = v288;
    _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: bMeasureMemoryUsage=%d anchorTo=%@ validity=%@  %@", buf, 0x26u);
  }

  if (v288->_isShuttingDown)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    v276 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v353 = v280;
      *(_WORD *)&v353[8] = 2112;
      *(void *)&v353[10] = v275;
      _os_log_impl(&dword_2269CB000, v12, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: anchorTo=%@ validity=%@ ShuttingDown, ignore", buf, 0x16u);
    }
    BOOL v16 = 0;
    goto LABEL_372;
  }
  v288->_processingDiffUpdate = 1;
  v276 = GetMediaLibraryHelper();
  int v270 = [v276 getFilteredMediaTypesMask:7423];
  BOOL v13 = v280 == 0;
  if (!v280)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      uint64_t v14 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v353 = 0;
      *(_WORD *)&v353[8] = 2112;
      *(void *)&v353[10] = v275;
      _os_log_impl(&dword_2269CB000, v14, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: Begin Full Database Update. anchorTo=%@ validity=%@", buf, 0x16u);
    }
  }
  if ([obj isEqualToString:v275])
  {
    uint64_t v18 = v280;
  }
  else
  {
    uint64_t v19 = v280;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        -[ACCMediaLibraryShimInfo _getUIDString]();
        uint64_t v19 = v280;
      }
      id v20 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v353 = v19;
      *(_WORD *)&v353[8] = 2112;
      *(void *)&v353[10] = v275;
      *(_WORD *)&v353[18] = 2112;
      *(void *)&v353[20] = obj;
      _os_log_impl(&dword_2269CB000, v20, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: Begin Full Database Update. anchorTo=%@ validity=%@ libraryValidity=%@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v288->_syncValidityPersistentID, obj);
    uint64_t v18 = @"0";
    BOOL v13 = 1;
  }
  v280 = v18;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v22 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    v22 = MEMORY[0x263EF8438];
    id v23 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v353 = v18;
    *(_WORD *)&v353[8] = 1024;
    *(_DWORD *)&v353[10] = v270;
    _os_log_impl(&dword_2269CB000, v22, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: anchorTo=%@ call enumerateEntityChangesAfterSyncAnchor:usingBlock, validMediaTypeMask=%xh", buf, 0x12u);
  }

  uint64_t v344 = 0;
  v345 = (int *)&v344;
  uint64_t v346 = 0x2020000000;
  int v347 = 0;
  uint64_t v338 = 0;
  v339 = &v338;
  uint64_t v340 = 0x3032000000;
  v341 = __Block_byref_object_copy_;
  v342 = __Block_byref_object_dispose_;
  id v343 = 0;
  uint64_t v334 = 0;
  v335 = &v334;
  uint64_t v336 = 0x2020000000;
  char v337 = 0;
  uint64_t v330 = 0;
  v331 = &v330;
  uint64_t v332 = 0x2020000000;
  char v333 = 0;
  uint64_t v326 = 0;
  v327 = &v326;
  uint64_t v328 = 0x2020000000;
  int v329 = 0;
  id v24 = [(ACCMediaLibraryShim *)v288->_context measureMemoryUsage];
  if (![v24 BOOLValue])
  {
    v279 = 0;
LABEL_60:

    goto LABEL_61;
  }
  id v25 = [(ACCMediaLibraryShim *)v288->_context memUse];
  BOOL v26 = v25 == 0;

  if (!v26)
  {
    id v27 = [(ACCMediaLibraryShim *)v288->_context memUse];
    [v27 mark:@"mlUpdateMark"];

    id v28 = [(ACCMediaLibraryShim *)v288->_context memUse];
    v279 = [v28 getMark:@"mlUpdateMark"];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v24 = MEMORY[0x263EF8438];
      id v29 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = [v279 residentMem];
      uint64_t v31 = [v30 start];
      uint64_t v32 = [v279 virtualMem];
      int64_t v5 = (void *)[v32 start];
      uint64_t v4 = [v279 physFootprintMem];
      uint64_t v33 = [(id)v4 start];
      *(_DWORD *)buf = 138413058;
      *(void *)v353 = v280;
      *(_WORD *)&v353[8] = 2048;
      *(void *)&v353[10] = v31;
      *(_WORD *)&v353[18] = 2048;
      *(void *)&v353[20] = v5;
      *(_WORD *)&v353[28] = 2048;
      *(void *)&v353[30] = v33;
      _os_log_impl(&dword_2269CB000, v24, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: anchorTo=%@ memUse:[residentStart=%llu virtualStart=%llu physFootprintStart=%llu]", buf, 0x2Au);
    }
    goto LABEL_60;
  }
  v279 = 0;
LABEL_61:
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  *((unsigned char *)v335 + 24) = 1;
  id mpMediaLibrary = v288->_mpMediaLibrary;
  v321[0] = MEMORY[0x263EF8330];
  v321[1] = 3221225472;
  v321[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke;
  v321[3] = &unk_2647C01A8;
  v321[4] = v288;
  id v36 = v34;
  id v322 = v36;
  v323 = &v344;
  v324 = &v338;
  v325 = &v334;
  [mpMediaLibrary enumerateEntityChangesAfterSyncAnchor:v280 maximumRevisionType:1 usingBlock:v321];
  double v37 = @"0";
  if (v280) {
    double v37 = v280;
  }
  v286 = v37;
  int v272 = [v36 count];
  id v269 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v38 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v38 = MEMORY[0x263EF8438];
    id v39 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    uint64_t v40 = [v36 count];
    int v41 = *((unsigned __int8 *)v335 + 24);
    *(_DWORD *)buf = 138413058;
    *(void *)v353 = v286;
    *(_WORD *)&v353[8] = 1024;
    *(_DWORD *)&v353[10] = v272;
    *(_WORD *)&v353[14] = 2048;
    *(void *)&v353[16] = v40;
    *(_WORD *)&v353[24] = 1024;
    *(_DWORD *)&v353[26] = v41;
    _os_log_impl(&dword_2269CB000, v38, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: initial diffs, nextAnchor=%@ total=%d allChanges.count=%lu endOfDiffsReached=%d\n", buf, 0x22u);
  }

  if (v13)
  {
    v42 = v288;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v43 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        -[ACCMediaLibraryShimInfo _getUIDString]();
        v42 = v288;
      }
      uint64_t v43 = MEMORY[0x263EF8438];
      id v44 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      UIDString = v42->_UIDString;
      *(_DWORD *)buf = 138412290;
      *(void *)v353 = UIDString;
      _os_log_impl(&dword_2269CB000, v43, OS_LOG_TYPE_INFO, "Full Updates! resetUpdate: %@", buf, 0xCu);
    }

    unint64_t v46 = [(ACCMediaLibraryShim *)v288->_context delegate];
    uint64_t v47 = [v46 provider];
    [v47 resetUpdate:v288->_UIDString accessory:v288->_accessory];
  }
  id v48 = v288;
  if (v288->_sendPlayAllSongsCapable)
  {
    if (gLogObjects) {
      BOOL v49 = gNumLogObjects <= 0;
    }
    else {
      BOOL v49 = 1;
    }
    int v50 = !v49;
    if (v288->_libraryType)
    {
      if (v50)
      {
        uint64_t v51 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          -[ACCMediaLibraryShimInfo _getUIDString]();
          id v48 = v288;
        }
        uint64_t v51 = MEMORY[0x263EF8438];
        id v53 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        int libraryType = v48->_libraryType;
        uint64_t v55 = v48->_UIDString;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v353 = libraryType;
        *(_WORD *)&v353[4] = 2112;
        *(void *)&v353[6] = v55;
        _os_log_impl(&dword_2269CB000, v51, OS_LOG_TYPE_INFO, "send type=%d PlayAllSongsCapable:NO UIDString=%@", buf, 0x12u);
      }

      uint64_t v56 = [(ACCMediaLibraryShim *)v288->_context delegate];
      [v56 notify:v288->_UIDString stateChange:1 enabled:0];
    }
    else
    {
      if (v50)
      {
        uint64_t v52 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          -[ACCMediaLibraryShimInfo _getUIDString]();
          id v48 = v288;
        }
        uint64_t v52 = MEMORY[0x263EF8438];
        id v57 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        int v58 = v48->_libraryType;
        uint64_t v59 = v48->_UIDString;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v353 = v58;
        *(_WORD *)&v353[4] = 2112;
        *(void *)&v353[6] = v59;
        _os_log_impl(&dword_2269CB000, v52, OS_LOG_TYPE_INFO, "send type=%d PlayAllSongsCapable:YES UIDString=%@", buf, 0x12u);
      }

      uint64_t v56 = [(ACCMediaLibraryShim *)v288->_context delegate];
      [v56 notify:v288->_UIDString stateChange:1 enabled:1];
    }

    id v48 = v288;
    v288->_sendPlayAllSongsCapable = 0;
  }
  v278 = [(NSMutableDictionary *)v48->_dbUpdateList objectForKey:@"PlaylistProperty"];
  v273 = [(NSMutableDictionary *)v48->_dbUpdateList objectForKey:@"ItemProperty"];
  if (*((unsigned __int8 *)v331 + 24) > 0x63u)
  {
    int v61 = 0;
    goto LABEL_304;
  }
  int v61 = 0;
  uint64_t v240 = *MEMORY[0x263F11468];
  uint64_t v241 = *MEMORY[0x263F11400];
  int v62 = 10000;
  *(void *)&long long v60 = 67111682;
  long long v239 = v60;
  id v63 = v36;
  do
  {
    if (v345[6] < 1 || !v48->_enableLibraryUpdate || v48->_isShuttingDown)
    {
      id v36 = v63;
      break;
    }
    if (!v63)
    {
      v345[6] = 0;
      id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
      *((unsigned char *)v335 + 24) = 1;
      id v65 = v48->_mpMediaLibrary;
      v316[0] = MEMORY[0x263EF8330];
      v316[1] = 3221225472;
      v316[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_91;
      v316[3] = &unk_2647C01A8;
      v316[4] = v48;
      id v63 = v64;
      id v317 = v63;
      v318 = &v344;
      v319 = &v338;
      v320 = &v334;
      [v65 enumerateEntityChangesAfterSyncAnchor:v286 maximumRevisionType:1 usingBlock:v316];
      LODWORD(v65) = [v63 count];

      v272 += (int)v65;
    }
    long long v314 = 0u;
    long long v315 = 0u;
    long long v312 = 0u;
    long long v313 = 0u;
    id v281 = v63;
    uint64_t v66 = [v281 countByEnumeratingWithState:&v312 objects:v366 count:16];
    if (!v66) {
      goto LABEL_300;
    }
    uint64_t v283 = *(void *)v313;
    int v67 = 1 - v272;
    while (2)
    {
      uint64_t v282 = v66;
      uint64_t v68 = 0;
      int v284 = v62;
      int v277 = v61;
      int v274 = v67 + v61;
      unsigned int v69 = 100 * v61 + 100;
      do
      {
        if (*(void *)v313 != v283) {
          objc_enumerationMutation(v281);
        }
        if (!v288->_enableLibraryUpdate || v288->_isShuttingDown)
        {
          int v62 = v284 + v68;
          int v61 = v277 + v68;
          goto LABEL_300;
        }
        long long v70 = *(void **)(*((void *)&v312 + 1) + 8 * v68);
        long long v71 = v331;
        *((unsigned char *)v331 + 24) = v69 / (v284 + (int)v68 + 1);
        if (((v69 / (v284 + (int)v68 + 1)) & 0xFC) >= 0x64 && !*((unsigned char *)v335 + 24)) {
          *((unsigned char *)v71 + 24) = 99;
        }
        context = (void *)MEMORY[0x22A65DE30]();
        uint64_t v72 = [v70 deletionType];
        uint64_t v73 = v72;
        if (v13 && (v72 || ![(ACCMediaLibraryShimInfo *)v288 _isVisibleUpdate:v70]))
        {
          objc_msgSend(v70, "anchor", v239);
          LOBYTE(v13) = 1;
          int64_t v5 = v286;
          v286 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_296;
        }
        int64_t v5 = objc_msgSend(v70, "entity", v239);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v74 = gLogObjects;
          int v75 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v76 = *(id *)gLogObjects;
          }
          else
          {
            uint64_t v4 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)v353 = v74;
              *(_WORD *)&v353[8] = 1024;
              *(_DWORD *)&v353[10] = v75;
              _os_log_error_impl(&dword_2269CB000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v80 = (id)v4;
            v76 = v4;
          }
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            v118 = v288->_UIDString;
            uint64_t v4 = [v70 anchor];
            uint64_t v119 = [v70 deletionType];
            uint64_t v120 = [v5 persistentID];
            v121 = [v5 name];
            *(_DWORD *)buf = 138413314;
            *(void *)v353 = v118;
            *(_WORD *)&v353[8] = 2112;
            *(void *)&v353[10] = v4;
            *(_WORD *)&v353[18] = 2048;
            *(void *)&v353[20] = v119;
            *(_WORD *)&v353[28] = 2048;
            *(void *)&v353[30] = v120;
            *(_WORD *)&v353[38] = 2112;
            *(void *)&v353[40] = v121;
            _os_log_debug_impl(&dword_2269CB000, v76, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: %@ revision=%@ deletionType=%ld playlist: %llu '%@'", buf, 0x34u);
          }
          if ([v278 count])
          {
            LOBYTE(v348) = 1;
            if ([v276 showMusic])
            {
              if ([v70 deletionType])
              {
                uint64_t v81 = gLogObjects;
                int v82 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v83 = *(id *)gLogObjects;
                }
                else
                {
                  v110 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v81;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v82;
                    _os_log_error_impl(&dword_2269CB000, v110, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v111 = v110;
                  v83 = v110;
                }
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                {
                  v170 = v288->_UIDString;
                  v171 = [v70 anchor];
                  uint64_t v172 = [v5 persistentID];
                  int v173 = *((unsigned __int8 *)v331 + 24);
                  accessory = v288->_accessory;
                  *(_DWORD *)buf = 138413314;
                  *(void *)v353 = v170;
                  *(_WORD *)&v353[8] = 2112;
                  *(void *)&v353[10] = v171;
                  *(_WORD *)&v353[18] = 2048;
                  *(void *)&v353[20] = v172;
                  *(_WORD *)&v353[28] = 1024;
                  *(_DWORD *)&v353[30] = v173;
                  *(_WORD *)&v353[34] = 2112;
                  *(void *)&v353[36] = accessory;
                  _os_log_debug_impl(&dword_2269CB000, v83, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ deletePlaylist:%llu progress:%u accessory:%@", buf, 0x30u);
                }
                v308[0] = MEMORY[0x263EF8330];
                v308[1] = 3221225472;
                v308[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_92;
                v308[3] = &unk_2647C01D0;
                v308[4] = v288;
                v308[5] = v70;
                id v309 = v5;
                v310 = &v330;
                v311 = &v326;
                uint64_t v112 = [(ACCMediaLibraryShimInfo *)v288 _attemptUpdate:v308];
                uint64_t v113 = gLogObjects;
                uint64_t v4 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v114 = *(id *)gLogObjects;
                }
                else
                {
                  v114 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v113;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v4;
                    _os_log_error_impl(&dword_2269CB000, v114, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v115 = v114;
                }
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)v353 = v112;
                  _os_log_debug_impl(&dword_2269CB000, v114, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                }
              }
              else
              {
                v106 = [(ACCMediaLibraryShimInfo *)v288 _handleMediaLibraryPlaylistUpdate:v70 forLibrary:v275 forProperties:v278 success:&v348];
                uint64_t v107 = gLogObjects;
                int v108 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v109 = *(id *)gLogObjects;
                }
                else
                {
                  v122 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v107;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v108;
                    _os_log_error_impl(&dword_2269CB000, v122, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v123 = v122;
                  v109 = v122;
                }
                if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                {
                  v180 = v288->_UIDString;
                  v181 = [v106 revision];
                  int v182 = *((unsigned __int8 *)v331 + 24);
                  v183 = v288->_accessory;
                  *(_DWORD *)buf = 138413314;
                  *(void *)v353 = v180;
                  *(_WORD *)&v353[8] = 2112;
                  *(void *)&v353[10] = v181;
                  *(_WORD *)&v353[18] = 2112;
                  *(void *)&v353[20] = v106;
                  *(_WORD *)&v353[28] = 1024;
                  *(_DWORD *)&v353[30] = v182;
                  *(_WORD *)&v353[34] = 2112;
                  *(void *)&v353[36] = v183;
                  _os_log_debug_impl(&dword_2269CB000, v109, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ playlist:%@ progress:%u accessory:%@", buf, 0x30u);
                }
                v304[0] = MEMORY[0x263EF8330];
                v304[1] = 3221225472;
                v304[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_94;
                v304[3] = &unk_2647C01F8;
                v304[4] = v288;
                uint64_t v4 = v106;
                id v305 = (id)v4;
                v306 = &v330;
                v307 = &v326;
                uint64_t v124 = [(ACCMediaLibraryShimInfo *)v288 _attemptUpdate:v304];
                uint64_t v125 = gLogObjects;
                int v126 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v127 = *(id *)gLogObjects;
                }
                else
                {
                  v127 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v125;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v126;
                    _os_log_error_impl(&dword_2269CB000, v127, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v128 = v127;
                }
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)v353 = v124;
                  _os_log_debug_impl(&dword_2269CB000, v127, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                }

                if (![(id)v4 contentStyle]
                  || ([(id)v4 content],
                      v129 = objc_claimAutoreleasedReturnValue(),
                      BOOL v130 = v129 == 0,
                      v129,
                      v130))
                {
                  uint64_t v134 = gLogObjects;
                  int v135 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v136 = *(id *)gLogObjects;
                  }
                  else
                  {
                    v137 = MEMORY[0x263EF8438];
                    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      *(void *)v353 = v134;
                      *(_WORD *)&v353[8] = 1024;
                      *(_DWORD *)&v353[10] = v135;
                      _os_log_error_impl(&dword_2269CB000, v137, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v138 = v137;
                    v136 = v137;
                  }
                  if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
                  {
                    v139 = v288->_UIDString;
                    v140 = [(id)v4 revision];
                    if (v288->_requestedTransferID) {
                      int v141 = 1;
                    }
                    else {
                      int v141 = v288->_requestedMetaList && v288->_requestedMetaProperties;
                    }
                    int v184 = [(id)v4 contentStyle];
                    if (v184)
                    {
                      v242 = [(id)v4 content];
                      BOOL v185 = v242 != 0;
                    }
                    else
                    {
                      BOOL v185 = 0;
                    }
                    *(_DWORD *)buf = 138413058;
                    *(void *)v353 = v139;
                    *(_WORD *)&v353[8] = 2112;
                    *(void *)&v353[10] = v140;
                    *(_WORD *)&v353[18] = 1024;
                    *(_DWORD *)&v353[20] = v141;
                    *(_WORD *)&v353[24] = 1024;
                    *(_DWORD *)&v353[26] = v185;
                    _os_log_impl(&dword_2269CB000, v136, OS_LOG_TYPE_INFO, "update:%@ revision:%@ playlist content not requested(%d) or not available(%d)", buf, 0x22u);
                    if (v184) {
                  }
                    }
                }
                else
                {
                  uint64_t v131 = gLogObjects;
                  int v132 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v133 = *(id *)gLogObjects;
                  }
                  else
                  {
                    v153 = MEMORY[0x263EF8438];
                    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      *(void *)v353 = v131;
                      *(_WORD *)&v353[8] = 1024;
                      *(_DWORD *)&v353[10] = v132;
                      _os_log_error_impl(&dword_2269CB000, v153, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v154 = v153;
                    v133 = v153;
                  }
                  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
                  {
                    v203 = v288->_UIDString;
                    v204 = [(id)v4 revision];
                    v205 = [(id)v4 content];
                    int v206 = *((unsigned __int8 *)v331 + 24);
                    v207 = v288->_accessory;
                    *(_DWORD *)buf = 138413314;
                    *(void *)v353 = v203;
                    *(_WORD *)&v353[8] = 2112;
                    *(void *)&v353[10] = v204;
                    *(_WORD *)&v353[18] = 2112;
                    *(void *)&v353[20] = v205;
                    *(_WORD *)&v353[28] = 1024;
                    *(_DWORD *)&v353[30] = v206;
                    *(_WORD *)&v353[34] = 2112;
                    *(void *)&v353[36] = v207;
                    _os_log_debug_impl(&dword_2269CB000, v133, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ content:%@ progress:%u accessory:%@", buf, 0x30u);
                  }
                  v301[0] = MEMORY[0x263EF8330];
                  v301[1] = 3221225472;
                  v301[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_95;
                  v301[3] = &unk_2647C0220;
                  v301[4] = v288;
                  id v302 = (id)v4;
                  v303 = &v330;
                  uint64_t v155 = [(ACCMediaLibraryShimInfo *)v288 _attemptUpdate:v301];
                  uint64_t v156 = gLogObjects;
                  int v157 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v158 = *(id *)gLogObjects;
                  }
                  else
                  {
                    v158 = MEMORY[0x263EF8438];
                    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      *(void *)v353 = v156;
                      *(_WORD *)&v353[8] = 1024;
                      *(_DWORD *)&v353[10] = v157;
                      _os_log_error_impl(&dword_2269CB000, v158, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v159 = v158;
                  }
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)v353 = v155;
                    _os_log_debug_impl(&dword_2269CB000, v158, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                  }
                }
              }
            }
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v77 = gLogObjects;
            int v78 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              int v79 = *(id *)gLogObjects;
            }
            else
            {
              uint64_t v4 = MEMORY[0x263EF8438];
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)v353 = v77;
                *(_WORD *)&v353[8] = 1024;
                *(_DWORD *)&v353[10] = v78;
                _os_log_error_impl(&dword_2269CB000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v87 = (id)v4;
              int v79 = v4;
            }
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
            {
              v265 = v288->_UIDString;
              uint64_t v4 = [v70 anchor];
              uint64_t v142 = [v70 deletionType];
              uint64_t v143 = [v5 persistentID];
              v144 = [v5 title];
              *(_DWORD *)buf = 138413314;
              *(void *)v353 = v265;
              *(_WORD *)&v353[8] = 2112;
              *(void *)&v353[10] = v4;
              *(_WORD *)&v353[18] = 2048;
              *(void *)&v353[20] = v142;
              *(_WORD *)&v353[28] = 2048;
              *(void *)&v353[30] = v143;
              *(_WORD *)&v353[38] = 2112;
              *(void *)&v353[40] = v144;
              _os_log_debug_impl(&dword_2269CB000, v79, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: %@ revision=%@ deletionType=%ld item: %llu '%@'", buf, 0x34u);
            }
            if ([v273 count])
            {
              LOBYTE(v348) = 1;
              uint64_t v4 = v5;
              if ([v70 deletionType] || (objc_msgSend((id)v4, "existsInLibrary") & 1) == 0)
              {
                uint64_t v92 = gLogObjects;
                int v93 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v94 = *(id *)gLogObjects;
                }
                else
                {
                  v95 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v92;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v93;
                    _os_log_error_impl(&dword_2269CB000, v95, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v96 = v95;
                  v94 = v95;
                }
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
                {
                  v160 = v288->_UIDString;
                  v161 = [v70 anchor];
                  uint64_t v162 = [(id)v4 persistentID];
                  int v163 = *((unsigned __int8 *)v331 + 24);
                  v164 = v288->_accessory;
                  *(_DWORD *)buf = 138413314;
                  *(void *)v353 = v160;
                  *(_WORD *)&v353[8] = 2112;
                  *(void *)&v353[10] = v161;
                  *(_WORD *)&v353[18] = 2048;
                  *(void *)&v353[20] = v162;
                  *(_WORD *)&v353[28] = 1024;
                  *(_DWORD *)&v353[30] = v163;
                  *(_WORD *)&v353[34] = 2112;
                  *(void *)&v353[36] = v164;
                  _os_log_debug_impl(&dword_2269CB000, v94, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ deleteItem:%llu progress:%u accessory:%@", buf, 0x30u);
                }
                v297[0] = MEMORY[0x263EF8330];
                v297[1] = 3221225472;
                v297[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_96;
                v297[3] = &unk_2647C01D0;
                v297[4] = v288;
                v297[5] = v70;
                id v298 = (id)v4;
                v299 = &v330;
                v300 = &v326;
                uint64_t v97 = [(ACCMediaLibraryShimInfo *)v288 _attemptUpdate:v297];
                uint64_t v98 = gLogObjects;
                int v99 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v100 = *(id *)gLogObjects;
                }
                else
                {
                  v100 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v98;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v99;
                    _os_log_error_impl(&dword_2269CB000, v100, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v101 = v100;
                }
                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)v353 = v97;
                  _os_log_debug_impl(&dword_2269CB000, v100, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                }
              }
              else
              {
                v88 = [(ACCMediaLibraryShimInfo *)v288 _handleMediaLibraryItemUpdate:v70 forLibrary:v275 forProperties:v273 success:&v348 forceDelete:v73 != 0];
                uint64_t v89 = gLogObjects;
                int v90 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v91 = *(id *)gLogObjects;
                }
                else
                {
                  v145 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v89;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v90;
                    _os_log_error_impl(&dword_2269CB000, v145, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v146 = v145;
                  v91 = v145;
                }
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
                {
                  v199 = v288->_UIDString;
                  v200 = [v88 revision];
                  int v201 = *((unsigned __int8 *)v331 + 24);
                  v202 = v288->_accessory;
                  *(_DWORD *)buf = 138413314;
                  *(void *)v353 = v199;
                  *(_WORD *)&v353[8] = 2112;
                  *(void *)&v353[10] = v200;
                  *(_WORD *)&v353[18] = 2112;
                  *(void *)&v353[20] = v88;
                  *(_WORD *)&v353[28] = 1024;
                  *(_DWORD *)&v353[30] = v201;
                  *(_WORD *)&v353[34] = 2112;
                  *(void *)&v353[36] = v202;
                  _os_log_debug_impl(&dword_2269CB000, v91, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ item:[%@] progress:%u accessory:%@", buf, 0x30u);
                }
                v293[0] = MEMORY[0x263EF8330];
                v293[1] = 3221225472;
                v293[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_97;
                v293[3] = &unk_2647C01F8;
                v293[4] = v288;
                id v147 = v88;
                id v294 = v147;
                v295 = &v330;
                v296 = &v326;
                uint64_t v148 = [(ACCMediaLibraryShimInfo *)v288 _attemptUpdate:v293];
                uint64_t v149 = gLogObjects;
                int v150 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v151 = *(id *)gLogObjects;
                }
                else
                {
                  v151 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v149;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v150;
                    _os_log_error_impl(&dword_2269CB000, v151, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v152 = v151;
                }
                if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)v353 = v148;
                  _os_log_debug_impl(&dword_2269CB000, v151, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                }
              }
              if ([(id)v4 mediaType]
                && (([(id)v4 mediaType] & v270) == 0 || (objc_msgSend((id)v4, "mediaType") & 6) != 0))
              {
                uint64_t v102 = gLogObjects;
                int v103 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v104 = *(id *)gLogObjects;
                }
                else
                {
                  v116 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v353 = v102;
                    *(_WORD *)&v353[8] = 1024;
                    *(_DWORD *)&v353[10] = v103;
                    _os_log_error_impl(&dword_2269CB000, v116, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v117 = v116;
                  v104 = v116;
                }
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
                {
                  BOOL v267 = +[ACCMediaLibraryShimInfo isItemAd:v4];
                  int v263 = [(id)v4 existsInLibrary];
                  BOOL v260 = [(ACCMediaLibraryShim *)v288->_context subscribedToAppleMusic];
                  BOOL requestedMetaProperties = v288->_requestedMetaProperties;
                  BOOL requestedMetaList = v288->_requestedMetaList;
                  uint64_t v256 = [(id)v4 persistentID];
                  id v176 = [(id)v4 title];
                  id v177 = [(id)v4 artist];
                  id v178 = [(id)v4 albumTitle];
                  uint64_t v179 = [(id)v4 mediaType];
                  *(_DWORD *)buf = v239;
                  *(_DWORD *)v353 = v267;
                  *(_WORD *)&v353[4] = 1024;
                  *(_DWORD *)&v353[6] = v263;
                  *(_WORD *)&v353[10] = 1024;
                  *(_DWORD *)&v353[12] = v260;
                  *(_WORD *)&v353[16] = 1024;
                  *(_DWORD *)&v353[18] = requestedMetaProperties;
                  *(_WORD *)&v353[22] = 1024;
                  *(_DWORD *)&v353[24] = requestedMetaList;
                  *(_WORD *)&v353[28] = 2048;
                  *(void *)&v353[30] = v256;
                  *(_WORD *)&v353[38] = 2112;
                  *(void *)&v353[40] = v176;
                  *(_WORD *)&v353[48] = 2112;
                  *(void *)v354 = v177;
                  *(_WORD *)&v354[8] = 2112;
                  *(void *)&v354[10] = v178;
                  *(_WORD *)&v354[18] = 2048;
                  *(void *)&v354[20] = v179;
                  *(_WORD *)&v354[28] = 1024;
                  *(_DWORD *)&v354[30] = v270;
                  _os_log_debug_impl(&dword_2269CB000, v104, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: skip item update: isItemAd=%d existsInLibrary=%d subscribedToAppleMusic=%d _requestedMetaProperties=%d _requestedMetaList=%d mpItem=(persistentID=%llu title='%@' artist='%@' album='%@' type=%lxh) validMediaTypeMask=%xh", buf, 0x58u);
                }
              }
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v84 = gLogObjects;
              int v85 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                v86 = *(id *)gLogObjects;
              }
              else
              {
                uint64_t v4 = MEMORY[0x263EF8438];
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  *(void *)v353 = v84;
                  *(_WORD *)&v353[8] = 1024;
                  *(_DWORD *)&v353[10] = v85;
                  _os_log_error_impl(&dword_2269CB000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                id v105 = (id)v4;
                v86 = v4;
              }
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
              {
                v266 = [v70 anchor];
                id v262 = (id)objc_opt_class();
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                objc_opt_class();
                char v166 = objc_opt_isKindOfClass();
                uint64_t v4 = [v5 persistentID];
                id v167 = [v5 valueForProperty:v241];
                [v5 valueForProperty:v240];
                int v168 = isKindOfClass & 1;
                id v169 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138414082;
                *(void *)v353 = v266;
                *(_WORD *)&v353[8] = 2112;
                *(void *)&v353[10] = v5;
                *(_WORD *)&v353[18] = 2112;
                *(void *)&v353[20] = v262;
                *(_WORD *)&v353[28] = 1024;
                *(_DWORD *)&v353[30] = v168;
                *(_WORD *)&v353[34] = 1024;
                *(_DWORD *)&v353[36] = v166 & 1;
                *(_WORD *)&v353[40] = 2048;
                *(void *)&v353[42] = v4;
                *(_WORD *)v354 = 2112;
                *(void *)&v354[2] = v167;
                *(_WORD *)&v354[10] = 2112;
                *(void *)&v354[12] = v169;
                _os_log_debug_impl(&dword_2269CB000, v86, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: skip unknown update: revision=%@ entity=%@ (class=%@ (isMPItem=%d isMPPlaylist=%d) persistentID=%llu itemTitle='%@' playlistName='%@')", buf, 0x4Au);
              }
            }
          }
        }
        uint64_t v186 = [v70 anchor];

        v187 = [(ACCMediaLibraryShim *)v288->_context measureMemoryUsage];
        if ([v187 BOOLValue])
        {
          v188 = [(ACCMediaLibraryShim *)v288->_context memUse];
          BOOL v189 = v188 == 0;

          if (v189 || ((v277 + v68 + 1) & 0x7F) != 0 && v274 + v68) {
            goto LABEL_295;
          }
          v190 = [(ACCMediaLibraryShim *)v288->_context memUse];
          [v190 update];

          if (!v279) {
            goto LABEL_295;
          }
          [v279 timeIntervalSinceLastUpdate];
          if (v191 < 1.0) {
            goto LABEL_295;
          }
          uint64_t v192 = gLogObjects;
          int v193 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v187 = *(id *)gLogObjects;
          }
          else
          {
            uint64_t v4 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)v353 = v192;
              *(_WORD *)&v353[8] = 1024;
              *(_DWORD *)&v353[10] = v193;
              _os_log_error_impl(&dword_2269CB000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v194 = (id)v4;
            v187 = v4;
          }
          if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
          {
            v287 = [v279 residentMem];
            uint64_t v251 = [v287 last];
            v268 = [v279 residentMem];
            unint64_t v250 = [v268 last];
            v264 = [v279 residentMem];
            uint64_t v249 = [v264 max];
            v261 = [v279 residentMem];
            unint64_t v248 = [v261 max];
            v259 = [v279 virtualMem];
            uint64_t v247 = [v259 last];
            v257 = [v279 virtualMem];
            unint64_t v246 = [v257 last];
            v255 = [v279 virtualMem];
            uint64_t v245 = [v255 max];
            v254 = [v279 virtualMem];
            unint64_t v244 = [v254 max];
            v253 = [v279 physFootprintMem];
            uint64_t v243 = [v253 last];
            v252 = [v279 physFootprintMem];
            uint64_t v4 = [v252 last];
            v195 = [v279 physFootprintMem];
            uint64_t v196 = [v195 max];
            v197 = [v279 physFootprintMem];
            unint64_t v198 = [v197 max];
            *(_DWORD *)buf = 67112962;
            *(_DWORD *)v353 = v277 + v68 + 1;
            *(_WORD *)&v353[4] = 1024;
            *(_DWORD *)&v353[6] = v272;
            *(_WORD *)&v353[10] = 2112;
            *(void *)&v353[12] = v280;
            *(_WORD *)&v353[20] = 2112;
            *(void *)&v353[22] = v186;
            *(_WORD *)&v353[30] = 2048;
            *(void *)&v353[32] = v251;
            *(_WORD *)&v353[40] = 2048;
            *(double *)&v353[42] = (double)v250 / 1000000.0;
            *(_WORD *)v354 = 2048;
            *(void *)&v354[2] = v249;
            *(_WORD *)&v354[10] = 2048;
            *(double *)&v354[12] = (double)v248 / 1000000.0;
            *(_WORD *)&v354[20] = 2048;
            *(void *)&v354[22] = v247;
            *(_WORD *)&v354[30] = 2048;
            *(double *)&v354[32] = (double)v246 / 1000000.0;
            *(_WORD *)&v354[40] = 2048;
            uint64_t v355 = v245;
            __int16 v356 = 2048;
            double v357 = (double)v244 / 1000000.0;
            __int16 v358 = 2048;
            uint64_t v359 = v243;
            __int16 v360 = 2048;
            double v361 = (double)(unint64_t)v4 / 1000000.0;
            __int16 v362 = 2048;
            uint64_t v363 = v196;
            __int16 v364 = 2048;
            double v365 = (double)v198 / 1000000.0;
            _os_log_impl(&dword_2269CB000, v187, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: %d / %d, anchorTo=%@ nextAnchor=%@ memUse:[resident=%llu(%.3fM)/%llu(%.3fM) virtual=%llu(%.3fM)/%llu(%.3fM) physFootprint=%llu(%.3fM)/%llu(%.3fM)]", buf, 0x9Au);
          }
        }

LABEL_295:
        LOBYTE(v13) = 0;
        v286 = (__CFString *)v186;
LABEL_296:

        ++v68;
        v69 += 100;
      }
      while (v282 != v68);
      uint64_t v66 = [v281 countByEnumeratingWithState:&v312 objects:v366 count:16];
      int v61 = v277 + v68;
      int v62 = v284 + v68;
      int v67 = 1 - v272;
      if (v66) {
        continue;
      }
      break;
    }
    int v62 = v284 + v68;
    int v61 = v277 + v68;
LABEL_300:

    id v63 = 0;
    id v36 = 0;
    id v48 = v288;
  }
  while (*((unsigned __int8 *)v331 + 24) < 0x64u);
LABEL_304:
  if (gLogObjects) {
    BOOL v208 = gNumLogObjects < 1;
  }
  else {
    BOOL v208 = 1;
  }
  if (v208)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    v210 = MEMORY[0x263EF8438];
    id v209 = MEMORY[0x263EF8438];
  }
  else
  {
    v210 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
  {
    int v228 = *((_DWORD *)v327 + 6);
    *(_DWORD *)buf = 138413314;
    *(void *)v353 = 0;
    *(_WORD *)&v353[8] = 2112;
    *(void *)&v353[10] = v286;
    *(_WORD *)&v353[18] = 1024;
    *(_DWORD *)&v353[20] = v61;
    *(_WORD *)&v353[24] = 1024;
    *(_DWORD *)&v353[26] = v228;
    *(_WORD *)&v353[30] = 1024;
    *(_DWORD *)&v353[32] = v272;
    _os_log_debug_impl(&dword_2269CB000, v210, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: lastAnchor=%@ nextAnchor=%@ count=%d lastSentProgress=%d total=%d", buf, 0x28u);
  }

  v211 = v288;
  v212 = [(NSMutableDictionary *)v288->_dbUpdateList objectForKey:@"Progress"];
  if (v212)
  {
    if (v61)
    {
      BOOL v213 = *((_DWORD *)v327 + 6) < 0x64u;

      if (!v213)
      {
        v214 = 0;
        goto LABEL_337;
      }
    }
    else
    {
    }
    v215 = v286;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v216 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      v216 = MEMORY[0x263EF8438];
      id v217 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v353 = v215;
      _os_log_impl(&dword_2269CB000, v216, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: attempt need final 100 progress update!!! lastAnchor=%@", buf, 0xCu);
    }

    v289[0] = MEMORY[0x263EF8330];
    v289[1] = 3221225472;
    v289[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_99;
    v289[3] = &unk_2647C0220;
    v214 = v215;
    v290 = v214;
    v291 = v288;
    v292 = &v326;
    uint64_t v218 = [(ACCMediaLibraryShimInfo *)v288 _attemptUpdate:v289];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v4 = (uint64_t)*(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      uint64_t v4 = MEMORY[0x263EF8438];
      id v219 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG)) {
      -[ACCMediaLibraryShimInfo _beginMediaLibraryUpdatesWithAnchor:validity:](v218, v4);
    }

LABEL_337:
    v211 = v288;
  }
  else
  {
    v214 = 0;
  }
  v220 = [(ACCMediaLibraryShim *)v211->_context measureMemoryUsage];
  if ([v220 BOOLValue])
  {
    v221 = [(ACCMediaLibraryShim *)v211->_context memUse];
    BOOL v222 = v221 == 0;

    if (!v222)
    {
      v223 = [(ACCMediaLibraryShim *)v288->_context memUse];
      [v223 update];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v224 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        v224 = MEMORY[0x263EF8438];
        id v225 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
      {
        if (v279)
        {
          uint64_t v4 = [MEMORY[0x263EFF910] date];
          int64_t v5 = [v279 startTime];
          [(id)v4 timeIntervalSinceDate:v5];
          uint64_t v227 = v226;
        }
        else
        {
          uint64_t v227 = 0;
        }
        int v229 = v345[6];
        uint64_t v230 = v339[5];
        v231 = [(ACCMediaLibraryShim *)v288->_context memUse];
        *(_DWORD *)buf = 134220546;
        *(void *)v353 = v227;
        *(_WORD *)&v353[8] = 2112;
        *(void *)&v353[10] = v280;
        *(_WORD *)&v353[18] = 2112;
        *(void *)&v353[20] = v286;
        *(_WORD *)&v353[28] = 2112;
        *(void *)&v353[30] = v275;
        *(_WORD *)&v353[38] = 1024;
        *(_DWORD *)&v353[40] = v61;
        *(_WORD *)&v353[44] = 1024;
        *(_DWORD *)&v353[46] = v272;
        *(_WORD *)v354 = 1024;
        *(_DWORD *)&v354[2] = v229;
        *(_WORD *)&v354[6] = 1024;
        *(_DWORD *)&v354[8] = 500;
        *(_WORD *)&v354[12] = 2112;
        *(void *)&v354[14] = v230;
        *(_WORD *)&v354[22] = 2112;
        *(void *)&v354[24] = v286;
        *(_WORD *)&v354[32] = 2112;
        *(void *)&v354[34] = v231;
        _os_log_impl(&dword_2269CB000, v224, OS_LOG_TYPE_DEFAULT, "_beginMediaLibraryUpdatesWithAnchor: Finished in %f sec, anchorTo=%@ nextAnchor=%@, validity=%@, count=%d / %d, numChanges=%d, kMaxChangesPerIteration=%d, lastAccumulatedRevision=%@, nextAnchor=%@, memUse: \n%@ \n", buf, 0x60u);

        if (v279)
        {
        }
      }

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v232 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        v232 = MEMORY[0x263EF8438];
        id v233 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v353 = v279;
        _os_log_impl(&dword_2269CB000, v232, OS_LOG_TYPE_DEFAULT, "_beginMediaLibraryUpdatesWithAnchor: statMark: \nmark: \n%@ ", buf, 0xCu);
      }

      v220 = [(ACCMediaLibraryShim *)v288->_context memUse];
      [v220 removeMark:@"mlUpdateMark"];
      v279 = 0;
      goto LABEL_361;
    }
  }
  else
  {
LABEL_361:
  }
  if (v269)
  {
    id v234 = v269;
    long long v348 = 0u;
    long long v349 = 0u;
    long long v350 = 0u;
    long long v351 = 0u;
    uint64_t v235 = [v234 countByEnumeratingWithState:&v348 objects:buf count:16];
    if (v235)
    {
      uint64_t v236 = *(void *)v349;
      do
      {
        for (uint64_t i = 0; i != v235; ++i)
        {
          if (*(void *)v349 != v236) {
            objc_enumerationMutation(v234);
          }
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v348 + 1) + 8 * i));
        }
        uint64_t v235 = [v234 countByEnumeratingWithState:&v348 objects:buf count:16];
      }
      while (v235);
    }
    [v234 removeAllObjects];
  }
  v288->_processingDiffUpdate = 0;
  BOOL v16 = v286;

  _Block_object_dispose(&v326, 8);
  _Block_object_dispose(&v330, 8);
  _Block_object_dispose(&v334, 8);
  _Block_object_dispose(&v338, 8);

  _Block_object_dispose(&v344, 8);
LABEL_372:

  return v16;
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 33) && !*(unsigned char *)(v6 + 32))
  {
    id v12 = v5;
    if ((unint64_t)[*(id *)(a1 + 40) count] > 0x1F3)
    {
      char v11 = 0;
      char v7 = 1;
    }
    else
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      [*(id *)(a1 + 40) addObject:v12];
      uint64_t v8 = [v12 anchor];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      char v7 = 0;
      char v11 = 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;
    id v5 = v12;
  }
  else
  {
    char v7 = 1;
  }
  *a3 = v7;
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_91(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 33) && !*(unsigned char *)(v6 + 32))
  {
    id v12 = v5;
    if ((unint64_t)[*(id *)(a1 + 40) count] > 0x1F3)
    {
      char v11 = 0;
      char v7 = 1;
    }
    else
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      [*(id *)(a1 + 40) addObject:v12];
      uint64_t v8 = [v12 anchor];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      char v7 = 0;
      char v11 = 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;
    id v5 = v12;
  }
  else
  {
    char v7 = 1;
  }
  *a3 = v7;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_92(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_92_cold_1(a1);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 32) || !*(unsigned char *)(v5 + 33)) {
    return 3;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56)
                                                                                               + 8)
                                                                                   + 24);
  char v7 = [*(id *)(*(void *)(a1 + 32) + 40) delegate];
  uint64_t v8 = [v7 provider];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 80);
  id v10 = [*(id *)(a1 + 40) anchor];
  uint64_t v6 = objc_msgSend(v8, "update:revision:deletePlaylist:progress:accessory:", v9, v10, objc_msgSend(*(id *)(a1 + 48), "persistentID"), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void *)(*(void *)(a1 + 32) + 48));

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_94(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_94_cold_1(a1);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 32) || !*(unsigned char *)(v5 + 33)) {
    return 3;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48)
                                                                                               + 8)
                                                                                   + 24);
  char v7 = [*(id *)(*(void *)(a1 + 32) + 40) delegate];
  uint64_t v8 = [v7 provider];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 80);
  id v10 = [*(id *)(a1 + 40) revision];
  uint64_t v6 = [v8 update:v9 revision:v10 playlist:*(void *)(a1 + 40) progress:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) accessory:*(void *)(*(void *)(a1 + 32) + 48)];

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_95(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_95_cold_1(a1, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 32) || !*(unsigned char *)(v5 + 33)) {
    return 3;
  }
  char v7 = [*(id *)(v5 + 40) delegate];
  uint64_t v8 = [v7 provider];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 80);
  id v10 = [*(id *)(a1 + 40) revision];
  char v11 = [*(id *)(a1 + 40) content];
  uint64_t v6 = [v8 update:v9 revision:v10 content:v11 accessory:*(void *)(*(void *)(a1 + 32) + 48)];

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_96(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_96_cold_1(a1);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 32) || !*(unsigned char *)(v5 + 33)) {
    return 3;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56)
                                                                                               + 8)
                                                                                   + 24);
  char v7 = [*(id *)(*(void *)(a1 + 32) + 40) delegate];
  uint64_t v8 = [v7 provider];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 80);
  id v10 = [*(id *)(a1 + 40) anchor];
  uint64_t v6 = objc_msgSend(v8, "update:revision:deleteItem:progress:accessory:", v9, v10, objc_msgSend(*(id *)(a1 + 48), "persistentID"), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void *)(*(void *)(a1 + 32) + 48));

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_97(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_97_cold_1(a1);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 32) || !*(unsigned char *)(v5 + 33)) {
    return 3;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48)
                                                                                               + 8)
                                                                                   + 24);
  char v7 = [*(id *)(*(void *)(a1 + 32) + 40) delegate];
  uint64_t v8 = [v7 provider];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 80);
  id v10 = [*(id *)(a1 + 40) revision];
  uint64_t v6 = [v8 update:v9 revision:v10 item:*(void *)(a1 + 40) progress:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) accessory:*(void *)(*(void *)(a1 + 32) + 48)];

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_99(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v7 = *(unsigned __int8 *)(v6 + 32);
    LODWORD(v6) = *(unsigned __int8 *)(v6 + 33);
    int v13 = 138412802;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    int v16 = v7;
    __int16 v17 = 1024;
    int v18 = v6;
    _os_log_impl(&dword_2269CB000, v4, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: need final 100 progress update!!! lastAnchor=%@, _isShuttingDown=%d _enableLibraryUpdate=%d", (uint8_t *)&v13, 0x18u);
  }

  uint64_t v8 = a1[5];
  if (*(unsigned char *)(v8 + 32) || !*(unsigned char *)(v8 + 33)) {
    return 3;
  }
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 100;
  id v10 = [*(id *)(a1[5] + 40) delegate];
  char v11 = [v10 provider];
  uint64_t v9 = [v11 update:*(void *)(a1[5] + 80) revision:a1[4] progress:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) accessory:*(void *)(a1[5] + 48)];

  return v9;
}

- (void)_sendRadioLibraryUpdates
{
  BOOL v2 = self;
  uint64_t v110 = *MEMORY[0x263EF8340];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v3 = self->_stationsGroupList;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v94 objects:v109 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v95 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v94 + 1) + 8 * i) stations];
        v6 += [v9 count];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v94 objects:v109 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  int v10 = __MaxTiltStations;
  if (v6 < __MaxTiltStations) {
    int v10 = v6;
  }
  int v65 = v10;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    char v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    char v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    stationsGroupList = v2->_stationsGroupList;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v100 = v65;
    *(_WORD *)&v100[4] = 1024;
    *(_DWORD *)&v100[6] = -1;
    *(_WORD *)&v100[10] = 2112;
    *(void *)&v100[12] = stationsGroupList;
    _os_log_impl(&dword_2269CB000, v11, OS_LOG_TYPE_INFO, "_sendRadioLibraryUpdates total=%d maxPckSize=%d _stationsGroupList=%@", buf, 0x18u);
  }

  uint64_t v14 = [(ACCMediaLibraryShim *)v2->_context delegate];
  __int16 v15 = [v14 provider];
  [v15 resetUpdate:v2->_UIDString accessory:v2->_accessory];

  if (v2->_sendPlayAllSongsCapable)
  {
    int v16 = [(ACCMediaLibraryShim *)v2->_context delegate];
    [v16 notify:v2->_UIDString stateChange:1 enabled:0];

    v2->_sendPlayAllSongsCapable = 0;
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  __int16 v17 = v2->_stationsGroupList;
  uint64_t v62 = [(NSArray *)v17 countByEnumeratingWithState:&v90 objects:v108 count:16];
  if (!v62)
  {

LABEL_77:
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __51__ACCMediaLibraryShimInfo__sendRadioLibraryUpdates__block_invoke_112;
    v77[3] = &unk_2647C0270;
    v77[4] = v2;
    uint64_t v58 = [(ACCMediaLibraryShimInfo *)v2 _attemptUpdate:v77];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v59 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      uint64_t v59 = MEMORY[0x263EF8438];
      id v60 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      -[ACCMediaLibraryShimInfo _beginMediaLibraryUpdatesWithAnchor:validity:](v58, v59);
    }

    return;
  }
  LODWORD(v76) = 0;
  uint64_t v18 = 0;
  uint64_t v61 = *(void *)v91;
  id v64 = v2;
  int v67 = v17;
LABEL_24:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v91 != v61)
    {
      uint64_t v20 = v19;
      objc_enumerationMutation(v17);
      uint64_t v19 = v20;
    }
    if ((int)v76 >= __MaxTiltStations) {
      break;
    }
    uint64_t v63 = v19;
    ++v18;
    int v75 = *(void **)(*((void *)&v90 + 1) + 8 * v19);
    id v21 = [v75 stations];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = v21;
    uint64_t v70 = [obj countByEnumeratingWithState:&v86 objects:v107 count:16];
    if (v70)
    {
      uint64_t v74 = 0;
      uint64_t v71 = *(void *)v87;
      uint64_t v68 = v18;
      uint64_t v69 = v18 << 32;
LABEL_30:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v87 != v71) {
          objc_enumerationMutation(obj);
        }
        if ((int)v76 >= __MaxTiltStations) {
          break;
        }
        uint64_t v73 = v22;
        id v23 = *(void **)(*((void *)&v86 + 1) + 8 * v22);
        uint64_t v24 = [v23 uniqueIdentifier];
        id v25 = [v23 localizedName];
        BOOL v26 = NSString;
        id v27 = [v75 localizedTitle];
        id v28 = [v26 stringWithFormat:@"%@ - %@", v25, v27];

        uint64_t v29 = gLogObjects;
        int v30 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v31 = *(id *)gLogObjects;
        }
        else
        {
          uint64_t v31 = MEMORY[0x263EF8438];
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)v100 = v29;
            *(_WORD *)&v100[8] = 1024;
            *(_DWORD *)&v100[10] = v30;
            _os_log_error_impl(&dword_2269CB000, v31, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v32 = v31;
        }
        uint64_t v76 = (v76 + 1);
        uint64_t v33 = v74 + 1 + v69;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v100 = v76;
          *(_WORD *)&v100[4] = 2112;
          *(void *)&v100[6] = v23;
          *(_WORD *)&v100[14] = 2112;
          *(void *)&v100[16] = v28;
          __int16 v101 = 2048;
          uint64_t v102 = v24;
          __int16 v103 = 2048;
          uint64_t v104 = v74 + 1 + v69;
          __int16 v105 = 2048;
          uint64_t v106 = v104;
          _os_log_impl(&dword_2269CB000, v31, OS_LOG_TYPE_INFO, "_sendRadioLibraryUpdates: count=%d station=%@ name=%@ uniqueIdentifier=%lld uid=%lld (%llxh)", buf, 0x3Au);
        }

        if (!v2->_enableLibraryUpdate || v2->_isShuttingDown)
        {
          __int16 v17 = v67;
          uint64_t v18 = v68;
          break;
        }
        ++v74;
        id v34 = [(NSMutableDictionary *)v2->_dbUpdateList objectForKey:@"PlaylistProperty"];
        if ([v34 count])
        {
          uint64_t v72 = v34;
          uint64_t v35 = [(NSMutableDictionary *)v2->_dbUpdateList objectForKey:@"PlaylistProperty"];
          id v36 = objc_alloc(MEMORY[0x263F22E68]);
          UIDString = v2->_UIDString;
          uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v76);
          id v39 = (void *)[v36 initWithMediaLibrary:UIDString persistentID:v33 revision:v38];

          [v39 setRadioStation:1];
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v40 = v35;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v82 objects:v98 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v83;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v83 != v43) {
                  objc_enumerationMutation(v40);
                }
                if ([*(id *)(*((void *)&v82 + 1) + 8 * j) unsignedIntValue] == 1)
                {
                  uint64_t v45 = [v23 localizedName];
                  int v46 = __MaxTiltStations;
                  uint64_t v47 = NSString;
                  uint64_t v48 = [v75 localizedTitle];
                  BOOL v49 = (void *)v48;
                  if (v46 >= 100) {
                    int v50 = @"%03u %@ - %@";
                  }
                  else {
                    int v50 = @"%02u %@ - %@";
                  }
                  uint64_t v51 = objc_msgSend(v47, "stringWithFormat:", v50, v76, v45, v48);

                  if (v51) {
                    [v39 setName:v51];
                  }
                }
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v82 objects:v98 count:16];
            }
            while (v42);
          }

          v78[0] = MEMORY[0x263EF8330];
          v78[1] = 3221225472;
          BOOL v2 = v64;
          v78[2] = __51__ACCMediaLibraryShimInfo__sendRadioLibraryUpdates__block_invoke;
          v78[3] = &unk_2647C0248;
          v78[4] = v64;
          int v80 = v76;
          int v81 = v65;
          id v52 = v39;
          id v79 = v52;
          uint64_t v53 = [(ACCMediaLibraryShimInfo *)v64 _attemptUpdate:v78];
          uint64_t v54 = gLogObjects;
          int v55 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v56 = *(id *)gLogObjects;
          }
          else
          {
            uint64_t v56 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)v100 = v54;
              *(_WORD *)&v100[8] = 1024;
              *(_DWORD *)&v100[10] = v55;
              _os_log_error_impl(&dword_2269CB000, v56, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v57 = v56;
          }
          id v34 = v72;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v100 = v53;
            _os_log_debug_impl(&dword_2269CB000, v56, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
          }
        }
        uint64_t v22 = v73 + 1;
        __int16 v17 = v67;
        uint64_t v18 = v68;
        if (v73 + 1 == v70)
        {
          uint64_t v70 = [obj countByEnumeratingWithState:&v86 objects:v107 count:16];
          if (v70) {
            goto LABEL_30;
          }
          break;
        }
      }
    }

    uint64_t v19 = v63 + 1;
    if (v63 + 1 == v62)
    {
      uint64_t v62 = [(NSArray *)v17 countByEnumeratingWithState:&v90 objects:v108 count:16];
      if (v62) {
        goto LABEL_24;
      }
      break;
    }
  }

  if (!v76) {
    goto LABEL_77;
  }
}

uint64_t __51__ACCMediaLibraryShimInfo__sendRadioLibraryUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32) || !*(unsigned char *)(v1 + 33)) {
    return 3;
  }
  unsigned int v4 = (100 * *(_DWORD *)(a1 + 48)) / *(_DWORD *)(a1 + 52);
  uint64_t v5 = [*(id *)(v1 + 40) delegate];
  int v6 = [v5 provider];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v8 = [*(id *)(a1 + 40) revision];
  uint64_t v9 = [v6 update:v7 revision:v8 playlist:*(void *)(a1 + 40) progress:v4 accessory:*(void *)(*(void *)(a1 + 32) + 48)];

  return v9;
}

uint64_t __51__ACCMediaLibraryShimInfo__sendRadioLibraryUpdates__block_invoke_112(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32) || !*(unsigned char *)(v1 + 33)) {
    return 3;
  }
  unsigned int v4 = [*(id *)(v1 + 40) delegate];
  uint64_t v5 = [v4 provider];
  uint64_t v6 = [v5 update:*(void *)(*(void *)(a1 + 32) + 80) revision:@"0" progress:100 accessory:*(void *)(*(void *)(a1 + 32) + 48)];

  return v6;
}

- (void)_beginRadioLibraryUpdates
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_libraryType != 2) {
    ACCMediaLibraryShimUIDString_cold_1();
  }
  if ([(ACCMediaLibraryShim *)self->_context radioIsEnabled] && !self->_isShuttingDown)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke;
    block[3] = &unk_2647C0298;
    block[4] = self;
    uint64_t v5 = v6;
    uint64_t v14 = v5;
    dispatch_async(v7, block);

    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v5, v8))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        uint64_t v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v16 = 2;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_DEFAULT, "_beginRadioLibraryUpdates:  WARNING: timed out(%d) waiting for recent stations list, give up for now", buf, 8u);
      }

      if (self->_enableLibraryUpdate && !self->_isShuttingDown)
      {
        libraryUpdateQ = self->_libraryUpdateQ;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_116;
        v12[3] = &unk_2647C02E8;
        v12[4] = self;
        dispatch_async(libraryUpdateQ, v12);
      }
    }
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
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_INFO, "_beginRadioLibraryUpdates: Don't send RadioLibraryUpdates, not enabled or shuttingDown", buf, 2u);
    }
  }
}

void __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 56);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_2;
  v3[3] = &unk_2647C02C0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getRecentStationGroupsWithCompletionHandler:v3];
}

void __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "_beginRadioLibraryUpdates: recentStationsGroups=%@ error=%@", buf, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v10 + 32) && *(unsigned char *)(v10 + 33))
  {
    char v11 = *(NSObject **)(v10 + 72);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_113;
    v12[3] = &unk_2647C0298;
    v12[4] = v10;
    id v13 = v5;
    dispatch_async(v11, v12);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_113(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 33) && !*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = result;
    BOOL v3 = *(void **)(v1 + 112);
    *(void *)(v1 + 112) = 0;

    objc_storeStrong((id *)(*(void *)(v2 + 32) + 112), *(id *)(v2 + 40));
    id v4 = *(void **)(v2 + 32);
    return [v4 _sendRadioLibraryUpdates];
  }
  return result;
}

unsigned char *__52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_116(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[33])
  {
    if (!result[32]) {
      return (unsigned char *)[result _sendRadioLibraryUpdates];
    }
  }
  return result;
}

- (void)_radioLibraryChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
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
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "_radioLibraryChanged: notification=%@", buf, 0xCu);
  }

  if (self->_enableLibraryUpdate && !self->_isShuttingDown)
  {
    libraryUpdateQ = self->_libraryUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ACCMediaLibraryShimInfo__radioLibraryChanged___block_invoke;
    block[3] = &unk_2647C02E8;
    block[4] = self;
    dispatch_async(libraryUpdateQ, block);
  }
}

void __48__ACCMediaLibraryShimInfo__radioLibraryChanged___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 33) && !*(unsigned char *)(v1 + 32))
  {
    if (*(_DWORD *)(v1 + 36) == 2)
    {
      BOOL v3 = (void *)MEMORY[0x22A65DE30]();
      [*(id *)(a1 + 32) _beginRadioLibraryUpdates];
    }
    else
    {
      if (gLogObjects) {
        BOOL v4 = gNumLogObjects < 1;
      }
      else {
        BOOL v4 = 1;
      }
      if (v4)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v6 = MEMORY[0x263EF8438];
        id v5 = MEMORY[0x263EF8438];
      }
      else
      {
        id v6 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        v8[0] = 67109120;
        v8[1] = v7;
        _os_log_impl(&dword_2269CB000, v6, OS_LOG_TYPE_DEFAULT, "_radioLibraryChanged: ERROR: Invalid libraryType(%d)", (uint8_t *)v8, 8u);
      }
    }
  }
}

- (void)_mediaLibraryChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
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
    int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    int v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "_mediaLibraryChanged: notification=%@", buf, 0xCu);
  }

  if (self->_enableLibraryUpdate && !self->_isShuttingDown)
  {
    libraryUpdateQ = self->_libraryUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ACCMediaLibraryShimInfo__mediaLibraryChanged___block_invoke;
    block[3] = &unk_2647C02E8;
    block[4] = self;
    dispatch_async(libraryUpdateQ, block);
  }
}

void __48__ACCMediaLibraryShimInfo__mediaLibraryChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 33) && !*(unsigned char *)(v1 + 32))
  {
    if (*(_DWORD *)(v1 + 36))
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
        uint64_t v9 = MEMORY[0x263EF8438];
        id v4 = MEMORY[0x263EF8438];
      }
      else
      {
        uint64_t v9 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        v11[0] = 67109120;
        v11[1] = v10;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_DEFAULT, "_mediaLibraryChanged: ERROR: Invalid libraryType(%d)", (uint8_t *)v11, 8u);
      }
    }
    else
    {
      BOOL v5 = (void *)MEMORY[0x22A65DE30]();
      uint64_t v6 = [*(id *)(a1 + 32) _beginMediaLibraryUpdatesWithAnchor:*(void *)(*(void *)(a1 + 32) + 64) validity:*(void *)(*(void *)(a1 + 32) + 16)];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 64);
      *(void *)(v7 + 64) = v6;
    }
  }
}

- (void)_canShowCloudTracksDidChangeNotification:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
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
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v42 = v4;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "_canShowCloudTracksDidChangeNotification: notification=%@", buf, 0xCu);
  }

  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (self->_isShuttingDown)
  {
    if (v9)
    {
      int v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      int v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_INFO, "_canShowCloudTracksDidChangeNotification: not enabled or shuttingDown, ignore", buf, 2u);
    }
  }
  else
  {
    if (v9)
    {
      id v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = [MEMORY[0x263F11D60] sharedCloudController];
      int v38 = [v39 canShowCloudMusic];
      uint64_t v14 = [MEMORY[0x263F11D60] sharedCloudController];
      id v15 = v4;
      int v16 = [v14 hasProperNetworkConditionsToPlayMedia];
      id v17 = [MEMORY[0x263F11D60] sharedCloudController];
      int v18 = [v17 isCloudEnabled];
      uint64_t v19 = [MEMORY[0x263F11D60] sharedCloudController];
      int v20 = [v19 canShowCloudMusic];
      id v21 = [MEMORY[0x263F11D60] sharedCloudController];
      int v22 = [v21 canShowCloudVideo];
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)uint64_t v42 = v38;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v16;
      id v4 = v15;
      __int16 v43 = 1024;
      int v44 = v18;
      __int16 v45 = 1024;
      int v46 = v20;
      __int16 v47 = 1024;
      int v48 = v22;
      _os_log_impl(&dword_2269CB000, v11, OS_LOG_TYPE_DEFAULT, "_canShowCloudTracksDidChangeNotification: canShowCloudMusic=%d hasProperNetworkConditionsToPlayMedia=%d isCloudEnabled=%d canShowCloudMusic=%d canShowCloudVideo=%d", buf, 0x20u);
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v23 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v23 = MEMORY[0x263EF8438];
      id v24 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [MEMORY[0x263F11D60] sharedCloudController];
      int v26 = [v25 hasCloudLockerAccount];
      id v27 = [MEMORY[0x263F11D60] sharedCloudController];
      int v28 = [v27 isUpdateInProgress];
      uint64_t v29 = [MEMORY[0x263F11D60] sharedCloudController];
      int v30 = [v29 isInitialImport];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)uint64_t v42 = v26;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v28;
      __int16 v43 = 1024;
      int v44 = v30;
      _os_log_impl(&dword_2269CB000, v23, OS_LOG_TYPE_DEFAULT, "_canShowCloudTracksDidChangeNotification: hasCloudLockerAccount=%d isUpdateInProgress=%d isInitialImport=%d", buf, 0x14u);
    }
    if (!self->_libraryType)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v31 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        uint64_t v31 = MEMORY[0x263EF8438];
        id v32 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        BOOL showCloudTracks = self->_showCloudTracks;
        id v34 = [MEMORY[0x263F11D60] sharedCloudController];
        int v35 = [v34 canShowCloudMusic];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v42 = showCloudTracks;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v35;
        _os_log_impl(&dword_2269CB000, v31, OS_LOG_TYPE_DEFAULT, "_canShowCloudTracksDidChangeNotification: _showCloudTracks=%d->%d", buf, 0xEu);
      }
      id v36 = [MEMORY[0x263F11D60] sharedCloudController];
      self->_BOOL showCloudTracks = [v36 canShowCloudMusic];
    }
    if (self->_enableLibraryUpdate
      && !self->_isShuttingDown
      && self->_showCloudTracksLastSent != self->_showCloudTracks)
    {
      libraryUpdateQ = self->_libraryUpdateQ;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__ACCMediaLibraryShimInfo__canShowCloudTracksDidChangeNotification___block_invoke;
      block[3] = &unk_2647C02E8;
      block[4] = self;
      dispatch_async(libraryUpdateQ, block);
    }
  }
}

void __68__ACCMediaLibraryShimInfo__canShowCloudTracksDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 33) && !*(unsigned char *)(v1 + 32) && *(unsigned __int8 *)(v1 + 26) != *(unsigned __int8 *)(v1 + 25))
  {
    BOOL v3 = [*(id *)(v1 + 40) delegate];
    id v4 = [v3 provider];
    [v4 notify:*(void *)(*(void *)(a1 + 32) + 80) stateChange:0 enabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 25) == 0];

    *(unsigned char *)(*(void *)(a1 + 32) + 26) = *(unsigned char *)(*(void *)(a1 + 32) + 25);
  }
}

- (id)dbUpdateListDesc
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NSMutableDictionary *)self->_dbUpdateList objectForKey:@"ItemProperty"];
  id v4 = [(NSMutableDictionary *)self->_dbUpdateList objectForKey:@"PlaylistProperty"];
  uint64_t v31 = self;
  BOOL v5 = [(NSMutableDictionary *)self->_dbUpdateList objectForKey:@"PlaylistContentItemProperty"];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 |= 1 << [*(id *)(*((void *)&v40 + 1) + 8 * i) intValue];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v12);
        }
        v15 |= 1 << [*(id *)(*((void *)&v36 + 1) + 8 * j) intValue];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v18);
        }
        v21 |= 1 << [*(id *)(*((void *)&v32 + 1) + 8 * k) intValue];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v20);
  }
  else
  {
    uint64_t v21 = 0;
  }

  int v30 = NSString;
  id v24 = [(NSMutableDictionary *)v31->_dbUpdateList objectForKey:@"LibUID"];
  id v25 = [(NSMutableDictionary *)v31->_dbUpdateList objectForKey:@"Progress"];
  int v26 = [(NSMutableDictionary *)v31->_dbUpdateList objectForKey:@"HideNonLocal"];
  id v27 = [(NSMutableDictionary *)v31->_dbUpdateList objectForKey:@"PlayAllSongsCapable"];
  int v28 = [v30 stringWithFormat:@"libUID=%@ properties(item=%llxh playlist=%llxh content=%llxh) progress=%@ hideNonLocal=%@ playAllSongsCapable=%@", v24, v9, v15, v21, v25, v26, v27];

  return v28;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(ACCMediaLibraryShim *)self->_context accessory];
  long long v12 = *(_OWORD *)&self->_mpMediaLibrary;
  libraryUpdateQ = self->_libraryUpdateQ;
  UIDString = self->_UIDString;
  BOOL isShuttingDown = self->_isShuttingDown;
  BOOL enableLibraryUpdate = self->_enableLibraryUpdate;
  uint64_t v9 = [(ACCMediaLibraryShimInfo *)self dbUpdateListDesc];
  uint64_t v10 = [v3 stringWithFormat:@"<ACCMediaLibraryShimInfo>[\n    _context.accessory=%@\n    _mpMediaLibrary=%@\n    _anchor=%@\n    _UIDString=%@\n    _libraryUpdateQ=%@\n    _isShuttingDown=%d\n    _enableLibraryUpdate=%d\n    _dbUpdateList=[%@]\n    _showCloudTracks=%d\n    _showCloudTracksLastSent=%d\n    _waitForWindowSem=%@]", v4, v12, UIDString, libraryUpdateQ, isShuttingDown, enableLibraryUpdate, v9, self->_showCloudTracks, self->_showCloudTracksLastSent, self->_waitForWindowSem];

  return v10;
}

- (void)_registerForMPNotifications
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v4 = v3;
  int libraryType = self->_libraryType;
  if (libraryType == 2)
  {
    [v3 addObserver:self selector:sel__radioLibraryChanged_ name:*MEMORY[0x263F11C58] object:0];
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL showCloudTracks = self->_showCloudTracks;
      v10[0] = 67109376;
      v10[1] = showCloudTracks;
      __int16 v11 = 1024;
      int v12 = 1;
      _os_log_impl(&dword_2269CB000, v8, OS_LOG_TYPE_DEFAULT, "_registerForMPNotifications: Radio Library, _showCloudTracks=%d->%d", (uint8_t *)v10, 0xEu);
    }

    *(_WORD *)&self->_BOOL showCloudTracks = 1;
  }
  else if (!libraryType)
  {
    [v3 addObserver:self selector:sel__mediaLibraryChanged_ name:*MEMORY[0x263F11418] object:0];
    [v4 addObserver:self selector:sel__mediaLibraryChanged_ name:*MEMORY[0x263F11428] object:0];
    [v4 addObserver:self selector:sel__canShowCloudTracksDidChangeNotification_ name:*MEMORY[0x263F111A0] object:0];
  }
}

- (ACCMediaLibraryShimInfo)initWithMediaLibrary:(id)a3 accessory:(id)a4 Context:(id)a5 LibraryType:(int)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
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
    uint64_t v16 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v42 = v11;
    __int16 v43 = 2112;
    id v44 = v12;
    __int16 v45 = 2112;
    id v46 = v13;
    __int16 v47 = 1024;
    int v48 = a6;
    _os_log_impl(&dword_2269CB000, v16, OS_LOG_TYPE_DEFAULT, "initWithMediaLibrary: %@ accessory: %@ Context: %@ LibraryType: %d", buf, 0x26u);
  }

  v40.receiver = self;
  v40.super_class = (Class)ACCMediaLibraryShimInfo;
  id v17 = [(ACCMediaLibraryShimInfo *)&v40 init];
  if (v17)
  {
    if (__podcastPlaybackInMusicApp == -1) {
      __podcastPlaybackInMusicApp = CFPreferencesGetAppBooleanValue(@"PodcastPlaybackInMusicApp", @"com.apple.iapd", 0) != 0;
    }
    if (__MaxTiltStations == -1)
    {
      int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MaxTiltStations", @"com.apple.iapd", 0);
      if (AppIntegerValue >= 1) {
        int v19 = AppIntegerValue;
      }
      else {
        int v19 = 25;
      }
      __MaxTiltStations = v19;
    }
    *((_DWORD *)v17 + 9) = a6;
    objc_storeStrong((id *)v17 + 6, a4);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.accml.mediaLibraryUpdateQ", 0);
    uint64_t v21 = (void *)*((void *)v17 + 9);
    *((void *)v17 + 9) = v20;

    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    id v23 = (void *)*((void *)v17 + 11);
    *((void *)v17 + 11) = v22;

    *((_WORD *)v17 + 16) = 0;
    id v24 = (void *)*((void *)v17 + 1);
    *((void *)v17 + 1) = 0;

    id v25 = (void *)*((void *)v17 + 8);
    *((void *)v17 + 8) = 0;

    *((_WORD *)v17 + 12) = 0;
    *(_DWORD *)(v17 + 27) = 0;
    v17[31] = 0;
    objc_storeStrong((id *)v17 + 5, a5);
    objc_storeStrong((id *)v17 + 7, a3);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.accessoryd.MediaLibraryMPQ", 0);
    id v27 = (void *)*((void *)v17 + 12);
    *((void *)v17 + 12) = v26;

    uint64_t v28 = [objc_alloc(MEMORY[0x263F120B0]) initWithClientIdentifier:@"com.apple.accessoryd.medialibrary" queue:*((void *)v17 + 12)];
    uint64_t v29 = (void *)*((void *)v17 + 13);
    *((void *)v17 + 13) = v28;

    int v30 = (void *)*((void *)v17 + 14);
    *((void *)v17 + 14) = 0;

    uint64_t v31 = [v17 _getUIDString];
    long long v32 = (void *)*((void *)v17 + 10);
    *((void *)v17 + 10) = v31;

    [v17 _canShowCloudTracksDidChangeNotification:0];
    v17[26] = v17[25] ^ 1;
    int v33 = *((_DWORD *)v17 + 9);
    if (v33 == 2)
    {
      [v17 _registerForMPNotifications];
    }
    else if (v33)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        long long v36 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        long long v36 = MEMORY[0x263EF8438];
        id v37 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = *((_DWORD *)v17 + 9);
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = v38;
        _os_log_impl(&dword_2269CB000, v36, OS_LOG_TYPE_DEFAULT, "initWithMediaLibrary:accessory:Context:LibraryType: ERROR: Invalid libraryType(%d)", buf, 8u);
      }
    }
    else
    {
      uint64_t v34 = [*((id *)v17 + 7) _syncValidity];
      long long v35 = (void *)*((void *)v17 + 2);
      *((void *)v17 + 2) = v34;

      [v17 _registerForMPNotifications];
      [*((id *)v17 + 7) beginGeneratingLibraryChangeNotifications];
    }
  }

  return (ACCMediaLibraryShimInfo *)v17;
}

- (void)dealloc
{
  uint64_t v33 = *MEMORY[0x263EF8340];
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
    BOOL v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enableLibraryUpdate = self->_enableLibraryUpdate;
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 67109888;
    int v26 = enableLibraryUpdate;
    __int16 v27 = 1024;
    int v28 = 0;
    __int16 v29 = 1024;
    BOOL v30 = isShuttingDown;
    __int16 v31 = 1024;
    int v32 = 1;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "dealloc: _enableLibraryUpdate=%d-%d _isShuttingDown=%d->%d", buf, 0x1Au);
  }

  *(_WORD *)&self->_BOOL isShuttingDown = 1;
  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self];
  int libraryType = self->_libraryType;
  if (libraryType != 2)
  {
    if (libraryType)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        uint64_t v10 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = self->_libraryType;
        *(_DWORD *)buf = 67109120;
        int v26 = v12;
        _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_DEFAULT, "dealloc: ERROR: Invalid libraryType(%d)", buf, 8u);
      }
    }
    else
    {
      [self->_mpMediaLibrary endGeneratingLibraryChangeNotifications];
    }
  }
  libraryUpdateQ = self->_libraryUpdateQ;
  self->_libraryUpdateQ = 0;
  BOOL v14 = libraryUpdateQ;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ACCMediaLibraryShimInfo_dealloc__block_invoke;
  block[3] = &unk_2647C02E8;
  block[4] = self;
  dispatch_sync(v14, block);

  mpMusicPlayerControllerHandler = self->_mpMusicPlayerControllerHandler;
  self->_mpMusicPlayerControllerHandler = 0;

  waitForWindowSem = self->_waitForWindowSem;
  self->_waitForWindowSem = 0;

  syncValidityPersistentID = self->_syncValidityPersistentID;
  self->_syncValidityPersistentID = 0;

  id mpMediaLibrary = self->_mpMediaLibrary;
  self->_id mpMediaLibrary = 0;

  UIDString = self->_UIDString;
  self->_UIDString = 0;

  anchor = self->_anchor;
  self->_anchor = 0;

  accessory = self->_accessory;
  self->_accessory = 0;

  context = self->_context;
  self->_context = 0;

  v23.receiver = self;
  v23.super_class = (Class)ACCMediaLibraryShimInfo;
  [(ACCMediaLibraryShimInfo *)&v23 dealloc];
}

void __34__ACCMediaLibraryShimInfo_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(void *)(v1 + 8) = 0;

    uint64_t v1 = *(void *)(a1 + 32);
  }
  id v4 = *(void **)(v1 + 112);
  if (v4)
  {
    *(void *)(v1 + 112) = 0;
  }
}

- (void)startSendingMediaLibraryUpdates:(id)a3 lastRevision:(id)a4 requestedTransferID:(BOOL)a5 requestedMetaList:(BOOL)a6 requestedMetaProperties:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
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
    uint64_t v16 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(ACCMediaLibraryShimInfo *)self UIDString];
    *(_DWORD *)buf = 138413314;
    __int16 v29 = v17;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 1024;
    BOOL v33 = v9;
    __int16 v34 = 1024;
    BOOL v35 = v8;
    __int16 v36 = 1024;
    BOOL v37 = v7;
    _os_log_impl(&dword_2269CB000, v16, OS_LOG_TYPE_DEFAULT, "startSendingMediaLibraryUpdates: %@ lastRevision=%@ requestedTransferID=%d requestedMetaList=%d requestedMetaProperties=%d\n", buf, 0x28u);
  }
  if (self->_enableLibraryUpdate)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v18 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [(ACCMediaLibraryShimInfo *)self UIDString];
      *(_DWORD *)buf = 138412290;
      __int16 v29 = v21;
      _os_log_impl(&dword_2269CB000, v18, OS_LOG_TYPE_INFO, "WARNING: MediaLibraryUpdate already running for library %@\n", buf, 0xCu);
    }
  }
  else
  {
    self->_BOOL enableLibraryUpdate = 1;
    libraryUpdateQ = self->_libraryUpdateQ;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __134__ACCMediaLibraryShimInfo_startSendingMediaLibraryUpdates_lastRevision_requestedTransferID_requestedMetaList_requestedMetaProperties___block_invoke;
    v22[3] = &unk_2647C0310;
    v22[4] = self;
    id v23 = v12;
    BOOL v25 = v9;
    BOOL v26 = v8;
    BOOL v27 = v7;
    id v24 = v13;
    dispatch_async(libraryUpdateQ, v22);
  }
}

void __134__ACCMediaLibraryShimInfo_startSendingMediaLibraryUpdates_lastRevision_requestedTransferID_requestedMetaList_requestedMetaProperties___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 33) || *(unsigned char *)(v2 + 32))
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
      BOOL v5 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v5 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(unsigned __int8 *)(v6 + 33);
    LODWORD(v6) = *(unsigned __int8 *)(v6 + 32);
    int v35 = 67109376;
    int v36 = v7;
    __int16 v37 = 1024;
    int v38 = v6;
    BOOL v8 = "startSendingMediaLibraryUpdates: ERROR: MediaLibraryUpdates not started, _enableLibraryUpdate: %d, mediaLibrary"
         "Info instance isShuttingDown: %d";
    BOOL v9 = v5;
    uint32_t v10 = 14;
LABEL_13:
    _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v35, v10);
LABEL_14:

    return;
  }
  id v13 = *(void **)(v2 + 8);
  id v11 = (id *)(v2 + 8);
  id v12 = v13;
  BOOL v14 = *(void **)(a1 + 40);
  if (v13 != v14)
  {
    objc_storeStrong(v11, v14);
    id v12 = *(void **)(a1 + 40);
  }
  if ([v12 count])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 28) = *(unsigned char *)(a1 + 56);
    *(unsigned char *)(*(void *)(a1 + 32) + 29) = *(unsigned char *)(a1 + 57);
    *(unsigned char *)(*(void *)(a1 + 32) + 30) = *(unsigned char *)(a1 + 58);
    id v15 = [*(id *)(a1 + 40) objectForKey:@"HideNonLocal"];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = [v15 BOOLValue];

    uint64_t v16 = [*(id *)(a1 + 40) objectForKey:@"PlayAllSongsCapable"];
    *(unsigned char *)(*(void *)(a1 + 32) + 27) = [v16 BOOLValue];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v17 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = *(unsigned __int8 **)(a1 + 32);
      int v20 = v19[24];
      int v21 = v19[25];
      LODWORD(v19) = v19[26];
      int v35 = 67109632;
      int v36 = v20;
      __int16 v37 = 1024;
      int v38 = v21;
      __int16 v39 = 1024;
      int v40 = (int)v19;
      _os_log_impl(&dword_2269CB000, v17, OS_LOG_TYPE_INFO, "startSendingMediaLibraryUpdates: _sendHideNonLocal %d, _showCloudTracks %d, _showCloudTracksLastSent %d", (uint8_t *)&v35, 0x14u);
    }

    uint64_t v22 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v22 + 24))
    {
      id v23 = [*(id *)(v22 + 40) delegate];
      id v24 = [v23 provider];
      [v24 notify:*(void *)(*(void *)(a1 + 32) + 80) stateChange:0 enabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 25) == 0];

      *(unsigned char *)(*(void *)(a1 + 32) + 26) = *(unsigned char *)(*(void *)(a1 + 32) + 25);
      uint64_t v22 = *(void *)(a1 + 32);
    }
    int v25 = *(_DWORD *)(v22 + 36);
    if (v25 == 2)
    {
      [(id)v22 _beginRadioLibraryUpdates];
      return;
    }
    if (!v25)
    {
      BOOL v26 = (void *)MEMORY[0x22A65DE30]();
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 48));
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(v27 + 64);
      __int16 v29 = [*(id *)(v27 + 56) _syncValidity];
      uint64_t v30 = [(id)v27 _beginMediaLibraryUpdatesWithAnchor:v28 validity:v29];
      uint64_t v31 = *(void *)(a1 + 32);
      __int16 v32 = *(void **)(v31 + 64);
      *(void *)(v31 + 64) = v30;

      return;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      BOOL v5 = MEMORY[0x263EF8438];
      id v33 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v34 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    int v35 = 67109120;
    int v36 = v34;
    BOOL v8 = "startSendingMediaLibraryUpdates: ERROR: Invalid libraryType(%d)";
    BOOL v9 = v5;
    uint32_t v10 = 8;
    goto LABEL_13;
  }
}

- (void)stopSendingMediaLibraryUpdates
{
  uint64_t v13 = *MEMORY[0x263EF8340];
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
    BOOL v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enableLibraryUpdate = self->_enableLibraryUpdate;
    *(_DWORD *)buf = 67109376;
    BOOL v10 = enableLibraryUpdate;
    __int16 v11 = 1024;
    int v12 = 0;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "stopSendingMediaLibraryUpdates: _enableLibraryUpdate=%d -> %d", buf, 0xEu);
  }

  self->_BOOL enableLibraryUpdate = 0;
  libraryUpdateQ = self->_libraryUpdateQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ACCMediaLibraryShimInfo_stopSendingMediaLibraryUpdates__block_invoke;
  block[3] = &unk_2647C02E8;
  block[4] = self;
  dispatch_sync(libraryUpdateQ, block);
  *(_DWORD *)&self->_sendHideNonLocal = 0x10000;
}

void __57__ACCMediaLibraryShimInfo_stopSendingMediaLibraryUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)shuttingDown
{
  uint64_t v16 = *MEMORY[0x263EF8340];
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
    BOOL v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int libraryType = self->_libraryType;
    int v14 = 67109120;
    int v15 = libraryType;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "stopSendingMediaLibraryUpdates: _libraryType=%d", (uint8_t *)&v14, 8u);
  }

  *(_WORD *)&self->_BOOL isShuttingDown = 1;
  int v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self];
  int v8 = self->_libraryType;
  if (v8 != 2)
  {
    if (v8)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        BOOL v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->_libraryType;
        int v14 = 67109120;
        int v15 = v11;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_DEFAULT, "stopSendingMediaLibraryUpdates: ERROR: Invalid libraryType(%d)", (uint8_t *)&v14, 8u);
      }
    }
    else
    {
      [self->_mpMediaLibrary endGeneratingLibraryChangeNotifications];
    }
  }
  while (dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForWindowSem))
    ;
  dispatch_sync((dispatch_queue_t)self->_libraryUpdateQ, &__block_literal_global);
  accessory = self->_accessory;
  self->_accessory = 0;

  context = self->_context;
  self->_context = 0;
}

- (void)_startPlaybackOfRadioStation:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v5 = (char *)HIDWORD(a3);
  if (!HIDWORD(a3))
  {
LABEL_2:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  if ((unint64_t)v5 <= [(NSArray *)self->_stationsGroupList count])
  {
    int v7 = [(NSArray *)self->_stationsGroupList objectAtIndex:v5 - 1];
    BOOL v5 = v7;
    uint64_t v6 = 0;
    if (!a3 || !v7) {
      goto LABEL_9;
    }
    int v8 = [v7 stations];
    unint64_t v9 = [v8 count];

    if (a3 > v9) {
      goto LABEL_2;
    }
    id v10 = [v5 stations];
    uint64_t v6 = [v10 objectAtIndex:a3 - 1];
  }
  else
  {
    uint64_t v6 = 0;
    BOOL v5 = 0;
  }
LABEL_9:
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
    uint64_t v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v23 = a3;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    __int16 v26 = 2112;
    uint64_t v27 = v6;
    _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_INFO, "_startPlaybackOfRadioStation: collectionPersistentID=%llu(%llxh) station=%@", buf, 0x20u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    int v14 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v6 localizedName];
    id v17 = [v6 localizedDescription];
    *(_DWORD *)buf = 138412546;
    unint64_t v23 = (unint64_t)v16;
    __int16 v24 = 2112;
    unint64_t v25 = (unint64_t)v17;
    _os_log_impl(&dword_2269CB000, v14, OS_LOG_TYPE_INFO, "_startPlaybackOfRadioStation: station name='%@'; desc='%@'",
      buf,
      0x16u);
  }
  if (v6)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__ACCMediaLibraryShimInfo__startPlaybackOfRadioStation___block_invoke;
    v20[3] = &unk_2647C0298;
    v20[4] = self;
    id v21 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v20);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v23 = a3;
      __int16 v24 = 2048;
      unint64_t v25 = a3;
      _os_log_impl(&dword_2269CB000, v18, OS_LOG_TYPE_DEFAULT, "_startPlaybackOfRadioStation: Couldn't find station for persistentID=0x%llx(%llu)", buf, 0x16u);
    }
  }
}

void __56__ACCMediaLibraryShimInfo__startPlaybackOfRadioStation___block_invoke(uint64_t a1)
{
  uint64_t v2 = GetMediaLibraryHelper();
  if ([v2 showMusic])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(NSObject **)(v3 + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ACCMediaLibraryShimInfo__startPlaybackOfRadioStation___block_invoke_2;
    block[3] = &unk_2647C0298;
    block[4] = v3;
    id v10 = *(id *)(a1 + 40);
    dispatch_sync(v4, block);
  }
  else
  {
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
      int v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      int v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "_startPlaybackOfRadioStation: no systemMusicPlayer!", v8, 2u);
    }
  }
}

void __56__ACCMediaLibraryShimInfo__startPlaybackOfRadioStation___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  uint64_t v3 = [v2 queueAsRadioStation];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [v3 localizedName];
    int v8 = [v3 localizedDescription];
    int v9 = 138412802;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl(&dword_2269CB000, v6, OS_LOG_TYPE_INFO, "_startPlaybackOfRadioStation: curStation=%@ name='%@'; desc='%@'",
      (uint8_t *)&v9,
      0x20u);
  }
  [v2 setQueueWithRadioStation:*(void *)(a1 + 40)];
  [v2 play];
}

- (void)playWithQuery:(id)a3 andFirstItem:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
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
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v7 title];
    *(_DWORD *)buf = 138412802;
    id v43 = v7;
    __int16 v44 = 2112;
    __int16 v45 = v11;
    __int16 v46 = 2112;
    id v47 = v6;
    _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_DEFAULT, "playWithQuery:andFirstItem=%@[%@] query=%@", buf, 0x20u);
  }
  if (__podcastPlaybackInMusicApp)
  {
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  [v6 items];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v33 = self;
    uint64_t v17 = *(void *)v38;
    LOBYTE(v18) = 1;
    char v19 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        id v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v21, "mediaType", v33) != 2) {
          v19 &= [v21 mediaType] == 1024;
        }
        int v18 = ([v21 mediaType] == 4) & v18;
        if ((v19 & 1) == 0 && !v18)
        {
          char v19 = 0;
          goto LABEL_39;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v16) {
        continue;
      }
      break;
    }
LABEL_39:

    if (v19)
    {
      self = v33;
    }
    else
    {
      self = v33;
      if (!v18)
      {

        uint64_t v12 = 0;
        unint64_t v23 = 0x26ABFC000;
        goto LABEL_49;
      }
    }
  }
  else
  {

    char v19 = 1;
    int v18 = 1;
  }
  __int16 v24 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6];
  uint64_t v12 = MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetLocalQueryData();

  if ((v19 & 1) == 0)
  {
    unint64_t v23 = 0x26ABFC000uLL;
    if (v18)
    {
LABEL_13:
      if (gLogObjects && gNumLogObjects >= 1)
      {
        __int16 v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        __int16 v13 = MEMORY[0x263EF8438];
        id v22 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_DEFAULT, "playWithQuery: allAudioBooks!", buf, 2u);
      }

      MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback();
      if (v7)
      {
        [v7 persistentID];
        MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
      }
      goto LABEL_35;
    }
LABEL_49:
    if (gLogObjects && *(int *)(v23 + 2616) >= 1)
    {
      __int16 v26 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      __int16 v26 = MEMORY[0x263EF8438];
      id v27 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2269CB000, v26, OS_LOG_TYPE_DEFAULT, "playWithQuery: Music!", buf, 2u);
    }

    MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback();
    uint64_t v28 = GetMediaLibraryHelper();
    if ([v28 showMusic])
    {
      mpMusicPlayerControllerQueue = self->_mpMusicPlayerControllerQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__ACCMediaLibraryShimInfo_playWithQuery_andFirstItem___block_invoke;
      block[3] = &unk_2647C0358;
      block[4] = self;
      id v35 = v7;
      id v36 = v6;
      dispatch_sync(mpMusicPlayerControllerQueue, block);
    }
    else
    {
      if (gLogObjects && *(int *)(v23 + 2616) >= 1)
      {
        uint64_t v30 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        uint64_t v30 = MEMORY[0x263EF8438];
        id v32 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2269CB000, v30, OS_LOG_TYPE_DEFAULT, "playWithQuery: no systemMusicPlayer!", buf, 2u);
      }
    }
    if (v12) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    unint64_t v25 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    unint64_t v25 = MEMORY[0x263EF8438];
    id v31 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2269CB000, v25, OS_LOG_TYPE_DEFAULT, "playWithQuery: allPodcasts!", buf, 2u);
  }

  MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback();
  if (v7)
  {
    [v7 persistentID];
    MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
  }
LABEL_35:
  MRMediaRemoteSetAppPlaybackQueue();
  usleep(0x493E0u);
  MRMediaRemoteSendCommandToApp();
  if (v12) {
LABEL_36:
  }
    MRSystemAppPlaybackQueueDestroy();
LABEL_37:
}

void __54__ACCMediaLibraryShimInfo_playWithQuery_andFirstItem___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 104);
  if ([v2 playbackState]) {
    [v2 stop];
  }
  uint64_t v3 = a1[6];
  if (a1[5]) {
    objc_msgSend(v2, "setQueueWithQuery:firstItem:", v3);
  }
  else {
    [v2 setQueueWithQuery:v3];
  }
  [v2 prepareQueueForPlayback];
  if (![v2 numberOfItems])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      BOOL v4 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2269CB000, v4, OS_LOG_TYPE_DEFAULT, "playWithQuery: Playback queue is empty", v6, 2u);
    }
  }
  [v2 play];
}

- (id)_getMediaItemForPersistentID:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a3];
  BOOL v4 = [MEMORY[0x263F11E60] predicateWithValue:v3 forProperty:*MEMORY[0x263F11368]];
  id v5 = [MEMORY[0x263EFFA08] setWithObject:v4];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F11E68]) initWithFilterPredicates:v5];
  [v6 setShouldIncludeNonLibraryEntities:1];
  if (!v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      int v20 = v3;
      _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "_getMediaItemForPersistentID: Failed to create query for persistentIDObj=%@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_35;
  }
  id v7 = [v6 items];
  if ([v7 count] == 1)
  {
    BOOL v8 = [v6 items];
    id v9 = [v8 objectAtIndex:0];

    goto LABEL_36;
  }
  unint64_t v10 = [v7 count];
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v10 < 2)
  {
    if (v12)
    {
      __int16 v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      __int16 v13 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v19 = 138412290;
    int v20 = v3;
    uint64_t v16 = "_getMediaItemForPersistentID: No item match for persistentIDObj=%@";
  }
  else
  {
    if (v12)
    {
      __int16 v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      __int16 v13 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v19 = 138412290;
    int v20 = v3;
    uint64_t v16 = "_getMediaItemForPersistentID: Too many items returned!!! for persistentID=%@";
  }
  _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0xCu);
LABEL_34:

LABEL_35:
  id v9 = 0;
LABEL_36:

  return v9;
}

- (void)startPlaybackOfItems:(id)a3 withFirst:(unsigned int)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v34 = a4;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_DEFAULT, "startPlaybackOfItems:withFirst: firstItemIndex=%d items=%@", buf, 0x12u);
  }

  if (self->_libraryType)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      unint64_t v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      unint64_t v10 = MEMORY[0x263EF8438];
      id v24 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int libraryType = self->_libraryType;
      *(_DWORD *)buf = 67109120;
      unsigned int v34 = libraryType;
      _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfItems: Not supported for type=%u!", buf, 8u);
    }
  }
  else
  {
    unsigned int v27 = a4;
    unint64_t v10 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [MEMORY[0x263F11E40] setDefaultMediaLibrary:self->_mpMediaLibrary];
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedLongLongValue];
          int v18 = (void *)[objc_alloc(MEMORY[0x263F11E08]) initWithPersistentID:v17];
          if (v18)
          {
            [v11 addObject:v18];
          }
          else
          {
            int v19 = [(ACCMediaLibraryShimInfo *)self _getMediaItemForPersistentID:v17];
            if (v19) {
              [v11 addObject:v19];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    if ([v11 count])
    {
      if ([v11 count] <= (unint64_t)v27) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v27;
      }
      uint64_t v21 = [v11 objectAtIndex:v20];
      id v22 = (void *)[objc_alloc(MEMORY[0x263F11E68]) initWithEntities:v11 entityType:0];
      [v22 setShouldIncludeNonLibraryEntities:1];
      [v22 setIgnoreSystemFilterPredicates:1];
      [(ACCMediaLibraryShimInfo *)self playWithQuery:v22 andFirstItem:v21];

      unint64_t v23 = 0x263F11000;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v21 = *(id *)gLogObjects;
        unint64_t v23 = 0x263F11000;
      }
      else
      {
        unint64_t v23 = 0x263F11000uLL;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        uint64_t v21 = MEMORY[0x263EF8438];
        id v26 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2269CB000, v21, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfItems: No valid tracks to playback!", buf, 2u);
      }
    }

    [*(id *)(v23 + 3648) setDefaultMediaLibrary:v10];
  }
}

- (void)_startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirst:(id)a5 orIndex:(unsigned int)a6
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v10 = a5;
  if (a4 > 7) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = qword_2269E5718[a4];
  }
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
    uint64_t v14 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v10 title];
    int libraryType = self->_libraryType;
    *(_DWORD *)buf = 134219522;
    *(void *)uint64_t v61 = a3;
    *(_WORD *)&v61[8] = 2048;
    *(void *)&v61[10] = a4;
    __int16 v62 = 2048;
    uint64_t v63 = v11;
    __int16 v64 = 2112;
    id v65 = v10;
    __int16 v66 = 2112;
    int v67 = v15;
    __int16 v68 = 1024;
    unsigned int v69 = a6;
    __int16 v70 = 1024;
    int v71 = libraryType;
    _os_log_impl(&dword_2269CB000, v14, OS_LOG_TYPE_INFO, "_startPlaybackOfCollection: collectionPersistentID=%llu connectionType=%lld(mp:%lld) firstItem=%@(%@) firstItemIndex=%u _libraryType=%d", buf, 0x40u);
  }
  if (self->_libraryType != 2)
  {
    uint64_t v55 = MEMORY[0x22A65DE30]();
    uint64_t v17 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [MEMORY[0x263F11E40] setDefaultMediaLibrary:self->_mpMediaLibrary];
    uint64_t v18 = [NSNumber numberWithUnsignedLongLong:a3];
    int v19 = [NSNumber numberWithInteger:7423];
    [MEMORY[0x263F11E60] predicateWithValue:v19 forProperty:*MEMORY[0x263F11358]];
    v57 = uint64_t v56 = (void *)v18;
    if ((unint64_t)(v11 - 1) >= 6)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        long long v31 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        long long v31 = MEMORY[0x263EF8438];
        id v33 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)uint64_t v61 = v11;
        _os_log_impl(&dword_2269CB000, v31, OS_LOG_TYPE_INFO, "_startPlaybackOfCollection: Unsupported MPMediaGrouping mp collection type %ld", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v20 = [MEMORY[0x263F11E60] predicateWithValue:v18 forProperty:**((void **)&unk_2647C0440 + v11 - 1)];
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        id v22 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v20, v57, 0);
        uint64_t v54 = GetMediaLibraryHelper();
        if (![v54 showMusic])
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            id v36 = *(id *)gLogObjects;
            long long v29 = v54;
            long long v28 = (void *)v55;
            unint64_t v30 = 0x263F11000;
          }
          else
          {
            unint64_t v30 = 0x263F11000;
            long long v29 = v54;
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCMediaLibraryShimInfo _getUIDString]();
            }
            id v36 = MEMORY[0x263EF8438];
            id v37 = MEMORY[0x263EF8438];
            long long v28 = (void *)v55;
          }
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2269CB000, v36, OS_LOG_TYPE_DEFAULT, "_startPlaybackOfCollection: no systemMusicPlayer!", buf, 2u);
          }

          goto LABEL_80;
        }
        if (a4 == 6) {
          goto LABEL_25;
        }
        unint64_t v23 = 0x263F11000uLL;
        if (!a4)
        {
          id v24 = (void *)[objc_alloc(MEMORY[0x263F11E68]) initWithFilterPredicates:v22];
          [v24 setGroupingType:6];
          id v52 = [v24 collections];
          if ([v52 count])
          {
            unint64_t v25 = [v52 objectAtIndex:0];
            [v25 valueForProperty:*MEMORY[0x263F11458]];
            id v26 = v48 = v24;
            char v50 = [v26 BOOLValue];

            unint64_t v23 = 0x263F11000;
            if (v50)
            {
LABEL_25:
              mpMusicPlayerControllerQueue = self->_mpMusicPlayerControllerQueue;
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __79__ACCMediaLibraryShimInfo__startPlaybackOfCollection_ofType_withFirst_orIndex___block_invoke;
              block[3] = &unk_2647C0298;
              block[4] = self;
              id v59 = v21;
              dispatch_sync(mpMusicPlayerControllerQueue, block);

              long long v29 = v54;
              long long v28 = (void *)v55;
              unint64_t v30 = 0x263F11000;
LABEL_80:

LABEL_81:
              [*(id *)(v30 + 3648) setDefaultMediaLibrary:v17];

              goto LABEL_82;
            }
          }
          else
          {
          }
        }
        long long v38 = (void *)[objc_alloc(*(Class *)(v23 + 3688)) initWithFilterPredicates:v22];
        [v38 setGroupingType:0];
        uint64_t v51 = v38;
        long long v39 = [v38 items];
        id v40 = v10;
        uint64_t v53 = v39;
        if ([v39 count])
        {
          if (!v40)
          {
            if ([v39 count] <= (unint64_t)a6) {
              uint64_t v41 = 0;
            }
            else {
              uint64_t v41 = a6;
            }
            id v40 = [v39 objectAtIndex:v41];
          }
          id v42 = self;
          id v43 = v51;
          __int16 v44 = v40;
          [(ACCMediaLibraryShimInfo *)v42 playWithQuery:v51 andFirstItem:v40];
          __int16 v45 = v54;
          long long v28 = (void *)v55;
          unint64_t v30 = 0x263F11000;
        }
        else
        {
          id v49 = v40;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            __int16 v46 = *(id *)gLogObjects;
            __int16 v45 = v54;
            long long v28 = (void *)v55;
          }
          else
          {
            __int16 v45 = v54;
            long long v28 = (void *)v55;
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCMediaLibraryShimInfo _getUIDString]();
            }
            __int16 v46 = MEMORY[0x263EF8438];
            id v47 = MEMORY[0x263EF8438];
          }
          unint64_t v30 = 0x263F11000uLL;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2269CB000, v46, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfCollection: No valid tracks to playback!", buf, 2u);
          }

          __int16 v44 = v49;
          id v43 = v51;
        }

        long long v29 = v45;
        goto LABEL_80;
      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v22 = *(id *)gLogObjects;
      unint64_t v30 = 0x263F11000;
    }
    else
    {
      unint64_t v30 = 0x263F11000;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v22 = MEMORY[0x263EF8438];
      id v34 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v61 = v11;
      _os_log_impl(&dword_2269CB000, v22, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfCollection: No query found for mp collection type %ld!", buf, 0xCu);
    }
    uint64_t v21 = 0;
    long long v28 = (void *)v55;
    goto LABEL_81;
  }
  if (a4 != 7 && a4)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v32 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v32 = MEMORY[0x263EF8438];
      id v35 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v61 = a4;
      *(_WORD *)&v61[4] = 2048;
      *(void *)&v61[6] = a3;
      _os_log_impl(&dword_2269CB000, v32, OS_LOG_TYPE_DEFAULT, "WARNINGL: PlaybackOfCollection: Invalid type(%d) for collectionPersistentID=%lld", buf, 0x12u);
    }
  }
  else
  {
    [(ACCMediaLibraryShimInfo *)self _startPlaybackOfRadioStation:a3];
  }
LABEL_82:
}

void __79__ACCMediaLibraryShimInfo__startPlaybackOfCollection_ofType_withFirst_orIndex___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  uint64_t v3 = [MEMORY[0x263F11E68] geniusMixesQuery];
  [v3 addFilterPredicate:*(void *)(a1 + 40)];
  BOOL v4 = [v3 collections];
  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
    [v2 setQueueWithGeniusMixPlaylist:v5];
    [v2 play];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v5 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfCollection: Could not get playlist(geniusMix) to playback!", v7, 2u);
    }
  }
}

- (void)startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirst:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
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
    uint64_t v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218496;
    unint64_t v13 = a3;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 1024;
    int v17 = v5;
    _os_log_impl(&dword_2269CB000, v11, OS_LOG_TYPE_DEFAULT, "startPlaybackOfCollection:ofType:withFirst collectionPersistentID=%llu collectionType=%u firstItemIndex=%u", (uint8_t *)&v12, 0x18u);
  }

  [(ACCMediaLibraryShimInfo *)self _startPlaybackOfCollection:a3 ofType:v6 withFirst:0 orIndex:v5];
}

- (void)startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirstPersistentID:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v9 = [(ACCMediaLibraryShimInfo *)self _getMediaItemForPersistentID:a5];
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    int v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    int v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218754;
    unint64_t v14 = a3;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 2048;
    unint64_t v18 = a5;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_2269CB000, v12, OS_LOG_TYPE_DEFAULT, "startPlaybackOfCollection:ofType:withFirstPersistentID: collectionPersistentID=%llu collectionType=%u firstItemPersistentID=%llu firstItem=%@", (uint8_t *)&v13, 0x26u);
  }

  [(ACCMediaLibraryShimInfo *)self _startPlaybackOfCollection:a3 ofType:v6 withFirst:v9 orIndex:0];
}

- (void)startMLPlaybackWithResume:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
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
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v3;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "startMLPlaybackWithResume: resume=%d", buf, 8u);
  }

  if ((self->_libraryType | 2) == 2)
  {
    if (!v3) {
      return;
    }
    id v8 = GetMediaLibraryHelper();
    if ([v8 showMusic])
    {
      mpMusicPlayerControllerQueue = self->_mpMusicPlayerControllerQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__ACCMediaLibraryShimInfo_startMLPlaybackWithResume___block_invoke;
      block[3] = &unk_2647C02E8;
      block[4] = self;
      dispatch_sync(mpMusicPlayerControllerQueue, block);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        BOOL v10 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_INFO, "no systemMusicPlayer!", buf, 2u);
      }
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      id v8 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int libraryType = self->_libraryType;
      *(_DWORD *)buf = 67109120;
      int v16 = libraryType;
      _os_log_impl(&dword_2269CB000, v8, OS_LOG_TYPE_DEFAULT, "ERROR: Invalid libraryType(%d)", buf, 8u);
    }
  }
}

void __53__ACCMediaLibraryShimInfo_startMLPlaybackWithResume___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  if (![v2 playbackState])
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
      BOOL v5 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) UIDString];
      int v16 = 138412290;
      uint64_t v17 = v6;
      _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_INFO, "startMLPlaybackWithResume stopped! prepare all tracks, libraryUID=%@", (uint8_t *)&v16, 0xCu);
    }
    BOOL v7 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v8 + 36) == 2)
    {
      BOOL v9 = [MEMORY[0x263F12198] defaultRadioLibrary];
      BOOL v10 = [v9 stations];
      if ([v10 count])
      {
        id v11 = [v10 objectAtIndex:0];
        [v2 setQueueWithRadioStation:v11];
      }
    }
    else
    {
      [MEMORY[0x263F11E40] setDefaultMediaLibrary:*(void *)(v8 + 56)];
      BOOL v9 = [MEMORY[0x263F11E68] songsQuery];
      [v2 setQueueWithQuery:v9];
    }

    [MEMORY[0x263F11E40] setDefaultMediaLibrary:v7];
  }
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
    unint64_t v14 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  else
  {
    unint64_t v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = [*(id *)(a1 + 32) UIDString];
    int v16 = 138412290;
    uint64_t v17 = v15;
    _os_log_impl(&dword_2269CB000, v14, OS_LOG_TYPE_INFO, "startMLPlaybackWithResume call [musicPlayer play], libraryUID=%@", (uint8_t *)&v16, 0xCu);
  }
  [v2 play];
}

- (void)_startMLPlaybackOfAllSongsStartItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (self->_libraryType)
  {
    if (v6)
    {
      BOOL v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(ACCMediaLibraryShimInfo *)self UIDString];
      int libraryType = self->_libraryType;
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 1024;
      int v22 = libraryType;
      _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "startMLPlaybackOfAllSongs Not supported for, libraryUID=%@ _libraryType=%u", buf, 0x12u);
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v13 = [(ACCMediaLibraryShimInfo *)self UIDString];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v13;
      _os_log_impl(&dword_2269CB000, v8, OS_LOG_TYPE_INFO, "startMLPlaybackOfAllSongs prepare and play all songs, libraryUID=%@", buf, 0xCu);
    }
    BOOL v7 = GetMediaLibraryHelper();
    if ([v7 showMusic])
    {
      mpMusicPlayerControllerQueue = self->_mpMusicPlayerControllerQueue;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __63__ACCMediaLibraryShimInfo__startMLPlaybackOfAllSongsStartItem___block_invoke;
      v17[3] = &unk_2647C0298;
      v17[4] = self;
      id v18 = v4;
      dispatch_sync(mpMusicPlayerControllerQueue, v17);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        __int16 v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        __int16 v15 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2269CB000, v15, OS_LOG_TYPE_INFO, "no systemMusicPlayer!", buf, 2u);
      }
    }
  }
}

void __63__ACCMediaLibraryShimInfo__startMLPlaybackOfAllSongsStartItem___block_invoke(uint64_t a1)
{
  id v4 = *(id *)(*(void *)(a1 + 32) + 104);
  id v2 = [MEMORY[0x263F11E40] defaultMediaLibrary];
  [MEMORY[0x263F11E40] setDefaultMediaLibrary:*(void *)(*(void *)(a1 + 32) + 56)];
  BOOL v3 = [MEMORY[0x263F11E68] songsQuery];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v4, "setQueueWithQuery:firstItem:", v3);
  }
  else {
    [v4 setQueueWithQuery:v3];
  }
  [MEMORY[0x263F11E40] setDefaultMediaLibrary:v2];
  [v4 play];
}

- (void)startMLPlaybackOfAllSongs
{
}

- (void)startMLPlaybackOfAllSongsStartPersistentID:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
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
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    unint64_t v13 = a3;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "startMLPlaybackOfAllSongsStartPersistentID: startingPersistentID=%llu", (uint8_t *)&v12, 0xCu);
  }

  if (self->_libraryType)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(ACCMediaLibraryShimInfo *)self UIDString];
      int libraryType = self->_libraryType;
      int v12 = 138412546;
      unint64_t v13 = (unint64_t)v10;
      __int16 v14 = 1024;
      int v15 = libraryType;
      _os_log_impl(&dword_2269CB000, v8, OS_LOG_TYPE_DEFAULT, "startMLPlaybackOfAllSongs Not supported for, libraryUID=%@ _libraryType=%u", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    uint64_t v8 = [(ACCMediaLibraryShimInfo *)self _getMediaItemForPersistentID:a3];
    [(ACCMediaLibraryShimInfo *)self _startMLPlaybackOfAllSongsStartItem:v8];
  }
}

- (void)confirmMediaLibraryUpdateLastRevision:(id)a3 updateCount:(unsigned int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    unsigned int v13 = a4;
    _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "confirmMediaLibraryUpdateLastRevision: lastRevision=%@ count=%u", (uint8_t *)&v10, 0x12u);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForWindowSem);
}

- (ACCMediaLibraryShim)context
{
  return self->_context;
}

- (ACCMediaLibraryAccessory)accessory
{
  return self->_accessory;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (id)mpMediaLibrary
{
  return self->_mpMediaLibrary;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (OS_dispatch_queue)libraryUpdateQ
{
  return self->_libraryUpdateQ;
}

- (int)libraryType
{
  return self->_libraryType;
}

- (NSString)UIDString
{
  return self->_UIDString;
}

- (OS_dispatch_semaphore)waitForWindowSem
{
  return self->_waitForWindowSem;
}

- (OS_dispatch_queue)mpMusicPlayerControllerQueue
{
  return self->_mpMusicPlayerControllerQueue;
}

- (void)setMpMusicPlayerControllerQueue:(id)a3
{
}

- (MPMusicPlayerController)mpMusicPlayerControllerHandler
{
  return self->_mpMusicPlayerControllerHandler;
}

- (void)setMpMusicPlayerControllerHandler:(id)a3
{
}

- (BOOL)enableLibraryUpdate
{
  return self->_enableLibraryUpdate;
}

- (NSArray)stationsGroupList
{
  return self->_stationsGroupList;
}

- (void)setStationsGroupList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationsGroupList, 0);
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerHandler, 0);
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerQueue, 0);
  objc_storeStrong((id *)&self->_waitForWindowSem, 0);
  objc_storeStrong((id *)&self->_UIDString, 0);
  objc_storeStrong((id *)&self->_libraryUpdateQ, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong(&self->_mpMediaLibrary, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_syncValidityPersistentID, 0);
  objc_storeStrong((id *)&self->_dbUpdateList, 0);
}

- (void)_getUIDString
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2269CB000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)_beginMediaLibraryUpdatesWithAnchor:(uint64_t)a1 validity:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2269CB000, a2, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", (uint8_t *)&v2, 0xCu);
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_92_cold_1(uint64_t a1)
{
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, *MEMORY[0x263EF8340]), "anchor");
  [*(id *)(a1 + 48) persistentID];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_2269CB000, v3, v4, "update:%@ revision:%@ deletePlaylist:%llu progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", v5, v6, v7, v8, 2u);
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_94_cold_1(uint64_t a1)
{
  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, *MEMORY[0x263EF8340]), "revision");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2269CB000, v2, v3, "update:%@ revision:%@ playlist:%@ progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", v4, v5, v6, v7, v8);
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_95_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v5 = [*(id *)(a1 + 40) revision];
  uint64_t v6 = [*(id *)(a1 + 40) content];
  OUTLINED_FUNCTION_4();
  int v7 = 138413826;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  int v10 = v5;
  __int16 v11 = 2112;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2269CB000, a2, OS_LOG_TYPE_DEBUG, "update:%@ revision:%@ content:%@ progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", (uint8_t *)&v7, 0x3Cu);
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_96_cold_1(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, *MEMORY[0x263EF8340]), "anchor");
  [*(id *)(a1 + 48) persistentID];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_2269CB000, v3, v4, "update:%@ revision:%@ deleteItem:%llu progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", v5, v6, v7, v8, 2u);
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_97_cold_1(uint64_t a1)
{
  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, *MEMORY[0x263EF8340]), "revision");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2269CB000, v2, v3, "update:%@ revision:%@ item:[%@] progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", v4, v5, v6, v7, v8);
}

@end