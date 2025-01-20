@interface CPSInstallationController
- (BOOL)stopStallingCurrentInstallation;
- (CPSInstallationController)initWithAppInfoFetcher:(id)a3;
- (CPSInstallationControllerDelegate)delegate;
- (id)_asdClipRequestWithSession:(id)a3;
- (id)_bundleIDFromSession:(id)a3;
- (id)_placeholderArtworkForSession:(id)a3;
- (void)_cancelClipSessionWithBundleID:(id)a3 completion:(id)a4;
- (void)_continueInstallForBundleID:(id)a3 session:(id)a4 completion:(id)a5;
- (void)_doneWithSession:(id)a3 error:(id)a4;
- (void)_getClipSessionForBundleID:(id)a3 sourceBundleID:(id)a4 forInstall:(BOOL)a5 completion:(id)a6;
- (void)_informDelegateDidInstallPlaceholder:(id)a3;
- (void)_prewarmDemoIPAWithBundleID:(id)a3 session:(id)a4 completion:(id)a5;
- (void)clipSession:(id)a3 didFailWithError:(id)a4;
- (void)clipSession:(id)a3 didUpdateProgress:(double)a4;
- (void)clipSessionDidCompleteSuccessfully:(id)a3;
- (void)clipSessionDidInstallPlaceholder:(id)a3;
- (void)installClipWithBundleID:(id)a3 session:(id)a4 completion:(id)a5;
- (void)prewarmClipWithBundleID:(id)a3 session:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CPSInstallationController

- (CPSInstallationController)initWithAppInfoFetcher:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPSInstallationController;
  v6 = [(CPSInstallationController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appInfoFetcher, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    sessionsByBundleID = v7->_sessionsByBundleID;
    v7->_sessionsByBundleID = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    installPromisesBySessionID = v7->_installPromisesBySessionID;
    v7->_installPromisesBySessionID = (NSMutableDictionary *)v10;

    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.ClipServices.clipserviced.CPSInstallationController", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v15 = v7;
  }

  return v7;
}

- (void)_prewarmDemoIPAWithBundleID:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[CPSSessionManager sharedManager];
  v12 = [v11 legacyInstaller];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained installationControllerWillStartInstall:self];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke;
  v17[3] = &unk_26424E928;
  id v18 = v12;
  id v19 = v8;
  v20 = self;
  id v21 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v12;
  [v16 downloadAppWithBundleID:v10 completionHandler:v17];
}

void __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_cold_1();
    }
  }
  else
  {
    id v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_2;
    v11[3] = &unk_26424E900;
    id v10 = (void *)a1[7];
    v11[4] = a1[6];
    id v12 = v10;
    [v8 installAppWithBundleID:v5 session:v9 completionHandler:v11];
  }
}

void __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    id v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_2_cold_1();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained installationControllerDidInstallPlaceholder:*(void *)(a1 + 32)];

    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v10 installationController:*(void *)(a1 + 32) didUpdateProgress:0.5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_placeholderArtworkForSession:(id)a3
{
  v3 = [a3 applicationIconFileURL];
  if (!v3) {
    goto LABEL_6;
  }
  id v10 = 0;
  v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:8 error:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CPSInstallationController _placeholderArtworkForSession:]((uint64_t)v5, v6);
    }
    goto LABEL_5;
  }
  if (!v4)
  {
LABEL_5:

LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  id v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_INFO, "Uses app icon in prox card as the placeholder icon.", v9, 2u);
  }
LABEL_7:

  return v4;
}

- (id)_asdClipRequestWithSession:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F25420]);
  id v6 = [v4 metadata];
  id v7 = [v6 amsDictionary];
  id v8 = (void *)[v5 initWithDictionary:v7];

  uint64_t v9 = [v4 configuration];
  if ([v9 canPrefetchEncryptionKey]) {
    [v8 setPrefetchDecryption:1];
  }
  id v10 = [(CPSInstallationController *)self _placeholderArtworkForSession:v4];
  [v8 setPlaceholderArtwork:v10];

  v11 = [v4 url];
  [v8 setSourceURL:v11];

  id v12 = [v9 analyticsReferrerBundleID];
  [v8 setInstallSourceBundleID:v12];

  dispatch_queue_t v13 = [v9 analyticsLaunchReason];
  [v8 setReferrerType:v13];

  return v8;
}

