@interface AEExplorerViewController
- (AECameraAssetPackageGenerator)_cameraPackageGenerator;
- (AEExplorerViewController)initWithPackageTransport:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 additionalGestureRecognizers:(id)a6;
- (AEExplorerViewControllerDelegate)delegate;
- (AEPackageTransport)_packageTransport;
- (AEProgressViewModel)_progressModel;
- (BOOL)_fakeAllCloudAndVideo;
- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (BOOL)confirmAsset:(id)a3 matchesView:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)layout:(id)a3 shouldShowCloudDecorationAtIndexPath:(PXSimpleIndexPath *)a4;
- (BOOL)layout:(id)a3 shouldShowLoopDecorationAtIndexPath:(PXSimpleIndexPath *)a4;
- (BOOL)layout:(id)a3 shouldShowVideoDecorationAtIndexPath:(PXSimpleIndexPath *)a4;
- (CAMCameraReviewAdapter)_cameraReviewAdapter;
- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4;
- (CGSize)_maximumThumbnailSize;
- (Class)assetsSceneClass;
- (NSArray)_clientGestureRecognizers;
- (NSIndexSet)_missingThumbnailAssetIndexes;
- (NSIndexSet)_pendingMissingThumbnailAssetIndexes;
- (NSMutableSet)_tilesInUse;
- (PUAssetExplorerReviewScreenViewController)_reviewController;
- (PXAssetsScene)_sceneController;
- (PXBasicUIViewTileAnimator)_tileAnimator;
- (PXMediaProvider)_mediaProvider;
- (PXPhotoKitAssetsDataSourceManager)_dataSourceManager;
- (PXTilingController)_tilingController;
- (PXUIScrollViewController)_scrollViewController;
- (UIView)_previousSuperview;
- (id)_createNewLayoutForDataSource:(id)a3;
- (id)_currentDataSource;
- (id)_presentViewControllerAboveKeyboard:(id)a3 animated:(BOOL)a4;
- (id)_stagedAssetUUIDs;
- (id)_thumbnailResourcesIndexSetForAssets:(id)a3;
- (id)_validateAssetReference:(id)a3 forScrollViewPoint:(CGPoint)a4;
- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4;
- (id)contentAssetReferenceAtPoint:(CGPoint)a3 outContentFrame:(CGRect *)a4;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)scrollView;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4;
- (int64_t)_currentLayoutStyle;
- (int64_t)_layoutStyleForSize:(CGSize)a3;
- (void)_addThumbnailIndexes:(id)a3;
- (void)_attachGestureRecognizersIfNeeded:(void *)a3;
- (void)_cancelExpectedAssetUUIDs:(id)a3;
- (void)_computeInitialResourcesIndexSetAsync;
- (void)_configureReviewControllerWithAssetReference:(id)a3;
- (void)_dismissReviewScreenViewController;
- (void)_dismissViewControllerAboveKeyboardAnimated:(BOOL)a3;
- (void)_handleAttemptedSelectionToggleOfAssetReference:(id)a3 cancelIfAlreadySelected:(BOOL)a4 suppressLivePhotoContent:(BOOL)a5;
- (void)_handleInProgressPackageGenerator:(id)a3 suppressLivePhotoContent:(BOOL)a4 mediaOrigin:(int64_t)a5 completionHandler:(id)a6;
- (void)_handleTransportStagingUpdateWithDataSource:(id)a3;
- (void)_immediatelyGenerateAndStagePackageFromReviewAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5;
- (void)_presentConfidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4;
- (void)_setFakeAllCloudAndVideo:(BOOL)a3;
- (void)_setMissingThumbnailAssetIndexes:(id)a3;
- (void)_setPendingMissingThumbnailAssetIndexes:(id)a3;
- (void)_setPreviousSuperview:(id)a3;
- (void)_setReviewController:(id)a3;
- (void)_setSceneController:(id)a3;
- (void)_setTilingController:(id)a3;
- (void)_stageAsset:(id)a3 withReference:(id)a4 suppressLivePhotoContent:(BOOL)a5 mediaOrigin:(int64_t)a6 completionHandler:(id)a7;
- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7;
- (void)assetsScene:(id)a3 didTransitionToDataSource:(id)a4;
- (void)assetsScene:(id)a3 willTransitionToDataSource:(id)a4;
- (void)associateAsset:(id)a3 withTile:(void *)a4;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)dealloc;
- (void)handleLongPress:(id)a3;
- (void)handleTap:(id)a3;
- (void)loadView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillLayoutSubviews;
@end

@implementation AEExplorerViewController

- (BOOL)confirmAsset:(id)a3 matchesView:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = v5;
  char v7 = 0;
  if (a3 && v5)
  {
    id v8 = a3;
    v9 = [v6 associatedAssetUUID];
    v10 = [v8 uuid];

    char v7 = [v10 isEqualToString:v9];
    if ((v7 & 1) == 0)
    {
      v11 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v13 = 138543874;
        v14 = v10;
        __int16 v15 = 2114;
        v16 = v6;
        __int16 v17 = 2114;
        v18 = v9;
        _os_log_impl(&dword_22B526000, v11, OS_LOG_TYPE_FAULT, "Outgoing asset mismatch. Tried to confirm asset with UUID %{public}@ but view (=%{public}@)'s associated asset UUID is %{public}@", (uint8_t *)&v13, 0x20u);
      }
    }
  }

  return v7;
}

