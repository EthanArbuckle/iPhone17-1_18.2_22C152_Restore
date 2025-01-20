@interface QLDownloadingItemViewController
- (BOOL)downloaded;
- (BOOL)shouldAutoDownloadInNetworkState:(unint64_t)a3 downloadSize:(id)a4 forceIfPossible:(BOOL)a5;
- (BOOL)showsLoadingPreviewSpinner;
- (QLDownloadingItemViewControllerDelegate)downloadingDelegate;
- (QLRoundProgressView)progressView;
- (void)_presentConnectivityAlert;
- (void)_setDownloading:(BOOL)a3 animated:(BOOL)a4;
- (void)_startDownload:(BOOL)a3;
- (void)_startDownloadOperation;
- (void)_stopDownload:(BOOL)a3;
- (void)_toggleDownload:(BOOL)a3;
- (void)_updateFileSizeWithProgress:(double)a3 animated:(BOOL)a4;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)performAction;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setDownloaded:(BOOL)a3;
- (void)setDownloadingDelegate:(id)a3;
- (void)setShowsLoadingPreviewSpinner:(BOOL)a3;
- (void)startDownload:(BOOL)a3;
- (void)startDownloadIfNeeded;
- (void)viewDidLoad;
@end

@implementation QLDownloadingItemViewController

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)QLDownloadingItemViewController;
  [(QLDetailItemViewController *)&v25 viewDidLoad];
  self->_didDisappear = 1;
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = QLFrameworkBundle();
  v5 = [v3 imageNamed:@"Cloudload" inBundle:v4 compatibleWithTraitCollection:0];
  cloudImage = self->_cloudImage;
  self->_cloudImage = v5;

  v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
  downloadImageView = self->_downloadImageView;
  self->_downloadImageView = v7;

  [(UIImageView *)self->_downloadImageView setImage:self->_cloudImage];
  [(QLItem *)self->_previewItem canBePreviewed];
  v9 = QLLocalizedString();
  v10 = +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:v9 actionButtonView:self->_downloadImageView informationVisible:1];
  readyForDownloadState = self->_readyForDownloadState;
  self->_readyForDownloadState = v10;

  v12 = -[QLRoundProgressView initWithFrame:]([QLRoundProgressView alloc], "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
  progressView = self->_progressView;
  self->_progressView = v12;

  v14 = QLLocalizedStringWithDefaultValue();
  v15 = +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:v14 actionButtonView:self->_progressView informationVisible:1];
  cancelableDownloadingState = self->_cancelableDownloadingState;
  self->_cancelableDownloadingState = v15;

  v17 = +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:0 actionButtonView:self->_progressView informationVisible:1];
  nonCancelableDownloadingState = self->_nonCancelableDownloadingState;
  self->_nonCancelableDownloadingState = v17;

  v19 = +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:0 actionButtonView:0 informationVisible:0];
  completedDownloadState = self->_completedDownloadState;
  self->_completedDownloadState = v19;

  v21 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:9];
  v22 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v21 setColor:v22];

  [v21 startAnimating];
  v23 = +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:0 actionButtonView:v21 informationVisible:0];
  previewLoadingState = self->_previewLoadingState;
  self->_previewLoadingState = v23;

  [(QLDetailItemViewController *)self setState:self->_readyForDownloadState animated:0];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLDownloadingItemViewController;
  [(QLDetailItemViewController *)&v7 setAppearance:v6 animated:v4];
  [(QLDownloadingItemViewController *)self loadViewIfNeeded];
  if (!*(_WORD *)&self->_downloading)
  {
    if ([v6 presentationMode] == 4) {
      [(QLDownloadingItemViewController *)self _startDownload:0];
    }
    else {
      [(QLDownloadingItemViewController *)self startDownloadIfNeeded];
    }
  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __95__QLDownloadingItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v13[3] = &unk_2642F70F0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)QLDownloadingItemViewController;
  id v10 = v9;
  id v11 = v8;
  [(QLDetailItemViewController *)&v12 loadPreviewControllerWithContents:v11 context:a4 completionHandler:v13];
}