- (void)prewarmClipWithBundleID:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke;
  v15[3] = &unk_26424E978;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke(id *a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v2 = [*((id *)a1[4] + 2) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    v3 = (void (*)(void))*((void *)a1[7] + 2);
    v3();
  }
  else
  {
    [a1[4] setDelegate:a1[6]];
    if (+[CPSClipURL usesDemoMetadata])
    {
      id v4 = a1[4];
      id v5 = a1[5];
      id v6 = a1[6];
      id v7 = a1[7];
      [v4 _prewarmDemoIPAWithBundleID:v5 session:v6 completion:v7];
    }
    else
    {
      id v8 = [a1[6] metadata];
      char v40 = 0;
      if (![v8 hasUpToDateVersionInstalledOnSystemIsPlaceholder:&v40] || v40)
      {
        id v13 = [v8 amsDictionary];
        if (v13)
        {
          id v14 = objc_alloc(MEMORY[0x263F25430]);
          id v15 = [a1[4] _asdClipRequestWithSession:a1[6]];
          id v16 = (void *)[v14 initWithRequest:v15];

          [v16 setDelegate:a1[4]];
          id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 5);
          [WeakRetained installationControllerWillStartInstall:a1[4]];

          [*((id *)a1[4] + 2) setObject:v16 forKeyedSubscript:a1[5]];
          id v18 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21559C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceholderInstall", "Start creating placeholder.", buf, 2u);
          }
          BOOL v19 = +[CPSUtilities isNetworkConstrained];
          v20 = CPS_LOG_CHANNEL_PREFIXClipServices();
          BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if (v19)
          {
            if (v21)
            {
              v22 = v20;
              uint64_t v23 = objc_opt_class();
              id v24 = a1[5];
              *(_DWORD *)buf = 138543619;
              uint64_t v42 = v23;
              __int16 v43 = 2113;
              id v44 = v24;
              _os_log_impl(&dword_21559C000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Prewarming with placeholder only for %{private}@", buf, 0x16u);
            }
            v36[0] = MEMORY[0x263EF8330];
            v36[1] = 3221225472;
            v36[2] = __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_11;
            v36[3] = &unk_26424E950;
            v36[4] = a1[4];
            v25 = &v37;
            id v37 = a1[6];
            v26 = &v38;
            id v38 = a1[5];
            v27 = &v39;
            id v39 = a1[7];
            [v16 installPlaceholderWithCompletionHandler:v36];
          }
          else
          {
            if (v21)
            {
              v29 = v20;
              uint64_t v30 = objc_opt_class();
              id v31 = a1[5];
              *(_DWORD *)buf = 138543619;
              uint64_t v42 = v30;
              __int16 v43 = 2113;
              id v44 = v31;
              _os_log_impl(&dword_21559C000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Prewarming for %{private}@", buf, 0x16u);
            }
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_13;
            v32[3] = &unk_26424E950;
            v32[4] = a1[4];
            v25 = &v33;
            id v33 = a1[6];
            v26 = &v34;
            id v34 = a1[5];
            v27 = &v35;
            id v35 = a1[7];
            [v16 startDownloadWithCompletionHandler:v32];
          }
        }
        else
        {
          v28 = (void (**)(id, void *))a1[7];
          id v16 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 4);
          v28[2](v28, v16);
        }
      }
      else
      {
        id v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v9;
          uint64_t v11 = objc_opt_class();
          id v12 = a1[5];
          *(_DWORD *)buf = 138543619;
          uint64_t v42 = v11;
          __int16 v43 = 2113;
          id v44 = v12;
          _os_log_impl(&dword_21559C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping prewarm since clip is already installed for %{private}@", buf, 0x16u);
        }
        [a1[4] _informDelegateDidInstallPlaceholder:0];
        (*((void (**)(void))a1[7] + 2))();
      }
    }
  }
}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_11_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = [*(id *)(a1 + 40) logID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138543875;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    id v13 = v8;
    __int16 v14 = 2113;
    uint64_t v15 = v9;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_INFO, "%{public}@: Completed request for placeholder for session (%p) %{private}@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_13_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = [*(id *)(a1 + 40) logID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138543875;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    id v13 = v8;
    __int16 v14 = 2113;
    uint64_t v15 = v9;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_INFO, "%{public}@: Started download clip for session (%p) %{private}@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)installClipWithBundleID:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke;
  v15[3] = &unk_26424E9F0;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138478083;
    uint64_t v28 = v3;
    __int16 v29 = 2048;
    uint64_t v30 = v4;
    _os_log_impl(&dword_21559C000, v2, OS_LOG_TYPE_DEFAULT, "CPSInstallationController: Installing clip with bundleID (%{private}@), session (%p)", buf, 0x16u);
  }
  id v5 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 48) + 24);
    id v8 = [v5 uniqueID];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      +[CPSClipURL shouldStallProgress];
    }
    else
    {
      id v9 = +[CPSPromise promise];
      uint64_t v15 = *(void **)(*(void *)(a1 + 48) + 24);
      id v16 = [v6 uniqueID];
      [v15 setObject:v9 forKeyedSubscript:v16];

      if (!+[CPSClipURL shouldStallProgress])
      {
        [*(id *)(a1 + 48) _continueInstallForBundleID:*(void *)(a1 + 32) session:v6 completion:*(void *)(a1 + 56)];
        goto LABEL_10;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_10:

    goto LABEL_12;
  }
  if (+[CPSClipURL usesDemoMetadata])
  {
    id v10 = +[CPSSessionManager sharedManager];
    uint64_t v11 = [v10 legacyInstaller];
    [v11 stopStallingCurrentInstallation];

    dispatch_time_t v12 = dispatch_time(0, 300000000);
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = *(NSObject **)(v13 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_16;
    block[3] = &unk_26424E7B0;
    block[4] = v13;
    dispatch_after(v12, v14, block);
  }
  else
  {
    id v17 = *(void **)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = [*(id *)(a1 + 40) configuration];
    v20 = [v19 sourceBundleID];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_2;
    v22[3] = &unk_26424E9C8;
    BOOL v21 = *(void **)(a1 + 56);
    v22[4] = *(void *)(a1 + 48);
    id v25 = v21;
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 32);
    [v17 _getClipSessionForBundleID:v18 sourceBundleID:v20 forInstall:1 completion:v22];
  }
LABEL_12:
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained installationController:*(void *)(a1 + 32) didUpdateProgress:0.9];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [v3 installationController:*(void *)(a1 + 32) didFinishWithError:0];
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_3;
  v11[3] = &unk_26424E9A0;
  id v12 = v5;
  id v7 = *(id *)(a1 + 56);
  char v17 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v16 = v7;
  uint64_t v13 = v8;
  id v14 = v9;
  id v15 = *(id *)(a1 + 48);
  id v10 = v5;
  dispatch_async(v6, v11);
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:*(void *)(a1 + 32) forKeyedSubscript:*(void *)(a1 + 56)];
    v2 = +[CPSPromise promise];
    id v3 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v4 = [*(id *)(a1 + 32) uniqueID];
    [v3 setObject:v2 forKeyedSubscript:v4];

    if (+[CPSClipURL shouldStallProgress])
    {
      id v5 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_4;
      v17[3] = &unk_26424E530;
      id v6 = &v18;
      id v18 = *(id *)(a1 + 56);
      id v7 = &v19;
      id v19 = *(id *)(a1 + 64);
      [v5 startDownloadWithCompletionHandler:v17];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
      [WeakRetained installationControllerWillStartInstall:*(void *)(a1 + 40)];

      id v12 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_17;
      v14[3] = &unk_26424E530;
      id v6 = &v15;
      id v15 = *(id *)(a1 + 56);
      id v7 = &v16;
      id v16 = *(id *)(a1 + 64);
      [v12 downloadAndInstallWithCompletionHandler:v14];
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 64);
    if (*(unsigned char *)(a1 + 72))
    {
      id v9 = *(void (**)(uint64_t, void))(v8 + 16);
      uint64_t v10 = *(void *)(a1 + 64);
      v9(v10, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 4);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v13);
    }
  }
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_4_cold_1(a1, v5, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138477827;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "ClipSessionManager: startDownload succeeds for bundleID %{private}@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_17_cold_1(a1, v5, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138477827;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "ClipSessionManager: downloadAndInstall succeeds for bundleID %{private}@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_continueInstallForBundleID:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21559C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ContinueInstall", "Start continuing install.", buf, 2u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke;
  v14[3] = &unk_26424EA18;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v10 continueInstallWithCompletionHandler:v14];
}