- (void)associateAsset:(id)a3 withTile:(void *)a4
{
  if (a3)
  {
    id v5 = a3;
    id v7 = [a4 view];
    v6 = [v5 uuid];

    [v7 setAssociatedAssetUUID:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reviewController, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__previousSuperview, 0);
  objc_storeStrong((id *)&self->__cameraPackageGenerator, 0);
  objc_storeStrong((id *)&self->__cameraReviewAdapter, 0);
  objc_storeStrong((id *)&self->__progressModel, 0);
  objc_storeStrong((id *)&self->__sceneController, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_storeStrong((id *)&self->__scrollViewController, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__pendingMissingThumbnailAssetIndexes, 0);
  objc_storeStrong((id *)&self->__missingThumbnailAssetIndexes, 0);
  objc_storeStrong((id *)&self->__clientGestureRecognizers, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__dataSourceManager, 0);
  objc_storeStrong((id *)&self->__packageTransport, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setFakeAllCloudAndVideo:(BOOL)a3
{
  self->__fakeAllCloudAndVideo = a3;
}

- (BOOL)_fakeAllCloudAndVideo
{
  return self->__fakeAllCloudAndVideo;
}

- (void)_setReviewController:(id)a3
{
}

- (PUAssetExplorerReviewScreenViewController)_reviewController
{
  return self->__reviewController;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (void)_setPreviousSuperview:(id)a3
{
}

- (UIView)_previousSuperview
{
  return self->__previousSuperview;
}

- (AECameraAssetPackageGenerator)_cameraPackageGenerator
{
  return self->__cameraPackageGenerator;
}

- (CAMCameraReviewAdapter)_cameraReviewAdapter
{
  return self->__cameraReviewAdapter;
}

- (AEProgressViewModel)_progressModel
{
  return self->__progressModel;
}

- (void)_setSceneController:(id)a3
{
}

- (PXAssetsScene)_sceneController
{
  return self->__sceneController;
}

- (void)_setTilingController:(id)a3
{
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (PXUIScrollViewController)_scrollViewController
{
  return self->__scrollViewController;
}

- (PXBasicUIViewTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (void)_setPendingMissingThumbnailAssetIndexes:(id)a3
{
}

- (NSIndexSet)_pendingMissingThumbnailAssetIndexes
{
  return self->__pendingMissingThumbnailAssetIndexes;
}

- (void)_setMissingThumbnailAssetIndexes:(id)a3
{
}

- (NSIndexSet)_missingThumbnailAssetIndexes
{
  return self->__missingThumbnailAssetIndexes;
}

- (NSArray)_clientGestureRecognizers
{
  return (NSArray *)objc_getProperty(self, a2, 1016, 1);
}

- (PXMediaProvider)_mediaProvider
{
  return self->__mediaProvider;
}

- (PXPhotoKitAssetsDataSourceManager)_dataSourceManager
{
  return self->__dataSourceManager;
}

- (AEPackageTransport)_packageTransport
{
  return self->__packageTransport;
}

- (void)setDelegate:(id)a3
{
}

- (AEExplorerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AEExplorerViewControllerDelegate *)WeakRetained;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v7 = [(AEExplorerViewController *)self _sceneController];
  long long v8 = *(_OWORD *)&a4->var1[5];
  long long v18 = *(_OWORD *)&a4->var1[3];
  long long v19 = v8;
  long long v20 = *(_OWORD *)&a4->var1[7];
  unint64_t v21 = a4->var1[9];
  long long v9 = *(_OWORD *)&a4->var1[1];
  long long v16 = *(_OWORD *)&a4->var0;
  long long v17 = v9;
  if ([v7 providesTileForIdentifier:&v16])
  {
    long long v10 = *(_OWORD *)&a4->var1[5];
    long long v18 = *(_OWORD *)&a4->var1[3];
    long long v19 = v10;
    long long v20 = *(_OWORD *)&a4->var1[7];
    unint64_t v21 = a4->var1[9];
    long long v11 = *(_OWORD *)&a4->var1[1];
    long long v16 = *(_OWORD *)&a4->var0;
    long long v17 = v11;
    [v7 checkInTile:a3 withIdentifier:&v16];
  }
  else
  {
    v12 = a3;
    if (a4->var1[0] == 795209731)
    {
      int v13 = [v7 viewTileReusePool];
      [v13 checkInReusableObject:v12];
    }
    v14 = [v12 view];
    [v14 removeFromSuperview];

    __int16 v15 = [(AEExplorerViewController *)self _tilesInUse];
    [v15 removeObject:v12];
  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v6 = a4;
  id v7 = [(AEExplorerViewController *)self _sceneController];
  unint64_t v8 = a3->var1[1];
  unint64_t v9 = a3->var1[2];
  unint64_t v10 = a3->var1[3];
  unint64_t v11 = a3->var1[4];
  if (v8 != *MEMORY[0x263F5E208] && v10 != 0x7FFFFFFFFFFFFFFFLL && v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __int16 v15 = [v6 dataSource];
    *(void *)&long long v32 = v8;
    *((void *)&v32 + 1) = v9;
    *(void *)&long long v33 = v10;
    *((void *)&v33 + 1) = 0x7FFFFFFFFFFFFFFFLL;
    v14 = [v15 assetAtItemIndexPath:&v32];
  }
  else
  {
    v14 = 0;
  }
  long long v16 = *(_OWORD *)&a3->var1[5];
  long long v34 = *(_OWORD *)&a3->var1[3];
  long long v35 = v16;
  long long v36 = *(_OWORD *)&a3->var1[7];
  unint64_t v37 = a3->var1[9];
  long long v17 = *(_OWORD *)&a3->var1[1];
  long long v32 = *(_OWORD *)&a3->var0;
  long long v33 = v17;
  if ([v7 providesTileForIdentifier:&v32])
  {
    long long v18 = *(_OWORD *)&a3->var1[5];
    long long v34 = *(_OWORD *)&a3->var1[3];
    long long v35 = v18;
    long long v36 = *(_OWORD *)&a3->var1[7];
    unint64_t v37 = a3->var1[9];
    long long v19 = *(_OWORD *)&a3->var1[1];
    long long v32 = *(_OWORD *)&a3->var0;
    long long v33 = v19;
    long long v20 = (AEGenericViewTile *)[v7 checkOutTileForIdentifier:&v32 layout:v6];
    if (a3->var0 == 5 && a3->var1[0] == *MEMORY[0x263F5E200]) {
      [(AEExplorerViewController *)self _attachGestureRecognizersIfNeeded:v20];
    }
    [(AEExplorerViewController *)self associateAsset:v14 withTile:v20];
  }
  else
  {
    unint64_t v21 = a3->var1[0];
    id v31 = v6;
    if (v21 == 795209731)
    {
      v24 = [v7 viewTileReusePool];
      long long v20 = [v24 checkOutReusableObjectWithReuseIdentifier:795209736];
    }
    else
    {
      if (v21 != 112112321) {
        abort();
      }
      v22 = [(AEExplorerViewController *)self _progressModel];
      v23 = [v22 progressSnapshot];
      *(void *)&long long v32 = v8;
      *((void *)&v32 + 1) = v9;
      *(void *)&long long v33 = v10;
      *((void *)&v33 + 1) = v11;
      v24 = [v23 progressForIndexPath:&v32];

      v25 = [AEProgressIndicatorView alloc];
      v26 = -[AEProgressIndicatorView initWithFrame:progress:](v25, "initWithFrame:progress:", v24, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      long long v20 = [[AEGenericViewTile alloc] initWithView:v26];
    }
    v27 = [(AEExplorerViewController *)self _tilesInUse];
    [v27 addObject:v20];

    v28 = [(AEExplorerViewController *)self _scrollViewController];
    v29 = [(AEGenericViewTile *)v20 view];
    objc_msgSend(v28, "ae_ensureSubview:", v29);

    [(AEExplorerViewController *)self associateAsset:v14 withTile:v20];
    id v6 = v31;
  }

  return v20;
}

- (void)_attachGestureRecognizersIfNeeded:(void *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = [a3 view];
  id v5 = [v4 gestureRecognizers];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTap_];
    [v7 setNumberOfTapsRequired:1];
    [v7 setDelegate:self];
    [v4 addGestureRecognizer:v7];
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_handleLongPress_];
    [v4 addGestureRecognizer:v8];
    [v4 setUserInteractionEnabled:1];
    unint64_t v9 = [(AEExplorerViewController *)self _clientGestureRecognizers];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) requireGestureRecognizerToFail:v8];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(AEExplorerViewController *)self _sceneController];
  unint64_t v9 = [v8 tilingController:v7 transitionAnimationCoordinatorForChange:v6];

  uint64_t v10 = [(AEExplorerViewController *)self _currentDataSource];
  id v11 = [(AEExplorerViewController *)self _createNewLayoutForDataSource:v10];

  uint64_t v12 = [[AEDelegatingTransitionAnimationCoordinator alloc] initWithWrappedCoordinator:v9];
  [(AEDelegatingTransitionAnimationCoordinator *)v12 setEnableDoubleSidedAnimations:0];

  return v12;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(AEExplorerViewController *)self _sceneController];
  unint64_t v9 = [v8 tilingController:v7 tileIdentifierConverterForChange:v6];

  return v9;
}

- (BOOL)layout:(id)a3 shouldShowCloudDecorationAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6 = a3;
  if ([(AEExplorerViewController *)self _fakeAllCloudAndVideo])
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    unint64_t v8 = [(AEExplorerViewController *)self _missingThumbnailAssetIndexes];
    unint64_t v9 = v8;
    if (v8 && [v8 containsIndex:a4->item])
    {
      uint64_t v10 = [v6 progressSnapshot];
      long long v11 = *(_OWORD *)&a4->item;
      v13[0] = *(_OWORD *)&a4->dataSourceIdentifier;
      v13[1] = v11;
      int v7 = [v10 hasProgressForIndexPath:v13] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)layout:(id)a3 shouldShowLoopDecorationAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  int v7 = [v5 assetAtItemIndexPath:v11];
  if (layout_shouldShowLoopDecorationAtIndexPath__onceToken != -1) {
    dispatch_once(&layout_shouldShowLoopDecorationAtIndexPath__onceToken, &__block_literal_global_305);
  }
  BOOL v9 = [v7 playbackStyle] == 5 && layout_shouldShowLoopDecorationAtIndexPath__canShowLoopBadges != 0;

  return v9;
}

void __71__AEExplorerViewController_layout_shouldShowLoopDecorationAtIndexPath___block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  layout_shouldShowLoopDecorationAtIndexPath__canShowLoopBadges = [v0 BOOLForKey:@"AssetExplorer_ShowLoopBadges"];
}

