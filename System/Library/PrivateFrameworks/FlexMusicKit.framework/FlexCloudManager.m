@interface FlexCloudManager
+ (id)createCloudManager:(int64_t)a3 withLibrary:(id)a4 options:(id)a5;
- (FMSongLibrary)library;
- (FlexCloudManager)initWithLibrary:(id)a3;
- (NSMutableArray)cloudManagedSongs;
- (NSMutableDictionary)cloudManagedSongsByUID;
- (id)_existingSongForUID:(id)a3;
- (id)_purgeAndReturnReplacementFor:(id)a3;
- (id)fetchSongWithUID:(id)a3;
- (id)fetchSongsWithOptions:(id)a3;
- (id)loadCachedSongs;
- (unint64_t)assetStatus:(id)a3;
- (unint64_t)retryCount;
- (void)_registerSongs:(id)a3;
- (void)requestDownloadOfAsset:(id)a3;
- (void)requestPurgeOfAsset:(id)a3;
- (void)retryFetchAllSongs;
- (void)setRetryCount:(unint64_t)a3;
@end

@implementation FlexCloudManager

+ (id)createCloudManager:(int64_t)a3 withLibrary:(id)a4 options:(id)a5
{
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    id v7 = a5;
    id v8 = a4;
    v9 = [FlexMobileAssetManagerV2 alloc];
    v5 = objc_msgSend_initWithLibrary_options_(v9, v10, (uint64_t)v8, (uint64_t)v7, v11);
  }
  return v5;
}

- (FlexCloudManager)initWithLibrary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FlexCloudManager;
  v5 = [(FlexCloudManager *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_library, v4);
    uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF980], v7, v8, v9, v10);
    cloudManagedSongs = v6->_cloudManagedSongs;
    v6->_cloudManagedSongs = (NSMutableArray *)v11;

    uint64_t v17 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v13, v14, v15, v16);
    cloudManagedSongsByUID = v6->_cloudManagedSongsByUID;
    v6->_cloudManagedSongsByUID = (NSMutableDictionary *)v17;

    v6->_retryCount = 0;
  }

  return v6;
}

- (void)_registerSongs:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v6 = v4;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v53, (uint64_t)v59, 16);
  if (v12)
  {
    uint64_t v14 = *(void *)v54;
    *(void *)&long long v13 = 138412290;
    long long v52 = v13;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void **)(*((void *)&v53 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend_cloudManagedSongsByUID(v5, v8, v9, v10, v11, v52, (void)v53);
        v22 = objc_msgSend_uid(v16, v18, v19, v20, v21);
        v26 = objc_msgSend_objectForKey_(v17, v23, (uint64_t)v22, v24, v25);

        if (v26)
        {
          v31 = FlexLogForCategory(2uLL);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v36 = objc_msgSend_uid(v16, v32, v33, v34, v35);
            *(_DWORD *)buf = v52;
            v58 = v36;
            _os_log_impl(&dword_217A2F000, v31, OS_LOG_TYPE_DEFAULT, "Song with uid: %@ is already registered", buf, 0xCu);
          }
        }
        else
        {
          v37 = objc_msgSend_cloudManagedSongs(v5, v27, v28, v29, v30);
          objc_msgSend_addObject_(v37, v38, (uint64_t)v16, v39, v40);

          v31 = objc_msgSend_cloudManagedSongsByUID(v5, v41, v42, v43, v44);
          v49 = objc_msgSend_uid(v16, v45, v46, v47, v48);
          objc_msgSend_setObject_forKey_(v31, v50, (uint64_t)v16, (uint64_t)v49, v51);
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v53, (uint64_t)v59, 16);
    }
    while (v12);
  }

  objc_sync_exit(v5);
}