uint64_t __95__QLDownloadingItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1264), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _updateFileSizeWithProgress:0 animated:0.0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)shouldAutoDownloadInNetworkState:(unint64_t)a3 downloadSize:(id)a4 forceIfPossible:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = v7;
  if (a3 > 2)
  {
    if (a5)
    {
      BOOL v13 = 1;
    }
    else
    {
      uint64_t v14 = [v7 integerValue];
      uint64_t v15 = v14;
      if (a3 == 3) {
        uint64_t v16 = 6291456;
      }
      else {
        uint64_t v16 = 102400;
      }
      BOOL v13 = v14 < v16;
      v17 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        v22 = (NSObject **)MEMORY[0x263F62940];
        QLSInitLogging();
        v17 = *v22;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if (v15 >= v16) {
          v18 = @"NO";
        }
        else {
          v18 = @"YES";
        }
        v19 = v17;
        v20 = NSStringFromQLNetworkState();
        int v23 = 138412546;
        v24 = v18;
        __int16 v25 = 2112;
        v26 = v20;
        _os_log_impl(&dword_217F61000, v19, OS_LOG_TYPE_INFO, "Should auto-download: '%@', state is %@ #Downloading", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    id v9 = (NSObject **)MEMORY[0x263F62940];
    id v10 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      NSStringFromQLNetworkState();
      objc_super v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v23 = 138412290;
      v24 = v12;
      _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "Avoid auto-download, since state is %@ #Downloading", (uint8_t *)&v23, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_updateFileSizeWithProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v19[1] = *MEMORY[0x263EF8340];
  id v7 = [(QLItem *)self->_previewItem fetcher];
  id v8 = [v7 itemSize];

  id v9 = objc_msgSend(MEMORY[0x263F086F0], "stringFromByteCount:countStyle:", objc_msgSend(v8, "longLongValue"), 0);
  if (v9 && [v8 integerValue] >= 1)
  {
    if (self->_downloading)
    {
      id v10 = v9;
      uint64_t v11 = [v8 longLongValue];
      objc_super v12 = [MEMORY[0x263F086F0] stringFromByteCount:(uint64_t)((double)v11 * a3) countStyle:0];
      BOOL v13 = NSString;
      uint64_t v14 = QLLocalizedString();
      uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", v14, v12, v10);

      v19[0] = v15;
      uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];

      [(QLDetailItemViewController *)self setInformation:v16];
    }
    else
    {
      v18 = v9;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
      [(QLDetailItemViewController *)self setInformation:v17];
    }
  }
  else
  {
    [(QLDetailItemViewController *)self setInformation:&unk_26C913370];
  }
  [(QLRoundProgressView *)self->_progressView setProgress:v4 animated:a3];
}

- (void)previewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)QLDownloadingItemViewController;
  [(QLItemViewController *)&v3 previewDidAppear:a3];
}

- (void)previewDidDisappear:(BOOL)a3
{
  self->_didDisappear = 1;
}

- (void)performAction
{
}

- (void)setShowsLoadingPreviewSpinner:(BOOL)a3
{
  if (self->_showsLoadingPreviewSpinner != a3)
  {
    self->_showsLoadingPreviewSpinner = a3;
    objc_super v3 = &OBJC_IVAR___QLDownloadingItemViewController__completedDownloadState;
    if (a3) {
      objc_super v3 = &OBJC_IVAR___QLDownloadingItemViewController__previewLoadingState;
    }
    [(QLDetailItemViewController *)self setState:*(Class *)((char *)&self->super.super.super.super.super.isa + *v3) animated:1];
  }
}

- (void)_toggleDownload:(BOOL)a3
{
  if (self->_downloading) {
    [(QLDownloadingItemViewController *)self _stopDownload:a3];
  }
  else {
    [(QLDownloadingItemViewController *)self _startDownload:a3];
  }
}

