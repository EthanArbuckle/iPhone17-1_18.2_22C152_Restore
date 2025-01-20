@interface AEMessagesShelfViewController
- (AEMessagesShelfViewController)initWithPackageTransport:(id)a3;
- (AEMessagesShelfViewController)initWithPackageTransport:(id)a3 options:(unint64_t)a4;
- (AEPackageTransport)_packageTransport;
- (AEWrappedDataSourceManager)_wrappedDataSourceManager;
- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)layout:(id)a3 itemAtIndexPathIsAnimatedImage:(PXSimpleIndexPath *)a4;
- (BOOL)layout:(id)a3 itemAtIndexPathIsLoop:(PXSimpleIndexPath *)a4;
- (BOOL)layout:(id)a3 itemAtIndexPathIsSpatial:(PXSimpleIndexPath *)a4;
- (BOOL)layout:(id)a3 itemAtIndexPathIsVideo:(PXSimpleIndexPath *)a4;
- (BOOL)layoutShouldShowCancelButtons:(id)a3;
- (BOOL)layoutShouldShowVideoDuration:(id)a3;
- (BOOL)shouldPresentReviewController;
- (BOOL)wantsEdgeToEdgeLayout;
- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKPluginEntryViewControllerDelegate)entryViewDelegate;
- (NSMutableSet)_tilesInUse;
- (NSString)editingGeneratedPackageIdentifier;
- (PUAssetExplorerAnalytics)assetExplorerAnalytics;
- (PUAssetExplorerReviewScreenViewController)presentedReviewController;
- (PUReviewAssetsDataSourceManager)_internalReviewDataSourceManager;
- (PUReviewAssetsMediaProvider)_internalReviewMediaProvider;
- (PUReviewDataSource)_dataSource;
- (PXAssetsScene)_sceneController;
- (PXBasicUIViewTileAnimator)_tileAnimator;
- (PXScrollViewController)_scrollViewController;
- (PXTilingController)_tilingController;
- (UIColor)_roundedCornerOverlayFillColor;
- (double)layout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4;
- (double)layout:(id)a3 itemAtIndexPathDuration:(PXSimpleIndexPath *)a4;
- (id)_currentAssetsDataSource;
- (id)_traverseHierarchyForFillColorStartingWithView:(id)a3;
- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4;
- (id)assetsScene:(id)a3 transitionAnimationCoordinatorForChange:(id)a4;
- (id)contentAssetReferenceAtPoint:(CGPoint)a3;
- (id)framesOfVisibleContentViewInCoordinateSpace:(id)a3;
- (int64_t)_indexToScrollTo;
- (int64_t)layout:(id)a3 generationStateForItemAtIndexPath:(PXSimpleIndexPath *)a4;
- (int64_t)layout:(id)a3 irisToggleStateForItemAtIndexPath:(PXSimpleIndexPath *)a4;
- (unint64_t)_options;
- (void)_didTapGenerationButton:(id)a3;
- (void)_dismissPresentedReviewController:(id)a3 animated:(BOOL)a4;
- (void)_immediatelyGenerateAndStagePackageFromReviewAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5;
- (void)_presentReviewForAssetReference:(id)a3;
- (void)_presentReviewViewController:(id)a3;
- (void)_removeFromShelf:(id)a3;
- (void)_setIndexToScrollTo:(int64_t)a3;
- (void)_toggleIris:(id)a3;
- (void)_transportStagingStateDidChange;
- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7;
- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)dealloc;
- (void)handleTap:(id)a3;
- (void)imageEditionViewControllerDidCancel:(id)a3 requiresShowingGrid:(BOOL)a4;
- (void)imageEditionViewControllerDidFinishEditing:(id)a3 error:(id)a4;
- (void)loadView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)setAssetExplorerAnalytics:(id)a3;
- (void)setEditingGeneratedPackageIdentifier:(id)a3;
- (void)setEntryViewDelegate:(id)a3;
- (void)setPresentedReviewController:(id)a3;
- (void)set_roundedCornerOverlayFillColor:(id)a3;
- (void)viewDidLoad;
@end

@implementation AEMessagesShelfViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetExplorerAnalytics, 0);
  objc_storeStrong((id *)&self->_presentedReviewController, 0);
  objc_storeStrong((id *)&self->__roundedCornerOverlayFillColor, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->_editingGeneratedPackageIdentifier, 0);
  objc_storeStrong((id *)&self->__packageTransport, 0);
  objc_storeStrong((id *)&self->__wrappedDataSourceManager, 0);
  objc_storeStrong((id *)&self->__internalReviewMediaProvider, 0);
  objc_storeStrong((id *)&self->__internalReviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->__dataSource, 0);
  objc_storeStrong((id *)&self->__scrollViewController, 0);
  objc_storeStrong((id *)&self->__sceneController, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_destroyWeak((id *)&self->_entryViewDelegate);
}

- (void)setAssetExplorerAnalytics:(id)a3
{
}

- (unint64_t)_options
{
  return self->__options;
}

- (void)setPresentedReviewController:(id)a3
{
}

- (PUAssetExplorerReviewScreenViewController)presentedReviewController
{
  return self->_presentedReviewController;
}

- (void)set_roundedCornerOverlayFillColor:(id)a3
{
}

- (void)_setIndexToScrollTo:(int64_t)a3
{
  self->__indexToScrollTo = a3;
}

