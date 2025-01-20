@interface CAMCameraRollController
- (BOOL)_allowUpdating;
- (BOOL)_didStopCaptureSession;
- (BOOL)_isDeferringStagedMediaLoading;
- (BOOL)_isOneUpFullyPresented;
- (BOOL)_isOneUpVisible;
- (BOOL)_isPhotoLibraryLocked;
- (BOOL)_observeCameraPreviewWellChanges;
- (BOOL)_outputToExternalStorage;
- (BOOL)_preheatQueue_shouldSkipPhotosFrameworkPreheat;
- (BOOL)_preparingUndoActionsInvalidator;
- (BOOL)_shouldRequestUnlock;
- (BOOL)_transientAssetsAreValid;
- (BOOL)_updateIsScheduled;
- (BOOL)canPresentCameraRollViewController;
- (BOOL)dismissCameraRollViewControllerForced:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)isCameraRollViewControllerPresented;
- (BOOL)isCaptureSessionCurrent:(unsigned __int16)a3;
- (BOOL)oneUpPresentationHelperEnableFreezeLayoutOnOrientationChange:(id)a3;
- (BOOL)oneUpPresentationHelperPreventAlbumAttributionWidget:(id)a3;
- (BOOL)oneUpPresentationHelperPreventHideAssetAction:(id)a3;
- (BOOL)oneUpPresentationHelperPreventPeopleOrnament:(id)a3;
- (BOOL)oneUpPresentationHelperPreventRevealInMomentAction:(id)a3;
- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3;
- (BOOL)prefersPresentingStatusbarHidden;
- (BOOL)shouldStartPreviewingSimultaneouslyWithGestureRecognizer:(id)a3;
- (BOOL)wantsInstalledPhotosAppActions;
- (CAMCameraRollController)init;
- (CAMCameraRollControllerImageWellDelegate)imageWellDelegate;
- (CAMCameraRollControllerPresentationDelegate)presentationDelegate;
- (CAMCameraRollControllerSessionDelegate)sessionDelegate;
- (CAMExternalStorage)externalStorage;
- (CAMTransientDataSource)_transientDataSource;
- (CAMTransientImageManager)_transientImageManager;
- (CGRect)oneUpPresentationHelper:(id)a3 rectForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5 contentsRect:(CGRect *)a6;
- (NSMutableDictionary)_HDRUUIDToIgnoredEV0UUIDs;
- (NSMutableSet)_ignoredEV0UUIDs;
- (NSMutableSet)_outgoingOneUpPresentationHelpers;
- (NSMutableSet)_sessionAssetUUIDs;
- (OS_dispatch_queue)_photosFrameworksPreheatQueue;
- (PUBrowsingSession)_externalStorageBrowsingSession;
- (PUOneUpPresentationHelper)_oneUpPresentationHelper;
- (PUOneUpViewController)oneUpViewController;
- (PUPhotoKitDataSourceManager)_photoKitDataSourceManager;
- (PXPhotosDataSource)_photosDataSource;
- (PXPhotosDataSource)_stagedDataSource;
- (PXUndoActionsInvalidator)_undoActionsInvalidator;
- (UIGestureRecognizer)previewGestureRecognizer;
- (UIImage)_externalStorageBrowsingSessionLastThumbnailImage;
- (id)_cameraRollCollectionListFetchResult;
- (id)oneUpPresentationHelperViewController:(id)a3;
- (id)persistedThumbnailImage;
- (id)previewPresentationTransitioningDelegateForPosition:(CGPoint)a3 inSourceView:(id)a4;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (int64_t)_externalStorageBrowsingSessionThumbnailRequest;
- (int64_t)oneUpPresentationHelperPreferredBarStyle:(id)a3;
- (int64_t)oneUpPresentationHelperPreferredPresentationOrientation:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (int64_t)photosAppInstallationState;
- (unint64_t)currentAssetIndexFromEnd;
- (unsigned)sessionIdentifier;
- (void)_createPhotosDatasourceIfNeededWithAllowedUUIds:(id)a3 animated:(BOOL)a4;
- (void)_createUndoActionsInvalidatorAsynchronouslyIfNeededWithPhotoLibrary:(id)a3;
- (void)_ensureCameraRollViewController;
- (void)_invalidateTransientAssets;
- (void)_scheduleUpdateIfOneUpIsActive;
- (void)_setAllowUpdating:(BOOL)a3;
- (void)_setDeferringStagedMediaLoading:(BOOL)a3;
- (void)_setDidStopCaptureSession:(BOOL)a3;
- (void)_setExternalStorageBrowsingSession:(id)a3;
- (void)_setObserveCameraPreviewWellChanges:(BOOL)a3;
- (void)_setOneUpFullyPresented:(BOOL)a3;
- (void)_setOneUpVisible:(BOOL)a3;
- (void)_setPhotosDataSource:(id)a3;
- (void)_setPrefersPresentingStatusbarHidden:(BOOL)a3;
- (void)_setPreheatQueue_shouldSkipPhotosFrameworkPreheat:(BOOL)a3;
- (void)_setPreviewGestureRecognizer:(id)a3;
- (void)_setSessionIdentifier:(unsigned __int16)a3;
- (void)_setStagedDataSource:(id)a3;
- (void)_setTransientAssetsAreValid:(BOOL)a3;
- (void)_setUpdateIsScheduled:(BOOL)a3;
- (void)_startNewSession;
- (void)_stopCaptureSessionIfNecessary;
- (void)_update;
- (void)_updateAnimated:(BOOL)a3;
- (void)_updateExternalStorageThumbnail:(id)a3 withUUID:(id)a4;
- (void)_updateTransientDataSourceIfNeeded;
- (void)animateRevealWithInteractionProgress:(id)a3 forPreviewingAtLocation:(CGPoint)a4 inSourceView:(id)a5 containerView:(id)a6;
- (void)applicationWillEnterForeground:(id)a3;
- (void)beginAllowingStagedMediaLoading;
- (void)cameraPreviewWellImageDidChange:(id)a3;
- (void)clearIgnoredImageWellUUIDs;
- (void)dealloc;
- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4;
- (void)didPersistAssetWithUUID:(id)a3 captureSession:(unsigned __int16)a4;
- (void)handlePresentingPanGestureRecognizer:(id)a3;
- (void)ignoreImageWellChangeNotificationForEV0UUID:(id)a3 withHDRUUID:(id)a4;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4;
- (void)oneUpPresentationHelper:(id)a3 previewScrubberDidBecomeAvailable:(id)a4;
- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4;
- (void)oneUpPresentationHelper:(id)a3 willPresentOneUpViewController:(id)a4;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)ppt_awaitPreload:(id)a3;
- (void)preload;
- (void)presentCameraRollViewControllerAnimated:(BOOL)a3 interactive:(BOOL)a4 deferringStagedMediaLoading:(BOOL)a5;
- (void)presentingViewControllerViewDidAppear:(BOOL)a3;
- (void)presentingViewControllerViewDidDisappear:(BOOL)a3;
- (void)presentingViewControllerViewWillAppear:(BOOL)a3;
- (void)presentingViewControllerViewWillDisappear:(BOOL)a3;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)prewarmPhotosAppInstallationState;
- (void)processPendingBursts;
- (void)processTransientAssetUpdate:(id)a3 preventingInsertion:(BOOL)a4 persistenceOptions:(int64_t)a5;
- (void)processTransientPairedVideoUpdate:(id)a3 filterType:(int64_t)a4;
- (void)resetNavigation;
- (void)setCurrentAssetIndexFromEnd:(unint64_t)a3;
- (void)setExternalStorage:(id)a3;
- (void)setImageWellDelegate:(id)a3;
- (void)setPhotosAppInstallationState:(int64_t)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSessionDelegate:(id)a3;
- (void)set_externalStorageBrowsingSessionLastThumbnailImage:(id)a3;
- (void)set_externalStorageBrowsingSessionThumbnailRequest:(int64_t)a3;
- (void)set_oneUpPresentationHelper:(id)a3;
- (void)set_photoKitDataSourceManager:(id)a3;
- (void)set_preparingUndoActionsInvalidator:(BOOL)a3;
- (void)willPersistAssetWithUUID:(id)a3 captureSession:(unsigned __int16)a4;
- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5;
@end

@implementation CAMCameraRollController

- (CAMCameraRollController)init
{
  v20.receiver = self;
  v20.super_class = (Class)CAMCameraRollController;
  v2 = [(CAMCameraRollController *)&v20 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    sessionAssetUUIDs = v2->__sessionAssetUUIDs;
    v2->__sessionAssetUUIDs = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    ignoredEV0UUIDs = v2->__ignoredEV0UUIDs;
    v2->__ignoredEV0UUIDs = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    HDRUUIDToIgnoredEV0UUIDs = v2->__HDRUUIDToIgnoredEV0UUIDs;
    v2->__HDRUUIDToIgnoredEV0UUIDs = v7;

    v9 = objc_alloc_init(CAMTransientDataSource);
    transientDataSource = v2->__transientDataSource;
    v2->__transientDataSource = v9;

    v11 = objc_alloc_init(CAMTransientImageManager);
    transientImageManager = v2->__transientImageManager;
    v2->__transientImageManager = v11;

    v2->_sessionIdentifier = 1;
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.camera.photo-frameworks-preheat", v13);
    photosFrameworksPreheatQueue = v2->__photosFrameworksPreheatQueue;
    v2->__photosFrameworksPreheatQueue = (OS_dispatch_queue *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    outgoingOneUpPresentationHelpers = v2->__outgoingOneUpPresentationHelpers;
    v2->__outgoingOneUpPresentationHelpers = v16;

    v2->_prefersPresentingStatusbarHidden = 1;
    v18 = +[CAMPriorityNotificationCenter defaultCenter];
    [v18 addObserver:v2 priority:0 selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
    [v18 addObserver:v2 priority:0 selector:sel_applicationResumed_ name:*MEMORY[0x263F83388] object:0];
    [v18 addObserver:v2 priority:0 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
  }
  return v2;
}

- (void)setImageWellDelegate:(id)a3
{
}

- (void)setSessionDelegate:(id)a3
{
}

- (void)setPresentationDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presentationDelegate, obj);
    self->_presentationDelegateFlags.respondsToSourceAssetRect = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToShouldHideSourceAsset = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToPreviewGestureDidBecomeAvailable = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToPreviewSourceRect = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToImageForReveal = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToRevealWillBegin = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToRevealDidEnd = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToWillPresentCameraRoll = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToPrefersPresentingStatusbarHiddenDidChange = objc_opt_respondsToSelector() & 1;
    self->_presentationDelegateFlags.respondsToPreferredPresentationOrientation = objc_opt_respondsToSelector() & 1;
  }
}