void __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke_2;
  block[3] = &unk_26424E678;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void **)(a1 + 4);
  uint64_t v3 = a1[4];
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke_2_cold_1((uint64_t)a1, v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a1[5];
    int v8 = 138477827;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "ClipSessionManager: continueInstall succeeds for bundleID %{private}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, *v2);
  }
  return result;
}

- (void)_getClipSessionForBundleID:(id)a3 sourceBundleID:(id)a4 forInstall:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  appInfoFetcher = self->_appInfoFetcher;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93__CPSInstallationController__getClipSessionForBundleID_sourceBundleID_forInstall_completion___block_invoke;
  v13[3] = &unk_26424EA40;
  BOOL v15 = a5;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [(CPSAppInfoFetching *)appInfoFetcher lookUpClipMetadataByBundleID:a3 sourceBundleID:a4 downloadIconIfNeeded:0 skipCaching:0 completionHandler:v13];
}

void __93__CPSInstallationController__getClipSessionForBundleID_sourceBundleID_forInstall_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 amsDictionary];
  if (!v4)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_9:
    v7();
    goto LABEL_12;
  }
  char v8 = 0;
  if ([v3 hasUpToDateVersionInstalledOnSystemIsPlaceholder:&v8]
    && (!*(unsigned char *)(a1 + 48) || !v8))
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F25420]) initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F25430]) initWithRequest:v5];
    [v6 setDelegate:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_12:
}

