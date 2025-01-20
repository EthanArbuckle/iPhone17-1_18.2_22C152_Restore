@interface PODataSource
+ (id)sharedInstance;
- (BOOL)constructingData;
- (BOOL)isPodcastDataStale;
- (BOOL)isPodcastRevisionDataStale;
- (BOOL)isPodcastsInstalled;
- (NSDate)podcastDataPlistLastModified;
- (NSDate)revisionsDataPlistLastModified;
- (NSMutableArray)podcastRevisions;
- (NSMutableDictionary)podcastCollectionsByUUID;
- (NSMutableDictionary)podcastStationsByUUID;
- (NSString)databaseUUID;
- (NSString)firstRevisionUUID;
- (NSURL)plistBasePath;
- (PODataSource)init;
- (PODataSource)initWithPlistPath:(id)a3;
- (id)arrayFromPlistURL:(id)a3;
- (id)constructModelObjectOfClass:(Class)a3 fromDictionary:(id)a4;
- (id)constructModelObjectsFromDictionaries:(id)a3 withIndexPath:(id)a4 modelObjectClass:(Class)a5;
- (id)description;
- (id)domainObjectWithUUID:(id)a3;
- (id)podcastCollectionWithUUID:(id)a3;
- (id)podcastCollections;
- (id)podcastCollectionsMatchingString:(id)a3 maxResults:(int64_t)a4;
- (id)podcastModelObjectsInArray:(id)a3 matchingString:(id)a4 maxResults:(int64_t)a5;
- (id)podcastRevisionsSinceAnchor:(unint64_t)a3;
- (id)podcastStationWithUUID:(id)a3;
- (id)podcastStations;
- (id)podcastStationsMatchingString:(id)a3 maxResults:(int64_t)a4;
- (id)podcastsIndexPath;
- (id)validity;
- (void)_withExtensionParseDataDictionary:(id)a3 revisionDictionary:(id)a4;
- (void)constructRevisionFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4 isDelete:(BOOL)a5;
- (void)constructRevisionsFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4;
- (void)getContainerURL:(id)a3;
- (void)getDatabaseURL:(id)a3;
- (void)getRevisionURL:(id)a3;
- (void)getURLs:(id)a3;
- (void)initializeDataFromDictionary;
- (void)setConstructingData:(BOOL)a3;
- (void)setDatabaseUUID:(id)a3;
- (void)setFirstRevisionUUID:(id)a3;
- (void)setPlistBasePath:(id)a3;
- (void)setPodcastCollectionsByUUID:(id)a3;
- (void)setPodcastDataPlistLastModified:(id)a3;
- (void)setPodcastRevisions:(id)a3;
- (void)setPodcastStationsByUUID:(id)a3;
- (void)setRevisionsDataPlistLastModified:(id)a3;
@end

@implementation PODataSource

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_222EC5434;
  block[3] = &unk_26467B8C0;
  block[4] = a1;
  if (qword_26ABFD538 != -1) {
    dispatch_once(&qword_26ABFD538, block);
  }
  v2 = (void *)qword_26ABFD540;

  return v2;
}

- (PODataSource)init
{
  return (PODataSource *)((uint64_t (*)(PODataSource *, char *, void))MEMORY[0x270F9A6D0])(self, sel_initWithPlistPath_, 0);
}

- (PODataSource)initWithPlistPath:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PODataSource;
  v9 = [(PODataSource *)&v39 init];
  if (v9)
  {
    v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v5, v6, v7, v8);
    objc_msgSend_setPodcastCollectionsByUUID_(v9, v11, (uint64_t)v10, v12, v13);

    v18 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v14, v15, v16, v17);
    objc_msgSend_setPodcastStationsByUUID_(v9, v19, (uint64_t)v18, v20, v21);

    v26 = objc_msgSend_array(MEMORY[0x263EFF980], v22, v23, v24, v25);
    objc_msgSend_setPodcastRevisions_(v9, v27, (uint64_t)v26, v28, v29);

    objc_msgSend_setPlistBasePath_(v9, v30, (uint64_t)v4, v31, v32);
    objc_msgSend_initializeDataFromDictionary(v9, v33, v34, v35, v36);
  }
  POLogInitIfNeeded();
  if (POLogContextSync) {
    v37 = POLogContextSync;
  }
  else {
    v37 = &_os_log_internal;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v9;
    _os_log_impl(&dword_222EBF000, v37, OS_LOG_TYPE_INFO, "Data source is %@", buf, 0xCu);
  }

  return v9;
}