- (int64_t)_indexToScrollTo
{
  return self->__indexToScrollTo;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (void)setEditingGeneratedPackageIdentifier:(id)a3
{
}

- (NSString)editingGeneratedPackageIdentifier
{
  return self->_editingGeneratedPackageIdentifier;
}

- (AEPackageTransport)_packageTransport
{
  return self->__packageTransport;
}

- (AEWrappedDataSourceManager)_wrappedDataSourceManager
{
  return self->__wrappedDataSourceManager;
}

- (PUReviewAssetsMediaProvider)_internalReviewMediaProvider
{
  return self->__internalReviewMediaProvider;
}

- (PUReviewAssetsDataSourceManager)_internalReviewDataSourceManager
{
  return self->__internalReviewDataSourceManager;
}

- (PUReviewDataSource)_dataSource
{
  return self->__dataSource;
}

- (PXScrollViewController)_scrollViewController
{
  return self->__scrollViewController;
}

- (PXAssetsScene)_sceneController
{
  return self->__sceneController;
}

- (PXBasicUIViewTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (void)setEntryViewDelegate:(id)a3
{
}

- (CKPluginEntryViewControllerDelegate)entryViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entryViewDelegate);
  return (CKPluginEntryViewControllerDelegate *)WeakRetained;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v7 = [(AEMessagesShelfViewController *)self assetExplorerAnalytics];
  uint64_t v4 = *MEMORY[0x263F5E4B8];
  v5 = [(AEMessagesShelfViewController *)self _dataSource];
  v6 = [v5 orderedIdentifiers];
  objc_msgSend(v7, "sendEvent:view:source:currentAssetCount:", v4, 1, 1, objc_msgSend(v6, "count"));
}

- (id)_currentAssetsDataSource
{
  v2 = [(AEMessagesShelfViewController *)self _sceneController];
  v3 = [v2 dataSourceManager];
  uint64_t v4 = [v3 dataSource];

  return v4;
}

- (void)_immediatelyGenerateAndStagePackageFromReviewAsset:(id)a3 suppressLivePhoto:(BOOL)a4 mediaOrigin:(int64_t)a5
{
  id v8 = a3;
  v9 = [(AEMessagesShelfViewController *)self _packageTransport];
  v10 = objc_alloc_init(AECameraAssetPackageGenerator);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __114__AEMessagesShelfViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke;
  v12[3] = &unk_26489B8B0;
  BOOL v15 = a4;
  id v13 = v9;
  int64_t v14 = a5;
  id v11 = v9;
  [(AECameraAssetPackageGenerator *)v10 generatePackageFromReviewAsset:v8 withCompletionHandler:v12];
}

void __114__AEMessagesShelfViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__AEMessagesShelfViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke_2;
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

void *__114__AEMessagesShelfViewController__immediatelyGenerateAndStagePackageFromReviewAsset_suppressLivePhoto_mediaOrigin___block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      [result beginSupressingLivePhoto];
      result = *(void **)(a1 + 32);
    }
    [result setMediaOrigin:*(void *)(a1 + 56)];
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    return (void *)[v3 stagePackage:v4];
  }
  else if (*(void *)(a1 + 48))
  {
    id v5 = *(void **)(a1 + 40);
    return objc_msgSend(v5, "reportError:");
  }
  return result;
}

- (id)_traverseHierarchyForFillColorStartingWithView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  do
  {
    id v5 = v4;
    id v6 = [v4 backgroundColor];
    uint64_t v4 = [v4 superview];
  }
  while (!v6 && v4);

  return v6;
}

- (UIColor)_roundedCornerOverlayFillColor
{
  roundedCornerOverlayFillColor = self->__roundedCornerOverlayFillColor;
  if (!roundedCornerOverlayFillColor)
  {
    uint64_t v4 = [(AEMessagesShelfViewController *)self view];
    id v5 = [v4 superview];

    id v6 = [(AEMessagesShelfViewController *)self _traverseHierarchyForFillColorStartingWithView:v5];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F825C8] systemBackgroundColor];
    }
    uint64_t v7 = self->__roundedCornerOverlayFillColor;
    self->__roundedCornerOverlayFillColor = v6;

    roundedCornerOverlayFillColor = self->__roundedCornerOverlayFillColor;
  }
  return roundedCornerOverlayFillColor;
}

- (void)imageEditionViewControllerDidCancel:(id)a3 requiresShowingGrid:(BOOL)a4
{
}