- (void)_cancelClipSessionWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke;
  block[3] = &unk_26424E678;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2;
    v4[3] = &unk_26424E950;
    v4[4] = *(void *)(a1 + 32);
    id v5 = v2;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v5 cancelInstallWithCompletionHandler:v4];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543875;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    __int16 v22 = 2113;
    uint64_t v23 = v9;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_INFO, "%{public}@: Successfully canceled session (%p) for %{private}@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_20;
  block[3] = &unk_26424EA90;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v15 = v11;
  uint64_t v16 = v12;
  id v17 = v13;
  dispatch_async(v10, block);
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_20(uint64_t *a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:a1[4] allowPlaceholder:1 error:0];
  if ([v2 isPlaceholder])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_22;
    v5[3] = &unk_26424EA68;
    uint64_t v3 = a1[4];
    uint64_t v4 = (void *)a1[6];
    v5[4] = a1[5];
    id v6 = v4;
    id v7 = (id)a1[4];
    +[CPSUtilities uninstallAppWithBundleIdentifier:v3 completion:v5];
  }
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_22(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_22_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138543875;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2113;
    uint64_t v15 = v9;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully cleaned up placeholder for session (%p) for %{private}@", (uint8_t *)&v10, 0x20u);
  }
}

- (id)_bundleIDFromSession:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  sessionsByBundleID = self->_sessionsByBundleID;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__CPSInstallationController__bundleIDFromSession___block_invoke;
  v9[3] = &unk_26424EAB8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSMutableDictionary *)sessionsByBundleID enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__CPSInstallationController__bundleIDFromSession___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v8 = [a3 uniqueID];
  uint64_t v9 = [*(id *)(a1 + 32) uniqueID];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_doneWithSession:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CPSInstallationController__doneWithSession_error___block_invoke;
  block[3] = &unk_26424EA90;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__CPSInstallationController__doneWithSession_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  id v8 = [*(id *)(a1 + 40) _bundleIDFromSession:*(void *)(a1 + 32)];
  if (v8) {
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:0 forKeyedSubscript:v8];
  }
  v2 = *(void **)(*(void *)(a1 + 40) + 24);
  id v3 = [*(id *)(a1 + 32) uniqueID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = *(void **)(*(void *)(a1 + 40) + 24);
  id v6 = [*(id *)(a1 + 32) uniqueID];
  [v5 setObject:0 forKeyedSubscript:v6];

  if (*(void *)(a1 + 48)) {
    objc_msgSend(v4, "finishWithError:");
  }
  else {
    [v4 finish];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  [WeakRetained installationController:*(void *)(a1 + 40) didFinishWithError:*(void *)(a1 + 48)];
}

- (BOOL)stopStallingCurrentInstallation
{
  sessionsByBundleID = self->_sessionsByBundleID;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__CPSInstallationController_stopStallingCurrentInstallation__block_invoke;
  v4[3] = &unk_26424EAE0;
  v4[4] = self;
  [(NSMutableDictionary *)sessionsByBundleID enumerateKeysAndObjectsUsingBlock:v4];
  return 1;
}

uint64_t __60__CPSInstallationController_stopStallingCurrentInstallation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _continueInstallForBundleID:a2 session:a3 completion:0];
}