- (id)arrayFromPlistURL:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_path(v3, v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_contentsAtPath_(v8, v14, (uint64_t)v13, v15, v16);

  if (v17)
  {
    id v25 = 0;
    v19 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v18, (uint64_t)v17, 0, 0, &v25);
    id v20 = v25;
    if (!v20)
    {
      uint64_t v21 = 0;
      if (v19) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    id v20 = 0;
    v19 = 0;
  }
  POLogInitIfNeeded();
  if (POLogContextSync) {
    v22 = POLogContextSync;
  }
  else {
    v22 = &_os_log_internal;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_222ECABD0();
  }
  uint64_t v23 = _MTLogCategorySiri();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    sub_222ECAB58();
  }

  uint64_t v21 = v20;
LABEL_14:

  return v19;
}

- (BOOL)isPodcastsInstalled
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F01878]);
  id v8 = 0;
  id v4 = objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v2, v3, @"com.apple.podcasts", 0, (uint64_t)&v8);
  id v5 = v8;
  if (v5)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v6 = POLogContextSync;
    }
    else {
      uint64_t v6 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_222EBF000, v6, OS_LOG_TYPE_INFO, "Could not load application record. If the Podcasts app is actually installed, this represents an error: %@.", buf, 0xCu);
    }
  }

  return v4 != 0;
}

- (void)getURLs:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void))a3;
  v9 = objc_msgSend_plistBasePath(self, v5, v6, v7, v8);

  if (v9)
  {
    v14 = objc_msgSend_plistBasePath(self, v10, v11, v12, v13);
    v18 = objc_msgSend_URLByAppendingPathComponent_(v14, v15, @"PodcastsDB.plist", v16, v17);

    uint64_t v23 = objc_msgSend_plistBasePath(self, v19, v20, v21, v22);
    v27 = objc_msgSend_URLByAppendingPathComponent_(v23, v24, @"PodcastsDiff.plist", v25, v26);

    v4[2](v4, v18, v27, 0);
  }
  else
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_222EC5984;
    v31[3] = &unk_26467B8E8;
    uint64_t v32 = v4;
    objc_msgSend_getContainerURL_(self, v28, (uint64_t)v31, v29, v30);
  }
}

- (void)getDatabaseURL:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_222EC5AC4;
  v9[3] = &unk_26467B910;
  id v10 = v4;
  id v5 = v4;
  objc_msgSend_getURLs_(self, v6, (uint64_t)v9, v7, v8);
}

- (void)getRevisionURL:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_222EC5B6C;
  v9[3] = &unk_26467B910;
  id v10 = v4;
  id v5 = v4;
  objc_msgSend_getURLs_(self, v6, (uint64_t)v9, v7, v8);
}