- (BOOL)layout:(id)a3 shouldShowVideoDecorationAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6 = a3;
  if ([(AEExplorerViewController *)self _fakeAllCloudAndVideo])
  {
    BOOL v7 = 1;
  }
  else
  {
    unint64_t v8 = [v6 dataSource];
    long long v9 = *(_OWORD *)&a4->item;
    v12[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v12[1] = v9;
    uint64_t v10 = [v8 assetAtItemIndexPath:v12];
    BOOL v7 = [v10 playbackStyle] == 4;
  }
  return v7;
}

- (void)_computeInitialResourcesIndexSetAsync
{
  if (_computeInitialResourcesIndexSetAsync_predicate != -1) {
    dispatch_once(&_computeInitialResourcesIndexSetAsync_predicate, &__block_literal_global_302);
  }
  v3 = [(AEExplorerViewController *)self _dataSourceManager];
  v4 = [v3 photosDataSource];
  id v5 = [v4 assetsInSection:0];
  id v6 = [v5 fetchedObjects];

  if ([v6 count])
  {
    unint64_t v7 = [v6 count];
    unint64_t v8 = 0;
    if (v7 >= 5) {
      unint64_t v9 = 5;
    }
    else {
      unint64_t v9 = v7;
    }
    do
    {
      uint64_t v10 = &v8[v9];
      if ((unint64_t)&v8[v9] > [v6 count]) {
        break;
      }
      long long v11 = objc_msgSend(v6, "subarrayWithRange:", v8, v9);
      objc_initWeak(&location, self);
      uint64_t v12 = _computeInitialResourcesIndexSetAsync__serialQueue;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke_2;
      v17[3] = &unk_26489B9E8;
      objc_copyWeak(v19, &location);
      id v13 = v11;
      id v18 = v13;
      v19[1] = v8;
      dispatch_async(v12, v17);
      unint64_t v14 = [v6 count];
      if ((unint64_t)v10 < v14)
      {
        uint64_t v15 = [v6 count];
        double v16 = (double)v9 + (double)v9;
        if (v16 >= (double)(unint64_t)(v15 - (void)v10)) {
          double v16 = (double)(unint64_t)(v15 - (void)v10);
        }
        unint64_t v9 = (unint64_t)v16;
        unint64_t v8 = v10;
      }

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
    while ((unint64_t)v10 < v14);
  }
}

void __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained _thumbnailResourcesIndexSetForAssets:*(void *)(a1 + 32)];

  if (*(void *)(a1 + 48))
  {
    id v5 = (void *)[v4 mutableCopy];
    [v5 shiftIndexesStartingAtIndex:0 by:*(void *)(a1 + 48)];

    v4 = v5;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke_3;
  v7[3] = &unk_26489B9C0;
  objc_copyWeak(&v9, v2);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v9);
}

void __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _addThumbnailIndexes:*(void *)(a1 + 32)];
}

uint64_t __65__AEExplorerViewController__computeInitialResourcesIndexSetAsync__block_invoke()
{
  _computeInitialResourcesIndexSetAsync__serialQueue = (uint64_t)dispatch_queue_create("AEExplorerViewControllerSerialQueue", 0);
  return MEMORY[0x270F9A758]();
}

- (void)_addThumbnailIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(AEExplorerViewController *)self _missingThumbnailAssetIndexes];
  id v6 = (void *)[v5 mutableCopy];
  unint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263F089C8] indexSet];
  }
  id v10 = v8;

  [v10 addIndexes:v4];
  [(AEExplorerViewController *)self _setMissingThumbnailAssetIndexes:v10];
  id v9 = [(PXTilingController *)self->__tilingController currentLayout];
  [v9 invalidateLayout];
}

- (id)_thumbnailResourcesIndexSetForAssets:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263F14EE8] indexesForAssetsWithoutThumbnails:v3 requestType:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1034;
  long long v20 = __Block_byref_object_dispose__1035;
  id v21 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__AEExplorerViewController_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_26489B978;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v5 = [v4 changeDetailsForFetchResult:v17[5]];
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 fetchResultAfterChanges];
    id v8 = [v7 fetchedObjects];
    id v9 = [(AEExplorerViewController *)self _thumbnailResourcesIndexSetForAssets:v8];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    _OWORD v13[2] = __57__AEExplorerViewController_prepareForPhotoLibraryChange___block_invoke_2;
    v13[3] = &unk_26489BB68;
    v13[4] = self;
    id v14 = v9;
    id v10 = v9;
    long long v11 = (void *)MEMORY[0x263EF83A0];
    dispatch_sync(MEMORY[0x263EF83A0], v13);
  }
  _Block_object_dispose(&v16, 8);

  return 0;
}