- (void)clipSession:(id)a3 didFailWithError:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  if ([v8 isEqualToString:*MEMORY[0x263F253A8]])
  {
    uint64_t v9 = [v7 code];

    if (v9 == 907)
    {
      id v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        int v17 = 138543618;
        uint64_t v18 = objc_opt_class();
        __int16 v19 = 2048;
        id v20 = v6;
        _os_log_impl(&dword_21559C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Session (%p) User Canceled.", (uint8_t *)&v17, 0x16u);
      }
      id v12 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 8);
      [(CPSInstallationController *)self _doneWithSession:v6 error:v12];

      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = v13;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v7, "cps_privacyPreservingDescription");
    int v17 = 138543874;
    uint64_t v18 = v15;
    __int16 v19 = 2048;
    id v20 = v6;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    _os_log_error_impl(&dword_21559C000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Session (%p) failed: %{public}@", (uint8_t *)&v17, 0x20u);
  }
  [(CPSInstallationController *)self _doneWithSession:v6 error:v7];
LABEL_10:
}

- (void)clipSession:(id)a3 didUpdateProgress:(double)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    int v10 = 138543874;
    uint64_t v11 = objc_opt_class();
    __int16 v12 = 2048;
    id v13 = v6;
    __int16 v14 = 2048;
    double v15 = a4;
    _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_INFO, "%{public}@: Updated progress for session (%p): %f", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained installationController:self didUpdateProgress:a4];
}

- (void)clipSessionDidCompleteSuccessfully:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v8 = 138543618;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2048;
    id v11 = v4;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully completed session (%p)", (uint8_t *)&v8, 0x16u);
  }
  [(CPSInstallationController *)self _doneWithSession:v4 error:0];
  id v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21559C000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ContinueInstall", "End continuing install enableTelemetry=YES ", (uint8_t *)&v8, 2u);
  }
}

- (void)clipSessionDidInstallPlaceholder:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v8 = 138543618;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2048;
    id v11 = v4;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully installed placeholder (%p)", (uint8_t *)&v8, 0x16u);
  }
  [(CPSInstallationController *)self _informDelegateDidInstallPlaceholder:v4];
  id v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21559C000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceholderInstall", "End creating placeholder.", (uint8_t *)&v8, 2u);
  }
}

- (void)_informDelegateDidInstallPlaceholder:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained installationControllerDidInstallPlaceholder:self];
}

- (CPSInstallationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSInstallationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_installPromisesBySessionID, 0);
  objc_storeStrong((id *)&self->_sessionsByBundleID, 0);

  objc_storeStrong((id *)&self->_appInfoFetcher, 0);
}

void __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21559C000, v0, v1, "An error occurred when download IPA for %{private}@; error: %@");
}

void __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21559C000, v0, v1, "An error occurred when installing IPA for %{private}@; error: %@");
}

- (void)_placeholderArtworkForSession:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "Fail to read placeholder icon: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v3, v4);
  OUTLINED_FUNCTION_6();
  id v5 = [*(id *)(v1 + 40) logID];
  id v6 = objc_msgSend(v0, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_21559C000, v7, v8, "%{public}@: Failed to install placeholder for session (%p) for %{private}@: %{public}@", v9, v10, v11, v12, v13);
}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v3, v4);
  OUTLINED_FUNCTION_6();
  id v5 = [*(id *)(v1 + 40) logID];
  id v6 = objc_msgSend(v0, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_21559C000, v7, v8, "%{public}@: Failed to start download session (%p) for %{private}@: %{public}@", v9, v10, v11, v12, v13);
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_4_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21559C000, v6, v7, "ClipSessionManager: startDownload failed for bundleID %{private}@ with error: %{public}@", v8, v9, v10, v11, v12);
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_17_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21559C000, v6, v7, "ClipSessionManager: downloadAndInstall failed for bundleID %{private}@ with error: %{public}@", v8, v9, v10, v11, v12);
}

void __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke_2_cold_1(uint64_t a1, void **a2, void *a3)
{
  uint64_t v3 = *a2;
  id v4 = a3;
  id v5 = objc_msgSend(v3, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21559C000, v6, v7, "ClipSessionManager: continueInstall failed for bundleID %{private}@ with error: %{public}@", v8, v9, v10, v11, v12);
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v2, v3);
  OUTLINED_FUNCTION_6();
  id v4 = objc_msgSend(v0, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_21559C000, v5, v6, "%{public}@: Failed to cancel session (%p) for %{private}@: %{public}@", v7, v8, v9, v10, v11);
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_22_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v2, v3);
  OUTLINED_FUNCTION_6();
  id v4 = objc_msgSend(v0, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_21559C000, v5, v6, "%{public}@: Failed to clean up placeholder for session (%p) for %{private}@: %{public}@", v7, v8, v9, v10, v11);
}

@end