- (void)getContainerURL:(id)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  id v3 = (void (**)(id, void, void *))a3;
  if (v3)
  {
    uint64_t v4 = container_query_create();
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    xpc_object_t v5 = xpc_string_create("com.apple.podcasts");
    container_query_set_identifiers();
    if (!container_query_get_single_result())
    {
      if (container_query_get_last_error() && (uint64_t v22 = container_error_copy_unlocalized_description()) != 0)
      {
        uint64_t v26 = (void *)v22;
        uint64_t v27 = objc_msgSend_stringWithUTF8String_(NSString, v23, v22, v24, v25);
        uint64_t v29 = (void *)v27;
        if (v27)
        {
          uint64_t v41 = *MEMORY[0x263F07F80];
          v42[0] = v27;
          uint64_t v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)v42, (uint64_t)&v41, 1);
        }
        else
        {
          uint64_t v30 = 0;
        }
        free(v26);
      }
      else
      {
        uint64_t v29 = 0;
        uint64_t v30 = 0;
      }
      uint64_t v36 = _MTLogCategorySiri();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        int v39 = 138412290;
        uint64_t v40 = (uint64_t)v29;
        _os_log_impl(&dword_222EBF000, v36, OS_LOG_TYPE_INFO, "We could not access the podcasts container. This probably means the app isn't installed. Description: '%@'", (uint8_t *)&v39, 0xCu);
      }

      v38 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v37, @"PODataSourceErrorDomain", 1, (uint64_t)v30);
      v3[2](v3, 0, v38);

      goto LABEL_39;
    }
    uint64_t v6 = container_copy_sandbox_token();
    if (!v6) {
      goto LABEL_9;
    }
    uint64_t v7 = (void *)v6;
    uint64_t v8 = sandbox_extension_consume();
    v9 = _MTLogCategorySiri();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v39 = 134217984;
      uint64_t v40 = v8;
      _os_log_impl(&dword_222EBF000, v9, OS_LOG_TYPE_INFO, "Consumed sandbox token and received handle %lli", (uint8_t *)&v39, 0xCu);
    }

    free(v7);
    if (v8)
    {
      uint64_t path = container_get_path();
      if (v8 == -1)
      {
        v33 = _MTLogCategorySiri();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v39) = 0;
          _os_log_impl(&dword_222EBF000, v33, OS_LOG_TYPE_ERROR, "Something went wrong with getting the sandbox extension.", (uint8_t *)&v39, 2u);
        }

        uint64_t v35 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v34, @"PODataSourceErrorDomain", 2, 0);
        v3[2](v3, 0, v35);

        if (!v4) {
          goto LABEL_39;
        }
LABEL_29:
        container_query_free();
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v11 = path;
    }
    else
    {
LABEL_9:
      uint64_t v12 = _MTLogCategorySiri();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_222EBF000, v12, OS_LOG_TYPE_INFO, "Handle is 0. Maybe we were not issued a token, the app is not sandboxed, or this extension is not needed to access the container.", (uint8_t *)&v39, 2u);
      }

      uint64_t v11 = container_get_path();
      uint64_t v8 = 0;
    }
    uint64_t v13 = _MTLogCategorySiri();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v14)
      {
        int v39 = 136315138;
        uint64_t v40 = v11;
        _os_log_impl(&dword_222EBF000, v13, OS_LOG_TYPE_INFO, "Found container path %s", (uint8_t *)&v39, 0xCu);
      }

      v18 = objc_msgSend_stringWithUTF8String_(NSString, v15, v11, v16, v17);
      uint64_t v21 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v19, (uint64_t)v18, 1, v20);
      ((void (**)(id, void *, void *))v3)[2](v3, v21, 0);
    }
    else
    {
      if (v14)
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_222EBF000, v13, OS_LOG_TYPE_INFO, "We could not access the podcasts container. This probably means the app isn't installed.", (uint8_t *)&v39, 2u);
      }

      v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"PODataSourceErrorDomain", 1, 0);
      v3[2](v3, 0, v18);
    }

    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v32 = _MTLogCategorySiri();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        int v39 = 134217984;
        uint64_t v40 = v8;
        _os_log_impl(&dword_222EBF000, v32, OS_LOG_TYPE_INFO, "Releasing sandbox extension %lli", (uint8_t *)&v39, 0xCu);
      }

      sandbox_extension_release();
    }
    if (!v4) {
      goto LABEL_39;
    }
    goto LABEL_29;
  }
LABEL_40:
}

