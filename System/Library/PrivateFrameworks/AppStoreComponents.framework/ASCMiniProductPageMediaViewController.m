@interface ASCMiniProductPageMediaViewController
+ (id)log;
- (ASCMiniProductPageMediaViewController)initWithScreenshots:(id)a3 selectedIndex:(unint64_t)a4;
- (ASCPendingPromises)pendingArtworkPromises;
- (ASCPresenterContext)context;
- (ASCScreenshots)screenshots;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSMutableDictionary)loadedImages;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)artworkForDisplay;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)selectedIndex;
- (void)adjustEdgeInsets;
- (void)performFollowUpWork:(id)a3;
- (void)performScreenshotsFetch;
- (void)screenshotArtwork:(id)a3 didFailFetchWithError:(id)a4 atIndex:(unint64_t)a5;
- (void)screenshotArtwork:(id)a3 didFetchImage:(id)a4 atIndex:(int64_t)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation ASCMiniProductPageMediaViewController

+ (id)log
{
  if (log_onceToken_5 != -1) {
    dispatch_once(&log_onceToken_5, &__block_literal_global_17);
  }
  v2 = (void *)log_log_5;

  return v2;
}

uint64_t __44__ASCMiniProductPageMediaViewController_log__block_invoke()
{
  log_log_5 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCMiniProductPageMediaViewController");

  return MEMORY[0x1F41817F8]();
}

- (ASCMiniProductPageMediaViewController)initWithScreenshots:(id)a3 selectedIndex:(unint64_t)a4
{
  id v7 = a3;
  v8 = objc_alloc_init(ASCMiniProductPageMediaFlowLayout);
  +[ASCMediaCollectionViewCell minimumLineSpacing];
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v8, "setMinimumLineSpacing:");
  v9 = [(ASCMiniProductPageMediaViewController *)self initWithCollectionViewLayout:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_screenshots, a3);
    uint64_t v11 = +[ASCPresenterContext sharedContext];
    context = v10->_context;
    v10->_context = (ASCPresenterContext *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v14 = [(ASCScreenshots *)v10->_screenshots artwork];
    uint64_t v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));
    loadedImages = v10->_loadedImages;
    v10->_loadedImages = (NSMutableDictionary *)v15;

    v17 = objc_alloc_init(ASCPendingPromises);
    pendingArtworkPromises = v10->_pendingArtworkPromises;
    v10->_pendingArtworkPromises = v17;

    v10->_selectedIndex = a4;
    [(ASCMiniProductPageMediaViewController *)v10 setInstallsStandardGestureForInteractiveMovement:0];
    v19 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v20 = [(ASCMiniProductPageMediaViewController *)v10 collectionView];
    [v20 setBackgroundColor:v19];

    v21 = [(ASCMiniProductPageMediaViewController *)v10 collectionView];
    [v21 setAllowsSelection:0];

    v22 = [(ASCMiniProductPageMediaViewController *)v10 collectionView];
    [v22 setAlwaysBounceHorizontal:1];

    double v23 = *MEMORY[0x1E4FB2EE8];
    v24 = [(ASCMiniProductPageMediaViewController *)v10 collectionView];
    [v24 setDecelerationRate:v23];

    v25 = [(ASCMiniProductPageMediaViewController *)v10 collectionView];
    [v25 setShowsHorizontalScrollIndicator:0];

    v26 = [(ASCMiniProductPageMediaViewController *)v10 collectionView];
    [v26 setRemembersLastFocusedIndexPath:1];

    v27 = [(ASCMiniProductPageMediaViewController *)v10 collectionView];
    [v27 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ASCMiniProductPageMediaViewCellIdentifier"];

    v28 = (void *)MEMORY[0x1E4FB13F0];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __75__ASCMiniProductPageMediaViewController_initWithScreenshots_selectedIndex___block_invoke;
    v36[3] = &unk_1E645E648;
    v29 = v10;
    v37 = v29;
    v30 = [v28 actionWithHandler:v36];
    v31 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 primaryAction:v30];
    v32 = [(ASCMiniProductPageMediaViewController *)v29 navigationItem];
    [v32 setRightBarButtonItem:v31];

    v34 = ASCLocalizedString(@"MINI_PRODUCT_PAGE_SCREENSHOT_SHEET_TITLE", v33);
    [(ASCMiniProductPageMediaViewController *)v29 setTitle:v34];

    [(ASCMiniProductPageMediaViewController *)v29 adjustEdgeInsets];
  }

  return v10;
}

