@interface HFHomeAppInstallController
+ (id)sharedInstance;
- (ASDSystemAppRequest)request;
- (BOOL)_isHomeAppInstalled;
- (HFHomeAppInstallController)init;
- (LSApplicationProxy)appProxy;
- (NAFuture)activeHomeAppDownloadFuture;
- (NSMutableSet)statusUpdaters;
- (id)downloadHomeAppWithUpdateBlock:(id)a3;
- (int64_t)lastReportedStatus;
- (int64_t)status;
- (void)_cleanup;
- (void)_dispatchStatusUpdate:(int64_t)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)request:(id)a3 didCompleteWithError:(id)a4;
- (void)setActiveHomeAppDownloadFuture:(id)a3;
- (void)setLastReportedStatus:(int64_t)a3;
- (void)setRequest:(id)a3;
@end

@implementation HFHomeAppInstallController

+ (id)sharedInstance
{
  if (_MergedGlobals_263 != -1) {
    dispatch_once(&_MergedGlobals_263, &__block_literal_global_3_16);
  }
  v2 = (void *)qword_26AB2F1A8;
  return v2;
}

uint64_t __44__HFHomeAppInstallController_sharedInstance__block_invoke_2()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = qword_26AB2F1A8;
  qword_26AB2F1A8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFHomeAppInstallController)init
{
  v7.receiver = self;
  v7.super_class = (Class)HFHomeAppInstallController;
  v2 = [(HFHomeAppInstallController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F01880] defaultWorkspace];
    [v3 addObserver:v2];

    uint64_t v4 = objc_opt_new();
    statusUpdaters = v2->_statusUpdaters;
    v2->_statusUpdaters = (NSMutableSet *)v4;

    v2->_lastReportedStatus = [(HFHomeAppInstallController *)v2 _isHomeAppInstalled] - 1;
  }
  return v2;
}

- (BOOL)_isHomeAppInstalled
{
  v2 = [(HFHomeAppInstallController *)self appProxy];
  v3 = [v2 appState];
  char v4 = [v3 isInstalled];

  return v4;
}

- (int64_t)status
{
  if ([(HFHomeAppInstallController *)self _isHomeAppInstalled]) {
    return 0;
  }
  return [(HFHomeAppInstallController *)self lastReportedStatus];
}

- (id)downloadHomeAppWithUpdateBlock:(id)a3
{
  id v4 = a3;
  if ([(HFHomeAppInstallController *)self _isHomeAppInstalled])
  {
    uint64_t v5 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    uint64_t v6 = [(HFHomeAppInstallController *)self activeHomeAppDownloadFuture];
    if (!v6
      || (objc_super v7 = (void *)v6,
          [(HFHomeAppInstallController *)self activeHomeAppDownloadFuture],
          v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 isFinished],
          v8,
          v7,
          (v9 & 1) != 0))
    {
      v10 = [(HFHomeAppInstallController *)self statusUpdaters];
      [v10 removeAllObjects];

      v11 = [(HFHomeAppInstallController *)self statusUpdaters];
      v12 = (void *)[v4 copy];
      v13 = _Block_copy(v12);
      objc_msgSend(v11, "na_safeAddObject:", v13);

      v14 = objc_opt_new();
      [(HFHomeAppInstallController *)self setActiveHomeAppDownloadFuture:v14];

      id v15 = objc_alloc(MEMORY[0x263F25520]);
      v16 = HFHomeAppBundleID();
      v17 = (void *)[v15 initWithBundleID:v16];
      [(HFHomeAppInstallController *)self setRequest:v17];

      v18 = [(HFHomeAppInstallController *)self request];
      [v18 setUserInitiated:1];

      [(HFHomeAppInstallController *)self _dispatchStatusUpdate:1];
      objc_initWeak(&location, self);
      v19 = [(HFHomeAppInstallController *)self request];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke;
      v29[3] = &unk_26408D940;
      objc_copyWeak(&v30, &location);
      [v19 startWithErrorHandler:v29];

      v20 = [(HFHomeAppInstallController *)self request];
      [v20 setObserver:self];

      v21 = [(HFHomeAppInstallController *)self activeHomeAppDownloadFuture];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke_3;
      v27[3] = &unk_264095D90;
      objc_copyWeak(&v28, &location);
      v22 = [v21 addCompletionBlock:v27];
      objc_destroyWeak(&v28);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
      goto LABEL_8;
    }
    v23 = [(HFHomeAppInstallController *)self statusUpdaters];
    v24 = (void *)[v4 copy];
    v25 = _Block_copy(v24);
    objc_msgSend(v23, "na_safeAddObject:", v25);

    uint64_t v5 = [(HFHomeAppInstallController *)self activeHomeAppDownloadFuture];
  }
  v22 = (void *)v5;
