@interface FlexMobileAssetManagerV2
+ (id)_assetURLForMobileAsset:(id)a3;
+ (id)assetWithNewestContentVersionInAssets:(id)a3 preferInstalled:(BOOL)a4;
+ (id)compatibilityFilterPredicate;
- (BOOL)XMLPresent;
- (BOOL)_isDownloadingAsset:(id)a3;
- (BOOL)_isPurgingAsset:(id)a3;
- (BOOL)includeArtworkInQueries;
- (FlexMobileAssetManagerV2)initWithLibrary:(id)a3 options:(id)a4;
- (OS_dispatch_queue)downloadRequestQueue;
- (OS_dispatch_queue)purgeQueue;
- (OS_dispatch_queue)triggerDownloadAndPurgeQueue;
- (id)_assetIDForMobileAsset:(id)a3;
- (id)_metadataMappingForUUIDSet:(id)a3;
- (id)_mobileAssetCancelDownloadResultStringValue:(int64_t)a3;
- (id)_mobileAssetDownloadOptionsForClientOptions:(id)a3;
- (id)_mobileAssetDownloadResultStringValue:(int64_t)a3;
- (id)_mobileAssetPurgeResultStringValue:(int64_t)a3;
- (id)_mobileAssetQueryResultStringValue:(int64_t)a3;
- (id)_mobileAssetsForAssetType:(id)a3 andUIDs:(id)a4;
- (id)_newestContentSetFromAssets:(id)a3 metadataMapping:(id)a4;
- (id)_processResults:(id)a3 metadataMapping:(id)a4;
- (id)_weightedKeywordsFromMetadataAsset:(id)a3;
- (id)fetchSongWithUID:(id)a3;
- (id)fetchSongsWithOptions:(id)a3;
- (id)filterByClientIDForAssets:(id)a3 forMetadataMapping:(id)a4;
- (int64_t)_responseForDownloadResult:(int64_t)a3;
- (unint64_t)assetStatus:(id)a3;
- (void)_dispatchNextAsyncAssetDownloadAndPurge;
- (void)_loadBundledArtworkForSongID:(id)a3;
- (void)_loadBundledSongForSongID:(id)a3;
- (void)_purgeAsset:(id)a3;
- (void)_registerAndHandleSystemMobileAssetNotifications;
- (void)_runAsyncAssetDownloadForMobileAsset:(id)a3;
- (void)_runNextAsyncAssetDownloadAndPurge;
- (void)_updateExistingSong:(id)a3 usingAsset:(id)a4 metadataAsset:(id)a5;
- (void)_updateExistingSong:(id)a3 usingAsset:(id)a4 metadataAsset:(id)a5 forceUpdate:(BOOL)a6;
- (void)_updateMetadataOnExistingSong:(id)a3 usingMetadataAsset:(id)a4;
- (void)cancelDownloadOfAllAssets;
- (void)cancelDownloadOfAsset:(id)a3;
- (void)fetchAllSongsWithCompletion:(id)a3;
- (void)loadAssetWithID:(id)a3 forSongID:(id)a4;
- (void)requestDownloadOfAsset:(id)a3 withOptions:(id)a4;
- (void)requestPurgeOfAsset:(id)a3;
- (void)setDownloadRequestQueue:(id)a3;
- (void)setIncludeArtworkInQueries:(BOOL)a3;
- (void)setPurgeQueue:(id)a3;
- (void)setTriggerDownloadAndPurgeQueue:(id)a3;
- (void)setXMLPresent:(BOOL)a3;
@end

@implementation FlexMobileAssetManagerV2

- (FlexMobileAssetManagerV2)initWithLibrary:(id)a3 options:(id)a4
{
  id v6 = a4;
  v74.receiver = self;
  v74.super_class = (Class)FlexMobileAssetManagerV2;
  v7 = [(FlexCloudManager *)&v74 initWithLibrary:a3];
  if (v7)
  {
    if (objc_opt_class() && objc_opt_class())
    {
      uint64_t v8 = objc_opt_new();
      downloadThrottleLock = v7->_downloadThrottleLock;
      v7->_downloadThrottleLock = v8;

      uint64_t v10 = objc_opt_new();
      mobileAssetCacheLock = v7->_mobileAssetCacheLock;
      v7->_mobileAssetCacheLock = v10;

      uint64_t v16 = objc_msgSend_orderedSet(MEMORY[0x263EFF9B0], v12, v13, v14, v15);
      pendingDownloadSet = v7->_pendingDownloadSet;
      v7->_pendingDownloadSet = (NSMutableOrderedSet *)v16;

      uint64_t v22 = objc_msgSend_set(MEMORY[0x263EFF9C0], v18, v19, v20, v21);
      processingDownloadSet = v7->_processingDownloadSet;
      v7->_processingDownloadSet = (NSMutableSet *)v22;

      uint64_t v26 = objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x263F08968], v24, 0, 0, v25);
      dowloadOptionsMapping = v7->_dowloadOptionsMapping;
      v7->_dowloadOptionsMapping = (NSMapTable *)v26;

      uint64_t v32 = objc_msgSend_orderedSet(MEMORY[0x263EFF9B0], v28, v29, v30, v31);
      pendingPurgeSet = v7->_pendingPurgeSet;
      v7->_pendingPurgeSet = (NSMutableOrderedSet *)v32;

      uint64_t v38 = objc_msgSend_set(MEMORY[0x263EFF9C0], v34, v35, v36, v37);
      processingPurgeSet = v7->_processingPurgeSet;
      v7->_processingPurgeSet = (NSMutableSet *)v38;

      v40 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      dispatch_queue_t v41 = dispatch_queue_create("com.apple.FlexMusic.mobileAssetPurge", v40);
      purgeQueue = v7->_purgeQueue;
      v7->_purgeQueue = (OS_dispatch_queue *)v41;

      v43 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v44 = dispatch_queue_create("com.apple.FlexMusic.triggerDownloadAndPurge", v43);
      triggerDownloadAndPurgeQueue = v7->_triggerDownloadAndPurgeQueue;
      v7->_triggerDownloadAndPurgeQueue = (OS_dispatch_queue *)v44;

      v46 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v47 = dispatch_queue_create("com.apple.FlexMusic.downloadRequest", v46);
      downloadRequestQueue = v7->_downloadRequestQueue;
      v7->_downloadRequestQueue = (OS_dispatch_queue *)v47;

      uint64_t v52 = objc_msgSend_objectForKey_(v6, v49, @"MobileAssets_ClientID", v50, v51);
      clientID = v7->_clientID;
      v7->_clientID = (NSString *)v52;

      uint64_t v57 = objc_msgSend_objectForKey_(v6, v54, @"MobileAssets_AssetTypeIdentifier", v55, v56);
      mobileAssetTypeIdentifier = v7->_mobileAssetTypeIdentifier;
      v7->_mobileAssetTypeIdentifier = (NSString *)v57;

      if (v7->_clientID && v7->_mobileAssetTypeIdentifier)
      {
        v62 = objc_msgSend_objectForKey_(v6, v59, @"MobileAssets_ListenToSystemNotifications", v60, v61);

        if (v62) {
          objc_msgSend__registerAndHandleSystemMobileAssetNotifications(v7, v63, v64, v65, v66);
        }
        v67 = objc_msgSend_objectForKey_(v6, v63, @"EnableFetchCache", v65, v66);
        v7->_enableFetchCache = objc_msgSend_BOOLValue(v67, v68, v69, v70, v71);

        goto LABEL_9;
      }
    }
    v72 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v72 = v7;
LABEL_12:

  return v72;
}

- (void)_registerAndHandleSystemMobileAssetNotifications
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.flexmusic.MANotificationQueue", v3);
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = v4;

  objc_msgSend_stringByAppendingString_(self->_mobileAssetTypeIdentifier, v6, @".ma.new-asset-installed", v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (const char *)objc_msgSend_cStringUsingEncoding_(v9, v10, 4, v11, v12);

  objc_msgSend_stringByAppendingString_(self->_mobileAssetTypeIdentifier, v14, @".ma.cached-metadata-updated", v15, v16);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v21 = (const char *)objc_msgSend_cStringUsingEncoding_(v17, v18, 4, v19, v20);

  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_217A43F84;
  v23[3] = &unk_2642B7320;
  objc_copyWeak(&v24, &location);
  uint64_t v22 = (void *)MEMORY[0x21D453A80](v23);
  if (v13) {
    notify_register_dispatch(v13, &self->_assetInstalledNotificationToken, (dispatch_queue_t)self->_notificationQueue, v22);
  }
  if (v21) {
    notify_register_dispatch(v21, &self->_catalogUpdatedNotificationToken, (dispatch_queue_t)self->_notificationQueue, v22);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (id)_mobileAssetsForAssetType:(id)a3 andUIDs:(id)a4
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10, v11);
  id v13 = objc_alloc(MEMORY[0x263F55950]);
  id v17 = objc_msgSend_initWithType_(v13, v14, (uint64_t)self->_mobileAssetTypeIdentifier, v15, v16);
  objc_msgSend_setDoNotBlockBeforeFirstUnlock_(v17, v18, 1, v19, v20);
  objc_msgSend_returnTypes_(v17, v21, 2, v22, v23);
  if (v6)
  {
    if (objc_msgSend_addKeyValuePair_with_(v17, v24, @"FMAssetType", (uint64_t)v6, v25))
    {
      uint64_t v30 = FlexLogForCategory(2uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217A2F000, v30, OS_LOG_TYPE_DEFAULT, "error setting up query with addKeyValuePair", buf, 2u);
      }
    }
    if (objc_msgSend_count(v7, v26, v27, v28, v29))
    {
      uint64_t v35 = objc_msgSend_mutableCopy(v7, v31, v32, v33, v34);
      uint64_t v38 = objc_msgSend_addKeyValueArray_with_(v17, v36, @"uuid", (uint64_t)v35, v37);

      if (v38)
      {
        v39 = FlexLogForCategory(2uLL);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217A2F000, v39, OS_LOG_TYPE_DEFAULT, "error setting up query with addKeyValueArray", buf, 2u);
        }
      }
    }
  }
  v108 = v7;
  v40 = FlexLogForCategory(2uLL);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v117 = (uint64_t)v6;
    _os_log_impl(&dword_217A2F000, v40, OS_LOG_TYPE_DEFAULT, "requesting MAAssetQuery for type %@", buf, 0xCu);
  }
  v109 = v6;

  uint64_t v45 = objc_msgSend_date(MEMORY[0x263EFF910], v41, v42, v43, v44);
  uint64_t MetaDataSync = objc_msgSend_queryMetaDataSync(v17, v46, v47, v48, v49);
  objc_msgSend_setXMLPresent_(self, v51, MetaDataSync != 2, v52, v53);
  v54 = FlexLogForCategory(2uLL);
  v110 = v17;
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v59 = objc_msgSend_results(v17, v55, v56, v57, v58);
    uint64_t v64 = objc_msgSend_count(v59, v60, v61, v62, v63);
    uint64_t v69 = objc_msgSend_date(MEMORY[0x263EFF910], v65, v66, v67, v68);
    objc_msgSend_timeIntervalSinceDate_(v69, v70, v45, v71, v72);
    *(_DWORD *)buf = 134218240;
    uint64_t v117 = v64;
    __int16 v118 = 2048;
    uint64_t v119 = v73;
    _os_log_impl(&dword_217A2F000, v54, OS_LOG_TYPE_DEFAULT, "%ld assets queried in %.2f seconds\n", buf, 0x16u);
  }
  uint64_t v106 = v45;
  if (MetaDataSync == 2)
  {
    v78 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217A2F000, v78, OS_LOG_TYPE_DEFAULT, "XML not present", buf, 2u);
    }
  }
  else
  {
    if (!MetaDataSync) {
      goto LABEL_22;
    }
    v78 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      v82 = objc_msgSend__mobileAssetQueryResultStringValue_(self, v79, MetaDataSync, v80, v81, v45, v108, v6);
      *(_DWORD *)buf = 138412290;
      uint64_t v117 = (uint64_t)v82;
      _os_log_impl(&dword_217A2F000, v78, OS_LOG_TYPE_DEFAULT, "MetaDataSync query failed with error code %@", buf, 0xCu);
    }
  }

