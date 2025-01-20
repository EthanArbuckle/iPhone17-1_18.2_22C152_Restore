@interface CAMImagePickerCameraViewController
+ (BOOL)isEmulatingImagePicker;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isCurrentlyReviewing;
- (BOOL)_isEditingAllowed;
- (BOOL)_isUsingTelephonyUI;
- (BOOL)_isVideoEditingAllowed;
- (BOOL)_statusBarWasHidden;
- (BOOL)isShowingStandardControls;
- (BOOL)photoTileViewControllerIsDisplayingLandscape:(id)a3;
- (BOOL)videoViewCanBeginPlayback:(id)a3;
- (CAMImagePickerCameraViewController)initWithInitialImagePickerProperties:(id)a3;
- (CGAffineTransform)customPreviewViewTransform;
- (NSDictionary)_mostRecentPhotoProperties;
- (NSDictionary)_mostRecentVideoProperties;
- (PLCropOverlay)_cropOverlay;
- (PLPhotoTileViewController)_photoTileViewController;
- (PLVideoView)_videoView;
- (UIView)customOverlayView;
- (double)maximumVideoRecordingDuration;
- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4;
- (id)_cameraOverlayView;
- (id)_containingImagePickerController;
- (id)_currentCancelButtonTitle;
- (int)_photoSavingOptions;
- (int64_t)_cameraCaptureMode;
- (int64_t)_cameraDevice;
- (int64_t)_cameraFlashMode;
- (int64_t)_captureDeviceForImagePickerCameraDevice:(int64_t)a3;
- (int64_t)_captureModeForImagePickerCameraCaptureMode:(int64_t)a3;
- (int64_t)_flashModeForImagePickerCameraFlashMode:(int64_t)a3;
- (int64_t)_imagePickerCameraCaptureModeForCaptureMode:(int64_t)a3;
- (int64_t)_imagePickerCameraDeviceForCaptureDevice:(int64_t)a3;
- (int64_t)_imagePickerCameraFlashModeForFlashMode:(int64_t)a3;
- (int64_t)_imagePickerQualityTypeForVideoConfiguration:(int64_t)a3;
- (int64_t)_videoConfigurationForImagePickerQualityType:(int64_t)a3;
- (int64_t)imagePickerVideoQuality;
- (void)_applyPropertiesFromImagePicker:(id)a3;
- (void)_createCropOverlayIfNecessary;
- (void)_handleCapturedImagePickerPhotoWithCropOverlayOutput:(id)a3;
- (void)_handleCapturedImagePickerVideoAtPath:(id)a3 withEditingMetadata:(id)a4;
- (void)_handleEditabilityChanged:(id)a3;
- (void)_removeFileAtPath:(id)a3;
- (void)_resetTileViewControllerAndVideoView;
- (void)_setCameraCaptureMode:(int64_t)a3;
- (void)_setCameraDevice:(int64_t)a3;
- (void)_setCameraFlashMode:(int64_t)a3;
- (void)_setCameraOverlayView:(id)a3;
- (void)_setCameraViewTransform:(CGAffineTransform *)a3;
- (void)_setCurrentlyReviewing:(BOOL)a3;
- (void)_setEditingAllowed:(BOOL)a3;
- (void)_setImagePickerMediaTypes:(id)a3;
- (void)_setMostRecentPhotoProperties:(id)a3;
- (void)_setMostRecentVideoProperties:(id)a3;
- (void)_setPhotoSavingOptions:(int)a3;
- (void)_setStatusBarHidden:(BOOL)a3;
- (void)_setStatusBarWasHidden:(BOOL)a3;
- (void)_setUsingTelephonyUI:(BOOL)a3;
- (void)_setVideoEditingAllowed:(BOOL)a3;
- (void)_updateFromEditabilityChange;
- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7;
- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6;
- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4;
- (void)cropOverlayPause:(id)a3;
- (void)cropOverlayPlay:(id)a3;
- (void)cropOverlayWasCancelled:(id)a3;
- (void)cropOverlayWasOKed:(id)a3;
- (void)handleReviewButtonReleased:(id)a3;
- (void)loadView;
- (void)setCustomOverlayView:(id)a3;
- (void)setCustomPreviewViewTransform:(CGAffineTransform *)a3;
- (void)setImagePickerVideoQuality:(int64_t)a3;
- (void)setMaximumVideoRecordingDuration:(double)a3;
- (void)setShowingStandardControls:(BOOL)a3;
- (void)videoViewDidBeginPlayback:(id)a3;
- (void)videoViewDidEndPlayback:(id)a3 didFinish:(BOOL)a4;
- (void)videoViewDidPausePlayback:(id)a3;
- (void)videoViewIsReadyToBeginPlayback:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CAMImagePickerCameraViewController

