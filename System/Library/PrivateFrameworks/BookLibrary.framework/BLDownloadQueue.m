@interface BLDownloadQueue
+ (BLDownloadQueue)sharedInstance;
- (void)addDownloadsWithManifestRequest:(id)a3 uiManager:(id)a4 completion:(id)a5;
- (void)purchaseWithRequest:(id)a3 completion:(id)a4;
- (void)purchaseWithRequest:(id)a3 uiManager:(id)a4 completion:(id)a5;
- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiManager:(id)a4 withCompletion:(id)a5;
@end

@implementation BLDownloadQueue

+ (BLDownloadQueue)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E617790;
  block[3] = &unk_2644B5790;
  block[4] = a1;
  if (qword_26AC13800 != -1) {
    dispatch_once(&qword_26AC13800, block);
  }
  v2 = (void *)qword_26AC13808;
  return (BLDownloadQueue *)v2;
}

- (void)purchaseWithRequest:(id)a3 completion:(id)a4
{
}

- (void)purchaseWithRequest:(id)a3 uiManager:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14 = objc_msgSend_presentingSceneIdentifier(v8, v11, v12, v13);

  if (!v14)
  {
    v18 = objc_msgSend_presentingSceneIdentifier(v9, v15, v16, v17);
    objc_msgSend_setPresentingSceneIdentifier_(v8, v19, (uint64_t)v18, v20);
  }
  v21 = BLDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend_storeIdentifier(v8, v22, v23, v24);
    v29 = objc_msgSend_presentingSceneIdentifier(v8, v26, v27, v28);
    int v34 = 141558530;
    uint64_t v35 = 1752392040;
    __int16 v36 = 2112;
    v37 = v25;
    __int16 v38 = 2112;
    v39 = v29;
    _os_log_impl(&dword_21E616000, v21, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: purchaseWithRequest:uiManager:completion: for asset %{mask.hash}@ with additional presentingSceneIdentifier: %@", (uint8_t *)&v34, 0x20u);
  }
  v30 = [BLUIHostServiceProxy alloc];
  v32 = objc_msgSend_initWithUIManager_forRequest_inDownloadQueue_(v30, v31, (uint64_t)v9, (uint64_t)v8, self);
  objc_msgSend__purchaseWithRequest_uiHostProxy_completion_(self, v33, (uint64_t)v8, (uint64_t)v32, v10);
}

- (void)addDownloadsWithManifestRequest:(id)a3 uiManager:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = BLDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v8;
    _os_log_impl(&dword_21E616000, v11, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadsWithManifestRequest:uiManager:completion: for manifestRequest: %@", buf, 0xCu);
  }

  uint64_t v12 = _os_activity_create(&dword_21E616000, "addDownloadsWithManifestRequest:uiManager:completion:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E61C65C;
  v16[3] = &unk_2644B5820;
  id v17 = v9;
  id v18 = v8;
  v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  os_activity_apply(v12, v16);
}

- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiManager:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = BLDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E616000, v10, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: setAutomaticDownloadEnabled", buf, 2u);
  }

  v11 = _os_activity_create(&dword_21E616000, "setAutomaticDownloadEnabled:uiManager:completion:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21E61C844;
  v14[3] = &unk_2644B5868;
  uint64_t v16 = self;
  id v17 = v9;
  id v15 = v8;
  BOOL v18 = a3;
  id v12 = v8;
  id v13 = v9;
  os_activity_apply(v11, v14);
}

@end