- (void)retryFetchAllSongs
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = objc_msgSend_retryCount(v2, v3, v4, v5, v6);
  double v8 = pow(3.0, (double)(unint64_t)v7);
  uint64_t v9 = FlexLogForCategory(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_msgSend_retryCount(v2, v10, v11, v12, v13);
    *(_DWORD *)buf = 134217984;
    double v27 = pow(3.0, (double)(unint64_t)v14) * 60.0;
    _os_log_impl(&dword_217A2F000, v9, OS_LOG_TYPE_DEFAULT, "refresh requested. will try again in %1.0f seconds", buf, 0xCu);
  }

  objc_initWeak((id *)buf, v2);
  dispatch_time_t v15 = dispatch_time(0, 1000000000 * (uint64_t)(v8 * 60.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_217A32990;
  block[3] = &unk_2642B6D30;
  objc_copyWeak(&v25, (id *)buf);
  dispatch_after(v15, MEMORY[0x263EF83A0], block);
  uint64_t v20 = objc_msgSend_retryCount(v2, v16, v17, v18, v19);
  objc_msgSend_setRetryCount_(v2, v21, v20 + 1, v22, v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
  objc_sync_exit(v2);
}

- (id)fetchSongsWithOptions:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)fetchSongWithUID:(id)a3
{
  return 0;
}

- (void)requestDownloadOfAsset:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  objc_msgSend_requestDownloadOfAsset_withOptions_(self, v5, (uint64_t)v4, (uint64_t)v7, v6);
}

- (id)loadCachedSongs
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)requestPurgeOfAsset:(id)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_isCloudBacked(v4, v5, v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_songUID(v4, v9, v10, v11, v12);
    uint64_t v14 = self;
    objc_sync_enter(v14);
    uint64_t v19 = objc_msgSend_cloudManagedSongsByUID(v14, v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKey_(v19, v20, (uint64_t)v13, v21, v22);

    if (v23)
    {
      uint64_t v28 = objc_msgSend_assetID(v4, v24, v25, v26, v27);
      objc_msgSend_existingAssetWithID_(v23, v29, (uint64_t)v28, v30, v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();

      if (v32 == v4)
      {
        v36 = objc_msgSend__purgeAndReturnReplacementFor_(v14, v33, (uint64_t)v4, v34, v35);
        v43[0] = v36;
        uint64_t v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v37, (uint64_t)v43, 1, v38);
        objc_msgSend_updateAssets_(v23, v40, (uint64_t)v39, v41, v42);
      }
    }
    objc_sync_exit(v14);
  }
}

- (id)_purgeAndReturnReplacementFor:(id)a3
{
  return 0;
}

- (unint64_t)assetStatus:(id)a3
{
  return 1;
}

- (id)_existingSongForUID:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v10 = objc_msgSend_cloudManagedSongsByUID(v5, v6, v7, v8, v9);
  objc_msgSend_objectForKey_(v10, v11, (uint64_t)v4, v12, v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v19 = objc_msgSend_library(v5, v15, v16, v17, v18, 0);
    uint64_t v24 = objc_msgSend_bundledSongs(v19, v20, v21, v22, v23);
    uint64_t v29 = objc_msgSend_allValues(v24, v25, v26, v27, v28);

    id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v44, (uint64_t)v48, 16);
    if (v14)
    {
      uint64_t v35 = *(void *)v45;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(v29);
          }
          v37 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v38 = objc_msgSend_uid(v37, v31, v32, v33, v34);
          int isEqualToString = objc_msgSend_isEqualToString_(v38, v39, (uint64_t)v4, v40, v41);

          if (isEqualToString)
          {
            id v14 = v37;
            goto LABEL_12;
          }
        }
        id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v31, (uint64_t)&v44, (uint64_t)v48, 16);
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  objc_sync_exit(v5);

  return v14;
}

- (FMSongLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  return (FMSongLibrary *)WeakRetained;
}

- (NSMutableArray)cloudManagedSongs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)cloudManagedSongsByUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudManagedSongsByUID, 0);
  objc_storeStrong((id *)&self->_cloudManagedSongs, 0);
  objc_destroyWeak((id *)&self->_library);
}

@end