LABEL_22:
  v83 = objc_msgSend_results(v17, v74, v75, v76, v77, v106);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v111, (uint64_t)v115, 16);
  if (v85)
  {
    uint64_t v90 = v85;
    uint64_t v91 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v90; ++i)
      {
        if (*(void *)v112 != v91) {
          objc_enumerationMutation(v83);
        }
        v93 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        v94 = objc_msgSend_attributes(v93, v86, v87, v88, v89);
        v98 = objc_msgSend_objectForKeyedSubscript_(v94, v95, @"_CompatibilityVersion", v96, v97);
        unsigned int v103 = objc_msgSend_intValue(v98, v99, v100, v101, v102) - 1;

        if (v103 <= 3) {
          objc_msgSend_addObject_(v12, v86, (uint64_t)v93, v88, v89);
        }
      }
      uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v111, (uint64_t)v115, 16);
    }
    while (v90);
  }
  v104 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v86, (uint64_t)v12, v88, v89);

  return v104;
}

+ (id)assetWithNewestContentVersionInAssets:(id)a3 preferInstalled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v10 = v5;
  if (!v5 || !objc_msgSend_count(v5, v6, v7, v8, v9))
  {
    uint64_t v19 = 0;
    goto LABEL_26;
  }
  if (objc_msgSend_count(v10, v11, v12, v13, v14) == 1)
  {
    uint64_t v19 = objc_msgSend_anyObject(v10, v15, v16, v17, v18);
    goto LABEL_26;
  }
  uint64_t v23 = objc_msgSend_allObjects(v10, v15, v16, v17, v18);
  if (v4)
  {
    id v24 = (void *)MEMORY[0x263F08A98];
    uint64_t v25 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], v20, (uint64_t)&unk_26C807030, v21, v22, &unk_26C807048, &unk_26C807060, 0);
    uint64_t v29 = objc_msgSend_predicateWithFormat_(v24, v26, @"state IN %@", v27, v28, v25);
    objc_msgSend_filteredArrayUsingPredicate_(v23, v30, (uint64_t)v29, v31, v32);
    id v33 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v33, v34, v35, v36, v37))
    {
      if (objc_msgSend_count(v33, v38, v39, v40, v41) == 1)
      {
        uint64_t v19 = objc_msgSend_firstObject(v33, v42, v43, v44, v45);
        goto LABEL_25;
      }
      uint64_t v23 = v33;
    }
    else
    {
      uint64_t v23 = objc_msgSend_allObjects(v10, v38, v39, v40, v41);
    }
  }
  v78 = v10;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v33 = v23;
  uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v46, (uint64_t)&v82, (uint64_t)v86, 16);
  uint64_t v19 = 0;
  uint64_t v51 = 0;
  if (!v81) {
    goto LABEL_24;
  }
  uint64_t v80 = *(void *)v83;
  id obj = v33;
  do
  {
    for (uint64_t i = 0; i != v81; ++i)
    {
      if (*(void *)v83 != v80) {
        objc_enumerationMutation(obj);
      }
      uint64_t v53 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      v54 = objc_msgSend_attributes(v53, v47, v48, v49, v50);
      uint64_t v58 = v54;
      if (v19)
      {
        v59 = objc_msgSend_objectForKeyedSubscript_(v54, v55, @"_ContentVersion", v56, v57);
        uint64_t v64 = objc_msgSend_integerValue(v59, v60, v61, v62, v63);
        uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v51, v65, @"_ContentVersion", v66, v67);
        uint64_t v73 = objc_msgSend_integerValue(v68, v69, v70, v71, v72);

        if (v64 <= v73) {
          goto LABEL_22;
        }
        id v74 = v53;
      }
      else
      {
        id v75 = v53;
      }
      id v76 = v58;

      uint64_t v19 = v53;
      uint64_t v51 = v76;
LABEL_22:
    }
    id v33 = obj;
    uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v82, (uint64_t)v86, 16);
  }
  while (v81);
LABEL_24:

  uint64_t v10 = v78;
LABEL_25:

LABEL_26:
  return v19;
}

- (id)filterByClientIDForAssets:(id)a3 forMetadataMapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_217A448E8;
  v14[3] = &unk_2642B7348;
  objc_copyWeak(&v16, &location);
  id v8 = v7;
  id v15 = v8;
  uint64_t v12 = objc_msgSend_objectsPassingTest_(v6, v9, (uint64_t)v14, v10, v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

+ (id)compatibilityFilterPredicate
{
  if (qword_267BA93E8 != -1) {
    dispatch_once(&qword_267BA93E8, &unk_26C7FE9C8);
  }
  v2 = (void *)qword_267BA93E0;
  return v2;
}

- (void)_loadBundledSongForSongID:(id)a3
{
  v140[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_pathToBundledResourceWithName_(FlexUtilities, v5, @"FlexAudio", v6, v7);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9, v10, v11);
    id v16 = objc_msgSend_contentsOfDirectoryAtPath_error_(v13, v14, (uint64_t)v12, 0, v15);

    v137[0] = MEMORY[0x263EF8330];
    v137[1] = 3221225472;
    v137[2] = sub_217A44F7C;
    v137[3] = &unk_2642B7370;
    id v17 = v4;
    id v138 = v17;
    uint64_t v21 = objc_msgSend_indexOfObjectPassingTest_(v16, v18, (uint64_t)v137, v19, v20);
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v16, v22, v21, v23, v24);
      v136 = objc_msgSend_stringByAppendingPathComponent_(v12, v26, (uint64_t)v25, v27, v28);
      uint64_t v32 = objc_msgSend__existingSongForUID_(self, v29, (uint64_t)v17, v30, v31);
      uint64_t v36 = v32;
      if (v32)
      {
        objc_msgSend_existingAssetWithID_(v32, v33, @"FMSongBundleAssetID", v34, v35);
        uint64_t v37 = v135 = v25;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        uint64_t v25 = v135;
        if (isKindOfClass)
        {
          v134 = self;
          uint64_t v42 = objc_msgSend_stringByAppendingPathComponent_(v136, v39, @"metadata.smm", v40, v41);
          uint64_t v47 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v43, v44, v45, v46);
          v133 = (void *)v42;
          LODWORD(v42) = objc_msgSend_fileExistsAtPath_(v47, v48, v42, v49, v50);

          if (v42) {
            objc_msgSend_loadSongInFolderWithPath_(FlexSong, v51, (uint64_t)v136, v52, v53);
          }
          else {
          v132 = objc_msgSend_loadSongAtPath_(FlexMLSong, v51, (uint64_t)v136, v52, v53);
          }
          uint64_t v57 = objc_msgSend_existingAssetWithID_(v132, v54, @"FMSongBundleAssetID", v55, v56);
          uint64_t v61 = objc_msgSend_fileURLWithPath_(NSURL, v58, (uint64_t)v136, v59, v60);
          uint64_t v62 = [FlexMobileAssetV2SongAsset alloc];
          uint64_t v67 = objc_msgSend_contentVersion(v57, v63, v64, v65, v66);
          v131 = v57;
          uint64_t v72 = objc_msgSend_compatibilityVersion(v57, v68, v69, v70, v71);
          id v74 = objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v62, v73, @"FMSongBundleAssetID", (uint64_t)v61, (uint64_t)v134, v67, v72);
          v78 = objc_msgSend_existingAssetWithID_(v36, v75, @"FMSongBundleAssetID", v76, v77);
          uint64_t v79 = objc_opt_class();
          v129 = v78;
          uint64_t v80 = FlexDynamicCast(v79, v78);
          long long v85 = v80;
          if (v80)
          {
            uint64_t v86 = objc_msgSend_newestContentVersion(v80, v81, v82, v83, v84);
            objc_msgSend_setNewestContentVersion_(v74, v87, v86, v88, v89);
            uint64_t v94 = objc_msgSend_newestCompatibilityVersion(v85, v90, v91, v92, v93);
            objc_msgSend_setNewestCompatibilityVersion_(v74, v95, v94, v96, v97);
          }
          v130 = v74;
          v140[0] = v74;
          v98 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v81, (uint64_t)v140, 1, v84, v85);
          objc_msgSend_updateAssets_(v132, v99, (uint64_t)v98, v100, v101);

          uint64_t v105 = objc_msgSend_existingAssetWithID_(v36, v102, @"FMSongArtworkAssetID", v103, v104);
          v109 = (void *)v105;
          if (v105)
          {
            uint64_t v139 = v105;
            v110 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v106, (uint64_t)&v139, 1, v108);
            objc_msgSend_updateAssets_(v132, v111, (uint64_t)v110, v112, v113);
          }
          objc_msgSend_updateBackend_(v36, v106, (uint64_t)v132, v107, v108);
          uint64_t v117 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], v114, (uint64_t)v17, v115, v116);
          v121 = objc_msgSend__metadataMappingForUUIDSet_(v134, v118, (uint64_t)v117, v119, v120);

          v125 = objc_msgSend_objectForKey_(v121, v122, (uint64_t)v17, v123, v124);
          objc_msgSend__updateMetadataOnExistingSong_usingMetadataAsset_(v134, v126, (uint64_t)v36, (uint64_t)v125, v127);

          uint64_t v25 = v135;
        }
      }
    }
  }
}

- (void)_loadBundledArtworkForSongID:(id)a3
{
  v85[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_pathToBundledResourceWithName_(FlexUtilities, v5, @"FlexAudio", v6, v7);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9, v10, v11);
    id v16 = objc_msgSend_contentsOfDirectoryAtPath_error_(v13, v14, (uint64_t)v12, 0, v15);

    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 3221225472;
    v83[2] = sub_217A452CC;
    v83[3] = &unk_2642B7370;
    id v17 = v4;
    id v84 = v17;
    uint64_t v21 = objc_msgSend_indexOfObjectPassingTest_(v16, v18, (uint64_t)v83, v19, v20);
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v16, v22, v21, v23, v24);
      uint64_t v29 = objc_msgSend_versionFromArtworkFilename_(FMSong, v26, (uint64_t)v25, v27, v28);
      id v33 = objc_msgSend__existingSongForUID_(self, v30, (uint64_t)v17, v31, v32);
      uint64_t v37 = v33;
      if (v33)
      {
        uint64_t v38 = objc_msgSend_existingAssetWithID_(v33, v34, @"FMSongArtworkAssetID", v35, v36);
        uint64_t v43 = v38;
        if (!v38
          || objc_msgSend_assetStatus(v38, v39, v40, v41, v42)
          || objc_msgSend_contentVersion(v43, v39, v44, v41, v42) < v29)
        {
          uint64_t v82 = objc_msgSend_existingAssetWithID_(v37, v39, @"FMSongBundleAssetID", v41, v42);
          uint64_t v49 = objc_msgSend_compatibilityVersion(v82, v45, v46, v47, v48);
          uint64_t v80 = v25;
          uint64_t v81 = objc_msgSend_stringByAppendingPathComponent_(v12, v50, (uint64_t)v25, v51, v52);
          uint64_t v56 = objc_msgSend_fileURLWithPath_(NSURL, v53, (uint64_t)v81, v54, v55);
          uint64_t v57 = [FlexMobileAssetV2SongAsset alloc];
          uint64_t v63 = objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v57, v58, @"FMSongArtworkAssetID", (uint64_t)v56, (uint64_t)self, v29, v49);
          if (v43)
          {
            uint64_t v64 = objc_msgSend_contentVersion(v43, v59, v60, v61, v62);
            objc_msgSend_setNewestContentVersion_(v63, v65, v64, v66, v67);
            uint64_t v72 = objc_msgSend_compatibilityVersion(v43, v68, v69, v70, v71);
            objc_msgSend_setNewestCompatibilityVersion_(v63, v73, v72, v74, v75);
          }
          v85[0] = v63;
          uint64_t v76 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v59, (uint64_t)v85, 1, v62);
          objc_msgSend_updateAssets_(v37, v77, (uint64_t)v76, v78, v79);

          uint64_t v25 = v80;
        }
      }
    }
  }
}