- (void)imageEditionViewControllerDidFinishEditing:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v5 = [v12 generatedAssets];
  id v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = [(AEMessagesShelfViewController *)self _packageTransport];
    id v8 = [(AEMessagesShelfViewController *)self editingGeneratedPackageIdentifier];
    [v7 unstagePackageWithIdentifier:v8];

    id v9 = objc_alloc_init(AEGenerativePlaygroundAssetPackageGenerator);
    id v10 = [(AEGenerativePlaygroundAssetPackageGenerator *)v9 generatePackageFromGenerativePlaygroundAsset:v6];
    id v11 = [(AEMessagesShelfViewController *)self _packageTransport];
    [v11 stagePackage:v10];
  }
  [v12 dismissViewControllerAnimated:1 completion:0];
}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v11 = a5;
  id v12 = a6;
  v47 = self;
  id v48 = a7;
  id v13 = [(AEMessagesShelfViewController *)self _packageTransport];
  v44 = [v13 orderedStagedIdentifiers];
  v43 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
  id v14 = (void *)[v43 mutableCopy];
  v45 = v11;
  [v14 minusSet:v11];
  if ([v14 count])
  {
    uint64_t v15 = [v14 allObjects];
    [v13 unstagePackagesWithIdentifiers:v15];
  }
  v42 = v14;
  if ([v48 count])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    char v16 = [v48 allKeys];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v55 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          v22 = [v13 stagedPackageForIdentifier:v21];
          uint64_t v23 = [v22 mediaOrigin];
          uint64_t v24 = [v12 containsObject:v21];
          v25 = [v48 objectForKeyedSubscript:v21];
          [(AEMessagesShelfViewController *)v47 _immediatelyGenerateAndStagePackageFromReviewAsset:v25 suppressLivePhoto:v24 mediaOrigin:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v18);
    }
  }
  v26 = [v13 packagesWithLivePhotoContent];
  if ([v26 count])
  {
    id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v41 = v26;
    id v28 = v26;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (!v29) {
      goto LABEL_29;
    }
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v51;
    while (1)
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v51 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        v34 = objc_msgSend(v33, "identifier", v41);
        int v35 = [v12 containsObject:v34];
        int v36 = [v33 containsSuppressedLivePhoto];
        if (v35)
        {
          if ((v36 & 1) == 0)
          {
            v37 = (void *)[v33 mutableCopy];
            [v37 beginSupressingLivePhoto];
            if (v37) {
              goto LABEL_24;
            }
          }
        }
        else if (v36)
        {
          v37 = (void *)[v33 mutableCopy];
          [v37 endSuppressingLivePhoto];
          if (v37)
          {
LABEL_24:
            [v27 addObject:v37];
          }
        }
        if ([v27 count])
        {
          v38 = [v27 allObjects];
          [v13 stagePackages:v38];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (!v30)
      {
LABEL_29:

        v26 = v41;
        break;
      }
    }
  }
  v39 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B526000, v39, OS_LOG_TYPE_DEFAULT, "Finished review; will dismiss.", buf, 2u);
  }

  [(AEMessagesShelfViewController *)v47 _dismissPresentedReviewController:v46 animated:1];
  v40 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B526000, v40, OS_LOG_TYPE_DEFAULT, "Finished review; did dismiss.", buf, 2u);
  }
}

- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3
{
  id v4 = a3;
  id v5 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B526000, v5, OS_LOG_TYPE_DEFAULT, "Cancelled review; will dismiss.", buf, 2u);
  }

  [(AEMessagesShelfViewController *)self _dismissPresentedReviewController:v4 animated:1];
  id v6 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22B526000, v6, OS_LOG_TYPE_DEFAULT, "Cancelled review; did dismiss.", v7, 2u);
  }
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  return (a4 < 7) & (0x7Bu >> a4);
}

- (id)contentAssetReferenceAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(AEMessagesShelfViewController *)self _scrollViewController];
  uint64_t v7 = [v6 scrollView];

  id v8 = [(AEMessagesShelfViewController *)self _scrollViewController];
  id v9 = [v8 contentCoordinateSpace];

  id v10 = [(AEMessagesShelfViewController *)self _tilingController];
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v7, x, y);
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  if (v10 && (objc_msgSend(v10, "hitTestTileAtPoint:padding:passingTest:", &__block_literal_global_406), (void)v19))
  {
    long long v17 = v20;
    unint64_t v12 = *((void *)&v21 + 1);
    unint64_t v11 = v21;
    id v13 = [v10 currentLayout];
    id v14 = [v13 dataSource];
    v18[0] = v17;
    v18[1] = __PAIR128__(v12, v11);
    uint64_t v15 = [v14 assetReferenceAtItemIndexPath:v18];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

BOOL __62__AEMessagesShelfViewController_contentAssetReferenceAtPoint___block_invoke(uint64_t a1, void *a2)
{
  return *a2 == 5 && a2[1] == *MEMORY[0x263F5E200];
}

- (void)_presentReviewForAssetReference:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AEMessagesShelfViewController *)self _currentAssetsDataSource];
  long long v22 = [(AEMessagesShelfViewController *)self _internalReviewMediaProvider];
  long long v31 = 0u;
  long long v32 = 0u;
  if (v5) {
    [v5 indexPathForAssetReference:v4];
  }
  long long v23 = v5;
  uint64_t v24 = v4;
  long long v29 = v31;
  long long v30 = v32;
  long long v21 = PXIndexPathFromSimpleIndexPath();
  id v6 = [(AEMessagesShelfViewController *)self _packageTransport];
  uint64_t v7 = [v6 orderedStagedIdentifiers];
  id v8 = [MEMORY[0x263EFFA08] setWithArray:v7];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        char v16 = [v6 stagedPackageForIdentifier:v15];
        if ([v16 containsSuppressedLivePhoto]) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v12);
  }

  long long v17 = [(AEMessagesShelfViewController *)self _dataSource];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F5E450]) initWithReviewDataSource:v17];
  LOBYTE(v20) = 0;
  long long v19 = (void *)[objc_alloc(MEMORY[0x263F5E3C8]) initWithDataSourceManager:v18 mediaProvider:v22 reviewAssetProvider:0 initialIndexPath:v21 initialSelectedAssetUUIDs:v8 initialDisabledLivePhotoAssetUUIDs:v9 selectionCountLimit:0 sourceType:1 lowMemoryMode:v20 options:0];
  [v19 setDelegate:self];
  [v19 setModalPresentationStyle:0];
  [(AEMessagesShelfViewController *)self _presentReviewViewController:v19];
}

- (BOOL)shouldPresentReviewController
{
  v2 = [(AEMessagesShelfViewController *)self _packageTransport];
  char v3 = [v2 shouldHideReviewController] ^ 1;

  return v3;
}

- (void)handleTap:(id)a3
{
  id v7 = a3;
  if ([v7 state] == 3)
  {
    id v4 = [(AEMessagesShelfViewController *)self _scrollViewController];
    id v5 = [v4 scrollView];

    [v7 locationInView:v5];
    id v6 = -[AEMessagesShelfViewController contentAssetReferenceAtPoint:](self, "contentAssetReferenceAtPoint:");
    if (v6 && [(AEMessagesShelfViewController *)self shouldPresentReviewController]) {
      [(AEMessagesShelfViewController *)self _presentReviewForAssetReference:v6];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(AEMessagesShelfViewController *)self _scrollViewController];
  id v6 = [v5 scrollView];

  id v7 = [(AEMessagesShelfViewController *)self _scrollViewController];
  id v8 = [v7 contentCoordinateSpace];

  id v9 = [(AEMessagesShelfViewController *)self _tilingController];
  [v4 locationInView:v6];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v6, v11, v13);
  if (v9) {
    objc_msgSend(v9, "hitTestTileAtPoint:padding:passingTest:", &__block_literal_global_402);
  }

  return 0;
}

