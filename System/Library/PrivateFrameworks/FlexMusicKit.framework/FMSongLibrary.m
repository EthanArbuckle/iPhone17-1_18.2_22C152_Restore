@interface FMSongLibrary
+ (id)sharedLibraryWithOptions:(id)a3;
- (BOOL)contactedCloud;
- (BOOL)networkingIsDisabled;
- (BOOL)supportForCloud;
- (FMSongLibrary)init;
- (FMSongLibrary)initWithOptions:(id)a3;
- (FlexCloudManager)cloudManager;
- (FlexReachability)flexReachability;
- (NSDictionary)options;
- (NSMutableDictionary)bundledSongs;
- (id)fetchSongWithUID:(id)a3;
- (id)fetchSongsWithOptions:(id)a3;
- (int64_t)networkStatus;
- (void)_createCloudManagerOfType:(int64_t)a3;
- (void)_loadBundledSongs;
- (void)_notifySongDownloadInProgressChanged:(BOOL)a3;
- (void)_notifySongsChanged:(id)a3;
- (void)_setupReachability;
- (void)_updateFromCloud;
- (void)cancelDownloadOfAllAssets;
- (void)dealloc;
- (void)networkStatusChanged:(id)a3;
- (void)purgeAllLocalCachedAssetsWithIDs:(id)a3;
- (void)requestDownloadOfAllAssetsWithIDs:(id)a3;
- (void)requestDownloadOfAllAssetsWithIDs:(id)a3 withOptions:(id)a4;
- (void)setBundledSongs:(id)a3;
- (void)setCloudManager:(id)a3;
- (void)setContactedCloud:(BOOL)a3;
- (void)setFlexReachability:(id)a3;
- (void)setNetworkStatus:(int64_t)a3;
@end

@implementation FMSongLibrary

+ (id)sharedLibraryWithOptions:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_217A34D44;
  block[3] = &unk_2642B6D78;
  id v9 = v3;
  uint64_t v4 = qword_267BA93B0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_267BA93B0, block);
  }
  id v6 = (id)qword_267BA93A8;

  return v6;
}

- (FMSongLibrary)init
{
  uint64_t v4 = (FMSongLibrary *)objc_msgSend_initWithOptions_(self, a2, MEMORY[0x263EFFA78], v2, v3);
  id v5 = FlexLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_217A2F000, v5, OS_LOG_TYPE_DEFAULT, "Deprecated: use -initWithOptions: instead", v7, 2u);
  }

  return v4;
}

- (FMSongLibrary)initWithOptions:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)FMSongLibrary;
  id v6 = [(FMSongLibrary *)&v49 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v11 = objc_msgSend_objectForKey_(v5, v8, @"CloudSupportDisabled", v9, v10);
    char v16 = objc_msgSend_BOOLValue(v11, v12, v13, v14, v15);

    v20 = objc_msgSend_objectForKey_(v5, v17, @"NetworkingDisabled", v18, v19);
    v7->_networkingIsDisabled = objc_msgSend_BOOLValue(v20, v21, v22, v23, v24);

    if (v7->_networkingIsDisabled) {
      v7->_networkStatus = 0;
    }
    else {
      objc_msgSend__setupReachability(v7, v25, v26, v27, v28);
    }
    v33 = objc_msgSend_date(MEMORY[0x263EFF910], v25, v26, v27, v28);
    v7->_contactedCloud = 0;
    if ((v16 & 1) == 0) {
      objc_msgSend__createCloudManagerOfType_(v7, v29, 0, v31, v32);
    }
    objc_msgSend__loadBundledSongs(v7, v29, v30, v31, v32);
    if (!v7->_networkingIsDisabled) {
      objc_msgSend__updateFromCloud(v7, v34, v35, v36, v37);
    }
    v38 = FlexLogForCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend_date(MEMORY[0x263EFF910], v39, v40, v41, v42);
      objc_msgSend_timeIntervalSinceDate_(v43, v44, (uint64_t)v33, v45, v46);
      *(_DWORD *)buf = 134217984;
      uint64_t v51 = v47;
      _os_log_impl(&dword_217A2F000, v38, OS_LOG_TYPE_DEFAULT, "library initialized in %.2f seconds\n", buf, 0xCu);
    }
  }

  return v7;
}