void __57__AEExplorerViewController_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _dataSourceManager];
  v2 = [v6 photosDataSource];
  uint64_t v3 = [v2 assetsInSection:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __57__AEExplorerViewController_prepareForPhotoLibraryChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPendingMissingThumbnailAssetIndexes:*(void *)(a1 + 40)];
}

- (void)assetsScene:(id)a3 didTransitionToDataSource:(id)a4
{
}

- (void)assetsScene:(id)a3 willTransitionToDataSource:(id)a4
{
  uint64_t v5 = [(AEExplorerViewController *)self _pendingMissingThumbnailAssetIndexes];
  if (v5)
  {
    [(AEExplorerViewController *)self _setMissingThumbnailAssetIndexes:v5];
    [(AEExplorerViewController *)self _setPendingMissingThumbnailAssetIndexes:0];
  }
  MEMORY[0x270F9A758]();
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  return [(AEExplorerViewController *)self _createNewLayoutForDataSource:a4];
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AEExplorerViewController *)self _sceneController];
  [v8 tilingController:v7 initialVisibleOriginForLayout:v6];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)AEExplorerViewControllerProgressViewModelObserverContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_10;
    }
    id v15 = v8;
    double v10 = [(AEExplorerViewController *)self _tilingController];
    double v9 = [v10 targetLayout];

    double v11 = [v9 dataSource];
    uint64_t v12 = [v11 identifier];

    double v13 = [(AEExplorerViewController *)self _progressModel];
    double v14 = [v13 progressSnapshot];

    if ([v14 correspondingDataSourceIdentifier] == v12) {
      [v9 setProgressSnapshot:v14];
    }

    goto LABEL_9;
  }
  if ((v6 & 1) != 0 && (void *)AEExplorerViewControllerPackageTransportObserverContext == a5)
  {
    id v15 = v8;
    double v9 = [(AEExplorerViewController *)self _currentDataSource];
    [(AEExplorerViewController *)self _handleTransportStagingUpdateWithDataSource:v9];
LABEL_9:

    id v8 = v15;
  }
LABEL_10:
}

- (void)_handleTransportStagingUpdateWithDataSource:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 identifier];
  uint64_t v19 = v4;
  uint64_t v5 = [v4 photosDataSource];
  char v6 = [(AEExplorerViewController *)self _sceneController];
  uint64_t v18 = [v6 selectionManager];

  long long v17 = [(AEExplorerViewController *)self _packageTransport];
  id v7 = [v17 orderedStagedIdentifiers];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    double v10 = 0;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        double v14 = [v5 indexPathForFirstAsset];
        id v15 = [v5 indexPathForAssetWithUUID:v13 orBurstIdentifier:0 hintIndexPath:v14 hintCollection:0];

        if (v15)
        {
          if (!v10)
          {
            double v10 = [MEMORY[0x263F5E158] indexPathSet];
          }
          long long v23 = 0u;
          long long v24 = 0u;
          PXSimpleIndexPathFromIndexPath();
          v22[0] = v23;
          v22[1] = v24;
          [v10 addIndexPath:v22];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }
  else
  {
    double v10 = 0;
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __72__AEExplorerViewController__handleTransportStagingUpdateWithDataSource___block_invoke;
  v20[3] = &unk_26489B950;
  id v21 = v10;
  id v16 = v10;
  [v18 performChanges:v20];
}

uint64_t __72__AEExplorerViewController__handleTransportStagingUpdateWithDataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

- (id)contentAssetReferenceAtPoint:(CGPoint)a3 outContentFrame:(CGRect *)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = [(AEExplorerViewController *)self _scrollViewController];
  uint64_t v9 = [v8 scrollView];

  double v10 = [(AEExplorerViewController *)self _scrollViewController];
  uint64_t v11 = [v10 contentCoordinateSpace];

  uint64_t v12 = [(AEExplorerViewController *)self _tilingController];
  objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v9, x, y);
  uint64_t v32 = 0;
  long long v33 = (double *)&v32;
  uint64_t v34 = 0xE010000000;
  long long v35 = "";
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v31 = 0;
  long long v30 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__AEExplorerViewController_contentAssetReferenceAtPoint_outContentFrame___block_invoke;
  v25[3] = &unk_26489B928;
  v25[4] = &v32;
  if (v12 && (objc_msgSend(v12, "hitTestTileAtPoint:padding:passingTest:", v25), (void)v26))
  {
    long long v13 = v27;
    long long v14 = v28;
    long long v23 = [v12 currentLayout];
    id v15 = [v23 dataSource];
    v24[0] = v13;
    v24[1] = v14;
    id v16 = [v15 assetReferenceAtItemIndexPath:v24];
    if (a4)
    {
      objc_msgSend(v11, "convertRect:toCoordinateSpace:", v9, v33[4], v33[5], v33[6], v33[7]);
      a4->origin.double x = v17;
      a4->origin.double y = v18;
      a4->size.width = v19;
      a4->size.height = v20;
    }
    id v21 = -[AEExplorerViewController _validateAssetReference:forScrollViewPoint:](self, "_validateAssetReference:forScrollViewPoint:", v16, x, y);
  }
  else
  {
    id v21 = 0;
  }
  _Block_object_dispose(&v32, 8);

  return v21;
}

uint64_t __73__AEExplorerViewController_contentAssetReferenceAtPoint_outContentFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3, long long *a4)
{
  if (*a2 != 5 || a2[1] != *MEMORY[0x263F5E200]) {
    return 0;
  }
  id v4 = *(_OWORD **)(*(void *)(a1 + 32) + 8);
  long long v5 = a4[7];
  long long v7 = a4[4];
  long long v6 = a4[5];
  v4[8] = a4[6];
  v4[9] = v5;
  v4[6] = v7;
  v4[7] = v6;
  long long v8 = a4[11];
  long long v10 = a4[8];
  long long v9 = a4[9];
  v4[12] = a4[10];
  v4[13] = v8;
  v4[10] = v10;
  v4[11] = v9;
  long long v11 = *a4;
  long long v12 = a4[1];
  long long v13 = a4[3];
  v4[4] = a4[2];
  v4[5] = v13;
  v4[2] = v11;
  v4[3] = v12;
  return 1;
}