uint64_t __75__ASCMiniProductPageMediaViewController_initWithScreenshots_selectedIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ASCMiniProductPageMediaViewController;
  [(ASCMiniProductPageMediaViewController *)&v11 viewIsAppearing:a3];
  [(ASCMiniProductPageMediaViewController *)self performScreenshotsFetch];
  if (([(ASCMiniProductPageMediaViewController *)self selectedIndex] & 0x8000000000000000) == 0)
  {
    unint64_t v4 = [(ASCMiniProductPageMediaViewController *)self selectedIndex];
    v5 = [(ASCMiniProductPageMediaViewController *)self screenshots];
    v6 = [v5 artwork];
    unint64_t v7 = [v6 count];

    if (v4 < v7)
    {
      v8 = [(ASCMiniProductPageMediaViewController *)self view];
      [v8 layoutIfNeeded];

      v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[ASCMiniProductPageMediaViewController selectedIndex](self, "selectedIndex"), 0);
      v10 = [(ASCMiniProductPageMediaViewController *)self collectionView];
      [v10 scrollToItemAtIndexPath:v9 atScrollPosition:16 animated:0];
    }
  }
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 12.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)adjustEdgeInsets
{
  double v3 = [(ASCMiniProductPageMediaViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = [(ASCMiniProductPageMediaViewController *)self view];
  id v7 = v5;
  double v6 = 8.0;
  if (v4 == 1) {
    double v6 = 36.0;
  }
  objc_msgSend(v5, "setLayoutMargins:", 8.0, v6, 8.0, v6);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(ASCMiniProductPageMediaViewController *)self collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"ASCMiniProductPageMediaViewCellIdentifier" forIndexPath:v5];

  v8 = [(ASCMiniProductPageMediaViewController *)self screenshots];
  v9 = [v8 artwork];
  v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));

  objc_super v11 = [(ASCMiniProductPageMediaViewController *)self loadedImages];
  v12 = [v11 objectForKeyedSubscript:v5];

  id v13 = [ASCScreenshotDisplayConfiguration alloc];
  v14 = [(ASCMiniProductPageMediaViewController *)self screenshots];
  uint64_t v15 = [v14 mediaPlatform];
  v16 = [v15 deviceCornerRadiusFactor];
  v17 = [(ASCScreenshotDisplayConfiguration *)v13 initWithDeviceCornerRadiusFactor:v16];

  [v7 applyArtwork:v10 image:v12 screenshotDisplayConfiguration:v17];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(ASCMiniProductPageMediaViewController *)self screenshots];
  id v5 = [v4 artwork];
  int64_t v6 = [v5 count];

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  unint64_t v7 = [v6 item];
  v8 = [(ASCMiniProductPageMediaViewController *)self artworkForDisplay];
  unint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    v27 = +[ASCMiniProductPageMediaViewController log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v30 = 138543362;
      v31 = self;
      _os_log_impl(&dword_1C2B8D000, v27, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", (uint8_t *)&v30, 0xCu);
    }

    double v26 = *MEMORY[0x1E4F1DB30];
    double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    v10 = [(ASCMiniProductPageMediaViewController *)self artworkForDisplay];
    objc_super v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

    v12 = [(ASCMiniProductPageMediaViewController *)self view];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    v17 = [(ASCMiniProductPageMediaViewController *)self view];
    [v17 layoutMargins];
    double v20 = v14 - (v18 + v19);
    double v23 = v16 - (v21 + v22);

    v24 = [(ASCMiniProductPageMediaViewController *)self traitCollection];
    +[ASCMediaCollectionViewCell sizeForArtwork:thatFits:usingTraitCollection:](ASCMediaCollectionViewCell, "sizeForArtwork:thatFits:usingTraitCollection:", v11, v24, v20, v23);
    double v26 = v25;
  }
  double v28 = v26;
  double v29 = v23;
  result.height = v29;
  result.width = v28;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(ASCMiniProductPageMediaViewController *)self screenshots];
  objc_super v11 = [v10 artwork];
  uint64_t v12 = [v11 count] - 1;

  double v13 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a5];
  [(ASCMiniProductPageMediaViewController *)self collectionView:v9 layout:v8 sizeForItemAtIndexPath:v13];
  double v15 = v14;

  double v16 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 inSection:a5];
  [(ASCMiniProductPageMediaViewController *)self collectionView:v9 layout:v8 sizeForItemAtIndexPath:v16];
  double v18 = v17;

  [v9 bounds];
  double v20 = (v19 - v15) * 0.5;
  [v9 bounds];
  double v22 = v21;

  double v23 = (v22 - v18) * 0.5;
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = v20;
  result.right = v23;
  result.bottom = v25;
  result.left = v26;
  result.top = v24;
  return result;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 bounds];
  double v8 = v6 + v7 * 0.5;
  [v4 bounds];
  double v10 = v9;

  objc_super v11 = [(ASCMiniProductPageMediaViewController *)self collectionView];
  objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10 * 0.5);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = v13;
  if (v13)
  {
    -[ASCMiniProductPageMediaViewController setSelectedIndex:](self, "setSelectedIndex:", [v13 item]);
    uint64_t v12 = v13;
  }
}