- (id)_newestContentSetFromAssets:(id)a3 metadataMapping:(id)a4
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v112 = a4;
  v109 = objc_msgSend_set(MEMORY[0x263EFF9C0], v6, v7, v8, v9);
  long long v114 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v10, v11, v12, v13);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id obj = v5;
  uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v125, (uint64_t)v130, 16);
  if (v113)
  {
    uint64_t v111 = *(void *)v126;
    do
    {
      for (uint64_t i = 0; i != v113; ++i)
      {
        if (*(void *)v126 != v111) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v125 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_attributes(v20, v15, v16, v17, v18);
        uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"uuid", v23, v24);
        uint64_t v29 = objc_msgSend_objectForKey_(v112, v26, (uint64_t)v25, v27, v28);
        uint64_t v34 = objc_msgSend_attributes(v29, v30, v31, v32, v33);
        uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v34, v35, @"recalled", v36, v37);
        int v43 = objc_msgSend_BOOLValue(v38, v39, v40, v41, v42);

        if (v43)
        {
          if (v25) {
            objc_msgSend_addObject_(v109, v44, (uint64_t)v25, v45, v46);
          }
        }
        else
        {
          uint64_t v50 = objc_msgSend_objectForKey_(v114, v44, (uint64_t)v25, v45, v46);
          if (!v50) {
            goto LABEL_12;
          }
          uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(v21, v47, @"_ContentVersion", v48, v49);
          uint64_t v56 = objc_msgSend_integerValue(v51, v52, v53, v54, v55);
          uint64_t v61 = objc_msgSend_attributes(v50, v57, v58, v59, v60);
          uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(v61, v62, @"_ContentVersion", v63, v64);
          LOBYTE(v56) = v56 < objc_msgSend_integerValue(v65, v66, v67, v68, v69);

          if ((v56 & 1) == 0 && (unint64_t)objc_msgSend_state(v20, v70, v71, v72, v73) >= 2) {
LABEL_12:
          }
            objc_msgSend_setObject_forKey_(v114, v47, (uint64_t)v20, (uint64_t)v25, v49);
        }
      }
      uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v125, (uint64_t)v130, 16);
    }
    while (v113);
  }

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v74 = v109;
  uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v121, (uint64_t)v129, 16);
  if (v79)
  {
    uint64_t v80 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v79; ++j)
      {
        if (*(void *)v122 != v80) {
          objc_enumerationMutation(v74);
        }
        objc_msgSend_removeObjectForKey_(v114, v76, *(void *)(*((void *)&v121 + 1) + 8 * j), v77, v78);
      }
      uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v76, (uint64_t)&v121, (uint64_t)v129, 16);
    }
    while (v79);
  }

  uint64_t v86 = objc_msgSend_set(MEMORY[0x263EFF9C0], v82, v83, v84, v85);
  if (objc_msgSend_count(v114, v87, v88, v89, v90))
  {
    v95 = objc_msgSend_allValues(v114, v91, v92, v93, v94);
    objc_msgSend_addObjectsFromArray_(v86, v96, (uint64_t)v95, v97, v98);
  }
  objc_initWeak(&location, self);
  purgeQueue = self->_purgeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_217A457EC;
  block[3] = &unk_2642B73C0;
  objc_copyWeak(&v119, &location);
  id v100 = obj;
  id v116 = v100;
  id v101 = v86;
  id v117 = v101;
  id v102 = v74;
  id v118 = v102;
  dispatch_async(purgeQueue, block);
  uint64_t v106 = objc_msgSend_setWithSet_(MEMORY[0x263EFFA08], v103, (uint64_t)v101, v104, v105);

  objc_destroyWeak(&v119);
  objc_destroyWeak(&location);

  return v106;
}

- (void)fetchAllSongsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  objc_msgSend_setDownloadPriority_(v5, v6, 1, v7, v8);
  uint64_t v12 = objc_msgSend__mobileAssetDownloadOptionsForClientOptions_(self, v9, (uint64_t)v5, v10, v11);
  if ((objc_msgSend_XMLPresent(self, v13, v14, v15, v16) & 1) == 0) {
    objc_msgSend_setDiscretionary_(v12, v17, 0, v18, v19);
  }
  uint64_t v20 = (void *)MEMORY[0x263F55938];
  mobileAssetTypeIdentifier = self->_mobileAssetTypeIdentifier;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_217A45E14;
  v24[3] = &unk_2642B73E8;
  v24[4] = self;
  id v25 = v4;
  id v22 = v4;
  objc_msgSend_startCatalogDownload_options_then_(v20, v23, (uint64_t)mobileAssetTypeIdentifier, (uint64_t)v12, (uint64_t)v24);
}

- (id)_metadataMappingForUUIDSet:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_allObjects(v4, v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v15, @"Metadata", (uint64_t)v14, v16);

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v17;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v20)
  {
    uint64_t v25 = v20;
    uint64_t v26 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v18);
        }
        uint64_t v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v29 = objc_msgSend_attributes(v28, v21, v22, v23, v24, (void)v41);
        uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v29, v30, @"uuid", v31, v32);

        objc_msgSend_setObject_forKey_(v9, v34, (uint64_t)v28, (uint64_t)v33, v35);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v25);
  }

  uint64_t v39 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v36, (uint64_t)v9, v37, v38);

  return v39;
}

+ (id)_assetURLForMobileAsset:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_getLocalUrl(v3, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_state(v3, v9, v10, v11, v12);

  id v18 = 0;
  if (v8 && (v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v19 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v14, v15, v16, v17);
    id v18 = objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(v19, v20, (uint64_t)v8, MEMORY[0x263EFFA68], 4, 0);
  }
  if (objc_msgSend_count(v18, v14, v15, v16, v17))
  {
    uint64_t v25 = objc_msgSend_firstObject(v18, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (id)_assetIDForMobileAsset:(id)a3
{
  uint64_t v5 = objc_msgSend_attributes(a3, a2, (uint64_t)a3, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"FMAssetType", v7, v8);

  if (objc_msgSend_isEqualToString_(v9, v10, @"SongBundle", v11, v12))
  {
    uint64_t v16 = FMSongBundleAssetID;
LABEL_5:
    uint64_t v17 = *v16;
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(v9, v13, @"Artwork", v14, v15))
  {
    uint64_t v16 = FMSongArtworkAssetID;
    goto LABEL_5;
  }
  uint64_t v17 = 0;
LABEL_7:

  return v17;
}

- (id)_weightedKeywordsFromMetadataAsset:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_attributes(a3, a2, (uint64_t)a3, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"weightedKeywords", v7, v8);

  long long v44 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v10, v11, v12, v13);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v18 = objc_msgSend_allKeys(v9, v14, v15, v16, v17);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v20)
  {
    uint64_t v24 = v20;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v18);
        }
        uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v28 = objc_msgSend_valueForKey_(v9, v21, v27, v22, v23);
        id v29 = objc_alloc_init(MEMORY[0x263F08A30]);
        objc_msgSend_setNumberStyle_(v29, v30, 1, v31, v32);
        uint64_t v38 = objc_msgSend_numberFromString_(v29, v33, (uint64_t)v28, v34, v35);
        if (v38) {
          objc_msgSend_setObject_forKey_(v44, v36, (uint64_t)v38, v27, v37);
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v24);
  }

  long long v42 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v39, (uint64_t)v44, v40, v41);

  return v42;
}

