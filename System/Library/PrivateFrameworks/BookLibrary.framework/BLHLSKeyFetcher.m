@interface BLHLSKeyFetcher
+ (BLHLSKeyFetcher)sharedInstance;
- (BLHLSKeyFetcher)init;
- (BOOL)ignoreCache;
- (id)fetchOfflineKeyForMediaItem:(id)a3 identity:(id)a4 completion:(id)a5;
- (id)fetchOnlineKeyForMediaItem:(id)a3 loadingRequest:(id)a4;
- (void)setIgnoreCache:(BOOL)a3;
@end

@implementation BLHLSKeyFetcher

- (BLHLSKeyFetcher)init
{
  v7.receiver = self;
  v7.super_class = (Class)BLHLSKeyFetcher;
  v2 = [(BLHLSKeyFetcher *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_ignoreCache = 1;
    v4 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21E616000, v4, OS_LOG_TYPE_INFO, "Ignoring any local cache.", v6, 2u);
    }
  }
  return v3;
}

+ (BLHLSKeyFetcher)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E61BBB0;
  block[3] = &unk_2644B5790;
  block[4] = a1;
  if (qword_26AC137F8 != -1) {
    dispatch_once(&qword_26AC137F8, block);
  }
  v2 = (void *)qword_267D3B050;
  return (BLHLSKeyFetcher *)v2;
}

- (id)fetchOnlineKeyForMediaItem:(id)a3 loadingRequest:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  objc_super v7 = sub_21E61BA44();
  v10 = objc_msgSend_valueForProperty_(v5, v8, (uint64_t)v7, v9);
  v11 = BUDynamicCast();
  uint64_t v15 = objc_msgSend_unsignedIntValue(v11, v12, v13, v14);

  v16 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = v15;
    _os_log_impl(&dword_21E616000, v16, OS_LOG_TYPE_DEFAULT, "Fetching online key for %llu.", buf, 0xCu);
  }

  v17 = [BLStreamingKeyRequest alloc];
  v19 = objc_msgSend_initWithMediaItem_loadingRequest_(v17, v18, (uint64_t)v5, (uint64_t)v6);

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_21E61BD98;
  v23[3] = &unk_2644B57B0;
  v23[4] = v15;
  objc_msgSend_performRequestWithResponseHandler_(v19, v20, (uint64_t)v23, v21);

  return v19;
}

- (id)fetchOfflineKeyForMediaItem:(id)a3 identity:(id)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_title(v8, v12, v13, v14);
    *(_DWORD *)buf = 138412546;
    v46 = v15;
    __int16 v47 = 1024;
    LODWORD(v48) = objc_msgSend_ignoreCache(self, v16, v17, v18);
    _os_log_impl(&dword_21E616000, v11, OS_LOG_TYPE_DEFAULT, "Fetching offline key for '%@'. Ignore Cache? %{BOOL}d", buf, 0x12u);
  }
  uint64_t v21 = objc_msgSend_hlsOfflinePlaybackKeysForItem_(BLMediaItemUtils, v19, (uint64_t)v8, v20);
  v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v9, v23);

  if (v24 && !objc_msgSend_ignoreCache(self, v25, v26, v27))
  {
    v35 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend_title(v8, v36, v37, v38);
      *(_DWORD *)buf = 138412290;
      v46 = v39;
      _os_log_impl(&dword_21E616000, v35, OS_LOG_TYPE_DEFAULT, "Cache hit of offline key for '%@'", buf, 0xCu);
    }
    uint64_t v40 = MEMORY[0x223C2CBB0](v10);
    v34 = (void *)v40;
    if (v40) {
      (*(void (**)(uint64_t, void *, void))(v40 + 16))(v40, v24, 0);
    }
    v30 = 0;
  }
  else
  {
    v28 = [BLOfflineKeyRequest alloc];
    v30 = objc_msgSend_initWithMediaItem_identity_(v28, v29, (uint64_t)v8, (uint64_t)v9);
    v31 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v30;
      __int16 v47 = 2112;
      id v48 = v9;
      _os_log_impl(&dword_21E616000, v31, OS_LOG_TYPE_DEFAULT, "Created Offline key request (%@) with identity: '%@'", buf, 0x16u);
    }

    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_21E61C190;
    v42[3] = &unk_2644B57D8;
    id v43 = v8;
    id v44 = v10;
    objc_msgSend_performRequestWithResponseHandler_(v30, v32, (uint64_t)v42, v33);

    v34 = v43;
  }

  return v30;
}

- (BOOL)ignoreCache
{
  return self->_ignoreCache;
}

- (void)setIgnoreCache:(BOOL)a3
{
  self->_ignoreCache = a3;
}

@end