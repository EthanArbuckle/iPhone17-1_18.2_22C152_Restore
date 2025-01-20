@interface HUWallpaperPhotoCollectionViewController
- (BOOL)initialScrollToBottom;
- (HUWallpaperPhotoCollectionFlowLayout)flowLayout;
- (HUWallpaperPhotoCollectionViewController)initWithTitle:(id)a3 fetchResult:(id)a4 assetCollectionSubtype:(int64_t)a5 delegate:(id)a6;
- (HUWallpaperPhotoCollectionViewControllerDelegate)delegate;
- (NAFuture)imageDownloadFuture;
- (PHCachingImageManager)imageManager;
- (PHFetchResult)assetsFetchResult;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)imageFutureForAsset:(id)a3 cloudAllowed:(BOOL)a4;
- (int64_t)assetCollectionSubtype;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)setAssetsFetchResult:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setImageDownloadFuture:(id)a3;
- (void)setImageManager:(id)a3;
- (void)setInitialScrollToBottom:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUWallpaperPhotoCollectionViewController

- (HUWallpaperPhotoCollectionViewController)initWithTitle:(id)a3 fetchResult:(id)a4 assetCollectionSubtype:(int64_t)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [[HUWallpaperPhotoCollectionFlowLayout alloc] initWithAssetCollectionSubtype:a5];
  if ((unint64_t)[v11 count] >= 0x33)
  {
    v14 = [HUWallpaperPhotoCollectionFooterView alloc];
    v15 = -[HUWallpaperPhotoCollectionFooterView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v16 = [v11 count];
    v23 = HULocalizedStringWithFormat(@"HUWallpaperPhotoCollectionViewControllerFooterFormat", @"%lu", v17, v18, v19, v20, v21, v22, v16);
    v24 = [(HUWallpaperPhotoCollectionFooterView *)v15 label];
    [v24 setText:v23];

    -[HUWallpaperPhotoCollectionFooterView systemLayoutSizeFittingSize:](v15, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
    -[UICollectionViewFlowLayout setFooterReferenceSize:](v13, "setFooterReferenceSize:");
  }
  v30.receiver = self;
  v30.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  v25 = [(HUWallpaperPhotoCollectionViewController *)&v30 initWithCollectionViewLayout:v13];
  v26 = v25;
  if (v25)
  {
    objc_storeWeak((id *)&v25->_flowLayout, v13);
    v27 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E4F38FB0]);
    imageManager = v26->_imageManager;
    v26->_imageManager = v27;

    objc_storeStrong((id *)&v26->_assetsFetchResult, a4);
    objc_storeWeak((id *)&v26->_delegate, v12);
    v26->_initialScrollToBottom = 1;
    v26->_assetCollectionSubtype = a5;
    [(HUWallpaperPhotoCollectionViewController *)v26 setTitle:v10];
  }

  return v26;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  [(HUWallpaperPhotoCollectionViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  [(HUWallpaperPhotoCollectionViewController *)&v20 viewDidLoad];
  v3 = [(HUWallpaperPhotoCollectionViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellWithReuseIdentifier:v6];

  v7 = [(HUWallpaperPhotoCollectionViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = *MEMORY[0x1E4F43750];
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v7 registerClass:v8 forSupplementaryViewOfKind:v9 withReuseIdentifier:v11];

  id v12 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v13 = [(HUWallpaperPhotoCollectionViewController *)self collectionView];
  [v13 setBackgroundColor:v12];

  v14 = [(HUWallpaperPhotoCollectionViewController *)self collectionView];
  [v14 setAlwaysBounceVertical:1];

  int64_t v15 = [(HUWallpaperPhotoCollectionViewController *)self assetCollectionSubtype];
  uint64_t v16 = [(HUWallpaperPhotoCollectionViewController *)self collectionView];
  uint64_t v17 = v16;
  double v18 = 8.0;
  if (v15 != 201) {
    double v18 = 0.0;
  }
  objc_msgSend(v16, "setContentInset:", 8.0, v18, 8.0, v18);

  uint64_t v19 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
  [v19 registerChangeObserver:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  [(HUWallpaperPhotoCollectionViewController *)&v5 viewWillDisappear:a3];
  uint64_t v4 = [(HUWallpaperPhotoCollectionViewController *)self imageDownloadFuture];
  [v4 cancel];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)HUWallpaperPhotoCollectionViewController;
  [(HUWallpaperPhotoCollectionViewController *)&v7 viewDidLayoutSubviews];
  if ([(HUWallpaperPhotoCollectionViewController *)self initialScrollToBottom])
  {
    v3 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v4 = [(HUWallpaperPhotoCollectionViewController *)self collectionView];
    objc_super v5 = objc_msgSend(v3, "indexPathForItem:inSection:", objc_msgSend(v4, "numberOfItemsInSection:", 0) - 1, 0);

    v6 = [(HUWallpaperPhotoCollectionViewController *)self collectionView];
    [v6 scrollToItemAtIndexPath:v5 atScrollPosition:4 animated:0];

    [(HUWallpaperPhotoCollectionViewController *)self setInitialScrollToBottom:0];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(HUWallpaperPhotoCollectionViewController *)self assetsFetchResult];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  id v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

  id v11 = [(HUWallpaperPhotoCollectionViewController *)self assetsFetchResult];
  uint64_t v12 = [v6 item];

  v13 = [v11 objectAtIndexedSubscript:v12];

  v14 = [v13 localIdentifier];
  [v10 setAssetIdentifier:v14];

  int64_t v15 = [(HUWallpaperPhotoCollectionViewController *)self flowLayout];
  [v15 itemSize];
  double v17 = v16;
  double v18 = [MEMORY[0x1E4F42D90] mainScreen];
  [v18 scale];
  double v20 = v17 * v19;
  uint64_t v21 = [(HUWallpaperPhotoCollectionViewController *)self flowLayout];
  [v21 itemSize];
  double v23 = v22;
  v24 = [MEMORY[0x1E4F42D90] mainScreen];
  [v24 scale];
  double v26 = v23 * v25;

  v27 = [(HUWallpaperPhotoCollectionViewController *)self imageManager];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __82__HUWallpaperPhotoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v33[3] = &unk_1E6391D70;
  id v28 = v10;
  id v34 = v28;
  v35 = v13;
  id v29 = v13;
  objc_msgSend(v27, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v29, 0, 0, v33, v20, v26);

  objc_super v30 = v35;
  id v31 = v28;

  return v31;
}

void __82__HUWallpaperPhotoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) assetIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) localIdentifier];
  int v5 = [v3 isEqualToString:v4];

  if (v5) {
    [*(id *)(a1 + 32) setImage:v6];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  uint64_t v9 = *MEMORY[0x1E4F43750];
  id v10 = a5;
  id v11 = a3;
  if (([v8 isEqualToString:v9] & 1) == 0) {
    NSLog(&cfstr_AskedForAViewF.isa, v8);
  }
  uint64_t v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v11 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v13 forIndexPath:v10];

  int64_t v15 = [(HUWallpaperPhotoCollectionViewController *)self assetsFetchResult];
  uint64_t v16 = [v15 count];
  double v23 = HULocalizedStringWithFormat(@"HUWallpaperPhotoCollectionCount", @"%ld", v17, v18, v19, v20, v21, v22, v16);
  v24 = [v14 label];
  [v24 setText:v23];

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectItemAtIndexPath:v7 animated:1];
  [v6 setAllowsSelection:0];
  objc_opt_class();
  id v8 = [(HUWallpaperPhotoCollectionViewController *)self collectionView];
  uint64_t v9 = [v8 cellForItemAtIndexPath:v7];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [(HUWallpaperPhotoCollectionViewController *)self assetsFetchResult];
  v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  objc_initWeak(location, self);
  v14 = [(HUWallpaperPhotoCollectionViewController *)self imageFutureForAsset:v13 cloudAllowed:0];
  int64_t v15 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  uint64_t v16 = [v14 reschedule:v15];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v33[3] = &unk_1E6391D98;
  objc_copyWeak(&v36, location);
  id v17 = v11;
  id v34 = v17;
  id v18 = v13;
  id v35 = v18;
  uint64_t v19 = [v16 recover:v33];
  [(HUWallpaperPhotoCollectionViewController *)self setImageDownloadFuture:v19];

  uint64_t v20 = [(HUWallpaperPhotoCollectionViewController *)self imageDownloadFuture];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_64;
  v30[3] = &unk_1E6391DC0;
  id v21 = v6;
  id v31 = v21;
  id v22 = v17;
  id v32 = v22;
  id v23 = (id)[v20 addCompletionBlock:v30];

  v24 = [(HUWallpaperPhotoCollectionViewController *)self imageDownloadFuture];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v27[3] = &unk_1E6391DE8;
  objc_copyWeak(&v29, location);
  id v25 = v18;
  id v28 = v25;
  id v26 = (id)[v24 addSuccessBlock:v27];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v36);
  objc_destroyWeak(location);
}