- (void)_updateMetadataOnExistingSong:(id)a3 usingMetadataAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = v7;
  if (!v6) {
    goto LABEL_48;
  }
  if (!v7) {
    goto LABEL_48;
  }
  uint64_t v13 = objc_msgSend_attributes(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"_ContentVersion", v15, v16);
  uint64_t v22 = objc_msgSend_integerValue(v17, v18, v19, v20, v21);

  if (v22 <= objc_msgSend_metadataVersion(v6, v23, v24, v25, v26)) {
    goto LABEL_48;
  }
  uint64_t v31 = objc_msgSend_array(MEMORY[0x263EFF980], v27, v28, v29, v30);
  uint64_t v38 = objc_msgSend_existingAssetWithID_(v6, v32, @"FMSongArtworkAssetID", v33, v34);
  if (v38) {
    objc_msgSend_addObject_(v31, v35, v38, v36, v37);
  }
  uint64_t v208 = v22;
  uint64_t v43 = objc_msgSend_existingAssetWithID_(v6, v35, @"FMSongBundleAssetID", v36, v37);
  if (v43) {
    objc_msgSend_addObject_(v31, v39, v43, v41, v42);
  }
  v212 = v31;
  v213 = (void *)v43;
  long long v44 = objc_msgSend_attributes(v12, v39, v40, v41, v42);
  uint64_t v215 = objc_msgSend_objectForKeyedSubscript_(v44, v45, @"songName", v46, v47);

  uint64_t v52 = objc_msgSend_attributes(v12, v48, v49, v50, v51);
  uint64_t v211 = objc_msgSend_objectForKeyedSubscript_(v52, v53, @"artistName", v54, v55);

  uint64_t v60 = objc_msgSend_attributes(v12, v56, v57, v58, v59);
  uint64_t v64 = objc_msgSend_objectForKeyedSubscript_(v60, v61, @"hiddenIDs", v62, v63);
  unsigned int v207 = objc_msgSend_containsObject_(v64, v65, (uint64_t)self->_clientID, v66, v67);

  uint64_t v72 = objc_msgSend_attributes(v12, v68, v69, v70, v71);
  uint64_t v76 = objc_msgSend_objectForKeyedSubscript_(v72, v73, @"recalled", v74, v75);
  int v210 = objc_msgSend_BOOLValue(v76, v77, v78, v79, v80);

  uint64_t v85 = objc_msgSend_attributes(v12, v81, v82, v83, v84);
  uint64_t v214 = objc_msgSend_objectForKeyedSubscript_(v85, v86, @"sbFmt", v87, v88);

  v216 = objc_msgSend_dictionary(NSDictionary, v89, v90, v91, v92);
  uint64_t v97 = objc_msgSend_attributes(v12, v93, v94, v95, v96);
  id v101 = objc_msgSend_objectForKeyedSubscript_(v97, v98, @"tagIDs", v99, v100);
  uint64_t v106 = objc_msgSend_firstObject(v101, v102, v103, v104, v105);

  uint64_t v111 = (void *)MEMORY[0x263EFFA08];
  v209 = (void *)v38;
  if (v106)
  {
    id v112 = objc_msgSend_attributes(v12, v107, v108, v109, v110);
    id v116 = objc_msgSend_objectForKeyedSubscript_(v112, v113, @"tagIDs", v114, v115);
    uint64_t v120 = objc_msgSend_setWithArray_(v111, v117, (uint64_t)v116, v118, v119);
  }
  else
  {
    uint64_t v120 = objc_msgSend_set(MEMORY[0x263EFFA08], v107, v108, v109, v110);
  }
  long long v125 = objc_msgSend_attributes(v12, v121, v122, v123, v124);
  v129 = objc_msgSend_objectForKeyedSubscript_(v125, v126, @"keywords", v127, v128);
  v134 = objc_msgSend_firstObject(v129, v130, v131, v132, v133);

  uint64_t v139 = (void *)MEMORY[0x263EFFA08];
  if (v134)
  {
    v140 = objc_msgSend_attributes(v12, v135, v136, v137, v138);
    v144 = objc_msgSend_objectForKeyedSubscript_(v140, v141, @"keywords", v142, v143);
    v148 = objc_msgSend_setWithArray_(v139, v145, (uint64_t)v144, v146, v147);
  }
  else
  {
    v148 = objc_msgSend_set(MEMORY[0x263EFFA08], v135, v136, v137, v138);
  }
  v153 = (void *)v211;
  v154 = objc_msgSend_attributes(v12, v149, v150, v151, v152);
  v158 = objc_msgSend_objectForKeyedSubscript_(v154, v155, @"weightedKeywords", v156, v157);

  v163 = v213;
  if (v158)
  {
    uint64_t v164 = objc_msgSend__weightedKeywordsFromMetadataAsset_(self, v159, (uint64_t)v12, v161, v162);

    v216 = (void *)v164;
  }
  if (v210)
  {
    uint64_t v165 = v215;
    if (v215)
    {
      if (v211) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v165 = objc_msgSend_songName(v6, v159, v160, v161, v162);
      if (v211)
      {
LABEL_19:
        if (!v120) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    v153 = objc_msgSend_artistName(v6, v159, v160, v161, v162);
    if (!v120)
    {
LABEL_24:
      uint64_t v166 = objc_msgSend_tagIDs(v6, v159, v160, v161, v162);

      uint64_t v120 = (void *)v166;
LABEL_25:
      if (!v148 || !objc_msgSend_count(v148, v159, v160, v161, v162))
      {
        uint64_t v167 = objc_msgSend_keywords(v6, v159, v160, v161, v162);

        v148 = (void *)v167;
      }
      uint64_t v168 = v214;
      if (!v214)
      {
        uint64_t v168 = objc_msgSend_songFormat(v6, v159, v160, v161, v162);
      }
      uint64_t v214 = v168;
      uint64_t v215 = v165;
      if (!v216 || !objc_msgSend_count(v216, v159, v160, v161, v162))
      {
        uint64_t v169 = objc_msgSend_weightedKeywords(v6, v159, v160, v161, v162);

        v216 = (void *)v169;
      }
      goto LABEL_33;
    }
LABEL_23:
    if (objc_msgSend_count(v120, v159, v160, v161, v162)) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_33:
  if (objc_msgSend_isLoaded(v6, v159, v160, v161, v162))
  {
    if (v213)
    {
      v174 = objc_msgSend_localURL(v213, v170, v171, v172, v173);
      v178 = objc_msgSend_backendForSongBundleURL_(FlexUtilities, v175, (uint64_t)v174, v176, v177);

      if (v178)
      {
        v180 = (void *)v215;
        objc_msgSend_updateSongArtist_title_tags_keywords_weightedKeywords_hidden_recalled_metadataVersion_(v178, v179, (uint64_t)v153, v215, (uint64_t)v120, v148, v216, v207, v210, v208);
        v184 = v209;
        if (v212) {
          objc_msgSend_updateAssets_(v178, v181, (uint64_t)v212, v182, v183);
        }
        objc_msgSend_updateBackend_(v6, v181, (uint64_t)v178, v182, v183);
      }
      else
      {
        v205 = FlexLogForCategory(2uLL);
        v184 = v209;
        if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v218 = 0;
          _os_log_impl(&dword_217A2F000, v205, OS_LOG_TYPE_DEFAULT, "could not create replacement backend", v218, 2u);
        }

        v180 = (void *)v215;
      }

      v203 = (void *)v214;
    }
    else
    {
      v204 = FlexLogForCategory(2uLL);
      if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217A2F000, v204, OS_LOG_TYPE_DEFAULT, "could not create replacement backend", buf, 2u);
      }

      v184 = v209;
      v203 = (void *)v214;
      v180 = (void *)v215;
    }
  }
  else
  {
    v185 = [FlexSongProxy alloc];
    v190 = objc_msgSend_uid(v6, v186, v187, v188, v189);
    objc_msgSend_audioEncoderPresetName(v6, v191, v192, v193, v194);
    v195 = v148;
    v197 = uint64_t v196 = (uint64_t)v153;
    HIBYTE(v206) = v210;
    LOBYTE(v206) = v207;
    v180 = (void *)v215;
    v199 = objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v185, v198, (uint64_t)v190, v215, v196, v120, v195, v216, v206, v212, v197, v208, v214);

    v153 = (void *)v196;
    v148 = v195;
    v163 = v213;

    objc_msgSend_updateBackend_(v6, v200, (uint64_t)v199, v201, v202);
    v203 = (void *)v214;
    v184 = v209;
  }

LABEL_48:
}

- (void)_updateExistingSong:(id)a3 usingAsset:(id)a4 metadataAsset:(id)a5
{
}

- (void)_updateExistingSong:(id)a3 usingAsset:(id)a4 metadataAsset:(id)a5 forceUpdate:(BOOL)a6
{
  BOOL v6 = a6;
  v277[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v17 = v12;
  if (!v10 || !v11) {
    goto LABEL_44;
  }
  if (v12)
  {
    id v18 = objc_msgSend_attributes(v11, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v18, v19, @"FMAssetType", v20, v21);

    if (objc_msgSend_isEqualToString_(v22, v23, @"SongBundle", v24, v25)) {
      objc_msgSend__updateMetadataOnExistingSong_usingMetadataAsset_(self, v26, (uint64_t)v10, (uint64_t)v17, v27);
    }
  }
  uint64_t v28 = objc_msgSend_attributes(v11, v13, v14, v15, v16);
  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v28, v29, @"_ContentVersion", v30, v31);
  v270 = objc_msgSend_objectForKeyedSubscript_(v28, v33, @"_CompatibilityVersion", v34, v35);
  v271 = objc_msgSend__assetIDForMobileAsset_(self, v36, (uint64_t)v11, v37, v38);
  long long v45 = objc_msgSend_existingAssetWithID_(v10, v39, (uint64_t)v271, v40, v41);
  if (v45)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v267 = v32;
      uint64_t v46 = objc_msgSend__assetURLForMobileAsset_(FlexMobileAssetManagerV2, v42, (uint64_t)v11, v43, v44);
      uint64_t v51 = [FlexMobileAssetV2SongAsset alloc];
      if (v46)
      {
        uint64_t v52 = objc_msgSend_integerValue(v267, v47, v48, v49, v50);
        uint64_t v57 = objc_msgSend_integerValue(v270, v53, v54, v55, v56);
        uint64_t v61 = objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v51, v58, (uint64_t)v271, (uint64_t)v46, (uint64_t)self, v52, v57);
        if (!v61)
        {
LABEL_12:

          uint64_t v32 = v267;
          goto LABEL_13;
        }
      }
      else
      {
        v129 = objc_msgSend_localURL(v45, v47, v48, v49, v50);
        v262 = v28;
        uint64_t v134 = objc_msgSend_contentVersion(v45, v130, v131, v132, v133);
        uint64_t v139 = objc_msgSend_compatibilityVersion(v45, v135, v136, v137, v138);
        uint64_t v140 = v134;
        uint64_t v28 = v262;
        uint64_t v61 = objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v51, v141, (uint64_t)v271, (uint64_t)v129, (uint64_t)self, v140, v139);

        if (!v61) {
          goto LABEL_12;
        }
      }
      v277[0] = v61;
      uint64_t v62 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v59, (uint64_t)v277, 1, v60);
      objc_msgSend_updateAssets_(v10, v63, (uint64_t)v62, v64, v65);

      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v70 = objc_msgSend_existingAssetWithID_(v10, v42, (uint64_t)v271, v43, v44);
  if (v70)
  {
    uint64_t v71 = objc_msgSend_integerValue(v32, v66, v67, v68, v69);
    BOOL v76 = v71 > objc_msgSend_contentVersion(v70, v72, v73, v74, v75);
  }
  else
  {
    BOOL v76 = 0;
  }
  BOOL v81 = objc_msgSend_assetStatus(v70, v66, v67, v68, v69) == 1
     && (objc_msgSend_state(v11, v77, v78, v79, v80) & 0xFFFFFFFFFFFFFFFELL) == 2;
  int v82 = v76 || v81;
  if (!v70 || v6 || v82)
  {
    if (v70)
    {
      if ((v82 | v6) == 1)
      {
        uint64_t v83 = objc_msgSend_assetStatus(v70, v77, v78, v79, v80);
        unint64_t v88 = objc_msgSend_state(v11, v84, v85, v86, v87);
        if (v83 || v88 > 1)
        {
          v265 = v45;
          uint64_t v142 = objc_msgSend__assetURLForMobileAsset_(FlexMobileAssetManagerV2, v89, (uint64_t)v11, v91, v92);
          uint64_t v143 = [FlexMobileAssetV2SongAsset alloc];
          uint64_t v148 = objc_msgSend_integerValue(v32, v144, v145, v146, v147);
          uint64_t v153 = objc_msgSend_integerValue(v270, v149, v150, v151, v152);
          v261 = (void *)v142;
          v155 = objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v143, v154, (uint64_t)v271, v142, (uint64_t)self, v148, v153);
          if (objc_msgSend_isEqualToString_(v271, v156, @"FMSongBundleAssetID", v157, v158))objc_msgSend_existingAssetWithID_(v10, v159, @"FMSongArtworkAssetID", v160, v161); {
          else
          }
          uint64_t v162 = objc_msgSend_existingAssetWithID_(v10, v159, @"FMSongBundleAssetID", v160, v161);
          v268 = v32;
          if (objc_msgSend_isLoaded(v10, v163, v164, v165, v166))
          {
            if (v162)
            {
              v275[0] = v162;
              v275[1] = v155;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v167, (uint64_t)v275, 2, v168);
            }
            else
            {
              v274 = v155;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v167, (uint64_t)&v274, 1, v168);
            v209 = };
            objc_msgSend_updateAssets_(v10, v210, (uint64_t)v209, v211, v212);
            long long v45 = v265;
          }
          else
          {
            v253 = [FlexSongProxy alloc];
            v260 = objc_msgSend_uid(v10, v169, v170, v171, v172);
            v255 = objc_msgSend_attributes(v17, v173, v174, v175, v176);
            v259 = objc_msgSend_objectForKeyedSubscript_(v255, v177, @"songName", v178, v179);
            v254 = objc_msgSend_attributes(v17, v180, v181, v182, v183);
            v258 = objc_msgSend_objectForKeyedSubscript_(v254, v184, @"artistName", v185, v186);
            v257 = objc_msgSend_tagIDs(v10, v187, v188, v189, v190);
            v252 = objc_msgSend_keywords(v10, v191, v192, v193, v194);
            v251 = objc_msgSend_weightedKeywords(v10, v195, v196, v197, v198);
            char v250 = objc_msgSend_hidden(v10, v199, v200, v201, v202);
            char v249 = objc_msgSend_recalled(v10, v203, v204, v205, v206);
            v263 = v28;
            v256 = v155;
            if (v162)
            {
              v273[0] = v162;
              v273[1] = v155;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v207, (uint64_t)v273, 2, v208);
            }
            else
            {
              v272 = v155;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v207, (uint64_t)&v272, 1, v208);
            }
            v247 = long long v45 = v265;
            v266 = objc_msgSend_attributes(v17, v213, v214, v215, v216);
            v246 = objc_msgSend_objectForKeyedSubscript_(v266, v217, @"audioEncoderPresetName", v218, v219);
            v248 = objc_msgSend_attributes(v17, v220, v221, v222, v223);
            v269 = objc_msgSend_objectForKeyedSubscript_(v248, v224, @"_ContentVersion", v225, v226);
            uint64_t v231 = objc_msgSend_integerValue(v269, v227, v228, v229, v230);
            v236 = objc_msgSend_attributes(v17, v232, v233, v234, v235);
            v240 = objc_msgSend_objectForKeyedSubscript_(v236, v237, @"sbFmt", v238, v239);
            HIBYTE(v245) = v249;
            LOBYTE(v245) = v250;
            v209 = objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v253, v241, (uint64_t)v260, (uint64_t)v259, (uint64_t)v258, v257, v252, v251, v245, v247, v246, v231, v240);

            objc_msgSend_updateBackend_(v10, v242, (uint64_t)v209, v243, v244);
            uint64_t v28 = v263;
            v155 = v256;
          }

          uint64_t v32 = v268;
        }
        else
        {
          uint64_t v93 = objc_msgSend_integerValue(v32, v89, v90, v91, v92);
          objc_msgSend_setNewestContentVersion_(v70, v94, v93, v95, v96);
          uint64_t v101 = objc_msgSend_integerValue(v270, v97, v98, v99, v100);
          objc_msgSend_setNewestCompatibilityVersion_(v70, v102, v101, v103, v104);
        }
      }
    }
    else
    {
      objc_msgSend__assetURLForMobileAsset_(FlexMobileAssetManagerV2, v77, (uint64_t)v11, v79, v80);
      uint64_t v105 = v264 = v45;
      uint64_t v106 = [FlexMobileAssetV2SongAsset alloc];
      uint64_t v111 = objc_msgSend_integerValue(v32, v107, v108, v109, v110);
      id v112 = v32;
      uint64_t v113 = v28;
      uint64_t v114 = v111;
      uint64_t v119 = objc_msgSend_integerValue(v270, v115, v116, v117, v118);
      uint64_t v120 = v114;
      uint64_t v28 = v113;
      uint64_t v32 = v112;
      uint64_t v122 = objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v106, v121, (uint64_t)v271, (uint64_t)v105, (uint64_t)self, v120, v119);
      v276 = v122;
      long long v125 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v123, (uint64_t)&v276, 1, v124);
      objc_msgSend_updateAssets_(v10, v126, (uint64_t)v125, v127, v128);

      long long v45 = v264;
    }
  }