BOOL __62__AEMessagesShelfViewController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  return *a2 == 5 && a2[1] == *MEMORY[0x263F5E200];
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v7 = [(AEMessagesShelfViewController *)self _sceneController];
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
    double v12 = a3;
    double v13 = [v12 view];
    [v13 removeFromSuperview];

    id v14 = [v7 viewTileReusePool];
    [v14 checkInReusableObject:v12];
    uint64_t v15 = [(AEMessagesShelfViewController *)self _tilesInUse];
    [v15 removeObject:v12];
  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v6 = a4;
  id v7 = [(AEMessagesShelfViewController *)self _sceneController];
  long long v8 = *(_OWORD *)&a3->var1[5];
  long long v26 = *(_OWORD *)&a3->var1[3];
  long long v27 = v8;
  long long v28 = *(_OWORD *)&a3->var1[7];
  unint64_t v29 = a3->var1[9];
  long long v9 = *(_OWORD *)&a3->var1[1];
  long long v24 = *(_OWORD *)&a3->var0;
  long long v25 = v9;
  if (![v7 providesTileForIdentifier:&v24])
  {
    double v13 = [v7 viewTileReusePool];
    id v14 = v13;
    uint64_t v15 = a3->var1[0];
    unint64_t v16 = a3->var1[4];
    if (v15 > 1295210291)
    {
      switch(v15)
      {
        case 1295210292:
          uint64_t v18 = 1295210292;
          if (v16 == 1)
          {
            uint64_t v18 = 1295210293;
          }
          else if (v16 != 2)
          {
            if (v16) {
              goto LABEL_21;
            }
            goto LABEL_34;
          }
          break;
        case 1500001338:
          uint64_t v18 = 1500001338;
          break;
        case 1313817680:
          uint64_t v18 = 1313817680;
          break;
        default:
          goto LABEL_34;
      }
    }
    else
    {
      if (v15 == 795209731)
      {
        switch(v16)
        {
          case 0uLL:
            uint64_t v18 = 795209731;
            goto LABEL_31;
          case 1uLL:
            uint64_t v18 = 795209732;
            goto LABEL_31;
          case 2uLL:
          case 5uLL:
          case 6uLL:
            goto LABEL_34;
          case 3uLL:
            uint64_t v18 = 795209734;
            goto LABEL_31;
          case 4uLL:
            uint64_t v18 = 795209735;
            goto LABEL_31;
          case 7uLL:
            uint64_t v18 = 795209738;
            goto LABEL_31;
          default:
            goto LABEL_21;
        }
      }
      if (v15 != 1215219281)
      {
        if (v15 == 1277777777)
        {
          long long v17 = [v13 checkOutReusableObjectWithReuseIdentifier:1277777777];
          double v12 = v17;
          if (v16 == 2)
          {
            uint64_t v19 = 1;
          }
          else
          {
            if (v16 != 1)
            {
              if (v16)
              {
LABEL_32:
                long long v20 = [(AEMessagesShelfViewController *)self _tilesInUse];
                [v20 addObject:v12];

                unint64_t v21 = [(AEMessagesShelfViewController *)self _scrollViewController];
                long long v22 = [v12 view];
                objc_msgSend(v21, "ae_ensureSubview:", v22);

                goto LABEL_33;
              }

LABEL_21:
              double v12 = 0;
              goto LABEL_32;
            }
            uint64_t v19 = 0;
          }
          [v17 setIsGenerativeAssetAppearance:v19];
          goto LABEL_32;
        }
LABEL_34:
        abort();
      }
      uint64_t v18 = 1215219281;
    }
LABEL_31:
    double v12 = [v13 checkOutReusableObjectWithReuseIdentifier:v18];
    goto LABEL_32;
  }
  long long v10 = *(_OWORD *)&a3->var1[5];
  long long v26 = *(_OWORD *)&a3->var1[3];
  long long v27 = v10;
  long long v28 = *(_OWORD *)&a3->var1[7];
  unint64_t v29 = a3->var1[9];
  long long v11 = *(_OWORD *)&a3->var1[1];
  long long v24 = *(_OWORD *)&a3->var0;
  long long v25 = v11;
  double v12 = (void *)[v7 checkOutTileForIdentifier:&v24 layout:v6];
LABEL_33:

  return v12;
}