LABEL_8:

  return v22;
}

void __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke_2;
    v7[3] = &unk_26408DB10;
    objc_copyWeak(&v9, v4);
    id v8 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    [WeakRetained _dispatchStatusUpdate:2];
  }
}

void __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained activeHomeAppDownloadFuture];
  [v2 finishWithError:*(void *)(a1 + 32)];
}

void __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _isHomeAppInstalled]) {
    [WeakRetained _dispatchStatusUpdate:0];
  }
  [WeakRetained _cleanup];
}

- (LSApplicationProxy)appProxy
{
  v2 = (void *)MEMORY[0x263F01868];
  id v3 = HFHomeAppBundleID();
  id v4 = [v2 applicationProxyForIdentifier:v3];

  return (LSApplicationProxy *)v4;
}

- (void)applicationsWillInstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFHomeAppInstallController *)self appProxy];
  uint64_t v6 = [v5 bundleIdentifier];
  int v7 = HFAppProxiesContainsAppProxyWithIdentifier(v4, v6);

  if (v7)
  {
    [(HFHomeAppInstallController *)self _dispatchStatusUpdate:3];
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFHomeAppInstallController *)self appProxy];
  uint64_t v6 = [v5 bundleIdentifier];
  int v7 = HFAppProxiesContainsAppProxyWithIdentifier(v4, v6);

  if (v7)
  {
    id v8 = [(HFHomeAppInstallController *)self activeHomeAppDownloadFuture];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__HFHomeAppInstallController_applicationsDidInstall___block_invoke;
    block[3] = &unk_26408DDE0;
    id v11 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __53__HFHomeAppInstallController_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFHomeAppInstallController *)self appProxy];
  uint64_t v6 = [v5 bundleIdentifier];
  int v7 = HFAppProxiesContainsAppProxyWithIdentifier(v4, v6);

  if (v7)
  {
    [(HFHomeAppInstallController *)self _dispatchStatusUpdate:-1];
    id v8 = [(HFHomeAppInstallController *)self activeHomeAppDownloadFuture];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HFHomeAppInstallController_applicationsDidFailToInstall___block_invoke;
    block[3] = &unk_26408DDE0;
    id v11 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __59__HFHomeAppInstallController_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFHomeAppInstallController *)self appProxy];
  uint64_t v6 = [v5 bundleIdentifier];
  int v7 = HFAppProxiesContainsAppProxyWithIdentifier(v4, v6);

  if (v7)
  {
    [(HFHomeAppInstallController *)self _dispatchStatusUpdate:-1];
  }
}

- (void)request:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFHomeAppInstallController *)self request];

  if (v8 == v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__HFHomeAppInstallController_request_didCompleteWithError___block_invoke;
    v9[3] = &unk_26408D450;
    id v10 = v6;
    id v11 = self;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __59__HFHomeAppInstallController_request_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) activeHomeAppDownloadFuture];
  id v4 = v3;
  if (v2) {
    [v3 finishWithError:*(void *)(a1 + 32)];
  }
  else {
    [v3 finishWithNoResult];
  }
}

- (void)_dispatchStatusUpdate:(int64_t)a3
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HFHomeAppInstallController__dispatchStatusUpdate___block_invoke;
  aBlock[3] = &unk_264095E30;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x263F08B88] isMainThread]) {
    v4[2](v4);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __52__HFHomeAppInstallController__dispatchStatusUpdate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained lastReportedStatus] != *(void *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "setLastReportedStatus:");
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = objc_msgSend(WeakRetained, "statusUpdaters", 0);
    id v4 = (void *)[v3 copy];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_cleanup
{
  [(HFHomeAppInstallController *)self setActiveHomeAppDownloadFuture:0];
  id v3 = [(HFHomeAppInstallController *)self request];
  [v3 setObserver:0];

  [(HFHomeAppInstallController *)self setRequest:0];
  id v4 = [(HFHomeAppInstallController *)self statusUpdaters];
  [v4 removeAllObjects];

  uint64_t v5 = [(HFHomeAppInstallController *)self _isHomeAppInstalled] - 1;
  [(HFHomeAppInstallController *)self setLastReportedStatus:v5];
}

- (NAFuture)activeHomeAppDownloadFuture
{
  return self->_activeHomeAppDownloadFuture;
}

- (void)setActiveHomeAppDownloadFuture:(id)a3
{
}

- (ASDSystemAppRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (int64_t)lastReportedStatus
{
  return self->_lastReportedStatus;
}

- (void)setLastReportedStatus:(int64_t)a3
{
  self->_lastReportedStatus = a3;
}

- (NSMutableSet)statusUpdaters
{
  return self->_statusUpdaters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUpdaters, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_activeHomeAppDownloadFuture, 0);
}

@end