id __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = [v3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    [*(id *)(a1 + 32) setBusy:1];
    id v8 = [WeakRetained imageFutureForAsset:*(void *)(a1 + 40) cloudAllowed:1];
    uint64_t v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    id v10 = [v8 reschedule:v9];
  }
  else
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      v14 = [v3 userInfo];
      int64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      int v16 = 138412546;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "Failed to load image for asset %@ with error %@", (uint8_t *)&v16, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F7A0D8] futureWithError:v3];
  }

  return v10;
}

uint64_t __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_64(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllowsSelection:1];
  v2 = *(void **)(a1 + 40);

  return [v2 setBusy:0];
}

void __84__HUWallpaperPhotoCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = objc_alloc(MEMORY[0x1E4F69778]);
  int v7 = [*(id *)(a1 + 32) localIdentifier];
  id v8 = (void *)[v6 initWithType:1 assetIdentifier:v7 cropInfo:0];

  uint64_t v9 = [MEMORY[0x1E4F69780] sharedInstance];
  id v11 = [v9 processOriginalImageFromWallpaper:v8 originalImage:v4];

  id v10 = [WeakRetained delegate];
  [v10 photoCollectionController:WeakRetained didChooseWallpaper:v8 image:v11];
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__HUWallpaperPhotoCollectionViewController_photoLibraryDidChange___block_invoke;
  v6[3] = &unk_1E63850E0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __66__HUWallpaperPhotoCollectionViewController_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) assetsFetchResult];
  id v7 = [v2 changeDetailsForFetchResult:v3];

  id v4 = v7;
  if (v7)
  {
    id v5 = [v7 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setAssetsFetchResult:v5];

    id v6 = [*(id *)(a1 + 40) collectionView];
    [v6 reloadData];

    id v4 = v7;
  }
}

