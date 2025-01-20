@interface CPSClipOverlayViewController
- (BOOL)usesMockData;
- (CPSClipOverlayViewController)initWithAppClipBundleID:(id)a3;
- (CPSClipOverlayViewController)initWithAppClipBundleID:(id)a3 webClipID:(id)a4;
- (CPSClipOverlayViewController)initWithAppClipRecord:(id)a3;
- (NSString)referrerBundleID;
- (NSString)webClipID;
- (id)_initWithAppClipBundleID:(id)a3;
- (int64_t)appAttributionBannerPolicy;
- (int64_t)preferredStatusBarStyle;
- (void)_didTapBanner;
- (void)_dismissLoadingViewAnimated:(BOOL)a3;
- (void)_loadClipMetadataUsingPlaceholderWebClipID;
- (void)_loadClipRecordUsingBundleID;
- (void)_presentLoadingViewAnimated:(BOOL)a3;
- (void)_scheduleBannerDismissTimerIfNeeded;
- (void)_setBannerHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setClipRecord:(id)a3;
- (void)_setClipSessionProxy:(id)a3;
- (void)_setPlaceholderClipMetadata:(id)a3;
- (void)_setUpNewSessionProxy;
- (void)_showFailedLoadingStateAndReloadMetadata:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateBanner;
- (void)_updateBannerLabels;
- (void)_updateLoadingView;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)proxy:(id)a3 didRetrieveHeroImage:(id)a4;
- (void)proxyDidChangeProgress:(id)a3;
- (void)proxyDidUpdateMetadata:(id)a3;
- (void)proxyRemoteServiceDidCrash:(id)a3;
- (void)setAppAttributionBannerPolicy:(int64_t)a3;
- (void)setClipNeedsUpdateToLatestVersion;
- (void)setDisplayedOverPlaceholder:(BOOL)a3 animated:(BOOL)a4;
- (void)setDisplayedOverPlaceholder:(BOOL)a3 forWebClipID:(id)a4 animated:(BOOL)a5;
- (void)setDisplayedOverPlaceholder:(BOOL)a3 usingClipMetadata:(id)a4 animated:(BOOL)a5;
- (void)setReferrerBundleID:(id)a3;
- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4;
- (void)setUsesMockData:(BOOL)a3;
- (void)setWebClipID:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CPSClipOverlayViewController

- (CPSClipOverlayViewController)initWithAppClipBundleID:(id)a3
{
  v3 = [(CPSClipOverlayViewController *)self _initWithAppClipBundleID:a3];
  v4 = v3;
  if (v3)
  {
    [(CPSClipOverlayViewController *)v3 _loadClipRecordUsingBundleID];
    v5 = v4;
  }

  return v4;
}

- (CPSClipOverlayViewController)initWithAppClipRecord:(id)a3
{
  id v5 = a3;
  v6 = [v5 bundleID];
  v7 = [(CPSClipOverlayViewController *)self _initWithAppClipBundleID:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_clipRecord, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_initWithAppClipBundleID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPSClipOverlayViewController;
  id v5 = [(CPSClipOverlayViewController *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_sceneActivationState = -1;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F590D0]) initWithBundleID:v4];
    clipRecord = v6->_clipRecord;
    v6->_clipRecord = (CPSAppClipRecord *)v7;

    v6->_showingDemoProgress = CPSUsesDemoProgressFill();
    v9 = v6;
  }

  return v6;
}