- (void)dealloc
{
  id v6 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3, v4);
  objc_msgSend_removeObserver_(v6, v7, (uint64_t)self, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)FMSongLibrary;
  [(FMSongLibrary *)&v10 dealloc];
}

- (void)cancelDownloadOfAllAssets
{
  objc_msgSend_cloudManager(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelDownloadOfAllAssets(v9, v5, v6, v7, v8);
}

- (id)fetchSongWithUID:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v9 = objc_msgSend_cloudManager(self, v4, v5, v6, v7);
    objc_sync_enter(v9);
    uint64_t v14 = objc_msgSend_cloudManager(self, v10, v11, v12, v13);
    uint64_t v18 = objc_msgSend_fetchSongWithUID_(v14, v15, (uint64_t)v8, v16, v17);

    objc_sync_exit(v9);
    if (!v18)
    {
      uint64_t v19 = self;
      objc_sync_enter(v19);
      uint64_t v24 = objc_msgSend_bundledSongs(v19, v20, v21, v22, v23);
      uint64_t v18 = objc_msgSend_objectForKey_(v24, v25, (uint64_t)v8, v26, v27);

      objc_sync_exit(v19);
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  if (objc_msgSend_recalled(v18, v4, v5, v6, v7))
  {

    uint64_t v18 = 0;
  }

  return v18;
}

- (id)fetchSongsWithOptions:(id)a3
{
  v107[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v9 = objc_msgSend_date(MEMORY[0x263EFF910], v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_set(MEMORY[0x263EFF9C0], v10, v11, v12, v13);
  objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v15, @"recalled == NO", v16, v17);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v22;
  if (v4)
  {
    uint64_t v24 = objc_msgSend_predicate(v4, v18, v19, v20, v21);

    uint64_t v23 = v22;
    if (v24)
    {
      v25 = (void *)MEMORY[0x263F08730];
      v107[0] = v22;
      uint64_t v26 = objc_msgSend_predicate(v4, v18, v19, v20, v21);
      v107[1] = v26;
      v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v27, (uint64_t)v107, 2, v28);
      uint64_t v23 = objc_msgSend_andPredicateWithSubpredicates_(v25, v30, (uint64_t)v29, v31, v32);
    }
  }
  v33 = objc_msgSend_cloudManager(self, v18, v19, v20, v21);
  objc_sync_enter(v33);
  v38 = objc_msgSend_cloudManager(self, v34, v35, v36, v37);
  uint64_t v42 = objc_msgSend_fetchSongsWithOptions_(v38, v39, (uint64_t)v4, v40, v41);

  uint64_t v46 = objc_msgSend_filteredArrayUsingPredicate_(v42, v43, (uint64_t)v23, v44, v45);
  objc_msgSend_addObjectsFromArray_(v14, v47, (uint64_t)v46, v48, v49);

  objc_sync_exit(v33);
  v50 = self;
  objc_sync_enter(v50);
  v55 = objc_msgSend_bundledSongs(v50, v51, v52, v53, v54);
  v60 = objc_msgSend_allValues(v55, v56, v57, v58, v59);
  v64 = objc_msgSend_filteredArrayUsingPredicate_(v60, v61, (uint64_t)v23, v62, v63);
  objc_msgSend_addObjectsFromArray_(v14, v65, (uint64_t)v64, v66, v67);

  objc_sync_exit(v50);
  v72 = objc_msgSend_sortDescriptors(v4, v68, v69, v70, v71);

  if (v72)
  {
    v77 = objc_msgSend_sortDescriptors(v4, v73, v74, v75, v76);
    v81 = objc_msgSend_sortedArrayUsingDescriptors_(v14, v78, (uint64_t)v77, v79, v80);

    objc_msgSend_removeAllObjects(v14, v82, v83, v84, v85);
    objc_msgSend_addObjectsFromArray_(v14, v86, (uint64_t)v81, v87, v88);
  }
  v89 = FlexLogForCategory(0);
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    v94 = objc_msgSend_date(MEMORY[0x263EFF910], v90, v91, v92, v93);
    objc_msgSend_timeIntervalSinceDate_(v94, v95, (uint64_t)v9, v96, v97);
    int v105 = 134217984;
    uint64_t v106 = v98;
    _os_log_impl(&dword_217A2F000, v89, OS_LOG_TYPE_DEFAULT, "fetchSongsWithOptions fetched in %.2f seconds\n", (uint8_t *)&v105, 0xCu);
  }
  v103 = objc_msgSend_allObjects(v14, v99, v100, v101, v102);

  return v103;
}