- (id)_validateAssetReference:(id)a3 forScrollViewPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  long long v8 = v7;
  if (v7)
  {
    long long v9 = [v7 asset];
    long long v10 = [(AEExplorerViewController *)self _scrollViewController];
    long long v11 = [v10 scrollView];

    long long v12 = [v11 window];
    objc_msgSend(v12, "convertPoint:fromView:", v11, x, y);
    long long v13 = objc_msgSend(v12, "hitTest:withEvent:", 0);
    [(AEExplorerViewController *)self confirmAsset:v9 matchesView:v13];
    id v14 = v8;
  }
  return v8;
}

- (id)_createNewLayoutForDataSource:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AEExplorerViewController *)self _currentLayoutStyle];
  long long v6 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v7 = [v6 statusBarOrientation];

  long long v8 = [[AESceneGroupedTilingLayout alloc] initWithDataSource:v4 layoutStyle:v5 orientation:v7];
  long long v9 = [(AEExplorerViewController *)self _progressModel];
  long long v10 = [v9 progressSnapshot];

  uint64_t v11 = [v10 correspondingDataSourceIdentifier];
  uint64_t v12 = [v4 identifier];

  if (v11 == v12) {
    [(AESceneGroupedTilingLayout *)v8 setProgressSnapshot:v10];
  }
  [(AESceneGroupedTilingLayout *)v8 setDelegate:self];

  return v8;
}

- (id)_currentDataSource
{
  v2 = [(AEExplorerViewController *)self _sceneController];
  uint64_t v3 = [v2 dataSourceManager];
  id v4 = [v3 dataSource];

  return v4;
}

- (int64_t)_currentLayoutStyle
{
  uint64_t v3 = [(AEExplorerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  return -[AEExplorerViewController _layoutStyleForSize:](self, "_layoutStyleForSize:", v5, v7);
}

- (int64_t)_layoutStyleForSize:(CGSize)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", a3.width, a3.height);
  [v3 _referenceBounds];
  double v5 = v4;

  double v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (AEIsModernAspectScreen_onceToken != -1) {
    dispatch_once(&AEIsModernAspectScreen_onceToken, &__block_literal_global_9);
  }
  int64_t v8 = 2;
  if (v5 <= 768.0) {
    int64_t v8 = 1;
  }
  int64_t v9 = 3;
  if (!AEIsModernAspectScreen_isModernScreen) {
    int64_t v9 = 0;
  }
  if (v7 == 1) {
    return v8;
  }
  else {
    return v9;
  }
}

- (void)_stageAsset:(id)a3 withReference:(id)a4 suppressLivePhotoContent:(BOOL)a5 mediaOrigin:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v27 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = [(AEExplorerViewController *)self _packageTransport];
  id v15 = [MEMORY[0x263F5E1B0] sharedInstance];
  unint64_t v16 = [v15 maxMessagesAssetLimit];

  if ([v14 expectedPackageCount] >= v16)
  {
    CGFloat v19 = PXLocalizedString();
    CGFloat v20 = PXLocalizedString();
    id v21 = PFStringWithValidatedFormat();

    v22 = objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1, v16);
    long long v23 = (void *)MEMORY[0x263F82400];
    long long v24 = PXLocalizedString();
    long long v25 = [v23 actionWithTitle:v24 style:1 handler:0];
    [v22 addAction:v25];

    [(AEExplorerViewController *)self presentViewController:v22 animated:1 completion:0];
  }
  else
  {
    CGFloat v17 = [AEPhotosAssetPackageGenerator alloc];
    if (v12) {
      CGFloat v18 = [(AEPhotosAssetPackageGenerator *)v17 initWithAssetReference:v12];
    }
    else {
      CGFloat v18 = [(AEPhotosAssetPackageGenerator *)v17 initWithAsset:v27];
    }
    CGFloat v19 = v18;
    id v26 = [(AEPhotosAssetPackageGenerator *)v18 beginGenerating];
    [(AEExplorerViewController *)self _handleInProgressPackageGenerator:v19 suppressLivePhotoContent:v9 mediaOrigin:a6 completionHandler:v13];
  }
}

- (void)_handleAttemptedSelectionToggleOfAssetReference:(id)a3 cancelIfAlreadySelected:(BOOL)a4 suppressLivePhotoContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v35[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v9 = [(AEExplorerViewController *)self _currentDataSource];
  long long v10 = v9;
  if (v9)
  {
    [v9 indexPathForAssetReference:v8];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }

  uint64_t v11 = [v8 asset];
  if (v11)
  {
    id v12 = [(AEExplorerViewController *)self _sceneController];
    id v13 = [v12 selectionManager];
    id v14 = [v13 selectionSnapshot];

    long long v30 = v32;
    long long v31 = v33;
    if ([v14 isIndexPathSelected:&v30])
    {
      if (!v6)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v15 = [v11 uuid];
      unint64_t v16 = [(AEExplorerViewController *)self _packageTransport];
      [v16 unstagePackageWithIdentifier:v15];
    }
    else
    {
      CGFloat v17 = [(AEExplorerViewController *)self _progressModel];
      id v15 = [v17 progressSnapshot];

      long long v30 = v32;
      long long v31 = v33;
      if ([v15 hasProgressForIndexPath:&v30])
      {
        long long v30 = v32;
        long long v31 = v33;
        CGFloat v18 = [v15 progressForIndexPath:&v30];
        [v18 cancel];
        CGFloat v19 = [(AEExplorerViewController *)self _progressModel];
        [v19 setProgress:0 forAssetReference:v8];
      }
      else
      {
        CGFloat v20 = (void *)MEMORY[0x263F2FA10];
        v34[0] = *MEMORY[0x263F2FA00];
        id v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        uint64_t v23 = *MEMORY[0x263F2F9F8];
        v35[0] = v22;
        v35[1] = v11;
        v34[1] = v23;
        v34[2] = @"selectedIndex";
        long long v24 = [NSNumber numberWithInteger:(void)v33];
        v35[2] = v24;
        long long v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
        [v20 sendEvent:@"com.apple.photos.CPAnalytics.selectPhotoInAssetExplorer" withPayload:v25];

        if ([MEMORY[0x263F5E1A8] confidentialityCheckRequired]
          && [MEMORY[0x263F5E1A8] confidentialWarningRequiredForAsset:v11])
        {
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __125__AEExplorerViewController__handleAttemptedSelectionToggleOfAssetReference_cancelIfAlreadySelected_suppressLivePhotoContent___block_invoke;
          v26[3] = &unk_26489B900;
          v26[4] = self;
          id v27 = v11;
          id v28 = v8;
          BOOL v29 = v5;
          [(AEExplorerViewController *)self _presentConfidentialityAlertWithConfirmAction:v26 abortAction:0];
        }
        else
        {
          [(AEExplorerViewController *)self _stageAsset:v11 withReference:v8 suppressLivePhotoContent:v5 mediaOrigin:0 completionHandler:0];
        }
      }
    }

    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __125__AEExplorerViewController__handleAttemptedSelectionToggleOfAssetReference_cancelIfAlreadySelected_suppressLivePhotoContent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stageAsset:*(void *)(a1 + 40) withReference:*(void *)(a1 + 48) suppressLivePhotoContent:*(unsigned __int8 *)(a1 + 56) mediaOrigin:0 completionHandler:0];
}