- (void)_didTapGenerationButton:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  id v5 = [(AEMessagesShelfViewController *)self _sceneController];
  id v6 = [v5 tilingController];
  id v7 = v6;
  if (v6)
  {
    [v6 tileIdentifierForTile:v4];
  }
  else
  {
    uint64_t v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
  }

  if ((unint64_t)(v27 - 6) >= 0xFFFFFFFFFFFFFFFDLL && (void)v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v8 = [(AEMessagesShelfViewController *)self _packageTransport];
    long long v9 = [v8 orderedStagedIdentifiers];
    long long v10 = [v9 objectAtIndex:(void)v29];
    long long v11 = [v8 stagedPackageForIdentifier:v10];
    double v12 = [v11 generationRecipeData];
    double v13 = [v11 identifier];
    [(AEMessagesShelfViewController *)self setEditingGeneratedPackageIdentifier:v13];

    id v14 = (void *)[objc_alloc(MEMORY[0x263F0F6A8]) initWithStyle:0];
    [v14 setDelegate:self];
    if ([v11 containsGenerationRecipeData])
    {
      id v15 = objc_alloc(MEMORY[0x263F0F6B8]);
      long long v25 = v12;
      unint64_t v16 = (void *)[v15 initWithEncodedRecipe:v12 prompt:0 contextElements:MEMORY[0x263EFFA68]];
      [v14 setRecipe:v16];
    }
    else
    {
      if (![v11 containsGenerationSourceImage])
      {
        unint64_t v21 = PLAssetExplorerGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B526000, v21, OS_LOG_TYPE_ERROR, "No recipe nor source image, unable to present generative playground controller.", buf, 2u);
        }
        goto LABEL_11;
      }
      long long v25 = v12;
      id v17 = objc_alloc(MEMORY[0x263EFF8F8]);
      uint64_t v18 = [v11 sourceImageURL];
      unint64_t v16 = (void *)[v17 initWithContentsOfURL:v18];

      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithData:v16];
      [v14 setSourceImage:v19];
    }
    long long v20 = [(AEMessagesShelfViewController *)self entryViewDelegate];
    [v20 presentViewController:v14 animated:1 completion:0];

    unint64_t v21 = [(AEMessagesShelfViewController *)self assetExplorerAnalytics];
    uint64_t v22 = *MEMORY[0x263F5E4A8];
    long long v23 = [(AEMessagesShelfViewController *)self _dataSource];
    long long v24 = [v23 orderedIdentifiers];
    -[NSObject sendEvent:view:source:currentAssetCount:](v21, "sendEvent:view:source:currentAssetCount:", v22, 1, 1, [v24 count]);

    double v12 = v25;
LABEL_11:
  }
}

- (void)_toggleIris:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  id v5 = [(AEMessagesShelfViewController *)self _sceneController];
  id v6 = [v5 tilingController];
  id v7 = v6;
  if (v6) {
    [v6 tileIdentifierForTile:v4];
  }
  else {
    long long v17 = 0u;
  }

  if ((unint64_t)(v17 - 6) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    long long v8 = [(AEMessagesShelfViewController *)self _packageTransport];
    long long v9 = [v8 orderedStagedIdentifiers];
    long long v10 = [v9 objectAtIndex:0];
    long long v11 = [v8 stagedPackageForIdentifier:v10];
    double v12 = (void *)[v11 mutableCopy];
    if ([v11 containsSuppressedLivePhoto]) {
      [v12 endSuppressingLivePhoto];
    }
    else {
      [v12 beginSupressingLivePhoto];
    }
    objc_msgSend(v8, "stagePackage:", v12, v17);
    double v13 = [(AEMessagesShelfViewController *)self assetExplorerAnalytics];
    uint64_t v14 = *MEMORY[0x263F5E4C0];
    id v15 = [(AEMessagesShelfViewController *)self _dataSource];
    unint64_t v16 = [v15 orderedIdentifiers];
    objc_msgSend(v13, "sendEvent:view:source:currentAssetCount:", v14, 1, 1, objc_msgSend(v16, "count"));
  }
}

- (void)_removeFromShelf:(id)a3
{
  id v4 = a3;
  id v5 = [(AEMessagesShelfViewController *)self _sceneController];
  id v6 = [v5 tilingController];
  id v7 = v6;
  if (v6) {
    [v6 tileIdentifierForTile:v4];
  }
}

- (id)assetsScene:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 tilingController];
  long long v8 = [v6 tilingController:v7 transitionAnimationCoordinatorForChange:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setDelayInsertions:1];
  }
  long long v9 = [[AEDelegatingTransitionAnimationCoordinator alloc] initWithWrappedCoordinator:v8];
  [(AEDelegatingTransitionAnimationCoordinator *)v9 setEnableDoubleSidedAnimations:1];

  return v9;
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  id v5 = a4;
  id v6 = [(PXAssetsTilingLayout *)[AEMessagesShelfLayout alloc] initWithDataSource:v5];

  [(AEMessagesShelfLayout *)v6 setDelegate:self];
  return v6;
}

- (id)framesOfVisibleContentViewInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(AEMessagesShelfViewController *)self _scrollViewController];
  id v6 = [v5 contentCoordinateSpace];
  [v5 visibleRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [(AEMessagesShelfViewController *)self _tilingController];
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __77__AEMessagesShelfViewController_framesOfVisibleContentViewInCoordinateSpace___block_invoke;
  v22[3] = &unk_26489B698;
  id v23 = v6;
  id v24 = v4;
  id v25 = v16;
  id v17 = v16;
  id v18 = v4;
  id v19 = v6;
  objc_msgSend(v15, "enumerateTilesInRect:withOptions:usingBlock:", 0, v22, v8, v10, v12, v14);
  long long v20 = (void *)[v17 copy];

  return v20;
}

void __77__AEMessagesShelfViewController_framesOfVisibleContentViewInCoordinateSpace___block_invoke(uint64_t a1, void *a2, uint64_t a3, double *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10 = a7;
  if (*a2 == 5 && a2[1] == *MEMORY[0x263F5E200])
  {
    id v12 = v10;
    objc_msgSend(*(id *)(a1 + 32), "convertRect:toCoordinateSpace:", *(void *)(a1 + 40), *a4, a4[1], a4[2], a4[3]);
    double v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:");
    [*(id *)(a1 + 48) addObject:v11];

    id v10 = v12;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v4 = objc_msgSend(MEMORY[0x263F31AB0], "sharedBehaviors", a3.width, a3.height);
  [v4 entryViewMaxPluginShelfHeight];
  double v6 = v5;

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.CGFloat width = v7;
  return result;
}

- (BOOL)wantsEdgeToEdgeLayout
{
  return 1;
}

- (BOOL)layoutShouldShowCancelButtons:(id)a3
{
  return ([(AEMessagesShelfViewController *)self _options] & 1) == 0;
}

- (BOOL)layoutShouldShowVideoDuration:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  uint64_t v4 = [v3 statusBarOrientation];

  return (unint64_t)(v4 - 1) < 2;
}