LABEL_44:
}

- (id)_processResults:(id)a3 metadataMapping:(id)a4
{
  uint64_t v261 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v249 = a4;
  uint64_t v230 = v5;
  id v10 = objc_msgSend_allObjects(v5, v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_sortedArrayUsingComparator_(v10, v11, (uint64_t)&unk_26C7FE9E8, v12, v13);

  objc_msgSend_array(MEMORY[0x263EFF980], v15, v16, v17, v18);
  id v247 = (id)objc_claimAutoreleasedReturnValue();
  long long v257 = 0u;
  long long v258 = 0u;
  long long v255 = 0u;
  long long v256 = 0u;
  id obj = v14;
  uint64_t v251 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v255, (uint64_t)v260, 16);
  if (v251)
  {
    uint64_t v250 = *(void *)v256;
    do
    {
      for (uint64_t i = 0; i != v251; ++i)
      {
        if (*(void *)v256 != v250) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v255 + 1) + 8 * i);
        uint64_t v29 = objc_msgSend__assetIDForMobileAsset_(self, v20, (uint64_t)v24, v21, v22);
        if (v29)
        {
          v253 = objc_msgSend_attributes(v24, v25, v26, v27, v28);
          v254 = objc_msgSend_objectForKeyedSubscript_(v253, v30, @"uuid", v31, v32);
          uint64_t v36 = objc_msgSend_objectForKey_(v249, v33, (uint64_t)v254, v34, v35);
          uint64_t v41 = objc_msgSend_attributes(v36, v37, v38, v39, v40);
          long long v45 = objc_msgSend_objectForKeyedSubscript_(v41, v42, @"hiddenIDs", v43, v44);
          unsigned __int8 v49 = objc_msgSend_containsObject_(v45, v46, (uint64_t)self->_clientID, v47, v48);

          uint64_t v54 = objc_msgSend_attributes(v36, v50, v51, v52, v53);
          uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v54, v55, @"recalled", v56, v57);
          char v63 = objc_msgSend_BOOLValue(v58, v59, v60, v61, v62);

          uint64_t v64 = self;
          objc_sync_enter(v64);
          uint64_t v71 = objc_msgSend__existingSongForUID_(v64, v65, (uint64_t)v254, v66, v67);
          if (v71)
          {
            objc_msgSend__updateExistingSong_usingAsset_metadataAsset_forceUpdate_(v64, v68, (uint64_t)v71, (uint64_t)v24, (uint64_t)v36, 0);
            objc_msgSend_addObject_(v247, v72, (uint64_t)v71, v73, v74);
          }
          else if ((v63 & 1) == 0)
          {
            uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v253, v68, @"_ContentVersion", v69, v70);
            if (v78)
            {
              __int16 v245 = objc_msgSend_objectForKeyedSubscript_(v253, v75, @"_ContentVersion", v76, v77);
            }
            else
            {
              __int16 v245 = &unk_26C807078;
            }

            uint64_t v85 = objc_msgSend_objectForKeyedSubscript_(v253, v79, @"_CompatibilityVersion", v80, v81);
            if (v85)
            {
              uint64_t v244 = objc_msgSend_objectForKeyedSubscript_(v253, v82, @"_CompatibilityVersion", v83, v84);
            }
            else
            {
              uint64_t v244 = &unk_26C807078;
            }

            uint64_t v243 = objc_msgSend__assetURLForMobileAsset_(FlexMobileAssetManagerV2, v86, (uint64_t)v24, v87, v88);
            uint64_t v89 = [FlexMobileAssetV2SongAsset alloc];
            uint64_t v94 = objc_msgSend_integerValue(v245, v90, v91, v92, v93);
            uint64_t v99 = objc_msgSend_integerValue(v244, v95, v96, v97, v98);
            v242 = objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v89, v100, (uint64_t)v29, (uint64_t)v243, (uint64_t)v64, v94, v99);
            v246 = objc_msgSend_dictionary(NSDictionary, v101, v102, v103, v104);
            uint64_t v109 = objc_msgSend_attributes(v36, v105, v106, v107, v108);
            uint64_t v113 = objc_msgSend_objectForKeyedSubscript_(v109, v110, @"tagIDs", v111, v112);
            uint64_t v118 = objc_msgSend_firstObject(v113, v114, v115, v116, v117);

            uint64_t v123 = (void *)MEMORY[0x263EFFA08];
            if (v118)
            {
              uint64_t v124 = objc_msgSend_attributes(v36, v119, v120, v121, v122);
              uint64_t v128 = objc_msgSend_objectForKeyedSubscript_(v124, v125, @"tagIDs", v126, v127);
              v240 = objc_msgSend_setWithArray_(v123, v129, (uint64_t)v128, v130, v131);
            }
            else
            {
              v240 = objc_msgSend_set(MEMORY[0x263EFFA08], v119, v120, v121, v122);
            }
            uint64_t v136 = objc_msgSend_attributes(v36, v132, v133, v134, v135);
            uint64_t v140 = objc_msgSend_objectForKeyedSubscript_(v136, v137, @"keywords", v138, v139);
            uint64_t v145 = objc_msgSend_firstObject(v140, v141, v142, v143, v144);

            uint64_t v150 = (void *)MEMORY[0x263EFFA08];
            if (v145)
            {
              uint64_t v151 = objc_msgSend_attributes(v36, v146, v147, v148, v149);
              v155 = objc_msgSend_objectForKeyedSubscript_(v151, v152, @"keywords", v153, v154);
              v237 = objc_msgSend_setWithArray_(v150, v156, (uint64_t)v155, v157, v158);
            }
            else
            {
              v237 = objc_msgSend_set(MEMORY[0x263EFFA08], v146, v147, v148, v149);
            }
            v163 = objc_msgSend_attributes(v36, v159, v160, v161, v162);
            uint64_t v167 = objc_msgSend_objectForKeyedSubscript_(v163, v164, @"weightedKeywords", v165, v166);

            unsigned __int8 v232 = v49;
            if (v167)
            {
              uint64_t v171 = objc_msgSend__weightedKeywordsFromMetadataAsset_(v64, v168, (uint64_t)v36, v169, v170);

              v246 = (void *)v171;
            }
            uint64_t v231 = [FlexSongProxy alloc];
            v241 = objc_msgSend_attributes(v36, v172, v173, v174, v175);
            v236 = objc_msgSend_objectForKeyedSubscript_(v241, v176, @"songName", v177, v178);
            uint64_t v239 = objc_msgSend_attributes(v36, v179, v180, v181, v182);
            uint64_t v235 = objc_msgSend_objectForKeyedSubscript_(v239, v183, @"artistName", v184, v185);
            v259 = v242;
            uint64_t v234 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v186, (uint64_t)&v259, 1, v187);
            uint64_t v238 = objc_msgSend_attributes(v36, v188, v189, v190, v191);
            uint64_t v233 = objc_msgSend_objectForKeyedSubscript_(v238, v192, @"audioEncoderPresetName", v193, v194);
            v199 = objc_msgSend_attributes(v36, v195, v196, v197, v198);
            v203 = objc_msgSend_objectForKeyedSubscript_(v199, v200, @"_ContentVersion", v201, v202);
            uint64_t v208 = objc_msgSend_integerValue(v203, v204, v205, v206, v207);
            v213 = objc_msgSend_attributes(v36, v209, v210, v211, v212);
            v217 = objc_msgSend_objectForKeyedSubscript_(v213, v214, @"sbFmt", v215, v216);
            LOWORD(v229) = v232;
            uint64_t v219 = objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v231, v218, (uint64_t)v254, (uint64_t)v236, (uint64_t)v235, v240, v237, v246, v229, v234, v233, v208, v217);

            v220 = [FMSong alloc];
            v224 = objc_msgSend_initWithBackend_(v220, v221, (uint64_t)v219, v222, v223);
            objc_msgSend_addObject_(v247, v225, (uint64_t)v224, v226, v227);
          }
          objc_sync_exit(v64);
        }
      }
      uint64_t v251 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v255, (uint64_t)v260, 16);
    }
    while (v251);
  }

  return v247;
}