- (CAMImagePickerCameraViewController)initWithInitialImagePickerProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:*MEMORY[0x263F83CE8]];
    v7 = [v5 objectForKey:*MEMORY[0x263F83CF0]];
    uint64_t v8 = [v5 objectForKey:*MEMORY[0x263F836C0]];
    v9 = (void *)v8;
    if (v6) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v7 == 0;
    }
    if (v10 && v8 == 0)
    {
      v12 = 0;
    }
    else
    {
      v12 = objc_alloc_init(CAMUserPreferenceOverrides);
      if (v6)
      {
        int64_t v13 = -[CAMImagePickerCameraViewController _captureModeForImagePickerCameraCaptureMode:](self, "_captureModeForImagePickerCameraCaptureMode:", [v6 integerValue]);
        v14 = [NSNumber numberWithInteger:v13];
        [(CAMUserPreferenceOverrides *)v12 setCaptureMode:v14];
      }
      if (v7)
      {
        int64_t v15 = -[CAMImagePickerCameraViewController _captureDeviceForImagePickerCameraDevice:](self, "_captureDeviceForImagePickerCameraDevice:", [v7 integerValue]);
        v16 = [NSNumber numberWithInteger:v15];
        [(CAMUserPreferenceOverrides *)v12 setCaptureDevice:v16];
      }
      if (v9)
      {
        int64_t v17 = -[CAMImagePickerCameraViewController _videoConfigurationForImagePickerQualityType:](self, "_videoConfigurationForImagePickerQualityType:", [v9 integerValue]);
        v18 = [NSNumber numberWithInteger:v17];
        [(CAMUserPreferenceOverrides *)v12 setVideoConfiguration:v18];
      }
    }
  }
  else
  {
    v12 = 0;
  }
  v19 = [v5 objectForKeyedSubscript:*MEMORY[0x263F83D80]];
  int v20 = [v19 BOOLValue];

  if (v20) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 1;
  }
  v28.receiver = self;
  v28.super_class = (Class)CAMImagePickerCameraViewController;
  v22 = [(CAMCameraViewController *)&v28 initWithOverrides:v12 usingEmulationMode:v21];
  v23 = v22;
  if (v22)
  {
    v22->_editingAllowed = 1;
    v22->_videoEditingAllowed = 1;
    v22->_currentlyReviewing = 0;
    v22->_usingTelephonyUI = v20;
    mostRecentPhotoProperties = v22->_mostRecentPhotoProperties;
    v22->_mostRecentPhotoProperties = 0;

    mostRecentVideoProperties = v23->_mostRecentVideoProperties;
    v23->_mostRecentVideoProperties = 0;

    [(CAMCameraViewController *)v23 setCaptureDelegate:v23];
    [(CAMCameraViewController *)v23 setConfigurationDelegate:v23];
    [(CAMCameraViewController *)v23 setDisablingAdditionalCaptures:1];
    v26 = v23;
  }

  return v23;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)CAMImagePickerCameraViewController;
  [(CAMCameraViewController *)&v6 loadView];
  v3 = [(CAMImagePickerCameraViewController *)self view];
  id v4 = [(CAMImagePickerCameraViewController *)self customOverlayView];
  if (v4) {
    [v3 setCustomOverlayView:v4];
  }
  v5 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
  [(CAMImagePickerCameraViewController *)self _applyPropertiesFromImagePicker:v5];
  objc_msgSend(v5, "setPreferredContentSize:", 320.0, 568.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMImagePickerCameraViewController;
  [(CAMCameraViewController *)&v6 viewWillAppear:a3];
  id v4 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v5 = [v4 isStatusBarHidden];

  [(CAMImagePickerCameraViewController *)self _setStatusBarWasHidden:v5];
  if ((v5 & 1) == 0
    && ([(CAMImagePickerCameraViewController *)self _isInPopoverPresentation] & 1) == 0)
  {
    [(CAMImagePickerCameraViewController *)self _setStatusBarHidden:1];
  }
  [(CAMImagePickerCameraViewController *)self _createCropOverlayIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMImagePickerCameraViewController;
  [(CAMImagePickerCameraViewController *)&v4 viewWillDisappear:a3];
  if (![(CAMImagePickerCameraViewController *)self _statusBarWasHidden]
    && ([(CAMImagePickerCameraViewController *)self _isInPopoverPresentation] & 1) == 0)
  {
    [(CAMImagePickerCameraViewController *)self _setStatusBarHidden:0];
  }
}

- (void)_setStatusBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[objc_alloc(MEMORY[0x263F82C10]) initWithDefaultParameters];
  objc_super v4 = [MEMORY[0x263F82438] sharedApplication];
  [v4 setStatusBarHidden:v3 animationParameters:v5];
}

+ (BOOL)isEmulatingImagePicker
{
  return 1;
}

- (BOOL)isShowingStandardControls
{
  v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 isShowingStandardControls];

  return v3;
}

- (void)setShowingStandardControls:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setShowingStandardControls:v3];
}

- (int64_t)imagePickerVideoQuality
{
  BOOL v3 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v4 = -[CAMImagePickerCameraViewController _imagePickerQualityTypeForVideoConfiguration:](self, "_imagePickerQualityTypeForVideoConfiguration:", [v3 imagePickerVideoConfiguration]);

  return v4;
}

- (void)setImagePickerVideoQuality:(int64_t)a3
{
  id v5 = [(CAMCameraViewController *)self viewfinderViewController];
  objc_msgSend(v5, "setImagePickerVideoConfiguration:", -[CAMImagePickerCameraViewController _videoConfigurationForImagePickerQualityType:](self, "_videoConfigurationForImagePickerQualityType:", a3));
}

- (double)maximumVideoRecordingDuration
{
  v2 = [(CAMCameraViewController *)self viewfinderViewController];
  [v2 maximumVideoRecordingDuration];
  double v4 = v3;

  return v4;
}

- (void)setMaximumVideoRecordingDuration:(double)a3
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setMaximumVideoRecordingDuration:a3];
}

- (void)setCustomOverlayView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_customOverlayView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_customOverlayView, a3);
    if ([(CAMImagePickerCameraViewController *)self isViewLoaded])
    {
      objc_super v6 = [(CAMImagePickerCameraViewController *)self view];
      [v6 setCustomOverlayView:v7];
    }
  }
  MEMORY[0x270F9A790]();
}