- (BOOL)isPodcastRevisionDataStale
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_222EC6120;
  v6[3] = &unk_26467B938;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend_getRevisionURL_(self, a2, (uint64_t)v6, v2, v3);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isPodcastDataStale
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_222EC6304;
  v6[3] = &unk_26467B938;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend_getDatabaseURL_(self, a2, (uint64_t)v6, v2, v3);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSMutableDictionary)podcastCollectionsByUUID
{
  uint64_t v3 = self->_podcastCollectionsByUUID;
  objc_sync_enter(v3);
  if (objc_msgSend_isPodcastDataStale(self, v4, v5, v6, v7)
    && (objc_msgSend_constructingData(self, v8, v9, v10, v11) & 1) == 0)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v12 = POLogContextSync;
    }
    else {
      uint64_t v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_222EBF000, v12, OS_LOG_TYPE_INFO, "Podcast data is stale, going to reinitialize from plist.", v19, 2u);
    }
    objc_msgSend_initializeDataFromDictionary(self, v13, v14, v15, v16);
  }
  objc_sync_exit(v3);

  podcastCollectionsByUUID = self->_podcastCollectionsByUUID;

  return podcastCollectionsByUUID;
}

- (NSMutableDictionary)podcastStationsByUUID
{
  uint64_t v3 = self->_podcastStationsByUUID;
  objc_sync_enter(v3);
  if (objc_msgSend_isPodcastDataStale(self, v4, v5, v6, v7)
    && (objc_msgSend_constructingData(self, v8, v9, v10, v11) & 1) == 0)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v12 = POLogContextSync;
    }
    else {
      uint64_t v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_222EBF000, v12, OS_LOG_TYPE_INFO, "Podcast data is stale, going to reinitialize from plist.", v19, 2u);
    }
    objc_msgSend_initializeDataFromDictionary(self, v13, v14, v15, v16);
  }
  objc_sync_exit(v3);

  podcastStationsByUUID = self->_podcastStationsByUUID;

  return podcastStationsByUUID;
}

- (id)validity
{
  uint64_t v6 = NSString;
  uint64_t v7 = objc_msgSend_databaseUUID(self, a2, v2, v3, v4);
  uint64_t v12 = objc_msgSend_firstRevisionUUID(self, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v6, v13, @"%@-%@", v14, v15, v7, v12);

  return v16;
}

- (NSMutableArray)podcastRevisions
{
  uint64_t v3 = self->_podcastRevisions;
  objc_sync_enter(v3);
  if (objc_msgSend_isPodcastRevisionDataStale(self, v4, v5, v6, v7)
    && (objc_msgSend_constructingData(self, v8, v9, v10, v11) & 1) == 0)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v12 = POLogContextSync;
    }
    else {
      uint64_t v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_222EBF000, v12, OS_LOG_TYPE_INFO, "Podcast revision data is stale, going to reinitialize from plist.", v19, 2u);
    }
    objc_msgSend_initializeDataFromDictionary(self, v13, v14, v15, v16);
  }
  objc_sync_exit(v3);

  podcastRevisions = self->_podcastRevisions;

  return podcastRevisions;
}

- (void)initializeDataFromDictionary
{
  if (objc_msgSend_constructingData(self, a2, v2, v3, v4))
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      uint64_t v9 = POLogContextSync;
    }
    else {
      uint64_t v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_222ECAD18(v9);
    }
  }
  else
  {
    objc_msgSend_setConstructingData_(self, v6, 1, v7, v8);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_222EC6850;
    v16[3] = &unk_26467B960;
    v16[4] = self;
    objc_msgSend_getURLs_(self, v10, (uint64_t)v16, v11, v12);
    objc_msgSend_setConstructingData_(self, v13, 0, v14, v15);
  }
}