- (void)dealloc
{
  [(CPSBannerContainerView *)self->_bannerContainer removeObserver:self forKeyPath:@"bannerHidden" context:kvoContext];
  [(CPSBannerContainerView *)self->_bannerContainer removeObserver:self forKeyPath:@"trackingBannerDismissGesture" context:kvoContext];
  [(CPSBannerContainerView *)self->_bannerContainer removeObserver:self forKeyPath:@"bannerHasAccessibilityFocus" context:kvoContext];
  [(CPSClipOverlayViewController *)self _setClipSessionProxy:0];
  v3.receiver = self;
  v3.super_class = (Class)CPSClipOverlayViewController;
  [(CPSClipOverlayViewController *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  objc_super v11 = (CPSBannerContainerView *)a4;
  id v12 = a5;
  if ((void *)kvoContext == a6)
  {
    if (self->_bannerContainer == v11) {
      [(CPSClipOverlayViewController *)self _scheduleBannerDismissTimerIfNeeded];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CPSClipOverlayViewController;
    [(CPSClipOverlayViewController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)CPSClipOverlayViewController;
  [(CPSClipOverlayViewController *)&v17 viewDidLoad];
  objc_super v3 = [(CPSClipOverlayViewController *)self view];
  objc_initWeak(&location, self);
  id v4 = objc_alloc_init(CPSAppAttributionBanner);
  banner = self->_banner;
  self->_banner = v4;

  v6 = _CPSLocalizedString();
  [(CPSAppAttributionBanner *)self->_banner setSupertitle:v6];

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __43__CPSClipOverlayViewController_viewDidLoad__block_invoke;
  v14 = &unk_1E6AE8DA0;
  objc_copyWeak(&v15, &location);
  [(CPSAppAttributionBanner *)self->_banner setTapAction:&v11];
  [(CPSClipOverlayViewController *)self _updateBanner];
  uint64_t v7 = [[CPSBannerContainerView alloc] initWithBannerView:self->_banner];
  bannerContainer = self->_bannerContainer;
  self->_bannerContainer = v7;

  [(CPSBannerContainerView *)self->_bannerContainer setAutoresizingMask:18];
  [v3 bounds];
  -[CPSBannerContainerView setFrame:](self->_bannerContainer, "setFrame:");
  [(CPSBannerContainerView *)self->_bannerContainer addObserver:self forKeyPath:@"bannerHidden" options:0 context:kvoContext];
  [(CPSBannerContainerView *)self->_bannerContainer addObserver:self forKeyPath:@"trackingBannerDismissGesture" options:0 context:kvoContext];
  [(CPSBannerContainerView *)self->_bannerContainer addObserver:self forKeyPath:@"bannerHasAccessibilityFocus" options:0 context:kvoContext];
  [v3 addSubview:self->_bannerContainer];
  v9 = [(CPSAppClipRecord *)self->_clipRecord fullApplicationName];
  if (v9)
  {
  }
  else
  {
    id v10 = [(CPSAppClipRecord *)self->_clipRecord fullApplicationCaption];

    if (!v10) {
      [(CPSClipOverlayViewController *)self _loadClipRecordUsingBundleID];
    }
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __43__CPSClipOverlayViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapBanner];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSClipOverlayViewController;
  [(CPSClipOverlayViewController *)&v4 viewDidAppear:a3];
  self->_initialAppearanceTime = CACurrentMediaTime();
}

- (int64_t)preferredStatusBarStyle
{
  return -1;
}

- (void)setWebClipID:(id)a3
{
  objc_super v4 = (NSString *)a3;
  webClipID = self->_webClipID;
  if (webClipID != v4)
  {
    uint64_t v11 = v4;
    if (![(NSString *)webClipID isEqualToString:v4])
    {
      v6 = (NSString *)[(NSString *)v11 copy];
      uint64_t v7 = self->_webClipID;
      self->_webClipID = v6;

      sessionPromise = self->_sessionPromise;
      if (sessionPromise) {
        [(CPSPromise *)sessionPromise finishWithError:0];
      }
      v9 = [MEMORY[0x1E4F59108] promise];
      id v10 = self->_sessionPromise;
      self->_sessionPromise = v9;

      [(CPSClipOverlayViewController *)self _loadClipMetadataUsingPlaceholderWebClipID];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setDisplayedOverPlaceholder:(BOOL)a3 forWebClipID:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL displayedOverPlaceholder = self->_displayedOverPlaceholder;
    int v11 = 138478595;
    id v12 = v8;
    __int16 v13 = 1024;
    BOOL v14 = displayedOverPlaceholder;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl(&dword_1D8589000, v9, OS_LOG_TYPE_DEFAULT, "Displaying overlay for web clip %{private}@. Was over placeholder (%d), is over placeholder (%d), animated (%d).", (uint8_t *)&v11, 0x1Eu);
  }
  [(CPSClipOverlayViewController *)self setWebClipID:v8];
  if (self->_displayedOverPlaceholder != v6 || self->_showingDemoProgress)
  {
    self->_BOOL displayedOverPlaceholder = v6;
    if (v6 || self->_showingDemoProgress) {
      [(CPSClipOverlayViewController *)self _presentLoadingViewAnimated:v5];
    }
    else {
      [(CPSClipOverlayViewController *)self _dismissLoadingViewAnimated:v5];
    }
  }
}

- (void)setDisplayedOverPlaceholder:(BOOL)a3 usingClipMetadata:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  v9 = [v8 webClipID];
  [(CPSClipOverlayViewController *)self setWebClipID:v9];

  [(CPSClipOverlayViewController *)self _setPlaceholderClipMetadata:v8];
  id v10 = [v8 webClipID];

  [(CPSClipOverlayViewController *)self setDisplayedOverPlaceholder:v6 forWebClipID:v10 animated:v5];
}

- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int64_t sceneActivationState = self->_sceneActivationState;
    *(_DWORD *)buf = 134218752;
    BOOL v16 = self;
    __int16 v17 = 2048;
    int64_t v18 = a3;
    __int16 v19 = 2048;
    int64_t v20 = sceneActivationState;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl(&dword_1D8589000, v7, OS_LOG_TYPE_DEFAULT, "CPSClipOverlayViewController (%p): Setting scene activation state to %ld from %ld, animated (%d).", buf, 0x26u);
  }
  if (self->_sceneActivationState != a3)
  {
    self->_int64_t sceneActivationState = a3;
    [(CPSClipOverlayViewController *)self loadViewIfNeeded];
    if ((unint64_t)(a3 - 1) < 2 || a3 == -1)
    {
      [(CPSClipOverlayViewController *)self _setBannerHidden:1 animated:v4];
      return;
    }
    if (a3) {
      return;
    }
    if (self->_displayedOverPlaceholder)
    {
      BOOL displayedOverPlaceholder = 1;
    }
    else
    {
      id v10 = [(CPSClipLoadingView *)self->_loadingView superview];
      BOOL v11 = v10 == 0;

      if (!v11) {
        goto LABEL_13;
      }
      BOOL displayedOverPlaceholder = self->_displayedOverPlaceholder;
    }
    [(CPSClipOverlayViewController *)self _setBannerHidden:displayedOverPlaceholder animated:v4];
LABEL_13:
    if (!self->_displayedOverPlaceholder && [(NSString *)self->_webClipID length] && !self->_usesMockData)
    {
      objc_initWeak((id *)buf, self);
      sessionPromise = self->_sessionPromise;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__CPSClipOverlayViewController_setSceneActivationState_animated___block_invoke;
      v13[3] = &unk_1E6AE8DC8;
      objc_copyWeak(&v14, (id *)buf);
      [(CPSPromise *)sessionPromise addCompletionBlock:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __65__CPSClipOverlayViewController_setSceneActivationState_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __65__CPSClipOverlayViewController_setSceneActivationState_animated___block_invoke_cold_1();
      }
    }
    v9 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      id v13 = WeakRetained;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1D8589000, v9, OS_LOG_TYPE_DEFAULT, "CPSClipOverlayViewController (%p): Calling -notifyWebClipActivationWithBundleID on session proxy: %@", (uint8_t *)&v12, 0x16u);
    }
    id v10 = [WeakRetained webClipID];
    BOOL v11 = [WeakRetained referrerBundleID];
    [v5 notifyWebClipActivationWithBundleID:v10 referrerBundleID:v11];
  }
}

- (void)setClipNeedsUpdateToLatestVersion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    clipRecord = self->_clipRecord;
    id v5 = v3;
    id v6 = [(CPSAppClipRecord *)clipRecord bundleID];
    *(_DWORD *)buf = 138412290;
    BOOL v11 = v6;
    _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_DEFAULT, "Update to latest version requested for: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  self->_clipNeedsUpdate = 1;
  sessionPromise = self->_sessionPromise;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke;
  v8[3] = &unk_1E6AE8DC8;
  objc_copyWeak(&v9, (id *)buf);
  [(CPSPromise *)sessionPromise addCompletionBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v8 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_cold_1(v8, v7);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_20;
    v9[3] = &unk_1E6AE8E40;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    id v10 = v5;
    [v10 prewarmClipWithCompletionHandler:v9];

    objc_destroyWeak(&v11);
  }
}