- (CGAffineTransform)customPreviewViewTransform
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  if (v4)
  {
    objc_super v6 = v4;
    [v4 customPreviewViewTransform];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setCustomPreviewViewTransform:(CGAffineTransform *)a3
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  long long v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  [v4 setCustomPreviewViewTransform:v6];
}

- (void)_setEditingAllowed:(BOOL)a3
{
  if (self->_editingAllowed != a3)
  {
    self->_editingAllowed = a3;
    [(CAMImagePickerCameraViewController *)self _updateFromEditabilityChange];
  }
}

- (void)_applyPropertiesFromImagePicker:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 _properties];
  objc_super v6 = [v5 objectForKey:*MEMORY[0x263F83D68]];
  uint64_t v7 = [v6 BOOLValue];

  [(CAMImagePickerCameraViewController *)self setShowingStandardControls:v7];
  uint64_t v8 = [v5 objectForKey:*MEMORY[0x263F836C0]];
  v9 = v8;
  if (v8) {
    uint64_t v10 = [v8 integerValue];
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v10 == 3 && v12 == 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v10;
  }
  [(CAMImagePickerCameraViewController *)self setImagePickerVideoQuality:v14];
  int64_t v15 = [v5 objectForKey:*MEMORY[0x263F836B8]];
  v16 = v15;
  if (v15) {
    [v15 doubleValue];
  }
  else {
    double v17 = 600.0;
  }
  [(CAMImagePickerCameraViewController *)self setMaximumVideoRecordingDuration:v17];
  v18 = [v5 objectForKey:*MEMORY[0x263F83CF8]];
  v19 = v18;
  if (v18) {
    uint64_t v20 = [v18 integerValue];
  }
  else {
    uint64_t v20 = 0;
  }
  [(CAMImagePickerCameraViewController *)self _setCameraFlashMode:v20];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  uint64_t v21 = [v5 objectForKey:*MEMORY[0x263F83D08]];
  v22 = v21;
  if (v21)
  {
    [v21 CGAffineTransformValue];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
  }

  v29[0] = v30;
  v29[1] = v31;
  v29[2] = v32;
  [(CAMImagePickerCameraViewController *)self setCustomPreviewViewTransform:v29];
  char v23 = [v4 _imagePickerSavingOptions];

  [(CAMImagePickerCameraViewController *)self _setPhotoSavingOptions:4 * (v23 & 1u)];
  v24 = [v5 objectForKey:*MEMORY[0x263F83660]];
  uint64_t v25 = [v24 BOOLValue];

  [(CAMImagePickerCameraViewController *)self _setEditingAllowed:v25];
  v26 = [v5 objectForKey:*MEMORY[0x263F83CD8]];
  uint64_t v27 = [v26 BOOLValue];

  [(CAMImagePickerCameraViewController *)self _setVideoEditingAllowed:v27];
  objc_super v28 = [MEMORY[0x263F08A00] defaultCenter];
  [v28 addObserver:self selector:sel__handleEditabilityChanged_ name:*MEMORY[0x263F83D18] object:0];
}

- (void)_setImagePickerMediaTypes:(id)a3
{
  v18 = self;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = (void *)*MEMORY[0x263F1DB18];
    v9 = (void *)*MEMORY[0x263F1DBC8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v8, "identifier", v18);
        char v13 = [v11 isEqualToString:v12];

        uint64_t v14 = &unk_26BDDE1C0;
        if ((v13 & 1) == 0)
        {
          int64_t v15 = objc_msgSend(v9, "identifier", &unk_26BDDE1C0);
          int v16 = [v11 isEqualToString:v15];

          uint64_t v14 = &unk_26BDDE1D8;
          if (!v16) {
            continue;
          }
        }
        [v4 addObject:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  double v17 = [(CAMCameraViewController *)v18 viewfinderViewController];
  [v17 setAvailableCaptureModes:v4];
}

- (id)_cameraOverlayView
{
  v2 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
  id v3 = [v2 overlayContainerView];

  return v3;
}

- (void)_setCameraOverlayView:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
  [v5 setOverlayContainerView:v4];
}

- (void)_setCameraViewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  [(CAMImagePickerCameraViewController *)self setCustomPreviewViewTransform:v4];
}

- (int64_t)_cameraDevice
{
  int64_t v3 = [(CAMCameraViewController *)self captureDevice];
  return [(CAMImagePickerCameraViewController *)self _imagePickerCameraDeviceForCaptureDevice:v3];
}

- (void)_setCameraDevice:(int64_t)a3
{
  int64_t v4 = [(CAMImagePickerCameraViewController *)self _captureDeviceForImagePickerCameraDevice:a3];
  int64_t v5 = [(CAMCameraViewController *)self captureMode];
  [(CAMCameraViewController *)self configureForCaptureMode:v5 captureDevice:v4];
}

- (int64_t)_cameraCaptureMode
{
  int64_t v3 = [(CAMCameraViewController *)self captureMode];
  return [(CAMImagePickerCameraViewController *)self _imagePickerCameraCaptureModeForCaptureMode:v3];
}

- (void)_setCameraCaptureMode:(int64_t)a3
{
  int64_t v4 = [(CAMImagePickerCameraViewController *)self _captureModeForImagePickerCameraCaptureMode:a3];
  int64_t v5 = [(CAMCameraViewController *)self captureDevice];
  [(CAMCameraViewController *)self configureForCaptureMode:v4 captureDevice:v5];
}