- (id)artworkForDisplay
{
  double v2 = [(ASCMiniProductPageMediaViewController *)self screenshots];
  double v3 = +[__ASCLayoutProxy artworkFrom:v2 and:0];

  return v3;
}

- (void)performScreenshotsFetch
{
  double v3 = [(ASCMiniProductPageMediaViewController *)self artworkForDisplay];
  id v4 = [(ASCMiniProductPageMediaViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke;
  v6[3] = &unk_1E645E6A0;
  v6[4] = self;
  v6[5] = v5;
  [v3 enumerateObjectsUsingBlock:v6];
}

void __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = [*(id *)(a1 + 32) collectionView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  if (([v5 isPortrait] & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      double v12 = v10;
    }
    else {
      double v12 = v8;
    }
    if (!v11) {
      double v8 = v10;
    }
    double v10 = v12;
  }
  id v13 = [*(id *)(a1 + 32) context];
  double v14 = [v13 artworkFetcher];
  double v15 = objc_msgSend(v14, "imageForContentsOfArtwork:withSize:", v5, v8, v10);

  double v16 = [*(id *)(a1 + 32) pendingArtworkPromises];
  [v16 addPromise:v15];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke_2;
  v23[3] = &unk_1E645E678;
  id v17 = v5;
  double v18 = *(void **)(a1 + 40);
  id v24 = v17;
  v25[1] = v18;
  objc_copyWeak(v25, &location);
  v25[2] = a3;
  [v15 addSuccessBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke_3;
  v20[3] = &unk_1E645DFD0;
  objc_copyWeak(v22, &location);
  id v19 = v17;
  id v21 = v19;
  v22[1] = a3;
  [v15 addErrorBlock:v20];

  objc_destroyWeak(v22);
  objc_destroyWeak(v25);

  objc_destroyWeak(&location);
}

void __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) isPortrait] & 1) == 0 && !*(void *)(a1 + 48))
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1818]);
    id v4 = v7;
    uint64_t v5 = [v4 CGImage];
    [v4 scale];
    id v7 = (id)objc_msgSend(v3, "initWithCGImage:scale:orientation:", v5, 2);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained screenshotArtwork:*(void *)(a1 + 32) didFetchImage:v7 atIndex:*(void *)(a1 + 56)];
}

void __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained screenshotArtwork:*(void *)(a1 + 32) didFailFetchWithError:v4 atIndex:*(void *)(a1 + 48)];
}