- (void)loadAssetWithID:(id)a3 forSongID:(id)a4
{
  uint64_t v209 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v11 = v7;
  if (v6 && v7)
  {
    uint64_t v15 = objc_msgSend__existingSongForUID_(self, v8, (uint64_t)v7, v9, v10);
    if (!v15)
    {
      uint64_t v20 = FlexLogForCategory(2uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217A2F000, v20, OS_LOG_TYPE_DEFAULT, "attempting to load a song that doesn't exist", buf, 2u);
      }
      goto LABEL_48;
    }
    if (objc_msgSend_isEqualToString_(v6, v12, @"FMSongArtworkAssetID", v13, v14))
    {
      uint64_t v19 = self->_mobileAssetCacheLock;
      objc_sync_enter(v19);
      if (self->_includeArtworkInQueries)
      {
        objc_sync_exit(v19);
      }
      else
      {
        v199 = v11;
        uint64_t v197 = v15;
        self->_includeArtworkInQueries = 1;
        objc_sync_exit(v19);

        uint64_t v23 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v21, @"Artwork", 0, v22);
        uint64_t v28 = objc_msgSend_set(MEMORY[0x263EFF9C0], v24, v25, v26, v27);
        long long v201 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        long long v204 = 0u;
        id v29 = v23;
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v201, (uint64_t)v208, 16);
        if (v31)
        {
          uint64_t v36 = v31;
          uint64_t v37 = *(void *)v202;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v202 != v37) {
                objc_enumerationMutation(v29);
              }
              uint64_t v39 = objc_msgSend_attributes(*(void **)(*((void *)&v201 + 1) + 8 * i), v32, v33, v34, v35);
              uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v39, v40, @"uuid", v41, v42);

              if (v43) {
                objc_msgSend_addObject_(v28, v44, (uint64_t)v43, v45, v46);
              }
            }
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v201, (uint64_t)v208, 16);
          }
          while (v36);
        }

        uint64_t v50 = objc_msgSend__metadataMappingForUUIDSet_(self, v47, (uint64_t)v28, v48, v49);
        id v53 = (id)objc_msgSend__newestContentSetFromAssets_metadataMapping_(self, v51, (uint64_t)v29, (uint64_t)v50, v52);

        uint64_t v15 = v197;
        id v11 = v199;
      }
    }
    uint64_t v54 = objc_msgSend_existingAssetWithID_(v15, v16, (uint64_t)v6, v17, v18);
    uint64_t v20 = v54;
    if (v54 && (objc_msgSend_isCloudBacked(v54, v55, v56, v57, v58) & 1) != 0)
    {
LABEL_29:
      if (objc_msgSend_isEqualToString_(v6, v55, @"FMSongBundleAssetID", v57, v58))
      {
        uint64_t v101 = objc_msgSend_localURL(v20, v97, v98, v99, v100);
        if (v101)
        {
          uint64_t v106 = (void *)v101;
          uint64_t v107 = objc_msgSend_array(MEMORY[0x263EFF980], v102, v103, v104, v105);
          objc_msgSend_addObject_(v107, v108, (uint64_t)v20, v109, v110);
          uint64_t v118 = objc_msgSend_existingAssetWithID_(v15, v111, @"FMSongArtworkAssetID", v112, v113);
          if (v118) {
            objc_msgSend_addObject_(v107, v114, (uint64_t)v118, v116, v117);
          }
          uint64_t v119 = objc_msgSend_pathExtension(v106, v114, v115, v116, v117);
          int isEqualToString = objc_msgSend_isEqualToString_(v119, v120, @"smsbundle", v121, v122);

          if (isEqualToString)
          {
            uint64_t v128 = objc_msgSend_path(v106, v124, v125, v126, v127);
            uint64_t v132 = objc_msgSend_stringByAppendingPathComponent_(v128, v129, @"metadata.smm", v130, v131);

            uint64_t v137 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v133, v134, v135, v136);
            int v141 = objc_msgSend_fileExistsAtPath_(v137, v138, (uint64_t)v132, v139, v140);

            uint64_t v149 = objc_msgSend_path(v106, v142, v143, v144, v145);
            if (v141) {
              objc_msgSend_loadSongInFolderWithPath_(FlexSong, v146, (uint64_t)v149, v147, v148);
            }
            else {
            uint64_t v150 = objc_msgSend_loadSongAtPath_(FlexMLSong, v146, (uint64_t)v149, v147, v148);
            }

            if (v150)
            {
              v195 = v106;
              uint64_t v198 = v132;
              uint64_t v200 = v118;
              uint64_t v196 = objc_msgSend_artistName(v15, v151, v152, v153, v154);
              v159 = objc_msgSend_songName(v15, v155, v156, v157, v158);
              uint64_t v164 = objc_msgSend_tagIDs(v15, v160, v161, v162, v163);
              uint64_t v194 = objc_msgSend_keywords(v15, v165, v166, v167, v168);
              uint64_t v173 = objc_msgSend_weightedKeywords(v15, v169, v170, v171, v172);
              unsigned int v193 = objc_msgSend_hidden(v15, v174, v175, v176, v177);
              char v182 = objc_msgSend_recalled(v15, v178, v179, v180, v181);
              uint64_t v187 = objc_msgSend_metadataVersion(v15, v183, v184, v185, v186);
              objc_msgSend_updateSongArtist_title_tags_keywords_weightedKeywords_hidden_recalled_metadataVersion_(v150, v188, (uint64_t)v196, (uint64_t)v159, (uint64_t)v164, v194, v173, v193, v182, v187);

              if (v107) {
                objc_msgSend_updateAssets_(v150, v189, (uint64_t)v107, v190, v191);
              }
              objc_msgSend_updateBackend_(v15, v189, (uint64_t)v150, v190, v191);
              uint64_t v132 = v198;
              uint64_t v118 = v200;
              uint64_t v106 = v195;
            }
            else
            {
              uint64_t v192 = FlexLogForCategory(2uLL);
              if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_217A2F000, v192, OS_LOG_TYPE_DEFAULT, "could not create replacement backend", buf, 2u);
              }
            }
          }
          else
          {
            uint64_t v150 = FlexLogForCategory(2uLL);
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_217A2F000, v150, OS_LOG_TYPE_DEFAULT, "could not locate smsBundle", buf, 2u);
            }
          }
        }
      }
LABEL_48:

      goto LABEL_49;
    }
    uint64_t v59 = objc_msgSend_set(MEMORY[0x263EFF9C0], v55, v56, v57, v58);
    char v63 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], v60, (uint64_t)v11, v61, v62);
    uint64_t v67 = objc_msgSend__metadataMappingForUUIDSet_(self, v64, (uint64_t)v63, v65, v66);

    if (objc_msgSend_isEqualToString_(v6, v68, @"FMSongArtworkAssetID", v69, v70))
    {
      if (!v20) {
        objc_msgSend__loadBundledArtworkForSongID_(self, v71, (uint64_t)v11, v72, v73);
      }
      uint64_t v74 = @"Artwork";
      uint64_t v207 = v11;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v71, (uint64_t)&v207, 1, v73);
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v6, v71, @"FMSongBundleAssetID", v72, v73))
      {
LABEL_28:
        uint64_t v89 = objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(self, v75, (uint64_t)v59, (uint64_t)v67, v76);
        id v92 = (id)objc_msgSend__processResults_metadataMapping_(self, v90, (uint64_t)v89, (uint64_t)v67, v91);
        uint64_t v96 = objc_msgSend_existingAssetWithID_(v15, v93, (uint64_t)v6, v94, v95);

        uint64_t v20 = v96;
        goto LABEL_29;
      }
      uint64_t v74 = @"SongBundle";
      uint64_t v206 = v11;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v75, (uint64_t)&v206, 1, v76);
    uint64_t v77 = };
    uint64_t v80 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v78, (uint64_t)v74, (uint64_t)v77, v79);
    uint64_t v85 = objc_msgSend_allObjects(v80, v81, v82, v83, v84);
    objc_msgSend_addObjectsFromArray_(v59, v86, (uint64_t)v85, v87, v88);

    goto LABEL_28;
  }
LABEL_49:
}

- (void)_dispatchNextAsyncAssetDownloadAndPurge
{
  objc_initWeak(&location, self);
  triggerDownloadAndPurgeQueue = self->_triggerDownloadAndPurgeQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_217A4864C;
  v4[3] = &unk_2642B6D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(triggerDownloadAndPurgeQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_runNextAsyncAssetDownloadAndPurge
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_downloadThrottleLock;
  objc_sync_enter(v3);
  if ((unint64_t)objc_msgSend_count(self->_processingDownloadSet, v4, v5, v6, v7) > 2)
  {
    uint64_t v20 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_msgSend_count(self->_processingDownloadSet, v21, v22, v23, v24);
      uint64_t v30 = objc_msgSend_count(self->_pendingDownloadSet, v26, v27, v28, v29);
      int v41 = 134218240;
      uint64_t v42 = v25;
      __int16 v43 = 2048;
      uint64_t v44 = v30;
      _os_log_impl(&dword_217A2F000, v20, OS_LOG_TYPE_DEFAULT, "There are currently %lu assets downloading and %lu assets in the _pendingDownloadsSet.", (uint8_t *)&v41, 0x16u);
    }

    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = objc_msgSend_firstObject(self->_pendingDownloadSet, v8, v9, v10, v11);
    if (v16)
    {
      objc_msgSend_removeObject_(self->_pendingDownloadSet, v12, (uint64_t)v16, v14, v15);
      objc_msgSend_addObject_(self->_processingDownloadSet, v17, (uint64_t)v16, v18, v19);
    }
  }
  uint64_t v34 = objc_msgSend_firstObject(self->_pendingPurgeSet, v12, v13, v14, v15);
  if (v34)
  {
    objc_msgSend_removeObject_(self->_pendingPurgeSet, v31, (uint64_t)v34, v32, v33);
    objc_msgSend_addObject_(self->_processingPurgeSet, v35, (uint64_t)v34, v36, v37);
  }
  objc_sync_exit(v3);

  if (v16) {
    objc_msgSend__runAsyncAssetDownloadForMobileAsset_(self, v38, (uint64_t)v16, v39, v40);
  }
  if (v34) {
    objc_msgSend__purgeAsset_(self, v38, (uint64_t)v34, v39, v40);
  }
}

- (BOOL)_isDownloadingAsset:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self->_downloadThrottleLock;
  objc_sync_enter(v5);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = self->_pendingDownloadSet;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v31, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v27;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v6);
      }
      if (objc_msgSend_isEqualToSongAsset_(*(void **)(*((void *)&v26 + 1) + 8 * v13), v8, (uint64_t)v4, v9, v10)) {
        goto LABEL_18;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v26, (uint64_t)v31, 16);
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = self->_processingDownloadSet;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v22, (uint64_t)v30, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v23;
LABEL_11:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v23 != v19) {
        objc_enumerationMutation(v6);
      }
      if (objc_msgSend_isEqualToSongAsset_(*(void **)(*((void *)&v22 + 1) + 8 * v20), v15, (uint64_t)v4, v16, v17, (void)v22))break; {
      if (v18 == ++v20)
      }
      {
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v22, (uint64_t)v30, 16);
        if (v18) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v18) = 1;
  }
LABEL_19:

  objc_sync_exit(v5);
  return v18;
}

- (BOOL)_isPurgingAsset:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self->_downloadThrottleLock;
  objc_sync_enter(v5);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = self->_pendingPurgeSet;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v31, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v27;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v6);
      }
      if (objc_msgSend_isEqualToSongAsset_(*(void **)(*((void *)&v26 + 1) + 8 * v13), v8, (uint64_t)v4, v9, v10)) {
        goto LABEL_18;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v26, (uint64_t)v31, 16);
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = self->_processingPurgeSet;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v22, (uint64_t)v30, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v23;
LABEL_11:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v23 != v19) {
        objc_enumerationMutation(v6);
      }
      if (objc_msgSend_isEqualToSongAsset_(*(void **)(*((void *)&v22 + 1) + 8 * v20), v15, (uint64_t)v4, v16, v17, (void)v22))break; {
      if (v18 == ++v20)
      }
      {
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v22, (uint64_t)v30, 16);
        if (v18) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v18) = 1;
  }
LABEL_19:

  objc_sync_exit(v5);
  return v18;
}