- (void)_handleInProgressPackageGenerator:(id)a3 suppressLivePhotoContent:(BOOL)a4 mediaOrigin:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [v11 sourceAssetReference];
  id v13 = [(AEExplorerViewController *)self _packageTransport];
  id v14 = [(AEExplorerViewController *)self _progressModel];
  v22 = [v11 progress];
  [v14 setProgress:v22 forAssetReference:v12];
  id v15 = [v12 asset];
  unint64_t v16 = [v15 uuid];

  [v13 addPendingPackageIdentifier:v16];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __117__AEExplorerViewController__handleInProgressPackageGenerator_suppressLivePhotoContent_mediaOrigin_completionHandler___block_invoke;
  v23[3] = &unk_26489B8D8;
  id v29 = v10;
  int64_t v30 = a5;
  BOOL v31 = a4;
  id v24 = v13;
  id v25 = v16;
  id v26 = v12;
  id v27 = self;
  id v28 = v14;
  id v17 = v14;
  id v18 = v12;
  id v19 = v16;
  id v20 = v13;
  id v21 = v10;
  [v11 retrieveGeneratedPackageWithCompletion:v23];
}

void __117__AEExplorerViewController__handleInProgressPackageGenerator_suppressLivePhotoContent_mediaOrigin_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = v8;
  if (v7)
  {
    id v10 = (void *)[v7 mutableCopy];
    [v10 setMediaOrigin:*(void *)(a1 + 80)];
    if (*(unsigned char *)(a1 + 88)) {
      [v10 beginSupressingLivePhoto];
    }
    uint64_t v11 = *(void *)(a1 + 72);
    if (v11) {
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
    }
    [*(id *)(a1 + 32) stagePackage:v10];
    goto LABEL_16;
  }
  if (v8)
  {
    [*(id *)(a1 + 32) reportError:v8];
    [*(id *)(a1 + 32) removePendingPackageIdentifier:*(void *)(a1 + 40)];
    id v10 = [*(id *)(a1 + 48) asset];
    id v12 = objc_alloc(MEMORY[0x263F5E488]);
    v20[0] = v9;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    if (v10)
    {
      id v19 = v10;
      id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
      id v15 = (void *)[v12 initWithErrors:v13 forAssets:v14 fromSource:2 preparationType:0];
    }
    else
    {
      id v15 = (void *)[v12 initWithErrors:v13 forAssets:MEMORY[0x263EFFA68] fromSource:2 preparationType:0];
    }

    [v15 setRadarDescription:@"Error trying to pick an asset in PhotosMessagesApp."];
    [v15 setRadarComponentID:@"512768" name:@"Photos Backend (New Bugs)" version:@"all"];
    id v17 = [v15 alertControllerWithCompletion:0];
    [*(id *)(a1 + 56) presentViewController:v17 animated:1 completion:0];

LABEL_16:
    goto LABEL_17;
  }
  if ((a4 & 1) == 0)
  {
    unint64_t v16 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_22B526000, v16, OS_LOG_TYPE_ERROR, "Nil package returned from package generator with no error!", v18, 2u);
    }

    [*(id *)(a1 + 32) removePendingPackageIdentifier:*(void *)(a1 + 40)];
  }
LABEL_17:
  [*(id *)(a1 + 64) setProgress:0 forAssetReference:*(void *)(a1 + 48)];
}

- (id)scrollView
{
  v2 = [(AEExplorerViewController *)self _scrollViewController];
  uint64_t v3 = [v2 scrollView];

  return v3;
}

- (CGSize)_maximumThumbnailSize
{
  v2 = [MEMORY[0x263F5DB58] defaultFormatChooser];
  uint64_t v3 = [v2 masterThumbnailFormat];

  objc_msgSend(v3, "sizeWithFallBackSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_immediatelyGenerateAndStagePackageFromReviewAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5
{
  id v8 = a3;
  double v9 = [(AEExplorerViewController *)self _packageTransport];
  id v10 = [(AEExplorerViewController *)self _cameraPackageGenerator];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  _OWORD v12[2] = __109__AEExplorerViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke;
  v12[3] = &unk_26489B8B0;
  BOOL v15 = a4;
  id v13 = v9;
  int64_t v14 = a5;
  id v11 = v9;
  [v10 generatePackageFromReviewAsset:v8 withCompletionHandler:v12];
}

void __109__AEExplorerViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__AEExplorerViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke_2;
  block[3] = &unk_26489B888;
  char v16 = *(unsigned char *)(a1 + 48);
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v5;
  uint64_t v15 = v7;
  id v13 = v8;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void *__109__AEExplorerViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke_2(uint64_t a1)
{
  CGSize result = *(void **)(a1 + 32);
  if (result)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      [result beginSupressingLivePhoto];
      CGSize result = *(void **)(a1 + 32);
    }
    [result setMediaOrigin:*(void *)(a1 + 56)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    return (void *)[v3 stagePackage:v4];
  }
  else if (*(void *)(a1 + 48))
  {
    id v5 = *(void **)(a1 + 40);
    return objc_msgSend(v5, "reportError:");
  }
  return result;
}

- (void)_dismissViewControllerAboveKeyboardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AEExplorerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 explorerViewController:self dismissViewControllerAnimated:v3 completion:0];
  }
}

- (id)_presentViewControllerAboveKeyboard:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = [(AEExplorerViewController *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 explorerViewController:v7 presentViewController:v6 animated:v4 completion:0];
  }

  return v7;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
}