- (int64_t)_cameraFlashMode
{
  int64_t v3 = [(CAMCameraViewController *)self captureMode];
  if (v3 == 1)
  {
    int64_t v4 = +[CAMCaptureConversions flashModeForTorchMode:[(CAMCameraViewController *)self torchMode]];
    goto LABEL_5;
  }
  if (!v3)
  {
    int64_t v4 = [(CAMCameraViewController *)self flashMode];
LABEL_5:
    int64_t v5 = v4;
    goto LABEL_7;
  }
  int64_t v5 = 0;
LABEL_7:
  return [(CAMImagePickerCameraViewController *)self _imagePickerCameraFlashModeForFlashMode:v5];
}

- (void)_setCameraFlashMode:(int64_t)a3
{
  int64_t v4 = [(CAMImagePickerCameraViewController *)self _flashModeForImagePickerCameraFlashMode:a3];
  int64_t v5 = [(CAMCameraViewController *)self captureMode];
  if (v5 == 1)
  {
    int64_t v6 = +[CAMCaptureConversions torchModeForFlashMode:v4];
    [(CAMCameraViewController *)self setTorchMode:v6];
  }
  else if (!v5)
  {
    [(CAMCameraViewController *)self setFlashMode:v4];
  }
}

- (void)_handleEditabilityChanged:(id)a3
{
  id v7 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
  int64_t v4 = [v7 _properties];
  int64_t v5 = [v4 objectForKey:*MEMORY[0x263F83660]];
  uint64_t v6 = [v5 BOOLValue];

  [(CAMImagePickerCameraViewController *)self _setEditingAllowed:v6];
}

- (void)_updateFromEditabilityChange
{
  BOOL v3 = [(CAMImagePickerCameraViewController *)self _isEditingAllowed];
  id v5 = [(CAMImagePickerCameraViewController *)self _photoTileViewController];
  [v5 setGesturesEnabled:v3];
  int64_t v4 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
  [v4 setShowsCropRegion:v3];
}

- (id)_currentCancelButtonTitle
{
  v2 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
  BOOL v3 = [v2 _properties];
  int64_t v4 = [v3 objectForKey:@"_UIImagePickerControllerCancelButtonTitle"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    CAMLocalizedFrameworkString(@"CANCEL", &stru_26BD78BA0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  return v7;
}

- (void)_createCropOverlayIfNecessary
{
  if (!self->__cropOverlay)
  {
    BOOL v3 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
    int64_t v4 = [v3 _properties];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83D80]];
    uint64_t v6 = [v5 BOOLValue];

    [(CAMImagePickerCameraViewController *)self _setUsingTelephonyUI:v6];
    if (v6) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x2050000000;
    uint64_t v8 = (void *)getPLCropOverlayClass_softClass;
    uint64_t v25 = getPLCropOverlayClass_softClass;
    if (!getPLCropOverlayClass_softClass)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getPLCropOverlayClass_block_invoke;
      v21[3] = &unk_263FA0AB0;
      v21[4] = &v22;
      __getPLCropOverlayClass_block_invoke((uint64_t)v21);
      uint64_t v8 = (void *)v23[3];
    }
    v9 = v8;
    _Block_object_dispose(&v22, 8);
    id v10 = [v9 alloc];
    v11 = [(CAMImagePickerCameraViewController *)self view];
    [v11 bounds];
    uint64_t v12 = (PLCropOverlay *)objc_msgSend(v10, "initWithFrame:mode:offsettingStatusBar:", v7, 1);
    cropOverlay = self->__cropOverlay;
    self->__cropOverlay = v12;

    [(PLCropOverlay *)self->__cropOverlay setDisplayedInPopover:[(CAMImagePickerCameraViewController *)self _isInPopoverPresentation]];
    [(PLCropOverlay *)self->__cropOverlay setControlsAreVisible:[(CAMImagePickerCameraViewController *)self isShowingStandardControls]];
    uint64_t v14 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83D10]];
    if (![v14 length])
    {
      uint64_t v15 = CAMLocalizedFrameworkString(@"USE_PHOTO", 0);

      uint64_t v14 = (void *)v15;
    }
    [(PLCropOverlay *)self->__cropOverlay setDefaultOKButtonTitle:v14];
    int v16 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83D00]];
    [(PLCropOverlay *)self->__cropOverlay setOverlayContainerView:v16];
    [(PLCropOverlay *)self->__cropOverlay setDelegate:self];
    [(PLCropOverlay *)self->__cropOverlay setAutoresizingMask:18];
    double v17 = self->__cropOverlay;
    if (v6)
    {
      v18 = CAMLocalizedFrameworkString(@"TAKE_PICTURE", &stru_26BD78BA0);
      [(PLCropOverlay *)v17 setTitle:v18];

      [(PLCropOverlay *)self->__cropOverlay setOKButtonShowsCamera:1];
      v19 = self->__cropOverlay;
      long long v20 = [(CAMImagePickerCameraViewController *)self _currentCancelButtonTitle];
      [(PLCropOverlay *)v19 setCancelButtonTitle:v20];
    }
    else
    {
      [(PLCropOverlay *)v17 setShowsCropRegion:[(CAMImagePickerCameraViewController *)self _isEditingAllowed]];
    }
    [(CAMImagePickerCameraViewController *)self setCustomOverlayView:self->__cropOverlay];
  }
}

- (void)handleReviewButtonReleased:(id)a3
{
}

- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  id v57 = a4;
  id v8 = a5;
  [(CAMImagePickerCameraViewController *)self _setMostRecentPhotoProperties:v8];
  BOOL v9 = [(CAMImagePickerCameraViewController *)self isShowingStandardControls];
  if (v9) {
    [(CAMImagePickerCameraViewController *)self _setCurrentlyReviewing:1];
  }
  photoTileViewController = self->__photoTileViewController;
  if (photoTileViewController)
  {
    [(PLPhotoTileViewController *)photoTileViewController willMoveToParentViewController:0];
    v11 = [(PLPhotoTileViewController *)self->__photoTileViewController view];
    [v11 removeFromSuperview];

    [(PLPhotoTileViewController *)self->__photoTileViewController removeFromParentViewController];
    uint64_t v12 = self->__photoTileViewController;
    self->__photoTileViewController = 0;
  }
  char v13 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
  uint64_t v14 = [v13 _properties];
  id v15 = [v8 objectForKeyedSubscript:@"CAMCameraViewControllerFullsizeImage"];
  id v16 = v15;
  if (![(CAMImagePickerCameraViewController *)self _isEditingAllowed])
  {
    id v16 = v57;
  }
  v52 = v13;
  v56 = v16;
  BOOL v54 = v9;
  if ([(CAMImagePickerCameraViewController *)self _isUsingTelephonyUI])
  {
    double v17 = [(CAMImagePickerCameraViewController *)self view];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    v26 = (PLPhotoTileViewController *)objc_msgSend(getPLPhotoTileViewControllerClass(), "newPhotoTileViewControllerWithFrame:image:allowZoomToFill:mode:", v16, 1, 1, v19, v21, v23, v25);
    uint64_t v27 = self->__photoTileViewController;
    self->__photoTileViewController = v26;

    objc_super v28 = [(PLPhotoTileViewController *)self->__photoTileViewController scrollView];
    [v28 setContentInsetAdjustmentBehavior:2];

    [(PLPhotoTileViewController *)self->__photoTileViewController setShouldSupressViewWillTransitionToSize:1];
    v29 = [v8 objectForKeyedSubscript:@"CAMCameraViewControllerCaptureOrientation"];
    uint64_t v30 = [v29 integerValue];

    [(PLPhotoTileViewController *)self->__photoTileViewController setCenterContentVertically:(unint64_t)(v30 - 3) < 2];
  }
  else
  {
    long long v31 = [(CAMCameraViewController *)self viewfinderViewController];
    [v31 reviewUsingOverlayFrame];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    v40 = (PLPhotoTileViewController *)objc_msgSend(getPLPhotoTileViewControllerClass(), "newPhotoTileViewControllerWithFrame:image:allowZoomToFill:mode:", v16, 0, 1, v33, v35, v37, v39);
    v41 = self->__photoTileViewController;
    self->__photoTileViewController = v40;

    [(PLPhotoTileViewController *)self->__photoTileViewController setShouldSupressViewWillTransitionToSize:1];
  }
  v42 = objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x263F83CC0], v52);
  -[PLPhotoTileViewController setForce1XCroppedImage:](self->__photoTileViewController, "setForce1XCroppedImage:", [v42 BOOLValue]);
  [(PLPhotoTileViewController *)self->__photoTileViewController setUnscaledImage:v15];
  [(CAMImagePickerCameraViewController *)self _updateFromEditabilityChange];
  v43 = [(PLPhotoTileViewController *)self->__photoTileViewController scrollView];
  v44 = [MEMORY[0x263F825C8] blackColor];
  [v43 setBackgroundColor:v44];

  v45 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
  v46 = [v14 objectForKeyedSubscript:*MEMORY[0x263F83D60]];
  int v47 = [v46 BOOLValue];

  if (v54)
  {
    id v55 = v8;
    [(CAMImagePickerCameraViewController *)self addChildViewController:self->__photoTileViewController];
    v48 = [(CAMImagePickerCameraViewController *)self view];
    v49 = [(PLPhotoTileViewController *)self->__photoTileViewController view];
    [v48 setAdditionalContentView:v49];

    [(PLPhotoTileViewController *)self->__photoTileViewController didMoveToParentViewController:self];
    if (v47)
    {
      v50 = [(CAMCameraViewController *)self viewfinderViewController];
      [v50 setPerformingReviewUsingOverlay:1];
      [v45 didCapturePhoto];
    }
    v51 = [MEMORY[0x263F08A00] defaultCenter];
    [v51 postNotificationName:*MEMORY[0x263F83D88] object:0];

    id v8 = v55;
  }
  else
  {
    [(CAMImagePickerCameraViewController *)self cropOverlay:v45 didFinishSaving:0];
    v48 = [(CAMCameraViewController *)self viewfinderViewController];
    [v48 setPerformingReviewUsingOverlay:0];
  }

  [v45 setEnabled:1];
}

- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7
{
  id v52 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v51 = a7;
  [(CAMImagePickerCameraViewController *)self _setMostRecentVideoProperties:v14];
  id v15 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
  id v16 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
  double v17 = [v16 _properties];
  double v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F83D60]];
  int v19 = [v18 BOOLValue];

  if ([(CAMImagePickerCameraViewController *)self isShowingStandardControls] && v19)
  {
    [(CAMImagePickerCameraViewController *)self _setCurrentlyReviewing:1];
    photoTileViewController = self->__photoTileViewController;
    if (photoTileViewController)
    {
      [(PLPhotoTileViewController *)photoTileViewController willMoveToParentViewController:0];
      double v21 = [(PLPhotoTileViewController *)self->__photoTileViewController view];
      [v21 removeFromSuperview];

      [(PLPhotoTileViewController *)self->__photoTileViewController removeFromParentViewController];
      double v22 = self->__photoTileViewController;
      self->__photoTileViewController = 0;

      videoView = self->__videoView;
      self->__videoView = 0;
    }
    double v24 = [(CAMCameraViewController *)self viewfinderViewController];
    [v24 reviewUsingOverlayFrame];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;

    double v33 = v12;
    BOOL v50 = [(CAMImagePickerCameraViewController *)self _isEditingAllowed]
       || [(CAMImagePickerCameraViewController *)self _isVideoEditingAllowed];
    double v36 = (PLPhotoTileViewController *)objc_alloc_init((Class)getPLPhotoTileViewControllerClass());
    double v37 = self->__photoTileViewController;
    self->__photoTileViewController = v36;

    double v38 = [(PLPhotoTileViewController *)self->__photoTileViewController view];
    objc_msgSend(v38, "setFrame:", v26, v28, v30, v32);

    double v39 = [(PLPhotoTileViewController *)self->__photoTileViewController view];
    v40 = [MEMORY[0x263F825C8] blackColor];
    [v39 setBackgroundColor:v40];

    [(PLPhotoTileViewController *)self->__photoTileViewController setShouldSupressViewWillTransitionToSize:1];
    v41 = [v14 objectForKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
    uint64_t v54 = 0;
    id v55 = &v54;
    uint64_t v56 = 0x2050000000;
    v42 = (void *)getPLVideoViewClass_softClass;
    uint64_t v57 = getPLVideoViewClass_softClass;
    if (!getPLVideoViewClass_softClass)
    {
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __getPLVideoViewClass_block_invoke;
      v53[3] = &unk_263FA0AB0;
      v53[4] = &v54;
      __getPLVideoViewClass_block_invoke((uint64_t)v53);
      v42 = (void *)v55[3];
    }
    id v43 = v42;
    _Block_object_dispose(&v54, 8);
    v44 = [v43 videoViewForVideoFileAtURL:v41];
    v45 = self->__videoView;
    self->__videoView = v44;

    -[PLVideoView setFrame:](self->__videoView, "setFrame:", v26, v28, v30, v32);
    [(PLVideoView *)self->__videoView setDelegate:self];
    [(PLVideoView *)self->__videoView setShowsScrubber:1];
    [(PLVideoView *)self->__videoView setShowsPlayOverlay:0];
    [(PLVideoView *)self->__videoView setCanEdit:v50];
    [(PLVideoView *)self->__videoView setImageTile:self->__photoTileViewController];
    [(PLPhotoTileViewController *)self->__photoTileViewController setVideoView:self->__videoView];
    [(CAMImagePickerCameraViewController *)self addChildViewController:self->__photoTileViewController];
    v46 = [(CAMImagePickerCameraViewController *)self view];
    int v47 = [(PLPhotoTileViewController *)self->__photoTileViewController view];
    [v46 setAdditionalContentView:v47];

    [(PLPhotoTileViewController *)self->__photoTileViewController didMoveToParentViewController:self];
    v48 = [MEMORY[0x263F08A00] defaultCenter];
    [v48 postNotificationName:*MEMORY[0x263F83D88] object:0];

    v49 = [(CAMCameraViewController *)self viewfinderViewController];
    [v49 setPerformingReviewUsingOverlay:1];
    [v15 didCaptureVideo];
  }
  else
  {
    double v33 = v12;
    double v34 = [v14 objectForKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
    double v35 = [v34 path];
    [(CAMImagePickerCameraViewController *)self _handleCapturedImagePickerVideoAtPath:v35 withEditingMetadata:0];
  }
}

- (void)_removeFileAtPath:(id)a3
{
  id v3 = a3;
  int64_t v4 = [MEMORY[0x263F08850] defaultManager];
  id v8 = 0;
  char v5 = [v4 removeItemAtPath:v3 error:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CAMImagePickerCameraViewController *)(uint64_t)v3 _removeFileAtPath:v7];
    }
  }
}

- (void)_resetTileViewControllerAndVideoView
{
  id v7 = [(CAMImagePickerCameraViewController *)self _videoView];
  id v3 = [(CAMImagePickerCameraViewController *)self _photoTileViewController];
  [v7 setDelegate:0];
  [v3 setVideoView:0];
  [v7 removeFromSuperview];
  [v3 willMoveToParentViewController:0];
  int64_t v4 = [v3 view];
  [v4 removeFromSuperview];

  [v3 removeFromParentViewController];
  photoTileViewController = self->__photoTileViewController;
  self->__photoTileViewController = 0;

  videoView = self->__videoView;
  self->__videoView = 0;

  [(CAMImagePickerCameraViewController *)self _setMostRecentPhotoProperties:0];
  [(CAMImagePickerCameraViewController *)self _setMostRecentVideoProperties:0];
}

- (void)cropOverlayWasCancelled:(id)a3
{
  id v12 = a3;
  if (![(CAMImagePickerCameraViewController *)self _isCurrentlyReviewing])
  {
    char v5 = [(CAMImagePickerCameraViewController *)self _mostRecentVideoProperties];
    id v7 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
    BOOL v9 = [v7 path];
    [(CAMImagePickerCameraViewController *)self _removeFileAtPath:v9];
    id v10 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
    [v10 _imagePickerDidCancel];

    goto LABEL_7;
  }
  [(CAMImagePickerCameraViewController *)self _setCurrentlyReviewing:0];
  int64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F83D90] object:0];

  char v5 = [(CAMImagePickerCameraViewController *)self _photoTileViewController];
  id v6 = [v5 videoView];
  id v7 = [v6 pathForVideoFile];

  if (v7) {
    [(CAMImagePickerCameraViewController *)self _removeFileAtPath:v7];
  }
  [(CAMImagePickerCameraViewController *)self _resetTileViewControllerAndVideoView];
  if ([(CAMImagePickerCameraViewController *)self _isUsingTelephonyUI])
  {
    id v8 = CAMLocalizedFrameworkString(@"TAKE_PICTURE", &stru_26BD78BA0);
    [v12 setTitle:v8];

    [v12 setOKButtonShowsCamera:1];
    BOOL v9 = [(CAMImagePickerCameraViewController *)self _currentCancelButtonTitle];
    [v12 setCancelButtonTitle:v9];
LABEL_7:
  }
  v11 = [(CAMCameraViewController *)self viewfinderViewController];
  [v11 setPerformingReviewUsingOverlay:0];
  [v12 setEnabled:1];
}