- (void)requestDownloadOfAsset:(id)a3 withOptions:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_songUID(v6, v8, v9, v10, v11);
  uint64_t v13 = FlexLogForCategory(2uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_msgSend_assetID(v6, v14, v15, v16, v17);
    long long v23 = objc_msgSend_description(v7, v19, v20, v21, v22);
    *(_DWORD *)buf = 138412802;
    uint64_t v47 = v12;
    __int16 v48 = 2112;
    uint64_t v49 = v18;
    __int16 v50 = 2112;
    uint64_t v51 = v23;
    _os_log_impl(&dword_217A2F000, v13, OS_LOG_TYPE_DEFAULT, "Beginning download of %@ %@ with options %@", buf, 0x20u);
  }
  long long v27 = objc_msgSend__existingSongForUID_(self, v24, (uint64_t)v12, v25, v26);
  if (v27)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!objc_msgSend_assetStatus(v6, v28, v29, v30, v31)
        && objc_msgSend_localURLExists(v6, v32, v33, v34, v35)
        && (objc_msgSend_contentUpdateAvailable(v6, v32, v33, v34, v35) & 1) == 0)
      {
        uint64_t v36 = FlexLogForCategory(2uLL);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v12;
        uint64_t v37 = "Not downloading %@ because asset is already local and there is no cloud update available.";
        goto LABEL_15;
      }
      if (!objc_msgSend_recalled(v27, v32, v33, v34, v35))
      {
        objc_initWeak((id *)buf, self);
        downloadRequestQueue = self->_downloadRequestQueue;
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = sub_217A4904C;
        v39[3] = &unk_2642B7430;
        objc_copyWeak(&v45, (id *)buf);
        id v40 = v6;
        int v41 = self;
        id v42 = v27;
        id v43 = v12;
        id v44 = v7;
        dispatch_async(downloadRequestQueue, v39);

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)buf);
        goto LABEL_17;
      }
      uint64_t v36 = FlexLogForCategory(2uLL);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v12;
        uint64_t v37 = "Not downloading %@ due to recall";
LABEL_15:
        _os_log_impl(&dword_217A2F000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v36 = FlexLogForCategory(2uLL);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v12;
        uint64_t v37 = "Not downloading %@ due to asset not MobileAsset backed";
        goto LABEL_15;
      }
    }
  }
  else
  {
    uint64_t v36 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v12;
      uint64_t v37 = "Not downloading %@ due to no existing song";
      goto LABEL_15;
    }
  }
LABEL_16:

LABEL_17:
}

- (id)_mobileAssetDownloadOptionsForClientOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v9 = objc_msgSend_allowsCellular(v3, v5, v6, v7, v8);
  objc_msgSend_setAllowsCellularAccess_(v4, v10, v9, v11, v12);
  uint64_t v17 = objc_msgSend_reachabilityForInternetConnection(FlexReachability, v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_currentReachabilityStatus(v17, v18, v19, v20, v21);

  if (v22 == 1 || !objc_msgSend_downloadPriority(v3, v23, v24, v25, v26))
  {
    objc_msgSend_setTimeoutIntervalForResource_(v4, v23, 120, v25, v26);
    objc_msgSend_setDiscretionary_(v4, v27, 0, v28, v29);
  }
  else
  {
    objc_msgSend_setDiscretionary_(v4, v23, 1, v25, v26);
  }

  return v4;
}

- (void)_runAsyncAssetDownloadForMobileAsset:(id)a3
{
  v87[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v10 = objc_msgSend_attributes(v4, v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"uuid", v12, v13);

    uint64_t v18 = objc_msgSend__assetIDForMobileAsset_(self, v15, (uint64_t)v9, v16, v17);
    uint64_t v22 = objc_msgSend__existingSongForUID_(self, v19, (uint64_t)v14, v20, v21);
    uint64_t v69 = objc_msgSend_existingAssetWithID_(v22, v23, (uint64_t)v18, v24, v25);
    uint64_t v30 = objc_msgSend_reachabilityForInternetConnection(FlexReachability, v26, v27, v28, v29);
    uint64_t v35 = objc_msgSend_currentReachabilityStatus(v30, v31, v32, v33, v34);

    if (v35)
    {
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = sub_217A49934;
      v79[3] = &unk_2642B7458;
      id v36 = v22;
      id v80 = v36;
      id v37 = v69;
      id v81 = v37;
      objc_msgSend_attachProgressCallBack_(v9, v38, (uint64_t)v79, v39, v40);
      id v44 = objc_msgSend_objectForKey_(self->_dowloadOptionsMapping, v41, (uint64_t)v9, v42, v43);
      __int16 v48 = objc_msgSend__mobileAssetDownloadOptionsForClientOptions_(self, v45, (uint64_t)v44, v46, v47);
      objc_initWeak(&location, self);
      uint64_t v49 = FlexLogForCategory(2uLL);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v83 = v14;
        __int16 v84 = 2112;
        uint64_t v85 = v18;
        _os_log_impl(&dword_217A2F000, v49, OS_LOG_TYPE_DEFAULT, "Starting download task for UID: %@ assetID: %@", buf, 0x16u);
      }

      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = sub_217A499C0;
      v70[3] = &unk_2642B7480;
      objc_copyWeak(&v77, &location);
      uint64_t v71 = v14;
      id v72 = v18;
      uint64_t v73 = self;
      id v74 = v9;
      id v75 = v36;
      id v76 = v37;
      objc_msgSend_startDownload_then_(v74, v50, (uint64_t)v48, (uint64_t)v70, v51);

      objc_destroyWeak(&v77);
      objc_destroyWeak(&location);

      uint64_t v52 = v80;
    }
    else
    {
      id v53 = FlexLogForCategory(2uLL);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217A2F000, v53, OS_LOG_TYPE_DEFAULT, "Not downloading since network is not reachable", buf, 2u);
      }

      uint64_t v54 = *MEMORY[0x263F08338];
      v86[0] = *MEMORY[0x263F08320];
      v86[1] = v54;
      v87[0] = @"Download operation was unsuccessful.";
      v87[1] = @"No network connection";
      uint64_t v52 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)v87, (uint64_t)v86, 2);
      uint64_t v57 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v56, @"com.apple.FlexMusicKit", 0, (uint64_t)v52);
      objc_msgSend_updateAsset_downloadProgress_error_(v22, v58, (uint64_t)v69, (uint64_t)v57, v59, -1.0);
      objc_msgSend_updateAsset_downloadProgress_error_(v22, v60, (uint64_t)v69, 0, v61, 0.0);
      uint64_t v62 = self->_downloadThrottleLock;
      objc_sync_enter(v62);
      objc_msgSend_removeObject_(self->_processingDownloadSet, v63, (uint64_t)v9, v64, v65);
      objc_msgSend_removeObjectForKey_(self->_dowloadOptionsMapping, v66, (uint64_t)v9, v67, v68);
      objc_sync_exit(v62);
    }
  }
  else
  {
    uint64_t v14 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217A2F000, v14, OS_LOG_TYPE_DEFAULT, "Not downloading due to nil mobile asset", buf, 2u);
    }
  }
}

- (void)cancelDownloadOfAsset:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v67 = objc_msgSend_songUID(v4, v5, v6, v7, v8);
  uint64_t v66 = objc_msgSend_assetID(v4, v9, v10, v11, v12);
  uint64_t v13 = self->_downloadThrottleLock;
  objc_sync_enter(v13);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v14 = self->_pendingDownloadSet;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v78, (uint64_t)v89, 16);
  if (v19)
  {
    uint64_t v20 = *(void *)v79;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v79 != v20) {
        objc_enumerationMutation(v14);
      }
      uint64_t v22 = *(void **)(*((void *)&v78 + 1) + 8 * v21);
      if (objc_msgSend_isEqualToSongAsset_(v22, v16, (uint64_t)v4, v17, v18)) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v78, (uint64_t)v89, 16);
        if (v19) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v23 = v22;

    if (v23) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_9:
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v27 = self->_processingDownloadSet;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v74, (uint64_t)v88, 16);
  if (v32)
  {
    uint64_t v33 = *(void *)v75;
LABEL_13:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v75 != v33) {
        objc_enumerationMutation(v27);
      }
      uint64_t v35 = *(void **)(*((void *)&v74 + 1) + 8 * v34);
      if (objc_msgSend_isEqualToSongAsset_(v35, v29, (uint64_t)v4, v30, v31)) {
        break;
      }
      if (v32 == ++v34)
      {
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v74, (uint64_t)v88, 16);
        if (v32) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
    id v23 = v35;

    if (!v23) {
      goto LABEL_27;
    }
LABEL_21:
    if (objc_msgSend_containsObject_(self->_pendingDownloadSet, v24, (uint64_t)v23, v25, v26)) {
      objc_msgSend_removeObject_(self->_pendingDownloadSet, v36, (uint64_t)v23, v37, v38);
    }
    int v42 = objc_msgSend_containsObject_(self->_processingDownloadSet, v36, (uint64_t)v23, v37, v38);
    if (v42) {
      objc_msgSend_removeObject_(self->_processingDownloadSet, v39, (uint64_t)v23, v40, v41);
    }
    uint64_t v43 = objc_msgSend_objectForKey_(self->_dowloadOptionsMapping, v39, (uint64_t)v23, v40, v41);
    BOOL v44 = v43 == 0;

    if (!v44)
    {
      objc_msgSend_removeObjectForKey_(self->_dowloadOptionsMapping, v45, (uint64_t)v23, v46, v47);
      goto LABEL_33;
    }
  }
  else
  {
LABEL_19:

LABEL_27:
    __int16 v48 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v83 = v67;
      __int16 v84 = 2112;
      uint64_t v85 = v66;
      _os_log_impl(&dword_217A2F000, v48, OS_LOG_TYPE_DEFAULT, "Cancel download failed for mobile asset with songUID: %@ assetID: %@ - no mobile asset associated with song asset", buf, 0x16u);
    }

    LOBYTE(v42) = 0;
    id v23 = 0;
  }
  uint64_t v49 = FlexLogForCategory(2uLL);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v83 = v67;
    __int16 v84 = 2112;
    uint64_t v85 = v66;
    __int16 v86 = 2112;
    id v87 = v23;
    _os_log_impl(&dword_217A2F000, v49, OS_LOG_TYPE_DEFAULT, "Cancel: Could not remove download options for songUID: %@ assetID: %@ - no associated options for mobile asset %@", buf, 0x20u);
  }

LABEL_33:
  objc_sync_exit(v13);

  uint64_t v57 = objc_msgSend__existingSongForUID_(self, v50, (uint64_t)v67, v51, v52);
  if (v57) {
    char v58 = v42;
  }
  else {
    char v58 = 0;
  }
  if (v58)
  {
    objc_msgSend_refreshState(v23, v53, v54, v55, v56);
    if (objc_msgSend_state(v23, v59, v60, v61, v62) == 4)
    {
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = sub_217A4A514;
      v68[3] = &unk_2642B74A8;
      id v69 = v67;
      id v70 = v66;
      uint64_t v71 = self;
      id v72 = v57;
      id v73 = v4;
      objc_msgSend_cancelDownload_(v23, v63, (uint64_t)v68, v64, v65);
    }
  }
}

- (void)cancelDownloadOfAllAssets
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v41 = self->_downloadThrottleLock;
  objc_sync_enter(v41);
  objc_msgSend_removeAllObjects(self->_pendingDownloadSet, v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_copy(self->_processingDownloadSet, v7, v8, v9, v10);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v11;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_attributes(v20, v13, v14, v15, v16, v41);
        uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"uuid", v23, v24);

        uint64_t v29 = objc_msgSend__assetIDForMobileAsset_(self, v26, (uint64_t)v20, v27, v28);
        uint64_t v33 = objc_msgSend__existingSongForUID_(self, v30, (uint64_t)v25, v31, v32);
        uint64_t v37 = objc_msgSend_existingAssetWithID_(v33, v34, (uint64_t)v29, v35, v36);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_cancelDownloadOfAsset_(self, v38, (uint64_t)v37, v39, v40);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v17);
  }

  objc_sync_exit(v41);
}