- (BOOL)prefersPresentingStatusbarHidden
{
  return self->_prefersPresentingStatusbarHidden;
}

- (BOOL)isCameraRollViewControllerPresented
{
  v2 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  char v3 = [v2 isOneUpPresented];

  return v3;
}

- (PUOneUpPresentationHelper)_oneUpPresentationHelper
{
  return self->__oneUpPresentationHelper;
}

- (UIGestureRecognizer)previewGestureRecognizer
{
  return self->_previewGestureRecognizer;
}

- (id)persistedThumbnailImage
{
  if ([(CAMCameraRollController *)self _outputToExternalStorage])
  {
    char v3 = [(CAMCameraRollController *)self _externalStorageBrowsingSessionLastThumbnailImage];
  }
  else if ([(CAMCameraRollController *)self _isPhotoLibraryLocked])
  {
    char v3 = 0;
  }
  else
  {
    char v3 = [MEMORY[0x263F5DB28] cameraPreviewWellImage];
  }
  return v3;
}

- (void)presentingViewControllerViewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Viewfinder will appear", v10, 2u);
  }

  v6 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  [v6 presentingViewControllerViewWillAppear:v3];

  [(CAMCameraRollController *)self prewarmPhotosAppInstallationState];
  BOOL v7 = [(CAMCameraRollController *)self _didStopCaptureSession];
  [(CAMCameraRollController *)self _setDidStopCaptureSession:0];
  if ([(CAMCameraRollController *)self _isOneUpVisible])
  {
    if (v7)
    {
      v8 = [MEMORY[0x263F82438] sharedApplication];
      BOOL v7 = [v8 applicationState] != 2;
    }
    v9 = [(CAMCameraRollController *)self presentationDelegate];
    [v9 cameraRollController:self willShowPresentingViewControllerShouldStartCaptureSession:v7];
  }
  [(CAMCameraRollController *)self _setPrefersPresentingStatusbarHidden:1];
}

- (BOOL)_didStopCaptureSession
{
  return self->__didStopCaptureSession;
}

- (void)_setDidStopCaptureSession:(BOOL)a3
{
  self->__didStopCaptureSession = a3;
}

- (BOOL)_isOneUpVisible
{
  return self->__oneUpVisible;
}

- (void)_setPrefersPresentingStatusbarHidden:(BOOL)a3
{
  if (self->_prefersPresentingStatusbarHidden != a3)
  {
    self->_prefersPresentingStatusbarHidden = a3;
    if (self->_presentationDelegateFlags.respondsToPrefersPresentingStatusbarHiddenDidChange)
    {
      id v4 = [(CAMCameraRollController *)self presentationDelegate];
      [v4 cameraRollControllerPrefersPresentingStatusbarHiddenDidChange:self];
    }
  }
}

- (void)presentingViewControllerViewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Viewfinder did appear", v8, 2u);
  }

  v6 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  [v6 presentingViewControllerViewDidAppear:v3];

  if ([(CAMCameraRollController *)self _isOneUpFullyPresented])
  {
    BOOL v7 = [(CAMCameraRollController *)self presentationDelegate];
    [v7 cameraRollControllerDidDismissFullyPresentedCameraRoll:self];
  }
  [(CAMCameraRollController *)self _setOneUpFullyPresented:0];
  [(CAMCameraRollController *)self _setOneUpVisible:0];
}

- (BOOL)_isOneUpFullyPresented
{
  return self->__oneUpFullyPresented;
}

- (void)_setOneUpFullyPresented:(BOOL)a3
{
  self->__oneUpFullyPresented = a3;
}

- (void)_setOneUpVisible:(BOOL)a3
{
  self->__oneUpVisible = a3;
}

- (void)preload
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, self);
  id v4 = camSoftLinkQueue();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__CAMCameraRollController_preload__block_invoke;
  v6[3] = &unk_263FA2CD0;
  v6[4] = self;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&Current;
  dispatch_async(v4, v6);

  v5 = camSoftLinkQueue();
  dispatch_async(v5, &__block_literal_global_15);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __34__CAMCameraRollController_preload__block_invoke(id *a1)
{
  v2 = [a1[4] _photosFrameworksPreheatQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CAMCameraRollController_preload__block_invoke_2;
  block[3] = &unk_263FA1FD0;
  objc_copyWeak(v4, a1 + 5);
  block[4] = a1[4];
  v4[1] = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(v4);
}

void __34__CAMCameraRollController_preload__block_invoke_2(uint64_t a1)
{
  CAMSignpostWithIDAndArgs(33, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __34__CAMCameraRollController_preload__block_invoke_3;
  v2[3] = &unk_263FA1FD0;
  objc_copyWeak(v3, (id *)(a1 + 40));
  v2[4] = *(void *)(a1 + 32);
  v3[1] = *(id *)(a1 + 48);
  __34__CAMCameraRollController_preload__block_invoke_3((uint64_t)v2);
  CAMSignpostWithIDAndArgs(34, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_destroyWeak(v3);
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isCaptureSessionCurrent:(unsigned __int16)a3
{
  return [(CAMCameraRollController *)self sessionIdentifier] == a3;
}

- (void)willPersistAssetWithUUID:(id)a3 captureSession:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v6)
  {
    BOOL v7 = [(CAMCameraRollController *)self _isPhotoLibraryLocked];
    int v8 = [(CAMCameraRollController *)self sessionIdentifier];
    if (v7 && (int v9 = v8, v8 != v4))
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CAMCameraRollController willPersistAssetWithUUID:captureSession:]((uint64_t)v6, v9, v10);
      }
    }
    else
    {
      v10 = [(CAMCameraRollController *)self _sessionAssetUUIDs];
      [v10 addObject:v6];
    }
  }
}

- (NSMutableSet)_sessionAssetUUIDs
{
  return self->__sessionAssetUUIDs;
}

- (CAMTransientDataSource)_transientDataSource
{
  return self->__transientDataSource;
}

- (void)didPersistAssetWithUUID:(id)a3 captureSession:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v6)
  {
    BOOL v7 = [(CAMCameraRollController *)self _isPhotoLibraryLocked];
    int v8 = [(CAMCameraRollController *)self sessionIdentifier];
    if (!v7 || v8 == v4)
    {
      v10 = [(CAMCameraRollController *)self _sessionAssetUUIDs];
      [v10 addObject:v6];

      [(CAMCameraRollController *)self _scheduleUpdateIfOneUpIsActive];
      objc_initWeak(&location, self);
      dispatch_time_t v11 = dispatch_time(0, 45000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__CAMCameraRollController_didPersistAssetWithUUID_captureSession___block_invoke;
      block[3] = &unk_263FA0868;
      objc_copyWeak(&v15, &location);
      id v14 = v6;
      v12 = (void *)MEMORY[0x263EF83A0];
      dispatch_after(v11, MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      int v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CAMCameraRollController didPersistAssetWithUUID:captureSession:]((uint64_t)v6, self);
      }
    }
  }
}

- (void)_scheduleUpdateIfOneUpIsActive
{
  if (![(CAMCameraRollController *)self _updateIsScheduled])
  {
    BOOL v3 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
    int v4 = [v3 isOneUpPresented];

    if (v4)
    {
      [(CAMCameraRollController *)self _setUpdateIsScheduled:1];
      objc_initWeak(&location, self);
      dispatch_time_t v5 = dispatch_time(0, 500000000);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __57__CAMCameraRollController__scheduleUpdateIfOneUpIsActive__block_invoke;
      v6[3] = &unk_263FA0E00;
      objc_copyWeak(&v7, &location);
      dispatch_after(v5, MEMORY[0x263EF83A0], v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_updateIsScheduled
{
  return self->__updateIsScheduled;
}

void __34__CAMCameraRollController_preload__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "_preheatQueue_shouldSkipPhotosFrameworkPreheat") & 1) == 0)
  {
    BOOL v3 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
    [v3 registerChangeObserver:WeakRetained];
    [v3 unregisterChangeObserver:WeakRetained];
    id v4 = (id)[MEMORY[0x263F5E410] sharedInstance];
    id v5 = (id)[WeakRetained _cameraRollCollectionListFetchResult];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CAMCameraRollController_preload__block_invoke_4;
  block[3] = &unk_263FA0208;
  void block[4] = *(void *)(a1 + 32);
  if (CAMCameraRollControllerDeferredMediaLoadingReason_block_invoke_onceTokenCPAnalytics != -1) {
    dispatch_once(&CAMCameraRollControllerDeferredMediaLoadingReason_block_invoke_onceTokenCPAnalytics, block);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v7 = *(double *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__CAMCameraRollController_preload__block_invoke_5;
  v8[3] = &unk_263FA2BC8;
  v8[4] = *(void *)(a1 + 32);
  *(double *)&v8[5] = v7;
  *(double *)&v8[6] = Current - v7;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __34__CAMCameraRollController_preload__block_invoke_4()
{
  id v2 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  v0 = (void *)MEMORY[0x263F2FA10];
  v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  [v0 setupWithConfigurationFilename:@"CPAnalyticsConfig-Camera" inBundle:v1];

  [MEMORY[0x263F2FA10] setupSystemPropertyProvidersForLibrary:v2];
  objc_msgSend(MEMORY[0x263F82438], "pu_prepareCPAnalytics");
}

void __34__CAMCameraRollController_preload__block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CAMSignpostWithIDAndArgs(68, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  [MEMORY[0x263F2FA10] startAppTracking];
  [MEMORY[0x263F2FA10] startViewTracking];
  [MEMORY[0x263F2FA10] activateEventQueue];
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  char v3 = [v2 launchedToTest];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) _ensureCameraRollViewController];
    double Current = CFAbsoluteTimeGetCurrent();
    double v5 = *(double *)(a1 + 40);
    id v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = Current - v5 - *(double *)(a1 + 48);
      int v11 = 134218240;
      double v12 = Current - v5;
      __int16 v13 = 2048;
      double v14 = v7;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "preflightCameraRollFrameworks complete! (took %.3f seconds total, %.3f seconds on main)", (uint8_t *)&v11, 0x16u);
    }

    int v8 = [MEMORY[0x263F82438] sharedApplication];
    int v9 = [v8 delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 updateShortcutItemsForApplication:v8];
    }
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"CAMRegisterAppShortcuts" object:0];
  }
  CAMSignpostWithIDAndArgs(69, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (OS_dispatch_queue)_photosFrameworksPreheatQueue
{
  return self->__photosFrameworksPreheatQueue;
}

- (void)_startNewSession
{
  BOOL v3 = [(CAMCameraRollController *)self _isPhotoLibraryLocked];
  id v8 = [(CAMCameraRollController *)self _transientDataSource];
  [(CAMCameraRollController *)self _setSessionIdentifier:(unsigned __int16)([(CAMCameraRollController *)self sessionIdentifier] + 1)];
  [(CAMCameraRollController *)self _setAllowUpdating:0];
  if (v3) {
    [v8 removeAllAssets];
  }
  id v4 = [(CAMCameraRollController *)self _sessionAssetUUIDs];
  [v4 removeAllObjects];

  double v5 = [(CAMCameraRollController *)self _ignoredEV0UUIDs];
  [v5 removeAllObjects];

  id v6 = [(CAMCameraRollController *)self _HDRUUIDToIgnoredEV0UUIDs];
  [v6 removeAllObjects];

  double v7 = [(CAMCameraRollController *)self sessionDelegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 cameraRollControllerDidStartSession:self];
  }
}