void __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_INFO, "Unable to prewarm clip for updating: %{priate}@", buf, 0xCu);
      }
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_21;
      v7[3] = &unk_1E6AE8E18;
      v7[4] = WeakRetained;
      [v6 installClipWithCompletion:v7];
    }
  }
}

void __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 1008);
    id v6 = v4;
    uint64_t v7 = [v5 bundleID];
    *(_DWORD *)buf = 138412547;
    uint64_t v10 = v7;
    __int16 v11 = 2113;
    id v12 = v3;
    _os_log_impl(&dword_1D8589000, v6, OS_LOG_TYPE_DEFAULT, "Performing update to latest verison for clip with bundle ID: %@, error: %{private}@", buf, 0x16u);
  }
  if (!v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_22;
    block[3] = &unk_1E6AE8DF0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_22(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1088) = 0;
  return result;
}

- (void)setReferrerBundleID:(id)a3
{
  id v6 = (NSString *)a3;
  if ([(NSString *)v6 length])
  {
    p_referrerBundleID = &self->_referrerBundleID;
    if (*p_referrerBundleID != v6
      && ![(NSString *)v6 isEqualToString:@"com.apple.ClipServices.clipserviced"])
    {
      objc_storeStrong((id *)p_referrerBundleID, a3);
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)_loadClipRecordUsingBundleID
{
  if (!self->_usesMockData)
  {
    id v3 = [MEMORY[0x1E4F590D8] defaultStore];
    BOOL v4 = [(CPSAppClipRecord *)self->_clipRecord bundleID];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__CPSClipOverlayViewController__loadClipRecordUsingBundleID__block_invoke;
    v5[3] = &unk_1E6AE8E90;
    v5[4] = self;
    [v3 getAppClipRecordWithBundleID:v4 completion:v5];
  }
}

void __60__CPSClipOverlayViewController__loadClipRecordUsingBundleID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__CPSClipOverlayViewController__loadClipRecordUsingBundleID__block_invoke_2;
    v5[3] = &unk_1E6AE8E68;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __60__CPSClipOverlayViewController__loadClipRecordUsingBundleID__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setClipRecord:*(void *)(a1 + 40)];
}