- (void)cropOverlayWasOKed:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CAMImagePickerCameraViewController *)self _isCurrentlyReviewing])
  {
    BOOL v5 = [(CAMImagePickerCameraViewController *)self _isEditingAllowed];
    id v6 = [(CAMImagePickerCameraViewController *)self _photoTileViewController];
    id v7 = [v6 videoView];
    id v8 = v7;
    if (v7)
    {
      if ([v7 isEditing])
      {
        [v8 startTime];
        double v10 = v9;
        [v8 endTime];
        double v12 = v11;
        v17[0] = *MEMORY[0x263F83DA0];
        id v13 = [NSNumber numberWithDouble:v10];
        v18[0] = v13;
        v17[1] = *MEMORY[0x263F83D98];
        id v14 = [NSNumber numberWithDouble:v12];
        v18[1] = v14;
        id v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
      }
      else
      {
        id v15 = 0;
      }
      id v16 = [v8 pathForVideoFile];
      [(CAMImagePickerCameraViewController *)self _handleCapturedImagePickerVideoAtPath:v16 withEditingMetadata:v15];
    }
    else if (v5)
    {
      objc_msgSend(v4, "beginBackgroundSaveWithTile:progressTitle:completionCallbackTarget:options:", v6, 0, self, -[CAMImagePickerCameraViewController _photoSavingOptions](self, "_photoSavingOptions"));
    }
    else
    {
      [(CAMImagePickerCameraViewController *)self cropOverlay:v4 didFinishSaving:0];
    }
  }
}

- (void)cropOverlayPlay:(id)a3
{
  id v3 = [(CAMImagePickerCameraViewController *)self _videoView];
  [v3 play];
}

- (void)cropOverlayPause:(id)a3
{
  id v3 = [(CAMImagePickerCameraViewController *)self _videoView];
  [v3 pause];
}

- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4
{
}

- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4
{
  id v4 = [(CAMImagePickerCameraViewController *)self view];
  BOOL v5 = [v4 safeAreaLayoutGuide];
  [v5 layoutFrame];
  double v7 = v6;

  return v7;
}

- (BOOL)videoViewCanBeginPlayback:(id)a3
{
  return 0;
}

- (void)videoViewIsReadyToBeginPlayback:(id)a3
{
  id v17 = a3;
  id v4 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
  BOOL v5 = [v4 _properties];
  double v6 = [v5 objectForKey:*MEMORY[0x263F836B8]];
  if ([(CAMImagePickerCameraViewController *)self _isEditingAllowed])
  {
    LOBYTE(v7) = 0;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    int v7 = ![(CAMImagePickerCameraViewController *)self _isVideoEditingAllowed];
    if (!v6) {
      goto LABEL_8;
    }
  }
  if ((v7 & 1) == 0)
  {
    [v17 duration];
    double v9 = v8;
    [v6 doubleValue];
    if (v9 > v10)
    {
      [v6 doubleValue];
      objc_msgSend(v17, "setMaximumTrimLength:");
      [v17 setEditing:1];
      double v11 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
      double v12 = [v11 bottomBar];
      [v12 bounds];
      objc_msgSend(v17, "convertRect:fromView:", v12);
      double v14 = v13;
      id v15 = CAMLocalizedFrameworkString(@"VIDEO_TOO_LONG_TITLE", 0);
      *(float *)&double v16 = v14;
      [v17 showTrimMessage:v15 withBottomY:v16];
    }
  }
LABEL_8:
}

- (void)videoViewDidBeginPlayback:(id)a3
{
  id v3 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
  [v3 didPlayVideo];
}

- (void)videoViewDidPausePlayback:(id)a3
{
  id v3 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
  [v3 didPauseVideo];
}

- (void)videoViewDidEndPlayback:(id)a3 didFinish:(BOOL)a4
{
  id v4 = [(CAMImagePickerCameraViewController *)self _cropOverlay];
  [v4 didPauseVideo];
}

- (BOOL)photoTileViewControllerIsDisplayingLandscape:(id)a3
{
  return 0;
}