- (void)performFollowUpWork:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F29060];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)screenshotArtwork:(id)a3 didFetchImage:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__ASCMiniProductPageMediaViewController_screenshotArtwork_didFetchImage_atIndex___block_invoke;
  v12[3] = &unk_1E645E020;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(ASCMiniProductPageMediaViewController *)self performFollowUpWork:v12];
}

void __81__ASCMiniProductPageMediaViewController_screenshotArtwork_didFetchImage_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) artworkForDisplay];
  unint64_t v3 = *(void *)(a1 + 56);
  if (v3 < [v2 count])
  {
    id v4 = [v2 objectAtIndexedSubscript:*(void *)(a1 + 56)];
    uint64_t v5 = v4;
    double v6 = *(NSObject **)(a1 + 40);
    if (v4) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (v4 == v6)
      {
LABEL_13:
        id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(a1 + 56) inSection:0];
        uint64_t v11 = *(void *)(a1 + 48);
        double v12 = [*(id *)(a1 + 32) loadedImages];
        [v12 setObject:v11 forKeyedSubscript:v8];

        id v13 = [*(id *)(a1 + 32) collectionView];
        int64_t v15 = v8;
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        [v13 reloadItemsAtIndexPaths:v14];

LABEL_14:
        goto LABEL_15;
      }
    }
    else if (-[NSObject isEqual:](v4, "isEqual:"))
    {
      goto LABEL_13;
    }
    id v8 = +[ASCMiniProductPageMediaViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1C2B8D000, v8, OS_LOG_TYPE_INFO, "%{public}@: Ignoring screenshot artwork for mismatched lockup", buf, 0xCu);
    }
    goto LABEL_14;
  }
  uint64_t v5 = +[ASCMiniProductPageMediaViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", buf, 0xCu);
  }
LABEL_15:
}

- (void)screenshotArtwork:(id)a3 didFailFetchWithError:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__ASCMiniProductPageMediaViewController_screenshotArtwork_didFailFetchWithError_atIndex___block_invoke;
  v9[3] = &unk_1E645E048;
  id v10 = v7;
  unint64_t v11 = a5;
  v9[4] = self;
  id v8 = v7;
  [(ASCMiniProductPageMediaViewController *)self performFollowUpWork:v9];
}

void __89__ASCMiniProductPageMediaViewController_screenshotArtwork_didFailFetchWithError_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) artworkForDisplay];
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 < [v2 count])
  {
    id v4 = [v2 objectAtIndexedSubscript:*(void *)(a1 + 48)];
    uint64_t v5 = v4;
    double v6 = *(NSObject **)(a1 + 40);
    if (v4) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (v4 == v6)
      {
LABEL_13:
        id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(a1 + 48) inSection:0];
        unint64_t v11 = [*(id *)(a1 + 32) loadedImages];
        [v11 setObject:0 forKeyedSubscript:v8];

        double v12 = [*(id *)(a1 + 32) collectionView];
        id v14 = v8;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
        [v12 reloadItemsAtIndexPaths:v13];

LABEL_14:
        goto LABEL_15;
      }
    }
    else if (-[NSObject isEqual:](v4, "isEqual:"))
    {
      goto LABEL_13;
    }
    id v8 = +[ASCMiniProductPageMediaViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1C2B8D000, v8, OS_LOG_TYPE_INFO, "%{public}@: Ignoring screenshot artwork for mismatched lockup", buf, 0xCu);
    }
    goto LABEL_14;
  }
  uint64_t v5 = +[ASCMiniProductPageMediaViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", buf, 0xCu);
  }
LABEL_15:
}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (ASCPresenterContext)context
{
  return self->_context;
}

- (ASCPendingPromises)pendingArtworkPromises
{
  return self->_pendingArtworkPromises;
}

- (NSMutableDictionary)loadedImages
{
  return self->_loadedImages;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedImages, 0);
  objc_storeStrong((id *)&self->_pendingArtworkPromises, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end