- (void)_setClipRecord:(id)a3
{
  id v5 = (CPSAppClipRecord *)a3;
  p_clipRecord = &self->_clipRecord;
  if (self->_clipRecord != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_clipRecord, a3);
    p_clipRecord = (CPSAppClipRecord **)[(CPSClipOverlayViewController *)self _updateBanner];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_clipRecord, v5);
}

- (void)_loadClipMetadataUsingPlaceholderWebClipID
{
  if (!self->_usesMockData)
  {
    [(CPSClipOverlayViewController *)self _setPlaceholderClipMetadata:0];
    [(CPSClipOverlayViewController *)self _setClipSessionProxy:0];
    id v3 = self->_webClipID;
    if ([(NSString *)v3 length])
    {
      BOOL v4 = [MEMORY[0x1E4F59138] sharedStore];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __74__CPSClipOverlayViewController__loadClipMetadataUsingPlaceholderWebClipID__block_invoke;
      v5[3] = &unk_1E6AE8EB8;
      id v6 = v3;
      uint64_t v7 = self;
      [v4 getAppClipWithIdentifier:v6 receiveOnQueue:MEMORY[0x1E4F14428] completionHandler:v5];
    }
  }
}

void __74__CPSClipOverlayViewController__loadClipMetadataUsingPlaceholderWebClipID__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1072), a2);
    [*(id *)(a1 + 40) _updateBannerLabels];
    [*(id *)(a1 + 40) _setUpNewSessionProxy];
    [*(id *)(*(void *)(a1 + 40) + 1080) finishWithResult:*(void *)(*(void *)(a1 + 40) + 1048)];
  }
  else
  {
    id v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __74__CPSClipOverlayViewController__loadClipMetadataUsingPlaceholderWebClipID__block_invoke_cold_1(a1, v5, v6);
    }
  }
}

- (void)_setUpNewSessionProxy
{
  id v3 = objc_alloc(MEMORY[0x1E4F59118]);
  id v4 = [(CPSWebClip *)self->_webClip pageURL];
  id v7 = (id)[v3 initWithURL:v4];

  id v5 = [MEMORY[0x1E4F59110] localConfiguration];
  [v7 setConfiguration:v5];

  uint64_t v6 = [v7 configuration];
  [v6 setIsForSwitcherOverlay:1];

  [(CPSClipOverlayViewController *)self _setClipSessionProxy:v7];
}

- (void)_setPlaceholderClipMetadata:(id)a3
{
  id v5 = (CPSClipMetadata *)a3;
  p_placeholderClipMetadata = &self->_placeholderClipMetadata;
  if (self->_placeholderClipMetadata != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_placeholderClipMetadata, a3);
    p_placeholderClipMetadata = (CPSClipMetadata **)[(CPSClipOverlayViewController *)self _updateLoadingView];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_placeholderClipMetadata, v5);
}

- (void)_setClipSessionProxy:(id)a3
{
  id v5 = (CPSSessionProxy *)a3;
  if (!v5) {
    self->_attemptToShowBannerOnceSessionProxyIsResolved = 0;
  }
  sessionProxy = self->_sessionProxy;
  if (sessionProxy != v5)
  {
    id v8 = v5;
    sessionProxy = (CPSSessionProxy *)[(CPSSessionProxy *)sessionProxy isEqual:v5];
    id v5 = v8;
    if ((sessionProxy & 1) == 0)
    {
      id v7 = self->_sessionProxy;
      objc_storeStrong((id *)&self->_sessionProxy, a3);
      if (v7)
      {
        [(CPSSessionProxy *)v7 disconnect];
        [(CPSSessionProxy *)v7 setDelegate:0];
      }
      if (v8)
      {
        [(CPSSessionProxy *)v8 setDelegate:self];
        [(CPSSessionProxy *)v8 connectToService];
        if (self->_attemptToShowBannerOnceSessionProxyIsResolved)
        {
          self->_attemptToShowBannerOnceSessionProxyIsResolved = 0;
          [(CPSClipOverlayViewController *)self _setBannerHidden:self->_displayedOverPlaceholder animated:1];
        }
      }

      id v5 = v8;
    }
  }

  MEMORY[0x1F41817F8](sessionProxy, v5);
}

