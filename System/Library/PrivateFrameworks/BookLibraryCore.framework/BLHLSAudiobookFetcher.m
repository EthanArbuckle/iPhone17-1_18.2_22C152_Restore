@interface BLHLSAudiobookFetcher
+ (id)preferredStreamFromMasterPlaylist:(id)a3;
- (NSURLSession)session;
- (id)initCanUseCellularData:(BOOL)a3 powerRequired:(BOOL)a4 bundleID:(id)a5;
- (id)setupDownloadTaskForFetchingMasterPlaylistAndSelectingStreamFromMasterPlaylistURL:(id)a3 completion:(id)a4;
- (void)getRacGUIDFromMasterPlaylistURL:(id)a3 completion:(id)a4;
@end

@implementation BLHLSAudiobookFetcher

+ (id)preferredStreamFromMasterPlaylist:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v7 = objc_msgSend_streamInfs(v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);

  if (!v11)
  {
    v15 = BLAudiobookSyncLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21E03ACC0();
    }
    goto LABEL_24;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v15 = objc_msgSend_streamInfs(v3, v12, v13, v14);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v33, (uint64_t)v37, 16);
  if (!v17)
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  uint64_t v21 = v17;
  id v32 = v3;
  v22 = 0;
  uint64_t v23 = *(void *)v34;
  unint64_t v24 = -1;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v34 != v23) {
        objc_enumerationMutation(v15);
      }
      v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      unint64_t v27 = objc_msgSend_averageBandwidthFallbackToPeak(v26, v18, v19, v20);
      BOOL v28 = v27 <= 0x30000 || v22 == 0;
      if (v28 || (unint64_t)objc_msgSend_averageBandwidthFallbackToPeak(v22, v18, v19, v20) > 0x30000)
      {
        unint64_t v29 = v27 <= 0x20000 ? 0x20000 - v27 : v27 - 0x20000;
        if (v29 < v24
          || v27 <= 0x30000
          && (unint64_t)objc_msgSend_averageBandwidthFallbackToPeak(v22, v18, v19, v20) > 0x30000)
        {
          id v30 = v26;

          v22 = v30;
          unint64_t v24 = v29;
        }
      }
    }
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v33, (uint64_t)v37, 16);
  }
  while (v21);
  id v3 = v32;
LABEL_25:

  return v22;
}

- (id)initCanUseCellularData:(BOOL)a3 powerRequired:(BOOL)a4 bundleID:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BLHLSAudiobookFetcher;
  v12 = [(BLHLSAudiobookFetcher *)&v32 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_defaultSessionConfiguration(MEMORY[0x263F08C00], v9, v10, v11);
    uint64_t v17 = objc_msgSend_copy(v13, v14, v15, v16);

    objc_msgSend_setAllowsCellularAccess_(v17, v18, v6, v19);
    objc_msgSend_set_requiresPowerPluggedIn_(v17, v20, v5, v21);
    objc_msgSend_setWaitsForConnectivity_(v17, v22, 0, v23);
    if (objc_msgSend_length(v8, v24, v25, v26)) {
      objc_msgSend_set_sourceApplicationBundleIdentifier_(v17, v27, (uint64_t)v8, v28);
    }
    uint64_t v29 = objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(MEMORY[0x263F08BF8], v27, (uint64_t)v17, 0, 0);
    session = v12->_session;
    v12->_session = (NSURLSession *)v29;
  }
  return v12;
}

- (id)setupDownloadTaskForFetchingMasterPlaylistAndSelectingStreamFromMasterPlaylistURL:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = BLAudiobookSyncLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "Downloading master playlist from: %@", buf, 0xCu);
  }

  v12 = objc_msgSend_session(self, v9, v10, v11);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21E00A35C;
  v17[3] = &unk_26448BAD0;
  id v18 = v7;
  id v13 = v7;
  uint64_t v15 = objc_msgSend_downloadTaskWithURL_completionHandler_(v12, v14, (uint64_t)v6, (uint64_t)v17);

  return v15;
}

- (void)getRacGUIDFromMasterPlaylistURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_session(self, v8, v9, v10);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_21E00A840;
  v18[3] = &unk_26448BAD0;
  id v19 = v6;
  id v12 = v6;
  uint64_t v14 = objc_msgSend_downloadTaskWithURL_completionHandler_(v11, v13, (uint64_t)v7, (uint64_t)v18);

  objc_msgSend_resume(v14, v15, v16, v17);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

@end