- (void)_withExtensionParseDataDictionary:(id)a3 revisionDictionary:(id)a4
{
  uint64_t v194 = *MEMORY[0x263EF8340];
  uint64_t v6 = (NSMutableArray *)a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_arrayFromPlistURL_(self, v8, (uint64_t)v6, v9, v10);
  uint64_t v15 = objc_msgSend_arrayFromPlistURL_(self, v12, (uint64_t)v7, v13, v14);
  POLogInitIfNeeded();
  if (POLogContextSync) {
    uint64_t v16 = POLogContextSync;
  }
  else {
    uint64_t v16 = &_os_log_internal;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v193 = v6;
    _os_log_impl(&dword_222EBF000, v16, OS_LOG_TYPE_INFO, "Constructing data source from %@", buf, 0xCu);
  }
  v184 = self;
  if (!v11) {
    goto LABEL_38;
  }
  uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v11, v17, 0, v19, v20);
  uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"children", v23, v24);
  uint64_t v30 = v25;
  if (!v25)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      v108 = POLogContextSync;
    }
    else {
      v108 = &_os_log_internal;
    }
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
      sub_222ECAE6C();
    }
    goto LABEL_20;
  }
  if (objc_msgSend_count(v25, v26, v27, v28, v29) == 2)
  {
    v177 = v15;
    v179 = v11;
    id v181 = v7;
    uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v30, v31, 0, v32, v33);
    uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v34, v35, @"children", v36, v37);

    uint64_t v42 = objc_msgSend_objectAtIndexedSubscript_(v30, v39, 1, v40, v41);
    uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v42, v43, @"children", v44, v45);

    v50 = objc_msgSend_indexPathWithIndex_(MEMORY[0x263F088C8], v47, 0, v48, v49);
    uint64_t v51 = objc_opt_class();
    v183 = (void *)v38;
    v53 = objc_msgSend_constructModelObjectsFromDictionaries_withIndexPath_modelObjectClass_(self, v52, v38, (uint64_t)v50, v51);

    objc_msgSend_removeAllObjects(self->_podcastCollectionsByUUID, v54, v55, v56, v57);
    objc_msgSend_addEntriesFromDictionary_(self->_podcastCollectionsByUUID, v58, (uint64_t)v53, v59, v60);
    v64 = objc_msgSend_indexPathWithIndex_(MEMORY[0x263F088C8], v61, 1, v62, v63);
    uint64_t v65 = objc_opt_class();
    v66 = (void *)v46;
    v68 = objc_msgSend_constructModelObjectsFromDictionaries_withIndexPath_modelObjectClass_(self, v67, v46, (uint64_t)v64, v65);

    objc_msgSend_removeAllObjects(self->_podcastStationsByUUID, v69, v70, v71, v72);
    objc_msgSend_addEntriesFromDictionary_(self->_podcastStationsByUUID, v73, (uint64_t)v68, v74, v75);
    v80 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v76, v77, v78, v79);
    v81 = v6;
    v86 = objc_msgSend_path(v6, v82, v83, v84, v85);
    v89 = objc_msgSend_attributesOfItemAtPath_error_(v80, v87, (uint64_t)v86, 0, v88);
    v94 = objc_msgSend_fileModificationDate(v89, v90, v91, v92, v93);
    objc_msgSend_setPodcastDataPlistLastModified_(v184, v95, (uint64_t)v94, v96, v97);

    self = v184;
    POLogInitIfNeeded();
    if (POLogContextSync) {
      v98 = POLogContextSync;
    }
    else {
      v98 = &_os_log_internal;
    }
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      v99 = v98;
      objc_msgSend_podcastDataPlistLastModified(v184, v100, v101, v102, v103);
      v104 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v193 = v104;
      _os_log_impl(&dword_222EBF000, v99, OS_LOG_TYPE_INFO, "Podcast data last modified is %@", buf, 0xCu);
    }
    uint64_t v6 = v81;
    uint64_t v11 = v179;
    id v7 = v181;
    uint64_t v15 = v177;
LABEL_20:
    v112 = objc_msgSend_objectForKeyedSubscript_(v21, v105, @"uuid", v106, v107);
    if (v112)
    {
      objc_msgSend_setDatabaseUUID_(self, v109, (uint64_t)v112, v110, v111);
      POLogInitIfNeeded();
      if (POLogContextSync) {
        v113 = POLogContextSync;
      }
      else {
        v113 = &_os_log_internal;
      }
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        v114 = v113;
        objc_msgSend_databaseUUID(self, v115, v116, v117, v118);
        v119 = v15;
        v120 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v193 = v120;
        _os_log_impl(&dword_222EBF000, v114, OS_LOG_TYPE_INFO, "Database UUID is %@", buf, 0xCu);

        uint64_t v15 = v119;
        self = v184;
      }
    }
    else
    {
      POLogInitIfNeeded();
      if (POLogContextSync) {
        v122 = POLogContextSync;
      }
      else {
        v122 = &_os_log_internal;
      }
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
        sub_222ECAE04();
      }
    }