- (void)proxyDidUpdateMetadata:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CPSClipOverlayViewController_proxyDidUpdateMetadata___block_invoke;
  v6[3] = &unk_1E6AE8E68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__CPSClipOverlayViewController_proxyDidUpdateMetadata___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) metadata];
  [v1 _setPlaceholderClipMetadata:v2];
}

- (void)proxyDidChangeProgress:(id)a3
{
  if (!self->_showingDemoProgress)
  {
    id v4 = [a3 estimatedProgress];
    [v4 floatValue];
    int v6 = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__CPSClipOverlayViewController_proxyDidChangeProgress___block_invoke;
    v7[3] = &unk_1E6AE8EE0;
    v7[4] = self;
    int v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __55__CPSClipOverlayViewController_proxyDidChangeProgress___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 1024) setLoadingProgress:0 completion:a2];
}

- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_showingDemoProgress)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__CPSClipOverlayViewController_proxy_didFinishLoadingWithError___block_invoke;
    v8[3] = &unk_1E6AE8F08;
    objc_copyWeak(&v11, &location);
    id v9 = v7;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

uint64_t __64__CPSClipOverlayViewController_proxy_didFinishLoadingWithError___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = a1[4];
    uint64_t v13 = v4;
    if (!v5)
    {
      LODWORD(v3) = 1.0;
      id WeakRetained = (unsigned char *)[*((id *)v4 + 128) setLoadingProgress:0 completion:v3];
LABEL_10:
      id v4 = v13;
      goto LABEL_11;
    }
    id v6 = [v5 domain];
    int v7 = [v6 isEqual:*MEMORY[0x1E4F59098]];

    id WeakRetained = (unsigned char *)[a1[4] code];
    id v4 = v13;
    if (WeakRetained != (unsigned char *)17 || !v13[1088])
    {
      int v8 = [MEMORY[0x1E4F590C8] sharedLogger];
      id v9 = [a1[5] metadata];
      id v10 = [v9 clipBundleID];
      objc_msgSend(v8, "recordDidShowErrorWithBundleID:place:errorCode:", v10, @"launchScreen", objc_msgSend(a1[4], "code"));

      if (v7) {
        BOOL v11 = [a1[4] code] == 17;
      }
      else {
        BOOL v11 = 0;
      }
      id WeakRetained = (unsigned char *)[v13 _showFailedLoadingStateAndReloadMetadata:v11 animated:v7 ^ 1u];
      goto LABEL_10;
    }
  }
LABEL_11:

  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

- (void)proxyRemoteServiceDidCrash:(id)a3
{
  id v4 = a3;
  id v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CPSClipOverlayViewController proxyRemoteServiceDidCrash:]();
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CPSClipOverlayViewController_proxyRemoteServiceDidCrash___block_invoke;
  v7[3] = &unk_1E6AE8E68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __59__CPSClipOverlayViewController_proxyRemoteServiceDidCrash___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) disconnect];
  int v2 = [MEMORY[0x1E4F590F8] isSupported];
  double v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 connectToService];
  }
  else if (v3 == *(void **)(*(void *)(a1 + 40) + 1048))
  {
    id v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 134217984;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D8589000, v4, OS_LOG_TYPE_DEFAULT, "CPSClipOverlayViewController (%p): Skip reconnection as app clips are not supported", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = *(void **)(v6 + 1048);
    *(void *)(v6 + 1048) = 0;
  }
}

- (void)proxy:(id)a3 didRetrieveHeroImage:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CPSClipOverlayViewController_proxy_didRetrieveHeroImage___block_invoke;
  v7[3] = &unk_1E6AE8E68;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __59__CPSClipOverlayViewController_proxy_didRetrieveHeroImage___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    double v3 = (void *)MEMORY[0x1E4F42A80];
    id v4 = [v2 path];
    id v5 = [v3 imageWithContentsOfFile:v4];
  }
  else
  {
    id v5 = 0;
  }
  [*(id *)(*(void *)(a1 + 40) + 1024) setBackgroundImage:v5 animated:CACurrentMediaTime() - *(double *)(*(void *)(a1 + 40) + 1064) > 0.15];
}