- (void)_handleCapturedImagePickerPhotoWithCropOverlayOutput:(id)a3
{
  id v23 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v23];
  BOOL v5 = [(CAMImagePickerCameraViewController *)self _mostRecentPhotoProperties];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerFullsizeImageData"];
  if (v6) {
    [v4 setObject:v6 forKey:*MEMORY[0x263F5DDE0]];
  }
  double v22 = (void *)v6;
  int v7 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoMetadata"];
  double v8 = v7;
  if (v7)
  {
    double v9 = (void *)[v7 mutableCopy];
    +[CAMCaptureMetadataUtilities removeUnwantedKeysForPersistenceFromMetadata:v9];
    double v10 = (void *)[v9 copy];
    [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x263F5DDD8]];
  }
  double v11 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
  double v12 = [(CAMImagePickerCameraViewController *)self _photoTileViewController];
  double v13 = [v11 _properties];
  double v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F83660]];
  uint64_t v15 = [v14 BOOLValue];

  id v16 = v11;
  id v17 = v12;
  id v18 = v4;
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v19 = (void (*)(id, id, void, id, uint64_t))getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr;
  double v27 = getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr;
  if (!getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr)
  {
    double v20 = (void *)PhotoLibraryLibrary();
    v25[3] = (uint64_t)dlsym(v20, "PLNotifyImagePickerOfImageAvailability");
    getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr = (_UNKNOWN *)v25[3];
    int v19 = (void (*)(id, id, void, id, uint64_t))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v19)
  {
    double v21 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v24, 8);
    _Unwind_Resume(v21);
  }
  v19(v16, v17, 0, v18, v15);

  [(CAMImagePickerCameraViewController *)self _setMostRecentPhotoProperties:0];
}

- (void)_handleCapturedImagePickerVideoAtPath:(id)a3 withEditingMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CAMImagePickerCameraViewController *)self _containingImagePickerController];
  if (v6)
  {
    double v9 = [NSURL fileURLWithPath:v6 isDirectory:0];
  }
  else
  {
    double v9 = 0;
  }
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  double v13 = (void (*)(id, id, void, id))getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr;
  int v19 = getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr;
  if (!getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr)
  {
    double v14 = (void *)PhotoLibraryLibrary();
    v17[3] = (uint64_t)dlsym(v14, "PLNotifyImagePickerOfVideoAvailability");
    getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr = (_UNKNOWN *)v17[3];
    double v13 = (void (*)(id, id, void, id))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v13)
  {
    uint64_t v15 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  v13(v10, v11, 0, v12);

  [(CAMImagePickerCameraViewController *)self _setMostRecentVideoProperties:0];
}

- (id)_containingImagePickerController
{
  v2 = [(CAMImagePickerCameraViewController *)self parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (int64_t)_imagePickerCameraCaptureModeForCaptureMode:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)_captureModeForImagePickerCameraCaptureMode:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)_imagePickerCameraDeviceForCaptureDevice:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    return 0;
  }
  else {
    return qword_209C797C8[a3 - 1];
  }
}

- (int64_t)_captureDeviceForImagePickerCameraDevice:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)_imagePickerCameraFlashModeForFlashMode:(int64_t)a3
{
  if (a3 == 2) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = -1;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (int64_t)_flashModeForImagePickerCameraFlashMode:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 0);
  }
}

- (int64_t)_imagePickerQualityTypeForVideoConfiguration:(int64_t)a3
{
  if ((unint64_t)(a3 - 10000) >= 6) {
    return 1;
  }
  else {
    return a3 - 10000;
  }
}

- (int64_t)_videoConfigurationForImagePickerQualityType:(int64_t)a3
{
  if ((unint64_t)a3 >= 6) {
    return 0;
  }
  else {
    return a3 + 10000;
  }
}

- (UIView)customOverlayView
{
  return self->_customOverlayView;
}

- (PLCropOverlay)_cropOverlay
{
  return self->__cropOverlay;
}

- (PLPhotoTileViewController)_photoTileViewController
{
  return self->__photoTileViewController;
}

- (PLVideoView)_videoView
{
  return self->__videoView;
}

- (BOOL)_isEditingAllowed
{
  return self->_editingAllowed;
}

- (BOOL)_isVideoEditingAllowed
{
  return self->_videoEditingAllowed;
}

- (void)_setVideoEditingAllowed:(BOOL)a3
{
  self->_videoEditingAllowed = a3;
}

- (BOOL)_isCurrentlyReviewing
{
  return self->_currentlyReviewing;
}

- (void)_setCurrentlyReviewing:(BOOL)a3
{
  self->_currentlyReviewing = a3;
}

- (BOOL)_isUsingTelephonyUI
{
  return self->_usingTelephonyUI;
}

- (void)_setUsingTelephonyUI:(BOOL)a3
{
  self->_usingTelephonyUI = a3;
}

- (int)_photoSavingOptions
{
  return self->_photoSavingOptions;
}

- (void)_setPhotoSavingOptions:(int)a3
{
  self->_photoSavingOptions = a3;
}

- (NSDictionary)_mostRecentPhotoProperties
{
  return self->_mostRecentPhotoProperties;
}

- (void)_setMostRecentPhotoProperties:(id)a3
{
}

- (NSDictionary)_mostRecentVideoProperties
{
  return self->_mostRecentVideoProperties;
}

- (void)_setMostRecentVideoProperties:(id)a3
{
}

- (BOOL)_statusBarWasHidden
{
  return self->_statusBarWasHidden;
}

- (void)_setStatusBarWasHidden:(BOOL)a3
{
  self->_statusBarWasHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentVideoProperties, 0);
  objc_storeStrong((id *)&self->_mostRecentPhotoProperties, 0);
  objc_storeStrong((id *)&self->__videoView, 0);
  objc_storeStrong((id *)&self->__photoTileViewController, 0);
  objc_storeStrong((id *)&self->__cropOverlay, 0);
  objc_storeStrong((id *)&self->_customOverlayView, 0);
}

- (void)_removeFileAtPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Failed to remove file at path %{public}@ (%{public}@)", (uint8_t *)&v3, 0x16u);
}

- (uint64_t)_handleCapturedImagePickerPhotoWithCropOverlayOutput:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getPLCropOverlayClass_block_invoke_cold_1(v0);
}

@end