- (void)startDownload:(BOOL)a3
{
  v5 = [MEMORY[0x263F629A8] sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__QLDownloadingItemViewController_startDownload___block_invoke;
  v6[3] = &unk_2642F7288;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 networkStateWithCompletionBlock:v6];
}

void __49__QLDownloadingItemViewController_startDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(id **)(a1 + 32);
  v5 = [v4[158] fetcher];
  id v6 = [v5 itemSize];
  LODWORD(a2) = [v4 shouldAutoDownloadInNetworkState:a2 downloadSize:v6 forceIfPossible:*(unsigned __int8 *)(a1 + 40)];

  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v7 + 1184))
    {
      if (*(unsigned char *)(v7 + 1186)) {
        QLRunInMainThread();
      }
    }
  }
}

uint64_t __49__QLDownloadingItemViewController_startDownload___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDownload:0];
}

- (void)startDownloadIfNeeded
{
  objc_super v3 = [(QLDownloadingItemViewController *)self downloadingDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(QLDownloadingItemViewController *)self downloadingDelegate];
    uint64_t v6 = [v5 downloadingItemViewControllerShouldForceAutodownloadFile:self];
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(QLDownloadingItemViewController *)self startDownload:v6];
}

- (void)_startDownload:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x263F629A8] sharedInstance];
  int v6 = [v5 isConnected];

  if (v6)
  {
    if (!self->_downloading)
    {
      [(QLDownloadingItemViewController *)self _startDownloadOperation];
      [(QLDownloadingItemViewController *)self _setDownloading:1 animated:v3];
    }
  }
  else
  {
    [(QLDownloadingItemViewController *)self _setDownloading:0 animated:v3];
    uint64_t v7 = [(QLItemViewController *)self appearance];
    uint64_t v8 = [v7 presentationMode];

    if (v8 != 4)
    {
      [(QLDownloadingItemViewController *)self _presentConnectivityAlert];
    }
  }
}

- (void)_stopDownload:(BOOL)a3
{
  if (self->_downloading)
  {
    BOOL v3 = a3;
    v5 = [(QLItem *)self->_previewItem fetcher];
    int v6 = [v5 canBeCanceled];

    if (v6)
    {
      uint64_t v7 = [(QLItem *)self->_previewItem fetcher];
      [v7 cancelFetch];

      [(QLDownloadingItemViewController *)self _setDownloading:0 animated:v3];
    }
  }
}

- (void)_setDownloading:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_downloading != a3)
  {
    BOOL v4 = a4;
    self->_downloading = a3;
    if (a3)
    {
      int v6 = [(QLItem *)self->_previewItem fetcher];
      int v7 = [v6 canBeCanceled];
      uint64_t v8 = &OBJC_IVAR___QLDownloadingItemViewController__nonCancelableDownloadingState;
      if (v7) {
        uint64_t v8 = &OBJC_IVAR___QLDownloadingItemViewController__cancelableDownloadingState;
      }
      [(QLDetailItemViewController *)self setState:*(Class *)((char *)&self->super.super.super.super.super.isa + *v8) animated:v4];
    }
    else
    {
      if (self->_downloaded) {
        uint64_t v9 = 1232;
      }
      else {
        uint64_t v9 = 1208;
      }
      [(QLDetailItemViewController *)self setState:*(Class *)((char *)&self->super.super.super.super.super.isa + v9) animated:a4];
    }
    double v10 = 1.0;
    if (!self->_downloaded) {
      double v10 = 0.0;
    }
    [(QLDownloadingItemViewController *)self _updateFileSizeWithProgress:0 animated:v10];
  }
}

- (void)_presentConnectivityAlert
{
  id v3 = [(QLItemViewController *)self delegate];
  [v3 previewItemViewControllerWantsToShowNoInternetConnectivityAlert:self];
}