- (void)_presentLoadingViewAnimated:(BOOL)a3
{
  id v4 = [(CPSClipLoadingView *)self->_loadingView superview];

  id v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_DEFAULT, "Requested to present the loading view, but it is already presented.", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_DEFAULT, "Presenting the loading view.", buf, 2u);
    }
    int v7 = objc_alloc_init(CPSClipLoadingView);
    loadingView = self->_loadingView;
    self->_loadingView = v7;

    uint64_t v9 = [(CPSClipOverlayViewController *)self view];
    [v9 bounds];
    -[CPSClipLoadingView setFrame:](self->_loadingView, "setFrame:");

    [(CPSClipLoadingView *)self->_loadingView setAutoresizingMask:18];
    [(CPSClipOverlayViewController *)self _updateLoadingView];
    uint64_t v10 = [(CPSClipOverlayViewController *)self view];
    [v10 insertSubview:self->_loadingView belowSubview:self->_bannerContainer];

    if (self->_usesMockData || self->_showingDemoProgress)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__CPSClipOverlayViewController__presentLoadingViewAnimated___block_invoke;
      v12[3] = &unk_1E6AE8F30;
      v12[4] = self;
      id v11 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v12 block:0.15];
    }
  }
}

void __60__CPSClipOverlayViewController__presentLoadingViewAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(*(void *)(a1 + 32) + 1024) loadingProgress];
  if (v3 >= 1.0)
  {
    [v7 invalidate];
    *(unsigned char *)(*(void *)(a1 + 32) + 1057) = 0;
    [*(id *)(a1 + 32) setDisplayedOverPlaceholder:0 animated:1];
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 1024);
    [v4 loadingProgress];
    double v6 = v5 + 0.03;
    *(float *)&double v6 = v6;
    [v4 setLoadingProgress:0 completion:v6];
  }
}

- (void)_updateLoadingView
{
  [(CPSClipLoadingView *)self->_loadingView setPoweredByThirdParty:[(CPSClipMetadata *)self->_placeholderClipMetadata isPoweredByThirdParty]];
  float v3 = [(CPSClipMetadata *)self->_placeholderClipMetadata clipName];
  [(CPSClipLoadingView *)self->_loadingView setName:v3];

  id v4 = [(CPSClipMetadata *)self->_placeholderClipMetadata fullAppShortName];
  if (v4)
  {
    [(CPSClipLoadingView *)self->_loadingView setProvider:v4];
  }
  else
  {
    float v5 = [(CPSClipMetadata *)self->_placeholderClipMetadata fullAppName];
    [(CPSClipLoadingView *)self->_loadingView setProvider:v5];
  }
  id v10 = [(CPSClipMetadata *)self->_placeholderClipMetadata clipHeroImageURL];
  if (objc_msgSend(v10, "cps_isFileURL"))
  {
    loadingView = self->_loadingView;
    id v7 = objc_alloc(MEMORY[0x1E4F42A80]);
    id v8 = [v10 path];
    uint64_t v9 = (void *)[v7 initWithContentsOfFile:v8];
    [(CPSClipLoadingView *)loadingView setBackgroundImage:v9 animated:0];
  }
}

- (void)_showFailedLoadingStateAndReloadMetadata:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_initWeak(&location, self);
  loadingView = self->_loadingView;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke;
  id v11 = &unk_1E6AE8DA0;
  objc_copyWeak(&v12, &location);
  [(CPSClipLoadingView *)loadingView setLoadingHasFailed:1 animated:v4 reason:0 reloadHandler:&v8];
  if (v5) {
    [(CPSSessionProxy *)self->_sessionProxy fetchClipMetadataAndImages];
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    float v3 = objc_loadWeakRetained(v1);
    BOOL v4 = (void *)v3[131];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke_2;
    v5[3] = &unk_1E6AE8E18;
    void v5[4] = v3;
    [v4 prewarmClipWithCompletionHandler:v5];
  }
}

void __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = v4;
      double v6 = objc_msgSend(v3, "cps_privacyPreservingDescription");
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_INFO, "Unable to prewarm clip again after attempting to reload: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 1048) installClip];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke_42;
    block[3] = &unk_1E6AE8DF0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke_42(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1024) setLoadingHasFailed:0 animated:1 reason:0 reloadHandler:0];
}

- (void)_dismissLoadingViewAnimated:(BOOL)a3
{
  BOOL v4 = [(CPSClipLoadingView *)self->_loadingView superview];

  BOOL v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_DEFAULT, "Starting to dismiss the loading view.", buf, 2u);
    }
    [(CPSClipOverlayViewController *)self _updateBanner];
    loadingView = self->_loadingView;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__CPSClipOverlayViewController__dismissLoadingViewAnimated___block_invoke;
    v8[3] = &unk_1E6AE8DF0;
    void v8[4] = self;
    [(CPSClipLoadingView *)loadingView finishLoadingWithCompletion:v8];
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_DEFAULT, "Requested to dismiss the loading view, but the loading view is not yet presented.", buf, 2u);
  }
}