- (void)_setSessionIdentifier:(unsigned __int16)a3
{
  self->_sessionIdentifier = a3;
}

- (void)_setAllowUpdating:(BOOL)a3
{
  self->__allowUpdating = a3;
}

- (NSMutableSet)_ignoredEV0UUIDs
{
  return self->__ignoredEV0UUIDs;
}

- (NSMutableDictionary)_HDRUUIDToIgnoredEV0UUIDs
{
  return self->__HDRUUIDToIgnoredEV0UUIDs;
}

- (CAMCameraRollControllerSessionDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  return (CAMCameraRollControllerSessionDelegate *)WeakRetained;
}

- (BOOL)dismissCameraRollViewControllerForced:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  double v7 = v6;
  if (v6) {
    char v8 = [v6 dismissOneUpViewControllerForced:v5 animated:v4];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (void)beginAllowingStagedMediaLoading
{
  if ([(CAMCameraRollController *)self _isDeferringStagedMediaLoading])
  {
    BOOL v3 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
    BOOL v4 = [v3 browsingSession];
    BOOL v5 = [v4 viewModel];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    id v7[2] = __58__CAMCameraRollController_beginAllowingStagedMediaLoading__block_invoke;
    v7[3] = &unk_263FA0208;
    id v8 = v5;
    id v6 = v5;
    [v6 performChanges:v7];
    [(CAMCameraRollController *)self _setDeferringStagedMediaLoading:0];
  }
}

- (BOOL)_isDeferringStagedMediaLoading
{
  return self->__deferringStagedMediaLoading;
}

- (void)_ensureCameraRollViewController
{
  [(CAMCameraRollController *)self _setAllowUpdating:1];
  [(CAMCameraRollController *)self _update];
}

- (void)_update
{
}

- (BOOL)_allowUpdating
{
  return self->__allowUpdating;
}

- (PXPhotosDataSource)_photosDataSource
{
  return self->__photosDataSource;
}

- (CAMTransientImageManager)_transientImageManager
{
  return self->__transientImageManager;
}

- (void)_setStagedDataSource:(id)a3
{
  BOOL v5 = (PXPhotosDataSource *)a3;
  stagedDataSource = self->__stagedDataSource;
  if (stagedDataSource != v5)
  {
    double v7 = v5;
    if (stagedDataSource) {
      [(PXPhotosDataSource *)stagedDataSource unregisterChangeObserver:self];
    }
    objc_storeStrong((id *)&self->__stagedDataSource, a3);
    stagedDataSource = (PXPhotosDataSource *)[(PXPhotosDataSource *)self->__stagedDataSource registerChangeObserver:self];
    BOOL v5 = v7;
  }
  MEMORY[0x270F9A758](stagedDataSource, v5);
}

- (void)_setPhotosDataSource:(id)a3
{
  BOOL v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->__photosDataSource;
  if (photosDataSource != v5)
  {
    double v7 = v5;
    if (photosDataSource) {
      [(PXPhotosDataSource *)photosDataSource unregisterChangeObserver:self];
    }
    objc_storeStrong((id *)&self->__photosDataSource, a3);
    photosDataSource = (PXPhotosDataSource *)[(PXPhotosDataSource *)self->__photosDataSource registerChangeObserver:self];
    BOOL v5 = v7;
  }
  MEMORY[0x270F9A758](photosDataSource, v5);
}

- (CAMCameraRollControllerImageWellDelegate)imageWellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageWellDelegate);
  return (CAMCameraRollControllerImageWellDelegate *)WeakRetained;
}

- (PXPhotosDataSource)_stagedDataSource
{
  return self->__stagedDataSource;
}

- (id)oneUpPresentationHelperViewController:(id)a3
{
  BOOL v4 = [(CAMCameraRollController *)self presentationDelegate];
  BOOL v5 = [v4 cameraRollControllerPresentingViewController:self];

  return v5;
}

- (CAMCameraRollControllerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (CAMCameraRollControllerPresentationDelegate *)WeakRetained;
}

- (PUPhotoKitDataSourceManager)_photoKitDataSourceManager
{
  return self->__photoKitDataSourceManager;
}

- (void)_updateTransientDataSourceIfNeeded
{
  if (![(CAMCameraRollController *)self _transientAssetsAreValid])
  {
    [(CAMCameraRollController *)self _setTransientAssetsAreValid:1];
    BOOL v3 = [(CAMCameraRollController *)self _transientDataSource];
    BOOL v4 = [(CAMCameraRollController *)self _photoKitDataSourceManager];
    BOOL v5 = [v4 assetsDataSource];

    id v6 = [v5 lastItemIndexPath];
    if (v6)
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v18[3] = 0;
      double v7 = [MEMORY[0x263EFF9C0] set];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __61__CAMCameraRollController__updateTransientDataSourceIfNeeded__block_invoke;
      v13[3] = &unk_263FA2E08;
      id v14 = v5;
      id v8 = v3;
      id v15 = v8;
      id v9 = v7;
      id v16 = v9;
      v17 = v18;
      [v14 enumerateIndexPathsStartingAtIndexPath:v6 reverseDirection:1 usingBlock:v13];
      if ([v9 count])
      {
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __61__CAMCameraRollController__updateTransientDataSourceIfNeeded__block_invoke_2;
        v10[3] = &unk_263FA0408;
        id v11 = v9;
        id v12 = v8;
        [v12 performChanges:v10];
      }
      _Block_object_dispose(v18, 8);
    }
  }
}

- (BOOL)_transientAssetsAreValid
{
  return self->__transientAssetsAreValid;
}

- (void)_setTransientAssetsAreValid:(BOOL)a3
{
  self->__transientAssetsAreValid = a3;
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CAMCameraRollController *)self _photosDataSource];
  if ((id)v8 == v6)
  {
  }
  else
  {
    id v9 = (void *)v8;
    id v10 = [(CAMCameraRollController *)self _stagedDataSource];

    if (v10 != v6) {
      goto LABEL_15;
    }
  }
  uint64_t v11 = [v6 versionIdentifier];
  id v12 = [(CAMCameraRollController *)self _stagedDataSource];

  if (v12) {
    [(CAMCameraRollController *)self _update];
  }
  id v13 = [(CAMCameraRollController *)self _photosDataSource];
  if (v13 != v6)
  {

LABEL_14:
    [(CAMCameraRollController *)self _invalidateTransientAssets];
    [(CAMCameraRollController *)self _updateTransientDataSourceIfNeeded];
    goto LABEL_15;
  }
  uint64_t v14 = [v6 versionIdentifier];

  if (v14 != v11 || ![v7 hasIncrementalChanges]) {
    goto LABEL_14;
  }
  id v15 = [(CAMCameraRollController *)self _transientDataSource];
  id v16 = [(CAMCameraRollController *)self _transientImageManager];
  if [v15 isEmpty] && (objc_msgSend(v16, "isEmpty"))
  {
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__CAMCameraRollController_photosDataSource_didChange___block_invoke;
    v18[3] = &unk_263FA0CD0;
    id v19 = v16;
    id v20 = v15;
    v21 = self;
    id v17 = v15;
    id v15 = v16;
    [v17 performChanges:v18];
  }
LABEL_15:
}