LABEL_38:
    if (v15)
    {
      v180 = v11;
      v182 = v7;
      v176 = v6;
      objc_msgSend_removeAllObjects(self->_podcastRevisions, v17, v18, v19, v20);
      long long v189 = 0u;
      long long v190 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      v178 = v15;
      id v123 = v15;
      uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v124, (uint64_t)&v187, (uint64_t)v191, 16);
      if (v125)
      {
        uint64_t v129 = v125;
        uint64_t v130 = *(void *)v188;
        char v131 = 1;
        do
        {
          for (uint64_t i = 0; i != v129; ++i)
          {
            if (*(void *)v188 != v130) {
              objc_enumerationMutation(v123);
            }
            v133 = *(void **)(*((void *)&v187 + 1) + 8 * i);
            if (v131)
            {
              v137 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v187 + 1) + 8 * i), v126, @"uuid", v127, v128);
              if (v137)
              {
                objc_msgSend_setFirstRevisionUUID_(self, v134, (uint64_t)v137, v135, v136);
                POLogInitIfNeeded();
                if (POLogContextSync) {
                  v138 = POLogContextSync;
                }
                else {
                  v138 = &_os_log_internal;
                }
                if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
                {
                  v139 = v138;
                  objc_msgSend_firstRevisionUUID(v184, v140, v141, v142, v143);
                  v144 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v193 = v144;
                  _os_log_impl(&dword_222EBF000, v139, OS_LOG_TYPE_INFO, "First Revision UUID is %@", buf, 0xCu);
                }
              }
              else
              {
                POLogInitIfNeeded();
                if (POLogContextSync) {
                  v145 = POLogContextSync;
                }
                else {
                  v145 = &_os_log_internal;
                }
                if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR)) {
                  sub_222ECADC4(&v185, v186, v145);
                }
              }

              self = v184;
            }
            v149 = objc_msgSend_objectForKeyedSubscript_(v133, v126, @"podcasts", v127, v128);
            if (v149) {
              objc_msgSend_constructRevisionsFromDictionary_isPodcastCollections_(self, v146, (uint64_t)v149, 1, v148);
            }
            v152 = objc_msgSend_objectForKeyedSubscript_(v133, v146, @"stations", v147, v148);
            if (v152) {
              objc_msgSend_constructRevisionsFromDictionary_isPodcastCollections_(self, v150, (uint64_t)v152, 0, v151);
            }

            char v131 = 0;
          }
          uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v126, (uint64_t)&v187, (uint64_t)v191, 16);
          char v131 = 0;
        }
        while (v129);
      }

      v157 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v153, v154, v155, v156);
      id v7 = v182;
      v162 = objc_msgSend_path(v182, v158, v159, v160, v161);
      v165 = objc_msgSend_attributesOfItemAtPath_error_(v157, v163, (uint64_t)v162, 0, v164);
      v170 = objc_msgSend_fileModificationDate(v165, v166, v167, v168, v169);
      objc_msgSend_setRevisionsDataPlistLastModified_(self, v171, (uint64_t)v170, v172, v173);

      POLogInitIfNeeded();
      if (POLogContextSync) {
        v174 = POLogContextSync;
      }
      else {
        v174 = &_os_log_internal;
      }
      uint64_t v6 = v176;
      uint64_t v15 = v178;
      uint64_t v11 = v180;
      if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
      {
        podcastRevisions = self->_podcastRevisions;
        *(_DWORD *)buf = 138412290;
        v193 = podcastRevisions;
        _os_log_impl(&dword_222EBF000, v174, OS_LOG_TYPE_INFO, "Podcast revisions are %@", buf, 0xCu);
      }
    }
    goto LABEL_68;
  }
  POLogInitIfNeeded();
  if (POLogContextSync) {
    v121 = POLogContextSync;
  }
  else {
    v121 = &_os_log_internal;
  }
  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
    sub_222ECAED4();
  }

LABEL_68:
}