uint64_t __60__CPSClipOverlayViewController__dismissLoadingViewAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1024) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1024);
  *(void *)(v2 + 1024) = 0;

  BOOL v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1D8589000, v4, OS_LOG_TYPE_DEFAULT, "The loading view has been removed from the view hierarcy.", v6, 2u);
  }
  return [*(id *)(a1 + 32) _setBannerHidden:0 animated:1];
}

- (void)_setBannerHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    bannerContainer = self->_bannerContainer;
    [(CPSBannerContainerView *)bannerContainer setBannerHidden:1 animated:a4 animationCompletion:0];
  }
  else
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke;
    v14[3] = &unk_1E6AE8F58;
    objc_copyWeak(&v15, &location);
    BOOL v16 = a4;
    uint64_t v7 = MEMORY[0x1D9487A30](v14);
    uint64_t v8 = (void *)v7;
    if (self->_appAttributionBannerPolicy)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
    else
    {
      uint64_t v9 = self->_sessionProxy;
      if (v9)
      {
        self->_attemptToShowBannerOnceSessionProxyIsResolved = 0;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke_2;
        v10[3] = &unk_1E6AE8FA8;
        objc_copyWeak(&v13, &location);
        id v11 = v9;
        id v12 = v8;
        [(CPSSessionProxy *)v11 checkAndConsumeShowsAppAttributionBannerWithCompletion:v10];

        objc_destroyWeak(&v13);
      }
      else
      {
        self->_attemptToShowBannerOnceSessionProxyIsResolved = 1;
      }
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 1016) || *((void *)WeakRetained + 130))
    {
      if (!*((void *)WeakRetained + 139)) {
        *((void *)WeakRetained + 139) = 1;
      }
    }
    else
    {
      if (*((void *)WeakRetained + 139) == 1) {
        *((void *)WeakRetained + 139) = 0;
      }
      id v3 = WeakRetained;
      [*((id *)WeakRetained + 125) setBannerHidden:0 animated:*(unsigned __int8 *)(a1 + 40) animationCompletion:0];
      id WeakRetained = v3;
    }
  }
}

void __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke_2(id *a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke_3;
  v4[3] = &unk_1E6AE8F80;
  objc_copyWeak(&v7, a1 + 6);
  char v8 = a2;
  id v5 = a1[4];
  id v6 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v7);
}

void __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v3 = WeakRetained == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && WeakRetained[131] == *(void *)(a1 + 32))
  {
    BOOL v4 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v4;
  }
}

- (void)_scheduleBannerDismissTimerIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  bannerContainer = self->_bannerContainer;
  if (!bannerContainer
    || [(CPSBannerContainerView *)bannerContainer isBannerHidden]
    || [(CPSBannerContainerView *)self->_bannerContainer isTrackingBannerDismissGesture]|| [(CPSBannerContainerView *)self->_bannerContainer bannerHasAccessibilityFocus])
  {
    if (self->_automaticBannerDismissTimer)
    {
      BOOL v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D8589000, v4, OS_LOG_TYPE_INFO, "Invalidated banner dismiss timer.", buf, 2u);
      }
      p_automaticBannerDismissTimer = &self->_automaticBannerDismissTimer;
      [(NSTimer *)*p_automaticBannerDismissTimer invalidate];
      id v6 = *p_automaticBannerDismissTimer;
      *p_automaticBannerDismissTimer = 0;
    }
  }
  else if (!self->_automaticBannerDismissTimer)
  {
    id v7 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = 0x4018000000000000;
      _os_log_impl(&dword_1D8589000, v7, OS_LOG_TYPE_INFO, "Scheduling banner dismiss timer with for %.1fs.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    char v8 = (void *)MEMORY[0x1E4F1CB00];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__CPSClipOverlayViewController__scheduleBannerDismissTimerIfNeeded__block_invoke;
    v11[3] = &unk_1E6AE8FD0;
    objc_copyWeak(&v12, (id *)buf);
    uint64_t v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:v11 block:6.0];
    automaticBannerDismissTimer = self->_automaticBannerDismissTimer;
    self->_automaticBannerDismissTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __67__CPSClipOverlayViewController__scheduleBannerDismissTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1D8589000, v2, OS_LOG_TYPE_INFO, "Banner dismiss timer fired, hiding banner.", v4, 2u);
    }
    [WeakRetained[122] invalidate];
    id v3 = WeakRetained[122];
    WeakRetained[122] = 0;

    [WeakRetained _setBannerHidden:1 animated:1];
  }
}

- (void)_updateBanner
{
  id v3 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D8589000, v3, OS_LOG_TYPE_DEFAULT, "Updating the attribution banner", buf, 2u);
  }
  [(CPSClipOverlayViewController *)self _updateBannerLabels];
  BOOL v4 = self->_clipRecord;
  id v5 = +[CPSAppAttributionBanner preferredImageDescriptor];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CPSClipOverlayViewController__updateBanner__block_invoke;
  v7[3] = &unk_1E6AE8FF8;
  char v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(CPSAppClipRecord *)v6 getApplicationIconForImageDescriptor:v5 resultHandler:v7];
}