void __54__CAMCameraRollController_photosDataSource_didChange___block_invoke(uint64_t a1)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__CAMCameraRollController_photosDataSource_didChange___block_invoke_2;
  aBlock[3] = &unk_263FA2CF8;
  id v96 = *(id *)(a1 + 32);
  id v2 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  uint64_t v70 = a1;
  BOOL v3 = [*(id *)(a1 + 32) existingPairedVideoUUIDs];
  BOOL v4 = [MEMORY[0x263EFF980] array];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v92 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [MEMORY[0x263F14D18] localIdentifierWithUUID:*(void *)(*((void *)&v91 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v91 objects:v104 count:16];
    }
    while (v7);
  }
  v56 = v5;

  uint64_t v11 = objc_msgSend(MEMORY[0x263F14E18], "px_standardFetchOptions");
  [v11 setIsExclusivePredicate:1];
  v57 = v4;
  v55 = v11;
  [MEMORY[0x263F14D18] fetchAssetsWithLocalIdentifiers:v4 options:v11];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v87 objects:v103 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v88 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v87 + 1) + 8 * j);
        id v17 = [v16 uuid];
        v2[2](v2, v16, v17);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v87 objects:v103 count:16];
    }
    while (v13);
  }
  v58 = [*(id *)(v70 + 40) existingAssetUUIDs];
  v59 = v2;
  if ([v58 count])
  {
    v18 = [MEMORY[0x263EFF980] array];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v19 = v58;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v83 objects:v102 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v84 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [MEMORY[0x263F14D18] localIdentifierWithUUID:*(void *)(*((void *)&v83 + 1) + 8 * k)];
          [v18 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v83 objects:v102 count:16];
      }
      while (v21);
    }

    v25 = objc_msgSend(MEMORY[0x263F14E18], "px_standardFetchOptions");
    [v25 setIsExclusivePredicate:1];
    v63 = v18;
    id v60 = v25;
    v26 = [MEMORY[0x263F14D18] fetchAssetsWithLocalIdentifiers:v18 options:v25];
    v27 = [*(id *)(v70 + 48) _photosDataSource];
    v28 = [v27 indexPathForLastAsset];
    v69 = v27;
    v29 = [v27 lastAssetCollection];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v66 = v26;
    uint64_t v30 = [v66 countByEnumeratingWithState:&v79 objects:v101 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v80;
      do
      {
        for (uint64_t m = 0; m != v31; ++m)
        {
          if (*(void *)v80 != v32) {
            objc_enumerationMutation(v66);
          }
          v34 = *(void **)(*((void *)&v79 + 1) + 8 * m);
          v35 = [v69 indexPathForAsset:v34 hintIndexPath:v28 hintCollection:v29];
          if (v35)
          {
            v36 = [v34 uuid];
            v37 = [v34 burstIdentifier];
            if (v37)
            {
              [*(id *)(v70 + 40) removeRepresentativeAssetForBurstIdentifier:v37];
            }
            else
            {
              v38 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v100 = v36;
                _os_log_impl(&dword_2099F8000, v38, OS_LOG_TYPE_DEFAULT, "CAMCameraRollController (photosDataSource:didChange:): de-dup one asset from transient DS: %{public}@", buf, 0xCu);
              }

              [*(id *)(v70 + 40) removeAssetWithUUID:v36];
              id v2 = v59;
            }
            v2[2](v2, v34, v36);
          }
        }
        uint64_t v31 = [v66 countByEnumeratingWithState:&v79 objects:v101 count:16];
      }
      while (v31);
    }
  }
  [*(id *)(v70 + 40) existingBurstIdentifiers];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v65 = [v61 countByEnumeratingWithState:&v75 objects:v98 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v76;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v76 != v64) {
          objc_enumerationMutation(v61);
        }
        uint64_t v68 = v39;
        uint64_t v40 = *(void *)(*((void *)&v75 + 1) + 8 * v39);
        v41 = objc_msgSend(MEMORY[0x263F14E18], "px_standardFetchOptions");
        [v41 setIsExclusivePredicate:1];
        id v67 = v41;
        v42 = [MEMORY[0x263F14D18] fetchAssetsWithBurstIdentifier:v40 options:v41];
        v43 = [*(id *)(v70 + 48) _photosDataSource];
        v44 = [v43 indexPathForLastAsset];
        v45 = [v43 lastAssetCollection];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v46 = v42;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v71 objects:v97 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v72;
          do
          {
            for (uint64_t n = 0; n != v48; ++n)
            {
              if (*(void *)v72 != v49) {
                objc_enumerationMutation(v46);
              }
              v51 = *(void **)(*((void *)&v71 + 1) + 8 * n);
              v52 = [v43 indexPathForAsset:v51 hintIndexPath:v44 hintCollection:v45];
              if (v52)
              {
                v53 = [v51 burstIdentifier];
                if (v53)
                {
                  [*(id *)(v70 + 40) removeRepresentativeAssetForBurstIdentifier:v53];
                }
                else
                {
                  v54 = os_log_create("com.apple.camera", "Camera");
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                    __54__CAMCameraRollController_photosDataSource_didChange___block_invoke_cold_1(buf, &buf[1], v54);
                  }
                }
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v71 objects:v97 count:16];
          }
          while (v48);
        }

        uint64_t v39 = v68 + 1;
      }
      while (v68 + 1 != v65);
      uint64_t v65 = [v61 countByEnumeratingWithState:&v75 objects:v98 count:16];
    }
    while (v65);
  }
}

void __54__CAMCameraRollController_photosDataSource_didChange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  int v6 = [v5 isPhotoIris];
  char v7 = [v5 isPhotoIrisPlaceholder];

  if (v6 && (v7 & 1) == 0) {
    [*(id *)(a1 + 32) removePairedVideoForUUID:v8];
  }
}

- (void)dealloc
{
  BOOL v3 = +[CAMPriorityNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(CAMCameraRollController *)self _setObserveCameraPreviewWellChanges:0];
  v4.receiver = self;
  v4.super_class = (Class)CAMCameraRollController;
  [(CAMCameraRollController *)&v4 dealloc];
}

- (void)prewarmPhotosAppInstallationState
{
  objc_initWeak(&location, self);
  id v2 = dispatch_get_global_queue(21, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  id v3[2] = __60__CAMCameraRollController_prewarmPhotosAppInstallationState__block_invoke;
  v3[3] = &unk_263FA0E00;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __60__CAMCameraRollController_prewarmPhotosAppInstallationState__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F01880] defaultWorkspace];
  char v3 = [v2 applicationIsInstalled:@"com.apple.mobileslideshow"];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  id v4[2] = __60__CAMCameraRollController_prewarmPhotosAppInstallationState__block_invoke_2;
  v4[3] = &unk_263FA1138;
  char v6 = v3;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v5);
}

void __60__CAMCameraRollController_prewarmPhotosAppInstallationState__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setBool:*(unsigned __int8 *)(a1 + 40) forKey:@"PHOTOS_APP_INSTALLED_DEFAULTS_KEY"];

  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPhotosAppInstallationState:v3];
}

- (BOOL)wantsInstalledPhotosAppActions
{
  int64_t v2 = [(CAMCameraRollController *)self photosAppInstallationState];
  if (v2 == 2) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = [v4 valueForKey:@"PHOTOS_APP_INSTALLED_DEFAULTS_KEY"];

  if (!v5) {
    return 1;
  }
  char v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v7 = [v6 BOOLForKey:@"PHOTOS_APP_INSTALLED_DEFAULTS_KEY"];

  return v7;
}

- (void)resetNavigation
{
  int64_t v2 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  uint64_t v3 = [v2 browsingSession];
  id v4 = [v3 viewModel];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CAMCameraRollController_resetNavigation__block_invoke;
  v6[3] = &unk_263FA0208;
  id v7 = v4;
  id v5 = v4;
  [v5 performChanges:v6];
}

void __42__CAMCameraRollController_resetNavigation__block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) assetsDataSource];
  id v3 = [v2 startingAssetReference];

  [*(id *)(a1 + 32) setCurrentAssetReference:v3];
}

void __66__CAMCameraRollController_didPersistAssetWithUUID_captureSession___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _transientDataSource];

  id v4 = [v3 existingAssetForUUID:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "CAMCameraRollController (didPersistAssetWithUUID): removing one asset from transient DS after timeout: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [v3 removeAssetWithUUID:*(void *)(a1 + 32)];
  }
}

void __57__CAMCameraRollController__scheduleUpdateIfOneUpIsActive__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setUpdateIsScheduled:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _update];
}

void __34__CAMCameraRollController_preload__block_invoke_228()
{
  v0 = dispatch_get_global_queue(0, 0);
  dispatch_async(v0, &__block_literal_global_231);
}

void __34__CAMCameraRollController_preload__block_invoke_2_229()
{
  CAMSignpostWithIDAndArgs(33, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  __34__CAMCameraRollController_preload__block_invoke_3_232();
  CAMSignpostWithIDAndArgs(34, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void __34__CAMCameraRollController_preload__block_invoke_3_232()
{
  id v0 = [MEMORY[0x263F02AD8] defaultSearchableIndex];
  [v0 _issueNonLaunchingCommand:@"commit"];
}

- (void)ppt_awaitPreload:(id)a3
{
  id v4 = a3;
  id v5 = camSoftLinkQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __44__CAMCameraRollController_ppt_awaitPreload___block_invoke;
  v7[3] = &unk_263FA08E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__CAMCameraRollController_ppt_awaitPreload___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) _photosFrameworksPreheatQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  id v4[2] = __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_2;
  v4[3] = &unk_263FA08E8;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_2(uint64_t a1)
{
  CAMSignpostWithIDAndArgs(33, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  id v3[2] = __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_3;
  v3[3] = &unk_263FA08E8;
  int64_t v2 = *(void **)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_3((uint64_t)v3);
  CAMSignpostWithIDAndArgs(34, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_4;
  v2[3] = &unk_263FA08E8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __44__CAMCameraRollController_ppt_awaitPreload___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureCameraRollViewController];
  int64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)cameraPreviewWellImageDidChange:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CAMCameraRollController *)self imageWellDelegate];
  if (v5)
  {
    uint64_t v26 = [v4 image];
    id v6 = [v4 assetUUID];
    BOOL v7 = [(CAMCameraRollController *)self _isPhotoLibraryLocked];
    id v8 = [(CAMCameraRollController *)self _sessionAssetUUIDs];
    uint64_t v9 = [(CAMCameraRollController *)self _ignoredEV0UUIDs];
    id v10 = [(CAMCameraRollController *)self _HDRUUIDToIgnoredEV0UUIDs];
    if (v7) {
      int v24 = [v8 containsObject:v6] ^ 1;
    }
    else {
      int v24 = 0;
    }
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];
    if (v11)
    {
      uint64_t v12 = v9;
      uint64_t v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v6;
        __int16 v29 = 2114;
        uint64_t v30 = (uint64_t)v11;
        _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: removing ignored EV0 UUID %{public}@ since we received HDR image from assetsd", buf, 0x16u);
      }

      [v10 removeObjectForKey:v6];
      uint64_t v9 = v12;
      [v12 removeObject:v11];
    }
    v25 = v9;
    char v14 = [v9 containsObject:v6];
    BOOL v15 = [(CAMCameraRollController *)self _outputToExternalStorage];
    id v16 = os_log_create("com.apple.camera", "Camera");
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (!v17)
      {
LABEL_13:

        id v19 = (void *)v26;
LABEL_25:

        goto LABEL_26;
      }
      *(_DWORD *)buf = 138543362;
      v28 = v6;
      v18 = "ImageWell %{public}@: rejecting update from assetsd since we're currently on external storage mode";
LABEL_12:
      _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      goto LABEL_13;
    }
    if (v24)
    {
      id v19 = (void *)v26;
      if (v17)
      {
        *(_DWORD *)buf = 138543362;
        v28 = v6;
        _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: rejecting update from assetsd for secure session", buf, 0xCu);
      }

      uint64_t v20 = v5;
      uint64_t v21 = self;
      uint64_t v22 = 0;
      v23 = 0;
    }
    else
    {
      if (v14)
      {
        if (!v17) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 138543362;
        v28 = v6;
        v18 = "ImageWell %{public}@: ignoring from assetsd because in ignored list";
        goto LABEL_12;
      }
      id v19 = (void *)v26;
      if (v17)
      {
        *(_DWORD *)buf = 138543618;
        v28 = v6;
        __int16 v29 = 2114;
        uint64_t v30 = v26;
        _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: updating from assetsd with %{public}@", buf, 0x16u);
      }

      uint64_t v20 = v5;
      uint64_t v21 = self;
      uint64_t v22 = v26;
      v23 = v6;
    }
    [v20 cameraRollController:v21 didChangeImageWellImage:v22 withUUID:v23 animated:1];
    goto LABEL_25;
  }