- (void)constructRevisionsFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"inserted", v8, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v34, (uint64_t)v41, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_constructRevisionFromDictionary_isPodcastCollections_isDelete_(self, v13, *(void *)(*((void *)&v34 + 1) + 8 * v16++), v4, 0);
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v34, (uint64_t)v41, 16);
    }
    while (v14);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v6, v17, @"deleted", v18, v19, 0);
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v30, (uint64_t)v40, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v20);
        }
        uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8 * v26);
        uint64_t v38 = @"uuid";
        uint64_t v39 = v27;
        uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)&v39, (uint64_t)&v38, 1);
        objc_msgSend_constructRevisionFromDictionary_isPodcastCollections_isDelete_(self, v29, (uint64_t)v28, v4, 1);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, (uint64_t)v40, 16);
    }
    while (v24);
  }
}

- (void)constructRevisionFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4 isDelete:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v33 = (id)objc_opt_new();
  uint64_t v13 = objc_msgSend_count(self->_podcastRevisions, v9, v10, v11, v12);
  objc_msgSend_setRevisionID_(v33, v14, v13, v15, v16);
  if (v5) {
    objc_msgSend_setRevisionType_(v33, v17, 2, v18, v19);
  }
  else {
    objc_msgSend_setRevisionType_(v33, v17, 0, v18, v19);
  }
  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v8, v20, @"uuid", v21, v22);

  objc_msgSend_setObjectID_(v33, v24, (uint64_t)v23, v25, v26);
  objc_msgSend_setIsPodcastCollection_(v33, v27, v6, v28, v29);
  objc_msgSend_addObject_(self->_podcastRevisions, v30, (uint64_t)v33, v31, v32);
}

- (id)constructModelObjectOfClass:(Class)a3 fromDictionary:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(a3);
  uint64_t v10 = objc_msgSend_objectForKey_(v5, v7, @"uuid", v8, v9);
  objc_msgSend_setUuid_(v6, v11, (uint64_t)v10, v12, v13);

  uint64_t v17 = objc_msgSend_objectForKey_(v5, v14, @"title", v15, v16);
  objc_msgSend_setTitle_(v6, v18, (uint64_t)v17, v19, v20);

  uint64_t v24 = objc_msgSend_objectForKey_(v5, v21, @"feedUrl", v22, v23);
  objc_msgSend_setFeedUrl_(v6, v25, (uint64_t)v24, v26, v27);

  uint64_t v31 = objc_msgSend_objectForKey_(v5, v28, @"storeId", v29, v30);

  objc_msgSend_setStoreId_(v6, v32, (uint64_t)v31, v33, v34);

  return v6;
}

- (id)constructModelObjectsFromDictionaries:(id)a3 withIndexPath:(id)a4 modelObjectClass:(Class)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v10, v11, v12, v13);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v8;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = objc_msgSend_constructModelObjectOfClass_fromDictionary_(self, v17, (uint64_t)a5, *(void *)(*((void *)&v40 + 1) + 8 * i), v18);
        uint64_t v27 = objc_msgSend_indexPathByAddingIndex_(v9, v24, v20 + i, v25, v26);
        objc_msgSend_setIndexPath_(v23, v28, (uint64_t)v27, v29, v30);

        long long v35 = objc_msgSend_uuid(v23, v31, v32, v33, v34);
        objc_msgSend_setObject_forKeyedSubscript_(v14, v36, (uint64_t)v23, (uint64_t)v35, v37);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v40, (uint64_t)v44, 16);
      v20 += i;
    }
    while (v19);
  }

  return v14;
}

- (id)podcastModelObjectsInArray:(id)a3 matchingString:(id)a4 maxResults:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF980], v9, v10, v11, v12);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = v7;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v16)
  {
    uint64_t v21 = v16;
    uint64_t v22 = *(void *)v31;
LABEL_3:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v31 != v22) {
        objc_enumerationMutation(v14);
      }
      uint64_t v24 = *(void **)(*((void *)&v30 + 1) + 8 * v23);
      uint64_t v25 = objc_msgSend_title(v24, v17, v18, v19, v20, (void)v30);
      uint64_t v28 = objc_msgSend_rangeOfString_options_(v25, v26, (uint64_t)v8, 1, v27);

      if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend_addObject_(v13, v17, (uint64_t)v24, v19, v20);
      }
      if (a5 >= 1 && objc_msgSend_count(v13, v17, v18, v19, v20) == a5) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v34, 16);
        if (v21) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v13;
}

