@interface CPSAppInstaller
- (BOOL)stopStallingCurrentInstallation;
- (CPSAppInfoFetching)appInfoFetcher;
- (CPSAppInstaller)initWithAppInfoFetcher:(id)a3;
- (void)installDownloadedAppWithBundleID:(id)a3 localFilePath:(id)a4 completionHandler:(id)a5;
@end

@implementation CPSAppInstaller

- (CPSAppInstaller)initWithAppInfoFetcher:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAppInstaller;
  v6 = [(CPSAppInstaller *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appInfoFetcher, a3);
    v8 = v7;
  }

  return v7;
}

- (void)installDownloadedAppWithBundleID:(id)a3 localFilePath:(id)a4 completionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void))a5;
  v11 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v8];
  v12 = [v11 appState];
  int v13 = [v12 isInstalled];

  if (v13)
  {
    v10[2](v10, 0);
  }
  else if ([(CPSAppBundleInstaller *)self->_appBundleInstaller inactive] {
         || ([(CPSAppBundleInstaller *)self->_appBundleInstaller bundleIdentifier],
  }
             v14 = objc_claimAutoreleasedReturnValue(),
             int v15 = [v14 isEqualToString:v8],
             v14,
             !v15))
  {
    if (!self->_archiveService)
    {
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x2050000000;
      v17 = (void *)getDSArchiveServiceClass_softClass;
      uint64_t v39 = getDSArchiveServiceClass_softClass;
      if (!getDSArchiveServiceClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v41 = __getDSArchiveServiceClass_block_invoke;
        v42 = &unk_26424E580;
        v43 = &v36;
        __getDSArchiveServiceClass_block_invoke((uint64_t)&buf);
        v17 = (void *)v37[3];
      }
      v18 = v17;
      _Block_object_dispose(&v36, 8);
      v19 = (DSArchiveService *)objc_alloc_init(v18);
      archiveService = self->_archiveService;
      self->_archiveService = v19;
    }
    v21 = NSURL;
    v22 = NSTemporaryDirectory();
    v23 = [MEMORY[0x263F08C38] UUID];
    v24 = [v23 UUIDString];
    v25 = [v22 stringByAppendingPathComponent:v24];
    v26 = [v21 fileURLWithPath:v25];

    v27 = self->_archiveService;
    v28 = [NSURL fileURLWithPath:v9];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke;
    v31[3] = &unk_26424E558;
    v35 = v10;
    id v32 = v26;
    v33 = self;
    id v34 = v8;
    id v29 = v26;
    id v30 = (id)[(DSArchiveService *)v27 unarchiveItemAtURL:v28 passphrases:0 destinationFolderURL:v29 completionHandler:v31];
  }
  else
  {
    v16 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_21559C000, v16, OS_LOG_TYPE_INFO, "An installation for bundle ID %{private}@ is already in flight", (uint8_t *)&buf, 0xCu);
    }
    v10[2](v10, 0);
  }
}

void __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke_cold_1(v8, v7);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    objc_super v10 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:underlyingError:", 5, v7);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = *(void *)(a1 + 32);
    id v20 = 0;
    [v11 moveItemAtURL:v5 toURL:v12 error:&v20];
    id v7 = v20;

    int v13 = [[CPSAppBundleInstaller alloc] initWithBundleIdentifier:*(void *)(a1 + 48) extractedBundleURL:*(void *)(a1 + 32)];
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = *(void **)(v14 + 8);
    *(void *)(v14 + 8) = v13;

    uint64_t v16 = *(void *)(a1 + 40);
    v17 = *(void **)(v16 + 8);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke_9;
    v18[3] = &unk_26424E530;
    v18[4] = v16;
    id v19 = *(id *)(a1 + 56);
    [v17 installWithCompletionHandler:v18];
  }
}

void __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)stopStallingCurrentInstallation
{
  return [(CPSAppBundleInstaller *)self->_appBundleInstaller stopStallingCurrentInstallation];
}

- (CPSAppInfoFetching)appInfoFetcher
{
  return self->_appInfoFetcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfoFetcher, 0);
  objc_storeStrong((id *)&self->_archiveService, 0);

  objc_storeStrong((id *)&self->_appBundleInstaller, 0);
}

void __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4 = objc_msgSend(a2, "cps_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_21559C000, v3, OS_LOG_TYPE_ERROR, "Unable to unarchive IPA with error %{public}@", (uint8_t *)&v5, 0xCu);
}

@end