- (void)_loadBundledSongs
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_objectForKey_(self->_options, a2, @"FMSongLibraryInitOption_CustomBundledSongsPath", v2, v3);
  id v9 = v5;
  if (v5)
  {
    id v10 = v5;
  }
  else
  {
    objc_msgSend_pathToBundledResourceWithName_(FlexUtilities, v6, @"FlexAudio", v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = v10;
  uint64_t v15 = objc_msgSend_loadSongsAndArtworkInFolderAtPath_(FMSong, v11, (uint64_t)v10, v12, v13);
  uint64_t v16 = self;
  objc_sync_enter(v16);
  uint64_t v21 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v17, v18, v19, v20);
  objc_msgSend_setBundledSongs_(v16, v22, (uint64_t)v21, v23, v24);

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v25 = v15;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v54, (uint64_t)v62, 16);
  if (v31)
  {
    uint64_t v32 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(v25);
        }
        v34 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v35 = objc_msgSend_bundledSongs(v16, v27, v28, v29, v30, (void)v54);
        uint64_t v40 = objc_msgSend_uid(v34, v36, v37, v38, v39);
        objc_msgSend_setObject_forKeyedSubscript_(v35, v41, (uint64_t)v34, (uint64_t)v40, v42);
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v54, (uint64_t)v62, 16);
    }
    while (v31);
  }

  objc_sync_exit(v16);
  v43 = FlexLogForCategory(0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v48 = objc_msgSend_bundledSongs(v16, v44, v45, v46, v47);
    uint64_t v53 = objc_msgSend_count(v48, v49, v50, v51, v52);
    *(_DWORD *)buf = 134218242;
    uint64_t v59 = v53;
    __int16 v60 = 2112;
    v61 = v14;
    _os_log_impl(&dword_217A2F000, v43, OS_LOG_TYPE_DEFAULT, "loading %lu songs from %@", buf, 0x16u);
  }
}

- (void)_setupReachability
{
  uint64_t v6 = objc_msgSend_reachabilityForInternetConnection(FlexReachability, a2, v2, v3, v4);
  objc_msgSend_setFlexReachability_(self, v7, (uint64_t)v6, v8, v9);

  uint64_t v14 = objc_msgSend_flexReachability(self, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_currentReachabilityStatus(v14, v15, v16, v17, v18);
  objc_msgSend_setNetworkStatus_(self, v20, v19, v21, v22);

  uint64_t v27 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v23, v24, v25, v26);
  objc_msgSend_addObserver_selector_name_object_(v27, v28, (uint64_t)self, (uint64_t)sel_networkStatusChanged_, @"kFlexNetworkReachabilityChangedNotification", 0);

  objc_msgSend_flexReachability(self, v29, v30, v31, v32);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startNotifier(v37, v33, v34, v35, v36);
}

- (void)networkStatusChanged:(id)a3
{
  uint64_t v6 = objc_msgSend_flexReachability(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_currentReachabilityStatus(v6, v7, v8, v9, v10);

  if (!objc_msgSend_networkStatus(self, v12, v13, v14, v15) && v11)
  {
    if ((objc_msgSend_contactedCloud(self, v16, v17, v18, v19) & 1) == 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_217A358F8;
      block[3] = &unk_2642B6D78;
      void block[4] = self;
      if (qword_267BA93B8 != -1) {
        dispatch_once(&qword_267BA93B8, block);
      }
    }
    uint64_t v24 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v20, v21, v22, v23);
    objc_msgSend_postNotificationName_object_(v24, v25, @"FMSongLibraryReconnectedToNetwork", (uint64_t)self, v26);
  }
  objc_msgSend_setNetworkStatus_(self, v16, v11, v18, v19);
}