LABEL_26:
}

- (void)ignoreImageWellChangeNotificationForEV0UUID:(id)a3 withHDRUUID:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(CAMCameraRollController *)self _ignoredEV0UUIDs];
    [v9 addObject:v6];

    id v10 = [(CAMCameraRollController *)self _HDRUUIDToIgnoredEV0UUIDs];
    [v10 setObject:v6 forKey:v8];
  }
  else
  {
    id v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 2114;
      char v14 = v8;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "ignoreImageWellChangeNotificationForEV0UUID called with missing EV0UUID=%{public}@ or HDRUUID=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)clearIgnoredImageWellUUIDs
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(CAMCameraRollController *)self _HDRUUIDToIgnoredEV0UUIDs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(CAMCameraRollController *)self _HDRUUIDToIgnoredEV0UUIDs];
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "ImageWell: clearIgnoredImageWellUUIDs called while still ignoring HDR to EV0 UUIDs %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v7 = [(CAMCameraRollController *)self _ignoredEV0UUIDs];
  [v7 removeAllObjects];

  id v8 = [(CAMCameraRollController *)self _HDRUUIDToIgnoredEV0UUIDs];
  [v8 removeAllObjects];
}

- (void)applicationWillEnterForeground:(id)a3
{
  [(CAMCameraRollController *)self _startNewSession];
  [(CAMCameraRollController *)self prewarmPhotosAppInstallationState];
}

- (void)processTransientAssetUpdate:(id)a3 preventingInsertion:(BOOL)a4 persistenceOptions:(int64_t)a5
{
  id v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int v9 = [(CAMCameraRollController *)self _transientDataSource];
  if (a5 != 3)
  {
    BOOL v10 = [(CAMCameraRollController *)self _isPhotoLibraryLocked];
    int v11 = [v8 sessionIdentifier];
    int v12 = [(CAMCameraRollController *)self sessionIdentifier];
    if (!v10 || v11 == v12)
    {
      char v14 = [v8 uuid];
      uint64_t v15 = [v8 burstIdentifier];
      uint64_t v16 = [v9 existingRepresentativeAssetForBurstIdentifier:v15];
      BOOL v17 = (void *)v16;
      if (v15 && v16)
      {
        [v9 updateAssetWithConvertible:v8];
      }
      else if (!v15 || v16 || a4)
      {
        v18 = [v9 existingAssetForUUID:v14];
        if (v18 || a4) {
          [v9 updateAssetWithConvertible:v8];
        }
        else {
          id v19 = (id)[v9 insertAssetWithConvertible:v8];
        }
      }
      else
      {
        [v9 enqueuePendingBurstAssetWithConvertible:v8];
      }
    }
    else
    {
      __int16 v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CAMCameraRollController processTransientAssetUpdate:preventingInsertion:persistenceOptions:]((uint64_t)v8, self);
      }
    }
  }
}

- (void)processPendingBursts
{
  id v2 = [(CAMCameraRollController *)self _transientDataSource];
  [v2 processPendingBurstAssets];
}

- (void)processTransientPairedVideoUpdate:(id)a3 filterType:(int64_t)a4
{
  id v8 = a3;
  id v6 = [(CAMCameraRollController *)self _transientImageManager];
  id v7 = (id)[v6 insertPairedVideoWithConvertible:v8 filterType:a4];
}

- (BOOL)canPresentCameraRollViewController
{
  [(CAMCameraRollController *)self _ensureCameraRollViewController];
  id v3 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  char v4 = [v3 canPresentOneUpViewControllerAnimated:1];

  return v4;
}

- (void)presentCameraRollViewControllerAnimated:(BOOL)a3 interactive:(BOOL)a4 deferringStagedMediaLoading:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109376;
    v13[1] = v6;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Presenting the Camera Roll interactively=%d deferring media loading=%d", (uint8_t *)v13, 0xEu);
  }

  [(CAMCameraRollController *)self _stopCaptureSessionIfNecessary];
  [(CAMCameraRollController *)self _setDeferringStagedMediaLoading:v5];
  [(CAMCameraRollController *)self _ensureCameraRollViewController];
  BOOL v10 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  int v11 = v10;
  if (v6) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0;
  }
  [v10 presentOneUpViewControllerAnimated:v7 interactiveMode:v12];
}

uint64_t __58__CAMCameraRollController_beginAllowingStagedMediaLoading__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVideoContentAllowed:1 forReason:@"CAMCameraRollControllerDeferredMediaLoadingReason"];
}

- (void)handlePresentingPanGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  [v5 handlePresentingPanGestureRecognizer:v4];
}

- (void)presentingViewControllerViewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Viewfinder will disappear", v10, 2u);
  }

  BOOL v6 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  [v6 presentingViewControllerViewWillDisappear:v3];

  [(CAMCameraRollController *)self _setOneUpVisible:1];
  [(CAMCameraRollController *)self clearIgnoredImageWellUUIDs];
  [(CAMCameraRollController *)self _stopCaptureSessionIfNecessary];
  BOOL v7 = [(CAMCameraRollController *)self presentationDelegate];
  id v8 = [v7 cameraRollControllerPresentingViewController:self];

  int v9 = [v8 presentedViewController];
  -[CAMCameraRollController _setPrefersPresentingStatusbarHidden:](self, "_setPrefersPresentingStatusbarHidden:", [v9 prefersStatusBarHidden]);
}

- (void)presentingViewControllerViewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Viewfinder did disappear", v8, 2u);
  }

  BOOL v6 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  [v6 presentingViewControllerViewDidDisappear:v3];

  if (![(CAMCameraRollController *)self _isOneUpFullyPresented])
  {
    BOOL v7 = [(CAMCameraRollController *)self presentationDelegate];
    [v7 cameraRollControllerDidFullyPresentCameraRoll:self];
  }
  [(CAMCameraRollController *)self _setOneUpFullyPresented:1];
}

- (void)_stopCaptureSessionIfNecessary
{
  if (![(CAMCameraRollController *)self _didStopCaptureSession])
  {
    [(CAMCameraRollController *)self _setDidStopCaptureSession:1];
    id v3 = [(CAMCameraRollController *)self presentationDelegate];
    [v3 cameraRollControllerRequestsCaptureSessionStopped:self];
  }
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  [(CAMCameraRollController *)self _ensureCameraRollViewController];
  [(CAMCameraRollController *)self resetNavigation];
  id v5 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  BOOL v6 = [v5 browsingSession];
  BOOL v7 = [v6 viewModel];

  id v8 = [v7 assetsDataSource];
  int v9 = [v8 startingAssetReference];
  BOOL v10 = [v9 indexPath];

  int v11 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  uint64_t v12 = [v11 previewViewControllerForItemAtIndexPath:v10 allowingActions:0];

  return v12;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  [v6 commitPreviewViewController:v5];
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  id v10 = a3;
  int v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v15 = 0;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Present the Camera Roll preview", v15, 2u);
  }

  uint64_t v12 = [(CAMCameraRollController *)self presentationDelegate];
  [v12 cameraRollControllerWillPresentPreviewController:self];
  __int16 v13 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  [v13 beginUsingBlackTheme];

  __int16 v14 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  objc_msgSend(v14, "willPresentPreviewViewController:forLocation:inSourceView:", v10, v9, x, y);

  [(CAMCameraRollController *)self _stopCaptureSessionIfNecessary];
  [(CAMCameraRollController *)self _setOneUpVisible:1];
  [(CAMCameraRollController *)self clearIgnoredImageWellUUIDs];
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Dismiss the Camera Roll preview, committing=%d", (uint8_t *)v11, 8u);
  }

  id v8 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  [v8 didDismissPreviewViewController:v6 committing:v4];

  if (!v4)
  {
    [(CAMCameraRollController *)self _setOneUpVisible:0];
    BOOL v9 = [(CAMCameraRollController *)self _didStopCaptureSession];
    [(CAMCameraRollController *)self _setDidStopCaptureSession:0];
    id v10 = [(CAMCameraRollController *)self presentationDelegate];
    [v10 cameraRollController:self didDismissPreviewControllerShouldStartCaptureSession:v9];
  }
}

- (id)previewPresentationTransitioningDelegateForPosition:(CGPoint)a3 inSourceView:(id)a4
{
  id v5 = a4;
  if (self->_presentationDelegateFlags.respondsToPreviewSourceRect)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    [WeakRetained cameraRollControllerPreviewSourceRect:self];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  if (self->_presentationDelegateFlags.respondsToImageForReveal)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    uint64_t v16 = [v15 cameraRollControllerImageForReveal:self];
  }
  else
  {
    uint64_t v16 = 0;
  }
  BOOL v17 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  v18 = objc_msgSend(v17, "cameraPreviewTransitionDelegateWithSourceRect:sourceImage:", v16, v8, v10, v12, v14);

  return v18;
}

- (void)animateRevealWithInteractionProgress:(id)a3 forPreviewingAtLocation:(CGPoint)a4 inSourceView:(id)a5 containerView:(id)a6
{
  id v8 = a3;
  if (self->_presentationDelegateFlags.respondsToRevealWillBegin)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    [WeakRetained cameraRollControllerRevealWillBegin:self];
  }
  [v8 addProgressObserver:self];
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  if (self->_presentationDelegateFlags.respondsToRevealDidEnd)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    [WeakRetained cameraRollControllerRevealDidEnd:self];
  }
}

- (BOOL)shouldStartPreviewingSimultaneouslyWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  char v6 = [v5 shouldStartPreviewingSimultaneouslyWithGestureRecognizer:v4];

  return v6;
}

- (BOOL)_isPhotoLibraryLocked
{
  if (+[CAMFrameworkUtilities isPasscodeLocked]) {
    return 1;
  }
  return +[CAMFrameworkUtilities isPhotosAppLocked];
}