- (id)podcastCollectionsMatchingString:(id)a3 maxResults:(int64_t)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_podcastCollections(self, v7, v8, v9, v10);
  uint64_t v13 = objc_msgSend_podcastModelObjectsInArray_matchingString_maxResults_(self, v12, (uint64_t)v11, (uint64_t)v6, a4);

  return v13;
}

- (id)podcastStationsMatchingString:(id)a3 maxResults:(int64_t)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_podcastStations(self, v7, v8, v9, v10);
  uint64_t v13 = objc_msgSend_podcastModelObjectsInArray_matchingString_maxResults_(self, v12, (uint64_t)v11, (uint64_t)v6, a4);

  return v13;
}

- (id)podcastCollectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_podcastCollectionsByUUID(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (id)podcastCollections
{
  id v5 = objc_msgSend_podcastCollectionsByUUID(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_allValues(v5, v6, v7, v8, v9);

  return v10;
}

- (id)podcastStationWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_podcastStationsByUUID(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (id)podcastStations
{
  id v5 = objc_msgSend_podcastStationsByUUID(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_allValues(v5, v6, v7, v8, v9);

  return v10;
}

- (id)podcastRevisionsSinceAnchor:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3, v3, v4);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = objc_msgSend_podcastRevisions(self, v8, v9, v10, v11, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v14)
  {
    uint64_t v19 = v14;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v12);
        }
        uint64_t v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend_revisionID(v22, v15, v16, v17, v18) >= a3) {
          objc_msgSend_addObject_(v7, v15, (uint64_t)v22, v17, v18);
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v19);
  }

  return v7;
}

- (id)domainObjectWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_podcastCollectionsByUUID(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);

  if (!v13)
  {
    uint64_t v18 = objc_msgSend_podcastStationsByUUID(self, v14, v15, v16, v17);
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v4, v20, v21);
  }
  uint64_t v22 = objc_msgSend_SAMPCollection(v13, v14, v15, v16, v17);

  return v22;
}

- (id)podcastsIndexPath
{
  return (id)objc_msgSend_indexPathWithIndex_(MEMORY[0x263F088C8], a2, 0, v2, v3);
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v10 = objc_msgSend_podcastCollectionsByUUID(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_podcastStationsByUUID(self, v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v3, v16, @"%@ (%p) podcast collections: %@, podcast stations: %@", v17, v18, v5, self, v10, v15);

  return v19;
}

- (void)setPodcastCollectionsByUUID:(id)a3
{
}

- (void)setPodcastStationsByUUID:(id)a3
{
}

- (void)setPodcastRevisions:(id)a3
{
}

- (NSString)databaseUUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDatabaseUUID:(id)a3
{
}

- (NSString)firstRevisionUUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirstRevisionUUID:(id)a3
{
}

- (NSDate)podcastDataPlistLastModified
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPodcastDataPlistLastModified:(id)a3
{
}

- (NSDate)revisionsDataPlistLastModified
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRevisionsDataPlistLastModified:(id)a3
{
}

- (BOOL)constructingData
{
  return self->_constructingData;
}

- (void)setConstructingData:(BOOL)a3
{
  self->_constructingData = a3;
}

- (NSURL)plistBasePath
{
  return self->_plistBasePath;
}

- (void)setPlistBasePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistBasePath, 0);
  objc_storeStrong((id *)&self->_revisionsDataPlistLastModified, 0);
  objc_storeStrong((id *)&self->_podcastDataPlistLastModified, 0);
  objc_storeStrong((id *)&self->_firstRevisionUUID, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_podcastRevisions, 0);
  objc_storeStrong((id *)&self->_podcastStationsByUUID, 0);

  objc_storeStrong((id *)&self->_podcastCollectionsByUUID, 0);
}

@end