- (id)imageFutureForAsset:(id)a3 cloudAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F390D8];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setDeliveryMode:1];
  [v8 setNetworkAccessAllowed:v4];
  id v9 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v10 = [(HUWallpaperPhotoCollectionViewController *)self imageManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__HUWallpaperPhotoCollectionViewController_imageFutureForAsset_cloudAllowed___block_invoke;
  v13[3] = &unk_1E6389518;
  id v11 = v9;
  id v14 = v11;
  objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v8, v13, *MEMORY[0x1E4F396D8], *(double *)(MEMORY[0x1E4F396D8] + 8));

  return v11;
}

void __77__HUWallpaperPhotoCollectionViewController_imageFutureForAsset_cloudAllowed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v13 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithResult:a2];
  }
  else
  {
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v8;

    id v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = [v9 domain];
    uint64_t v12 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(v9, "code"), v13);

    [*(id *)(a1 + 32) finishWithError:v12];
  }
}

- (HUWallpaperPhotoCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUWallpaperPhotoCollectionViewControllerDelegate *)WeakRetained;
}

- (int64_t)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

- (HUWallpaperPhotoCollectionFlowLayout)flowLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowLayout);

  return (HUWallpaperPhotoCollectionFlowLayout *)WeakRetained;
}

- (void)setFlowLayout:(id)a3
{
}

- (PHCachingImageManager)imageManager
{
  return self->_imageManager;
}

- (void)setImageManager:(id)a3
{
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (void)setAssetsFetchResult:(id)a3
{
}

- (NAFuture)imageDownloadFuture
{
  return self->_imageDownloadFuture;
}

- (void)setImageDownloadFuture:(id)a3
{
}

- (BOOL)initialScrollToBottom
{
  return self->_initialScrollToBottom;
}

- (void)setInitialScrollToBottom:(BOOL)a3
{
  self->_initialScrollToBottom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDownloadFuture, 0);
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_destroyWeak((id *)&self->_flowLayout);

  objc_destroyWeak((id *)&self->_delegate);
}

@end