- (BOOL)_shouldRequestUnlock
{
  id v2 = self;
  id v3 = [(CAMCameraRollController *)self presentationDelegate];
  LOBYTE(v2) = [v3 cameraRollControllerShouldRequestUnlock:v2];

  return (char)v2;
}

- (void)_updateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v69[2] = *MEMORY[0x263EF8340];
  if (![(CAMCameraRollController *)self _allowUpdating]) {
    return;
  }
  objc_initWeak(&location, self);
  id v5 = [(CAMCameraRollController *)self _photosFrameworksPreheatQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CAMCameraRollController__updateAnimated___block_invoke;
  block[3] = &unk_263FA0E00;
  objc_copyWeak(&v67, &location);
  dispatch_async(v5, block);

  if ([(CAMCameraRollController *)self _isPhotoLibraryLocked]
    && ([(CAMCameraRollController *)self _sessionAssetUUIDs],
        char v6 = objc_claimAutoreleasedReturnValue(),
        double v7 = (void *)[v6 copy],
        v6,
        v7))
  {
    int v8 = 0;
  }
  else
  {
    double v9 = [(CAMCameraRollController *)self _photosDataSource];
    double v10 = [v9 allowedUUIDs];
    if (v10)
    {
      double v11 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
      char v12 = [v11 isOneUpPresented];

      if ((v12 & 1) == 0)
      {
        [(CAMCameraRollController *)self _setStagedDataSource:0];
        [(CAMCameraRollController *)self _setPhotosDataSource:0];
        [(CAMCameraRollController *)self _invalidateTransientAssets];
      }
    }
    else
    {
    }
    double v7 = 0;
    int v8 = 1;
  }
  v53 = [(CAMCameraRollController *)self _transientDataSource];
  v52 = [(CAMCameraRollController *)self _transientImageManager];
  if (![(CAMCameraRollController *)self _outputToExternalStorage]) {
    [(CAMCameraRollController *)self _createPhotosDatasourceIfNeededWithAllowedUUIds:v7 animated:v3];
  }
  [(PXPhotosDataSource *)self->__photosDataSource setAllowedUUIDs:v7];
  [(PXPhotosDataSource *)self->__photosDataSource startBackgroundFetchIfNeeded];
  double v13 = [(CAMCameraRollController *)self _stagedDataSource];
  double v14 = v13;
  if (!v13) {
    goto LABEL_17;
  }
  if (!v8)
  {

    goto LABEL_19;
  }
  photosDataSource = self->__photosDataSource;
  if (!photosDataSource)
  {
LABEL_17:

    goto LABEL_20;
  }
  char v16 = [(PXPhotosDataSource *)photosDataSource isEmpty];

  if ((v16 & 1) == 0) {
LABEL_19:
  }
    [(CAMCameraRollController *)self _setStagedDataSource:0];
LABEL_20:
  if (PLIsCamera() && _updateAnimated__onceToken != -1) {
    dispatch_once(&_updateAnimated__onceToken, &__block_literal_global_268);
  }
  BOOL v17 = [(CAMCameraRollController *)self _stagedDataSource];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [(CAMCameraRollController *)self _photosDataSource];
  }
  uint64_t v20 = v19;

  if (!self->__oneUpPresentationHelper)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_3;
    aBlock[3] = &unk_263FA2D20;
    void aBlock[4] = self;
    uint64_t v49 = _Block_copy(aBlock);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_4;
    v64[3] = &unk_263FA2D48;
    v64[4] = self;
    v51 = _Block_copy(v64);
    if ([(CAMCameraRollController *)self _outputToExternalStorage])
    {
      uint64_t v21 = [(CAMCameraRollController *)self externalStorage];
      uint64_t v22 = (void *)MEMORY[0x263F5E3D0];
      v50 = v21;
      v23 = [v21 uniqueIdentifier];
      int v24 = [v23 UUIDString];
      v25 = [v22 importBrowsingSessionWithDeviceUUID:v24];

      [(CAMCameraRollController *)self _setExternalStorageBrowsingSession:v25];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_5;
      v62[3] = &unk_263FA2D70;
      v63 = v25;
      id v26 = v25;
      v27 = _Block_copy(v62);
      id v28 = v63;
    }
    else
    {
      v50 = (void *)[objc_alloc(MEMORY[0x263F5E428]) initWithPhotosDataSource:v20];
      objc_storeStrong((id *)&self->__photoKitDataSourceManager, v50);
      id v29 = objc_alloc_init(MEMORY[0x263F5E430]);
      id v28 = objc_alloc_init(MEMORY[0x263F5E420]);
      [v28 setDataSourceManager:v50];
      [MEMORY[0x263F5E3B8] setUnlockDeviceHandlerWithActionType:v51];
      [(CAMCameraRollController *)self _updateTransientDataSourceIfNeeded];
      uint64_t v47 = (void *)[objc_alloc(MEMORY[0x263F5E3E0]) initWithTransientDataSource:v53];
      id v30 = objc_alloc(MEMORY[0x263F5E3E8]);
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_6;
      v60[3] = &unk_263FA2D98;
      id v26 = v29;
      id v61 = v26;
      uint64_t v48 = (void *)[v30 initWithTransientImageManager:v52 supplementaryLivePhotoImageSource:v60];
      id v46 = objc_alloc_init(MEMORY[0x263F5E3D8]);
      id v31 = objc_alloc(MEMORY[0x263F5E3F8]);
      v69[0] = v50;
      v69[1] = v47;
      uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
      v33 = (void *)[v31 initWithDataSourceManagers:v32];

      id v34 = objc_alloc_init(MEMORY[0x263F5E3F0]);
      [v34 registerActionManager:v28 forAssetClass:0];
      [v34 registerActionManager:v28 forAssetClass:objc_opt_class()];
      [v34 registerActionManager:v46 forAssetClass:objc_opt_class()];
      id v35 = objc_alloc_init(MEMORY[0x263F5E400]);
      [v35 registerMediaProvider:v26 forAssetClass:objc_opt_class()];
      [v35 registerMediaProvider:v48 forAssetClass:objc_opt_class()];
      [v35 registerMediaProvider:v48 forAssetPassingTest:&__block_literal_global_293];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_8;
      v56[3] = &unk_263FA2DE0;
      id v57 = v33;
      id v58 = v34;
      id v59 = v35;
      id v36 = v35;
      id v37 = v34;
      id v38 = v33;
      v27 = _Block_copy(v56);
    }
    uint64_t v39 = (PUOneUpPresentationHelper *)[objc_alloc(MEMORY[0x263F5E408]) initWithBrowsingSessionCreationBlock:v27];
    oneUpPresentationHelper = self->__oneUpPresentationHelper;
    self->__oneUpPresentationHelper = v39;

    [(PUOneUpPresentationHelper *)self->__oneUpPresentationHelper setDelegate:self];
    [(PUOneUpPresentationHelper *)self->__oneUpPresentationHelper setAssetDisplayDelegate:self];
    [(PUOneUpPresentationHelper *)self->__oneUpPresentationHelper setCachesScrubberView:1];
    [(PUOneUpPresentationHelper *)self->__oneUpPresentationHelper setUnlockDeviceStatus:v49];
    [(PUOneUpPresentationHelper *)self->__oneUpPresentationHelper setUnlockDeviceHandlerWithActionType:v51];
    [MEMORY[0x263F5E480] setupStatusBarInternalSettingsGestureOnInternalDevices];
  }
  v41 = [(CAMCameraRollController *)self _photoKitDataSourceManager];
  [v41 setPhotosDataSource:v20];

  [(CAMCameraRollController *)self _updateTransientDataSourceIfNeeded];
  if ([(CAMCameraRollController *)self _isDeferringStagedMediaLoading])
  {
    v42 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
    v43 = [v42 browsingSession];
    v44 = [v43 viewModel];

    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __43__CAMCameraRollController__updateAnimated___block_invoke_9;
    v54[3] = &unk_263FA0208;
    id v45 = v44;
    id v55 = v45;
    [v45 performChanges:v54];
  }
  objc_destroyWeak(&v67);
  objc_destroyWeak(&location);
}

void __43__CAMCameraRollController__updateAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setPreheatQueue_shouldSkipPhotosFrameworkPreheat:", 1);
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x263F82E10], "px_swizzleMethod:withMethod:", sel_supportedInterfaceOrientations, sel_cam_swizzled_supportedInterfaceOrientations);
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shouldRequestUnlock] ^ 1;
}

void __43__CAMCameraRollController__updateAnimated___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  char v6 = a2;
  if ([*(id *)(a1 + 32) _shouldRequestUnlock])
  {
    id v5 = [*(id *)(a1 + 32) presentationDelegate];
    [v5 cameraRollController:*(void *)(a1 + 32) didRequestPasscodeUnlockForAction:a3 completionBlock:v6];
  }
  else
  {
    v6[2](v6, 1);
  }
}

id __43__CAMCameraRollController__updateAnimated___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, double a6, double a7)
{
  id v13 = a2;
  id v14 = a4;
  id v15 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 isPhotoIrisPlaceholder])
  {
    objc_msgSend(*(id *)(a1 + 32), "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, a3, v14, v15, a6, a7);
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return [a2 isPhotoIrisPlaceholder];
  }
  else {
    return 0;
  }
}

id __43__CAMCameraRollController__updateAnimated___block_invoke_8(void *a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F5E3D0]) initWithDataSourceManager:a1[4] actionManager:a1[5] mediaProvider:a1[6]];
  return v1;
}

uint64_t __43__CAMCameraRollController__updateAnimated___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVideoContentAllowed:0 forReason:@"CAMCameraRollControllerDeferredMediaLoadingReason"];
}

- (void)_createUndoActionsInvalidatorAsynchronouslyIfNeededWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (!self->__undoActionsInvalidator && !self->__preparingUndoActionsInvalidator)
  {
    id v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "ImageWell: Undo actions invalidator setup starting...", buf, 2u);
    }

    self->__preparingUndoActionsInvalidator = 1;
    char v6 = [MEMORY[0x263EFF910] date];
    double v7 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__CAMCameraRollController__createUndoActionsInvalidatorAsynchronouslyIfNeededWithPhotoLibrary___block_invoke;
    block[3] = &unk_263FA0CD0;
    id v10 = v4;
    double v11 = self;
    id v12 = v6;
    id v8 = v6;
    dispatch_async(v7, block);
  }
}