- (double)layout:(id)a3 itemAtIndexPathDuration:(PXSimpleIndexPath *)a4
{
  double v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  double v7 = [v5 assetAtItemIndexPath:v11];
  [v7 duration];
  double v9 = v8;

  return v9;
}

- (BOOL)layout:(id)a3 itemAtIndexPathIsSpatial:(PXSimpleIndexPath *)a4
{
  double v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v6;
  double v7 = [v5 assetAtItemIndexPath:v10];
  unint64_t v8 = ((unint64_t)[v7 mediaSubtypes] >> 10) & 1;

  return v8;
}

- (BOOL)layout:(id)a3 itemAtIndexPathIsAnimatedImage:(PXSimpleIndexPath *)a4
{
  double v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v6;
  double v7 = [v5 assetAtItemIndexPath:v10];
  BOOL v8 = [v7 playbackStyle] == 2;

  return v8;
}

- (BOOL)layout:(id)a3 itemAtIndexPathIsLoop:(PXSimpleIndexPath *)a4
{
  double v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v6;
  double v7 = [v5 assetAtItemIndexPath:v10];
  BOOL v8 = [v7 playbackStyle] == 5;

  return v8;
}

- (BOOL)layout:(id)a3 itemAtIndexPathIsVideo:(PXSimpleIndexPath *)a4
{
  double v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v6;
  double v7 = [v5 assetAtItemIndexPath:v10];
  BOOL v8 = [v7 playbackStyle] == 4;

  return v8;
}

- (int64_t)layout:(id)a3 generationStateForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  if (!_os_feature_enabled_impl()
    || !_os_feature_enabled_impl()
    || ![MEMORY[0x263F0F6A8] isAvailable])
  {
    return 0;
  }
  long long v6 = [(AEMessagesShelfViewController *)self _packageTransport];
  double v7 = [v6 orderedStagedIdentifiers];
  unint64_t item = a4->item;
  if (item >= [v7 count])
  {
    int64_t v13 = 0;
  }
  else
  {
    double v9 = [v7 objectAtIndex:a4->item];
    id v10 = [v6 stagedPackageForIdentifier:v9];
    int v11 = [v10 containsGenerationRecipeData];
    unsigned int v12 = [v10 containsGenerationSourceImage];
    if (v11) {
      int64_t v13 = 2;
    }
    else {
      int64_t v13 = v12;
    }
  }
  return v13;
}

- (int64_t)layout:(id)a3 irisToggleStateForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  double v5 = [(AEMessagesShelfViewController *)self _packageTransport];
  long long v6 = [v5 orderedStagedIdentifiers];
  unint64_t item = a4->item;
  if (item >= [v6 count])
  {
    int64_t v10 = 0;
  }
  else
  {
    BOOL v8 = [v6 objectAtIndex:a4->item];
    double v9 = [v5 stagedPackageForIdentifier:v8];
    if ([v9 containsLivePhotoContent])
    {
      if ([v9 containsSuppressedLivePhoto]) {
        int64_t v10 = 1;
      }
      else {
        int64_t v10 = 2;
      }
    }
    else
    {
      int64_t v10 = 0;
    }
  }
  return v10;
}

- (double)layout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  double v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v12[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v12[1] = v6;
  double v7 = [v5 assetReferenceAtItemIndexPath:v12];
  BOOL v8 = [v7 asset];
  [v8 aspectRatio];
  double v10 = v9;

  return v10;
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(AEMessagesShelfViewController *)self _sceneController];
  int64_t v9 = [(AEMessagesShelfViewController *)self _indexToScrollTo];
  if (v9 < 0)
  {
    [v8 tilingController:v6 initialVisibleOriginForLayout:v7];
    double v16 = v17;
    double v15 = v18;
  }
  else
  {
    int64_t v10 = v9;
    id v11 = v7;
    unsigned int v12 = [v11 dataSource];
    uint64_t v13 = [v12 identifier];
    memset(v25, 0, sizeof(v25));
    uint64_t v14 = *MEMORY[0x263F5E200];
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v24 = 0;
    v21[0] = 5;
    v21[1] = v14;
    v21[2] = v13;
    v21[3] = 0;
    v21[4] = v10;
    v21[5] = 0x7FFFFFFFFFFFFFFFLL;
    LODWORD(v10) = [v11 getGeometry:v25 group:0 userData:0 forTileWithIdentifier:v21];

    [(AEMessagesShelfViewController *)self _setIndexToScrollTo:-1];
    double v15 = 0.0;
    if (v10) {
      double v16 = *(double *)v25;
    }
    else {
      double v16 = 0.0;
    }
  }
  double v19 = v16;
  double v20 = v15;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)AEMessagesShelfViewControllerTransportPackageTransportObserverContext == a5) {
    [(AEMessagesShelfViewController *)self _transportStagingStateDidChange];
  }
}