- (void)_startDownloadOperation
{
  id v3 = objc_opt_new();
  [(QLItem *)self->_previewItem transformerClass];
  BOOL v4 = objc_opt_new();
  if (objc_opt_respondsToSelector()) {
    [v3 addObject:objc_opt_class()];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 addObject:objc_opt_class()];
  }
  objc_initWeak(&location, self);
  v5 = [(QLItem *)self->_previewItem fetcher];
  int v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke;
  v9[3] = &unk_2642F72B0;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke_3;
  v7[3] = &unk_2642F7300;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [v5 fetchContentWithAllowedOutputClasses:v3 inQueue:v6 updateBlock:v9 completionBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  QLRunInMainThread();

  objc_destroyWeak(&v5);
}

void __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) floatValue];
  [WeakRetained _updateFileSizeWithProgress:1 animated:v2];
}

void __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  QLRunInMainThread();
  objc_destroyWeak(&v9);
}

void __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32) || *(void *)(a1 + 40))
  {
    float v2 = (NSObject **)MEMORY[0x263F62940];
    id v3 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v20 = 138412290;
      uint64_t v21 = v4;
      _os_log_impl(&dword_217F61000, v3, OS_LOG_TYPE_ERROR, "Error during downloading operation: %@ #Downloading", (uint8_t *)&v20, 0xCu);
    }
    id v5 = [*(id *)(a1 + 40) domain];
    uint64_t v6 = *MEMORY[0x263F07F70];
    if ([v5 isEqualToString:*MEMORY[0x263F07F70]]) {
      BOOL v7 = [*(id *)(a1 + 40) code] == 3072;
    }
    else {
      BOOL v7 = 0;
    }

    id v8 = [*(id *)(a1 + 40) userInfo];
    id v9 = [v8 objectForKey:*MEMORY[0x263F08608]];

    id v10 = [v9 domain];
    if ([v10 isEqualToString:v6])
    {
      uint64_t v11 = [v9 code];

      if (v7)
      {
LABEL_15:
        [*(id *)(a1 + 48) _setDownloading:0 animated:1];
LABEL_17:

        return;
      }
      if (v11 == 4355)
      {
        [*(id *)(a1 + 48) _presentConnectivityAlert];
        goto LABEL_15;
      }
    }
    else
    {

      if (v7) {
        goto LABEL_15;
      }
    }
    [*(id *)(a1 + 48) notifyDelegatesDidFailWithError:*(void *)(a1 + 40)];
    goto LABEL_17;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setDownloaded:1];

  id v13 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v14 = [v13 downloadingDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)(a1 + 56));
    v17 = [v16 downloadingDelegate];
    id v18 = objc_loadWeakRetained((id *)(a1 + 56));
    [v17 downloadingItemViewControllerDidFinishLoadingPreviewItem:v18 withContents:*(void *)(a1 + 32)];
  }
  v19 = *(void **)(a1 + 48);

  [v19 _setDownloading:0 animated:1];
}

- (QLRoundProgressView)progressView
{
  return self->_progressView;
}

- (QLDownloadingItemViewControllerDelegate)downloadingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadingDelegate);

  return (QLDownloadingItemViewControllerDelegate *)WeakRetained;
}

- (void)setDownloadingDelegate:(id)a3
{
}

- (BOOL)downloaded
{
  return self->_downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (BOOL)showsLoadingPreviewSpinner
{
  return self->_showsLoadingPreviewSpinner;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_downloadingDelegate);
  objc_storeStrong((id *)&self->_previewItem, 0);
  objc_storeStrong((id *)&self->_cloudImage, 0);
  objc_storeStrong((id *)&self->_downloadImageView, 0);
  objc_storeStrong((id *)&self->_previewLoadingState, 0);
  objc_storeStrong((id *)&self->_completedDownloadState, 0);
  objc_storeStrong((id *)&self->_nonCancelableDownloadingState, 0);
  objc_storeStrong((id *)&self->_cancelableDownloadingState, 0);
  objc_storeStrong((id *)&self->_readyForDownloadState, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong(&self->_progressSubscriber, 0);
}

@end