- (void)_createCloudManagerOfType:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v8 = objc_msgSend_cloudManager(obj, v4, v5, v6, v7);

  if (!a3 && !v8)
  {
    uint64_t v10 = objc_msgSend_createCloudManager_withLibrary_options_(FlexCloudManager, v9, 0, (uint64_t)obj, (uint64_t)obj->_options);
    objc_msgSend_setCloudManager_(obj, v11, (uint64_t)v10, v12, v13);
  }
  objc_sync_exit(obj);
}

- (void)_notifySongsChanged:(id)a3
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, (uint64_t)a3, v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v7, v6, @"FMSongLibraryAvailableSongsChanged", (uint64_t)self, 0);
}

- (void)_notifySongDownloadInProgressChanged:(BOOL)a3
{
  uint64_t v6 = NSDictionary;
  id v7 = objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);
  objc_msgSend_dictionaryWithObject_forKey_(v6, v8, (uint64_t)v7, @"FMSongLibrarySongDownloadInProgressState", v9);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v10, v11, v12, v13);
  objc_msgSend_postNotificationName_object_userInfo_(v14, v15, @"FMSongLibrarySongDownloadInProgressChanged", (uint64_t)self, (uint64_t)v16);
}

- (void)_updateFromCloud
{
  objc_initWeak(&location, self);
  id v7 = objc_msgSend_cloudManager(self, v3, v4, v5, v6);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_217A35BA8;
  v11[3] = &unk_2642B6E20;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  objc_msgSend_fetchAllSongsWithCompletion_(v7, v8, (uint64_t)v11, v9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)requestDownloadOfAllAssetsWithIDs:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  objc_msgSend_requestDownloadOfAllAssetsWithIDs_withOptions_(self, v5, (uint64_t)v4, (uint64_t)v7, v6);
}

- (void)requestDownloadOfAllAssetsWithIDs:(id)a3 withOptions:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_fetchSongsWithOptions_(self, v8, 0, v9, v10);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend_requestDownloadOfAllAssetsWithIDs_withOptions_(*(void **)(*((void *)&v19 + 1) + 8 * v18++), v14, (uint64_t)v6, (uint64_t)v7, v15);
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v16);
  }
}

- (void)purgeAllLocalCachedAssetsWithIDs:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_fetchSongsWithOptions_(self, v5, 0, v6, v7);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v34, (uint64_t)v39, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v14 = v4;
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v38, 16);
        if (v16)
        {
          uint64_t v20 = v16;
          uint64_t v21 = *(void *)v31;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(v14);
              }
              uint64_t v23 = objc_msgSend_assetWithID_(v13, v17, *(void *)(*((void *)&v30 + 1) + 8 * v22), v18, v19);
              objc_msgSend_purgeLocalCache(v23, v24, v25, v26, v27);

              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v38, 16);
          }
          while (v20);
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v34, (uint64_t)v39, 16);
    }
    while (v10);
  }
}

- (BOOL)supportForCloud
{
  uint64_t v5 = objc_msgSend_cloudManager(self, a2, v2, v3, v4);
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)contactedCloud
{
  return self->_contactedCloud;
}

- (void)setContactedCloud:(BOOL)a3
{
  self->_contactedCloud = a3;
}

- (BOOL)networkingIsDisabled
{
  return self->_networkingIsDisabled;
}

- (NSDictionary)options
{
  return self->_options;
}

- (FlexCloudManager)cloudManager
{
  return self->_cloudManager;
}

- (void)setCloudManager:(id)a3
{
}

- (FlexReachability)flexReachability
{
  return self->_flexReachability;
}

- (void)setFlexReachability:(id)a3
{
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (NSMutableDictionary)bundledSongs
{
  return self->_bundledSongs;
}

- (void)setBundledSongs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundledSongs, 0);
  objc_storeStrong((id *)&self->_flexReachability, 0);
  objc_storeStrong((id *)&self->_cloudManager, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end