- (void)_transportStagingStateDidChange
{
  char v3 = [(AEMessagesShelfViewController *)self _packageTransport];
  uint64_t v4 = [v3 orderedStagedIdentifiers];
  double v5 = [(AEMessagesShelfViewController *)self _dataSource];
  id v6 = [v5 orderedIdentifiers];
  id v7 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];
  BOOL v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v6];
  int64_t v9 = (void *)[v8 mutableCopy];
  [v9 minusOrderedSet:v7];
  int64_t v10 = (void *)[v7 mutableCopy];
  [v10 intersectOrderedSet:v8];
  id v11 = (void *)[v7 mutableCopy];
  [v11 minusOrderedSet:v8];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  long long v22 = __64__AEMessagesShelfViewController__transportStagingStateDidChange__block_invoke;
  long long v23 = &unk_26489B670;
  id v24 = v9;
  id v12 = v5;
  id v25 = v12;
  id v26 = v10;
  id v27 = v3;
  id v28 = v11;
  id v13 = v4;
  id v29 = v13;
  id v19 = v11;
  id v18 = v3;
  id v14 = v10;
  id v15 = v9;
  [v12 performChanges:&v20];
  double v16 = [v12 orderedIdentifiers];
  unint64_t v17 = [v16 count];
  if (v17 > [v6 count]) {
    -[AEMessagesShelfViewController _setIndexToScrollTo:](self, "_setIndexToScrollTo:", objc_msgSend(v13, "count", v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29) - 1);
  }
}

void __64__AEMessagesShelfViewController__transportStagingStateDidChange__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v33;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) removeAssetWithIdentifier:*(void *)(*((void *)&v32 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v4);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(a1 + 56) stagedPackageForIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * v11)];
        id v13 = [v12 reviewAssetFromPackageMetadata];
        [*(id *)(a1 + 40) replaceAsset:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v9);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = *(id *)(a1 + 64);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(a1 + 56), "stagedPackageForIdentifier:", *(void *)(*((void *)&v24 + 1) + 8 * v18), (void)v24);
        uint64_t v20 = [v19 reviewAssetFromPackageMetadata];
        uint64_t v21 = *(void **)(a1 + 72);
        long long v22 = [v19 identifier];
        uint64_t v23 = [v21 indexOfObject:v22];

        [*(id *)(a1 + 40) insertAsset:v20 atIndex:v23];
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v16);
  }
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)AEMessagesShelfViewController;
  [(AEMessagesShelfViewController *)&v14 viewDidLoad];
  uint64_t v3 = [(AEMessagesShelfViewController *)self _sceneController];
  uint64_t v4 = [v3 viewTileReusePool];
  +[AEDecorativeTileSource registerCommonDecorativeTilesToReusePool:v4];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __44__AEMessagesShelfViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_26489B648;
  objc_copyWeak(&v12, &location);
  [v4 registerReusableObjectForReuseIdentifier:1313817680 creationHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_2;
  v9[3] = &unk_26489B648;
  objc_copyWeak(&v10, &location);
  [v4 registerReusableObjectForReuseIdentifier:1295210292 creationHandler:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_3;
  v7[3] = &unk_26489B648;
  objc_copyWeak(&v8, &location);
  [v4 registerReusableObjectForReuseIdentifier:1295210293 creationHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_4;
  v5[3] = &unk_26489B648;
  objc_copyWeak(&v6, &location);
  [v4 registerReusableObjectForReuseIdentifier:1277777777 creationHandler:v5];
  [v4 registerReusableObjectForReuseIdentifier:1500001338 creationHandler:&__block_literal_global];
  [v4 registerReusableObjectForReuseIdentifier:1215219281 creationHandler:&__block_literal_global_381];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v2 = +[AEMessagesShelfRoundButton roundButtonWithStyle:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v2 addTarget:WeakRetained action:sel__removeFromShelf_ forControlEvents:64];

  return v2;
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id v2 = +[AEMessagesShelfRoundButton roundButtonWithStyle:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v2 addTarget:WeakRetained action:sel__toggleIris_ forControlEvents:64];

  return v2;
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id v2 = +[AEMessagesShelfRoundButton roundButtonWithStyle:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v2 addTarget:WeakRetained action:sel__toggleIris_ forControlEvents:64];

  return v2;
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id v2 = +[AEGenerativePlaygroundButton buttonWithType:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v2 addTarget:WeakRetained action:sel__didTapGenerationButton_ forControlEvents:64];

  return v2;
}

_AEDurationLabelTile *__44__AEMessagesShelfViewController_viewDidLoad__block_invoke_6()
{
  v0 = objc_alloc_init(_AEDurationLabelTile);
  v1 = [MEMORY[0x263F825C8] clearColor];
  [(_AEDurationLabelTile *)v0 setBackgroundColor:v1];

  id v2 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  [(_AEDurationLabelTile *)v0 setFont:v2];

  uint64_t v3 = [MEMORY[0x263F825C8] whiteColor];
  [(_AEDurationLabelTile *)v0 setTextColor:v3];

  [(_AEDurationLabelTile *)v0 setTextAlignment:2];
  return v0;
}

id __44__AEMessagesShelfViewController_viewDidLoad__block_invoke_5()
{
  v0 = (void *)MEMORY[0x263F827E8];
  v1 = objc_msgSend(MEMORY[0x263F086E0], "px_bundle");
  id v2 = [v0 imageNamed:@"spatial" inBundle:v1];

  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v2];
  return v3;
}

- (void)loadView
{
  uint64_t v3 = [(AEMessagesShelfViewController *)self _scrollViewController];
  id v6 = [v3 scrollView];

  uint64_t v4 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBackgroundColor:v4];

  [v6 setShowsVerticalScrollIndicator:0];
  [v6 setShowsHorizontalScrollIndicator:0];
  [v6 setUserInteractionEnabled:1];
  [(AEMessagesShelfViewController *)self setView:v6];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTap_];
  [v5 setDelegate:self];
  [v6 addGestureRecognizer:v5];
}

- (void)_dismissPresentedReviewController:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    [a3 dismissViewControllerAnimated:a4 completion:0];
    presentedReviewController = self->_presentedReviewController;
    self->_presentedReviewController = 0;
  }
}