uint64_t __45__CPSClipOverlayViewController__updateBanner__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v2 + 1008)) {
    return [*(id *)(v2 + 992) setIcon:a2];
  }
  return result;
}

- (void)_updateBannerLabels
{
  id v3 = [(CPSAppClipRecord *)self->_clipRecord fullApplicationName];
  if (v3)
  {
    p_banner = &self->_banner;
    [(CPSAppAttributionBanner *)self->_banner setTitle:v3];
  }
  else
  {
    id v5 = [(CPSWebClip *)self->_webClip fullAppName];
    p_banner = &self->_banner;
    [(CPSAppAttributionBanner *)self->_banner setTitle:v5];
  }
  id v6 = [(CPSAppClipRecord *)self->_clipRecord fullApplicationCaption];
  if (v6)
  {
    [(CPSAppAttributionBanner *)*p_banner setSubtitle:v6];
  }
  else
  {
    id v7 = [(CPSWebClip *)self->_webClip fullAppCaption];
    [(CPSAppAttributionBanner *)*p_banner setSubtitle:v7];
  }
  id v9 = [(CPSAppClipRecord *)self->_clipRecord fullApplicationStoreURL];
  if (v9)
  {
    [(CPSAppAttributionBanner *)*p_banner setShowsAppStoreButton:1];
  }
  else
  {
    char v8 = [(CPSWebClip *)self->_webClip fullAppStoreURL];
    [(CPSAppAttributionBanner *)*p_banner setShowsAppStoreButton:v8 != 0];
  }
}

- (void)_didTapBanner
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  id v3 = a2;
  BOOL v4 = [v2 bundleID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8589000, v3, v5, "No App Store URL recorded for full application with ID %{private}@", v6);
}

- (CPSClipOverlayViewController)initWithAppClipBundleID:(id)a3 webClipID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CPSClipOverlayViewController initWithAppClipBundleID:webClipID:](v8);
  }
  id v9 = [(CPSClipOverlayViewController *)self initWithAppClipBundleID:v7];

  if (v9)
  {
    [(CPSClipOverlayViewController *)v9 setWebClipID:v6];
    uint64_t v10 = v9;
  }

  return v9;
}

- (void)setDisplayedOverPlaceholder:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CPSClipOverlayViewController setDisplayedOverPlaceholder:animated:](v7);
  }
  [(CPSClipOverlayViewController *)self setDisplayedOverPlaceholder:v5 forWebClipID:self->_webClipID animated:v4];
}

- (NSString)webClipID
{
  return self->_webClipID;
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (BOOL)usesMockData
{
  return self->_usesMockData;
}

- (void)setUsesMockData:(BOOL)a3
{
  self->_usesMockData = a3;
}

- (int64_t)appAttributionBannerPolicy
{
  return self->_appAttributionBannerPolicy;
}

- (void)setAppAttributionBannerPolicy:(int64_t)a3
{
  self->_appAttributionBannerPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_webClipID, 0);
  objc_storeStrong((id *)&self->_sessionPromise, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_sessionProxy, 0);
  objc_storeStrong((id *)&self->_placeholderClipMetadata, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_clipRecord, 0);
  objc_storeStrong((id *)&self->_bannerContainer, 0);
  objc_storeStrong((id *)&self->_banner, 0);

  objc_storeStrong((id *)&self->_automaticBannerDismissTimer, 0);
}

void __65__CPSClipOverlayViewController_setSceneActivationState_animated___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D8589000, v1, OS_LOG_TYPE_ERROR, "CPSClipOverlayViewController (%p): Error in update promise completion block: %@", v2, 0x16u);
}

void __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __int16 v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8589000, v3, v5, "Not performing update to latest version: %@", v6);
}

void __74__CPSClipOverlayViewController__loadClipMetadataUsingPlaceholderWebClipID__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1D8589000, a2, a3, "No clip with ID %{public}@.", (uint8_t *)&v4);
}

- (void)proxyRemoteServiceDidCrash:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8589000, v0, v1, "CPSClipOverlayViewController: Remote service did crash for proxy (%p)", v2);
}

- (void)initWithAppClipBundleID:(os_log_t)log webClipID:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D8589000, log, OS_LOG_TYPE_ERROR, "Use -initWithAppClipBundleID:.", v1, 2u);
}

- (void)setDisplayedOverPlaceholder:(os_log_t)log animated:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D8589000, log, OS_LOG_TYPE_ERROR, "Use -setDisplayedOverPlaceholderForWebClipID:animated:.", v1, 2u);
}

@end