void __95__CAMCameraRollController__createUndoActionsInvalidatorAsynchronouslyIfNeededWithPhotoLibrary___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F5E1B8] sharedObserver];
  BOOL v3 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
  id v4 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:2 subtype:1000000201 options:v3];
  id v5 = [v4 firstObject];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__CAMCameraRollController__createUndoActionsInvalidatorAsynchronouslyIfNeededWithPhotoLibrary___block_invoke_2;
  block[3] = &unk_263FA0CD0;
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(void **)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __95__CAMCameraRollController__createUndoActionsInvalidatorAsynchronouslyIfNeededWithPhotoLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF910] date];
  BOOL v3 = [MEMORY[0x263F5E148] privacyControllerForCollection:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) presentationDelegate];
  id v5 = [v4 cameraRollControllerPresentingViewController:*(void *)(a1 + 40)];

  uint64_t v6 = [v5 undoManager];
  uint64_t v7 = [objc_alloc(MEMORY[0x263F5E1E8]) initWithUndoManager:v6 privacyController:v3];
  uint64_t v8 = *(void *)(a1 + 40);
  double v9 = *(void **)(v8 + 192);
  *(void *)(v8 + 192) = v7;

  [*(id *)(*(void *)(a1 + 40) + 192) beginObservingSystemEventsForAutomaticInvalidation];
  id v10 = [MEMORY[0x263EFF910] date];
  [v10 timeIntervalSinceDate:v2];
  uint64_t v12 = v11;

  id v13 = [MEMORY[0x263EFF910] date];
  [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
  uint64_t v15 = v14;

  uint64_t v16 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218240;
    uint64_t v18 = v15;
    __int16 v19 = 2048;
    uint64_t v20 = v12;
    _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "ImageWell: Undo actions invalidator setup cost total: %.3fs, main thread setup: %.3fs", (uint8_t *)&v17, 0x16u);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 28) = 0;
}

- (void)_createPhotosDatasourceIfNeededWithAllowedUUIds:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v21[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(CAMCameraRollController *)self _photosDataSource];

  if (!v7)
  {
    uint64_t v8 = [(CAMCameraRollController *)self _cameraRollCollectionListFetchResult];
    double v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"addedDate" ascending:1];
    v21[0] = v9;
    id v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortToken" ascending:1];
    v21[1] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

    if (v6)
    {
      uint64_t v12 = 8;
    }
    else
    {
      uint64_t v12 = 8;
      id v13 = (void *)[objc_alloc(MEMORY[0x263F5E188]) initWithCollectionListFetchResult:v8 options:8];
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F5E180]) initWithPhotosDataSourceConfiguration:v13];
      [v14 setFetchLimit:100];
      [v14 setSortDescriptors:v11];
      if (([v14 isEmpty] & 1) == 0)
      {
        [(CAMCameraRollController *)self _setStagedDataSource:v14];
        uint64_t v12 = 1033;
      }
    }
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F5E188]) initWithCollectionListFetchResult:v8 options:v12];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F5E180]) initWithPhotosDataSourceConfiguration:v15];
    [v16 setAllowedUUIDs:v6];
    [v16 setSortDescriptors:v11];
    [(CAMCameraRollController *)self _setPhotosDataSource:v16];
    [v16 isEmpty];
    [(CAMCameraRollController *)self _setObserveCameraPreviewWellChanges:1];
    int v17 = [(CAMCameraRollController *)self imageWellDelegate];
    if (v17)
    {
      uint64_t v18 = [(CAMCameraRollController *)self persistedThumbnailImage];
      __int16 v19 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "ImageWell: updating from persistedThumbnailImage after setting up photos data source", v20, 2u);
      }

      [v17 cameraRollController:self didChangeImageWellImage:v18 withUUID:0 animated:v4];
    }
  }
}

- (id)_cameraRollCollectionListFetchResult
{
  return (id)[MEMORY[0x263F14D28] fetchAssetCollectionsWithType:2 subtype:209 options:0];
}

- (void)_invalidateTransientAssets
{
}

void __61__CAMCameraRollController__updateTransientDataSourceIfNeeded__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v13 = [*(id *)(a1 + 32) assetAtIndexPath:a2];
  id v5 = *(void **)(a1 + 40);
  id v6 = [v13 uuid];
  uint64_t v7 = [v5 existingAssetForUUID:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v13 burstIdentifier];
    double v9 = (void *)v8;
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v8 == 0;
    }
    if (!v10)
    {
      uint64_t v7 = [*(id *)(a1 + 40) existingRepresentativeAssetForBurstIdentifier:v8];
    }
  }
  if (v7)
  {
    [*(id *)(a1 + 48) addObject:v7];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v12 = *(void *)(v11 + 24);
  *(void *)(v11 + 24) = v12 + 1;
  if (v12 >= 101) {
    *a3 = 1;
  }
}

void __61__CAMCameraRollController__updateTransientDataSourceIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          double v9 = [v7 uuid];
          *(_DWORD *)buf = 138543362;
          int v17 = v9;
          _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "CAMCameraRollController (_updateTransientDataSourceIfNeeded): de-dup one asset from transient DS: %{public}@", buf, 0xCu);
        }
        BOOL v10 = *(void **)(a1 + 40);
        uint64_t v11 = [v7 uuid];
        [v10 removeAssetWithUUID:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v4);
  }
}

- (void)_setObserveCameraPreviewWellChanges:(BOOL)a3
{
  if (self->__observeCameraPreviewWellChanges != a3)
  {
    BOOL v3 = a3;
    self->__observeCameraPreviewWellChanges = a3;
    uint64_t v5 = [MEMORY[0x263F5D8B8] defaultCenter];
    id v6 = v5;
    if (v3) {
      [v5 addCameraPreviewWellImageChangeObserver:self];
    }
    else {
      [v5 removeCameraPreviewWellImageChangeObserver:self];
    }
  }
}

- (void)_setExternalStorageBrowsingSession:(id)a3
{
  id v5 = a3;
  id v6 = [(CAMCameraRollController *)self _externalStorageBrowsingSession];

  if (v6 != v5)
  {
    uint64_t v7 = [(CAMCameraRollController *)self _externalStorageBrowsingSession];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [(CAMCameraRollController *)self _externalStorageBrowsingSessionThumbnailRequest];

      if (v9 >= 1)
      {
        BOOL v10 = [(CAMCameraRollController *)self _externalStorageBrowsingSession];
        uint64_t v11 = [v10 imageWellThumbnailProvider];
        objc_msgSend(v11, "cancelThumbnailRequest:", -[CAMCameraRollController _externalStorageBrowsingSessionThumbnailRequest](self, "_externalStorageBrowsingSessionThumbnailRequest"));

        [(CAMCameraRollController *)self set_externalStorageBrowsingSessionThumbnailRequest:0];
      }
    }
    objc_storeStrong((id *)&self->__externalStorageBrowsingSession, a3);
    objc_initWeak(&location, self);
    long long v12 = [v5 imageWellThumbnailProvider];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    _DWORD v13[2] = __62__CAMCameraRollController__setExternalStorageBrowsingSession___block_invoke;
    v13[3] = &unk_263FA2E30;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v12, "requestImageAndUUIDForStartingAssetFillingTargetSize:resultHandler:", v13, 360.0, 640.0);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
}

void __62__CAMCameraRollController__setExternalStorageBrowsingSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _updateExternalStorageThumbnail:v6 withUUID:v5];
}

- (void)_updateExternalStorageThumbnail:(id)a3 withUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CAMCameraRollController *)self _outputToExternalStorage]
    && !+[CAMFrameworkUtilities isPasscodeLocked])
  {
    uint64_t v8 = [(CAMCameraRollController *)self imageWellDelegate];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__CAMCameraRollController__updateExternalStorageThumbnail_withUUID___block_invoke;
    v10[3] = &unk_263FA0A60;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v8;
    id v13 = v7;
    id v9 = v8;
    cam_perform_on_main_asap(v10);
  }
}

uint64_t __68__CAMCameraRollController__updateExternalStorageThumbnail_withUUID___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "set_externalStorageBrowsingSessionLastThumbnailImage:", *(void *)(a1 + 40));
  if (*(void *)(a1 + 48))
  {
    BOOL v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "ImageWell: updating from persistedThumbnailImage after browsing session updated", (uint8_t *)&v7, 2u);
    }

    uint64_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 56);
      if (*(void *)(a1 + 40)) {
        id v6 = &stru_26BD78BA0;
      }
      else {
        id v6 = @" with a empty image";
      }
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      uint64_t v10 = v5;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "External storage: imageWellThumbnailProvider updating the image well thumbnail %{public}@, uuid=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    return [*(id *)(a1 + 48) cameraRollController:*(void *)(a1 + 32) didChangeImageWellImage:*(void *)(a1 + 40) withUUID:*(void *)(a1 + 56) animated:0];
  }
  return result;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 37;
}

- (int64_t)oneUpPresentationHelperPreferredBarStyle:(id)a3
{
  return 1;
}

- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3
{
  return 0;
}

- (void)oneUpPresentationHelper:(id)a3 previewScrubberDidBecomeAvailable:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "panGestureRecognizer", a3);
  [(CAMCameraRollController *)self _setPreviewGestureRecognizer:v5];

  if (self->_presentationDelegateFlags.respondsToPreviewGestureDidBecomeAvailable)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
    [WeakRetained cameraRollControllerPreviewGestureDidBecomeAvailable:self];
  }
}

- (void)oneUpPresentationHelper:(id)a3 willPresentOneUpViewController:(id)a4
{
  id v11 = a4;
  objc_storeWeak((id *)&self->_oneUpViewController, v11);
  if (self->_presentationDelegateFlags.respondsToWillPresentCameraRoll)
  {
    uint64_t v5 = [(CAMCameraRollController *)self presentationDelegate];
    [v5 cameraRollControllerWillPresentCameraRoll:self withOneUpController:v11];
  }
  id v6 = [(CAMCameraRollController *)self _stagedDataSource];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(CAMCameraRollController *)self _photosDataSource];
  }
  __int16 v9 = v8;

  uint64_t v10 = [v9 photoLibrary];
  [(CAMCameraRollController *)self _createUndoActionsInvalidatorAsynchronouslyIfNeededWithPhotoLibrary:v10];
}

- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4
{
  p_oneUpViewController = &self->_oneUpViewController;
  id v6 = a3;
  objc_storeWeak((id *)p_oneUpViewController, 0);
  id v7 = [(CAMCameraRollController *)self _outgoingOneUpPresentationHelpers];
  [v7 removeObject:v6];
}