- (void)_presentReviewViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AEMessagesShelfViewController *)self entryViewDelegate];
  char v6 = objc_opt_respondsToSelector();
  id v7 = PLAssetExplorerGetLog();
  presentedReviewController = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B526000, presentedReviewController, OS_LOG_TYPE_DEFAULT, "Will present review controller.", buf, 2u);
    }

    [v5 presentViewController:v4 animated:1 completion:0];
    uint64_t v9 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_22B526000, v9, OS_LOG_TYPE_DEFAULT, "Did present review controller.", v12, 2u);
    }

    id v10 = (PUAssetExplorerReviewScreenViewController *)v4;
    presentedReviewController = self->_presentedReviewController;
    self->_presentedReviewController = v10;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_22B526000, presentedReviewController, OS_LOG_TYPE_ERROR, "Unable to present review controller.", v11, 2u);
  }
}

- (PUAssetExplorerAnalytics)assetExplorerAnalytics
{
  assetExplorerAnalytics = self->_assetExplorerAnalytics;
  if (!assetExplorerAnalytics)
  {
    id v4 = (PUAssetExplorerAnalytics *)objc_alloc_init(MEMORY[0x263F5E3C0]);
    uint64_t v5 = self->_assetExplorerAnalytics;
    self->_assetExplorerAnalytics = v4;

    assetExplorerAnalytics = self->_assetExplorerAnalytics;
  }
  return assetExplorerAnalytics;
}

- (void)dealloc
{
  [(AEMessagesShelfViewController *)self _dismissPresentedReviewController:self->_presentedReviewController animated:0];
  v3.receiver = self;
  v3.super_class = (Class)AEMessagesShelfViewController;
  [(AEMessagesShelfViewController *)&v3 dealloc];
}

- (AEMessagesShelfViewController)initWithPackageTransport:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AEMessagesShelfViewController;
  id v8 = [(AEMessagesShelfViewController *)&v35 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->__options = a4;
    objc_storeStrong((id *)&v8->__packageTransport, a3);
    [(AEPackageTransport *)v9->__packageTransport registerChangeObserver:v9 context:AEMessagesShelfViewControllerTransportPackageTransportObserverContext];
    id v10 = (PUReviewDataSource *)objc_alloc_init(MEMORY[0x263F5E460]);
    dataSource = v9->__dataSource;
    v9->__dataSource = v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F5E450]) initWithReviewDataSource:v9->__dataSource];
    internalReviewDataSourceManager = v9->__internalReviewDataSourceManager;
    v9->__internalReviewDataSourceManager = (PUReviewAssetsDataSourceManager *)v12;

    objc_super v14 = (PUReviewAssetsMediaProvider *)objc_alloc_init(MEMORY[0x263F5E458]);
    internalReviewMediaProvider = v9->__internalReviewMediaProvider;
    v9->__internalReviewMediaProvider = v14;

    uint64_t v16 = [[AEWrappedMediaProvider alloc] initWithMediaProvider:v9->__internalReviewMediaProvider];
    uint64_t v17 = objc_alloc_init(AEWrappedDataSourceManager);
    wrappedDataSourceManager = v9->__wrappedDataSourceManager;
    v9->__wrappedDataSourceManager = v17;

    [(AEWrappedDataSourceManager *)v9->__wrappedDataSourceManager attachDataSourceManager:v9->__internalReviewDataSourceManager];
    id v19 = [(PXSectionedDataSourceManager *)v9->__wrappedDataSourceManager dataSource];
    uint64_t v20 = [(PXAssetsTilingLayout *)[AEMessagesShelfLayout alloc] initWithDataSource:v19];
    id v21 = objc_alloc(MEMORY[0x263F5E1E0]);
    long long v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v22 registerObserver:v9];
    scrollViewController = v9->__scrollViewController;
    v9->__scrollViewController = (PXScrollViewController *)v22;
    id v24 = v22;

    long long v25 = (PXBasicUIViewTileAnimator *)objc_alloc_init(MEMORY[0x263F5E140]);
    tileAnimator = v9->__tileAnimator;
    v9->__tileAnimator = v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x263F5E1C0]) initWithLayout:v20];
    tilingController = v9->__tilingController;
    v9->__tilingController = (PXTilingController *)v27;

    [(PXTilingController *)v9->__tilingController setScrollController:v9->__scrollViewController];
    [(PXTilingController *)v9->__tilingController setTileAnimator:v9->__tileAnimator];
    [(PXTilingController *)v9->__tilingController setScrollDelegate:v9];
    long long v29 = (void *)[objc_alloc(MEMORY[0x263F5E1D8]) initWithTilingController:v9->__tilingController mediaProvider:v16 dataSourceManager:v9->__wrappedDataSourceManager delegate:v9];
    [v29 setContentTileCornerRadius:12.5];
    [v29 setAnimatesContent:1];
    [v29 setAutoplayBehavior:3];
    [(PXTilingController *)v9->__tilingController setTileSource:v9];
    [(PXTilingController *)v9->__tilingController setTransitionDelegate:v29];
    sceneController = v9->__sceneController;
    v9->__sceneController = (PXAssetsScene *)v29;
    id v31 = v29;

    long long v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    tilesInUse = v9->__tilesInUse;
    v9->__tilesInUse = v32;

    v9->__indexToScrollTo = -1;
    [(AEMessagesShelfViewController *)v9 _transportStagingStateDidChange];
  }
  return v9;
}

- (AEMessagesShelfViewController)initWithPackageTransport:(id)a3
{
  return [(AEMessagesShelfViewController *)self initWithPackageTransport:a3 options:0];
}

@end