- (void)_dismissReviewScreenViewController
{
  BOOL v3 = [(AEExplorerViewController *)self _reviewController];
  if (v3)
  {
    id v4 = v3;
    [(AEExplorerViewController *)self _dismissViewControllerAboveKeyboardAnimated:1];
    [(AEExplorerViewController *)self _setReviewController:0];
    BOOL v3 = v4;
  }
}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  long long v37 = [(AEExplorerViewController *)self _stagedAssetUUIDs];
  id v13 = (void *)[v37 mutableCopy];
  [v13 minusSet:v10];
  if ([v13 count]) {
    [(AEExplorerViewController *)self _cancelExpectedAssetUUIDs:v13];
  }

  long long v39 = [(AEExplorerViewController *)self _packageTransport];
  id v14 = [v39 packagesWithLivePhotoContent];
  long long v38 = v14;
  if ([v14 count])
  {
    id v35 = v12;
    id v36 = v10;
    id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (!v17) {
      goto LABEL_20;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v45;
    while (1)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v22 = [v21 identifier];
        int v23 = [v11 containsObject:v22];
        int v24 = [v21 containsSuppressedLivePhoto];
        if (v23)
        {
          if ((v24 & 1) == 0)
          {
            id v25 = (void *)[v21 mutableCopy];
            [v25 beginSupressingLivePhoto];
            if (v25) {
              goto LABEL_15;
            }
          }
        }
        else if (v24)
        {
          id v25 = (void *)[v21 mutableCopy];
          [v25 endSuppressingLivePhoto];
          if (v25)
          {
LABEL_15:
            [v15 addObject:v25];
          }
        }
        if ([v15 count])
        {
          id v26 = [v15 allObjects];
          [v39 stagePackages:v26];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (!v18)
      {
LABEL_20:

        id v12 = v35;
        id v10 = v36;
        id v14 = v38;
        break;
      }
    }
  }
  if ([v12 count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = [v12 allKeys];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v40 + 1) + 8 * j);
          uint64_t v33 = [v11 containsObject:v32];
          uint64_t v34 = [v12 objectForKeyedSubscript:v32];
          [(AEExplorerViewController *)self _immediatelyGenerateAndStagePackageFromReviewAsset:v34 suppressLivePhoto:v33 mediaOrigin:0];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v29);
    }

    id v14 = v38;
  }
  [(AEExplorerViewController *)self _dismissReviewScreenViewController];
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  return (a4 < 7) & (0x7Bu >> a4);
}

- (void)_presentConfidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F82400];
  id v7 = a4;
  id v8 = a3;
  id v9 = PULocalizedString();
  id v10 = [v6 actionWithTitle:v9 style:0 handler:v8];

  id v11 = (void *)MEMORY[0x263F82400];
  id v12 = PULocalizedString();
  id v13 = [v11 actionWithTitle:v12 style:0 handler:v7];

  id v14 = (void *)MEMORY[0x263F5E1A8];
  v17[0] = v10;
  v17[1] = v13;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  id v16 = [v14 confidentialityAlertWithActions:v15];

  [(AEExplorerViewController *)self presentViewController:v16 animated:1 completion:0];
}

- (void)_configureReviewControllerWithAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AEExplorerViewController *)self _dataSourceManager];
  id v6 = [(AEExplorerViewController *)self _tilingController];
  id v7 = [v6 targetLayout];

  int v23 = v7;
  id v8 = [v7 dataSource];
  id v9 = v8;
  if (v8) {
    [v8 indexPathForAssetReference:v4];
  }
  id v10 = PXIndexPathFromSimpleIndexPath();
  id v11 = [(AEExplorerViewController *)self _stagedAssetUUIDs];
  id v12 = [MEMORY[0x263F5E1B0] sharedInstance];
  v22 = v4;
  uint64_t v13 = [v12 maxMessagesAssetLimit];

  id v14 = (void *)[objc_alloc(MEMORY[0x263F5E428]) initWithAssetsDataSourceManager:v5];
  id v15 = objc_alloc_init(MEMORY[0x263F5E430]);
  id v16 = objc_alloc_init(AEReviewAssetProvider);
  uint64_t v17 = (void *)v5;
  id v18 = objc_alloc(MEMORY[0x263F5E3C8]);
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v13];
  LOBYTE(v21) = 0;
  id v20 = (void *)[v18 initWithDataSourceManager:v14 mediaProvider:v15 reviewAssetProvider:v16 initialIndexPath:v10 initialSelectedAssetUUIDs:v11 initialDisabledLivePhotoAssetUUIDs:0 selectionCountLimit:v19 sourceType:0 lowMemoryMode:v21 options:0];

  [v20 setDelegate:self];
  [(AEExplorerViewController *)self _setReviewController:v20];
}

- (void)_cancelExpectedAssetUUIDs:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    id v4 = [(AEExplorerViewController *)self _packageTransport];
    uint64_t v5 = [v7 allObjects];
    [v4 unstagePackagesWithIdentifiers:v5];

    id v6 = [(AEExplorerViewController *)self _progressModel];
    [v6 cancelProgressForAssetUUIDs:v7];
  }
}

- (id)_stagedAssetUUIDs
{
  v2 = [(AEExplorerViewController *)self _packageTransport];
  BOOL v3 = [v2 expectedPackageIdentifiers];

  return v3;
}

- (void)handleLongPress:(id)a3
{
  id v9 = a3;
  if ([v9 state] == 1)
  {
    id v4 = [(AEExplorerViewController *)self _scrollViewController];
    uint64_t v5 = [v4 scrollView];

    [v9 locationInView:v5];
    id v6 = -[AEExplorerViewController contentAssetReferenceAtPoint:outContentFrame:](self, "contentAssetReferenceAtPoint:outContentFrame:", 0);
    if (v6)
    {
      [(AEExplorerViewController *)self _configureReviewControllerWithAssetReference:v6];
      id v7 = [(AEExplorerViewController *)self _reviewController];
      id v8 = [(AEExplorerViewController *)self _presentViewControllerAboveKeyboard:v7 animated:1];
    }
  }
}

- (void)handleTap:(id)a3
{
  id v7 = a3;
  if ([v7 state] == 3)
  {
    id v4 = [(AEExplorerViewController *)self _scrollViewController];
    uint64_t v5 = [v4 scrollView];

    [v7 locationInView:v5];
    id v6 = -[AEExplorerViewController contentAssetReferenceAtPoint:outContentFrame:](self, "contentAssetReferenceAtPoint:outContentFrame:", 0);
    if (v6) {
      [(AEExplorerViewController *)self _handleAttemptedSelectionToggleOfAssetReference:v6 cancelIfAlreadySelected:1 suppressLivePhotoContent:0];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AEExplorerViewController *)self _scrollViewController];
  id v6 = [v5 scrollView];

  id v7 = [(AEExplorerViewController *)self _scrollViewController];
  id v8 = [v7 contentCoordinateSpace];

  id v9 = [(AEExplorerViewController *)self _tilingController];
  [v4 locationInView:v6];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v6, v11, v13);
  if (v9) {
    objc_msgSend(v9, "hitTestTileAtPoint:padding:passingTest:", &__block_literal_global_1053);
  }

  return 0;
}