- (BOOL)oneUpPresentationHelperEnableFreezeLayoutOnOrientationChange:(id)a3
{
  uint64_t v4 = [(CAMCameraRollController *)self presentationDelegate];
  uint64_t v5 = [v4 cameraRollControllerPresentingViewController:self];

  LOBYTE(v4) = [v5 supportedInterfaceOrientations] == 2;
  return (char)v4;
}

- (BOOL)oneUpPresentationHelperPreventRevealInMomentAction:(id)a3
{
  return ![(CAMCameraRollController *)self wantsInstalledPhotosAppActions];
}

- (BOOL)oneUpPresentationHelperPreventHideAssetAction:(id)a3
{
  return ![(CAMCameraRollController *)self wantsInstalledPhotosAppActions];
}

- (BOOL)oneUpPresentationHelperPreventPeopleOrnament:(id)a3
{
  return ![(CAMCameraRollController *)self wantsInstalledPhotosAppActions];
}

- (BOOL)oneUpPresentationHelperPreventAlbumAttributionWidget:(id)a3
{
  return ![(CAMCameraRollController *)self wantsInstalledPhotosAppActions];
}

- (CGRect)oneUpPresentationHelper:(id)a3 rectForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5 contentsRect:(CGRect *)a6
{
  if (self->_presentationDelegateFlags.respondsToSourceAssetRect)
  {
    id v7 = [(CAMCameraRollController *)self presentationDelegate];
    [v7 cameraRollControllerSourceAssetRect:self];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x263F001A0];
    double v11 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4
{
  if (self->_presentationDelegateFlags.respondsToShouldHideSourceAsset)
  {
    BOOL v5 = objc_msgSend(a4, "count", a3) != 0;
    id v6 = [(CAMCameraRollController *)self presentationDelegate];
    [v6 cameraRollController:self shouldHideSourceAsset:v5];
  }
}

- (int64_t)oneUpPresentationHelperPreferredPresentationOrientation:(id)a3
{
  if (!self->_presentationDelegateFlags.respondsToPreferredPresentationOrientation) {
    return 1;
  }
  uint64_t v4 = [(CAMCameraRollController *)self presentationDelegate];
  int64_t v5 = [v4 cameraRollControllerPreferredPresentationOrientation:self];

  return v5;
}

- (void)setExternalStorage:(id)a3
{
  if (self->_externalStorage != a3)
  {
    self->_externalStorage = (CAMExternalStorage *)a3;
    [(CAMCameraRollController *)self _setStagedDataSource:0];
    [(CAMCameraRollController *)self _setPhotosDataSource:0];
    [(CAMCameraRollController *)self _invalidateTransientAssets];
    id v5 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
    if ([v5 state])
    {
      uint64_t v4 = [(CAMCameraRollController *)self _outgoingOneUpPresentationHelpers];
      [v4 addObject:v5];
    }
    [(CAMCameraRollController *)self set_oneUpPresentationHelper:0];
    [(CAMCameraRollController *)self _setExternalStorageBrowsingSession:0];
    [(CAMCameraRollController *)self set_photoKitDataSourceManager:0];
    [(CAMCameraRollController *)self _setAllowUpdating:1];
    [(CAMCameraRollController *)self set_externalStorageBrowsingSessionLastThumbnailImage:0];
    [(CAMCameraRollController *)self _updateAnimated:1];
    [(CAMCameraRollController *)self _setObserveCameraPreviewWellChanges:[(CAMCameraRollController *)self _outputToExternalStorage] ^ 1];
  }
}

- (BOOL)_outputToExternalStorage
{
  id v2 = [(CAMCameraRollController *)self externalStorage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)currentAssetIndexFromEnd
{
  id v2 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  BOOL v3 = [v2 browsingSession];

  uint64_t v4 = [v3 viewModel];
  id v5 = [v4 currentAssetReference];
  id v6 = [v5 indexPath];

  id v7 = [v4 assetsDataSource];
  double v8 = [v7 lastItemIndexPath];

  unint64_t v9 = 0;
  if (v8 && v6)
  {
    uint64_t v10 = [v8 row];
    unint64_t v9 = v10 - [v6 row];
  }

  return v9;
}

- (void)setCurrentAssetIndexFromEnd:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(CAMCameraRollController *)self _oneUpPresentationHelper];
  id v5 = [v4 browsingSession];

  id v6 = [v5 viewModel];
  id v7 = [v6 assetsDataSource];
  double v8 = [v7 lastItemIndexPath];

  unint64_t v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v8, "row") - a3, objc_msgSend(v8, "section"));
  if ([v9 row] <= 0)
  {
    double v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v17 = [v9 row];
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring setCurrentAssetIndexFromEnd row=%ld, indexFromEnd=%ld", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = [v6 assetsDataSource];
    double v11 = [v10 assetReferenceAtIndexPath:v9];

    if (v11)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      _DWORD v13[2] = __55__CAMCameraRollController_setCurrentAssetIndexFromEnd___block_invoke;
      v13[3] = &unk_263FA0408;
      double v14 = v6;
      double v15 = v11;
      [v14 performChanges:v13];

      double v12 = v14;
    }
    else
    {
      double v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(CAMCameraRollController *)v9 setCurrentAssetIndexFromEnd:v12];
      }
    }
  }
}

uint64_t __55__CAMCameraRollController_setCurrentAssetIndexFromEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40)];
}

- (void)_setPreviewGestureRecognizer:(id)a3
{
}

- (CAMExternalStorage)externalStorage
{
  return self->_externalStorage;
}

- (PUOneUpViewController)oneUpViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oneUpViewController);
  return (PUOneUpViewController *)WeakRetained;
}

- (void)set_oneUpPresentationHelper:(id)a3
{
}

- (NSMutableSet)_outgoingOneUpPresentationHelpers
{
  return self->__outgoingOneUpPresentationHelpers;
}

- (void)set_photoKitDataSourceManager:(id)a3
{
}

- (void)_setUpdateIsScheduled:(BOOL)a3
{
  self->__updateIsScheduled = a3;
}

- (void)_setDeferringStagedMediaLoading:(BOOL)a3
{
  self->__deferringStagedMediaLoading = a3;
}

- (BOOL)_preheatQueue_shouldSkipPhotosFrameworkPreheat
{
  return self->__preheatQueue_shouldSkipPhotosFrameworkPreheat;
}

- (void)_setPreheatQueue_shouldSkipPhotosFrameworkPreheat:(BOOL)a3
{
  self->__preheatQueue_shouldSkipPhotosFrameworkPreheat = a3;
}

- (BOOL)_observeCameraPreviewWellChanges
{
  return self->__observeCameraPreviewWellChanges;
}

- (PUBrowsingSession)_externalStorageBrowsingSession
{
  return self->__externalStorageBrowsingSession;
}

- (int64_t)_externalStorageBrowsingSessionThumbnailRequest
{
  return self->__externalStorageBrowsingSessionThumbnailRequest;
}

- (void)set_externalStorageBrowsingSessionThumbnailRequest:(int64_t)a3
{
  self->__externalStorageBrowsingSessionThumbnailRequest = a3;
}

- (UIImage)_externalStorageBrowsingSessionLastThumbnailImage
{
  return self->__externalStorageBrowsingSessionLastThumbnailImage;
}

- (void)set_externalStorageBrowsingSessionLastThumbnailImage:(id)a3
{
}

- (PXUndoActionsInvalidator)_undoActionsInvalidator
{
  return self->__undoActionsInvalidator;
}

- (BOOL)_preparingUndoActionsInvalidator
{
  return self->__preparingUndoActionsInvalidator;
}

- (void)set_preparingUndoActionsInvalidator:(BOOL)a3
{
  self->__preparingUndoActionsInvalidator = a3;
}

- (int64_t)photosAppInstallationState
{
  return self->_photosAppInstallationState;
}

- (void)setPhotosAppInstallationState:(int64_t)a3
{
  self->_photosAppInstallationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__undoActionsInvalidator, 0);
  objc_storeStrong((id *)&self->__externalStorageBrowsingSessionLastThumbnailImage, 0);
  objc_storeStrong((id *)&self->__externalStorageBrowsingSession, 0);
  objc_storeStrong((id *)&self->__photosFrameworksPreheatQueue, 0);
  objc_storeStrong((id *)&self->__stagedDataSource, 0);
  objc_storeStrong((id *)&self->__photosDataSource, 0);
  objc_storeStrong((id *)&self->__HDRUUIDToIgnoredEV0UUIDs, 0);
  objc_storeStrong((id *)&self->__ignoredEV0UUIDs, 0);
  objc_storeStrong((id *)&self->__sessionAssetUUIDs, 0);
  objc_storeStrong((id *)&self->__photoKitDataSourceManager, 0);
  objc_storeStrong((id *)&self->__transientImageManager, 0);
  objc_storeStrong((id *)&self->__transientDataSource, 0);
  objc_storeStrong((id *)&self->__outgoingOneUpPresentationHelpers, 0);
  objc_storeStrong((id *)&self->__oneUpPresentationHelper, 0);
  objc_destroyWeak((id *)&self->_oneUpViewController);
  objc_storeStrong((id *)&self->_previewGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_imageWellDelegate);
  objc_destroyWeak((id *)&self->_sessionDelegate);
}

- (void)willPersistAssetWithUUID:(os_log_t)log captureSession:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Rejecting persist notification from asset %{public}@ because it does not belong in this session %d", (uint8_t *)&v3, 0x12u);
}

- (void)didPersistAssetWithUUID:(uint64_t)a1 captureSession:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  [a2 sessionIdentifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_2099F8000, v2, v3, "Rejecting persist notification from asset %{public}@ because it does not belong in this session %d", v4, v5, v6, v7, v8);
}

- (void)processTransientAssetUpdate:(uint64_t)a1 preventingInsertion:(void *)a2 persistenceOptions:.cold.1(uint64_t a1, void *a2)
{
  [a2 sessionIdentifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_2099F8000, v2, v3, "Rejecting update from asset %{public}@ because it does not belong in this session %d", v4, v5, v6, v7, v8);
}

void __54__CAMCameraRollController_photosDataSource_didChange___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Expected burst identifier for asset fetched with burst identifer", buf, 2u);
}

- (void)setCurrentAssetIndexFromEnd:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 134218240;
  uint64_t v6 = [a1 row];
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "Cannot find asset reference for row=%ld, indexFromEnd=%ld", (uint8_t *)&v5, 0x16u);
}

@end