- (void)_purgeAsset:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v10 = objc_msgSend_attributes(v4, v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"uuid", v12, v13);

    uint64_t v18 = objc_msgSend__assetIDForMobileAsset_(self, v15, (uint64_t)v9, v16, v17);
    uint64_t v22 = objc_msgSend__existingSongForUID_(self, v19, (uint64_t)v14, v20, v21);
    objc_initWeak(&location, self);
    purgeQueue = self->_purgeQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_217A4AAE0;
    block[3] = &unk_2642B7430;
    objc_copyWeak(&v33, &location);
    id v28 = v9;
    id v29 = v22;
    id v30 = v18;
    id v31 = v14;
    uint64_t v32 = self;
    id v24 = v14;
    id v25 = v18;
    id v26 = v22;
    dispatch_async(purgeQueue, block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
}

- (void)requestPurgeOfAsset:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend_assetID(v4, v5, v6, v7, v8);
    char isEqualToString = objc_msgSend_isEqualToString_(v9, v10, @"FMSongArtworkAssetID", v11, v12);

    if (isEqualToString)
    {
      uint64_t v18 = FlexMobileAssetPropertyArtwork;
    }
    else
    {
      id v30 = objc_msgSend_assetID(v4, v14, v15, v16, v17);
      int v34 = objc_msgSend_isEqualToString_(v30, v31, @"FMSongBundleAssetID", v32, v33);

      if (!v34)
      {
        uint64_t v35 = 0;
        goto LABEL_11;
      }
      uint64_t v18 = FlexMobileAssetPropertySongBundle;
    }
    uint64_t v35 = *v18;
LABEL_11:
    objc_initWeak((id *)buf, self);
    triggerDownloadAndPurgeQueue = self->_triggerDownloadAndPurgeQueue;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = sub_217A4B5C4;
    v38[3] = &unk_2642B73C0;
    objc_copyWeak(&v42, (id *)buf);
    uint64_t v39 = v35;
    id v40 = v4;
    uint64_t v41 = self;
    uint64_t v37 = v35;
    dispatch_async(triggerDownloadAndPurgeQueue, v38);

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);
    goto LABEL_12;
  }
  uint64_t v19 = FlexLogForCategory(2uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = objc_msgSend_songUID(v4, v20, v21, v22, v23);
    id v29 = objc_msgSend_assetID(v4, v25, v26, v27, v28);
    *(_DWORD *)buf = 138412546;
    long long v44 = v24;
    __int16 v45 = 2112;
    long long v46 = v29;
    _os_log_impl(&dword_217A2F000, v19, OS_LOG_TYPE_DEFAULT, "attempting to purge on a non MobileAsset backed asset %@ %@", buf, 0x16u);
  }
LABEL_12:
}

- (unint64_t)assetStatus:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v8 = objc_msgSend_assetStatus(v3, v4, v5, v6, v7);
  }
  else
  {
    uint64_t v9 = objc_msgSend_localURL(v3, v4, v5, v6, v7);

    unint64_t v8 = v9 == 0;
    id v3 = (id)v9;
  }

  return v8;
}

- (int64_t)_responseForDownloadResult:(int64_t)a3
{
  if ((unint64_t)a3 > 0x23) {
    return 3;
  }
  else {
    return qword_217A62E20[a3];
  }
}

- (id)_mobileAssetCancelDownloadResultStringValue:(int64_t)a3
{
  if ((unint64_t)a3 >= 8)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"cancel error %li", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_2642B74C8[a3];
  }
  return v5;
}

- (id)_mobileAssetDownloadResultStringValue:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x24)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"download error %li", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_2642B7508[a3];
  }
  return v5;
}

- (id)_mobileAssetPurgeResultStringValue:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xC)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"purge error %li", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_2642B7628[a3];
  }
  return v5;
}

- (id)_mobileAssetQueryResultStringValue:(int64_t)a3
{
  if (unint64_t)a3 < 0xD && ((0x17FFu >> a3))
  {
    uint64_t v5 = off_2642B7688[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"query error %li", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)fetchSongsWithOptions:(id)a3
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_enableFetchCache
    && (objc_msgSend_cloudManagedSongs(self, v4, v5, v6, v7),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = objc_msgSend_count(v9, v10, v11, v12, v13),
        v9,
        v14))
  {
    uint64_t v15 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217A2F000, v15, OS_LOG_TYPE_DEFAULT, "fetchAllSongsWithOptions returning cached songs", buf, 2u);
    }

    objc_msgSend_cloudManagedSongs(self, v16, v17, v18, v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v139 = v8;
    uint64_t v21 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217A2F000, v21, OS_LOG_TYPE_DEFAULT, "fetchAllSongsWithOptions making a query into MobileAsset", buf, 2u);
    }

    id v24 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v22, @"SongBundle", 0, v23);
    id v29 = objc_msgSend_set(MEMORY[0x263EFF9C0], v25, v26, v27, v28);
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v30 = v24;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v144, (uint64_t)v152, 16);
    if (v32)
    {
      uint64_t v37 = v32;
      uint64_t v38 = *(void *)v145;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v145 != v38) {
            objc_enumerationMutation(v30);
          }
          id v40 = objc_msgSend_attributes(*(void **)(*((void *)&v144 + 1) + 8 * i), v33, v34, v35, v36);
          long long v44 = objc_msgSend_objectForKeyedSubscript_(v40, v41, @"uuid", v42, v43);

          if (v44) {
            objc_msgSend_addObject_(v29, v45, (uint64_t)v44, v46, v47);
          }
        }
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v144, (uint64_t)v152, 16);
      }
      while (v37);
    }

    uint64_t v51 = objc_msgSend__metadataMappingForUUIDSet_(self, v48, (uint64_t)v29, v49, v50);
    uint64_t v138 = v30;
    uint64_t v137 = objc_msgSend__newestContentSetFromAssets_metadataMapping_(self, v52, (uint64_t)v30, v51, v53);
    uint64_t v56 = objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(self, v54, (uint64_t)v137, v51, v55);
    uint64_t v61 = objc_msgSend_date(MEMORY[0x263EFF910], v57, v58, v59, v60);
    uint64_t v134 = (void *)v56;
    uint64_t v135 = (void *)v51;
    uint64_t v64 = objc_msgSend__processResults_metadataMapping_(self, v62, v56, v51, v63);
    uint64_t v65 = FlexLogForCategory(2uLL);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      id v70 = objc_msgSend_date(MEMORY[0x263EFF910], v66, v67, v68, v69);
      objc_msgSend_timeIntervalSinceDate_(v70, v71, v61, v72, v73);
      *(_DWORD *)buf = 134217984;
      uint64_t v151 = v74;
      _os_log_impl(&dword_217A2F000, v65, OS_LOG_TYPE_DEFAULT, "fetched songs processed in %.2f seconds\n", buf, 0xCu);
    }
    uint64_t v136 = (void *)v61;

    objc_msgSend_removeAllObjects(v29, v75, v76, v77, v78);
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    id v20 = v64;
    uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v79, (uint64_t)&v140, (uint64_t)v149, 16);
    if (v80)
    {
      uint64_t v85 = v80;
      uint64_t v86 = *(void *)v141;
      do
      {
        for (uint64_t j = 0; j != v85; ++j)
        {
          if (*(void *)v141 != v86) {
            objc_enumerationMutation(v20);
          }
          uint64_t v88 = *(void **)(*((void *)&v140 + 1) + 8 * j);
          uint64_t v89 = objc_msgSend_uid(v88, v81, v82, v83, v84);
          uint64_t v93 = objc_msgSend__existingSongForUID_(self, v90, (uint64_t)v89, v91, v92);

          if (!v93)
          {
            uint64_t v148 = v88;
            uint64_t v96 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v94, (uint64_t)&v148, 1, v95);
            objc_msgSend__registerSongs_(self, v97, (uint64_t)v96, v98, v99);

            uint64_t v104 = objc_msgSend_uid(v88, v100, v101, v102, v103);
            objc_msgSend_addObject_(v29, v105, (uint64_t)v104, v106, v107);
          }
        }
        uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v81, (uint64_t)&v140, (uint64_t)v149, 16);
      }
      while (v85);
    }

    if (objc_msgSend_count(v29, v108, v109, v110, v111))
    {
      uint64_t v116 = objc_msgSend_allObjects(v29, v112, v113, v114, v115);
      uint64_t v119 = objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v117, @"Artwork", (uint64_t)v116, v118);

      uint64_t v123 = objc_msgSend__metadataMappingForUUIDSet_(self, v120, (uint64_t)v29, v121, v122);

      uint64_t v126 = objc_msgSend__newestContentSetFromAssets_metadataMapping_(self, v124, (uint64_t)v119, (uint64_t)v123, v125);
      v129 = objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(self, v127, (uint64_t)v126, (uint64_t)v123, v128);

      id v132 = (id)objc_msgSend__processResults_metadataMapping_(self, v130, (uint64_t)v129, (uint64_t)v123, v131);
      id v8 = v139;
    }
    else
    {
      id v8 = v139;
      v129 = v134;
      uint64_t v123 = v135;
    }
  }
  return v20;
}

- (id)fetchSongWithUID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend__existingSongForUID_(self, v5, (uint64_t)v4, v6, v7);
  if (!v8)
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v13 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v10, @"uid == %@", v11, v12, v4);
    objc_msgSend_setPredicate_(v9, v14, (uint64_t)v13, v15, v16);

    id v20 = objc_msgSend_fetchSongsWithOptions_(self, v17, (uint64_t)v9, v18, v19);
    id v8 = objc_msgSend_firstObject(v20, v21, v22, v23, v24);
  }
  return v8;
}

- (OS_dispatch_queue)purgeQueue
{
  return self->_purgeQueue;
}

- (void)setPurgeQueue:(id)a3
{
}

- (OS_dispatch_queue)triggerDownloadAndPurgeQueue
{
  return self->_triggerDownloadAndPurgeQueue;
}

- (void)setTriggerDownloadAndPurgeQueue:(id)a3
{
}

- (OS_dispatch_queue)downloadRequestQueue
{
  return self->_downloadRequestQueue;
}

- (void)setDownloadRequestQueue:(id)a3
{
}

- (BOOL)includeArtworkInQueries
{
  return self->_includeArtworkInQueries;
}

- (void)setIncludeArtworkInQueries:(BOOL)a3
{
  self->_includeArtworkInQueries = a3;
}

- (BOOL)XMLPresent
{
  return self->_XMLPresent;
}

- (void)setXMLPresent:(BOOL)a3
{
  self->_XMLPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadRequestQueue, 0);
  objc_storeStrong((id *)&self->_triggerDownloadAndPurgeQueue, 0);
  objc_storeStrong((id *)&self->_purgeQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_processingPurgeSet, 0);
  objc_storeStrong((id *)&self->_pendingPurgeSet, 0);
  objc_storeStrong((id *)&self->_dowloadOptionsMapping, 0);
  objc_storeStrong((id *)&self->_processingDownloadSet, 0);
  objc_storeStrong((id *)&self->_pendingDownloadSet, 0);
  objc_storeStrong((id *)&self->_mobileAssetCacheLock, 0);
  objc_storeStrong((id *)&self->_downloadThrottleLock, 0);
  objc_storeStrong((id *)&self->_mobileAssetTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end