BOOL __57__AEExplorerViewController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  return *a2 == 5 && a2[1] == *MEMORY[0x263F5E200];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AEExplorerViewController;
  [(AEExplorerViewController *)&v3 viewDidDisappear:a3];
  PFSharedFigDecodeSessionDiscardCachedBuffers();
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AEExplorerViewController;
  [(AEExplorerViewController *)&v13 viewWillLayoutSubviews];
  objc_super v3 = [(AEExplorerViewController *)self _tilingController];
  id v4 = [v3 targetLayout];

  uint64_t v5 = [v4 layoutStyle];
  int64_t v6 = [(AEExplorerViewController *)self _currentLayoutStyle];
  int v7 = [v4 isPortraitOrientation];
  id v8 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v9 = [v8 statusBarOrientation];

  if (v6 == v5)
  {
    if (v7 != (unint64_t)(v9 - 1) < 2) {
      [v4 setPortraitOrientation:(unint64_t)(v9 - 1) < 2];
    }
  }
  else
  {
    double v10 = [(AEExplorerViewController *)self _sceneController];
    double v11 = [(AEExplorerViewController *)self _currentDataSource];
    double v12 = [(AEExplorerViewController *)self _createNewLayoutForDataSource:v11];

    [v10 transitionToLayout:v12];
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v11.receiver = self;
  v11.super_class = (Class)AEExplorerViewController;
  [(AEExplorerViewController *)&v11 viewSafeAreaInsetsDidChange];
  objc_super v3 = [(AEExplorerViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = [(AEExplorerViewController *)self _scrollViewController];
  objc_msgSend(v10, "setContentInset:", v5, v7, 0.0, v9);
}

- (void)viewDidLoad
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)AEExplorerViewController;
  [(AEExplorerViewController *)&v36 viewDidLoad];
  objc_super v3 = [(AEExplorerViewController *)self _dataSourceManager];
  double v4 = [v3 dataSource];

  int64_t v5 = [(AEExplorerViewController *)self _currentLayoutStyle];
  double v6 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v7 = [v6 statusBarOrientation];

  double v8 = [[AESceneGroupedTilingLayout alloc] initWithDataSource:v4 layoutStyle:v5 orientation:v7];
  double v9 = [(AEProgressViewModel *)self->__progressModel progressSnapshot];
  [(AESceneGroupedTilingLayout *)v8 setProgressSnapshot:v9];

  [(AESceneGroupedTilingLayout *)v8 setDelegate:self];
  uint64_t v10 = [(AEExplorerViewController *)self _scrollViewController];
  objc_super v11 = (void *)[objc_alloc(MEMORY[0x263F5E1C0]) initWithLayout:v8];
  BOOL v31 = (void *)v10;
  [v11 setScrollController:v10];
  double v12 = [(AEExplorerViewController *)self _tileAnimator];
  [v11 setTileAnimator:v12];

  [v11 setScrollDelegate:self];
  [v11 setTileSource:self];
  [v11 setTransitionDelegate:self];
  [(AEExplorerViewController *)self _setTilingController:v11];
  id v13 = objc_alloc([(AEExplorerViewController *)self assetsSceneClass]);
  id v14 = [(AEExplorerViewController *)self _tilingController];
  id v15 = [(AEExplorerViewController *)self _mediaProvider];
  id v16 = [(AEExplorerViewController *)self _dataSourceManager];
  uint64_t v17 = (void *)[v13 initWithTilingController:v14 mediaProvider:v15 dataSourceManager:v16 delegate:self];

  [v17 setAnimatesContent:1];
  [v17 setAutoplayBehavior:3];
  [(AEExplorerViewController *)self _maximumThumbnailSize];
  double v19 = v18;
  double v21 = v20;
  v22 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v41.width = v19;
    v41.height = v21;
    int v23 = NSStringFromCGSize(v41);
    *(_DWORD *)buf = 138543362;
    long long v39 = v23;
    _os_log_impl(&dword_22B526000, v22, OS_LOG_TYPE_DEFAULT, "Setting the maximum image request size to %{public}@", buf, 0xCu);
  }
  objc_msgSend(v17, "setMaximumImageSize:", v19, v21);
  int v24 = [v17 viewTileReusePool];
  +[AEDecorativeTileSource registerCommonDecorativeTilesToReusePool:v24];
  [(AEExplorerViewController *)self _setSceneController:v17];
  [(AEExplorerViewController *)self _handleTransportStagingUpdateWithDataSource:v4];
  id v25 = [(AEExplorerViewController *)self view];
  id v26 = [(AEExplorerViewController *)self _clientGestureRecognizers];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(v26);
        }
        [v25 addGestureRecognizer:*(void *)(*((void *)&v32 + 1) + 8 * v30++)];
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v28);
  }
}

- (void)loadView
{
  objc_super v3 = [(AEExplorerViewController *)self _scrollViewController];
  id v5 = [v3 scrollView];

  double v4 = [MEMORY[0x263F825C8] clearColor];
  [v5 setBackgroundColor:v4];

  [v5 setShowsVerticalScrollIndicator:0];
  [v5 setShowsHorizontalScrollIndicator:0];
  [v5 setUserInteractionEnabled:1];
  [(AEExplorerViewController *)self setView:v5];
}

- (Class)assetsSceneClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  [(AEExplorerViewController *)self _dismissViewControllerAboveKeyboardAnimated:0];
  objc_super v3 = objc_msgSend(MEMORY[0x263F14E98], "px_deprecated_appPhotoLibrary");
  objc_msgSend(v3, "px_unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AEExplorerViewController;
  [(AEExplorerViewController *)&v4 dealloc];
}

- (AEExplorerViewController)initWithPackageTransport:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 additionalGestureRecognizers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)AEExplorerViewController;
  id v15 = [(AEExplorerViewController *)&v30 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->__packageTransport, a3);
    [(AEPackageTransport *)v16->__packageTransport registerChangeObserver:v16 context:AEExplorerViewControllerPackageTransportObserverContext];
    objc_storeStrong((id *)&v16->__dataSourceManager, a5);
    objc_storeStrong((id *)&v16->__mediaProvider, a4);
    objc_storeStrong((id *)&v16->__clientGestureRecognizers, a6);
    [(AEExplorerViewController *)v16 _computeInitialResourcesIndexSetAsync];
    uint64_t v17 = objc_msgSend(MEMORY[0x263F14E98], "px_deprecated_appPhotoLibrary");
    objc_msgSend(v17, "px_registerChangeObserver:", v16);

    double v18 = [[AEProgressViewModel alloc] initWithDataSourceManager:v13];
    progressModel = v16->__progressModel;
    v16->__progressModel = v18;

    [(AEProgressViewModel *)v16->__progressModel registerChangeObserver:v16 context:AEExplorerViewControllerProgressViewModelObserverContext];
    id v20 = objc_alloc(MEMORY[0x263F5E1E0]);
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    scrollViewController = v16->__scrollViewController;
    v16->__scrollViewController = (PXUIScrollViewController *)v21;

    int v23 = (PXBasicUIViewTileAnimator *)objc_alloc_init(MEMORY[0x263F5E140]);
    tileAnimator = v16->__tileAnimator;
    v16->__tileAnimator = v23;

    id v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    tilesInUse = v16->__tilesInUse;
    v16->__tilesInUse = v25;

    uint64_t v27 = objc_alloc_init(AECameraAssetPackageGenerator);
    cameraPackageGenerator = v16->__cameraPackageGenerator;
    v16->__cameraPackageGenerator = v27;
  }
  return v16;
}

@end