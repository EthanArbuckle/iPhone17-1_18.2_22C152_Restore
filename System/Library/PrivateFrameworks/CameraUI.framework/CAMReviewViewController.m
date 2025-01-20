@interface CAMReviewViewController
- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (BOOL)assetExplorerReviewScreenViewController:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (CAMCameraReviewDelegate)reviewDelegate;
- (CAMReviewViewController)initWithAssets:(id)a3;
- (CAMReviewViewController)initWithCoder:(id)a3;
- (CAMReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)_initialAssets;
- (PUAssetExplorerReviewScreenViewController)_internalReviewViewController;
- (PUReviewAssetsDataSourceManager)_internalReviewDataSourceManager;
- (PUReviewAssetsMediaProvider)_internalReviewMediaProvider;
- (PUReviewDataSource)_reviewDataSource;
- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7;
- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3;
- (void)assetExplorerReviewScreenViewControllerDidPressRetake:(id)a3;
- (void)loadView;
- (void)setReviewDelegate:(id)a3;
@end

@implementation CAMReviewViewController

- (CAMReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CAMReviewViewController initWithAssets:](self, "initWithAssets:", 0, a4);
}

- (CAMReviewViewController)initWithCoder:(id)a3
{
  return [(CAMReviewViewController *)self initWithAssets:MEMORY[0x263EFFA68]];
}

- (CAMReviewViewController)initWithAssets:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CAMReviewViewController;
  v5 = [(CAMReviewViewController *)&v30 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    initialAssets = v5->__initialAssets;
    v5->__initialAssets = (NSArray *)v6;

    id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v26 + 1) + 8 * v13) identifier];
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }

    v15 = (PUReviewDataSource *)objc_alloc_init(MEMORY[0x263F5E460]);
    reviewDataSource = v5->__reviewDataSource;
    v5->__reviewDataSource = v15;

    [(PUReviewDataSource *)v5->__reviewDataSource insertAssets:v9];
    uint64_t v17 = [objc_alloc(MEMORY[0x263F5E450]) initWithReviewDataSource:v5->__reviewDataSource];
    internalReviewDataSourceManager = v5->__internalReviewDataSourceManager;
    v5->__internalReviewDataSourceManager = (PUReviewAssetsDataSourceManager *)v17;

    v19 = (PUReviewAssetsMediaProvider *)objc_alloc_init(MEMORY[0x263F5E458]);
    internalReviewMediaProvider = v5->__internalReviewMediaProvider;
    v5->__internalReviewMediaProvider = v19;

    v21 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
    uint64_t v22 = [objc_alloc(MEMORY[0x263F5E3C8]) initWithDataSourceManager:v5->__internalReviewDataSourceManager mediaProvider:v5->__internalReviewMediaProvider reviewAssetProvider:0 initialIndexPath:v21 initialSelectedAssetUUIDs:v8 initialDisabledLivePhotoAssetUUIDs:0 sourceType:2];
    internalReviewViewController = v5->__internalReviewViewController;
    v5->__internalReviewViewController = (PUAssetExplorerReviewScreenViewController *)v22;

    [(PUAssetExplorerReviewScreenViewController *)v5->__internalReviewViewController setDelegate:v5];
    v24 = v5;
  }
  return v5;
}

- (void)loadView
{
  v3 = [CAMReviewViewControllerContainerView alloc];
  uint64_t v6 = -[CAMReviewViewControllerContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v4 = [(CAMReviewViewController *)self _internalReviewViewController];
  [(CAMReviewViewController *)self addChildViewController:v4];
  v5 = [v4 view];
  [(CAMReviewViewControllerContainerView *)v6 setReviewView:v5];
  [v4 didMoveToParentViewController:self];
  [(CAMReviewViewController *)self setView:v6];
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  return (a4 < 7) & (0x67u >> a4);
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  BOOL result = 0;
  if (a4 <= 6)
  {
    if (((1 << a4) & 0x65) != 0)
    {
      return 1;
    }
    else if (a4 == 1)
    {
      return objc_msgSend(a5, "isTemporaryPlaceholder", a3, v6, v7) ^ 1;
    }
  }
  return result;
}

- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3
{
  uint64_t v4 = [(CAMReviewViewController *)self reviewDelegate];
  if (v4)
  {
    v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 reviewViewControllerDidCancelReview:self];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)assetExplorerReviewScreenViewControllerDidPressRetake:(id)a3
{
  uint64_t v4 = [(CAMReviewViewController *)self reviewDelegate];
  if (v4)
  {
    v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 reviewViewControllerDidRequestRetake:self];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a7;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v23 = self;
  uint64_t v12 = [(CAMReviewViewController *)self _initialAssets];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = [v17 uuid];
        if ([v9 containsObject:v18])
        {
          v19 = [v10 objectForKeyedSubscript:v18];
          if (v19) {
            v20 = v19;
          }
          else {
            v20 = v17;
          }
          [v11 addObject:v20];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }
  v21 = (void *)[v11 copy];
  uint64_t v22 = [(CAMReviewViewController *)v23 reviewDelegate];
  if (v22 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v22 reviewViewController:v23 didFinishReviewingAssets:v21];
  }
}

- (CAMCameraReviewDelegate)reviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reviewDelegate);
  return (CAMCameraReviewDelegate *)WeakRetained;
}

- (void)setReviewDelegate:(id)a3
{
}

- (NSArray)_initialAssets
{
  return self->__initialAssets;
}

- (PUReviewDataSource)_reviewDataSource
{
  return self->__reviewDataSource;
}

- (PUReviewAssetsDataSourceManager)_internalReviewDataSourceManager
{
  return self->__internalReviewDataSourceManager;
}

- (PUReviewAssetsMediaProvider)_internalReviewMediaProvider
{
  return self->__internalReviewMediaProvider;
}

- (PUAssetExplorerReviewScreenViewController)_internalReviewViewController
{
  return self->__internalReviewViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalReviewViewController, 0);
  objc_storeStrong((id *)&self->__internalReviewMediaProvider, 0);
  objc_storeStrong((id *)&self->__internalReviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->__reviewDataSource, 0);
  objc_storeStrong((id *)&self->__initialAssets, 0);
  objc_destroyWeak((id *)&self->_reviewDelegate);
}

@end